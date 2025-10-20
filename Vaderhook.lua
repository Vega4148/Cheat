local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 300, 0, 400)
menuFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
menuFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
menuFrame.BorderSizePixel = 0
menuFrame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 50)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
titleLabel.BorderSizePixel = 0
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Text = "Vader Hook"
titleLabel.TextScaled = true
titleLabel.Parent = menuFrame

local tabs = {"Visuals", "Miscs", "Legit"}
local currentTab = 1

local function createTabButton(tabName, index)
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(1, 0, 0, 50)
    tabButton.Position = UDim2.new(0, 0, 0, 50 * index)
    tabButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    tabButton.BorderSizePixel = 0
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.Text = tabName
    tabButton.TextScaled = true
    tabButton.Parent = menuFrame

    tabButton.MouseButton1Click:Connect(function()
        currentTab = index
        updateTabContent()
    end)
end

for i, tab in ipairs(tabs) do
    createTabButton(tab, i)
end

local tabContent = Instance.new("Frame")
tabContent.Size = UDim2.new(1, 0, 1, -50)
tabContent.Position = UDim2.new(0, 0, 0, 50)
tabContent.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
tabContent.BorderSizePixel = 0
tabContent.Parent = menuFrame

local function updateTabContent()
    tabContent:ClearAllChildren()

    if currentTab == 1 then
        -- Visuals tab content
        local visualsLabel = Instance.new("TextLabel")
        visualsLabel.Size = UDim2.new(1, 0, 0, 50)
        visualsLabel.Position = UDim2.new(0, 0, 0, 0)
        visualsLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        visualsLabel.BorderSizePixel = 0
        visualsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        visualsLabel.Text = "Visuals Options"
        visualsLabel.TextScaled = true
        visualsLabel.Parent = tabContent
    elseif currentTab == 2 then
        -- Miscs tab content
        local miscsLabel = Instance.new("TextLabel")
        miscsLabel.Size = UDim2.new(1, 0, 0, 50)
        miscsLabel.Position = UDim2.new(0, 0, 0, 0)
        miscsLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        miscsLabel.BorderSizePixel = 0
        miscsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        miscsLabel.Text = "Miscs Options"
        miscsLabel.TextScaled = true
        miscsLabel.Parent = tabContent
    elseif currentTab == 3 then
        -- Legit tab content
        local legitLabel = Instance.new("TextLabel")
        legitLabel.Size = UDim2.new(1, 0, 0, 50)
        legitLabel.Position = UDim2.new(0, 0, 0, 0)
        legitLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        legitLabel.BorderSizePixel = 0
        legitLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        legitLabel.Text = "Legit Options"
        legitLabel.TextScaled = true
        legitLabel.Parent = tabContent
    end
end

updateTabContent()

local visible = false

local function toggleMenu()
    if visible then
        local tween = TweenService:Create(menuFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 0.5, -200)})
        tween:Play()
    else
        local tween = TweenService:Create(menuFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 0.5, -200)})
        tween:Play()
    end
    visible = not visible
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.End then
        toggleMenu()
    end
end)

RunService.RenderStepped:Connect(function()
    if not visible then
        local tween = TweenService:Create(menuFrame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -150, 0.5, -200)})
        tween:Play()
    end
end)