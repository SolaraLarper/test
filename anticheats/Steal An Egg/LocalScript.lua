local function fn()
end

local v = table.pack(fn(nil, nil))

if v[1] ~= nil then
	local v2 = v[1]
	local v3 = v[2]
	return "Silly Goose"
end

wait()
script.Disabled = true
script.Parent = nil
script = Instance.new("LocalScript")
local str = nil
local str2 = nil
local str3 = nil
local acRem = game.ReplicatedStorage:WaitForChild("ACRem")
local ContentProvider = game:GetService("ContentProvider")
game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local localPlayer = game:GetService("Players").LocalPlayer

local function fn2(arg)
	for i = 1, 10 do
		local ok, result = pcall(getfenv, i)

		if ok and result.getrenv then
			arg = tostring(math.random(1, 10000))
		end
	end

	xpcall(function()
		PluginManager():CreatePlugin():Deactivate()
	end, function()
	end)

	local jobId = game.JobId
	local str4 = ""

	for i = 1, #arg do
		local str5 = arg:sub(i, i)
		local str6 = jobId:sub((i - 1) % #jobId + 1, (i - 1) % #jobId + 1)
		str4 ..= string.char(bit32.bxor(string.byte(str5), string.byte(str6)))
	end

	return str4
end

local function fn3(arg)
	return fn2(arg)
end

local tbl = {
	game:GetService("AnimationFromVideoCreatorService"),
	game:GetService("AdService"),
	game:GetService("BadgeService"),
	game:GetService("CookiesService"),
	game:GetService("GamepadService"),
}

acRem.Parent = tbl[math.random(1, #tbl)]
acRem.Name = HttpService:GenerateGUID(false)

task.spawn(function()
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local FastFlags = require(ReplicatedStorage.UserGenerated.FastFlags)
	local Asserts = require(ReplicatedStorage.UserGenerated.Lang.Asserts)

	local response = FastFlags.Replicated("UserGenerated.BAC.InterfaceManifest", function(arg)
		Asserts.Array(Asserts.String)(arg.Widgets)
		Asserts.Array(Asserts.String)(arg.Txts)
		return arg
	end, { Widgets = {}, Txts = {} }):GetAsync()

	local txts = response.Txts

	for k, txt in pairs(txts) do
		game:GetService("ContentProvider"):GetAssetFetchStatusChangedSignal(txt):Connect(function(arg)
			if arg == Enum.AssetFetchStatus.Success then
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
			for k, txt in pairs(txts) do
				if game:GetService("ContentProvider"):GetAssetFetchStatus(txt) == Enum.AssetFetchStatus.Success then
					str = "X-1"
					str3 = "X-1"
					str2 = tostring(k)
					break
				end
			end

			task.wait(10)
		end
	end)

	require(ReplicatedStorage.UserGenerated.FastFlags)
	local Asserts2 = require(ReplicatedStorage.UserGenerated.Lang.Asserts)

	local function fn4(arg)
		Asserts2.Map(Asserts2.String, Asserts2.Boolean)(arg.Widgets)
		Asserts2.Map(Asserts2.String, Asserts2.Boolean)(arg.Txts)
		return arg
	end

	local widgets = response.Widgets

	game.Players.LocalPlayer:WaitForChild("PlayerGui").ChildAdded:Connect(function(child)
		if table.find(widgets, child.Name) then
			task.spawn(function()
				str = "X-24"
				str3 = "X-24"
				str2 = child.Name
			end)
		end
	end)

	task.spawn(function()
		while task.wait() do
			for k, widget in pairs(widgets) do
				if game.Players.LocalPlayer.PlayerGui:FindFirstChild(widget) then
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

local tbl2 = { "rbxassetid://18984490161" }
local tbl3 = {}

task.spawn(function()
	while true do
		ContentProvider:PreloadAsync(tbl2, function(arg)
			if arg then
				if game:GetService("ContentProvider"):GetAssetFetchStatus(arg) == Enum.AssetFetchStatus.Failure then
					tbl3[arg] = true
				end
			end

			if tbl3[arg] then
				if game:GetService("ContentProvider"):GetAssetFetchStatus(arg) == Enum.AssetFetchStatus.None then
					task.spawn(function()
						str = "X-4"
						str3 = "X-4"
					end)
				end
			end
		end)

		wait(20)
	end
end)

task.spawn(function()
	game:GetService("LogService").MessageOut:Connect(function(arg, arg2)
		if arg2 == Enum.MessageType.MessageOutput then
			if arg:match("^%d%d%d%d%d%d$") then
				str = "X-52"
				str3 = "X-52"
			end

			return
		end
	end)
end)

task.spawn(function()
	local n = 0

	local function p()
		n += 1

		if n > 195 then
			game:GetService("RunService")
		end

		coroutine.wrap(p)()
	end

	while true do
		wait(1)
		n = 0
		local n2 = 0
		local ok, result = pcall(p)

		for match in string.gmatch(result, script:GetFullName()) do
			n2 += 1
		end

		if n == n2 then
			continue
		end
		str = "X-16"
		str3 = "X-16"
	end
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

local v2 = debug.info(fn3, "l")
local v3 = debug.info(fn3, "s")
local v4 = fn3("X-41")
local info = fn3("info")
local line = fn3("line")

task.spawn(function()
	while wait(math.random(1, 2)) do
		if str3 then
			wait(math.random(45, 120))
			acRem:FireServer(fn3(str3), str2 and fn3(str2) or math.random(1, 2) == 2 and fn3(tostring(math.random(1, 2000))) or nil)
			break
		elseif debug.info(fn3, "l") ~= v2 then
			acRem:FireServer(v4, line)
			break
		end
	end
end)

task.spawn(function()
	while task.wait(1) do
		acRem:FireServer(fn3(str or "X-" .. tostring(math.floor(workspace:GetServerTimeNow()))), str2 and fn3(str2) or math.random(1, 2) == 2 and fn3(tostring(math.random(1, 2000))) or nil)

		if v3 ~= debug.info(fn3, "s") then
			acRem:FireServer(v4, info)
		end
	end
end)

task.spawn(function()
	local HttpService2 = game:GetService("HttpService")

	while true do
		wait(3)

		pcall(function()
			return HttpService2:RequestAsync()
		end)
	end
end)

task.spawn(function()
	if game:GetService("RunService"):IsStudio() then
		return
	end

	if not game:FindService("VirtualInputManager") then
		if not game:FindService("VirtualUser") then
			wait(10)

			game.ServiceAdded:Connect(function()
				if game:FindService("VirtualInputManager") then
					str = "X-34"
					str3 = "X-34"
				elseif game:FindService("VirtualUser") then
					str = "X-34"
					str3 = "X-34"
					return
				end
			end)

			return
		end
	end
end)

task.spawn(function()
	local RunService = game:GetService("RunService")
	local fn4 = RunService
	if RunService.IsStudio(fn4) then
		return
	end
	local n = 0

	fn4 = function()
		n += 1

		if n > 195 then
			game:GetService("RunService")
		end

		coroutine.wrap(fn4)()
	end

	local function fn5()
		n = 0
		pcall(fn4)
		return n
	end

	local v5 = fn5()
	wait(10)

	while true do
		wait(5)

		if v5 ~= fn5() then
			str = "X-44"
			str3 = "X-44"
		end
	end
end)
