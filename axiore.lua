local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- OYUNUN KİMLİĞİNİ ÖĞRENMEK İÇİN LOGLARA YAZDIRALIM
print("Axiore-Hub: Girdiğin Oyun ID: " .. tostring(game.PlaceId))

local GameID = game.PlaceId
local GameName = "Genel Sunucu"

-- BURAYA SENİN GİRDİĞİN OYUNUN ID'SİNİ EKLEYELİM
if GameID == 2753915549 or GameID == 444227216 or GameID == 7449423635 then
    GameName = "Blox Fruits"
elseif GameID == 6516141723 then
    GameName = "Doors"
elseif GameID == 8737899170 or GameID == 16498369169 then -- Pet Sim 99 yeni ID eklendi
    GameName = "Pet Simulator 99"
else
    -- Eğer oyun listede yoksa, yine de genel hileleri açar
    GameName = "Bilinmeyen Oyun (" .. tostring(GameID) .. ")"
end

local Window = Rayfield:CreateWindow({
   Name = "🏮 Axiore-Hub | " .. GameName,
   LoadingTitle = "Samurai Akıllı Sistem v5.1",
   LoadingSubtitle = "by Axiore",
   ConfigurationSaving = {Enabled = true, FolderName = "AxioreHub", FileName = "AxioreConfig"},
   KeySystem = false
})

-- [[ GENEL HİLELER (HER OYUNDA ÇALIŞIR) ]] --
local MainTab = Window:CreateTab("🏠 Ana Sayfa", 4483362458)
MainTab:CreateSlider({
   Name = "Hız", Range = {16, 500}, Increment = 5, CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

-- Eğer "Genel Sunucu" bile açılmıyorsa Rayfield kütüphanesi yüklenememiş demektir.
Rayfield:Notify({Title = "Axiore Sistem", Content = GameName .. " Tespit Edildi!", Duration = 5})
