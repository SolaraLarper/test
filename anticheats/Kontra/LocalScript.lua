
local t = {}
local t_1 = { { "GameClient" }, { "ClientModules" }, { "Shared" } }
local t_2 = {
    WeaponConstructor = {
        "GetSpread",
        "GetInaccuracy",
        "Recoil",
        "UpdateAccuracyPenalty",
        "CalculateNextAttackTime"
    },
    Camera = {
        "KickBack",
        "UpdatePunchAngles",
        "DecayAimPunchAngle",
        "DecayViewPunchAngle",
        "BuildShotCFrame"
    },
    Movement = {
        "ClampVelocity",
        "WalkMove",
        "AirMove",
        "CheckJumpButton",
        "FinishGravity",
        "Duck"
    },
    CharacterReconciliation = { "HandleNewState" },
    TattleSeal = { "Seed", "Seal" }
}
local t_3 = { GetInaccuracy = true, Recoil = true }
local t_4 = {
    "__index",
    "__newindex",
    "__call",
    "__add",
    "__sub",
    "__mul",
    "__div",
    "__unm",
    "__len",
    "__eq",
    "__lt",
    "__le"
}
local t_5 = {
    "hookfunction",
    "hookmetamethod",
    "getrawmetatable",
    "getnamecallmethod",
    "newcclosure",
    "checkcaller",
    "getgenv",
    "getrenv",
    "getgc",
    "setreadonly",
    "isreadonly",
    "islclosure",
    "iscclosure",
    "clonefunction",
    "restorefunction",
    "replaceclosure",
    "getconstants",
    "getthreads",
    "getreg",
    "getinstances",
    "getnilinstances",
    "getscripts",
    "getrunningscripts",
    "getloadedmodules",
    "filtergc",
    "saveinstance",
    "readfile",
    "writefile",
    "loadfile",
    "listfiles",
    "makefolder",
    "delfile",
    "cloneref",
    "setrawmetatable",
    "makewriteable",
    "getidentity",
    "setidentity",
    "identifyexecutor",
    "getexecutorname",
    "getconnections",
    "firetouchinterest",
    "gethui",
    "getsenv",
    "getcallingscript",
    "getscriptclosure",
    "getscripthash",
    "getcustomasset",
    "getcallbackvalue",
    "gethiddenproperty",
    "sethiddenproperty",
    "setsimulationradius",
    "firesignal",
    "fireclickdetector",
    "fireproximityprompt",
    "setclipboard",
    "request",
    "http_request",
    "syn",
    "fluxus",
    "Drawing",
    "crypt",
    "WebSocket",
    "mousemoverel",
    "mouse1click",
    "iswindowactive",
    "isrbxactive",
    "setfpscap",
    "queue_on_teleport",
    "getupvalues",
    "setupvalue",
    "getprotos",
    "getstack",
    "setstack",
    "run_on_actor",
    "getactors",
    "getactorstates",
    "getluastate",
    "getgamestate",
    "get_current_actor",
    "create_comm_channel",
    "get_comm_channel",
    "on_actor_state_created",
    "isparallel",
    "getfunctionhash",
    "hookproto",
    "isexecutorclosure",
    "isfunctionhooked",
    "isnewcclosure",
    "isprotohooked",
    "newlclosure",
    "restoreproto",
    "setstackhidden",
    "trampoline_call",
    "decompile",
    "getscriptbytecode",
    "getfunctionbytecode",
    "getscriptthread",
    "getscriptfromthread",
    "getmodules",
    "isexecutorthread",
    "dumpstring",
    "getallthreads",
    "gettenv",
    "iswritable",
    "makereadonly",
    "makewritable",
    "setnamecallmethod",
    "gethiddenproperties",
    "getproperties",
    "getthreadidentity",
    "isnetworkowner",
    "isscriptable",
    "setscriptable",
    "setthreadidentity"
}
local t_6 = {
    dex = true,
    darkdex = true,
    infiniteyield = true,
    simplespy = true,
    remotespy = true,
    turtlespy = true,
    hydroxide = true,
    saveinstance = true,
    rayfield = true,
    orion = true,
    cmdx = true,
    fatesadmin = true,
    reviz = true,
    owlhub = true,
    octospy = true,
    synapsex = true
}
local t_7 = {
    string,
    table,
    math,
    bit32,
    buffer,
    coroutine,
    utf8,
    os,
    debug,
    task,
    CFrame,
    Vector3,
    Vector2,
    Instance,
    Ray,
    Color3,
    UDim2
}
local t_9 = {
    { game, "GetService" },
    { game, "FindFirstChild" },
    { game, "WaitForChild" },
    { game, "IsA" },
    { game, "GetChildren" },
    { workspace, "Raycast" },
    { workspace, "GetPartBoundsInBox" }
}
local t_10 = {
    "__index",
    "__newindex",
    "__call",
    "__concat",
    "__unm",
    "__add",
    "__sub",
    "__mul",
    "__div",
    "__idiv",
    "__mod",
    "__pow",
    "__tostring",
    "__eq",
    "__lt",
    "__le",
    "__len",
    "__iter"
}
local debug_info = debug.info
local v1 = rawequal
local g_rawget = rawget
local g_pcall = pcall
local g_type = type
local g_next = next
local g_error = error
local g_tostring = tostring
local g_getfenv = getfenv
local v2 = setmetatable
local v3 = getmetatable
local v4 = gcinfo
local v5 = collectgarbage
local v6 = bit32
local v7 = table
local v8 = buffer
local v9 = string
local v10 = math
local Network = nil
local WeaponController = nil
local WeaponManager = nil
local GameConfiguration = nil
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TemplateOverrides_m = require(ReplicatedStorage.Shared.TemplateOverrides)
local TattleSeal_m = require(ReplicatedStorage.Shared.TattleSeal)
local t_11 = {}
local t_12 = {}
local t_13 = {}
local t_14 = {}
local t_15 = {
    function() -- line: 260
        return game:____()
    end,
    function() -- line: 261
        return game.____
    end,
    function() -- line: 262
        game.____ = nil
    end
}
local g_xpcall = xpcall
local g_select = select

