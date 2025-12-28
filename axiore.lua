local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🏮 Axiore-Hub | FINAL GOD MODE",
   LoadingTitle = "Samurai Operasyon Merkezi v4.0",
   LoadingSubtitle = "by Axiore",
   ConfigurationSaving = {Enabled = true, FolderName = "AxioreHub", FileName = "AxioreConfig"},
   KeySystem = false
})

-- [[ 🚀 ADMIN KOMUTLARI (Infinite Yield) ]] --
local AdminTab = Window:CreateTab("📜 Admin", 4483362458)
AdminTab:CreateButton({
   Name = "Infinite Yield Yükle (Yüzlerce Komut)",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

-- [[ 🔫 SAVAŞ & AIMBOT (Forsaken/Combat) ]] --
local CombatTab = Window:CreateTab("🔫 Savaş", 4483362458)
CombatTab:CreateToggle({
   Name = "Silent Aim (Otomatik Nişan)",
   CurrentValue = false,
   Callback = function(Value)
       _G.Aimbot = Value
       game:GetService("RunService").RenderStepped:Connect(function()
           if _G.Aimbot then
               -- Buraya en yakın düşmana kilitlenme mantığı gelecek
           end
       end)
   end,
})

-- [[ 👁️ GÖRÜNÜRLÜK (ESP) ]] --
local VisualsTab = Window:CreateTab("👁️ Görünürlük", 4483362458)
VisualsTab:CreateToggle({
   Name = "Oyuncu İsimlerini Göster",
   CurrentValue = false,
   Callback = function(Value)
       -- ESP Kodları buraya
   end,
})

-- [[ 🎮 OYUN SEKMELERİ (Blox Fruits / Doors / Pet Sim) ]] --
local GamesTab = Window:CreateTab("🎮 Oyunlar", 4483362458)

GamesTab:CreateSection("Blox Fruits")
GamesTab:CreateButton({
   Name = "Meyveleri Işınla (Fruit Snatcher)",
   Callback = function()
       for _,v in pairs(game.Workspace:GetChildren()) do
           if v:IsA("Tool") and v:FindFirstChild("Handle") then
               game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
           end
       end
   end,
})

GamesTab:CreateSection("Doors")
GamesTab:CreateToggle({
   Name = "Yaratık Gelince Uyar",
   CurrentValue = false,
   Callback = function(Value)
       -- Doors uyarısı
   end,
})

-- [[ ✈️ HAREKET & UÇMA ]] --
local MoveTab = Window:CreateTab("✈️ Hareket", 4483362458)
MoveTab:CreateSlider({
   Name = "Işık Hızı", Range = {16, 1000}, Increment = 10, CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

local flying = false
MoveTab:CreateToggle({
   Name = "Samurai Flight (Uçuş)",
   CurrentValue = false,
   Callback = function(Value)
      flying = Value
      local root = game.Players.LocalPlayer.Character.HumanoidRootPart
      game:GetService("RunService").Heartbeat:Connect(function()
          if flying then root.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * 100 end
      end)
   end,
})

-- [[ 🛠️ AYARLAR ]] --
local SettingsTab = Window:CreateTab("⚙️ Ayarlar", 4483362458)
SettingsTab:CreateButton({
   Name = "Menüyü Kapat (Destroy)",
   Callback = function() Rayfield:Destroy() end,
})

Rayfield:Notify({Title = "Axiore v4.0 YÜKLENDİ", Content = "Durdurulamaz güç elinde!", Duration = 5})
