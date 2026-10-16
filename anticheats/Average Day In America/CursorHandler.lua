local tbl_1 = {}
local u1 = false
function tbl_1.Start()
    --[[
      name: Start
      line: 4
      upvalues:
        u1 (ref, index: 1)
    ]]
    if u1 then
        return
    end
    u1 = true
    local Players_upv_1 = game:GetService("Players")
    local ReplicatedStorage_1 = game:GetService("ReplicatedStorage")
    local LogService_1 = game:GetService("LogService")
    local ContentProvider_upv_1 = game:GetService("ContentProvider")
    local MarketplaceService_upv_1 = game:GetService("MarketplaceService")
    local u2 = ReplicatedStorage_1:WaitForChild("UaMoZyiClZ/IvCY6JKE2vbZ6F2yUHP1D0")
    local u3 = ReplicatedStorage_1:WaitForChild("FsNV27yQrX/WbEj5LKM9tpOz61sCGd0Ha")
    local u4 = ReplicatedStorage_1:WaitForChild("BsKlJ2jnt2b/8hu2hLjiusDhSkhMsIWu21")
    local tbl_upv_2 = {"Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "HumanoidRootPart"}
    local LocalPlayer_upv_1 = Players_upv_1.LocalPlayer
    local u5 = false
    local tbl_upv_3 = {
        "rbxassetid://1352543873",
        "rbxassetid://Velocity",
        "rbxassetid://RonixExploit",
        "rbxassetid://infiniteyield",
        "rbxassetid://1204397029",
        "rbxassetid://3523243755",
        "rbxassetid://4911962991",
        "rbxassetid://129697930",
        "rbxassetid://5147488658",
        "rbxassetid://5147488592",
        "rbxassetid://5147695474",
        "rbxassetid://5054663650",
        "rbxassetid://6234691350",
        "rbxassetid://4113050383",
        "rbxassetid://2406617031",
        "rbxassetid://4908465318",
        "rbxassetid://6695644299",
        "rbxassetid://27789359",
        "rbxassetid://30196114",
        "rbxassetid://248263260",
        "rbxassetid://45834924",
        "rbxassetid://33796059",
        "rbxassetid://28488254",
        "rbxassetid://52155728",
        "rbxassetid://35154961",
        "rbxassetid://148840371",
        "rbxassetid://5918726674",
        "rbxassetid://282574440",
        "rbxassetid://6065821980",
        "rbxassetid://6065821086",
        "rbxassetid://6065821596",
        "rbxassetid://6065775281"
    }
    local tbl_upv_4 = {}
    local tbl_upv_5 = {}
    local tbl_upv_6 = {
        "namecall",
        "newindex",
        "hookfunction",
        "hookmetamethod",
        "replaceclosure",
        "setrawmetatable",
        "getrawmetatable",
        "setupvalue",
        "getupvalue",
        "getreg",
        "getgenv",
        "Luna",
        "getrenv",
        "getreg",
        "getgc",
        "getinstances",
        "getnilinstances",
        "iscclosure",
        "islclosure",
        "checkcaller",
        "xeno",
        "infyield",
        "simplespy",
        "hydroxide",
        "vynixius",
        "injected",
        "inject",
        "execute",
        "patcher",
        "patch",
        "owlhub",
        "RemoteSpy",
        "darkhub",
        "solaris",
        "remotespy",
        "turtlespy",
        "dex",
        "iy",
        "unnamed",
        "loadstring",
        "decompiled",
        "decompile",
        "bypassed",
        "bypass",
        "executor",
        "exploit",
        "cheat",
        "hack",
        "aimbot",
        "silentaim",
        "wallhack",
        "flyhack",
        "noclip",
        "spinbot",
        "killaura",
        "speedhack",
        "hitbox",
        "esp",
        "teleport",
        "kickstring",
        "rspy",
        "krnl",
        "fluxus",
        "electron",
        "celery",
        "solara",
        "wave",
        "speed",
        "fly",
        "__namecall",
        "FireServer",
        "GetNilInstances",
        "scriptblox",
        "rawmetatable",
        "luau",
        "identity",
        "context",
        "caller",
        "metamethod",
        "anticrash",
        "backdoor",
        "comfyui",
        "loadfile"
    }
    local function scan(a1)
        --[[
          name: scan
          line: 171
          upvalues:
            tbl_upv_2 (copy, index: 1)
        ]]
        local tbl_7 = {}
        for _, value_1 in ipairs(tbl_upv_2) do
            local v1 = a1:FindFirstChild(value_1)
            if not (v1) then
                continue
            end
            if v1:IsA("BasePart") then
                tbl_7[value_1] = v1.Size
            end
        end
        return tbl_7
    end
    local function isanimplaying(a2, a3)
        --[[
          name: isanimplaying
          line: 194
        ]]
        local v2 = a2:FindFirstChildOfClass("Humanoid")
        if not v2 then
            return false
        end
        local v3 = v2:FindFirstChildOfClass("Animator")
        if v3 then
            for _, value_2 in ipairs(v3:GetPlayingAnimationTracks()) do
                if not (value_2.Animation) or not (string.find(value_2.Animation.AnimationId, a3)) then
                    continue
                end
                return true
            end
            for _, value_3 in ipairs(a2:GetDescendants()) do
                if not (value_3:IsA("Animation")) or not (string.find(value_3.AnimationId, a3)) then
                    continue
                end
                return true
            end
        end
        return false
    end
    local function logcheck(a4, a5)
        --[[
          name: logcheck
          line: 236
          upvalues:
            tbl_upv_6 (copy, index: 1)
            u2 (copy, index: 2)
        ]]
        if a5 ~= Enum.MessageType.MessageOutput then
            return
        end
        local v4 = string.lower(a4)
        for _, value_4 in ipairs(tbl_upv_6) do
            if not (string.find(v4, string.lower(value_4), 1, true)) then
                continue
            end
            u2:FireServer("LogFootprint", a4)
            return
        end
    end
    LogService_1.MessageOut:Connect(logcheck)
    local u6 = function()
        --[[
          line: 250
          upvalues:
            LocalPlayer_upv_1 (copy, index: 1)
            tbl_upv_2 (copy, index: 2)
            u2 (copy, index: 3)
        ]]
        local Character_1 = LocalPlayer_upv_1.Character
        if not Character_1 then
            return
        end
        local v5 = Character_1:FindFirstChildOfClass("Humanoid")
        if not v5 or v5.Health <= 0.1 then
            return
        end
        local v6 = Character_1:FindFirstChild("zaza")
        if not (v6) then
            local v7 = Character_1:FindFirstChild("Torso")
            if v7 then
                local v8 = Instance.new("Part")
                local v9 = Instance.new("WeldConstraint")
                local v10 = Character_1:FindFirstChild("Torso")
                v9.Part0 = v10
                v9.Part1 = v8
                v8.Name = "zaza"
                v8.Anchored = false
                v8.Massless = true
                v8.Transparency = 1
                v8.CanCollide = true
                v8.CanTouch = false
                v8.CanQuery = false
                v8.CollisionGroup = "Players"
                v8.Size = v10.Size
                v8.CFrame = v10.CFrame
                v9.Parent = v9.Part0
                v8.Parent = Character_1
                v6 = v8
            end
        end
        if v6 and v6.CanCollide == false then
            local v11 = 0
            local v12 = 0
            local v13 = 0
            local v10, v9, v7
            v10, v9, v7 = v13, v12, v11
            for _, value_5 in ipairs(tbl_upv_2) do
                local v14 = Character_1:FindFirstChild(value_5)
                if not (v14) then
                    continue
                end
                local v15 = v14:IsA("BasePart")
                if not (v15) then
                    continue
                end
                v10 = v10 + 1
                if v14.CanCollide then
                    v9 = v9 + 1
                else
                    v7 = v7 + 1
                end
            end
            local zaza_1 = Character_1:FindFirstChild("zaza")
            if zaza_1 then
                v10 = v10 + 1
                if v6.CanCollide then
                    v9 = v9 + 1
                else
                    v7 = v7 + 1
                end
            end
            if v7 > 0 then
                print("NoClip exploit", "{ n=" .. v7 .. ", c=" .. v9 .. ", t=" .. v10 .. " }")
                u2:FireServer("NoClip", v7, v9, v10)
            end
        end
        for _, value_6 in ipairs(Character_1:GetDescendants()) do
            if value_6:IsA("BodyGyro") then
                u2:FireServer("IllegalObject", v5.WalkSpeed, v5.JumpPower)
                break
            end
            if not (value_6:IsA("AlignOrientation")) then
                continue
            end
            if value_6.Name ~= "HeadReaction" then
                u2:FireServer("IllegalObject", v5.WalkSpeed, v5.JumpPower)
                break
            end
        end
        if v5.WalkSpeed <= 28 then
            if v5.JumpPower <= 51 then
                return
            end
            u2:FireServer("JumpPower", v5.WalkSpeed, v5.JumpPower)
        else
            u2:FireServer("WalkSpeed", v5.WalkSpeed, v5.JumpPower)
        end
    end
    task.spawn(
        function()
            --[[
              line: 328
              upvalues:
                u6 (copy, index: 1)
            ]]
            while true do
                task.wait(1)
                u6()
            end
        end
    )
    task.spawn(
        function()
            --[[
              line: 335
              upvalues:
                LocalPlayer_upv_1 (copy, index: 1)
                u5 (ref,  index: 2)
                u2 (copy, index: 3)
            ]]
            local v16 = nil
            while true do
                local v17
                repeat
                    task.wait(1)
                    v17 = LocalPlayer_upv_1.Character
                until v17
                v16 = v17:FindFirstChildOfClass("Humanoid")
                if v16 then
                    break
                end
            end
            local PlatformStand_1 = v16.PlatformStand
            if PlatformStand_1 and not u5 then
                u2:FireServer("PlatformStand", v16.WalkSpeed, v16.JumpPower)
            end
            u5 = PlatformStand_1
        end
    )
    task.spawn(
        function()
            --[[
              line: 353
              upvalues:
                Players_upv_1 (copy, index: 1)
                LocalPlayer_upv_1 (copy, index: 2)
                u3 (copy, index: 3)
            ]]
            task.wait(2)
            for _, value_7 in ipairs(Players_upv_1:GetPlayers()) do
                if value_7 == LocalPlayer_upv_1 then
                    continue
                end
                local Character_2 = value_7.Character
                if not (Character_2) or not (Character_2:IsDescendantOf(workspace)) then
                    continue
                end
                if Character_2:FindFirstChildWhichIsA("Highlight", true) then
                    u3:FireServer("CHECK_HIGHLIGHT", value_7.Name)
                end
            end
        end
    )
    local function assetcheck()
        --[[
          name: assetcheck
          line: 216
          upvalues:
            tbl_upv_4 (copy, index: 1)
            ContentProvider_upv_1 (copy, index: 2)
            u2 (copy, index: 3)
            LocalPlayer_upv_1 (copy, index: 4)
            tbl_upv_5 (copy, index: 5)
            isanimplaying (copy, index: 6)
        ]]
        for _, value_8 in ipairs(tbl_upv_4) do
            if ContentProvider_upv_1:GetAssetFetchStatus(value_8) == Enum.AssetFetchStatus.Success then
                u2:FireServer("AssetFlag", value_8)
                break
            end
        end
        local Character_3 = LocalPlayer_upv_1.Character
        if not Character_3 then
            return
        end
        for key_1 in pairs(tbl_upv_5) do
            if not (isanimplaying(Character_3, key_1)) then
                continue
            end
            u2:FireServer("AssetFlag", "rbxassetid://" .. key_1)
            return
        end
    end
    task.spawn(
        function()
            --[[
              line: 369
              upvalues:
                assetcheck (copy, index: 1)
            ]]
            while true do
                task.wait(5)
                assetcheck()
            end
        end
    )
    task.spawn(
        function()
            --[[
              line: 376
              upvalues:
                Players_upv_1 (copy, index: 1)
            ]]
            local Admin_upv_1 = Players_upv_1.LocalPlayer.PlayerGui:WaitForChild("Admin")
            local function IsEnabled()
                --[[
                  name: IsEnabled
                  line: 378
                  upvalues:
                    Admin_upv_1 (copy, index: 1)
                ]]
                if Admin_upv_1.Enabled then
                    local v18 = Instance.new("Sound")
                    v18.SoundId = ""
                    v18.Parent = Admin_upv_1
                    local v19 = Instance.new("DistortionSoundEffect")
                    v19.Level = 1
                    v19.Parent = v18
                    local v20 = Instance.new("ImageLabel")
                    v20.Parent = Admin_upv_1
                    v20.Size = UDim2.new(1, 0, 1, 0)
                    v20.BackgroundTransparency = 1
                    v20.Image = 129842636782015
                end
            end
        end
    )
    local function report()
        --[[
          name: report
          line: 182
          upvalues:
            Players_upv_1 (copy, index: 1)
            scan (copy, index: 2)
            u4 (copy, index: 3)
        ]]
        local tbl_8 = {}
        for _, value_9 in ipairs(Players_upv_1:GetPlayers()) do
            if value_9.Character then
                tbl_8[value_9.Name] = scan(value_9.Character)
            end
        end
        u4:FireServer(tbl_8)
    end
    u4.OnClientEvent:Connect(
        function(a6)
            --[[
              line: 395
              upvalues:
                report (copy, index: 1)
            ]]
            if a6 ~= "REQUEST_REPORT" then
                return
            end
            report()
        end
    )
    LocalPlayer_upv_1.CharacterAdded:Connect(
        function()
            --[[
              line: 401
              upvalues:
                report (copy, index: 1)
            ]]
            task.wait(0.5)
            report()
        end
    )
    local function parse()
        --[[
          name: parse
          line: 145
          upvalues:
            tbl_upv_3 (copy, index: 1)
            MarketplaceService_upv_1 (copy, index: 2)
            tbl_upv_5 (copy, index: 3)
            tbl_upv_4 (copy, index: 4)
        ]]
        for _, value_upv_10 in ipairs(tbl_upv_3) do
            local u7 = string.match(value_upv_10, "%d+")
            if u7 then
                local num_upv_1 = tonumber(u7)
                task.spawn(
                    function()
                        --[[
                          line: 150
                          upvalues:
                            MarketplaceService_upv_1 (copy, index: 1)
                            num_upv_1 (copy, index: 2)
                            tbl_upv_5 (copy, index: 3)
                            u7 (copy, index: 4)
                            tbl_upv_4 (copy, index: 5)
                            value_upv_10 (copy, index: 6)
                        ]]
                        local success_1, v21 = pcall(
                            function()
                                --[[
                                  line: 151
                                  upvalues:
                                    MarketplaceService_upv_1 (copy, index: 1)
                                    num_upv_1 (copy, index: 2)
                                ]]
                                return MarketplaceService_upv_1:GetProductInfo(num_upv_1)
                            end
                        )
                        if success_1 and v21 then
                            local AssetTypeId_1 = v21.AssetTypeId
                            if AssetTypeId_1 == 24 or AssetTypeId_1 >= 48 and AssetTypeId_1 <= 56 or AssetTypeId_1 == 61 or AssetTypeId_1 == 78 or AssetTypeId_1 == 32 then
                                tbl_upv_5[u7] = true
                                return
                            end
                            table.insert(tbl_upv_4, value_upv_10)
                            return
                        end
                        table.insert(tbl_upv_4, value_upv_10)
                    end
                )
            else
                table.insert(tbl_upv_4, value_upv_10)
            end
        end
    end
    parse()
    if not LocalPlayer_upv_1.Character then
        return
    end
    report()
end
return tbl_1
