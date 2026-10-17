-- Script Path: game:GetService("ReplicatedFirst")["paul greyrat"].Laplace.anti
-- Took 0.08s to decompile.
-- Executor: Real (2.7.8)

-- Script path: ReplicatedFirst.paul greyrat.Laplace.anti
-- Decompile time: 84.54 ms

local u0 = script
script = nil
game:GetService("RunService")
local u7 = workspace
local wait = task.wait
local u10 = pcall
local u11 = tostring
local find = string.find
local sub = string.sub
local gsub = string.gsub
local lower = string.lower
local info = debug.info
local u19 = u11(info)
local u20 = game
local spawn = task.spawn
local u22 = xpcall
local v1 = error
local u24 = typeof
local floor = math.floor
local ceil = math.ceil
local v2 = setmetatable
local FindService = u20.FindService
local GetService = u20.GetService
local new = Instance.new
local delay = task.delay
local u35 = FindService(u20, "Players")
local v3 = FindService(u20, "ReplicatedStorage")
FindService(u20, "Lighting")
local v4 = GetService(u20, "HttpService")
local v5 = FindService(u20, "ScriptContext")
FindService(u20, "LogService")
local u63 = FindService(u20, "RunService"):IsStudio()
local JSONEncode = v4.JSONEncode
local RequestInternal = v4.RequestInternal
local u69 = u11(RequestInternal)
local Crab_Strangler = v3:WaitForChild("Crab_Strangler", 120)
local u77 = u20.GameId == 2097989947
local PromptPurchase = u20:GetService("MarketplaceService").PromptPurchase
if Crab_Strangler then
    local FireServer = Crab_Strangler.FireServer
    local InvokeServer = new("RemoteFunction").InvokeServer
    local LocalPlayer = u35.LocalPlayer or u35.PlayerAdded:Wait()
    local Kick = LocalPlayer.Kick

    local function crashClient() -- Line: 64 -- upvalues: u77 (val), delay (val), spawn (val)
        if u77 == true then
            return
        end
        delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
            while true do
                spawn(function() -- Line: 76
                    while true do end
                end)
            end
        end)
    end

    local v6 = {}
    local v7 = {
        __len = v1,
        __tostring = function() -- Line: 84 -- upvalues: spawn (val)
            while true do
                spawn(function() -- Line: 84
                    while true do end
                end)
            end
        end,
        __index = v1,
        __newindex = v1,
        __call = v1,
        __namecall = v1,
    }
    local v8 = v2({}, v7)
    for i = 1, 50 do
        v8 = v2(v8, v7)
    end
    v8 = v2(v8, {
        __metatable = false,
        __len = v1,
        __tostring = function() -- Line: 89 -- upvalues: spawn (val)
            while true do
                spawn(function() -- Line: 89
                    while true do end
                end)
            end
        end,
        __index = v1,
        __newindex = v1,
        __call = v1,
        __namecall = v1,
    })
    for j = 1, 50 do
        v6[j] = v8
    end
    local u177 = v2(v6, v8)

    local function RLocked(a1) -- Line: 94 -- upvalues: u10 (val) -- types: a1: userdata
        if not u10(function() -- Line: 95 -- upvalues: a1 (val)
            a1.Archivable = a1.Archivable
            return
        end) then
            return true
        end
        return false
    end

    local function CheckFunc() -- Line: 103 -- upvalues: u7 (val)
        u7[{}] = true
    end

    local u195 = newproxy(true)
    v1 = getmetatable(u195)

    function v1.__index() -- Line: 109 -- upvalues: FireServer (val), Crab_Strangler (val), wait (val)
        FireServer(Crab_Strangler, 1.512)
        return wait(200)
    end

    function v1.__newindex() -- Line: 113 -- upvalues: FireServer (val), Crab_Strangler (val), wait (val)
        FireServer(Crab_Strangler, 2.512)
        return wait(200)
    end

    function v1.__tostring() -- Line: 117 -- upvalues: FireServer (val), Crab_Strangler (val), wait (val)
        FireServer(Crab_Strangler, 3.512)
        return wait(200)
    end

    function v1.__unm() -- Line: 121 -- upvalues: FireServer (val), Crab_Strangler (val), wait (val)
        FireServer(Crab_Strangler, 4.512)
        return wait(200)
    end

    function v1.__add() -- Line: 125 -- upvalues: FireServer (val), Crab_Strangler (val), wait (val)
        FireServer(Crab_Strangler, 5.512)
        return wait(200)
    end

    function v1.__sub() -- Line: 129 -- upvalues: FireServer (val), Crab_Strangler (val), wait (val)
        FireServer(Crab_Strangler, 6.512)
        return wait(200)
    end

    function v1.__mul() -- Line: 133 -- upvalues: FireServer (val), Crab_Strangler (val), wait (val)
        FireServer(Crab_Strangler, 7.512)
        return wait(200)
    end

    function v1.__div() -- Line: 137 -- upvalues: FireServer (val), Crab_Strangler (val), wait (val)
        FireServer(Crab_Strangler, 8.512)
        return wait(200)
    end

    function v1.__mod() -- Line: 141 -- upvalues: FireServer (val), Crab_Strangler (val), wait (val)
        FireServer(Crab_Strangler, 9.512)
        return wait(200)
    end

    function v1.__pow() -- Line: 145 -- upvalues: FireServer (val), Crab_Strangler (val), wait (val)
        FireServer(Crab_Strangler, 10.512)
        return wait(200)
    end

    function v1.__len() -- Line: 149 -- upvalues: FireServer (val), Crab_Strangler (val), wait (val)
        FireServer(Crab_Strangler, 11.512)
        return wait(200)
    end

    v1.__metatable = "The metatable is locked"
    local u228 = {}

    local function CountTable(a1) -- Line: 157
        local v1 = 0
        for i in a1 do
            v1 = v1 + 1
        end
        return v1
    end

    local function compareTables(a1, a2) -- Line: 164
        local v1, v2
        local v3 = 0
        for i in a1 do
            v3 = v3 + 1
        end
        local v4 = 0
        for j in a2 do
            v4 = v4 + 1
        end
        if v3 ~= v4 then
            return false
        end
        for k in a1 do
            v1 = a1[k]
            v2 = a2[k]
            if not rawequal(v1, v2) then
                return false
            end
        end
        return true
    end

    local u231 = {indexInstance = {}, newindexInstance = {}, namecallInstance = {}}

    local function checkStack(a1) -- Line: 180 -- upvalues: u231 (val), info (val)
        local v1 = #u231[a1] <= 0
        local v2 = info(3, "f")
        if v1 then
            u231[a1][3] = v2
            v2 = info(4, "f")
            if v1 then
                u231[a1][4] = v2
                return false
            end
            if u231[a1][4] ~= v2 then
                return true
            end
            return false
        end
        if u231[a1][3] ~= v2 then
            return true
        end
        v2 = info(4, "f")
        if v1 then
            u231[a1][4] = v2
            return false
        end
        if u231[a1][4] ~= v2 then
            return true
        end
        return false
    end

    local function isMethamethodValid(a1) -- Line: 193 -- upvalues: info (val)
        if a1
            and type(a1) == "function"
            and info(a1, "s") == "[C]"
            and info(a1, "l") == -1
            and info(a1, "n") == ""
            and info(a1, "a") == 0 then
            return true
        end
        return false
    end

    local u243 = script
    local find_2 = string.find
    local lower_2 = string.lower
    local u246 = tostring
    local sub_2 = string.sub
    local u292 = v5.Error:Connect(function(a1, a2, a3) -- Line: 212
        -- upvalues: lower (val), sub (val), u10 (val), u243 (val), u246 (val), find_2 (val), lower_2 (val), sub_2 (val)
        -- upvalues: FireServer (val), Crab_Strangler (val), u77 (val), delay (val), spawn (val), u0 (val), find (val)
        local u5 = lower(a1)
        local u11 = sub(a1, 1, 400)
        local u17 = sub(a2, 1, 256)
        if a3 then
            local v1, v2 = u10(function() -- Line: 217
                -- upvalues: u5 (val), a3 (val), u243 (upval), u10 (upval), u246 (upval), find_2 (upval)
                -- upvalues: lower_2 (upval), u11 (ref), sub_2 (upval), u17 (ref), FireServer (upval)
                -- upvalues: Crab_Strangler (upval), u77 (upval), delay (upval), spawn (upval), u0 (upval), find (upval)
                -- upvalues: lower (upval)
                if u5 ~= "not enough memory" and u5 ~= "cannot load the animationclipprovider service." then
                    if a3 and a3 == u243 then
                        return
                    end
                    if a3 then
                        local u6 = a3
                        if not not u10(function() -- Line: 95 -- upvalues: u6 (val)
                                u6.Archivable = u6.Archivable
                                return
                            end)
                            and u246(a3) == "ShiftLockController"
                            and a3.Parent then
                            local Parent = a3.Parent
                            if u246(Parent) == "CameraScript" then
                                return
                            end
                        end
                    end
                    if a3 then
                        local u23 = a3
                        if not not u10(function() -- Line: 95 -- upvalues: u23 (val)
                                u23.Archivable = u23.Archivable
                                return
                            end)
                            and u246(a3) == "CameraScript" then
                            local Parent_2 = a3.Parent
                            if u246(Parent_2) == "PlayerScripts" then
                                return
                            end
                        end
                    end
                    if a3 then
                        local u38 = a3
                        if not not u10(function() -- Line: 95 -- upvalues: u38 (val)
                                u38.Archivable = u38.Archivable
                                return
                            end)
                            and u246(a3) == "ControlScript" then
                            local Parent_3 = a3.Parent
                            if u246(Parent_3) == "PlayerScripts" then
                                return
                            end
                        end
                    end
                    if a3 then
                        local u53 = a3
                        if not not u10(function() -- Line: 95 -- upvalues: u53 (val)
                                u53.Archivable = u53.Archivable
                                return
                            end)
                            and u246(a3) == "ChatMain" then
                            return
                        end
                    end
                    if a3 then
                        local u64 = a3
                        if not not u10(function() -- Line: 95 -- upvalues: u64 (val)
                                u64.Archivable = u64.Archivable
                                return
                            end)
                            and u246(a3) == "ChatScript" then
                            return
                        end
                    end
                    if find_2(lower_2(u11), "current parent")
                        and find_2(lower_2(u11), "is locked")
                        and find_2(lower_2(u11), "new parent") then
                        return
                    end
                    if find_2(lower_2(u11), "curl error") and find_2(lower_2(u11), "timeout") then
                        return
                    end
                    if find_2(lower_2(u11), "coregui") and find_2(lower_2(u11), "robloxgui") then
                        return
                    end
                    local v1 = find_2
                    if not v1(lower_2(u11), "not enough memory") then
                        v1 = find_2
                        if not v1(lower_2(u11), "marketplaceservice") then
                            v1 = find_2
                            if not v1(lower_2(u11), "roact") then
                                v1 = find_2
                                if not v1(lower_2(u11), "corepackages") then
                                    if script == nil then
                                        return
                                    end
                                    sub_2(u11, 1, 100)
                                    v1 = sub_2(u17, 1, 32)
                                    if find_2(lower_2(v1), "current parent")
                                        and find_2(lower_2(v1), "is locked")
                                        and find_2(lower_2(v1), "new parent") then
                                        return
                                    end
                                    if find_2(lower_2(v1), "curl error") and find_2(lower_2(v1), "timeout") then
                                        return
                                    end
                                    if find_2(lower_2(v1), "coregui") and find_2(lower_2(v1), "robloxgui") then
                                        return
                                    end
                                    if not find_2(lower_2(v1), "not enough memory")
                                        and not find_2(lower_2(v1), "marketplaceservice")
                                        and not find_2(lower_2(v1), "roact")
                                        and not find_2(lower_2(v1), "corepackages") then
                                        local u220 = a3
                                        if not u10(function() -- Line: 95 -- upvalues: u220 (val)
                                            u220.Archivable = u220.Archivable
                                            return
                                        end) then
                                            FireServer(Crab_Strangler, 1318, u11 .. " | " .. u17 .. " | " .. a3.Name)
                                            if u77 == true then
                                                return
                                            end
                                            delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                while true do
                                                    spawn(function() -- Line: 76
                                                        while true do end
                                                    end)
                                                end
                                            end)
                                            return
                                        end
                                        if not a3.Parent then
                                            if a3.Name ~= "Animate" and a3 ~= u0 then
                                                FireServer(Crab_Strangler, 1319, u11 .. " | " .. u17 .. " | " .. a3.Name)
                                                if u77 == true then
                                                    return
                                                end
                                                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                    while true do
                                                        spawn(function() -- Line: 76
                                                            while true do end
                                                        end)
                                                    end
                                                end)
                                                return
                                            end
                                            return
                                        end
                                        if not find(u5, "no output from")
                                            and not find(lower(u17), "no output from")
                                            and not find(lower(u17), "thread 0")
                                            and not find(u5, "thread 0") then
                                            return
                                        end
                                        if a3 == u0 then
                                            return
                                        end
                                        FireServer(Crab_Strangler, 692, u11 .. " | " .. u17 .. " | " .. a3.Name)
                                        if u77 == true then
                                            return
                                        end
                                        delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                            while true do
                                                spawn(function() -- Line: 76
                                                    while true do end
                                                end)
                                            end
                                        end)
                                        return
                                    end
                                    return
                                end
                            end
                        end
                    end
                    return
                end
            end)
            if not v1 then
                FireServer(Crab_Strangler, 915106, "Failed Error Grab: " .. u11 .. " | " .. u17 .. " | " .. v2)
                if u77 ~= true then
                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                        while true do
                            spawn(function() -- Line: 76
                                while true do end
                            end)
                        end
                    end)
                end
            end
            return
        end
        if find(u5, "curl error") and find(u5, "timeout") then
            return
        end
        if not find(lower(u17), "corepackages")
            and sub(u5, 1, 58) ~= "coregui.robloxgui.modules.ingamechat.bubblechat.components"
            and u5 ~= "the parent property of micbutton is locked, current parent: null, new parent selfview"
            and sub(u5, 1, 55) ~= "players:createhumanoidmodelfromuserid() failed because "
            and sub(u5, 1, 34) ~= "coregui.robloxgui.modules.settings"
            and sub(u5, 1, 57) ~= "coregui.robloxgui.modules.selfieview.components.faceclone"
            and sub(u5, 1, 48) ~= "coregui.robloxgui.corescripts/facechatselfieview"
            and not find(u5, "memory")
            and not find(u17, "memory") then
            FireServer(Crab_Strangler, 691, u11 .. " | " .. u17)
            if u77 ~= true then
                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                    while true do
                        spawn(function() -- Line: 76
                            while true do end
                        end)
                    end
                end)
            end
            return
        end
    end)

    local function CharAdded(a1) -- Line: 304
        -- upvalues: u10 (val), FireServer (val), Crab_Strangler (val), u77 (val), delay (val), spawn (val), u11 (val)
        -- upvalues: u7 (val), wait (val)
        local Humanoid = a1:WaitForChild("Humanoid", 60)
        local HumanoidRootPart = a1:WaitForChild("HumanoidRootPart", 60)
        if Humanoid and not (Humanoid.Health <= 0) and HumanoidRootPart then
            local Gravity
            Humanoid.Changed:Connect(function(a1) -- Line: 310
                -- upvalues: Humanoid (val), u10 (upval), FireServer (upval), Crab_Strangler (upval), u77 (upval)
                -- upvalues: delay (upval), spawn (upval), HumanoidRootPart (val), u11 (upval)
                local u1 = Humanoid
                if not u10(function() -- Line: 95 -- upvalues: u1 (val)
                    u1.Archivable = u1.Archivable
                end) then
                    FireServer(Crab_Strangler, 5161)
                    if u77 == true then
                        return
                    end
                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                        while true do
                            spawn(function() -- Line: 76
                                while true do end
                            end)
                        end
                    end)
                    return
                end
                if HumanoidRootPart.Anchored == true or not (30 < Humanoid.HipHeight) then
                    return
                end
                local v1 = FireServer
                local v2 = Crab_Strangler
                local HipHeight = Humanoid.HipHeight
                v1(v2, 14015, (u11(HipHeight)))
                if u77 == true then
                    return
                end
                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                    while true do
                        spawn(function() -- Line: 76
                            while true do end
                        end)
                    end
                end)
            end)
            while true do
                if not a1:IsDescendantOf(u7) or not (0 < Humanoid.Health) then
                    break
                end
                Gravity = u7.Gravity
                if not (Gravity < 80) and not (Gravity > 200) then
                    wait(0.35)
                    continue
                end
                FireServer(Crab_Strangler, 10620, (u11(Gravity)))
                if u77 == true then
                    return
                end
                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                    while true do
                        spawn(function() -- Line: 76
                            while true do end
                        end)
                    end
                end)
                return
            end
            return
        end
    end

    spawn(function() -- Line: 336
        -- upvalues: u20 (val), u63 (val), u35 (val), FireServer (val), Crab_Strangler (val), u11 (val), u77 (val)
        -- upvalues: delay (val), spawn (val), u292 (val), FindService (val), u10 (val), Kick (val), u7 (val)
        -- upvalues: u177 (ref), InvokeServer (val), CheckFunc (val), sub (val), info (val), u19 (val), u22 (val)
        -- upvalues: u24 (val), checkStack (val), isMethamethodValid (val), u195 (val), u228 (val), compareTables (val)
        -- upvalues: RequestInternal (val), u69 (val), wait (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23
        if not u20:IsLoaded() then
            u20.Loaded:Wait()
        end
        if not u63 then
            (u35:GetPropertyChangedSignal("Name")):Connect(function() -- Line: 341
                -- upvalues: FireServer (upval), Crab_Strangler (upval), u35 (upval), u11 (upval), u77 (upval)
                -- upvalues: delay (upval), spawn (upval)
                local v1 = FireServer
                local v2 = Crab_Strangler
                local Name = u35.Name
                local Device = _G.Device
                v1(v2, 952, Name .. "|" .. u11(Device))
                if u77 == true then
                    return
                end
                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                    while true do
                        spawn(function() -- Line: 76
                            while true do end
                        end)
                    end
                end)
            end)
        end
        local u321 = nil
        while u292 do
            if not u292.Connected then
                break
            end
            if FindService(u20, "ServerStorage") and not u63 then
                FireServer(Crab_Strangler, 306)
                if u77 ~= true then
                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                        while true do
                            spawn(function() -- Line: 76
                                while true do end
                            end)
                        end
                    end)
                end
                return
            end
            if not FindService(u20, "VirtualUser") and not FindService(u20, "VirtualInputManager") then
                v1, v9 = u10(Kick, u7)
                if not v1 and v9 and v9 == "Expected ':' not '.' calling member function Kick" then
                    v17, v19 = u10(FireServer, u7, u177)
                    if not v17 and v19 and v19 == "Expected ':' not '.' calling member function FireServer" then
                        v20, v21 = u10(InvokeServer, u7, u177)
                        if not v20 and v21 and v21 == "Expected ':' not '.' calling member function InvokeServer" then
                            v22, v23 = u10(CheckFunc)
                            if not v22
                                and v23
                                and sub(v23, -49) == " invalid argument #2 (string expected, got table)" then
                                v23 = u11(info)
                                if u19 ~= v23 then
                                    FireServer(Crab_Strangler, 0.5, u19 .. "->" .. v23)
                                    if u77 ~= true then
                                        delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                            while true do
                                                spawn(function() -- Line: 76
                                                    while true do end
                                                end)
                                            end
                                        end)
                                    end
                                    return
                                end
                                u22(function() -- Line: 415 -- upvalues: u20 (upval)
                                    return u20:_TheBigDetectionMethod()
                                end, function() -- Line: 417
                                    -- upvalues: info (upval), u321 (ref), u24 (upval), FireServer (upval)
                                    -- upvalues: Crab_Strangler (upval), u77 (upval), delay (upval), spawn (upval)
                                    local v1 = info(2, "f")
                                    if not u321 then
                                        u321 = v1
                                    end
                                    if v1 and u24(v1) == "function" then
                                        if v1 == u321 then
                                            return
                                        end
                                        FireServer(Crab_Strangler, 24)
                                        if u77 == true then
                                            return
                                        end
                                        delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                            while true do
                                                spawn(function() -- Line: 76
                                                    while true do end
                                                end)
                                            end
                                        end)
                                        return
                                    end
                                    FireServer(Crab_Strangler, 23)
                                    if u77 == true then
                                        return
                                    end
                                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                        while true do
                                            spawn(function() -- Line: 76
                                                while true do end
                                            end)
                                        end
                                    end)
                                end)
                                local u107 = nil
                                local u108 = nil
                                v2, v3 = u22(function() -- Line: 451 -- upvalues: u20 (upval)
                                    local ____________ = u20.____________
                                end, function() -- Line: 453 -- upvalues: u108 (ref), info (upval), u107 (ref), checkStack (upval)
                                    info(2, "f")
                                    if u107 or checkStack("indexInstance") then
                                        u107 = true
                                    end
                                end)
                                if not isMethamethodValid(u108) then
                                    FireServer(Crab_Strangler, 1501)
                                    if u77 ~= true then
                                        delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                            while true do
                                                spawn(function() -- Line: 76
                                                    while true do end
                                                end)
                                            end
                                        end)
                                    end
                                    return
                                end
                                v4, v5 = u10(u108, u20)
                                v6, v7 = u10(u108)
                                u10(u108, u195, "GetChildren")
                                u10(u108, u195)
                                u10(u108, u20, u195)
                                if not u107 and not v2 and not v6 and not v4 then
                                    if not u228.indexInstance then
                                        u228.indexInstance = {v3, v7, v5}
                                    end
                                    if not compareTables(u228.indexInstance, {v3, v7, v5}) then
                                        FireServer(Crab_Strangler, 1503)
                                        if u77 ~= true then
                                            delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                while true do
                                                    spawn(function() -- Line: 76
                                                        while true do end
                                                    end)
                                                end
                                            end)
                                        end
                                        return
                                    end
                                    local u176 = nil
                                    local u177_2 = nil
                                    v8, v10 = u22(function() -- Line: 489 -- upvalues: u20 (upval)
                                        u20.____________ = 5
                                    end, function() -- Line: 491 -- upvalues: u177_2 (ref), info (upval), u176 (ref), checkStack (upval)
                                        info(2, "f")
                                        if u176 or checkStack("newindexInstance") then
                                            u176 = true
                                        end
                                    end)
                                    if not isMethamethodValid(u177_2) then
                                        FireServer(Crab_Strangler, 601961)
                                        if u77 ~= true then
                                            delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                while true do
                                                    spawn(function() -- Line: 76
                                                        while true do end
                                                    end)
                                                end
                                            end)
                                        end
                                        return
                                    end
                                    v11, v12 = u10(u177_2, u20)
                                    v13, v14 = u10(u177_2)
                                    u10(u177_2, u195, "GetChildren")
                                    u10(u177_2, u195)
                                    u10(u177_2, u20, u195)
                                    u10(u177_2, u20, "AllowThirdPartySales", u195)
                                    if not u176 and not v8 and not v13 and not v11 then
                                        if not u228.newindexInstance then
                                            u228.newindexInstance = {v10, v14, v12}
                                        end
                                        if not compareTables(u228.newindexInstance, {v10, v14, v12}) then
                                            FireServer(Crab_Strangler, 153582)
                                            if u77 ~= true then
                                                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                    while true do
                                                        spawn(function() -- Line: 76
                                                            while true do end
                                                        end)
                                                    end
                                                end)
                                            end
                                            return
                                        end
                                        local u251 = nil
                                        local u252 = nil
                                        v15 = u22(function() -- Line: 529 -- upvalues: u20 (upval)
                                            u20:____________()
                                        end, function() -- Line: 531 -- upvalues: u252 (ref), info (upval), u251 (ref), checkStack (upval)
                                            info(2, "f")
                                            if u251 or checkStack("namecallInstance") then
                                                u251 = true
                                            end
                                        end)
                                        if not isMethamethodValid(u252) then
                                            FireServer(Crab_Strangler, 12515)
                                            if u77 ~= true then
                                                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                    while true do
                                                        spawn(function() -- Line: 76
                                                            while true do end
                                                        end)
                                                    end
                                                end)
                                            end
                                            return
                                        end
                                        v16 = u10(u252, u20)
                                        v18 = u10(u252)
                                        u10(u252, u195)
                                        u10(u252, u20, u195)
                                        if not u251 and not v15 and not v18 and not v16 then
                                            if (u11(RequestInternal)) ~= u69 then
                                                FireServer(Crab_Strangler, 9532)
                                                if u77 ~= true then
                                                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                        while true do
                                                            spawn(function() -- Line: 76
                                                                while true do end
                                                            end)
                                                        end
                                                    end)
                                                end
                                                return
                                            end
                                            if u20:FindService("UGCValidationService") and u63 == false then
                                                FireServer(Crab_Strangler, -999)
                                                if u77 ~= true then
                                                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                        while true do
                                                            spawn(function() -- Line: 76
                                                                while true do end
                                                            end)
                                                        end
                                                    end)
                                                end
                                                return
                                            end
                                            wait(0.45)
                                            continue
                                        end
                                        FireServer(Crab_Strangler, 159125)
                                        if u77 ~= true then
                                            delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                while true do
                                                    spawn(function() -- Line: 76
                                                        while true do end
                                                    end)
                                                end
                                            end)
                                        end
                                        return
                                    end
                                    FireServer(Crab_Strangler, 151206)
                                    if u77 ~= true then
                                        delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                            while true do
                                                spawn(function() -- Line: 76
                                                    while true do end
                                                end)
                                            end
                                        end)
                                    end
                                    return
                                end
                                FireServer(Crab_Strangler, 1502)
                                if u77 ~= true then
                                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                        while true do
                                            spawn(function() -- Line: 76
                                                while true do end
                                            end)
                                        end
                                    end)
                                end
                                return
                            end
                            FireServer(Crab_Strangler, 2.5)
                            if u77 ~= true then
                                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                    while true do
                                        spawn(function() -- Line: 76
                                            while true do end
                                        end)
                                    end
                                end)
                            end
                            return
                        end
                        FireServer(Crab_Strangler, 798)
                        if u77 ~= true then
                            delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                while true do
                                    spawn(function() -- Line: 76
                                        while true do end
                                    end)
                                end
                            end)
                        end
                        return
                    end
                    FireServer(Crab_Strangler, 664)
                    if u77 ~= true then
                        delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                            while true do
                                spawn(function() -- Line: 76
                                    while true do end
                                end)
                            end
                        end)
                    end
                    return
                end
                FireServer(Crab_Strangler, 512)
                if u77 ~= true then
                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                        while true do
                            spawn(function() -- Line: 76
                                while true do end
                            end)
                        end
                    end)
                end
                return
            end
            if not u63 and _G.isCustomHUB == true then
                FireServer(Crab_Strangler, 420)
                if u77 ~= true then
                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                        while true do
                            spawn(function() -- Line: 76
                                while true do end
                            end)
                        end
                    end)
                end
                return
            end
            v1, v9 = u10(Kick, u7)
            if not v1 and v9 and v9 == "Expected ':' not '.' calling member function Kick" then
                v17, v19 = u10(FireServer, u7, u177)
                if not v17 and v19 and v19 == "Expected ':' not '.' calling member function FireServer" then
                    v20, v21 = u10(InvokeServer, u7, u177)
                    if not v20 and v21 and v21 == "Expected ':' not '.' calling member function InvokeServer" then
                        v22, v23 = u10(CheckFunc)
                        if not v22
                            and v23
                            and sub(v23, -49) == " invalid argument #2 (string expected, got table)" then
                            v23 = u11(info)
                            if u19 ~= v23 then
                                FireServer(Crab_Strangler, 0.5, u19 .. "->" .. v23)
                                if u77 ~= true then
                                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                        while true do
                                            spawn(function() -- Line: 76
                                                while true do end
                                            end)
                                        end
                                    end)
                                end
                                return
                            end
                            u22(function() -- Line: 415 -- upvalues: u20 (upval)
                                return u20:_TheBigDetectionMethod()
                            end, function() -- Line: 417
                                -- upvalues: info (upval), u321 (ref), u24 (upval), FireServer (upval)
                                -- upvalues: Crab_Strangler (upval), u77 (upval), delay (upval), spawn (upval)
                                local v1 = info(2, "f")
                                if not u321 then
                                    u321 = v1
                                end
                                if v1 and u24(v1) == "function" then
                                    if v1 == u321 then
                                        return
                                    end
                                    FireServer(Crab_Strangler, 24)
                                    if u77 == true then
                                        return
                                    end
                                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                        while true do
                                            spawn(function() -- Line: 76
                                                while true do end
                                            end)
                                        end
                                    end)
                                    return
                                end
                                FireServer(Crab_Strangler, 23)
                                if u77 == true then
                                    return
                                end
                                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                    while true do
                                        spawn(function() -- Line: 76
                                            while true do end
                                        end)
                                    end
                                end)
                            end)
                            local u107 = nil
                            local u108 = nil
                            v2, v3 = u22(function() -- Line: 451 -- upvalues: u20 (upval)
                                local ____________ = u20.____________
                            end, function() -- Line: 453 -- upvalues: u108 (ref), info (upval), u107 (ref), checkStack (upval)
                                info(2, "f")
                                if u107 or checkStack("indexInstance") then
                                    u107 = true
                                end
                            end)
                            if not isMethamethodValid(u108) then
                                FireServer(Crab_Strangler, 1501)
                                if u77 ~= true then
                                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                        while true do
                                            spawn(function() -- Line: 76
                                                while true do end
                                            end)
                                        end
                                    end)
                                end
                                return
                            end
                            v4, v5 = u10(u108, u20)
                            v6, v7 = u10(u108)
                            u10(u108, u195, "GetChildren")
                            u10(u108, u195)
                            u10(u108, u20, u195)
                            if not u107 and not v2 and not v6 and not v4 then
                                if not u228.indexInstance then
                                    u228.indexInstance = {v3, v7, v5}
                                end
                                if not compareTables(u228.indexInstance, {v3, v7, v5}) then
                                    FireServer(Crab_Strangler, 1503)
                                    if u77 ~= true then
                                        delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                            while true do
                                                spawn(function() -- Line: 76
                                                    while true do end
                                                end)
                                            end
                                        end)
                                    end
                                    return
                                end
                                local u176 = nil
                                local u177_2 = nil
                                v8, v10 = u22(function() -- Line: 489 -- upvalues: u20 (upval)
                                    u20.____________ = 5
                                end, function() -- Line: 491 -- upvalues: u177_2 (ref), info (upval), u176 (ref), checkStack (upval)
                                    info(2, "f")
                                    if u176 or checkStack("newindexInstance") then
                                        u176 = true
                                    end
                                end)
                                if not isMethamethodValid(u177_2) then
                                    FireServer(Crab_Strangler, 601961)
                                    if u77 ~= true then
                                        delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                            while true do
                                                spawn(function() -- Line: 76
                                                    while true do end
                                                end)
                                            end
                                        end)
                                    end
                                    return
                                end
                                v11, v12 = u10(u177_2, u20)
                                v13, v14 = u10(u177_2)
                                u10(u177_2, u195, "GetChildren")
                                u10(u177_2, u195)
                                u10(u177_2, u20, u195)
                                u10(u177_2, u20, "AllowThirdPartySales", u195)
                                if not u176 and not v8 and not v13 and not v11 then
                                    if not u228.newindexInstance then
                                        u228.newindexInstance = {v10, v14, v12}
                                    end
                                    if not compareTables(u228.newindexInstance, {v10, v14, v12}) then
                                        FireServer(Crab_Strangler, 153582)
                                        if u77 ~= true then
                                            delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                while true do
                                                    spawn(function() -- Line: 76
                                                        while true do end
                                                    end)
                                                end
                                            end)
                                        end
                                        return
                                    end
                                    local u251 = nil
                                    local u252 = nil
                                    v15 = u22(function() -- Line: 529 -- upvalues: u20 (upval)
                                        u20:____________()
                                    end, function() -- Line: 531 -- upvalues: u252 (ref), info (upval), u251 (ref), checkStack (upval)
                                        info(2, "f")
                                        if u251 or checkStack("namecallInstance") then
                                            u251 = true
                                        end
                                    end)
                                    if not isMethamethodValid(u252) then
                                        FireServer(Crab_Strangler, 12515)
                                        if u77 ~= true then
                                            delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                while true do
                                                    spawn(function() -- Line: 76
                                                        while true do end
                                                    end)
                                                end
                                            end)
                                        end
                                        return
                                    end
                                    v16 = u10(u252, u20)
                                    v18 = u10(u252)
                                    u10(u252, u195)
                                    u10(u252, u20, u195)
                                    if not u251 and not v15 and not v18 and not v16 then
                                        if (u11(RequestInternal)) ~= u69 then
                                            FireServer(Crab_Strangler, 9532)
                                            if u77 ~= true then
                                                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                    while true do
                                                        spawn(function() -- Line: 76
                                                            while true do end
                                                        end)
                                                    end
                                                end)
                                            end
                                            return
                                        end
                                        if u20:FindService("UGCValidationService") and u63 == false then
                                            FireServer(Crab_Strangler, -999)
                                            if u77 ~= true then
                                                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                                    while true do
                                                        spawn(function() -- Line: 76
                                                            while true do end
                                                        end)
                                                    end
                                                end)
                                            end
                                            return
                                        end
                                        wait(0.45)
                                        continue
                                    end
                                    FireServer(Crab_Strangler, 159125)
                                    if u77 ~= true then
                                        delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                            while true do
                                                spawn(function() -- Line: 76
                                                    while true do end
                                                end)
                                            end
                                        end)
                                    end
                                    return
                                end
                                FireServer(Crab_Strangler, 151206)
                                if u77 ~= true then
                                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                        while true do
                                            spawn(function() -- Line: 76
                                                while true do end
                                            end)
                                        end
                                    end)
                                end
                                return
                            end
                            FireServer(Crab_Strangler, 1502)
                            if u77 ~= true then
                                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                    while true do
                                        spawn(function() -- Line: 76
                                            while true do end
                                        end)
                                    end
                                end)
                            end
                            return
                        end
                        FireServer(Crab_Strangler, 2.5)
                        if u77 ~= true then
                            delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                                while true do
                                    spawn(function() -- Line: 76
                                        while true do end
                                    end)
                                end
                            end)
                        end
                        return
                    end
                    FireServer(Crab_Strangler, 798)
                    if u77 ~= true then
                        delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                            while true do
                                spawn(function() -- Line: 76
                                    while true do end
                                end)
                            end
                        end)
                    end
                    return
                end
                FireServer(Crab_Strangler, 664)
                if u77 ~= true then
                    delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                        while true do
                            spawn(function() -- Line: 76
                                while true do end
                            end)
                        end
                    end)
                end
                return
            end
            FireServer(Crab_Strangler, 512)
            if u77 ~= true then
                delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                    while true do
                        spawn(function() -- Line: 76
                            while true do end
                        end)
                    end
                end)
            end
            return
        end
        FireServer(Crab_Strangler, 64386)
        if u77 ~= true then
            delay(12, function() -- Line: 74 -- upvalues: spawn (upval)
                while true do
                    spawn(function() -- Line: 76
                        while true do end
                    end)
                end
            end)
        end
    end)
    LocalPlayer.CharacterAdded:Connect(CharAdded)
    local Character = LocalPlayer.Character
    if Character then
        spawn(CharAdded, Character)
    end
    return nil
else
    while true do
        delay(12, function() -- Line: 48 -- upvalues: spawn (val)
            while true do
                spawn(function() -- Line: 50
                    while true do end
                end)
            end
        end)
    end
end
