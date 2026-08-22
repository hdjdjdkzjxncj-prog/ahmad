-- Services
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Destroy old UI if exists
if PlayerGui:FindFirstChild("ALKAABI_UI") then
    PlayerGui.ALKAABI_UI:Destroy()
end

-- ScreenGui Creation
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ALKAABI_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- Main Frame (Dark Container)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 480, 0, 260)
MainFrame.Position = UDim2.new(0.5, -240, 0.5, -130)
MainFrame.BackgroundColor3 = Color3.fromRGB(24, 27, 34)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

-- Floating Animation Setup (تحرك خفيف مستمر)
local startPos = MainFrame.Position
local floatUp = TweenService:Create(MainFrame, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
    Position = startPos + UDim2.new(0, 0, 0, -8)
})
floatUp:Play()

-- Dragging Functionality (السحب)
local dragging, dragInput, dragStart, startPosDrag
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPosDrag = MainFrame.Position
    end
end)

MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPosDrag.X.Scale, startPosDrag.X.Offset + delta.X, startPosDrag.Y.Scale, startPosDrag.Y.Offset + delta.Y)
    end
end)

-- Top Right EN Text
local TopText = Instance.new("TextLabel")
TopText.Size = UDim2.new(0, 50, 0, 20)
TopText.Position = UDim2.new(1, -60, 0, 10)
TopText.BackgroundTransparency = 1
TopText.Text = "! EN"
TopText.TextColor3 = Color3.fromRGB(150, 150, 150)
TopText.Font = Enum.Font.SourceSansBold
TopText.TextSize = 13
TopText.Parent = MainFrame

-- Avatar Image (Circular Profile)
local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Size = UDim2.new(0, 110, 0, 110)
AvatarImage.Position = UDim2.new(0, 30, 0, 60)
AvatarImage.BackgroundColor3 = Color3.fromRGB(35, 38, 46)
AvatarImage.Image = "rbxassetid://133590886371666"
AvatarImage.ScaleType = Enum.ScaleType.Crop
AvatarImage.Parent = MainFrame

local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(1, 0)
AvatarCorner.Parent = AvatarImage

-- Title Section (ALKAABI PREMIUM)
local TitleBig = Instance.new("TextLabel")
TitleBig.Size = UDim2.new(0, 250, 0, 25)
TitleBig.Position = UDim2.new(0, 160, 0, 30)
TitleBig.BackgroundTransparency = 1
TitleBig.Text = "ALKAABI"
TitleBig.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBig.Font = Enum.Font.GothamBlack
TitleBig.TextSize = 24
TitleBig.TextXAlignment = Enum.TextXAlignment.Left
TitleBig.Parent = MainFrame

local TitleSub = Instance.new("TextLabel")
TitleSub.Size = UDim2.new(0, 250, 0, 15)
TitleSub.Position = UDim2.new(0, 160, 0, 52)
TitleSub.BackgroundTransparency = 1
TitleSub.Text = "PREMIUM"
TitleSub.TextColor3 = Color3.fromRGB(255, 35, 90)
TitleSub.Font = Enum.Font.GothamBold
TitleSub.TextSize = 12
TitleSub.TextXAlignment = Enum.TextXAlignment.Left
TitleSub.Parent = MainFrame

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(0, 250, 0, 15)
WelcomeText.Position = UDim2.new(0, 160, 0, 68)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "WELCOME BACK, PLEASE LOGIN"
WelcomeText.TextColor3 = Color3.fromRGB(130, 135, 145)
WelcomeText.Font = Enum.Font.SourceSansBold
WelcomeText.TextSize = 11
WelcomeText.TextXAlignment = Enum.TextXAlignment.Left
WelcomeText.Parent = MainFrame

-- Key Input Box Container
local InputFrame = Instance.new("Frame")
InputFrame.Size = UDim2.new(0, 280, 0, 36)
InputFrame.Position = UDim2.new(0, 160, 0, 92)
InputFrame.BackgroundColor3 = Color3.fromRGB(32, 36, 45)
InputFrame.BorderSizePixel = 0
InputFrame.Parent = MainFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = InputFrame

local KeyTextBox = Instance.new("TextBox")
KeyTextBox.Size = UDim2.new(1, -40, 1, 0)
KeyTextBox.Position = UDim2.new(0, 12, 0, 0)
KeyTextBox.BackgroundTransparency = 1
KeyTextBox.Text = ""
KeyTextBox.PlaceholderText = "? Tap here to enter your key"
KeyTextBox.PlaceholderColor3 = Color3.fromRGB(110, 115, 125)
KeyTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTextBox.Font = Enum.Font.SourceSans
KeyTextBox.TextSize = 14
KeyTextBox.TextXAlignment = Enum.TextXAlignment.Left
KeyTextBox.Parent = InputFrame

-- Clipboard Icon Button
local ClipboardBtn = Instance.new("TextButton")
ClipboardBtn.Size = UDim2.new(0, 28, 0, 28)
ClipboardBtn.Position = UDim2.new(1, -32, 0.5, -14)
ClipboardBtn.BackgroundColor3 = Color3.fromRGB(45, 50, 62)
ClipboardBtn.Text = "📋"
ClipboardBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
ClipboardBtn.TextSize = 14
ClipboardBtn.Parent = InputFrame

