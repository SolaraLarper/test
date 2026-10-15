--[[
			AntiGamingChair | External
			!!! RUN IT OUTSIDE OF THE ACTOR !!!
]]

if not IB_OBFUSCATED then
	getfenv().IB_NO_VIRTUALIZE = function(...)
		return ...
	end
	
	getfenv().IB_ENCSTR = function(...)
		return ...
	end
end

-- Current environment.
local CurrentEnvironment = getfenv()

-- script.Parent = Function (BindableFunction) — external runs in main VM, not Actor VM.
local ExternalBindable = script.Parent

local BindableEvent = (function()
	local ev = script:FindFirstChild("Event")
	if ev and ev:IsA("BindableEvent") then
		return ev
	end
	ev = Instance.new("BindableEvent")
	ev.Name = "Event"
	ev.Parent = script
	return ev
end)()

-- Hide event.
BindableEvent.Parent = nil

-- Hide script.
script.Parent = nil
script.Archivable = false
script.LinkedSource = "rbxassetid://0"

-- Services.
local Players = game:GetService("Players")
local ContentProvider = game:GetService("ContentProvider")
local Selection = game:GetService("Selection")
local ScriptContext = game:GetService("ScriptContext")

local function JobIdIsStudioSession(jobId)
	if type(jobId) ~= "string" then
		return false
	end

	return #jobId == 0 or jobId == "0" or jobId == "00000000-0000-0000-0000-000000000000"
end

local IsStudioFromServer = JobIdIsStudioSession(game.JobId)
local DETECTION_POLL_INTERVAL = 7
local DETECTION_POLL_INTERVAL_30 = 30
local DETECTION_POLL_INTERVAL_60 = 60
local DETECTION_CRASH_DELAY = 5000

-- Current information.
local ylacwillneverpassthis = false
local bypasstogetpatchedinthenext48hours = false
local l2pbeforebypassingbro = false
local howdidyouevenfindthis = false
local wkgethinkshesmart = false
local stopwastingyourtime = false
local yourexecutorsucks = false
local nicetrybutno = false
local browhyicantemulatethis = false
local gottafeelbadman = false
local enjoytheban = false
local zlacstillhavenobank = false
local anticheatgobrr = false
local speedhackerwithnolife = false
local patchedinyourclient = false
local yougotcaughtlmao = false
local whydidyoueventrythis = false
local antikicklmaogotcha = false
local diaryreaderfromwave = false
local nuhuhcantwritehere = false
local yourpcisoverheating = false
local whosetthistraplmao = false
local stopreadingmymail = false
local youaintslick = false
local stopusingotherclients = false
local stopresizingyourlimbs = false
local stopflingingyourself = false
local firetouchdetected = false
local bypassreasonoftheday = 0
local todayssoupoftheday = 0
local grocerylistoftheday = 0
local horoscopeoftheday = 0

local OnTrapTableTrigger = IB_NO_VIRTUALIZE(function()
	for Level = 1, 20 do
		local Success, FunctionEnvironment = pcall(getfenv, Level)

		if not Success then
			continue
		end

		if FunctionEnvironment == CurrentEnvironment then
			continue
		end

		bypasstogetpatchedinthenext48hours = true
	end

	return "<3 chw is watchinn u"
end)

local TrapTable = newproxy(true)
local TrapTableMt = getmetatable(TrapTable)
TrapTableMt.__metatable = "<3 chw is watchinn u"
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

-- Decoy trap tables.
local DecoyTrapTrigger = IB_NO_VIRTUALIZE(function()
	return "<3 chw is watchinn u"
end)

local DecoyTrapTables = {}
local DecoyEnclosedTrapTables = {}
for Index = 1, 3 do
	local DecoyTrap = newproxy(true)
	local DecoyTrapMt = getmetatable(DecoyTrap)
	DecoyTrapMt.__metatable = "<3 chw is watchinn u"
	DecoyTrapMt.__index = DecoyTrapTrigger
	DecoyTrapMt.__newindex = DecoyTrapTrigger
	DecoyTrapMt.__call = DecoyTrapTrigger
	DecoyTrapMt.__concat = DecoyTrapTrigger
	DecoyTrapMt.__unm = DecoyTrapTrigger
	DecoyTrapMt.__add = DecoyTrapTrigger
	DecoyTrapMt.__sub = DecoyTrapTrigger
	DecoyTrapMt.__mul = DecoyTrapTrigger
	DecoyTrapMt.__div = DecoyTrapTrigger
	DecoyTrapMt.__idiv = DecoyTrapTrigger
	DecoyTrapMt.__mod = DecoyTrapTrigger
	DecoyTrapMt.__pow = DecoyTrapTrigger
	DecoyTrapMt.__tostring = DecoyTrapTrigger
	DecoyTrapMt.__eq = DecoyTrapTrigger
	DecoyTrapMt.__lt = DecoyTrapTrigger
	DecoyTrapMt.__le = DecoyTrapTrigger
	DecoyTrapMt.__len = DecoyTrapTrigger
	DecoyTrapMt.__iter = DecoyTrapTrigger
	DecoyTrapTables[Index] = DecoyTrap
	DecoyEnclosedTrapTables[Index] = { [DecoyTrap] = {} }
end

-- Trap argument proxy.
local TrapArg = newproxy(true)
local TrapArgMt = getmetatable(TrapArg)
local function OnTrapArgTrigger()
	whosetthistraplmao = true
end
for _, metamethod in ipairs({ "le", "lt", "eq", "pow", "div", "mul", "sub", "add", "unm", "concat", "call", "index", "newindex" }) do
	TrapArgMt["__" .. metamethod] = OnTrapArgTrigger
end
TrapArgMt.__tostring = function()
	whosetthistraplmao = true
	return ""
end
TrapArgMt.__metatable = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"

-- Metamethod fetchers.
local FetchIndexMetamethod = IB_NO_VIRTUALIZE(function()
	local Metamethod = nil
	xpcall(function()
		return game["__AGC_STOP_TRYING__"]
	end, function()
		Metamethod = debug.info(2, "f")
	end)
	return Metamethod
end)

local FetchNewIndexMetamethod = IB_NO_VIRTUALIZE(function()
	local Metamethod = nil
	xpcall(function()
		game["__AGC_GIVE_UP__"] = TrapTable
	end, function()
		Metamethod = debug.info(2, "f")
	end)
	return Metamethod
end)

local FetchNamecallMetamethod = IB_NO_VIRTUALIZE(function()
	local Metamethod = nil

	xpcall(function()
		game:__AGC_KEEP_TRYING__()
	end, function()
		Metamethod = debug.info(2, "f")
	end)
	return Metamethod
end)

-- Capture originals at startup.
local IndexMetamethod = FetchIndexMetamethod()
local NewIndexMetamethod = FetchNewIndexMetamethod()
local NamecallMetamethod = FetchNamecallMetamethod()
local CapturedGameMetatable = type(getrawmetatable) == "function" and getrawmetatable(game) or nil
local CapturedGameMetatableIndex = type(CapturedGameMetatable) == "table" and rawget(CapturedGameMetatable, "__index")
	or nil
local CapturedGameMetatableNewIndex = type(CapturedGameMetatable) == "table"
		and rawget(CapturedGameMetatable, "__newindex")
	or nil
local CapturedGameMetatableNamecall = type(CapturedGameMetatable) == "table"
		and rawget(CapturedGameMetatable, "__namecall")
	or nil

local AGC_DEBUG_METAMETHOD = false

local AGC_DISABLE_CRASH = false

