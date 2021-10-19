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

    --[[PlayerCheatsSection:addSlider("WalkSpeed", 16, 16, 100, function(value)
        while wait() do
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        end
    end)
    --]]
    library:toggle()
end