local ClipCorner = Instance.new("UICorner")
ClipCorner.CornerRadius = UDim.new(0, 6)
ClipCorner.Parent = ClipboardBtn

-- UNLOCK Button (Main Action)
local UnlockBtn = Instance.new("TextButton")
UnlockBtn.Size = UDim2.new(0, 280, 0, 36)
UnlockBtn.Position = UDim2.new(0, 160, 0, 136)
UnlockBtn.BackgroundColor3 = Color3.fromRGB(255, 35, 90)
UnlockBtn.Text = "UNLOCK"
UnlockBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
UnlockBtn.Font = Enum.Font.GothamBold
UnlockBtn.TextSize = 14
UnlockBtn.Parent = MainFrame

local UnlockCorner = Instance.new("UICorner")
UnlockCorner.CornerRadius = UDim.new(0, 8)
UnlockCorner.Parent = UnlockBtn

-- Bottom Buttons Row (Telegram & RETRY)
local TelegramBtn = Instance.new("TextButton")
TelegramBtn.Size = UDim2.new(0, 135, 0, 30)
TelegramBtn.Position = UDim2.new(0, 160, 0, 178)
TelegramBtn.BackgroundColor3 = Color3.fromRGB(40, 45, 56)
TelegramBtn.Text = "Telegram"
TelegramBtn.TextColor3 = Color3.fromRGB(180, 185, 195)
TelegramBtn.Font = Enum.Font.SourceSansBold
TelegramBtn.TextSize = 13
TelegramBtn.Parent = MainFrame

local TeleCorner = Instance.new("UICorner")
TeleCorner.CornerRadius = UDim.new(0, 6)
TeleCorner.Parent = TelegramBtn

local RetryBtn = Instance.new("TextButton")
RetryBtn.Size = UDim2.new(0, 135, 0, 30)
RetryBtn.Position = UDim2.new(0, 305, 0, 178)
RetryBtn.BackgroundColor3 = Color3.fromRGB(255, 35, 90)
RetryBtn.Text = "RETRY"
RetryBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RetryBtn.Font = Enum.Font.GothamBold
RetryBtn.TextSize = 12
RetryBtn.Parent = MainFrame

local RetryCorner = Instance.new("UICorner")
RetryCorner.CornerRadius = UDim.new(0, 6)
RetryCorner.Parent = RetryBtn

-- Bottom Status Bar
local StatusFrame = Instance.new("Frame")
StatusFrame.Size = UDim2.new(1, 0, 0, 32)
StatusFrame.Position = UDim2.new(0, 0, 1, -32)
StatusFrame.BackgroundColor3 = Color3.fromRGB(18, 20, 26)
StatusFrame.BorderSizePixel = 0
StatusFrame.Parent = MainFrame

local function createStatusItem(text, xOffset)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(0, 100, 1, 0)
    label.Position = UDim2.new(0, xOffset, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = "🤖 " .. text
    label.TextColor3 = Color3.fromRGB(140, 145, 155)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = StatusFrame
end

createStatusItem("Secure Client", 20)
createStatusItem("System Online", 160)
createStatusItem("Connected", 290)

local VersionText = Instance.new("TextLabel")
VersionText.Size = UDim2.new(0, 50, 1, 0)
VersionText.Position = UDim2.new(1, -55, 0, 0)
VersionText.BackgroundTransparency = 1
VersionText.Text = "v1.0.1"
VersionText.TextColor3 = Color3.fromRGB(100, 105, 115)
VersionText.Font = Enum.Font.SourceSans
VersionText.TextSize = 11
VersionText.Parent = StatusFrame

---------------------------------------------------------
-- INJECTION & PASSWORD SYSTEM (نظام الحقن والباسورد)
---------------------------------------------------------

local CORRECT_KEY = "KAABI"
local passwordCorrect = false
local mainScriptLoaded = false

-- هنا نضع السكربت الرئيسي (Al-Kaabi Hub) في متغير
local AlKaabiHubScript = [[

-- =============================================
-- Al-Kaabi Pro Cheat Hub | Ultimate V7.0 (Image & Home Updated)
-- =============================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Global Settings
local Settings = {
    Box_ESP = false,
    Health_ESP = false,
    Tracer_ESP = false,
    Name_ESP = false,
    
    Hitbox_Enabled = false,
    Hitbox_Size = 10,
    
    Aimbot_Enabled = false,
    FOV_Visible = false,
    Aimbot_FOV = 100,
    
    Fly_Enabled = false,
    Fly_Speed = 1,
    
    ESP_Color = Color3.fromRGB(255, 50, 50),
    Aimbot_IgnoreList = {}
}

-- UI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AlKaabiHub_V7_Advanced"
ScreenGui.ResetOnSpawn = false
pcall(function() 
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") 
end)

-- Main Window Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 550, 0, 380)
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ZIndex = 5
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 255, 170)
MainStroke.Thickness = 1.8
MainStroke.Parent = MainFrame

-- Top Bar / Header
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 6
TopBar.Parent = MainFrame

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 12)
TopBarCorner.Parent = TopBar

