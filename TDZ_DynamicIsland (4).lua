-- ╔══════════════════════════════════════════════════════════════╗
-- ║   TDZ Neo — Dynamic Island  ×  FluentGlass Liquid           ║
-- ║   image: rbxassetid://79773252738743                        ║
-- ╚══════════════════════════════════════════════════════════════╝
-- Yêu cầu: loadstring(readfile("FluentGlass_Liquid.lua"))()
-- hoặc copy cả 2 file vào cùng 1 script

-- ══════════════════════════════════════════
-- LOAD FLUENTGLASS LIBRARY
-- ══════════════════════════════════════════
local Library = loadstring(readfile("FluentGlass_Liquid_127729348105692.lua"))()
Library:SetTheme("Midnight Blue")
Library:SetGlass(0.55)

-- ══════════════════════════════════════════
-- SERVICES
-- ══════════════════════════════════════════
local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local RunService       = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer      = Players.LocalPlayer
local PlayerGui        = LocalPlayer:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════
-- DYNAMIC ISLAND CONFIG (nhỏ gọn hơn)
-- ══════════════════════════════════════════
local W        = 320   -- chiều rộng
local H_PILL   = 30    -- pill thu gọn
local H_HEAD   = 44    -- header
local H_TABS   = 30    -- tab bar
local H_BODY   = 220   -- content
local H_FULL   = H_HEAD + H_TABS + H_BODY  -- 294
local RAD      = 20

-- Font siêu đẹp (GothamBlack = đậm nhất, Gotham cho body)
local FONT_TITLE = Enum.Font.GothamBlack
local FONT_MED   = Enum.Font.GothamBold
local FONT_BODY  = Enum.Font.Gotham

-- Colors
local cBG    = Color3.fromRGB(12, 14, 22)
local cRING  = Color3.fromRGB(100, 170, 255)
local cTXT   = Color3.fromRGB(230, 232, 245)
local cDIM   = Color3.fromRGB(110, 115, 140)
local cON    = Color3.fromRGB(55,  210, 130)
local cOFF   = Color3.fromRGB(30,  32,  50)
local cTAB   = Color3.fromRGB(100, 170, 255)

-- Tweens
local TW_POP   = TweenInfo.new(0.42, Enum.EasingStyle.Back,    Enum.EasingDirection.Out)
local TW_SUCK  = TweenInfo.new(0.26, Enum.EasingStyle.Quint,   Enum.EasingDirection.In)
local TW_FAST  = TweenInfo.new(0.16, Enum.EasingStyle.Quint,   Enum.EasingDirection.Out)
local TW_LIQUID= TweenInfo.new(0.55, Enum.EasingStyle.Back,    Enum.EasingDirection.Out) -- giọt nước

-- ══════════════════════════════════════════
-- HELPERS
-- ══════════════════════════════════════════
local function corner(parent, r)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, r or RAD)
    c.Parent = parent
    return c
end

local function stroke(parent, thick, trans, col)
    local s = Instance.new("UIStroke")
    s.Thickness   = thick or 1
    s.Transparency = trans or 0.6
    s.Color        = col   or Color3.new(1,1,1)
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    s.Parent = parent
    return s
end

