-- Script Path: game:GetService("ReplicatedFirst")["enable me to detect so hooks"]
-- Took 0s to decompile.
-- Executor: Real (2.7.8)

-- Script path: ReplicatedFirst.enable me to detect so hooks
-- Decompile time: 5.02 ms

local success, success_2, success_3, success_4, u69, u72, u74, v1
local u65 = 0

function u69() -- Line: 7 -- upvalues: u65 (ref), u69 (ref)
    u65 = u65 + 1
    game:FindFirstChild("")
    u69()
end

function u72() -- Line: 13 -- upvalues: u65 (ref), u72 (ref)
    u65 = u65 + 1
    local Name = game.Name
    u72()
end

function u74() -- Line: 19 -- upvalues: u65 (ref), u74 (ref)
    u65 = u65 + 1
    game.Parent = nil
    u74()
end

local v2 = {
    __tostring = function(a1) -- Line: 26 -- upvalues: u65 (ref)
        if u65 == 0 then
            for k, v in pairs((debug.traceback():split("\n"))) do
                if v ~= "" and not string.find(v, "ReplicatedFirst.enable me to detect so hooks") then
                    warn("namecall hook detected 2", v)
                end
            end
        end
        u65 = u65 + 1
        tostring(a1)
    end,
}
local u75 = setmetatable({}, v2)
while task.wait(3) do
    v1 = print
    success = pcall(u69)
    v1(success, u65)
    if u65 ~= 19997 then
        warn("namecall hook detected")
    end
    u65 = 0
    v1 = print
    success_2 = pcall(u72)
    v1(success_2, u65)
    if u65 ~= 19997 then
        warn("index hook detected")
    end
    u65 = 0
    v1 = print
    success_3 = pcall(u74)
    v1(success_3, u65)
    if u65 ~= 19997 then
        warn("newindex hook detected")
    end
    u65 = 0
    v1 = print
    success_4 = pcall(function() -- Line: 61 -- upvalues: u75 (val)
        (Instance.new("RemoteEvent")):FireServer(1, 2, 3, {[u75] = true})
    end)
    v1(success_4, u65)
    if u65 ~= 197 then
        warn("namecall hook detected 3")
    end
    u65 = 0
end
