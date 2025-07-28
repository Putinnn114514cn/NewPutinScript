local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "普京脚本中心", HidePremium = false, SaveConfig = true, ConfigFolder = "PutinScriptsHub", IntroText = "普京脚本中心", IntroIcon = "https://so1.360tres.com/t01362c089a1417a0bf.png"})

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
	Name = "公告",
	Icon = "rbxassetid://18943392158",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
local Section = Tab:AddSection({
	Name = "显而易见"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "公告",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Putinnn114514cn/PutinScriptV0.5.0-MADE_WITH_DEEPSEEK/refs/heads/main/ReadBoard.lua"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "普京脚本q群835595364",
	Callback = function()
      		
  	end    
})

local Tab = Window:MakeTab({
	Name = "通用",
	Icon = "rbxassetid://7114115997",
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


Tab:AddButton({
	Name = "甩人3",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/Putinnn114514cn/NewPutinScript/refs/heads/main/shuairen.txt"))()
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
      		loadstring(game:HttpGet("https://pastebin.com/raw/bzmhRgKL"))()
  	end    
})
--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "普京甩飞",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/Putinnn114514cn/NewPutinScript/refs/heads/main/shuaifeiPutin.lua", true))()
  	end    
})

Tab:AddButton({
	Name = "踢人",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/Putinnn114514cn/NewPutinScript/refs/heads/main/tiren.txt"))()
  	end    
})

Tab:AddButton({
	Name = "甩飞2",
	Callback = function()
      	loadstring(game:HttpGet("http://rawscripts.net/raw/Universal-Script-Touch-fling-script-22447"))()
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
local Section = Tab:AddSection({
	Name = "其他脚本也很优秀🎈"
})
--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "皮脚本",
	Callback = function()
      	 loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "鱼脚本",
	Callback = function()
      		 loadstring(game:HelpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,115,104,122,46,97,108,47,126,70,105,115,104,83,99,114,105,112,116,78,101,119})end)())))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "无名脚本",
	Callback = function()
      	 loadstring(game:HttpGet("https://raw.githubusercontent.com/wumingjiaoben/qingfeng/refs/heads/main/Protected_5978429211344711.lua"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "白脚本",
	Callback = function()
      		loadstring(game:HttpGet(('https://raw.githubusercontent.com/wev666666/baijiaobengV2.0beta/main/%E7%99%BD%E8%84%9A%E6%9C%ACbeta'),true))() 
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "猫脚本",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/dkfkfkfjfkfjdj/longshu/main/%E6%B7%B7%E6%B7%86%E6%96%87%E4%BB%B6.lua"))()("猫猫脚本 V2.0")
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "K脚本",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/MoKeWe-st/K-script/refs/heads/main/K%20script.Lua"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "叶脚本",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/roblox-ye/QQ515966991/refs/heads/main/ROBLOX-CNVIP-XIAOYE.lua"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "哦脚本",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/chinanb114514-png/ojiaoben/refs/heads/main/%E9%9C%9Cv2.lua.txt"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "云脚本",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Cloud-script/main/%E4%BA%91%E4%B8%AD%E5%BF%83CLOUD-HUB.lua", true))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Zerohub（外国零脚本）",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Putinnn114514cn/NewPutinScript/refs/heads/main/liliangchuanqizidongqiangzhuang.txt"))()
  	end    
})

