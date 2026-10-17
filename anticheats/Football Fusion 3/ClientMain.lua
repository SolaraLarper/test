-- Script Path: game:GetService("StarterPlayer").StarterPlayerScripts.PlayerScriptsLoader.PlayerModule:GetChildren()[5]
-- Took 0.64s to decompile.
-- Executor: Real (2.7.8)

-- Script path: StarterPlayer.StarterPlayerScripts.PlayerScriptsLoader.PlayerModule.ClientMain    
-- Decompile time: 642.51 ms

local Part, v1, v2, v3
local v5 = game:FindFirstChild("\000")
tick()
_ = 0
if v5 then
    v5()
end
script:Destroy()
script = nil
math.randomseed(10000000 * (tick() % 1))
local random = math.random
local Humanoid = Instance.new("Humanoid")
local u5005 = pcall
local resume = coroutine.resume
local create = coroutine.create
local delay_2 = task.delay
local FindFirstChildOfClass = game.FindFirstChildOfClass
local GetPropertyChangedSignal = game.GetPropertyChangedSignal
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local ContentProvider = game:GetService("ContentProvider")
local LogService = game:GetService("LogService")
local CoreGui = game:GetService("CoreGui")
local PreloadAsync = ContentProvider.PreloadAsync
local GetLogHistory = LogService.GetLogHistory
local Heartbeat = RunService.Heartbeat
local Connect = Heartbeat.Connect
local reverse = string.reverse

local function v6(a1) -- Line: 39 -- upvalues: reverse (val)
    return (reverse(a1)) .. ""
end

local u5044 = rawget
local u5045 = rawset
local u6037 = workspace
local u5047 = false
local u5048 = 0
local u5049 = delay
local u5053 = 99 + random()
local u5057 = random(2000000, 6000000)

local function u5058() -- Line: 47 -- upvalues: u5053 (val), Connect (val), Heartbeat (val), u5057 (val)
    local v1 = nil
    for i = 2, u5053 do
        v1 = {
            (Connect(Heartbeat, function() -- Line: 50 -- upvalues: u5057 (upval)
                local v1 = u5057
                for i = 1, v1 do end
            end)),
        }
    end
    return v1[3]
end

local function u5059() -- Line: 56 -- upvalues: u5047 (ref), u5053 (val), Connect (val), Heartbeat (val), u5057 (val)
    if not u5047 then
        return
    end
    local v1 = nil
    for i = 2, u5053 do
        v1 = {
            (Connect(Heartbeat, function() -- Line: 60 -- upvalues: u5057 (upval)
                local v1 = u5057
                for i = 1, v1 do end
            end)),
        }
    end
    return v1[3]
end

local function u5060() -- Line: 66 -- upvalues: u5053 (val), Connect (val), Heartbeat (val), u5057 (val)
    local v1 = nil
    for i = 2, u5053 do
        v1 = {
            Connect,
            Heartbeat,
            function() -- Line: 69 -- upvalues: u5057 (upval)
                local v1 = u5057
                for i = 1, v1 do end
            end,
        }
    end
    return v1[3]
end

local u5061 = false
local u5062 = false
local u5063 = false
local u5064 = false
local u5065 = true
local u5066 = true
local u5069 = true
local u5070 = true
local u5071 = true
local u5072 = true
local u5073 = true
local u5074 = true
local u5075 = true
local u5076 = true
local u5077 = true
local u5078 = true
local u5080 = false
local u5081 = false
local u5082 = false
local u5083 = true
local u5084 = true

local function v7() -- Line: 85
    local u0 = nil
    xpcall(function() -- Line: 87
        game:_()
    end, function() -- Line: 87 -- upvalues: u0 (ref)
        debug.info(2, "f")
    end)
    return u0
end

local u5086 = nil
xpcall(function() -- Line: 87
    game:_()
end, function() -- Line: 87 -- upvalues: u5086 (ref)
    debug.info(2, "f")
end)
local u5091 = u5086
local v8 = newproxy(true)
local u5097 = getmetatable(v8)

local function u5098() -- Line: 93 -- upvalues: u5061 (ref)
    u5061 = true
    error()
end

u5097.__tostring = u5098

function u5097.__index() -- Line: 95 -- upvalues: u5061 (ref)
    u5061 = true
    error()
end

function u5097.__eq() -- Line: 96 -- upvalues: u5061 (ref)
    u5061 = true
    error()
end

u5097.__metatable = false
local info = debug.info

local function u5103(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10) -- Line: 99
    -- upvalues: u5044 (val), info (val), u5097 (val), u5045 (val)
    local v1 = a2 and u5044(a2, 1)
    local v2 = info(2, "sn")
    if v2
        and v2:sub(-3, -3) == "i"
        and a3
        and a3 ~= a4
        and a8 ~= a7
        and a10 ~= u5097
        and #a1 > 1000000
        and #a6 > 1000000 then
        u5045(
            v1,
            math.round((((u5044(v1, 11)) * 90001) ^ 0.25 + 485 - 21) / 90 - 10) + 1,
            (u5044(v1, (math.floor((math.sqrt(a7 - 1545, a3 + a4 + a5 + a8 + a9))))))
        )
    end
    return a2
end

local function u5104(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10) -- Line: 107
    -- upvalues: u5044 (val), info (val), u5097 (val), u5045 (val)
    local v1 = a2 and u5044(a2, 1)
    local v2 = info(2, "sn")
    if v2
        and v2:sub(-3, -3) == "i"
        and a3
        and a3 ~= a4
        and a8 ~= a7
        and a10 ~= u5097
        and #a1 > 1000000
        and #a6 > 1000000 then
        u5045(
            v1,
            math.round((((u5044(v1, 11)) + 90001) ^ 0.25 + 485 - 21) / 90 + 10) + 1,
            (u5044(v1, (math.floor((math.sqrt(a7 - 1545, a3 + a4 + a5 + a8 + a9))))))
        )
    end
    return a2
end

u5097.__call = u5104
local u5107 = table.clone(u5097)
u5107.__call = u5104
local v9 = {
    (setmetatable({
        setmetatable({}, u5097),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        v8,
    }, u5097)),
}
local u6058 = setmetatable(v9, u5097)
local v10 = {
    (setmetatable({
        setmetatable({}, u5097),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        v8,
    }, u5097)),
}
local u6071 = setmetatable(v10, u5097)
for i = 1, 5 do
    v1 = {
        (setmetatable({
            setmetatable({}, u5107),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            random(1000000, 100000000),
            v8,
        }, u5107)),
    }
    u5097[i] = (setmetatable(v1, u5107))