local function MetamethodOf(arg1) -- line: 269
    -- upvalues:
    --  [1] g_select (copy)
    --  [2] g_xpcall (copy)
    --  [3] debug_info (copy)

    return g_select(2, g_xpcall(arg1, function() -- line: 270
        -- upvalues:
        --  [1] debug_info (ref)

        return debug_info(2, "f")
    end))
end

for _, val in t_7 do
    if g_type(val) == "table" and v7.isfrozen(val) then
        local t_16 = {}
        local v16 = 0

        for key_1, val_1 in g_next, val do
            t_16[key_1] = val_1
            v16 += 1
        end

        v7.insert(t_11, { Library = val, Fields = t_16, Count = v16 })
    end
end

local v18 = g_getfenv(0)

for _, val_2 in {
    "pcall",
    "xpcall",
    "rawequal",
    "rawget",
    "rawset",
    "type",
    "typeof",
    "getmetatable",
    "setmetatable",
    "require",
    "tostring",
    "tonumber",
    "select",
    "next",
    "pairs",
    "ipairs",
    "error",
    "getfenv",
    "setfenv",
    "gcinfo",
    "collectgarbage",
    "newproxy",
    "loadstring",
    "unpack",
    "print",
    "warn",
    "tick",
    "time",
    "wait",
    "spawn",
    "delay"
} do
    t_12[val_2] = v18[val_2]
end

for key_3, val_3 in t_9 do
    t_13[key_3] = val_3[1][val_3[2]]
end

for key_4, val_4 in t_15 do
    local v20 = MetamethodOf(val_4)
    t_14[key_4] = v20
end

local v21 = debug_info(1, "s")
local v22 = false
local v23 = v2({}, { __mode = "k" })
local v24 = 0
local v25 = 0
local t_17 = {}
local v26 = 0
local FireServer = nil
local Kick = nil
g_pcall(function() -- line: 322
    -- upvalues:
    --  [1] FireServer (ref)
    --  [2] Kick (ref)

    local RemoteEvent = Instance.new("RemoteEvent")
    FireServer = RemoteEvent.FireServer
    RemoteEvent:Destroy()
    Kick = game:GetService("Players").LocalPlayer.Kick
end)

