-- Script Path: game:GetService("ReplicatedFirst")["paul greyrat"].MovementGuard
-- Took 0.19s to decompile.
-- Executor: Real (2.7.8)

-- Script path: ReplicatedFirst.paul greyrat.MovementGuard
-- Decompile time: 194.99 ms

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Config = require(script.Config)
local Rules = require(script.Rules)
local Trove = require((ReplicatedStorage:WaitForChild("Modules")):WaitForChild("Trove"))
local v1 = {}
local u39 = nil

local function debugPanel(a1, a2) -- Line: 12 -- upvalues: Rules (val), Config (val)
    if game.PlaceId ~= 5875630735 then
        return nil
    end
    local u10 = a1:Add((Instance.new("BindableEvent")))
    u10.Name = "MovementGuardDebug"
    local u12 = nil
    local u13 = nil
    local u14 = nil
    local u15 = nil
    local u16 = {}

    local function finishCapture() -- Line: 20 -- upvalues: u14 (ref), u15 (ref), u16 (val)
        if not u14 then
            return
        end
        u15 = u14
        warn(string.format(
            "[MovementCalibration] tool=%s duration=%.2f grantMax=%.1f changes=%d worldPeak=%.1f avg0.5=%s avg2=%s gaps=%d paused=%s",
            u14.Tool,
            u14.Duration,
            u14.Grant,
            u14.Changes,
            u14.Peak,
            u14.Short and string.format("%.1f", u14.Short) or "incomplete",
            u14.Long and string.format("%.1f", u14.Long) or "incomplete",
            u14.Gaps,
            (tostring(u14.Paused))
        ))
        u14 = nil
        table.clear(u16)
    end

    a1:Connect(u10.Event, function() -- Line: 32 -- upvalues: u12 (ref), finishCapture (val), a2 (val), a1 (val), u13 (ref)
        if u12 then
            u12.Enabled = not u12.Enabled
            if not u12.Enabled then
                finishCapture()
            end
            return
        end
        local PlayerGui = a2:FindFirstChildOfClass("PlayerGui")
        if not PlayerGui then
            return
        end
        u12 = a1:Add((Instance.new("ScreenGui")))
        u12.Name = "MovementGuardDebugHUD"
        u12.ResetOnSpawn = false
        u12.DisplayOrder = 100
        u13 = Instance.new("TextLabel")
        u13.AnchorPoint = Vector2.new(0, 0.5)
        u13.Position = UDim2.new(0, 12, 0.5, 0)
        u13.Size = UDim2.fromOffset(355, 365)
        u13.BackgroundColor3 = Color3.fromRGB(18, 22, 29)
        u13.BackgroundTransparency = 0.1
        u13.BorderSizePixel = 0
        u13.TextColor3 = Color3.fromRGB(225, 235, 245)
        u13.Font = Enum.Font.Code
        u13.TextSize = 14
        u13.TextXAlignment = Enum.TextXAlignment.Left
        u13.TextYAlignment = Enum.TextYAlignment.Top
        u13.Text = "CLIENT MOVEMENT | waiting for sample"
        u13.Parent = u12
        local UIPadding = Instance.new("UIPadding")
        UIPadding.PaddingTop = UDim.new(0, 12)
        UIPadding.PaddingLeft = UDim.new(0, 12)
        UIPadding.Parent = u13
        u12.Parent = PlayerGui
    end)
    u10.Parent = a2
    local v1 = a1:Add((Instance.new("TextChatCommand")))
    v1.Name = "ClientMovementDebug"
    v1.PrimaryAlias = "/clientDebug"
    a1:Connect(v1.Triggered, function(a1) -- Line: 72 -- upvalues: a2 (val), u10 (val)
        if a1 and a1.UserId == a2.UserId then
            u10:Fire()
        end
    end)
    v1.Parent = game:GetService("TextChatService")
    local u41 = 0
    local u42 = nil
    local u43 = nil
    local u44 = nil
    return function(a1, a2_2) -- Line: 80
        -- upvalues: u12 (ref), u42 (ref), u43 (ref), u44 (ref), Rules (upval), Config (upval), u14 (ref)
        -- upvalues: finishCapture (val), u16 (val), u15 (ref), u41 (ref), a2 (val), u13 (ref)
        if u12 and u12.Enabled then
            local v1, v2, v3, v4, v5
            local Character = a1 and a1.Character
            local HumanoidRootPart = Character and Character:FindFirstChild("HumanoidRootPart")
            local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
            local v6 = nil
            local v7 = nil
            if not HumanoidRootPart
                or not HumanoidRootPart:IsA("BasePart")
                or not Humanoid
                or not (0 < Humanoid.Health)
                or not Rules.finiteVector(HumanoidRootPart.Position) then
                u42 = nil
                u43 = nil
                u44 = nil
            else
                v7 = u44 and a2_2 - u44
                if HumanoidRootPart == u42 and v7 and v7 > 0 and v7 <= Config.MaxSampleGap then
                    v6 = (HumanoidRootPart.Position - u43) / v7
                end
                local Position = HumanoidRootPart.Position
                u42 = HumanoidRootPart
                u43 = Position
                u44 = a2_2
            end
            local DebugSnapshot = a1 and a1.DebugSnapshot
            local v8 = Character and Character:GetAttribute("SpeedBypass")
            local v9 = Rules.finite(v8) and math.max(0, v8) or 0
            v8 = v9
            if u14 then
                if u14.Character ~= Character or v8 == 0 then
                    finishCapture()
                end
            end
            if v8 > 0 and u42 then
                local v10, v11
                if not u14 then
                    local Tool = Character:FindFirstChildOfClass("Tool")
                    v10 = {
                        Duration = 0,
                        Changes = 0,
                        Peak = 0,
                        Gaps = 0,
                        Paused = false,
                        Character = Character,
                    }
                    v10.Tool = Tool and Tool.Name or "none"
                    v10.Grant = v8
                    v10.LastGrant = v8
                    v10.Correction = a1.LastCorrection
                    v10.Teleport = Character:GetAttribute("TeleportID")
                    v10.ServerCorrection = Character:GetAttribute("MovementCorrection")
                    u14 = v10
                    v6 = nil
                end
                if v8 ~= u14.LastGrant then
                    v9 = u14
                    v9.Changes = v9.Changes + 1
                    u14.LastGrant = v8
                end
                u14.Grant = math.max(u14.Grant, v8)
                v9 = u14
                local Paused = u14.Paused or DebugSnapshot == nil
                v9.Paused = Paused
                local Attribute = Character:GetAttribute("TeleportID")
                local Attribute_2 = Character:GetAttribute("MovementCorrection")
                if u14.Correction ~= a1.LastCorrection
                    or u14.Teleport ~= Attribute
                    or u14.ServerCorrection ~= Attribute_2 then
                    v6 = nil
                end
                local v12 = u14
                local v13 = u14
                u14.Correction = a1.LastCorrection
                v12.Teleport = Attribute
                v13.ServerCorrection = Attribute_2
                if not v6 then
                    v11 = u14
                    v11.Gaps = v11.Gaps + 1
                    table.clear(u16)
                else
                    local v14, v15, v16
                    v10 = Vector3.new(v6.X, 0, v6.Z).Magnitude * v7
                    v11 = u14
                    v11.Duration = v11.Duration + v7
                    u14.Peak = math.max(u14.Peak, v10 / v7)
                    table.insert(u16, {Start = a2_2 - v7, Finish = a2_2, Distance = v10})
                    v2, v1 = a2_2, a1
                    while true do
                        v11 = #u16
                        if Config.MaxSamples < v11 then
                            table.remove(u16, 1)
                            continue
                        end
                        if not (u16[1].Finish < v2 - Config.LongWindow) then
                            break
                        end
                        table.remove(u16, 1)
                    end
                    v11 = {}
                    v11.Short = Config.ShortWindow
                    v11.Long = Config.LongWindow
                    v12 = nil
                    v13 = nil
                    for i, j in v11, v12, v13 do
                        v14 = 0
                        v4 = 0
                        v15 = u16
                        v5 = nil
                        for k, n in v15, nil, v5 do
                            v10 = math.min(n.Finish - n.Start, (math.max(0, n.Finish - (v2 - j))))
                            v14 = v14 + v10
                            v4 = v4 + n.Distance * v10 / (n.Finish - n.Start)
                        end
                        if j - 0.001 <= v14 then
                            v15 = u14
                            v5 = u14[i] or 0
                            v16 = v4 / j
                            v15[i] = (math.max(v5, v16))
                        end
                    end
                end
            end
            v7 = u14 or u15
            local v17 = string.format("\n\nRaw SpeedBypass: %.1f", v8)
            if v7 then
                local format = string.format
                local Peak_2 = v7.Peak
                v3 = v7.Short and string.format("%.1f", v7.Short) or "--"
                local v18 = v7.Long and string.format("%.1f", v7.Long) or "--"
                v17 = v17 .. format(
                    "\n%s world peak: %.1f\nMax avg 0.5s / 2s: %s / %s\nGrant max: %.1f | changes: %d",
                    if not u14 then "Last" else "Active",
                    Peak_2,
                    v3,
                    v18,
                    v7.Grant,
                    v7.Changes
                )
            end
            if v2 - u41 < 0.1 then
                return
            end
            u41 = v2
            if not DebugSnapshot then
                if not u42 then
                    v9 = u13
                    local Mode_2 = Config.Mode
                    v9.Text = "CLIENT MOVEMENT | " .. Mode_2 .. "\n\n" .. (v1 and v1.DebugStatus or "Waiting for character") .. "\n\nSpeed / thresholds unavailable" .. v17
                    return
                end
                local DebugStatus = if not a2:GetAttribute("soruDash") then v1.DebugStatus else "Soru dash"
                v9 = u13
                local format_2 = string.format
                local Mode = Config.Mode
                v3 = v6 and string.format("%.1f studs/s", Vector3.new(v6.X, 0, v6.Z).Magnitude) or "sampling..."
                v9.Text = (format_2(
                    "CLIENT MOVEMENT | %s\n\nWorld speed: %s\nVertical:    %s\n\nAllowance:   bypassed / paused\nBurst/long:  paused\n\n%s\n\nDisplay only; no enforcement",
                    Mode,
                    v3,
                    v6 and string.format("%.1f studs/s", v6.Y) or "sampling...",
                    DebugStatus
                )) .. v17
                return
            end

            local function window(a1, a2) -- Line: 174
                return a1 and string.format("%.1f / %.1f", a1, a2) or "warming up"
            end

            local Safe = v1.Safe
            v9 = u13
            local format_4 = string.format
            local Mode_3 = Config.Mode
            v3 = DebugSnapshot.Speed or 0
            local Limit = DebugSnapshot.Limit
            local ShortWindow = Config.ShortWindow
            local ShortSpeed = DebugSnapshot.ShortSpeed
            local ShortThreshold = DebugSnapshot.ShortThreshold
            v4 = ShortSpeed and string.format("%.1f / %.1f", ShortSpeed, ShortThreshold) or "warming up"
            local LongWindow = Config.LongWindow
            local LongSpeed = DebugSnapshot.LongSpeed
            local LongThreshold = DebugSnapshot.LongThreshold
            local v19 = LongSpeed and string.format("%.1f / %.1f", LongSpeed, LongThreshold) or "warming up"
            v5 = DebugSnapshot.Vertical or 0
            local Context = DebugSnapshot.Context
            local v20 = tostring(DebugSnapshot.Grounded)
            local v21 = DebugSnapshot.Reason or "none"
            local DebugStatus_3 = v1.DebugStatus
            v9.Text = (format_4(
                "CLIENT MOVEMENT | %s\n\nSpeed:       %.1f studs/s\nAllowance:   %.1f studs/s\nBurst %.1fs:  %s\nLong %.1fs:   %s\nVertical:    %.1f studs/s\nContext:     %s\nGrounded:    %s\nDetection:   %s\nCorrection:  %s\nSafe age:    %s",
                Mode_3,
                v3,
                Limit,
                ShortWindow,
                v4,
                LongWindow,
                v19,
                v5,
                Context,
                v20,
                v21,
                DebugStatus_3,
                Safe and string.format("%.1fs", v2 - Safe.Time) or "none"
            )) .. v17
            return
        end
        u42 = nil
        u43 = nil
        u44 = nil
    end
