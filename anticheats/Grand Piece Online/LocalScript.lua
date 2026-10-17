-- Script Path: game:GetService("ReplicatedFirst")["paul greyrat"].Laplace
-- Took 0s to decompile.
-- Executor: Real (2.7.8)

-- Script path: ReplicatedFirst.paul greyrat.Laplace
-- Decompile time: 4.34 ms

local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Parent = script.Parent
local anti = script:FindFirstChild("anti")
local MovementGuard = Parent:WaitForChild("MovementGuard")
local Config = require(MovementGuard.Config)
if Config.RandomizeNames and not RunService:IsStudio() then
    for i, j in {Parent, script, MovementGuard} do
        j.Name = HttpService:GenerateGUID(false)
    end
    if anti then
        anti.Name = HttpService:GenerateGUID(false)
    end
end
if game.GameId == 2097989947 then
    task.spawn(function() -- Line: 20 -- upvalues: MovementGuard (val), Parent (val)
        local success, err = pcall(function() -- Line: 21 -- upvalues: MovementGuard (upval), Parent (upval)
            local v1 = require(MovementGuard)
            if Parent:IsDescendantOf(game) then
                v1.start(nil, Parent)
            end
        end)
        if not success then
            warn("[MovementGuard] startup failed: " .. tostring(err))
        end
    end)
end
if not RunService:IsStudio() then
    task.spawn(function() -- Line: 34 -- upvalues: anti (ref), Config (val), HttpService (val)
        if not anti then
            anti = script:WaitForChild("anti")
            if Config.RandomizeNames then
                anti.Name = HttpService:GenerateGUID(false)
            end
        end
        require(anti)
    end)
end
