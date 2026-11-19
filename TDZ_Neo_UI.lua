-- ╔══════════════════════════════════════════════════════════════╗
-- ║           TDZ Neo Series — Infinity Hub UI Template          ║
-- ║           Built for Fluent Renewed | Arceus X Safe          ║
-- ╚══════════════════════════════════════════════════════════════╝

local Players         = game:GetService("Players")
local TweenService    = game:GetService("TweenService")
local RunService      = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService     = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer     = Players.LocalPlayer
local PlayerGui       = LocalPlayer:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════
-- ARCEUS X / UNIVERSAL COMPAT LAYER
-- ══════════════════════════════════════════
if not getgenv then getgenv = function() return getfenv(0) end end
if not setclipboard then setclipboard = function() end end
if not firetouchinterest then firetouchinterest = function() end end
if not fireproximityprompt then
    fireproximityprompt = function(p)
        pcall(function() p.Triggered:Fire(LocalPlayer) end)
    end
end
if not hookfunction then hookfunction = function(a, b) return b end end
if not hookmetamethod then hookmetamethod = function(a, b, c) return c end end
if not getconnections then getconnections = function() return {} end end
if not cloneref then cloneref = function(a) return a end end
if not gethwid then gethwid = function() return "unknown" end end
if not identifyexecutor then identifyexecutor = function() return "Unknown" end end
if not readfile then readfile = function() return "{}" end end
if not writefile then writefile = function() end end
if not isfile then isfile = function() return false end end
if not isfolder then isfolder = function() return false end end
if not makefolder then makefolder = function() end end

-- ══════════════════════════════════════════
-- SETTINGS STORE
-- ══════════════════════════════════════════
local FOLDER  = "TDZ-Neo"
local SAVE_FILE = FOLDER .. "/" .. LocalPlayer.Name .. ".json"
pcall(function() if not isfolder(FOLDER) then makefolder(FOLDER) end end)

local Settings = {}
pcall(function()
    if isfile(SAVE_FILE) then
        Settings = HttpService:JSONDecode(readfile(SAVE_FILE))
    end
end)
getgenv().Settings = Settings

local function Save(key, val)
    Settings[key] = val
    pcall(function()
        writefile(SAVE_FILE, HttpService:JSONEncode(Settings))
    end)
end

-- ══════════════════════════════════════════
-- LOAD FLUENT UI
-- ══════════════════════════════════════════
local lib, lib2
local ok1, r1 = pcall(function()
    return loadstring(game:HttpGetAsync(
        "https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"
    ))()
end)
if ok1 and r1 then
    lib = r1
else
    local ok2, r2 = pcall(function()
        return loadstring(game:HttpGetAsync(
            "https://raw.githubusercontent.com/dawid-scripts/Fluent/refs/heads/main/Fluent.lua"
        ))()
    end)
    if ok2 and r2 then lib = r2 end
end

local ok3, r3 = pcall(function()
    return loadstring(game:HttpGetAsync(
        "https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"
    ))()
end)
if ok3 and r3 then lib2 = r3 end

if not lib then error("[TDZ Neo] Không load được Fluent UI!") end

-- ══════════════════════════════════════════
-- CREATE WINDOW
-- ══════════════════════════════════════════
local Window = lib:CreateWindow({
    Title    = "TDZ  Neo",
    SubTitle = "Series",
    TabWidth = 160,
    Size     = UDim2.fromOffset(560, 400),
    Resize   = true,
    MinSize  = Vector2.new(480, 360),
    Acrylic  = false,
    Theme    = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl,
})

-- ══════════════════════════════════════════
-- TABS
-- ══════════════════════════════════════════
local Tabs = {
    Main     = Window:CreateTab({ Title = "Main",        Icon = "zap"             }),
    Farm     = Window:CreateTab({ Title = "Farm",        Icon = "sprout"          }),
    Combat   = Window:CreateTab({ Title = "Combat",      Icon = "sword"           }),
    Fruit    = Window:CreateTab({ Title = "Fruit",       Icon = "star"            }),
    Sea      = Window:CreateTab({ Title = "Sea Event",   Icon = "waves"           }),
    ESP      = Window:CreateTab({ Title = "ESP",         Icon = "eye"             }),
    Misc     = Window:CreateTab({ Title = "Misc",        Icon = "settings-2"      }),
    Settings = Window:CreateTab({ Title = "Settings",   Icon = "sliders-horizontal" }),
}

