-- Zeno Overlay | Executor-Compatible Roblox Script
-- Author: YourNameHere | GitHub: yourgithub
-- Inspired by Codex UI & Dream Client web overlays

-- Destroy existing GUI if re-injected
if game.CoreGui:FindFirstChild("ZenoOverlay") then
    game.CoreGui.ZenoOverlay:Destroy()
end

-- UI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "ZenoOverlay"
ScreenGui.ResetOnSpawn = false

-- Main UI Frame
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 350)
Frame.Position = UDim2.new(0.05, 0, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
Frame.BorderSizePixel = 0

-- Title Bar
local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "⚡ Zeno Overlay"
Title.TextColor3 = Color3.fromRGB(0, 162, 255) -- Blue
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

-- Layout Management
local List = Instance.new("UIListLayout", Frame)
List.Padding = UDim.new(0, 6)
List.SortOrder = Enum.SortOrder.LayoutOrder
List.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Button Builder
local function CreateButton(text, callback)
    local Button = Instance.new("TextButton", Frame)
    Button.Size = UDim2.new(0.9, 0, 0, 36)
    Button.BackgroundColor3 = Color3.fromRGB(0, 136, 255) -- Blue
    Button.TextColor3 = Color3.fromRGB(255, 215, 0)       -- Gold
    Button.Font = Enum.Font.Gotham
    Button.Text = text
    Button.TextScaled = true
    Button.BorderSizePixel = 0
    Button.MouseButton1Click:Connect(callback)
    return Button
end

-- Internal Flag System
local Flags = {}

-- Functional Buttons
CreateButton("SetFlag: DebugSkyGray", function()
    Flags["DebugSkyGray"] = true
    print("[ZENO] Flag: DebugSkyGray = true")
end)

CreateButton("SetInt: MaxFPS = 60", function()
    Flags["MaxFPS"] = 60
    print("[ZENO] Flag: MaxFPS = 60")
end)

CreateButton("Skybox: Sunset (ID: 8281961896)", function()
    local sky = Instance.new("Sky", game.Lighting)
    local id = "8281961896"
    for _, face in pairs({"Bk", "Dn", "Ft", "Lf", "Rt", "Up"}) do
        sky["Skybox" .. face] = "http://www.roblox.com/asset/?id=" .. id
    end
    print("[ZENO] Skybox changed to ID:", id)
end)

CreateButton("Print All Flags", function()
    for k, v in pairs(Flags) do
        print("[ZENO FLAG] " .. k .. " = " .. tostring(v))
    end
end)
