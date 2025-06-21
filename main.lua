-- Zeno App Overlay | Executor-Compatible Demo
-- Inspired by Codex UI + Dream Client Web UI Style
-- Features: setflag, setfint, skybox

if game.CoreGui:FindFirstChild("ZenoOverlay") then
    game.CoreGui.ZenoOverlay:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "ZenoOverlay"
ScreenGui.ResetOnSpawn = false

-- UI Frame
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
Title.TextColor3 = Color3.fromRGB(0, 162, 255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true

-- List Layout
local List = Instance.new("UIListLayout", Frame)
List.Padding = UDim.new(0, 6)
List.SortOrder = Enum.SortOrder.LayoutOrder
List.HorizontalAlignment = Enum.HorizontalAlignment.Center

-- Button Maker
local function CreateButton(text, callback)
    local Button = Instance.new("TextButton", Frame)
    Button.Size = UDim2.new(0.9, 0, 0, 36)
    Button.BackgroundColor3 = Color3.fromRGB(0, 136, 255)
    Button.TextColor3 = Color3.fromRGB(255, 215, 0)
    Button.Font = Enum.Font.Gotham
    Button.Text = text
    Button.TextScaled = true
    Button.BorderSizePixel = 0
    Button.MouseButton1Click:Connect(callback)
    return Button
end

-- Flag Storage
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

CreateButton("Print Flags", function()
    for k, v in pairs(Flags) do
        print("[ZENO FLAG] " .. k .. " = " .. tostring(v))
    end
end)