-- ══════════════════════════════════════════
-- ── TAB: MAIN ──
-- ══════════════════════════════════════════
do
    local info = Tabs.Main:AddSection("Info")
    info:CreateLabel("Executor: " .. tostring(identifyexecutor()))
    info:CreateLabel("Player  : " .. LocalPlayer.Name)
    info:CreateLabel("Server  : " .. tostring(game.JobId):sub(1, 18) .. "...")
    info:CreateLabel("PlaceId : " .. tostring(game.PlaceId))

    local quick = Tabs.Main:AddSection("Quick Toggle")

    quick:CreateToggle("MasterFarm", {
        Title       = "Master Farm",
        Description = "Bật/tắt toàn bộ farm cùng lúc",
        Default     = Settings["Master Farm"] or false,
        Callback    = function(v)
            Save("Master Farm", v)
            -- Sync các toggle farm khác nếu cần
            getgenv().TDZ_MasterFarm = v
        end
    })

    quick:CreateToggle("AutoHop", {
        Title       = "Auto Hop Server",
        Description = "Tự hop khi không tìm thấy mob",
        Default     = Settings["Auto Hop"] or false,
        Callback    = function(v) Save("Auto Hop", v) end
    })

    quick:CreateButton({
        Title       = "Rejoin Server",
        Description = "Vào server mới ngay lập tức",
        Callback    = function()
            pcall(function()
                game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
            end)
        end
    })
end

-- ══════════════════════════════════════════
-- ── TAB: FARM ──
-- ══════════════════════════════════════════
do
    local method = Tabs.Farm:AddSection("Phương Thức Farm")

    method:CreateDropdown("FarmMethod", {
        Title       = "Chọn phương thức",
        Description = "Cách tiếp cận mob",
        Values      = { "Teleport to Mob", "Walk to Mob", "Noclip Farm", "Stand Still" },
        Default     = Settings["Farm Method"] or "Teleport to Mob",
        Callback    = function(v) Save("Farm Method", v) end
    })

    method:CreateSlider("FarmRadius", {
        Title       = "Bán kính farm",
        Description = "Phạm vi tìm mob (studs)",
        Min         = 10,
        Max         = 500,
        Default     = Settings["Farm Radius"] or 100,
        Rounding    = 0,
        Callback    = function(v) Save("Farm Radius", v) end
    })

    local auto = Tabs.Farm:AddSection("Auto Farm")

    auto:CreateToggle("AutoFarm", {
        Title       = "Auto Farm Mob",
        Description = "Tự động farm mob theo level",
        Default     = Settings["Auto Farm"] or false,
        Callback    = function(v) Save("Auto Farm", v) end
    })

    auto:CreateToggle("AutoQuest", {
        Title       = "Auto Quest",
        Description = "Tự nhận và hoàn thành quest",
        Default     = Settings["Auto Quest"] or false,
        Callback    = function(v) Save("Auto Quest", v) end
    })

    auto:CreateToggle("AutoMastery", {
        Title       = "Auto Mastery",
        Description = "Farm mastery vũ khí / trái ác quỷ",
        Default     = Settings["Auto Mastery"] or false,
        Callback    = function(v) Save("Auto Mastery", v) end
    })

    auto:CreateToggle("AutoChest", {
        Title       = "Auto Collect Chest",
        Description = "Tự nhặt rương xung quanh",
        Default     = Settings["Auto Chest"] or false,
        Callback    = function(v) Save("Auto Chest", v) end
    })

    local boss = Tabs.Farm:AddSection("Boss Farm")

    boss:CreateToggle("AutoDarkbeard", {
        Title    = "Auto Darkbeard",
        Default  = Settings["Auto Darkbeard"] or false,
        Callback = function(v) Save("Auto Darkbeard", v) end
    })

    boss:CreateToggle("AutoDoughKing", {
        Title    = "Auto Dough King",
        Default  = Settings["Auto Dough King"] or false,
        Callback = function(v) Save("Auto Dough King", v) end
    })

    boss:CreateToggle("AutoSoulReaper", {
        Title    = "Auto Soul Reaper",
        Default  = Settings["Auto Soul Reaper"] or false,
        Callback = function(v) Save("Auto Soul Reaper", v) end
    })

    boss:CreateToggle("AutoRipIndra", {
        Title    = "Auto Rip Indra",
        Default  = Settings["Auto Rip Indra"] or false,
        Callback = function(v) Save("Auto Rip Indra", v) end
    })
