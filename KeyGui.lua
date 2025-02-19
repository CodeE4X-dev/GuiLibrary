-- Inisialisasi variabel global
getgenv().themes = {
    "Solid Dark",
    "Aqua",
    "Dark Ocean",
    "Gold",
    "Jungle",
    "Blood"
}

getgenv().realScript = "https://github.com/raw_script_url_here"
getgenv().scriptName = "My Script Name"
getgenv().discordLink = "https://discord.gg/yourdiscordlink"

-- Warna untuk masing-masing tema
local themeColors = {
    ["Solid Dark"] = {bg = Color3.fromRGB(30, 30, 30), btn = Color3.fromRGB(0, 120, 255)},
    ["Aqua"] = {bg = Color3.fromRGB(0, 255, 255), btn = Color3.fromRGB(0, 180, 180)},
    ["Dark Ocean"] = {bg = Color3.fromRGB(0, 51, 102), btn = Color3.fromRGB(0, 102, 204)},
    ["Gold"] = {bg = Color3.fromRGB(255, 215, 0), btn = Color3.fromRGB(255, 165, 0)},
    ["Jungle"] = {bg = Color3.fromRGB(34, 139, 34), btn = Color3.fromRGB(50, 205, 50)},
    ["Blood"] = {bg = Color3.fromRGB(139, 0, 0), btn = Color3.fromRGB(255, 0, 0)}
}

