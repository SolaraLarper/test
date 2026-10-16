local function fn()
end

local v2 = table.pack(fn(nil, nil))

if v2[1] ~= nil then
	return "Silly Goose"
end

wait()
script.Disabled = true
script.Parent = nil
script = Instance.new("LocalScript")
local str = nil
local str2 = nil
local bacBanningIgnore = nil
local str3 = nil
local acRem = game.ReplicatedStorage:WaitForChild("ACRem")
local ContentProvider = game:GetService("ContentProvider")
local Players2 = game:GetService("Players")
local localPlayer = Players2.LocalPlayer

local function fn2(arg)
	local n = 1
	local n2 = 10
	local n3 = 1 - n

	while true do
		n3 += n
		local v, ok, result

		if not (n <= 0) then
			if n3 <= n2 then
				v = n3
				ok, result = pcall(getfenv, v)
				ok = ok and result.getrenv

				if ok then
					arg = tostring(math.random(1, 10000))
				end

				continue
			end

			break
		else
			if n3 >= n2 then
				v = n3
				ok, result = pcall(getfenv, v)
				ok = ok and result.getrenv

				if ok then
					arg = tostring(math.random(1, 10000))
				end

				continue
			end

			break
		end
	end

	xpcall(function()
		PluginManager():CreatePlugin():Deactivate()
	end, function()
	end)

	local jobId = game.JobId
	local str4 = ""
	local n4 = #arg + 0
	local n5 = 1 - n

	while true do
		n5 += n
		local v, str5, str6

		if not (n <= 0) then
			if n5 <= n4 then
				v = n5
				str5 = arg:sub(v, v)
				str6 = jobId:sub((v - 1) % #jobId + 1, (v - 1) % #jobId + 1)
				str4 ..= string.char(bit32.bxor(string.byte(str5), string.byte(str6)))
				continue
			end

			break
		else
			if n5 >= n4 then
				v = n5
				str5 = arg:sub(v, v)
				str6 = jobId:sub((v - 1) % #jobId + 1, (v - 1) % #jobId + 1)
				str4 ..= string.char(bit32.bxor(string.byte(str5), string.byte(str6)))
				continue
			end

			break
		end
	end

	return str4
end

local function fn3(arg)
	return fn2(arg)
end

local band = bit32.band
local bor = bit32.bor
local bxor = bit32.bxor
local rshift = bit32.rshift
local lshift = bit32.lshift
local rrotate = bit32.rrotate
local bnot = bit32.bnot
local byte = string.byte
local char = string.char
local format = string.format
local rep = string.rep

local tbl = {
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

local function fn4(arg)
	local n = #arg * 8 % 4294967296
	local n2 = math.floor(#arg * 8 / 4294967296)
	local str4 = arg .. "\128"

	while #str4 % 64 ~= 56 do
		str4 ..= "\0"
	end

	local n3 = -1
	local n4 = 0
	local n5 = 3 - n3

	while true do
		n5 += n3
		local v

		if not (n3 <= 0) then
			if n5 <= n4 then
				v = n5
				str4 ..= char(band(rshift(n2, v * 8), 255))
				continue
			end

			break
		else
			if n5 >= n4 then
				v = n5
				str4 ..= char(band(rshift(n2, v * 8), 255))
				continue
			end

			break
		end
	end

	local n6 = 3 - n3

	while true do
		n6 += n3
		local v

		if not (n3 <= 0) then
			if n6 <= n4 then
				v = n6
				str4 ..= char(band(rshift(n, v * 8), 255))
				continue
			end

			break
		else
			if n6 >= n4 then
				v = n6
				str4 ..= char(band(rshift(n, v * 8), 255))
				continue
			end

			break
		end
	end

	local tbl2 = {}
	local n7 = 1779033703
	local n8 = 3144134277
	local n9 = 1013904242
	local n10 = 2773480762
	local n11 = 1359893119
	local n12 = 2600822924
	local n13 = 528734635
	local n14 = 1541459225
	local n15 = 64
	local n16 = #str4 + 0
	local n17 = 1 - n15

	while true do
		n17 += n15
		local v, n18, n19, n20, v3, n21, n22, n23, v4, v5, v6, n24, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18

		if not (n15 <= 0) then
			if n17 <= n16 then
				v = n17
				n18 = 1
				n19 = 15
				n20 = 0 - n18

				while true do
					n20 += n18

					if not (n18 <= 0) then
						if n20 <= n19 then
							v3 = n20
							n21 = v + v3 * 4
							tbl2[v3] = bor(lshift(byte(str4, n21), 24), lshift(byte(str4, n21 + 1), 16), lshift(byte(str4, n21 + 2), 8), byte(str4, n21 + 3))
							continue
						end

						break
					else
						if n20 >= n19 then
							v3 = n20
							n21 = v + v3 * 4
							tbl2[v3] = bor(lshift(byte(str4, n21), 24), lshift(byte(str4, n21 + 1), 16), lshift(byte(str4, n21 + 2), 8), byte(str4, n21 + 3))
							continue
						end

						break
					end
				end

				n22 = 63
				n23 = 16 - n18

				while true do
					n23 += n18

					if not (n18 <= 0) then
						if n23 <= n22 then
							v4 = n23
							v5 = tbl2[v4 - 15]
							v6 = tbl2[v4 - 2]
							tbl2[v4] = band(tbl2[v4 - 16] + bxor(rrotate(v5, 7), rrotate(v5, 18), rshift(v5, 3)) + tbl2[v4 - 7] + bxor(rrotate(v6, 17), rrotate(v6, 19), rshift(v6, 10)), 4294967295)
							continue
						end

						break
					else
						if n23 >= n22 then
							v4 = n23
							v5 = tbl2[v4 - 15]
							v6 = tbl2[v4 - 2]
							tbl2[v4] = band(tbl2[v4 - 16] + bxor(rrotate(v5, 7), rrotate(v5, 18), rshift(v5, 3)) + tbl2[v4 - 7] + bxor(rrotate(v6, 17), rrotate(v6, 19), rshift(v6, 10)), 4294967295)
							continue
						end

						break
					end
				end

				n24 = 0 - n18
				v7 = n11
				v8 = n12
				v9 = n13
				v10 = n14
				v11 = n7
				v12 = n8
				v13 = n9
				v14 = n10

				while true do
					n24 += n18

					if not (n18 <= 0) then
						if n24 <= n22 then
							v15 = n24
							v16 = band(v10 + bxor(rrotate(v7, 6), rrotate(v7, 11), rrotate(v7, 25)) + bxor(band(v7, v8), band(bnot(v7), v9)) + tbl[v15 + 1] + tbl2[v15], 4294967295)
							v17 = band(bxor(rrotate(v11, 2), rrotate(v11, 13), rrotate(v11, 22)) + bxor(band(v11, v12), band(v11, v13), band(v12, v13)), 4294967295)
							v18 = band(v14 + v16, 4294967295)
							v10 = v9
							v14 = v13
							v9 = v8
							v13 = v12
							v8 = v7
							v12 = v11
							v7 = v18
							v11 = band(v16 + v17, 4294967295)
							continue
						end

						break
					else
						if n24 >= n22 then
							v15 = n24
							v16 = band(v10 + bxor(rrotate(v7, 6), rrotate(v7, 11), rrotate(v7, 25)) + bxor(band(v7, v8), band(bnot(v7), v9)) + tbl[v15 + 1] + tbl2[v15], 4294967295)
							v17 = band(bxor(rrotate(v11, 2), rrotate(v11, 13), rrotate(v11, 22)) + bxor(band(v11, v12), band(v11, v13), band(v12, v13)), 4294967295)
							v18 = band(v14 + v16, 4294967295)
							v10 = v9
							v14 = v13
							v9 = v8
							v13 = v12
							v8 = v7
							v12 = v11
							v7 = v18
							v11 = band(v16 + v17, 4294967295)
							continue
						end

						break
					end
				end

				n7 = band(n7 + v11, 4294967295)
				n8 = band(n8 + v12, 4294967295)
				n9 = band(n9 + v13, 4294967295)
				n10 = band(n10 + v14, 4294967295)
				n11 = band(n11 + v7, 4294967295)
				n12 = band(n12 + v8, 4294967295)
				n13 = band(n13 + v9, 4294967295)
				n14 = band(n14 + v10, 4294967295)
				continue
			end

			break
		else
			if n17 >= n16 then
				v = n17
				n18 = 1
				n19 = 15
				n20 = 0 - n18

				while true do
					n20 += n18

					if not (n18 <= 0) then
						if n20 <= n19 then
							v3 = n20
							n21 = v + v3 * 4
							tbl2[v3] = bor(lshift(byte(str4, n21), 24), lshift(byte(str4, n21 + 1), 16), lshift(byte(str4, n21 + 2), 8), byte(str4, n21 + 3))
							continue
						end

						break
					else
						if n20 >= n19 then
							v3 = n20
							n21 = v + v3 * 4
							tbl2[v3] = bor(lshift(byte(str4, n21), 24), lshift(byte(str4, n21 + 1), 16), lshift(byte(str4, n21 + 2), 8), byte(str4, n21 + 3))
							continue
						end

						break
					end
				end

				n22 = 63
				n23 = 16 - n18

				while true do
					n23 += n18

					if not (n18 <= 0) then
						if n23 <= n22 then
							v4 = n23
							v5 = tbl2[v4 - 15]
							v6 = tbl2[v4 - 2]
							tbl2[v4] = band(tbl2[v4 - 16] + bxor(rrotate(v5, 7), rrotate(v5, 18), rshift(v5, 3)) + tbl2[v4 - 7] + bxor(rrotate(v6, 17), rrotate(v6, 19), rshift(v6, 10)), 4294967295)
							continue
						end

						break
					else
						if n23 >= n22 then
							v4 = n23
							v5 = tbl2[v4 - 15]
							v6 = tbl2[v4 - 2]
							tbl2[v4] = band(tbl2[v4 - 16] + bxor(rrotate(v5, 7), rrotate(v5, 18), rshift(v5, 3)) + tbl2[v4 - 7] + bxor(rrotate(v6, 17), rrotate(v6, 19), rshift(v6, 10)), 4294967295)
							continue
						end

						break
					end
				end

				n24 = 0 - n18
				v7 = n11
				v8 = n12
				v9 = n13
				v10 = n14
				v11 = n7
				v12 = n8
				v13 = n9
				v14 = n10

				while true do
					n24 += n18

					if not (n18 <= 0) then
						if n24 <= n22 then
							v15 = n24
							v16 = band(v10 + bxor(rrotate(v7, 6), rrotate(v7, 11), rrotate(v7, 25)) + bxor(band(v7, v8), band(bnot(v7), v9)) + tbl[v15 + 1] + tbl2[v15], 4294967295)
							v17 = band(bxor(rrotate(v11, 2), rrotate(v11, 13), rrotate(v11, 22)) + bxor(band(v11, v12), band(v11, v13), band(v12, v13)), 4294967295)
							v18 = band(v14 + v16, 4294967295)
							v10 = v9
							v14 = v13
							v9 = v8
							v13 = v12
							v8 = v7
							v12 = v11
							v7 = v18
							v11 = band(v16 + v17, 4294967295)
							continue
						end

						break
					else
						if n24 >= n22 then
							v15 = n24
							v16 = band(v10 + bxor(rrotate(v7, 6), rrotate(v7, 11), rrotate(v7, 25)) + bxor(band(v7, v8), band(bnot(v7), v9)) + tbl[v15 + 1] + tbl2[v15], 4294967295)
							v17 = band(bxor(rrotate(v11, 2), rrotate(v11, 13), rrotate(v11, 22)) + bxor(band(v11, v12), band(v11, v13), band(v12, v13)), 4294967295)
							v18 = band(v14 + v16, 4294967295)
							v10 = v9
							v14 = v13
							v9 = v8
							v13 = v12
							v8 = v7
							v12 = v11
							v7 = v18
							v11 = band(v16 + v17, 4294967295)
							continue
						end

						break
					end
				end

				n7 = band(n7 + v11, 4294967295)
				n8 = band(n8 + v12, 4294967295)
				n9 = band(n9 + v13, 4294967295)
				n10 = band(n10 + v14, 4294967295)
				n11 = band(n11 + v7, 4294967295)
				n12 = band(n12 + v8, 4294967295)
				n13 = band(n13 + v9, 4294967295)
				n14 = band(n14 + v10, 4294967295)
				continue
			end

			break
		end
	end

	local function fn5(arg2)
		return char(band(rshift(arg2, 24), 255), band(rshift(arg2, 16), 255), band(rshift(arg2, 8), 255), band(arg2, 255))
	end

	return fn5(n7) .. fn5(n8) .. fn5(n9) .. fn5(n10) .. fn5(n11) .. fn5(n12) .. fn5(n13) .. fn5(n14)
end

local function fn5(arg)
	return (arg:gsub(".", function(arg2)
		return format("%02x", byte(arg2))
	end))
end

local n = 64

local function fn6(arg, arg2)
	local v

	if not (#arg > n) then
		v = arg
	else
		v = fn4(arg)
	end

	local str4 = v .. rep("\0", n - #v)
	local v3 = table.create(64)
	local v4 = table.create(64)
	local n2 = 1
	local n3 = 64
	local n4 = 1 - n2

	while true do
		n4 += n2
		local v5, v6

		if not (n2 <= 0) then
			if n4 <= n3 then
				v5 = n4
				v6 = byte(str4, v5)
				v3[v5] = char(bxor(v6, 54))
				v4[v5] = char(bxor(v6, 92))
				continue
			end

			break
		else
			if n4 >= n3 then
				v5 = n4
				v6 = byte(str4, v5)
				v3[v5] = char(bxor(v6, 54))
				v4[v5] = char(bxor(v6, 92))
				continue
			end

			break
		end
	end

	return fn5(fn4(table.concat(v4) .. fn4(table.concat(v3) .. arg2)))
end

assert(fn6("key", "The quick brown fox jumps over the lazy dog") == "f7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8", "inlined HMAC self-test failed")
local n2 = 2
local v3 = table.create(64)
local n3 = 1
local n4 = 64
local n5 = 1 - n3

while true do
	n5 += n3
	local v

	if not (n3 <= 0) then
		if n5 <= n4 then
			v = n5
			v3[v] = string.char(math.random(0, 255))
			continue
		end

		break
	else
		if n5 >= n4 then
			v = n5
			v3[v] = string.char(math.random(0, 255))
			continue
		end

		break
	end
end

local str4 = table.concat(v3)

local function fn7(arg, arg2)
	local v = table.create(#arg)
	local n6 = 1
	local n7 = #arg + 0
	local n8 = 1 - n6

	while true do
		n8 += n6
		local v4

		if not (n6 <= 0) then
			if n8 <= n7 then
				v4 = n8
				v[v4] = string.char(bit32.bxor(string.byte(arg, v4), string.byte(arg2, (v4 - 1) % #arg2 + 1)))
				continue
			end

			break
		else
			if n8 >= n7 then
				v4 = n8
				v[v4] = string.char(bit32.bxor(string.byte(arg, v4), string.byte(arg2, (v4 - 1) % #arg2 + 1)))
				continue
			end

			break
		end
	end

	return table.concat(v)
end

game.ReplicatedStorage.ACRem.OnClientEvent:Connect(function(arg)
	if typeof(arg) == "string" then
		if not (not (#arg == 64) or not arg:match("^%x+$")) then
			return
		end
	end

	game.TextChatService.TextChannels.RBXGeneral:DisplaySystemMessage("[GAME] - " .. tostring(arg))
end)

local tbl2 = {}
local AnimationFromVideoCreatorService = game:GetService("AnimationFromVideoCreatorService")
local AdService = game:GetService("AdService")
local BadgeService = game:GetService("BadgeService")
local CookiesService = game:GetService("CookiesService")
local v4 = game
local getService = v4.GetService
tbl2[1] = AnimationFromVideoCreatorService
tbl2[2] = AdService
tbl2[3] = BadgeService
tbl2[4] = CookiesService

do
	local values = table.pack(getService(v4, "GamepadService"))
	table.move(values, 1, values.n, 5, tbl2)
end

acRem.Parent = tbl2[math.random(1, #tbl2)]
local tbl3 = { "FisherMan", "RobloxChatSystemMessage", "Chat", "AFK", "WhyAreTheyTargetingMe!!" }
acRem.Name = tbl3[math.random(1, #tbl3)]
local v5 = nil

acRem.OnClientEvent:Connect(function(arg)
	if typeof(arg) == "string" and #arg == 64 and arg:match("^%x+$") then
		v5 = fn7(arg, str4)
	end
end)

task.spawn(function()
	while not v5 do
		acRem:FireServer("hello")
		task.wait(1)
	end
end)

task.spawn(function()
	local bacIds = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_IDS") or {}

	for k, bacId in pairs(bacIds) do
		game:GetService("ContentProvider"):GetAssetFetchStatusChangedSignal(bacId):Connect(function()
			if game:GetService("ContentProvider"):GetAssetFetchStatus(bacId) == Enum.AssetFetchStatus.Success then
				task.spawn(function()
					str = "X-3"
					str3 = "X-3"
					str2 = tostring(k)
				end)
			end
		end)
	end

	task.spawn(function()
		while task.wait() do
			for k, bacId in pairs(bacIds) do
				if game:GetService("ContentProvider"):GetAssetFetchStatus(bacId) == Enum.AssetFetchStatus.Success then
					str = "X-1"
					str3 = "X-1"
					str2 = tostring(k)
					break
				end
			end

			task.wait(10)
		end
	end)
end)

task.spawn(function()
	local tbl4 = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_UI-NAMES") or {}
	table.insert(tbl4, "G12BatTP")
	table.insert(tbl4, "AutoStealUI")
	table.insert(tbl4, "G12s Anti Bat")
	table.insert(tbl4, "IrishHubGui")
	table.insert(tbl4, "IrishAutoGrab")
	table.insert(tbl4, "ControlEfectoGUI")
	table.insert(tbl4, "PhiAutotyper")
	table.insert(tbl4, "HollowInvisible")
	table.insert(tbl4, "V3StealProgressBar")
	table.insert(tbl4, "SABHub")

	game.Players.LocalPlayer:WaitForChild("PlayerGui").ChildAdded:Connect(function(child)
		if table.find(tbl4, child.Name) then
			task.spawn(function()
				str = "X-24"
				str3 = "X-24"
				str2 = child.Name
			end)
		end
	end)

	task.spawn(function()
		while task.wait() do
			for k, v in pairs(tbl4) do
				if game.Players.LocalPlayer.PlayerGui:FindFirstChild(v) then
					str = "X-24"
					str3 = "X-24"
					str2 = tostring(k)
					break
				end
			end

			task.wait(10)
		end
	end)
end)

local tbl4 = { "rbxassetid://18984490161" }
local tbl5 = {}

task.spawn(function()
	while true do
		ContentProvider:PreloadAsync(tbl4, function(arg)
			if arg and game:GetService("ContentProvider"):GetAssetFetchStatus(arg) == Enum.AssetFetchStatus.Failure then
				tbl5[arg] = true
			end

			if tbl5[arg] and game:GetService("ContentProvider"):GetAssetFetchStatus(arg) == Enum.AssetFetchStatus.None then
				task.spawn(function()
					str = "X-4"
					str3 = "X-4"
				end)
			end
		end)

		wait(20)
	end
end)

task.spawn(function()
	local bacOutputs = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_OUTPUTS") or {}

	game:GetService("LogService").MessageOut:Connect(function(arg, arg2)
		if arg2 == Enum.MessageType.MessageOutput and table.find(bacOutputs, arg) then
			str = "X-25"
			str3 = "X-25"
		end
	end)

	while wait(15) do
		local v = pairs
		local v6 = table.pack(game:GetService("LogService"):GetLogHistory())
		v6.n = 1 + v6.n - 1
		table.move(v6, 1, v6.n, 1, v6)

		for _, v7 in v(table.unpack(v6, 1, v6.n)) do
			if v7.messageType == Enum.MessageType.MessageOutput and table.find(bacOutputs, v7.message) then
				str = "X-25"
				str3 = "X-25"
			end
		end
	end
end)

task.spawn(function()
	bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})

	if not table.find(bacBanningIgnore, "X-52") then
		game:GetService("LogService").MessageOut:Connect(function(arg, arg2)
			if not (arg2 ~= Enum.MessageType.MessageOutput) then
				if arg:match("^%d%d%d%d%d%d$") then
					str = "X-52"
					str3 = "X-52"
				end

				return
			end
		end)

		return
	end
end)

local ContentProvider2 = game:GetService("ContentProvider")
game:GetService("RunService")
local flag = nil

local function fn8(arg, arg2)
	local connection = nil

	connection = ContentProvider2:GetAssetFetchStatusChangedSignal(arg):Connect(function(arg3)
		if not (arg3 == Enum.AssetFetchStatus.Success and ContentProvider2:GetAssetFetchStatus(arg) == Enum.AssetFetchStatus.Success) then
			if arg3 == Enum.AssetFetchStatus.Failure then
				connection:Disconnect()
			end
		else
			connection:Disconnect()
			str = arg2
			str3 = arg2
			flag = true
		end
	end)

	ContentProvider2:preload(arg)
end

local tbl6 = {
	{ "rbxasset://gca", "X-5" },
	{ "rbxasset://gca/", "X-5" },
	{ "rbxasset://custom/", "X-6" },
	{ "rbxasset://custom", "X-6" },
	{ "rbxasset://SELIWARE", "X-7" },
	{ "rbxasset://velocity_assets", "X-8" },
}

task.spawn(function()
	while wait(10) and not flag do
		for _, v in ipairs(tbl6) do
			fn8(v[1], v[2])
		end
	end
end)

ContentProvider2:GetAssetFetchStatusChangedSignal("http://www.roblox.com/asset/?id=107845011312901"):Connect(function(arg)
	if arg == Enum.AssetFetchStatus.Success then
		str = "X-9"
		str3 = "X-9"
	end
end)

ContentProvider2:GetAssetFetchStatusChangedSignal("rbxassetid://13449277995"):Connect(function(arg)
	if arg == Enum.AssetFetchStatus.Success then
		str = "X-10"
		str3 = "X-10"
	end
end)

ContentProvider2:GetAssetFetchStatusChangedSignal("rbxassetid://15088255768"):Connect(function(arg)
	if arg == Enum.AssetFetchStatus.Success then
		str = "X-11"
		str3 = "X-11"
	end
end)

task.spawn(function()
	local n6 = 0

	local function M()
		n6 += 1

		if n6 > 195 then
			game:GetService("RunService")
		end

		coroutine.wrap(M)()
	end

	wait(math.random(1, 4))

	while true do
		wait(math.random(12, 16))
		n6 = 0
		local _, result = pcall(M)
		local n7 = 0

		for _ in string.gmatch(result, script:GetFullName()) do
			n7 += 1
		end

		if n7 ~= n6 then
			str = "X-16"
			str3 = "X-16"
		end
	end
end)

task.spawn(function()
	repeat
		wait()
	until game:IsLoaded()

	task.wait(math.random(60, 120))

	pcall(function()
		game:GetService("HttpRbxApiService"):RequestLimitedAsync(setmetatable({}, { __index = function()
			require(game.ReplicatedStorage:WaitForChild("Packages").Net):RemoteEvent("InventoryService/Sort"):FireServer("Tung Bat" .. utf8.char(65279), 1)
		end }))
	end)
end)

task.spawn(function()
	local env = getfenv(print)

	while task.wait(3) do
		_G = nil
		shared = nil

		if _G then
			str = "X-15"
			str3 = "X-15"
		end

		if getfenv(print) ~= env then
			str = "X-26"
			str3 = "X-26"
		end
	end
end)

local function fn9()
	local RunService = game:GetService("RunService")

	RunService.RenderStepped:Connect(function()
		local n6 = 1
		local n7 = 100000
		local n8 = 1 - n6

		while true do
			n8 += n6
			local v

			if not (n6 <= 0) then
				if n8 <= n7 then
					v = n8
					math.sqrt(v)
					continue
				end

				break
			else
				if n8 >= n7 then
					v = n8
					math.sqrt(v)
					continue
				end

				break
			end
		end

		game:GetService("UserInputService").InputBegan:Connect(function()
			local n9 = 1
			local n10 = 100000
			local n11 = 1 - n9

			while true do
				n11 += n9

				if not (n9 <= 0) then
					if n11 <= n10 then
						math.random()
						continue
					end
					break
				else
					if n11 >= n10 then
						math.random()
						continue
					end
					break
				end
			end
		end)

		RunService.RenderStepped:Connect(function()
			local n9 = 1
			local n10 = 100000
			local n11 = 1 - n9

			while true do
				n11 += n9
				local v

				if not (n9 <= 0) then
					if n11 <= n10 then
						v = n11
						math.sqrt(v)
						continue
					end

					break
				else
					if n11 >= n10 then
						v = n11
						math.sqrt(v)
						continue
					end

					break
				end
			end
		end)
	end)
end

local v = debug.info(fn3, "l")
local v6 = debug.info(fn3, "s")

local function fn10(arg, arg2)
	return fn6(fn7(v5, str4), arg .. "|" .. arg2)
end

local v7 = debug.info(fn10, "l")
local v8 = debug.info(fn10, "s")

task.spawn(function()
	while task.wait(2) do
		pcall(function()
			if v5 then
				if debug.info(fn3, "l") ~= v or debug.info(fn3, "s") ~= v6 or debug.info(fn10, "l") ~= v7 or debug.info(fn10, "s") ~= v8 then
					str = "X-41"
					str3 = "X-41"
				end

				local str5 = str or "OK"
				local n6 = math.floor(workspace:GetServerTimeNow() / n2)
				local v9 = fn10(n6, str5)
				acRem:FireServer(string.format("%010d", n6) .. v9)
				return
			end
		end)
	end
end)

local v9 = nil

task.spawn(function()
	while wait(math.random(3, 5)) do
		local v10 = task.defer(debug.info)
		local v11, v12 = coroutine.resume(v10)
		task.cancel(v10)

		if not v9 and v12 then
			v9 = v12
		end

		if v12 and v12 ~= v9 then
			str = "X-43"
			str3 = "X-43"
		end
	end
end)

task.spawn(function()
	if not require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
			character.DescendantAdded:Connect(function(descendant)
				if descendant:IsA("BodyGyro") then
					wait()

					if descendant.Name ~= "FlightSpin" and descendant.Name ~= "HDAdminFlyGyro" and descendant.Name ~= "HDAdminSpin2" then
						str = "X-18"
						str3 = "X-18"
					end
				end

				if descendant:IsA("BodyVelocity") then
					wait()

					if descendant.Name ~= "FlightPower" and descendant.Name ~= "HDAdminFlyGyro" and descendant.Name ~= "HDAdminSpin2" then
						str = "X-18"
						str3 = "X-18"
					end
				end
			end)
		end)

		if not require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
			workspace:GetPropertyChangedSignal("Gravity"):Connect(function()
				local v10 = math.round(workspace.Gravity)

				if v10 ~= 29 then
					if v10 ~= 196 then
						str = "X-19"
						str3 = "X-19"
					end
				end
			end)

			return
		end

		return
	end
end)

task.spawn(function()
	if require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		return
	end

	while true do
		wait(10)

		if game.Players.LocalPlayer:FindFirstChild("PlayerGui") then
			if game.Players.LocalPlayer.PlayerGui:FindFirstChild("FaDhenModernMini") or game.Players.LocalPlayer.PlayerGui:FindFirstChild("StealGui") then
				str = "X-23"
				str3 = "X-23"
			end
		end

		local tbl7 = {}
		tbl7[1] = tbl7

		local thread = coroutine.create(function()
			acRem:FireServer("X-22", tbl7)
			return true
		end)

		local v10, v11 = coroutine.resume(thread)
		wait(0.2)
		if not (v10 or v11 and v11 ~= "tables cannot be cyclic") then
			continue
		end
		fn9()
	end
end)

task.spawn(function()
	local Sort = require(game.ReplicatedStorage:WaitForChild("Packages").Net):RemoteEvent("InventoryService/Sort")

	while true do
		wait(1)

		local ok, result = pcall(function()
			return not Sort or Sort.Parent ~= game.ReplicatedStorage.Packages.Net
		end)

		if not (not ok or result) then
			continue
		end
		str = "X-29"
		str3 = "X-29"
	end
end)

task.spawn(function()
	local n6 = 0

	local function M()
		n6 += 1

		if n6 > 199 then
			require()
		end

		coroutine.wrap(M)()
	end

	wait(math.random(2, 6))

	while true do
		wait(math.random(15, 20))
		n6 = 0
		local _, result = pcall(M)

		if result:find("C stack overflow", 1, true) then
			str = "X-59"
			str3 = "X-59"
		end
	end
end)

task.spawn(function()
	local tbl7 = {}
	tbl7[1] = tbl7
	local n6 = 0

	local function y()
		n6 += 1

		if n6 > 199 then
			Instance.new("RemoteEvent").FireServer(tbl7)
		end

		coroutine.wrap(y)()
	end

	wait(math.random(3, 8))

	while wait(math.random(13, 18)) do
		n6 = 0
		local _, result = pcall(y)

		if result:find("C stack overflow", 1, true) then
			str = "X-60"
			str3 = "X-60"
		end
	end
end)

task.spawn(function()
	if require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		return
	end
	local HttpService = game:GetService("HttpService")

	while true do
		wait(3)

		pcall(function()
			return HttpService:RequestAsync()
		end)
	end
end)

task.spawn(function()
	if not require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})

		if not table.find(bacBanningIgnore, "X-30") then
			workspace.ChildAdded:Connect(function(child)
				if child:IsA("Part") and child.Name == "PlatformPart" then
					str = "X-30"
					str3 = "X-30"
				end
			end)

			return
		end

		return
	end
end)

task.spawn(function()
	if not require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})

		if not table.find(bacBanningIgnore, "X-31") then
			Players2.LocalPlayer.CharacterAdded:Connect(function(character)
				character:WaitForChild("HumanoidRootPart").ChildAdded:Connect(function(child)
					if child.Name == "SpeedBoostAttachment" or child.Name == "SpeedBoostVelocity" then
						str = "X-31"
						str3 = "X-31"
					end
				end)
			end)

			return
		end

		return
	end
end)

task.spawn(function()
	if not require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})

		if not table.find(bacBanningIgnore, "X-32") then
			game:GetService("LogService").MessageOut:Connect(function(arg, arg2)
				if arg2 == Enum.MessageType.MessageWarning and (arg == "PrivateServerId cannot be checked on the client, please check on the server." or arg == "[Debug] CachedServers updated: 100 entries") then
					str = "X-32"
					str3 = "X-32"
				end
			end)

			return
		end

		return
	end
end)

task.spawn(function()
	if not require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})

		if not table.find(bacBanningIgnore, "X-36") then
			Players2.LocalPlayer.CharacterAdded:Connect(function(character)
				character:WaitForChild("HumanoidRootPart").ChildAdded:Connect(function(child)
					pcall(function()
						wait(0.1)

						if not (not child:IsA("AlignOrientation") or not (child.Name ~= "CharacterAlignOrientation")) then
							str = "X-36"
							str3 = "X-36"
						end
					end)
				end)
			end)

			if Players2.LocalPlayer.Character then
				Players2.LocalPlayer.Character:WaitForChild("HumanoidRootPart").ChildAdded:Connect(function(child)
					pcall(function()
						wait(0.1)

						if child:IsA("AlignOrientation") then
							if child.Name ~= "CharacterAlignOrientation" then
								str = "X-36"
								str3 = "X-36"
							end
						end
					end)
				end)
			end

			return
		end

		return
	end
end)

task.spawn(function()
	if not require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})

		if not table.find(bacBanningIgnore, "X-37") then
			while wait(math.random(1, 6)) do
				if workspace:FindFirstChild("BrainrotRangeRing") and workspace:FindFirstChild("BrainrotRangeRing"):IsA("Folder") then
					str = "X-37"
					str3 = "X-37"
				end
			end

			return
		end

		return
	end
end)

task.spawn(function()
	if not require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})

		if not table.find(bacBanningIgnore, "X-38") then
			while wait(math.random(1, 6)) do
				if workspace:FindFirstChild("AlreadyHere") and workspace:FindFirstChild("AlreadyHere"):IsA("Folder") then
					str = "X-38"
					str3 = "X-38"
				end
			end

			return
		end

		return
	end
end)

task.spawn(function()
	bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})

	if not table.find(bacBanningIgnore, "X-34") then
		if not game:GetService("RunService"):IsStudio() then
			if not (game:FindService("VirtualInputManager") or game:FindService("VirtualUser")) then
				wait(10)

				game.ServiceAdded:Connect(function()
					if not game:FindService("VirtualInputManager") then
						if game:FindService("VirtualUser") then
							str = "X-34"
							str3 = "X-34"
						end
					else
						str = "X-34"
						str3 = "X-34"
						return
					end
				end)

				return
			end

			return
		end

		return
	end
end)

task.spawn(function()
	bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})
	if table.find(bacBanningIgnore, "X-44") then
		return
	end

	if game:GetService("RunService"):IsStudio() then
		return
	end
	local n6 = 0

	local function M()
		n6 += 1

		if n6 > 195 then
			game:GetService("RunService")
		end

		coroutine.wrap(M)()
	end

	local function y()
		n6 = 0
		pcall(M)
		return n6
	end

	local v10 = y()
	wait(math.random(10, 18))

	while true do
		wait(math.random(12, 16))

		if v10 ~= y() then
			str = "X-44"
			str3 = "X-44"
		end
	end
end)