local function Trap(arg2) -- line: 334
    -- upvalues:
    --  [1] t_10 (copy)
    --  [2] v24 (ref)
    --  [3] v6 (copy)
    --  [4] g_next (copy)
    --  [5] v2 (copy)

    local t_18 = { __metatable = "The metatable is locked" }

    for _, val_5 in t_10 do
        t_18[val_5] = function() -- line: 338
            -- upvalues:
            --  [1] v24 (ref)
            --  [2] arg2 (copy)
            --  [3] v6 (ref)

            v24 = v6.bor(v24, arg2)
        end
    end

    function t_18.__iter() -- line: 345
        -- upvalues:
        --  [1] v24 (ref)
        --  [2] arg2 (copy)
        --  [3] v6 (ref)
        --  [4] g_next (ref)

        v24 = v6.bor(v24, arg2)

        return g_next, {}
    end

    function t_18.__tostring() -- line: 350
        -- upvalues:
        --  [1] v24 (ref)
        --  [2] arg2 (copy)
        --  [3] v6 (ref)

        v24 = v6.bor(v24, arg2)

        return "table"
    end

    return (v2({}, t_18))
end

local v29 = Trap(32)
local v30 = Trap(1024)
local RemoteEvent_1 = Instance.new("RemoteEvent")
local t_19 = {}
t_19[1] = t_19
local t_20 = {
    function() -- line: 375
        -- upvalues:
        --  [1] v30 (copy)

        return workspace:Raycast(Vector3.zero, v30)
    end,
    function() -- line: 376
        -- upvalues:
        --  [1] v30 (copy)

        return workspace:Spherecast(v30, 1, v30)
    end,
    function() -- line: 377
        -- upvalues:
        --  [1] v30 (copy)

        return workspace:Blockcast(v30, v30, v30)
    end,
    function() -- line: 378
        -- upvalues:
        --  [1] v30 (copy)

        return workspace:FindPartOnRay(v30)
    end,
    function() -- line: 379
        -- upvalues:
        --  [1] v30 (copy)

        return workspace:FireServer(v30)
    end,
    function() -- line: 380
        -- upvalues:
        --  [1] v30 (copy)

        return workspace:Kick(v30)
    end
}
local v31 = v2({}, { __mode = "v" })
local v32 = nil
local v33 = nil
local v34 = nil
local v35 = 0.016666666666666666
local v36 = false

local function ProbeDepth(arg3) -- line: 410
    -- upvalues:
    --  [1] g_error (copy)
    --  [2] t_4 (copy)
    --  [3] v2 (copy)
    --  [4] g_pcall (copy)

    local v37 = 0
    local t_21 = {}

    local function Recurse() -- line: 414
        -- upvalues:
        --  [1] v37 (ref)
        --  [2] g_error (ref)
        --  [3] arg3 (copy)
        --  [4] t_21 (copy)

        v37 += 1

        if v37 > 2000 then
            g_error("probe cap")
        end

        arg3(t_21, t_21, t_21)
    end

    local t_22 = {}

    for _, val_6 in t_4 do
        t_22[val_6] = Recurse
    end

    v2(t_21, t_22)
    g_pcall(arg3, t_21, t_21, t_21)

    return v37
end

local function CheckHooks() -- line: 438
    -- upvalues:
    --  [1] v22 (ref)
    --  [2] debug_info (copy)
    --  [3] v1 (copy)
    --  [4] v24 (ref)
    --  [5] v6 (copy)
    --  [6] t_17 (copy)
    --  [7] g_type (copy)
    --  [8] FireServer (ref)
    --  [9] g_pcall (copy)
    --  [10] Kick (ref)

    v22 = true

    if not v1(debug.info, debug_info) then
        v24 = v6.bor(v24, 1)
    end

    for _, val_7 in t_17 do
        local v38 = val_7.Module[val_7.Name]

        if g_type(v38) ~= "function" or not v1(v38, val_7.Function) then
            v24 = v6.bor(v24, 1)
        elseif debug_info(v38, "s") ~= val_7.Source or debug_info(v38, "a") ~= val_7.Arity then
            v24 = v6.bor(v24, 1)
        end
    end

    if if not FireServer then Kick and g_pcall(Kick, workspace, "") else g_pcall(
        FireServer,
        workspace
    ) or Kick and g_pcall(Kick, workspace, "") then
        v24 = v6.bor(v24, 1)
    end
end