local TopBarCover = Instance.new("Frame")
TopBarCover.Size = UDim2.new(1, 0, 0, 12)
TopBarCover.Position = UDim2.new(0, 0, 1, -12)
TopBarCover.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
TopBarCover.BorderSizePixel = 0
TopBarCover.ZIndex = 6
TopBarCover.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = " AL-KAABI | TG:- @MM_Kkx"
Title.TextColor3 = Color3.fromRGB(0, 255, 170)
Title.TextSize = 15
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.ZIndex = 7
Title.Parent = TopBar

-- Minimize Button
local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 34, 0, 34)
MinimizeBtn.Position = UDim2.new(1, -38, 0, 5)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 14
MinimizeBtn.ZIndex = 7
MinimizeBtn.Parent = TopBar

local MinBtnCorner = Instance.new("UICorner")
MinBtnCorner.CornerRadius = UDim.new(0, 8)
MinBtnCorner.Parent = MinimizeBtn

-- Floating Animated Open Button
local OpenBtn = Instance.new("ImageButton")
OpenBtn.Size = UDim2.new(0, 60, 0, 60)
OpenBtn.Position = UDim2.new(0, 20, 0.5, -30)
OpenBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
OpenBtn.Image = "rbxassetid://133590886371666"
OpenBtn.Visible = false
OpenBtn.Active = true
OpenBtn.Draggable = true
OpenBtn.ZIndex = 15
OpenBtn.Parent = ScreenGui

local OpenBtnCorner = Instance.new("UICorner")
OpenBtnCorner.CornerRadius = UDim.new(0, 10)
OpenBtnCorner.Parent = OpenBtn

local OpenBtnStroke = Instance.new("UIStroke")
OpenBtnStroke.Color = Color3.fromRGB(0, 255, 170)
OpenBtnStroke.Thickness = 2.5
OpenBtnStroke.Parent = OpenBtn

task.spawn(function()
    while true do
        TweenService:Create(OpenBtnStroke, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0.8}):Play()
        task.wait(0.6)
        TweenService:Create(OpenBtnStroke, TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0}):Play()
        task.wait(0.6)
    end
end)

-- Sidebar Navigation
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Size = UDim2.new(0, 140, 1, -115)
Sidebar.Position = UDim2.new(0, 10, 0, 50)
Sidebar.BackgroundTransparency = 1
Sidebar.ScrollBarThickness = 2
Sidebar.ZIndex = 6
Sidebar.Parent = MainFrame

local SidebarLayout = Instance.new("UIListLayout")
SidebarLayout.Parent = Sidebar
SidebarLayout.SortOrder = Enum.SortOrder.LayoutOrder
SidebarLayout.Padding = UDim.new(0, 8)

-- Sidebar Image
local SidebarImage = Instance.new("ImageLabel")
SidebarImage.Size = UDim2.new(0, 140, 0, 55)
SidebarImage.Position = UDim2.new(0, 10, 1, -60)
SidebarImage.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
SidebarImage.Image = "rbxassetid://133590886371666"
SidebarImage.ZIndex = 6
SidebarImage.Parent = MainFrame

local SidebarImgCorner = Instance.new("UICorner")
SidebarImgCorner.CornerRadius = UDim.new(0, 8)
SidebarImgCorner.Parent = SidebarImage

local SidebarImgStroke = Instance.new("UIStroke")
SidebarImgStroke.Color = Color3.fromRGB(0, 255, 170)
SidebarImgStroke.Thickness = 1.2
SidebarImgStroke.Parent = SidebarImage

-- Content Container
local ContentContainer = Instance.new("Frame")
ContentContainer.Size = UDim2.new(1, -165, 1, -55)
ContentContainer.Position = UDim2.new(0, 160, 0, 50)
ContentContainer.BackgroundTransparency = 1
ContentContainer.ZIndex = 6
ContentContainer.Parent = MainFrame

local Pages = {}

local function CreatePage(name)
    local PageFrame = Instance.new("ScrollingFrame")
    PageFrame.Size = UDim2.new(1, 0, 1, 0)
    PageFrame.BackgroundTransparency = 1
    PageFrame.ScrollBarThickness = 3
    PageFrame.Visible = false
    PageFrame.ZIndex = 6
    PageFrame.Parent = ContentContainer
    
    local Layout = Instance.new("UIListLayout")
    Layout.Parent = PageFrame
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Padding = UDim.new(0, 8)
    
    Pages[name] = PageFrame
    return PageFrame
end

local function SwitchPage(name)
    for pageName, frame in pairs(Pages) do
        frame.Visible = (pageName == name)
    end
end

-- Create Pages
local HomePage = CreatePage("HOME")
local EspPage = CreatePage("ESP")
local AimbotPage = CreatePage("Aimbot")
local FlyPage = CreatePage("Fly")
local PlayersPage = CreatePage("Players")

local function CreateTabButton(name, targetPage)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 36)
    Btn.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(170, 170, 190)
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextSize = 12
    Btn.ZIndex = 7
    Btn.Parent = Sidebar
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Btn
    
    Btn.MouseButton1Click:Connect(function()
        SwitchPage(targetPage)
        for _, child in pairs(Sidebar:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
                child.TextColor3 = Color3.fromRGB(170, 170, 190)
            end
        end
        Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 50)
        Btn.TextColor3 = Color3.fromRGB(0, 255, 170)
    end)
