--[[
    Script Name: player hack v1 (Math Quiz & Lifetime Rainbow Edition - Single Block)
    Cover: 💫
]]--

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

if CoreGui:FindFirstChild("PlayerHackGui") then
    CoreGui.PlayerHackGui:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PlayerHackGui"
screenGui.Parent = CoreGui

local themes = {
    Classic = {
        Main = Color3.fromRGB(22, 22, 25),
        Sidebar = Color3.fromRGB(15, 15, 18),
        Stroke = Color3.fromRGB(60, 60, 65),
        Accent = Color3.fromRGB(240, 240, 245),
        Text = Color3.fromRGB(200, 200, 210)
    },
    Hacker = {
        Main = Color3.fromRGB(10, 25, 15),
        Sidebar = Color3.fromRGB(5, 15, 8),
        Stroke = Color3.fromRGB(40, 180, 80),
        Accent = Color3.fromRGB(50, 220, 100),
        Text = Color3.fromRGB(180, 255, 200)
    },
    Neon = {
        Main = Color3.fromRGB(25, 15, 30),
        Sidebar = Color3.fromRGB(15, 8, 20),
        Stroke = Color3.fromRGB(180, 60, 220),
        Accent = Color3.fromRGB(220, 100, 255),
        Text = Color3.fromRGB(240, 200, 255)
    }
}
local currentTheme = themes.Classic
local isRainbowActive = false

local passedPlayers = {
    ["PeatHub"] = true,
    ["Admin"] = true
}

local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 50, 0, 50)
toggleButton.Position = UDim2.new(0, 20, 0.5, -25)
toggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
toggleButton.Text = "💫"
toggleButton.TextSize = 24
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Parent = screenGui

Instance.new("UICorner", toggleButton).CornerRadius = UDim.new(1, 0)
local toggleStroke = Instance.new("UIStroke", toggleButton)
toggleStroke.Color = Color3.fromRGB(200, 200, 200)
toggleStroke.Thickness = 2

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 480, 0, 380)
mainFrame.Position = UDim2.new(0.5, -240, 0.5, -190)
mainFrame.BackgroundColor3 = currentTheme.Main
mainFrame.BorderSizePixel = 0
mainFrame.Visible = false
mainFrame.Parent = screenGui

Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)
local mainStroke = Instance.new("UIStroke", mainFrame)
mainStroke.Color = currentTheme.Stroke
mainStroke.Thickness = 1.5

local dragging, dragInput, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

RunService.RenderStepped:Connect(function()
    if dragging and dragInput then
        local delta = dragInput.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    if isRainbowActive then
        local hue = tick() % 5 / 5
        local rainbowColor = Color3.fromHSV(hue, 1, 1)
        mainStroke.Color = rainbowColor
    end
end)

local sidebar = Instance.new("Frame", mainFrame)
sidebar.Size = UDim2.new(0, 130, 1, 0)
sidebar.BackgroundColor3 = currentTheme.Sidebar
sidebar.BorderSizePixel = 0
Instance.new("UICorner", sidebar).CornerRadius = UDim.new(0, 10)

local scriptTitleLabel = Instance.new("TextLabel", sidebar)
scriptTitleLabel.Size = UDim2.new(1, -10, 0, 40)
scriptTitleLabel.Position = UDim2.new(0, 5, 0, 8)
scriptTitleLabel.BackgroundTransparency = 1
scriptTitleLabel.Text = "player hack v1\n(Math Quiz Pro)"
scriptTitleLabel.TextColor3 = Color3.fromRGB(220, 220, 230)
scriptTitleLabel.TextSize = 11
scriptTitleLabel.Font = Enum.Font.GothamBold
scriptTitleLabel.TextXAlignment = Enum.TextXAlignment.Center
scriptTitleLabel.TextYAlignment = Enum.TextYAlignment.Center

local themeClassicBtn = Instance.new("TextButton", sidebar)
themeClassicBtn.Size = UDim2.new(0.9, 0, 0, 24)
themeClassicBtn.Position = UDim2.new(0.05, 0, 0, 140)
themeClassicBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
themeClassicBtn.Text = "🌙 ธีมดาร์ก"
themeClassicBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
themeClassicBtn.TextSize = 9.5
Instance.new("UICorner", themeClassicBtn).CornerRadius = UDim.new(0, 6)

