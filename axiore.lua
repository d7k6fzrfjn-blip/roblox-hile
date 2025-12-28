local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🏮 Axiore-Hub | Samurai Admin Edition",
   LoadingTitle = "Axiore God Mode v4.5",
   LoadingSubtitle = "by Axiore",
   ConfigurationSaving = {Enabled = true, FolderName = "AxioreHub", FileName = "AxioreConfig"},
   KeySystem = false
})

-- [[ 🛡️ GÜÇLÜ ADMIN ÖZELLİKLERİ ]] --
local AdminTab = Window:CreateTab("📜 Admin", 4483362458)

AdminTab:CreateToggle({
   Name = "Noclip (Duvarlardan Geçme)",
   CurrentValue = false,
   Callback = function(Value)
       _G.Noclip = Value
       game:GetService("RunService").Stepped:Connect(function()
           if _G.Noclip and game.Players.LocalPlayer.Character then
               for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                   if v:IsA("BasePart") then v.CanCollide = false end
               end
           end
       end)
   end,
})

AdminTab:CreateButton({
   Name = "Görünmezlik (Invisibility)",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       if char then
           for _, v in pairs(char:GetDescendants()) do
               if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end
           end
       end
       Rayfield:Notify({Title = "Görünmezlik!", Content = "Artık kimse seni göremez.", Duration = 3})
   end,
})

AdminTab:CreateButton({
   Name = "Altına Platform Koy (Platform)",
   Callback = function()
       local p = Instance.new("Part", game.Workspace)
       p.Size = Vector3.new(10, 1, 10)
       p.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -4, 0)
       p.Anchored = true
   end,
})

-- [[ 🌊 BLOX FRUITS & OYUNLAR ]] --
local GamesTab = Window:CreateTab("🎮 Oyunlar", 4483362458)
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

-- [[ ✈️ HAREKET (SPEED & FLY) ]] --
local MoveTab = Window:CreateTab("✈️ Hareket", 4483362458)
MoveTab:CreateSlider({
   Name = "Hız (WalkSpeed)", Range = {16, 500}, Increment = 5, CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

local flying = false
local speed = 50
MoveTab:CreateToggle({
   Name = "Samurai Flight (Fly)",
   CurrentValue = false,
   Callback = function(Value)
      flying = Value
      local root = game.Players.LocalPlayer.Character.HumanoidRootPart
      game:GetService("RunService").Heartbeat:Connect(function()
          if flying then root.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * speed end
      end)
   end,
})

MoveTab:CreateSlider({
   Name = "Uçuş Hızı", Range = {10, 300}, Increment = 5, CurrentValue = 50,
   Callback = function(v) speed = v end,
})

Rayfield:Notify({Title = "Axiore v4.5 AKTİF", Content = "Admin özellikleri eklendi!", Duration = 5})
