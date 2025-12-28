local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- [[ OYUN ID'LERİNİ TANIMLAYALIM ]] --
local GameID = game.PlaceId
local GameName = "Genel Sunucu"

-- Oyun İsimlerini Belirleme
if GameID == 2753915549 or GameID == 444227216 or GameID == 7449423635 then
    GameName = "Blox Fruits"
elseif GameID == 6516141723 then
    GameName = "Doors"
elseif GameID == 8737899170 then
    GameName = "Pet Simulator 99"
elseif GameID == 155615604 or GameID == 142823291 then -- Örnek Forsaken/Combat IDs
    GameName = "Forsaken / Combat"
end

local Window = Rayfield:CreateWindow({
   Name = "🏮 Axiore-Hub | " .. GameName,
   LoadingTitle = "Samurai Akıllı Sistem Devrede",
   LoadingSubtitle = "by Axiore",
   ConfigurationSaving = {Enabled = true, FolderName = "AxioreHub", FileName = "AxioreConfig"},
   KeySystem = false
})

-- [[ HER OYUNDA ÇIKACAK ANA SEKME ]] --
local MainTab = Window:CreateTab("🏠 Ana Sayfa", 4483362458)
MainTab:CreateSection("Genel Karakter Ayarları")
MainTab:CreateSlider({
   Name = "Hız", Range = {16, 500}, Increment = 5, CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

-- [[ OTOMATİK OYUN ÖZELLİKLERİ ]] --

if GameName == "Blox Fruits" then
    local BFTab = Window:CreateTab("🌊 Blox Fruits", 4483362458)
    BFTab:CreateButton({
        Name = "Meyveleri Topla (Fruit Snatcher)",
        Callback = function()
            for _,v in pairs(game.Workspace:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("Handle") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                end
            end
        end,
    })
elseif GameName == "Doors" then
    local DoorsTab = Window:CreateTab("👁️ Doors", 4483362458)
    DoorsTab:CreateToggle({
        Name = "Yaratık Uyarısı",
        CurrentValue = false,
        Callback = function(v) _G.DoorsAlert = v end,
    })
elseif GameName == "Pet Simulator 99" then
    local PetTab = Window:CreateTab("🐱 Pet Sim", 4483362458)
    PetTab:CreateToggle({
        Name = "Auto-Click",
        CurrentValue = false,
        Callback = function(v) _G.AutoClick = v end,
    })
end

-- [[ ADMIN SEKME (HER OYUNDA VAR) ]] --
local AdminTab = Window:CreateTab("📜 Admin", 4483362458)
AdminTab:CreateButton({Name = "Noclip", Callback = function() end})
AdminTab:CreateButton({Name = "Fly", Callback = function() end})

Rayfield:Notify({Title = "Axiore-Hub: " .. GameName, Content = "Oyun başarıyla tanındı ve hileler yüklendi!", Duration = 5})