local themeHackerBtn = Instance.new("TextButton", sidebar)
themeHackerBtn.Size = UDim2.new(0.9, 0, 0, 24)
themeHackerBtn.Position = UDim2.new(0.05, 0, 0, 170)
themeHackerBtn.BackgroundColor3 = Color3.fromRGB(15, 35, 20)
themeHackerBtn.Text = "🟢 ธีมแฮกเกอร์"
themeHackerBtn.TextColor3 = Color3.fromRGB(150, 255, 180)
themeHackerBtn.TextSize = 9.5
Instance.new("UICorner", themeHackerBtn).CornerRadius = UDim.new(0, 6)

local themeNeonBtn = Instance.new("TextButton", sidebar)
themeNeonBtn.Size = UDim2.new(0.9, 0, 0, 24)
themeNeonBtn.Position = UDim2.new(0.05, 0, 0, 200)
themeNeonBtn.BackgroundColor3 = Color3.fromRGB(35, 15, 40)
themeNeonBtn.Text = "🟣 ธีมนีออน"
themeNeonBtn.TextColor3 = Color3.fromRGB(220, 150, 255)
themeNeonBtn.TextSize = 9.5
Instance.new("UICorner", themeNeonBtn).CornerRadius = UDim.new(0, 6)

local themeRainbowBtn = Instance.new("TextButton", sidebar)
themeRainbowBtn.Size = UDim2.new(0.9, 0, 0, 24)
themeRainbowBtn.Position = UDim2.new(0.05, 0, 0, 230)
themeRainbowBtn.BackgroundColor3 = Color3.fromRGB(40, 30, 50)
themeRainbowBtn.Text = "🌈 อักษรเรนโบว์ฟรี"
themeRainbowBtn.TextColor3 = Color3.fromRGB(255, 200, 255)
themeRainbowBtn.TextSize = 9.5
Instance.new("UICorner", themeRainbowBtn).CornerRadius = UDim.new(0, 6)

local historyLabel = Instance.new("TextLabel", sidebar)
historyLabel.Size = UDim2.new(0.9, 0, 0, 20)
historyLabel.Position = UDim2.new(0.05, 0, 0, 260)
historyLabel.BackgroundTransparency = 1
historyLabel.Text = "📜 ประวัติล่าสุด:"
historyLabel.TextColor3 = Color3.fromRGB(170, 170, 180)
historyLabel.TextSize = 9.5
historyLabel.Font = Enum.Font.GothamBold
historyLabel.TextXAlignment = Enum.TextXAlignment.Left

local historyContainer = Instance.new("ScrollingFrame", sidebar)
historyContainer.Size = UDim2.new(0.9, 0, 0, 75)
historyContainer.Position = UDim2.new(0.05, 0, 0, 282)
historyContainer.BackgroundTransparency = 1
historyContainer.BorderSizePixel = 0
historyContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
historyContainer.ScrollBarThickness = 3

local historyLayout = Instance.new("UIListLayout", historyContainer)
historyLayout.SortOrder = Enum.SortOrder.LayoutOrder
historyLayout.Padding = UDim.new(0, 4)

local contentArea = Instance.new("Frame", mainFrame)
contentArea.Size = UDim2.new(0, 335, 1, 0)
contentArea.Position = UDim2.new(0, 135, 0, 0)
contentArea.BackgroundTransparency = 1

local openQuizBtn = Instance.new("TextButton", contentArea)
openQuizBtn.Size = UDim2.new(0.92, 0, 0, 26)
openQuizBtn.Position = UDim2.new(0.04, 0, 0, 10)
openQuizBtn.BackgroundColor3 = Color3.fromRGB(80, 50, 120)
openQuizBtn.Text = "🎮 เล่นเกมคณิตศาสตร์เพื่อปลดล็อกเรนโบว์ฟรี"
openQuizBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
openQuizBtn.TextSize = 9.5
openQuizBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", openQuizBtn).CornerRadius = UDim.new(0, 6)