-- ══════════════════════════════════════════
-- LIQUID GLASS LAYER (không dùng BlurEffect)
-- ══════════════════════════════════════════
local function applyLiquidGlass(frame, r)
    r = r or RAD
    -- Lớp kính trắng mờ
    local glass = Instance.new("Frame")
    glass.Name               = "LiquidGlass"
    glass.Size               = UDim2.fromScale(1, 1)
    glass.BackgroundColor3   = Color3.new(1, 1, 1)
    glass.BackgroundTransparency = 0.84
    glass.BorderSizePixel    = 0
    glass.ZIndex             = frame.ZIndex + 1
    glass.Parent             = frame
    corner(glass, r)

    -- Gradient cầu vồng (giọt nước lỏng)
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,    Color3.fromRGB(220, 240, 255)),
        ColorSequenceKeypoint.new(0.35, Color3.fromRGB(200, 215, 255)),
        ColorSequenceKeypoint.new(0.7,  Color3.fromRGB(180, 200, 255)),
        ColorSequenceKeypoint.new(1,    Color3.fromRGB(160, 185, 255)),
    })
    grad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0,   0.5),
        NumberSequenceKeypoint.new(0.5, 0.78),
        NumberSequenceKeypoint.new(1,   0.6),
    })
    grad.Rotation = -55
    grad.Parent   = glass

    -- Top shimmer line
    local rim = Instance.new("Frame")
    rim.AnchorPoint      = Vector2.new(0.5, 0)
    rim.Position         = UDim2.new(0.5, 0, 0, 1)
    rim.Size             = UDim2.new(0.6, 0, 0, 1)
    rim.BackgroundColor3 = Color3.new(1,1,1)
    rim.BackgroundTransparency = 0.25
    rim.BorderSizePixel  = 0
    rim.ZIndex           = frame.ZIndex + 2
    rim.Parent           = frame
    corner(rim, 2)

    -- Iridescent border (cầu vồng xoay chậm như file FluentGlass)
    local iridStroke = Instance.new("UIStroke")
    iridStroke.Thickness  = 1.2
    iridStroke.Color      = Color3.new(1,1,1)
    iridStroke.Transparency = 0.5
    iridStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    iridStroke.Parent     = frame

    local iridGrad = Instance.new("UIGradient")
    iridGrad.Rotation = 225
    iridGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,    Color3.fromRGB(140, 230, 255)),
        ColorSequenceKeypoint.new(0.35, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.65, Color3.fromRGB(255, 160, 235)),
        ColorSequenceKeypoint.new(1,    Color3.fromRGB(255, 235, 150)),
    })
    iridGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0,   0.1),
        NumberSequenceKeypoint.new(0.35,0.85),
        NumberSequenceKeypoint.new(0.65,0.85),
        NumberSequenceKeypoint.new(1,   0.1),
    })
    iridGrad.Parent = iridStroke

    -- Animate iridescent
    local t0 = os.clock()
    RunService.Heartbeat:Connect(function()
        if iridGrad.Parent then
            iridGrad.Rotation = (225 + (os.clock()-t0)*40) % 360
        end
    end)

    return glass
end

-- ══════════════════════════════════════════
-- GUI ROOT
-- ══════════════════════════════════════════
local old = PlayerGui:FindFirstChild("TDZ_Island")
if old then old:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name           = "TDZ_Island"
Gui.ResetOnSpawn   = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent         = PlayerGui

-- ══════════════════════
-- BOX
-- ══════════════════════
local Box = Instance.new("Frame")
Box.Name               = "Box"
Box.AnchorPoint        = Vector2.new(0.5, 0)
Box.Position           = UDim2.new(0.5, 0, 0, 10)
Box.Size               = UDim2.new(0, W, 0, H_PILL)
Box.BackgroundColor3   = cBG
Box.BackgroundTransparency = 0.08
Box.BorderSizePixel    = 0
Box.ClipsDescendants   = true
Box.ZIndex             = 5
Box.Parent             = Gui
corner(Box, RAD)
applyLiquidGlass(Box, RAD)

-- Halo glow
local Halo = Instance.new("ImageLabel")
Halo.AnchorPoint       = Vector2.new(0.5, 0.5)
Halo.Position          = UDim2.new(0.5, 0, 0.5, 8)
Halo.Size              = UDim2.new(1, 70, 1, 70)
Halo.BackgroundTransparency = 1
Halo.Image             = "rbxassetid://6015897843"
Halo.ImageColor3       = cRING
Halo.ImageTransparency = 0.76
Halo.ScaleType         = Enum.ScaleType.Slice
Halo.SliceCenter       = Rect.new(49,49,450,450)
Halo.ZIndex            = 2
Halo.Parent            = Box

-- ══════════════════════════════════════════
-- PILL (thu gọn)
-- ══════════════════════════════════════════
local Pill = Instance.new("Frame")
Pill.Size              = UDim2.new(1, 0, 0, H_PILL)
Pill.BackgroundTransparency = 1
Pill.ZIndex            = 20
Pill.Parent            = Box

local PIco = Instance.new("ImageLabel")
PIco.AnchorPoint       = Vector2.new(0, 0.5)
PIco.Position          = UDim2.new(0, 10, 0.5, 0)
PIco.Size              = UDim2.new(0, 17, 0, 17)
PIco.BackgroundTransparency = 1
PIco.Image             = "rbxassetid://79773252738743"
PIco.ZIndex            = 20
PIco.Parent            = Pill
corner(PIco, 999)