-- Function untuk membuat GUI
local function createGui()
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local CoreGui = game:GetService("StarterGui")
    
    local player = Players.LocalPlayer

    -- Membuat ScreenGui
    local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    screenGui.Name = "KeySystemGUI"

    -- Membuat Frame utama
    local mainFrame = Instance.new("Frame", screenGui)
    mainFrame.Size = UDim2.new(0, 400, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.BorderSizePixel = 0
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundTransparency = 0.1

    -- Corner rounding
    local corner = Instance.new("UICorner", mainFrame)
    corner.CornerRadius = UDim.new(0, 12)

    -- Title (Script Name)
    local title = Instance.new("TextLabel", mainFrame)
    title.Size = UDim2.new(1, 0, 0, 50)
    title.BackgroundTransparency = 1
    title.Text = getgenv().scriptName
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 24
    title.TextColor3 = Color3.fromRGB(255, 255, 255)

    -- Dropdown untuk Theme
    local themeDropdown = Instance.new("TextButton", mainFrame)
    themeDropdown.Text = "Select Theme"
    themeDropdown.Size = UDim2.new(0.8, 0, 0, 30)
    themeDropdown.Position = UDim2.new(0.1, 0, 0.2, 0)
    themeDropdown.Font = Enum.Font.SourceSans
    themeDropdown.TextSize = 16
    themeDropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    themeDropdown.TextColor3 = Color3.fromRGB(255, 255, 255)

    local dropdownCorner = Instance.new("UICorner", themeDropdown)
    dropdownCorner.CornerRadius = UDim.new(0, 8)

    local themeList = Instance.new("Frame", themeDropdown)
    themeList.Size = UDim2.new(1, 0, 0, 150)
    themeList.Position = UDim2.new(0, 0, 1, 5)
    themeList.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    themeList.Visible = false

    local listLayout = Instance.new("UIListLayout", themeList)
    listLayout.FillDirection = Enum.FillDirection.Vertical
    listLayout.Padding = UDim.new(0, 5)

    -- Tambahkan tema ke dropdown
    for _, theme in ipairs(getgenv().themes) do
        local themeButton = Instance.new("TextButton", themeList)
        themeButton.Text = theme
        themeButton.Size = UDim2.new(1, 0, 0, 30)
        themeButton.Font = Enum.Font.SourceSans
        themeButton.TextSize = 16
        themeButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        themeButton.TextColor3 = Color3.fromRGB(255, 255, 255)

        local buttonCorner = Instance.new("UICorner", themeButton)
        buttonCorner.CornerRadius = UDim.new(0, 8)

        themeButton.MouseButton1Click:Connect(function()
            local colors = themeColors[theme]
            mainFrame.BackgroundColor3 = colors.bg
            themeDropdown.BackgroundColor3 = colors.btn
            keyBox.BackgroundColor3 = colors.bg
            checkKeyBtn.BackgroundColor3 = colors.btn
            getKeyBtn.BackgroundColor3 = colors.btn
            closeBtn.BackgroundColor3 = colors.btn
            discordBtn.BackgroundColor3 = colors.btn
            themeList.Visible = false
        end)
    end

    themeDropdown.MouseButton1Click:Connect(function()
        themeList.Visible = not themeList.Visible
    end)

    -- Key Input Box
    local keyBox = Instance.new("TextBox", mainFrame)
    keyBox.PlaceholderText = "Enter your key here..."
    keyBox.Size = UDim2.new(0.8, 0, 0, 30)
    keyBox.Position = UDim2.new(0.1, 0, 0.4, 0)
    keyBox.Font = Enum.Font.SourceSans
    keyBox.TextSize = 16
    keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)

    local boxCorner = Instance.new("UICorner", keyBox)
    boxCorner.CornerRadius = UDim.new(0, 8)

    -- Check Key Button
    local checkKeyBtn = Instance.new("TextButton", mainFrame)
    checkKeyBtn.Text = "Check Key"
    checkKeyBtn.Size = UDim2.new(0.4, 0, 0, 30)
    checkKeyBtn.Position = UDim2.new(0.1, 0, 0.6, 0)
    checkKeyBtn.Font = Enum.Font.SourceSans
    checkKeyBtn.TextSize = 16
    checkKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    checkKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

    local btnCorner = Instance.new("UICorner", checkKeyBtn)
    btnCorner.CornerRadius = UDim.new(0, 8)

    -- Get Key Button
    local getKeyBtn = Instance.new("TextButton", mainFrame)
    getKeyBtn.Text = "Get Key"
    getKeyBtn.Size = UDim2.new(0.4, 0, 0, 30)
    getKeyBtn.Position = UDim2.new(0.5, 0, 0.6, 0)
    getKeyBtn.Font = Enum.Font.SourceSans
    getKeyBtn.TextSize = 16
    getKeyBtn.BackgroundColor3 = Color3.fromRGB(50, 205, 50)
    getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

    local getKeyCorner = Instance.new("UICorner", getKeyBtn)
    getKeyCorner.CornerRadius = UDim.new(0, 8)

    -- Close Button
    local closeBtn = Instance.new("TextButton", mainFrame)
    closeBtn.Text = "Close"
    closeBtn.Size = UDim2.new(0.3, 0, 0, 30)
    closeBtn.Position = UDim2.new(0.35, 0, 0.8, 0)
    closeBtn.Font = Enum.Font.SourceSans
    closeBtn.TextSize = 16
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

    local closeCorner = Instance.new("UICorner", closeBtn)
    closeCorner.CornerRadius = UDim.new(0, 8)

    -- Join Discord Button
    local discordBtn = Instance.new("TextButton", mainFrame)
    discordBtn.Text = "Join Discord"
    discordBtn.Size = UDim2.new(0.8, 0, 0, 30)
    discordBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
    discordBtn.Font = Enum.Font.SourceSans
    discordBtn.TextSize = 16
    discordBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    discordBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

    local discordCorner = Instance.new("UICorner", discordBtn)
    discordCorner.CornerRadius = UDim.new(0, 8)

    -- Fungsi API Check Key
    checkKeyBtn.MouseButton1Click:Connect(function()
        local key = keyBox.Text
        if key == "" then
            CoreGui:SetCore("SendNotification", {
                Title = "Error",
                Text = "Key cannot be empty!",
                Duration = 3
            })
            return
        end
        local response = game:HttpGet("https://starxkey-backend.vercel.app/check?key=" .. key)
        if response:find("key is valid") then
            CoreGui:SetCore("SendNotification", {
                Title = "Success",
                Text = "Key is valid! Loading script...",
                Duration = 3
            })
            wait(1)
            loadstring(game:HttpGet(getgenv().realScript))()
        else
            CoreGui:SetCore("SendNotification", {
                Title = "Invalid Key",
                Text = "The key you entered is not valid.",
                Duration = 3
            })
        end
    end)

    -- Fungsi Get Key
    getKeyBtn.MouseButton1Click:Connect(function()
        setclipboard("https://starx-gateaway.vercel.app/")
        CoreGui:SetCore("SendNotification", {
            Title = "Key Copied",
            Text = "The key link has been copied to your clipboard.",
            Duration = 3
        })
    end)

    -- Fungsi Close Button
    closeBtn.MouseButton1Click:Connect(function()
        screenGui.Enabled = false
    end)

    -- Fungsi Join Discord
    discordBtn.MouseButton1Click:Connect(function()
        setclipboard(getgenv().discordLink)
        CoreGui:SetCore("SendNotification", {
            Title = "Discord Link",
            Text = "Discord link has been copied to your clipboard.",
            Duration = 3
        })
    end)
end

-- Jalankan fungsi untuk membuat GUI
createGui()

