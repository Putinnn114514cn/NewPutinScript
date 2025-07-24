-- Roblox飞行控制系统
-- 功能：无限旋转飞行 + 玩家检测与碰撞系统
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")

-- 玩家角色初始化
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

-- 配置参数
local config = {
    rotationSpeed = 5,    -- 旋转速度 (弧度/秒)
    ascentSpeed = 25,     -- 上升速度
    flightSpeed = 50,     -- 基础飞行速度
    detectionRadius = 5,  -- 玩家检测半径(米)
    collisionForce = 150, -- 碰撞强度
    collisionSize = 3     -- 碰撞箱放大倍数
}

-- 状态变量
local isFlying = false
local flightVelocity = nil
local rotationForce = nil
local collisionActive = false
local collisionParts = {}
local currentTarget = nil
local screenGui = nil
local controlFrame = nil

-- 初始化飞行状态
humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)

-- 创建飞行物理控制器
local function createFlightController()
    if flightVelocity then flightVelocity:Destroy() end
    
    -- 创建速度控制器
    flightVelocity = Instance.new("BodyVelocity")
    flightVelocity.MaxForce = Vector3.new(40000, 40000, 40000)
    flightVelocity.Velocity = Vector3.new(0, config.ascentSpeed, 0)
    flightVelocity.P = 1000
    flightVelocity.Parent = rootPart
    
    -- 创建旋转控制器
    rotationForce = Instance.new("BodyAngularVelocity")
    rotationForce.AngularVelocity = Vector3.new(0, config.rotationSpeed, 0)
    rotationForce.MaxTorque = Vector3.new(0, 10000, 0)
    rotationForce.P = 1000
    rotationForce.Parent = rootPart
end

-- 处理飞行移动
local function updateFlight(deltaTime)
    if not isFlying or not flightVelocity then return end
    
    -- 获取输入方向
    local moveDirection = Vector3.new(0, 0, 0)
    if UserInputService:IsKeyDown(Enum.KeyCode.W) then
        moveDirection = moveDirection + Vector3.new(0, 0, -1)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.S) then
        moveDirection = moveDirection + Vector3.new(0, 0, 1)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.A) then
        moveDirection = moveDirection + Vector3.new(-1, 0, 0)
    end
    if UserInputService:IsKeyDown(Enum.KeyCode.D) then
        moveDirection = moveDirection + Vector3.new(1, 0, 0)
    end
    
    -- 根据相机方向转换移动向量
    local camera = workspace.CurrentCamera
    local cameraCFrame = camera.CFrame
    local forward = cameraCFrame.LookVector * moveDirection.Z
    local right = cameraCFrame.RightVector * moveDirection.X
    local moveVector = (forward + right) * config.flightSpeed
    
    -- 应用垂直速度
    flightVelocity.Velocity = moveVector + Vector3.new(0, config.ascentSpeed, 0)
end

