local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- [[ MENÜYÜ OLUŞTUR (HİÇBİR ŞARTA BAĞLI DEĞİL) ]] --
local Window = Rayfield:CreateWindow({
   Name = "🏮 Axiore-Hub | UNSTOPPABLE",
   LoadingTitle = "Samurai Master v9.5",
   LoadingSubtitle = "by Axiore",
   KeySystem = true,
   KeySettings = {
      Title = "VIP Giriş",
      Subtitle = "Şifre: axiore-samurai-2024",
      Key = {"axiore-samurai-2024"} 
   }
})

-- [[ MM2 SEKMENİ ARTIK HEP BURADA! ]] --
local MM2Tab = Window:CreateTab("🔪 MM2 & Savaş", 4483362458)

MM2Tab:CreateButton({
   Name = "ESP Aktif Et (Katil/Şerif Göster)",
   Callback = function()
       -- MM2 ESP Kodu (Sadece butona basınca devreye girer)
       for _, v in pairs(game.Players:GetPlayers()) do
           if v.Character then
               local hl = Instance.new("Highlight", v.Character)
               hl.FillTransparency = 0.5
               if v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") then
                   hl.FillColor = Color3.new(1,0,0) -- KATİL KIRMIZI
               elseif v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
                   hl.FillColor = Color3.new(0,0,1) -- ŞERİF MAVİ
               end
           end
       end
   end,
})

-- [[ AVATAR & STİL (KIYAFET HİLESİ) ]] --
local AvatarTab = Window:CreateTab("🎭 Avatar", 4483362458)
AvatarTab:CreateButton({
   Name = "Karakteri Parlat (Neon)",
   Callback = function()
      for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
         if v:IsA("BasePart") then v.Material = Enum.Material.Neon v.Color = Color3.new(1,0,0) end
      end
   end,
})

-- [[ GENEL AYARLAR ]] --
local MainTab = Window:CreateTab("🏠 Ana Sayfa", 4483362458)
MainTab:CreateSlider({
   Name = "Hız Ayarı", Range = {16, 500}, Increment = 5, CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

Rayfield:Notify({Title = "Sistem Hazır", Content = "Menü Başarıyla Yüklendi!", Duration = 5})