end

local function flag(a1, a2) -- Line: 189
    local Attribute = a1:GetAttribute(a2)
    local v1 = false
    if Attribute ~= nil then
        v1 = false
        if Attribute ~= false then
            v1 = Attribute ~= 0
        end
    end
    return v1
end

local function allowance(a1, a2) -- Line: 194
    local Attribute = a1:GetAttribute(a2)
    local v1 = false
    if Attribute ~= nil then
        v1 = false
        if Attribute ~= false then
            v1 = Attribute ~= 0
        end
    end
    if not v1 then
        v1 = a1:HasTag(a2) or a1:FindFirstChild(a2) ~= nil
    end
    return v1
end

local function bypassDetails(a1) -- Line: 198
    local Attribute, Attribute_2, v1
    local v2 = {}
    local v3 = {"JumpBypass", "AirBypass", "FlyBypass", "NoclipBypass"}
    local v4 = nil
    local v5 = nil
    local v6 = a1
    for i, j in v3, v4, v5 do
        Attribute_2 = v6:GetAttribute(j)
        if Attribute_2 ~= nil then
            v1 = tostring(Attribute_2)
            table.insert(v2, j .. ":attribute=" .. v1)
        end
        if v6:HasTag(j) then
            table.insert(v2, j .. ":tag")
        end
        if v6:FindFirstChild(j) then
            table.insert(v2, j .. ":child")
        end
    end
    for k, n in {"gliding", "GlideMovementReconcileUntil"} do
        Attribute = v6:GetAttribute(n)
        if Attribute ~= nil then
            v1 = tostring(Attribute)
            table.insert(v2, n .. "=" .. v1)
        end
    end
    return #v2 > 0 and table.concat(v2, ",") or "none"
end

local function hasClimbSurface(a1, a2) -- Line: 221
    local v1
    local v2 = {}
    for i, j in {"Islands", "Ships", "Env"} do
        v1 = workspace:FindFirstChild(j)
        if v1 then
            table.insert(v2, v1)
        end
    end
    if #v2 == 0 then
        return false
    end
    a1.MapRay.FilterDescendantsInstances = v2
    a1.MapRay.CollisionGroup = a2.CollisionGroup
    if workspace:Raycast(a2.Position, a2.CFrame.LookVector * 10, a1.MapRay) then
        return true
    end
    a1.MapOverlap.FilterDescendantsInstances = v2
    a1.MapOverlap.CollisionGroup = a2.CollisionGroup
    local Probe = a1.Probe
    Probe.Size = a2.Size + Vector3.new(2, 2, 2)
    Probe.CFrame = a2.CFrame
    Probe.Parent = a2.Parent
    return #workspace:GetPartsInPart(Probe, a1.MapOverlap) > 0
end

local function context(a1, a2, a3, a4, a5, a6) -- Line: 246
    -- upvalues: ReplicatedStorage (val), Config (val), Rules (val), hasClimbSurface (val)
    if ReplicatedStorage:GetAttribute("MovementChecksDisabled") == true then
        return "external-control", Config.RunSpeed, false, false
    end
    local v1 = ReplicatedStorage:FindFirstChild("Stats" .. a2.Name)
    local Stats = v1 and v1:FindFirstChild("Stats")
    local Customization = v1 and v1:FindFirstChild("Customization")
    v1 = Stats and Stats:FindFirstChild("DF")
    local FightingStyle = Stats and Stats:FindFirstChild("FightingStyle")
    local Race = Customization and Customization:FindFirstChild("Race")
    if v1 and FightingStyle and Race then
        local v2 = Stats:FindFirstChild("DevilFruitMastery")
        local v3 = a4:GetState()
        local Attribute = a3:GetAttribute("GlideMovementReconcileUntil")
        local Attribute_2 = a3:GetAttribute("gliding")
        local v4 = false
        if Attribute_2 ~= nil then
            v4 = false
            if Attribute_2 ~= false then
                v4 = Attribute_2 ~= 0
            end
        end
        if not v4 then
            v4 = Rules.finite(Attribute) and workspace:GetServerTimeNow() <= Attribute
        end
        local Attribute_3 = a3:GetAttribute("FlyBypass")
        local v5 = false
        if Attribute_3 ~= nil then
            v5 = false
            if Attribute_3 ~= false then
                v5 = Attribute_3 ~= 0
            end
        end
        if not v5 then
            v5 = a3:HasTag("FlyBypass") or a3:FindFirstChild("FlyBypass") ~= nil
        end
        if not v5 then
            local Attribute_4 = a3:GetAttribute("AirBypass")
            v5 = false
            if Attribute_4 ~= nil then
                v5 = false
                if Attribute_4 ~= false then
                    v5 = Attribute_4 ~= 0
                end
            end
            if not v5 then
                v5 = a3:HasTag("AirBypass") or a3:FindFirstChild("AirBypass") ~= nil
            end
            if not v5 then
                local Attribute_5 = a3:GetAttribute("JumpBypass")
                v5 = false
                if Attribute_5 ~= nil then
                    v5 = false
                    if Attribute_5 ~= false then
                        v5 = Attribute_5 ~= 0
                    end
                end
                if not v5 then
                    v5 = a3:HasTag("JumpBypass") or a3:FindFirstChild("JumpBypass") ~= nil
                end
                if not v5 then
                    v5 = v4
                end
            end
        end
        local Attribute_6 = a3:GetAttribute("NoclipBypass")
        local v6 = false
        if Attribute_6 ~= nil then
            v6 = false
            if Attribute_6 ~= false then
                v6 = Attribute_6 ~= 0
            end
        end
        if not v6 then
            v6 = a3:HasTag("NoclipBypass") or a3:FindFirstChild("NoclipBypass") ~= nil
        end
        local v7 = "ground"
        local LocomotionLimit = Rules.locomotionLimit(Config, {
            Sprinting = a3:GetAttribute("MovementSprintActive") == true,
            Fruit = v1.Value,
            Style = FightingStyle.Value,
            Race = Race.Value,
            FruitMastery = v2 and v2.Value,
            Swimming = v3 == Enum.HumanoidStateType.Swimming,
            InCombat = a3:FindFirstChild("inCombat") ~= nil,
            InForm = a3:GetAttribute("InForm") == true,
            CustomM1 = a3:GetAttribute("customM1"),
            Commander = a3:GetAttribute("BiscuitCommander") == true,
            Venom = a3:GetAttribute("VenomDemonActive") == true,
            Sulong = a3:GetAttribute("sulongTransformed") == true,
            Fear = a3:FindFirstChild("FearStun") ~= nil,
        })
        if not a1.LocomotionLimit or a1.LocomotionLimit <= LocomotionLimit then
            a1.LocomotionLimit = LocomotionLimit
            a1.LocomotionUntil = a6 + Config.PermissionGrace
        elseif not (a1.LocomotionUntil <= a6) then
            LocomotionLimit = a1.LocomotionLimit
        else
            a1.LocomotionLimit = LocomotionLimit
            a1.LocomotionUntil = a6 + Config.PermissionGrace
        end
        if v4 then
            LocomotionLimit = math.max(LocomotionLimit, Config.GlideSpeed)
        end
        v4 = a3:GetAttribute("SpeedBypass")
        local v8 = Rules.finite(v4) and math.clamp(v4, 0, 500) or 0
        local SpeedGrant = v8
        if not a1.SpeedGrant or a1.SpeedGrant <= SpeedGrant then
            a1.SpeedGrant = SpeedGrant
            a1.SpeedGrantUntil = a6 + Config.PermissionGrace
        elseif not (a1.SpeedGrantUntil <= a6) then
            SpeedGrant = a1.SpeedGrant
        else
            a1.SpeedGrant = SpeedGrant
            a1.SpeedGrantUntil = a6 + Config.PermissionGrace
        end
        if SpeedGrant > 0 then
            LocomotionLimit = (math.max(LocomotionLimit, Config.MovementAllowanceSpeed)) + SpeedGrant * Config.SpeedBypassMultiplier
            v7 = "speed-allowance"
        end
        local SeatPart = a4.SeatPart
        if SeatPart then
            v7 = "transport"
            v5 = true
            if SeatPart:IsA("VehicleSeat") and Rules.finite(SeatPart.MaxSpeed) then
                LocomotionLimit = LocomotionLimit + math.max(0, SeatPart.MaxSpeed)
            end
        elseif v3 ~= Enum.HumanoidStateType.Climbing then
            if v3 == Enum.HumanoidStateType.Swimming and a4.FloorMaterial == Enum.Material.Water then
                v7 = "swimming"
                v5 = true
            end
        elseif hasClimbSurface(a1, a5) then
            v7 = "climbing"
            v5 = true
        elseif v3 == Enum.HumanoidStateType.Swimming and a4.FloorMaterial == Enum.Material.Water then
            v7 = "swimming"
            v5 = true
        end
        local v9 = workspace:FindFirstChild("Env")
        v2 = v9 and v9:FindFirstChild("WaterStuff")
        v9 = v2 and v2:FindFirstChild("Falls")
        if v9 and v9:IsA("BasePart") and a5.Position.Y < v9.Position.Y + 10 then
            v7 = "water"
            v5 = true
        end
        if v5 or v6 then
            v7 = "movement-allowance"
        end
        if v5 or v6 or SeatPart then
            LocomotionLimit = math.max(LocomotionLimit, Config.MovementAllowanceSpeed)
        end
        if 1.1 < (a3:GetScale()) or a3:GetAttribute("customM1") ~= nil then
            v7 = "custom-rig"
        end
        local v10 = workspace:FindFirstChild("Ragdolls")
        if a5.Anchored or a4.PlatformStand or a4.Sit then
            v7 = "external-control"
        else
            v9 = a3:GetAttribute("Knocked")
            v8 = false
            if v9 ~= nil then
                v8 = false
                if v9 ~= false then
                    v8 = v9 ~= 0
                end
            end
            if v8 then
                v7 = "external-control"
            else
                v2 = a3:GetAttribute("KnockAction")
                v8 = false
                if v2 ~= nil then
                    v8 = false
                    if v2 ~= false then
                        v8 = v2 ~= 0
                    end
                end
                if v8 then
                    v7 = "external-control"
                else
                    v3 = a3:GetAttribute("Flyback")
                    v8 = false
                    if v3 ~= nil then
                        v8 = false
                        if v3 ~= false then
                            v8 = v3 ~= 0
                        end
                    end
                    if v8 then
                        v7 = "external-control"
                    else
                        v1 = a3:GetAttribute("evading")
                        v8 = false
                        if v1 ~= nil then
                            v8 = false
                            if v1 ~= false then
                                v8 = v1 ~= 0
                            end
                        end
                        if v8 then
                            v7 = "external-control"
                        else
                            local Attribute_7 = a2:GetAttribute("soruDash")
                            v8 = false
                            if Attribute_7 ~= nil then
                                v8 = false
                                if Attribute_7 ~= false then
                                    v8 = Attribute_7 ~= 0
                                end
                            end
                            if v8 or a5:FindFirstChild("RollingBV") or a5:FindFirstChild("comboBP") then
                                v7 = "external-control"
                            else
                                local Attribute_8 = a3:GetAttribute("RagdollTrigger")
                                v8 = false
                                if Attribute_8 ~= nil then
                                    v8 = false
                                    if Attribute_8 ~= false then
                                        v8 = Attribute_8 ~= 0
                                    end
                                end
                                if v8 or a3:FindFirstChild("ragdoll") then
                                    v7 = "external-control"
                                else
                                    local Attribute_9
                                    if not v10 then
                                        Attribute_9 = a2:GetAttribute("AnticheatBypassFull")
                                        v8 = false
                                        if Attribute_9 ~= nil then
                                            v8 = false
                                            if Attribute_9 ~= false then
                                                v8 = Attribute_9 ~= 0
                                            end
                                        end
                                        if v8 then
                                            v7 = "external-control"
                                        end
                                    elseif a3.Parent == v10 then
                                        v7 = "external-control"
                                    else
                                        Attribute_9 = a2:GetAttribute("AnticheatBypassFull")
                                        v8 = false
                                        if Attribute_9 ~= nil then
                                            v8 = false
                                            if Attribute_9 ~= false then
                                                v8 = Attribute_9 ~= 0
                                            end
                                        end
                                        if v8 then
                                            v7 = "external-control"
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        return v7, LocomotionLimit, v5, v6, SpeedGrant
    end
    return "external-control", Config.RunSpeed, false, false
