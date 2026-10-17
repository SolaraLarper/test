-- Script Path: game:GetService("Players").ShowcaseScripters.PlayerScripts.PlayerClient
-- Took 0s to decompile.
-- Executor: Real (2.7.8)

-- Script path: Players.ShowcaseScripters.PlayerScripts.PlayerClient
-- Decompile time: 8.54 ms

local v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurrentCamera = workspace.CurrentCamera
game.Players.LocalPlayer:WaitForChild("PlayerGui")
game.Players.LocalPlayer.CharacterAdded:Connect(function(a1) -- Line: 5
    local HumanoidRootPart = a1:WaitForChild("HumanoidRootPart", 2)
    if a1.Parent == nil then
        return
    end
    local v1 = a1
    while v1 do
        if not HumanoidRootPart then
            break
        end
        wait()
        if v1.Parent == nil then
            break
        end
        if HumanoidRootPart:FindFirstChildWhichIsA("BodyPosition")
            or HumanoidRootPart:FindFirstChildWhichIsA("BodyGyro")
            or HumanoidRootPart:FindFirstChildWhichIsA("BodyThrust")
            or HumanoidRootPart:FindFirstChildWhichIsA("BodyForce") then
            game.Players.LocalPlayer:Kick()
        end
    end
end)
workspace.Projectiles.ChildAdded:Connect(function(a1) -- Line: 23
    local u2 = tick()
    a1.Touched:Connect(function(a1_2) -- Line: 26 -- upvalues: a1 (val), u2 (ref) -- types: a1_2: userdata
        if a1_2.Material == Enum.Material.ForceField or not a1_2:IsDescendantOf(workspace.Map) then
            return
        end
        if 5 <= a1.Velocity.Magnitude and a1:FindFirstChild("Impact") then
            local v1 = tick() - u2
            if v1 > 0.1 then
                tick()
                v1 = a1:FindFirstChild("Impact"):Clone()
                v1.Name = "NO"
                v1.Volume = 0.5
                v1.RollOffMaxDistance = 200
                v1.RollOffMinDistance = 10
                v1.Parent = a1
                v1:Play()
                game.Debris:AddItem(v1, v1.TimeLength + 1)
            end
        end
    end)
end)
;(ReplicatedStorage:WaitForChild("GameEvent")).OnClientEvent:Connect(function(a1, ...) -- Line: 46 -- upvalues: CurrentCamera (val)
    local Attachment, v1
    local v2 = {...}
    if a1 ~= "Ragdoll" then
        if a1 == "ClearAll" then
            CurrentCamera:ClearAllChildren()
        end
        return
    end
    if v2[1] == nil then
        return
    end
    if v2[1] and v2[1]:FindFirstChild("Head") == nil then
        return
    end
    local RagdollFolder = CurrentCamera:FindFirstChild("RagdollFolder") or Instance.new("Model")
    RagdollFolder.Name = "RagdollFolder"
    RagdollFolder.Parent = CurrentCamera
    local Model = v2[1] or Instance.new("Model")
    Model.Archivable = true
    local v3 = Model:Clone()
    if v3:FindFirstChildWhichIsA("Highlight") then
        v3:FindFirstChildWhichIsA("Highlight"):Destroy()
    end
    local HumanoidRootPart = v3:FindFirstChild("HumanoidRootPart")
    local Head = v3:FindFirstChild("Head")
    if Head then
        Head.CanCollide = true
    end
    v3.Parent = RagdollFolder
    local v4 = v3:FindFirstChildWhichIsA("Humanoid")
    v4.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    v4.AutoRotate = false
    v4:ChangeState(Enum.HumanoidStateType.Physics)
    for k, v in pairs(v3:GetDescendants()) do
        if v:IsA("Motor6D") then
            v1 = Instance.new("Attachment")
            Attachment = Instance.new("Attachment")
            v1.CFrame = v.C0
            Attachment.CFrame = v.C1
            v1.Parent = v.Part0
            Attachment.Parent = v.Part1
            v4 = Instance.new("NoCollisionConstraint")
            v4.Part0 = v.Part0
            v4.Part1 = v.Part1
            v4.Parent = v.Part1
            v4 = Instance.new("BallSocketConstraint")
            v4.Attachment0 = v1
            v4.Attachment1 = Attachment
            v4.Parent = v.Part0
            v.Enabled = false
        elseif v:IsA("BasePart") then
            v.CollisionGroupId = 3
        end
    end
    if not v3:FindFirstChild("LowerTorso") then
        v3:FindFirstChild("Torso")
    end
    local KnockbackDirection = v3:FindFirstChild("KnockbackDirection")
    if KnockbackDirection then
        HumanoidRootPart.Velocity = KnockbackDirection.Value.Velocity
        local Sound = Instance.new("Sound")
        Sound.SoundId = "rbxassetid://8745852008"
        Sound.Parent = Head
        Sound:Play()
    end
    if (game.Players:GetPlayerFromCharacter(Model)) ~= game.Players.LocalPlayer then
        return
    end
    game.Workspace.CurrentCamera.CameraSubject = v3:WaitForChild("Head")
end)
game.Loaded:Wait()
print("FINISHED LOADING")
while wait() do
    v1 = game:GetService("RunService").RenderStepped:Wait(3)
    if game.Players.LocalPlayer.Team ~= game.Teams.Spectating then
        if v1 == nil or v1 > 3 then
            game.Players.LocalPlayer:Kick()
        end
    end
end