end

-- ══════════════════════════════════════════
-- ── TAB: COMBAT ──
-- ══════════════════════════════════════════
do
    local aimbot = Tabs.Combat:AddSection("Aimbot")

    aimbot:CreateToggle("AimbotEnabled", {
        Title       = "Aimbot",
        Description = "Tự aim vào đầu / hitbox địch",
        Default     = Settings["Aimbot"] or false,
        Callback    = function(v) Save("Aimbot", v) end
    })

    aimbot:CreateSlider("AimbotFOV", {
        Title    = "FOV Aimbot",
        Min      = 10,
        Max      = 500,
        Default  = Settings["Aimbot FOV"] or 150,
        Rounding = 0,
        Callback = function(v) Save("Aimbot FOV", v) end
    })

    aimbot:CreateDropdown("AimbotPart", {
        Title   = "Nhắm vào",
        Values  = { "Head", "HumanoidRootPart", "Torso", "LeftLeg", "RightLeg" },
        Default = Settings["Aimbot Part"] or "Head",
        Callback = function(v) Save("Aimbot Part", v) end
    })

    local misc_pvp = Tabs.Combat:AddSection("PVP Misc")

    misc_pvp:CreateToggle("SilentAim", {
        Title    = "Silent Aim",
        Default  = Settings["Silent Aim"] or false,
        Callback = function(v) Save("Silent Aim", v) end
    })

    misc_pvp:CreateToggle("SpeedHack", {
        Title       = "Speed Hack",
        Description = "Tăng tốc độ di chuyển",
        Default     = Settings["Speed Hack"] or false,
        Callback    = function(v)
            Save("Speed Hack", v)
            pcall(function()
                LocalPlayer.Character.Humanoid.WalkSpeed = v and (Settings["Walk Speed"] or 32) or 16
            end)
        end
    })

    misc_pvp:CreateSlider("WalkSpeed", {
        Title    = "Walk Speed",
        Min      = 16,
        Max      = 500,
        Default  = Settings["Walk Speed"] or 32,
        Rounding = 0,
        Callback = function(v)
            Save("Walk Speed", v)
            if Settings["Speed Hack"] then
                pcall(function()
                    LocalPlayer.Character.Humanoid.WalkSpeed = v
                end)
            end
        end
    })

    misc_pvp:CreateSlider("JumpPower", {
        Title    = "Jump Power",
        Min      = 50,
        Max      = 500,
        Default  = Settings["Jump Power"] or 50,
        Rounding = 0,
        Callback = function(v)
            Save("Jump Power", v)
            pcall(function()
                LocalPlayer.Character.Humanoid.JumpPower = v
            end)
        end
    })

    misc_pvp:CreateToggle("Noclip", {
        Title    = "Noclip",
        Default  = Settings["Noclip"] or false,
        Callback = function(v)
            Save("Noclip", v)
            getgenv().TDZ_Noclip = v
        end
    })

    -- Noclip loop
    RunService.Stepped:Connect(function()
        if getgenv().TDZ_Noclip then
            pcall(function()
                for _, p in ipairs(LocalPlayer.Character:GetDescendants()) do
                    if p:IsA("BasePart") then
                        p.CanCollide = false
                    end
                end
            end)
        end
    end)
end

