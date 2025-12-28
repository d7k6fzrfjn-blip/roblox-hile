-- [[ AXIORE CUSTOM UI v1.0 ]] --
local AxioreGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedBtn = Instance.new("TextButton")

-- Arayüzü Oluşturma
AxioreGui.Name = "AxioreCustom"
AxioreGui.Parent = game.CoreGui

MainFrame.Name = "MainFrame"
MainFrame.Parent = AxioreGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20) -- Koyu Samurai Siyahı
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -100)
MainFrame.Size = UDim2.new(0, 200, 0, 250)
MainFrame.Active = true
MainFrame.Draggable = true -- Sürükleme özelliği

Title.Parent = MainFrame
Title.Text = "🏮 AXIORE HUB"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.TextColor3 = Color3.fromRGB(255, 0, 0) -- Kan Kırmızısı
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

SpeedBtn.Parent = MainFrame
SpeedBtn.Text = "Hız Aktif Et (300)"
SpeedBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
SpeedBtn.Size = UDim2.new(0.8, 0, 0, 40)
SpeedBtn.Callback = function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 300
end
