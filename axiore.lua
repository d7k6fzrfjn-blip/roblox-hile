local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🏮 Axiore-Hub | Samurai God Mode",
   LoadingTitle = "Axiore Operasyon Merkezi v2.0",
   LoadingSubtitle = "by Axiore",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "AxioreHub", 
      FileName = "AxioreConfig"
   },
   KeySystem = false
})

-- [[ ANA SAYFA SEKMESİ ]] --
local MainTab = Window:CreateTab("🏠 Ana Sayfa", 4483362458)
local MainSection = MainTab:CreateSection("Karakter Ayarları")

MainTab:CreateSlider({
   Name = "Yürüme Hızı (Speed)",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Flag = "SpeedSlider", 
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

MainTab:CreateButton({
   Name = "Zıplama Gücü (Jump)",
   Callback = function()
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
      game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
   end,
})

-- [[ GÖRÜNÜRLÜK (ESP) SEKMESİ ]] --
local VisualsTab = Window:CreateTab("👁️ Görünürlük", 4483362458)
local ESPSection = VisualsTab:CreateSection("Oyuncu ESP")

VisualsTab:CreateToggle({
   Name = "İsimleri Göster (Names)",
   CurrentValue = false,
   Flag = "NameESP",
   Callback = function(Value)
       -- Basit ESP mantığı: Karakterlerin üzerine BillboardGui ekler
       for _, v in pairs(game.Players:GetPlayers()) do
           if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
               if Value then
                   local tag = Instance.new("BillboardGui", v.Character.Head)
                   tag.Name = "AxioreTag"
                   tag.Size = UDim2.new(0,100,0,50)
                   tag.AlwaysOnTop = true
                   local label = Instance.new("TextLabel", tag)
                   label.Text = v.Name
                   label.Size = UDim2.new(1,0,1,0)
                   label.TextColor3 = Color3.new(1,0,0) -- Kırmızı
                   label.BackgroundTransparency = 1
               else
                   if v.Character.Head:FindFirstChild("AxioreTag") then
                       v.Character.Head.AxioreTag:Destroy()
                   end
               end
           end
       end
   end,
})

-- [[ UÇMA (FLY) SEKMESİ ]] --
local FlyTab = Window:CreateTab("✈️ Uçma", 4483362458)
FlyTab:CreateSection("Samurai Air Force")

FlyTab:CreateButton({
   Name = "Uçmayı Aktif Et (Fly)",
   Callback = function()
      -- Basit Fly scripti (Mobil uyumlu)
      local player = game.Players.LocalPlayer
      local char = player.Character
      local hum = char:WaitForChild("Humanoid")
      local root = char:WaitForChild("HumanoidRootPart")
      
      local bv = Instance.new("BodyVelocity", root)
      bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
      bv.Velocity = Vector3.new(0, 0.5, 0)
      
      Rayfield:Notify({Title = "Fly Aktif!", Content = "Artık uçabilirsin!", Duration = 3})
   end,
})

Rayfield:Notify({
   Title = "Axiore v2.0 Yüklendi!",
   Content = "Yeni özellikler eklendi, Samurai savaşa hazır.",
   Duration = 5,
   Image = 4483362458,
})
