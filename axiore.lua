-- Rayfield yerine daha hızlı yüklenen Kavo kütüphanesini deneyelim
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🏮 Axiore-Hub | Samurai Light", "GrapeTheme")

-- [[ ANA SAYFA ]] --
local Main = Window:NewTab("🏠 Ana Sayfa")
local MainSection = Main:NewSection("Karakter Ayarları")

MainSection:NewSlider("Yürüme Hızı", "Hızını artırır", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

MainSection:NewButton("Zıplama Gücü", "Yükseğe zıplatır", function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 150
end)

-- [[ MM2 ÖZEL ]] --
local MM2 = Window:NewTab("🔪 MM2 Mod")
local MM2Section = MM2:NewSection("Düşman Takibi")

MM2Section:NewButton("ESP (Katil/Şerif Göster)", "Rakipleri parlatır", function()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v.Character and not v.Character:FindFirstChild("Highlight") then
            local hl = Instance.new("Highlight", v.Character)
            if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") then
                hl.FillColor = Color3.fromRGB(255, 0, 0) -- Katil Kırmızı
            elseif v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
                hl.FillColor = Color3.fromRGB(0, 0, 255) -- Şerif Mavi
            else
                hl.FillColor = Color3.fromRGB(255, 255, 255) -- Diğerleri Beyaz
            end
        end
    end
end)

-- [[ AVATAR ]] --
local Avatar = Window:NewTab("🎭 Avatar")
local AvatarSection = Avatar:NewSection("Görünüm")

AvatarSection:NewButton("Neon Samurai", "Karakteri parlatır", function()
    for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("BasePart") then v.Material = Enum.Material.Neon v.Color = Color3.new(1,0,0) end
    end
end)