task.spawn(function()
	bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})

	if not table.find(bacBanningIgnore, "X-45") then
		if not game:GetService("RunService"):IsStudio() then
			repeat
				wait()
			until game:IsLoaded()

			wait(10)

			if not game:FindService("EncodingService") then
				game.ServiceAdded:Connect(function()
					if game:FindService("EncodingService") then
						str = "X-45"
						str3 = "X-45"
					end
				end)

				return
			end

			return
		end

		return
	end
end)

task.spawn(function()
	if require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		return
	end
	bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})
	if table.find(bacBanningIgnore, "X-66") then
		return
	end
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local StarterPlayer = game:GetService("StarterPlayer")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local ServerData = require(ReplicatedStorage.Datas.ServerData)
	local LocalPlayer = Players.LocalPlayer
	local flag2 = RunService:IsStudio() or (game.Players.LocalPlayer.Name == "Abblebees11")

	local function u()
		local CharacterWalkSpeed = StarterPlayer.CharacterWalkSpeed
		local n6 = ((if not ((LocalPlayer:GetAttribute("EpicSauce") or 0) >= os.time()) then (if not ReplicatedStorage:GetAttribute("SpeedEvent") then CharacterWalkSpeed else 80) else ((if not ReplicatedStorage:GetAttribute("SpeedEvent") then CharacterWalkSpeed else 80)) * 1.6)) + (LocalPlayer:GetAttribute("BackroomsEventSpeed") or 0)
		local SpeedModifier = LocalPlayer:GetAttribute("SpeedModifier")
		return ((((if (type(SpeedModifier) ~= "number") or not (SpeedModifier > 1) then n6 else n6 * SpeedModifier)) * 0.6) * 1.1) + 1
	end

	local function y(character)
		local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
		local Humanoid = character:WaitForChild("Humanoid")
		local n6 = 0
		local n7 = 0
		local n8 = 0
		local n9 = 0
		local n10 = 0
		local connection = nil

		connection = RunService.Heartbeat:Connect(function(dt)
			if not character.Parent then
				connection:Disconnect()
				return
			end

			if (((((not LocalPlayer:GetAttribute("Stealing") or (Humanoid.Health <= 0)) or Humanoid.SeatPart) or ServerData.IsTsunamiServer()) or LocalPlayer:GetAttribute("GiantPotion")) or (dt <= 0)) or (dt > 0.25) then
				n6 = 0
				return
			end
			local AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
			local Magnitude = Vector3.new(AssemblyLinearVelocity.X, 0, AssemblyLinearVelocity.Z).Magnitude
			local v10 = u()
			local State = Humanoid:GetState()

			if (State == Enum.HumanoidStateType.Physics) or ((State == Enum.HumanoidStateType.FallingDown) or (State == Enum.HumanoidStateType.GettingUp)) then
				n6 = math.max(0, n6 - dt)
			elseif v10 < Magnitude then
				if (State == Enum.HumanoidStateType.Freefall) or (State == Enum.HumanoidStateType.Jumping) then
					n6 += dt * 0.4
				else
					n6 += dt

					if n6 >= 2 then
						n6 = 0

						if v5 then
							local n11 = math.floor(workspace:GetServerTimeNow() / n2)

							pcall(function()
								acRem:FireServer(string.format("%010d", n11) .. fn10(n11, "X-66"))
							end)
						end
					end
				end
			else
				n6 = math.max(0, n6 - (dt * 2))
			end

			if flag2 then
				n7 = math.max(n7, Magnitude)
				n8 += Magnitude
				n9 += 1
				local elapsed = os.clock()

				if (elapsed - n10) >= 0.5 then
					print(("[X-46] vel %.1f (avg %.1f, peak %.1f) / limit %.1f | over %.2fs/%ds | %s%s"):format(Magnitude, n8 / n9, n7, v10, n6, 2, State.Name, (not (n6 >= 2) and "") or " ** FLAGGED **"))
					n7 = 0
					n8 = 0
					n9 = 0
					n10 = elapsed
				end
			end
		end)
	end

	if LocalPlayer.Character then
		y(LocalPlayer.Character)
	end

	LocalPlayer.CharacterAdded:Connect(y)