local function SnapshotCatalog(arg4) -- line: 464
    -- upvalues:
    --  [1] g_type (copy)
    --  [2] v8 (copy)
    --  [3] v7 (copy)
    --  [4] g_next (copy)

    local t_23 = {}
    local t_24 = {}
    local t_25 = {}

    local function Walk(arg5) -- line: 467
        -- upvalues:
        --  [1] g_type (ref)
        --  [2] t_25 (copy)
        --  [3] t_24 (copy)
        --  [4] v8 (ref)
        --  [5] v7 (ref)
        --  [6] t_23 (copy)
        --  [7] g_next (ref)
        --  [8] Walk (copy)

        local v41 = g_type(arg5)

        if t_25[arg5] or v41 ~= "table" and v41 ~= "buffer" then
            return
        end

        t_25[arg5] = true

        if v41 == "buffer" then
            t_24[arg5] = v8.tostring(arg5)

            return
        end

        if v7.isfrozen(arg5) then
            v7.insert(t_23, arg5)
        end

        for key_8, val_8 in g_next, arg5 do
            Walk(key_8)
            Walk(val_8)
        end
    end

    Walk(arg4)

    return t_23, t_24
end

local v43 = nil
local v44 = nil

local function CheckCatalog() -- line: 511
    -- upvalues:
    --  [1] v22 (ref)
    --  [2] v43 (ref)
    --  [3] v44 (ref)
    --  [4] SnapshotCatalog (copy)
    --  [5] WeaponManager (ref)
    --  [6] v7 (copy)
    --  [7] v24 (ref)
    --  [8] v6 (copy)
    --  [9] v8 (copy)
    --  [10] v32 (ref)
    --  [11] g_type (copy)
    --  [12] v23 (copy)
    --  [13] g_next (copy)
    --  [14] g_rawget (copy)

    v22 = true

    if not v43 then
        local v45 = SnapshotCatalog
        local v46 = WeaponManager and WeaponManager.GetAllWeapons() or {}
        v43, v44 = v45(v46)

        return
    end

    for _, val_9 in v43 do
        if not v7.isfrozen(val_9) then
            v24 = v6.bor(v24, 1)
            break
        end
    end

    for key_10, val_10 in v44 do
        if v8.tostring(key_10) ~= val_10 then
            v24 = v6.bor(v24, 1)
            break
        end
    end

    local v47 = v32 and WeaponManager and WeaponManager.Get(v32.Name)
    local v48 = v47 and v47.Data
    local v49 = v32 and v32.Data

    if not v48 or g_type(v49) ~= "table" or v23[v32] then
        return
    end

    for key_11, val_11 in g_next, v48 do
        local v50 = g_type(val_11)

        if v50 == "table" or v50 == "buffer" then
            if g_type((g_rawget(v49, key_11))) ~= v50 then
                v24 = v6.bor(v24, 1)

                return
            end
        end
    end
end

local function CheckEnvironment() -- line: 551
    -- upvalues:
    --  [1] v22 (ref)
    --  [2] g_getfenv (copy)
    --  [3] t_5 (copy)
    --  [4] g_rawget (copy)
    --  [5] v24 (ref)
    --  [6] v6 (copy)
    --  [7] t_6 (copy)
    --  [8] v9 (copy)

    v22 = true
    local v52 = g_getfenv(0)

    for _, val_12 in t_5 do
        if g_rawget(_G, val_12) ~= nil or g_rawget(v52, val_12) ~= nil then
            v24 = v6.bor(v24, 64)
            break
        end
    end

    local PlayerGui = game:GetService("Players").LocalPlayer:FindFirstChildOfClass("PlayerGui")

    if not PlayerGui then
        return
    end

    for _, child in PlayerGui:GetChildren() do
        local v53 = t_6

        if child:IsA("ScreenGui") and v53[v9.gsub(v9.lower(child.Name), "[^%w]", "")] then
            v24 = v6.bor(v24, 64)

            return
        end
    end
end

local function IsNative(arg6) -- line: 580
    -- upvalues:
    --  [1] g_type (copy)
    --  [2] debug_info (copy)

    return if g_type(arg6) == "function" then debug_info(arg6, "s") == "[C]" else true
end

