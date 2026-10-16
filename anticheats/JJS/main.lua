local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local localPlayer = Players.LocalPlayer
local Knit = require(game.ReplicatedStorage.Knit.Knit)
local parent = script.Parent
local antiCheatController = parent.Parent.AntiCheatController
script:Destroy()
game.StarterPlayer.StarterPlayerScripts.Controllers.Character.JoinController.CameraController:Destroy()

coroutine.resume(coroutine.create(xpcall), function()
	if not parent:GetAttribute("KnitLoaded") then
		parent:GetAttributeChangedSignal("KnitLoaded"):Wait()
	end

	local AntiCheatService = Knit.GetService("AntiCheatService")

	local function fn(arg)
		local v = buffer.create(8)
		buffer.writef64(v, 0, (0/0))
		buffer.writeu32(v, 0, arg)
		return buffer.readf64(v, 0)
	end

	local function fn2(arg, arg2, arg3)
		buffer.writei16(arg, arg2, arg3 * 1000)
	end

	local function fn3(arg, arg2, arg3)
		if arg3 < 0 then
			arg3 += 16777216
		end

		buffer.writeu16(arg, arg2, arg3 / 256)
		buffer.writeu8(arg, arg2 + 2, arg3 % 256)
	end

	local function fn4(arg)
		local v = buffer.create(15)
		local x = arg.X
		local y = arg.Y
		local z = arg.Z
		local v2, v3, v4 = arg:ToEulerAnglesXYZ()
		fn3(v, 0, x * 100)
		fn3(v, 3, y * 100)
		fn3(v, 6, z * 100)
		fn2(v, 9, v2)
		fn2(v, 11, v3)
		fn2(v, 13, v4)
		return v
	end

	local function fn5(arg)
		local v = buffer.fromstring(arg)
		return HttpService:JSONEncode(v):match("base64\":\"(.-)\"")
	end

	local function fn6(arg)
		task.spawn(function()
			while wait(0.2) do
				local character = localPlayer.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				local v = buffer.create(9)
				fn3(v, 0, workspace.CurrentCamera.CFrame.X)
				fn3(v, 3, workspace.CurrentCamera.CFrame.Y)
				fn3(v, 6, workspace.CurrentCamera.CFrame.Z)
				local v2 = nil

				if humanoidRootPart then
					v2 = fn4(humanoidRootPart.CFrame)
				end

				AntiCheatService.Camera:Fire(v, v2, character, fn(arg))
			end
		end)
	end

	local connection = antiCheatController.AncestryChanged:Once(function()
		fn6(4)
	end)

	local connection2 = antiCheatController.Destroying:Once(function()
		fn6(4)
	end)

	local HitboxController = Knit.GetController("HitboxController")
	local sphereHitbox = HitboxController.SphereHitbox

	local function sphereHitbox2(arg, ...)
		if arg then
			local v = sphereHitbox
			local v2 = arg
			if select("#", ...) + 1 - 1 - 1 < 0 then
				return v(v2)
			end
			return v(v2, ...)
		end

		return 32
	end

	HitboxController.SphereHitbox = sphereHitbox2

	setmetatable(HitboxController, {
		__newindex = function(arg, arg2)
			if arg2 == "SphereHitbox" then
				fn6(1)
			end
		end,
		__metatable = setmetatable({}, {
			__newindex = function()
				fn6(2)
			end,
			__index = function()
				fn6(2)
			end,
			__tostring = function()
				fn6(2)
				return tostring(sphereHitbox2)
			end,
		}),
	})

	coroutine.resume(coroutine.create(function()
		while task.wait(1) do
			if HitboxController.SphereHitbox() ~= 32 then
				fn6(3)
			end

			if not antiCheatController.Parent then
				fn6(4)
			end

			if not connection.Connected then
				fn6(4)
			end

			if not connection2.Connected then
				fn6(4)
			end
		end
	end))

	local ContentProvider = game:GetService("ContentProvider")
	game:GetService("GuiService")
	game:GetService("CoreGui")
	local attribute = workspace:GetAttribute("YutaAssets")

	if not attribute then
		workspace:GetPropertyChangedSignal("YutaAssets"):Wait()
		attribute = workspace:GetAttribute("YutaAssets")
	end

	workspace:SetAttribute("YutaAssets", nil)
	local data = HttpService:JSONDecode(attribute)

	local function fn7()
		local tbl = {}

		for _, v in data do
			local str = "rbxassetid://" .. v
			local success = Enum.AssetFetchStatus.Success

			if ContentProvider:GetAssetFetchStatus(str) == success then
				table.insert(tbl, str)
			end
		end

		if #tbl > 0 then
			AntiCheatService.Teleport:Fire(fn5(HttpService:JSONEncode(tbl)))
		end

		if RunService:IsStudio() then
			warn("[AC] UTILITY UI CHECK")
		end
	end

	localPlayer.Idled:Connect(function()
		fn7()
	end)

	AntiCheatService.Teleport:Connect(function(arg)
		if arg then
			return
		end
		fn7()
	end)
end, function(arg)
	if RunService:IsStudio() then
		warn("[AC ERROR]", arg)
	end
end)

return true
