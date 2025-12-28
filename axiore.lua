-- [[ AXIORE-HUB v1.0 ]] --
-- Bu kod Axiore-Hub'ın ana kaynak kodudur.
-- Tablette çalıştırmak için GitHub'a bu haliyle yüklenmelidir.

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🏮 Axiore-Hub | Samurai Edition",
   LoadingTitle = "Axiore Operasyon Merkezi",
   LoadingSubtitle = "by Axiore",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "AxioreHub", 
      FileName = "AxioreConfig"
   },
   KeySystem = false -- Hızlı test için şifre sormaz
})

-- [[ ANA SEKME ]] --
local MainTab = Window:CreateTab("🏠 Ana Sayfa", 4483362458) 

local Section = MainTab:CreateSection("Karakter Hileleri")

-- Hız Ayarı (Speed)
local Slider = MainTab:CreateSlider({
   Name = "Yürüme Hızı (Speed)",
   Range = {16, 300},
   Increment = 1,
   Suffix = "Hız",
   CurrentValue = 16,
   Flag = "SpeedSlider", 
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

-- Zıplama Ayarı (Jump)
local Button = MainTab:CreateButton({
   Name = "Zıplama Gücü (Jump)",
   Callback = function()
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
      game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
   end,
})

-- Yükleme Bildirimi
Rayfield:Notify({
   Title = "Hub Aktif!",
   Content = "Axiore-Hub Başarıyla Yüklendi. İyi Oyunlar!",
   Duration = 5,
   Image = 4483362458,
})
