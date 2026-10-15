-- MAY BE UNRELATED TO KRIPTON. EDUCATION PURPOSES!
-- Script path: StarterPlayer.StarterPlayerScripts.anti_ws
-- Decompile time: 2.97 ms

local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local u10 = {}
RunService.PostSimulation:Connect(function() -- Line: 7 -- upvalues: u10 (ref)
    local v1 = tick()
    while true do
        if not (#u10 > 0) or not (1 < v1 - u10[1].time) then
            break
        end
        table.remove(u10, 1)
    end
end)

local function near() -- Line: 15
    for i, j in game.Players:GetPlayers() do
        if j == game.Players.LocalPlayer and j.Character and j.CharacterAppearanceLoaded then
            continue
        end
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - j.Character.HumanoidRootPart.Position).Magnitude <= 7 then
            return true
        end
    end
    return false
end

UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 27 -- upvalues: near (val), u10 (ref)
    if a2 then
        return
    end
    if a1.KeyCode ~= Enum.KeyCode.W and a1.KeyCode ~= Enum.KeyCode.S then
        return
    end
    local v1 = tick()
    if not near() then
        return
    end
    table.insert(u10, {key = a1.KeyCode, time = v1})
    local v2 = #u10
    if v2 >= 5 then
        v2 = true
        local v3 = #u10
        for i = 2, v3 do
            if u10[i].key == u10[i - 1].key then
                v2 = false
                break
            end
        end
        if v2 and u10[#u10].time - u10[1].time <= 1.5 then
            game.Players.LocalPlayer:Kick("Really?")
            u10 = {}
        end
    end
end)
