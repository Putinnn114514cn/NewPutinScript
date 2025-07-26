-- Gui to Lua (VIP VERSION)
-- Version: 6.9

-- Instances:
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextButton = Instance.new("TextButton")
local PlayerBox = Instance.new("TextBox")
local DurationBox = Instance.new("TextBox")
local PlayerLabel = Instance.new("TextLabel")
local DurationLabel = Instance.new("TextLabel")

-- Properties:
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
print("普京甩飞已加载")

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.388539821, 0, 0.427821517, 0)
Frame.Size = UDim2.new(0, 200, 0, 170)  -- 增加尺寸以容纳新控件

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Size = UDim2.new(0, 200, 0, 25)

TextLabel.Parent = Frame_2
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.1, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 160, 0, 25)
TextLabel.Font = Enum.Font.Sarpanch
TextLabel.Text = "普京甩飞"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 25.000

-- 玩家输入框
PlayerLabel.Parent = Frame
PlayerLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerLabel.BackgroundTransparency = 1.000
PlayerLabel.Position = UDim2.new(0.05, 0, 0.25, 0)
PlayerLabel.Size = UDim2.new(0, 80, 0, 20)
PlayerLabel.Font = Enum.Font.SourceSans
PlayerLabel.Text = "玩家名称:"
PlayerLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerLabel.TextSize = 16.000

PlayerBox.Parent = Frame
PlayerBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
PlayerBox.BorderSizePixel = 0
PlayerBox.Position = UDim2.new(0.05, 0, 0.35, 0)
PlayerBox.Size = UDim2.new(0, 180, 0, 25)
PlayerBox.Font = Enum.Font.SourceSans
PlayerBox.PlaceholderText = "输入玩家名称"
PlayerBox.Text = ""
PlayerBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerBox.TextSize = 16.000

-- 时长输入框
DurationLabel.Parent = Frame
DurationLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DurationLabel.BackgroundTransparency = 1.000
DurationLabel.Position = UDim2.new(0.05, 0, 0.55, 0)
DurationLabel.Size = UDim2.new(0, 80, 0, 20)
DurationLabel.Font = Enum.Font.SourceSans
DurationLabel.Text = "持续时间:"
DurationLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DurationLabel.TextSize = 16.000

DurationBox.Parent = Frame
DurationBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DurationBox.BorderSizePixel = 0
DurationBox.Position = UDim2.new(0.05, 0, 0.65, 0)
DurationBox.Size = UDim2.new(0, 180, 0, 25)
DurationBox.Font = Enum.Font.SourceSans
DurationBox.PlaceholderText = "秒 (0=永久)"
DurationBox.Text = "5"
DurationBox.TextColor3 = Color3.fromRGB(255, 255, 255)
DurationBox.TextSize = 16.000

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.1, 0, 0.85, 0)
TextButton.Size = UDim2.new(0, 160, 0, 20)
TextButton.Font = Enum.Font.SourceSansItalic
TextButton.Text = "启动甩飞"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 16.000

-- Scripts:
local function IIMAWH_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local RunService = game:GetService("RunService")
	local Players = game:GetService("Players")
	local UIS = game:GetService("UserInputService")
	
	local toggleButton = script.Parent
	local hiddenfling = false
	local flingThread 
	local flingTarget = nil
	local flingDuration = 0
	
	-- 查找玩家函数
	local function findPlayer(name)
		name = name:lower()
		for _, player in ipairs(Players:GetPlayers()) do
			if player ~= Players.LocalPlayer and player.Name:lower():find(name) then
				return player
			end
		end
		return nil
	end
	
	-- 甩飞函数
	local function flingPlayer(target, duration)
		local startTime = tick()
		local lp = Players.LocalPlayer
		local character = lp.Character
		local hrp = character and character:FindFirstChild("HumanoidRootPart")
		
		if not hrp then return end
		
		while hiddenfling and (duration == 0 or (tick() - startTime) < duration) do
			RunService.Heartbeat:Wait()
			
			-- 获取目标角色
			local targetChar = target.Character
			local targetHrp = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
			
			if targetHrp then
				-- 计算甩飞方向（随机方向）
				local direction = Vector3.new(
					math.random(-10000, 10000),
					math.random(5000, 15000),
					math.random(-10000, 10000)
				).Unit
				
				-- 施加甩飞力
				targetHrp.Velocity = direction * 5000
				
				-- 显示甩飞效果
				local effect = Instance.new("Part")
				effect.Size = Vector3.new(1, 1, 1)
				effect.Position = targetHrp.Position
				effect.Anchored = true
				effect.CanCollide = false
				effect.Transparency = 0.7
				effect.Color = Color3.fromRGB(255, 0, 0)
				effect.Parent = workspace
				game:GetService("Debris"):AddItem(effect, 0.5)
			end
			
			-- 检查是否应该停止
			if not hiddenfling then break end
		end
		
		hiddenfling = false
		toggleButton.Text = "启动甩飞"
	end
	
	toggleButton.MouseButton1Click:Connect(function()
		if hiddenfling then
			hiddenfling = false
			toggleButton.Text = "启动甩飞"
			return
		end
		
		-- 获取玩家名称和持续时间
		local playerName = PlayerBox.Text
		local durationText = DurationBox.Text
		
		-- 验证持续时间
		flingDuration = tonumber(durationText) or 5
		if flingDuration < 0 then flingDuration = 5 end
		
		-- 查找玩家
		if playerName == "" then
			PlayerBox.Text = "请输入玩家名称"
			return
		end
		
		flingTarget = findPlayer(playerName)
		if not flingTarget then
			PlayerBox.Text = "玩家未找到"
			return
		end
		
		-- 启动甩飞
		hiddenfling = true
		toggleButton.Text = "甩飞中..."
		
		-- 启动甩飞协程
		flingThread = coroutine.create(function()
			flingPlayer(flingTarget, flingDuration)
		end)
		coroutine.resume(flingThread)
	end)
	
end
coroutine.wrap(IIMAWH_fake_script)()
local function QCJQJL_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	script.Parent.Active = true
	script.Parent.Draggable = true
	
	-- 添加关闭按钮
	local closeButton = Instance.new("TextButton")
	closeButton.Parent = Frame_2
	closeButton.BackgroundTransparency = 1
	closeButton.Position = UDim2.new(0.85, 0, 0, 0)
	closeButton.Size = UDim2.new(0, 30, 0, 25)
	closeButton.Font = Enum.Font.SourceSansBold
	closeButton.Text = "X"
	closeButton.TextColor3 = Color3.fromRGB(255, 0, 0)
	closeButton.TextSize = 18
	closeButton.MouseButton1Click:Connect(function()
		script.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(QCJQJL_fake_script)()