end

local function newSession(a1, a2, a3) -- Line: 344 -- upvalues: Rules (val), Config (val)
    local v1 = RaycastParams.new()
    v1.FilterType = Enum.RaycastFilterType.Exclude
    v1.FilterDescendantsInstances = {a1}
    v1.RespectCanCollide = true
    local v2 = OverlapParams.new()
    v2.FilterType = Enum.RaycastFilterType.Exclude
    v2.FilterDescendantsInstances = {a1}
    v2.RespectCanCollide = true
    v2.MaxParts = 32
    local v3 = OverlapParams.new()
    v3.FilterType = Enum.RaycastFilterType.Include
    v3.RespectCanCollide = true
    local v4 = RaycastParams.new()
    v4.FilterType = Enum.RaycastFilterType.Include
    v4.RespectCanCollide = true
    local v5 = OverlapParams.new()
    v5.FilterType = Enum.RaycastFilterType.Include
    v5.RespectCanCollide = true
    v5.MaxParts = 1
    return {
        LastSpatial = 0,
        LastLog = (-1 / 0),
        LastCorrection = (-1 / 0),
        CorrectionRevision = 0,
        Samples = 0,
        Character = a1,
        Probe = a3,
        Rules = Rules.new(Config),
        Ray = v1,
        Overlap = v2,
        CollisionOverlap = v3,
        MapRay = v4,
        MapOverlap = v5,
        QuietUntil = a2 + Config.StartupGrace,
        TeleportId = a1:GetAttribute("TeleportID"),
    }
end

local function log(a1, a2, a3, a4) -- Line: 385 -- upvalues: Config (val)
    if Config.Debug and not (a2 - a1.LastLog < Config.LogInterval) then
        a1.LastLog = a2
        warn(string.format("[MovementGuard] %s | %s | samples=%d", a3, a4 or "", a1.Samples))
        return
    end
end

local function reconcile(a1, a2, a3) -- Line: 393 -- upvalues: Config (val), HttpService (val), Rules (val)
    local v1
    local Character = a1.Character
    local Attribute = Character:GetAttribute("TeleportID")
    if Attribute ~= nil and Attribute ~= a1.TeleportId then
        a1.TeleportId = Attribute
        a1.Offer = {Until = a3 + Config.ReconcileWindow}
    end
    local Attribute_2 = Character:GetAttribute("MovementCorrection")
    if Attribute_2 ~= a1.CorrectionRecord then
        a1.CorrectionRecord = Attribute_2
        v1 = false
        local v2 = nil
        if type(Attribute_2) == "string" and #Attribute_2 <= 2048 then
            local success, err = pcall(HttpService.JSONDecode, HttpService, Attribute_2)
            v1 = success
            v2 = err
        end
        if v1
            and type(v2) == "table"
            and Rules.finite(v2.Revision)
            and a1.CorrectionRevision < v2.Revision
            and Rules.finite(v2.Time)
            and type(v2.Position) == "table"
            and Rules.finite(v2.Position[1])
            and Rules.finite(v2.Position[2])
            and Rules.finite(v2.Position[3]) then
            a1.CorrectionRevision = v2.Revision
            a1.PendingCorrection = v2
        end
    end
    local PendingCorrection = a1.PendingCorrection
    if PendingCorrection and PendingCorrection.TeleportEpoch == Character:GetAttribute("MovementTeleportEpoch") then
        a1.PendingCorrection = nil
        v1 = Vector3.new(PendingCorrection.Position[1], PendingCorrection.Position[2], PendingCorrection.Position[3])
        if a1.LastCorrectionServerTime and PendingCorrection.Time <= a1.LastCorrectionServerTime then
            Character:PivotTo((Character:GetPivot()) + (v1 - a2.Position))
            a2.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            a1.LastCorrectionServerTime = nil
        end
        a1.Offer = {Until = a3 + Config.ReconcileWindow}
    end
    local Offer = a1.Offer
    if not Offer then
        return false
    end
    if Offer.Until < a3 then
        a1.Offer = nil
        return false
    end
    Rules.reset(a1.Rules)
    a1.Safe = nil
    a1.Support = nil
    a1.AirborneCarry = nil
    a1.QuietUntil = a3 + Config.PermissionGrace
    return true
end

local function hasObstruction(a1, a2, a3) -- Line: 444
    a1.Overlap.CollisionGroup = a2.CollisionGroup
    local Probe = a1.Probe
    Probe.Size = a2.Size * 0.7
    Probe.CFrame = a3
    Probe.Parent = a2.Parent
    for i, j in workspace:GetPartsInPart(Probe, a1.Overlap) do
        return true, j
    end
    return false, nil
end

local function collisionPart(a1) -- Line: 457
    local v1
    if not a1:IsA("Part") then
        v1 = a1:IsA("MeshPart") and a1.CollisionFidelity == Enum.CollisionFidelity.Box
    else
        v1 = true
        if a1.Shape ~= Enum.PartType.Block then
            v1 = a1:IsA("MeshPart") and a1.CollisionFidelity == Enum.CollisionFidelity.Box
        end
    end
    return v1
end

local function collisionOverlap(a1, a2) -- Line: 462
    local Islands = workspace:FindFirstChild("Islands")
    local Head = a1.Character:FindFirstChild("Head")
    if Islands and Head and Head:IsA("BasePart") then
        local v1, v2
        local CollisionOverlap = a1.CollisionOverlap
        CollisionOverlap.FilterDescendantsInstances = {Islands}
        CollisionOverlap.CollisionGroup = a2.CollisionGroup
        local v3 = {}
        for i, j in workspace:GetPartBoundsInBox(a2.CFrame, Vector3.new(1, 1, 0.5), CollisionOverlap) do
            if not j:IsA("Part") then
                v1 = j:IsA("MeshPart") and j.CollisionFidelity == Enum.CollisionFidelity.Box
            else
                v1 = true
                if j.Shape ~= Enum.PartType.Block then
                    v1 = j:IsA("MeshPart") and j.CollisionFidelity == Enum.CollisionFidelity.Box
                end
            end
            if v1 then
                v3[j] = true
            end
        end
        CollisionOverlap.CollisionGroup = Head.CollisionGroup
        local v4 = Head.CFrame * CFrame.new(0, -0.15 + Head.Size.Y * 0.05, 0)
        for k, n in workspace:GetPartBoundsInBox(v4, Head.Size * 0.1, CollisionOverlap) do
            if v3[n] then
                if not n:IsA("Part") then
                    v2 = n:IsA("MeshPart") and n.CollisionFidelity == Enum.CollisionFidelity.Box
                else
                    v2 = true
                    if n.Shape ~= Enum.PartType.Block then
                        v2 = n:IsA("MeshPart") and n.CollisionFidelity == Enum.CollisionFidelity.Box
                    end
                end
                if v2 then
                    return true, n
                end
            end
        end
        return false, nil
    end
    return false, nil
end

local function sampleSupport(a1, a2, a3, a4) -- Line: 487
    a1.Ray.CollisionGroup = a3.CollisionGroup
    local SeatPart = a2.SeatPart
    if not SeatPart and a4 then
        local v1 = math.clamp(a2.HipHeight + a3.Size.Y / 2 + 2, 3, 35)
        local v2 = workspace:Raycast(a3.Position, Vector3.new(0, -v1, 0), a1.Ray)
        if v2 and v2.Instance:IsA("BasePart") then
            SeatPart = v2.Instance
        end
    end
    return SeatPart
end

local function stationarySupport(a1, a2) -- Line: 500
    local Anchored = false
    if a1 ~= nil then
        Anchored = false
        if a1.Parent ~= nil then
            Anchored = a1.Anchored
            if Anchored then
                if a2 == nil then
                    Anchored = false
                    if a1.AssemblyLinearVelocity.Magnitude < 0.01 then
                        Anchored = a1.AssemblyAngularVelocity.Magnitude < 0.01
                    end
                else
                    Anchored = false
                    if a1.CFrame == a2 then
                        Anchored = false
                        if a1.AssemblyLinearVelocity.Magnitude < 0.01 then
                            Anchored = a1.AssemblyAngularVelocity.Magnitude < 0.01
                        end
                    end
                end
            end
        end
    end
    return Anchored
end