end
local v11 = {
    (setmetatable({
        setmetatable({}, u5107),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(100, 1000),
        v8,
    }, u5107)),
}
local u6065 = setmetatable(v11, u5107)
local v12 = {
    (setmetatable({
        setmetatable({}, u5107),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(1000000, 100000000),
        random(100, 1000),
        v8,
    }, u5107)),
}
local u6052 = setmetatable(v12, u5107)
local u5561 = string.rep("\n👁️‍🗨️👁️‍🗨️👁️‍🗨️👁️‍🗨️" .. string.char((random(1, 255))), 100000)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = Instance.new("RemoteEvent")
local FireServer = RemoteEvent.FireServer
local LocalPlayer = game:GetService("Players").LocalPlayer

local function v13(a1, a2) -- Line: 142 -- upvalues: resume (val), create (val)
    local v1, v2 = resume(create(function() -- Line: 143 -- upvalues: a1 (val), a2 (val)
        return a1[a2] * 1
    end))
    return v1 and v2 or false
end

local function v14(a1, a2, a3) -- Line: 146 -- upvalues: resume (val), create (val)
    return resume(create(function() -- Line: 147 -- upvalues: a1 (val), a2 (val), a3 (val)
        a1[a2] = a3
    end))
end

local function v15() -- Line: 149 -- upvalues: create (val), resume (val)
    local v1 = create(wait)
    local v2, v3 = resume(v1, 3)
    return v3 or not v2 or coroutine.status(v1) ~= "suspended"
end

local u5584 = 0
local u5585 = true

local function u5586(a1, a2) -- Line: 156
    -- upvalues: u5585 (ref), u5584 (ref), u5062 (ref), u5065 (ref), u5066 (ref), u6071 (val), u5044 (val), u5045 (val)
    -- upvalues: delay_2 (val), u5058 (val), RemoteEvent (ref), u5103 (val), u5561 (val)
    local v1 = tick()
    if a1 == "69" then
        u5585 = true
    elseif 9 < v1 - u5584 then
        u5585 = false
    end
    u5584 = v1
    v1 = a1:sub(14)
    local v2 = a1:sub(30)
    if v1 == "282305376"
        or v2 == "282305376"
        or v2 == "5597086202"
        or v1 == "1352543873"
        or v1 == "4666593882"
        or v1 == "17261060811"
        or v1 == "7072719338"
        or v1 == "15197354452"
        or v1 == "7072725342"
        or v1 == "5587865193"
        or v1 == "3944703587"
        or v1 == "1204397029"
        or v1 == "10709791437"
        or v1 == "3570695787"
        or v1 == "6031094667"
        or v1 == "17830630301"
        or v1 == "3926305904"
        or v1 == "13387657138"
        or v1 == "4031889928"
        or v1 == "4483345998"
        or v1 == "13387419794"
        or v1 == "3602733521"
        or v1 == "4155801252"
        or v1 == "16268437782"
        or v1 == "11419703997"
        or v1 == "12874061329"
        or v1 == "14926240421"
        or v1 == "7445543667"
        or v1 == "472635937"
        or v1 == "4623529748"
        or v1 == "9968344227"
        or v1 == "5642383285" then
        u5062 = true
        u5065 = true
        u5066 = true
        u5045(u5044(u6071, 1), 21, v1)
        delay_2(0.4, u5058)
        RemoteEvent:fireServer("👁️‍🗨️🈯💱.", u5103(u5561, u6071, 1658, 1660, 1661, u5561, 1741, 1781, 1966), nil)
    end
end

_G["do"] = u5060
local u5608 = 0
local u5609 = 0
local u5610 = 0
local u5611 = 0
LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 177
    -- upvalues: GetPropertyChangedSignal (val), Humanoid (ref), u5077 (ref), u5064 (ref), u5078 (ref), delay_2 (val)
    -- upvalues: u5059 (val), RemoteEvent (ref), u5103 (val), u5561 (val), u6071 (val), u5610 (ref), u5609 (ref)
    -- upvalues: u5608 (ref), u5611 (ref)
    if a1 then
        a1.ChildAdded:Connect(function(a1) -- Line: 179
            -- upvalues: GetPropertyChangedSignal (upval), Humanoid (upval), u5077 (upval), u5064 (upval), u5078 (upval)
            -- upvalues: delay_2 (upval), u5059 (upval), RemoteEvent (upval), u5103 (upval), u5561 (upval)
            -- upvalues: u6071 (upval)
            if a1.Name:sub(1, 5) == "Catch" or a1.Name:sub(1, 5) == "BlokP" then
                (GetPropertyChangedSignal(a1, "Size")):Connect(function() -- Line: 181
                    -- upvalues: a1 (val), Humanoid (upval), u5077 (upval), u5064 (upval), u5078 (upval)
                    -- upvalues: delay_2 (upval), u5059 (upval), RemoteEvent (upval), u5103 (upval), u5561 (upval)
                    -- upvalues: u6071 (upval)
                    if 2.3 < a1.size.x then
                        if Humanoid.RootPart and Humanoid.RootPart.size.x < 2.01 then
                            u5077 = true
                            u5064 = true
                            u5078 = true
                            delay_2(0.4, u5059)
                            RemoteEvent:fireServer(
                                "👁️‍🗨️🈯💱.",
                                u5103(u5561, u6071, 1676, 1778, 1870, u5561, 1801, 1775, 1777),
                                nil
                            )
                        end
                    elseif 1.55 < a1.size.z
                        and a1.Name:sub(1, 5) == "BlokP"
                        and Humanoid.RootPart
                        and Humanoid.RootPart.size.x < 2.01 then
                        u5077 = true
                        u5064 = true
                        u5078 = true
                        delay_2(0.4, u5059)
                        RemoteEvent:fireServer(
                            "👁️‍🗨️🈯💱.",
                            u5103(u5561, u6071, 1676, 1778, 1870, u5561, 1801, 1775, 1777),
                            nil
                        )
                    end
                end)
            end
        end)
        a1:WaitForChild("Humanoid")
        ;(GetPropertyChangedSignal(a1:WaitForChild("HumanoidRootPart"), "CFrame")):Connect(function() -- Line: 190 -- upvalues: u5610 (upval), u5609 (upval), u5608 (upval)
            local v1 = tick()
            if not (v1 - u5610 < 0.334) then
                u5608 = 1
                u5610 = v1
            elseif 0.004 < v1 - u5609 then
                u5608 = u5608 + 1
                if u5608 == 8 then
                    warn("a")
                end
            end
            u5609 = v1
        end)
        ;(GetPropertyChangedSignal(a1:WaitForChild("Torso"), "CanCollide")):Connect(function() -- Line: 207 -- upvalues: u5611 (upval)
            if 0.5 < tick() - u5611 then
                tick()
            end
        end)
    end