end

CreateTabButton(" الرئيسية (HOME)", "HOME")
CreateTabButton(" كشف (ESP)", "ESP")
CreateTabButton(" الإيمبوت", "Aimbot")
CreateTabButton(" الطيران", "Fly")
CreateTabButton(" اللاعبين", "Players")

SwitchPage("HOME")
Sidebar:GetChildren()[2].BackgroundColor3 = Color3.fromRGB(30, 30, 50)
Sidebar:GetChildren()[2].TextColor3 = Color3.fromRGB(0, 255, 170)

-- =============================================
-- HOME Page Content
-- =============================================
local HomeHeaderContainer = Instance.new("Frame")
HomeHeaderContainer.Size = UDim2.new(1, -6, 0, 75)
HomeHeaderContainer.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
HomeHeaderContainer.ZIndex = 7
HomeHeaderContainer.Parent = HomePage

local HomeHeaderCorner = Instance.new("UICorner")
HomeHeaderCorner.CornerRadius = UDim.new(0, 8)
HomeHeaderCorner.Parent = HomeHeaderContainer

local HomeSquareImg = Instance.new("ImageLabel")
HomeSquareImg.Size = UDim2.new(0, 60, 0, 60)
HomeSquareImg.Position = UDim2.new(0, 8, 0, 7)
HomeSquareImg.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
HomeSquareImg.Image = "rbxassetid://133590886371666"
HomeSquareImg.ZIndex = 8
HomeSquareImg.Parent = HomeHeaderContainer

local HomeImgCorner = Instance.new("UICorner")
HomeImgCorner.CornerRadius = UDim.new(0, 8)
HomeImgCorner.Parent = HomeSquareImg

local HomeImgStroke = Instance.new("UIStroke")
HomeImgStroke.Color = Color3.fromRGB(0, 255, 170)
HomeImgStroke.Thickness = 1.5
HomeImgStroke.Parent = HomeSquareImg

local HomeTitle = Instance.new("TextLabel")
HomeTitle.Size = UDim2.new(1, -80, 0.5, 0)
HomeTitle.Position = UDim2.new(0, 78, 0, 12)
HomeTitle.BackgroundTransparency = 1
HomeTitle.Text = "👑 Developer: AL-KAABI"
HomeTitle.TextColor3 = Color3.fromRGB(0, 255, 170)
HomeTitle.Font = Enum.Font.GothamBold
HomeTitle.TextSize = 14
HomeTitle.TextXAlignment = Enum.TextXAlignment.Left
HomeTitle.ZIndex = 8
HomeTitle.Parent = HomeHeaderContainer

local HomeSubTitle = Instance.new("TextLabel")
HomeSubTitle.Size = UDim2.new(1, -80, 0.5, 0)
HomeSubTitle.Position = UDim2.new(0, 78, 0.45, 0)
HomeSubTitle.BackgroundTransparency = 1
HomeSubTitle.Text = "Ultimate Roblox Tool V7.0"
HomeSubTitle.TextColor3 = Color3.fromRGB(180, 180, 190)
HomeSubTitle.Font = Enum.Font.GothamSemibold
HomeSubTitle.TextSize = 11
HomeSubTitle.TextXAlignment = Enum.TextXAlignment.Left
HomeSubTitle.ZIndex = 8
HomeSubTitle.Parent = HomeHeaderContainer

local function CreateSocialButton(parentPage, labelText, subText, linkText)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -6, 0, 55)
    Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
    Frame.ZIndex = 7
    Frame.Parent = parentPage

    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 8)
    FrameCorner.Parent = Frame

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(0.6, 0, 0.5, 0)
    TitleLabel.Position = UDim2.new(0, 12, 0, 6)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = labelText
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.TextSize = 12
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.ZIndex = 8
    TitleLabel.Parent = Frame

    local SubLabel = Instance.new("TextLabel")
    SubLabel.Size = UDim2.new(0.6, 0, 0.4, 0)
    SubLabel.Position = UDim2.new(0, 12, 0.5, 0)
    SubLabel.BackgroundTransparency = 1
    SubLabel.Text = subText
    SubLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
    SubLabel.Font = Enum.Font.GothamSemibold
    SubLabel.TextSize = 11
    SubLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubLabel.ZIndex = 8
    SubLabel.Parent = Frame

    local CopyBtn = Instance.new("TextButton")
    CopyBtn.Size = UDim2.new(0.32, 0, 0.7, 0)
    CopyBtn.Position = UDim2.new(0.65, 0, 0.15, 0)
    CopyBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
    CopyBtn.Text = "نسخ المعرف"
    CopyBtn.TextColor3 = Color3.fromRGB(12, 12, 18)
    CopyBtn.Font = Enum.Font.GothamBold
    CopyBtn.TextSize = 11
    CopyBtn.ZIndex = 8
    CopyBtn.Parent = Frame

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = CopyBtn

    CopyBtn.MouseButton1Click:Connect(function()
        pcall(function()
            setclipboard(linkText)
        end)
        CopyBtn.Text = "تم النسخ! ✅"
        CopyBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 130)
        task.wait(1.5)
        CopyBtn.Text = "نسخ المعرف"
        CopyBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
    end)