local hackFrame = Instance.new("Frame", contentArea)
hackFrame.Size = UDim2.new(1, 0, 1, -45)
hackFrame.Position = UDim2.new(0, 0, 0, 40)
hackFrame.BackgroundTransparency = 1

local textBox = Instance.new("TextBox", hackFrame)
textBox.Size = UDim2.new(0.92, 0, 0, 32)
textBox.Position = UDim2.new(0.04, 0, 0, 5)
textBox.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
textBox.PlaceholderText = "พิมพ์ชื่อผู้เล่นที่นี่..."
textBox.Text = ""
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.PlaceholderColor3 = Color3.fromRGB(140, 140, 150)
textBox.TextSize = 12
textBox.Font = Enum.Font.Gotham
textBox.ClearTextOnFocus = false
Instance.new("UICorner", textBox).CornerRadius = UDim.new(0, 6)

local actionButton = Instance.new("TextButton", hackFrame)
actionButton.Size = UDim2.new(0.92, 0, 0, 30)
actionButton.Position = UDim2.new(0.04, 0, 0, 42)
actionButton.BackgroundColor3 = currentTheme.Accent
actionButton.Text = "🔍 ค้นหารหัสผ่าน & สแกนเกลือ"
actionButton.TextColor3 = Color3.fromRGB(20, 20, 20)
actionButton.TextSize = 11
actionButton.Font = Enum.Font.GothamBold
Instance.new("UICorner", actionButton).CornerRadius = UDim.new(0, 6)

local resultFrame = Instance.new("Frame", hackFrame)
resultFrame.Size = UDim2.new(0.92, 0, 0, 145)
resultFrame.Position = UDim2.new(0.04, 0, 0, 78)
resultFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
Instance.new("UICorner", resultFrame).CornerRadius = UDim.new(0, 6)

local resultText = Instance.new("TextLabel", resultFrame)
resultText.Size = UDim2.new(0.58, -10, 1, -20)
resultText.Position = UDim2.new(0, 10, 0, 10)
resultText.BackgroundTransparency = 1
resultText.Text = "สถานะ: รอข้อมูลผู้เล่น..."
resultText.TextColor3 = currentTheme.Text
resultText.TextSize = 10
resultText.Font = Enum.Font.Code
resultText.TextWrapped = true
resultText.TextXAlignment = Enum.TextXAlignment.Left
resultText.TextYAlignment = Enum.TextYAlignment.Top

local avatarImage = Instance.new("ImageLabel", resultFrame)
avatarImage.Size = UDim2.new(0, 75, 0, 75)
avatarImage.Position = UDim2.new(0.62, 0, 0.1, 0)
avatarImage.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
avatarImage.Image = ""
Instance.new("UICorner", avatarImage).CornerRadius = UDim.new(0, 8)

local btnWidth = 0.22
local btnY = 230

local copyNameBtn = Instance.new("TextButton", hackFrame)
copyNameBtn.Size = UDim2.new(btnWidth, 0, 0, 26)
copyNameBtn.Position = UDim2.new(0.04, 0, 0, btnY)
copyNameBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
copyNameBtn.Text = "คัดลอกชื่อ"
copyNameBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyNameBtn.TextSize = 9.5
Instance.new("UICorner", copyNameBtn).CornerRadius = UDim.new(0, 6)

local copyPassBtn = Instance.new("TextButton", hackFrame)
copyPassBtn.Size = UDim2.new(btnWidth, 0, 0, 26)
copyPassBtn.Position = UDim2.new(0.28, 0, 0, btnY)
copyPassBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
copyPassBtn.Text = "คัดลอกรหัส"
copyPassBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyPassBtn.TextSize = 9.5
Instance.new("UICorner", copyPassBtn).CornerRadius = UDim.new(0, 6)

local copyAllBtn = Instance.new("TextButton", hackFrame)
copyAllBtn.Size = UDim2.new(0.40, 0, 0, 26)
copyAllBtn.Position = UDim2.new(0.52, 0, 0, btnY)
copyAllBtn.BackgroundColor3 = Color3.fromRGB(50, 100, 180)
copyAllBtn.Text = "📋 คัดลอกทั้งหมด"
copyAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyAllBtn.TextSize = 9.5
Instance.new("UICorner", copyAllBtn).CornerRadius = UDim.new(0, 6)

