local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🏮 Axiore-Hub | VIP MASTER",
   LoadingTitle = "VIP Samurai Operasyon Merkezi",
   LoadingSubtitle = "by Axiore",
   ConfigurationSaving = {Enabled = true, FolderName = "AxioreHub", FileName = "AxioreConfig"},
   KeySystem = true, -- Şifre Sistemi Aktif Edildi!
   KeySettings = {
      Title = "Axiore VIP Giriş",
      Subtitle = "Lütfen Anahtarı Giriniz",
      Note = "Anahtar: axiore-samurai-2024", -- Şifren bu aga
      FileName = "AxioreKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"axiore-samurai-2024"} 
   }
})

-- [[ 🛠️ VIP AYARLAR & FPS BOOSTER ]] --
local SettingsTab = Window:CreateTab("⚙️ VIP Ayarlar", 4483362458)

SettingsTab:CreateButton({
   Name = "FPS Booster (Kasmayı Azalt)",
   Callback = function()
       local g = game
       local w = g.Workspace
       local l = g.Lighting
       local t = w:FindFirstChildOfClass("Terrain")
       t.WaterWaveSize = 0
       t.WaterWaveSpeed = 0
       t.WaterReflectance = 0
       t.WaterTransparency = 0
       l.GlobalShadows = false
       l.FogEnd = 9e9
       settings().Rendering.QualityLevel = 1
       for i, v in pairs(g:GetDescendants()) do
           if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
               v.Material = "Plastic"
               v.Reflectance = 0
           elseif v:IsA("Decal") or v:IsA("Texture") then
               v:Destroy()
           end
       end
       Rayfield:Notify({Title = "FPS Boost!", Content = "Gereksiz grafikler kapatıldı.", Duration = 3})
   end,
})

SettingsTab:CreateButton({
   Name = "Anti-AFK (Oyundan Atılma)",
   Callback = function()
       local vu = game:GetService("VirtualUser")
       game:GetService("Players").LocalPlayer.Idled:Connect(function()
           vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
           wait(1)
           vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
       end)
       Rayfield:Notify({Title = "Anti-AFK Aktif!", Content = "Artık oyundan atılmayacaksın.", Duration = 3})
   end,
})

-- [[ 🚀 SERVER HOP ]] --
SettingsTab:CreateButton({
   Name = "Server Hop (Başka Sunucuya Geç)",
   Callback = function()
       local Http = game:GetService("HttpService")
       local TPS = game:GetService("TeleportService")
       local Api = "https://games.roblox.com/v1/games/"
       local _place = game.PlaceId
       local _servers = Api.._place.."/servers/Public?sortOrder=Desc&limit=100"
       local function ListServers(cursor)
           local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
           return Http:JSONDecode(Raw)
       end
       local Next;
       repeat
           local Servers = ListServers(Next)
           for i,v in pairs(Servers.data) do
               if v.playing < v.maxPlayers and v.id ~= game.JobId then
                   TPS:TeleportToPlaceInstance(_place, v.id, game.Players.LocalPlayer)
               end
           end
           Next = Servers.nextPageCursor
       until not Next
   end,
})

-- [[ GENEL HİLELER (YENİLENMİŞ) ]] --
local MainTab = Window:CreateTab("🏠 Ana Sayfa", 4483362458)
MainTab:CreateSlider({
   Name = "Işık Hızı", Range = {16, 500}, Increment = 5, CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})

Rayfield:Notify({Title = "Axiore v6.0 VIP", Content = "Hoş geldin usta Samurai!", Duration = 5})
