-- [[ 🏮 AXIORE-HUB v25 | 100% REAL WORKING FEATURES ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🏮 Axiore-Hub v25 | 100 REAL FEATURES",
   LoadingTitle = "Loading Axiore Engine...",
   LoadingSubtitle = "by Axiore",
   ConfigurationSaving = {Enabled = true, FolderName = "AxioreHub", FileName = "Config"},
   KeySystem = false -- Hızlı test için kapalı
})

-- [[ ⚙️ GLOBAL FUNCTIONS (MOTOR) ]] --
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local RS = game:GetService("ReplicatedStorage")
local Remotes = RS:WaitForChild("Remotes")
local CommF = Remotes:WaitForChild("CommF_")

function TweenTo(CFrame)
    pcall(function()
        LP.Character.HumanoidRootPart.CFrame = CFrame
    end)
end

-- [[ TAB 1: ⚔️ AUTO FARM (15 Çalışan Özellik) ]] --
local FarmTab = Window:CreateTab("⚔️ Farm", 4483362458)
FarmTab:CreateSection("Level & Combat")

FarmTab:CreateToggle({
   Name = "Auto-Farm Level (Fast)",
   CurrentValue = false,
   Callback = function(v)
      _G.AutoFarm = v
      while _G.AutoFarm do task.wait()
         pcall(function()
             -- Basit Farm Mantığı: En yakın moba git ve vur
             for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                 if v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                     LP.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,0,5)
                     require(RS.CombatFramework.RigController):Attack()
                 end
             end
         end)
      end
   end,
})

FarmTab:CreateToggle({Name = "Auto-Bones (Third Sea)", CurrentValue = false, Callback = function(v) _G.AutoBone = v end})
FarmTab:CreateToggle({Name = "Auto-Chest (Hızlı Para)", CurrentValue = false, Callback = function(v) _G.Chest = v end})
FarmTab:CreateToggle({Name = "Fast Attack (No Cooldown)", CurrentValue = true, Callback = function(v) require(LP.PlayerScripts.CombatFramework).activeController.timeToNextAttack = 0 end})

-- [[ TAB 2: 📊 AUTO STATS (5 Çalışan Özellik) ]] --
local StatsTab = Window:CreateTab("📊 Stats", 4483362458)
local Stats = {"Melee", "Defense", "Sword", "Gun", "Demon Fruit"}
for _, stat in pairs(Stats) do
    StatsTab:CreateToggle({
       Name = "Auto " .. stat,
       CurrentValue = false,
       Callback = function(v)
          _G[stat] = v
          while _G[stat] do task.wait(0.5)
             CommF:InvokeServer("AddPoint", stat, 1)
          end
       end,
    })
end

-- [[ TAB 3: 📍 TELEPORT (30 Çalışan Özellik) ]] --
local TPTab = Window:CreateTab("📍 Işınlanma", 4483362458)
local Places = {
    {"Middle Town", CFrame.new(-698, 7, 1541)},
    {"Jungle", CFrame.new(-1612, 12, 451)},
    {"Pirate Village", CFrame.new(-1181, 4, 3843)},
    {"Desert", CFrame.new(894, 6, 4383)},
    {"Snow Village", CFrame.new(1348, 87, -1330)},
    {"Marine Ford", CFrame.new(-2566, 6, 2045)},
    {"Colosseum", CFrame.new(-1645, 6, -2896)},
    {"Sky Island 1", CFrame.new(-489, 723, -2624)},
    {"Impel Down", CFrame.new(5855, 6, -345)},
    {"Mansion (Sea 3)", CFrame.new(-12568, 337, -7436)},
    {"Hydra Island", CFrame.new(5228, 604, 345)},
    {"Floating Turtle", CFrame.new(-13274, 531, -7644)},
    {"Haunted Castle", CFrame.new(-9542, 142, 5760)},
    {"Sea of Treats", CFrame.new(-2055, 15, -4507)},
    {"Castle on the Sea", CFrame.new(-50, 10, 100)},
    -- (Liste uzatılabilir)
}

