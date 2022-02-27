
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/preztel/AzureLibrary/master/uilib.lua", true))()

local args1 = {
    [1] = "Combat",
    [2] = false,
    [3] = CFrame.new(Vector3.new(2113.696533203125, 712.1063232421875, 310.399169921875), Vector3.new(0.7909754514694214, -0.052299730479717255, 0.60960853099823)),
    [4] = CFrame.new(Vector3.new(2123.518310546875, 709.874755859375, 317.9688415527344), Vector3.new(0.7909752726554871, -0.052299752831459045, 0.6096087694168091)),
    [5] = CFrame.new(Vector3.new(2757.942626953125, 585.363525390625, 1356.369384765625), Vector3.new(0.5217130780220032, -0.10259706526994705, 0.8469293117523193)),
    [7] = workspace:FindFirstChild("World Map"),
    [8] = {
        ["Type"] = 1,
        ["Hit"] = {}
    }
}





local args = {
    [1] = "Combat",
    [2] = true,
    [3] = CFrame.new(Vector3.new(2115.51806640625, 714.3577270507812, 309.40899658203125), Vector3.new(0.6683589816093445, -0.23033678531646729, 0.7072774171829224)),
    [4] = CFrame.new(Vector3.new(2123.62255859375, 709.9409790039062, 317.9854431152344), Vector3.new(0.6683591604232788, -0.2303367555141449, 0.7072771787643433)),
    [5] = CFrame.new(Vector3.new(2604.042724609375, 621.9680786132812, 1543.0523681640625), Vector3.new(0.3671974837779999, -0.06945989280939102, 0.927545964717865)),
    [7] = workspace:FindFirstChild("World Map"),
    [8] = {
        ["Type"] = 0
    }
}


if getgenv().Key == "yanderepacman" then
    local FarmsTab = Library:CreateTab("Farms", "Contains the main auto farms", true) 
    local FakeStats = Library:CreateTab("Fake Stats", "These may break some features in the game, but are still cool for showing off", true)
    local MiscTab = Library:CreateTab("Misc Tab", "Just some other cool stuff", true)

    FarmsTab:CreateToggle("Auto Strength", function(arg)
        _G.autoFarm = arg
        while _G.autoFarm == true do
            wait()
            game:GetService("ReplicatedStorage").Remotes.SkillRemote:FireServer(unpack(args1))
            game:GetService("ReplicatedStorage").Remotes.SkillRemote:FireServer(unpack(args))
            game:GetService("ReplicatedStorage").Remotes.SkillRemote:FireServer(unpack(args1))
            game:GetService("ReplicatedStorage").Remotes.SkillRemote:FireServer(unpack(args))
            game:GetService("ReplicatedStorage").Remotes.SkillRemote:FireServer(unpack(args1))
            game:GetService("ReplicatedStorage").Remotes.SkillRemote:FireServer(unpack(args))
        end
    end)
    FarmsTab:CreateToggle("Auto Rebirth", function (arg)
        _G.autoRebirth = arg
        while _G.autoRebirth == true do
            wait()
            game:GetService("ReplicatedStorage").Aero.AeroRemoteServices.StatsService.RebirthUp:FireServer()
        end
    end)

    FakeStats:CreateButton("Infinite Power", function ()
        game:GetService("RunService").RenderStepped:Connect(function(step)
            game:GetService("Players").LocalPlayer.Stats.Power.Value = 69696969696969
        end)
    end)

    FakeStats:CreateButton("Infinite Kills", function ()
        game:GetService("RunService").RenderStepped:Connect(function(step)
            game:GetService("Players").LocalPlayer.Stats.Kills.Value = 69696969696969
        end)
    end)

    MiscTab:CreateToggle("Infinite Energy", function (arg)
        _G.infenergy = arg
        while _G.infenergy == true do
            wait()
            local name = tostring(game.Players.LocalPlayer.Name)
            game:GetService("Workspace").Characters[name].Status.CurrentEnergy.Value = 9999
        end
    end)

    MiscTab:CreateToggle("Rainbow Name", function (arg)
        if arg == true then
            game:GetService("Players").LocalPlayer.Stats.GamePasses.VIP.Value = true
        else
            game:GetService("Players").LocalPlayer.Stats.GamePasses.VIP.Value = false
        end
    end)

else
    game.Players.LocalPlayer:Kick("are you trying to skid pacman you idiot you cant do that")
end
