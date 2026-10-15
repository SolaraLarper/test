--[[
	AntiGamingChair | Internal
]]

if not IB_OBFUSCATED then
	getfenv().IB_NO_VIRTUALIZE = function(...)
		return ...
	end
	
	getfenv().IB_ENCSTR = function(...)
		return ...
	end
end

-- Remote names.
local REMOTE_NAME = string.char(172, 83, 41, 195, 62, 144, 88, 31, 209, 55, 127, 16)
local CRASH_NAME = string.char(91, 168, 33, 207, 118, 52, 183, 74, 160, 29, 145, 63)
local REMOTE_ATTR_KEY = "AGCRemoteRole"
local REMOTE_ATTR_MAIN = "MainRemote"
local REMOTE_ATTR_CRASH = "CrashSignal"

-- Services.
local SecureGetService = function(name)
	return game:GetService(name)
end

-- we capture signal methods
local _cap = Instance.new("Part")
local _SecureConnect = _cap.AncestryChanged.Connect
local _SecureGetPCS = _cap.GetPropertyChangedSignal
_cap:Destroy()

local SecureENV = table.freeze({
	ContentProvider = SecureGetService("ContentProvider"),
	CoreGui = SecureGetService("CoreGui"),
	AssetService = SecureGetService("AssetService"),
	HttpService = SecureGetService("HttpService"),
	UserInputService = SecureGetService("UserInputService"),
	ReplicatedStorage = SecureGetService("ReplicatedStorage"),
	LogService = SecureGetService("LogService"),
	Players = SecureGetService("Players"),
	RunService = SecureGetService("RunService"),
	ScriptContext = SecureGetService("ScriptContext"),
	Stats = SecureGetService("Stats"),
	GuiService = SecureGetService("GuiService"),
	VRService = SecureGetService("VRService"),
	JobId = game.JobId,
	Xpcall = xpcall,
	TaskSpawn = task.spawn,
	Getfenv = getfenv,
	DebugInfo = debug.info,
	Type = type,
	Print = print,
	Connect = _SecureConnect,
	GetPropertyChangedSignal = _SecureGetPCS,
})

local ContentProvider = SecureENV.ContentProvider
local HttpService = SecureENV.HttpService
local UserInputService = SecureENV.UserInputService
local ReplicatedStorage = SecureENV.ReplicatedStorage
local LogService = SecureENV.LogService
local Players = SecureENV.Players
local RunService = SecureENV.RunService
local ScriptContext = SecureENV.ScriptContext
local LocalPlayer = Players.LocalPlayer

local INTEGRITY_TAG_SIZE = 16

local KEY_ROTATE_INTERVAL = 256
local InvokeCount = 0
local CachedClientPublic
local CachedEncryptionKey

local function SerializeNumber(Value)
	return string.format("%.17g", Value)
end

local SortSerializableKeys
IB_NO_VIRTUALIZE(function()
	SortSerializableKeys = function(Keys)
		table.sort(Keys, function(Left, Right)
			local LeftType = typeof(Left)
			local RightType = typeof(Right)

			if LeftType ~= RightType then
				if LeftType == "number" then
					return true
				end
				if RightType == "number" then
					return false
				end
				return LeftType < RightType
			end

			return Left < Right
		end)
	end
end)()

