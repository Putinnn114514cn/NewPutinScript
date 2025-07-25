local Players = game:GetService("Players")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

-- 创建公告窗口GUI
local AnnouncementGUI = Instance.new("ScreenGui")
AnnouncementGUI.Name = "StaticAnnouncementWindow"
AnnouncementGUI.ResetOnSpawn = false
AnnouncementGUI.Parent = PlayerGui

-- 主窗口框架
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.5, 0, 0.6, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = AnnouncementGUI

-- 窗口样式
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0.05, 0)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(80, 80, 80)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- =============== 预设公告内容 =============== --
local ContentLabel = Instance.new("TextLabel")
ContentLabel.Name = "PresetContent"
ContentLabel.Size = UDim2.new(0.9, 0, 0.8, 0)  -- 占窗口90%宽度和80%高度
ContentLabel.Position = UDim2.new(0.05, 0, 0.15, 0)
ContentLabel.BackgroundTransparency = 1
ContentLabel.Text = [[
【脚本公告】

欢迎来到普京脚本中心！

当前版本：v0.5.4
更新内容：
1. 新增了自然灾害模拟器,死铁轨的脚本
2. 新添甩飞脚本
]]  -- 在此修改预设内容
ContentLabel.Font = Enum.Font.GothamMedium
ContentLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
ContentLabel.TextSize = 14
ContentLabel.TextWrapped = true  -- 自动换行
ContentLabel.TextXAlignment = Enum.TextXAlignment.Left  -- 左对齐
ContentLabel.TextYAlignment = Enum.TextYAlignment.Top  -- 顶部对齐
ContentLabel.Parent = MainFrame

-- =============== 关闭按钮 =============== --
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0.08, 0, 0.1, 0)
CloseButton.Position = UDim2.new(0.9, 0, 0.02, 0)
CloseButton.Text = "×"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 24
CloseButton.TextColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CloseButton.Parent = MainFrame

-- 按钮交互
CloseButton.MouseButton1Click:Connect(function()
    AnnouncementGUI:Destroy()  -- 完全销毁窗口
end)

-- 按钮动态效果
CloseButton.MouseEnter:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end)
CloseButton.MouseLeave:Connect(function()
    CloseButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)