end

CreateSocialButton(HomePage, "📢 قناة التليجرام", "قناة المطور الرسمية: @OOWCN", "@OOWCN")
CreateSocialButton(HomePage, "💬 حساب التليجرام", "تواصل مباشر مع المطور: @MM_KKX", "@MM_KKX")
CreateSocialButton(HomePage, "🎬 حساب التيك توك", "تابعني على تيك توك: @FGX_a", "@FGX_a")

-- Helper functions for UI elements
local function CreateToggle(parentPage, name, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -6, 0, 38)
    Btn.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
    Btn.Text = "  " .. name .. ": OFF"
    Btn.TextColor3 = Color3.fromRGB(180, 180, 190)
    Btn.Font = Enum.Font.GothamSemibold
    Btn.TextSize = 11
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.ZIndex = 7
    Btn.Parent = parentPage

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Btn

    local state = false
    Btn.MouseButton1Click:Connect(function()
        state = not state
        Btn.Text = "  " .. name .. ": " .. (state and "ON" or "OFF")
        Btn.TextColor3 = state and Color3.fromRGB(0, 255, 170) or Color3.fromRGB(180, 180, 190)
        Btn.BackgroundColor3 = state and Color3.fromRGB(15, 40, 32) or Color3.fromRGB(18, 18, 26)
        callback(state)
    end)
    return Btn
end

local function CreateInputBox(parentPage, placeholderText, defaultValue, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -6, 0, 38)
    Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
    Frame.ZIndex = 7
    Frame.Parent = parentPage

    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 8)
    FrameCorner.Parent = Frame

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.6, 0, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = placeholderText
    Label.TextColor3 = Color3.fromRGB(180, 180, 190)
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 11
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.ZIndex = 8
    Label.Parent = Frame

    local Input = Instance.new("TextBox")
    Input.Size = UDim2.new(0.32, 0, 0.7, 0)
    Input.Position = UDim2.new(0.65, 0, 0.15, 0)
    Input.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
    Input.Text = tostring(defaultValue)
    Input.TextColor3 = Color3.fromRGB(0, 255, 170)
    Input.Font = Enum.Font.GothamBold
    Input.TextSize = 11
    Input.ZIndex = 8
    Input.Parent = Frame

    local InputCorner = Instance.new("UICorner")
    InputCorner.CornerRadius = UDim.new(0, 6)
    InputCorner.Parent = Input

    Input.FocusLost:Connect(function()
        local num = tonumber(Input.Text)
        if num then
            callback(num)
        else
            Input.Text = tostring(defaultValue)
        end
    end)
end

-- Populate pages
CreateToggle(EspPage, "كشف زوايا المربع (Box ESP)", function(val) Settings.Box_ESP = val end)
CreateToggle(EspPage, "كشف صحة اللاعب (Health ESP)", function(val) Settings.Health_ESP = val end)
CreateToggle(EspPage, "كشف الخطوط (Tracers)", function(val) Settings.Tracer_ESP = val end)
CreateToggle(EspPage, "كشف أسماء اللاعبين (Name ESP)", function(val) Settings.Name_ESP = val end)

CreateToggle(AimbotPage, "تفعيل الإيمبوت (Sticky Aimbot)", function(val) Settings.Aimbot_Enabled = val end)
CreateToggle(AimbotPage, "إظهار دائرة الإيمبوت (FOV)", function(val) Settings.FOV_Visible = val end)
CreateInputBox(AimbotPage, "حجم دائرة الإيمبوت:", Settings.Aimbot_FOV, function(val) Settings.Aimbot_FOV = val end)
CreateToggle(AimbotPage, "تفعيل الهيت بوكس (Hitbox)", function(val) Settings.Hitbox_Enabled = val end)
CreateInputBox(AimbotPage, "حجم الهيت بوكس:", Settings.Hitbox_Size, function(val) Settings.Hitbox_Size = val end)

CreateToggle(FlyPage, "تفعيل الطيران الحر (Fly)", function(val) 
    Settings.Fly_Enabled = val
    if val then StartFly() else StopFly() end
end)
CreateInputBox(FlyPage, "سرعة الطيران:", Settings.Fly_Speed, function(val) Settings.Fly_Speed = val end)

-- Players List
local PlayerListScroll = Instance.new("ScrollingFrame")
PlayerListScroll.Size = UDim2.new(1, -6, 1, 0)
PlayerListScroll.BackgroundTransparency = 1
PlayerListScroll.ScrollBarThickness = 3
PlayerListScroll.ZIndex = 7
PlayerListScroll.Parent = PlayersPage

local PlayerListLayout = Instance.new("UIListLayout")
PlayerListLayout.Parent = PlayerListScroll
PlayerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
PlayerListLayout.Padding = UDim.new(0, 4)