-- 检测附近玩家
local function checkNearbyPlayers()
    local nearbyCount = 0
    local closestPlayer = nil
    local minDistance = config.detectionRadius
    
    for _, otherPlayer in pairs(Players:GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character then
            local otherRoot = otherPlayer.Character:FindFirstChild("HumanoidRootPart")
            if otherRoot then
                local distance = (rootPart.Position - otherRoot.Position).Magnitude
                if distance < config.detectionRadius then
                    nearbyCount = nearbyCount + 1
                    if distance < minDistance then
                        minDistance = distance
                        closestPlayer = otherPlayer
                    end
                end
            end
        end
    end
    
    return nearbyCount, closestPlayer
end

-- 激活碰撞系统
local function activateCollision(targetPlayer)
    if collisionActive or not targetPlayer then return end
    
    collisionActive = true
    currentTarget = targetPlayer
    
    -- 放大碰撞箱
    for _, part in pairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            local originalSize = part.Size
            part.Size = originalSize * config.collisionSize
            
            -- 存储原始尺寸以便恢复
            local collisionInfo = {
                part = part,
                originalSize = originalSize
            }
            table.insert(collisionParts, collisionInfo)
        end
    end
    
    -- 向目标玩家移动
    while collisionActive and currentTarget and currentTarget.Character do
        local targetRoot = currentTarget.Character:FindFirstChild("HumanoidRootPart")
        if targetRoot and flightVelocity then
            local direction = (targetRoot.Position - rootPart.Position).Unit
            flightVelocity.Velocity = direction * config.collisionForce
        end
        wait(0.1)
    end
end

-- 创建图形界面
local function createFlightGUI()
    -- 创建屏幕GUI
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FlightControlGUI"
    screenGui.Parent = player.PlayerGui
    
    -- 创建控制框架
    controlFrame = Instance.new("Frame")
    controlFrame.Size = UDim2.new(0, 200, 0, 150)
    controlFrame.Position = UDim2.new(0.8, 0, 0.7, 0)
    controlFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    controlFrame.BackgroundTransparency = 0.3
    controlFrame.BorderSizePixel = 0
    controlFrame.Parent = screenGui
    
    -- 上升按钮
    local ascendButton = Instance.new("TextButton")
    ascendButton.Size = UDim2.new(0.8, 0, 0.3, 0)
    ascendButton.Position = UDim2.new(0.1, 0, 0.1, 0)
    ascendButton.Text = "⬆️ 上升"
    ascendButton.Font = Enum.Font.SourceSansBold
    ascendButton.TextSize = 20
    ascendButton.BackgroundColor3 = Color3.fromRGB(78, 205, 196)
    ascendButton.Parent = controlFrame
    
    -- 下降按钮
    local descendButton = Instance.new("TextButton")
    descendButton.Size = UDim2.new(0.8, 0, 0.3, 0)
    descendButton.Position = UDim2.new(0.1, 0, 0.6, 0)
    descendButton.Text = "⬇️ 下降"
    descendButton.Font = Enum.Font.SourceSansBold
    descendButton.TextSize = 20
    descendButton.BackgroundColor3 = Color3.fromRGB(78, 205, 196)
    descendButton.Parent = controlFrame
    
    -- 按钮事件
    ascendButton.MouseButton1Click:Connect(function()
        if isFlying and flightVelocity then
            config.ascentSpeed = config.ascentSpeed + 10
            flightVelocity.Velocity = Vector3.new(
                flightVelocity.Velocity.X,
                config.ascentSpeed,
                flightVelocity.Velocity.Z
            )
        end
    end)
    
    descendButton.MouseButton1Click:Connect(function()
        if isFlying and flightVelocity then
            config.ascentSpeed = math.max(5, config.ascentSpeed - 10)
            flightVelocity.Velocity = Vector3.new(
                flightVelocity.Velocity.X,
                config.ascentSpeed,
                flightVelocity.Velocity.Z
            )
        end
    end)
end

-- 主循环
RunService.Heartbeat:Connect(function(deltaTime)
    if isFlying then
        updateFlight(deltaTime)
        local nearbyCount, closestPlayer = checkNearbyPlayers()
        
        if nearbyCount > 0 and not collisionActive then
            activateCollision(closestPlayer)
        elseif nearbyCount == 0 and collisionActive then
            -- 重置碰撞箱
            for _, info in pairs(collisionParts) do
                info.part.Size = info.originalSize
            end
            collisionParts = {}
            collisionActive = false
            currentTarget = nil
        end
    end
end)

-- 飞行状态切换
local function toggleFlight(active)
    isFlying = active
    
    if isFlying then
        createFlightController()
        humanoid.PlatformStand = true
        if not screenGui then
            createFlightGUI()
        else
            screenGui.Enabled = true
        end
    else
        if flightVelocity then flightVelocity:Destroy() end
        if rotationForce then rotationForce:Destroy() end
        humanoid.PlatformStand = false
        if screenGui then
            screenGui.Enabled = false
        end
        
        -- 重置碰撞系统
        for _, info in pairs(collisionParts) do
            info.part.Size = info.originalSize
        end
        collisionParts = {}
        collisionActive = false
        currentTarget = nil
    end
end

-- 键盘输入监听
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space and input.UserInputType == Enum.UserInputType.Keyboard then
        toggleFlight(not isFlying)
    end
end)

-- 角色死亡时重置状态
humanoid.Died:Connect(function()
    toggleFlight(false)
end)

-- 角色切换时重新初始化
player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = character:WaitForChild("Humanoid")
    rootPart = character:WaitForChild("HumanoidRootPart")
    
    -- 重新启用飞行状态
    if isFlying then
        wait(1) -- 等待角色完全加载
        toggleFlight(true)
    end
end)