local function CheckLibraries() -- line: 584
    -- upvalues:
    --  [1] v22 (ref)
    --  [2] t_11 (copy)
    --  [3] v7 (copy)
    --  [4] v24 (ref)
    --  [5] v6 (copy)
    --  [6] g_next (copy)
    --  [7] v1 (copy)
    --  [8] IsNative (copy)
    --  [9] g_getfenv (copy)
    --  [10] t_12 (copy)
    --  [11] t_9 (copy)
    --  [12] t_13 (copy)
    --  [13] t_15 (copy)
    --  [14] MetamethodOf (copy)
    --  [15] t_14 (copy)

    v22 = true

    for _, val_13 in t_11 do
        local Library = val_13.Library
        local Fields = val_13.Fields
        local v55 = 0

        if not v7.isfrozen(Library) then
            v24 = v6.bor(v24, 256)

            return
        end

        for key_15, val_14 in g_next, Library do
            local v56 = Fields[key_15]
            v55 += 1

            if if v1(v56, val_14) then not IsNative(val_14) else v56 == v56 or val_14 == val_14 or not IsNative(
                val_14
            ) then
                v24 = v6.bor(v24, 256)

                return
            end
        end

        if v55 ~= val_13.Count then
            v24 = v6.bor(v24, 256)

            return
        end
    end

    local v57 = g_getfenv(0)

    for key_16, val_15 in t_12 do
        local v58 = v57[key_16]

        if not v1(v58, val_15) or not IsNative(v58) then
            v24 = v6.bor(v24, 256)

            return
        end
    end

    for key_17, val_16 in t_9 do
        if not v1(val_16[1][val_16[2]], t_13[key_17]) then
            v24 = v6.bor(v24, 256)

            return
        end
    end

    for key_18, val_17 in t_15 do
        local v59 = MetamethodOf(val_17)

        if not v1(v59, t_14[key_18]) or not IsNative(v59) then
            v24 = v6.bor(v24, 256)

            return
        end
    end
end

local function CheckBait() -- line: 643
    -- upvalues:
    --  [1] v22 (ref)
    --  [2] t_20 (copy)
    --  [3] g_pcall (copy)
    --  [4] v24 (ref)
    --  [5] v6 (copy)
    --  [6] RemoteEvent_1 (copy)
    --  [7] v30 (copy)
    --  [8] t_19 (copy)

    v22 = true

    for _, val_18 in t_20 do
        if g_pcall(val_18) then
            v24 = v6.bor(v24, 1024)
        end
    end

    g_pcall(function() -- line: 652
        -- upvalues:
        --  [1] RemoteEvent_1 (ref)
        --  [2] v30 (ref)
        --  [3] t_19 (ref)

        RemoteEvent_1:FireServer(v30, t_19)
    end)
end

local Folder = nil
local BindableEvent = nil
local v62 = nil
local t_26 = {}

local function CheckInstances() -- line: 661
    -- upvalues:
    --  [1] v22 (ref)
    --  [2] Folder (ref)
    --  [3] ReplicatedStorage (copy)
    --  [4] v24 (ref)
    --  [5] v6 (copy)
    --  [6] v62 (ref)
    --  [7] BindableEvent (ref)
    --  [8] t_26 (copy)

    v22 = true

    if Folder and (Folder.Parent ~= ReplicatedStorage or Folder.Name ~= "ClientIntegrity") then
        v24 = v6.bor(v24, 512)
    end

    if v62 or BindableEvent and BindableEvent.Parent == nil then
        v24 = v6.bor(v24, 512)
    end

    for _, val_19 in t_26 do
        if val_19.Parent == nil then
            v24 = v6.bor(v24, 512)

            return
        end
    end
end

local function MetamethodsBehave() -- line: 681
    -- upvalues:
    --  [1] t_10 (copy)
    --  [2] g_next (copy)
    --  [3] v2 (copy)
    --  [4] g_pcall (copy)
    --  [5] g_tostring (copy)

    local t_27 = {}
    local t_28 = {}

    for _, val_20 in t_10 do
        t_28[val_20] = function() -- line: 686
            -- upvalues:
            --  [1] t_27 (copy)
            --  [2] val_20 (copy)

            t_27[val_20] = (t_27[val_20] or 0) + 1

            return 1
        end
    end

    function t_28.__tostring() -- line: 692
        -- upvalues:
        --  [1] t_27 (copy)

        t_27.__tostring = (t_27.__tostring or 0) + 1

        return "canary"
    end

    function t_28.__iter() -- line: 697
        -- upvalues:
        --  [1] t_27 (copy)
        --  [2] g_next (ref)

        t_27.__iter = (t_27.__iter or 0) + 1

        return g_next, {}
    end

    local v63 = v2({}, t_28)
    local v64 = v2({}, t_28)

    if not g_pcall(function() -- line: 705
        -- upvalues:
        --  [1] v63 (copy)
        --  [2] v64 (copy)
        --  [3] g_tostring (ref)

        local _ = v63.Missing
        v63.Written = true
        local _ = v63()
        local _ = v63 .. "x"
        local _ = -v63
        local _ = v63 + v64
        local _ = v63 - v64
        local _ = v63 * v64
        local _ = v63 / v64
        local _ = v63 // v64
        local _ = v63 % v64
        local _ = v63 ^ v64
        local _ = g_tostring(v63)

        if v63 ~= v64 then
        else
        end

        if not (v63 < v64) then
        else
        end

        if not (v63 <= v64) then
        else
        end

        local _ = #v63

        for _ in v63 do
        end
    end) then
        return false
    end

    for _, val_21 in t_10 do
        if t_27[val_21] ~= 1 then
            return false
        end
    end

    return true