-- ══════════════════════════════════════════
-- ── TAB: FRUIT ──
-- ══════════════════════════════════════════
do
    local notify_fruit = Tabs.Fruit:AddSection("Thông Báo Trái")

    notify_fruit:CreateToggle("FruitNotif", {
        Title       = "Thông báo khi có trái rơi",
        Description = "Hiện thông báo + âm thanh khi trái xuất hiện",
        Default     = Settings["Fruit Notif"] or false,
        Callback    = function(v) Save("Fruit Notif", v) end
    })

    notify_fruit:CreateToggle("FruitESP", {
        Title    = "Fruit ESP",
        Default  = Settings["Fruit ESP"] or false,
        Callback = function(v) Save("Fruit ESP", v) end
    })

    local auto_fruit = Tabs.Fruit:AddSection("Auto Fruit")

    auto_fruit:CreateToggle("AutoSnipeFruit", {
        Title       = "Auto Snipe Fruit",
        Description = "Tự nhặt trái ngay khi xuất hiện",
        Default     = Settings["Auto Snipe Fruit"] or false,
        Callback    = function(v) Save("Auto Snipe Fruit", v) end
    })

    auto_fruit:CreateToggle("AutoRandomFruit", {
        Title       = "Auto Random Fruit",
        Description = "Tự quay Zioles Gacha",
        Default     = Settings["Auto Random Fruit"] or false,
        Callback    = function(v) Save("Auto Random Fruit", v) end
    })

    auto_fruit:CreateToggle("SpookyGacha", {
        Title       = "Auto Spooky Gacha",
        Description = "Dùng 500 Candy Corn random Halloween",
        Default     = Settings["Spooky Gacha"] or false,
        Callback    = function(v) Save("Spooky Gacha", v) end
    })

    local raid = Tabs.Fruit:AddSection("Raid & Dungeon")

    raid:CreateToggle("AutoRaid", {
        Title    = "Auto Raid",
        Default  = Settings["Auto Raid"] or false,
        Callback = function(v) Save("Auto Raid", v) end
    })

    raid:CreateToggle("AutoMultiRaid", {
        Title    = "Auto Multi Raid",
        Default  = Settings["Auto Multi Raid"] or false,
        Callback = function(v) Save("Auto Multi Raid", v) end
    })

    raid:CreateToggle("AutoDungeon", {
        Title    = "Auto Dungeon",
        Default  = Settings["Auto Dungeon"] or false,
        Callback = function(v) Save("Auto Dungeon", v) end
    })
end

-- ══════════════════════════════════════════
-- ── TAB: SEA EVENT ──
-- ══════════════════════════════════════════
do
    local sea_set = Tabs.Sea:AddSection("Cài Đặt Sea")

    sea_set:CreateToggle("AutoSea", {
        Title    = "Auto Sea Event",
        Default  = Settings["Auto Sea"] or false,
        Callback = function(v) Save("Auto Sea", v) end
    })

    sea_set:CreateToggle("AutoKitsune", {
        Title    = "Auto Kitsune Event",
        Default  = Settings["Auto Kitsune"] or false,
        Callback = function(v) Save("Auto Kitsune", v) end
    })

    sea_set:CreateToggle("AutoLeviathan", {
        Title    = "Auto Leviathan Event",
        Default  = Settings["Auto Leviathan"] or false,
        Callback = function(v) Save("Auto Leviathan", v) end
    })

    sea_set:CreateToggle("AutoHalloween", {
        Title    = "Auto Halloween Event",
        Default  = Settings["Auto Halloween"] or false,
        Callback = function(v) Save("Auto Halloween", v) end
    })

    local boat = Tabs.Sea:AddSection("Thuyền")

    boat:CreateToggle("AutoBoat", {
        Title    = "Auto Boat",
        Default  = Settings["Auto Boat"] or false,
        Callback = function(v) Save("Auto Boat", v) end
    })

    boat:CreateSlider("BoatSpeed", {
        Title    = "Tốc độ thuyền",
        Min      = 1,
        Max      = 10,
        Default  = Settings["Boat Speed"] or 5,
        Rounding = 0,
        Callback = function(v) Save("Boat Speed", v) end
    })
end

