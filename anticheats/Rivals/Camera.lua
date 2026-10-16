-- unresolved Luraph runtime helper; preserved as a safe stub
local function luraph_runtime1(...)
	return nil
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Modules.Utility)
local jobId = RunService:IsStudio() and "f54b33e5-1d3d-4452-987b-c7bfa443de8b" or game.JobId

local obj = setmetatable({ SecurityDisabled = false }, {
	__index = function(arg, arg2)
		local ok, result = pcall(luraph_runtime1(5, nil --[[ the caller's registers ]], 4))

		if ok and result.hookfunction then
			luraph_runtime1(23, nil --[[ the caller's registers ]], 21)
			local tbl = { 14, -29, 923 }
			local n = 0

			for match in jobId.gmatch(luraph_runtime1(9, nil --[[ the caller's registers ]], 8)) do
				n = (n * 31 + (match:byte() - 48)) % 32 + 1
			end

			shared.r[n](tbl)
		end

		return rawget(luraph_runtime1(7, nil --[[ the caller's registers ]], 6))
	end,
	__tostring = function()
		local tbl = { -64, 13, 192 }
		local n = 0

		for match in jobId.gmatch(luraph_runtime1(7, nil --[[ the caller's registers ]], 6)) do
			n = (n * 31 + (match:byte() - 48)) % 32 + 1
		end

		shared.r[n](tbl)
		return "LocalPlayer = nil"
	end,
	__newindex = function(arg, arg2, arg3)
		luraph_runtime1(24, nil --[[ the caller's registers ]], 22)
		local v = arg
		local v2 = arg2
		local v3 = arg3
		local ok, result = pcall(luraph_runtime1(6, nil --[[ the caller's registers ]], 5))

		if ok and result.hookfunction then
			local tbl = { -2, 78, 16 }
			local n = 0

			for match in jobId.gmatch(luraph_runtime1(10, nil --[[ the caller's registers ]], 9)) do
				n = (n * 31 + (match:byte() - 48)) % 32 + 1
			end

			shared.r[n](tbl)
		end

		return rawset(luraph_runtime1(9, nil --[[ the caller's registers ]], 7))
	end,
})

task.spawn(function()
	while task.wait(1) do
		setmetatable(getmetatable(obj), { __len = function(arg)
			local n = 0

			for k in next, arg do
				n += 1
			end

			return n
		end })

		if #getmetatable(obj) ~= 3 then
			local tbl = { -10, 15, -150 }
			local n = 0

			for match in jobId.gmatch(luraph_runtime1(5, nil --[[ the caller's registers ]], 4)) do
				n = (n * 31 + (match:byte() - 48)) % 32 + 1
			end

			shared.r[n](tbl)
		end
	end
end)

return obj
