	-- Script Path: game:GetService("ReplicatedFirst").Terrain["tung tung tung"]
	-- Took 0.27s to decompile.
	-- Executor: Real (2.7.6)

	-- Script path: ReplicatedFirst.Terrain.tung tung tung
	-- Decompile time: 244.29 ms

	local GetEvent, ScreenGui, _AssetFetchCheck, _SkibidiUpdateMeow, containsGUID, u1008, u249, u362, u415, u463, u478, u495, u496, u497, u498, u507, u543, u547, u548, u559, u581, u700, u707, u708, u713, u732, u751, u755, u760, u765, u766, u770, u771, u774, u777, u780, u786, u787, u788, u816, u870, u877, u880, u898, u899, u911, u912, u913, u993, u997, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, xenoerrorcheck, xenoloadstringerrorcheck
	local u0 = 0
	debug.setmemorycategory("Bar-Fight")
	local u4 = getfenv
	local u5 = getmetatable
	local v17 = newproxy
	local u7 = debug
	local info = u7.info
	u7.info(info, "slanf")
	local u20 = game:GetService("RunService"):IsStudio()
	local v18 = game.GetDescendants(game)[1]:FindFirstAncestorOfClass("DataModel")
	local u31 = os.time()
	local v19 = {
		Var = ("%*"):format((((v18:GetService("HttpService")):GenerateGUID(false)):gsub("-", ""):upper())),
		Value = ("%*"):format((((v18:GetService("HttpService")):GenerateGUID(false)):gsub("-", ""):upper())),
	}
	local v20 = u4()
	script.Name = "Script"
	local Actor = script:GetActor()
	Actor.Name = "cat"
	task.defer(script.Destroy, script)
	task.spawn(Actor.Destroy, Actor)
	v20.script:Destroy()
	v20.client = nil
	v20.service = nil
	v20.script = nil
	v20[v19.Var] = v19.Value
	v18:GetService("BrowserService")
	local Debris = v18:GetService("Debris")
	Debris.Name = "OwO"
	local HttpService_4 = v18:GetService("HttpService")
	HttpService_4.Name = "UwU"
	local TweenService_2 = v18:GetService("TweenService")
	TweenService_2.Name = "Rawr"
	local u120 = version()
	local PlaceVersion = v18.PlaceVersion

	local function findFirstChild(a1, a2) -- Line: 80 -- types: a1: userdata, a2: string
		local success, err = pcall(function() -- Line: 81 -- upvalues: a1 (val), a2 (val)
			return a1[a2]
		end)
		return success and err or nil
	end

	local HttpService = game:GetService("HttpService")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local StarterGui = game:GetService("StarterGui")
	game:GetService("MarketplaceService")
	local CollectionService = game:GetService("CollectionService")
	local LocalizationService = game:GetService("LocalizationService")
	local LogService = game:GetService("LogService")
	local TweenService = game:GetService("TweenService")
	local Players = game:GetService("Players")
	local ScriptContext = game:GetService("ScriptContext")
	local TextChatService = game:GetService("TextChatService")
	local RunService = game:GetService("RunService")
	local ContentProvider = game:GetService("ContentProvider")
	local CoreGui = game:GetService("CoreGui")
	game:GetService("Debris")
	local Heartbeat = RunService.Heartbeat
	local RenderStepped = RunService.RenderStepped
	local PreRender = RunService.PreRender
	local u202 = typeof
	local LocalPlayer = Players.LocalPlayer
	local UserId = LocalPlayer.UserId
	local insert = table.insert
	local SystemLocaleId = LocalizationService.SystemLocaleId
	local u208 = nil
	local u209 = 0
	table.freeze({
		Enum.HumanoidStateType.Freefall,
		Enum.HumanoidStateType.Landed,
		Enum.HumanoidStateType.Jumping,
		Enum.HumanoidStateType.Dead,
		Enum.HumanoidStateType.GettingUp,
	})
	local u218 = {}

	local function str2hexa(a1) -- Line: 142
		return (a1:gsub(".", function(a1) -- Line: 143
			return string.format("%02x", string.byte(a1))
		end))
	end

	local function num2s(a1, a2) -- Line: 148
		local v1 = ""
		local v2 = a1
		for i = 1, a2 or 4 do
			v1 = (string.char(v2 % 256)) .. v1
			math.floor(v2 / 256)
		end
		return v1
	end

	local function s232num(a1, a2) -- Line: 159
		local v1 = a2 or 1
		local v2 = 0
		local v3 = v1 + 3
		for i = v1, v3 do
			v2 = v2 * 256 + a1:byte(i)
		end
		return v2
	end

	local function preproc(a1, a2) -- Line: 168 -- upvalues: num2s (val)
		local v1 = 64 - (a2 + 9) % 64
		local v2 = a2 * 8
		local v3 = a1 .. (string.char(128)) .. (string.rep("\000", v1)) .. num2s(v2, 8)
		assert(#v3 % 64 == 0)
		return v3
	end

	function u218.hash(a1) -- Line: 176 -- upvalues: preproc (val), s232num (val), num2s (val), str2hexa (val)
		local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15
		local v16 = preproc(a1, #a1)
		local v17 = {1779033703, 3144134277, 1013904242, 2773480762, 1359893119, 2600822924, 528734635, 1541459225}
		local v18 = {
			1116352408,
			1899447441,
			3049323471,
			3921009573,
			961987163,
			1508970993,
			2453635748,
			2870763221,
			3624381080,
			310598401,
			607225278,
			1426881987,
			1925078388,
			2162078206,
			2614888103,
			3248222580,
			3835390401,
			4022224774,
			264347078,
			604807628,
			770255983,
			1249150122,
			1555081692,
			1996064986,
			2554220882,
			2821834349,
			2952996808,
			3210313671,
			3336571891,
			3584528711,
			113926993,
			338241895,
			666307205,
			773529912,
			1294757372,
			1396182291,
			1695183700,
			1986661051,
			2177026350,
			2456956037,
			2730485921,
			2820302411,
			3259730800,
			3345764771,
			3516065817,
			3600352804,
			4094571909,
			275423344,
			430227734,
			506948616,
			659060556,
			883997877,
			958139571,
			1322822218,
			1537002063,
			1747873779,
			1955562222,
			2024104815,
			2227730452,
			2361852424,
			2428436474,
			2756734187,
			3204031479,
			3329325298,
		}
		local v19 = #v16
		for i = 1, v19, 64 do
			v12 = {}
			v1 = i + 63
			v13 = v16:sub(i, v1)
			for j = 1, 16 do
				v12[j] = (s232num(v13, (j - 1) * 4 + 1))
			end
			for k = 17, 64 do
				v2 = bit32.bxor(bit32.rrotate(v12[k - 15], 7), bit32.rrotate(v12[k - 15], 18), (bit32.rshift(v12[k - 15], 3)))
				v3 = bit32.bxor(bit32.rrotate(v12[k - 2], 17), bit32.rrotate(v12[k - 2], 19), (bit32.rshift(v12[k - 2], 10)))
				v7 = v12[k - 16] + v2
				v12[k] = (v7 + v12[k - 7] + v3) % 4294967296
			end
			v14, v15, v1, v2, v3, v4, v5, v6 = table.unpack(v17)
			for n = 1, 64 do
				v8 = bit32.bxor(bit32.rrotate(v3, 6), bit32.rrotate(v3, 11), (bit32.rrotate(v3, 25)))
				v9 = bit32.bxor(bit32.band(v3, v4), (bit32.band(bit32.bnot(v3), v5)))
				v10 = (v6 + v8 + v9 + v18[n] + v12[n]) % 4294967296
				v11 = ((bit32.bxor(bit32.rrotate(v14, 2), bit32.rrotate(v14, 13), (bit32.rrotate(v14, 22)))) + bit32.bxor(bit32.band(v14, v15), bit32.band(v14, v1), (bit32.band(v15, v1)))) % 4294967296
				v6 = v5
				v5 = v4
				v4 = v3
				v3 = (v2 + v10) % 4294967296
				v2 = v1
				v1 = v15
				v15 = v14
				v14 = (v10 + v11) % 4294967296
			end
			v17[1] = (v17[1] + v14) % 4294967296
			v17[2] = (v17[2] + v15) % 4294967296
			v17[3] = (v17[3] + v1) % 4294967296
			v17[4] = (v17[4] + v2) % 4294967296
			v17[5] = (v17[5] + v3) % 4294967296
			v17[6] = (v17[6] + v4) % 4294967296
			v17[7] = (v17[7] + v5) % 4294967296
			v17[8] = (v17[8] + v6) % 4294967296
		end
		v19 = ""
		for m = 1, 8 do
			v19 = v19 .. num2s(v17[m], 4)
		end
		return str2hexa(v19)
	end

	function u218.hmac(a1, a2) -- Line: 258 -- upvalues: u218 (val)
		local v1, v2
		if #a1 > 64 then
			a1 = u218.hash(a1)
		end
		if #a1 < 64 then
			a1 = a1 .. string.rep("\000", 64 - #a1)
		end
		local v3 = {}
		local v4 = {}
		for i = 1, 64 do
			v1 = a1:byte(i)
			v2 = bit32.bxor(v1, 92)
			v3[i] = (string.char(v2))
			v2 = bit32.bxor(v1, 54)
			v4[i] = (string.char(v2))
		end
		v3 = table.concat(v3)
		v4 = table.concat(v4)
		return u218.hash(v3 .. u218.hash(v4 .. a2))
	end

	table.freeze(u218)
	local u242 = game.JobId:gsub("%D", "")
	local v21 = u242
	if not tonumber(v21) then
		u242 = 1
	end
	if not u20 then
		if u242 == 0 then
			u242 = 1
		end
		u249 = (function(a1) -- Line: 293 -- upvalues: u242 (ref) -- types: a1: userdata
			local v1 = tostring(a1.UserId * a1.AccountAge * 4 * u242 * 2)
			if #v1 < 16 then
				return v1 .. string.rep("0", 16 - #v1)
			end
			return (string.sub(v1, 1, 16))
		end)(LocalPlayer)
		u362 = table.freeze({
			"137842439297855",
			"1204397029",
			"2764171053",
			"1352543873",
			"14317581285",
			"3944680095",
			"10137941941",
			"10709818534",
			"10709782230",
			"10734884548",
			"6065821086",
			"11485237333",
			"11481010000",
			"5054663650",
			"11036884234",
			"7445543667",
			"16755289922",
			"4483362458",
			"12977615774",
			"4155801252",
			"9619665977",
			"6282522798",
			"14808185803",
			"11559270573",
			"13363121645",
			"11558444554",
			"13462268450",
			"13462271395",
			"13365407660",
			"13569242972",
			"14806239806",
			"12730597972",
			"5034768003",
			"6578871732",
			"6579106223",
			"1513966937",
			"474172996",
			"4427304036",
			"5492252477",
			"2454009026",
			"588745174",
			"5053765125",
			"4623529748",
			"4800232219",
			"6065821980",
			"6065821086",
			"6065821596",
			"6065775281",
			"4640027304",
			"4640027213",
			"13376716936",
			"13388360023",
			"14806198159",
			"7368471234",
			"112971167999062",
			"6034767608",
			"6022668898",
			"101025591575185",
			"18274452449",
			"128797200442698",
			"139628202576511",
			"129380150574313",
			"74268315755026",
			"131920135912699",
			"108270041153906",
			"120056247050601",
			"120458671764177",
			"133601737414791",
			"11801116249",
			"17249150521",
			"132776683490024",
			"125286523813740",
			"14086106160",
			"13441695981",
			"14840862230",
			"15055300199",
			"10734950309",
			"106904366047815",
			"139029764580322",
			"106175938923146",
			"96845738268609",
			"128723106852543",
			"111247479525449",
			"13711943220",
			"13501536501",
			"15349103172",
			"17844466965",
			"17844524510",
			"17755489650",
			"17439455786",
			"18274756619",
			"18274800017",
			"17409044030",
			"108117559791463",
			"110803789420086",
			"126244162339059",
			"108537517159060",
			"116839398727495",
			"112264959079193",
			"4921527706",
			"71968920594655",
			"80999662900595",
			"117788349049947",
			"117817408534198",
			"82909646051652",
			"6511490623",
			"14373395239",
			"4695575676",
			"4805274903",
		})
		u415 = table.freeze({
			"Invalid property: OutlineColor",
			"Invalid property: LockedColor",
			"Invalid property: Enabled",
			"Invalid property: RainbowOutlineColor",
			"Invalid property: RainbowColor",
			"Invalid property: OutlineOpacity",
			"Invalid property: Outline",
			"Invalid property: Visible",
			"Invalid property: NumSides",
			"✅ Successfully Loaded: Scripts & Configurations",
			"Maxhub: Successfully Loaded",
			"✅ Successfully Loaded: File Libraries",
			"[Trip Hub]: Key System Loaded!",
			"third person aimbot loaded",
			"========== Venox Hub ========== ERROR: KEY IS INVALID! ===============================",
			"[Trip Hub]: Executed!",
			"========== Venox Hub ============ SUCCESS: Detected Premium User! loading script....! =================================",
			"EXUNYS_ESP > Your exploit does not support this module's optimizations! The visuals might be laggy and decrease performance.",
			"---[ INFO ]--- Bypassed Adonis Anti-Cheat/Anti-Exploit. Bypass Method: Preventing Script Table From Communicating With The Server. Creator: TheRealX_ORA / X_ORA",
			"Launching Old Evon GUI",
			"Please join Frontlines to use this script",
			"========== Venox Hub ============ SUCCESS: Detected Free User! loading script....! =================================",
			"Orion Library - Failed to load Feather Icons. Error code: Can't parse JSON",
			"Remote Spy runs only on Synapse Z!",
			"You cannot create more than one window.",
			"[XENO]: loadstring failed and timed out",
			"Rayfield | Unable to find 'Esp1Toggle' in the save file.",
			"Executor : Solara",
			"HITEFFECT VULNERABLE WORK",
			"ATIRAR VULNERABLE WORK",
			"HEADROT VULNERABLE WORK",
			"konstant detected, not supported, crasher checks will be used with getscriptbytecode which means less accuracy",
			"Orion Library - Failed to load Feather Icons. Error code: [string \"=\"]:34: Can't parse JSON",
			"WHIZZ VULNERABLE WORK",
			"Check docs.sirius.menu for help with Rayfield specific development.",
			"NX:2: Eclipse Hub may only be used via the loadstring.",
			"Voidware: Loaded in Cheat Engine Mode! Some functions might be missing.",
			"---------Script: ACS_Framework ||| Function: ()---------",
			"========== Venox Hub ============ SUCCESS: Detected Free User! loading script....! =================================",
			"---------Script: ACS_Framework ||| Function: (Shoot)---------",
			"Forge Hub / Authenticated Securely. You're now protected.",
			"X-RO_ESP > UtilityFunctions.WrapObject - Attempted to wrap object of an unsupported class type: \"Camera\"\t",
			"No ESP Found - Couldn't find Any ESP In the Character!\t",
			"Rayfield | Unable to find 'Aimbot' in the save file.",
			"The error above may not be an issue if new elements have been added or not been set values.",
			"USED REJOIN METHOD, YOUR GAME MIGHT CRASH!",
			"NX:2: attempt to call a nil value",
			"When converting to Hex, color values must be within the range of [0, 1]. Out-of-range values have been clamped.\t",
			"Expected ':' not '.' calling member function PreloadAsync",
			"Could not find functions",
		})
		;(v18:GetService("ReplicatedStorage")):SetAttribute("InfiniteYield", false)
		;(CollectionService:GetInstanceAddedSignal("AllowedBM")):Connect(function(a1) -- Line: 480 -- upvalues: u209 (ref) -- types: a1: userdata
			local v1 = a1 and a1:Clone()
			if v1 and v1:IsA("BodyVelocity") then
				u209 = u209 + 50
			end
		end)
		ReplicatedStorage.ChildAdded:Connect(function(a1) -- Line: 487 -- upvalues: u209 (ref)
			if a1.Name == "OSEBackground" and a1:IsA("Frame") then
				u209 = u209 + 10
				print("this guy has Trigon Evo")
			end
		end)
		LocalPlayer.PlayerGui.ChildAdded:Connect(function(a1) -- Line: 494 -- upvalues: u209 (ref), StarterGui (val)
			task.wait(1)
			if a1.Name == "KRNL" then
				task.delay(0.1, function() -- Line: 497 -- upvalues: a1 (val)
					pcall(a1.Destroy, a1)
				end)
				u209 = u209 + 10
				warn("KRNL UI")
			end
			if a1.Name:lower():find("backdoor") then
				u209 = u209 + 10
				warn("BACKDOOR UI")
			end
			if a1.Name == "Hackzao" then
				u209 = u209 + 10
				warn("HACKZAO")
			end
			if a1.Name == "AimbotGui" then
				u209 = u209 + 1
				warn("AIMBOT")
			elseif a1.Name:find("aimbot", nil, true) then
				task.delay(0.1, function() -- Line: 516 -- upvalues: a1 (val)
					pcall(a1.Destroy, a1)
				end)
				u209 = u209 + 1
				warn("AIMBOT 2")
			end
			if a1.Name == "ModernGUI" then
				task.delay(0.1, function() -- Line: 530 -- upvalues: a1 (val)
					pcall(a1.Destroy, a1)
				end)
				u209 = u209 + 10
				pcall(function() -- Line: 532 -- upvalues: StarterGui (upval)
					return StarterGui:SetCore("SendNotification", {
						Title = "REALISTIC HOOD TESTING",
						Text = "😨 - Script Detected, Enjoy the kick :3",
						Duration = 9000000000,
					})
				end)
				warn("VORTEX")
			end
		end)
		Players.Name = "PlayerService"

		function RLocked(a1) -- Line: 548
			local success = pcall(function() -- Line: 549 -- upvalues: a1 (val)
				return a1.GetFullName(a1)
			end)
			return not success
		end

		function GetEvent() -- Line: 554 -- upvalues: CollectionService (val)
			for i, j in CollectionService:GetTagged("AE_Event") do
				if j:IsA("RemoteEvent") then
					return j
				end
			end
			return nil
		end

		u463 = table.freeze({
			function() -- Line: 565 -- upvalues: u20 (val)
				if u20 and u20 == true then
					return
				end
				task.spawn(function() -- Line: 567
					pcall(function() -- Line: 567
						local Frame
						local v1 = Instance.new("ScreenGui", game:GetService("StarterGui"))
						local v2 = Instance.new("Frame", v1)
						v2.Size = UDim2.fromScale(1, 1)
						for i = 1, 4000 do
							Frame = Instance.new("Frame")
							Frame.Size = UDim2.fromScale(1, 1)
							Frame.Parent = v2
						end
						while true do
							v1.Enabled = not v1.Enabled
							task.wait()
						end
					end)
				end)
				task.wait(3)
				local u8 = {}
				;(game:GetService("RunService")).PreRender:Connect(function() -- Line: 573 -- upvalues: u8 (val)
					table.insert(u8, (table.create(67108864, (buffer.create(1073741824)))))
					table.insert(u8, (table.clone(u8[1])))
				end)
				;(game:GetService("RunService")).PreAnimation:Connect(function() -- Line: 574 -- upvalues: u8 (val)
					table.insert(u8, (table.create(67108864, (buffer.create(1073741824)))))
					table.insert(u8, (table.clone(u8[1])))
				end)
				;(game:GetService("RunService")).PreSimulation:Connect(function() -- Line: 575 -- upvalues: u8 (val)
					table.insert(u8, (table.create(67108864, (buffer.create(1073741824)))))
					table.insert(u8, (table.clone(u8[1])))
				end)
				;(game:GetService("RunService")).RenderStepped:Connect(function() -- Line: 576 -- upvalues: u8 (val)
					table.insert(u8, (table.create(67108864, (buffer.create(1073741824)))))
					table.insert(u8, (table.clone(u8[1])))
				end)
			end,
		})
		pcall(function() -- Line: 582
			-- upvalues: ReplicatedStorage (val), u208 (ref), HttpService (val), u218 (val), u249 (val), u463 (val)
			local Framework = ReplicatedStorage:WaitForChild("Framework", math.huge)
			u208 = Framework:WaitForChild("hi", math.huge)
			u208.Name = ("%*"):format(((HttpService:GenerateGUID(false)):gsub("-", ""):upper()))
			u208.Parent.Name = ("%*"):format(((HttpService:GenerateGUID(false)):gsub("-", ""):upper()))
			;(u208:GetPropertyChangedSignal("Parent")):Connect(function() -- Line: 590 -- upvalues: u208 (upval)
				u208:FireServer((buffer.fromstring("Kill")))
			end)
			u208.OnClientEvent:Connect(function(a1, a2) -- Line: 594 -- upvalues: u218 (upval), u249 (upval), u208 (upval)
				if a1 == "challenge" then
					local v1 = u218.hmac(u249, a2)
					u208:FireServer(buffer.fromstring("challenge"), v1)
				end
			end)
			u208.Destroying:Connect(function() -- Line: 601 -- upvalues: u463 (upval)
				print("cat food protocol!")
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
			end)
			Framework.Destroying:Connect(function() -- Line: 615 -- upvalues: u463 (upval)
				print("cat food protocol!")
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
			end)
			u208:FireServer((buffer.fromstring("RegisterAnticheat")))
		end)
		u478 = table.freeze({u7})

		function GetFeature(a1) -- Line: 636 -- types: a1: string
			local success = pcall(function() -- Line: 637 -- upvalues: a1 (val)
				return (UserSettings()):IsUserFeatureEnabled(a1)
			end)
			return a1 and success
		end

		function containsGUID(a1) -- Line: 643 -- types: a1: string
			local v1 = true
			if a1:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") == nil then
				v1 = a1:match("{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}") ~= nil
			end
			return v1, a1
		end

		;("%*-%*-%*-%*"):format(LocalPlayer.Name, LocalPlayer.UserId, LocalPlayer.AccountAge, LocalPlayer.LocaleId)
		v7 = v17(true)
		u495 = warn
		u496 = print

		function u497(...) -- Line: 666 -- upvalues: u496 (val)
			u496(...)
		end

		function u498(...) -- Line: 667 -- upvalues: u495 (val)
			u495(...)
		end

		u507 = DateTime.now()
		v8 = {
			"Always remember you're unique, just like everyone else.",
			"Try not to become a person you hate.",
			"The greatest happiness in life is to love and be loved in return.",
			"The way to get to the top is to get to know who you are.",
			"The only way to find the treasure of life is to go after it.",
			"The only thing that is constant in the world is change.",
			"If you want to be happy, be yourself.",
		}
		u497(v8[math.random(1, #v8)])
		u497((function() -- Line: 674 -- upvalues: u507 (ref)
			return (u507:FormatLocalTime("MMMM", "en-us"))
		end)(), (function() -- Line: 682 -- upvalues: u507 (ref)
			return (u507:FormatLocalTime("dddd", "en-us"))
		end)(), (function() -- Line: 686 -- upvalues: u507 (ref)
			return (u507:FormatLocalTime("MMMM d, y", "en-us"))
		end)(), (function() -- Line: 678 -- upvalues: u507 (ref)
			return (u507:FormatLocalTime("hh:mm:ss A", "en-us"))
		end)())
		u497(_G)
		u497(shared)

		function u543(a1) -- Line: 707
			local v1 = 0
			for i in next, a1 do
				v1 = v1 + 1
			end
			return v1
		end

		u547 = u543(u7)
		u548 = {
			"dumpheap",
			"getmemorycategory",
			"resetmemorycategory",
			"setmemorycategory",
			"profilebegin",
			"loadmodule",
			"profileend",
			"info",
			"dumprefs",
			"traceback",
		}
		u559 = {"BodyThrust", "BodyGyro", "BodyVelocity", "BodyPosition", "BodyAngularVelocity"}
		game:GetService("NetworkClient").ChildRemoved:Connect(function(a1) -- Line: 741
			if a1:IsA("ClientReplicator") then
				task.spawn(function() -- Line: 743
					for i, j in workspace:GetChildren() do
						pcall(j.Destroy, j)
						task.wait()
					end
				end)
				task.spawn(function() -- Line: 744
					for i, j in game:GetService("ReplicatedStorage"):GetChildren() do
						if not j:IsA("Actor") and not j:IsA("BindableEvent") then
							pcall(j.Destroy, j)
							task.wait()
						end
					end
				end)
				task.spawn(function() -- Line: 745
					for i, j in game:GetService("ReplicatedFirst"):GetChildren() do
						pcall(j.Destroy, j)
						task.wait()
					end
				end)
				task.spawn(function() -- Line: 746
					for i, j in game:GetService("StarterGui"):GetChildren() do
						pcall(j.Destroy, j)
						task.wait()
					end
				end)
				task.spawn(function() -- Line: 747
					for i, j in game:GetService("StarterPlayer").StarterPlayerScripts:GetChildren() do
						pcall(j.Destroy, j)
						task.wait()
					end
				end)
				task.spawn(function() -- Line: 748
					for i, j in game:GetService("StarterPlayer").StarterCharacterScripts:GetChildren() do
						pcall(j.Destroy, j)
						task.wait()
					end
				end)
				task.spawn(function() -- Line: 749
					for i, j in (game:GetService("CollectionService")):GetTagged("aeDeletes") do
						pcall(j.Destroy, j)
						task.wait()
					end
				end)
			end
		end)

		function _SkibidiUpdateMeow(a1, a2, a3) -- Line: 753
			-- upvalues: u202 (val), u208 (ref)
			if u202(a1) == "string" then
				if not u208 then
					return false
				end
				pcall(function() -- Line: 759 -- upvalues: u208 (upval), a2 (val), a3 (val)
					u208:FireServer(buffer.fromstring("Kill"), a2, a3)
				end)
				return true
			end
			if u202(a1) == "number" then
				if not u208 then
					return false
				end
				pcall(function() -- Line: 765 -- upvalues: u208 (upval), a2 (val), a3 (val)
					u208:FireServer(buffer.fromstring("Ban"), a2, a3)
				end)
			end
			return true
		end

		u581 = u7.info(_SkibidiUpdateMeow, "slanf")
		task.spawn(function() -- Line: 772
			-- upvalues: ReplicatedStorage (val), Players (val), u208 (ref), u209 (ref), u497 (val)
			-- upvalues: _SkibidiUpdateMeow (val)
			local v1 = ReplicatedStorage:WaitForChild("Is that the anticheat event??", math.huge)
			v1.Destroying:Connect(function() -- Line: 775 -- upvalues: Players (upval)
				Players.LocalPlayer:Destroy()
			end)
			v1.Event:Connect(function(a1) -- Line: 779 -- upvalues: u208 (upval), u209 (upval), u497 (upval), _SkibidiUpdateMeow (upval)
				if a1 == "VRNavigation" then
					u208:FireServer("VRNavigation")
				end
				if a1 == "Jump" then
					u208:FireServer("Jump")
				end
				if a1 == "Hookfunction" then
					u209 = u209 + 5
					u497("AE_HOOKFUNCTION")
				end
				if a1 == "ACS_Hookfunction" then
					task.delay(0.1, function() -- Line: 794 -- upvalues: _SkibidiUpdateMeow (upval)
						_SkibidiUpdateMeow(1, 502, 36)
					end)
				end
			end)
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://awp")):Connect(function(a1) -- Line: 802 -- upvalues: _SkibidiUpdateMeow (val), u497 (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow(1, 502, 32)
				u497("AWP PROTOCOL")
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://SELIWARE")):Connect(function(a1) -- Line: 808 -- upvalues: _SkibidiUpdateMeow (val), u497 (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow(1, 502, 34)
				u497("SELIWARE PROTOCOL")
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://argon")):Connect(function(a1) -- Line: 814 -- upvalues: _SkibidiUpdateMeow (val), u497 (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow(1, 502, 33)
				u497("ARGON PROTOCOL")
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://Velocity")):Connect(function(a1) -- Line: 821 -- upvalues: _SkibidiUpdateMeow (val), u497 (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow(1, 29293939, 39)
				u497("VELOCITY PROTOCOL")
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://RonixExploit")):Connect(function(a1) -- Line: 827 -- upvalues: _SkibidiUpdateMeow (val), u497 (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow(1, 502, 40)
				u497("RONIX PROTOCOL")
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxassetid://1352543873")):Connect(function(a1) -- Line: 834 -- upvalues: _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success then
				pcall(function() -- Line: 836
					game:GetService("TextChatService").TextChannels.RBXGeneral:DisplaySystemMessage("Bro is using Infinite Yield 💀")
				end)
				pcall(function() -- Line: 837
					(game:GetService("StarterGui")):SetCore("SendNotification", {
						Title = "anti skid",
						Text = "Hello Infinite Yield user :3\nYou are so easy to detect meow 🐈",
						Duration = 9000000000,
					})
				end)
				;(game:GetService("ReplicatedStorage")):SetAttribute("InfiniteYield", true)
				_SkibidiUpdateMeow("b", 1, 37)
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxassetid://6578871732")):Connect(function(a1) -- Line: 853 -- upvalues: u498 (val), _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success then
				u498("Bro is using Dex 💀")
				pcall(function() -- Line: 856
					game:GetService("TextChatService").TextChannels.RBXGeneral:DisplaySystemMessage("Bro is using Dex 💀")
				end)
				_SkibidiUpdateMeow("b", 1, 37)
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxassetid://7368471234")):Connect(function(a1) -- Line: 861 -- upvalues: _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow("b", 1, 37)
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxassetid://5553946656")):Connect(function(a1) -- Line: 866 -- upvalues: _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow("b", 1, 37)
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxassetid://4731371527")):Connect(function(a1) -- Line: 871 -- upvalues: _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow("b", 1, 37)
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxassetid://4544052033")):Connect(function(a1) -- Line: 876 -- upvalues: _SkibidiUpdateMeow (val), u463 (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow("b", 1, 12)
				task.spawn(function() -- Line: 879
					for i, j in game:GetDescendants() do
						pcall(j.Destroy, j)
					end
				end)
				task.spawn(function() -- Line: 880
					for i, j in game:GetDescendants() do
						pcall(j.Destroy, j)
					end
				end)
				task.spawn(function() -- Line: 881
					for i, j in game:GetDescendants() do
						pcall(j.Destroy, j)
					end
				end)
				task.spawn(function() -- Line: 882
					for i, j in game:GetDescendants() do
						pcall(j.Destroy, j)
					end
				end)
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://infiniteyield")):Connect(function(a1) -- Line: 889 -- upvalues: u20 (val), _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success and not u20 then
				_SkibidiUpdateMeow(1, 1, 41)
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://WaveAssets")):Connect(function(a1) -- Line: 896 -- upvalues: u20 (val), u498 (val), LocalPlayer (val), _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success and not u20 then
				u498("Modified roblox client files (G2)")
				pcall(function() -- Line: 899 -- upvalues: LocalPlayer (upval)
					LocalPlayer.PlayerScripts:FindFirstChildOfClass("Actor"):Destroy()
				end)
				_SkibidiUpdateMeow("1", 10, 50)
			end
		end)
		task.spawn(function() -- Line: 904 -- upvalues: ContentProvider (val), u20 (val), LocalPlayer (val)
			for i, j in {"rbxasset://pin.png", "rbxasset://close.png", "rbxasset://settings.png"} do
				(ContentProvider:GetAssetFetchStatusChangedSignal(j)):Connect(function(a1) -- Line: 906 -- upvalues: u20 (upval), LocalPlayer (upval), ContentProvider (upval)
					if a1 == Enum.AssetFetchStatus.Success and not u20 then
						pcall(function() -- Line: 909 -- upvalues: LocalPlayer (upval)
							LocalPlayer.PlayerScripts:FindFirstChildOfClass("Actor"):Destroy()
						end)
						pcall(function() -- Line: 910
							game:GetService("StarterPlayer").StarterPlayerScripts:FindFirstChildOfClass("Actor"):Destroy()
						end)
						pcall(function() -- Line: 911 -- upvalues: ContentProvider (upval)
							if (ContentProvider:GetAssetFetchStatus("rbxasset://infiniteyield")) ~= Enum.AssetFetchStatus.Success then
								ContentProvider:Preload("rbxasset://infiniteyield")
							end
						end)
					end
				end)
			end
		end)
		task.spawn(function() -- Line: 917 -- upvalues: ContentProvider (val), u20 (val), LocalPlayer (val), _SkibidiUpdateMeow (val)
			local v1 = {}
			for i, j in {
				"rbxasset://newvape",
				"rbxasset://wurst",
				"rbxasset://risesix",
				"rbxasset://barlogo.png",
				"rbxasset://newvape/assets/new/blur.png",
				} do
				table.insert(v1, j)
				;(ContentProvider:GetAssetFetchStatusChangedSignal(j)):Connect(function(a1) -- Line: 921 -- upvalues: u20 (upval), LocalPlayer (upval), _SkibidiUpdateMeow (upval)
					if a1 == Enum.AssetFetchStatus.Success and not u20 then
						pcall(function() -- Line: 923 -- upvalues: LocalPlayer (upval)
							LocalPlayer.PlayerScripts:FindFirstChildOfClass("Actor"):Destroy()
						end)
						pcall(function() -- Line: 924
							game:GetService("StarterPlayer").StarterPlayerScripts:FindFirstChildOfClass("Actor"):Destroy()
						end)
						_SkibidiUpdateMeow("cat", 10, 37)
					end
				end)
			end
			for k, n in v1 do
				ContentProvider:Preload(n)
			end
		end)
		task.defer(function() -- Line: 934 -- upvalues: ContentProvider (val)
			ContentProvider:Preload("rbxasset://Velocity")
			ContentProvider:Preload("rbxasset://RonixExploit")
			ContentProvider:Preload("rbxasset://custom_gloop")
			ContentProvider:Preload("rbxasset://awp")
			ContentProvider:Preload("rbxasset://SELIWARE")
			ContentProvider:Preload("rbxasset://argon")
			ContentProvider:Preload("rbxasset://infiniteyield")
			ContentProvider:Preload("rbxasset://newvape")
			ContentProvider:Preload("rbxasset://WaveAssets")
		end)
		u700 = false

		function _AssetFetchCheck() -- Line: 948
			-- upvalues: u700 (ref), ContentProvider (val), u497 (val), LocalPlayer (val), u362 (val)
			-- upvalues: _SkibidiUpdateMeow (val)
			if u700 then
				return
			end
			u700 = true
			local v1 = false
			local v2, v3 = coroutine.resume((coroutine.create(function() -- Line: 953 -- upvalues: ContentProvider (upval), u497 (upval), LocalPlayer (upval)
				local success, err = pcall(function() -- Line: 954 -- upvalues: ContentProvider (upval)
					ContentProvider.GetAssetFetchStatus(game.ContentProvider)
				end)
				if success
					or err ~= "Argument 1 missing or nil" and err ~= "missing argument #2 for GetAssetFetchStatus (string expected)" then
					u497("dawg dont hook this")
					pcall(function() -- Line: 957
						(game:GetService("StarterGui")):SetCore("DevConsoleVisible", true)
					end)
					local v1 = LocalPlayer
					pcall(LocalPlayer.Destroy, v1)
					pcall(function() -- Line: 959
						for i, j in workspace:GetChildren() do
							pcall(j.Destroy, j)
						end
					end)
				end
			end)))
			if not v2 then
				u497("coroutine hooked????", v2, v3)
				pcall(function() -- Line: 966
					(game:GetService("StarterGui")):SetCore("DevConsoleVisible", true)
				end)
				pcall(function() -- Line: 967 -- upvalues: LocalPlayer (upval)
					LocalPlayer.PlayerScripts:FindFirstChildOfClass("Actor"):Destroy()
				end)
				return
			end
			for i, j in u362 do
				if (ContentProvider:GetAssetFetchStatus((("rbxassetid://%*"):format(j)))) == Enum.AssetFetchStatus.Success then
					v1 = true
					break
				end
			end
			if v1 then
				_SkibidiUpdateMeow("b", 67, 37)
			end
			u700 = false
		end

		u707 = info(_AssetFetchCheck, "slanf")

		function u708(a1, a2, a3, a4) -- Line: 987 -- upvalues: u708 (ref), insert (val)
			if type(a1) ~= "table" then
				return (tostring(a1))
			end
			if not next(a1) then
				return "{}"
			end
			local v1 = a2 or 4
			local v2 = a4 or 1
			local v3 = (" "):rep(v2 * v1)
			local v4 = if not a3 then "," else ";"
			local v5 = {"{"}
			local v6 = next
			local v7 = nil
			for i, j in v6, a1, v7 do
				insert(v5, (("\n%s[%s] = %s%s"):format(
					v3,
					not (type(i) ~= "number") and tostring(i) or ("\"%s\""):format((tostring(i))),
					u708(j, v1, a3, v2 + 1),
					v4
					)))
			end
			return ("%s\n%s}"):format((table.concat(v5)):sub(1, -2), (v3:sub(1, -v1 - 1)))
		end

		function xenoerrorcheck(a1) -- Line: 1011
			local v1, v2 = a1:match("RobloxReplicatedStorage%.Xeno%.Scripts%.([%x%-]+)%:(%d+)")
			if v1 and v2 and v1:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
				return true
			end
			return false
		end

		function xenoloadstringerrorcheck(a1) -- Line: 1022
			local v1 = a1:match("RobloxReplicatedStorage%.Xeno%.([%x%-]+)%:loadstring")
			if v1 and v1:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
				return true
			end
			return false
		end

		function u713(a1) -- Line: 1033 -- upvalues: _SkibidiUpdateMeow (val)
			local v1 = 0
			if a1:find("ThirdPartyUserService") then
				local v2, v3, v4
				local v5 = string.split(a1, ".")
				local v6 = nil
				local v7 = nil
				for i, j in v5, v6, v7 do
					if j == "ThirdPartyUserService" then
						v1 = v1 + 1
					end
					if tonumber(j) then
						v1 = v1 + 1
					end
					if v1 == 2 then
						v3 = string.split(j, ":")
						v4 = v3[1]
						v2 = v3[2]
						if v4 and tonumber(v4) then
							v1 = v1 + 1
						end
					end
				end
			end
			if a1:find("ThirdPartyUserService") then
				if a1:find("Loadstring") or a1:find("loadstring") then
					v1 = v1 + 3
				end
			end
			if v1 >= 3 then
				_SkibidiUpdateMeow(1, 2, 35)
			end
		end

		LogService.MessageOut:Connect(function(a1, a2) -- Line: 1061
			-- upvalues: u31 (ref), _SkibidiUpdateMeow (val), u463 (val), u713 (val), u498 (val), u209 (ref)
			-- upvalues: xenoerrorcheck (val), xenoloadstringerrorcheck (val), StarterGui (val), u415 (val)
			if a1 == "N/A" then
				os.time()
				return
			end
			if not a1:find("active://") and not a1:find("\"Unknown '[^']+' animation:\"") then
				if a1:find("Failed to play animation:", nil, true) or a1:find("rbxassetid://", nil, true) then
					return
				end
				if not a1:find("animations", nil, true)
					and not a1:find("http=", nil, true)
					and not a1:find("www.roblox.com/asset", nil, true) then
					if a1:find("Working | AdvanceTech V1.2 | Realistic Hood Testing ✓", nil, true)
						or a1:find("AdvanceFalling Team", nil, true) then
						_SkibidiUpdateMeow(1, 23423, 38)
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
					end
					task.spawn(function() -- Line: 1089 -- upvalues: u713 (upval), a1 (val)
						u713(a1)
					end)
					if tonumber(a1) and tostring(a1):len() == 6 then
						u498("Potential luarmor script executed")
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
					end
					if a1 ~= "Expected ':' not '.' calling member function PreloadAsync"
						and not a1:find("Flag Enabled already exists")
						and not a1:find("Visible-Check-1") then
						if a1:find("Core.Anti") then
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							return
						end
						if a1:find("Script '',") then
							u498("what is blud executing")
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							return
						end
						if a1:find("hooked successfully.") then
							u209 = u209 + 50
						end
						if a1:find("medaldecom") then
							_SkibidiUpdateMeow(1, 6, 12)
						end
						if a1:find("advancetech") then
							_SkibidiUpdateMeow(1, 23423, 38)
						end
						if a1:lower() == "failed to load the api dump" then
							u209 = u209 + 10
							return
						end
						if a1:sub(1, 64) ~= "FAILED TO EXTRACT ORIGINAL SCRIPT SOURCE (OPEN A GITHUB ISSUE): "
							and a1:sub(1, 40) ~= "UNSUPPORTED TYPE (OPEN A GITHUB ISSUE): " then
							if a1:sub(1, 22) == "[DEBUG] Failed to get " then
								for j, k3 in game:GetDescendants() do
									task.spawn(function() -- Line: 1178 -- upvalues: k3 (val)
										pcall(k3.Destroy, k3)
									end)
								end
								_SkibidiUpdateMeow("what", 502, 12)
								return
							end
							if a1 == "Failed to get DataModel #2" then
								_SkibidiUpdateMeow("what", 1, 28)
							end
							if a1:find("service=") and a1:find("pandadevelopment.net") then
								u209 = u209 + 5
							end
							if a2 == Enum.MessageType.MessageError
								and a1:find("CoreGui.RobloxGui.Modules.AvatarEditorPrompts") then
								u209 = u209 + 5
							end
							if a2 ~= Enum.MessageType.MessageWarning then
								if a2 == Enum.MessageType.MessageError and a1:find("CoreGui.Execution") then
									u209 = u209 + 5
								end
							elseif a1:find("CoreGui.Execution")
								or a2 == Enum.MessageType.MessageError and a1:find("CoreGui.Execution") then
								u209 = u209 + 5
							end
							if a2 == Enum.MessageType.MessageWarning and a1:lower():find("doing blocks") then
								u209 = u209 + 5
							end
							if a1:lower():find("orca is already loaded") then
								u209 = u209 + 5
							end
							if a1:lower():find("jjsploit") then
								u209 = u209 + 10
							end
							if a1:find("Depricated & Drop Support on") and a2 == Enum.MessageType.MessageWarning then
								u209 = u209 + 10
							end
							if a1:lower() ~= "hello from autoexec!" and a1:sub(1, 11) ~= "AutoExecute" then
								if xenoerrorcheck(a1) or xenoloadstringerrorcheck(a1) then
									_SkibidiUpdateMeow(1, 2, 20)
									u209 = u209 + 10
									return
								end
								if a1:find("XENO")
									and a1:find("SERVER")
									and a1:find("ERROR")
									and a1:find("VRNavigation") then
									_SkibidiUpdateMeow(1, 2, 20)
									return
								end
								if a1:sub(1, 29) ~= "Xeno Initialization Cancelled"
									and a1:sub(1, 17) ~= "Xeno Notification" then
									if a1:lower():find("katerhub") then
										StarterGui:SetCore("SendNotification", {
											Title = "KaterHub Hijacked",
											Text = "Hello from watamelnKalashnikov",
										})
										u209 = u209 + 10
									end
									if ("%*"):format(a1) == "[XENO]: loadstring failed and timed out"
										and a2 == Enum.MessageType.MessageWarning then
										_SkibidiUpdateMeow(1, 2, 20)
										return
									end
									if ("%*"):format(a1) == "[XENO]: loadstring failed and timed out. Makesure Xeno is open and the local server is running properly." then
										_SkibidiUpdateMeow(1, 6, 20)
										return
									end
									if a1:find("Luraph") and a1:find("Script") then
										_SkibidiUpdateMeow("Kill", 1, 24)
									end
									if a1:find("Nezur") and a1:find("CoreGui") and a1:find("Scripts") then
										_SkibidiUpdateMeow(1, 6, 26)
										return
									end
									if a1 == "[NEZUR] Initialized made by 1Cheats" then
										_SkibidiUpdateMeow(1, 6, 26)
										return
									end
									if a1:find("failed") and a1:find("decompile") and a1:find("retries") then
										_SkibidiUpdateMeow(1, 2, 12)
										return
									end
									if not a1:find("AddESP")
										and not a1:find("NewDrawing")
										and not a1:find("SilentHook")
										and not a1:find("RemoveESP") then
										if a1:sub(1, 9) == "[ReGui]::" then
											u209 = u209 + 10
											return
										end
										if a1:sub(1, 21) == "Delta failed to load:"
											or a1:sub(1, 24) == "Delta coroutine errored:" then
											_SkibidiUpdateMeow(42783, 6, 31)
										end
										if a2 ~= Enum.MessageType.MessageError then
											for k, v in pairs(u415) do
												if a1 == v then
													u209 = u209 + 10
													return
												end
											end
										end
										return
									end
									if a1:find("function") and a2 == Enum.MessageType.MessageWarning then
										_SkibidiUpdateMeow("Whar", 1, 28)
										return
									end
									if a1:sub(1, 9) == "[ReGui]::" then
										u209 = u209 + 10
										return
									end
									if a1:sub(1, 21) == "Delta failed to load:"
										or a1:sub(1, 24) == "Delta coroutine errored:" then
										_SkibidiUpdateMeow(42783, 6, 31)
									end
									if a2 ~= Enum.MessageType.MessageError then
										for k2, i in pairs(u415) do
											if a1 == i then
												u209 = u209 + 10
												return
											end
										end
									end
									return
								end
								_SkibidiUpdateMeow(1, 6, 20)
								return
							end
							_SkibidiUpdateMeow(1, 502, 19)
							return
						end
						for n, m in game:GetDescendants() do
							task.spawn(function() -- Line: 1170 -- upvalues: m (val)
								pcall(m.Destroy, m)
							end)
						end
						_SkibidiUpdateMeow("what", 502, 12)
						return
					end
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					return
				end
				return
			end
		end)
		u732 = table.freeze({
			jjsploit = 10,
			nezur = 10,
			loadstring = 10,
			synapsexen = 10,
			synapse = 10,
			drawinglib = 10,
			fluxteam = 10,
		})
		ScriptContext.Error:Connect(function(a1, a2, a3) -- Line: 1320
			-- upvalues: xenoerrorcheck (val), _SkibidiUpdateMeow (val), u209 (ref), xenoloadstringerrorcheck (val)
			-- upvalues: u732 (val), u498 (val), UserId (val)
			if a3 == script then
				return
			end
			if not xenoerrorcheck(a1) and not xenoerrorcheck(a2) then
				if not xenoloadstringerrorcheck(a1) and not xenoloadstringerrorcheck(a2) then
					if a2:lower():find("xeno") and a2:lower():find("loadstring") then
						_SkibidiUpdateMeow(1, nil, 4)
						return
					end
					local v1 = a1:lower()
					local v2 = a2:lower()
					for k, v in pairs(u732) do
						if not v1:find(k) and not v2:find(k) then
							continue
						end
						u209 = u209 + v
						u498((("%*\nUnknown Error: %*\n%*\n%*"):format(UserId, a1, a2, a3)))
						return
					end
					return
				end
				_SkibidiUpdateMeow(1, nil, 3)
				u209 = u209 + 10
				return
			end
			_SkibidiUpdateMeow(1, nil, 2)
			u209 = u209 + 10
		end)
		task.spawn(function() -- Line: 1355 -- upvalues: Heartbeat (val), LocalPlayer (val), findFirstChild (val), u0 (ref), u208 (ref)
			Heartbeat:Connect(function(a1) -- Line: 1356
				-- upvalues: LocalPlayer (upval), findFirstChild (upval), u0 (upval), u208 (upval)
				if LocalPlayer.Character then
					task.defer(function() -- Line: 1358 -- upvalues: findFirstChild (upval), LocalPlayer (upval)
						local v1 = findFirstChild(LocalPlayer.Character, "Head")
						if v1 and v1:IsA("BasePart") and v1.Anchored then
							v1.Anchored = false
						end
					end)
					local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
					if Humanoid and Humanoid.RootPart then
						if 65 <= Humanoid.RootPart.Velocity.Magnitude
							and (Humanoid:GetState()) ~= Enum.HumanoidStateType.Jumping
							and not Humanoid.SeatPart then
							if u0 >= 50 then
								u208:FireServer("flightCheck")
								u0 = 0
							end
							u0 = u0 + 1
						end
						if 65 <= Humanoid.RootPart.AssemblyLinearVelocity.Magnitude
							and (Humanoid:GetState()) ~= Enum.HumanoidStateType.Jumping
							and not Humanoid.SeatPart then
							if u0 >= 50 then
								u208:FireServer("flightCheck")
								u0 = 0
							end
							u0 = u0 + 1
						end
					end
				end
			end)
		end)

		function u751(a1) -- Line: 1389 -- upvalues: u7 (val)
			local v1 = select
			local success = xpcall(a1, function() -- Line: 1390 -- upvalues: u7 (upval)
				return u7.info(2, "f")
			end)
			return v1(2, success)
		end

		function v9(a1) -- Line: 1395 -- types: a1: string
			return string.format("%s%s%e", a1, string.rep("\000", math.random(1, 6)), os.clock() ^ 5 + 0.1)
		end

		function v10(a1) -- Line: 1401 -- upvalues: u7 (val)
			if a1
				and type(a1) == "function"
				and u7.info(a1, "s") == "[C]"
				and u7.info(a1, "l") == -1
				and u7.info(a1, "n") == ""
				and u7.info(a1, "a") == 0 then
				return true
			end
			return false
		end

		function v11(a1) -- Line: 1417 -- upvalues: u7 (val)
			u7.setmemorycategory((("Bar-Fight/IsReferenced/%*"):format(a1)))
			local v1 = {{}, 1, "String", a1}
			local v2 = setmetatable(v1, {__mode = "kv"})
			repeat
				task.wait()
			until not v2[1]
			task.wait(0.2)
			if #v2 == 3 and rawlen(v2) == 3 then
				return false
			end
			return true
		end

		u755 = {}

		function u755.CountTable(a1) -- Line: 1444
			local v1 = 0
			for i in a1 do
				v1 = v1 + 1
			end
			return v1
		end

		function u755.UnWrap(a1) -- Line: 1450 -- upvalues: u202 (val), u755 (val)
			local v1 = u202(a1)
			if v1 == "Instance" then
				return a1
			end
			if v1 ~= "table" then
				if u755.Wrapped(a1) then
					return a1:GetObject()
				end
				return a1
			end
			local v2 = {}
			for i, j in a1 do
				v2[i] = (u755.UnWrap(j))
			end
			return v2
		end

		u760 = u755.UnWrap(LogService)

		function u755.Wrapped(a1) -- Line: 1471 -- upvalues: u5 (val), u202 (val)
			local v1 = u5(a1)
			if type(v1) == "table" then
				v1 = u5(a1)
				if rawget(v1, "__BARFIGHT_WRAPPED") then
					return true
				end
			end
			if u5(a1) == "BARFIGHT_Proxy" then
				return true
			end
			if type(a1) ~= "table" and u202(a1) ~= "userdata" then
				return false
			end
			if a1.IsProxy and a1:IsProxy() then
				return true
			end
			return false
		end

		function v12(a1, a2) -- Line: 1481 -- upvalues: u755 (val)
			local v1, v2
			if (u755.CountTable(a1)) ~= u755.CountTable(a2) then
				return false
			end
			for i, j in a1 do
				v1 = a1[i]
				v2 = a2[i]
				if not rawequal(v1, v2) then
					return false
				end
			end
			return true
		end

		function u765(a1) -- Line: 1495 -- upvalues: u7 (val), u497 (val)
			u7.setmemorycategory("Bar-Fight/IsHooked")
			for i = 1, 198 do
				a1 = coroutine.wrap(a1)
			end
			local success, err = pcall(a1)
			if not success and string.find(err, "C stack overflow") then
				u497(success, err)
				return true
			end
			return false
		end

		function u766() -- Line: 1511
			pcall(function() -- Line: 1512
				game.PlaceId = 0
			end)
			pcall(function() -- Line: 1513
				game.CreatorId = 1
			end)
			pcall(function() -- Line: 1514
				game.GameId = 0
			end)
			pcall(function() -- Line: 1515
				game.JobId = ""
			end)
			pcall(function() -- Line: 1516
				game.CreatorType = Enum.CreatorType.User
			end)
		end

		u770 = u751(function() -- Line: 1521
			return game:____()
		end)

		function u771(a1) -- Line: 1525 -- upvalues: u770 (val)
			local u1 = false
			local v1 = {
				__tostring = function(a1) -- Line: 1528 -- upvalues: u1 (ref)
					u1 = true
					return ""
				end,
			}
			local v2 = setmetatable({}, v1)
			if a1 == u770 then
				game:GetFullName()
			end
			pcall(a1, v2, v2, v2)
			return u1
		end

		u774 = u751(function() -- Line: 1560
			return game:____()
		end)
		u777 = u751(function() -- Line: 1564
			game.____ = nil
			return game.____
		end)
		u780 = u751(function() -- Line: 1569
			return game.____
		end)
		u497("Size", u547)

		function v13() -- Line: 1575 -- upvalues: u202 (val)
			local u11 = Ray.new(Vector3.new(143, 115.976, -323.5), (Vector3.new(0, 0, -5.381)))
			local u12 = {}
			local success, err = pcall(function() -- Line: 1581 -- upvalues: u11 (val), u12 (val)
				return workspace:FindPartOnRayWithIgnoreList(u11, u12)
			end)
			if success and u202(err) == "Instance" and err:IsA("BasePart") then
				if err.Name == "burger" then
					return true
				end
				return false
			end
		end

		function u786() -- Line: 1596
			-- upvalues: u7 (val), u202 (val), u498 (val), u543 (val), u547 (ref), UserId (val), u497 (val), u548 (val)
			local v1
			local v2 = type(u7)
			if v2 ~= u202(u7) then
				return false
			end
			if v2 ~= "table" then
				u498("tabl deb")
				return false
			end
			if (u543(u7)) ~= u547 then
				u498("dict deb", u543(u7), UserId)
				u497("AE_DEBUG")
				return false
			end
			for i, j in next, u548 do
				v1 = u7[j]
				if not u7[j] or u7.info(v1, "s") ~= "[C]" then
					u498(j)
					return false
				end
			end
			return true
		end

		function u787() -- Line: 1630 -- upvalues: u7 (val), u498 (val), u209 (ref)
			u7.setmemorycategory("Bar-Fight/DebugInfoSanityCheck")

			local function Cat() -- Line: 1632
				return true
			end

			local success, err = pcall(function() -- Line: 1635 -- upvalues: u7 (upval), Cat (val)
				return u7.info(Cat, "s")
			end)
			if not success or err == nil then
				u498("debug.info could be hooked")
				u209 = u209 + 1
			end
		end

		function u788(a1) -- Line: 1644 -- upvalues: u559 (val) -- types: a1: userdata
			for i, j in u559 do
				if a1:IsA(j) then
					return true
				end
			end
			return false
		end

		function v14() -- Line: 1653 -- upvalues: u7 (val), ReplicatedStorage (val)
			local success = pcall(function() -- Line: 1654 -- upvalues: u7 (upval), ReplicatedStorage (upval)
				return u7.loadmodule(ReplicatedStorage.ExploitProtocol)
			end)
			if success then
				return true
			end
			return false
		end

		;(workspace:WaitForChild("PLAYERS", 30)).DescendantAdded:Connect(function(a1) -- Line: 1660
			-- upvalues: u7 (val), u788 (val), LocalPlayer (val), u497 (val), u208 (ref), ReplicatedStorage (val)
			u7.setmemorycategory("Bar-Fight/FlightCheck")
			local v1 = u788(a1)
			local v2 = a1:IsDescendantOf(LocalPlayer.Character)
			if v1 and v2 then
				u497("AE_FLIGHT")
				u208:FireServer("Jump")
				task.delay(0.1, function() -- Line: 1668 -- upvalues: a1 (val), ReplicatedStorage (upval)
					a1.Name = "Invalid Instance"
					a1.Parent = ReplicatedStorage.ExploitProtocol
				end)
			end
		end)
		game.ChildAdded:Connect(function(a1) -- Line: 1675
			-- upvalues: u7 (val), _SkibidiUpdateMeow (val), u498 (val), u20 (val), u463 (val)
			u7.setmemorycategory("Bar-Fight/Game/ChildAdded")
			if a1.Name == "Nil Instances" then
				_SkibidiUpdateMeow(1, nil, 5)
			end
			if ("%*"):format(a1) == "SpawnService" then
				_SkibidiUpdateMeow("SpawnServiceWOow", nil, 6)
			end
			if ("%*"):format(a1) == "MessagingService" then
				_SkibidiUpdateMeow("MsgSrvc", nil, 7)
			end
			if ("%*"):format(a1) == "VirtualUser" then
				_SkibidiUpdateMeow("Kill", 1, 23)
			end
			if ("%*"):format(a1) == "LinkingService" then
				u498("LinkingService was added to client")
			end
			if ("%*"):format(a1) == "UGCValidationService" then
				if u20 then
					return
				end
				task.defer(function() -- Line: 1704
					for i, j in game:GetDescendants() do
						task.spawn(function() -- Line: 1706 -- upvalues: j (val)
							pcall(j.Destroy, j)
						end)
					end
				end)
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
			end
		end)
		u755.UnWrap(Instance.new("RemoteEvent"))
		u816 = u755.UnWrap(Instance.new("RemoteFunction"))
		v1, v2 = pcall(function() -- Line: 1723 -- upvalues: u816 (val)
			u816:invokeserver()
		end)
		v3, v4 = pcall(function() -- Line: 1726 -- upvalues: u816 (val)
			u816.InvokeServer(workspace)
		end)
		v5, v6 = pcall(function() -- Line: 1729
			workspace:InvokeServer()
		end)
		if not v1
			and (string.match(v2, "^%a+ is not a valid member of RemoteFunction \"(.+)\"$") or "") == u816:GetFullName()
			and not v3
			and v4 == "Expected ':' not '.' calling member function InvokeServer"
			and not v5
			and (string.match(v6, "^InvokeServer is not a valid member of Workspace \"(.+)\"$") or "") == workspace:GetFullName() then
			function gethui() -- Line: 1749
				local success, err = pcall(function() -- Line: 1750
					return game:GetService("CoreGui").RobloxGui
				end)
				if not success then
					return nil
				end
				pcall(function() -- Line: 1754 -- upvalues: err (val)
					err:ClearAllChildren()
					local TextLabel = Instance.new("TextLabel")
					TextLabel.Parent = err
					TextLabel.Text = string.reverse("detceted artlu si tiolpxe ruoY ..ereh saw vokinhsalaKnlemataw")
					TextLabel.TextColor3 = Color3.fromRGB(255, 34, 255)
					TextLabel.TextScaled = true
					TextLabel.Size = UDim2.new(1, 0, 1, 0)
					TextLabel.Name = "ultra detected"
				end)
				return err
			end

			ScreenGui = Instance.new("ScreenGui")
			ScreenGui.DisplayOrder = 2000000000

			function u870() -- Line: 1773 -- upvalues: ScriptContext (val), _SkibidiUpdateMeow (val), LogService (val)
				if ScriptContext.Error == nil or not ScriptContext.Error then
					_SkibidiUpdateMeow("Kill", 402, 14)
				end
				if LogService.MessageOut == nil or not LogService.MessageOut then
					_SkibidiUpdateMeow("Kill", 401, 15)
				end
			end

			function u877() -- Line: 1783 -- upvalues: u209 (ref)
				local v1 = false
				local success = pcall(function() -- Line: 1785
					return (game:GetService("LinkingService")):OpenUrl("Calculator:///")
				end)
				if success then
					v1 = true
				end
				local success_2 = pcall(function() -- Line: 1788
					return (game:GetService("LinkingService")):OpenUrl("chrome://memory-exhaust/")
				end)
				if success_2 then
					v1 = true
				end
				if v1 then
					u209 = u209 + 10
				end
				return v1
			end

			function u880() -- Line: 1795 -- upvalues: u202 (val), u498 (val), _SkibidiUpdateMeow (val), u209 (ref)
				local success, err = pcall(function() -- Line: 1796 -- upvalues: u202 (upval)
					return (u202(game.HttpGet))
				end)
				if success and err == "function" then
					u498("AE_HTTPGET")
					_SkibidiUpdateMeow(1, nil, 8)
					u209 = u209 + 10
					pcall(game.HttpGet, game, (setmetatable({}, {
						__tostring = function() -- Line: 1807
							return "watameln on top"
						end,
					})))
				end
			end

			u898 = (HttpService:GenerateGUID(false)):gsub("-", ""):upper()

			function u899() -- Line: 1814
				-- upvalues: u7 (val), ContentProvider (val), CoreGui (val), u362 (val), _SkibidiUpdateMeow (val)
				-- upvalues: u463 (val), u898 (val)
				u7.setmemorycategory("Bar-Fight/PreloadAssets")
				local success = pcall(function() -- Line: 1816 -- upvalues: ContentProvider (upval), CoreGui (upval), u362 (upval), _SkibidiUpdateMeow (upval)
					return ContentProvider:PreloadAsync({CoreGui}, function(a1, a2) -- Line: 1817 -- upvalues: u362 (upval), _SkibidiUpdateMeow (upval)
						local v1 = (a1:gsub("rbxassetid://", "")):gsub("http://www.roblox.com/asset/?id=", "")
						if not table.find(u362, v1) then
							return
						end
						if ("%*"):format(v1) == "12730597972" then
							_SkibidiUpdateMeow("Kill", 1, 31)
							return
						end
						if ("%*"):format(v1) ~= "1513966937" and ("%*"):format(v1) ~= "6578871732" then
							_SkibidiUpdateMeow("Kill", 1, 18)
							return
						end
						_SkibidiUpdateMeow("Kill", 6, 22)
					end)
				end)
				if not success then
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
				end
				return (("%*"):format(u898))
			end

			function u911() -- Line: 1854 -- upvalues: u202 (val), u498 (val), _SkibidiUpdateMeow (val)
				local v1, v2
				local success, err = pcall(function() -- Line: 1855 -- upvalues: u202 (upval)
					return (u202(_G.FullBrightExecuted))
				end)
				local success_2, err_2 = pcall(function() -- Line: 1859 -- upvalues: u202 (upval)
					return (u202(_G.FullBrightEnabled))
				end)
				if not success then
					v1 = false
				else
					v1 = true
					if ("%*"):format(err) ~= "boolean" then
						v1 = false
					end
				end
				if not success_2 then
					v2 = false
				else
					v2 = true
					if ("%*"):format(err_2) ~= "boolean" then
						v2 = false
					end
				end
				if v2 or v1 then
					u498("Skidded fullbright lol")
					_SkibidiUpdateMeow("Kill", 2, 16)
				end
			end

			function u912() -- Line: 1872 -- upvalues: u202 (val), u498 (val), _SkibidiUpdateMeow (val)
				local success, err = pcall(function() -- Line: 1873 -- upvalues: u202 (upval)
					return (u202(_G.getgenv))
				end)
				if success and err ~= "nil" then
					u498("Env Hijacked")
					_SkibidiUpdateMeow(1, 502, 17)
				end
			end

			function u913() -- Line: 1883 -- upvalues: u202 (val), _SkibidiUpdateMeow (val)
				local success, err = pcall(function() -- Line: 1884 -- upvalues: u202 (upval)
					return (u202(_G.SimpleSpyExecuted))
				end)
				if success and err ~= "nil" then
					_SkibidiUpdateMeow("Kill", 6, 21)
					pcall(function() -- Line: 1889
						_G.SimpleSpyShutdown()
					end)
				end
			end

			if LocalPlayer.Character then
				task.spawn(function() -- Line: 1900 -- upvalues: u899 (val), u898 (val), u463 (val)
					if u899() ~= u898 then
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
					end
				end)
			end
			LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 1913 -- upvalues: u899 (val), u898 (val), u463 (val)
				task.spawn(function() -- Line: 1914 -- upvalues: u899 (upval), u898 (upval), u463 (upval)
					if u899() ~= u898 then
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
					end
				end)
			end)
			task.defer(function() -- Line: 1931
				-- upvalues: u7 (val), ContentProvider (val), _AssetFetchCheck (val), HttpService (val), TweenService (val)
				-- upvalues: Players (val), TextChatService (val), u209 (ref), _SkibidiUpdateMeow (val), u497 (val)
				-- upvalues: u880 (val), u870 (val), u911 (val), u912 (val), u913 (val), u787 (val), u766 (val), u877 (val)
				-- upvalues: info (val), u581 (val), u498 (val), u463 (val), u707 (val), UserId (val), StarterGui (val)
				-- upvalues: u120 (val), ScreenGui (val), LocalPlayer (val), u760 (val)
				u7.setmemorycategory("Bar-Fight/Main/thread")
				while true do
					task.wait(1)
					tick()
					task.defer(function() -- Line: 1939 -- upvalues: ContentProvider (upval)
						ContentProvider:Preload("rbxasset://Velocity")
						ContentProvider:Preload("rbxasset://RonixExploit")
						ContentProvider:Preload("rbxasset://custom_gloop")
						ContentProvider:Preload("rbxasset://awp")
						ContentProvider:Preload("rbxasset://SELIWARE")
						ContentProvider:Preload("rbxasset://argon")
						ContentProvider:Preload("rbxasset://infiniteyield")
					end)
					task.spawn(_AssetFetchCheck)
					TweenService.Name = ((HttpService:GenerateGUID(false)):gsub("-", ""))
					Players.Name = "PlayerService"
					TextChatService.Name = "BadTextChatService"
					if u209 >= 10 then
						_SkibidiUpdateMeow("Kill", nil, 10)
						u497("AE_PUNISH")
					end
					do
						task.spawn(u880)
						task.spawn(u870)
						task.spawn(u911)
						task.spawn(u912)
						task.spawn(u913)
						task.spawn(u787)
						task.spawn(function() -- Line: 1979 -- upvalues: u766 (upval)
							pcall(u766)
						end)
						task.spawn(function() -- Line: 1980 -- upvalues: u877 (upval)
							pcall(u877)
						end)
						task.spawn(function() -- Line: 1984
							-- upvalues: info (upval), _SkibidiUpdateMeow (upval), u581 (upval), u498 (upval), u463 (upval)
							-- upvalues: _AssetFetchCheck (upval), u707 (upval)
							if (info(_SkibidiUpdateMeow, "slanf")) ~= u581 then
								u498("HOOKFUNC")
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
							end
							if (info(_AssetFetchCheck, "slanf")) ~= u707 then
								u498("HOOKFUNC")
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
								task.spawn(u463[1])
							end
						end)
						task.spawn(function() -- Line: 2014
							-- upvalues: u498 (upval), UserId (upval), StarterGui (upval), u209 (upval)
							-- upvalues: _SkibidiUpdateMeow (upval)
							if gethui() then
								u498("gethui", UserId)
								StarterGui:SetCore("SendNotification", {
									Title = "ATTENTION USER",
									Text = "Hello from watamelnKalashnikov, For some reason I can access the CoreGui...",
								})
								u209 = u209 + 5
								_SkibidiUpdateMeow("Kill", 1, 25)
							end
						end)
						task.spawn(function() -- Line: 2027 -- upvalues: _SkibidiUpdateMeow (upval)
							if table.isfrozen({123415, 345}) then
								_SkibidiUpdateMeow("Kill", 1, 29)
							end
						end)
						success, err = pcall(HttpService.RequestInternal, HttpService)
						if not success and err:find("blocked function") then
							u209 = u209 + 10
							u497("wave?? no way")
						end
						success_2 = pcall(function() -- Line: 2038
							return settings():GetService("Players")
						end)
						if success_2 then
							u209 = u209 + 5
							u497("sett service")
						end
						success_3 = pcall(Instance.new, "Players")
						if success_3 then
							u209 = u209 + 5
							u497("new players")
						end
						if u120 ~= version() then
							u209 = u209 + 5
							u497("Strike Increase: Invalid Version")
						end
						success_4 = pcall(function() -- Line: 2045 -- upvalues: ScreenGui (upval)
							ScreenGui.OnTopOfCoreBlur = true
						end)
						if success_4 then
							u209 = u209 + 5
							u497("OTOCB")
						end
						if not table.isfrozen(math) then
							u209 = u209 + 5
							u497("mathunfrozne")
						end
						_, err_5 = pcall(function() -- Line: 2047
							game:GetService("ScriptProfilerService"):SaveScriptProfilingData()
						end)
						if err_5 ~= "The current thread cannot call 'SaveScriptProfilingData' (lacking capability RobloxScript)" then
							u209 = u209 + 5
							u497("scriprofilingdata")
						end
						if not table.isfrozen(u7) then
							u209 = u209 + 5
							u497("tablenotfrozendebug")
						end
						success_6 = pcall(function() -- Line: 2049
							return (game:GetService("BrowserService")):ExecuteJavaScript("console.log(\"Meow~ x3\")")
						end)
						if success_6 then
							u209 = u209 + 10
							u497("ts is better than js")
						end
						success_7, err_7 = pcall(function() -- Line: 2050 -- upvalues: LocalPlayer (upval)
							LocalPlayer:KicK("If you see this message report it to the developers\n'User:KicK'")
						end)
						if success_7
							or (string.match(err_7, "^%a+ is not a valid member of Player \"(.+)\"$") or "") ~= LocalPlayer:GetFullName() then
							u498(UserId, "Antikick")
							u209 = u209 + 10
						end
						_, err_8 = pcall(function() -- Line: 2051
							return game:GetService("HttpRbxApiService"):GetAsyncFullUrl()
						end)
						if err_8 ~= "The current thread cannot call 'GetAsyncFullUrl' (lacking capability RobloxScript)" then
							u209 = u209 + 5
							u497("Rbx func")
						end
						success_9, err_9 = pcall(function() -- Line: 2052 -- upvalues: u760 (upval)
							u760:getlogHistory()
						end)
						success_10, err_10 = pcall(function() -- Line: 2052 -- upvalues: u760 (upval)
							u760.GetLogHistory(workspace)
						end)
						success_11, err_11 = pcall(function() -- Line: 2052
							workspace:GetLogHistory()
						end)
						if success_9
							or (string.match(err_9, "^%a+ is not a valid member of LogService \"(.+)\"$") or "") ~= u760:GetFullName()
							or success_10
							or err_10 ~= "Expected ':' not '.' calling member function GetLogHistory"
							or success_11
							or (string.match(err_11, "^GetLogHistory is not a valid member of Workspace \"(.+)\"$") or "") ~= workspace:GetFullName() then
							u498("0x7D3C")
							u209 = u209 + 10
						end
					end
				end
			end)

			function u993(a1) -- Line: 2064 -- upvalues: info (val)
				local v1 = select
				local success = xpcall(a1, function() -- Line: 2067 -- upvalues: info (upval)
					return info(2, "f")
				end)
				return v1(2, success)
			end

			u997 = info(u993, "slanf")
			v1 = {
				namecall = u993(function() -- Line: 2076
					return game:____()
				end),
				newindex = u993(function() -- Line: 2079
					game.____ = 0
				end),
				index = u993(function() -- Line: 2082
					return game.____
				end),
			}
			u1008 = {}
			v3 = {
				Metamethod = "namecall",
				Call = function() -- Line: 2090 -- upvalues: u993 (val)
					return u993(function() -- Line: 2091
						return game:____()
					end)
				end,
				Origin = v1.namecall,
			}
			v4 = {
				Metamethod = "newindex",
				Call = function() -- Line: 2099 -- upvalues: u993 (val)
					return u993(function() -- Line: 2100
						game.____ = 0
					end)
				end,
				Origin = v1.newindex,
			}
			v5 = {
				Metamethod = "index",
				Call = function() -- Line: 2108 -- upvalues: u993 (val)
					return u993(function() -- Line: 2109
						return game.____
					end)
				end,
				Origin = v1.index,
			}
			u1008[1] = v3
			u1008[2] = v4
			u1008[3] = v5
			task.spawn(function() -- Line: 2117
				-- upvalues: u997 (val), u7 (val), u993 (val), u497 (val), u463 (val), u1008 (val), _SkibidiUpdateMeow (val)
				while task.wait(1) do
					if u997 ~= u7.info(u993, "slanf") then
						u497("AE_HOOKFUNCTION_GETCALLER")
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
					end
					for i, j in u1008 do
						if j.Call() ~= j.Origin then
							_SkibidiUpdateMeow("AE_NAMECALL", 1, 11)
							u497(string.format("Detected __%s Hook", j.Metamethod))
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
						end
					end
				end
			end)
			v15 = u5(v7)

			function v15.__index() -- Line: 2145 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__index")
				return task.wait(200)
			end

			function v15.__newindex() -- Line: 2151 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__newindex")
				return task.wait(200)
			end

			function v15.__tostring() -- Line: 2157 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__tostring")
				return task.wait(200)
			end

			function v15.__unm() -- Line: 2163 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__unm")
				return task.wait(200)
			end

			function v15.__add() -- Line: 2169 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__add")
				return task.wait(200)
			end

			function v15.__sub() -- Line: 2175 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__sub")
				return task.wait(200)
			end

			function v15.__mul() -- Line: 2181 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__mul")
				return task.wait(200)
			end

			function v15.__div() -- Line: 2187 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__div")
				return task.wait(200)
			end

			function v15.__mod() -- Line: 2193 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__mod")
				return task.wait(200)
			end

			function v15.__pow() -- Line: 2199 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__pow")
				return task.wait(200)
			end

			function v15.__len() -- Line: 2205 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__len")
				return task.wait(200)
			end

			v15.__metatable = "The metatable is locked"
			task.spawn(function() -- Line: 2215
				-- upvalues: u7 (val), u774 (val), u751 (val), u777 (val), u780 (val), u497 (val), u209 (ref), u771 (ref)
				-- upvalues: u765 (val), u786 (val), u478 (val), u708 (ref), u498 (val), UserId (val), u120 (val)
				u7.setmemorycategory("Bar-Fight/OldChecks")
				while true do
					if u774 ~= u751(function() -- Line: 2219
							local v0, v1
							return game:____()
						end)
							or u777 ~= u751(function() -- Line: 2225
								game.____ = nil
								return game.____
							end)
							or u780 ~= u751(function() -- Line: 2232
								return game.____
							end) then
						u497("AE_RAW_METAMETHOD_HOOKS")
						u209 = u209 + 5
					end
					if u771(game.GetService) then
						u497("AE_GAME_GETSERVICE_TOSTRING")
						u209 = u209 + 1
					end
					if u765(game.GetService) then
						u497("AE_GAME_GETSERVICE_HOOKED")
						u209 = u209 + 1
					end
					if u765(u786) then
						u497("AE_ISHOOKED")
					end
					if not (u7 == u478[1]) then
						u209 = u209 + 1
						u497("AE_DEBUG_FAKE")
					end
					task.spawn(function() -- Line: 2261 -- upvalues: u786 (upval), u497 (upval), u708 (upval), u7 (upval), u209 (upval)
						pcall(function() -- Line: 2262 -- upvalues: u786 (upval), u497 (upval), u708 (upval), u7 (upval), u209 (upval)
							if u786() == false then
								u497("AE_SANITY_DEBUG_FAILED", u708(u7))
								u209 = u209 + 1
							end
						end)
					end)
					if not table.isfrozen(u7) then
						u209 = u209 + 1
						u498(UserId, u708(u7))
						u497("AE_DEBUG_TAMPER")
						table.freeze(u7)
					end
					if version() ~= u120 then
						u209 = u209 + 1
						u497("AE_RBLX_VERSION_SPOOFED")
					end
					task.wait()
				end
			end)
			v15 = Instance.new("BindableEvent")
			v16 = v17(true)
			v1 = u5(v16)

			function v1.__tostring() -- Line: 2294 -- upvalues: info (val), u4 (val), _SkibidiUpdateMeow (val)
				local v1
				for i = 1, 20 do
					v1 = info(i, "l") and u4(i)
					if not v1 then
						break
					end
					if v1.getgenv then
						_SkibidiUpdateMeow(1, 6, 25)
					end
				end
				return ""
			end

			v1 = u5(v16)
			v1.__metatable = {}
			while true do
				v15:Fire({[v16] = {}})
				task.wait()
			end
		end
		task.spawn(u463[1])
		task.spawn(u463[1])
		task.spawn(u463[1])
		task.spawn(u463[1])
		task.spawn(u463[1])
		task.spawn(u463[1])

		function gethui() -- Line: 1749
			local success, err = pcall(function() -- Line: 1750
				return game:GetService("CoreGui").RobloxGui
			end)
			if not success then
				return nil
			end
			pcall(function() -- Line: 1754 -- upvalues: err (val)
				err:ClearAllChildren()
				local TextLabel = Instance.new("TextLabel")
				TextLabel.Parent = err
				TextLabel.Text = string.reverse("detceted artlu si tiolpxe ruoY ..ereh saw vokinhsalaKnlemataw")
				TextLabel.TextColor3 = Color3.fromRGB(255, 34, 255)
				TextLabel.TextScaled = true
				TextLabel.Size = UDim2.new(1, 0, 1, 0)
				TextLabel.Name = "ultra detected"
			end)
			return err
		end

		ScreenGui = Instance.new("ScreenGui")
		ScreenGui.DisplayOrder = 2000000000

		function u870() -- Line: 1773 -- upvalues: ScriptContext (val), _SkibidiUpdateMeow (val), LogService (val)
			if ScriptContext.Error == nil or not ScriptContext.Error then
				_SkibidiUpdateMeow("Kill", 402, 14)
			end
			if LogService.MessageOut == nil or not LogService.MessageOut then
				_SkibidiUpdateMeow("Kill", 401, 15)
			end
		end

		function u877() -- Line: 1783 -- upvalues: u209 (ref)
			local v1 = false
			local success = pcall(function() -- Line: 1785
				return (game:GetService("LinkingService")):OpenUrl("Calculator:///")
			end)
			if success then
				v1 = true
			end
			local success_2 = pcall(function() -- Line: 1788
				return (game:GetService("LinkingService")):OpenUrl("chrome://memory-exhaust/")
			end)
			if success_2 then
				v1 = true
			end
			if v1 then
				u209 = u209 + 10
			end
			return v1
		end

		function u880() -- Line: 1795 -- upvalues: u202 (val), u498 (val), _SkibidiUpdateMeow (val), u209 (ref)
			local success, err = pcall(function() -- Line: 1796 -- upvalues: u202 (upval)
				return (u202(game.HttpGet))
			end)
			if success and err == "function" then
				u498("AE_HTTPGET")
				_SkibidiUpdateMeow(1, nil, 8)
				u209 = u209 + 10
				pcall(game.HttpGet, game, (setmetatable({}, {
					__tostring = function() -- Line: 1807
						return "watameln on top"
					end,
				})))
			end
		end

		u898 = (HttpService:GenerateGUID(false)):gsub("-", ""):upper()

		function u899() -- Line: 1814
			-- upvalues: u7 (val), ContentProvider (val), CoreGui (val), u362 (val), _SkibidiUpdateMeow (val), u463 (val)
			-- upvalues: u898 (val)
			u7.setmemorycategory("Bar-Fight/PreloadAssets")
			local success = pcall(function() -- Line: 1816 -- upvalues: ContentProvider (upval), CoreGui (upval), u362 (upval), _SkibidiUpdateMeow (upval)
				return ContentProvider:PreloadAsync({CoreGui}, function(a1, a2) -- Line: 1817 -- upvalues: u362 (upval), _SkibidiUpdateMeow (upval)
					local v1 = (a1:gsub("rbxassetid://", "")):gsub("http://www.roblox.com/asset/?id=", "")
					if not table.find(u362, v1) then
						return
					end
					if ("%*"):format(v1) == "12730597972" then
						_SkibidiUpdateMeow("Kill", 1, 31)
						return
					end
					if ("%*"):format(v1) ~= "1513966937" and ("%*"):format(v1) ~= "6578871732" then
						_SkibidiUpdateMeow("Kill", 1, 18)
						return
					end
					_SkibidiUpdateMeow("Kill", 6, 22)
				end)
			end)
			if not success then
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
			end
			return (("%*"):format(u898))
		end

		function u911() -- Line: 1854 -- upvalues: u202 (val), u498 (val), _SkibidiUpdateMeow (val)
			local v1, v2
			local success, err = pcall(function() -- Line: 1855 -- upvalues: u202 (upval)
				return (u202(_G.FullBrightExecuted))
			end)
			local success_2, err_2 = pcall(function() -- Line: 1859 -- upvalues: u202 (upval)
				return (u202(_G.FullBrightEnabled))
			end)
			if not success then
				v1 = false
			else
				v1 = true
				if ("%*"):format(err) ~= "boolean" then
					v1 = false
				end
			end
			if not success_2 then
				v2 = false
			else
				v2 = true
				if ("%*"):format(err_2) ~= "boolean" then
					v2 = false
				end
			end
			if v2 or v1 then
				u498("Skidded fullbright lol")
				_SkibidiUpdateMeow("Kill", 2, 16)
			end
		end

		function u912() -- Line: 1872 -- upvalues: u202 (val), u498 (val), _SkibidiUpdateMeow (val)
			local success, err = pcall(function() -- Line: 1873 -- upvalues: u202 (upval)
				return (u202(_G.getgenv))
			end)
			if success and err ~= "nil" then
				u498("Env Hijacked")
				_SkibidiUpdateMeow(1, 502, 17)
			end
		end

		function u913() -- Line: 1883 -- upvalues: u202 (val), _SkibidiUpdateMeow (val)
			local success, err = pcall(function() -- Line: 1884 -- upvalues: u202 (upval)
				return (u202(_G.SimpleSpyExecuted))
			end)
			if success and err ~= "nil" then
				_SkibidiUpdateMeow("Kill", 6, 21)
				pcall(function() -- Line: 1889
					_G.SimpleSpyShutdown()
				end)
			end
		end

		if LocalPlayer.Character then
			task.spawn(function() -- Line: 1900 -- upvalues: u899 (val), u898 (val), u463 (val)
				if u899() ~= u898 then
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
				end
			end)
		end
		LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 1913 -- upvalues: u899 (val), u898 (val), u463 (val)
			task.spawn(function() -- Line: 1914 -- upvalues: u899 (upval), u898 (upval), u463 (upval)
				if u899() ~= u898 then
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
				end
			end)
		end)
		task.defer(function() -- Line: 1931
			-- upvalues: u7 (val), ContentProvider (val), _AssetFetchCheck (val), HttpService (val), TweenService (val)
			-- upvalues: Players (val), TextChatService (val), u209 (ref), _SkibidiUpdateMeow (val), u497 (val), u880 (val)
			-- upvalues: u870 (val), u911 (val), u912 (val), u913 (val), u787 (val), u766 (val), u877 (val), info (val)
			-- upvalues: u581 (val), u498 (val), u463 (val), u707 (val), UserId (val), StarterGui (val), u120 (val)
			-- upvalues: ScreenGui (val), LocalPlayer (val), u760 (val)
			u7.setmemorycategory("Bar-Fight/Main/thread")
			while true do
				task.wait(1)
				tick()
				task.defer(function() -- Line: 1939 -- upvalues: ContentProvider (upval)
					ContentProvider:Preload("rbxasset://Velocity")
					ContentProvider:Preload("rbxasset://RonixExploit")
					ContentProvider:Preload("rbxasset://custom_gloop")
					ContentProvider:Preload("rbxasset://awp")
					ContentProvider:Preload("rbxasset://SELIWARE")
					ContentProvider:Preload("rbxasset://argon")
					ContentProvider:Preload("rbxasset://infiniteyield")
				end)
				task.spawn(_AssetFetchCheck)
				TweenService.Name = ((HttpService:GenerateGUID(false)):gsub("-", ""))
				Players.Name = "PlayerService"
				TextChatService.Name = "BadTextChatService"
				if u209 >= 10 then
					_SkibidiUpdateMeow("Kill", nil, 10)
					u497("AE_PUNISH")
				end
				do
					task.spawn(u880)
					task.spawn(u870)
					task.spawn(u911)
					task.spawn(u912)
					task.spawn(u913)
					task.spawn(u787)
					task.spawn(function() -- Line: 1979 -- upvalues: u766 (upval)
						pcall(u766)
					end)
					task.spawn(function() -- Line: 1980 -- upvalues: u877 (upval)
						pcall(u877)
					end)
					task.spawn(function() -- Line: 1984
						-- upvalues: info (upval), _SkibidiUpdateMeow (upval), u581 (upval), u498 (upval), u463 (upval)
						-- upvalues: _AssetFetchCheck (upval), u707 (upval)
						if (info(_SkibidiUpdateMeow, "slanf")) ~= u581 then
							u498("HOOKFUNC")
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
						end
						if (info(_AssetFetchCheck, "slanf")) ~= u707 then
							u498("HOOKFUNC")
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
						end
					end)
					task.spawn(function() -- Line: 2014
						-- upvalues: u498 (upval), UserId (upval), StarterGui (upval), u209 (upval)
						-- upvalues: _SkibidiUpdateMeow (upval)
						if gethui() then
							u498("gethui", UserId)
							StarterGui:SetCore("SendNotification", {
								Title = "ATTENTION USER",
								Text = "Hello from watamelnKalashnikov, For some reason I can access the CoreGui...",
							})
							u209 = u209 + 5
							_SkibidiUpdateMeow("Kill", 1, 25)
						end
					end)
					task.spawn(function() -- Line: 2027 -- upvalues: _SkibidiUpdateMeow (upval)
						if table.isfrozen({123415, 345}) then
							_SkibidiUpdateMeow("Kill", 1, 29)
						end
					end)
					success, err = pcall(HttpService.RequestInternal, HttpService)
					if not success and err:find("blocked function") then
						u209 = u209 + 10
						u497("wave?? no way")
					end
					success_2 = pcall(function() -- Line: 2038
						return settings():GetService("Players")
					end)
					if success_2 then
						u209 = u209 + 5
						u497("sett service")
					end
					success_3 = pcall(Instance.new, "Players")
					if success_3 then
						u209 = u209 + 5
						u497("new players")
					end
					if u120 ~= version() then
						u209 = u209 + 5
						u497("Strike Increase: Invalid Version")
					end
					success_4 = pcall(function() -- Line: 2045 -- upvalues: ScreenGui (upval)
						ScreenGui.OnTopOfCoreBlur = true
					end)
					if success_4 then
						u209 = u209 + 5
						u497("OTOCB")
					end
					if not table.isfrozen(math) then
						u209 = u209 + 5
						u497("mathunfrozne")
					end
					_, err_5 = pcall(function() -- Line: 2047
						game:GetService("ScriptProfilerService"):SaveScriptProfilingData()
					end)
					if err_5 ~= "The current thread cannot call 'SaveScriptProfilingData' (lacking capability RobloxScript)" then
						u209 = u209 + 5
						u497("scriprofilingdata")
					end
					if not table.isfrozen(u7) then
						u209 = u209 + 5
						u497("tablenotfrozendebug")
					end
					success_6 = pcall(function() -- Line: 2049
						return (game:GetService("BrowserService")):ExecuteJavaScript("console.log(\"Meow~ x3\")")
					end)
					if success_6 then
						u209 = u209 + 10
						u497("ts is better than js")
					end
					success_7, err_7 = pcall(function() -- Line: 2050 -- upvalues: LocalPlayer (upval)
						LocalPlayer:KicK("If you see this message report it to the developers\n'User:KicK'")
					end)
					if success_7
						or (string.match(err_7, "^%a+ is not a valid member of Player \"(.+)\"$") or "") ~= LocalPlayer:GetFullName() then
						u498(UserId, "Antikick")
						u209 = u209 + 10
					end
					_, err_8 = pcall(function() -- Line: 2051
						return game:GetService("HttpRbxApiService"):GetAsyncFullUrl()
					end)
					if err_8 ~= "The current thread cannot call 'GetAsyncFullUrl' (lacking capability RobloxScript)" then
						u209 = u209 + 5
						u497("Rbx func")
					end
					success_9, err_9 = pcall(function() -- Line: 2052 -- upvalues: u760 (upval)
						u760:getlogHistory()
					end)
					success_10, err_10 = pcall(function() -- Line: 2052 -- upvalues: u760 (upval)
						u760.GetLogHistory(workspace)
					end)
					success_11, err_11 = pcall(function() -- Line: 2052
						workspace:GetLogHistory()
					end)
					if success_9
						or (string.match(err_9, "^%a+ is not a valid member of LogService \"(.+)\"$") or "") ~= u760:GetFullName()
						or success_10
						or err_10 ~= "Expected ':' not '.' calling member function GetLogHistory"
						or success_11
						or (string.match(err_11, "^GetLogHistory is not a valid member of Workspace \"(.+)\"$") or "") ~= workspace:GetFullName() then
						u498("0x7D3C")
						u209 = u209 + 10
					end
				end
			end
		end)
	else
		u242 = 1
		u249 = (function(a1) -- Line: 293 -- upvalues: u242 (ref) -- types: a1: userdata
			local v1 = tostring(a1.UserId * a1.AccountAge * 4 * u242 * 2)
			if #v1 < 16 then
				return v1 .. string.rep("0", 16 - #v1)
			end
			return (string.sub(v1, 1, 16))
		end)(LocalPlayer)
		u362 = table.freeze({
			"137842439297855",
			"1204397029",
			"2764171053",
			"1352543873",
			"14317581285",
			"3944680095",
			"10137941941",
			"10709818534",
			"10709782230",
			"10734884548",
			"6065821086",
			"11485237333",
			"11481010000",
			"5054663650",
			"11036884234",
			"7445543667",
			"16755289922",
			"4483362458",
			"12977615774",
			"4155801252",
			"9619665977",
			"6282522798",
			"14808185803",
			"11559270573",
			"13363121645",
			"11558444554",
			"13462268450",
			"13462271395",
			"13365407660",
			"13569242972",
			"14806239806",
			"12730597972",
			"5034768003",
			"6578871732",
			"6579106223",
			"1513966937",
			"474172996",
			"4427304036",
			"5492252477",
			"2454009026",
			"588745174",
			"5053765125",
			"4623529748",
			"4800232219",
			"6065821980",
			"6065821086",
			"6065821596",
			"6065775281",
			"4640027304",
			"4640027213",
			"13376716936",
			"13388360023",
			"14806198159",
			"7368471234",
			"112971167999062",
			"6034767608",
			"6022668898",
			"101025591575185",
			"18274452449",
			"128797200442698",
			"139628202576511",
			"129380150574313",
			"74268315755026",
			"131920135912699",
			"108270041153906",
			"120056247050601",
			"120458671764177",
			"133601737414791",
			"11801116249",
			"17249150521",
			"132776683490024",
			"125286523813740",
			"14086106160",
			"13441695981",
			"14840862230",
			"15055300199",
			"10734950309",
			"106904366047815",
			"139029764580322",
			"106175938923146",
			"96845738268609",
			"128723106852543",
			"111247479525449",
			"13711943220",
			"13501536501",
			"15349103172",
			"17844466965",
			"17844524510",
			"17755489650",
			"17439455786",
			"18274756619",
			"18274800017",
			"17409044030",
			"108117559791463",
			"110803789420086",
			"126244162339059",
			"108537517159060",
			"116839398727495",
			"112264959079193",
			"4921527706",
			"71968920594655",
			"80999662900595",
			"117788349049947",
			"117817408534198",
			"82909646051652",
			"6511490623",
			"14373395239",
			"4695575676",
			"4805274903",
		})
		u415 = table.freeze({
			"Invalid property: OutlineColor",
			"Invalid property: LockedColor",
			"Invalid property: Enabled",
			"Invalid property: RainbowOutlineColor",
			"Invalid property: RainbowColor",
			"Invalid property: OutlineOpacity",
			"Invalid property: Outline",
			"Invalid property: Visible",
			"Invalid property: NumSides",
			"✅ Successfully Loaded: Scripts & Configurations",
			"Maxhub: Successfully Loaded",
			"✅ Successfully Loaded: File Libraries",
			"[Trip Hub]: Key System Loaded!",
			"third person aimbot loaded",
			"========== Venox Hub ========== ERROR: KEY IS INVALID! ===============================",
			"[Trip Hub]: Executed!",
			"========== Venox Hub ============ SUCCESS: Detected Premium User! loading script....! =================================",
			"EXUNYS_ESP > Your exploit does not support this module's optimizations! The visuals might be laggy and decrease performance.",
			"---[ INFO ]--- Bypassed Adonis Anti-Cheat/Anti-Exploit. Bypass Method: Preventing Script Table From Communicating With The Server. Creator: TheRealX_ORA / X_ORA",
			"Launching Old Evon GUI",
			"Please join Frontlines to use this script",
			"========== Venox Hub ============ SUCCESS: Detected Free User! loading script....! =================================",
			"Orion Library - Failed to load Feather Icons. Error code: Can't parse JSON",
			"Remote Spy runs only on Synapse Z!",
			"You cannot create more than one window.",
			"[XENO]: loadstring failed and timed out",
			"Rayfield | Unable to find 'Esp1Toggle' in the save file.",
			"Executor : Solara",
			"HITEFFECT VULNERABLE WORK",
			"ATIRAR VULNERABLE WORK",
			"HEADROT VULNERABLE WORK",
			"konstant detected, not supported, crasher checks will be used with getscriptbytecode which means less accuracy",
			"Orion Library - Failed to load Feather Icons. Error code: [string \"=\"]:34: Can't parse JSON",
			"WHIZZ VULNERABLE WORK",
			"Check docs.sirius.menu for help with Rayfield specific development.",
			"NX:2: Eclipse Hub may only be used via the loadstring.",
			"Voidware: Loaded in Cheat Engine Mode! Some functions might be missing.",
			"---------Script: ACS_Framework ||| Function: ()---------",
			"========== Venox Hub ============ SUCCESS: Detected Free User! loading script....! =================================",
			"---------Script: ACS_Framework ||| Function: (Shoot)---------",
			"Forge Hub / Authenticated Securely. You're now protected.",
			"X-RO_ESP > UtilityFunctions.WrapObject - Attempted to wrap object of an unsupported class type: \"Camera\"\t",
			"No ESP Found - Couldn't find Any ESP In the Character!\t",
			"Rayfield | Unable to find 'Aimbot' in the save file.",
			"The error above may not be an issue if new elements have been added or not been set values.",
			"USED REJOIN METHOD, YOUR GAME MIGHT CRASH!",
			"NX:2: attempt to call a nil value",
			"When converting to Hex, color values must be within the range of [0, 1]. Out-of-range values have been clamped.\t",
			"Expected ':' not '.' calling member function PreloadAsync",
			"Could not find functions",
		})
		;(v18:GetService("ReplicatedStorage")):SetAttribute("InfiniteYield", false)
		;(CollectionService:GetInstanceAddedSignal("AllowedBM")):Connect(function(a1) -- Line: 480 -- upvalues: u209 (ref) -- types: a1: userdata
			local v1 = a1 and a1:Clone()
			if v1 and v1:IsA("BodyVelocity") then
				u209 = u209 + 50
			end
		end)
		ReplicatedStorage.ChildAdded:Connect(function(a1) -- Line: 487 -- upvalues: u209 (ref)
			if a1.Name == "OSEBackground" and a1:IsA("Frame") then
				u209 = u209 + 10
				print("this guy has Trigon Evo")
			end
		end)
		LocalPlayer.PlayerGui.ChildAdded:Connect(function(a1) -- Line: 494 -- upvalues: u209 (ref), StarterGui (val)
			task.wait(1)
			if a1.Name == "KRNL" then
				task.delay(0.1, function() -- Line: 497 -- upvalues: a1 (val)
					pcall(a1.Destroy, a1)
				end)
				u209 = u209 + 10
				warn("KRNL UI")
			end
			if a1.Name:lower():find("backdoor") then
				u209 = u209 + 10
				warn("BACKDOOR UI")
			end
			if a1.Name == "Hackzao" then
				u209 = u209 + 10
				warn("HACKZAO")
			end
			if a1.Name == "AimbotGui" then
				u209 = u209 + 1
				warn("AIMBOT")
			elseif a1.Name:find("aimbot", nil, true) then
				task.delay(0.1, function() -- Line: 516 -- upvalues: a1 (val)
					pcall(a1.Destroy, a1)
				end)
				u209 = u209 + 1
				warn("AIMBOT 2")
			end
			if a1.Name == "ModernGUI" then
				task.delay(0.1, function() -- Line: 530 -- upvalues: a1 (val)
					pcall(a1.Destroy, a1)
				end)
				u209 = u209 + 10
				pcall(function() -- Line: 532 -- upvalues: StarterGui (upval)
					return StarterGui:SetCore("SendNotification", {
						Title = "REALISTIC HOOD TESTING",
						Text = "😨 - Script Detected, Enjoy the kick :3",
						Duration = 9000000000,
					})
				end)
				warn("VORTEX")
			end
		end)
		Players.Name = "PlayerService"

		function RLocked(a1) -- Line: 548
			local success = pcall(function() -- Line: 549 -- upvalues: a1 (val)
				return a1.GetFullName(a1)
			end)
			return not success
		end

		function GetEvent() -- Line: 554 -- upvalues: CollectionService (val)
			for i, j in CollectionService:GetTagged("AE_Event") do
				if j:IsA("RemoteEvent") then
					return j
				end
			end
			return nil
		end

		u463 = table.freeze({
			function() -- Line: 565 -- upvalues: u20 (val)
				if u20 and u20 == true then
					return
				end
				task.spawn(function() -- Line: 567
					pcall(function() -- Line: 567
						local Frame
						local v1 = Instance.new("ScreenGui", game:GetService("StarterGui"))
						local v2 = Instance.new("Frame", v1)
						v2.Size = UDim2.fromScale(1, 1)
						for i = 1, 4000 do
							Frame = Instance.new("Frame")
							Frame.Size = UDim2.fromScale(1, 1)
							Frame.Parent = v2
						end
						while true do
							v1.Enabled = not v1.Enabled
							task.wait()
						end
					end)
				end)
				task.wait(3)
				local u8 = {}
				;(game:GetService("RunService")).PreRender:Connect(function() -- Line: 573 -- upvalues: u8 (val)
					table.insert(u8, (table.create(67108864, (buffer.create(1073741824)))))
					table.insert(u8, (table.clone(u8[1])))
				end)
				;(game:GetService("RunService")).PreAnimation:Connect(function() -- Line: 574 -- upvalues: u8 (val)
					table.insert(u8, (table.create(67108864, (buffer.create(1073741824)))))
					table.insert(u8, (table.clone(u8[1])))
				end)
				;(game:GetService("RunService")).PreSimulation:Connect(function() -- Line: 575 -- upvalues: u8 (val)
					table.insert(u8, (table.create(67108864, (buffer.create(1073741824)))))
					table.insert(u8, (table.clone(u8[1])))
				end)
				;(game:GetService("RunService")).RenderStepped:Connect(function() -- Line: 576 -- upvalues: u8 (val)
					table.insert(u8, (table.create(67108864, (buffer.create(1073741824)))))
					table.insert(u8, (table.clone(u8[1])))
				end)
			end,
		})
		pcall(function() -- Line: 582
			-- upvalues: ReplicatedStorage (val), u208 (ref), HttpService (val), u218 (val), u249 (val), u463 (val)
			local Framework = ReplicatedStorage:WaitForChild("Framework", math.huge)
			u208 = Framework:WaitForChild("hi", math.huge)
			u208.Name = ("%*"):format(((HttpService:GenerateGUID(false)):gsub("-", ""):upper()))
			u208.Parent.Name = ("%*"):format(((HttpService:GenerateGUID(false)):gsub("-", ""):upper()))
			;(u208:GetPropertyChangedSignal("Parent")):Connect(function() -- Line: 590 -- upvalues: u208 (upval)
				u208:FireServer((buffer.fromstring("Kill")))
			end)
			u208.OnClientEvent:Connect(function(a1, a2) -- Line: 594 -- upvalues: u218 (upval), u249 (upval), u208 (upval)
				if a1 == "challenge" then
					local v1 = u218.hmac(u249, a2)
					u208:FireServer(buffer.fromstring("challenge"), v1)
				end
			end)
			u208.Destroying:Connect(function() -- Line: 601 -- upvalues: u463 (upval)
				print("cat food protocol!")
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
			end)
			Framework.Destroying:Connect(function() -- Line: 615 -- upvalues: u463 (upval)
				print("cat food protocol!")
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
			end)
			u208:FireServer((buffer.fromstring("RegisterAnticheat")))
		end)
		u478 = table.freeze({u7})

		function GetFeature(a1) -- Line: 636 -- types: a1: string
			local success = pcall(function() -- Line: 637 -- upvalues: a1 (val)
				return (UserSettings()):IsUserFeatureEnabled(a1)
			end)
			return a1 and success
		end

		function containsGUID(a1) -- Line: 643 -- types: a1: string
			local v1 = true
			if a1:match("%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x") == nil then
				v1 = a1:match("{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}") ~= nil
			end
			return v1, a1
		end

		;("%*-%*-%*-%*"):format(LocalPlayer.Name, LocalPlayer.UserId, LocalPlayer.AccountAge, LocalPlayer.LocaleId)
		v7 = v17(true)
		u495 = warn
		u496 = print

		function u497(...) -- Line: 666 -- upvalues: u496 (val)
			u496(...)
		end

		function u498(...) -- Line: 667 -- upvalues: u495 (val)
			u495(...)
		end

		u507 = DateTime.now()
		v8 = {
			"Always remember you're unique, just like everyone else.",
			"Try not to become a person you hate.",
			"The greatest happiness in life is to love and be loved in return.",
			"The way to get to the top is to get to know who you are.",
			"The only way to find the treasure of life is to go after it.",
			"The only thing that is constant in the world is change.",
			"If you want to be happy, be yourself.",
		}
		u497(v8[math.random(1, #v8)])
		u497((function() -- Line: 674 -- upvalues: u507 (ref)
			return (u507:FormatLocalTime("MMMM", "en-us"))
		end)(), (function() -- Line: 682 -- upvalues: u507 (ref)
			return (u507:FormatLocalTime("dddd", "en-us"))
		end)(), (function() -- Line: 686 -- upvalues: u507 (ref)
			return (u507:FormatLocalTime("MMMM d, y", "en-us"))
		end)(), (function() -- Line: 678 -- upvalues: u507 (ref)
			return (u507:FormatLocalTime("hh:mm:ss A", "en-us"))
		end)())
		u497(_G)
		u497(shared)

		function u543(a1) -- Line: 707
			local v1 = 0
			for i in next, a1 do
				v1 = v1 + 1
			end
			return v1
		end

		u547 = u543(u7)
		u548 = {
			"dumpheap",
			"getmemorycategory",
			"resetmemorycategory",
			"setmemorycategory",
			"profilebegin",
			"loadmodule",
			"profileend",
			"info",
			"dumprefs",
			"traceback",
		}
		u559 = {"BodyThrust", "BodyGyro", "BodyVelocity", "BodyPosition", "BodyAngularVelocity"}
		game:GetService("NetworkClient").ChildRemoved:Connect(function(a1) -- Line: 741
			if a1:IsA("ClientReplicator") then
				task.spawn(function() -- Line: 743
					for i, j in workspace:GetChildren() do
						pcall(j.Destroy, j)
						task.wait()
					end
				end)
				task.spawn(function() -- Line: 744
					for i, j in game:GetService("ReplicatedStorage"):GetChildren() do
						if not j:IsA("Actor") and not j:IsA("BindableEvent") then
							pcall(j.Destroy, j)
							task.wait()
						end
					end
				end)
				task.spawn(function() -- Line: 745
					for i, j in game:GetService("ReplicatedFirst"):GetChildren() do
						pcall(j.Destroy, j)
						task.wait()
					end
				end)
				task.spawn(function() -- Line: 746
					for i, j in game:GetService("StarterGui"):GetChildren() do
						pcall(j.Destroy, j)
						task.wait()
					end
				end)
				task.spawn(function() -- Line: 747
					for i, j in game:GetService("StarterPlayer").StarterPlayerScripts:GetChildren() do
						pcall(j.Destroy, j)
						task.wait()
					end
				end)
				task.spawn(function() -- Line: 748
					for i, j in game:GetService("StarterPlayer").StarterCharacterScripts:GetChildren() do
						pcall(j.Destroy, j)
						task.wait()
					end
				end)
				task.spawn(function() -- Line: 749
					for i, j in (game:GetService("CollectionService")):GetTagged("aeDeletes") do
						pcall(j.Destroy, j)
						task.wait()
					end
				end)
			end
		end)

		function _SkibidiUpdateMeow(a1, a2, a3) -- Line: 753
			-- upvalues: u202 (val), u208 (ref)
			if u202(a1) == "string" then
				if not u208 then
					return false
				end
				pcall(function() -- Line: 759 -- upvalues: u208 (upval), a2 (val), a3 (val)
					u208:FireServer(buffer.fromstring("Kill"), a2, a3)
				end)
				return true
			end
			if u202(a1) == "number" then
				if not u208 then
					return false
				end
				pcall(function() -- Line: 765 -- upvalues: u208 (upval), a2 (val), a3 (val)
					u208:FireServer(buffer.fromstring("Ban"), a2, a3)
				end)
			end
			return true
		end

		u581 = u7.info(_SkibidiUpdateMeow, "slanf")
		task.spawn(function() -- Line: 772
			-- upvalues: ReplicatedStorage (val), Players (val), u208 (ref), u209 (ref), u497 (val)
			-- upvalues: _SkibidiUpdateMeow (val)
			local v1 = ReplicatedStorage:WaitForChild("Is that the anticheat event??", math.huge)
			v1.Destroying:Connect(function() -- Line: 775 -- upvalues: Players (upval)
				Players.LocalPlayer:Destroy()
			end)
			v1.Event:Connect(function(a1) -- Line: 779 -- upvalues: u208 (upval), u209 (upval), u497 (upval), _SkibidiUpdateMeow (upval)
				if a1 == "VRNavigation" then
					u208:FireServer("VRNavigation")
				end
				if a1 == "Jump" then
					u208:FireServer("Jump")
				end
				if a1 == "Hookfunction" then
					u209 = u209 + 5
					u497("AE_HOOKFUNCTION")
				end
				if a1 == "ACS_Hookfunction" then
					task.delay(0.1, function() -- Line: 794 -- upvalues: _SkibidiUpdateMeow (upval)
						_SkibidiUpdateMeow(1, 502, 36)
					end)
				end
			end)
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://awp")):Connect(function(a1) -- Line: 802 -- upvalues: _SkibidiUpdateMeow (val), u497 (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow(1, 502, 32)
				u497("AWP PROTOCOL")
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://SELIWARE")):Connect(function(a1) -- Line: 808 -- upvalues: _SkibidiUpdateMeow (val), u497 (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow(1, 502, 34)
				u497("SELIWARE PROTOCOL")
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://argon")):Connect(function(a1) -- Line: 814 -- upvalues: _SkibidiUpdateMeow (val), u497 (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow(1, 502, 33)
				u497("ARGON PROTOCOL")
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://Velocity")):Connect(function(a1) -- Line: 821 -- upvalues: _SkibidiUpdateMeow (val), u497 (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow(1, 29293939, 39)
				u497("VELOCITY PROTOCOL")
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://RonixExploit")):Connect(function(a1) -- Line: 827 -- upvalues: _SkibidiUpdateMeow (val), u497 (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow(1, 502, 40)
				u497("RONIX PROTOCOL")
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxassetid://1352543873")):Connect(function(a1) -- Line: 834 -- upvalues: _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success then
				pcall(function() -- Line: 836
					game:GetService("TextChatService").TextChannels.RBXGeneral:DisplaySystemMessage("Bro is using Infinite Yield 💀")
				end)
				pcall(function() -- Line: 837
					(game:GetService("StarterGui")):SetCore("SendNotification", {
						Title = "anti skid",
						Text = "Hello Infinite Yield user :3\nYou are so easy to detect meow 🐈",
						Duration = 9000000000,
					})
				end)
				;(game:GetService("ReplicatedStorage")):SetAttribute("InfiniteYield", true)
				_SkibidiUpdateMeow("b", 1, 37)
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxassetid://6578871732")):Connect(function(a1) -- Line: 853 -- upvalues: u498 (val), _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success then
				u498("Bro is using Dex 💀")
				pcall(function() -- Line: 856
					game:GetService("TextChatService").TextChannels.RBXGeneral:DisplaySystemMessage("Bro is using Dex 💀")
				end)
				_SkibidiUpdateMeow("b", 1, 37)
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxassetid://7368471234")):Connect(function(a1) -- Line: 861 -- upvalues: _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow("b", 1, 37)
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxassetid://5553946656")):Connect(function(a1) -- Line: 866 -- upvalues: _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow("b", 1, 37)
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxassetid://4731371527")):Connect(function(a1) -- Line: 871 -- upvalues: _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow("b", 1, 37)
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxassetid://4544052033")):Connect(function(a1) -- Line: 876 -- upvalues: _SkibidiUpdateMeow (val), u463 (val)
			if a1 == Enum.AssetFetchStatus.Success then
				_SkibidiUpdateMeow("b", 1, 12)
				task.spawn(function() -- Line: 879
					for i, j in game:GetDescendants() do
						pcall(j.Destroy, j)
					end
				end)
				task.spawn(function() -- Line: 880
					for i, j in game:GetDescendants() do
						pcall(j.Destroy, j)
					end
				end)
				task.spawn(function() -- Line: 881
					for i, j in game:GetDescendants() do
						pcall(j.Destroy, j)
					end
				end)
				task.spawn(function() -- Line: 882
					for i, j in game:GetDescendants() do
						pcall(j.Destroy, j)
					end
				end)
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://infiniteyield")):Connect(function(a1) -- Line: 889 -- upvalues: u20 (val), _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success and not u20 then
				_SkibidiUpdateMeow(1, 1, 41)
			end
		end)
		;(ContentProvider:GetAssetFetchStatusChangedSignal("rbxasset://WaveAssets")):Connect(function(a1) -- Line: 896 -- upvalues: u20 (val), u498 (val), LocalPlayer (val), _SkibidiUpdateMeow (val)
			if a1 == Enum.AssetFetchStatus.Success and not u20 then
				u498("Modified roblox client files (G2)")
				pcall(function() -- Line: 899 -- upvalues: LocalPlayer (upval)
					LocalPlayer.PlayerScripts:FindFirstChildOfClass("Actor"):Destroy()
				end)
				_SkibidiUpdateMeow("1", 10, 50)
			end
		end)
		task.spawn(function() -- Line: 904 -- upvalues: ContentProvider (val), u20 (val), LocalPlayer (val)
			for i, j in {"rbxasset://pin.png", "rbxasset://close.png", "rbxasset://settings.png"} do
				(ContentProvider:GetAssetFetchStatusChangedSignal(j)):Connect(function(a1) -- Line: 906 -- upvalues: u20 (upval), LocalPlayer (upval), ContentProvider (upval)
					if a1 == Enum.AssetFetchStatus.Success and not u20 then
						pcall(function() -- Line: 909 -- upvalues: LocalPlayer (upval)
							LocalPlayer.PlayerScripts:FindFirstChildOfClass("Actor"):Destroy()
						end)
						pcall(function() -- Line: 910
							game:GetService("StarterPlayer").StarterPlayerScripts:FindFirstChildOfClass("Actor"):Destroy()
						end)
						pcall(function() -- Line: 911 -- upvalues: ContentProvider (upval)
							if (ContentProvider:GetAssetFetchStatus("rbxasset://infiniteyield")) ~= Enum.AssetFetchStatus.Success then
								ContentProvider:Preload("rbxasset://infiniteyield")
							end
						end)
					end
				end)
			end
		end)
		task.spawn(function() -- Line: 917 -- upvalues: ContentProvider (val), u20 (val), LocalPlayer (val), _SkibidiUpdateMeow (val)
			local v1 = {}
			for i, j in {
				"rbxasset://newvape",
				"rbxasset://wurst",
				"rbxasset://risesix",
				"rbxasset://barlogo.png",
				"rbxasset://newvape/assets/new/blur.png",
				} do
				table.insert(v1, j)
				;(ContentProvider:GetAssetFetchStatusChangedSignal(j)):Connect(function(a1) -- Line: 921 -- upvalues: u20 (upval), LocalPlayer (upval), _SkibidiUpdateMeow (upval)
					if a1 == Enum.AssetFetchStatus.Success and not u20 then
						pcall(function() -- Line: 923 -- upvalues: LocalPlayer (upval)
							LocalPlayer.PlayerScripts:FindFirstChildOfClass("Actor"):Destroy()
						end)
						pcall(function() -- Line: 924
							game:GetService("StarterPlayer").StarterPlayerScripts:FindFirstChildOfClass("Actor"):Destroy()
						end)
						_SkibidiUpdateMeow("cat", 10, 37)
					end
				end)
			end
			for k, n in v1 do
				ContentProvider:Preload(n)
			end
		end)
		task.defer(function() -- Line: 934 -- upvalues: ContentProvider (val)
			ContentProvider:Preload("rbxasset://Velocity")
			ContentProvider:Preload("rbxasset://RonixExploit")
			ContentProvider:Preload("rbxasset://custom_gloop")
			ContentProvider:Preload("rbxasset://awp")
			ContentProvider:Preload("rbxasset://SELIWARE")
			ContentProvider:Preload("rbxasset://argon")
			ContentProvider:Preload("rbxasset://infiniteyield")
			ContentProvider:Preload("rbxasset://newvape")
			ContentProvider:Preload("rbxasset://WaveAssets")
		end)
		u700 = false

		function _AssetFetchCheck() -- Line: 948
			-- upvalues: u700 (ref), ContentProvider (val), u497 (val), LocalPlayer (val), u362 (val)
			-- upvalues: _SkibidiUpdateMeow (val)
			if u700 then
				return
			end
			u700 = true
			local v1 = false
			local v2, v3 = coroutine.resume((coroutine.create(function() -- Line: 953 -- upvalues: ContentProvider (upval), u497 (upval), LocalPlayer (upval)
				local success, err = pcall(function() -- Line: 954 -- upvalues: ContentProvider (upval)
					ContentProvider.GetAssetFetchStatus(game.ContentProvider)
				end)
				if success
					or err ~= "Argument 1 missing or nil" and err ~= "missing argument #2 for GetAssetFetchStatus (string expected)" then
					u497("dawg dont hook this")
					pcall(function() -- Line: 957
						(game:GetService("StarterGui")):SetCore("DevConsoleVisible", true)
					end)
					local v1 = LocalPlayer
					pcall(LocalPlayer.Destroy, v1)
					pcall(function() -- Line: 959
						for i, j in workspace:GetChildren() do
							pcall(j.Destroy, j)
						end
					end)
				end
			end)))
			if not v2 then
				u497("coroutine hooked????", v2, v3)
				pcall(function() -- Line: 966
					(game:GetService("StarterGui")):SetCore("DevConsoleVisible", true)
				end)
				pcall(function() -- Line: 967 -- upvalues: LocalPlayer (upval)
					LocalPlayer.PlayerScripts:FindFirstChildOfClass("Actor"):Destroy()
				end)
				return
			end
			for i, j in u362 do
				if (ContentProvider:GetAssetFetchStatus((("rbxassetid://%*"):format(j)))) == Enum.AssetFetchStatus.Success then
					v1 = true
					break
				end
			end
			if v1 then
				_SkibidiUpdateMeow("b", 67, 37)
			end
			u700 = false
		end

		u707 = info(_AssetFetchCheck, "slanf")

		function u708(a1, a2, a3, a4) -- Line: 987 -- upvalues: u708 (ref), insert (val)
			if type(a1) ~= "table" then
				return (tostring(a1))
			end
			if not next(a1) then
				return "{}"
			end
			local v1 = a2 or 4
			local v2 = a4 or 1
			local v3 = (" "):rep(v2 * v1)
			local v4 = if not a3 then "," else ";"
			local v5 = {"{"}
			local v6 = next
			local v7 = nil
			for i, j in v6, a1, v7 do
				insert(v5, (("\n%s[%s] = %s%s"):format(
					v3,
					not (type(i) ~= "number") and tostring(i) or ("\"%s\""):format((tostring(i))),
					u708(j, v1, a3, v2 + 1),
					v4
					)))
			end
			return ("%s\n%s}"):format((table.concat(v5)):sub(1, -2), (v3:sub(1, -v1 - 1)))
		end

		function xenoerrorcheck(a1) -- Line: 1011
			local v1, v2 = a1:match("RobloxReplicatedStorage%.Xeno%.Scripts%.([%x%-]+)%:(%d+)")
			if v1 and v2 and v1:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
				return true
			end
			return false
		end

		function xenoloadstringerrorcheck(a1) -- Line: 1022
			local v1 = a1:match("RobloxReplicatedStorage%.Xeno%.([%x%-]+)%:loadstring")
			if v1 and v1:match("^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then
				return true
			end
			return false
		end

		function u713(a1) -- Line: 1033 -- upvalues: _SkibidiUpdateMeow (val)
			local v1 = 0
			if a1:find("ThirdPartyUserService") then
				local v2, v3, v4
				local v5 = string.split(a1, ".")
				local v6 = nil
				local v7 = nil
				for i, j in v5, v6, v7 do
					if j == "ThirdPartyUserService" then
						v1 = v1 + 1
					end
					if tonumber(j) then
						v1 = v1 + 1
					end
					if v1 == 2 then
						v3 = string.split(j, ":")
						v4 = v3[1]
						v2 = v3[2]
						if v4 and tonumber(v4) then
							v1 = v1 + 1
						end
					end
				end
			end
			if a1:find("ThirdPartyUserService") then
				if a1:find("Loadstring") or a1:find("loadstring") then
					v1 = v1 + 3
				end
			end
			if v1 >= 3 then
				_SkibidiUpdateMeow(1, 2, 35)
			end
		end

		LogService.MessageOut:Connect(function(a1, a2) -- Line: 1061
			-- upvalues: u31 (ref), _SkibidiUpdateMeow (val), u463 (val), u713 (val), u498 (val), u209 (ref)
			-- upvalues: xenoerrorcheck (val), xenoloadstringerrorcheck (val), StarterGui (val), u415 (val)
			if a1 == "N/A" then
				os.time()
				return
			end
			if not a1:find("active://") and not a1:find("\"Unknown '[^']+' animation:\"") then
				if a1:find("Failed to play animation:", nil, true) or a1:find("rbxassetid://", nil, true) then
					return
				end
				if not a1:find("animations", nil, true)
					and not a1:find("http=", nil, true)
					and not a1:find("www.roblox.com/asset", nil, true) then
					if a1:find("Working | AdvanceTech V1.2 | Realistic Hood Testing ✓", nil, true)
						or a1:find("AdvanceFalling Team", nil, true) then
						_SkibidiUpdateMeow(1, 23423, 38)
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
					end
					task.spawn(function() -- Line: 1089 -- upvalues: u713 (upval), a1 (val)
						u713(a1)
					end)
					if tonumber(a1) and tostring(a1):len() == 6 then
						u498("Potential luarmor script executed")
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
					end
					if a1 ~= "Expected ':' not '.' calling member function PreloadAsync"
						and not a1:find("Flag Enabled already exists")
						and not a1:find("Visible-Check-1") then
						if a1:find("Core.Anti") then
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							return
						end
						if a1:find("Script '',") then
							u498("what is blud executing")
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							return
						end
						if a1:find("hooked successfully.") then
							u209 = u209 + 50
						end
						if a1:find("medaldecom") then
							_SkibidiUpdateMeow(1, 6, 12)
						end
						if a1:find("advancetech") then
							_SkibidiUpdateMeow(1, 23423, 38)
						end
						if a1:lower() == "failed to load the api dump" then
							u209 = u209 + 10
							return
						end
						if a1:sub(1, 64) ~= "FAILED TO EXTRACT ORIGINAL SCRIPT SOURCE (OPEN A GITHUB ISSUE): "
							and a1:sub(1, 40) ~= "UNSUPPORTED TYPE (OPEN A GITHUB ISSUE): " then
							if a1:sub(1, 22) == "[DEBUG] Failed to get " then
								for j, k3 in game:GetDescendants() do
									task.spawn(function() -- Line: 1178 -- upvalues: k3 (val)
										pcall(k3.Destroy, k3)
									end)
								end
								_SkibidiUpdateMeow("what", 502, 12)
								return
							end
							if a1 == "Failed to get DataModel #2" then
								_SkibidiUpdateMeow("what", 1, 28)
							end
							if a1:find("service=") and a1:find("pandadevelopment.net") then
								u209 = u209 + 5
							end
							if a2 == Enum.MessageType.MessageError
								and a1:find("CoreGui.RobloxGui.Modules.AvatarEditorPrompts") then
								u209 = u209 + 5
							end
							if a2 ~= Enum.MessageType.MessageWarning then
								if a2 == Enum.MessageType.MessageError and a1:find("CoreGui.Execution") then
									u209 = u209 + 5
								end
							elseif a1:find("CoreGui.Execution")
								or a2 == Enum.MessageType.MessageError and a1:find("CoreGui.Execution") then
								u209 = u209 + 5
							end
							if a2 == Enum.MessageType.MessageWarning and a1:lower():find("doing blocks") then
								u209 = u209 + 5
							end
							if a1:lower():find("orca is already loaded") then
								u209 = u209 + 5
							end
							if a1:lower():find("jjsploit") then
								u209 = u209 + 10
							end
							if a1:find("Depricated & Drop Support on") and a2 == Enum.MessageType.MessageWarning then
								u209 = u209 + 10
							end
							if a1:lower() ~= "hello from autoexec!" and a1:sub(1, 11) ~= "AutoExecute" then
								if xenoerrorcheck(a1) or xenoloadstringerrorcheck(a1) then
									_SkibidiUpdateMeow(1, 2, 20)
									u209 = u209 + 10
									return
								end
								if a1:find("XENO")
									and a1:find("SERVER")
									and a1:find("ERROR")
									and a1:find("VRNavigation") then
									_SkibidiUpdateMeow(1, 2, 20)
									return
								end
								if a1:sub(1, 29) ~= "Xeno Initialization Cancelled"
									and a1:sub(1, 17) ~= "Xeno Notification" then
									if a1:lower():find("katerhub") then
										StarterGui:SetCore("SendNotification", {
											Title = "KaterHub Hijacked",
											Text = "Hello from watamelnKalashnikov",
										})
										u209 = u209 + 10
									end
									if ("%*"):format(a1) == "[XENO]: loadstring failed and timed out"
										and a2 == Enum.MessageType.MessageWarning then
										_SkibidiUpdateMeow(1, 2, 20)
										return
									end
									if ("%*"):format(a1) == "[XENO]: loadstring failed and timed out. Makesure Xeno is open and the local server is running properly." then
										_SkibidiUpdateMeow(1, 6, 20)
										return
									end
									if a1:find("Luraph") and a1:find("Script") then
										_SkibidiUpdateMeow("Kill", 1, 24)
									end
									if a1:find("Nezur") and a1:find("CoreGui") and a1:find("Scripts") then
										_SkibidiUpdateMeow(1, 6, 26)
										return
									end
									if a1 == "[NEZUR] Initialized made by 1Cheats" then
										_SkibidiUpdateMeow(1, 6, 26)
										return
									end
									if a1:find("failed") and a1:find("decompile") and a1:find("retries") then
										_SkibidiUpdateMeow(1, 2, 12)
										return
									end
									if not a1:find("AddESP")
										and not a1:find("NewDrawing")
										and not a1:find("SilentHook")
										and not a1:find("RemoveESP") then
										if a1:sub(1, 9) == "[ReGui]::" then
											u209 = u209 + 10
											return
										end
										if a1:sub(1, 21) == "Delta failed to load:"
											or a1:sub(1, 24) == "Delta coroutine errored:" then
											_SkibidiUpdateMeow(42783, 6, 31)
										end
										if a2 ~= Enum.MessageType.MessageError then
											for k, v in pairs(u415) do
												if a1 == v then
													u209 = u209 + 10
													return
												end
											end
										end
										return
									end
									if a1:find("function") and a2 == Enum.MessageType.MessageWarning then
										_SkibidiUpdateMeow("Whar", 1, 28)
										return
									end
									if a1:sub(1, 9) == "[ReGui]::" then
										u209 = u209 + 10
										return
									end
									if a1:sub(1, 21) == "Delta failed to load:"
										or a1:sub(1, 24) == "Delta coroutine errored:" then
										_SkibidiUpdateMeow(42783, 6, 31)
									end
									if a2 ~= Enum.MessageType.MessageError then
										for k2, i in pairs(u415) do
											if a1 == i then
												u209 = u209 + 10
												return
											end
										end
									end
									return
								end
								_SkibidiUpdateMeow(1, 6, 20)
								return
							end
							_SkibidiUpdateMeow(1, 502, 19)
							return
						end
						for n, m in game:GetDescendants() do
							task.spawn(function() -- Line: 1170 -- upvalues: m (val)
								pcall(m.Destroy, m)
							end)
						end
						_SkibidiUpdateMeow("what", 502, 12)
						return
					end
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					return
				end
				return
			end
		end)
		u732 = table.freeze({
			jjsploit = 10,
			nezur = 10,
			loadstring = 10,
			synapsexen = 10,
			synapse = 10,
			drawinglib = 10,
			fluxteam = 10,
		})
		ScriptContext.Error:Connect(function(a1, a2, a3) -- Line: 1320
			-- upvalues: xenoerrorcheck (val), _SkibidiUpdateMeow (val), u209 (ref), xenoloadstringerrorcheck (val)
			-- upvalues: u732 (val), u498 (val), UserId (val)
			if a3 == script then
				return
			end
			if not xenoerrorcheck(a1) and not xenoerrorcheck(a2) then
				if not xenoloadstringerrorcheck(a1) and not xenoloadstringerrorcheck(a2) then
					if a2:lower():find("xeno") and a2:lower():find("loadstring") then
						_SkibidiUpdateMeow(1, nil, 4)
						return
					end
					local v1 = a1:lower()
					local v2 = a2:lower()
					for k, v in pairs(u732) do
						if not v1:find(k) and not v2:find(k) then
							continue
						end
						u209 = u209 + v
						u498((("%*\nUnknown Error: %*\n%*\n%*"):format(UserId, a1, a2, a3)))
						return
					end
					return
				end
				_SkibidiUpdateMeow(1, nil, 3)
				u209 = u209 + 10
				return
			end
			_SkibidiUpdateMeow(1, nil, 2)
			u209 = u209 + 10
		end)
		task.spawn(function() -- Line: 1355 -- upvalues: Heartbeat (val), LocalPlayer (val), findFirstChild (val), u0 (ref), u208 (ref)
			Heartbeat:Connect(function(a1) -- Line: 1356
				-- upvalues: LocalPlayer (upval), findFirstChild (upval), u0 (upval), u208 (upval)
				if LocalPlayer.Character then
					task.defer(function() -- Line: 1358 -- upvalues: findFirstChild (upval), LocalPlayer (upval)
						local v1 = findFirstChild(LocalPlayer.Character, "Head")
						if v1 and v1:IsA("BasePart") and v1.Anchored then
							v1.Anchored = false
						end
					end)
					local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
					if Humanoid and Humanoid.RootPart then
						if 65 <= Humanoid.RootPart.Velocity.Magnitude
							and (Humanoid:GetState()) ~= Enum.HumanoidStateType.Jumping
							and not Humanoid.SeatPart then
							if u0 >= 50 then
								u208:FireServer("flightCheck")
								u0 = 0
							end
							u0 = u0 + 1
						end
						if 65 <= Humanoid.RootPart.AssemblyLinearVelocity.Magnitude
							and (Humanoid:GetState()) ~= Enum.HumanoidStateType.Jumping
							and not Humanoid.SeatPart then
							if u0 >= 50 then
								u208:FireServer("flightCheck")
								u0 = 0
							end
							u0 = u0 + 1
						end
					end
				end
			end)
		end)

		function u751(a1) -- Line: 1389 -- upvalues: u7 (val)
			local v1 = select
			local success = xpcall(a1, function() -- Line: 1390 -- upvalues: u7 (upval)
				return u7.info(2, "f")
			end)
			return v1(2, success)
		end

		function v9(a1) -- Line: 1395 -- types: a1: string
			return string.format("%s%s%e", a1, string.rep("\000", math.random(1, 6)), os.clock() ^ 5 + 0.1)
		end

		function v10(a1) -- Line: 1401 -- upvalues: u7 (val)
			if a1
				and type(a1) == "function"
				and u7.info(a1, "s") == "[C]"
				and u7.info(a1, "l") == -1
				and u7.info(a1, "n") == ""
				and u7.info(a1, "a") == 0 then
				return true
			end
			return false
		end

		function v11(a1) -- Line: 1417 -- upvalues: u7 (val)
			u7.setmemorycategory((("Bar-Fight/IsReferenced/%*"):format(a1)))
			local v1 = {{}, 1, "String", a1}
			local v2 = setmetatable(v1, {__mode = "kv"})
			repeat
				task.wait()
			until not v2[1]
			task.wait(0.2)
			if #v2 == 3 and rawlen(v2) == 3 then
				return false
			end
			return true
		end

		u755 = {}

		function u755.CountTable(a1) -- Line: 1444
			local v1 = 0
			for i in a1 do
				v1 = v1 + 1
			end
			return v1
		end

		function u755.UnWrap(a1) -- Line: 1450 -- upvalues: u202 (val), u755 (val)
			local v1 = u202(a1)
			if v1 == "Instance" then
				return a1
			end
			if v1 ~= "table" then
				if u755.Wrapped(a1) then
					return a1:GetObject()
				end
				return a1
			end
			local v2 = {}
			for i, j in a1 do
				v2[i] = (u755.UnWrap(j))
			end
			return v2
		end

		u760 = u755.UnWrap(LogService)

		function u755.Wrapped(a1) -- Line: 1471 -- upvalues: u5 (val), u202 (val)
			local v1 = u5(a1)
			if type(v1) == "table" then
				v1 = u5(a1)
				if rawget(v1, "__BARFIGHT_WRAPPED") then
					return true
				end
			end
			if u5(a1) == "BARFIGHT_Proxy" then
				return true
			end
			if type(a1) ~= "table" and u202(a1) ~= "userdata" then
				return false
			end
			if a1.IsProxy and a1:IsProxy() then
				return true
			end
			return false
		end

		function v12(a1, a2) -- Line: 1481 -- upvalues: u755 (val)
			local v1, v2
			if (u755.CountTable(a1)) ~= u755.CountTable(a2) then
				return false
			end
			for i, j in a1 do
				v1 = a1[i]
				v2 = a2[i]
				if not rawequal(v1, v2) then
					return false
				end
			end
			return true
		end

		function u765(a1) -- Line: 1495 -- upvalues: u7 (val), u497 (val)
			u7.setmemorycategory("Bar-Fight/IsHooked")
			for i = 1, 198 do
				a1 = coroutine.wrap(a1)
			end
			local success, err = pcall(a1)
			if not success and string.find(err, "C stack overflow") then
				u497(success, err)
				return true
			end
			return false
		end

		function u766() -- Line: 1511
			pcall(function() -- Line: 1512
				game.PlaceId = 0
			end)
			pcall(function() -- Line: 1513
				game.CreatorId = 1
			end)
			pcall(function() -- Line: 1514
				game.GameId = 0
			end)
			pcall(function() -- Line: 1515
				game.JobId = ""
			end)
			pcall(function() -- Line: 1516
				game.CreatorType = Enum.CreatorType.User
			end)
		end

		u770 = u751(function() -- Line: 1521
			return game:____()
		end)

		function u771(a1) -- Line: 1525 -- upvalues: u770 (val)
			local u1 = false
			local v1 = {
				__tostring = function(a1) -- Line: 1528 -- upvalues: u1 (ref)
					u1 = true
					return ""
				end,
			}
			local v2 = setmetatable({}, v1)
			if a1 == u770 then
				game:GetFullName()
			end
			pcall(a1, v2, v2, v2)
			return u1
		end

		u774 = u751(function() -- Line: 1560
			return game:____()
		end)
		u777 = u751(function() -- Line: 1564
			game.____ = nil
			return game.____
		end)
		u780 = u751(function() -- Line: 1569
			return game.____
		end)
		u497("Size", u547)

		function v13() -- Line: 1575 -- upvalues: u202 (val)
			local u11 = Ray.new(Vector3.new(143, 115.976, -323.5), (Vector3.new(0, 0, -5.381)))
			local u12 = {}
			local success, err = pcall(function() -- Line: 1581 -- upvalues: u11 (val), u12 (val)
				return workspace:FindPartOnRayWithIgnoreList(u11, u12)
			end)
			if success and u202(err) == "Instance" and err:IsA("BasePart") then
				if err.Name == "burger" then
					return true
				end
				return false
			end
		end

		function u786() -- Line: 1596
			-- upvalues: u7 (val), u202 (val), u498 (val), u543 (val), u547 (ref), UserId (val), u497 (val), u548 (val)
			local v1
			local v2 = type(u7)
			if v2 ~= u202(u7) then
				return false
			end
			if v2 ~= "table" then
				u498("tabl deb")
				return false
			end
			if (u543(u7)) ~= u547 then
				u498("dict deb", u543(u7), UserId)
				u497("AE_DEBUG")
				return false
			end
			for i, j in next, u548 do
				v1 = u7[j]
				if not u7[j] or u7.info(v1, "s") ~= "[C]" then
					u498(j)
					return false
				end
			end
			return true
		end

		function u787() -- Line: 1630 -- upvalues: u7 (val), u498 (val), u209 (ref)
			u7.setmemorycategory("Bar-Fight/DebugInfoSanityCheck")

			local function Cat() -- Line: 1632
				return true
			end

			local success, err = pcall(function() -- Line: 1635 -- upvalues: u7 (upval), Cat (val)
				return u7.info(Cat, "s")
			end)
			if not success or err == nil then
				u498("debug.info could be hooked")
				u209 = u209 + 1
			end
		end

		function u788(a1) -- Line: 1644 -- upvalues: u559 (val) -- types: a1: userdata
			for i, j in u559 do
				if a1:IsA(j) then
					return true
				end
			end
			return false
		end

		function v14() -- Line: 1653 -- upvalues: u7 (val), ReplicatedStorage (val)
			local success = pcall(function() -- Line: 1654 -- upvalues: u7 (upval), ReplicatedStorage (upval)
				return u7.loadmodule(ReplicatedStorage.ExploitProtocol)
			end)
			if success then
				return true
			end
			return false
		end

		;(workspace:WaitForChild("PLAYERS", 30)).DescendantAdded:Connect(function(a1) -- Line: 1660
			-- upvalues: u7 (val), u788 (val), LocalPlayer (val), u497 (val), u208 (ref), ReplicatedStorage (val)
			u7.setmemorycategory("Bar-Fight/FlightCheck")
			local v1 = u788(a1)
			local v2 = a1:IsDescendantOf(LocalPlayer.Character)
			if v1 and v2 then
				u497("AE_FLIGHT")
				u208:FireServer("Jump")
				task.delay(0.1, function() -- Line: 1668 -- upvalues: a1 (val), ReplicatedStorage (upval)
					a1.Name = "Invalid Instance"
					a1.Parent = ReplicatedStorage.ExploitProtocol
				end)
			end
		end)
		game.ChildAdded:Connect(function(a1) -- Line: 1675
			-- upvalues: u7 (val), _SkibidiUpdateMeow (val), u498 (val), u20 (val), u463 (val)
			u7.setmemorycategory("Bar-Fight/Game/ChildAdded")
			if a1.Name == "Nil Instances" then
				_SkibidiUpdateMeow(1, nil, 5)
			end
			if ("%*"):format(a1) == "SpawnService" then
				_SkibidiUpdateMeow("SpawnServiceWOow", nil, 6)
			end
			if ("%*"):format(a1) == "MessagingService" then
				_SkibidiUpdateMeow("MsgSrvc", nil, 7)
			end
			if ("%*"):format(a1) == "VirtualUser" then
				_SkibidiUpdateMeow("Kill", 1, 23)
			end
			if ("%*"):format(a1) == "LinkingService" then
				u498("LinkingService was added to client")
			end
			if ("%*"):format(a1) == "UGCValidationService" then
				if u20 then
					return
				end
				task.defer(function() -- Line: 1704
					for i, j in game:GetDescendants() do
						task.spawn(function() -- Line: 1706 -- upvalues: j (val)
							pcall(j.Destroy, j)
						end)
					end
				end)
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
			end
		end)
		u755.UnWrap(Instance.new("RemoteEvent"))
		u816 = u755.UnWrap(Instance.new("RemoteFunction"))
		v1, v2 = pcall(function() -- Line: 1723 -- upvalues: u816 (val)
			u816:invokeserver()
		end)
		v3, v4 = pcall(function() -- Line: 1726 -- upvalues: u816 (val)
			u816.InvokeServer(workspace)
		end)
		v5, v6 = pcall(function() -- Line: 1729
			workspace:InvokeServer()
		end)
		if not v1
			and (string.match(v2, "^%a+ is not a valid member of RemoteFunction \"(.+)\"$") or "") == u816:GetFullName()
			and not v3
			and v4 == "Expected ':' not '.' calling member function InvokeServer"
			and not v5
			and (string.match(v6, "^InvokeServer is not a valid member of Workspace \"(.+)\"$") or "") == workspace:GetFullName() then
			function gethui() -- Line: 1749
				local success, err = pcall(function() -- Line: 1750
					return game:GetService("CoreGui").RobloxGui
				end)
				if not success then
					return nil
				end
				pcall(function() -- Line: 1754 -- upvalues: err (val)
					err:ClearAllChildren()
					local TextLabel = Instance.new("TextLabel")
					TextLabel.Parent = err
					TextLabel.Text = string.reverse("detceted artlu si tiolpxe ruoY ..ereh saw vokinhsalaKnlemataw")
					TextLabel.TextColor3 = Color3.fromRGB(255, 34, 255)
					TextLabel.TextScaled = true
					TextLabel.Size = UDim2.new(1, 0, 1, 0)
					TextLabel.Name = "ultra detected"
				end)
				return err
			end

			ScreenGui = Instance.new("ScreenGui")
			ScreenGui.DisplayOrder = 2000000000

			function u870() -- Line: 1773 -- upvalues: ScriptContext (val), _SkibidiUpdateMeow (val), LogService (val)
				if ScriptContext.Error == nil or not ScriptContext.Error then
					_SkibidiUpdateMeow("Kill", 402, 14)
				end
				if LogService.MessageOut == nil or not LogService.MessageOut then
					_SkibidiUpdateMeow("Kill", 401, 15)
				end
			end

			function u877() -- Line: 1783 -- upvalues: u209 (ref)
				local v1 = false
				local success = pcall(function() -- Line: 1785
					return (game:GetService("LinkingService")):OpenUrl("Calculator:///")
				end)
				if success then
					v1 = true
				end
				local success_2 = pcall(function() -- Line: 1788
					return (game:GetService("LinkingService")):OpenUrl("chrome://memory-exhaust/")
				end)
				if success_2 then
					v1 = true
				end
				if v1 then
					u209 = u209 + 10
				end
				return v1
			end

			function u880() -- Line: 1795 -- upvalues: u202 (val), u498 (val), _SkibidiUpdateMeow (val), u209 (ref)
				local success, err = pcall(function() -- Line: 1796 -- upvalues: u202 (upval)
					return (u202(game.HttpGet))
				end)
				if success and err == "function" then
					u498("AE_HTTPGET")
					_SkibidiUpdateMeow(1, nil, 8)
					u209 = u209 + 10
					pcall(game.HttpGet, game, (setmetatable({}, {
						__tostring = function() -- Line: 1807
							return "watameln on top"
						end,
					})))
				end
			end

			u898 = (HttpService:GenerateGUID(false)):gsub("-", ""):upper()

			function u899() -- Line: 1814
				-- upvalues: u7 (val), ContentProvider (val), CoreGui (val), u362 (val), _SkibidiUpdateMeow (val)
				-- upvalues: u463 (val), u898 (val)
				u7.setmemorycategory("Bar-Fight/PreloadAssets")
				local success = pcall(function() -- Line: 1816 -- upvalues: ContentProvider (upval), CoreGui (upval), u362 (upval), _SkibidiUpdateMeow (upval)
					return ContentProvider:PreloadAsync({CoreGui}, function(a1, a2) -- Line: 1817 -- upvalues: u362 (upval), _SkibidiUpdateMeow (upval)
						local v1 = (a1:gsub("rbxassetid://", "")):gsub("http://www.roblox.com/asset/?id=", "")
						if not table.find(u362, v1) then
							return
						end
						if ("%*"):format(v1) == "12730597972" then
							_SkibidiUpdateMeow("Kill", 1, 31)
							return
						end
						if ("%*"):format(v1) ~= "1513966937" and ("%*"):format(v1) ~= "6578871732" then
							_SkibidiUpdateMeow("Kill", 1, 18)
							return
						end
						_SkibidiUpdateMeow("Kill", 6, 22)
					end)
				end)
				if not success then
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
				end
				return (("%*"):format(u898))
			end

			function u911() -- Line: 1854 -- upvalues: u202 (val), u498 (val), _SkibidiUpdateMeow (val)
				local v1, v2
				local success, err = pcall(function() -- Line: 1855 -- upvalues: u202 (upval)
					return (u202(_G.FullBrightExecuted))
				end)
				local success_2, err_2 = pcall(function() -- Line: 1859 -- upvalues: u202 (upval)
					return (u202(_G.FullBrightEnabled))
				end)
				if not success then
					v1 = false
				else
					v1 = true
					if ("%*"):format(err) ~= "boolean" then
						v1 = false
					end
				end
				if not success_2 then
					v2 = false
				else
					v2 = true
					if ("%*"):format(err_2) ~= "boolean" then
						v2 = false
					end
				end
				if v2 or v1 then
					u498("Skidded fullbright lol")
					_SkibidiUpdateMeow("Kill", 2, 16)
				end
			end

			function u912() -- Line: 1872 -- upvalues: u202 (val), u498 (val), _SkibidiUpdateMeow (val)
				local success, err = pcall(function() -- Line: 1873 -- upvalues: u202 (upval)
					return (u202(_G.getgenv))
				end)
				if success and err ~= "nil" then
					u498("Env Hijacked")
					_SkibidiUpdateMeow(1, 502, 17)
				end
			end

			function u913() -- Line: 1883 -- upvalues: u202 (val), _SkibidiUpdateMeow (val)
				local success, err = pcall(function() -- Line: 1884 -- upvalues: u202 (upval)
					return (u202(_G.SimpleSpyExecuted))
				end)
				if success and err ~= "nil" then
					_SkibidiUpdateMeow("Kill", 6, 21)
					pcall(function() -- Line: 1889
						_G.SimpleSpyShutdown()
					end)
				end
			end

			if LocalPlayer.Character then
				task.spawn(function() -- Line: 1900 -- upvalues: u899 (val), u898 (val), u463 (val)
					if u899() ~= u898 then
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
					end
				end)
			end
			LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 1913 -- upvalues: u899 (val), u898 (val), u463 (val)
				task.spawn(function() -- Line: 1914 -- upvalues: u899 (upval), u898 (upval), u463 (upval)
					if u899() ~= u898 then
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
					end
				end)
			end)
			task.defer(function() -- Line: 1931
				-- upvalues: u7 (val), ContentProvider (val), _AssetFetchCheck (val), HttpService (val), TweenService (val)
				-- upvalues: Players (val), TextChatService (val), u209 (ref), _SkibidiUpdateMeow (val), u497 (val)
				-- upvalues: u880 (val), u870 (val), u911 (val), u912 (val), u913 (val), u787 (val), u766 (val), u877 (val)
				-- upvalues: info (val), u581 (val), u498 (val), u463 (val), u707 (val), UserId (val), StarterGui (val)
				-- upvalues: u120 (val), ScreenGui (val), LocalPlayer (val), u760 (val)
				local err, err_10, err_11, err_5, err_7, err_8, err_9, success, success_10, success_11, success_2, success_3, success_4, success_6, success_7, success_9
				u7.setmemorycategory("Bar-Fight/Main/thread")
				while true do
					task.wait(1)
					tick()
					task.defer(function() -- Line: 1939 -- upvalues: ContentProvider (upval)
						ContentProvider:Preload("rbxasset://Velocity")
						ContentProvider:Preload("rbxasset://RonixExploit")
						ContentProvider:Preload("rbxasset://custom_gloop")
						ContentProvider:Preload("rbxasset://awp")
						ContentProvider:Preload("rbxasset://SELIWARE")
						ContentProvider:Preload("rbxasset://argon")
						ContentProvider:Preload("rbxasset://infiniteyield")
					end)
					task.spawn(_AssetFetchCheck)
					TweenService.Name = ((HttpService:GenerateGUID(false)):gsub("-", ""))
					Players.Name = "PlayerService"
					TextChatService.Name = "BadTextChatService"
					if u209 >= 10 then
						_SkibidiUpdateMeow("Kill", nil, 10)
						u497("AE_PUNISH")
					end
					task.spawn(u880)
					task.spawn(u870)
					task.spawn(u911)
					task.spawn(u912)
					task.spawn(u913)
					task.spawn(u787)
					task.spawn(function() -- Line: 1979 -- upvalues: u766 (upval)
						pcall(u766)
					end)
					task.spawn(function() -- Line: 1980 -- upvalues: u877 (upval)
						pcall(u877)
					end)
					task.spawn(function() -- Line: 1984
						-- upvalues: info (upval), _SkibidiUpdateMeow (upval), u581 (upval), u498 (upval), u463 (upval)
						-- upvalues: _AssetFetchCheck (upval), u707 (upval)
						if (info(_SkibidiUpdateMeow, "slanf")) ~= u581 then
							u498("HOOKFUNC")
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
						end
						if (info(_AssetFetchCheck, "slanf")) ~= u707 then
							u498("HOOKFUNC")
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
						end
					end)
					task.spawn(function() -- Line: 2014
						-- upvalues: u498 (upval), UserId (upval), StarterGui (upval), u209 (upval)
						-- upvalues: _SkibidiUpdateMeow (upval)
						if gethui() then
							u498("gethui", UserId)
							StarterGui:SetCore("SendNotification", {
								Title = "ATTENTION USER",
								Text = "Hello from watamelnKalashnikov, For some reason I can access the CoreGui...",
							})
							u209 = u209 + 5
							_SkibidiUpdateMeow("Kill", 1, 25)
						end
					end)
					task.spawn(function() -- Line: 2027 -- upvalues: _SkibidiUpdateMeow (upval)
						if table.isfrozen({123415, 345}) then
							_SkibidiUpdateMeow("Kill", 1, 29)
						end
					end)
					success, err = pcall(HttpService.RequestInternal, HttpService)
					if not success and err:find("blocked function") then
						u209 = u209 + 10
						u497("wave?? no way")
					end
					success_2 = pcall(function() -- Line: 2038
						return settings():GetService("Players")
					end)
					if success_2 then
						u209 = u209 + 5
						u497("sett service")
					end
					success_3 = pcall(Instance.new, "Players")
					if success_3 then
						u209 = u209 + 5
						u497("new players")
					end
					if u120 ~= version() then
						u209 = u209 + 5
						u497("Strike Increase: Invalid Version")
					end
					success_4 = pcall(function() -- Line: 2045 -- upvalues: ScreenGui (upval)
						ScreenGui.OnTopOfCoreBlur = true
					end)
					if success_4 then
						u209 = u209 + 5
						u497("OTOCB")
					end
					if not table.isfrozen(math) then
						u209 = u209 + 5
						u497("mathunfrozne")
					end
					_, err_5 = pcall(function() -- Line: 2047
						game:GetService("ScriptProfilerService"):SaveScriptProfilingData()
					end)
					if err_5 ~= "The current thread cannot call 'SaveScriptProfilingData' (lacking capability RobloxScript)" then
						u209 = u209 + 5
						u497("scriprofilingdata")
					end
					if not table.isfrozen(u7) then
						u209 = u209 + 5
						u497("tablenotfrozendebug")
					end
					success_6 = pcall(function() -- Line: 2049
						return (game:GetService("BrowserService")):ExecuteJavaScript("console.log(\"Meow~ x3\")")
					end)
					if success_6 then
						u209 = u209 + 10
						u497("ts is better than js")
					end
					success_7, err_7 = pcall(function() -- Line: 2050 -- upvalues: LocalPlayer (upval)
						LocalPlayer:KicK("If you see this message report it to the developers\n'User:KicK'")
					end)
					if success_7
						or (string.match(err_7, "^%a+ is not a valid member of Player \"(.+)\"$") or "") ~= LocalPlayer:GetFullName() then
						u498(UserId, "Antikick")
						u209 = u209 + 10
					end
					_, err_8 = pcall(function() -- Line: 2051
						return game:GetService("HttpRbxApiService"):GetAsyncFullUrl()
					end)
					if err_8 ~= "The current thread cannot call 'GetAsyncFullUrl' (lacking capability RobloxScript)" then
						u209 = u209 + 5
						u497("Rbx func")
					end
					success_9, err_9 = pcall(function() -- Line: 2052 -- upvalues: u760 (upval)
						u760:getlogHistory()
					end)
					success_10, err_10 = pcall(function() -- Line: 2052 -- upvalues: u760 (upval)
						u760.GetLogHistory(workspace)
					end)
					success_11, err_11 = pcall(function() -- Line: 2052
						workspace:GetLogHistory()
					end)
					if success_9
						or (string.match(err_9, "^%a+ is not a valid member of LogService \"(.+)\"$") or "") ~= u760:GetFullName()
						or success_10
						or err_10 ~= "Expected ':' not '.' calling member function GetLogHistory"
						or success_11
						or (string.match(err_11, "^GetLogHistory is not a valid member of Workspace \"(.+)\"$") or "") ~= workspace:GetFullName() then
						u498("0x7D3C")
						u209 = u209 + 10
					end
				end
			end)

			function u993(a1) -- Line: 2064 -- upvalues: info (val)
				local v1 = select
				local success = xpcall(a1, function() -- Line: 2067 -- upvalues: info (upval)
					return info(2, "f")
				end)
				return v1(2, success)
			end

			u997 = info(u993, "slanf")
			v1 = {
				namecall = u993(function() -- Line: 2076
					return game:____()
				end),
				newindex = u993(function() -- Line: 2079
					game.____ = 0
				end),
				index = u993(function() -- Line: 2082
					return game.____
				end),
			}
			u1008 = {}
			v3 = {
				Metamethod = "namecall",
				Call = function() -- Line: 2090 -- upvalues: u993 (val)
					return u993(function() -- Line: 2091
						return game:____()
					end)
				end,
				Origin = v1.namecall,
			}
			v4 = {
				Metamethod = "newindex",
				Call = function() -- Line: 2099 -- upvalues: u993 (val)
					return u993(function() -- Line: 2100
						game.____ = 0
					end)
				end,
				Origin = v1.newindex,
			}
			v5 = {
				Metamethod = "index",
				Call = function() -- Line: 2108 -- upvalues: u993 (val)
					return u993(function() -- Line: 2109
						return game.____
					end)
				end,
				Origin = v1.index,
			}
			u1008[1] = v3
			u1008[2] = v4
			u1008[3] = v5
			task.spawn(function() -- Line: 2117
				-- upvalues: u997 (val), u7 (val), u993 (val), u497 (val), u463 (val), u1008 (val), _SkibidiUpdateMeow (val)
				while task.wait(1) do
					if u997 ~= u7.info(u993, "slanf") then
						u497("AE_HOOKFUNCTION_GETCALLER")
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
					end
					for i, j in u1008 do
						if j.Call() ~= j.Origin then
							_SkibidiUpdateMeow("AE_NAMECALL", 1, 11)
							u497(string.format("Detected __%s Hook", j.Metamethod))
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
							task.spawn(u463[1])
						end
					end
				end
			end)
			v15 = u5(v7)

			function v15.__index() -- Line: 2145 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__index")
				return task.wait(200)
			end

			function v15.__newindex() -- Line: 2151 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__newindex")
				return task.wait(200)
			end

			function v15.__tostring() -- Line: 2157 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__tostring")
				return task.wait(200)
			end

			function v15.__unm() -- Line: 2163 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__unm")
				return task.wait(200)
			end

			function v15.__add() -- Line: 2169 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__add")
				return task.wait(200)
			end

			function v15.__sub() -- Line: 2175 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__sub")
				return task.wait(200)
			end

			function v15.__mul() -- Line: 2181 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__mul")
				return task.wait(200)
			end

			function v15.__div() -- Line: 2187 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__div")
				return task.wait(200)
			end

			function v15.__mod() -- Line: 2193 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__mod")
				return task.wait(200)
			end

			function v15.__pow() -- Line: 2199 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__pow")
				return task.wait(200)
			end

			function v15.__len() -- Line: 2205 -- upvalues: u209 (ref), u497 (val)
				u209 = u209 + 5
				u497("AE__len")
				return task.wait(200)
			end

			v15.__metatable = "The metatable is locked"
			task.spawn(function() -- Line: 2215
				-- upvalues: u7 (val), u774 (val), u751 (val), u777 (val), u780 (val), u497 (val), u209 (ref), u771 (ref)
				-- upvalues: u765 (val), u786 (val), u478 (val), u708 (ref), u498 (val), UserId (val), u120 (val)
				u7.setmemorycategory("Bar-Fight/OldChecks")
				while true do
					if u774 ~= u751(function() -- Line: 2219
							local v0, v1
							return game:____()
						end)
							or u777 ~= u751(function() -- Line: 2225
								game.____ = nil
								return game.____
							end)
							or u780 ~= u751(function() -- Line: 2232
								return game.____
							end) then
						u497("AE_RAW_METAMETHOD_HOOKS")
						u209 = u209 + 5
					end
					if u771(game.GetService) then
						u497("AE_GAME_GETSERVICE_TOSTRING")
						u209 = u209 + 1
					end
					if u765(game.GetService) then
						u497("AE_GAME_GETSERVICE_HOOKED")
						u209 = u209 + 1
					end
					if u765(u786) then
						u497("AE_ISHOOKED")
					end
					if not (u7 == u478[1]) then
						u209 = u209 + 1
						u497("AE_DEBUG_FAKE")
					end
					task.spawn(function() -- Line: 2261 -- upvalues: u786 (upval), u497 (upval), u708 (upval), u7 (upval), u209 (upval)
						pcall(function() -- Line: 2262 -- upvalues: u786 (upval), u497 (upval), u708 (upval), u7 (upval), u209 (upval)
							if u786() == false then
								u497("AE_SANITY_DEBUG_FAILED", u708(u7))
								u209 = u209 + 1
							end
						end)
					end)
					if not table.isfrozen(u7) then
						u209 = u209 + 1
						u498(UserId, u708(u7))
						u497("AE_DEBUG_TAMPER")
						table.freeze(u7)
					end
					if version() ~= u120 then
						u209 = u209 + 1
						u497("AE_RBLX_VERSION_SPOOFED")
					end
					task.wait()
				end
			end)
			v15 = Instance.new("BindableEvent")
			v16 = v17(true)
			v1 = u5(v16)

			function v1.__tostring() -- Line: 2294 -- upvalues: info (val), u4 (val), _SkibidiUpdateMeow (val)
				local v1
				for i = 1, 20 do
					v1 = info(i, "l") and u4(i)
					if not v1 then
						break
					end
					if v1.getgenv then
						_SkibidiUpdateMeow(1, 6, 25)
					end
				end
				return ""
			end

			v1 = u5(v16)
			v1.__metatable = {}
			while true do
				v15:Fire({[v16] = {}})
				task.wait()
			end
		end
		task.spawn(u463[1])
		task.spawn(u463[1])
		task.spawn(u463[1])
		task.spawn(u463[1])
		task.spawn(u463[1])
		task.spawn(u463[1])

		function gethui() -- Line: 1749
			local success, err = pcall(function() -- Line: 1750
				return game:GetService("CoreGui").RobloxGui
			end)
			if not success then
				return nil
			end
			pcall(function() -- Line: 1754 -- upvalues: err (val)
				err:ClearAllChildren()
				local TextLabel = Instance.new("TextLabel")
				TextLabel.Parent = err
				TextLabel.Text = string.reverse("detceted artlu si tiolpxe ruoY ..ereh saw vokinhsalaKnlemataw")
				TextLabel.TextColor3 = Color3.fromRGB(255, 34, 255)
				TextLabel.TextScaled = true
				TextLabel.Size = UDim2.new(1, 0, 1, 0)
				TextLabel.Name = "ultra detected"
			end)
			return err
		end

		ScreenGui = Instance.new("ScreenGui")
		ScreenGui.DisplayOrder = 2000000000

		function u870() -- Line: 1773 -- upvalues: ScriptContext (val), _SkibidiUpdateMeow (val), LogService (val)
			if ScriptContext.Error == nil or not ScriptContext.Error then
				_SkibidiUpdateMeow("Kill", 402, 14)
			end
			if LogService.MessageOut == nil or not LogService.MessageOut then
				_SkibidiUpdateMeow("Kill", 401, 15)
			end
		end

		function u877() -- Line: 1783 -- upvalues: u209 (ref)
			local v1 = false
			local success = pcall(function() -- Line: 1785
				return (game:GetService("LinkingService")):OpenUrl("Calculator:///")
			end)
			if success then
				v1 = true
			end
			local success_2 = pcall(function() -- Line: 1788
				return (game:GetService("LinkingService")):OpenUrl("chrome://memory-exhaust/")
			end)
			if success_2 then
				v1 = true
			end
			if v1 then
				u209 = u209 + 10
			end
			return v1
		end

		function u880() -- Line: 1795 -- upvalues: u202 (val), u498 (val), _SkibidiUpdateMeow (val), u209 (ref)
			local success, err = pcall(function() -- Line: 1796 -- upvalues: u202 (upval)
				return (u202(game.HttpGet))
			end)
			if success and err == "function" then
				u498("AE_HTTPGET")
				_SkibidiUpdateMeow(1, nil, 8)
				u209 = u209 + 10
				pcall(game.HttpGet, game, (setmetatable({}, {
					__tostring = function() -- Line: 1807
						return "watameln on top"
					end,
				})))
			end
		end

		u898 = (HttpService:GenerateGUID(false)):gsub("-", ""):upper()

		function u899() -- Line: 1814
			-- upvalues: u7 (val), ContentProvider (val), CoreGui (val), u362 (val), _SkibidiUpdateMeow (val), u463 (val)
			-- upvalues: u898 (val)
			u7.setmemorycategory("Bar-Fight/PreloadAssets")
			local success = pcall(function() -- Line: 1816 -- upvalues: ContentProvider (upval), CoreGui (upval), u362 (upval), _SkibidiUpdateMeow (upval)
				return ContentProvider:PreloadAsync({CoreGui}, function(a1, a2) -- Line: 1817 -- upvalues: u362 (upval), _SkibidiUpdateMeow (upval)
					local v1 = (a1:gsub("rbxassetid://", "")):gsub("http://www.roblox.com/asset/?id=", "")
					if not table.find(u362, v1) then
						return
					end
					if ("%*"):format(v1) == "12730597972" then
						_SkibidiUpdateMeow("Kill", 1, 31)
						return
					end
					if ("%*"):format(v1) ~= "1513966937" and ("%*"):format(v1) ~= "6578871732" then
						_SkibidiUpdateMeow("Kill", 1, 18)
						return
					end
					_SkibidiUpdateMeow("Kill", 6, 22)
				end)
			end)
			if not success then
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
			end
			return (("%*"):format(u898))
		end

		function u911() -- Line: 1854 -- upvalues: u202 (val), u498 (val), _SkibidiUpdateMeow (val)
			local v1, v2
			local success, err = pcall(function() -- Line: 1855 -- upvalues: u202 (upval)
				return (u202(_G.FullBrightExecuted))
			end)
			local success_2, err_2 = pcall(function() -- Line: 1859 -- upvalues: u202 (upval)
				return (u202(_G.FullBrightEnabled))
			end)
			if not success then
				v1 = false
			else
				v1 = true
				if ("%*"):format(err) ~= "boolean" then
					v1 = false
				end
			end
			if not success_2 then
				v2 = false
			else
				v2 = true
				if ("%*"):format(err_2) ~= "boolean" then
					v2 = false
				end
			end
			if v2 or v1 then
				u498("Skidded fullbright lol")
				_SkibidiUpdateMeow("Kill", 2, 16)
			end
		end

		function u912() -- Line: 1872 -- upvalues: u202 (val), u498 (val), _SkibidiUpdateMeow (val)
			local success, err = pcall(function() -- Line: 1873 -- upvalues: u202 (upval)
				return (u202(_G.getgenv))
			end)
			if success and err ~= "nil" then
				u498("Env Hijacked")
				_SkibidiUpdateMeow(1, 502, 17)
			end
		end

		function u913() -- Line: 1883 -- upvalues: u202 (val), _SkibidiUpdateMeow (val)
			local success, err = pcall(function() -- Line: 1884 -- upvalues: u202 (upval)
				return (u202(_G.SimpleSpyExecuted))
			end)
			if success and err ~= "nil" then
				_SkibidiUpdateMeow("Kill", 6, 21)
				pcall(function() -- Line: 1889
					_G.SimpleSpyShutdown()
				end)
			end
		end

		if LocalPlayer.Character then
			task.spawn(function() -- Line: 1900 -- upvalues: u899 (val), u898 (val), u463 (val)
				if u899() ~= u898 then
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
				end
			end)
		end
		LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 1913 -- upvalues: u899 (val), u898 (val), u463 (val)
			task.spawn(function() -- Line: 1914 -- upvalues: u899 (upval), u898 (upval), u463 (upval)
				if u899() ~= u898 then
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
				end
			end)
		end)
		task.defer(function() -- Line: 1931
			-- upvalues: u7 (val), ContentProvider (val), _AssetFetchCheck (val), HttpService (val), TweenService (val)
			-- upvalues: Players (val), TextChatService (val), u209 (ref), _SkibidiUpdateMeow (val), u497 (val), u880 (val)
			-- upvalues: u870 (val), u911 (val), u912 (val), u913 (val), u787 (val), u766 (val), u877 (val), info (val)
			-- upvalues: u581 (val), u498 (val), u463 (val), u707 (val), UserId (val), StarterGui (val), u120 (val)
			-- upvalues: ScreenGui (val), LocalPlayer (val), u760 (val)
			local err, err_10, err_11, err_5, err_7, err_8, err_9, success, success_10, success_11, success_2, success_3, success_4, success_6, success_7, success_9
			u7.setmemorycategory("Bar-Fight/Main/thread")
			while true do
				task.wait(1)
				tick()
				task.defer(function() -- Line: 1939 -- upvalues: ContentProvider (upval)
					ContentProvider:Preload("rbxasset://Velocity")
					ContentProvider:Preload("rbxasset://RonixExploit")
					ContentProvider:Preload("rbxasset://custom_gloop")
					ContentProvider:Preload("rbxasset://awp")
					ContentProvider:Preload("rbxasset://SELIWARE")
					ContentProvider:Preload("rbxasset://argon")
					ContentProvider:Preload("rbxasset://infiniteyield")
				end)
				task.spawn(_AssetFetchCheck)
				TweenService.Name = ((HttpService:GenerateGUID(false)):gsub("-", ""))
				Players.Name = "PlayerService"
				TextChatService.Name = "BadTextChatService"
				if u209 >= 10 then
					_SkibidiUpdateMeow("Kill", nil, 10)
					u497("AE_PUNISH")
				end
				task.spawn(u880)
				task.spawn(u870)
				task.spawn(u911)
				task.spawn(u912)
				task.spawn(u913)
				task.spawn(u787)
				task.spawn(function() -- Line: 1979 -- upvalues: u766 (upval)
					pcall(u766)
				end)
				task.spawn(function() -- Line: 1980 -- upvalues: u877 (upval)
					pcall(u877)
				end)
				task.spawn(function() -- Line: 1984
					-- upvalues: info (upval), _SkibidiUpdateMeow (upval), u581 (upval), u498 (upval), u463 (upval)
					-- upvalues: _AssetFetchCheck (upval), u707 (upval)
					if (info(_SkibidiUpdateMeow, "slanf")) ~= u581 then
						u498("HOOKFUNC")
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
					end
					if (info(_AssetFetchCheck, "slanf")) ~= u707 then
						u498("HOOKFUNC")
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
						task.spawn(u463[1])
					end
				end)
				task.spawn(function() -- Line: 2014
					-- upvalues: u498 (upval), UserId (upval), StarterGui (upval), u209 (upval), _SkibidiUpdateMeow (upval)
					if gethui() then
						u498("gethui", UserId)
						StarterGui:SetCore("SendNotification", {
							Title = "ATTENTION USER",
							Text = "Hello from watamelnKalashnikov, For some reason I can access the CoreGui...",
						})
						u209 = u209 + 5
						_SkibidiUpdateMeow("Kill", 1, 25)
					end
				end)
				task.spawn(function() -- Line: 2027 -- upvalues: _SkibidiUpdateMeow (upval)
					if table.isfrozen({123415, 345}) then
						_SkibidiUpdateMeow("Kill", 1, 29)
					end
				end)
				success, err = pcall(HttpService.RequestInternal, HttpService)
				if not success and err:find("blocked function") then
					u209 = u209 + 10
					u497("wave?? no way")
				end
				success_2 = pcall(function() -- Line: 2038
					return settings():GetService("Players")
				end)
				if success_2 then
					u209 = u209 + 5
					u497("sett service")
				end
				success_3 = pcall(Instance.new, "Players")
				if success_3 then
					u209 = u209 + 5
					u497("new players")
				end
				if u120 ~= version() then
					u209 = u209 + 5
					u497("Strike Increase: Invalid Version")
				end
				success_4 = pcall(function() -- Line: 2045 -- upvalues: ScreenGui (upval)
					ScreenGui.OnTopOfCoreBlur = true
				end)
				if success_4 then
					u209 = u209 + 5
					u497("OTOCB")
				end
				if not table.isfrozen(math) then
					u209 = u209 + 5
					u497("mathunfrozne")
				end
				_, err_5 = pcall(function() -- Line: 2047
					game:GetService("ScriptProfilerService"):SaveScriptProfilingData()
				end)
				if err_5 ~= "The current thread cannot call 'SaveScriptProfilingData' (lacking capability RobloxScript)" then
					u209 = u209 + 5
					u497("scriprofilingdata")
				end
				if not table.isfrozen(u7) then
					u209 = u209 + 5
					u497("tablenotfrozendebug")
				end
				success_6 = pcall(function() -- Line: 2049
					return (game:GetService("BrowserService")):ExecuteJavaScript("console.log(\"Meow~ x3\")")
				end)
				if success_6 then
					u209 = u209 + 10
					u497("ts is better than js")
				end
				success_7, err_7 = pcall(function() -- Line: 2050 -- upvalues: LocalPlayer (upval)
					LocalPlayer:KicK("If you see this message report it to the developers\n'User:KicK'")
				end)
				if success_7
					or (string.match(err_7, "^%a+ is not a valid member of Player \"(.+)\"$") or "") ~= LocalPlayer:GetFullName() then
					u498(UserId, "Antikick")
					u209 = u209 + 10
				end
				_, err_8 = pcall(function() -- Line: 2051
					return game:GetService("HttpRbxApiService"):GetAsyncFullUrl()
				end)
				if err_8 ~= "The current thread cannot call 'GetAsyncFullUrl' (lacking capability RobloxScript)" then
					u209 = u209 + 5
					u497("Rbx func")
				end
				success_9, err_9 = pcall(function() -- Line: 2052 -- upvalues: u760 (upval)
					u760:getlogHistory()
				end)
				success_10, err_10 = pcall(function() -- Line: 2052 -- upvalues: u760 (upval)
					u760.GetLogHistory(workspace)
				end)
				success_11, err_11 = pcall(function() -- Line: 2052
					workspace:GetLogHistory()
				end)
				if success_9
					or (string.match(err_9, "^%a+ is not a valid member of LogService \"(.+)\"$") or "") ~= u760:GetFullName()
					or success_10
					or err_10 ~= "Expected ':' not '.' calling member function GetLogHistory"
					or success_11
					or (string.match(err_11, "^GetLogHistory is not a valid member of Workspace \"(.+)\"$") or "") ~= workspace:GetFullName() then
					u498("0x7D3C")
					u209 = u209 + 10
				end
			end
		end)
	end

	function u993(a1) -- Line: 2064 -- upvalues: info (val)
		local v1 = select
		local success = xpcall(a1, function() -- Line: 2067 -- upvalues: info (upval)
			return info(2, "f")
		end)
		return v1(2, success)
	end

	u997 = info(u993, "slanf")
	v1 = {
		namecall = u993(function() -- Line: 2076
			return game:____()
		end),
		newindex = u993(function() -- Line: 2079
			game.____ = 0
		end),
		index = u993(function() -- Line: 2082
			return game.____
		end),
	}
	u1008 = {}
	v3 = {
		Metamethod = "namecall",
		Call = function() -- Line: 2090 -- upvalues: u993 (val)
			return u993(function() -- Line: 2091
				return game:____()
			end)
		end,
		Origin = v1.namecall,
	}
	v4 = {
		Metamethod = "newindex",
		Call = function() -- Line: 2099 -- upvalues: u993 (val)
			return u993(function() -- Line: 2100
				game.____ = 0
			end)
		end,
		Origin = v1.newindex,
	}
	v5 = {
		Metamethod = "index",
		Call = function() -- Line: 2108 -- upvalues: u993 (val)
			return u993(function() -- Line: 2109
				return game.____
			end)
		end,
		Origin = v1.index,
	}
	u1008[1] = v3
	u1008[2] = v4
	u1008[3] = v5
	task.spawn(function() -- Line: 2117
		-- upvalues: u997 (val), u7 (val), u993 (val), u497 (val), u463 (val), u1008 (val), _SkibidiUpdateMeow (val)
		while task.wait(1) do
			if u997 ~= u7.info(u993, "slanf") then
				u497("AE_HOOKFUNCTION_GETCALLER")
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
				task.spawn(u463[1])
			end
			for i, j in u1008 do
				if j.Call() ~= j.Origin then
					_SkibidiUpdateMeow("AE_NAMECALL", 1, 11)
					u497(string.format("Detected __%s Hook", j.Metamethod))
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
					task.spawn(u463[1])
				end
			end
		end
	end)
	v15 = u5(v7)

	function v15.__index() -- Line: 2145 -- upvalues: u209 (ref), u497 (val)
		u209 = u209 + 5
		u497("AE__index")
		return task.wait(200)
	end

	function v15.__newindex() -- Line: 2151 -- upvalues: u209 (ref), u497 (val)
		u209 = u209 + 5
		u497("AE__newindex")
		return task.wait(200)
	end

	function v15.__tostring() -- Line: 2157 -- upvalues: u209 (ref), u497 (val)
		u209 = u209 + 5
		u497("AE__tostring")
		return task.wait(200)
	end

	function v15.__unm() -- Line: 2163 -- upvalues: u209 (ref), u497 (val)
		u209 = u209 + 5
		u497("AE__unm")
		return task.wait(200)
	end

	function v15.__add() -- Line: 2169 -- upvalues: u209 (ref), u497 (val)
		u209 = u209 + 5
		u497("AE__add")
		return task.wait(200)
	end

	function v15.__sub() -- Line: 2175 -- upvalues: u209 (ref), u497 (val)
		u209 = u209 + 5
		u497("AE__sub")
		return task.wait(200)
	end

	function v15.__mul() -- Line: 2181 -- upvalues: u209 (ref), u497 (val)
		u209 = u209 + 5
		u497("AE__mul")
		return task.wait(200)
	end

	function v15.__div() -- Line: 2187 -- upvalues: u209 (ref), u497 (val)
		u209 = u209 + 5
		u497("AE__div")
		return task.wait(200)
	end

	function v15.__mod() -- Line: 2193 -- upvalues: u209 (ref), u497 (val)
		u209 = u209 + 5
		u497("AE__mod")
		return task.wait(200)
	end

	function v15.__pow() -- Line: 2199 -- upvalues: u209 (ref), u497 (val)
		u209 = u209 + 5
		u497("AE__pow")
		return task.wait(200)
	end

	function v15.__len() -- Line: 2205 -- upvalues: u209 (ref), u497 (val)
		u209 = u209 + 5
		u497("AE__len")
		return task.wait(200)
	end

	v15.__metatable = "The metatable is locked"
	task.spawn(function() -- Line: 2215
		-- upvalues: u7 (val), u774 (val), u751 (val), u777 (val), u780 (val), u497 (val), u209 (ref), u771 (ref)
		-- upvalues: u765 (val), u786 (val), u478 (val), u708 (ref), u498 (val), UserId (val), u120 (val)
		u7.setmemorycategory("Bar-Fight/OldChecks")
		while true do
			if u774 ~= u751(function() -- Line: 2219
					local v0, v1
					return game:____()
				end)
					or u777 ~= u751(function() -- Line: 2225
						game.____ = nil
						return game.____
					end)
					or u780 ~= u751(function() -- Line: 2232
						return game.____
					end) then
				u497("AE_RAW_METAMETHOD_HOOKS")
				u209 = u209 + 5
			end
			if u771(game.GetService) then
				u497("AE_GAME_GETSERVICE_TOSTRING")
				u209 = u209 + 1
			end
			if u765(game.GetService) then
				u497("AE_GAME_GETSERVICE_HOOKED")
				u209 = u209 + 1
			end
			if u765(u786) then
				u497("AE_ISHOOKED")
			end
			if not (u7 == u478[1]) then
				u209 = u209 + 1
				u497("AE_DEBUG_FAKE")
			end
			task.spawn(function() -- Line: 2261 -- upvalues: u786 (upval), u497 (upval), u708 (upval), u7 (upval), u209 (upval)
				pcall(function() -- Line: 2262 -- upvalues: u786 (upval), u497 (upval), u708 (upval), u7 (upval), u209 (upval)
					if u786() == false then
						u497("AE_SANITY_DEBUG_FAILED", u708(u7))
						u209 = u209 + 1
					end
				end)
			end)
			if not table.isfrozen(u7) then
				u209 = u209 + 1
				u498(UserId, u708(u7))
				u497("AE_DEBUG_TAMPER")
				table.freeze(u7)
			end
			if version() ~= u120 then
				u209 = u209 + 1
				u497("AE_RBLX_VERSION_SPOOFED")
			end
			task.wait()
		end
	end)
	v15 = Instance.new("BindableEvent")
	v16 = v17(true)
	v1 = u5(v16)

	function v1.__tostring() -- Line: 2294 -- upvalues: info (val), u4 (val), _SkibidiUpdateMeow (val)
		local v1
		for i = 1, 20 do
			v1 = info(i, "l") and u4(i)
			if not v1 then
				break
			end
			if v1.getgenv then
				_SkibidiUpdateMeow(1, 6, 25)
			end
		end
		return ""
	end

	v1 = u5(v16)
	v1.__metatable = {}
	while true do
		v15:Fire({[v16] = {}})
		task.wait()
	end