local METATABLE_HASH_FIELDS = {
	"__index",
	"__newindex",
	"__namecall",
	"__tostring",
	"__type",
	"__metatable",
	"__eq",
	"__call",
	"__len",
	"__mode",
}
local function ComputeMetatableFieldsHash(mt)
	if type(mt) ~= "table" then
		return 0
	end
	local h = 2166136261
	for i, name in ipairs(METATABLE_HASH_FIELDS) do
		local v = rawget(mt, name)
		local s = tostring(v)
		h = bit32.bxor(h, i)
		h = bit32.bor(bit32.lshift(h, 13), bit32.rshift(h, 19))
		for ci = 1, #s do
			h = bit32.bxor(h, string.byte(s, ci))
			h = bit32.bor(bit32.lshift(h, 13), bit32.rshift(h, 19))
		end
	end
	return h
end
local CapturedGameMetatableHash = CapturedGameMetatable and ComputeMetatableFieldsHash(CapturedGameMetatable) or 0

if type(CapturedGameMetatable) == "table" then
	pcall(function()
		if type(setreadonly) == "function" and type(isreadonly) == "function" then
			if not isreadonly(CapturedGameMetatable) then
				setreadonly(CapturedGameMetatable, true)
			end
		end
	end)
end
local CapturedBuiltinRefs = {
	debug_info = debug.info,
	debug_traceback = debug.traceback,
	pcall = pcall,
	xpcall = xpcall,
	getfenv = getfenv,
	getmetatable = getmetatable,
	rawget = rawget,
	rawequal = rawequal,
	coroutine_wrap = coroutine.wrap,
	task_defer = task.defer,
	table_insert = table.insert,
	type_ref = type,
	typeof_ref = typeof,
}



-- Backup remote method references (captured before any hooks can run).
local BackupFireServer = Instance.new("RemoteEvent").FireServer
local BackupInvokeServer = Instance.new("RemoteFunction").InvokeServer

local EXTERNAL_PACKET_PROOF_SLOT = 30
local EXTERNAL_PACKET_COUNTER_SLOT = 31
local EXTERNAL_PACKET_PROOF_VERSION_SLOT = 32
local EXTERNAL_PACKET_PROOF_VERSION = IB_ENCSTR("agc_extproof_v1")
local EXTERNAL_PACKET_RAN_MASK_SLOT = 33
local EXTERNAL_PACKET_DIRTY_MASK_SLOT = 34
local EXTERNAL_PACKET_REASON_DIGEST_SLOT = 35
local EXTERNAL_PACKET_PREVIOUS_PROOF_SLOT = 36
local EXTERNAL_PACKET_DECOY_FIRST_SLOT = 37
local EXTERNAL_PACKET_DECOY_LAST_SLOT = 48
local EXTERNAL_PACKET_CANARY_SLOT_A = 38
local EXTERNAL_PACKET_CANARY_SLOT_B = 43
local EXTERNAL_PACKET_CANARY_SLOT_C = 46
local RAN_EXTERNAL_INVOKE = 1
local RAN_TRAP_TABLE = 2
local RAN_METAMETHOD_REFS = 4
local RAN_METATABLE_IDENTITY = 8
local RAN_BUILTIN_INTEGRITY = 16
local RAN_SENTINEL_CANARY = 32
local RAN_GLOBAL_CONTAMINATION = 64
local RAN_CSTACK = 128
local RAN_PACKET_BUILD = 256
local RAN_PACKET_PROOF = 512
local LocalPlaceId = game.PlaceId
local ExternalPacketCounter = 0
local ExternalPreviousProof = 0
local CrashScheduled = false

local SentinelCanaries = {}
local SentinelCanaryContainer = {}
local SentinelCrossTickTokens = {}
for Index = 1, 32 do
	local Sentinel = {
		[1] = false,
		["_pa" .. Index] = math.random(),
		["_pb" .. Index] = (Index % 2 == 0),
		["_pc" .. Index] = "agc_pad_" .. Index,
	}
	SentinelCanaries[Index] = Sentinel
	SentinelCanaryContainer[Index] = Sentinel
end

for Decoy = 1, 18 do
	SentinelCanaryContainer["_dec_n_" .. Decoy] = math.random() * Decoy
	SentinelCanaryContainer["_dec_s_" .. Decoy] = "agc_decoy_" .. Decoy
	if Decoy % 3 == 0 then
		SentinelCanaryContainer["_dec_t_" .. Decoy] = { foo = Decoy, bar = "x", baz = math.random() }
	end
end

local SentinelTokenPool = {}
local SentinelCrossPoolA = {}
local SentinelCrossPoolB = {}
for i = 1, 32 do
	SentinelTokenPool[i] = {}
	SentinelCrossPoolA[i] = {}
	SentinelCrossPoolB[i] = {}
end
local SentinelCrossUseA = true

local HandshakeFlipCanaries = {
	{ [1] = false, ["_hpa"] = math.random(), ["_hpb"] = "agc_hf_1", ["_hpc"] = false },
	{ [1] = false, ["_hpa"] = math.random(), ["_hpb"] = "agc_hf_2", ["_hpc"] = true },
	{ [1] = false, ["_hpa"] = math.random(), ["_hpb"] = "agc_hf_3", ["_hpc"] = false },
}
local HandshakeFlipCanaryNext = { 0, 0, 0 }
local HandshakeFlipCanaryResetPending = { false, false, false }

local AGC_DEBUG_EXTERNAL_CANARY = false
local DecoyReadableTelemetry = {
	"FrameWarmupProbe",
	"TextureQueueAudit",
	"InputLatencySample",
	"ViewportScaleGuard",
	"MaterialCachePulse",
	"AudioBudgetTrace",
	"LocaleMirrorProbe",
	"AvatarWarmCache",
}

local DecoyViolationTables = {}
for Index, Label in ipairs(DecoyReadableTelemetry) do
	DecoyViolationTables[Label] = {
		[1] = false,
		["_dva" .. Index] = math.random(),
		["_dvb" .. Index] = "agc_dv_" .. Label,
		["_dvc" .. Index] = (Index % 2 == 1),
	}
end

local DetectionConfig = nil
local DetectionsStarted = false
local ExternalDetectionThreads = {}
local ExternalDetectionWatchdogStarted = false

local function RegisterExternalDetectionThread(Name, Thread)
	if type(Thread) == "thread" then
		ExternalDetectionThreads[Name] = Thread
	end
	return Thread
end

local DeferExternalDetectionIndex = 0

local function DeferExternalDetection(Name, Callback)
	DeferExternalDetectionIndex = DeferExternalDetectionIndex + 1
	local Offset = ((DeferExternalDetectionIndex - 1) % 35) * 0.2
	local Thread = task.defer(function()
		task.wait(Offset)
		Callback()
	end)
	return RegisterExternalDetectionThread(Name, Thread)
end