local function update(a1, a2, a3) -- Line: 506
    -- upvalues: Rules (val), Config (val), reconcile (val), context (val), sampleSupport (val), collisionOverlap (val)
    -- upvalues: bypassDetails (val)
    a1.DebugSnapshot = nil
    a1.DebugStatus = "Waiting for living character"
    local Character = a1.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
    local v1 = workspace
    if Character:IsDescendantOf(v1)
        and Humanoid
        and not (Humanoid.Health <= 0)
        and HumanoidRootPart
        and HumanoidRootPart:IsA("BasePart") then
        if HumanoidRootPart ~= a1.Root then
            a1.Root = HumanoidRootPart
            Rules.reset(a1.Rules)
            a1.Safe = nil
            a1.Support = nil
            a1.AirborneCarry = nil
            a1.QuietUntil = a3 + Config.StartupGrace
        end
        if Rules.finiteVector(HumanoidRootPart.Position)
            and Rules.finiteVector(HumanoidRootPart.AssemblyLinearVelocity) then
            if not reconcile(a1, HumanoidRootPart, a3) and not (a3 < a1.QuietUntil) then
                local AirborneCarry, Anchored, Anchored_2, Anchored_3, Anchored_4, Anchored_5, AssemblyLinearVelocity, CFrame_5, CollisionPart, CorrectionReason, EligibleSince, Last_2, LocomotionLimit, NextSupport, Position_6, Probe_2, Reason, Rules_2, Safe, Scale, Support, SupportFrame, SupportFrame_2, SupportFrame_3, SupportFrame_4, SupportFrame_5, Support_2, Support_3, Support_4, blocked, format_2, step, u209, u62, u740, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20
                u62, v19, v1, v20, v2 = context(a1, a2, Character, Humanoid, HumanoidRootPart, a3)
                if u62 == "external-control" then
                    a1.DebugStatus = "External control / data loading"
                    Rules.reset(a1.Rules)
                    a1.Safe = nil
                    a1.Support = nil
                    a1.AirborneCarry = nil
                    a1.QuietUntil = a3 + Config.PermissionGrace
                    return
                end
                local u81 = Humanoid.FloorMaterial ~= Enum.Material.Air
                local Last = a1.Rules.Last
                local v21 = true
                if u62 ~= "ground" then
                    v21 = u62 == "speed-allowance"
                end
                local v22 = true
                local v23 = a3 - a1.LastSpatial
                if not (Config.SpatialInterval <= v23) then
                    v22 = u81 and (not Last or not Last.Grounded)
                end
                if v22 then
                    a1.LastSpatial = a3
                    a1.NextSupport = sampleSupport(a1, Humanoid, HumanoidRootPart, u81)
                    local CFrame_2 = HumanoidRootPart.CFrame
                    a1.Overlap.CollisionGroup = HumanoidRootPart.CollisionGroup
                    local Probe = a1.Probe
                    Probe.Size = HumanoidRootPart.Size * 0.7
                    Probe.CFrame = CFrame_2
                    Probe.Parent = HumanoidRootPart.Parent
                    v6 = workspace
                    for i6, i7 in v6:GetPartsInPart(Probe, a1.Overlap) do
                        a1.Obstructed = true
                        a1.Obstruction = i7
                        v23, v4 = collisionOverlap(a1, HumanoidRootPart)
                        a1.Collision = v23
                        a1.CollisionPart = v4
                        NextSupport = a1.NextSupport
                        v4 = Vector3.new(0, 0, 0)
                        if not NextSupport or not NextSupport.Parent then
                            NextSupport = nil
                        elseif u81 then
                            if a1.Support ~= NextSupport then
                                a1.SupportVelocity = Vector3.new(0, 0, 0)
                            else
                                v4 = (NextSupport.CFrame:PointToWorldSpace(a1.SupportLocal)) - a1.SupportWorld
                                v5 = a3 - a1.SupportTime
                                a1.SupportVelocity = v5 > 0 and v5 <= Config.MaxSampleGap and v4 / v5 or Vector3.new(0, 0, 0)
                            end
                            a1.SupportTime = a3
                            a1.SupportLocal = NextSupport.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                            a1.SupportWorld = HumanoidRootPart.Position
                        elseif Humanoid.SeatPart ~= NextSupport then
                            NextSupport = nil
                        else
                            if a1.Support ~= NextSupport then
                                a1.SupportVelocity = Vector3.new(0, 0, 0)
                            else
                                v4 = (NextSupport.CFrame:PointToWorldSpace(a1.SupportLocal)) - a1.SupportWorld
                                v5 = a3 - a1.SupportTime
                                a1.SupportVelocity = v5 > 0 and v5 <= Config.MaxSampleGap and v4 / v5 or Vector3.new(0, 0, 0)
                            end
                            a1.SupportTime = a3
                            a1.SupportLocal = NextSupport.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                            a1.SupportWorld = HumanoidRootPart.Position
                        end
                        u209 = a1.Support ~= NextSupport
                        v6 = NextSupport
                        SupportFrame = not u209 and a1.SupportFrame or nil
                        Anchored = false
                        if v6 ~= nil then
                            Anchored = false
                            if v6.Parent ~= nil then
                                Anchored = v6.Anchored
                                if Anchored then
                                    if SupportFrame == nil then
                                        Anchored = false
                                        if v6.AssemblyLinearVelocity.Magnitude < 0.01 then
                                            Anchored = v6.AssemblyAngularVelocity.Magnitude < 0.01
                                        end
                                    else
                                        Anchored = false
                                        if v6.CFrame == SupportFrame then
                                            Anchored = false
                                            if v6.AssemblyLinearVelocity.Magnitude < 0.01 then
                                                Anchored = v6.AssemblyAngularVelocity.Magnitude < 0.01
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        Anchored_2 = u209
                        if Anchored_2 then
                            Anchored_2 = u81
                            if Anchored_2 then
                                Anchored_2 = Anchored
                                if Anchored_2 then
                                    Support = a1.Support
                                    SupportFrame_2 = a1.SupportFrame
                                    Anchored_2 = false
                                    if Support ~= nil then
                                        Anchored_2 = false
                                        if Support.Parent ~= nil then
                                            Anchored_2 = Support.Anchored
                                            if Anchored_2 then
                                                if SupportFrame_2 == nil then
                                                    Anchored_2 = false
                                                    if Support.AssemblyLinearVelocity.Magnitude < 0.01 then
                                                        Anchored_2 = Support.AssemblyAngularVelocity.Magnitude < 0.01
                                                    end
                                                else
                                                    Anchored_2 = false
                                                    if Support.CFrame == SupportFrame_2 then
                                                        Anchored_2 = false
                                                        if Support.AssemblyLinearVelocity.Magnitude < 0.01 then
                                                            Anchored_2 = Support.AssemblyAngularVelocity.Magnitude < 0.01
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        Anchored_3 = v21
                        if Anchored_3 then
                            if NextSupport ~= nil then
                                Anchored_3 = false
                                if a1.Support == nil then
                                    Anchored_3 = Anchored and Last and Last.CanCorrect
                                end
                            else
                                Support_2 = a1.Support
                                SupportFrame_3 = a1.SupportFrame
                                Anchored_3 = false
                                if Support_2 ~= nil then
                                    Anchored_3 = false
                                    if Support_2.Parent ~= nil then
                                        Anchored_3 = Support_2.Anchored
                                        if Anchored_3 then
                                            if SupportFrame_3 == nil then
                                                Anchored_3 = false
                                                if Support_2.AssemblyLinearVelocity.Magnitude < 0.01 then
                                                    Anchored_3 = Support_2.AssemblyAngularVelocity.Magnitude < 0.01
                                                end
                                            else
                                                Anchored_3 = false
                                                if Support_2.CFrame == SupportFrame_3 then
                                                    Anchored_3 = false
                                                    if Support_2.AssemblyLinearVelocity.Magnitude < 0.01 then
                                                        Anchored_3 = Support_2.AssemblyAngularVelocity.Magnitude < 0.01
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                                if not Anchored_3 then
                                    Anchored_3 = false
                                    if a1.Support == nil then
                                        Anchored_3 = Anchored and Last and Last.CanCorrect
                                    end
                                end
                            end
                        end
                        v8 = u209 and not Anchored_2 and not Anchored_3
                        if u81 then
                            a1.AirborneCarry = nil
                        elseif Last and Last.Grounded then
                            v9 = {
                                Velocity = a1.Support and a1.SupportVelocity or Vector3.new(0, 0, 0),
                            }
                            LocomotionLimit = Last.LocomotionLimit or a1.LocomotionLimit
                            v9.Limit = LocomotionLimit
                            v9.Time = a3
                            a1.AirborneCarry = v9
                        end
                        a1.Support = NextSupport
                        CFrame_5 = NextSupport and NextSupport.CFrame
                        a1.SupportFrame = CFrame_5
                        if v8 then
                            a1.Safe = nil
                        end
                        v7 = 0
                        AirborneCarry = a1.AirborneCarry
                        if AirborneCarry then
                            v19 = math.max(v19, AirborneCarry.Limit)
                            v19 = v19 + Vector3.new(AirborneCarry.Velocity.X, 0, AirborneCarry.Velocity.Z).Magnitude
                            v7 = math.max(0, AirborneCarry.Velocity.Y - (math.clamp(workspace.Gravity, 80, 200)) * (a3 - AirborneCarry.Time))
                        end
                        v6 = v21 and not v8
                        step = Rules.step
                        Rules_2 = a1.Rules
                        v10 = {
                            Time = a3,
                            Position = HumanoidRootPart.Position,
                            Velocity = HumanoidRootPart.AssemblyLinearVelocity,
                            SupportDelta = v4,
                            Grounded = u81,
                            Limit = v19,
                            LocomotionLimit = a1.LocomotionLimit,
                            SpeedGrant = v2,
                            Context = u62,
                            CanCorrect = v6,
                            AirAllowed = v1,
                            UpwardAllowance = v7,
                            NoclipAllowed = v20,
                            SpatialChecked = v22,
                            Obstructed = a1.Collision,
                        }
                        u740 = step(Rules_2, v10)
                        a1.Samples = a1.Samples + 1
                        if game.PlaceId == 5875630735 then
                            u740.Limit = v19
                            u740.Context = u62
                            u740.Grounded = u81
                            a1.DebugSnapshot = u740
                            a1.DebugStatus = if not v6 then "Diagnostic only" else "Monitoring"
                        end
                        if u740.Reason == "sample-gap" then
                            a1.AirborneCarry = nil
                            a1.Support = nil
                        end
                        if u740.ClearSafe then
                            a1.Safe = nil
                        end
                        if u740.Reason then
                            v7 = string.format("context=%s speed=%.1f limit=%.1f mode=%s", u62, u740.Speed or 0, v19, Config.Mode)
                            if u740.Reason == "collision" then
                                CollisionPart = a1.CollisionPart
                                format_2 = string.format
                                v11 = tostring((Character:GetAttribute("NoclipBypass")))
                                v12 = tostring(v20)
                                v13 = tostring(u81)
                                Scale = Character:GetScale()
                                v14 = tostring(HumanoidRootPart.Size)
                                v15 = tostring(HumanoidRootPart.Position)
                                v16 = CollisionPart and string.sub(CollisionPart:GetFullName(), 1, 256) or "none"
                                v17 = CollisionPart and tostring(CollisionPart.Size) or "none"
                                v18 = CollisionPart and tostring(CollisionPart.Position) or "none"
                                v7 = v7 .. format_2(
                                    " noclip=%s allowance=%s grounded=%s scale=%.2f rootSize=%s rootPosition=%s part=%s partSize=%s partPosition=%s",
                                    v11,
                                    v12,
                                    v13,
                                    Scale,
                                    v14,
                                    v15,
                                    v16,
                                    v17,
                                    v18
                                )
                            end
                            Reason = u740.Reason
                            if Config.Debug and not (a3 - a1.LastLog < Config.LogInterval) then
                                a1.LastLog = a3
                                warn(string.format("[MovementGuard] %s | %s | samples=%d", Reason, v7 or "", a1.Samples))
                            end
                        end
                        if u740.Promote and NextSupport and not a1.Obstructed then
                            v9 = {
                                Position = HumanoidRootPart.Position,
                                Time = a3,
                                Support = NextSupport,
                                SupportFrame = NextSupport.CFrame,
                            }
                            v10 = NextSupport and NextSupport.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                            v9.LocalPosition = v10
                            a1.Safe = v9
                        end
                        if not a1.Safe
                            and v6
                            and u81
                            and Anchored
                            and not a1.Obstructed
                            and v22
                            and u740.Reason ~= "displacement"
                            and u740.Reason ~= "sample-gap" then
                            if not a1.Rules.Pending or a1.Rules.Pending.Reason ~= "displacement" then
                                a1.Safe = {
                                    Position = HumanoidRootPart.Position,
                                    Time = a3,
                                    Support = NextSupport,
                                    SupportFrame = NextSupport.CFrame,
                                    LocalPosition = NextSupport.CFrame:PointToObjectSpace(HumanoidRootPart.Position),
                                }
                            end
                        end
                        Safe = a1.Safe

                        function blocked(a1_2) -- Line: 667
                            -- upvalues: a1 (val), Config (upval), u740 (val), a3 (val), u62 (val), u81 (val)
                            -- upvalues: NextSupport (ref), u209 (val), Safe (val), bypassDetails (upval)
                            -- upvalues: Character (val)
                            a1.DebugStatus = a1_2
                            if Config.Debug then
                                if u740.Reason == "speed" or u740.Reason == "displacement" or a1.Rules.Pending then
                                    local v1 = a3 - (a1.LastBlockedLog or (-1 / 0))
                                    if Config.LogInterval <= v1 then
                                        a1.LastBlockedLog = a3
                                        v1 = warn
                                        local format = string.format
                                        local v2 = tostring(u81)
                                        local v3 = tostring(u209)
                                        local v4 = tostring(a1.Obstructed)
                                        local v5 = Safe and a3 - Safe.Time or -1
                                        local v6 = a1.Rules.EligibleSince and a3 - a1.Rules.EligibleSince or -1
                                        v1(format(
                                            "[MovementGuard] correction-blocked | %s | context=%s grounded=%s support=%s changedSupport=%s obstructed=%s safeAge=%.2f eligibleAge=%.2f bypasses=%s",
                                            a1_2,
                                            u62,
                                            v2,
                                            NextSupport and NextSupport:GetFullName() or "none",
                                            v3,
                                            v4,
                                            v5,
                                            v6,
                                            (bypassDetails(Character))
                                        ))
                                    end
                                end
                            end
                        end

                        if Config.Mode ~= "Correct" then
                            blocked("Observe mode")
                            return
                        end
                        if not v6 then
                            blocked(if u81 then if not u209 then "Diagnostic context: " .. u62 else "Ground support changed" else "Not grounded")
                            return
                        end
                        if not Safe then
                            blocked("No earned safe position")
                            return
                        end
                        v9 = a3 - Safe.Time
                        if Config.SafePositionLifetime < v9 then
                            Support_3 = Safe.Support
                            SupportFrame_4 = Safe.SupportFrame
                            Anchored_4 = false
                            if Support_3 ~= nil then
                                Anchored_4 = false
                                if Support_3.Parent ~= nil then
                                    Anchored_4 = Support_3.Anchored
                                    if Anchored_4 then
                                        if SupportFrame_4 == nil then
                                            Anchored_4 = false
                                            if Support_3.AssemblyLinearVelocity.Magnitude < 0.01 then
                                                Anchored_4 = Support_3.AssemblyAngularVelocity.Magnitude < 0.01
                                            end
                                        else
                                            Anchored_4 = false
                                            if Support_3.CFrame == SupportFrame_4 then
                                                Anchored_4 = false
                                                if Support_3.AssemblyLinearVelocity.Magnitude < 0.01 then
                                                    Anchored_4 = Support_3.AssemblyAngularVelocity.Magnitude < 0.01
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            if not Anchored_4 then
                                blocked("Safe position expired")
                                a1.Safe = nil
                                return
                            end
                        end
                        if not u740.Correct then
                            blocked(if not a1.Rules.Pending then "Collecting evidence" else "Permission grace pending")
                            return
                        end
                        if a3 - a1.LastCorrection < Config.CorrectionCooldown then
                            blocked("Correction cooldown")
                            return
                        end
                        Position_6 = Safe.Position
                        if not Safe.Support then
                            if not Rules.finiteVector(Position_6) then
                                blocked("Invalid rollback position")
                                return
                            end
                            v21 = (CFrame.new(Position_6)) * HumanoidRootPart.CFrame.Rotation
                            v3 = workspace:Raycast(
                                Position_6,
                                Vector3.new(0, -math.clamp(Humanoid.HipHeight + HumanoidRootPart.Size.Y / 2 + 2, 3, 35), 0),
                                a1.Ray
                            )
                            if v3 and v3.Instance == Safe.Support then
                                a1.Overlap.CollisionGroup = HumanoidRootPart.CollisionGroup
                                Probe_2 = a1.Probe
                                Probe_2.Size = HumanoidRootPart.Size * 0.7
                                Probe_2.CFrame = v21
                                Probe_2.Parent = HumanoidRootPart.Parent
                                for i10, i11 in workspace:GetPartsInPart(Probe_2, a1.Overlap) do
                                    if true then
                                        blocked("Destination blocked / unsupported")
                                        a1.Safe = nil
                                        return
                                    end
                                    Character:PivotTo((Character:GetPivot()) + (Position_6 - HumanoidRootPart.Position))
                                    AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
                                    v21 = Safe.Support:GetVelocityAtPosition(Position_6)
                                    HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(v21.X, AssemblyLinearVelocity.Y, v21.Z)
                                    a1.LastCorrection = a3
                                    a1.LastCorrectionServerTime = workspace:GetServerTimeNow()
                                    a1.DebugStatus = "CORRECTED"
                                    Safe.Time = a3
                                    Safe.Position = Position_6
                                    Safe.SupportFrame = Safe.Support.CFrame
                                    a1.Support = Safe.Support
                                    a1.NextSupport = Safe.Support
                                    a1.SupportFrame = Safe.Support.CFrame
                                    a1.SupportLocal = Safe.Support.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                                    a1.SupportWorld = HumanoidRootPart.Position
                                    a1.SupportTime = a3
                                    a1.AirborneCarry = nil
                                    Last_2 = a1.Rules.Last
                                    EligibleSince = a1.Rules.EligibleSince
                                    Rules.reset(a1.Rules)
                                    Last_2.Position = HumanoidRootPart.Position
                                    Last_2.Velocity = HumanoidRootPart.AssemblyLinearVelocity
                                    a1.Rules.Last = Last_2
                                    a1.Rules.EligibleSince = EligibleSince
                                    CorrectionReason = u740.CorrectionReason
                                    if Config.Debug and not (a3 - a1.LastLog < Config.LogInterval) then
                                        a1.LastLog = a3
                                        warn(string.format(
                                            "[MovementGuard] %s | %s | samples=%d",
                                            "corrected",
                                            CorrectionReason or "",
                                            a1.Samples
                                        ))
                                    end
                                    v6 = a2:FindFirstChild("PlayerScripts")
                                    v22 = v6 and v6:FindFirstChild("LocalNotification")
                                    if v22 then
                                        v22:Fire((string.format("<Color=Red>Movement corrected | Speed: %d", (math.round(u740.Speed or 0)))))
                                    end
                                    return
                                end
                                if true then
                                    Character:PivotTo((Character:GetPivot()) + (Position_6 - HumanoidRootPart.Position))
                                    AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
                                    v21 = Safe.Support:GetVelocityAtPosition(Position_6)
                                    HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(v21.X, AssemblyLinearVelocity.Y, v21.Z)
                                    a1.LastCorrection = a3
                                    a1.LastCorrectionServerTime = workspace:GetServerTimeNow()
                                    a1.DebugStatus = "CORRECTED"
                                    Safe.Time = a3
                                    Safe.Position = Position_6
                                    Safe.SupportFrame = Safe.Support.CFrame
                                    a1.Support = Safe.Support
                                    a1.NextSupport = Safe.Support
                                    a1.SupportFrame = Safe.Support.CFrame
                                    a1.SupportLocal = Safe.Support.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                                    a1.SupportWorld = HumanoidRootPart.Position
                                    a1.SupportTime = a3
                                    a1.AirborneCarry = nil
                                    Last_2 = a1.Rules.Last
                                    EligibleSince = a1.Rules.EligibleSince
                                    Rules.reset(a1.Rules)
                                    Last_2.Position = HumanoidRootPart.Position
                                    Last_2.Velocity = HumanoidRootPart.AssemblyLinearVelocity
                                    a1.Rules.Last = Last_2
                                    a1.Rules.EligibleSince = EligibleSince
                                    CorrectionReason = u740.CorrectionReason
                                    if Config.Debug and not (a3 - a1.LastLog < Config.LogInterval) then
                                        a1.LastLog = a3
                                        warn(string.format(
                                            "[MovementGuard] %s | %s | samples=%d",
                                            "corrected",
                                            CorrectionReason or "",
                                            a1.Samples
                                        ))
                                    end
                                    v6 = a2:FindFirstChild("PlayerScripts")
                                    v22 = v6 and v6:FindFirstChild("LocalNotification")
                                    if v22 then
                                        v22:Fire((string.format("<Color=Red>Movement corrected | Speed: %d", (math.round(u740.Speed or 0)))))
                                    end
                                    return
                                end
                            end
                            blocked("Destination blocked / unsupported")
                            a1.Safe = nil
                            return
                        end
                        if not Safe.Support.Parent then
                            blocked("Safe support changed / removed")
                            return
                        end
                        if Safe.Support ~= NextSupport then
                            Support_4 = Safe.Support
                            SupportFrame_5 = Safe.SupportFrame
                            Anchored_5 = false
                            if Support_4 ~= nil then
                                Anchored_5 = false
                                if Support_4.Parent ~= nil then
                                    Anchored_5 = Support_4.Anchored
                                    if Anchored_5 then
                                        if SupportFrame_5 == nil then
                                            Anchored_5 = false
                                            if Support_4.AssemblyLinearVelocity.Magnitude < 0.01 then
                                                Anchored_5 = Support_4.AssemblyAngularVelocity.Magnitude < 0.01
                                            end
                                        else
                                            Anchored_5 = false
                                            if Support_4.CFrame == SupportFrame_5 then
                                                Anchored_5 = false
                                                if Support_4.AssemblyLinearVelocity.Magnitude < 0.01 then
                                                    Anchored_5 = Support_4.AssemblyAngularVelocity.Magnitude < 0.01
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                            if not Anchored_5 then
                                blocked("Safe support changed / removed")
                                return
                            end
                        end
                        if not Rules.finiteVector((Safe.Support.CFrame:PointToWorldSpace(Safe.LocalPosition))) then
                            blocked("Invalid rollback position")
                            return
                        end
                        v21 = (CFrame.new(Position_6)) * HumanoidRootPart.CFrame.Rotation
                        v3 = workspace:Raycast(
                            Position_6,
                            Vector3.new(0, -math.clamp(Humanoid.HipHeight + HumanoidRootPart.Size.Y / 2 + 2, 3, 35), 0),
                            a1.Ray
                        )
                        if v3 and v3.Instance == Safe.Support then
                            a1.Overlap.CollisionGroup = HumanoidRootPart.CollisionGroup
                            Probe_2 = a1.Probe
                            Probe_2.Size = HumanoidRootPart.Size * 0.7
                            Probe_2.CFrame = v21
                            Probe_2.Parent = HumanoidRootPart.Parent
                            for i8, i9 in workspace:GetPartsInPart(Probe_2, a1.Overlap) do
                                if true then
                                    blocked("Destination blocked / unsupported")
                                    a1.Safe = nil
                                    return
                                end
                                Character:PivotTo((Character:GetPivot()) + (Position_6 - HumanoidRootPart.Position))
                                AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
                                v21 = Safe.Support:GetVelocityAtPosition(Position_6)
                                HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(v21.X, AssemblyLinearVelocity.Y, v21.Z)
                                a1.LastCorrection = a3
                                a1.LastCorrectionServerTime = workspace:GetServerTimeNow()
                                a1.DebugStatus = "CORRECTED"
                                Safe.Time = a3
                                Safe.Position = Position_6
                                Safe.SupportFrame = Safe.Support.CFrame
                                a1.Support = Safe.Support
                                a1.NextSupport = Safe.Support
                                a1.SupportFrame = Safe.Support.CFrame
                                a1.SupportLocal = Safe.Support.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                                a1.SupportWorld = HumanoidRootPart.Position
                                a1.SupportTime = a3
                                a1.AirborneCarry = nil
                                Last_2 = a1.Rules.Last
                                EligibleSince = a1.Rules.EligibleSince
                                Rules.reset(a1.Rules)
                                Last_2.Position = HumanoidRootPart.Position
                                Last_2.Velocity = HumanoidRootPart.AssemblyLinearVelocity
                                a1.Rules.Last = Last_2
                                a1.Rules.EligibleSince = EligibleSince
                                CorrectionReason = u740.CorrectionReason
                                if Config.Debug and not (a3 - a1.LastLog < Config.LogInterval) then
                                    a1.LastLog = a3
                                    warn(string.format("[MovementGuard] %s | %s | samples=%d", "corrected", CorrectionReason or "", a1.Samples))
                                end
                                v6 = a2:FindFirstChild("PlayerScripts")
                                v22 = v6 and v6:FindFirstChild("LocalNotification")
                                if v22 then
                                    v22:Fire((string.format("<Color=Red>Movement corrected | Speed: %d", (math.round(u740.Speed or 0)))))
                                end
                                return
                            end
                            if true then
                                Character:PivotTo((Character:GetPivot()) + (Position_6 - HumanoidRootPart.Position))
                                AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
                                v21 = Safe.Support:GetVelocityAtPosition(Position_6)
                                HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(v21.X, AssemblyLinearVelocity.Y, v21.Z)
                                a1.LastCorrection = a3
                                a1.LastCorrectionServerTime = workspace:GetServerTimeNow()
                                a1.DebugStatus = "CORRECTED"
                                Safe.Time = a3
                                Safe.Position = Position_6
                                Safe.SupportFrame = Safe.Support.CFrame
                                a1.Support = Safe.Support
                                a1.NextSupport = Safe.Support
                                a1.SupportFrame = Safe.Support.CFrame
                                a1.SupportLocal = Safe.Support.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                                a1.SupportWorld = HumanoidRootPart.Position
                                a1.SupportTime = a3
                                a1.AirborneCarry = nil
                                Last_2 = a1.Rules.Last
                                EligibleSince = a1.Rules.EligibleSince
                                Rules.reset(a1.Rules)
                                Last_2.Position = HumanoidRootPart.Position
                                Last_2.Velocity = HumanoidRootPart.AssemblyLinearVelocity
                                a1.Rules.Last = Last_2
                                a1.Rules.EligibleSince = EligibleSince
                                CorrectionReason = u740.CorrectionReason
                                if Config.Debug and not (a3 - a1.LastLog < Config.LogInterval) then
                                    a1.LastLog = a3
                                    warn(string.format("[MovementGuard] %s | %s | samples=%d", "corrected", CorrectionReason or "", a1.Samples))
                                end
                                v6 = a2:FindFirstChild("PlayerScripts")
                                v22 = v6 and v6:FindFirstChild("LocalNotification")
                                if v22 then
                                    v22:Fire((string.format("<Color=Red>Movement corrected | Speed: %d", (math.round(u740.Speed or 0)))))
                                end
                                return
                            end
                        end
                        blocked("Destination blocked / unsupported")
                        a1.Safe = nil
                        return
                    end
                    a1.Obstructed = false
                    a1.Obstruction = nil
                    v23, v4 = collisionOverlap(a1, HumanoidRootPart)
                    a1.Collision = v23
                    a1.CollisionPart = v4
                end
                NextSupport = a1.NextSupport
                v4 = Vector3.new(0, 0, 0)
                if not NextSupport or not NextSupport.Parent then
                    NextSupport = nil
                elseif u81 then
                    if a1.Support ~= NextSupport then
                        a1.SupportVelocity = Vector3.new(0, 0, 0)
                    else
                        v4 = (NextSupport.CFrame:PointToWorldSpace(a1.SupportLocal)) - a1.SupportWorld
                        v5 = a3 - a1.SupportTime
                        a1.SupportVelocity = v5 > 0 and v5 <= Config.MaxSampleGap and v4 / v5 or Vector3.new(0, 0, 0)
                    end
                    a1.SupportTime = a3
                    a1.SupportLocal = NextSupport.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                    a1.SupportWorld = HumanoidRootPart.Position
                elseif Humanoid.SeatPart ~= NextSupport then
                    NextSupport = nil
                else
                    if a1.Support ~= NextSupport then
                        a1.SupportVelocity = Vector3.new(0, 0, 0)
                    else
                        v4 = (NextSupport.CFrame:PointToWorldSpace(a1.SupportLocal)) - a1.SupportWorld
                        v5 = a3 - a1.SupportTime
                        a1.SupportVelocity = v5 > 0 and v5 <= Config.MaxSampleGap and v4 / v5 or Vector3.new(0, 0, 0)
                    end
                    a1.SupportTime = a3
                    a1.SupportLocal = NextSupport.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                    a1.SupportWorld = HumanoidRootPart.Position
                end
                u209 = a1.Support ~= NextSupport
                v6 = NextSupport
                SupportFrame = not u209 and a1.SupportFrame or nil
                Anchored = false
                if v6 ~= nil then
                    Anchored = false
                    if v6.Parent ~= nil then
                        Anchored = v6.Anchored
                        if Anchored then
                            if SupportFrame == nil then
                                Anchored = false
                                if v6.AssemblyLinearVelocity.Magnitude < 0.01 then
                                    Anchored = v6.AssemblyAngularVelocity.Magnitude < 0.01
                                end
                            else
                                Anchored = false
                                if v6.CFrame == SupportFrame then
                                    Anchored = false
                                    if v6.AssemblyLinearVelocity.Magnitude < 0.01 then
                                        Anchored = v6.AssemblyAngularVelocity.Magnitude < 0.01
                                    end
                                end
                            end
                        end
                    end
                end
                Anchored_2 = u209
                if Anchored_2 then
                    Anchored_2 = u81
                    if Anchored_2 then
                        Anchored_2 = Anchored
                        if Anchored_2 then
                            Support = a1.Support
                            SupportFrame_2 = a1.SupportFrame
                            Anchored_2 = false
                            if Support ~= nil then
                                Anchored_2 = false
                                if Support.Parent ~= nil then
                                    Anchored_2 = Support.Anchored
                                    if Anchored_2 then
                                        if SupportFrame_2 == nil then
                                            Anchored_2 = false
                                            if Support.AssemblyLinearVelocity.Magnitude < 0.01 then
                                                Anchored_2 = Support.AssemblyAngularVelocity.Magnitude < 0.01
                                            end
                                        else
                                            Anchored_2 = false
                                            if Support.CFrame == SupportFrame_2 then
                                                Anchored_2 = false
                                                if Support.AssemblyLinearVelocity.Magnitude < 0.01 then
                                                    Anchored_2 = Support.AssemblyAngularVelocity.Magnitude < 0.01
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                Anchored_3 = v21
                if Anchored_3 then
                    if NextSupport ~= nil then
                        Anchored_3 = false
                        if a1.Support == nil then
                            Anchored_3 = Anchored and Last and Last.CanCorrect
                        end
                    else
                        Support_2 = a1.Support
                        SupportFrame_3 = a1.SupportFrame
                        Anchored_3 = false
                        if Support_2 ~= nil then
                            Anchored_3 = false
                            if Support_2.Parent ~= nil then
                                Anchored_3 = Support_2.Anchored
                                if Anchored_3 then
                                    if SupportFrame_3 == nil then
                                        Anchored_3 = false
                                        if Support_2.AssemblyLinearVelocity.Magnitude < 0.01 then
                                            Anchored_3 = Support_2.AssemblyAngularVelocity.Magnitude < 0.01
                                        end
                                    else
                                        Anchored_3 = false
                                        if Support_2.CFrame == SupportFrame_3 then
                                            Anchored_3 = false
                                            if Support_2.AssemblyLinearVelocity.Magnitude < 0.01 then
                                                Anchored_3 = Support_2.AssemblyAngularVelocity.Magnitude < 0.01
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        if not Anchored_3 then
                            Anchored_3 = false
                            if a1.Support == nil then
                                Anchored_3 = Anchored and Last and Last.CanCorrect
                            end
                        end
                    end
                end
                v8 = u209 and not Anchored_2 and not Anchored_3
                if u81 then
                    a1.AirborneCarry = nil
                elseif Last and Last.Grounded then
                    v9 = {
                        Velocity = a1.Support and a1.SupportVelocity or Vector3.new(0, 0, 0),
                    }
                    LocomotionLimit = Last.LocomotionLimit or a1.LocomotionLimit
                    v9.Limit = LocomotionLimit
                    v9.Time = a3
                    a1.AirborneCarry = v9
                end
                a1.Support = NextSupport
                CFrame_5 = NextSupport and NextSupport.CFrame
                a1.SupportFrame = CFrame_5
                if v8 then
                    a1.Safe = nil
                end
                v7 = 0
                AirborneCarry = a1.AirborneCarry
                if AirborneCarry then
                    v19 = math.max(v19, AirborneCarry.Limit)
                    v19 = v19 + Vector3.new(AirborneCarry.Velocity.X, 0, AirborneCarry.Velocity.Z).Magnitude
                    v7 = math.max(0, AirborneCarry.Velocity.Y - (math.clamp(workspace.Gravity, 80, 200)) * (a3 - AirborneCarry.Time))
                end
                v6 = v21 and not v8
                step = Rules.step
                Rules_2 = a1.Rules
                v10 = {
                    Time = a3,
                    Position = HumanoidRootPart.Position,
                    Velocity = HumanoidRootPart.AssemblyLinearVelocity,
                    SupportDelta = v4,
                    Grounded = u81,
                    Limit = v19,
                    LocomotionLimit = a1.LocomotionLimit,
                    SpeedGrant = v2,
                    Context = u62,
                    CanCorrect = v6,
                    AirAllowed = v1,
                    UpwardAllowance = v7,
                    NoclipAllowed = v20,
                    SpatialChecked = v22,
                    Obstructed = a1.Collision,
                }
                u740 = step(Rules_2, v10)
                a1.Samples = a1.Samples + 1
                if game.PlaceId == 5875630735 then
                    u740.Limit = v19
                    u740.Context = u62
                    u740.Grounded = u81
                    a1.DebugSnapshot = u740
                    a1.DebugStatus = if not v6 then "Diagnostic only" else "Monitoring"
                end
                if u740.Reason == "sample-gap" then
                    a1.AirborneCarry = nil
                    a1.Support = nil
                end
                if u740.ClearSafe then
                    a1.Safe = nil
                end
                if u740.Reason then
                    v7 = string.format("context=%s speed=%.1f limit=%.1f mode=%s", u62, u740.Speed or 0, v19, Config.Mode)
                    if u740.Reason == "collision" then
                        CollisionPart = a1.CollisionPart
                        format_2 = string.format
                        v11 = tostring((Character:GetAttribute("NoclipBypass")))
                        v12 = tostring(v20)
                        v13 = tostring(u81)
                        Scale = Character:GetScale()
                        v14 = tostring(HumanoidRootPart.Size)
                        v15 = tostring(HumanoidRootPart.Position)
                        v16 = CollisionPart and string.sub(CollisionPart:GetFullName(), 1, 256) or "none"
                        v17 = CollisionPart and tostring(CollisionPart.Size) or "none"
                        v18 = CollisionPart and tostring(CollisionPart.Position) or "none"
                        v7 = v7 .. format_2(
                            " noclip=%s allowance=%s grounded=%s scale=%.2f rootSize=%s rootPosition=%s part=%s partSize=%s partPosition=%s",
                            v11,
                            v12,
                            v13,
                            Scale,
                            v14,
                            v15,
                            v16,
                            v17,
                            v18
                        )
                    end
                    Reason = u740.Reason
                    if Config.Debug and not (a3 - a1.LastLog < Config.LogInterval) then
                        a1.LastLog = a3
                        warn(string.format("[MovementGuard] %s | %s | samples=%d", Reason, v7 or "", a1.Samples))
                    end
                end
                if u740.Promote and NextSupport and not a1.Obstructed then
                    v9 = {
                        Position = HumanoidRootPart.Position,
                        Time = a3,
                        Support = NextSupport,
                        SupportFrame = NextSupport.CFrame,
                    }
                    v10 = NextSupport and NextSupport.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                    v9.LocalPosition = v10
                    a1.Safe = v9
                end
                if not a1.Safe
                    and v6
                    and u81
                    and Anchored
                    and not a1.Obstructed
                    and v22
                    and u740.Reason ~= "displacement"
                    and u740.Reason ~= "sample-gap" then
                    if not a1.Rules.Pending or a1.Rules.Pending.Reason ~= "displacement" then
                        a1.Safe = {
                            Position = HumanoidRootPart.Position,
                            Time = a3,
                            Support = NextSupport,
                            SupportFrame = NextSupport.CFrame,
                            LocalPosition = NextSupport.CFrame:PointToObjectSpace(HumanoidRootPart.Position),
                        }
                    end
                end
                Safe = a1.Safe

                function blocked(a1_2) -- Line: 667
                    -- upvalues: a1 (val), Config (upval), u740 (val), a3 (val), u62 (val), u81 (val), NextSupport (ref)
                    -- upvalues: u209 (val), Safe (val), bypassDetails (upval), Character (val)
                    a1.DebugStatus = a1_2
                    if Config.Debug then
                        if u740.Reason == "speed" or u740.Reason == "displacement" or a1.Rules.Pending then
                            local v1 = a3 - (a1.LastBlockedLog or (-1 / 0))
                            if Config.LogInterval <= v1 then
                                a1.LastBlockedLog = a3
                                v1 = warn
                                local format = string.format
                                local v2 = tostring(u81)
                                local v3 = tostring(u209)
                                local v4 = tostring(a1.Obstructed)
                                local v5 = Safe and a3 - Safe.Time or -1
                                local v6 = a1.Rules.EligibleSince and a3 - a1.Rules.EligibleSince or -1
                                v1(format(
                                    "[MovementGuard] correction-blocked | %s | context=%s grounded=%s support=%s changedSupport=%s obstructed=%s safeAge=%.2f eligibleAge=%.2f bypasses=%s",
                                    a1_2,
                                    u62,
                                    v2,
                                    NextSupport and NextSupport:GetFullName() or "none",
                                    v3,
                                    v4,
                                    v5,
                                    v6,
                                    (bypassDetails(Character))
                                ))
                            end
                        end
                    end
                end

                if Config.Mode ~= "Correct" then
                    blocked("Observe mode")
                    return
                end
                if not v6 then
                    blocked(if u81 then if not u209 then "Diagnostic context: " .. u62 else "Ground support changed" else "Not grounded")
                    return
                end
                if not Safe then
                    blocked("No earned safe position")
                    return
                end
                v9 = a3 - Safe.Time
                if Config.SafePositionLifetime < v9 then
                    Support_3 = Safe.Support
                    SupportFrame_4 = Safe.SupportFrame
                    Anchored_4 = false
                    if Support_3 ~= nil then
                        Anchored_4 = false
                        if Support_3.Parent ~= nil then
                            Anchored_4 = Support_3.Anchored
                            if Anchored_4 then
                                if SupportFrame_4 == nil then
                                    Anchored_4 = false
                                    if Support_3.AssemblyLinearVelocity.Magnitude < 0.01 then
                                        Anchored_4 = Support_3.AssemblyAngularVelocity.Magnitude < 0.01
                                    end
                                else
                                    Anchored_4 = false
                                    if Support_3.CFrame == SupportFrame_4 then
                                        Anchored_4 = false
                                        if Support_3.AssemblyLinearVelocity.Magnitude < 0.01 then
                                            Anchored_4 = Support_3.AssemblyAngularVelocity.Magnitude < 0.01
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if not Anchored_4 then
                        blocked("Safe position expired")
                        a1.Safe = nil
                        return
                    end
                end
                if not u740.Correct then
                    blocked(if not a1.Rules.Pending then "Collecting evidence" else "Permission grace pending")
                    return
                end
                if a3 - a1.LastCorrection < Config.CorrectionCooldown then
                    blocked("Correction cooldown")
                    return
                end
                Position_6 = Safe.Position
                if not Safe.Support then
                    if not Rules.finiteVector(Position_6) then
                        blocked("Invalid rollback position")
                        return
                    end
                    v21 = (CFrame.new(Position_6)) * HumanoidRootPart.CFrame.Rotation
                    v3 = workspace:Raycast(
                        Position_6,
                        Vector3.new(0, -math.clamp(Humanoid.HipHeight + HumanoidRootPart.Size.Y / 2 + 2, 3, 35), 0),
                        a1.Ray
                    )
                    if v3 and v3.Instance == Safe.Support then
                        a1.Overlap.CollisionGroup = HumanoidRootPart.CollisionGroup
                        Probe_2 = a1.Probe
                        Probe_2.Size = HumanoidRootPart.Size * 0.7
                        Probe_2.CFrame = v21
                        Probe_2.Parent = HumanoidRootPart.Parent
                        for i14, i15 in workspace:GetPartsInPart(Probe_2, a1.Overlap) do
                            if true then
                                blocked("Destination blocked / unsupported")
                                a1.Safe = nil
                                return
                            end
                            Character:PivotTo((Character:GetPivot()) + (Position_6 - HumanoidRootPart.Position))
                            AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
                            v21 = Safe.Support:GetVelocityAtPosition(Position_6)
                            HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(v21.X, AssemblyLinearVelocity.Y, v21.Z)
                            a1.LastCorrection = a3
                            a1.LastCorrectionServerTime = workspace:GetServerTimeNow()
                            a1.DebugStatus = "CORRECTED"
                            Safe.Time = a3
                            Safe.Position = Position_6
                            Safe.SupportFrame = Safe.Support.CFrame
                            a1.Support = Safe.Support
                            a1.NextSupport = Safe.Support
                            a1.SupportFrame = Safe.Support.CFrame
                            a1.SupportLocal = Safe.Support.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                            a1.SupportWorld = HumanoidRootPart.Position
                            a1.SupportTime = a3
                            a1.AirborneCarry = nil
                            Last_2 = a1.Rules.Last
                            EligibleSince = a1.Rules.EligibleSince
                            Rules.reset(a1.Rules)
                            Last_2.Position = HumanoidRootPart.Position
                            Last_2.Velocity = HumanoidRootPart.AssemblyLinearVelocity
                            a1.Rules.Last = Last_2
                            a1.Rules.EligibleSince = EligibleSince
                            CorrectionReason = u740.CorrectionReason
                            if Config.Debug and not (a3 - a1.LastLog < Config.LogInterval) then
                                a1.LastLog = a3
                                warn(string.format("[MovementGuard] %s | %s | samples=%d", "corrected", CorrectionReason or "", a1.Samples))
                            end
                            v6 = a2:FindFirstChild("PlayerScripts")
                            v22 = v6 and v6:FindFirstChild("LocalNotification")
                            if v22 then
                                v22:Fire((string.format("<Color=Red>Movement corrected | Speed: %d", (math.round(u740.Speed or 0)))))
                            end
                            return
                        end
                        if true then
                            Character:PivotTo((Character:GetPivot()) + (Position_6 - HumanoidRootPart.Position))
                            AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
                            v21 = Safe.Support:GetVelocityAtPosition(Position_6)
                            HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(v21.X, AssemblyLinearVelocity.Y, v21.Z)
                            a1.LastCorrection = a3
                            a1.LastCorrectionServerTime = workspace:GetServerTimeNow()
                            a1.DebugStatus = "CORRECTED"
                            Safe.Time = a3
                            Safe.Position = Position_6
                            Safe.SupportFrame = Safe.Support.CFrame
                            a1.Support = Safe.Support
                            a1.NextSupport = Safe.Support
                            a1.SupportFrame = Safe.Support.CFrame
                            a1.SupportLocal = Safe.Support.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                            a1.SupportWorld = HumanoidRootPart.Position
                            a1.SupportTime = a3
                            a1.AirborneCarry = nil
                            Last_2 = a1.Rules.Last
                            EligibleSince = a1.Rules.EligibleSince
                            Rules.reset(a1.Rules)
                            Last_2.Position = HumanoidRootPart.Position
                            Last_2.Velocity = HumanoidRootPart.AssemblyLinearVelocity
                            a1.Rules.Last = Last_2
                            a1.Rules.EligibleSince = EligibleSince
                            CorrectionReason = u740.CorrectionReason
                            if Config.Debug and not (a3 - a1.LastLog < Config.LogInterval) then
                                a1.LastLog = a3
                                warn(string.format("[MovementGuard] %s | %s | samples=%d", "corrected", CorrectionReason or "", a1.Samples))
                            end
                            v6 = a2:FindFirstChild("PlayerScripts")
                            v22 = v6 and v6:FindFirstChild("LocalNotification")
                            if v22 then
                                v22:Fire((string.format("<Color=Red>Movement corrected | Speed: %d", (math.round(u740.Speed or 0)))))
                            end
                            return
                        end
                    end
                    blocked("Destination blocked / unsupported")
                    a1.Safe = nil
                    return
                end
                if not Safe.Support.Parent then
                    blocked("Safe support changed / removed")
                    return
                end
                if Safe.Support ~= NextSupport then
                    Support_4 = Safe.Support
                    SupportFrame_5 = Safe.SupportFrame
                    Anchored_5 = false
                    if Support_4 ~= nil then
                        Anchored_5 = false
                        if Support_4.Parent ~= nil then
                            Anchored_5 = Support_4.Anchored
                            if Anchored_5 then
                                if SupportFrame_5 == nil then
                                    Anchored_5 = false
                                    if Support_4.AssemblyLinearVelocity.Magnitude < 0.01 then
                                        Anchored_5 = Support_4.AssemblyAngularVelocity.Magnitude < 0.01
                                    end
                                else
                                    Anchored_5 = false
                                    if Support_4.CFrame == SupportFrame_5 then
                                        Anchored_5 = false
                                        if Support_4.AssemblyLinearVelocity.Magnitude < 0.01 then
                                            Anchored_5 = Support_4.AssemblyAngularVelocity.Magnitude < 0.01
                                        end
                                    end
                                end
                            end
                        end
                    end
                    if not Anchored_5 then
                        blocked("Safe support changed / removed")
                        return
                    end
                end
                if not Rules.finiteVector((Safe.Support.CFrame:PointToWorldSpace(Safe.LocalPosition))) then
                    blocked("Invalid rollback position")
                    return
                end
                v21 = (CFrame.new(Position_6)) * HumanoidRootPart.CFrame.Rotation
                v3 = workspace:Raycast(
                    Position_6,
                    Vector3.new(0, -math.clamp(Humanoid.HipHeight + HumanoidRootPart.Size.Y / 2 + 2, 3, 35), 0),
                    a1.Ray
                )
                if v3 and v3.Instance == Safe.Support then
                    a1.Overlap.CollisionGroup = HumanoidRootPart.CollisionGroup
                    Probe_2 = a1.Probe
                    Probe_2.Size = HumanoidRootPart.Size * 0.7
                    Probe_2.CFrame = v21
                    Probe_2.Parent = HumanoidRootPart.Parent
                    for i12, i13 in workspace:GetPartsInPart(Probe_2, a1.Overlap) do
                        if true then
                            blocked("Destination blocked / unsupported")
                            a1.Safe = nil
                            return
                        end
                        Character:PivotTo((Character:GetPivot()) + (Position_6 - HumanoidRootPart.Position))
                        AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
                        v21 = Safe.Support:GetVelocityAtPosition(Position_6)
                        HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(v21.X, AssemblyLinearVelocity.Y, v21.Z)
                        a1.LastCorrection = a3
                        a1.LastCorrectionServerTime = workspace:GetServerTimeNow()
                        a1.DebugStatus = "CORRECTED"
                        Safe.Time = a3
                        Safe.Position = Position_6
                        Safe.SupportFrame = Safe.Support.CFrame
                        a1.Support = Safe.Support
                        a1.NextSupport = Safe.Support
                        a1.SupportFrame = Safe.Support.CFrame
                        a1.SupportLocal = Safe.Support.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                        a1.SupportWorld = HumanoidRootPart.Position
                        a1.SupportTime = a3
                        a1.AirborneCarry = nil
                        Last_2 = a1.Rules.Last
                        EligibleSince = a1.Rules.EligibleSince
                        Rules.reset(a1.Rules)
                        Last_2.Position = HumanoidRootPart.Position
                        Last_2.Velocity = HumanoidRootPart.AssemblyLinearVelocity
                        a1.Rules.Last = Last_2
                        a1.Rules.EligibleSince = EligibleSince
                        CorrectionReason = u740.CorrectionReason
                        if Config.Debug and not (a3 - a1.LastLog < Config.LogInterval) then
                            a1.LastLog = a3
                            warn(string.format("[MovementGuard] %s | %s | samples=%d", "corrected", CorrectionReason or "", a1.Samples))
                        end
                        v6 = a2:FindFirstChild("PlayerScripts")
                        v22 = v6 and v6:FindFirstChild("LocalNotification")
                        if v22 then
                            v22:Fire((string.format("<Color=Red>Movement corrected | Speed: %d", (math.round(u740.Speed or 0)))))
                        end
                        return
                    end
                    if true then
                        Character:PivotTo((Character:GetPivot()) + (Position_6 - HumanoidRootPart.Position))
                        AssemblyLinearVelocity = HumanoidRootPart.AssemblyLinearVelocity
                        v21 = Safe.Support:GetVelocityAtPosition(Position_6)
                        HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(v21.X, AssemblyLinearVelocity.Y, v21.Z)
                        a1.LastCorrection = a3
                        a1.LastCorrectionServerTime = workspace:GetServerTimeNow()
                        a1.DebugStatus = "CORRECTED"
                        Safe.Time = a3
                        Safe.Position = Position_6
                        Safe.SupportFrame = Safe.Support.CFrame
                        a1.Support = Safe.Support
                        a1.NextSupport = Safe.Support
                        a1.SupportFrame = Safe.Support.CFrame
                        a1.SupportLocal = Safe.Support.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
                        a1.SupportWorld = HumanoidRootPart.Position
                        a1.SupportTime = a3
                        a1.AirborneCarry = nil
                        Last_2 = a1.Rules.Last
                        EligibleSince = a1.Rules.EligibleSince
                        Rules.reset(a1.Rules)
                        Last_2.Position = HumanoidRootPart.Position
                        Last_2.Velocity = HumanoidRootPart.AssemblyLinearVelocity
                        a1.Rules.Last = Last_2
                        a1.Rules.EligibleSince = EligibleSince
                        CorrectionReason = u740.CorrectionReason
                        if Config.Debug and not (a3 - a1.LastLog < Config.LogInterval) then
                            a1.LastLog = a3
                            warn(string.format("[MovementGuard] %s | %s | samples=%d", "corrected", CorrectionReason or "", a1.Samples))
                        end
                        v6 = a2:FindFirstChild("PlayerScripts")
                        v22 = v6 and v6:FindFirstChild("LocalNotification")
                        if v22 then
                            v22:Fire((string.format("<Color=Red>Movement corrected | Speed: %d", (math.round(u740.Speed or 0)))))
                        end
                        return
                    end
                end
                blocked("Destination blocked / unsupported")
                a1.Safe = nil
                return
            end
            a1.DebugStatus = "Startup / reconciliation grace"
            return
        end
        Rules.reset(a1.Rules)
        a1.Safe = nil
        a1.Support = nil
        a1.AirborneCarry = nil
        if Config.Debug then
            if a3 - a1.LastLog < Config.LogInterval then
                return
            end
            a1.LastLog = a3
            warn(string.format("[MovementGuard] %s | %s | samples=%d", "invalid-sample", "non-finite position or velocity", a1.Samples))
        end
        return
    end
    Rules.reset(a1.Rules)
    a1.Safe = nil
    a1.Support = nil
    a1.AirborneCarry = nil
