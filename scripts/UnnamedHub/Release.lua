---@diagnostic disable: deprecated
-- Bypass --
if getgenv().Key == "Key" then
    local gameMetaTable = getrawmetatable(game) -- WalkSpeed Bypass
    setreadonly(gameMetaTable, false)
    local oldIndex = gameMetaTable.__index

    gameMetaTable.__index = newcclosure(function(self, args)
        if args == "WalkSpeed" then
            return 17
        end
        return oldIndex(self, args)
    end)
    ---------------

    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()

    local Hub = library.new("Unnamed Hub | Created by PacMan#7820")
    local Blatant = Hub:addPage("Blatant", 5012544693)
    local WeaponModSection = Blatant:addSection("Weapon Mods")
    local PlayerCheatsSection = Blatant:addSection("Player Cheats")
    local Visuals = Hub:addPage("Visuals", 5012544693)
    VisualCheats = Visuals:addSection("Visual Cheats")
    VisualCheats:addToggle("ESP", nil, function(value)
        _G.on = value
        local Camera = game:GetService("Workspace").CurrentCamera
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local Font = 2
    local Visibility = true
    
    function ModelTemplate()
       local Objects = {
           Box = Drawing.new("Quad"),
           Name = Drawing.new("Text"),
       } 
       
       return Objects
    end
    
    local function GetPartCorners(Part)
        local Size = Part.Size * Vector3.new(1, 1.5)
        return {
            TR = (Part.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).Position,
            BR = (Part.CFrame * CFrame.new(-Size.X, Size.Y, 0)).Position,
            TL = (Part.CFrame * CFrame.new(Size.X, -Size.Y, 0)).Position,
            BL = (Part.CFrame * CFrame.new(Size.X, Size.Y, 0)).Position,
        }
    end
    
    function ApplyModel(Model,plrName,teamColor)
        local Objects = ModelTemplate()
        local CurrentParent = Model.Parent
        
        spawn(function()
            Objects.Name.Center = true
            Objects.Name.Visible = true
            Objects.Name.Outline = true
            Objects.Name.Transparency = 1
            Objects.Box.Visible = true
            Objects.Box.Transparency = 1
           
            while Model.Parent == CurrentParent do
                local Vector, OnScreen = Camera:WorldToScreenPoint(Model.Head.Position)
                local Distance = (Camera.CFrame.Position - Model.HumanoidRootPart.Position).Magnitude
                
                if OnScreen and Model.Parent.Name ~= game:GetService("Players").LocalPlayer.Team.Name and Visibility then
                    Objects.Name.Position = Vector2.new(Vector.X, Vector.Y + math.clamp(Distance / 10, 10, 30) - 10)
                    Objects.Name.Size = math.clamp(30 - Distance / 10, 10, 30)
                    Objects.Name.Color = teamColor --Color3.fromHSV(math.clamp(Distance / 5, 0, 125) / 255, 0.75, 1)
                    Objects.Name.Visible = true
                    Objects.Name.Font = Font
                    Objects.Name.Transparency = math.clamp((500 - Distance) / 200, 0.2, 1)
                else
                    Objects.Name.Visible = false 
                end
                
                Objects.Name.Text = string.format("[%s] [%s] "..plrName, tostring(math.floor(Distance)), Model:FindFirstChildOfClass("Tool") and Model:FindFirstChildOfClass("Tool").Name or "No Tool")
                
                local PartCorners = GetPartCorners(Model.HumanoidRootPart)
                local VectorTR, OnScreenTR = Camera:WorldToScreenPoint(PartCorners.TR)
                local VectorBR, OnScreenBR = Camera:WorldToScreenPoint(PartCorners.BR)
                local VectorTL, OnScreenTL = Camera:WorldToScreenPoint(PartCorners.TL)
                local VectorBL, OnScreenBL = Camera:WorldToScreenPoint(PartCorners.BL)
                
                if (OnScreenBL or OnScreenTL or OnScreenBR or OnScreenTR) and Model.Parent.Name ~= game:GetService("Players").LocalPlayer.Team.Name and Visibility then
                    Objects.Box.PointA = Vector2.new(VectorTR.X, VectorTR.Y + 36)
                    Objects.Box.PointB = Vector2.new(VectorTL.X, VectorTL.Y + 36)
                    Objects.Box.PointC = Vector2.new(VectorBL.X, VectorBL.Y + 36)
                    Objects.Box.PointD = Vector2.new(VectorBR.X, VectorBR.Y + 36)
                    Objects.Box.Color = teamColor --Color3.fromHSV(math.clamp(Distance / 5, 0, 125) / 255, 0.75, 1)
                    Objects.Box.Thickness = math.clamp(3 - (Distance / 100), 0, 3)
                    Objects.Box.Transparency = math.clamp((500 - Distance) / 200, 0.2, 1)
                    Objects.Box.Visible = true
                else
                    Objects.Box.Visible = false
                end
                
                RunService.RenderStepped:Wait()
            end
            
            Objects.Name:Remove()
            Objects.Box:Remove()
        end)
    end
    
    function esp()
    for _,player in pairs(game.Players:GetPlayers()) do
        if player.Name ~= game.Players.LocalPlayer.Name then
            if player.Team ~= game.Players.LocalPlayer.Team then
            ApplyModel(player.Character,player.Name,Color3.fromRGB(255,0,0))
            else
                ApplyModel(player.Character,player.Name,Color3.fromRGB(0,255,0))
            end
    end
    end
    game:GetService("Players").ChildAdded:Connect(function(Player)
        delay(0.5, function()
            ApplyModel(Player)
        end)
    end)
    end
    
    --esp()
    while _G.on == true do
        esp()
        wait(3)
    end
    
    while _G.on == false do
        Visibility = false
        wait(3)
    end
        end)

    WeaponModSection:addButton("Gun Mods", function ()
        for i,v in next, getgc(true) do
            if type(v) == "table" and rawget(v, "damage") then
                v.shotrate = 0.000001
                v.automatic = true
                v.damage = math.huge
                v.velocity = 100000
            end
        end
    end)
    KillAll = false

 
    --[[PlayerCheatsSection:addSlider("WalkSpeed", 16, 16, 100, function(value)
        while wait() do
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end)
    --]]
    