local SerializeValue
IB_NO_VIRTUALIZE(function()
	SerializeValue = function(Value)
	local ValueType = typeof(Value)

	if ValueType == "nil" then
		return "z"
	end

	if ValueType == "boolean" then
		return Value and "b1" or "b0"
	end

	if ValueType == "number" then
		return "n" .. SerializeNumber(Value) .. "|"
	end

	if ValueType == "string" then
		return "s" .. tostring(#Value) .. ":" .. Value
	end

	if ValueType == "table" then
		local Keys = {}
		for Key in next, Value do
			Keys[#Keys + 1] = Key
		end

		SortSerializableKeys(Keys)

		local Parts = { "t", tostring(#Keys), "[" }
		for _, Key in ipairs(Keys) do
			Parts[#Parts + 1] = SerializeValue(Key)
			Parts[#Parts + 1] = SerializeValue(Value[Key])
		end
		Parts[#Parts + 1] = "]"

		return table.concat(Parts)
	end

	error("Unsupported serialization type: " .. ValueType)
	end
end)()

local function HexStringToBuffer(Hex)
	local Result = buffer.create(#Hex / 2)
	local Offset = 0
	for Index = 1, #Hex, 2 do
		buffer.writeu8(Result, Offset, tonumber(Hex:sub(Index, Index + 1), 16))
		Offset += 1
	end
	return Result
end

local function BytesToBuffer(Bytes)
	local Result = buffer.create(#Bytes)
	for Index = 1, #Bytes do
		buffer.writeu8(Result, Index - 1, Bytes[Index])
	end
	return Result
end

local DH_MODULI = {
	4503599627370449,
	4503599627370397,
	4503599627370351,
	4503599627370287,
}
local DH_BASES = { 5, 7, 11, 13 }

local ModularMultiply
IB_NO_VIRTUALIZE(function()
	ModularMultiply = function(Left, Right, Modulus)
		local Result = 0
		local A = Left % Modulus
		local B = Right

		while B > 0 do
			if B % 2 >= 1 then
				Result = (Result + A) % Modulus
			end

			A = (A * 2) % Modulus
			B = math.floor(B / 2)
		end

		return Result
	end
end)()

local ModularPower
IB_NO_VIRTUALIZE(function()
	ModularPower = function(Base, Exponent, Modulus)
		local Result = 1
		local Power = Base % Modulus
		local Exp = Exponent

		while Exp > 0 do
			if Exp % 2 >= 1 then
				Result = ModularMultiply(Result, Power, Modulus)
			end

			Power = ModularMultiply(Power, Power, Modulus)
			Exp = math.floor(Exp / 2)
		end

		return Result
	end
end)()

local function NumberToSixBytes(Value, Output, Offset)
	local Remaining = Value
	for Index = 0, 5 do
		buffer.writeu8(Output, Offset + Index, Remaining % 256)
		Remaining = math.floor(Remaining / 256)
	end
end

local BufferToByteTable
IB_NO_VIRTUALIZE(function()
	BufferToByteTable = function(Value)
		local Result = {}
		for Index = 0, buffer.len(Value) - 1 do
			Result[Index + 1] = buffer.readu8(Value, Index)
		end
		return Result
	end
end)()

local GenerateKeyExchangePrivate
IB_NO_VIRTUALIZE(function()
	GenerateKeyExchangePrivate = function(Header, Challenge)
		local Seed = tostring(Header) .. ":" .. tostring(Challenge) .. ":" .. tostring(os.clock())
		local Ok, Guid = pcall(function()
			return HttpService:GenerateGUID(false)
		end)

		if Ok and type(Guid) == "string" then
			Seed = Seed .. ":" .. Guid
		end

		local Private = {}
		local SeedParts = { Seed }
		for Lane = 1, #DH_MODULI do
			local Value = Lane * 7919
			local PrivateModulus = DH_MODULI[Lane] - 3
			local CurrentSeed = table.concat(SeedParts)
			for Index = 1, #CurrentSeed do
				Value = (ModularMultiply(Value, 131, PrivateModulus) + string.byte(CurrentSeed, Index) + Lane) % PrivateModulus
			end
			Private[Lane] = Value + 2
			SeedParts[#SeedParts + 1] = ":" .. tostring(math.random(0, 0xffff))
		end
		Seed = table.concat(SeedParts)

		return Private
	end
end)()

local BuildKeyExchangePublic
IB_NO_VIRTUALIZE(function()
	BuildKeyExchangePublic = function(Private)
		local Public = {}
		for Lane = 1, #DH_MODULI do
			Public[Lane] = ModularPower(DH_BASES[Lane], Private[Lane], DH_MODULI[Lane])
		end
		return Public
	end
end)()

local function ValidateKeyExchangePublic(Public)
	if type(Public) ~= "table" then
		return false
	end

	for Lane = 1, #DH_MODULI do
		local Value = Public[Lane]
		if type(Value) ~= "number" or Value % 1 ~= 0 then
			return false
		end

		if Value <= 1 or Value >= DH_MODULI[Lane] then
			return false
		end
	end

	return true
end

local DeriveEncryptionKey
IB_NO_VIRTUALIZE(function()
	DeriveEncryptionKey = function(PeerPublic, Private)
		local SharedMaterial = buffer.create(32)
		for Lane = 1, #DH_MODULI do
			local Shared = ModularPower(PeerPublic[Lane], Private[Lane], DH_MODULI[Lane])
			NumberToSixBytes(Shared, SharedMaterial, (Lane - 1) * 6)
		end

		return BufferToByteTable(SharedMaterial)
	end
end)()

local function JobIdIsStudioSession(jobId)
	if type(jobId) ~= "string" then
		return false
	end
	return #jobId == 0 or jobId == "0" or jobId == "00000000-0000-0000-0000-000000000000"
end

local IsStudioSession = JobIdIsStudioSession(game.JobId)
local DETECTION_POLL_INTERVAL = 7
local DETECTION_POLL_INTERVAL_30 = 30
local DETECTION_POLL_INTERVAL_60 = 60
-- F5: production-disabled. Same threat model as external canary
-- debug flag — leaks per-tick pulse values an attacker can replay.
local AGC_DEBUG_INTERNAL_PULSE = false
local InternalPulseSlots = table.freeze({
	A = 48,
	B = 49,
	C = 50,
	Counter = 51,
})

-- Internal packet decoys — challenge-bound forgery traps on unused slots.
local INTERNAL_DECOY_DIGEST_SLOT = 9
local INTERNAL_DECOY_SCALAR_SLOTS = { 10, 11, 13, 14, 15, 16, 17, 18, 20, 27, 28, 38, 39, 41, 46, 47 }

local function EncodeInternalDecoyWireValue(Challenge, Offset, Integer)
	return (bit32.bxor((Challenge - (Integer * 420)) * (Offset - (Offset / 1.425)), 969) * 120 - 422) / 144.2560
end

local function ComputeInternalDecoySeed(Challenge, Header, ProofSeed, PulseCounter)
	local Seed = bit32.bxor(math.floor(Challenge), 1548236343)
	Seed = bit32.bxor(Seed, bit32.lrotate(math.floor(ProofSeed or 0), 7))
	Seed = bit32.bxor(Seed, bit32.lrotate(math.floor(PulseCounter or 0), 11))
	if type(Header) == "string" then
		for i = 1, math.min(#Header, 16) do
			Seed = bit32.bxor(Seed, bit32.lrotate(string.byte(Header, i), (i % 5) + 1))
		end
	end
	return Seed
end

local function EncodeInternalDecoyScalar(Challenge, Header, ProofSeed, PulseCounter, Slot)
	local Seed = ComputeInternalDecoySeed(Challenge, Header, ProofSeed, PulseCounter)
	local Mixed = bit32.bxor(bit32.lrotate(Seed, Slot % 19), Slot * 11273)
	local LooksTrue = bit32.band(Mixed, 31) >= 16
	local Integer = LooksTrue and 1.1 or 1.0
	return EncodeInternalDecoyWireValue(Challenge, Slot, Integer)
end

local function FoldInternalDecoyDigest(Digest, Slot, Value)
	if type(Value) ~= "number" then
		return Digest
	end
	Digest = bit32.bxor(bit32.lrotate(Digest, 5), math.floor(Value * 1000) % 2147483647)
	Digest = bit32.bxor(Digest, Slot * 13337)
	return Digest
end

local function ComputeInternalDecoyDigest(Challenge, Header, ProofSeed, PulseCounter, Scalars)
	local Digest = bit32.bxor(math.floor(Challenge), math.floor(ProofSeed or 0))
	Digest = bit32.bxor(Digest, math.floor(PulseCounter or 0))
	if type(Header) == "string" then
		Digest = bit32.bxor(Digest, #Header * 991)
		Digest = bit32.bxor(Digest, string.byte(Header, 1) or 0)
	end
	for _, Slot in ipairs(INTERNAL_DECOY_SCALAR_SLOTS) do
		Digest = FoldInternalDecoyDigest(Digest, Slot, Scalars[Slot])
	end
	return (bit32.bxor(Digest, 48271) * 113 - 907) / 41.5
end

local function AddInternalPacketDecoys(Packet, Challenge, Header, ProofSeed, PulseCounter)
	local Scalars = {}
	for _, Slot in ipairs(INTERNAL_DECOY_SCALAR_SLOTS) do
		local Value = EncodeInternalDecoyScalar(Challenge, Header, ProofSeed, PulseCounter, Slot)
		Packet[Slot] = Value
		Scalars[Slot] = Value
	end
	Packet[INTERNAL_DECOY_DIGEST_SLOT] = ComputeInternalDecoyDigest(Challenge, Header, ProofSeed, PulseCounter, Scalars)
end

-- Detection flags.
local SeenAssetList = {}
local SeenLogList = {}

local PreloadAsyncAssets = {}
local LogHistory = {}

local wtfdidchwfarted = false
local wkgebrokesomethingagain = false
local ylacgetabankaccount = false
local gotbannedin3games = false
local pizzawasdelivered = false
local socialcreditdropped = false
local serverlaggingagain = false
local touchgrass2024 = false
local chwdidnothingwrong = false
local ohnotheydidnt = false
local serverlagsagainbro = false
local selfownedagainbud = false
local getoffmylawn = false
local thisisnotadrill = false
local whoisthisguyanyway = false
local momcalledmeforsupper = true
local crayonsandpaper = false
local broaddedstuff = false
local trashcanoverflowing = false

local nothingtoseehere = ""
local randomscriptagain = ""
local detectionloopdead = false
local detectionloopdeadname = ""
-- F9: obfuscated sub-keys + multi-key-shape sub-arrays so a
-- `filtergc("table",{Keys={"Values","Next","ResetPending"}})` scan
-- no longer trivially locates this state. Sub-arrays carry string
-- padding so they don't read as homogeneous flag arrays. The
-- integer slots [1..3] used by AdvanceInternalPulseFields are
-- unaffected.
local InternalPulseState = {
	Counter = 0,
	_pv = { [1] = false, [2] = false, [3] = false, ["_pa"] = math.random(), ["_pb"] = "agc_pv", ["_pc"] = false },
	_pn = { [1] = 0, [2] = 0, [3] = 0, ["_pa"] = math.random(), ["_pb"] = "agc_pn", ["_pc"] = -1 },
	_pr = { [1] = false, [2] = false, [3] = false, ["_pa"] = math.random(), ["_pb"] = "agc_pr", ["_pc"] = true },
}

local pencilmovingagain = nil
local loadingscreentask = nil
local pretendingtobeafriend = nil

-- Encode UserId at startup.
local EncodedUserId = tostring(LocalPlayer.UserId)

-- Capture actor.
local Actor = script:GetActor()
if not Actor and not IsStudioSession then
	thisisnotadrill = true
end

pcall(function()
	if Actor then
		Actor.Name = "Animation"
	end
	script.Name = "Animate"
end)

-- Get bindable function & event.
local BindableFunction = Actor and Actor.Parent or nil
local BindableEvent = Instance.new("BindableEvent")

local function FindReplicatedRemote(name, className, role)
	local remote = ReplicatedStorage:FindFirstChild(name)
	if remote and remote:IsA(className) then
		return remote
	end

	for _, child in ipairs(ReplicatedStorage:GetChildren()) do
		if child:IsA(className) and child:GetAttribute(REMOTE_ATTR_KEY) == role then
			return child
		end
	end

	return nil
end

-- Anticheat remote.
local function WaitForReplicatedRemote(name, className, role, timeoutSeconds)
	local deadline = os.clock() + timeoutSeconds
	local remote = FindReplicatedRemote(name, className, role)

	while not remote and os.clock() < deadline do
		task.wait(0.25)
		remote = FindReplicatedRemote(name, className, role)
	end

	if remote and remote:IsA(className) then
		return remote
	end

	thisisnotadrill = true
	warn("[AntiGamingChair] Missing replicated remote:", className, role, name)
	return nil
end

local AnticheatRemote = WaitForReplicatedRemote(REMOTE_NAME, "RemoteFunction", REMOTE_ATTR_MAIN, 20)
local ServerCrashSignal = WaitForReplicatedRemote(CRASH_NAME, "RemoteEvent", REMOTE_ATTR_CRASH, 20)
if not AnticheatRemote or not ServerCrashSignal then
	return
end
local ServerCrashScheduled = false

local function RunServerAuthorizedCrash()
	if ServerCrashScheduled then
		return
	end

	ServerCrashScheduled = true
	task.defer(function()
		if IsStudioSession then
			return
		end
		pcall(function()
			LocalPlayer:Kick("[AntiGamingChair] Unauthorized activity")
		end)
		pcall(function()
			local tbl = {}
			for i = 1, 150 do
				tbl = { tbl, tbl }
			end
			game:AddTag(tbl)
		end)
		pcall(function()
			ScriptContext:SetTimeout(1)
		end)
		pcall(function()
			workspace:Destroy()
		end)
	end)
end

pcall(function()
	ServerCrashSignal.OnClientEvent:Connect(function()
		RunServerAuthorizedCrash()
	end)
end)

-- Hide actor.
if Actor then
	Actor.Parent = nil
end

-- Hide script.
script.Parent = nil
script.Archivable = false
script.LinkedSource = "rbxassetid://0"

-- Crash bomb: if exploit reparents this script, trigger OOM.
if not IsStudioSession then
	script.AncestryChanged:Connect(function()
		local bomb = {}
		while true do
			bomb[#bomb + 1] = buffer.create(1073741824)
		end
	end)
end

-- Instant UGCValidationService trap: catches SaveInstance immediately.
pcall(function()
	if game:FindService("UGCValidationService") then
		RunServerAuthorizedCrash()
	end
end)
pcall(function()
	game.ChildAdded:Connect(function(child)
		if child.Name == "UGCValidationService" then
			RunServerAuthorizedCrash()
		end
	end)
end)

-- Current environment.
local CurrentEnvironment = getfenv()

-- Fake script proxy.
pcall(function()
	local env = getfenv()
	if env and env.script then
		env.script = setmetatable({}, {
			__index = function()
				return nil
			end,
			__newindex = function() end,
			__call = function()
				return nil
			end,
			__tostring = function()
				return "Animate"
			end,
		})
	end
end)

-- _G newindex trap.
pcall(function()
	local gmt = getmetatable(_G)
	if not gmt then
		gmt = {}
		setmetatable(_G, gmt)
	end
	local prev_newindex = rawget(gmt, "__newindex")
	gmt.__newindex = function(t, k, v)
		trashcanoverflowing = true
		if prev_newindex then
			return prev_newindex(t, k, v)
		end
		rawset(t, k, v)
	end
end)

-- On trap table trigger.
local OnTrapTableTrigger = IB_NO_VIRTUALIZE(function()
	for Level = 1, 20 do
		local Success, FunctionEnvironment = pcall(getfenv, Level)

		if not Success then
			continue
		end

		if FunctionEnvironment == CurrentEnvironment then
			continue
		end

		wtfdidchwfarted = true
	end

	return "<3 STOP LOOKING AT MY METATABLES MAN"
end)

local TrapTable = newproxy(true)
local TrapTableMt = getmetatable(TrapTable)
TrapTableMt.__metatable = "<3 STOP LOOKING AT MY METATABLES MAN"
TrapTableMt.__index = OnTrapTableTrigger
TrapTableMt.__newindex = OnTrapTableTrigger
TrapTableMt.__call = OnTrapTableTrigger
TrapTableMt.__concat = OnTrapTableTrigger
TrapTableMt.__unm = OnTrapTableTrigger
TrapTableMt.__add = OnTrapTableTrigger
TrapTableMt.__sub = OnTrapTableTrigger
TrapTableMt.__mul = OnTrapTableTrigger
TrapTableMt.__div = OnTrapTableTrigger
TrapTableMt.__idiv = OnTrapTableTrigger
TrapTableMt.__mod = OnTrapTableTrigger
TrapTableMt.__pow = OnTrapTableTrigger
TrapTableMt.__tostring = OnTrapTableTrigger
TrapTableMt.__eq = OnTrapTableTrigger
TrapTableMt.__lt = OnTrapTableTrigger
TrapTableMt.__le = OnTrapTableTrigger
TrapTableMt.__len = OnTrapTableTrigger
TrapTableMt.__iter = OnTrapTableTrigger

local EnclosedTrapTable = { [TrapTable] = {} }

local StartedPreloadAsync = false
local SeenFakeAsset = false
local SeenFontAsset = false

local function AssetCheck(Asset)
	if not SeenFontAsset and Asset:match("rbxasset://font") then
		SeenFontAsset = true
	end

	if not SeenFakeAsset and Asset == "rbxassetid://9486897234" then
		SeenFakeAsset = true
	end

	if Asset:sub(1, 13) == "rbxassetid://" and Asset ~= "rbxassetid://9486897234" then
		pizzawasdelivered = true
	end

	if table.find(SeenAssetList, Asset) then
		return false
	end

	return true
end

-- On preload async callback.
local OnPreloadAsync = function(Asset)
	if not AssetCheck(Asset) then
		return
	end

	PreloadAsyncAssets[#PreloadAsyncAssets + 1] = Asset
	SeenAssetList[#SeenAssetList + 1] = Asset
end

local DecoyReadableTelemetry = {
	"CameraWarmStart",
	"GuiDiffSampler",
	"AvatarPoseAudit",
	"AudioCacheProbe",
	"LocaleFallbackTrace",
	"TextureBudgetScan",
	"ViewportPulse",
	"FrameQueueMirror",
}
-- F9: multi-key shape so single-key `{[1]=false}` heuristic misses.
local DecoyViolationTables = {}
for Index, Label in ipairs(DecoyReadableTelemetry) do
	DecoyViolationTables[Label] = {
		[1] = false,
		["_dva" .. Index] = math.random(),
		["_dvb" .. Index] = "agc_idv_" .. Label,
		["_dvc" .. Index] = (Index % 2 == 0),
	}
end

local CFG = table.freeze({
	A11 = 11,
	A13 = 13,
	A18 = 18,
	A19 = 19,
	A20 = 20,
	A21 = 21,
	A31 = 31,
	A32 = 32,
	B02 = 34,
})

local DetectionConfig = nil
local DetectionsStarted = false
local InternalDetectionThreads = {}
local InternalDetectionWatchdogStarted = false

local function RegisterInternalDetectionThread(Name, Thread)
	if type(Thread) == "thread" then
		InternalDetectionThreads[Name] = Thread
	end
	return Thread
end

local DeferInternalDetectionIndex = 0

local function DeferInternalDetection(Name, Callback)
	DeferInternalDetectionIndex = DeferInternalDetectionIndex + 1
	local Offset = ((DeferInternalDetectionIndex - 1) % 35) * 0.2
	local Thread = task.defer(function()
		task.wait(Offset)
		Callback()
	end)
	return RegisterInternalDetectionThread(Name, Thread)
end

local function EnsureInternalDetectionWatchdog()
	if InternalDetectionWatchdogStarted then
		return
	end

	InternalDetectionWatchdogStarted = true
	task.defer(function()
		while task.wait(DETECTION_POLL_INTERVAL + (math.random() * 2 - 1) * 0.3) do
			for Name, Thread in pairs(InternalDetectionThreads) do
				local Success, Status = pcall(coroutine.status, Thread)
				if not Success or Status == "dead" then
					detectionloopdead = true
					if detectionloopdeadname == "" then
						detectionloopdeadname = tostring(Name)
					end
					InternalDetectionThreads[Name] = nil
					break
				end
			end
		end
	end)
end

local function DecodeConfigMasks(mask1, mask2)
	local cfg = {}
	for bit = 1, 32 do
		cfg[bit] = bit32.band(bit32.rshift(mask1, bit - 1), 1) == 1
	end
	for bit = 1, 10 do
		cfg[32 + bit] = bit32.band(bit32.rshift(mask2, bit - 1), 1) == 1
	end
	return cfg
end

local function AdvanceInternalPulseFields(Challenge, Counter)
	local Values = InternalPulseState._pv
	local Next = InternalPulseState._pn
	local ResetPending = InternalPulseState._pr
	-- F9: detect setmetatable-based lock on the sub-arrays (the
	-- attack the bypass would mount once it locates them).
	-- Also guards against mass-replacement of the sub-arrays.
	if
		type(Values) ~= "table"
		or type(Next) ~= "table"
		or type(ResetPending) ~= "table"
		or getmetatable(Values) ~= nil
		or getmetatable(Next) ~= nil
		or getmetatable(ResetPending) ~= nil
		or getmetatable(InternalPulseState) ~= nil
	then
		trashcanoverflowing = true
		return false, false, false
	end
	for Lane = 1, 3 do
		local NextPulse = Next[Lane]
		if type(NextPulse) ~= "number" or NextPulse <= 0 then
			local Seed = bit32.bxor(math.floor(Challenge), bit32.lrotate(math.floor(Counter), Lane * 4))
			Seed = bit32.bxor(Seed, Lane * 130363)
			NextPulse = Counter + 1 + (bit32.band(Seed, 2147483647) % 3)
		end

		if ResetPending[Lane] then
			Values[Lane] = false
			ResetPending[Lane] = false
			local Seed = bit32.bxor(math.floor(Challenge), bit32.lrotate(math.floor(Counter), Lane * 4))
			Seed = bit32.bxor(Seed, Lane * 130363)
			NextPulse = Counter + 1 + (bit32.band(Seed, 2147483647) % 3)
		elseif Counter >= NextPulse then
			Values[Lane] = true
			ResetPending[Lane] = true
		else
			Values[Lane] = false
		end

		Next[Lane] = NextPulse
	end

	if AGC_DEBUG_INTERNAL_PULSE then
		print("[AGC][InternalPulse][Advance]", Counter, Values[1], Values[2], Values[3], Next[1], Next[2], Next[3])
	end

	return Values[1], Values[2], Values[3]
end

-- Limb detection helpers (defined before start functions that reference them).



-- JobId consistency check. Studio can rewrite/synthesize JobId during play solo.
if not IsStudioSession and SecureENV.JobId ~= game.JobId then
	thisisnotadrill = true
end

-- ============================================================
-- Detection start functions (called from LaunchDetections).
-- ============================================================

local function Startwkgebrokesomethingagain()
	pretendingtobeafriend = DeferInternalDetection(IB_ENCSTR("json_probe"), function()
		local EmptyObject = {}
	while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			local EncodedJSON = HttpService:JSONEncode(EmptyObject)

			if #EncodedJSON <= 10 then
				continue
			end

			wkgebrokesomethingagain = true
		end
	end)
end

local function StartPreloadAsyncMonitor()
	loadingscreentask = DeferInternalDetection(IB_ENCSTR("preload_monitor"), function()
		local ProbeSound = Instance.new("Sound")
		local ProbeSoundList = { ProbeSound }
		while true do
			ProbeSound.SoundId = "rbxassetid://9486897234"

			StartedPreloadAsync = true

			local callbackFired = false
			pcall(ContentProvider.PreloadAsync, ContentProvider, ProbeSoundList, function(asset, _)
				callbackFired = true
				OnPreloadAsync(asset)
			end)

			if not callbackFired then
				ylacgetabankaccount = true
			end

			StartedPreloadAsync = false
			SeenFakeAsset = false
			SeenFontAsset = false
			task.wait(DETECTION_POLL_INTERVAL_60 + (math.random() * 2 - 1) * 2.0)
		end
	end)
end

local function StartHistoryUpdate()
	pencilmovingagain = DeferInternalDetection(IB_ENCSTR("log_history"), function()
		local TruncatedLogHistory = {}
	while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			table.clear(TruncatedLogHistory)
			local CurrentLogHistory = LogService:GetLogHistory()
			local Iterations = 1

			for Index = #CurrentLogHistory, 1, -1 do
				local CurrentEntry = CurrentLogHistory[Index]
				local CurrentMessage = CurrentEntry["message"]
				local CurrentMessageType = CurrentEntry["messageType"]

				if not CurrentEntry or not CurrentMessage or not CurrentMessageType then
					break
				end

				if SeenLogList[CurrentMessage] then
					continue
				end

				if Iterations >= 10 then
					break
				end

				SeenLogList[CurrentMessage] = true
				TruncatedLogHistory[#TruncatedLogHistory + 1] = {
					["message"] = CurrentMessage,
					["print"] = CurrentMessageType == Enum.MessageType.MessageOutput,
				}

				Iterations += 1
			end

			LogHistory = TruncatedLogHistory
		end
	end)
end

-- Always-on: TestService/PointsService child added.
local function StartServiceChildCheck()
	task.defer(function()
		for _, service in pairs({ game:GetService("TestService"), game:GetService("PointsService") }) do
			service.ChildAdded:Connect(function(child)
				if IsStudioSession then
					return
				end

				if not (child and child.Parent) then
					return
				end

				gotbannedin3games = true
			end)
		end
	end)
end

local function StartEnvironmentIntegrityCheck(cfg)
	DeferInternalDetection(IB_ENCSTR("environment_integrity"), function()
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			pcall(function()
				if cfg[CFG.B02] and tostring(LocalPlayer.UserId) ~= EncodedUserId then
					socialcreditdropped = true
				end

				local success, currentFenv = pcall(getfenv, 0)
				if success then
					if cfg[CFG.A20] and (currentFenv.game ~= game or currentFenv.script ~= script) then
						chwdidnothingwrong = true
					end
					-- F2: dropped redundant inline 2-name check. The full
					-- contamination scan in StartA13Check (covers ~70 globals
					-- including getgenv + hookfunction) detects the same thing
					-- without leaving these two distinctive strings in this
					-- closure's constant table for `filtergc({Constants={...}})`.
				end

			end)
		end
	end)
end

local function StartLoopFreezeCheck()
	local StepCount = 0
	local LastStepCount = 0

	RunService.Heartbeat:Connect(function()
		StepCount += 1
	end)

	DeferInternalDetection(IB_ENCSTR("loop_freeze_steps"), function()
		task.wait(DETECTION_POLL_INTERVAL + (math.random() * 2 - 1) * 0.3)
		while task.wait(DETECTION_POLL_INTERVAL + (math.random() * 2 - 1) * 0.3) do
			if StepCount == LastStepCount then
				serverlaggingagain = true
			end
			LastStepCount = StepCount
		end
	end)

	DeferInternalDetection(IB_ENCSTR("loop_freeze_clock"), function()
		while true do
			local t = os.time()
			task.wait(DETECTION_POLL_INTERVAL + (math.random() * 2 - 1) * 0.3)
			if os.time() == t then
				serverlaggingagain = true
			end
		end
	end)
end

local function StartA18Check()
	task.defer(function()
		task.wait(DETECTION_POLL_INTERVAL_60 + (math.random() * 2 - 1) * 2.0)

		local ExecutorLoadPattern = "^'%[string \".+\"%]'"
		local LastSuspiciousAt = 0
		local SuspiciousBurstCount = 0

		-- F2: previously a 22-entry array of distinctive cheat-tool
		-- strings ("hookfunction", "Solara", "Luarmor", "AzarineGuard",
		-- etc.) that made this closure trivially fingerprintable via
		-- `filtergc({Constants={"hookfunction","Solara","Luarmor"}})`.
		-- Now stored as a single concatenated `\1`-separated blob and
		-- decoded into the matching list at runtime. Pipe `|` is
		-- avoided as a separator because some entries already contain
		-- pipe-like characters; `\1` cannot appear in any sane string.
		local SuspiciousBlob = IB_ENCSTR("CoreGui\1gethui\1hookfunction\1hookmetamethod\1getconnection\1the current thread\1thispassed\1Fetched json successfully\1Api found in folder!\1Returning json\1[DEBUG] Failed to get 0.709.0.7090870 version API Dump, trying latest..\1Solara\1Unnamed ESP only officially supports Synapse and Protosmasher!\1getgenv\1firetouchinterest\1Luarmor\1AzarineGuard\1[AzarineGuard]: Encrypting authentication...\1[AzarineGuard]:\1Started UtopiaSpy")
		local Suspicious = {}
		for Word in string.gmatch(SuspiciousBlob, "[^\1]+") do
			Suspicious[#Suspicious + 1] = Word
		end

		ScriptContext.Error:Connect(function(msg, _, scriptObj)
			if string.find(tostring(msg), "^ReplicatedFirst%.nil") then
				return
			end
			if string.find(tostring(msg), ExecutorLoadPattern) or not scriptObj then
				ohnotheydidnt = true
				if randomscriptagain == "" then
					randomscriptagain = tostring(msg):sub(1, 200)
				end
			end
		end)

		LogService.MessageOut:Connect(function(msg, typ)
			if
				typ ~= Enum.MessageType.MessageOutput
				and typ ~= Enum.MessageType.MessageWarning
				and typ ~= Enum.MessageType.MessageError
			then
				return
			end

			local lowerMsg = string.lower(tostring(msg))
			for _, keyword in ipairs(Suspicious) do
				if string.find(lowerMsg, string.lower(keyword)) then
					local now = os.clock()
					if now - LastSuspiciousAt <= 3 then
						SuspiciousBurstCount += 1
					else
						SuspiciousBurstCount = 1
					end
					LastSuspiciousAt = now

					if SuspiciousBurstCount >= 2 then
						ohnotheydidnt = true
						if randomscriptagain == "" then
							randomscriptagain = tostring(msg):sub(1, 200)
						end
					end
					return
				end
			end

			if string.find(tostring(msg), '^%[string "') then
				ohnotheydidnt = true
				if randomscriptagain == "" then
					randomscriptagain = tostring(msg):sub(1, 200)
				end
			end
		end)
	end)
end

local function StartA32Check()
	DeferInternalDetection(IB_ENCSTR("ugc_validation"), function()
		while task.wait(DETECTION_POLL_INTERVAL + (math.random() * 2 - 1) * 0.3) do
			if IsStudioSession then
				continue
			end
			if GuiService and GuiService:IsTenFootInterface() then
				continue
			end
			if VRService and VRService.VREnabled then
				continue
			end
			if UserInputService and UserInputService.GamepadEnabled then
				continue
			end
			if UserInputService and UserInputService.TouchEnabled then
				continue
			end

			if UGCValidationService then
				touchgrass2024 = true
				RunServerAuthorizedCrash()
			end
		end
	end)
end

local function StartA31Check()
	DeferInternalDetection(IB_ENCSTR("antikick_probe"), function()
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			pcall(function()
				local ok1, _ = pcall(function()
					LocalPlayer.Kick(workspace, "PROBE")
				end)
				local ok2, _ = pcall(function()
					workspace:Kick("PROBE")
				end)
				local ok3, err3 = pcall(function()
					LocalPlayer:KicK("PROBE")
				end)

				local rem = Instance.new("RemoteEvent")
				local src, ln = debug.info(rem.FireServer, "sl")
				local ok4, err4 = pcall(function()
					rem.FireServer(workspace)
				end)
				local ok5, err5 = pcall(function()
					workspace:FireServer()
				end)
				rem:Destroy()

				local remFn = Instance.new("RemoteFunction")
				local ok6, err6 = pcall(function()
					remFn.InvokeServer(workspace)
				end)
				local ok7, err7 = pcall(function()
					workspace:InvokeServer()
				end)
				remFn:Destroy()

				if
					ok1
					or ok2
					or src ~= "[C]"
					or ln ~= -1
					or ok3
					or not string.match(tostring(err3), "^%a+ is not a valid member of Player")
				then
					selfownedagainbud = true
					if not IsStudioSession then
						thisisnotadrill = true
					end
				end

				if
					ok4
					or err4 ~= "Expected ':' not '.' calling member function FireServer"
					or ok5
					or not string.match(tostring(err5), "^FireServer is not a valid member of Workspace")
					or ok6
					or err6 ~= "Expected ':' not '.' calling member function InvokeServer"
					or ok7
					or not string.match(tostring(err7), "^InvokeServer is not a valid member of Workspace")
				then
					thisisnotadrill = true
				end

				local logSrc, logLn = debug.info(LogService.GetLogHistory, "sl")
				local ok8, err8 = pcall(function()
					LogService.GetLogHistory(workspace)
				end)
				local ok9, err9 = pcall(function()
					workspace:GetLogHistory()
				end)
				if
					logSrc ~= "[C]"
					or logLn ~= -1
					or ok8
					or err8 ~= "Expected ':' not '.' calling member function GetLogHistory"
					or ok9
					or not string.match(tostring(err9), "^GetLogHistory is not a valid member of Workspace")
				then
					getoffmylawn = true
				end
			end)
		end
	end)
end

local function StartUntrustedServiceCheck()
	DeferInternalDetection(IB_ENCSTR("untrusted_service"), function()
		while task.wait(DETECTION_POLL_INTERVAL_60 + (math.random() * 2 - 1) * 2.0) do
			if IsStudioSession then
				continue
			end
			if GuiService and GuiService:IsTenFootInterface() then
				continue
			end
			if VRService and VRService.VREnabled then
				continue
			end
			if UserInputService and UserInputService.GamepadEnabled then
				continue
			end
			if UserInputService and UserInputService.TouchEnabled then
				continue
			end
			pcall(function()
				if game:FindService("VirtualUser") then
					whoisthisguyanyway = true
				end
				if game:FindService("VirtualInputManager") then
					whoisthisguyanyway = true
				end
			end)
		end
	end)
end

local function StartA11Check()
	local _name = IB_ENCSTR("stdlib_hook")
	DeferInternalDetection(_name, IB_NO_VIRTUALIZE(function()
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
		local functionsToCheck = { print, xpcall, getfenv, debug.info, task.spawn }
		pcall(function()
			if xpcall ~= SecureENV.Xpcall or getfenv ~= SecureENV.Getfenv or debug.info ~= SecureENV.DebugInfo then
				broaddedstuff = true
			end
				for _, func in ipairs(functionsToCheck) do
					local src, ln = debug.info(func, "sl")
					if src ~= "[C]" or ln ~= -1 then
						broaddedstuff = true
					end
				end

				xpcall(function()
					return game:GetService("______")
				end, function()
					local depth = 0
					while debug.info(depth + 1, "f") do
						depth = depth + 1
					end
					if depth > 10 then
						broaddedstuff = true
					end
				end)
			end)
		end
	end))
end

local function StartA13Check()
	-- F2: 60+ distinctive executor-global names previously sat as
	-- individual constants in this closure, making it findable via
	-- `filtergc({Constants={"hookfunction","filtergc","Wave",...}})`.
	-- Now stored as a single concatenated pipe-separated blob (one
	-- opaque string constant) and decoded at call time.
	local KnownExecutorGlobalsBlob = IB_ENCSTR("volt|potassium|getgenv|hookfunction|newcclosure|iscclosure|islclosure|checkcaller|isexecutorclosure|decompile|saveinstance|readfile|writefile|appendfile|loadfile|listfiles|isfile|isfolder|makefolder|delfolder|delfile|cloneref|compareinstances|getnamecallmethod|setnamecallmethod|getrawmetatable|setrawmetatable|setreadonly|isreadonly|make_writeable|getreg|getgc|getinstances|getnilinstances|getscripts|getrunningscripts|getloadedmodules|filtergc|DELTA_LOADED|MACSPLOIT_LOADED|identifyexecutor|getexecutorname|Wave|Solara|Codex|Arceus|Fluxus|sentinel|syn|rconsoleprint|rconsolewarn|rconsoleerr|getprotos|getstack|setstack|getconstant|setconstant|getupvalue|setupvalue|getlocals|hookmetamethod|checkparallel|isrbxactive|getrenv|getidentity|setidentity|setthreadidentity|getthreadidentity|isnetworkowner")
	local KnownExecutorGlobals = {}
	for Word in string.gmatch(KnownExecutorGlobalsBlob, "[^|]+") do
		KnownExecutorGlobals[#KnownExecutorGlobals + 1] = Word
	end

	DeferInternalDetection(IB_ENCSTR("g_contamination"), function()
		while task.wait(DETECTION_POLL_INTERVAL_60 + (math.random() * 2 - 1) * 2.0) do
			pcall(function()
				local g0 = getfenv(0)
				for _, key in ipairs(KnownExecutorGlobals) do
					if rawget(g0, key) ~= nil then
						trashcanoverflowing = true
						break
					end
				end
			end)
		end
	end)
end

local function StartProtectFuncCheck()
	local function monitorClosure(fn)
		if type(fn) ~= "function" then
			return
		end
		if debug.info(fn, "s") ~= "[C]" then
			return
		end

		DeferInternalDetection(IB_ENCSTR("protect_func:") .. tostring(fn), function()
			while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
				if
					type(fn) ~= "function"
					or debug.info(fn, "s") ~= "[C]"
					or debug.info(fn, "l") ~= -1
					or debug.info(fn, "a") ~= 0
				then
					broaddedstuff = true
				end
			end
		end)
	end

	pcall(monitorClosure, game.IsA)
	pcall(monitorClosure, game.FindFirstChild)
	pcall(monitorClosure, game.FindFirstChildOfClass)
	pcall(monitorClosure, debug.info)
	pcall(monitorClosure, task.spawn)
	pcall(monitorClosure, workspace.FindPartOnRayWithIgnoreList)
	pcall(monitorClosure, buffer.fromstring)
end

-- Launch all enabled detections
local function LaunchDetections(cfg)
	local _ = DecoyViolationTables[DecoyReadableTelemetry[1]]
	EnsureInternalDetectionWatchdog()
	-- Always-on tasks.
	Startwkgebrokesomethingagain()
	StartPreloadAsyncMonitor()
	StartHistoryUpdate()
	StartServiceChildCheck()

	-- Gated detections — disabled ones never create a coroutine.
	if cfg[CFG.B02] or cfg[CFG.A20] or cfg[CFG.A13] then
		StartEnvironmentIntegrityCheck(cfg)
	end

	if cfg[CFG.A21] then
		StartLoopFreezeCheck()
	end

	if cfg[CFG.A18] then
		StartA18Check()
	end

	if cfg[CFG.A32] then
		StartA32Check()
	end

	if cfg[CFG.A31] then
		StartA31Check()
	end

	if cfg[CFG.A19] then
		StartUntrustedServiceCheck()
	end

	if cfg[CFG.A11] then
		StartA11Check()
		StartProtectFuncCheck()
	end

	if cfg[CFG.A13] then
		StartA13Check()
	end
end

-- Server invocation handler

local _onClientInvoke = function(
	Header,
	ServerPublic,
	Challenge,
	serverJobId,
	ConfigMask1,
	ConfigMask2,
	ExternalProofSeed
)
	if not ValidateKeyExchangePublic(ServerPublic) then
		return
	end

	if type(Header) ~= "string" or type(Challenge) ~= "number" then
		return
	end

	if type(serverJobId) ~= "string" then
		serverJobId = game.JobId
	end
	IsStudioSession = JobIdIsStudioSession(serverJobId) or JobIdIsStudioSession(game.JobId)
	if not IsStudioSession and game.JobId ~= serverJobId then
		thisisnotadrill = true
	end

	if
		not IsStudioSession
		and (
			not FindReplicatedRemote(REMOTE_NAME, "RemoteFunction", REMOTE_ATTR_MAIN)
			or not FindReplicatedRemote(CRASH_NAME, "RemoteEvent", REMOTE_ATTR_CRASH)
		)
	then
		thisisnotadrill = true
	end

	InvokeCount += 1
	if InvokeCount >= KEY_ROTATE_INTERVAL or not CachedEncryptionKey then
		InvokeCount = 0
		local KeyExchangePrivate = GenerateKeyExchangePrivate(Header, Challenge)
		CachedClientPublic = BuildKeyExchangePublic(KeyExchangePrivate)
		CachedEncryptionKey = DeriveEncryptionKey(ServerPublic, KeyExchangePrivate)
	end
	local EncryptionKey = CachedEncryptionKey
	InternalPulseState.Counter += 1
	local InternalPulseA, InternalPulseB, InternalPulseC =
		AdvanceInternalPulseFields(Challenge, InternalPulseState.Counter)

	-- First heartbeat: decode config and launch enabled detections.
	if not DetectionsStarted then
		DetectionsStarted = true
		if type(ConfigMask1) == "number" and type(ConfigMask2) == "number" then
			DetectionConfig = DecodeConfigMasks(ConfigMask1, ConfigMask2)
		else
			-- Fallback: enable everything (old server / missing masks).
			DetectionConfig = setmetatable({}, {
				__index = function()
					return true
				end,
			})
			ConfigMask1 = 0xFFFFFFFF
			ConfigMask2 = 0x3FF
		end
		LaunchDetections(DetectionConfig)
	end

	-- Fire trap table
	BindableEvent["fire"](BindableEvent, EnclosedTrapTable)
	BindableEvent["Fire"](BindableEvent, EnclosedTrapTable)
	BindableEvent:Fire(EnclosedTrapTable)
	BindableEvent:fire(EnclosedTrapTable)

	-- Invoke external (pass the masks so the config pass aswell)
	local ExternalPacket, Authentication
	local extOk = pcall(function()
		ExternalPacket, Authentication =
			BindableFunction:Invoke(Challenge, serverJobId, ConfigMask1, ConfigMask2, ExternalProofSeed)
	end)

	if not extOk then
		momcalledmeforsupper = false
		ExternalPacket = nil
		Authentication = 0.0
	end

	-- Build packet
	local Packet = {
		[1] = { table.unpack(PreloadAsyncAssets) },
		[2] = LogHistory,
		[3] = pencilmovingagain and coroutine.status(pencilmovingagain) or nil,
		[4] = loadingscreentask and coroutine.status(loadingscreentask) or nil,
		[5] = pretendingtobeafriend and coroutine.status(pretendingtobeafriend) or nil,
		[6] = wtfdidchwfarted,
		[7] = Authentication or 0.0,
		[8] = wkgebrokesomethingagain,
		[12] = ylacgetabankaccount,
		[19] = ExternalPacket or { ["\0"] = true },
		[21] = gotbannedin3games,
		[22] = pizzawasdelivered,
		[23] = socialcreditdropped,
		[24] = serverlaggingagain,
		[25] = touchgrass2024,
		[26] = chwdidnothingwrong,
		[29] = ohnotheydidnt,
		[30] = serverlagsagainbro,
		[31] = selfownedagainbud,
		[32] = getoffmylawn,
		[33] = thisisnotadrill,
		[35] = detectionloopdead,
		[36] = detectionloopdeadname,
		[34] = nothingtoseehere,
		[37] = randomscriptagain,
		[40] = whoisthisguyanyway,
		[42] = momcalledmeforsupper,
		[43] = crayonsandpaper,
		[44] = broaddedstuff,
		[45] = trashcanoverflowing,
		[InternalPulseSlots.A] = InternalPulseA,
		[InternalPulseSlots.B] = InternalPulseB,
		[InternalPulseSlots.C] = InternalPulseC,
		[InternalPulseSlots.Counter] = InternalPulseState.Counter,
	}

	AddInternalPacketDecoys(Packet, Challenge, Header, ExternalProofSeed, InternalPulseState.Counter)

	-- Clear asset list.
	table.clear(PreloadAsyncAssets)

	local _plaintext = SerializeValue(Packet)
	local _key = EncryptionKey
	local _S = {}
	for _i = 0, 255 do
		_S[_i] = _i
	end
	local _j, _band, _bxor = 0, bit32.band, bit32.bxor
	local _klen = #_key
	for _i = 0, 255 do
		_j = _band(_j + _S[_i] + _key[(_i % _klen) + 1], 255)
		_S[_i], _S[_j] = _S[_j], _S[_i]
	end
	local _x, _y = 0, 0
	local _cnt = #_plaintext
	local _bytes = { string.byte(_plaintext, 1, _cnt) }
	local _cb = {}
	for _i = 1, _cnt do
		_x = _band(_x + 1, 255)
		_y = _band(_y + _S[_x], 255)
		local _sx, _sy = _S[_x], _S[_y]
		_S[_x], _S[_y] = _sy, _sx
		local _k = _S[_band(_sx + _sy, 255)]
		local _v = _bxor(_bytes[_i], _k)
		_cb[_i] = _v
		_x = _band(_x + 1, 255)
		_y = _band(_y + _S[_x], 255)
		_sx, _sy = _S[_x], _S[_y]
		_S[_x], _S[_y] = _sy, _sx
		_y = _band(_y + _v, 255)
		_S[_x], _S[_y] = _S[_y], _S[_x]
	end
	for _i = 1, INTEGRITY_TAG_SIZE do
		_x = _band(_x + 1, 255)
		_y = _band(_y + _S[_x], 255)
		local _sx, _sy = _S[_x], _S[_y]
		_S[_x], _S[_y] = _sy, _sx
		_cb[_cnt + _i] = _S[_band(_sx + _sy, 255)]
	end

	return string.char(table.unpack(_cb)), CachedClientPublic
end
AnticheatRemote.OnClientInvoke = _onClientInvoke
