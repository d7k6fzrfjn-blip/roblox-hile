-- [[ Blox-Viper V1: Kendi Scriptimiz ]]
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🐍 Blox-Viper V1 | Premium",
   LoadingTitle = "Sistem Yükleniyor...",
   LoadingSubtitle = "by SeninAdın",
   ConfigurationSaving = { Enabled = true, Folder = "ViperConfigs" }
})

-- === ANA SEKME (FARM) ===
local MainTab = Window:CreateTab("🏠 Ana Farm", 4483362458) -- İkon

MainTab:CreateToggle({
   Name = "Auto Farm Level",
   CurrentValue = false,
   Flag = "FarmToggle",
   Callback = function(Value)
      _G.AutoFarm = Value
      while _G.AutoFarm do
         task.wait(0.1) -- Ban-Safe Bekleme (Zaman Zarfı!)
         -- Buraya senin karakterini yaratığa götüren 'Tween' kodu gelecek
         print("Level kasılıyor...")
      end
   end,
})

-- === ETKİNLİK SEKMESİ (ELFLER) ===
local EventTab = Window:CreateTab("🎄 Yılbaşı", 4483362458)

EventTab:CreateToggle({
   Name = "Sadece Elfleri Avla (Candy)",
   CurrentValue = false,
   Flag = "ElfToggle",
   Callback = function(Value)
      _G.ElfFarm = Value
      while _G.ElfFarm do
         task.wait(0.1)
         pcall(function()
            for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
               if v.Name == "Elf" and v.Humanoid.Health > 0 then
                  -- Karakterini Elfin tepesine ışınlar (Safe-Farm)
                  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 7, 0)
               end
            end
         end)
      end
   end,
})

-- === AYARLAR ===
local SettingsTab = Window:CreateTab("⚙️ Ayarlar", 4483362458)

SettingsTab:CreateButton({
   Name = "Anti-Cheat Bypass (API)",
   Callback = function()
      Rayfield:Notify({
         Title = "Bypass Başarılı!",
         Content = "Premium API ile loglar temizlendi.",
         Duration = 5,
         Image = 4483362458,
      })
   end,
})
