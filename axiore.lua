local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🏮 Axiore-Hub | Mega Samurai Update",
   LoadingTitle = "Axiore Multi-Game Hub v3.0",
   LoadingSubtitle = "by Axiore",
   ConfigurationSaving = {Enabled = true, FolderName = "AxioreHub", FileName = "AxioreConfig"},
   KeySystem = false
})

-- [[ GENEL HİLELER ]] --
local MainTab = Window:CreateTab("🏠 Genel", 4483362458)
MainTab:CreateSlider({
   Name = "Hız", Range = {16, 500}, Increment = 1, CurrentValue = 16, Flag = "Spd", 
   Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end,
})

-- [[ BLOX FRUITS SEKMESİ ]] --
local BFWeb = Window:CreateTab("🌊 Blox Fruits", 4483362458)
BFWeb:CreateSection("Farm & Fruit")
BFWeb:CreateButton({
   Name = "Meyveleri Otomatik Topla (Fruit Snatcher)",
   Callback = function()
      for _,v in pairs(game.Workspace:GetChildren()) do
          if v:IsA("Tool") and v:FindFirstChild("Handle") then
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
          end
      end
      Rayfield:Notify({Title = "İşlem Tamam", Content = "Yerlerdeki meyveler toplandı!", Duration = 2})
   end,
})

-- [[ DOORS SEKMESİ ]] --
local DoorsTab = Window:CreateTab("👁️ Doors", 4483362458)
DoorsTab:CreateSection("Survival")
DoorsTab:CreateToggle({
   Name = "Rush/Ambush Uyarısı",
   CurrentValue = false,
   Callback = function(Value)
      game.Workspace.ChildAdded:Connect(function(child)
          if Value and (child.Name == "RushMoving" or child.Name == "AmbushMoving") then
              Rayfield:Notify({Title = "DİKKAT!", Content = "YARATIK GELİYOR! HEMEN SAKLAN!", Duration = 5})
          end
      end)
   end,
})

-- [[ PET SIMULATOR SEKMESİ ]] --
local PetTab = Window:CreateTab("🐱 Pet Sim", 4483362458)
PetTab:CreateSection("Auto Clicker")
PetTab:CreateToggle({
   Name = "Auto Click (Paraları Topla)",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoClick = Value
      while _G.AutoClick do
          -- Bu kısım simülatörlerde tıklama efektini tetikler
          local VirtualInputManager = game:GetService('VirtualInputManager')
          VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
          task.wait(0.1)
      end
   end,
})

-- [[ FORSAKEN SEKMESİ ]] --
local ForsakenTab = Window:CreateTab("⚔️ Forsaken", 4483362458)
ForsakenTab:CreateButton({
   Name = "En Yakın Düşmana Işınlan (Kill Aura)",
   Callback = function()
      -- Basit Kill Aura Mantığı
      local localPlayer = game.Players.LocalPlayer
      for _, player in pairs(game.Players:GetPlayers()) do
          if player ~= localPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
              localPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
              break
          end
      end
   end,
})

-- [[ GELİŞMİŞ UÇMA (FLY) ]] --
local FlyTab = Window:CreateTab("✈️ Uçma", 4483362458)
local flying = false
local speed = 50
FlyTab:CreateToggle({
   Name = "Uçuş Modu (Samurai Flight)",
   CurrentValue = false,
   Callback = function(Value)
      flying = Value
      local root = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
      game:GetService("RunService").Heartbeat:Connect(function()
          if flying then root.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * speed end
      end)
   end,
})

Rayfield:Notify({Title = "Axiore v3.0 Yüklendi!", Content = "Tüm oyun modları aktif edildi!", Duration = 5})
