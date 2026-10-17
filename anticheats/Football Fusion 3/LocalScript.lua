-- Script Path: game:GetService("ReplicatedFirst").LocalScript
-- Took 0s to decompile.
-- Executor: Real (2.7.8)

-- Script path: ReplicatedFirst.LocalScript
-- Decompile time: 2.29 ms

local CharacterSoundEvent = ((game:GetService("ReplicatedStorage")):WaitForChild("Remotes")):WaitForChild("CharacterSoundEvent")
local u13 = true
;(game:GetService("ScriptContext")).Error:Connect(function(a1, a2) -- Line: 5 -- upvalues: u13 (ref), CharacterSoundEvent (val)
    if u13
        and a1:sub(1, 12) ~= "CorePackages"
        and a2:sub(1, 12) ~= "CorePackages"
        and a1:sub(1, 14) ~= "MainGui is not"
        and a1:find("UTF-8", 1, true) == nil then
        if not a1:find("ClientMain", 1, true) then
            if a1:sub(1, 22) ~= "The Parent property of"
                and a1:sub(1, 10) ~= "FileSystem"
                and a1:sub(1, 7) ~= "boost::" then
                CharacterSoundEvent:fireServer("👁️‍🗨️🈯💱.", "error", a1, (a2:gsub(workspace.Name, "_NORMAL_")))
                u13 = false
                wait(30)
                u13 = true
            end
        elseif not a1:find("attempt to index nil", 1, true)
            and a1:sub(1, 22) ~= "The Parent property of"
            and a1:sub(1, 10) ~= "FileSystem"
            and a1:sub(1, 7) ~= "boost::" then
            CharacterSoundEvent:fireServer("👁️‍🗨️🈯💱.", "error", a1, (a2:gsub(workspace.Name, "_NORMAL_")))
            u13 = false
            wait(30)
            u13 = true
        end
    end
end)