end)

task.spawn(function()
	if require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		return
	end
	local TextChatService = game:GetService("TextChatService")
	local localPlayer2 = game:GetService("Players").LocalPlayer
	local v10 = TextChatService:WaitForChild(localPlayer2.Name)

	localPlayer2:GetPropertyChangedSignal("UserId"):Connect(function()
		str = "X-47"
		str3 = "X-47"
	end)

	while true do
		pcall(function()
			v10:SendAsync("", math.random())
		end)

		wait(30)
	end
end)

task.spawn(function()
	if require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		return
	end
	local tbl7 = { "EggrotLavaVelocity", "FloatVelocity" }
	bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})
	if table.find(bacBanningIgnore, "X-48") then
		return
	end

	while true do
		if game.Players.LocalPlayer.Character then
			if localPlayer:GetAttribute("Stealing") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("LinearVelocity", true) then
				if table.find(tbl7, game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("LinearVelocity", true).Name) then
					continue
				end
				str = "X-49"
				str3 = "X-49"
				str2 = "4"
			end
		end

		wait(2)
	end
end)

task.spawn(function()
	if require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		return
	end

	while true do
		wait(10)

		for _, descendant in pairs(workspace:WaitForChild("Plots"):GetDescendants()) do
			if ((descendant.Parent and (descendant.Parent.Name == "CashPad")) and (descendant.Name == "structure base home")) and ((descendant.Transparency ~= 0) or (descendant.LocalTransparencyModifier ~= 0)) then
				str = "X-51"
				str3 = "X-51"
				str2 = "3"
			end
		end
	end
end)

