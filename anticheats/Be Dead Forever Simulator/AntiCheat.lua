
local v1 = table.freeze({ "Variables", "Functions", "Core", "Remote", "UI", "Process", "Anti" })
local v2 = _G
local v3 = game
local v4 = script
local v5 = getfenv
local v6 = setfenv
local v7 = workspace
local v8 = getmetatable
local v9 = setmetatable
local v10 = loadstring
local v11 = coroutine
local v12 = rawequal
local v13 = typeof
local v14 = print
local v15 = math
local v16 = warn
local v17 = error
local v18 = pcall
local v19 = xpcall
local v20 = select
local v21 = rawset
local v22 = rawget
local v23 = ipairs
local v24 = pairs
local v25 = next
local v26 = Rect
local v27 = Axes
local v28 = os
local v29 = time
local v30 = Faces
local v31 = table.unpack
local v32 = string
local v33 = Color3
local v34 = newproxy
local v35 = tostring
local v36 = tonumber
local v37 = Instance
local v38 = TweenInfo
local v39 = BrickColor
local v40 = NumberRange
local v41 = ColorSequence
local v42 = NumberSequence
local v43 = ColorSequenceKeypoint
local v44 = NumberSequenceKeypoint
local v45 = PhysicalProperties
local v46 = Region3int16
local v47 = Vector3int16
local v48 = require
local v49 = table
local v50 = type
local v51 = task.wait
local v52 = Enum
local v53 = UDim
local v54 = UDim2
local v55 = Vector2
local v56 = Vector3
local v57 = Region3
local v58 = CFrame
local v59 = Ray
local defer = task.defer
local v60 = task.delay
local v61 = task

local function f62(p1, p2) --[[ Line: 48 ]]
	return if p1 then p1 else error(p2 or "assertion failed!", 2)
end

local v63 = debug
local v64 = tick
local v65 = v49.freeze({
	"Workspace",
	"Players",
	"Lighting",
	"ReplicatedStorage",
	"ReplicatedFirst",
	"ScriptContext",
	"JointsService",
	"LogService",
	"Teams",
	"SoundService",
	"StarterGui",
	"StarterPack",
	"StarterPlayer",
	"GroupService",
	"MarketplaceService",
	"HttpService",
	"TestService",
	"RunService",
	"NetworkClient"
})
local v66 = v14

local function f67(...) --[[ Line: 73 | Upvalues: v66 (copy) ]]
	v66(":: Adonis ::", ...)
end

local v68 = v16

local function f69(...) --[[ Line: 78 | Upvalues: v68 (copy) ]]
	v68(":: Adonis ::", ...)
end

local t = {}

local function f70() --[[ Line: 84 | Upvalues: f67 (ref), t (copy) ]]
	f67("Dumping client log...")

	for v1, v2 in t do
		f67(v2)
	end
end

local function f71(...) --[[ Line: 91 | Upvalues: v49 (ref), t (copy) ]]
	v49.insert(t, v49.concat({ ... }, " "))
end

local v72 = v4.Parent
local v73 = v3:GetService("RunService"):IsStudio()

v3:GetService("NetworkClient").ChildRemoved:Connect(function(p1) --[[ Line: 98 | Upvalues: v73 (copy), v72 (ref), f67 (ref), f70 (copy) ]]
	if v73 and not v72:FindFirstChild("ADONIS_DEBUGMODE_ENABLED") then
		return
	end

	f67("~! PLAYER DISCONNECTED/KICKED! DUMPING ADONIS CLIENT LOG!")
	f70()
end)

local t2 = {}
local v74 = v5()

v6(1, (v9({}, {
	__metatable = t2
})))
v29()

local v75 = v37.new
local fromExisting = v37.fromExisting
local v76 = v48
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}

local function isModule(p1) --[[ isModule | Line: 117 | Upvalues: t4 (ref), v12 (ref) ]]
	for v1, v2 in t4.Modules do
		if v12(p1, v2) then
			return true
		end
	end

	return false
end

local function logError(...) --[[ logError | Line: 126 | Upvalues: f69 (ref), v49 (ref), t (copy), t4 (ref) ]]
	f69("ERROR: ", ...)
	v49.insert(t, v49.concat({ "ERROR:", ... }, " "))

	if not (t4 and t4.Remote) then
		return
	end

	t4.Remote.Send("LogError", v49.concat({ ... }, " "))