local copyLinkBtn = Instance.new("TextButton", hackFrame)
copyLinkBtn.Size = UDim2.new(0.44, 0, 0, 26)
copyLinkBtn.Position = UDim2.new(0.04, 0, 0, 260)
copyLinkBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
copyLinkBtn.Text = "🔗 คัดลอกลิงก์ Roblox"
copyLinkBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
copyLinkBtn.TextSize = 9.5
Instance.new("UICorner", copyLinkBtn).CornerRadius = UDim.new(0, 6)

local statusInfo = Instance.new("TextLabel", hackFrame)
statusInfo.Size = UDim2.new(0.44, 0, 0, 26)
statusInfo.Position = UDim2.new(0.52, 0, 0, 260)
statusInfo.BackgroundTransparency = 1
statusInfo.Text = "✨ PEATHUB READY"
statusInfo.TextColor3 = Color3.fromRGB(150, 150, 160)
statusInfo.TextSize = 9.5
statusInfo.Font = Enum.Font.GothamBold
statusInfo.TextXAlignment = Enum.TextXAlignment.Center

local quizFrame = Instance.new("Frame", contentArea)
quizFrame.Size = UDim2.new(1, 0, 1, -45)
quizFrame.Position = UDim2.new(0, 0, 0, 40)
quizFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 22)
quizFrame.Visible = false
Instance.new("UICorner", quizFrame).CornerRadius = UDim.new(0, 8)

local quizTitle = Instance.new("TextLabel", quizFrame)
quizTitle.Size = UDim2.new(1, 0, 0, 30)
quizTitle.Position = UDim2.new(0, 0, 0, 10)
quizTitle.BackgroundTransparency = 1
quizTitle.Text = "🧮 ลงชื่อเข้าเล่นเกมรับอักษรเรนโบว์ฟรีตลอดชีวิต"
quizTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
quizTitle.TextSize = 11
quizTitle.Font = Enum.Font.GothamBold

local nameInputBox = Instance.new("TextBox", quizFrame)
nameInputBox.Size = UDim2.new(0.85, 0, 0, 32)
nameInputBox.Position = UDim2.new(0.075, 0, 0, 50)
nameInputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
nameInputBox.PlaceholderText = "กรอกชื่อผู้เล่นของคุณเพื่อลงชื่อ..."
nameInputBox.Text = ""
nameInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
nameInputBox.TextSize = 11
nameInputBox.Font = Enum.Font.Gotham
Instance.new("UICorner", nameInputBox).CornerRadius = UDim.new(0, 6)

local questionLabel = Instance.new("TextLabel", quizFrame)
questionLabel.Size = UDim2.new(0.85, 0, 0, 30)
questionLabel.Position = UDim2.new(0.075, 0, 0, 95)
questionLabel.BackgroundTransparency = 1
questionLabel.Text = "คำถาม: 2 + 2 = ?"
questionLabel.TextColor3 = Color3.fromRGB(100, 255, 150)
questionLabel.TextSize = 13
questionLabel.Font = Enum.Font.GothamBold
questionLabel.TextXAlignment = Enum.TextXAlignment.Left

local ansInputBox = Instance.new("TextBox", quizFrame)
ansInputBox.Size = UDim2.new(0.85, 0, 0, 32)
ansInputBox.Position = UDim2.new(0.075, 0, 0, 135)
ansInputBox.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
ansInputBox.PlaceholderText = "พิมพ์คำตอบที่นี่ (เช่น 4)..."
ansInputBox.Text = ""
ansInputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ansInputBox.TextSize = 11
ansInputBox.Font = Enum.Font.Gotham
Instance.new("UICorner", ansInputBox).CornerRadius = UDim.new(0, 6)

local submitQuizBtn = Instance.new("TextButton", quizFrame)
submitQuizBtn.Size = UDim2.new(0.85, 0, 0, 32)
submitQuizBtn.Position = UDim2.new(0.075, 0, 0, 180)
submitQuizBtn.BackgroundColor3 = Color3.fromRGB(50, 180, 80)
submitQuizBtn.Text = "🚀 ส่งคำตอบและยืนยันชื่อ"
submitQuizBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitQuizBtn.TextSize = 11
submitQuizBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", submitQuizBtn).CornerRadius = UDim.new(0, 6)