local function EnsureExternalDetectionWatchdog()
	if ExternalDetectionWatchdogStarted then
		return
	end

	ExternalDetectionWatchdogStarted = true
	task.defer(function()
		while task.wait(DETECTION_POLL_INTERVAL + (math.random() * 2 - 1) * 0.3) do
			for Name, Thread in pairs(ExternalDetectionThreads) do
				local Success, Status = pcall(coroutine.status, Thread)
				if not Success or Status == "dead" then
					ylacwillneverpassthis = true
					bypassreasonoftheday = IB_ENCSTR("loop_dead:") .. tostring(Name)
					ExternalDetectionThreads[Name] = nil
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

local function FoldExternalProofBoolean(Fold, Offset, Boolean)
	local Lane = Boolean and (Offset * 37 + 81) or (Offset * 19 + 45)
	return bit32.bxor(bit32.lrotate(Fold, 5), Lane)
end

local function ExternalProofText(Value)
	if type(Value) == "number" then
		return "n" .. tostring(math.floor(Value))
	end
	if type(Value) == "string" then
		return "s" .. Value
	end
	return ""
end

local function FoldExternalProofString(Fold, Offset, Value)
	local Text = ExternalProofText(Value)
	local Lane = bit32.bxor(#Text * (Offset + 13), string.byte(Text, 1) or 0)
	return bit32.bxor(bit32.lrotate(Fold, 3), Lane)
end

local function FoldExternalProofNumber(Fold, Value)
	return bit32.bxor(bit32.lrotate(Fold, 7), math.floor(tonumber(Value) or 0))
end

local function ComputeExternalReasonDigest(Reason1, Reason2, Reason3, Reason4)
	local Digest = 1831565813
	local Reasons = { Reason1, Reason2, Reason3, Reason4 }

	for Index, Reason in ipairs(Reasons) do
		local Text = ExternalProofText(Reason)
		Digest = bit32.bxor(bit32.lrotate(Digest, 5), #Text + Index * 131)
		for Offset = 1, #Text do
			Digest = bit32.bxor(bit32.lrotate(Digest, 3), string.byte(Text, Offset) + Offset * Index)
		end
	end

	return Digest
end

local function ComputeExternalContextDigest(
	Challenge,
	ProofSeed,
	Counter,
	PreviousProof,
	ConfigMask1,
	ConfigMask2,
	UserId,
	PlaceId,
	JobId,
	ProofVersion
)
	local Digest = 1283068633
	Digest = FoldExternalProofNumber(Digest, Challenge)
	Digest = FoldExternalProofNumber(Digest, ProofSeed)
	Digest = FoldExternalProofNumber(Digest, Counter)
	Digest = FoldExternalProofNumber(Digest, PreviousProof)
	Digest = FoldExternalProofNumber(Digest, ConfigMask1)
	Digest = FoldExternalProofNumber(Digest, ConfigMask2)
	Digest = FoldExternalProofNumber(Digest, UserId)
	Digest = FoldExternalProofNumber(Digest, PlaceId)
	Digest = FoldExternalProofString(Digest, 41, JobId)
	Digest = FoldExternalProofString(Digest, 42, ProofVersion)
	return Digest
end

local function EncodeExternalPacketProof(
	Challenge,
	ProofSeed,
	Counter,
	PreviousProof,
	Fold,
	RanMask,
	DirtyMask,
	ReasonDigest,
	ContextDigest
)
	local Base = bit32.bxor(
		bit32.bxor(math.floor(Challenge), math.floor(ProofSeed)),
		bit32.bxor(math.floor(Counter), math.floor(PreviousProof))
	)
	Base = bit32.bxor(Base, Fold)
	Base = bit32.bxor(Base, RanMask)
	Base = bit32.bxor(Base, DirtyMask)
	Base = bit32.bxor(Base, ReasonDigest)
	Base = bit32.bxor(Base, ContextDigest)
	return (bit32.bxor(Base, 23063) * 97 - 431) / 29.75
end

local function EncodeExternalDecoyInteger(Challenge, Offset, Integer)
	return (bit32.bxor((Challenge - (Integer * 420)) * (Offset - (Offset / 1.425)), 969) * 120 - 422) / 144.2560
end

local function AddExternalPacketDecoys(Packet, Challenge, ProofSeed, Counter, RanMask, DirtyMask, ReasonDigest)
	local DecoyState = bit32.bxor(
		bit32.bxor(math.floor(Challenge), math.floor(ProofSeed)),
		bit32.bxor(math.floor(Counter), bit32.lrotate(RanMask, 3))
	)
	DecoyState = bit32.bxor(DecoyState, bit32.lrotate(DirtyMask, 7))
	DecoyState = bit32.bxor(DecoyState, ReasonDigest)

	local DecoyCount = 0
	for Slot = EXTERNAL_PACKET_DECOY_FIRST_SLOT, EXTERNAL_PACKET_DECOY_LAST_SLOT do
		if
			Slot == EXTERNAL_PACKET_CANARY_SLOT_A
			or Slot == EXTERNAL_PACKET_CANARY_SLOT_B
			or Slot == EXTERNAL_PACKET_CANARY_SLOT_C
		then
			continue
		end
		DecoyCount = DecoyCount + 1
		DecoyState = bit32.bxor(bit32.lrotate(DecoyState, 5), Slot * 17881)
		local LooksDirty = bit32.band(DecoyState, 7) == bit32.band(Slot, 7)
		Packet[Slot] = EncodeExternalDecoyInteger(Challenge, Slot, LooksDirty and 1.1 or 1.0)
	end
end

local function MarkSentinelCanaryTampered(Reason)
	yougotcaughtlmao = true
	ylacwillneverpassthis = true
	bypassreasonoftheday = Reason
end

local function ComputeHandshakeFlipInterval(Challenge, ProofSeed, Counter, PreviousProof, Lane)
	local Seed = bit32.bxor(math.floor(Challenge), bit32.lrotate(math.floor(tonumber(ProofSeed) or 0), Lane + 3))
	Seed = bit32.bxor(Seed, bit32.lrotate(math.floor(tonumber(Counter) or 0), Lane * 5))
	Seed = bit32.bxor(Seed, math.floor(tonumber(PreviousProof) or 0) % 4294967296)
	Seed = bit32.bxor(Seed, Lane * 104729)
	return 1 + (bit32.band(Seed, 2147483647) % 4)
end

local function AdvanceHandshakeFlipCanaries(Challenge, ProofSeed, Counter, PreviousProof)
	local WriteOk = pcall(function()
		for Lane, Canary in ipairs(HandshakeFlipCanaries) do
			local NextFlip = HandshakeFlipCanaryNext[Lane]
			if type(NextFlip) ~= "number" or NextFlip <= 0 then
				NextFlip = Counter + ComputeHandshakeFlipInterval(Challenge, ProofSeed, Counter, PreviousProof, Lane)
			end

			if HandshakeFlipCanaryResetPending[Lane] then
				Canary[1] = false
				HandshakeFlipCanaryResetPending[Lane] = false
				NextFlip = Counter + ComputeHandshakeFlipInterval(Challenge, ProofSeed, Counter, PreviousProof, Lane)
			elseif Counter >= NextFlip then
				Canary[1] = true
				HandshakeFlipCanaryResetPending[Lane] = true
			end

			HandshakeFlipCanaryNext[Lane] = NextFlip
		end
	end)

	local CanaryA = rawget(HandshakeFlipCanaries[1], 1)
	local CanaryB = rawget(HandshakeFlipCanaries[2], 1)
	local CanaryC = rawget(HandshakeFlipCanaries[3], 1)
	if not WriteOk or type(CanaryA) ~= "boolean" or type(CanaryB) ~= "boolean" or type(CanaryC) ~= "boolean" then
		MarkSentinelCanaryTampered(16690)
		return false, false, false
	end

	return CanaryA, CanaryB, CanaryC
end

local function CheckSentinelCanaries()
	local _ = DecoyViolationTables[DecoyReadableTelemetry[1]]
	if type(SentinelCanaryContainer) ~= "table" or getmetatable(SentinelCanaryContainer) ~= nil then
		MarkSentinelCanaryTampered(16641)
		return
	end

	local CrossPool = SentinelCrossUseA and SentinelCrossPoolA or SentinelCrossPoolB
	SentinelCrossUseA = not SentinelCrossUseA

	for idx, Sentinel in ipairs(SentinelCanaries) do
		if type(Sentinel) ~= "table" then
			MarkSentinelCanaryTampered(16642)
			return
		end
		if rawget(Sentinel, 1) ~= false or getmetatable(Sentinel) ~= nil then
			MarkSentinelCanaryTampered(16643)
			return
		end

		local ExpectedToken = SentinelCrossTickTokens[idx]
		if ExpectedToken ~= nil and rawget(Sentinel, 3) ~= ExpectedToken then
			MarkSentinelCanaryTampered(16692)
			return
		end

		local Token = SentinelTokenPool[idx]
		Sentinel[2] = Token
		if rawget(Sentinel, 2) ~= Token then
			MarkSentinelCanaryTampered(16644)
			return
		end
		rawset(Sentinel, 2, nil)

		local CrossToken = CrossPool[idx]
		SentinelCrossTickTokens[idx] = CrossToken
		rawset(Sentinel, 3, CrossToken)
	end
end

-- start detections (from the config reading)

local function Startl2pbeforebypassingbroCheck()
	DeferExternalDetection(IB_ENCSTR("getmetatable_spoof"), function()
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			local ok, _ = pcall(function()
				if not rawequal(getmetatable, getfenv().getmetatable) then
					l2pbeforebypassingbro = true
					return
				end
				local probe = newproxy(true)
				getmetatable(probe).__len = function(tbl)
					return (rawequal(tbl, probe) and 2 or 0)
				end
				if #probe ~= 2 then
					l2pbeforebypassingbro = true
				end
			end)
			if not ok then
				l2pbeforebypassingbro = true
			end
		end
	end)
end

local function StartSelectionCheck()
	Selection.SelectionChanged:Connect(function()
		if IsStudioFromServer then
			return
		end
		howdidyouevenfindthis = true
	end)
end

local function StartRemoteHookCheck()
	DeferExternalDetection(IB_ENCSTR("remote_hooks"), function()
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			local testEvent = Instance.new("RemoteEvent")
			local testFunc = Instance.new("RemoteFunction")
			if testEvent.FireServer ~= BackupFireServer then
				wkgethinkshesmart = true
			end
			if testFunc.InvokeServer ~= BackupInvokeServer then
				stopwastingyourtime = true
			end
			testEvent:Destroy()
			testFunc:Destroy()
		end
	end)
end

local function StartA15Check()
	local RunA15Probe = IB_NO_VIRTUALIZE(function()
		local remote = Instance.new("RemoteEvent")
		local proxy = newproxy()

		pcall(function()
			remote:FireServer(proxy)
		end)
		remote:Destroy()

		local ref = setmetatable({ {}, proxy }, { __mode = "kv" })
		proxy = nil

		while ref[1] do
			task.wait()
		end

		if ref[2] then
			stopreadingmymail = true
		end
	end)
	local _name = IB_ENCSTR("remote_spy")
	DeferExternalDetection(
		_name,
		IB_NO_VIRTUALIZE(function()
			while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
				pcall(function()
					RunA15Probe()

					local triggered = false
					local probe = setmetatable({}, {
						__tostring = function()
							triggered = true
						end,
						__index = function()
							triggered = true
						end,
					})

					local re = Instance.new("RemoteEvent")
					pcall(function()
						hookfunction(
							checkcaller,
							newcclosure(function()
								return false
							end)
						)
						re:FireServer(probe)
					end)
					re:Destroy()

					if triggered then
						stopreadingmymail = true
						return
					end

					local nc = getrawmetatable(game).__namecall
					local _, trace = pcall(nc, probe, probe)
					if type(trace) == "string" then
						local s, e = trace:find("%((%d+)%)")
						if not s then
							stopreadingmymail = true
						else
							local n = tonumber(trace:sub(s + 1, e - 1))
							if n and n > 10 then
								stopreadingmymail = true
							end
						end
					end
				end)
			end
		end)
	)
end

	local function StartTostringMemoryCheck()
	DeferExternalDetection(IB_ENCSTR("tostring_memory"), function()
		while task.wait(DETECTION_POLL_INTERVAL_60 + (math.random() * 2 - 1) * 2.0) do
			pcall(function()
				local s = tostring(function() end)
				if s:find("00000000") then
					yourexecutorsucks = true
				end
			end)
		end
	end)
end

local function StartContentProviderCheck()
	task.defer(function()
		task.wait(DETECTION_POLL_INTERVAL_60 + (math.random() * 2 - 1) * 2.0)

		local AssetService = game:GetService("AssetService")
		local CoreGui = game:GetService("CoreGui")

		local FakeDecal = Instance.new("Decal")
		FakeDecal.Texture = "rbxassetid://9486897234"
		FakeDecal.Parent = AssetService

		local function OnPreload(Asset)
			if type(Asset) == "string" then
				if Asset == "rbxassetid://9486897234" then
					return
				end
			end
		end

		local ok = pcall(function()
			ContentProvider["preloadAsync"](ContentProvider, { CoreGui, AssetService }, OnPreload)
		end)

		FakeDecal:Destroy()

		if not ok then
			return
		end

		task.wait(DETECTION_POLL_INTERVAL_60 + (math.random() * 2 - 1) * 2.0)
		browhyicantemulatethis = true
	end)
end

local function StartB07Check()
	DeferExternalDetection(IB_ENCSTR("rlocked_probe"), function()
		while task.wait(DETECTION_POLL_INTERVAL_60 + (math.random() * 2 - 1) * 2.0) do
			local ok = pcall(function()
				return Players.LocalPlayer.GetFullName(Players.LocalPlayer)
			end)
			if not ok then
				enjoytheban = true
			end
		end
	end)
end

local function StartB08Check()
	DeferExternalDetection(IB_ENCSTR("metamethod_debuginfo"), function()
	local metamethods = { nil, nil, nil }
	while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
		metamethods[1] = FetchIndexMetamethod()
		metamethods[2] = FetchNewIndexMetamethod()
		metamethods[3] = FetchNamecallMetamethod()

			for i, mm in ipairs(metamethods) do
				if mm then
					local src, ln, nm, ar = debug.info(mm, "slna")
					if src ~= "[C]" or ln ~= -1 or (nm ~= "" and nm ~= nil) or ar ~= 0 then
						zlacstillhavenobank = true
						horoscopeoftheday = 16644 + i
					end
				end
			end
		end
	end)
end

local function StartErrorMessageCheck()
	local CapturedErrors = nil

	local function CaptureError(fn)
		local ok, err = pcall(fn)
		if ok then
			return "OK"
		end
		return tostring(err)
	end

	local function GetErrorSignatures()
		return {
			CaptureError(function()
				return game["khaled_is_watching_give_up"]
			end),
			CaptureError(function()
				game["khaled_is_watching_give_up"] = true
			end),
			CaptureError(function()
				return game["khaled_is_watching_give_up"](game)
			end),
		}
	end

	DeferExternalDetection(IB_ENCSTR("error_message"), function()
		task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0)
		CapturedErrors = GetErrorSignatures()

		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			local current = GetErrorSignatures()
			for i = 1, #CapturedErrors do
				if current[i] ~= CapturedErrors[i] then
					anticheatgobrr = true
				end
			end
		end
	end)
end

local function StartA16Check()
	DeferExternalDetection(IB_ENCSTR("physics_fps"), function()
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			local ok, err = pcall(function()
				return workspace["GetRealPhysicsFPS"](game)
			end)
			if ok then
				speedhackerwithnolife = true
			end
			if not ok and err and not tostring(err):find("Expected") then
				speedhackerwithnolife = true
			end
		end
	end)
end

local function StartSettingsCheck()
	DeferExternalDetection(IB_ENCSTR("settings_call"), function()
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			if not IsStudioFromServer and pcall(settings) then
				patchedinyourclient = true
			end
		end
	end)
end

-- Removed: StartGlobalContaminationCheck (dead code)

local function CheckBuiltinReferenceIntegrity()
	if debug.info ~= CapturedBuiltinRefs.debug_info then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16648
		return
	end
	if debug.traceback ~= CapturedBuiltinRefs.debug_traceback then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16649
		return
	end
	if pcall ~= CapturedBuiltinRefs.pcall then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16650
		return
	end
	if xpcall ~= CapturedBuiltinRefs.xpcall then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16651
		return
	end
	if getfenv ~= CapturedBuiltinRefs.getfenv then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16652
		return
	end
	if getmetatable ~= CapturedBuiltinRefs.getmetatable then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16653
		return
	end
	if rawget ~= CapturedBuiltinRefs.rawget then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16654
		return
	end
	if rawequal ~= CapturedBuiltinRefs.rawequal then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16655
		return
	end
	if coroutine.wrap ~= CapturedBuiltinRefs.coroutine_wrap then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16656
		return
	end
	if task.defer ~= CapturedBuiltinRefs.task_defer then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16657
		return
	end
	if table.insert ~= CapturedBuiltinRefs.table_insert then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16690
		return
	end
	if debug.info(table.insert, "s") ~= "[C]" then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16692
		return
	end
	if type ~= CapturedBuiltinRefs.type_ref then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16694
		return
	end
	if debug.info(type, "s") ~= "[C]" then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16695
		return
	end
	if typeof ~= CapturedBuiltinRefs.typeof_ref then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16696
		return
	end
	if debug.info(typeof, "s") ~= "[C]" then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16697
	end
end

local function CheckBuiltinBehavioralProbes()
	if string.byte("A", 1) ~= 65 then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16700
		return
	end
	if string.byte("\0", 1) ~= 0 then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16701
		return
	end
	if string.char(65) ~= "A" then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16702
		return
	end
	if string.char(0) ~= "\0" then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16703
		return
	end
	if bit32.bxor(1, 2) ~= 3 then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16704
		return
	end
	if bit32.bxor(255, 127) ~= 128 then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16705
	end
end

local function CheckDeadCoroutineResumeError()
	local thread = coroutine.create(function() end)

	local resumed = coroutine.resume(thread)
	if not resumed or coroutine.status(thread) ~= "dead" then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16691
		return
	end

	local resumedDead, deadErr = coroutine.resume(thread)
	if resumedDead or not tostring(deadErr):find("cannot resume dead coroutine", 1, true) then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16691
	end
end

local function StartwhydidyoueventrythisCheck()
	local _name = IB_ENCSTR("fenv_mismatch")
	DeferExternalDetection(_name, IB_NO_VIRTUALIZE(function()
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			if not IsStudioFromServer then
				pcall(function()
					local fenv0 = getfenv(0)
					local fenv1 = getfenv(1)
					if not rawequal(fenv0.script, fenv1.script) then
						whydidyoueventrythis = true
					end
				end)
			end
		end
	end))
end

local function StartKickHookCheck()
	DeferExternalDetection(IB_ENCSTR("kick_hook"), function()
		local lp = Players.LocalPlayer
		if not lp then return end
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			local ok1, _ = pcall(function()
				lp.Kick(workspace, "khaled_sees_all")
			end)
			local ok2, _ = pcall(function()
				workspace:Kick("khaled_sees_all")
			end)
			local ok3, err3 = pcall(function()
				return lp["KicK"]
			end)

			if ok1 or ok2 then
				antikicklmaogotcha = true
			end
			if ok3 and type(err3) == "function" then
				antikicklmaogotcha = true
			end
		end
	end)
end

local function StartLogHistoryHookCheck()
	DeferExternalDetection(IB_ENCSTR("loghistory_ext"), function()
		local LogService = game:GetService("LogService")
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			local ok1, _ = pcall(function()
				return LogService["GetLogHistory"](workspace)
			end)
			local ok2, _ = pcall(function()
				return workspace:GetLogHistory()
			end)
			if ok1 or ok2 then
				diaryreaderfromwave = true
			end
		end
	end)
end

local ASSET_IDS_TO_CHECK = {
	[1] = "rbxassetid://472635937",  -- Dex Explorer List Icon
	[2] = "rbxassetid://476354004",  -- Dex Explorer About Icon
	[3] = "rbxassetid://1352543873", -- Infinite Yield Logo
	[4] = "rbxassetid://91685317120520", -- Cobalt Logo
	[5] = "rbxassetid://4031889928", -- Discord UI Library
	[6] = "rbxassetid://8343875413", -- Hydra UI Library
}

local function StartForeignGUICheck()
	DeferExternalDetection(IB_ENCSTR("foreign_gui"), function()
		while task.wait(DETECTION_POLL_INTERVAL_60 + (math.random() * 2 - 1) * 2.0) do
			for _, assetId in ipairs(ASSET_IDS_TO_CHECK) do
				local ok, status = pcall(ContentProvider.GetAssetFetchStatus, ContentProvider, assetId)
				if ok and status == Enum.AssetFetchStatus.Success then
					stopusingotherclients = true
				end
			end
		end
	end)
end

local _name = IB_ENCSTR("enum_metamethod")
local StartEnumMetamethodCheck = IB_NO_VIRTUALIZE(function()
	local BaseEnumIndexMm = nil
	local BaseEnumNamecallMm = nil

	xpcall(function()
		local _ = Enum.HumanoidStateType["____________"]
	end, function()
		BaseEnumIndexMm = debug.info(2, "f")
	end)

	xpcall(function()
		Enum.HumanoidStateType:____________()
	end, function()
		BaseEnumNamecallMm = debug.info(2, "f")
	end)

	DeferExternalDetection(_name, function()
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			pcall(function()
				local mm = nil

				xpcall(function()
					local _ = Enum.HumanoidStateType["____________"]
				end, function()
					mm = debug.info(2, "f")
				end)

				if not mm then
					ylacwillneverpassthis = true
					bypassreasonoftheday = 16658
					return
				end

				if BaseEnumIndexMm and mm ~= BaseEnumIndexMm then
					ylacwillneverpassthis = true
					bypassreasonoftheday = 16659
					return
				end

				if debug.info(mm, "s") ~= "[C]" or debug.info(mm, "l") ~= -1 or debug.info(mm, "a") ~= 0 then
					ylacwillneverpassthis = true
					bypassreasonoftheday = 16660
					return
				end

				local ok = pcall(mm, Enum.HumanoidStateType)
				if ok then
					ylacwillneverpassthis = true
					bypassreasonoftheday = 16661
					return
				end

				if not (Enum.HumanoidStateType.Running == Enum.HumanoidStateType.Running) then
					ylacwillneverpassthis = true
					bypassreasonoftheday = 16662
					return
				end
			end)

			pcall(function()
				local mm = nil

			xpcall(function()
				Enum.HumanoidStateType:____________()
			end, function()
				mm = debug.info(2, "f")
			end)

				if not mm then
					youaintslick = true
					todayssoupoftheday = 16663
					return
				end

				if BaseEnumNamecallMm and mm ~= BaseEnumNamecallMm then
					youaintslick = true
					todayssoupoftheday = 16664
					return
				end

				if debug.info(mm, "s") ~= "[C]" or debug.info(mm, "l") ~= -1 or debug.info(mm, "a") ~= 0 then
					youaintslick = true
					todayssoupoftheday = 16665
					return
				end
			end)
		end
	end)
end)

local function StartProtectFuncCheck()
	local function monitorClosure(fn)
		if type(fn) ~= "function" then
			return
		end
		local FunctionName = debug.info(fn, "n")
		if FunctionName == "" or FunctionName == nil then
			FunctionName = tostring(fn)
		end
		if debug.info(fn, "s") ~= "[C]" then
			return
		end

		local _name = IB_ENCSTR("protect_func:") .. tostring(FunctionName)
		DeferExternalDetection(
			_name,
			IB_NO_VIRTUALIZE(function()
				while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
					if
						type(fn) ~= "function"
						or debug.info(fn, "s") ~= "[C]"
						or debug.info(fn, "l") ~= -1
						or debug.info(fn, "a") ~= 0
					then
						ylacwillneverpassthis = true
						bypassreasonoftheday = 16666
					end
				end
			end)
		)
	end

	pcall(monitorClosure, game.IsA)
	pcall(monitorClosure, game.FindFirstChild)
	pcall(monitorClosure, game.FindFirstChildOfClass)
	pcall(monitorClosure, debug.info)
	pcall(monitorClosure, debug.traceback)
end

local function StartIndexMetamethodCheck()
	DeferExternalDetection(IB_ENCSTR("index_metamethod"), function()
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			pcall(function()
				local idxMm = FetchIndexMetamethod()
				if not idxMm then
					return
				end

				local suc1, err1 = pcall(function()
					return idxMm()
				end)
				if
					suc1
					or (
						not tostring(err1):find("missing argument #1") and not tostring(err1):find(
							"invalid argument #1"
						)
					)
				then
					ylacwillneverpassthis = true
					bypassreasonoftheday = 16667
					return
				end

				local suc2, err2 = pcall(function()
					return idxMm(game)
				end)
				if suc2 or not tostring(err2):find("missing argument #2") then
					ylacwillneverpassthis = true
					bypassreasonoftheday = 16668
					return
				end

				local suc3, err3 = pcall(function()
					return idxMm(nil, "Parent")
				end)
				if suc3 or not tostring(err3):find("invalid argument #1") then
					ylacwillneverpassthis = true
					bypassreasonoftheday = 16669
					return
				end

				local suc4, val = pcall(function()
					return idxMm(game.Lighting, "TimeOfDay")
				end)
				if not suc4 or type(val) ~= "string" then
					ylacwillneverpassthis = true
					bypassreasonoftheday = 16670
					return
				end

				local argCount, isVariadic = debug.info(idxMm, "a")
				if argCount ~= 0 or not isVariadic then
					ylacwillneverpassthis = true
					bypassreasonoftheday = 16671
					return
				end

				local idxName = debug.info(idxMm, "n")
				if idxName ~= "" and idxName ~= nil then
					ylacwillneverpassthis = true
					bypassreasonoftheday = 16672
					return
				end
			end)
		end
	end)

	DeferExternalDetection(IB_ENCSTR("namecall_metamethod"), function()
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			pcall(function()
				local ncMm = FetchNamecallMetamethod()
				if not ncMm then
					return
				end

				local suc1, err1 = pcall(function()
					ncMm()
					return true
				end)
				if
					suc1
					or type(err1) ~= "string"
					or (not err1:find("missing argument #1") and not err1:find("invalid argument #1"))
				then
					youaintslick = true
					todayssoupoftheday = 16673
					return
				end

				local suc2, val2 = pcall(function()
					return workspace:IsA("Workspace")
				end)
				if not suc2 or val2 ~= true then
					youaintslick = true
					todayssoupoftheday = 16674
					return
				end

				local ncName = debug.info(ncMm, "n")
				if ncName ~= "" and ncName ~= nil then
					youaintslick = true
					todayssoupoftheday = 16675
					return
				end
			end)
		end
	end)

	DeferExternalDetection(IB_ENCSTR("newindex_metamethod"), function()
		while task.wait(DETECTION_POLL_INTERVAL_30 + (math.random() * 2 - 1) * 1.0) do
			pcall(function()
				local niMm = FetchNewIndexMetamethod()
				if not niMm then
					return
				end

				local suc1, err1 = pcall(function()
					niMm()
					return true
				end)
				if suc1 or type(err1) ~= "string" or not err1:find("missing argument #1") then
					nuhuhcantwritehere = true
					grocerylistoftheday = 16676
					return
				end

				local suc2, err2 = pcall(function()
					niMm(game)
					return true
				end)
				if suc2 or type(err2) ~= "string" or not err2:find("missing argument #2") then
					nuhuhcantwritehere = true
					grocerylistoftheday = 16677
					return
				end

				local suc3, err3 = pcall(function()
					niMm(nil, "WalkSpeed", 17)
					return true
				end)
				if suc3 or type(err3) ~= "string" or not err3:find("invalid argument #1") then
					nuhuhcantwritehere = true
					grocerylistoftheday = 16678
					return
				end

				local probe = Instance.new("BoolValue")
				local extra
				local suc4, err4 = pcall(function()
					extra = niMm(probe, "Name", "what_are_you_doing_here")
				end)
				local probeName = probe.Name
				probe:Destroy()
				if (not suc4) or extra ~= nil or err4 ~= nil or probeName ~= "what_are_you_doing_here" then
					nuhuhcantwritehere = true
					grocerylistoftheday = 16679
					return
				end

				local argCount, isVariadic = debug.info(niMm, "a")
				if argCount ~= 0 or not isVariadic then
					nuhuhcantwritehere = true
					grocerylistoftheday = 16680
					return
				end

				local niName = debug.info(niMm, "n")
				if niName ~= "" and niName ~= nil then
					nuhuhcantwritehere = true
					grocerylistoftheday = 16681
					return
				end
			end)
		end
	end)
end

local R6_LIMBS = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg"}
local R15_LIMBS = {"Head", "UpperTorso", "LowerTorso", "LeftUpperArm", "LeftLowerArm", "LeftHand", "RightUpperArm", "RightLowerArm", "RightHand", "LeftUpperLeg", "LeftLowerLeg", "LeftFoot", "RightUpperLeg", "RightLowerLeg", "RightFoot"}

local function StartLimbResizeCheck()
	local limbConnections = {}
	local seenLimbs = {}

	local function onCharacterAdded(character)
		for _, conn in pairs(limbConnections) do
			conn:Disconnect()
		end
		table.clear(limbConnections)
		table.clear(seenLimbs)

		local humanoid = character:FindFirstChild("Humanoid")
		if not humanoid then
			return
		end

		local limbNames = (humanoid.RigType == Enum.HumanoidRigType.R15) and R15_LIMBS or R6_LIMBS

		for _, limbName in ipairs(limbNames) do
			local part = character:FindFirstChild(limbName)
			if part and part:IsA("BasePart") then
				local originalSize = part.Size
				limbConnections[limbName] = part:GetPropertyChangedSignal("Size"):Connect(function()
					local currentSize = part.Size
					if (currentSize - originalSize).Magnitude > 0.001 then
						stopresizingyourlimbs = true
					end
				end)
			end
		end

		for _, child in ipairs(character:GetChildren()) do
			if child:IsA("BasePart") then
				seenLimbs[child.Name] = (seenLimbs[child.Name] or 0) + 1
				if seenLimbs[child.Name] > 1 then
					stopresizingyourlimbs = true
				end
			end
		end

		limbConnections["_childAdded"] = character.ChildAdded:Connect(function(child)
			if child:IsA("BasePart") then
				seenLimbs[child.Name] = (seenLimbs[child.Name] or 0) + 1
				if seenLimbs[child.Name] > 1 then
					stopresizingyourlimbs = true
				end
			end
		end)
	end

	local lp = Players.LocalPlayer
	if not lp then return end
	if lp.Character then
		onCharacterAdded(lp.Character)
	end
	lp.CharacterAdded:Connect(onCharacterAdded)
end

local function StartAntiFlingCheck()
	local rs = game:GetService("RunService")
	local angularCount = 0
	local linearCount = 0
	rs.Stepped:Connect(function()
		local lp = Players.LocalPlayer
		if not lp then return end
		local character = lp.Character
		if not character then
			angularCount = 0
			linearCount = 0
			return
		end

		local root = character:FindFirstChild("HumanoidRootPart")
		if not root then
			angularCount = 0
			linearCount = 0
			return
		end

		local angularVel = root.AssemblyAngularVelocity
		if angularVel and angularVel.Magnitude > 150 then
			angularCount += 1
			if angularCount >= 3 then
				stopflingingyourself = true
			end
		else
			angularCount = 0
		end

		local linearVel = root.AssemblyLinearVelocity
		if linearVel and linearVel.Magnitude > 250 then
			linearCount += 1
			if linearCount >= 3 then
				stopflingingyourself = true
			end
		else
			linearCount = 0
		end
	end)
end

local FIRETOUCH_MAX_DIST = 6
local FireTouchCooldowns = {}
local FIRETOUCH_COOLDOWN_TIME = 0.5
local FireTouchLimbConns = {}

local function StartFireTouchInterestCheck()
	local function onCharacterAdded(char)
		for _, conn in pairs(FireTouchLimbConns) do
			conn:Disconnect()
		end
		table.clear(FireTouchLimbConns)
		table.clear(FireTouchCooldowns)

		local root = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso")

		local function onLimbTouched(limb, hit)
			if not hit or not limb then return end
			local model = hit:FindFirstAncestorOfClass("Model")
			if model and model:FindFirstChildOfClass("Humanoid") then return end
			if not root then return end

			local closest = hit:GetClosestPointOnSurface(root.Position)
			local dist = (closest - root.Position).Magnitude
			if dist <= FIRETOUCH_MAX_DIST then return end

			local key = hit:GetFullName()
			local now = os.clock()
			if FireTouchCooldowns[key] and now - FireTouchCooldowns[key] < FIRETOUCH_COOLDOWN_TIME then return end
			FireTouchCooldowns[key] = now

			firetouchdetected = true
		end

		local function hookPart(part)
			if not part:IsA("BasePart") then return end
			if part.Name == "HumanoidRootPart" or part.Name == "Torso" then return end
			FireTouchLimbConns[part] = part.Touched:Connect(function(hit)
				onLimbTouched(part, hit)
			end)
		end

		for _, child in char:GetChildren() do
			hookPart(child)
		end
		FireTouchLimbConns["_childAdded"] = char.ChildAdded:Connect(hookPart)
	end

	local lp = Players.LocalPlayer
	if not lp then return end
	local char = lp.Character
	if char then
		onCharacterAdded(char)
	end
	lp.CharacterAdded:Connect(onCharacterAdded)
end

-- Launch all enabled detections (called once on first heartbeat).
local function LaunchDetections(cfg)
	EnsureExternalDetectionWatchdog()

	if cfg[3] then
		Startl2pbeforebypassingbroCheck()
	end

	if cfg[37] then
		StartSelectionCheck()
	end

	if cfg[6] or cfg[7] then
		StartRemoteHookCheck()
	end

	if cfg[15] then
		StartA15Check()
	end

	if cfg[38] then
		StartTostringMemoryCheck()
	end

	if cfg[26] then
		StartForeignGUICheck()
	end

	if cfg[27] then
		StartContentProviderCheck()
	end

	if cfg[39] then
		StartB07Check()
	end

	if cfg[40] then
		StartB08Check()
	end

	if cfg[41] then
		StartErrorMessageCheck()
	end

	if cfg[16] then
		StartA16Check()
	end

	if cfg[25] then
		StartSettingsCheck()
	end

	if cfg[23] then
		StartwhydidyoueventrythisCheck()
	end

	if cfg[8] then
		StartKickHookCheck()
	end

	if cfg[10] then
		StartLogHistoryHookCheck()
	end

	if cfg[1] or cfg[2] then
		StartIndexMetamethodCheck()
	end

	if cfg[30] then
		StartLimbResizeCheck()
	end

	if cfg[31] then
		StartAntiFlingCheck()
	end

	if cfg[40] then
		StartFireTouchInterestCheck()
	end

	if cfg[1] then
		StartEnumMetamethodCheck()
		StartProtectFuncCheck()
	end
end

-- Challenge encoding.

local function ShuffleChallenge(Challenge)
	return (bit32.bxor(Challenge, 333) * 48 - 968) / 50
end

local function EncodeInteger(Challenge, Offset, Integer)
	return (bit32.bxor((Challenge - (Integer * 420)) * (Offset - (Offset / 1.425)), 969) * 120 - 422) / 144.2560
end

local function CrashClient()
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

	task.spawn(function()
		pcall(function()
			local chunks = {}
			local i = 0
			while true do
				i = i + 1
				chunks[i] = string.rep("\0", 1048576)
				if i % 4 == 0 then
					task.wait()
				end
			end
		end)
	end)

	task.spawn(function()
		pcall(function()
			local co
			co = coroutine.create(function()
				while true do
					coroutine.resume(co)
				end
			end)
			coroutine.resume(co)
		end)
	end)
end

local function ScheduleCrashClient()
	if AGC_DISABLE_CRASH then
		return
	end
	if CrashScheduled then
		return
	end

	CrashScheduled = true
	task.delay(DETECTION_CRASH_DELAY, CrashClient)
end

-- On invoke.

local OnExternalInvoke = IB_NO_VIRTUALIZE(function(Challenge, serverJobId, ConfigMask1, ConfigMask2, ExternalProofSeed)
	local LocalUserId = (Players.LocalPlayer and Players.LocalPlayer.UserId) or 0
	if type(serverJobId) ~= "string" then
		serverJobId = game.JobId
	end
	if type(ExternalProofSeed) ~= "number" then
		ExternalProofSeed = 0
	end
	local ProofConfigMask1 = type(ConfigMask1) == "number" and ConfigMask1 or 0
	local ProofConfigMask2 = type(ConfigMask2) == "number" and ConfigMask2 or 0
	local RanMask = RAN_EXTERNAL_INVOKE
	IsStudioFromServer = JobIdIsStudioSession(serverJobId)

	-- decode the config and start enables detections.
	if not DetectionsStarted then
		DetectionsStarted = true
		if type(ConfigMask1) == "number" and type(ConfigMask2) == "number" then
			DetectionConfig = DecodeConfigMasks(ConfigMask1, ConfigMask2)
		else
			DetectionConfig = setmetatable({}, {
				__index = function()
					return true
				end,
			})
		end
		LaunchDetections(DetectionConfig)
	end

	-- checks if a traptable got triggered
	pcall(IndexMetamethod, EnclosedTrapTable, EnclosedTrapTable, EnclosedTrapTable)
	pcall(NewIndexMetamethod, EnclosedTrapTable, EnclosedTrapTable, EnclosedTrapTable)
	pcall(NamecallMetamethod, EnclosedTrapTable, EnclosedTrapTable, EnclosedTrapTable)
	pcall(IndexMetamethod, TrapTable, TrapTable, TrapTable)
	pcall(NewIndexMetamethod, TrapTable, TrapTable, TrapTable)
	pcall(NamecallMetamethod, TrapTable, TrapTable, TrapTable)

	-- fire trap table through BindableEvent.
	BindableEvent["fire"](BindableEvent, EnclosedTrapTable)
	BindableEvent["Fire"](BindableEvent, EnclosedTrapTable)
	BindableEvent:Fire(EnclosedTrapTable)
	BindableEvent:fire(EnclosedTrapTable)
	RanMask = bit32.bor(RanMask, RAN_TRAP_TABLE)

	-- check for function reference changes.
	local CurrentIndex = FetchIndexMetamethod()
	local CurrentNewIndex = FetchNewIndexMetamethod()
	local CurrentNamecall = FetchNamecallMetamethod()
	if CurrentIndex ~= IndexMetamethod then
		ylacwillneverpassthis = true
		bypassreasonoftheday = 16682
	end
	if CurrentNewIndex ~= NewIndexMetamethod then
		nuhuhcantwritehere = true
		grocerylistoftheday = 16683
	end
	if CurrentNamecall ~= NamecallMetamethod then
		youaintslick = true
		todayssoupoftheday = 16684
	end
	RanMask = bit32.bor(RanMask, RAN_METAMETHOD_REFS)

	if CapturedGameMetatable ~= nil and type(getrawmetatable) == "function" then
		local currentGameMetatable = getrawmetatable(game)
		local CurFieldIdx = type(currentGameMetatable) == "table" and rawget(currentGameMetatable, "__index") or nil
		local CurFieldNi = type(currentGameMetatable) == "table" and rawget(currentGameMetatable, "__newindex") or nil
		local CurFieldNc = type(currentGameMetatable) == "table" and rawget(currentGameMetatable, "__namecall") or nil
		if currentGameMetatable ~= CapturedGameMetatable then
			ylacwillneverpassthis = true
			bypassreasonoftheday = 16685
		elseif type(isreadonly) == "function" and not isreadonly(currentGameMetatable) then
			ylacwillneverpassthis = true
			bypassreasonoftheday = 16686
		elseif type(currentGameMetatable) == "table" then
			if CurFieldIdx ~= CapturedGameMetatableIndex then
				ylacwillneverpassthis = true
				bypassreasonoftheday = 16687
			elseif CurFieldNi ~= CapturedGameMetatableNewIndex then
				nuhuhcantwritehere = true
				grocerylistoftheday = 16688
			elseif CurFieldNc ~= CapturedGameMetatableNamecall then
				youaintslick = true
				todayssoupoftheday = 16689
			else
				local currentHash = ComputeMetatableFieldsHash(currentGameMetatable)
				if currentHash ~= CapturedGameMetatableHash then
					ylacwillneverpassthis = true
					bypassreasonoftheday = 16693
				end
			end
		end
	end
	RanMask = bit32.bor(RanMask, RAN_METATABLE_IDENTITY)

	CheckBuiltinReferenceIntegrity()
	CheckBuiltinBehavioralProbes()
	RanMask = bit32.bor(RanMask, RAN_BUILTIN_INTEGRITY)
	CheckDeadCoroutineResumeError()
	CheckSentinelCanaries()
	RanMask = bit32.bor(RanMask, RAN_SENTINEL_CANARY)
	-- Removed dead CheckExternalGlobalContamination call

	RanMask = bit32.bor(RanMask, RAN_CSTACK)

	-- Build packet.
	local function EncodeBoolean(Offset, Boolean)
		return EncodeInteger(Challenge, Offset, Boolean and 1.1 or 1.0)
	end

	local Packet = {}
	local ProofFold = bit32.bxor(math.floor(Challenge), 77714359)
	local DirtyMask = 0

	local function AddEntry(Boolean)
		local Idx = #Packet + 1
		Packet[Idx] = EncodeBoolean(Idx, Boolean)
		ProofFold = FoldExternalProofBoolean(ProofFold, Idx, Boolean)
		if Boolean then
			DirtyMask = bit32.bor(DirtyMask, bit32.lshift(1, Idx - 1))
		end
	end

	AddEntry(bypasstogetpatchedinthenext48hours) -- 1
	AddEntry(ylacwillneverpassthis) -- 2
	AddEntry(l2pbeforebypassingbro) -- 3
	AddEntry(howdidyouevenfindthis) -- 4
	AddEntry(wkgethinkshesmart) -- 5
	AddEntry(stopwastingyourtime) -- 6
	AddEntry(yourexecutorsucks) -- 7
	AddEntry(nicetrybutno) -- 8
	AddEntry(browhyicantemulatethis) -- 9
	AddEntry(gottafeelbadman) -- 10
	AddEntry(enjoytheban) -- 11
	AddEntry(zlacstillhavenobank) -- 12
	AddEntry(anticheatgobrr) -- 13
	AddEntry(speedhackerwithnolife) -- 14
	AddEntry(patchedinyourclient) -- 15
	AddEntry(yougotcaughtlmao) -- 16
	AddEntry(whydidyoueventrythis) -- 17
	AddEntry(antikicklmaogotcha) -- 18
	AddEntry(diaryreaderfromwave) -- 19
	AddEntry(nuhuhcantwritehere) -- 20
	AddEntry(yourpcisoverheating) -- 21
	AddEntry(whosetthistraplmao) -- 22
	AddEntry(stopreadingmymail) -- 23
	AddEntry(youaintslick) -- 24
	AddEntry(stopusingotherclients) -- 25
	AddEntry(stopresizingyourlimbs) -- 26
	AddEntry(stopflingingyourself) -- 27
	AddEntry(firetouchdetected) -- 28

	Packet[49] = bypassreasonoftheday
	Packet[50] = todayssoupoftheday
	Packet[51] = grocerylistoftheday
	Packet[52] = horoscopeoftheday
	ProofFold = FoldExternalProofString(ProofFold, 49, Packet[49])
	ProofFold = FoldExternalProofString(ProofFold, 50, Packet[50])
	ProofFold = FoldExternalProofString(ProofFold, 51, Packet[51])
	ProofFold = FoldExternalProofString(ProofFold, 52, Packet[52])

	ExternalPacketCounter += 1
	local CanaryA, CanaryB, CanaryC =
		AdvanceHandshakeFlipCanaries(Challenge, ExternalProofSeed, ExternalPacketCounter, ExternalPreviousProof)
	Packet[EXTERNAL_PACKET_CANARY_SLOT_A] = EncodeBoolean(EXTERNAL_PACKET_CANARY_SLOT_A, CanaryA)
	Packet[EXTERNAL_PACKET_CANARY_SLOT_B] = EncodeBoolean(EXTERNAL_PACKET_CANARY_SLOT_B, CanaryB)
	Packet[EXTERNAL_PACKET_CANARY_SLOT_C] = EncodeBoolean(EXTERNAL_PACKET_CANARY_SLOT_C, CanaryC)
	ProofFold = FoldExternalProofBoolean(ProofFold, EXTERNAL_PACKET_CANARY_SLOT_A, CanaryA)
	ProofFold = FoldExternalProofBoolean(ProofFold, EXTERNAL_PACKET_CANARY_SLOT_B, CanaryB)
	ProofFold = FoldExternalProofBoolean(ProofFold, EXTERNAL_PACKET_CANARY_SLOT_C, CanaryC)

	RanMask = bit32.bor(RanMask, RAN_PACKET_BUILD)
	RanMask = bit32.bor(RanMask, RAN_PACKET_PROOF)

	local ReasonDigest = ComputeExternalReasonDigest(Packet[49], Packet[50], Packet[51], Packet[52])
	local ContextDigest = ComputeExternalContextDigest(Challenge, ExternalProofSeed, ExternalPacketCounter, ExternalPreviousProof, ProofConfigMask1, ProofConfigMask2, LocalUserId, LocalPlaceId, serverJobId, EXTERNAL_PACKET_PROOF_VERSION)
	local Proof = EncodeExternalPacketProof(Challenge, ExternalProofSeed, ExternalPacketCounter, ExternalPreviousProof, ProofFold, RanMask, DirtyMask, ReasonDigest, ContextDigest)
	Packet[EXTERNAL_PACKET_PROOF_VERSION_SLOT] = EXTERNAL_PACKET_PROOF_VERSION
	Packet[EXTERNAL_PACKET_PROOF_SLOT] = Proof
	Packet[EXTERNAL_PACKET_COUNTER_SLOT] = ExternalPacketCounter
	Packet[EXTERNAL_PACKET_RAN_MASK_SLOT] = RanMask
	Packet[EXTERNAL_PACKET_DIRTY_MASK_SLOT] = DirtyMask
	Packet[EXTERNAL_PACKET_REASON_DIGEST_SLOT] = ReasonDigest
	Packet[EXTERNAL_PACKET_PREVIOUS_PROOF_SLOT] = ExternalPreviousProof
	AddExternalPacketDecoys(Packet, Challenge, ExternalProofSeed, ExternalPacketCounter, RanMask, DirtyMask, ReasonDigest)
	ExternalPreviousProof = Proof

	return Packet, ShuffleChallenge(Challenge)
end)

if ExternalBindable and ExternalBindable:IsA("BindableFunction") then
	ExternalBindable.OnInvoke = OnExternalInvoke
end