end)
local u5629 = true
RunService:BindToRenderStep(tostring((random())), 0, function() -- Line: 217
    -- upvalues: u5629 (ref), Humanoid (ref), u5069 (ref), u5063 (ref), u5070 (ref), u5084 (ref), u5049 (val)
    -- upvalues: u5058 (val), u5059 (val)
    u5629 = not u5629
    if u5629 then
        return
    end
    if 0.1 < Humanoid.HipHeight
        or 20.08 < Humanoid.WalkSpeed
        or 50.08 < Humanoid.JumpPower
        or Humanoid.UseJumpPower == false then
        u5069 = true
        u5063 = true
        u5070 = true
    end
    while u5084 == false do
        u5049(0.2, u5058)
        u5049(0.2, u5059)
    end
end)
local u5651 = {}
u6037.ChildAdded:Connect(function(a1) -- Line: 241
    -- upvalues: Humanoid (ref), GetPropertyChangedSignal (val), u5651 (val), u5071 (ref), u5072 (ref), u5080 (ref)
    -- upvalues: delay_2 (val), u5058 (val), RemoteEvent (ref), u5103 (val), u5561 (val), u6071 (val), u5075 (ref)
    -- upvalues: u5076 (ref)
    if a1.Name == "Football" and a1:IsA("BasePart") and 4 < a1.Position.Y and Humanoid.Parent then
        local Children = Humanoid.Parent:GetChildren()
        for i = #Children, 1, -1 do
            if not Children[i]:IsA("BasePart") then
                table.remove(Children, i)
            end
        end
        local u40 = nil
        local u41 = nil
        u40 = (GetPropertyChangedSignal(a1, "CFrame")):Connect(function() -- Line: 251
            -- upvalues: Children (val), u5651 (upval), a1 (val), u40 (ref), u5071 (upval), u5072 (upval), u5080 (upval)
            -- upvalues: delay_2 (upval), u5058 (upval), RemoteEvent (upval), u5103 (upval), u5561 (upval)
            -- upvalues: u6071 (upval)
            local Magnitude, v1, v2
            local v3 = #Children
            for i = 1, v3 do
                v1 = Children[i]
                v2 = u5651[v1.Name]
                Magnitude = (a1.Position - v1.Position).Magnitude
                if Magnitude < 1.5 then
                    u5651[v1.Name] = Magnitude
                    u40:Disconnect()
                    if v2 and (math.abs(Magnitude - v2)) < 1e-05 then
                        u5071 = true
                        u5072 = true
                        u5080 = true
                        delay_2(0.4, u5058)
                        return RemoteEvent:fireServer(
                            "👁️‍🗨️🈯💱.",
                            u5103(u5561, u6071, 1754, 1689, 1661, u5561, 1741, 1764, 1968),
                            nil
                        )
                    end
                end
            end
        end)
        local u64 = (GetPropertyChangedSignal(a1, "Size")):Connect(function() -- Line: 267
            -- upvalues: u5080 (upval), u5075 (upval), u5076 (upval), delay_2 (upval), u5058 (upval)
            -- upvalues: RemoteEvent (upval), u5103 (upval), u5561 (upval), u6071 (upval)
            u5080 = true
            u5075 = true
            u5076 = true
            delay_2(0.4, u5058)
            RemoteEvent:fireServer("👁️‍🗨️🈯💱.", u5103(u5561, u6071, 1801, 1767, 1680, u5561, 1741, 1774, 1867), nil)
        end)
        wait(0.1)
        a1.AncestryChanged:Connect(function() -- Line: 272 -- upvalues: u40 (ref), u41 (ref), u64 (ref)
            u40:Disconnect()
            u41:Disconnect()
            u64:Disconnect()
        end)
    end
end)
;(GetPropertyChangedSignal(u6037, "Gravity")):Connect(function() -- Line: 279
    -- upvalues: u5073 (ref), u5081 (ref), u5074 (ref), delay_2 (val), u5059 (val), RemoteEvent (ref), u5103 (val)
    -- upvalues: u5561 (val), u6071 (val)
    u5073 = true
    u5081 = true
    u5074 = true
    delay_2(0.4, u5059)
    RemoteEvent:fireServer("👁️‍🗨️🈯💱.", u5103(u5561, u6071, 1888, 1882, 1661, u5561, 1801, 1771, 1789), nil)
end)
local PlayerScripts = LocalPlayer:WaitForChild("PlayerScripts", 20)
if PlayerScripts == nil
    or PlayerScripts:WaitForChild("PlayerScriptsLoader", 20) == nil
    or PlayerScripts.PlayerScriptsLoader:WaitForChild("PlayerModule", 20) == nil
    or PlayerScripts.PlayerScriptsLoader.PlayerModule:WaitForChild("z", 20) == nil then
    u5058()
end
script = PlayerScripts.PlayerScriptsLoader.PlayerModule.z
wait(0.1)
game:GetService("StarterPlayer").StarterPlayerScripts:ClearAllChildren()
script.Changed:Connect(function(a1) -- Line: 290 -- upvalues: delay_2 (val), u5058 (val)
    if a1 == "Parent" or a1 == "Disabled" then
        delay_2(9, u5058)
    end
end)
RemoteEvent = (ReplicatedStorage:WaitForChild("Remotes")):WaitForChild("CharacterSoundEvent")
local RemoteEvent_2 = Instance.new("RemoteEvent")
RemoteEvent_2.Parent = RemoteEvent.Parent
local u5751 = true

function v12() -- Line: 301 -- upvalues: RemoteEvent_2 (val), RemoteEvent (ref), u5084 (ref)
    RemoteEvent_2.Name = RemoteEvent.Name
    u5084 = false
end