end

local v77 = 0
local v78 = 0

local function CheckCanaries() -- line: 741
    -- upvalues:
    --  [1] v22 (ref)
    --  [2] v29 (copy)
    --  [3] v3 (copy)
    --  [4] MetamethodsBehave (copy)
    --  [5] v24 (ref)
    --  [6] v6 (copy)
    --  [7] v4 (copy)
    --  [8] v5 (copy)
    --  [9] g_type (copy)
    --  [10] v10 (copy)
    --  [11] v77 (ref)
    --  [12] v78 (ref)
    --  [13] v31 (copy)

    v22 = true

    if v3(v29) ~= "The metatable is locked" or not MetamethodsBehave() then
        v24 = v6.bor(v24, 128)
    end

    local v79 = v4()
    local v80 = v5("count")
    v77 = (if g_type(v79) == "number" then if g_type(v80) == "number" then if not (v10.abs(
        v79 - v80
    ) > 64) then false else true else true else true) and v77 + 1 or 0
    v78 = if v31.Service ~= nil then 0 else v78 + 1 or 0
    v31.Service = game:GetService("UserInputService")

    if v77 >= 2 or v78 >= 2 then
        v24 = v6.bor(v24, 128)
    end
end

local function ProbeNext() -- line: 765
    -- upvalues:
    --  [1] v22 (ref)
    --  [2] v26 (ref)
    --  [3] t_17 (copy)
    --  [4] t_3 (copy)
    --  [5] v1 (copy)
    --  [6] ProbeDepth (copy)
    --  [7] v24 (ref)
    --  [8] v6 (copy)

    v22 = true
    v26 = v26 % #t_17 + 1
    local v84 = t_17[v26]

    if not v84 or t_3[v84.Name] or not v1(v84.Module[v84.Name], v84.Function) then
        return
    end

    local v85 = ProbeDepth(v84.Function)

    if not v84.Depth then
        v84.Depth = v85

        return
    end

    if v84.Depth >= 2 and v85 ~= v84.Depth then
        v24 = v6.bor(v24, 16)
    end
end

local v86 = 0
local v87 = 0
local v88 = 0

local function OnWeaponShoot(arg7) -- line: 787
    -- upvalues:
    --  [1] v25 (ref)
    --  [2] v32 (ref)
    --  [3] v33 (ref)
    --  [4] v34 (ref)
    --  [5] v86 (ref)
    --  [6] v87 (ref)
    --  [7] v88 (ref)
    --  [8] v36 (ref)
    --  [9] v24 (ref)
    --  [10] v6 (copy)
    --  [11] v10 (copy)
    --  [12] v35 (ref)

    v25 = (v25 + 1) % 65536
    local Data = arg7.Data
    local Timer = arg7.Timer
    local v89 = Data.FireRate and Data.FireRate[arg7.Mode]

    if arg7 ~= v32 or not v89 or not v33 or Timer < v33 then
        v32, v33, v34 = arg7, Timer, Data.Ammo
        v86, v87, v88 = 1, 0, 0
        v36 = false

        return
    end

    local v90 = Timer - v33

    if Data.Ammo > v34 and not v36 then
        v24 = v6.bor(v24, 8)
    end

    local AltFunction = Data.AltFunction
    local v91 = AltFunction and (if AltFunction.Name ~= "Burst" then false else arg7.Mode == 2)
    local v92 = not v91

    if v92 then
        v92 = Timer <= (arg7.FireDelay or -v10.huge) + v35 + 0.0001 and true
    end

    v86 = v92 and v86 + 1 or 1
    v87 = v86 >= 5 and arg7.RecoilIndex < 2 and v87 + 1 or 0

    if v87 >= 3 then
        v24 = v6.bor(v24, 2)
    end

    v88 = if v91 then 0 else v90 < v89 * 0.8 and v88 + 1 or 0

    if v88 >= 3 then
        v24 = v6.bor(v24, 4)
    end

    v33, v34 = Timer, Data.Ammo
    v36 = false