end

local function f77(p1, ...) --[[ Line: 135 | Upvalues: v18 (copy), logError (copy), v35 (copy) ]]
	local v1, v2 = v18(p1, ...)

	if not v1 and v2 then
		logError((v35(v2)))
	end

	return v1, v2
end

local function f78(p1, ...) --[[ Line: 146 | Upvalues: v11 (ref) ]]
	return v11.resume(v11.create(p1), ...)
end

local function f79(...) --[[ Line: 150 | Upvalues: v11 (ref) ]]
	local v1 = v11.wrap(function(...) --[[ Line: 151 | Upvalues: v11 (ref) ]]
		while true do
			v11.yield(...)
		end
	end)

	v1(...)

	return v1
end

local v80 = nil
local v81 = nil
local v82 = nil
local v83 = f79(function(p1) --[[ Line: 163 | Upvalues: v50 (copy), v61 (ref), v18 (copy), v81 (ref), v80 (ref), v82 (ref), t5 (ref), v73 (copy), t4 (ref), v49 (ref) ]]
	if v50(p1) == "string" then
		v61.spawn(v18, function() --[[ Line: 166 | Upvalues: v81 (ref), p1 (copy), v80 (ref) ]]
			if v81 then
				v81("kick", p1)

				return
			end

			if not v80 then
				return
			end

			v80("BadMemes", p1)
		end)
	end

	v61.spawn(v18, function() --[[ Line: 175 | Upvalues: v61 (ref), v18 (ref), v82 (ref), t5 (ref), p1 (copy) ]]
		v61.wait(1)
		v61.spawn(v18, v82, t5.Player, p1)
		t5.Player:Kick(p1)
	end)

	if v73 then
		return
	end

	v61.spawn(v18, function() --[[ Line: 182 | Upvalues: v61 (ref), v18 (ref), t4 (ref), v49 (ref) ]]
		v61.wait(5)
		v61.spawn(v18, function() --[[ Line: 184 | Upvalues: v61 (ref) ]]
			v61.wait(5)

			while true do

			end
		end)

		if t4.Core and t4.Core.RemoteEvent then
			v61.spawn(v18, v49.clear, t4.Core.RemoteEvent)
			v61.spawn(v18, v49.freeze, t4.Core.RemoteEvent)
			t4.Core.RemoteEvent = nil
		end

		while true do

		end
	end)
end)

local function f84(p1, p2) --[[ Line: 198 | Upvalues: t3 (ref), v74 (copy), v72 (ref), t2 (copy), v9 (copy), v50 (copy) ]]
	local t4 = {
		__index = function(p12, p2) --[[ __index | Line: 200 | Upvalues: t3 (ref), p1 (copy), v74 (ref) ]]
			local v1 = t3[p2]

			if not v1 then
				v1 = (p1 or v74)[p2]
			end

			return v1
		end
	}

	t4.__metatable = if v72:FindFirstChild("ADONIS_DEBUGMODE_ENABLED") then nil else t2

	local v2 = v9({}, t4)

	if p2 and v50(p2) == "table" then
		for v3, v4 in p2 do
			v2[v3] = v4
		end
	end

	return v2
end

local function f85() --[[ Line: 216 | Upvalues: t4 (ref), t5 (ref) ]]
	return {
		Client = t4,
		Service = t5
	}
end

