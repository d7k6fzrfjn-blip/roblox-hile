local AvatarTab = Window:CreateTab("🎭 Avatar & Stil", 4483362458)

AvatarTab:CreateSection("Kıyafet Hırsızı")

local targetPlayer = ""
AvatarTab:CreateInput({
   Name = "Oyuncu Adı Yaz (Kopyalamak İçin)",
   PlaceholderText = "Örn: Axiore",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      targetPlayer = Text
   end,
})

AvatarTab:CreateButton({
   Name = "Kıyafetlerini Kopyala (Outfit Steal)",
   Callback = function()
      local p1 = game.Players.LocalPlayer
      local p2 = game.Players:FindFirstChild(targetPlayer)
      
      if p2 and p2.Character then
         -- Mevcut aksesuarları sil
         for _, v in pairs(p1.Character:GetChildren()) do
            if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") then
               v:Destroy()
            end
         end
         -- Karşıdakinin kıyafetlerini kopyala
         for _, v in pairs(p2.Character:GetChildren()) do
            if v:IsA("Accessory") or v:IsA("Shirt") or v:IsA("Pants") then
               local clone = v:Clone()
               clone.Parent = p1.Character
            end
         end
         Rayfield:Notify({Title = "Başarılı!", Content = targetPlayer .. " adlı oyuncunun stili çalındı!", Duration = 3})
      else
         Rayfield:Notify({Title = "Hata", Content = "Oyuncu bulunamadı!", Duration = 3})
      end
   end,
})

AvatarTab:CreateSection("Görünüm Efektleri")

AvatarTab:CreateButton({
   Name = "Karakter Parlatıcı (Neon Samurai)",
   Callback = function()
      for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
         if v:IsA("BasePart") then
            v.Material = Enum.Material.Neon
            v.Color = Color3.fromRGB(255, 0, 0)
         end
      end
   end,
})

AvatarTab:CreateToggle({
   Name = "Gökkuşağı Karakter (RGB)",
   CurrentValue = false,
   Callback = function(Value)
      _G.RGBChar = Value
      while _G.RGBChar do
         for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v:IsA("BasePart") then
               v.Color = Color3.fromHSV(tick()%5/5, 1, 1)
            end
         end
         task.wait(0.1)
      end
   end,
})
