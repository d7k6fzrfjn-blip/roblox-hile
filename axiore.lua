local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- [[ OYUN TANIMA SİSTEMİ ]] --
local GameID = game.PlaceId
local GameName = (GameID == 142823291) and "Murder Mystery 2" or "Axiore Multi-Hub"

local Window = Rayfield:CreateWindow({
   Name = "🏮 Axiore-Hub | " .. GameName,
   LoadingTitle = "VIP Samurai Operasyon Merkezi v7.0",
   LoadingSubtitle = "by Axiore",
   KeySystem = true,
   KeySettings = {
      Title = "Axiore VIP Giriş",
      Subtitle = "Şifre: axiore-samurai-2024",
      Key = {"axiore-samurai-2024"} 
   }
})

-- [[ MM2 ÖZEL SEKME ]] --
if GameID == 142823291 then
    local MM2Tab = Window:CreateTab("🔪 MM2 Mod", 4483362458)
    local MM2Section = MM2Tab:CreateSection("Savaş & Tespit")

    MM2Tab:CreateToggle({
       Name = "Katil & Şerif ESP (Duvardan Gör)",
       CurrentValue = false,
       Callback = function(Value)
          _G.MM2ESP = Value
          while _G.MM2ESP do
             for _, v in pairs(game.Players:GetPlayers()) do
                if v.Character and v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") then
                   -- Katili Kırmızı Yap
                   if not v.Character:FindFirstChild("AxioreHighlight") then
                      local hl = Instance.new("Highlight", v.Character)
                      hl.Name = "AxioreHighlight"
                      hl.FillColor = Color3.fromRGB(255, 0, 0)
                   end
                elseif v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
                   -- Şerifi Mavi Yap
                   if not v.Character:FindFirstChild("AxioreHighlight") then
                      local hl = Instance.new("Highlight", v.Character)
                      hl.Name = "AxioreHighlight"
                      hl.FillColor = Color3.fromRGB(0, 0, 255)
                   end
                end
             end
             task.wait(1)
          end
       end,
    })

    MM2Tab:CreateToggle({
       Name = "Kill Aura (Otomatik Biçici)",
       CurrentValue = false,
       Callback = function(Value)
          _G.KillAura = Value
          while _G.KillAura do
             if game.Players.LocalPlayer.Character:FindFirstChild("Knife") then
                for _, v in pairs(game.Players:GetPlayers()) do
                   if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                      local dist = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                      if dist < 15 then
                         -- Buraya bıçak savurma event'i gelecek
                         game.Players.LocalPlayer.Character.Knife.Stab:FireServer()
                      end
                   end
                end
             end
             task.wait(0.1)
          end
       end,
    })

    MM2Tab:CreateButton({
       Name = "Düşen Silahı Al (Auto Gun)",
       Callback = function()
          local gun = game.Workspace:FindFirstChild("GunDrop")
          if gun then
             game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gun.CFrame
          else
             Rayfield:Notify({Title = "Hata", Content = "Yerde silah yok!", Duration = 2})
          end
       end,
    })
end

-- [[ GENEL HİLELER (SPEED/FLY) ]] --
local MainTab = Window:CreateTab("🏠 Genel", 4483362458)
MainTab:CreateSlider({
   Name = "Hız", Range = {16, 500}, Increment = 5, CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

Rayfield:Notify({Title = "Axiore v7.0", Content = "MM2 Modülleri Yüklendi!", Duration = 5})