local function UpdatePlayerPanel()
    for _, child in pairs(PlayerListScroll:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local PlayerBtn = Instance.new("TextButton")
            PlayerBtn.Size = UDim2.new(1, 0, 0, 36)
            PlayerBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
            PlayerBtn.Text = "  " .. player.Name
            PlayerBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
            PlayerBtn.Font = Enum.Font.GothamSemibold
            PlayerBtn.TextSize = 11
            PlayerBtn.TextXAlignment = Enum.TextXAlignment.Left
            PlayerBtn.ZIndex = 8
            PlayerBtn.Parent = PlayerListScroll
            
            local BtnCorner = Instance.new("UICorner")
            BtnCorner.CornerRadius = UDim.new(0, 8)
            BtnCorner.Parent = PlayerBtn
            
            local function UpdateButtonState()
                local isIgnored = table.find(Settings.Aimbot_IgnoreList, string.lower(player.Name))
                if isIgnored then
                    PlayerBtn.Text = "  🚫 " .. player.Name .. " (متجاهل)"
                    PlayerBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
                    PlayerBtn.BackgroundColor3 = Color3.fromRGB(45, 20, 20)
                else
                    PlayerBtn.Text = "  " .. player.Name
                    PlayerBtn.TextColor3 = Color3.fromRGB(180, 180, 190)
                    PlayerBtn.BackgroundColor3 = Color3.fromRGB(18, 18, 26)
                end
            end
            
            UpdateButtonState()
            
            PlayerBtn.MouseButton1Click:Connect(function()
                local playerNameLower = string.lower(player.Name)
                local index = table.find(Settings.Aimbot_IgnoreList, playerNameLower)
                if index then
                    table.remove(Settings.Aimbot_IgnoreList, index)
                else
                    table.insert(Settings.Aimbot_IgnoreList, playerNameLower)
                end
                UpdateButtonState()
            end)
        end
    end
end

Players.PlayerAdded:Connect(UpdatePlayerPanel)
Players.PlayerRemoving:Connect(UpdatePlayerPanel)
Sidebar:GetChildren()[6].MouseButton1Click:Connect(UpdatePlayerPanel)

-- Window controls
local isMinimized = false
local function MinimizeMenu()
    isMinimized = true
    MainFrame.Visible = false
    OpenBtn.Visible = true
end

local function MaximizeMenu()
    isMinimized = false
    MainFrame.Visible = true
    OpenBtn.Visible = false
end

MinimizeBtn.MouseButton1Click:Connect(MinimizeMenu)
OpenBtn.MouseButton1Click:Connect(MaximizeMenu)

UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.Insert then
        if isMinimized then MaximizeMenu() else MinimizeMenu() end
    end
end)

-- =============================================
-- Core Functions (ESP, Aimbot, Fly, Hitbox)
-- =============================================
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 100
FOVCircle.Filled = false
FOVCircle.Visible = false
FOVCircle.Color = Color3.fromRGB(0, 255, 170)

RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            if Settings.Hitbox_Enabled then
                hrp.Size = Vector3.new(Settings.Hitbox_Size, Settings.Hitbox_Size, Settings.Hitbox_Size)
                hrp.Transparency = 0.7
                hrp.BrickColor = BrickColor.new("Really red")
                hrp.CanCollide = false
            else
                hrp.Size = Vector3.new(2, 2, 1)
                hrp.Transparency = 1
            end
        end
    end
end)

local nowe = false
function StartFly()
    nowe = true
    task.spawn(function()
        while nowe and Settings.Fly_Enabled do
            local character = LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            if character and humanoid then
                local rootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("UpperTorso")
                if rootPart then
                    local bodyVelocity = rootPart:FindFirstChild("FlyVelocity") or Instance.new("BodyVelocity")
                    bodyVelocity.Name = "FlyVelocity"
                    bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    bodyVelocity.Parent = rootPart
                    
                    local bodyGyro = rootPart:FindFirstChild("FlyGyro") or Instance.new("BodyGyro")
                    bodyGyro.Name = "FlyGyro"
                    bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                    bodyGyro.CFrame = Camera.CFrame
                    bodyGyro.Parent = rootPart
                    
                    local moveDirection = Vector3.new(0, 0, 0)
                    if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveDirection += Camera.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveDirection -= Camera.CFrame.LookVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveDirection -= Camera.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveDirection += Camera.CFrame.RightVector end
                    if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveDirection += Vector3.new(0, 1, 0) end
                    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then moveDirection -= Vector3.new(0, 1, 0) end
                    
                    if moveDirection.Magnitude > 0 then
                        moveDirection = moveDirection.Unit * Settings.Fly_Speed * 10
                    end
                    bodyVelocity.Velocity = moveDirection
                    bodyGyro.CFrame = Camera.CFrame
                end
            end
            RunService.Heartbeat:Wait()
        end
    end)
end

function StopFly()
    nowe = false
    local character = LocalPlayer.Character
    if character then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            if rootPart:FindFirstChild("FlyVelocity") then rootPart.FlyVelocity:Destroy() end
            if rootPart:FindFirstChild("FlyGyro") then rootPart.FlyGyro:Destroy() end
        end
    end
end

local function IsPlayerVisible(char)
    if not char or not char:FindFirstChild("Head") then return false end
    local origin = Camera.CFrame.Position
    local headPos = char.Head.Position
    local direction = (headPos - origin).Unit
    local distance = (headPos - origin).Magnitude
    
    local rayParams = RaycastParams.new()
    rayParams.FilterType = Enum.RaycastFilterType.Blacklist
    if LocalPlayer.Character then rayParams.FilterDescendantsInstances = {LocalPlayer.Character} end
    
    local result = workspace:Raycast(origin, direction * distance, rayParams)
    if result then
        if result.Instance:IsDescendantOf(char) then return true end
        return false
    end
    return true