Tab:AddButton({
	Name = "少羽脚本",
	Callback = function()
      	loadstring(game:HttpGet("https://pastebin.com/raw/yeDRR0kv"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "巴掌战斗脚本",
	Icon = "rbxassetid://11782011624",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
local Section = Tab:AddSection({
	Name = "打boss脚本"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "向导Boss",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Donjosx/SBS/main/BeatTheGuide.lua"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "鲍勃bob",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Dusty1234567890/Rob/main/Rob"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Section = Tab:AddSection({
	Name = "全能巴掌脚本"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "GiangHub脚本",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/Slap_Battles.lua"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "巴掌脚本，很好用",
	Callback = function()
      		loadstring(game:HttpGet(("https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Battles")))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "巴掌界公认最强脚本中心",
	Callback = function()
      		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Latundra/GFET/main/script")))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Section = Tab:AddSection({
	Name = "刷手套脚本"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "大逃杀脚本",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/BreApple/RobloxUI/main/SRscriptNew"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "管理员手套",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Dusty1234567890/Ab-admin-glove-badge/main/Ab%20glovr%20badge%20admin"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "刷巴掌脚本必须要有其中一个手套",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhdat4461/BaconScripterLua/main/BallerFarm.lua"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "地牢脚本NULL",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Dusty1234567890/Null-zone3/main/Null%20zone"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "拳击手巴掌农场（无gui)",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/DonjoScripts/Public-Scripts/refs/heads/Slap-Battles/Boxer-slap-farm"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "老鼠手套奶酪塔防打老鼠王脚本",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Guy-that-exists/Hub-that-exists/main/Script"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "DEATH手套（在红门后面)",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/DonjoScripts/Public-Scripts/refs/heads/Slap-Battles/death%5B0.8%5D.lua'))()
  	end    
})

Tab:AddButton({
	Name = "哨声手套（在红门后面)",
	Callback = function()
      	loadstring(game:HttpGet('https://raw.githubusercontent.com/Umbrella-Scripter/Slap-Battles/refs/heads/main/F.L.O.W.E.R.lua'))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Tab = Window:MakeTab({
	Name = "doors",
	Icon = "rbxassetid://10799441537",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
local Section = Tab:AddSection({
	Name = "常见doors脚本"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "doors外网垃圾脚本",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/plamen6789/UtilitiesHub/main/UtilitiesGUI'))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "主播同款doors桂",
	Callback = function()
      		loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/poopdoors_edited/main/poopdoors_edited.lua"),true))() 
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "doors汉化脚本",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/Nc2drNDz"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "自称是最强的doors脚本",
	Callback = function()
      		loadstring(game:HttpGet(('https://pastebin.com/raw/R8QMbhzv')))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Section = Tab:AddSection({
	Name = "通关"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "doors2密码是DoorsGood83227!!",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/DOORS/main/Floor%202"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Tab = Window:MakeTab({
	Name = "被遗弃",
	Icon = "rbxassetid://94222413183599",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
local Section = Tab:AddSection({
	Name = "被遗弃脚本"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "被遗弃游戏的脚本（功能多)",
	Callback = function()
      		loadstring(game:HttpGetAsync(("https://raw.githubusercontent.com/SilkScripts/AppleStuff/refs/heads/main/AppleFSKV2")))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "AppleHub脚本",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/ALPHA-Forsaken-Apple-Hub-28274"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Tab = Window:MakeTab({
	Name = "力量传奇",
	Icon = "rbxassetid://18209575791",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]
local Section = Tab:AddSection({
	Name = "力量传奇卡宠"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "卡宠脚本",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Putinnn114514cn/NewPutinScript/refs/heads/main/kachongliliangcq.txt"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Section = Tab:AddSection({
	Name = "综合脚本"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "力量传奇最强脚本",
	Callback = function()
      		loadstring(game:HttpGet("https://pastebin.com/raw/mqGPg69N"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "力量传奇击飞无视耐力力量",
	Callback = function()
      		loadstring(game:GetObjects("rbxassetid://10123407012")[1].Source)()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
Tab:AddButton({
	Name = "自动强壮无gui",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Putinnn114514cn/NewPutinScript/refs/heads/main/liliangchuanqizidongqiangzhuang.txt"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local Tab = Window:MakeTab({
	Name = "自然灾害模拟器",
	Icon = "rbxassetid://75756933857153",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "神力"
})

Tab:AddButton({
	Name = "自然灾害脚本中心",
	Callback = function()
      		loadstring(game:HttpGet("https://gist.githubusercontent.com/TurkOyuncu99/7c75386107937fa006304efd24543ad4/raw/8d759dfcd95d39949c692735cfdf62baec0bf835/cafwetweg", true))()
  	end    
})

Tab:AddButton({
	Name = "自然灾害脚本中心2",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/Putinnn114514cn/NewPutinScript/refs/heads/main/NaturadisastesimulatorControlledarticles.lua"))()
  	end    
})

Tab:AddButton({
	Name = "自然灾害控制物品（其他体验可用)",
	Callback = function()
      	   loadstring(game:HttpGet("https://raw.githubusercontent.com/Putinnn114514cn/NewPutinScript/refs/heads/main/kongzhiwupin.txt"))()
  	end    
})

Tab:AddButton({
	Name = "黑洞脚本",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/XSKMS/XSK/refs/heads/main/HeiDongscript.lua"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "死铁轨",
	Icon = "rbxassetid://122874126897828",
	PremiumOnly = false
})


local Section = Tab:AddSection({
	Name = "脚本中心"
})


Tab:AddButton({
	Name = "死铁轨脚本中心",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/NatHub.lua"))();
  	end    
})

Tab:AddButton({
	Name = "sans脚本中心（中文)",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/iopjklbnmsss/SansHubScript/refs/heads/main/SansHub"))()
  	end    
})

local Section = Tab:AddSection({
	Name = "刷债券"
})

Tab:AddButton({
	Name = "Moon V3刷债券",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/m00ndiety/OP-AUTO-BONDS-V3/refs/heads/main/Keyless-BONDS-v3"))()
  	end    
})

local Section = Tab:AddSection({
	Name = "免费脚本"
})

Tab:AddButton({
	Name = "免费死铁轨脚本1",
	Callback = function()
      	 loadstring(game:HttpGet("https://raw.githubusercontent.com/TwoGunVolley/FixedPlease/refs/heads/main/Protected_7197551640341824.txt"))()
  	end    
})

Tab:AddButton({
	Name = "免费死铁轨脚本2",
	Callback = function()
      	loadstring(game:HttpGet('https://pastefy.app/7vZN3EwV/raw'))()
  	end    
})

Tab:AddButton({
	Name = "zerohub（其他游戏也有脚本)",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/dnezero/zerohub/refs/heads/main/main.lua"))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "犯罪",
	Icon = "rbxassetid://9599624002",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "犯罪脚本"
})

Tab:AddButton({
	Name = "Vape犯罪脚本",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
  	end    
})

Tab:AddButton({
	Name = "犯罪脚本",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/JackHiggly/RobloxThings/main/FemWare0", true))()
  	end    
})

local Tab = Window:MakeTab({
	Name = "墨水游戏",
	Icon = "rbxassetid://7573267740",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "墨水游戏脚本"
})

Tab:AddButton({
	Name = "墨水游戏七月二十八日脚本",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/erger4/testuinEW.github.io/refs/heads/main/NEWNEW.lua"))()
  	end    
})

Tab:AddButton({
	Name = "墨水游戏汉化脚本",
	Callback = function()
      	loadstring(game:HttpGet("https://raw.githubusercontent.com/XOTRXONY/INKGAME/main/INKGAMEE.lua", true))()
  	end    
})

Tab:AddButton({
	Name = "墨水游戏英文脚本[卡密]",
	Callback = function()
      	 loadstring(game:HttpGet("https://raw.githubusercontent.com/OverflowBGSI/Overflow/refs/heads/main/loader.txt"))()
  	end    
})

OrionLib:Init()