local function f86(p1, p2, p3, p4) --[[ Line: 223 | Upvalues: v50 (copy), v18 (copy), f62 (copy), t4 (ref), f84 (ref), v48 (ref), t5 (ref), v6 (copy), v5 (copy), f69 (ref), v63 (ref), f85 (copy) ]]
	local v1 = if v50(p1) == "string" then true else false
	local v2 = not v1 and p1:IsA("StringValue")
	local v3, v4

	if v1 then
		local v52, v62 = v18(f62(f62(t4.Core.Loadstring, "Cannot compile plugin due to Core.Loadstring missing")(p1, f84({}, p3)), "Failed to compile module"))

		v3 = v52
		v4 = v62
	elseif v2 then
		local v8 = t4.Core.LoadCode or (function(...) --[[ Line: 231 | Upvalues: v48 (ref), t4 (ref) ]]
			return v48(t4.Shared.FiOne, true)(...)
		end)
		local v9, v10 = v18(v8, t4.Functions.Base64Decode(p1.Value), f84({}, p3))

		v3 = v9
		v4 = v10
	else
		local v11, v12 = v18(v48, p1)

		v3 = v11
		v4 = v12
	end

	if not v3 then
		f69("Error while loading client module", p1, v4)

		return
	end

	if v50(v4) ~= "function" then
		t4[p1.Name] = v4

		return
	end

	if p2 then
		local _, _2 = t5.TrackTask(("Plugin: %*"):format(p1), (p4 or (v1 or v2)) and v4 or v6(v4, f84(v5(v4), p3)), function(p12) --[[ Line: 242 | Upvalues: f69 (ref), p1 (copy), v63 (ref) ]]
			f69((("Module encountered an error while loading: %*\n%*\n%*"):format(p1, p12, (v63.traceback()))))
		end, f85(), f84)
	else
		local _, _2 = t5.TrackTask(("Thread: Plugin: %*"):format(p1), if (p4 or (v1 or v2)) and v4 then v4 else v6(v4, f84(v5(v4), p3)), function(p12) --[[ Line: 252 | Upvalues: f69 (ref), p1 (copy), v63 (ref) ]]
			f69((("Module encountered an error while loading: %*\n%*\n%*"):format(p1, p12, (v63.traceback()))))
		end, f85(), f84)
	end
end

f71("Client setmetatable")
t4 = v9({
	Handlers = {},
	Modules = {},
	Service = t5,
	Module = v4,
	Print = f67,
	Warn = f69,
	Deps = {},
	Pcall = f77,
	Routine = f78,
	OldPrint = v66,
	LogError = logError,
	Disconnect = function(p1) --[[ Disconnect | Line: 282 | Upvalues: t5 (ref) ]]
		t5.Player:Kick(p1 or "Disconnected from server")
	end
}, {
	__index = function(p1, p2) --[[ __index | Line: 290 | Upvalues: v18 (copy), v83 (ref), v50 (copy), t5 (ref), f67 (ref) ]]
		if p2 ~= "Kill" then
			return
		end

		local v1, v2 = v18(function() --[[ Line: 292 | Upvalues: v83 (ref) ]]
			return v83()
		end)

		if v1 and v50(v2) == "function" then
			return v2
		end

		t5.Players.LocalPlayer:Kick("1x00353 Adonis (PlrClientIndexKlErr)")
		f67("Failed to retrieve Kill function")

		return function() --[[ Line: 299 ]] end
	end
})
t3 = {
	Pcall = f77,
	GetEnv = f84,
	client = t4,
	Folder = v72,
	Routine = f78,
	service = t5,
	logError = logError,
	origEnv = v74,
	log = f71,
	dumplog = f70
}
f71("Create service metatable")
t5 = v48(v72.Parent.Shared.Service)(function(p1, p2, p3, ...) --[[ Line: 322 | Upvalues: logError (copy), v35 (copy), v83 (ref) ]]
	if p1 == "MethodError" then
		logError("Client", (("Method Error Occured: %*"):format(p2)))

		return
	end

	if p1 == "ServerError" then
		logError("Client", (v35(p2)))

		return
	end

	if p1 ~= "ReadError" then
		return
	end

	v83()((v35(p2)))
end, function(p1, p2, p3) --[[ Line: 343 | Upvalues: isModule (copy), v4 (ref), v72 (ref) ]]
	if isModule(p1) or (p1 == v4 or (p1 == v72 or p2 ~= nil)) then
		return
	end

	p3.UnHook()
end, t6, f84(nil, {
	client = t4
}))
f71("Localize")

local Localize = t5.Localize
local v87 = Localize(v28)
local v88 = Localize(v15)

v49 = Localize(v49)

local v89 = Localize(v32)

v11 = Localize(v11)
Localize(v37)

local v90 = Localize(v55)
local v91 = Localize(v56)
local v92 = Localize(v58)
local v93 = Localize(v54)
local v94 = Localize(v53)
local v95 = Localize(v59)
local v96 = Localize(v26)
local v97 = Localize(v30)
local v98 = Localize(v33)
local v99 = Localize(v40)
local v100 = Localize(v42)
local v101 = Localize(v44)
local v102 = Localize(v43)
local v103 = Localize(v45)
local v104 = Localize(v41)
local v105 = Localize(v46)
local v106 = Localize(v47)
local v107 = Localize(v39)
local v108 = Localize(v38)
local v109 = Localize(v27)