end

local function GetClosestVisiblePlayer()
    local target, shortestDist = nil, Settings.Aimbot_FOV
    local center = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player == LocalPlayer then continue end
        if table.find(Settings.Aimbot_IgnoreList, string.lower(player.Name)) then continue end
        
        local char = player.Character
        if not char or not char:FindFirstChild("Head") or not char:FindFirstChildOfClass("Humanoid") or char.Humanoid.Health <= 0 then continue end
        
        local headPos, onScreen = Camera:WorldToScreenPoint(char.Head.Position)
        if not onScreen then continue end
        
        local dist = (Vector2.new(headPos.X, headPos.Y) - center).Magnitude
        if dist > Settings.Aimbot_FOV then continue end
        
        if IsPlayerVisible(char) then
            if dist < shortestDist then
                shortestDist = dist
                target = char.Head
            end
        end
    end
    return target
end

local ESP_Drawings = {}
local function RemoveESP(player)
    if ESP_Drawings[player] then
        for _, obj in pairs(ESP_Drawings[player]) do
            if obj.Remove then obj:Remove() end
        end
        ESP_Drawings[player] = nil
    end
end

local function CreateCornerLines(draw, x, y, width, height, color, thickness)
    local cornerSize = math.min(width, height) * 0.2
    draw.TopLeft.From = Vector2.new(x, y + cornerSize)
    draw.TopLeft.To = Vector2.new(x, y)
    draw.TopLeft.Color = color
    draw.TopLeft.Thickness = thickness
    
    draw.TopLeft2.From = Vector2.new(x, y)
    draw.TopLeft2.To = Vector2.new(x + cornerSize, y)
    draw.TopLeft2.Color = color
    draw.TopLeft2.Thickness = thickness
    
    draw.TopRight.From = Vector2.new(x + width, y + cornerSize)
    draw.TopRight.To = Vector2.new(x + width, y)
    draw.TopRight.Color = color
    draw.TopRight.Thickness = thickness
    
    draw.TopRight2.From = Vector2.new(x + width, y)
    draw.TopRight2.To = Vector2.new(x + width - cornerSize, y)
    draw.TopRight2.Color = color
    draw.TopRight2.Thickness = thickness
    
    draw.BottomLeft.From = Vector2.new(x, y + height - cornerSize)
    draw.BottomLeft.To = Vector2.new(x, y + height)
    draw.BottomLeft.Color = color
    draw.BottomLeft.Thickness = thickness
    
    draw.BottomLeft2.From = Vector2.new(x, y + height)
    draw.BottomLeft2.To = Vector2.new(x + cornerSize, y + height)
    draw.BottomLeft2.Color = color
    draw.BottomLeft2.Thickness = thickness
    
    draw.BottomRight.From = Vector2.new(x + width, y + height - cornerSize)
    draw.BottomRight.To = Vector2.new(x + width, y + height)
    draw.BottomRight.Color = color
    draw.BottomRight.Thickness = thickness
    
    draw.BottomRight2.From = Vector2.new(x + width, y + height)
    draw.BottomRight2.To = Vector2.new(x + width - cornerSize, y + height)
    draw.BottomRight2.Color = color
    draw.BottomRight2.Thickness = thickness
end