local u5755 = nil
u5755 = {
    20.01,
    0,
    function() -- Line: 306 -- upvalues: u6037 (val), u5005 (val), u5107 (val), u5755 (ref), u5098 (val)
        local v1
        local v2 = u6037:FindFirstChild("  ")
        if v2 == nil then
            v1 = u5005(function() -- Line: 311
                return game.Size
            end)
            if not v1 then
                v1 = true
                if (debug.info(2, "sn")):sub(-1) ~= " " then
                    v1 = u5107[u5755[5]] ~= u5098
                end
            end
        else
            v1 = v2:IsA("BasePart")
            if not v1 then
                v1 = u5005(function() -- Line: 311
                    return game.Size
                end)
                if not v1 then
                    v1 = true
                    if (debug.info(2, "sn")):sub(-1) ~= " " then
                        v1 = u5107[u5755[5]] ~= u5098
                    end
                end
            end
        end
        return v1
    end,
    5100000,
    "__tostring",
}
RemoteEvent.OnClientEvent:Connect(function(a1, a2, a3) -- Line: 313
    -- upvalues: u6037 (val), u5629 (ref), u5103 (val), u5561 (val), u6071 (val), u5751 (ref), LocalPlayer (val)
    -- upvalues: FindFirstChildOfClass (val), Humanoid (ref), u5005 (val), reverse (val), delay_2 (val), u5058 (val)
    -- upvalues: u5077 (ref), u5064 (ref), u5078 (ref), LogService (val), u5083 (ref), u5755 (ref), resume (val)
    -- upvalues: create (val), u5091 (val), u5061 (ref), u5082 (ref), u5062 (ref), random (val), u5584 (ref)
    -- upvalues: PreloadAsync (val), ContentProvider (val), CoreGui (val), u5586 (val), Lighting (val), u5065 (ref)
    -- upvalues: u5066 (ref), u5069 (ref), u5070 (ref), u5071 (ref), u5072 (ref), u5073 (ref), u5074 (ref), u5075 (ref)
    -- upvalues: u5076 (ref), u5080 (ref), RemoteEvent_2 (val), RemoteEvent (ref), u5084 (ref), u5060 (val), u5081 (ref)
    -- upvalues: u5063 (ref), u5059 (val), u5104 (val), u6065 (val), u6052 (val)
    local v1 = u6037:FindFirstChild("\000")
    if v1 then
        v1()
    end
    if a1 == "👁️‍🗨️🈯💱." then
        local u185, v2, v3, v4, v5, v6
        wait(u5629)
        u5103(u5561, u6071, 1750, 1750, 1655, u5561, 1761, 1888, 1767)
        u5103(
            u5561,
            u6071,
            1645,
            1765,
            1623,
            "______________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________",
            1714,
            1881,
            1656
        )
        u5751 = not u5751
        if LocalPlayer.Character
            and LocalPlayer.Character.Parent
            and FindFirstChildOfClass(LocalPlayer.Character, "Humanoid") then
            Humanoid = FindFirstChildOfClass(LocalPlayer.Character, "Humanoid")
            local Descendants = LocalPlayer.Character:GetDescendants()
            v3 = #Descendants
            for j = 1, v3 do
                v4 = Descendants[j]
                v5, v6 = u5005(game.IsA, v4, (reverse("\000revoMydoB")) .. "")
                if v5 == false then
                    delay_2(0.4, u5058)
                    u5103(u5561, u6071, 1750, 1656, 1761, u5561, 1741, 1652, 1565)
                    u5751 = true
                elseif v6 ~= true then
                    if v4.Name ~= "Torso" then
                        if v4.Name:sub(2, 8) == "atchL"
                            and 2.3 < v4.size.x
                            and Humanoid.RootPart
                            and Humanoid.RootPart.size.x < 2.01 then
                            u5077 = true
                            u5064 = true
                            u5078 = true
                        end
                    elseif v4.CanCollide ~= false
                        and v4.Name:sub(2, 8) == "atchL"
                        and 2.3 < v4.size.x
                        and Humanoid.RootPart
                        and Humanoid.RootPart.size.x < 2.01 then
                        u5077 = true
                        u5064 = true
                        u5078 = true
                    end
                elseif tostring(v4):sub(1, 2) ~= "FF" then
                    delay_2(0.4, u5058)
                    u5103(u5561, u6071, 1750, 1656, 1761, u5561, 1741, 1652, 1565)
                    u5751 = true
                elseif v4.Name ~= "Torso" then
                    if v4.Name:sub(2, 8) == "atchL"
                        and 2.3 < v4.size.x
                        and Humanoid.RootPart
                        and Humanoid.RootPart.size.x < 2.01 then
                        u5077 = true
                        u5064 = true
                        u5078 = true
                    end
                elseif v4.CanCollide ~= false
                    and v4.Name:sub(2, 8) == "atchL"
                    and 2.3 < v4.size.x
                    and Humanoid.RootPart
                    and Humanoid.RootPart.size.x < 2.01 then
                    u5077 = true
                    u5064 = true
                    u5078 = true
                end
            end
        end
        local LogHistory = LogService:GetLogHistory()
        u5083 = true
        if game:FindFirstChild("topcontainer", true) or u5755[3]() or u5755[1] ~= 20.01 then
            u5083 = false
            u5103(u5561, u6071, 1767, 1676, 1854, u5561, 1689, 1775, 1776)
        end
        local u176 = (reverse("deepSklaW")) .. ""
        local u177 = Humanoid
        v5, v6 = resume(create(function() -- Line: 143 -- upvalues: u177 (val), u176 (val)
            return u177[u176] * 1
        end))
        if not v5 then
            u185 = false
        else
            u185 = v6
            if not u185 then
                u185 = false
            end
        end
        v4, v5 = u5005(game:GetService("HttpService").RequestInternal, game:GetService("HttpService"))
        v6, v2 = u5005(u5091)
        local message = ""
        if #LogHistory > 1 then
            message = LogHistory[#LogHistory].message
            if message == "Stack End" then
                message = LogHistory[#LogHistory - 1].message
            end
            if message:find("animation") then
                message = ""
            end
        end
        v3 = u6037:FindFirstChildWhichIsA("Beam", true)
        if u5061 or u5082 or u5062 or u185 == false then
            delay_2(0.4, u5058)
            u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
            u5751 = true
        else
            local u237 = Humanoid
            local u240 = random() * -99
            local v7 = resume
            local v8 = create
            if v7(v8(function() -- Line: 147 -- upvalues: u237 (val), u176 (val), u240 (val)
                u237[u176] = u240
                return
            end)) == false then
                delay_2(0.4, u5058)
                u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                u5751 = true
            else
                local u251 = Humanoid
                v7, v8 = resume(create(function() -- Line: 143 -- upvalues: u251 (val), u176 (val)
                    return u251[u176] * 1
                end))
                local v9 = v7 and v8 or false
                if (v9 or -1) ~= 0 then
                    delay_2(0.4, u5058)
                    u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                    u5751 = true
                else
                    local u262 = Humanoid
                    local v10 = resume
                    v7 = create
                    if v10(v7(function() -- Line: 147 -- upvalues: u262 (val), u176 (val), u185 (val)
                        u262[u176] = u185
                        return
                    end)) == false then
                        delay_2(0.4, u5058)
                        u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                        u5751 = true
                    else
                        v9 = create(wait)
                        v10, v7 = resume(v9, 3)
                        local v11 = v7 or not v10 or coroutine.status(v9) ~= "suspended"
                        if v11 then
                            delay_2(0.4, u5058)
                            u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                            u5751 = true
                        else
                            local u374, u451, u470, u475, u487, u492, v12
                            if u6037.CurrentCamera then
                                local CurrentCamera = u6037.CurrentCamera
                                local u297 = (reverse("weiVfOdleif")) .. ""
                                v8, v12 = resume(create(function() -- Line: 143 -- upvalues: CurrentCamera (val), u297 (val)
                                    return CurrentCamera[u297] * 1
                                end))
                                v9 = v8 and v12 or false
                                v11 = v9 or 99
                                if v11 > 75
                                    or message:find("\n, line ", 1, true)
                                    or message:match("^%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a[,:]") then
                                    delay_2(0.4, u5058)
                                    u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                    u5751 = true
                                else
                                    v11 = tick() - u5584
                                    if v11 > 120 then
                                        v11 = resume
                                        v9 = create(PreloadAsync)
                                        v7 = {"69", CoreGui}
                                        if v11(v9, ContentProvider, v7, u5586) == false
                                            or FindFirstChildOfClass(Lighting, "Part")
                                            or FindFirstChildOfClass(u6037, "Sound")
                                            or v4
                                            or v5:find("blocked function", 1, true) then
                                            delay_2(0.4, u5058)
                                            u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                            u5751 = true
                                        else
                                            v11 = u5091
                                            u374 = nil
                                            xpcall(function() -- Line: 87
                                                game:_()
                                            end, function() -- Line: 87 -- upvalues: u374 (ref)
                                                debug.info(2, "f")
                                            end)
                                            v9 = u374
                                            if v11 ~= v9
                                                or v6
                                                or v2:find("expected)", 1, true) == nil
                                                or game.ReplicatedFirst:FindFirstChild("LocalScript") == nil then
                                                delay_2(0.4, u5058)
                                                u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                u5751 = true
                                            elseif v3 == nil then
                                                if not u5065
                                                    or not u5066
                                                    or not u5069
                                                    or not u5070
                                                    or not u5071
                                                    or not u5072
                                                    or not u5073
                                                    or not u5074
                                                    or not u5075
                                                    or not u5076
                                                    or not u5077
                                                    or u5080 then
                                                    delay_2(0.4, u5058)
                                                    u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                    u5751 = true
                                                else
                                                    RemoteEvent_2.Name = RemoteEvent.Name
                                                    u5084 = false
                                                    if delay_2(0.4, u5060) == nil then
                                                        delay_2(0.4, u5058)
                                                        u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                        u5751 = true
                                                    elseif not u5083
                                                        or u5103(u5561, u6071, 1645, 1765, 1623, u5561, 1714, 1881, 1656) then
                                                        u451 = Humanoid
                                                        v7, v8 = resume(create(function() -- Line: 143 -- upvalues: u451 (val), u176 (val)
                                                            return u451[u176] * 1
                                                        end))
                                                        if 20.01 < (v7 and v8 or false or 99) then
                                                            delay_2(0.4, u5059)
                                                            u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                            u5751 = true
                                                        else
                                                            u470 = Humanoid
                                                            u475 = (reverse("thgieHpih")) .. ""
                                                            v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u470 (val), u475 (val)
                                                                return u470[u475] * 1
                                                            end))
                                                            if 0.041 < (v8 and v12 or false or 99) then
                                                                delay_2(0.4, u5059)
                                                                u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                                u5751 = true
                                                            else
                                                                u487 = Humanoid
                                                                u492 = (reverse("rewoPpmuj")) .. ""
                                                                v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u487 (val), u492 (val)
                                                                    return u487[u492] * 1
                                                                end))
                                                                if 50.01 < (v8 and v12 or false or 99)
                                                                    or u6037.Gravity < 196
                                                                    or u5081
                                                                    or u5063
                                                                    or u5064 then
                                                                    delay_2(0.4, u5059)
                                                                    u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                                    u5751 = true
                                                                end
                                                            end
                                                        end
                                                    else
                                                        delay_2(0.4, u5058)
                                                        u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                        u5751 = true
                                                    end
                                                end
                                            elseif v3.Name ~= "GroundBeam"
                                                or not u5065
                                                or not u5066
                                                or not u5069
                                                or not u5070
                                                or not u5071
                                                or not u5072
                                                or not u5073
                                                or not u5074
                                                or not u5075
                                                or not u5076
                                                or not u5077
                                                or u5080 then
                                                delay_2(0.4, u5058)
                                                u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                u5751 = true
                                            else
                                                RemoteEvent_2.Name = RemoteEvent.Name
                                                u5084 = false
                                                if delay_2(0.4, u5060) == nil then
                                                    delay_2(0.4, u5058)
                                                    u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                    u5751 = true
                                                elseif not u5083
                                                    or u5103(u5561, u6071, 1645, 1765, 1623, u5561, 1714, 1881, 1656) then
                                                    u451 = Humanoid
                                                    v7, v8 = resume(create(function() -- Line: 143 -- upvalues: u451 (val), u176 (val)
                                                        return u451[u176] * 1
                                                    end))
                                                    if 20.01 < (v7 and v8 or false or 99) then
                                                        delay_2(0.4, u5059)
                                                        u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                        u5751 = true
                                                    else
                                                        u470 = Humanoid
                                                        u475 = (reverse("thgieHpih")) .. ""
                                                        v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u470 (val), u475 (val)
                                                            return u470[u475] * 1
                                                        end))
                                                        if 0.041 < (v8 and v12 or false or 99) then
                                                            delay_2(0.4, u5059)
                                                            u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                            u5751 = true
                                                        else
                                                            u487 = Humanoid
                                                            u492 = (reverse("rewoPpmuj")) .. ""
                                                            v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u487 (val), u492 (val)
                                                                return u487[u492] * 1
                                                            end))
                                                            if 50.01 < (v8 and v12 or false or 99)
                                                                or u6037.Gravity < 196
                                                                or u5081
                                                                or u5063
                                                                or u5064 then
                                                                delay_2(0.4, u5059)
                                                                u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                                u5751 = true
                                                            end
                                                        end
                                                    end
                                                else
                                                    delay_2(0.4, u5058)
                                                    u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                    u5751 = true
                                                end
                                            end
                                        end
                                    elseif FindFirstChildOfClass(Lighting, "Part")
                                        or FindFirstChildOfClass(u6037, "Sound")
                                        or v4
                                        or v5:find("blocked function", 1, true) then
                                        delay_2(0.4, u5058)
                                        u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                        u5751 = true
                                    else
                                        v11 = u5091
                                        u374 = nil
                                        xpcall(function() -- Line: 87
                                            game:_()
                                        end, function() -- Line: 87 -- upvalues: u374 (ref)
                                            debug.info(2, "f")
                                        end)
                                        v9 = u374
                                        if v11 ~= v9
                                            or v6
                                            or v2:find("expected)", 1, true) == nil
                                            or game.ReplicatedFirst:FindFirstChild("LocalScript") == nil then
                                            delay_2(0.4, u5058)
                                            u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                            u5751 = true
                                        elseif v3 == nil then
                                            if not u5065
                                                or not u5066
                                                or not u5069
                                                or not u5070
                                                or not u5071
                                                or not u5072
                                                or not u5073
                                                or not u5074
                                                or not u5075
                                                or not u5076
                                                or not u5077
                                                or u5080 then
                                                delay_2(0.4, u5058)
                                                u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                u5751 = true
                                            else
                                                RemoteEvent_2.Name = RemoteEvent.Name
                                                u5084 = false
                                                if delay_2(0.4, u5060) == nil then
                                                    delay_2(0.4, u5058)
                                                    u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                    u5751 = true
                                                elseif not u5083
                                                    or u5103(u5561, u6071, 1645, 1765, 1623, u5561, 1714, 1881, 1656) then
                                                    u451 = Humanoid
                                                    v7, v8 = resume(create(function() -- Line: 143 -- upvalues: u451 (val), u176 (val)
                                                        return u451[u176] * 1
                                                    end))
                                                    if 20.01 < (v7 and v8 or false or 99) then
                                                        delay_2(0.4, u5059)
                                                        u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                        u5751 = true
                                                    else
                                                        u470 = Humanoid
                                                        u475 = (reverse("thgieHpih")) .. ""
                                                        v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u470 (val), u475 (val)
                                                            return u470[u475] * 1
                                                        end))
                                                        if 0.041 < (v8 and v12 or false or 99) then
                                                            delay_2(0.4, u5059)
                                                            u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                            u5751 = true
                                                        else
                                                            u487 = Humanoid
                                                            u492 = (reverse("rewoPpmuj")) .. ""
                                                            v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u487 (val), u492 (val)
                                                                return u487[u492] * 1
                                                            end))
                                                            if 50.01 < (v8 and v12 or false or 99)
                                                                or u6037.Gravity < 196
                                                                or u5081
                                                                or u5063
                                                                or u5064 then
                                                                delay_2(0.4, u5059)
                                                                u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                                u5751 = true
                                                            end
                                                        end
                                                    end
                                                else
                                                    delay_2(0.4, u5058)
                                                    u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                    u5751 = true
                                                end
                                            end
                                        elseif v3.Name ~= "GroundBeam"
                                            or not u5065
                                            or not u5066
                                            or not u5069
                                            or not u5070
                                            or not u5071
                                            or not u5072
                                            or not u5073
                                            or not u5074
                                            or not u5075
                                            or not u5076
                                            or not u5077
                                            or u5080 then
                                            delay_2(0.4, u5058)
                                            u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                            u5751 = true
                                        else
                                            RemoteEvent_2.Name = RemoteEvent.Name
                                            u5084 = false
                                            if delay_2(0.4, u5060) == nil then
                                                delay_2(0.4, u5058)
                                                u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                u5751 = true
                                            elseif not u5083
                                                or u5103(u5561, u6071, 1645, 1765, 1623, u5561, 1714, 1881, 1656) then
                                                u451 = Humanoid
                                                v7, v8 = resume(create(function() -- Line: 143 -- upvalues: u451 (val), u176 (val)
                                                    return u451[u176] * 1
                                                end))
                                                if 20.01 < (v7 and v8 or false or 99) then
                                                    delay_2(0.4, u5059)
                                                    u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                    u5751 = true
                                                else
                                                    u470 = Humanoid
                                                    u475 = (reverse("thgieHpih")) .. ""
                                                    v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u470 (val), u475 (val)
                                                        return u470[u475] * 1
                                                    end))
                                                    if 0.041 < (v8 and v12 or false or 99) then
                                                        delay_2(0.4, u5059)
                                                        u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                        u5751 = true
                                                    else
                                                        u487 = Humanoid
                                                        u492 = (reverse("rewoPpmuj")) .. ""
                                                        v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u487 (val), u492 (val)
                                                            return u487[u492] * 1
                                                        end))
                                                        if 50.01 < (v8 and v12 or false or 99)
                                                            or u6037.Gravity < 196
                                                            or u5081
                                                            or u5063
                                                            or u5064 then
                                                            delay_2(0.4, u5059)
                                                            u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                            u5751 = true
                                                        end
                                                    end
                                                end
                                            else
                                                delay_2(0.4, u5058)
                                                u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                u5751 = true
                                            end
                                        end
                                    end
                                end
                            elseif message:find("\n, line ", 1, true)
                                or message:match("^%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a[,:]") then
                                delay_2(0.4, u5058)
                                u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                u5751 = true
                            else
                                v11 = tick() - u5584
                                if v11 > 120 then
                                    v11 = resume
                                    v9 = create(PreloadAsync)
                                    v7 = {"69", CoreGui}
                                    if v11(v9, ContentProvider, v7, u5586) == false
                                        or FindFirstChildOfClass(Lighting, "Part")
                                        or FindFirstChildOfClass(u6037, "Sound")
                                        or v4
                                        or v5:find("blocked function", 1, true) then
                                        delay_2(0.4, u5058)
                                        u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                        u5751 = true
                                    else
                                        v11 = u5091
                                        u374 = nil
                                        xpcall(function() -- Line: 87
                                            game:_()
                                        end, function() -- Line: 87 -- upvalues: u374 (ref)
                                            debug.info(2, "f")
                                        end)
                                        v9 = u374
                                        if v11 ~= v9
                                            or v6
                                            or v2:find("expected)", 1, true) == nil
                                            or game.ReplicatedFirst:FindFirstChild("LocalScript") == nil then
                                            delay_2(0.4, u5058)
                                            u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                            u5751 = true
                                        elseif v3 == nil then
                                            if not u5065
                                                or not u5066
                                                or not u5069
                                                or not u5070
                                                or not u5071
                                                or not u5072
                                                or not u5073
                                                or not u5074
                                                or not u5075
                                                or not u5076
                                                or not u5077
                                                or u5080 then
                                                delay_2(0.4, u5058)
                                                u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                u5751 = true
                                            else
                                                RemoteEvent_2.Name = RemoteEvent.Name
                                                u5084 = false
                                                if delay_2(0.4, u5060) == nil then
                                                    delay_2(0.4, u5058)
                                                    u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                    u5751 = true
                                                elseif not u5083
                                                    or u5103(u5561, u6071, 1645, 1765, 1623, u5561, 1714, 1881, 1656) then
                                                    u451 = Humanoid
                                                    v7, v8 = resume(create(function() -- Line: 143 -- upvalues: u451 (val), u176 (val)
                                                        return u451[u176] * 1
                                                    end))
                                                    if 20.01 < (v7 and v8 or false or 99) then
                                                        delay_2(0.4, u5059)
                                                        u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                        u5751 = true
                                                    else
                                                        u470 = Humanoid
                                                        u475 = (reverse("thgieHpih")) .. ""
                                                        v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u470 (val), u475 (val)
                                                            return u470[u475] * 1
                                                        end))
                                                        if 0.041 < (v8 and v12 or false or 99) then
                                                            delay_2(0.4, u5059)
                                                            u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                            u5751 = true
                                                        else
                                                            u487 = Humanoid
                                                            u492 = (reverse("rewoPpmuj")) .. ""
                                                            v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u487 (val), u492 (val)
                                                                return u487[u492] * 1
                                                            end))
                                                            if 50.01 < (v8 and v12 or false or 99)
                                                                or u6037.Gravity < 196
                                                                or u5081
                                                                or u5063
                                                                or u5064 then
                                                                delay_2(0.4, u5059)
                                                                u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                                u5751 = true
                                                            end
                                                        end
                                                    end
                                                else
                                                    delay_2(0.4, u5058)
                                                    u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                    u5751 = true
                                                end
                                            end
                                        elseif v3.Name ~= "GroundBeam"
                                            or not u5065
                                            or not u5066
                                            or not u5069
                                            or not u5070
                                            or not u5071
                                            or not u5072
                                            or not u5073
                                            or not u5074
                                            or not u5075
                                            or not u5076
                                            or not u5077
                                            or u5080 then
                                            delay_2(0.4, u5058)
                                            u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                            u5751 = true
                                        else
                                            RemoteEvent_2.Name = RemoteEvent.Name
                                            u5084 = false
                                            if delay_2(0.4, u5060) == nil then
                                                delay_2(0.4, u5058)
                                                u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                u5751 = true
                                            elseif not u5083
                                                or u5103(u5561, u6071, 1645, 1765, 1623, u5561, 1714, 1881, 1656) then
                                                u451 = Humanoid
                                                v7, v8 = resume(create(function() -- Line: 143 -- upvalues: u451 (val), u176 (val)
                                                    return u451[u176] * 1
                                                end))
                                                if 20.01 < (v7 and v8 or false or 99) then
                                                    delay_2(0.4, u5059)
                                                    u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                    u5751 = true
                                                else
                                                    u470 = Humanoid
                                                    u475 = (reverse("thgieHpih")) .. ""
                                                    v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u470 (val), u475 (val)
                                                        return u470[u475] * 1
                                                    end))
                                                    if 0.041 < (v8 and v12 or false or 99) then
                                                        delay_2(0.4, u5059)
                                                        u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                        u5751 = true
                                                    else
                                                        u487 = Humanoid
                                                        u492 = (reverse("rewoPpmuj")) .. ""
                                                        v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u487 (val), u492 (val)
                                                            return u487[u492] * 1
                                                        end))
                                                        if 50.01 < (v8 and v12 or false or 99)
                                                            or u6037.Gravity < 196
                                                            or u5081
                                                            or u5063
                                                            or u5064 then
                                                            delay_2(0.4, u5059)
                                                            u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                            u5751 = true
                                                        end
                                                    end
                                                end
                                            else
                                                delay_2(0.4, u5058)
                                                u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                u5751 = true
                                            end
                                        end
                                    end
                                elseif FindFirstChildOfClass(Lighting, "Part")
                                    or FindFirstChildOfClass(u6037, "Sound")
                                    or v4
                                    or v5:find("blocked function", 1, true) then
                                    delay_2(0.4, u5058)
                                    u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                    u5751 = true
                                else
                                    v11 = u5091
                                    u374 = nil
                                    xpcall(function() -- Line: 87
                                        game:_()
                                    end, function() -- Line: 87 -- upvalues: u374 (ref)
                                        debug.info(2, "f")
                                    end)
                                    v9 = u374
                                    if v11 ~= v9
                                        or v6
                                        or v2:find("expected)", 1, true) == nil
                                        or game.ReplicatedFirst:FindFirstChild("LocalScript") == nil then
                                        delay_2(0.4, u5058)
                                        u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                        u5751 = true
                                    elseif v3 == nil then
                                        if not u5065
                                            or not u5066
                                            or not u5069
                                            or not u5070
                                            or not u5071
                                            or not u5072
                                            or not u5073
                                            or not u5074
                                            or not u5075
                                            or not u5076
                                            or not u5077
                                            or u5080 then
                                            delay_2(0.4, u5058)
                                            u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                            u5751 = true
                                        else
                                            RemoteEvent_2.Name = RemoteEvent.Name
                                            u5084 = false
                                            if delay_2(0.4, u5060) == nil then
                                                delay_2(0.4, u5058)
                                                u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                u5751 = true
                                            elseif not u5083
                                                or u5103(u5561, u6071, 1645, 1765, 1623, u5561, 1714, 1881, 1656) then
                                                u451 = Humanoid
                                                v7, v8 = resume(create(function() -- Line: 143 -- upvalues: u451 (val), u176 (val)
                                                    return u451[u176] * 1
                                                end))
                                                if 20.01 < (v7 and v8 or false or 99) then
                                                    delay_2(0.4, u5059)
                                                    u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                    u5751 = true
                                                else
                                                    u470 = Humanoid
                                                    u475 = (reverse("thgieHpih")) .. ""
                                                    v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u470 (val), u475 (val)
                                                        return u470[u475] * 1
                                                    end))
                                                    if 0.041 < (v8 and v12 or false or 99) then
                                                        delay_2(0.4, u5059)
                                                        u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                        u5751 = true
                                                    else
                                                        u487 = Humanoid
                                                        u492 = (reverse("rewoPpmuj")) .. ""
                                                        v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u487 (val), u492 (val)
                                                            return u487[u492] * 1
                                                        end))
                                                        if 50.01 < (v8 and v12 or false or 99)
                                                            or u6037.Gravity < 196
                                                            or u5081
                                                            or u5063
                                                            or u5064 then
                                                            delay_2(0.4, u5059)
                                                            u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                            u5751 = true
                                                        end
                                                    end
                                                end
                                            else
                                                delay_2(0.4, u5058)
                                                u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                                u5751 = true
                                            end
                                        end
                                    elseif v3.Name ~= "GroundBeam"
                                        or not u5065
                                        or not u5066
                                        or not u5069
                                        or not u5070
                                        or not u5071
                                        or not u5072
                                        or not u5073
                                        or not u5074
                                        or not u5075
                                        or not u5076
                                        or not u5077
                                        or u5080 then
                                        delay_2(0.4, u5058)
                                        u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                        u5751 = true
                                    else
                                        RemoteEvent_2.Name = RemoteEvent.Name
                                        u5084 = false
                                        if delay_2(0.4, u5060) == nil then
                                            delay_2(0.4, u5058)
                                            u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                            u5751 = true
                                        elseif not u5083
                                            or u5103(u5561, u6071, 1645, 1765, 1623, u5561, 1714, 1881, 1656) then
                                            u451 = Humanoid
                                            v7, v8 = resume(create(function() -- Line: 143 -- upvalues: u451 (val), u176 (val)
                                                return u451[u176] * 1
                                            end))
                                            if 20.01 < (v7 and v8 or false or 99) then
                                                delay_2(0.4, u5059)
                                                u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                u5751 = true
                                            else
                                                u470 = Humanoid
                                                u475 = (reverse("thgieHpih")) .. ""
                                                v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u470 (val), u475 (val)
                                                    return u470[u475] * 1
                                                end))
                                                if 0.041 < (v8 and v12 or false or 99) then
                                                    delay_2(0.4, u5059)
                                                    u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                    u5751 = true
                                                else
                                                    u487 = Humanoid
                                                    u492 = (reverse("rewoPpmuj")) .. ""
                                                    v8, v12 = resume(create(function() -- Line: 143 -- upvalues: u487 (val), u492 (val)
                                                        return u487[u492] * 1
                                                    end))
                                                    if 50.01 < (v8 and v12 or false or 99)
                                                        or u6037.Gravity < 196
                                                        or u5081
                                                        or u5063
                                                        or u5064 then
                                                        delay_2(0.4, u5059)
                                                        u5103(u5561, u6071, 1788, 1701, 1689, u5561, 1801, 1752, 1667)
                                                        u5751 = true
                                                    end
                                                end
                                            end
                                        else
                                            delay_2(0.4, u5058)
                                            u5103(u5561, u6071, 1750, 1749, 1661, u5561, 1741, 1753, 1588)
                                            u5751 = true
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        u5084 = false
        u5066 = false
        RemoteEvent_2:fireServer(
            "👁️‍🗨️🈯💱.",
            u5104(u5561, u5751 and u6065 or u6052, 1767, 1676, 1854, u5561, 1689, 1775, 1776),
            nil
        )
        RemoteEvent:fireServer(
            "👁️‍🗨️🈯💱.",
            u5103(u5561, u5751 and u6071 or u6065, 1750, 1750, 1655, u5561, 1761, 1888, 1767),
            nil
        )
        u5103(u5561, u6071, 1650, 1749, 1853, u5561, 1741, 1761, 1856)
        RemoteEvent_2.Name = ""
        u5084 = true
        u5066 = true
    end