v61 = Localize(v61)
v63 = Localize(v63)
f71("Wrap")

local Wrap = t5.Wrap
local UnWrap = t5.UnWrap
local v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130 = v108, v88, v99, v100, v101, v105, v109, v97, v93, v91, v92, v98, v107, v104, v102, v103, v96, v106, v94, v90, v95

for v131, v132 in t5 do
	if v50(v132) == "userdata" then
		t5[v131] = Wrap(v132, true)
	end
end

v72 = Wrap(v72, true)

local v133 = Wrap(v52, true)

v12 = t5.RawEqual
v4 = Wrap(v4, true)

local v134 = Wrap(v3, true)
local v135 = Wrap(v7, true)
local t7 = {
	new = function(p1, p2) --[[ new | Line: 403 | Upvalues: Wrap (copy), v75 (copy), UnWrap (copy) ]]
		return Wrap(v75(p1, UnWrap(p2)), true)
	end,
	fromExisting = function(p1) --[[ fromExisting | Line: 406 | Upvalues: Wrap (copy), fromExisting (copy), UnWrap (copy) ]]
		return Wrap(fromExisting(UnWrap(p1)))
	end
}

v48 = function(p1, p2) --[[ Line: 410 | Upvalues: v76 (copy), UnWrap (copy), Wrap (copy) ]]
	if p2 == true then
		return v76(UnWrap(p1))
	end

	return Wrap(v76(UnWrap(p1)), true)
end
t4.Service = t5
t4.Module = Wrap(t4.Module, true)
f71("Setting things up")

for v136, v137 in {
	_G = v2,
	game = v134,
	spawn = defer,
	script = v4,
	getfenv = v5,
	setfenv = v6,
	workspace = v135,
	getmetatable = v8,
	setmetatable = v9,
	loadstring = v10,
	coroutine = v11,
	rawequal = v12,
	typeof = v13,
	print = f67,
	math = v111,
	warn = f69,
	error = v17,
	assert = f62,
	pcall = v18,
	xpcall = v19,
	select = v20,
	rawset = v21,
	rawget = v22,
	ipairs = v23,
	pairs = v24,
	next = v25,
	Rect = v126,
	Axes = v116,
	os = v87,
	time = v29,
	Faces = v117,
	delay = v60,
	unpack = v31,
	string = v89,
	Color3 = v121,
	newproxy = v34,
	tostring = v35,
	tonumber = v36,
	Instance = t7,
	TweenInfo = v110,
	BrickColor = v122,
	NumberRange = v112,
	ColorSequence = v123,
	NumberSequence = v113,
	ColorSequenceKeypoint = v124,
	NumberSequenceKeypoint = v114,
	PhysicalProperties = v125,
	Region3int16 = v115,
	Vector3int16 = v127,
	require = v48,
	table = v49,
	type = v50,
	wait = v51,
	Enum = v133,
	UDim = v128,
	UDim2 = v118,
	Vector2 = v129,
	Vector3 = v119,
	Region3 = v57,
	CFrame = v120,
	Ray = v130,
	task = v61,
	tick = v64,
	debug = v63,
	service = t5
} do
	t3[v136] = v137
end

f71("Return init function")