RunService.RenderStepped:Connect(function()
    local viewportSize = Camera.ViewportSize
    FOVCircle.Position = Vector2.new(viewportSize.X / 2, viewportSize.Y / 2)
    FOVCircle.Radius = Settings.Aimbot_FOV
    FOVCircle.Visible = Settings.FOV_Visible

    if Settings.Aimbot_Enabled then
        local targetHead = GetClosestVisiblePlayer()
        if targetHead then
            local direction = (targetHead.Position - Camera.CFrame.Position).Unit
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + direction)
        end
    end

    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid") then
            local char = plr.Character
            local hrp = char.HumanoidRootPart
            local hum = char:FindFirstChildOfClass("Humanoid")
            local head = char:FindFirstChild("Head")

            if hum.Health > 0 then
                local hrpPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    if not ESP_Drawings[plr] then
                        ESP_Drawings[plr] = {
                            TopLeft = Drawing.new("Line"), TopLeft2 = Drawing.new("Line"),
                            TopRight = Drawing.new("Line"), TopRight2 = Drawing.new("Line"),
                            BottomLeft = Drawing.new("Line"), BottomLeft2 = Drawing.new("Line"),
                            BottomRight = Drawing.new("Line"), BottomRight2 = Drawing.new("Line"),
                            HealthBar = Drawing.new("Line"), HealthBarBg = Drawing.new("Line"),
                            Tracer = Drawing.new("Line"), NameText = Drawing.new("Text")
                        }
                    end

                    local draw = ESP_Drawings[plr]
                    local headPos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
                    local legPos = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0))
                    local boxHeight = math.abs(headPos.Y - legPos.Y)
                    local boxWidth = boxHeight / 1.5
                    
                    local centerX = hrpPos.X
                    local topY = hrpPos.Y - boxHeight / 2
                    local bottomY = hrpPos.Y + boxHeight / 2
                    local leftX = centerX - boxWidth / 2
                    
                    local isVisible = IsPlayerVisible(char)
                    local espColor = isVisible and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
                    
                    if Settings.Box_ESP then
                        CreateCornerLines(draw, leftX, topY, boxWidth, boxHeight, espColor, 2)
                        for _, d in pairs({draw.TopLeft, draw.TopLeft2, draw.TopRight, draw.TopRight2, draw.BottomLeft, draw.BottomLeft2, draw.BottomRight, draw.BottomRight2}) do d.Visible = true end
                    else
                        for _, d in pairs({draw.TopLeft, draw.TopLeft2, draw.TopRight, draw.TopRight2, draw.BottomLeft, draw.BottomLeft2, draw.BottomRight, draw.BottomRight2}) do d.Visible = false end
                    end
                    
                    local healthPercent = hum.Health / hum.MaxHealth
                    local barWidth = boxWidth * 1.2
                    local barY = topY - 10
                    
                    draw.HealthBarBg.Visible = Settings.Health_ESP
                    draw.HealthBarBg.From = Vector2.new(centerX - barWidth/2, barY)
                    draw.HealthBarBg.To = Vector2.new(centerX + barWidth/2, barY)
                    draw.HealthBarBg.Color = Color3.fromRGB(30, 30, 30)
                    draw.HealthBarBg.Thickness = 6
                    
                    draw.HealthBar.Visible = Settings.Health_ESP
                    draw.HealthBar.From = Vector2.new(centerX - barWidth/2, barY)
                    draw.HealthBar.To = Vector2.new(centerX - barWidth/2 + (barWidth * healthPercent), barY)
                    draw.HealthBar.Color = Color3.fromRGB(0, 255, 100)
                    draw.HealthBar.Thickness = 4
                    
                    draw.Tracer.Visible = Settings.Tracer_ESP
                    draw.Tracer.From = Vector2.new(viewportSize.X / 2, viewportSize.Y)
                    draw.Tracer.To = Vector2.new(centerX, bottomY)
                    draw.Tracer.Color = espColor
                    draw.Tracer.Thickness = 1.5
                    
                    if Settings.Name_ESP then
                        draw.NameText.Visible = true
                        draw.NameText.Text = plr.Name
                        draw.NameText.Position = Vector2.new(centerX, topY - 25)
                        draw.NameText.Center = true
                        draw.NameText.Size = 12
                        draw.NameText.Color = Color3.fromRGB(255, 255, 255)
                    else
                        draw.NameText.Visible = false
                    end
                else
                    RemoveESP(plr)
                end
            else
                RemoveESP(plr)
            end
        else
            RemoveESP(plr)
        end
    end
end)

Players.PlayerRemoving:Connect(RemoveESP)

game.StarterGui:SetCore("SendNotification", {
    Title = "Al-Kaabi Hub V7",
    Text = "Loaded Successfully! 🚀",
    Duration = 5,
    Icon = "rbxassetid://133590886371666"
})

]]

-- دالة لتشغيل السكربت الرئيسي
local function LoadMainScript()
    if mainScriptLoaded then return end
    mainScriptLoaded = true
    
    -- تشغيل السكربت في بيئة منفصلة
    local func, err = loadstring(AlKaabiHubScript)
    if func then
        local success, err = pcall(func)
        if not success then
            warn("Error loading Al-Kaabi Hub: " .. tostring(err))
        else
            print("✅ Al-Kaabi Hub loaded successfully!")
        end
    else
        warn("Failed to load Al-Kaabi Hub: " .. tostring(err))
    end
end

-- زر UNLOCK (التحقق من الكود وتشغيل السكربت الرئيسي)
UnlockBtn.MouseButton1Click:Connect(function()
    if KeyTextBox.Text == CORRECT_KEY then
        passwordCorrect = true
        UnlockBtn.Text = "SUCCESS!"
        UnlockBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 80)
        
        -- تحميل وتشغيل السكربت الرئيسي
        LoadMainScript()
        
        task.wait(1.5)
        ScreenGui:Destroy() -- يغلق نافذة الباسورد
        
        print("🔓 ALKAABI System: Password correct! Loading main script...")
    else
        UnlockBtn.Text = "INVALID KEY"
        UnlockBtn.BackgroundColor3 = Color3.fromRGB(200, 30, 30)
        task.wait(1.5)
        UnlockBtn.Text = "UNLOCK"
        UnlockBtn.BackgroundColor3 = Color3.fromRGB(255, 35, 90)
    end
end)

-- زر النسخ (Clipboard)
ClipboardBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KeyTextBox.Text)
    end
end)

-- زر RETRY (مسح الخانة)
RetryBtn.MouseButton1Click:Connect(function()
    KeyTextBox.Text = ""
end)

-- زر Telegram (يفتح رابط التيليجرام)
TelegramBtn.MouseButton1Click:Connect(function()
    if syn and syn.request then
        syn.request({
            Url = "https://t.me/ALKAABI_VIP",
            Method = "GET"
        })
    end
end)

print("🔒 ALKAABI Injection System Loaded - Waiting for password...")
print("🔑 Default password: KAABI")
print("💡 After entering correct password, Al-Kaabi Hub will load automatically")