end

function v1.start(a1, a2) -- Line: 752
    -- upvalues: u39 (ref), Players (val), Trove (val), debugPanel (val), newSession (val), RunService (val)
    -- upvalues: Config (val), update (val), Rules (val)
    if u39 then
        return u39
    end
    local u8 = a1 or Players.LocalPlayer
    assert(u8, "MovementGuard needs a local player")
    local u15 = Trove.new()
    local u18 = u15:Extend()
    local u19 = nil
    local u20 = 0
    local u21 = {}
    local u25 = debugPanel(u15, u8)
    u39 = u21

    local function attach(a1) -- Line: 765 -- upvalues: u18 (val), u19 (ref), newSession (upval)
        u18:Clean()
        local v1 = u18:Add((Instance.new("Part")))
        v1.Name = "MovementQuery"
        v1.Anchored = true
        v1.CanCollide = false
        v1.CanTouch = false
        v1.CanQuery = false
        v1.Transparency = 1
        v1.CastShadow = false
        newSession(a1, os.clock(), v1)
    end

    function u21.Destroy(a1) -- Line: 777 -- upvalues: u39 (upval), u19 (ref), u15 (val)
        if u39 ~= a1 then
            return
        end
        u39 = nil
        u19 = nil
        u15:Destroy()
    end

    if a2 then
        u15:Connect(a2.Destroying, function() -- Line: 786 -- upvalues: u21 (val)
            u21:Destroy()
        end)
    end
    u15:Connect(u8.CharacterAdded, attach)
    u15:Connect(u8.CharacterRemoving, function(a1) -- Line: 791 -- upvalues: u19 (ref), u18 (val)
        if u19 and u19.Character == a1 then
            u19 = nil
            u18:Clean()
        end
    end)
    u15:Connect(RunService.Heartbeat, function() -- Line: 797
        -- upvalues: u19 (ref), u20 (ref), Config (upval), u25 (val), update (upval), u8 (ref), Rules (upval)
        local v1 = os.clock()
        if u19 then
            local v2 = v1 - u20
            if not (v2 < Config.SampleInterval) then
                u20 = v1
                v2 = u19
                local success, err = pcall(update, v2, u8, v1)
                if not success then
                    Rules.reset(v2.Rules)
                    v2.Safe = nil
                    v2.Support = nil
                    v2.AirborneCarry = nil
                    local v3 = tostring(err)
                    if Config.Debug and not (v1 - v2.LastLog < Config.LogInterval) then
                        v2.LastLog = v1
                        warn(string.format("[MovementGuard] %s | %s | samples=%d", "sampling-error", v3 or "", v2.Samples))
                    end
                    v2.DebugSnapshot = nil
                    v2.DebugStatus = "Sampling error"
                end
                if u25 then
                    u25(v2, v1)
                end
                return
            end
        end
        if u25 and not u19 then
            u25(nil, v1)
        end
    end)
    if u8.Character then
        attach(u8.Character)
    end
    if Config.Debug then
        warn("[MovementGuard] started | mode=" .. Config.Mode)
    end
    return u21
end

return v1