PLAYER  = game.Players.LocalPlayer
MOUSE   = PLAYER:GetMouse()
CC      = game.Workspace.CurrentCamera

ENABLED      = false

_G.FREE_FOR_ALL = false

PlayerCheatsSection:addToggle("Kill All", nil, function(value)
    if KillAll then
        KillAll = false
        _G.ENABLED = false
        ENABLED = false
        Respawn = false

        
        
    else
        KillAll = true
        _G.ENABLED = true
        ENABLED = true
        Respawn = true


    end
    end)

_G.AIM_AT = 'Head'

wait(1)

function GetNearestPlayerToMouse()
	local PLAYERS      = {}
	local PLAYER_HOLD  = {}
	local DISTANCES    = {}
	for i, v in pairs(game.Players:GetPlayers()) do
		if v ~= PLAYER then
			table.insert(PLAYERS, v)
		end
	end
	for i, v in pairs(PLAYERS) do
		if _G.FREE_FOR_ALL == false then
			if v and (v.Character) ~= nil and v.TeamColor ~= PLAYER.TeamColor then
				local AIM = v.Character:FindFirstChild(_G.AIM_AT)
				if AIM ~= nil then
					local DISTANCE                 = (AIM.Position - game.Workspace.CurrentCamera.CoordinateFrame.p).magnitude
					local RAY                      = Ray.new(game.Workspace.CurrentCamera.CoordinateFrame.p, (MOUSE.Hit.p - CC.CoordinateFrame.p).unit * DISTANCE)
					local HIT,POS                  = game.Workspace:FindPartOnRay(RAY, game.Workspace)
					local DIFF                     = math.floor((POS - AIM.Position).magnitude)
					PLAYER_HOLD[v.Name .. i]       = {}
					PLAYER_HOLD[v.Name .. i].dist  = DISTANCE
					PLAYER_HOLD[v.Name .. i].plr   = v
					PLAYER_HOLD[v.Name .. i].diff  = DIFF
					table.insert(DISTANCES, DIFF)
				end
			end
		elseif _G.FREE_FOR_ALL == true then
			local AIM = v.Character:FindFirstChild(_G.AIM_AT)
			if AIM ~= nil then
				local DISTANCE                 = (AIM.Position - game.Workspace.CurrentCamera.CoordinateFrame.p).magnitude
				local RAY                      = Ray.new(game.Workspace.CurrentCamera.CoordinateFrame.p, (MOUSE.Hit.p - CC.CoordinateFrame.p).unit * DISTANCE)
				local HIT,POS                  = game.Workspace:FindPartOnRay(RAY, game.Workspace)
				local DIFF                     = math.floor((POS - AIM.Position).magnitude)
				PLAYER_HOLD[v.Name .. i]       = {}
				PLAYER_HOLD[v.Name .. i].dist  = DISTANCE
				PLAYER_HOLD[v.Name .. i].plr   = v
				PLAYER_HOLD[v.Name .. i].diff  = DIFF
				table.insert(DISTANCES, DIFF)
			end
		end
	end

	if unpack(DISTANCES) == nil then
		return false
	end

	local L_DISTANCE = math.floor(math.min(unpack(DISTANCES)))
	if L_DISTANCE > 20 then
		return false
	end

	for i, v in pairs(PLAYER_HOLD) do
		if v.diff == L_DISTANCE then
			return v.plr
		end
	end
	return false