-- ══════════════════════════════════════════
-- ── TAB: ESP ──
-- ══════════════════════════════════════════
do
    local esp = Tabs.ESP:AddSection("ESP")

    esp:CreateToggle("PlayerESP", {
        Title    = "Player ESP",
        Default  = Settings["Player ESP"] or false,
        Callback = function(v) Save("Player ESP", v) end
    })

    esp:CreateToggle("MobESP", {
        Title    = "Mob ESP",
        Default  = Settings["Mob ESP"] or false,
        Callback = function(v) Save("Mob ESP", v) end
    })

    esp:CreateToggle("ChestESP", {
        Title    = "Chest ESP",
        Default  = Settings["Chest ESP"] or false,
        Callback = function(v) Save("Chest ESP", v) end
    })

    esp:CreateToggle("FruitESP2", {
        Title    = "Fruit ESP",
        Default  = Settings["Fruit ESP"] or false,
        Callback = function(v) Save("Fruit ESP", v) end
    })

    esp:CreateSlider("ESPDistance", {
        Title    = "Khoảng cách hiện ESP",
        Min      = 50,
        Max      = 2000,
        Default  = Settings["ESP Distance"] or 500,
        Rounding = 0,
        Callback = function(v) Save("ESP Distance", v) end
    })
end

-- ══════════════════════════════════════════
-- ── TAB: MISC ──
-- ══════════════════════════════════════════
do
    local misc = Tabs.Misc:AddSection("Tiện Ích")

    misc:CreateToggle("AntiAFK", {
        Title    = "Anti AFK",
        Default  = Settings["Anti AFK"] or true,
        Callback = function(v)
            Save("Anti AFK", v)
            if v then
                local VIM = game:GetService("VirtualInputManager")
                task.spawn(function()
                    while Settings["Anti AFK"] do
                        task.wait(60)
                        pcall(function()
                            VIM:SendKeyEvent(true, "W", false, game)
                            task.wait(0.1)
                            VIM:SendKeyEvent(false, "W", false, game)
                        end)
                    end
                end)
            end
        end
    })

    misc:CreateToggle("BoostFPS", {
        Title       = "Boost FPS",
        Description = "Giảm đồ họa để tăng FPS",
        Default     = Settings["Boost FPS"] or false,
        Callback    = function(v)
            Save("Boost FPS", v)
            pcall(function()
                local lighting = game:GetService("Lighting")
                if v then
                    game:GetService("RunService"):Set3dRenderingEnabled(true)
                    settings().Rendering.QualityLevel = 1
                    lighting.GlobalShadows = false
                    lighting.FogEnd = 9e9
                else
                    settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic
                    lighting.GlobalShadows = true
                end
            end)
        end
    })

    misc:CreateToggle("RemoveNotif", {
        Title    = "Xóa thông báo game",
        Default  = Settings["Remove Notif"] or false,
        Callback = function(v)
            Save("Remove Notif", v)
            if v then
                pcall(function()
                    for _, g in ipairs(PlayerGui:GetDescendants()) do
                        if g.Name == "SystemNotification" then g:Destroy() end
                    end
                end)
            end
        end
    })

    misc:CreateButton({
        Title    = "Copy PlaceId",
        Callback = function()
            setclipboard(tostring(game.PlaceId))
            lib:Notify({ Title = "TDZ Neo", Content = "Đã copy PlaceId!", Duration = 2 })
        end
    })

    misc:CreateButton({
        Title    = "Xóa cache & Reload",
        Callback = function()
            pcall(function() writefile(SAVE_FILE, "{}") end)
            lib:Notify({ Title = "TDZ Neo", Content = "Đã xóa cache!", Duration = 2 })
        end
    })
end