end)
RemoteEvent.OnClientEvent:Connect(function(a1, a2, a3) -- Line: 370
    -- upvalues: u6037 (val), u5047 (ref), Humanoid (ref), reverse (val), u5081 (ref), u5082 (ref), u5063 (ref)
    -- upvalues: u5064 (ref), u5048 (ref), u6071 (val), u5044 (val), u5045 (val)
    local v1 = u6037:FindFirstChild("\000")
    if v1 then
        v1()
    end
    if a1 == "👁️‍🗨️🈯💱." then
        if a2 ~= u5047 then
            if 20 < Humanoid[(reverse("deepSklaW")) .. ""] then
                Humanoid[(reverse("deepSklaW")) .. ""] = 20
            end
            Humanoid[(reverse("rewoPpmuJ")) .. ""] = 50
            u5081 = false
            u5082 = false
            u5063 = false
            u5064 = false
            if _G.pweifnnf then
                _G.pweifnnf()
            end
            if not (9 < tick() - u5048) then
                if 1 < tick() - u5048 or not a2 then
                    u5047 = a2
                    u5048 = 0
                end
            elseif a2 then
                tick()
            elseif 1 < tick() - u5048 or not a2 then
                u5047 = a2
                u5048 = 0
            end
        end
        if a3 then
            v1 = u5044(u6071, 1)
            local v2 = #a3
            for i = 1, v2 do
                u5045(v1, i + 1, a3[i])
            end
        end
    end
end)
if LocalPlayer.Character then
    LocalPlayer.Character:WaitForChild("Humanoid")