end

local function OnRefill() -- line: 840
    -- upvalues:
    --  [1] v36 (ref)

    v36 = true
end

local function Run(arg8) -- line: 850
    -- upvalues:
    --  [1] v22 (ref)
    --  [2] g_pcall (copy)
    --  [3] v24 (ref)
    --  [4] v6 (copy)
    --  [5] debug_info (copy)
    --  [6] v21 (copy)

    v22 = false

    if not g_pcall(arg8) then
        v24 = v6.bor(v24, 128)

        return
    end

    if not v22 or debug_info(arg8, "s") ~= v21 then
        v24 = v6.bor(v24, 1)
    end
end

local t_29 = {
    OnWeaponShoot,
    OnRefill,
    ProbeDepth,
    SnapshotCatalog,
    MetamethodsBehave,
    IsNative,
    MetamethodOf,
    Run
}

local function CheckSelf() -- line: 863
    -- upvalues:
    --  [1] v22 (ref)
    --  [2] t_29 (copy)
    --  [3] debug_info (copy)
    --  [4] v21 (copy)
    --  [5] v24 (ref)
    --  [6] v6 (copy)

    v22 = true

    for _, val_22 in t_29 do
        if debug_info(val_22, "s") ~= v21 then
            v24 = v6.bor(v24, 1)

            return
        end
    end
end

local function RefreshConfig() -- line: 875
    -- upvalues:
    --  [1] v35 (ref)
    --  [2] GameConfiguration (ref)

    v35 = GameConfiguration.Get("Weapon", "RecoilDecayThreshold") / GameConfiguration.Get(
        "Game",
        "TickRate"
    )
end

local function ForgetWeapon(arg9) -- line: 879
    -- upvalues:
    --  [1] v23 (copy)
    --  [2] v32 (ref)
    --  [3] v33 (ref)
    --  [4] v34 (ref)

    if arg9 then
        v23[arg9] = true
    end

    v32, v33, v34 = nil, nil, nil
end

local function OnWeaponCreate(arg10) -- line: 887
    -- upvalues:
    --  [1] TemplateOverrides_m (copy)
    --  [2] v23 (copy)

    if arg10 then
        if TemplateOverrides_m.GetWeapons()[arg10.Name] then
            v23[arg10] = true
        end
    end
end

function t.Init(arg11) -- line: 897
    -- upvalues:
    --  [1] Network (ref)
    --  [2] WeaponController (ref)
    --  [3] WeaponManager (ref)
    --  [4] GameConfiguration (ref)
    --  [5] t_2 (copy)
    --  [6] TattleSeal_m (copy)
    --  [7] g_type (copy)
    --  [8] debug_info (copy)
    --  [9] v24 (ref)
    --  [10] v6 (copy)
    --  [11] t_17 (copy)
    --  [12] v7 (copy)

    Network = arg11:GetModule("Network")
    WeaponController = arg11:GetModule("WeaponController")
    WeaponManager = arg11:GetModule("WeaponManager")
    GameConfiguration = arg11:GetModule("GameConfiguration")

    for key_25, val_23 in t_2 do
        local v98 = TattleSeal_m

        if key_25 ~= "TattleSeal" or not v98 then
            v98 = arg11:GetModule(key_25)
        end

        for _, val_24 in val_23 do
            local v99 = v98 and v98[val_24]
            local v100 = if g_type(v99) ~= "function" then false else true
            local t_30 = { Module = nil, Name = nil, Function = nil, Source = nil, Arity = nil }
            local v101 = v98 or {}
            t_30.Module = v101
            t_30.Name = val_24
            t_30.Function = v99
            v101 = v100 and debug_info(v99, "s") or "?"
            t_30.Source = v101
            v101 = v100 and debug_info(v99, "a") or -1
            t_30.Arity = v101

            if t_30.Source == "[C]" then
                v24 = v6.bor(v24, 1)
            end

            v7.insert(t_17, t_30)
        end
    end
end