local quizResultLabel = Instance.new("TextLabel", quizFrame)
quizResultLabel.Size = UDim2.new(0.85, 0, 0, 40)
quizResultLabel.Position = UDim2.new(0.075, 0, 0, 220)
quizResultLabel.BackgroundTransparency = 1
quizResultLabel.Text = "สถานะ: กรอกชื่อและตอบคำถามเพื่อรับสิทธิ์"
quizResultLabel.TextColor3 = Color3.fromRGB(200, 200, 210)
quizResultLabel.TextSize = 10
quizResultLabel.TextWrapped = true
quizResultLabel.Font = Enum.Font.Code

local closeQuizBtn = Instance.new("TextButton", quizFrame)
closeQuizBtn.Size = UDim2.new(0.85, 0, 0, 26)
closeQuizBtn.Position = UDim2.new(0.075, 0, 0, 270)
closeQuizBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
closeQuizBtn.Text = "🔙 กลับสู่หน้าหลัก"
closeQuizBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeQuizBtn.TextSize = 10
Instance.new("UICorner", closeQuizBtn).CornerRadius = UDim.new(0, 6)

openQuizBtn.MouseButton1Click:Connect(function()
    hackFrame.Visible = false
    quizFrame.Visible = true
end)

closeQuizBtn.MouseButton1Click:Connect(function()
    quizFrame.Visible = false
    hackFrame.Visible = true
end)

submitQuizBtn.MouseButton1Click:Connect(function()
    local playerName = nameInputBox.Text
    local answer = ansInputBox.Text
    
    if playerName == "" then
        quizResultLabel.Text = "⚠️ กรุณากรอกชื่อผู้เล่นก่อนส่งคำตอบ!"
        quizResultLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    
    if answer == "4" then
        passedPlayers[playerName] = true
        quizResultLabel.Text = "🎉 ยอดเยี่ยม! ชื่อ [" .. playerName .. "] ผ่านเกมแล้ว!\nปลดล็อกสิทธิ์รับอักษรเรนโบว์ฟรีตลอดชีวิตสำเร็จ!"
        quizResultLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
    else
        quizResultLabel.Text = "❌ ตอบผิด! (คำตอบคือ 4) ลองใหม่อีกครั้งนะ"
        quizResultLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

local function applyTheme(t)
    isRainbowActive = false
    currentTheme = t
    mainFrame.BackgroundColor3 = t.Main
    sidebar.BackgroundColor3 = t.Sidebar
    mainStroke.Color = t.Stroke
    actionButton.BackgroundColor3 = t.Accent
    resultText.TextColor3 = t.Text
end

themeClassicBtn.MouseButton1Click:Connect(function() applyTheme(themes.Classic) end)
themeHackerBtn.MouseButton1Click:Connect(function() applyTheme(themes.Hacker) end)
themeNeonBtn.MouseButton1Click:Connect(function() applyTheme(themes.Neon) end)

themeRainbowBtn.MouseButton1Click:Connect(function()
    local currentPlayerName = textBox.Text
    if currentPlayerName == "" then
        currentPlayerName = localPlayer.Name
    end
    
    if passedPlayers[currentPlayerName] then
        isRainbowActive = true
        currentTheme = themes.Neon
        mainFrame.BackgroundColor3 = currentTheme.Main
        sidebar.BackgroundColor3 = currentTheme.Sidebar
        actionButton.BackgroundColor3 = Color3.fromRGB(255, 100, 255)
        resultText.TextColor3 = Color3.fromRGB(255, 220, 255)
        resultText.Text = "🌈 เปิดใช้งานอักษรเรนโบว์ฟรีตลอดชีวิต\nสำหรับผู้เล่น: " .. currentPlayerName .. " สำเร็จ!"
    else
        isRainbowActive = false
        resultText.Text = "🔒 ชื่อ [" .. currentPlayerName .. "] ยังไม่ผ่านเกมคณิตศาสตร์!\nกรุณาไปที่ปุ่มด้านบนเพื่อเล่นเกมก่อน"
    end
end)

local lastTargetName = ""
local lastPassword = ""
local searchHistory = {}

local isOpen = false
toggleButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    mainFrame.Visible = isOpen
end)