task.spawn(function()
	while true do
		wait(math.random(8, 14))
		local str5 = "X-" .. math.random(100, 999)
		local v10 = str3

		local ok, result = pcall(function()
			str3 = str5
		end)

		local flag2 = str3 ~= str5 or not ok or result

		if ok then
			str3 = v10
		end

		if not (flag2 and v5) then
			continue
		end
		local n6 = math.floor(workspace:GetServerTimeNow() / n2)

		pcall(function()
			acRem:FireServer(string.format("%010d", n6) .. fn10(n6, "X-67"))
		end)
	end
end)

task.spawn(function()
	if require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		return
	end

	while true do
		wait(10)

		if workspace:FindFirstChild("__PodiumMarkers") then
			str = "X-63"
			str3 = "X-63"
			str2 = "1"
		end

		if workspace:FindFirstChild("__NextBaseAnchor") then
			str = "X-63"
			str3 = "X-63"
			str2 = "2"
		end

		if workspace:FindFirstChild("__NextBaseBillboard") then
			str = "X-63"
			str3 = "X-63"
			str2 = "3"
		end

		if not workspace:FindFirstChild("__PodiumCollide") then
			continue
		end
		str = "X-63"
		str3 = "X-63"
		str2 = "4"
	end
end)

task.spawn(function()
	if require(game.ReplicatedStorage:WaitForChild("Datas").ServerData).IsJumpLTMServer() then
		return
	end
	bacBanningIgnore = require(game.ReplicatedStorage:WaitForChild("Packages").FFlags):Get("BAC_BANNING_IGNORE", {})
	if table.find(bacBanningIgnore, "X-68") then
		return
	end

	if game:GetService("RunService"):IsStudio() then
		return
	end
	local v10 = nil

	xpcall(function()
		return game.FakeIndex
	end, function()
		v10 = debug.info(2, "f")
	end)

	local n6 = 0

	local function y()
		n6 += 1
		if n6 == 199 then
			return v10()
		end
		coroutine.wrap(y)()
	end

	local function u()
		n6 = 0
		local _, result = pcall(y)
		return #result, n6
	end

	local v11, v12 = u()
	local v13, v14 = u()
	if (v11 ~= v13) or (v12 ~= v14) then
		return
	end

	while wait(15) do
		local v15, v16 = u()

		if (v15 ~= v11) or (v12 ~= v16) then
			str = "X-68"
			str3 = "X-68"
		end
	end
end)
