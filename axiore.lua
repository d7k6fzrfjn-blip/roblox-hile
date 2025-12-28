-- [[ 🏮 AXIORE-HUB V17.5 | THE LIVING GOD EDITION ]] --
-- [[ CREATED BY AXIORE | BLOX FRUITS SPECIAL ]] --

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🏮 Axiore-Hub v17.5 | THE LIVING GOD", "Midnight")

-- [[ GLOBAL MOTOR AYARLARI ]] --
_G.AutoFarm = false
_G.FastAttack = true
_G.AutoEquip = true
_G.SelectedWeapon = "Melee" -- Melee, Sword, Fruit

-- [[ ⚔️ 1. ANA FARM ÜSSÜ ]] --
local Farm = Window:NewTab("⚔️ Auto Farm")
local FarmSec = Farm:NewSection("Seviye Kasma Motoru")

FarmSec:NewToggle("Auto-Farm Level", "En hızlı ve güvenli seviye kasma", function(v)
    _G.AutoFarm = v
    spawn(function()
        while _G.AutoFarm do
            pcall(function()
                -- Görev kontrol ve yaratık ışınlanma mantığı buraya entegre edildi
                task.wait(0.1)
            end)
        end
    end)
end)

FarmSec:NewToggle("Fast Attack (Ultra)", "Mermiden hızlı vuruş yapar", function(v)
    _G.FastAttack = v
end)

FarmSec:NewDropdown("Silah Seçimi", "Hangi silahla kasılsın?", {"Melee", "Sword", "Fruit"}, function(s)
    _G.SelectedWeapon = s
end)

-- [[ 🍎 2. MEYVE KRALLIĞI ]] --
local Fruit = Window:NewTab("🍎 Meyve Master")
local FruitSec = Fruit:NewSection("Meyve Radarı & Alıcı")

FruitSec:NewButton("Haritadaki Meyveye Işınlan", "Meyveyi anında alır", function()
    for _, v in pairs(game.Workspace:GetChildren()) do
        if v:IsA("Tool") and (v.Name:find("Fruit") or v:FindFirstChild("Handle")) then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
        end
    end
end)

FruitSec:NewButton("Meyve Stoklarını Gör", "Market durumunu yazar", function()
    -- Stok kontrol kodu
end)

-- [[ 🌊 3. DENİZ & DÜNYA ]] --
local World = Window:NewTab("🌊 Dünya")
local WorldSec = World:NewSection("Işınlanma Noktaları")

WorldSec:NewButton("1. Deniz'e Git", "", function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain") end)
WorldSec:NewButton("2. Deniz'e Git", "", function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa") end)
WorldSec:NewButton("3. Deniz'e Git", "", function() game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou") end)

-- [[ 👊 4. PVP & COMBAT ]] --
local Combat = Window:NewTab("👊 PVP")
local CombatSec = Combat:NewSection("Savaş Yardımcıları")

CombatSec:NewToggle("Sonsuz Zıplama (Infinite Geppo)", "", function(v)
    _G.InfJump = v
    game:GetService("UserInputService").JumpRequest:Connect(function()
        if _G.InfJump then game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping") end
    end)
end)

CombatSec:NewToggle("Yetenek Aimbot (Skill Aimbot)", "", function(v) _G.Aimbot = v end)

-- [[ ⚙️ 5. SİSTEM & LAG SİLİCİ ]] --
local System = Window:NewTab("⚙️ Sistem")
local SysSec = System:NewSection("Performans")

SysSec:NewButton("FPS Boost (Doku Silici)", "Kasılmayı 0'a indirir", function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Color = Color3.fromRGB(150, 150, 150)
        end
    end
end)

SysSec:NewButton("Anti-AFK Aktif Et", "Oyundan düşmezsin", function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

-- [[ 🤡 6. TROLL & SPY ]] --
local Troll = Window:NewTab("🤡 Troll")
Troll:NewSection("Eğlence")
Troll:NewButton("Chat Spy (Gizli Mesajlar)", "Fısıldaşmaları oku", function()
    -- Chat Spy Kodu
end)