local t_31 = {
    CheckSelf,
    CheckHooks,
    CheckCatalog,
    ProbeNext,
    CheckCanaries,
    CheckLibraries,
    CheckInstances,
    CheckBait
}

function t.Start(_) -- line: 929
    -- upvalues:
    --  [1] Network (ref)
    --  [2] debug_info (copy)
    --  [3] TattleSeal_m (copy)
    --  [4] Folder (ref)
    --  [5] ReplicatedStorage (copy)
    --  [6] BindableEvent (ref)
    --  [7] v62 (ref)
    --  [8] t_1 (copy)
    --  [9] t_26 (copy)
    --  [10] v7 (copy)
    --  [11] WeaponController (ref)
    --  [12] OnWeaponShoot (copy)
    --  [13] OnRefill (copy)
    --  [14] OnWeaponCreate (copy)
    --  [15] ForgetWeapon (copy)
    --  [16] RefreshConfig (copy)
    --  [17] GameConfiguration (ref)
    --  [18] t_31 (copy)
    --  [19] Run (copy)
    --  [20] CheckEnvironment (copy)
    --  [21] v1 (copy)
    --  [22] g_pcall (copy)
    --  [23] v24 (ref)
    --  [24] v25 (ref)

    local Tattle = Network.Anticheat.Tattle
    local Fire = Tattle.Fire
    local v102 = debug_info(Fire, "s")
    local v103 = TattleSeal_m.Seed(game.JobId, game:GetService("Players").LocalPlayer.UserId)
    local v104 = 0
    Folder = Instance.new("Folder")
    Folder.Name = "ClientIntegrity"
    Folder.Parent = ReplicatedStorage
    BindableEvent = Instance.new("BindableEvent")
    BindableEvent.Name = "IntegrityValidate"
    BindableEvent.Parent = Folder
    BindableEvent.Event:Connect(function() -- line: 951
        -- upvalues:
        --  [1] v62 (ref)

        v62 = true
    end)

    for _, val_25 in t_1 do
        local v105 = ReplicatedStorage

        for _, val_26 in val_25 do
            local v106 = v105

            if v106 then
                v106 = v105:FindFirstChild(val_26)
            end

            v105 = v106
        end

        if v105 then
            v7.insert(t_26, v105)
        end
    end

    WeaponController.OnWeaponShoot:Connect(OnWeaponShoot)
    WeaponController.OnWeaponReload:Connect(OnRefill)
    WeaponController.OnAmmoCorrected:Connect(OnRefill)
    WeaponController.OnWeaponCreate:Connect(OnWeaponCreate)
    WeaponController.OnDataPatched:Connect(ForgetWeapon)
    RefreshConfig()
    GameConfiguration.Updated:Connect(function() -- line: 975
        -- upvalues:
        --  [1] RefreshConfig (ref)
        --  [2] ForgetWeapon (ref)

        RefreshConfig()
        ForgetWeapon(nil)
    end)
    task.spawn(function() -- line: 980
        -- upvalues:
        --  [1] t_31 (ref)
        --  [2] Run (ref)
        --  [3] CheckEnvironment (ref)
        --  [4] v102 (copy)
        --  [5] Tattle (copy)
        --  [6] Fire (copy)
        --  [7] v1 (ref)
        --  [8] debug_info (ref)
        --  [9] g_pcall (ref)
        --  [10] Network (ref)
        --  [11] TattleSeal_m (ref)
        --  [12] v103 (copy)
        --  [13] v104 (ref)
        --  [14] v24 (ref)
        --  [15] v25 (ref)

        local v107 = 0
        task.wait(1)

        for _, val_27 in t_31 do
            Run(val_27)
        end

        v107 += 1

        if v107 >= 4 then
            v107 = 0
            Run(CheckEnvironment)

            if v102 == "[C]" or not v1(Tattle.Fire, Fire) or debug_info(Fire, "s") ~= v102 then
                g_pcall(Network.ClientPing.Fire, 0)
            else
                local v108 = TattleSeal_m.Seal(v103, v104 + 1, v24, v25)
                local t_32 = { Mask = v24, Shots = nil, Echo = nil }
                t_32.Shots, t_32.Echo = v25, v108

                if g_pcall(Fire, t_32) then
                    v104 += 1
                else
                    g_pcall(Fire, v24)
                end

                v24 = 0
            end
        end
    end)
end

return t