end

GUI_MAIN                           = Instance.new('ScreenGui', game.CoreGui)
GUI_TARGET                         = Instance.new('TextLabel', GUI_MAIN)
GUI_AIM_AT                         = Instance.new('TextLabel', GUI_MAIN)
GUI_AIM_AT.Visible = false
GUI_TARGET.Visible = false
GUI_MAIN.Name                      = 'AIMBOT'

GUI_TARGET.Size                    = UDim2.new(0,200,0,30)
GUI_TARGET.BackgroundTransparency  = 0.5
GUI_TARGET.BackgroundColor         = BrickColor.new('Fossil')
GUI_TARGET.BorderSizePixel         = 0
GUI_TARGET.Position                = UDim2.new(0.5,-100,0,0)
GUI_TARGET.Text                    = 'AIMBOT : OFF'
GUI_TARGET.TextColor3              = Color3.new(1,1,1)
GUI_TARGET.TextStrokeTransparency  = 1
GUI_TARGET.TextWrapped             = true
GUI_TARGET.FontSize                = 'Size24'
GUI_TARGET.Font                    = 'SourceSansBold'

GUI_AIM_AT.Size                    = UDim2.new(0,200,0,20)
GUI_AIM_AT.BackgroundTransparency  = 0.5
GUI_AIM_AT.BackgroundColor         = BrickColor.new('Fossil')
GUI_AIM_AT.BorderSizePixel         = 0
GUI_AIM_AT.Position                = UDim2.new(0.5,-100,0,30)
GUI_AIM_AT.Text                    = 'AIMING : HEAD'
GUI_AIM_AT.TextColor3              = Color3.new(1,1,1)
GUI_AIM_AT.TextStrokeTransparency  = 1
GUI_AIM_AT.TextWrapped             = true
GUI_AIM_AT.FontSize                = 'Size18'
GUI_AIM_AT.Font                    = 'SourceSansBold'

local TRACK = false




function FIND()
	CLEAR()
	TRACK = true
	spawn(function()
		while wait() do
			if TRACK then
				CLEAR()
				for i,v in pairs(game.Players:GetChildren()) do
					if v.Character and v.Character:FindFirstChild('Head') then
						if _G.FREE_FOR_ALL == false then
							if v.TeamColor ~= PLAYER.TeamColor then
								if v.Character:FindFirstChild('Head') then
									CREATE(v.Character.Head, true)
								end
							end
						else
							if v.Character:FindFirstChild('Head') then
								CREATE(v.Character.Head, true)
							end
						end
					end
				end
			end
		end
		wait(1)
	end)
end

local player = game.Players.LocalPlayer
local mouse = player:GetMouse() -- get the mouse
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ready = true






game:GetService('RunService').RenderStepped:connect(function()
	if ENABLED then
		local TARGET = GetNearestPlayerToMouse()
		if (TARGET ~= false) then
			local AIM = TARGET.Character:FindFirstChild(_G.AIM_AT)
			if AIM then
				CC.CoordinateFrame = CFrame.new(CC.CoordinateFrame.p, AIM.CFrame.p)
			end
		
		end
	end
end)

wait()
Respawn = false
_G.FREE_FOR_ALL = false
------------------------------------------------
Players = game:GetService("Players")
LocalPlayer = game.Players.LocalPlayer
LocalCharacter = LocalPlayer.Character
LocalCFrame = LocalCharacter.HumanoidRootPart.CFrame
------------------------------------------------

while wait(0.1) do
    if LocalCharacter and LocalPlayer.Character and KillAll then
    if Respawn then
        keypress(0x20)
    end
    for i, player in pairs(Players:GetPlayers()) do
        if player.TeamColor ~= LocalPlayer.TeamColor and player.Character and player.Character.HumanoidRootPart then
                if _G.Debug then
                    print("Enemy          : "..player.Name)
                    print("Teleporting to : "..player.Name)
                end
                ------------------------------------------------
                Players = game:GetService("Players")
                LocalPlayer = game.Players.LocalPlayer
                LocalCharacter = LocalPlayer.Character
                LocalCFrame = LocalCharacter.HumanoidRootPart.CFrame
                ------------------------------------------------
                root = game.Players.LocalPlayer.Character.HumanoidRootPart
                root.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                mouse1click()
                
                wait(0.1)
        end
    end
end
end
    library:toggle()
end
