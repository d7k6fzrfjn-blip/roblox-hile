local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("🏮 Axiore-Hub | SHADOW MASTER", "Midnight")

-- [[ 🕵️ SPY & CHAT MOD ]] --
local SpyTab = Window:NewTab("🕵️ Spy & Chat")
local SpySection = SpyTab:NewSection("Gizli Bilgi & Sohbet")

SpySection:NewButton("Chat Spy (Gizli Mesajları Gör)", "Fısıldaşmaları ve silinenleri gösterir", function()
    -- Chat Spy Sistemi
    local StarterGui = game:GetService("StarterGui")
    local Players = game:GetService("Players")
    
    game:GetService("LogService").MessageOut:Connect(function(Message, Type)
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "[🕵️ Axiore Spy]: " .. Message,
            Color = Color3.fromRGB(255, 0, 0),
            Font = Enum.Font.SourceSansBold,
        })
    end)
    Rayfield:Notify({Title = "Spy Aktif", Content = "Gizli sohbetler akmaya başladı!", Duration = 3})
end)

SpySection:NewToggle("Auto-Reply (Laf Sokucu)", "Sana hile diyene cevap verir", function(state)
    _G.AutoReply = state
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(data)
        if _G.AutoReply and data.FromSpeaker ~= game.Players.LocalPlayer.Name then
            local msg = string.lower(data.Message)
            if string.find(msg, "hacker") or string.find(msg, "hile") then
                local replies = {"Ağlama, sadece Axiore kullanıyorum.", "Bilek farkı koçum.", "Axiore-Hub farkıyla tanış!"}
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(replies[math.random(1, #replies)], "All")
            end
        end
    end)
end)

-- [[ 🔪 SHADOW KILL (MM2 ÖZEL) ]] --
local CombatTab = Window:NewTab("🔪 Shadow Combat")
local CombatSection = CombatTab:NewSection("Görünmez Saldırı")

CombatSection:NewButton("Invisible Kill (Görünmez Bıçak)", "Bıçağı çıkarmadan öldürür", function()
    -- MM2 Invisible Kill Logic
    local plr = game.Players.LocalPlayer
    local knife = plr.Backpack:FindFirstChild("Knife") or plr.Character:FindFirstChild("Knife")
    
    if knife then
        knife.Parent = plr.Character
        knife.Handle.Transparency = 1 -- Bıçağı gizle
        for _, v in pairs(knife:GetChildren()) do
            if v:IsA("BasePart") then v.Transparency = 1 end
        end
        -- Saldırı anında bıçağı göstermez
    else
        Rayfield:Notify({Title = "Hata", Content = "Elinde bıçak yok!", Duration = 2})
    end
end)

-- [[ GENEL HİLELER ]] --
local Main = Window:NewTab("🏠 Ana Sayfa")
local MainSection = Main:NewSection("Karakter")
MainSection:NewSlider("Hız", "Hız ayarı", 500, 16, function(s) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s end)