local NewProxy = t5.NewProxy
local t8 = {
	__call = function(p1, p2) --[[ __call | Line: 494 | Upvalues: f71 (copy), v89 (ref), v72 (ref), t5 (ref), v6 (copy), t2 (copy), v9 (copy), t4 (ref), v76 (copy), UnWrap (copy), v49 (ref), v23 (copy), v4 (ref), v65 (copy), t6 (copy), f78 (copy), logError (copy), v135 (ref), v1 (copy), f86 (copy), v80 (ref), v81 (ref), v82 (ref), f77 (copy), v87 (ref), v50 (copy), v8 (copy), v61 (ref) ]]
		f71("Begin init")

		local v12, v2 = v89.match(p2.Name, "(.*)\\(.*)")
		local Wrap = t5.Wrap

		v72 = Wrap(p2.Folder or v72)

		if v72:FindFirstChild("ADONIS_DEBUGMODE_ENABLED") then
			p2.DebugMode = true
		else
			p2.DebugMode = false
		end

		f71("Adding ACLI logs to the client logs")

		if p2.acliLogs then
			for v42, v5 in p2.acliLogs do
				f71(v5)
			end
		end

		f71("Clearing environment")
		v6(1, (v9({}, {
			__metatable = t2
		})))
		f71("Loading necessary client values")
		t4.Folder = v72
		t4.UIFolder = v72:WaitForChild("UI", 9000000000)
		t4.Shared = v72.Parent:WaitForChild("Shared", 9000000000)
		t4.Loader = p2.Loader
		t4.Module = p2.Module
		t4.DepsName = v2
		t4.TrueStart = p2.Start
		t4.LoadingTime = p2.LoadingTime
		t4.RemoteName = v12
		t4.DebugMode = p2.DebugMode
		t4.Typechecker = v76(UnWrap(t4.Shared.Typechecker))
		t4.Changelog = v76(UnWrap(t4.Shared.Changelog))
		t4.FormattedChangelog = v49.create(#t4.Changelog)

		local function applyColour(p1) --[[ applyColour | Line: 534 | Upvalues: v89 (ref) ]]
			local v1 = p1:sub(1, 2)

			if v1 == "[v" or (v1 == "[1" or (v1 == "[0" or (v1 == "1." or p1:sub(1, 1) == "v"))) then
				return ("<font color=\'#8FAEFF\'>%*</font>"):format(p1)
			end

			if p1:sub(1, 6) == "[Patch" then
				return ("<font color=\'#F0B654\'>%*</font>"):format(p1)
			end

			if p1:sub(1, 9) == "Version: " then
				return ("<b>%*</b>"):format(p1)
			end

			if p1:sub(1, 2) == "# " then
				return ("<b>%*</b>"):format((v89.sub(p1, 3)))
			end

			return p1
		end

		f71("Formatting chatlogs")

		for v62, v7 in v23(t4.Changelog) do
			t4.FormattedChangelog[v62] = applyColour(v7)
		end

		f71("Setting up material icons")

		local v83 = v76(UnWrap(t4.Shared.MatIcons))
		local v92 = t4
		local t3 = {
			__index = function(p1, p2) --[[ __index | Line: 560 | Upvalues: v83 (copy) ]]
				local v1 = v83[p2]

				if v1 then
					p1[p2] = ("rbxassetid://%*"):format(v1)

					return p1[p2]
				end
			end
		}

		t3.__metatable = if p2.DebugMode then t2 else "Adonis"
		v92.MatIcons = v9({}, t3)
		f71("Get dependencies")

		for v11, v122 in v72:WaitForChild("Dependencies", 9000000000):GetChildren() do
			t4.Deps[v122.Name] = v122
		end

		f71("Destroy script object")
		v4.Parent = nil
		f71("Initial services caching")

		for v13, v14 in v65 do
			local _ = t5[v14]
		end

		f71("Add service specific")

		local v15 = t6

		v15.Player = t5.Players.LocalPlayer or (function() --[[ Line: 591 | Upvalues: t5 (ref) ]]
			t5.Players:GetPropertyChangedSignal("LocalPlayer"):Wait()

			return t5.Players.LocalPlayer
		end)()
		t6.PlayerGui = t6.Player:FindFirstChildWhichIsA("PlayerGui")

		if not t6.PlayerGui then
			f78(function() --[[ Line: 597 | Upvalues: t6 (ref), logError (ref) ]]
				local PlayerGui = t6.Player:WaitForChild("PlayerGui", 120)

				if PlayerGui then
					t6.PlayerGui = PlayerGui
				else
					logError("PlayerGui unable to be fetched? [Waited 120 Seconds]")
				end
			end)
		end

		function t6.Filter(p1, p2, p3) --[[ Line: 606 | Upvalues: t4 (ref), t5 (ref) ]]
			return t4.Remote.Get("Filter", p1, if p3 and p2 then p2 else t5.Player, p3 or p2)
		end
		function t6.LaxFilter(p1, p2) --[[ Line: 609 | Upvalues: t5 (ref) ]]
			local v1 = if p2 then p2 else t5.Player

			return t5.Filter(p1, v1, if p2 then p2 else t5.Player)
		end
		function t6.BroadcastFilter(p1, p2) --[[ Line: 612 | Upvalues: t4 (ref), t5 (ref) ]]
			return t4.Remote.Get("BroadcastFilter", p1, if p2 then p2 else t5.Player)
		end
		function t6.IsMobile() --[[ Line: 616 | Upvalues: t5 (ref) ]]
			return t5.UserInputService.TouchEnabled and (not t5.UserInputService.MouseEnabled and not t5.UserInputService.KeyboardEnabled)
		end
		function t6.LocalContainer() --[[ Line: 622 | Upvalues: t4 (ref), t5 (ref), v135 (ref) ]]
			local Variables = t4.Variables

			if not (Variables.LocalContainer and Variables.LocalContainer.Parent) then
				Variables.LocalContainer = t5.New("Folder", {
					Archivable = false,
					Parent = v135,
					Name = ("__ADONIS_LOCALCONTAINER_%*"):format((t5.HttpService:GenerateGUID(false)))
				})
			end

			return Variables.LocalContainer
		end
		t6.IncognitoPlayers = {}
		f71("Loading core modules")

		for v17, v18 in v1 do
			local v19 = v72.Core:FindFirstChild(v18)

			if v19 then
				f71((("~! Loading Core Module: %*"):format(v18)))
				f86(v19, true, {
					script = v4
				}, true)
			end
		end

		local t7 = {}
		local t8 = {}

		function t4.Finish_Loading() --[[ Line: 653 | Upvalues: f71 (ref), t4 (ref), v80 (ref), v81 (ref), v82 (ref), t5 (ref), t8 (copy), f77 (ref), p2 (copy), t7 (copy), v87 (ref) ]]
			f71("Client fired finished loading")

			if not t4.Core.Key then
				f71("Client missing remote key")
				t4.Kill()("Missing remote key")

				return
			end

			v80 = t4.Remote and t4.Remote.Fire
			v81 = t4.Anti and t4.Anti.Detected
			v82 = t5.Player.kick
			f71("~! Doing run after loaded")

			for v3, v4 in t8 do
				f77(v4, p2)
			end

			f71("~! Doing run last")

			for v5, v6 in t7 do
				f77(v6, p2)
			end

			f71("Finish loading")
			function t4.Finish_Loading() --[[ Line: 673 ]] end
			t4.LoadingTime()
			t5.Events.FinishedLoading:Fire(v87.time())
			f71("~! FINISHED LOADING!")
		end
		f71("~! Init cores")

		local t9 = {}
		local t10 = {}

		for v20, v21 in v1 do
			local v22 = t4[v21]

			f71((("~! INIT: %*"):format(v21)))

			if v22 and (v50(v22) == "table" or v50(v22) == "userdata" and v8(v22) == "ReadOnly_Table") then
				if v22.RunLast then
					v49.insert(t7, v22.RunLast)
					v22.RunLast = nil
				end

				if v22.RunAfterInit then
					v49.insert(t9, v22.RunAfterInit)
					v22.RunAfterInit = nil
				end

				if v22.RunAfterPlugins then
					v49.insert(t10, v22.RunAfterPlugins)
					v22.RunAfterPlugins = nil
				end

				if v22.RunAfterLoaded then
					v49.insert(t8, v22.RunAfterLoaded)
					v22.RunAfterLoaded = nil
				end

				if v22.Init then
					f71((("Run init for %*"):format(v21)))
					f77(v22.Init, p2)
					v22.Init = nil
				end
			end
		end

		f71("~! Running after init")

		for v232, v24 in t9 do
			f77(v24, p2)
		end

		f71("~! Running plugins")

		for v25, v26 in v72.Plugins:GetChildren() do
			if v26.Name ~= "README" then
				v61.defer(f86, v26, false, {
					script = v26,
					cPcall = t4.cPcall
				})
			end
		end

		f71("~! Running after plugins")

		for v27, v28 in t10 do
			f77(v28, p2)
		end

		f71("Initial loading complete")
		t4.AllModulesLoaded = true
		t5.Events.AllModulesLoaded:Fire(v87.time())
		t5.Events.ClientInitialized:Fire()
		f71("~! Return success")

		return "SUCCESS"
	end
}

t8.__metatable = if v72:FindFirstChild("ADONIS_DEBUGMODE_ENABLED") then t2 else "Adonis"
function t8.__tostring() --[[ __tostring | Line: 757 ]]
	return "Adonis"
end

return NewProxy(t8)