local PLbl = Instance.new("TextLabel")
PLbl.AnchorPoint       = Vector2.new(0, 0.5)
PLbl.Position          = UDim2.new(0, 33, 0.5, 0)
PLbl.Size              = UDim2.new(0, 180, 1, 0)
PLbl.BackgroundTransparency = 1
PLbl.Text              = "TDZ  Neo"
PLbl.TextColor3        = cTXT
PLbl.Font              = FONT_TITLE
PLbl.TextSize          = 13
PLbl.TextXAlignment    = Enum.TextXAlignment.Left
PLbl.ZIndex            = 20
PLbl.Parent            = Pill

-- dot pulse
local PDot = Instance.new("Frame")
PDot.AnchorPoint       = Vector2.new(1, 0.5)
PDot.Position          = UDim2.new(1, -10, 0.5, 0)
PDot.Size              = UDim2.new(0, 6, 0, 6)
PDot.BackgroundColor3  = cON
PDot.BorderSizePixel   = 0
PDot.ZIndex            = 20
PDot.Parent            = Pill
corner(PDot, 999)
task.spawn(function()
    while PDot and PDot.Parent do
        TweenService:Create(PDot, TweenInfo.new(0.9,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{BackgroundTransparency=0.6}):Play()
        task.wait(0.9)
        TweenService:Create(PDot, TweenInfo.new(0.9,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{BackgroundTransparency=0}):Play()
        task.wait(0.9)
    end
end)

-- ══════════════════════════════════════════
-- HEADER
-- ══════════════════════════════════════════
local Header = Instance.new("Frame")
Header.Name            = "Header"
Header.Position        = UDim2.new(0, 0, 0, H_PILL)
Header.Size            = UDim2.new(1, 0, 0, H_HEAD)
Header.BackgroundTransparency = 1
Header.Visible         = false
Header.ZIndex          = 20
Header.Parent          = Box

local HIco = Instance.new("ImageLabel")
HIco.AnchorPoint       = Vector2.new(0, 0.5)
HIco.Position          = UDim2.new(0, 10, 0.5, 0)
HIco.Size              = UDim2.new(0, 28, 0, 28)
HIco.BackgroundColor3  = Color3.fromRGB(18, 20, 36)
HIco.BackgroundTransparency = 0.2
HIco.BorderSizePixel   = 0
HIco.Image             = "rbxassetid://79773252738743"
HIco.ZIndex            = 20
HIco.Parent            = Header
corner(HIco, 999)
stroke(HIco, 1, 0.55, cRING)

local HTitle = Instance.new("TextLabel")
HTitle.AnchorPoint     = Vector2.new(0, 0.5)
HTitle.Position        = UDim2.new(0, 46, 0.36, 0)
HTitle.Size            = UDim2.new(0, 180, 0, 16)
HTitle.BackgroundTransparency = 1
HTitle.Text            = "TDZ  Neo"
HTitle.TextColor3      = cTXT
HTitle.Font            = FONT_TITLE
HTitle.TextSize        = 14
HTitle.TextXAlignment  = Enum.TextXAlignment.Left
HTitle.ZIndex          = 20
HTitle.Parent          = Header

local HSub = Instance.new("TextLabel")
HSub.AnchorPoint       = Vector2.new(0, 0.5)
HSub.Position          = UDim2.new(0, 46, 0.72, 0)
HSub.Size              = UDim2.new(0, 200, 0, 11)
HSub.BackgroundTransparency = 1
HSub.Text              = LocalPlayer.Name .. "  ·  Series"
HSub.TextColor3        = cDIM
HSub.Font              = FONT_BODY
HSub.TextSize          = 10
HSub.TextXAlignment    = Enum.TextXAlignment.Left
HSub.ZIndex            = 20
HSub.Parent            = Header

-- ═══ NÚT X (thu vào Dynamic Island kiểu Fluent — không đỏ) ═══
local XBtn = Instance.new("TextButton")
XBtn.AnchorPoint       = Vector2.new(1, 0.5)
XBtn.Position          = UDim2.new(1, -8, 0.5, 0)
XBtn.Size              = UDim2.new(0, 26, 0, 26)
XBtn.BackgroundColor3  = Color3.fromRGB(255, 255, 255)
XBtn.BackgroundTransparency = 0.88
XBtn.BorderSizePixel   = 0
XBtn.Text              = ""
XBtn.ZIndex            = 22
XBtn.Parent            = Header
corner(XBtn, 999)
stroke(XBtn, 1, 0.65, Color3.new(1,1,1))

-- Dấu X vẽ bằng 2 đường chéo (không dùng text, không màu đỏ)
local function makeXLine(rot)
    local ln = Instance.new("Frame")
    ln.AnchorPoint       = Vector2.new(0.5, 0.5)
    ln.Position          = UDim2.fromScale(0.5, 0.5)
    ln.Size              = UDim2.fromOffset(11, 1.5)
    ln.BackgroundColor3  = Color3.fromRGB(200, 205, 220)
    ln.BorderSizePixel   = 0
    ln.Rotation          = rot
    ln.ZIndex            = 23
    ln.Parent            = XBtn
    corner(ln, 1)
    return ln
end
local xL1 = makeXLine(45)
local xL2 = makeXLine(-45)

XBtn.MouseEnter:Connect(function()
    TweenService:Create(XBtn, TW_FAST, {BackgroundTransparency=0.72}):Play()
    TweenService:Create(xL1, TW_FAST, {BackgroundColor3=Color3.new(1,1,1)}):Play()
    TweenService:Create(xL2, TW_FAST, {BackgroundColor3=Color3.new(1,1,1)}):Play()
end)
XBtn.MouseLeave:Connect(function()
    TweenService:Create(XBtn, TW_FAST, {BackgroundTransparency=0.88}):Play()
    TweenService:Create(xL1, TW_FAST, {BackgroundColor3=Color3.fromRGB(200,205,220)}):Play()
    TweenService:Create(xL2, TW_FAST, {BackgroundColor3=Color3.fromRGB(200,205,220)}):Play()
end)

-- Divider dưới header
local HDivLine = Instance.new("Frame")
HDivLine.AnchorPoint   = Vector2.new(0.5, 1)
HDivLine.Position      = UDim2.new(0.5, 0, 1, 0)
HDivLine.Size          = UDim2.new(1, -14, 0, 1)
HDivLine.BackgroundColor3 = Color3.new(1,1,1)
HDivLine.BackgroundTransparency = 0.86
HDivLine.BorderSizePixel = 0
HDivLine.ZIndex        = 20
HDivLine.Parent        = Header

-- ══════════════════════════════════════════
-- TAB BAR — kéo ngang như iOS
-- ══════════════════════════════════════════
local TABS_DEF = {
    {n="Farm",   i="⚡"},
    {n="Combat", i="⚔"},
    {n="Fruit",  i="🍎"},
    {n="Sea",    i="🌊"},
    {n="Misc",   i="🛠"},
}

local TabBar = Instance.new("Frame")
TabBar.Name            = "TabBar"
TabBar.Position        = UDim2.new(0, 0, 0, H_PILL + H_HEAD)
TabBar.Size            = UDim2.new(1, 0, 0, H_TABS)
TabBar.BackgroundColor3 = Color3.fromRGB(10, 11, 20)
TabBar.BackgroundTransparency = 0.3
TabBar.BorderSizePixel = 0
TabBar.Visible         = false
TabBar.ZIndex          = 20
TabBar.Parent          = Box

-- Liquid glass trên tab bar
local TBarGlass = Instance.new("Frame")
TBarGlass.Size              = UDim2.fromScale(1, 1)
TBarGlass.BackgroundColor3  = Color3.new(1,1,1)
TBarGlass.BackgroundTransparency = 0.93
TBarGlass.BorderSizePixel   = 0
TBarGlass.ZIndex            = 19
TBarGlass.Parent            = TabBar

-- Divider dưới tab bar
local TDivLine = Instance.new("Frame")
TDivLine.AnchorPoint   = Vector2.new(0.5, 1)
TDivLine.Position      = UDim2.new(0.5, 0, 1, 0)
TDivLine.Size          = UDim2.new(1, 0, 0, 1)
TDivLine.BackgroundColor3 = Color3.new(1,1,1)
TDivLine.BackgroundTransparency = 0.86
TDivLine.BorderSizePixel = 0
TDivLine.ZIndex        = 20
TDivLine.Parent        = TabBar

-- ScrollingFrame cho tab (vuốt ngang iOS)
local TabScroll = Instance.new("ScrollingFrame")
TabScroll.Size             = UDim2.fromScale(1, 1)
TabScroll.BackgroundTransparency = 1
TabScroll.BorderSizePixel  = 0
TabScroll.ScrollBarThickness = 0
TabScroll.ScrollingDirection = Enum.ScrollingDirection.X
TabScroll.CanvasSize       = UDim2.new(0, #TABS_DEF * (W/#TABS_DEF), 0, 0)
TabScroll.ZIndex           = 21
TabScroll.Parent           = TabBar

local TBLayout = Instance.new("UIListLayout")
TBLayout.FillDirection     = Enum.FillDirection.Horizontal
TBLayout.SortOrder         = Enum.SortOrder.LayoutOrder
TBLayout.VerticalAlignment = Enum.VerticalAlignment.Center
TBLayout.Padding           = UDim.new(0, 0)
TBLayout.Parent            = TabScroll

-- Liquid indicator (giọt nước chạy dưới tab)
local TabIndicBG = Instance.new("Frame")
TabIndicBG.AnchorPoint    = Vector2.new(0, 1)
TabIndicBG.Position       = UDim2.new(0, 0, 1, 0)
TabIndicBG.Size           = UDim2.new(1/#TABS_DEF, 0, 0, 2)
TabIndicBG.BackgroundColor3 = cTAB
TabIndicBG.BorderSizePixel = 0
TabIndicBG.ZIndex          = 23
TabIndicBG.Parent          = TabScroll
corner(TabIndicBG, 2)
-- Glow trên indicator
local IndGlow = Instance.new("UIGradient")
IndGlow.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(150, 210, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(100, 170, 255)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(150, 210, 255)),
})
IndGlow.Parent = TabIndicBG

local activeTab = 1
local tabBtns   = {}

for i, td in ipairs(TABS_DEF) do
    local Btn = Instance.new("TextButton")
    Btn.LayoutOrder           = i
    Btn.Size                  = UDim2.new(1/#TABS_DEF, 0, 1, 0)
    Btn.BackgroundTransparency = 1
    Btn.Text                  = td.i .. " " .. td.n
    Btn.TextColor3            = cDIM
    Btn.Font                  = FONT_MED
    Btn.TextSize              = 10
    Btn.ZIndex                = 22
    Btn.Parent                = TabScroll
    tabBtns[i] = Btn
end

-- ══════════════════════════════════════════
-- CONTENT PAGES
-- ══════════════════════════════════════════
local ContentArea = Instance.new("Frame")
ContentArea.Name            = "Content"
ContentArea.Position        = UDim2.new(0, 0, 0, H_PILL + H_HEAD + H_TABS)
ContentArea.Size            = UDim2.new(1, 0, 0, H_BODY)
ContentArea.BackgroundTransparency = 1
ContentArea.Visible         = false
ContentArea.ZIndex          = 20
ContentArea.Parent          = Box

-- Page slider (trượt ngang iOS style)
local PageHolder = Instance.new("Frame")
PageHolder.Size             = UDim2.new(#TABS_DEF, 0, 1, 0)
PageHolder.BackgroundTransparency = 1
PageHolder.ZIndex           = 20
PageHolder.Parent           = ContentArea

local PHLayout = Instance.new("UIListLayout")
PHLayout.FillDirection      = Enum.FillDirection.Horizontal
PHLayout.SortOrder          = Enum.SortOrder.LayoutOrder
PHLayout.Padding            = UDim.new(0, 0)
PHLayout.Parent             = PageHolder

local pages = {}
for i = 1, #TABS_DEF do
    local Page = Instance.new("ScrollingFrame")
    Page.LayoutOrder          = i
    Page.Size                 = UDim2.new(1/#TABS_DEF, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel      = 0
    Page.ScrollBarThickness   = 2
    Page.ScrollBarImageColor3 = cRING
    Page.ScrollBarImageTransparency = 0.5
    Page.CanvasSize           = UDim2.new(0, 0, 0, 0)
    Page.ZIndex               = 20
    Page.Parent               = PageHolder

    local LL = Instance.new("UIListLayout")
    LL.SortOrder              = Enum.SortOrder.LayoutOrder
    LL.Padding                = UDim.new(0, 3)
    LL.Parent                 = Page

    local PP = Instance.new("UIPadding")
    PP.PaddingLeft   = UDim.new(0, 10)
    PP.PaddingRight  = UDim.new(0, 10)
    PP.PaddingTop    = UDim.new(0, 6)
    PP.PaddingBottom = UDim.new(0, 8)
    PP.Parent        = Page

    LL:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        Page.CanvasSize = UDim2.new(0, 0, 0, LL.AbsoluteContentSize.Y + 14)
    end)
    pages[i] = Page
end

-- ══════════════════════════════════════════
-- TAB SWITCH — hiệu ứng giọt nước + trượt iOS
-- ══════════════════════════════════════════
local function SwitchTab(idx, animate)
    if idx == activeTab and animate then return end
    activeTab = idx

    -- Màu chữ tab
    for i, btn in ipairs(tabBtns) do
        TweenService:Create(btn, TW_FAST, {
            TextColor3 = (i == idx) and cTAB or cDIM
        }):Play()
    end

    -- Indicator giọt nước: giãn ra rồi co lại (như FluentGlass)
    local tabW = W / #TABS_DEF
    local targetX = tabW * (idx - 1)
    if animate then
        -- Giãn rộng (giọt bắn sang)
        TweenService:Create(TabIndicBG, TweenInfo.new(0.15, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
            Size = UDim2.new(1/#TABS_DEF, 20, 0, 3)
        }):Play()
        -- Trượt tới tab mới
        TweenService:Create(TabIndicBG, TW_LIQUID, {
            Position = UDim2.new(0, targetX, 1, 0)
        }):Play()
        task.delay(0.15, function()
            -- Co lại như giọt nước đáp xuống
            TweenService:Create(TabIndicBG, TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
                Size = UDim2.new(1/#TABS_DEF, 0, 0, 2)
            }):Play()
        end)
    else
        TabIndicBG.Position = UDim2.new(0, targetX, 1, 0)
    end

    -- Trượt PageHolder (iOS style) — không clip, smooth
    TweenService:Create(PageHolder, TweenInfo.new(0.32, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
        Position = UDim2.new(-(idx-1), 0, 0, 0)
    }):Play()
end

for i, btn in ipairs(tabBtns) do
    btn.MouseButton1Click:Connect(function() SwitchTab(i, true) end)
end
SwitchTab(1, false)
TweenService:Create(tabBtns[1], TW_FAST, {TextColor3 = cTAB}):Play()

-- ══════════════════════════════════════════
-- HELPER: Liquid Glass Toggle
-- ══════════════════════════════════════════
local toggles = {}
local function AddToggle(pageIdx, key, label, default)
    toggles[key] = default or false
    local Page = pages[pageIdx]

    local Row = Instance.new("Frame")
    Row.Size              = UDim2.new(1, 0, 0, 36)
    Row.BackgroundColor3  = Color3.new(1, 1, 1)
    Row.BackgroundTransparency = 0.91
    Row.BorderSizePixel   = 0
    Row.ZIndex            = 20
    Row.Parent            = Page
    corner(Row, 9)
    stroke(Row, 0.5, 0.78, Color3.new(1,1,1))

    local Lbl = Instance.new("TextLabel")
    Lbl.AnchorPoint       = Vector2.new(0, 0.5)
    Lbl.Position          = UDim2.new(0, 10, 0.5, 0)
    Lbl.Size              = UDim2.new(1, -54, 1, 0)
    Lbl.BackgroundTransparency = 1
    Lbl.Text              = label
    Lbl.TextColor3        = cTXT
    Lbl.Font              = FONT_BODY
    Lbl.TextSize          = 12
    Lbl.TextXAlignment    = Enum.TextXAlignment.Left
    Lbl.ZIndex            = 21
    Lbl.Parent            = Row

    local Track = Instance.new("Frame")
    Track.AnchorPoint     = Vector2.new(1, 0.5)
    Track.Position        = UDim2.new(1, -8, 0.5, 0)
    Track.Size            = UDim2.new(0, 34, 0, 18)
    Track.BackgroundColor3 = cOFF
    Track.BorderSizePixel = 0
    Track.ZIndex          = 21
    Track.Parent          = Row
    corner(Track, 999)

    local Knob = Instance.new("Frame")
    Knob.AnchorPoint      = Vector2.new(0, 0.5)
    Knob.Position         = UDim2.new(0, 2, 0.5, 0)
    Knob.Size             = UDim2.new(0, 14, 0, 14)
    Knob.BackgroundColor3 = Color3.fromRGB(130, 130, 155)
    Knob.BorderSizePixel  = 0
    Knob.ZIndex           = 22
    Knob.Parent           = Track
    corner(Knob, 999)

    local function Set(val, anim)
        toggles[key] = val
        local tw = anim and TW_FAST or TweenInfo.new(0)
        if val then
            TweenService:Create(Track, tw, {BackgroundColor3 = cON}):Play()
            TweenService:Create(Knob,  tw, {Position = UDim2.new(0,18,0.5,0), BackgroundColor3=Color3.new(1,1,1)}):Play()
        else
            TweenService:Create(Track, tw, {BackgroundColor3 = cOFF}):Play()
            TweenService:Create(Knob,  tw, {Position = UDim2.new(0,2,0.5,0),  BackgroundColor3=Color3.fromRGB(130,130,155)}):Play()
        end
    end
    Set(default or false, false)

    local ClickBtn = Instance.new("TextButton")
    ClickBtn.Size             = UDim2.fromScale(1, 1)
    ClickBtn.BackgroundTransparency = 1
    ClickBtn.Text             = ""
    ClickBtn.ZIndex           = 23
    ClickBtn.Parent           = Row
    ClickBtn.MouseButton1Click:Connect(function()
        Set(not toggles[key], true)
        TweenService:Create(Row, TweenInfo.new(0.06), {BackgroundTransparency=0.82}):Play()
        task.delay(0.06, function()
            TweenService:Create(Row, TweenInfo.new(0.14), {BackgroundTransparency=0.91}):Play()
        end)
    end)
end

-- ══════════════════════════════════════════
-- POPULATE TABS
-- ══════════════════════════════════════════
AddToggle(1,"auto_farm",    "Auto Farm Mob")
AddToggle(1,"auto_quest",   "Auto Quest")
AddToggle(1,"auto_mastery", "Auto Mastery")
AddToggle(1,"auto_chest",   "Auto Chest")
AddToggle(1,"auto_boss",    "Auto Boss Farm")

AddToggle(2,"aimbot",       "Aimbot")
AddToggle(2,"silent_aim",   "Silent Aim")
AddToggle(2,"noclip",       "Noclip")
AddToggle(2,"speed_hack",   "Speed Hack")

AddToggle(3,"fruit_notif",  "Fruit Notif")
AddToggle(3,"auto_snipe",   "Auto Snipe Fruit")
AddToggle(3,"auto_raid",    "Auto Raid")
AddToggle(3,"auto_dungeon", "Auto Dungeon")
AddToggle(3,"spooky_gacha", "Spooky Gacha")

AddToggle(4,"auto_kitsune",   "Auto Kitsune")
AddToggle(4,"auto_leviathan", "Auto Leviathan")
AddToggle(4,"auto_halloween", "Auto Halloween")
AddToggle(4,"auto_boat",      "Auto Boat")

AddToggle(5,"anti_afk",    "Anti AFK",    true)
AddToggle(5,"boost_fps",   "Boost FPS")
AddToggle(5,"esp_player",  "Player ESP")
AddToggle(5,"esp_fruit",   "Fruit ESP")

-- ══════════════════════════════════════════
-- OPEN / CLOSE — hiệu ứng hút vào Dynamic Island
-- ══════════════════════════════════════════
local opened = false

local function Open()
    if opened then return end
    opened = true
    Pill.Visible        = false
    Header.Visible      = true
    TabBar.Visible      = true
    ContentArea.Visible = true
    TweenService:Create(Box, TW_POP, {
        Size = UDim2.new(0, W, 0, H_PILL + H_FULL)
    }):Play()
end

local function Close()
    if not opened then return end
    -- Hút vào giữa (squish)
    TweenService:Create(Box, TW_SUCK, {
        Size = UDim2.new(0, W * 0.22, 0, H_PILL * 0.5)
    }):Play()
    task.wait(0.18)
    Header.Visible      = false
    TabBar.Visible      = false
    ContentArea.Visible = false
    TweenService:Create(Box, TW_POP, {
        Size = UDim2.new(0, W, 0, H_PILL)
    }):Play()
    task.delay(0.18, function()
        Pill.Visible = true
        opened = false
    end)
end

-- Pill click = mở
local PillBtn = Instance.new("TextButton")
PillBtn.Size              = UDim2.fromScale(1, 1)
PillBtn.BackgroundTransparency = 1
PillBtn.Text              = ""
PillBtn.ZIndex            = 25
PillBtn.Parent            = Pill
PillBtn.MouseButton1Click:Connect(function()
    if not opened then Open() end
end)

-- X = thu vào Dynamic Island
XBtn.MouseButton1Click:Connect(function() Close() end)

-- ══════════════════════════════════════════
-- DRAG (kéo cả bar qua header)
-- ══════════════════════════════════════════
local dragging, dragStart, startPos = false, nil, nil
local targetPos = Box.Position

RunService.RenderStepped:Connect(function()
    if dragging then
        Box.Position = UDim2.new(
            Box.Position.X.Scale  + (targetPos.X.Scale  - Box.Position.X.Scale)  * 0.2,
            Box.Position.X.Offset + (targetPos.X.Offset - Box.Position.X.Offset) * 0.2,
            Box.Position.Y.Scale  + (targetPos.Y.Scale  - Box.Position.Y.Scale)  * 0.2,
            Box.Position.Y.Offset + (targetPos.Y.Offset - Box.Position.Y.Offset) * 0.2
        )
    end
end)

local DragZone = Instance.new("TextButton")
DragZone.Size             = UDim2.new(1, -44, 1, 0)
DragZone.BackgroundTransparency = 1
DragZone.Text             = ""
DragZone.ZIndex           = 21
DragZone.Parent           = Header

DragZone.InputBegan:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1
    or inp.UserInputType == Enum.UserInputType.Touch then
        dragging  = true
        dragStart = inp.Position
        startPos  = Box.Position
        targetPos = Box.Position
    end
end)
UserInputService.InputChanged:Connect(function(inp)
    if dragging and (inp.UserInputType == Enum.UserInputType.MouseMovement
    or inp.UserInputType == Enum.UserInputType.Touch) then
        local d = inp.Position - dragStart
        targetPos = UDim2.new(
            startPos.X.Scale,  startPos.X.Offset + d.X,
            startPos.Y.Scale,  startPos.Y.Offset + d.Y
        )
    end
end)
UserInputService.InputEnded:Connect(function(inp)
    if inp.UserInputType == Enum.UserInputType.MouseButton1
    or inp.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- ══════════════════════════════════════════
-- KEYBIND RCtrl
-- ══════════════════════════════════════════
local uiVisible = true
UserInputService.InputBegan:Connect(function(inp, gpe)
    if gpe then return end
    if inp.KeyCode == Enum.KeyCode.RightControl then
        if uiVisible then
            uiVisible = false
            TweenService:Create(Box, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.In),
                {Position = UDim2.new(0.5, 0, 0, -70)}):Play()
        else
            uiVisible = true
            TweenService:Create(Box, TW_POP,
                {Position = UDim2.new(0.5, 0, 0, 10)}):Play()
        end
    end
end)

-- ══════════════════════════════════════════
-- HALO PULSE
-- ══════════════════════════════════════════
task.spawn(function()
    while Box and Box.Parent do
        TweenService:Create(Halo, TweenInfo.new(2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
            {ImageColor3=Color3.fromRGB(110,190,255), ImageTransparency=0.62}):Play()
        task.wait(2)
        TweenService:Create(Halo, TweenInfo.new(2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),
            {ImageColor3=Color3.fromRGB(55,120,210), ImageTransparency=0.8}):Play()
        task.wait(2)
    end
end)

-- ══════════════════════════════════════════
-- DROP-IN ANIMATION
-- ══════════════════════════════════════════
Box.Position = UDim2.new(0.5, 0, 0, -55)
task.wait(0.25)
TweenService:Create(Box, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Position = UDim2.new(0.5, 0, 0, 10)}):Play()

-- Notify qua FluentGlass
task.wait(0.8)
Library:Notify("TDZ Neo Series", "Loaded  ·  RCtrl ẩn/hiện", 3)

print("[TDZ Neo] Dynamic Island + FluentGlass Liquid ✅")