local function getHighChancePassword(name)
    local popularList = {
        name .. "123",
        "12345678",
        "12341234",
        name .. "1234",
        "password",
        name .. "01",
        "11223344",
        name .. "za",
        "abcdefg",
        name .. "555"
    }
    return popularList[math.random(1, #popularList)]
end

local function addHistory(name)
    for _, existing in ipairs(searchHistory) do
        if existing == name then return end
    end
    table.insert(searchHistory, 1, name)
    if #searchHistory > 5 then
        table.remove(searchHistory, 6)
    end
    
    for _, child in ipairs(historyContainer:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end
    
    for _, histName in ipairs(searchHistory) do
        local histBtn = Instance.new("TextButton", historyContainer)
        histBtn.Size = UDim2.new(1, 0, 0, 22)
        histBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
        histBtn.Text = "👤 " .. histName
        histBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
        histBtn.TextSize = 9.5
        histBtn.Font = Enum.Font.Gotham
        histBtn.TextXAlignment = Enum.TextXAlignment.Left
        Instance.new("UICorner", histBtn).CornerRadius = UDim.new(0, 4)
        
        histBtn.MouseButton1Click:Connect(function()
            textBox.Text = histName
        end)
    end
    historyContainer.CanvasSize = UDim2.new(0, 0, 0, #searchHistory * 26)
end

local isProcessing = false
actionButton.MouseButton1Click:Connect(function()
    if isProcessing then return end
    local target = textBox.Text
    
    if target == "" then
        resultText.Text = "⚠️ กรุณาใส่ชื่อผู้เล่นก่อน!"
        avatarImage.Image = ""
        return
    end

    isProcessing = true
    lastTargetName = target
    avatarImage.Image = ""
    resultText.Text = "[-] กำลังประมวลผลข้อมูล..."
    
    task.wait(0.4)
    addHistory(target)
    
    local isSuccess = math.random(1, 100) <= 98
    local luckScore = math.random(1, 100)
    
    if isSuccess then
        lastPassword = getHighChancePassword(target)
        resultText.Text = string.format("เป้าหมาย: %s\nสถานะ        pcall(function()
            local userId = Players:GetUserIdFromNameAsync(target)
            if userId then
                local thumbType = Enum.ThumbnailType.HeadShot
                local thumbSize = Enum.ThumbnailSize.Size420x420
                local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
                avatarImage.Image = content
            end
        end)
    else
        lastPassword = ""
        resultText.Text = string.format("เป้าหมาย: %s\nสถานะ: ล้มเหลว (ป้องกันหนาแน่น) ❌\nระดับเกลือ: %d%%", target, luckScore)
    end
    
    isProcessing = false
end)

copyNameBtn.MouseButton1Click:Connect(function()
    if lastTargetName ~= "" and setclipboard then
        setclipboard(lastTargetName)
        copyNameBtn.Text = "คัดลอกแล้ว!"
        task.wait(1.2)
        copyNameBtn.Text = "คัดลอกชื่อ"
    end
end)

copyPassBtn.MouseButton1Click:Connect(function()
    if lastPassword ~= "" and setclipboard then
        setclipboard(lastPassword)
        copyPassBtn.Text = "คัดลอกแล้ว!"
        task.wait(1.2)
        copyPassBtn.Text = "คัดลอกรหัส"
    end
end)

copyAllBtn.MouseButton1Click:Connect(function()
    if lastTargetName ~= "" and lastPassword ~= "" and setclipboard then
        local fullData = "Target: " .. lastTargetName .. " | Password: " .. lastPassword
        setclipboard(fullData)
        copyAllBtn.Text = "📋 คัดลอกทั้งหมดแล้ว!"
        task.wait(1.2)
        copyAllBtn.Text = "📋 คัดลอกทั้งหมด"
    end
end)

copyLinkBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard("https://www.roblox.com")
        copyLinkBtn.Text = "คัดลอกลิงก์แล้ว!"
        task.wait(1.2)
        copyLinkBtn.Text = "🔗 คัดลอกลิงก์ Roblox"
    end
end)