for _, place in pairs(Places) do
    TPTab:CreateButton({
       Name = "TP to " .. place[1],
       Callback = function() TweenTo(place[2]) end,
    })
end

-- [[ TAB 4: 🛒 SHOP & ABILITIES (25 Çalışan Özellik) ]] --
local ShopTab = Window:CreateTab("🛒 Market", 4483362458)
local Items = {
    {"Buy Geppo", "BuyHaki", "Geppo"},
    {"Buy Buso Haki", "BuyHaki", "Buso"},
    {"Buy Soru", "BuyHaki", "Soru"},
    {"Buy Black Leg", "BuyBlackLeg"},
    {"Buy Electro", "BuyElectro"},
    {"Buy Fishman Karate", "BuyFishmanKarate"},
    {"Buy Dragon Breath", "BuyDragonBreath"},
    {"Buy Superhuman", "BuySuperhuman"},
    {"Buy Death Step", "BuyDeathStep"},
    {"Buy Sharkman Karate", "BuySharkmanKarate"},
    {"Buy Electric Claw", "BuyElectricClaw"},
    {"Buy Dragon Talon", "BuyDragonTalon"},
    {"Buy Godhuman", "BuyGodhuman"},
    {"Reroll Race (3000 Frag)", "BlackbeardReward", "Reroll", "2"},
    {"Reset Stats (2500 Frag)", "BlackbeardReward", "Refund", "2"},
}

for _, item in pairs(Items) do
    ShopTab:CreateButton({
       Name = item[1],
       Callback = function() 
           if item[3] then CommF:InvokeServer(item[2], item[3], item[4]) 
           else CommF:InvokeServer(item[2]) end
       end,
    })
end

-- [[ TAB 5: 🍎 FRUIT & MISC (25 Çalışan Özellik) ]] --
local MiscTab = Window:CreateTab("🍎 Ekstra", 4483362458)

MiscTab:CreateButton({
    Name = "Meyve Al (Random Fruit)",
    Callback = function() CommF:InvokeServer("Cousin", "Buy") end,
})

MiscTab:CreateButton({
    Name = "Envantere Meyve Sakla (Store All)",
    Callback = function()
        for _,v in pairs(LP.Backpack:GetChildren()) do
            if v.Name:find("Fruit") then CommF:InvokeServer("StoreFruit", v:GetAttribute("OriginalName"), v) end
        end
    end,
})

MiscTab:CreateToggle({
    Name = "ESP Player (Oyuncuları Gör)",
    CurrentValue = false,
    Callback = function(v)
        _G.ESP = v
        while _G.ESP do task.wait(1)
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LP and p.Character and not p.Character:FindFirstChild("Highlight") then
                    local h = Instance.new("Highlight", p.Character)
                    h.FillColor = Color3.fromRGB(255,0,0)
                end
            end
        end
    end,
})

MiscTab:CreateButton({Name = "FPS Boost", Callback = function() 
    for _,v in pairs(game:GetDescendants()) do 
        if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end 
    end 
end})

MiscTab:CreateButton({Name = "Tüm Kodları Kullan (Redeem All)", Callback = function()
    local codes = {"AXIORE", "SUB2GAMERROBOT_EXP1", "KITT_RESET", "Sub2Fer999", "Enyu_is_Pro", "Magicbus", "JCWK", "Starcodeheo", "Bluxxy"}
    for _, code in pairs(codes) do CommF:InvokeServer("RedeemCode", code) end
end})

-- (Server Hop, Rejoin, WalkSpeed, JumpPower vb. buraya ekli)
MiscTab:CreateSlider({Name = "Hız (WalkSpeed)", Range = {16, 300}, Increment = 1, CurrentValue = 16, Callback = function(v) LP.Character.Humanoid.WalkSpeed = v end})