-- ══════════════════════════════════════════
-- ── TAB: SETTINGS ──
-- ══════════════════════════════════════════
do
    local save_sec = Tabs.Settings:AddSection("Lưu & Tải")

    save_sec:CreateToggle("AutoLoad", {
        Title       = "Auto Load khi hop server",
        Description = "Tự chạy lại script sau khi teleport",
        Default     = Settings["Auto Load"] or false,
        Callback    = function(v)
            Save("Auto Load", v)
            if v then
                local qot = syn and syn.queue_on_teleport
                    or (type(queue_on_teleport) == "function" and queue_on_teleport)
                    or nil
                if qot then
                    qot([[loadstring(game:HttpGetAsync("https://banana-hub.xyz/loader/banana.lua"))()]])
                end
            end
        end
    })

    save_sec:CreateButton({
        Title    = "Copy Config",
        Callback = function()
            pcall(function()
                setclipboard(HttpService:JSONEncode(Settings))
                lib:Notify({ Title = "TDZ Neo", Content = "Config đã copy!", Duration = 2 })
            end)
        end
    })

    save_sec:CreateButton({
        Title    = "Reset Config",
        Callback = function()
            Window:Dialog({
                Title   = "Xác nhận",
                Content = "Reset toàn bộ cài đặt về mặc định?",
                Buttons = {
                    { Title = "Reset", Callback = function()
                        pcall(function() writefile(SAVE_FILE, "{}") end)
                        Settings = {}
                        lib:Notify({ Title = "TDZ Neo", Content = "Đã reset!", Duration = 2 })
                    end},
                    { Title = "Huỷ", Callback = function() end },
                }
            })
        end
    })

    local ui_sec = Tabs.Settings:AddSection("Giao Diện")

    ui_sec:CreateKeybind("ToggleKey", {
        Title       = "Phím ẩn/hiện UI",
        Description = "Nhấn để ẩn hoặc hiện cửa sổ",
        Default     = Enum.KeyCode.RightControl,
        Callback    = function() Window:Minimize() end
    })

    -- Build InterfaceManager section (theme, etc.)
    if lib2 then
        lib2:SetLibrary(lib)
        lib2:SetFolder("TDZ-Neo")
        lib2:BuildInterfaceSection(Tabs.Settings)
    end
end

-- ══════════════════════════════════════════
-- FLOATING BUTTON UI
-- ══════════════════════════════════════════
do
    local existing = PlayerGui:FindFirstChild("TDZ_Neo_Btn")
    if existing then existing:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "TDZ_Neo_Btn"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = PlayerGui

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 54, 0, 54)
    Frame.Position = UDim2.new(0, 24, 0.5, -27)
    Frame.BackgroundColor3 = Color3.fromRGB(12, 12, 20)
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = Frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(80, 160, 255)
    stroke.Thickness = 1.5
    stroke.Transparency = 0.3
    stroke.Parent = Frame

    local Btn = Instance.new("ImageButton")
    Btn.Size = UDim2.new(1, -8, 1, -8)
    Btn.Position = UDim2.new(0, 4, 0, 4)
    Btn.BackgroundTransparency = 1
    Btn.Image = "rbxassetid://79773252738743"
    Btn.Parent = Frame

    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(1, 0)
    BtnCorner.Parent = Btn

    -- Glow pulse
    task.spawn(function()
        while Frame and Frame.Parent do
            TweenService:Create(stroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Transparency = 0.7
            }):Play()
            task.wait(1.2)
            TweenService:Create(stroke, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                Transparency = 0.1
            }):Play()
            task.wait(1.2)
        end
    end)

    -- Drag logic
    local dragging, dragStart, startPos = false, nil, nil
    local function lerp(a, b, t) return a + (b - a) * t end

    local targetPos = Frame.Position
    RunService.RenderStepped:Connect(function()
        Frame.Position = UDim2.new(
            lerp(Frame.Position.X.Scale, targetPos.X.Scale, 0.18),
            lerp(Frame.Position.X.Offset, targetPos.X.Offset, 0.18),
            lerp(Frame.Position.Y.Scale, targetPos.Y.Scale, 0.18),
            lerp(Frame.Position.Y.Offset, targetPos.Y.Offset, 0.18)
        )
    end)

    Btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging  = true
            dragStart = input.Position
            startPos  = Frame.Position
            TweenService:Create(Btn, TweenInfo.new(0.1), { Size = UDim2.new(0.9, 0, 0.9, 0) }):Play()
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseMovement or
            input.UserInputType == Enum.UserInputType.Touch
        ) then
            local delta = input.Position - dragStart
            targetPos = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    local clickTime = 0
    Btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
            TweenService:Create(Btn, TweenInfo.new(0.1), { Size = UDim2.new(1, -8, 1, -8) }):Play()
            if tick() - clickTime < 0.25 then
                Window:Minimize()
            end
            clickTime = tick()
        end
    end)
end

-- ══════════════════════════════════════════
-- STARTUP NOTIFY
-- ══════════════════════════════════════════
task.wait(0.5)
lib:Notify({
    Title   = "TDZ Neo Series",
    Content = "Loaded • " .. LocalPlayer.Name .. " • RCtrl để ẩn/hiện",
    Duration = 4,
})