end
wait(4)
local u5998 = 0
local u5920 = 0
local u5921 = 0
local u5922 = 0
local u5923 = true
RunService:BindToRenderStep(tostring((random())), 0, function(a1) -- Line: 406
    -- upvalues: RunService (val), u5059 (val), u5920 (ref), u5923 (ref), u5921 (ref), RemoteEvent (ref), u5103 (val)
    -- upvalues: u5561 (val), u6071 (val)
    if a1 > 2 and not RunService:IsStudio() then
        u5059()
    end
    u5920 = u5920 + a1
    if not (u5920 > 1) then
        u5921 = u5921 + 1
        return
    end
    if u5923 then
        local v1 = u5921
        if u5920 * 115 < v1 then
            u5923 = false
            RemoteEvent:fireServer("👁️‍🗨️🈯💱.", u5103(u5561, u6071, 1877, 1772, 1638, u5561, 1770, 1649, 1565), nil)
        end
    end
    u5920 = 0
    u5921 = 0
end)
delay(3600, function() -- Line: 422 -- upvalues: u5922 (ref), u5998 (ref), u6052 (val), u6058 (val)
    u5922 = 0
    u5998 = 0
    return u6052, u6058
end)
while wait(20) do
    if not v4 then
        break
    end
    if 196 < u6037.Gravity and u6037.Gravity < 197 then
        Part = Instance.new("Part")
        Part.Name = "GravityTest"
        Part.CanCollide = false
        Part.CanTouch = false
        Part.Transparency = 1
        Part.CFrame = CFrame.new(300, 600, 300)
        Part.Parent = u6037
        v2 = task.wait(2)
        v3 = -Part.AssemblyLinearVelocity.Y / v2
        Part:Destroy()
        if not (v3 > 142) or not (v3 < 151) or not (196 < u6037.Gravity) then
            if UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles") then
                u5998 = u5998 + 1
                if u5998 == 5 and _G.p398dgnb and LocalPlayer:GetAttribute("JoinMouse") then
                    RemoteEvent:fireServer("👁️‍🗨️🈯💱.", "p398dgnb", nil)
                    wait(9)
                    LocalPlayer:Kick("Possible FastFlag detection")
                end
            end
        elseif u6037.Gravity < 197 or UserSettings():IsUserFeatureEnabled("UserShowGuiHideToggles") then
            u5998 = u5998 + 1
            if u5998 == 5 and _G.p398dgnb and LocalPlayer:GetAttribute("JoinMouse") then
                RemoteEvent:fireServer("👁️‍🗨️🈯💱.", "p398dgnb", nil)
                wait(9)
                LocalPlayer:Kick("Possible FastFlag detection")
            end
        end
    end
end
wait(9000000000)
return v4, v4, u6052, u6058, u6065, u6071
