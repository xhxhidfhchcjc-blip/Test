local LocalPlayer = game.Players.LocalPlayer
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

game:GetService("TeleportService")
game:GetService("HttpService")

local CommF_ = ReplicatedStorage.Remotes.CommF_
local Stats = game:GetService("Stats")

repeat
	task.wait(1)

	if not LocalPlayer.Team then
		CommF_:InvokeServer("SetTeam", "Pirates")
	end
until LocalPlayer.Team

if hookfunction and hookmetamethod and getconnections and cloneref and firetouchinterest and fireproximityprompt and collectgarbage and version and gethwid then
	print("Supported Executor!")
else
	LocalPlayer:Kick("Missing hookfunction/hookmetamethod...")
	;(rawget(getrawmetatable(LocalPlayer), "Kick") or LocalPlayer.Kick)(LocalPlayer, "")
	game:Shutdown()
end

local lib = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local lib2 = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"))()
local TweenService = game:GetService("TweenService")
local ContentProvider = game:GetService("ContentProvider")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
local executor = tostring(identifyexecutor())
local v14 = ({
	Zenith = true,
	Volt = true,
	Wave = true,
	Potassium = true,
	Seliware = true,
	SirHurt = true,
	Hydrogen = "macOS",
	MacSploit = "macOS"
})[executor]

Window = lib:CreateWindow({
	Title = "Infinity Hub",
	SubTitle = "Main",
	TabWidth = 150,
	Size = UDim2.fromOffset(500, 380),
	Resize = false,
	MinSize = Vector2.new(450, 350),
	Acrylic = false,
	Theme = "Dark",
	MinimizeKey = Enum.KeyCode.LeftControl
})

Tabs = {
	MainFarm = Window:CreateTab({
		Title = "Main Farm",
		Icon = "sprout"
	}),
	SettingsS = Window:CreateTab({
		Title = "Settings Fluent",
		Icon = "settings"
	})
}

Config = {
	SettingsS = {
		["Load Execute"] = false
	}
}

Load = function()
	if not readfile or not writefile or not isfile or not isfolder then
		return warn("Status : Undetected Executor")
	end

	if not isfolder("Infinity Hub - Studio") then
		makefolder("Infinity Hub - Studio")
	end

	if not isfolder("Infinity Hub - Studio/Blox Fruits/") then
		makefolder("Infinity Hub - Studio/Blox Fruits/")
	end

	local v15 = "Infinity Hub - Studio/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"

	if isfile(v15) then
		local data = game:GetService("HttpService"):JSONDecode(readfile(v15))

		for k, v in pairs(data) do
			Config[k] = v
		end
	else
		writefile(v15, game:GetService("HttpService"):JSONEncode(Config))
	end

	print("Loaded!")
end

SaveSetting = function()
	if not readfile or not writefile or not isfile or not isfolder then
		return warn("Status : Undetected Executor")
	end

	local v19 = "Infinity Hub - Studio/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"

	if isfile(v19) then
		local t1 = {}

		for k, v in pairs(Config) do
			t1[k] = v
		end

		writefile(v19, game:GetService("HttpService"):JSONEncode(t1))
	else
		Load()
	end
end

ResetSetting = function()
	if readfile and writefile then
		if isfile and isfolder then
			Config = {
				SettingsS = {
					["Load Execute"] = false
				}
			}
			writefile("Infinity Hub - Studio/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json", game:GetService("HttpService"):JSONEncode(Config))
			lib:Notify({
				Title = "Reset Successful!",
				Content = "All settings have been reset to default",
				Duration = 3
			})
			print("Settings reset to default!")
			return
		end
	end

	return warn("Status : Undetected Executor")
end

Load()



-- ===================== UI BUTTON =====================
local CustomScreenGui = PlayerGui:FindFirstChild("CustomScreenGui")

if CustomScreenGui then
	CustomScreenGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Name = "CustomScreenGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")

Frame.Name = "BorderFrame"
Frame.Parent = ScreenGui
Frame.Size = UDim2.new(0, 52, 0, 52)
Frame.Position = UDim2.new(0, 50, 0, 50)
Frame.BackgroundColor3 = Color3.new(1, 1, 1)
Frame.BackgroundTransparency = 0
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.fromRGB(0, 255, 255)

local UICorner = Instance.new("UICorner")

UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Frame

local ImageButton = Instance.new("ImageButton")

ImageButton.Name = "CustomButton"
ImageButton.Parent = Frame
ImageButton.Size = UDim2.new(1, -4, 1, -4)
ImageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
ImageButton.AnchorPoint = Vector2.new(0.5, 0.5)
ImageButton.BackgroundTransparency = 1
ImageButton.Image = "rbxassetid://79773252738743"

local UICorner2 = Instance.new("UICorner")

UICorner2.CornerRadius = UDim.new(1, 0)
UICorner2.Parent = ImageButton

local UIStroke = Instance.new("UIStroke")

UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(0, 255, 255)
UIStroke.Parent = Frame
UIStroke.Enabled = false

local u30 = false

ContentProvider:PreloadAsync({ ImageButton.Image }, function()
	u30 = true
end)

local u31 = false
local u32
local Position
local Position2
local Size = ImageButton.Size
local enabled = false
local Position3 = Frame.Position
local Position4 = Frame.Position
local n1 = 0.15

local function v40(p1)
	if u31 then
		local v41 = p1.Position - Position

		Position4 = UDim2.new(Position2.X.Scale, Position2.X.Offset + v41.X, Position2.Y.Scale, Position2.Y.Offset + v41.Y)
	end
end

RunService.RenderStepped:Connect(function()
	if u31 then
		Position3 = Position3:Lerp(Position4, n1)
		Frame.Position = Position3
	end
end)

ImageButton.InputBegan:Connect(function(input)
	local connection

	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		u31 = true
		Position = input.Position
		Position2 = Frame.Position
		Position3 = Frame.Position

		local tween = TweenService:Create(ImageButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(Size.X.Scale, Size.X.Offset * 0.9, Size.Y.Scale, Size.Y.Offset * 0.9)
		})

		tween:Play()
		connection = nil
		connection = input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				u31 = false
				connection:Disconnect()

				local t2 = {
					Size = Size
				}

				TweenService:Create(ImageButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), t2):Play()
			end
		end)
	elseif input.UserInputType == Enum.UserInputType.Touch then
		u31 = true
		Position = input.Position
		Position2 = Frame.Position
		Position3 = Frame.Position
		TweenService:Create(ImageButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = UDim2.new(Size.X.Scale, Size.X.Offset * 0.9, Size.Y.Scale, Size.Y.Offset * 0.9)
		}):Play()
		connection = nil
		connection = input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				u31 = false
				connection:Disconnect()

				local t3 = {
					Size = Size
				}

				TweenService:Create(ImageButton, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), t3):Play()
			end
		end)

		return
	end
end)

ImageButton.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		u32 = input
		v40(input)
	end
end)

UserInputService.InputChanged:Connect(function(input)
	if input == u32 and u31 then
		v40(input)
	end
end)

local n2 = 0

ImageButton.MouseButton1Down:Connect(function()
	n2 = tick()
end)

ImageButton.MouseButton1Up:Connect(function()
	if tick() - n2 < 0.2 and not u31 then
		enabled = not enabled
		UIStroke.Enabled = enabled
		TweenService:Create(UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
			Thickness = enabled and 4 or 2
		}):Play()

		if u30 then
			Window:Minimize()
		end
	end
end)

ImageButton.MouseEnter:Connect(function()
	TweenService:Create(ImageButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		Size = UDim2.new(Size.X.Scale, Size.X.Offset * 1.1, Size.Y.Scale, Size.Y.Offset * 1.1)
	}):Play()
	TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
		BackgroundTransparency = 0.3
	}):Play()
end)

ImageButton.MouseLeave:Connect(function()
	local t4 = {
		Size = Size
	}

	TweenService:Create(ImageButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), t4):Play()
	TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad), {
		BackgroundTransparency = 0
	}):Play()
end)

-- ===================== TAB: SETTINGS FLUENT =====================
Tabs.SettingsS:AddSection("Save Setting")

Load = Tabs.SettingsS:CreateToggle("Load", {
	Title = "Load Script if hop server",
	Description = "Auto load execute script if hop server",
	Default = Config.SettingsS["Load Execute"]
})

Load:OnChanged(function(p2)
	Config.SettingsS["Load Execute"] = p2
	SaveSetting()

	if p2 then
		local queue_on_teleport_ = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport

		if queue_on_teleport_ then
			queue_on_teleport_([[                repeat wait() until game:IsLoaded()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Dex-Bear/Infinityhub/refs/heads/main/BF-Main.lua"))()
            ]])
		end
	end
end)

Tabs.SettingsS:CreateButton({
	Title = "Copy Saved Config",
	Description = "Copy current saved config from file",
	Callback = function()
		if readfile and isfile and isfolder then
			local v49 = "Infinity Hub - Studio/Blox Fruits/" .. game.Players.LocalPlayer.Name .. ".json"

			if not isfile(v49) then
				lib:Notify({
					Title = "Error!",
					Content = "No saved config found",
					Duration = 3
				})

				return
			end

			local v50 = readfile(v49)
			local data = game:GetService("HttpService"):JSONDecode(v50)

			local function v52(p3, p4)
				local v53 = p4 or 0
				local v54 = string.rep("    ", v53)
				local s1 = "{\n"

				for k, v in pairs(p3) do
					local v58 = s1 .. v54 .. "    "
					local v59

					if type(k) == "string" then
						v59 = v58 .. "[\"" .. k .. "\"] = "
					else
						v59 = v58 .. "[" .. k .. "] = "
					end

					local v60

					if type(v) == "table" then
						v60 = v59 .. v52(v, v53 + 1)
					elseif type(v) == "string" then
						v60 = v59 .. "\"" .. v .. "\""
					elseif type(v) == "boolean" then
						v60 = v59 .. tostring(v)
					elseif type(v) == "nil" then
						v60 = v59 .. "nil"
					else
						v60 = v59 .. tostring(v)
					end

					s1 = v60 .. ",\n"
				end

				return s1 .. v54 .. "}"
			end

			local v61 = "Config = " .. v52(data)

			setclipboard(v61)

			if writefile then
				if not isfolder("Infinity Hub - Studio/Exports") then
					makefolder("Infinity Hub - Studio/Exports")
				end

				local savedConfigExportedTo = "Infinity Hub - Studio/Exports/" .. game.Players.LocalPlayer.Name .. "_SavedConfig_" .. os.date("%Y-%m-%d_%H-%M-%S") .. ".lua"

				writefile(savedConfigExportedTo, v61)
				lib:Notify({
					Title = "Copied & Saved!",
					Content = "Saved config copied to clipboard and file",
					Duration = 3
				})
				print("Saved config exported to: " .. savedConfigExportedTo)
			else
				lib:Notify({
					Title = "Copied!",
					Content = "Saved config copied to clipboard",
					Duration = 3
				})
			end
		else
			lib:Notify({
				Title = "Error!",
				Content = "Executor not supported",
				Duration = 3
			})
		end
	end
})

Tabs.SettingsS:CreateButton({
	Title = "Reset Config",
	Description = "Reset all settings to default",
	Callback = function()
		Window:Dialog({
			Title = "Reset Confirmation",
			Content = "Are you sure you want to reset ALL settings to default?\nThis action cannot be undone.",
			Buttons = {
				{
					Title = "Yes",
					Callback = function()
						ResetSetting()
					end
				},
				{
					Title = "No",
					Callback = function()
						lib:Notify({
							Title = "Cancelled",
							Content = "Reset cancelled",
							Duration = 2
						})
					end
				}
			}
		})
	end
})

Tabs.SettingsS:AddSection("Button Setting")

Tabs.SettingsS:CreateSlider("ButtonSize", {
	Title = "Button Size",
	Description = "Adjust toggle button size",
	Default = 40,
	Min = 35,
	Max = 80,
	Rounding = 0,
	Callback = function(p5)
		Frame.Size = UDim2.new(0, p5, 0, p5)
		Size = UDim2.new(1, -4, 1, -4)
		ImageButton.Size = Size
	end
})

Tabs.SettingsS:CreateSlider("DragSpeed", {
	Title = "Drag Speed",
	Description = "Adjust how smooth the dragging is",
	Default = 0.15,
	Min = 0.05,
	Max = 1,
	Rounding = 2,
	Callback = function(p6)
		n1 = p6
	end
})

Tabs.SettingsS:CreateButton({
	Title = "Reset Button Position",
	Description = "Move button back to top-left",
	Callback = function()
		local uDim2 = UDim2.new(0, 50, 0, 50)

		TweenService:Create(Frame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Position = uDim2
		}):Play()
		Position3 = uDim2
		Position4 = uDim2
	end
})

lib2:SetLibrary(lib)
lib2:SetFolder("FluentScriptHub")
lib2:BuildInterfaceSection(Tabs.SettingsS)
SettingAutoFarmSection = Tabs.MainFarm:AddSection("Setting Farm")
SettingAutoFarmSection:CreateDropdown(
	{
		Title = "Select Method Farm",
		List = { "Level Farm", "Farm Bones", "Farm Katakuri", "Farm Tyrant of the Skies", "Aura Farm" },
		Search = false,
		Selected = false,
		Default = Settings["Select Method Farm"] or nil,
	},
	function(o)
		SaveSettings("Select Method Farm", o)
	end
)
SettingAutoFarmSection:CreateSlider(
	{
		Title = "Distance Farm Aura",
		Min = 0,
		Max = 1000,
		Default = Settings["Distance Farm Aura"] or 300,
		Precise = true,
	},
	function(o)
		SaveSettings("Distance Farm Aura", o)
	end
)
SettingAutoFarmSection:CreateSlider(
	{
		Title = "Farm Height",
		Min = 0,
		Max = 200,
		Default = Settings["Farm Height"] or 20,
		Precise = true,
	},
	function(o)
		SaveSettings("Farm Height", o)
		getgenv().YPosFruit = tonumber(o) or 20
	end
)
SettingAutoFarmSection:CreateToggle(
	{ Title = "Ignore Attack Katakuri", Desc = nil, Default = Settings["Ignore Attack Katakuri"] or false },
	function(o)
		SaveSettings("Ignore Attack Katakuri", o)
	end
)
SettingAutoFarmSection:CreateToggle(
	{ Title = "Hop Find Katakuri", Desc = nil, Default = Settings["Hop Find Katakuri"] or false },
	function(o)
		SaveSettings("Hop Find Katakuri", o)
	end
)
SettingAutoFarmSection:CreateToggle(
	{
		Title = "Auto Quest [Katakuri/Bone/Tyrant]",
		Desc = nil,
		Default = Settings["Auto Quest [Katakuri/Bone/Tyrant]"] or false,
	},
	function(o)
		SaveSettings("Auto Quest [Katakuri/Bone/Tyrant]", o)
	end
)
local o = SettingAutoFarmSection:CreateToggle(
	{ Title = "Start Farm", Desc = nil, Default = Settings["Start Farm"] or false },
	function(V)
		SaveSettings("Start Farm", V)
	end
)

MasteryFarmSection = Tabs.MainFarm:AddSection("Mastery Farm")
MasteryFarmSection:CreateDropdown(
	{
		Title = "Select Method Farm Mastery",
		List = { "Blox Fruit", "Gun" },
		Search = true,
		Selected = false,
		Default = Settings["Select Method Farm Mastery"] or nil,
	},
	function(V)
		SaveSettings("Select Method Farm Mastery", V)
	end
)
MasteryFarmSection:CreateSlider(
	{ Title = "Health %", Min = 0, Max = 100, Default = Settings["Health %"] or 40, Precise = true },
	function(V)
		SaveSettings("Health %", V)
	end
)
MasteryFarmSection:CreateToggle(
	{ Title = "Farm Mastery", Desc = nil, Default = Settings["Farm Mastery"] or false },
	function(V)
		SaveSettings("Farm Mastery", V)
	end
)
FarmingMaterialSection = Tabs.MainFarm:AddSection("Farming Material")
FarmingMaterialSection:CreateDropdown(
	{
		Title = "Select Material",
		List = TableMaterials,
		Search = true,
		Selected = false,
		Default = Settings["Select Material"] or nil,
	},
	function(V)
		SaveSettings("Select Material", V)
	end
)
FarmingMaterialSection:CreateToggle(
	{ Title = "Farm Material", Desc = nil, Default = Settings["Farm Material"] or false },
	function(V)
		SaveSettings("Farm Material", V)
	end
)
local V, N, y, P, e, Y =
	{ "BartiloQuest", "Trainees", "MarineQuest", "CitizenQuest" },
	{},
	{ "Baking Staff", "Head Baker", "Cake Guard", "Cookie Crafter" },
	{ "Cocoa Warrior", "Chocolate Bar Battler", "Candy Rebel", "Sweet Thief" },
	{ "Reborn Skeleton", "Demonic Soul", "Living Zombie", "Posessed Mummy" },
	{ "Isle Champion", "Serpent Hunter", "Skull Slayer", "Sun-kissed Warrior" }
getgenv().NameMobQuest = ""
getgenv().NameQuest = ""
getgenv().IDQuest = 0
getgenv().questpoint = {}
local H = require(game.ReplicatedStorage.Quests)
local function B()
	local Z, C = t.Data.Level.Value, 0
	if Z >= 1450 and game.PlaceId == getgenv().CheckPlaceId2 then
		getgenv().NameMobQuest = "Water Fighter"
		getgenv().NameQuest = "ForgottenQuest"
		getgenv().IDQuest = 2
	elseif Z >= 700 and game.PlaceId == getgenv().CheckPlaceId3 then
		getgenv().NameMobQuest = "Galley Captain"
		getgenv().NameQuest = "FountainQuest"
		getgenv().IDQuest = 2
	else
		for J, F in pairs(H) do
			for q, c in pairs(F) do
				if not table.find(V, J) then
					local F = c.LevelReq
					for D, r in pairs(c.Task) do
						if Z >= F and F >= C and r > 1 then
							getgenv().NameMobQuest = D
							getgenv().NameQuest = J
							getgenv().IDQuest = q
							C = F
						end
					end
				end
			end
		end
	end
end
function CountQuest()
	local Z = {}
	for C, C in pairs(H) do
		for J, J in pairs(C) do
			for F, q in pairs(J.Task) do
				if F == getgenv().mobv then
					for J, J in pairs(C) do
						if J.LevelReq <= t.Data.Level.Value and J.Name ~= "Town Raid" then
							for C, F in pairs(J.Task) do
								if F > 1 then
									table.insert(Z, C)
								end
							end
						end
					end
				end
			end
		end
	end
	return Z
end
local Z = require(game.ReplicatedStorage:WaitForChild("GuideModule"))
function DontQuest()
	return Z.Data and Z.Data.QuestData ~= nil
end
function GetNameDoubleQuest()
	if DontQuest() then
		for C, J in next, Z.Data.QuestData.Task, nil do
			return C
		end
	end
end
function DoubleQuest()
	wait(0.5)
	B()
	local B = {}
	if DontQuest() and GetNameDoubleQuest() == getgenv().NameMobQuest and #CountQuest() >= 2 then
		for C, J in pairs(H) do
			for F, F in pairs(J) do
				for q in pairs(F.Task) do
					if tostring(q) == getgenv().mobv then
						for F, q in pairs(J) do
							for J, c in pairs(q.Task) do
								if J ~= getgenv().mobv and c > 1 then
									B.Name = J
									B.NameQuest = C
									B.ID = F
									return B
								end
							end
						end
					end
				end
			end
		end
	else
		B.Name = getgenv().NameMobQuest
		B.NameQuest = getgenv().NameQuest
		B.ID = getgenv().IDQuest
	end
	return B
end
function CFrameQuest()
	local B = {}
	for C, J in next, H, nil do
		if C ~= "MarineQuest" then
			for F, F in next, J, nil do
				B[F.LevelReq] = C
			end
		end
	end
	getgenv().questpoint = {}
	for C, J in next, Z.Data.NPCList, nil do
		for F, q in next, J.Levels, nil do
			F = B[q]
			if C.Parent.Name ~= "Marine Leader" and F and not getgenv().questpoint[F] then
				getgenv().questpoint[F] = CFrame.new(J.Position)
			end
		end
	end
	getgenv().questpoint.SkyExp1Quest = CFrame.new(-7857.28516, 5544.34033, -382.321503)
end
local function B(C)
	local J = Z.Data.QuestData
	local F, q, c = J and (next(J.Task)), 0, {}
	for D, r in pairs(Z.Data.NPCList) do
		if not table.find(V, r.InternalQuestName) then
			for V, n in pairs(r.Levels) do
				D = H[r.InternalQuestName][V]
				if D then
					local u, W = next(D.Task)
					if W and W > 1 and n <= C and n >= q then
						c = {
							Level = n,
							Name = r.NPCName,
							QuestName = r.InternalQuestName,
							Pos = r.Position,
							Id = V,
							Mob = u,
						}
						if F == u and V > 1 then
							J = H[r.InternalQuestName][V - 1]
							if J and J.Task then
								for H, C in pairs(J.Task) do
									if H ~= F and C > 1 then
										c.Mob = H
										c.Id = V - 1
										break
									end
								end
							end
						end
						q = n
					end
				end
			end
		end
	end
	return c
end

TakeQuestLevel = function()
	local V = B(t.Data.Level.Value)
	if getgenv().DebugFarmLevel then
		print(("[TakeQuestLevel] Level=%s Found=%s Pos=%s Mob=%s QuestName=%s"):format(
			tostring(t.Data.Level.Value),
			tostring(V ~= nil),
			tostring(V and V.Pos),
			tostring(V and V.Mob),
			tostring(V and V.QuestName)
		))
	end
	if not V or not V.Pos then
		return
	end
	local H, B, C =
		typeof(V.Pos) == "CFrame" and V.Pos.Position or V.Pos,
		t.Character and (t.Character:FindFirstChild("HumanoidRootPart")),
		t.Character and (t.Character:FindFirstChild("Humanoid"))
	if not B or not C then
		return
	end
	if (H - B.Position).Magnitude <= 8 and C.Health > 0 then
		wait(2)
		CommF:InvokeServer("StartQuest", tostring(V.QuestName), V.Id)
	else
		toTarget(CFrame.new(H) * CFrame.new(0, 4, 2), true)
	end
end

GetLevelQuestMob = function()
	local ok, info = pcall(B, t.Data.Level.Value)
	if ok and info and info.Mob then
		return info.Mob
	end
end

local _questMobCache = { text = nil, mob = nil }
function GetCurrentQuestMob()
	local exact = GetNameDoubleQuest()
	if exact then
		return exact
	end
	local text = GetQuestText():lower()
	if text == "" then
		return nil
	end
	if _questMobCache.text == text then
		return _questMobCache.mob
	end
	local best
	for _, quest in pairs(H) do
		if type(quest) == "table" then
			for _, data in pairs(quest) do
				if type(data) == "table" and type(data.Task) == "table" then
					for mobName, count in pairs(data.Task) do
						if
							type(mobName) == "string"
							and count > 1
							and text:find(mobName:lower(), 1, true)
							and (not best or #mobName > #best)
						then
							best = mobName
						end
					end
				end
			end
		end
	end
	_questMobCache.text, _questMobCache.mob = text, best
	return best
end

function DetectPartSpawnMob(V, H)
	local function B(C)
		return C:gsub(" %p?Lv%.? %d+%p?", "")
	end
	local C = string.find(V, "Lv.") and (B(V)) or V
	for J, F in pairs(TableMobSpawn) do
		if F:IsA("Part") then
			J = string.find(F.Name, "Lv.") and (B(F.Name)) or F.Name
			if (J == V or J == C) and (not H or not F:FindFirstChild("Ignored")) then
				return F
			end
		end
	end
	for J, F in pairs(workspace._WorldOrigin.EnemySpawns:GetChildren()) do
		if F:IsA("Part") then
			J = string.find(F.Name, "Lv.") and (B(F.Name)) or F.Name
			if (J == V or J == C) and (not H or not F:FindFirstChild("Ignored")) then
				table.insert(TableMobSpawn, F)
				return F
			end
		end
	end
	for J, F in pairs(getnilinstances()) do
		if F:IsA("Part") then
			J = string.find(F.Name, "Lv.") and (B(F.Name)) or F.Name
			if (J == V or J == C) and (not H or not F:FindFirstChild("Ignored")) then
				table.insert(TableMobSpawn, F)
				return F
			end
		end
	end
	return nil
end
function DeleteIgnoredMobSpawn()
	for V, V in pairs(TableMobSpawn) do
		if V:FindFirstChild("Ignored") then
			V.Ignored:Destroy()
		end
	end
end
function DetectNameTablePart(V)
	for H, H in next, V, nil do
		if not table.find(N, H) then
			return H
		end
	end
end
function TeleportSpawnMob(V)
	if typeof(V) == "table" then
		if #N >= #V then
			N = {}
			return
		end
		local H = DetectPartSpawnMob(DetectNameTablePart(V))
		if H then
			toTarget(H.CFrame * CFrame.new(0, 60, 0))
			wait(0.5)
		end
	else
		wait(0.5)
		local H = DetectPartSpawnMob(V, true)
		if H then
			if (H.Position - t.Character.HumanoidRootPart.Position).Magnitude <= 100 or (DetectMob(V)) then
				Instance.new("IntValue", H).Name = "Ignored"
			end
			toTarget(H.CFrame * CFrame.new(0, 60, 0))
		else
			DeleteIgnoredMobSpawn()
		end
	end
end
function QuestBoneAndkatakuri(V, H)
	local B = getgenv().questpoint[V]
	if not B then
		CFrameQuest()
		task.wait(1.5)
		B = getgenv().questpoint[V]
		if not B then
			return
		end
	end
	local C, J =
		t.Character and (t.Character:FindFirstChild("HumanoidRootPart")),
		t.Character and (t.Character:FindFirstChildOfClass("Humanoid"))
	if not C or not J then
		return
	end
	if (B.Position - C.Position).Magnitude <= 8 then
		if J.Health > 0 then
			CommF:InvokeServer("StartQuest", V, H)
			task.wait(0.5)
		end
	else
		toTarget(B * CFrame.new(0, 4, 2), true)
	end
end
local V = { "Control-Control", "Buddha-Buddha", "Diamond-Diamond", "Falcon-Falcon" }
local function H(B, C)
	local J = t.PlayerGui.Main.Skills[B]:FindFirstChild(C)
	if not J then
		return false
	end
	return J:IsA("Frame") and J.Title.TextColor3 == Color3.new(1, 1, 1) and J.Cooldown.Size == UDim2.new(0, 0, 1, -1)
		or J.Cooldown.Size == UDim2.new(1, 0, 1, -1)
end
local function B(C)
	if H(C, "Z") then
		local H = game:GetService("VirtualInputManager")
		H:SendKeyEvent(true, "Z", false, game)
		H:SendKeyEvent(false, "Z", false, game)
	end
end
local function H(C)
	local J = t.PlayerGui.Main.Skills[C.Name]
	if not J then
		return nil
	end
	for F, F in ipairs(J:GetChildren()) do
		if
			F:IsA("Frame")
			and F.Name ~= "Template"
			and (F.Name ~= "Z" or F.Name == "Z" and not table.find(V, C.Name))
			and Settings["Select Skills " .. C.ToolTip]
			and Settings["Select Skills " .. C.ToolTip][F.Name]
			and (
				F.Title.TextColor3 == Color3.new(1, 1, 1) and F.Cooldown.Size == UDim2.new(0, 0, 1, -1)
				or F.Cooldown.Size == UDim2.new(1, 0, 1, -1)
			)
		then
			return F.Name
		end
	end
end
function UsedualFlock()
	equiptool(NameWeapon(Settings["Select Weapon"] or "Melee"))
end
function FarmMastery(V)
	if not V or not V:FindFirstChild("Humanoid") or not V:FindFirstChild("HumanoidRootPart") then
		return
	end
	getgenv().AimPos = V.HumanoidRootPart.CFrame
	if not Settings["Farm Mastery"] then
		UsedualFlock()
		return
	end
	if V.Humanoid.Health / V.Humanoid.MaxHealth > (Settings["Health %"] or 100) / 100 then
		UsedualFlock()
		return
	end
	local C = Settings["Select Method Farm Mastery"]
	local J, F = NameWeapon(C), NameWeapon(C, true)
	if not J or not F then
		return
	end
	if C == "Gun" and (t.Character:FindFirstChild(J)) then
		ShootM1(V)
	end
	equiptool(J)
	if J == "Control-Control" then
		C = workspace._WorldOrigin:FindFirstChild("Globe")
		if not C or t:DistanceFromCharacter(C.Position) > C.AB.CurveSize0 / 1.75 then
			B(J)
			return
		end
	elseif J == "Buddha-Buddha" then
		if not t.Character.HumanoidRootPart:FindFirstChild("Buddha") then
			B(J)
			return
		end
	elseif J == "Diamond-Diamond" then
		if not t.Character:FindFirstChild("DiamondBody") then
			B(J)
			return
		end
	elseif J == "Falcon-Falcon" then
		if not t.Character:FindFirstChild("FalconWings") then
			B(J)
			return
		end
	end
	C = H(F)
	if C then
		V, J = Settings["Skill " .. C .. " " .. F.ToolTip] or 0.5, game:GetService("VirtualInputManager")
		J:SendKeyEvent(true, C, false, game)
		if Settings["Use skill fast dont hold"] then
			task.wait(0.05)
		else
			task.wait(V)
		end
		J:SendKeyEvent(false, C, false, game)
	end
end
getgenv().StackFarm = true
getgenv().StackFarmOther = true
StackFarm = getgenv().StackFarm
StackFarmOther = getgenv().StackFarmOther
function DetectMobAura()
	local V, H = typeof(Settings["Distance Farm Aura"]) ~= "number" and (tonumber(Settings["Distance Farm Aura"]))
		or Settings["Distance Farm Aura"]
		or 300
	for B, C in pairs(game.Workspace.Enemies:GetChildren()) do
		if IsMobAlive(C) then
			B = (
				C.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
			).magnitude
			if B < V then
				V, H = B, C.Name
			end
		end
	end
	return H
end
getgenv().StackFarm = true
getgenv().YPosFruit = tonumber(Settings["Farm Height"]) or 20

-- [FIX FRUIT FARM v10] Dung tren quai theo Farm Height, tinh tu MAT DAT (khong tinh tu CFrame song cua quai).
-- Loi cu: vi tri farm = mob.HumanoidRootPart.CFrame * (-7, Height, 0). Quai bi M1 fruit hat len / xoay nghieng
-- thi nhan vat bay theo len troi, BringMob lai keo them quai len -> vong lap bay len troi.
-- Gio: (1) FruitFarmCF luon = mat dat duoi quai + Height (offset theo huong ngang, khong theo xoay nghieng cua quai)
--      (2) FruitGroundKeeper keo quai dang lo lung/bi hat len ve lai mat dat, nhan vat bay xuong theo.
-- Tat bang: getgenv().FruitGroundKeep = false
do
	local Players = game:GetService("Players")
	local RunService = game:GetService("RunService")
	local lp = Players.LocalPlayer
	local rayParams = RaycastParams.new()
	rayParams.FilterType = Enum.RaycastFilterType.Exclude
	rayParams.RespectCanCollide = true
	local filterAt = 0
	local info = setmetatable({}, { __mode = "k" }) -- [mob] = { y = standY, rest = hrp-ground, t = time }

	local function refreshFilter()
		if os.clock() - filterAt < 2 then
			return
		end
		filterAt = os.clock()
		local list = {}
		for _, n in ipairs({ "Enemies", "Characters", "SeaBeasts", "_WorldOrigin" }) do
			local f = workspace:FindFirstChild(n)
			if f then
				list[#list + 1] = f
			end
		end
		if lp.Character then
			list[#list + 1] = lp.Character
		end
		rayParams.FilterDescendantsInstances = list
	end

	-- toa do Y "dung tren mat dat" cua quai (cache 0.15s). Quai dang lo lung van tra ve Y mat dat ben duoi.
	local function standY(mob, hrp)
		local c = info[mob]
		local now = os.clock()
		if c and now - c.t < 0.15 then
			return c.y
		end
		refreshFilter()
		local pos = hrp.Position
		local res = workspace:Raycast(pos + Vector3.new(0, 3, 0), Vector3.new(0, -1500, 0), rayParams)
		if not c then
			c = { rest = 3 }
			info[mob] = c
		end
		if res then
			local above = pos.Y - res.Position.Y
			if above <= 9 then
				c.rest = math.clamp(above, 0, 9) -- quai dang dung dat -> hoc chieu cao HRP luc dung
			end
			c.y = res.Position.Y + c.rest
		elseif not c.y then
			c.y = pos.Y
		end
		c.t = now
		return c.y
	end

	getgenv().FruitFarmCF = function(mob)
		local hrp = mob and mob:FindFirstChild("HumanoidRootPart")
		if not hrp then
			local my = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
			return my and my.CFrame or CFrame.new()
		end
		local h = tonumber(getgenv().YPosFruit) or tonumber(Settings["Farm Height"]) or 20
		local p = hrp.Position
		local y = standY(mob, hrp)
		-- chi lay huong ngang cua quai (bo phan nghieng) de nhan vat luon thang dung
		local look = hrp.CFrame.LookVector
		local flat = Vector3.new(look.X, 0, look.Z)
		local yaw = flat.Magnitude > 0.1 and math.atan2(-flat.X, -flat.Z) or 0
		return CFrame.new(p.X, y, p.Z) * CFrame.Angles(0, yaw, 0) * CFrame.new(-7, h, 0)
	end

	if not getgenv().__FruitGroundKeeper then
		getgenv().__FruitGroundKeeper = true
		local lastRun = 0
		RunService.Heartbeat:Connect(function()
			if getgenv().FruitGroundKeep == false then
				return
			end
			local now = os.clock()
			if now - lastRun < 0.1 then
				return
			end
			lastRun = now
			pcall(function()
				if Settings["Select Weapon"] ~= "Blox Fruit" then
					return
				end
				local ch = lp.Character
				local root = ch and ch:FindFirstChild("HumanoidRootPart")
				local folder = workspace:FindFirstChild("Enemies")
				if not root or not folder then
					return
				end
				-- chi khi dang farm / dang danh quai
				local attacking = AttackingMob and AttackingMob.Parent == folder
				if not (attacking or IsFarmOn()) then
					return
				end
				local checked = 0
				for _, mob in ipairs(folder:GetChildren()) do
					if checked >= 15 then
						break
					end
					local hrp = mob:FindFirstChild("HumanoidRootPart")
					local hum = mob:FindFirstChildOfClass("Humanoid")
					if hrp and hum and hum.Health > 0 and (hrp.Position - root.Position).Magnitude <= 160 then
						checked = checked + 1
						local sy = standY(mob, hrp)
						local pos = hrp.Position
						local tilted = hrp.CFrame.UpVector.Y < 0.7
						-- quai bi hat len troi (cao hon mat dat > 7 studs) hoac nam nghieng -> dua ve mat dat, dung thang
						if pos.Y - sy > 7 or tilted then
							local look = hrp.CFrame.LookVector
							local yaw = math.atan2(-look.X, -look.Z)
							if look.X ~= look.X or look.Z ~= look.Z then
								yaw = 0
							end
							hrp.CFrame = CFrame.new(pos.X, sy, pos.Z) * CFrame.Angles(0, yaw, 0)
							hrp.AssemblyLinearVelocity = Vector3.zero
							hrp.AssemblyAngularVelocity = Vector3.zero
						end
					end
				end
			end)
		end)
	end
end
function CheckCDSkillTransformation(V, H)
	local B, C, J = next, game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[V.Name]:GetChildren()
	for F, F in B, C, J do
		if F:IsA("Frame") then
			if
				F.Name ~= "Template"
					and not string.find(F.Title.Text, "Transformation")
					and H[F.Name]
					and F.Title.TextColor3 == Color3.new(1, 1, 1)
					and F.Cooldown.Size == UDim2.new(0, 0, 1, -1)
				or F.Cooldown.Size == UDim2.new(1, 0, 1, -1)
			then
				return F, Settings["Skill " .. F.Name .. " " .. V.ToolTip]
			end
		end
	end
end
function AutoAllSkill(V)
	local V, H, B, C, J =
		NameWeapon("Melee", true) or false,
		NameWeapon("Sword", true) or false,
		NameWeapon("Blox Fruit", true) or false,
		NameWeapon("Gun", true) or false,
		game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills
	if V and not J:FindFirstChild(V.Name) then
		equiptool(V.Name)
		return
	end
	if H and not J:FindFirstChild(H.Name) then
		equiptool(H.Name)
		return
	end
	if B and not J:FindFirstChild(B.Name) then
		equiptool(B.Name)
		return
	end
	if C and not J:FindFirstChild(C.Name) then
		equiptool(C.Name)
		return
	end
	J = (function() if V and (CheckCDSkillTransformation(V, Settings["Select Skills " .. V.ToolTip])) then return (CheckCDSkillTransformation(V, Settings["Select Skills " .. V.ToolTip])) else return (function() if H and (CheckCDSkillTransformation(H, Settings["Select Skills " .. H.ToolTip])) then return (CheckCDSkillTransformation(H, Settings["Select Skills " .. H.ToolTip])) else return (function() if C and (CheckCDSkillTransformation(C, Settings["Select Skills " .. C.ToolTip])) then return (CheckCDSkillTransformation(C, Settings["Select Skills " .. C.ToolTip])) else return (function() if B and (CheckCDSkillTransformation(B, Settings["Select Skills " .. B.ToolTip])) then return (CheckCDSkillTransformation(B, Settings["Select Skills " .. B.ToolTip])) else return nil end end)() end end)() end end)() end end)()
	if J then
		B = J.Parent.Name
		equiptool(B)
		if t.Character:FindFirstChild(B) then
			game:GetService("VirtualInputManager"):SendKeyEvent(true, J.Name, false, game)
			if Settings["Use skill fast dont hold"] then
				task.wait(0.05)
			else
				task.wait(HoldDelay(J.Name, B))
			end
			game:GetService("VirtualInputManager"):SendKeyEvent(false, J.Name, false, game)
		end
	end
end
local V, H =
	require(game:GetService("ReplicatedStorage"):WaitForChild("ItemReplicationService")),
	require(game:GetService("ReplicatedStorage"):WaitForChild("ItemConfig"))
local function B()
	local C, J = {}, require(game:GetService("ReplicatedStorage"):WaitForChild("ItemReplicationService")).KEYS
	for F, F in V:GetItems(J.QUANTITY) do
		if F.Value and F.Value > 0 then
			local q, c = pcall(function()
				return H.match(F.ItemId):unwrap()
			end)
			if q and c and c.Display then
				local H, q = c.Display.Category, c.Index and c.Index.StorageKey
				local D, r =
					(function() if H == "Blox Fruit" then return q or c.Display.Name or "ItemId_" .. F.ItemId else return c.Display.Name or q or "ItemId_" .. F.ItemId end end)(),
					V:ReadItem(J.MASTERY, F.ItemId, F.NetworkedUID) or 0
				table.insert(
					C,
					{ Name = D, Type = H, Count = F.Value, Mastery = r, ItemId = F.ItemId, UID = F.NetworkedUID }
				)
			end
		end
	end
	return C
end
do
	local V
	local H = 0
	function CheckItemInventory(C)
		if not V or tick() - H > 1 then
			V = {}
			for J, J in B() do
				V[J.Name] = true
			end
			H = tick()
		end
		return V[C] == true
	end
end
function DetectModelDestroyTyrant()
	local V, H, C =
		next,
		(workspace.Map:FindFirstChild("TikiOutpost") and (workspace.Map.TikiOutpost.IslandModel:FindFirstChild(
			"EagleBossArena",
			true
		))):GetChildren()
	for J, J in V, H, C do
		if J.Name == "Tree" and not J:GetAttribute("AlreadyDestroyedClient") then
			return J
		end
	end
end
(function()
	local V = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
	return {
		encode = function(H)
			return (H:gsub(".", function(C)
				local J, F = C:byte(), ""
				for C = 8, 1, -1 do
					F = F .. (J % 2 ^ C - J % 2 ^ (C - 1) > 0 and "1" or "0")
				end
				return F
			end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(C)
				if #C < 6 then
					return ""
				end
				local J = 0
				for F = 1, 6, 1 do
					J = J + (C:sub(F, F) == "1" and 2 ^ (6 - F) or 0)
				end
				return V:sub(J + 1, J + 1)
			end) .. ({ "", "==", "=" })[#H % 3 + 1]
		end,
		decode = function(H)
			return string
				.gsub(H, "[^" .. V .. "=]", "")
				:gsub(".", function(H)
					if H == "=" then
						return ""
					end
					local C, J = V:find(H) - 1, ""
					for V = 6, 1, -1 do
						J = J .. (C % 2 ^ V - C % 2 ^ (V - 1) > 0 and "1" or "0")
					end
					return J
				end)
				:gsub("%d%d%d?%d?%d?%d?%d?%d?", function(V)
					if #V ~= 8 then
						return ""
					end
					local H = 0
					for C = 1, 8, 1 do
						H = H + (V:sub(C, C) == "1" and 2 ^ (8 - C) or 0)
					end
					return string.char(H)
				end)
		end,
	}
end)()
local V = "https://raw.banana-hub.xyz/api"
local function H(C, J)
	local J
	local F, F = pcall(function()
		J =
			ExploitReq({ Url = ("%s/data/recent?name=%s&limit=%s"):format(V, C, 100):gsub(" ", "%%20"), Method = "GET" })
	end)
	if F then
		return false
	end
	return J.Body
end
local V
function SpecialHop(C)
	if getgenv().Key and #getgenv().Key == 32 then
		return
	end
	if V and tick() - V < 5 then
		return
	end
	local J, F = {}, H(C, 700)
	if not F then
		return
	end
	Servers = game:GetService("HttpService"):JSONDecode(F)
	for H, q in next, Servers.data, nil do
		if q and q.name == C then
			table.insert(J, H)
		end
	end
	V = tick()
	if #J > 0 then
		F = {}
		for V, V in next, Servers.data, nil do
			if V and V.name == C then
				local H, C, J, q, q = V.jobid, V.Players, V.placeid, f()
				H = (function() if string.find(H, "BananaCat") then return (q(H)) else return H end end)()
				if
					H
					and H ~= game.JobId
					and not table.find(F, H)
					and not CheckIsplayingRaid()
					and not Settings[H]
					and (C and C < game.Players.MaxPlayers or not V.Players)
					and (J and game.PlaceId == J or not J)
				then
					table.insert(F, H)
					game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport", tostring(H))
					SaveSettings(tostring(H), true)
					getgenv().limit_type("clearAll")
				end
			end
		end
	end
end
function FarmMethod()
	local f, V, H = Settings["Select Method Farm"]
	local C, J = 9999, 2
	if f == "Farm Katakuri" then
		C, V, H = 2275, y, "CakeQuest2"
	elseif f == "Farm Bones" then
		C, V, H = 2050, e, "HauntedQuest2"
	elseif f == "Farm Tyrant of the Skies" then
		C, V, H = 2575, Y, "TikiQuest3"
	else
		V = ((f == "Aura Farm" and (DetectMobAura())) and { DetectMobAura() } or V)
	end
	if Settings["Farm Material"] then
		V = NameMaterials[Settings["Select Material"]]
		if not NameWorldMaterials[Settings["Select Material"]][game.PlaceId] then
			f = NameWorldMaterials[Settings["Select Material"]][getgenv().CheckPlaceId2]
				or NameWorldMaterials[Settings["Select Material"]][getgenv().CheckPlaceId3]
				or NameWorldMaterials[Settings["Select Material"]][getgenv().CheckPlaceId]
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(f)
			return
		end
	end
	if V == nil and HasQuest() then
		f = GetCurrentQuestMob()
		if not f then
			task.wait(0.2)
			return
		end
	else
		f = V or (GetNameDoubleQuest()) or (GetLevelQuestMob and GetLevelQuestMob()) or ""
	end
	if getgenv().DebugFarmLevel then
		print(("[FarmMethod] HasQuest=%s f=%s"):format(tostring(HasQuest()), tostring(f)))
	end
	if not HasQuest() and typeof(f) == "string" then
		TakeQuestLevel()
	else
		if
			Settings["Auto Quest [Katakuri/Bone/Tyrant]"]
			and t.Data.Level.Value >= C
			and not HasQuest()
		then
			QuestBoneAndkatakuri(H, J)
			return
		end
		if not Settings["Farm Material"] and Settings["Select Method Farm"] == "Farm Tyrant of the Skies" then
			if CheckNameBoss("Tyrant of the Skies") then
				V = CheckNameBoss("Tyrant of the Skies")
				repeat
					task.wait()
					getgenv().BuddhaBossGuard()
					sizepart(V)
					if
						game:GetService("Players").LocalPlayer.PlayerGui.TransformationHUD.ImageLabel.Visible
						and (Settings["Auto Finish Train Quest"] or Settings["Auto Finish Train Draco Quest"])
					then
						toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
					elseif Settings["Select Weapon"] == "Blox Fruit" then
						toTarget(getgenv().FruitFarmCF(V))
					else
						toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
					end
					UsedualFlock()
					ClickM1(V)
				until not IsMobAlive(V) or not IsFarmOn() or not StackFarm
				return
			else
				local V = workspace:FindFirstChild("Map", true)
					and (workspace.Map:FindFirstChild("TikiOutpost", true))
					and (workspace.Map.TikiOutpost:FindFirstChild("IslandModel", true))
				if V then
					local Y, H, C, J =
						V:FindFirstChild("Eye1", true),
						V:FindFirstChild("Eye2", true),
						V:FindFirstChild("Eye3", true),
						V:FindFirstChild("Eye4", true)
					if
						Y
						and H
						and C
						and J
						and Y.Transparency == 0
						and H.Transparency == 0
						and C.Transparency == 0
						and J.Transparency == 0
					then
						local V = DetectModelDestroyTyrant()
						if V then
							if t:DistanceFromCharacter(V.WorldPivot.Position) > 10 then
								toTarget(V.WorldPivot)
							elseif CheckItemInventory("Skull Guitar") then
								if not NameWeapon("Gun") or NameWeapon("Gun") ~= "Skull Guitar" then
									game:GetService("ReplicatedStorage").Remotes.CommF_
										:InvokeServer(unpack({ [1] = "LoadItem", [2] = "Skull Guitar" }))
								else
									equiptool(NameWeapon("Gun"))
									getgenv().ClickWorldPos(V.WorldPivot.Position)
								end
							else
								getgenv().AimPos = V.WorldPivot
								AutoAllSkill()
							end
						end
						return
					end
				end
			end
		end
		if
			not Settings["Farm Material"]
			and Settings["Select Method Farm"] == "Farm Katakuri"
			and not Settings["Ignore Attack Katakuri"]
		then
			if CheckNameBoss("Cake Prince") then
				local V = CheckNameBoss("Cake Prince")
				getgenv().BuddhaBossGuard()

				local mirror = workspace.Map:FindFirstChild("CakeLoaf")
					and workspace.Map.CakeLoaf:FindFirstChild("BigMirror")
					and workspace.Map.CakeLoaf.BigMirror:FindFirstChild("Main")
				local root = t.Character and t.Character:FindFirstChild("HumanoidRootPart")

				if mirror and root and root.Position.Y <= 4000 then
					repeat
						repeat
							task.wait()
							getgenv().BuddhaBossGuard()
							root = t.Character and t.Character:FindFirstChild("HumanoidRootPart")
							if not root then
								break
							end
							toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
						until (mirror.Position - root.Position).Magnitude <= 20
							or root.Position.Y > 4000
							or not IsMobAlive(V)
							or not IsFarmOn()
							or not StackFarm
						task.wait(1.5)
						root = t.Character and t.Character:FindFirstChild("HumanoidRootPart")
					until not root
						or root.Position.Y > 4000
						or not IsMobAlive(V)
						or not IsFarmOn()
						or not StackFarm
				end

				repeat
					task.wait()
					getgenv().BuddhaBossGuard()
					sizepart(V)
					if
						game:GetService("Players").LocalPlayer.PlayerGui.TransformationHUD.ImageLabel.Visible
						and (Settings["Auto Finish Train Quest"] or Settings["Auto Finish Train Draco Quest"])
					then
						toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
					elseif Settings["Select Weapon"] == "Blox Fruit" then
						toTarget(getgenv().FruitFarmCF(V))
					else
						toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
					end
					UsedualFlock()
					ClickM1(V)
				until not IsMobAlive(V) or not IsFarmOn() or not StackFarm
				return
			else
				spawn(function()
					if Settings["Hop Find Katakuri"] then
						SpecialHop("Cake Prince")
					end
				end)
			end
		end
		local V = DetectMob(f)
		if not V then
			if typeof(f) == "table" then
				if #N >= #f then
					N = {}
					return
				end
				local Y = DetectNameTablePart(f)
				local H = DetectPartSpawnMob(Y)
				if H then
					table.insert(N, Y)
					repeat
						task.wait()
						toTarget(H.CFrame * CFrame.new(0, 60, 0))
					until (H.Position - t.Character.HumanoidRootPart.Position).Magnitude <= 100
						or (DetectMob(f))
						or not IsFarmOn()
						or not StackFarm
					wait(1)
				end
			else
				local Y = DetectPartSpawnMob(f, true)
				if Y then
					Instance.new("IntValue", Y).Name = "Ignored"
					repeat
						task.wait()
						toTarget(Y.CFrame * CFrame.new(0, 60, 0))
					until (Y.Position - t.Character.HumanoidRootPart.Position).Magnitude <= 100
						or (DetectMob(f))
						or not IsFarmOn()
						or not StackFarm
					wait(1)
				else
					DeleteIgnoredMobSpawn()
				end
			end
		else
			repeat
				task.wait()
				sizepart(V)
				BringMob(V)
				FarmMastery(V)
				ClickM1(V)
				if
					game:GetService("Players").LocalPlayer.PlayerGui.TransformationHUD.ImageLabel.Visible
					and (Settings["Auto Finish Train Quest"] or Settings["Auto Finish Train Draco Quest"])
				then
					toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
				elseif Settings["Select Weapon"] == "Blox Fruit" then
					toTarget(getgenv().FruitFarmCF(V))
				else
					toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
				end
			until not IsMobAlive(V) or not IsFarmOn() or not StackFarm
			if getgenv().QuestTrainer and getgenv().QuestTrainer.CountKillMob then
				getgenv().QuestTrainer.CountKillMob = getgenv().QuestTrainer.CountKillMob + 1
			end
		end
	end
end
spawn(function()
	while task.wait() do
		local f, f = pcall(function()
			if IsFarmOn() and StackFarm then
				getgenv().FarmingTabActive = true
				FarmMethod()
			end
		end)
		getgenv().FarmingTabActive = false
		if f then
			print(f)
		end
	end
end)

AutoWorldSection = Tabs.MainFarm:AddSection("Auto World")
AutoWorldSection:CreateToggle(
	{ Title = "Auto New World", Desc = nil, Default = Settings["Auto New World"] or false },
	function(f)
		SaveSettings("Auto New World", f)
	end
)
AutoWorldSection:CreateToggle(
	{ Title = "Auto Third World", Desc = nil, Default = Settings["Auto Third World"] or false },
	function(f)
		SaveSettings("Auto Third World", f)
	end
)
getgenv().GetTime = nil
NotiGetTime = true
function timeToSeconds(f)
	local V, Y, H = f:match("^(%d+):(%d+):(%d+)$")
	if not V then
		Y, H = f:match("^(%d+):(%d+)$")
		V = 0
	end
	return tonumber(V) * 3600 + tonumber(Y) * 60 + tonumber(H)
end
function secondsToTime(f)
	local V, Y, H = math.floor(f / 3600), math.floor(f % 3600 / 60), f % 60
	return string.format("%d:%02d:%02d", V, Y, H)
end
function DetectPresent()
	for f, f in t.Backpack:GetChildren() do
		if string.find(f.Name, "Holiday Gift") then
			return f
		end
	end
	for f, f in t.Character:GetChildren() do
		if string.find(f.Name, "Holiday Gift") then
			return f
		end
	end
end
function DetectPresentStore()
	for f, f in t.Backpack:GetChildren() do
		if string.find(f.Name, "Holiday Gift") and not f:FindFirstChild("Ignored") then
			return f
		end
	end
	for f, f in t.Character:GetChildren() do
		if string.find(f.Name, "Holiday Gift") and not f:FindFirstChild("Ignored") then
			return f
		end
	end
end
function GetCountDownTime()
	if not getgenv().GetTime and not game.workspace:FindFirstChild("Countdown") then
		return "Go Get Time"
	end
	if workspace:FindFirstChild("Countdown") and (workspace.Countdown.SurfaceGui.TextLabel.Text:find("START")) then
		return 0
	end
	local f = workspace:FindFirstChild("Countdown") and workspace.Countdown.SurfaceGui.TextLabel.Text
		or (secondsToTime(getgenv().GetTime))
	if tonumber(f:split(":")[1]) == 0 then
		return tonumber(f:split(":")[2])
	else
		return 55
	end
end
function getGift()
	if not workspace._WorldOrigin:FindFirstChild("Present") then
		return
	end
	for f, f in pairs(workspace._WorldOrigin:GetChildren()) do
		if
			f.Name == "Present"
			and (f:FindFirstChild("Highlight"))
			and (f:FindFirstChild("Box"))
			and (f.Box:FindFirstChild("ProximityPrompt"))
		then
			return f
		end
	end
end
StackDevilFruitSection = Tabs.MainFarm:AddSection("Devil Fruit")
StackDevilFruitSection:CreateToggle(
	{
		Title = "Collect Chest When Server Spawn\10God's Chalice or Fist of Darkness",
		Desc = nil,
		Default = Settings["Collect Chest When Server Spawn God's Chalice or Fist of Darkness"] or false,
	},
	function(f)
		SaveSettings("Collect Chest When Server Spawn God's Chalice or Fist of Darkness", f)
	end
)
StackDevilFruitSection:CreateToggle(
	{ Title = "Teleport To Fruit", Desc = nil, Default = Settings["Teleport To Fruit"] or false },
	function(f)
		SaveSettings("Teleport To Fruit", f)
	end
)
StackDevilFruitSection:CreateToggle(
	{
		Title = "Teleport To Fruit [ Hop Server ]",
		Desc = nil,
		Default = Settings["Teleport To Fruit [ Hop Server ]"] or false,
	},
	function(f)
		SaveSettings("Teleport To Fruit [ Hop Server ]", f)
	end
)
EventGameSection = Tabs.MainFarm:AddSection("Event Game")
EventGameSection:CreateToggle(
	{ Title = "Auto Factory", Desc = nil, Default = Settings["Auto Factory"] or false },
	function(f)
		SaveSettings("Auto Factory", f)
	end
)
EventGameSection:CreateToggle(
	{ Title = "Auto Pirate Raid", Desc = nil, Default = Settings["Auto Pirate Raid"] or false },
	function(f)
		SaveSettings("Auto Pirate Raid", f)
	end
)
BossRipIndraSection = Tabs.MainFarm:AddSection("Boss Rip Indra")
BossRipIndraSection:CreateToggle(
	{ Title = "Auto Elite Hunter", Desc = nil, Default = Settings["Auto Elite Hunter"] or false },
	function(f)
		SaveSettings("Auto Elite Hunter", f)
	end
)
BossRipIndraSection:CreateToggle(
	{
		Title = 'Hop Server Elite Hunter"',
		Desc = "Hop if u have God chalice and teleport in safezone",
		Default = Settings["Hop Server Elite Hunter"] or false,
	},
	function(f)
		SaveSettings("Hop Server Elite Hunter", f)
	end
)
BossRipIndraSection:CreateToggle(
	{ Title = "Auto Touch Pad Haki", Desc = nil, Default = Settings["Auto Touch Pad Haki"] or false },
	function(f)
		SaveSettings("Auto Touch Pad Haki", f)
	end
)
BossRipIndraSection:CreateToggle(
	{ Title = "Auto Summon Rip Indra", Desc = nil, Default = Settings["Auto Summon Rip Indra"] or false },
	function(f)
		SaveSettings("Auto Summon Rip Indra", f)
	end
)
BossRipIndraSection:CreateToggle(
	{ Title = "Attack Rip Indra", Desc = nil, Default = Settings["Attack Rip Indra"] or false },
	function(f)
		SaveSettings("Attack Rip Indra", f)
	end
)
BossSoulReaperSection = Tabs.MainFarm:AddSection("Boss Soul Reaper")
BossSoulReaperSection:CreateToggle(
	{ Title = "Attack Soul Reaper", Desc = nil, Default = Settings["Attack Soul Reaper"] or false },
	function(f)
		SaveSettings("Attack Soul Reaper", f)
	end
)
BossSoulReaperSection:CreateToggle(
	{ Title = "Summon Soul Reaper", Desc = nil, Default = Settings["Summon Soul Reaper"] or false },
	function(f)
		if f and not Settings["Attack Soul Reaper"] then
			A.CreateNoti({ Title = "Banana Cat Hub", Desc = "Turn On Attack Soul Reaper Plz", ShowTime = 5 })
		end
		SaveSettings("Summon Soul Reaper", f)
	end
)
BossDoughKingSection = Tabs.MainFarm:AddSection("Boss Dough King")
BossDoughKingSection:CreateToggle(
	{ Title = "Attack Dough King", Desc = nil, Default = Settings["Attack Dough King"] or false },
	function(f)
		SaveSettings("Attack Dough King", f)
	end
)
BossDoughKingSection:CreateToggle(
	{ Title = "Summon Dough King", Desc = nil, Default = Settings["Summon Dough King"] or false },
	function(f)
		if f and not Settings["Attack Dough King"] then
			A.CreateNoti({ Title = "Banana Cat Hub", Desc = "Turn On Attack Dough King Plz", ShowTime = 5 })
		end
		if f then
			spawn(function()
				while Settings["Summon Dough King"] and (task.wait()) do
					if DetectItemPlr("Sweet Chalice") then
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner")
					end
				end
			end)
		end
		SaveSettings("Summon Dough King", f)
	end
)
BossDoughKingSection:CreateToggle(
	{ Title = "Hop Find Dough King", Desc = nil, Default = Settings["Hop Find Dough King"] or false },
	function(f)
		if f and not Settings["Attack Dough King"] then
			A.CreateNoti({ Title = "Banana Cat Hub", Desc = "Turn On Attack Dough King Plz", ShowTime = 5 })
		end
		SaveSettings("Hop Find Dough King", f)
	end
)
BossDarkbeardSection = Tabs.MainFarm:AddSection("Boss Darkbeard")
BossDarkbeardSection:CreateToggle(
	{ Title = "Attack Darkbeard", Desc = nil, Default = Settings["Attack Darkbeard"] or false },
	function(f)
		SaveSettings("Attack Darkbeard", f)
	end
)
BossDarkbeardSection:CreateToggle(
	{ Title = "Summon Darkbeard", Desc = nil, Default = Settings["Summon Darkbeard"] or false },
	function(f)
		if f and not Settings["Attack Darkbeard"] then
			A.CreateNoti({ Title = "Banana Cat Hub", Desc = "Turn On Attack Darkbeard Plz", ShowTime = 5 })
		end
		SaveSettings("Summon Darkbeard", f)
	end
)
BossDarkbeardSection:CreateToggle(
	{ Title = "Hop Find Darkbeard", Desc = nil, Default = Settings["Hop Find Darkbeard"] or false },
	function(f)
		if f and not Settings["Attack Darkbeard"] then
			A.CreateNoti({ Title = "Banana Cat Hub", Desc = "Turn On Attack Darkbeard Plz", ShowTime = 5 })
		end
		SaveSettings("Hop Find Darkbeard", f)
	end
)
function GetPathFruit()
	local f, V, Y = next, game.Workspace:GetChildren()
	for H, H in f, V, Y do
		if (H:IsA("Tool") or (H:IsA("Model"))) and (string.find(H.Name, "Fruit")) and (H:FindFirstChild("Handle")) then
			return H
		end
	end
end
function GetPirateRaid(f)
	for V, V in ipairs(((function() if f then return game.ReplicatedStorage else return game.workspace.Enemies end end)()):GetChildren()) do
		if
			V:IsA("Model")
			and V.Name ~= "Oni2"
			and not string.find(V.Name, "Boss")
			and not string.find(V.Name, "Friend")
			and not string.find(V.Name, "Wraith")
			and V.Name ~= "rip_indra True Form"
			and (IsMobAlive(V))
			and (V.HumanoidRootPart.Position - Vector3.new(-5543, 313, -2964)).magnitude < 1000
		then
			return V
		end
	end
end
function DetectButtons()
	local f, V, Y = next, game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren()
	for H, H in f, V, Y do
		if H:IsA("Part") and H.Part.BrickColor.Name ~= "Lime green" then
			return H
		end
	end
end
local f = { "Winter Sky", "Pure Red", "Snow White" }
function IsMisisngLegHaki(V)
	V = V and {}
	local Y
	for H, H in pairs(CommF:InvokeServer("getColors")) do
		if table.find(f, H.HiddenName) and not H.Unlocked then
			if V then
				table.insert(V, H.HiddenName)
			else
				Y = (function() if not Y then return H.HiddenName else return Y .. ", " .. H.HiddenName end end)()
			end
		end
	end
	if V then
		return V
	end
	return Y
end
function TouchPadHaki()
	local f = DetectButtons()
	if f then
		if f.BrickColor.Name == "Hot pink" then
			game:GetService("ReplicatedStorage").Modules.Net
				:FindFirstChild("RF/FruitCustomizerRF")
				:InvokeServer(unpack({ [1] = { StorageName = "Winter Sky", Type = "AuraSkin", Context = "Equip" } }))
			toTarget(f.CFrame)
			wait(2)
		elseif f.BrickColor.Name == "Really red" then
			game:GetService("ReplicatedStorage").Modules.Net
				:FindFirstChild("RF/FruitCustomizerRF")
				:InvokeServer(unpack({ [1] = { StorageName = "Pure Red", Type = "AuraSkin", Context = "Equip" } }))
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Pure Red")
			toTarget(f.CFrame)
			wait(2)
		elseif f.BrickColor.Name == "Oyster" then
			game:GetService("ReplicatedStorage").Modules.Net
				:FindFirstChild("RF/FruitCustomizerRF")
				:InvokeServer(unpack({ [1] = { StorageName = "Snow White", Type = "AuraSkin", Context = "Equip" } }))
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor", "Snow White")
			toTarget(f.CFrame)
			wait(2)
		end
	end
end
getgenv().CheckCountItem = function(f, V)
	local Y, H, C = next, B()
	for J, J in Y, H, C do
		if J.Name == f and J.Count and J.Count >= V then
			return true
		end
	end
	return false
end
function getbackpack()
	mybackpack = {}
	local f, V, Y = next, game.Players.LocalPlayer.Backpack:GetChildren()
	for H, H in f, V, Y do
		if H:IsA("Tool") and (table.find(whitelistedfruit, H.Name)) then
			table.insert(mybackpack, H.Name)
		end
	end
	f, Y, V = next, game.Players.LocalPlayer.Character:GetChildren()
	for H, H in f, Y, V do
		if H:IsA("Tool") and (table.find(whitelistedfruit, H.Name)) then
			table.insert(mybackpack, H.Name)
		end
	end
	return mybackpack
end
function CheckFruitplr()
	local f
	for V, V in pairs(t.Backpack:GetChildren()) do
		f = (function() if string.find(V.Name, "Fruit") then return V.Name else return f end end)()
	end
	for V, V in pairs(t.Character:GetChildren()) do
		f = (function() if string.find(V.Name, "Fruit") then return V.Name else return f end end)()
	end
	return f
end
function TakeFruitInventory(f)
	local V, Y, H = next, B()
	local C, J = 1 / 0
	for F, F in V, Y, H do
		if F.Type == "Blox Fruit" then
			if not f then
				for f, V in pairs(getgenv().tablefruitausea3) do
					if F.Name == f then
						if tonumber(V) < tonumber(C) then
							C, J = V, f
						end
					end
				end
			elseif not getgenv().tablefruitausea3[F.Name] then
				return F.Name
			end
		end
	end
	return J
end
cframethangdaubuoiredhead = CFrame.new(
	-1926.78772,
	12.1678171,
	1739.80884,
	0.956294656,
	-0.0,
	-0.292404652,
	0,
	1,
	-0.0,
	0.292404652,
	0,
	0.956294656
)
function StopThirdSea()
	if game.PlaceId == getgenv().CheckPlaceId2 and t.Data.Level.Value >= 1500 then
		if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 then
			if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 then
				if #getbackpack() >= 1 then
					return true
				elseif not CheckFruitplr() and (TakeFruitInventory()) then
					StopStoreFruit = true
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", TakeFruitInventory())
				end
			elseif not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") then
				if CheckNameBoss("Don Swan") then
					return true
				end
			elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
				return true
			end
		else
			return true
		end
	end
end
function checkplatebarito()
	return ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1.BrickColor
			== BrickColor.new("Sand yellow")) and "Plate1" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2.BrickColor
				== BrickColor.new("Sand yellow")) and "Plate2" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3.BrickColor
					== BrickColor.new("Sand yellow")) and "Plate3" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4.BrickColor
						== BrickColor.new("Sand yellow")) and "Plate4" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5.BrickColor
							== BrickColor.new("Sand yellow")) and "Plate5" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6.BrickColor
								== BrickColor.new("Sand yellow")) and "Plate6" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7.BrickColor
									== BrickColor.new("Sand yellow")) and "Plate7" or ((game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8.BrickColor
										== BrickColor.new("Sand yellow")) and "Plate8" or nil))))))))
end
function AutoQuestBarito()
	if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
		if
			QuestHas("Swan Pirates")
			and (QuestHas("50"))
			and HasQuest()
		then
			local f, V = "Swan Pirate", DetectMob("Swan Pirate")
			if not V then
				if typeof(f) == "table" then
					if #N >= 11 then
						N = {}
						return
					end
					local Y = DetectPartSpawnMob(DetectNameTablePart(f))
					if Y then
						table.insert(N, DetectNameTablePart(f))
						repeat
							wait()
							toTarget(Y.CFrame * CFrame.new(0, 60, 0))
						until (Y.Position - t.Character.HumanoidRootPart.Position).Magnitude <= 100 or (DetectMob(f))
						wait(1)
					end
				else
					local Y = DetectPartSpawnMob(f, true)
					if Y then
						Instance.new("IntValue", Y).Name = "Ignored"
						repeat
							wait()
							toTarget(Y.CFrame * CFrame.new(0, 60, 0))
						until (Y.Position - t.Character.HumanoidRootPart.Position).Magnitude <= 100 or (DetectMob(f))
						wait(1)
					else
						DeleteIgnoredMobSpawn()
					end
				end
			else
				repeat
					task.wait()
					sizepart(V)
					BringMob(V)
					UsedualFlock()
					ClickM1(V)
					if Settings["Select Weapon"] == "Blox Fruit" then
						toTarget(getgenv().FruitFarmCF(V))
					else
						toTarget(V.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
					end
				until not IsMobAlive(V)
			end
		elseif
			(t.Character.HumanoidRootPart.Position - CFrame.new(-456.28952, 73.0200958, 299.895966).Position).Magnitude
			> 8
		then
			toTarget(CFrame.new(-456.28952, 73.0200958, 299.895966))
		else
			game:GetService("ReplicatedStorage").Remotes.CommF_
				:InvokeServer(unpack({ [1] = "StartQuest", [2] = "BartiloQuest", [3] = 1 }))
		end
	elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 then
		local f = CheckNameBoss("Jeremy")
		if f then
			repeat
				task.wait()
				sizepart(f)
				UsedualFlock()
				ClickM1(f)
				if Settings["Select Weapon"] == "Blox Fruit" then
					toTarget(getgenv().FruitFarmCF(f))
				else
					toTarget(f.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
				end
			until not IsMobAlive(f)
		end
	elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
		repeat
			task.wait()
			if (t.Character.HumanoidRootPart.Position - Vector3.new(-1835.65, 10.4325, 1679.75)).Magnitude > 100 then
				toTarget(CFrame.new(-1835.65, 10.4325, 1679.75))
			else
				t.Character.HumanoidRootPart.CFrame =
					game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()].CFrame
				task.wait()
				firetouchinterest(
					game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()],
					game.Players.LocalPlayer.Character.HumanoidRootPart,
					0
				)
				firetouchinterest(
					game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()],
					game.Players.LocalPlayer.Character.HumanoidRootPart,
					1
				)
			end
		until game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3
	end
end
function SeaThird()
	if
		game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") == 0
		and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1
		and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0
	then
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
	end
	if game.PlaceId == getgenv().CheckPlaceId2 and t.Data.Level.Value >= 1500 then
		if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 then
			if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 then
				if #getbackpack() >= 1 then
					toTarget(CFrame.new(-339.79840087891, 331.86065673828, 643.83178710938))
					if
						(
							Vector3.new(-339.79840087891, 331.86065673828, 643.83178710938)
							- t.Character.HumanoidRootPart.Position
						).Magnitude <= 5
					then
						if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 1 then
							local f, V, Y = next, getbackpack()
							for H, H in f, V, Y do
								t.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(H))
							end
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "1")
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "2")
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "3")
						end
					end
				elseif not CheckFruitplr() and (TakeFruitInventory()) then
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", TakeFruitInventory())
				end
			elseif
				game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") == 0
				and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1
				and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0
			then
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
			elseif not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") then
				if CheckNameBoss("Don Swan") then
					local f = CheckNameBoss("Don Swan")
					repeat
						task.wait()
						sizepart(f)
						if Settings["Select Weapon"] == "Blox Fruit" then
							toTarget(getgenv().FruitFarmCF(f))
						else
							toTarget(f.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
						end
						UsedualFlock()
						ClickM1(f)
					until not f or not f.Parent or f.Humanoid.Health == 0
				end
			elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
				if
					(t.Character.HumanoidRootPart.Position - game:GetService("Workspace").Map.IndraIsland.Part.Position).Magnitude
					> 1000
				then
					toTarget(cframethangdaubuoiredhead)
					if (cframethangdaubuoiredhead.p - t.Character.HumanoidRootPart.Position).Magnitude <= 5 then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress", "Begin")
					end
				else
					local f, V, Y = next, workspace.Enemies:GetChildren()
					for H, H in f, V, Y do
						if
							H.Name == "rip_indra"
							and (H:FindFirstChild("HumanoidRootPart"))
							and (H:FindFirstChild("Humanoid"))
							and H.Humanoid.Health > 0
						then
							if
								(H.HumanoidRootPart.Position - t.Character.HumanoidRootPart.Position).Magnitude > 300
							then
								toTarget(H.HumanoidRootPart.CFrame)
							else
								repeat
									task.wait()
									sizepart(H)
									if Settings["Select Weapon"] == "Blox Fruit" then
										toTarget(getgenv().FruitFarmCF(H))
									else
										toTarget(H.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
									end
									ClickM1(H)
									UsedualFlock()
								until not workspace.Enemies:FindFirstChild("rip_indra")
							end
						end
					end
				end
			end
		else
			AutoQuestBarito()
		end
	end
end
local f = 0
function PathFindChest()
	local V, Y, H = next, game:GetService("Workspace")._WorldOrigin.PlayerSpawns.Pirates:GetChildren()
	for C, C in V, Y, H do
		if C:IsA("Model") and (C:FindFirstChild("Part")) and not C:FindFirstChild("Ignored") then
			return C
		end
	end
end
function GetNearestChest()
	local V, Y, H = next, game:GetService("CollectionService"):GetTagged("_ChestTagged")
	local C, J, F = 1 / 0
	for q, c in V, Y, H do
		if not c:GetAttribute("IsDisabled") and not c:FindFirstChild("Ignored") then
			q = t:DistanceFromCharacter(c.Position)
			if q < C then
				C, J, F = q, i, c
			end
		end
	end
	return F
end
getgenv().DetectRaidCastle = false
getgenv().ValueCollectChestSpawnGod = 0
task.spawn(function()
	while task.wait() do
		local V, V = pcall(function()
			if Settings["Auto New World"] then
				if game.PlaceId == getgenv().CheckPlaceId3 and t.Data.Level.Value >= 700 then
					StackFarm = false
					StackFarmOther = false
					BananaOwner("Auto New World")
					if
						game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0
					then
						if game.Workspace.Map.Ice.Door.CanCollide then
							if not t.Character:FindFirstChild("Key") and not t.Backpack:FindFirstChild("Key") then
								if
									(
										CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359).Position
										- t.Character.HumanoidRootPart.Position
									).magnitude < 5
								then
									game.ReplicatedStorage.Remotes.CommF_:InvokeServer(
										"DressrosaQuestProgress",
										"Detective"
									)
									equiptool("Key")
								else
									toTarget(CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359))
								end
							else
								equiptool("Key")
								if t.Character:FindFirstChild("Key") then
									toTarget(game.Workspace.Map.Ice.Door.CFrame)
								end
							end
						elseif CheckNameBoss("Ice Admiral") then
							local Y = CheckNameBoss("Ice Admiral")
							repeat
								task.wait()
								sizepart(Y)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(getgenv().FruitFarmCF(Y))
								else
									toTarget(Y.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
								end
								ClickM1(Y)
								UsedualFlock()
							until not Y or not Y.Parent or Y.Humanoid.Health == 0 or not Settings["Auto New World"]
						end
					else
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
					end
					return
				end
			end
			if
				Settings["Collect Chest When Server Spawn God's Chalice or Fist of Darkness"]
				and getgenv().GoCollectChest
			then
				StackFarm = false
				StackFarmOther = false
				BananaOwner("Collect Chest When Server Spawn God's Chalice or Fist of Darkness")
				if getgenv().ValueCollectChestSpawnGod >= 10 then
					getgenv().GoCollectChest = false
					getgenv().ValueCollectChestSpawnGod = 0
				end
				local Y = GetNearestChest()
				if Y then
					getgenv().ValueCollectChestSpawnGod = getgenv().ValueCollectChestSpawnGod + 1
					local H
					repeat
						task.wait()
						if
							(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Y.Position).Magnitude <= 5
						then
							if not H then
								H = (tick())
							elseif tick() - H >= 5 then
								Instance.new("IntValue", Y).Name = "Ignored"
								wait(0.1)
							end
							if not Settings["Use Method Teleport"] then
								game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, game)
								wait()
								game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, game)
							end
							TweenManager.CancelCurrent()
						end
						if Settings["Use Method Teleport"] then
							t.Character.HumanoidRootPart.CFrame = Y.CFrame
							TweenManager.CancelCurrent()
						else
							toTarget(Y.CFrame, true)
						end
					until not Y
						or not Y.Parent
						or not Settings["Collect Chest When Server Spawn God's Chalice or Fist of Darkness"]
						or (Y:GetAttribute("IsDisabled"))
						or (Y:FindFirstChild("Ignored"))
						or not Y:FindFirstChild("TouchInterest")
					return
				else
					local Y = PathFindChest()
					if Y then
						toTarget(Y.Part.CFrame)
						if
							(Y.Part.Position - t.Character.HumanoidRootPart.Position).Magnitude <= 100
							or (GetNearestChest())
						then
							Instance.new("IntValue", Y).Name = "Ignored"
						end
					else
						for Y, Y in pairs(game:GetService("Workspace")._WorldOrigin.PlayerSpawns.Pirates:GetChildren()) do
							if Y:FindFirstChild("Ignored") then
								Y:FindFirstChild("Ignored"):Destroy()
							end
						end
					end
				end
			end
			if game.PlaceId == getgenv().CheckPlaceId2 and Settings["Auto Third World"] then
				if StopThirdSea() then
					StackFarm = false
					StackFarmOther = false
					BananaOwner("Auto Third World")
					SeaThird()
					return
				end
			end
			if Settings["Attack Darkbeard"] then
				local Y = CheckNameBoss("Darkbeard")
				if Y then
					StackFarm = false
					StackFarmOther = false
					BananaOwner("Attack Darkbeard")
					repeat
						task.wait()
						sizepart(Y)
						if Settings["Select Weapon"] == "Blox Fruit" then
							toTarget(getgenv().FruitFarmCF(Y))
						else
							toTarget(Y.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
						end
						ClickM1(Y)
						UsedualFlock()
					until not IsMobAlive(Y) or not Settings["Attack Darkbeard"]
					return
				else
					if Settings["Summon Darkbeard"] and (DetectItemPlr("Fist of Darkness")) then
						StackFarm = false
						StackFarmOther = false
						BananaOwner("Summon Darkbeard")
						if
							(
								game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection.Position
								- t.Character.HumanoidRootPart.Position
							).Magnitude <= 5
						then
							equiptool("Fist of Darkness")
							firetouchinterest(
								game.Players.LocalPlayer.Character["Fist of Darkness"].Handle,
								game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
								0
							)
							firetouchinterest(
								game.Players.LocalPlayer.Character["Fist of Darkness"].Handle,
								game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
								1
							)
							firetouchinterest(
								t.Character.HumanoidRootPart,
								game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
								0
							)
							firetouchinterest(
								t.Character.HumanoidRootPart,
								game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection,
								1
							)
						else
							toTarget(game:GetService("Workspace").Map.DarkbeardArena.Summoner.Detection.CFrame)
						end
						return
					end
					spawn(function()
						if Settings["Hop Find Darkbeard"] then
							SpecialHop("Darkbeard")
						end
					end)
				end
			end
			if Settings["Attack Rip Indra"] then
				local Y = CheckNameBoss("rip_indra True Form")
				if Y then
					StackFarm = false
					StackFarmOther = false
					BananaOwner("Attack Rip Indra")
					repeat
						task.wait()
						sizepart(Y)
						if Settings["Select Weapon"] == "Blox Fruit" then
							toTarget(getgenv().FruitFarmCF(Y))
						else
							toTarget(Y.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
						end
						ClickM1(Y)
						UsedualFlock()
					until not IsMobAlive(Y) or not Settings["Attack Rip Indra"]
					return
				end
			end
			if Settings["Auto Touch Pad Haki"] and Settings["Auto Summon Rip Indra"] then
				if DetectItemPlr("God's Chalice") then
					StackFarm = false
					StackFarmOther = false
					BananaOwner("Auto Touch Pad Haki")
					if
						not game:GetService("Workspace").Map:FindFirstChild("Boat Castle")
						or not game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle
							:FindFirstChildOfClass("Part")
					then
						toTarget(CFrame.new(-5500, 314, -2855))
						return
					end
					if DetectButtons() then
						TouchPadHaki()
						return
					elseif not DetectButtons() then
						equiptool("God's Chalice")
						toTarget(game:GetService("Workspace").Map["Boat Castle"].Summoner.Detection.CFrame)
						return
					end
				end
			elseif Settings["Auto Touch Pad Haki"] then
				StackFarm = false
				StackFarmOther = false
				BananaOwner("Auto Touch Pad Haki")
				if
					not game:GetService("Workspace").Map:FindFirstChild("Boat Castle")
					or not game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:FindFirstChildOfClass("Part")
				then
					toTarget(CFrame.new(-5500, 314, -2855))
					return
				end
				if DetectButtons() then
					TouchPadHaki()
				end
				return
			elseif Settings["Auto Summon Rip Indra"] and (DetectItemPlr("God's Chalice")) then
				StackFarm = false
				StackFarmOther = false
				BananaOwner("Auto Summon Rip Indra")
				if
					not game:GetService("Workspace").Map:FindFirstChild("Boat Castle")
					or not game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:FindFirstChildOfClass("Part")
				then
					toTarget(CFrame.new(-5500, 314, -2855))
					return
				end
				equiptool("God's Chalice")
				toTarget(game:GetService("Workspace").Map["Boat Castle"].Summoner.Detection.CFrame)
				return
			end
			if Settings["Attack Soul Reaper"] then
				local Y = CheckNameBoss("Soul Reaper")
				if Y then
					StackFarm = false
					StackFarmOther = false
					BananaOwner("Attack Soul Reaper")
					repeat
						task.wait()
						sizepart(Y)
						if Settings["Select Weapon"] == "Blox Fruit" then
							toTarget(getgenv().FruitFarmCF(Y))
						else
							toTarget(Y.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
						end
						ClickM1(Y)
						UsedualFlock()
					until not IsMobAlive(Y) or not Settings["Attack Soul Reaper"]
					return
				else
					StackFarm = false
					StackFarmOther = false
					BananaOwner(Settings["Summon Soul Reaper"] and "Summon Soul Reaper" or "Attack Soul Reaper")
					if Settings["Summon Soul Reaper"] and (DetectItemPlr("Hallow Essence")) then
						if
							not game:GetService("Workspace").Map:FindFirstChild("Haunted Castle")
							or not game:GetService("Workspace").Map["Haunted Castle"].Summoner
								:FindFirstChild("Detection")
						then
							toTarget((CFrame.new(-9513.466796875, 142.09776306152344, 5528.83740234375)))
							return
						end
						if
							(
								t.Character.HumanoidRootPart.Position
								- game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.Position
							).Magnitude > 8
						then
							toTarget(game:GetService("Workspace").Map["Haunted Castle"].Summoner.Detection.CFrame)
						else
							equiptool("Hallow Essence", true)
						end
						return
					end
				end
			end
			if Settings["Attack Dough King"] then
				local Y = CheckNameBoss("Dough King")
				if Y then
					StackFarm = false
					StackFarmOther = false
					BananaOwner("Attack Dough King")
					repeat
						task.wait()
						sizepart(Y)
						if Settings["Select Weapon"] == "Blox Fruit" then
							toTarget(getgenv().FruitFarmCF(Y))
						else
							toTarget(Y.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
						end
						ClickM1(Y)
						UsedualFlock()
					until not IsMobAlive(Y) or not Settings["Attack Dough King"]
					return
				else
					spawn(function()
						if Settings["Hop Find Dough King"] then
							SpecialHop("Dough King")
						end
					end)
					if Settings["Summon Dough King"] then
						if not DetectItemPlr("Sweet Chalice") then
							if
								game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChaliceNpc")
								== "Where are the items?"
							then
								if not CheckCountItem("Conjured Cocoa", 10) then
									StackFarm = false
									StackFarmOther = false
									BananaOwner("Summon Dough King")
									if not DetectMob(P) then
										if typeof(P) == "table" then
											if #N >= #P then
												N = {}
												return
											end
											local Y = DetectPartSpawnMob(DetectNameTablePart(P))
											if Y then
												table.insert(N, DetectNameTablePart(P))
												repeat
													wait()
													toTarget(Y.CFrame * CFrame.new(0, 60, 0))
												until (Y.Position - t.Character.HumanoidRootPart.Position).Magnitude
														<= 100
													or (DetectMob(P))
													or not Settings["Attack Dough King"]
												wait(1)
											end
										else
											local Y = DetectPartSpawnMob(P, true)
											if Y then
												Instance.new("IntValue", Y).Name = "Ignored"
												repeat
													wait()
													toTarget(Y.CFrame * CFrame.new(0, 60, 0))
												until (Y.Position - t.Character.HumanoidRootPart.Position).Magnitude
														<= 100
													or (DetectMob(P))
													or not Settings["Attack Dough King"]
												wait(1)
											else
												DeleteIgnoredMobSpawn()
											end
										end
									else
										local Y = DetectMob(P)
										repeat
											task.wait()
											sizepart(Y)
											BringMob(Y)
											UsedualFlock()
											ClickM1(Y)
											if Settings["Select Weapon"] == "Blox Fruit" then
												toTarget(getgenv().FruitFarmCF(Y))
											else
												toTarget(Y.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
											end
										until not Y
											or not Y.Parent
											or Y.Humanoid.Health == 0
											or not Settings["Attack Dough King"]
									end
								elseif not DetectItemPlr("God's Chalice") then
									local P = DetectEliteHunter()
									if P then
										StackFarm = false
										StackFarmOther = false
										BananaOwner("Summon Dough King")
										if not EnsureEliteQuest(P.Name) then
											task.wait()
										else
											repeat
												task.wait()
												sizepart(P)
												if Settings["Select Weapon"] == "Blox Fruit" then
													toTarget(getgenv().FruitFarmCF(P))
												else
													toTarget(P.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
												end
												ClickM1(P)
												UsedualFlock()
											until not P
												or not P.Parent
												or P.Humanoid.Health == 0
												or not Settings["Attack Dough King"]
										end
										return
									else
										A.CreateNoti({
											Title = "Banana Cat Hub",
											Desc = "Waiting Elite Hunter",
											ShowTime = 5,
										})
										wait(5)
									end
								end
							end
						elseif not DetectMob(y) then
							if typeof(y) == "table" then
								if #N >= #y then
									N = {}
									return
								end
								local P = DetectPartSpawnMob(DetectNameTablePart(y))
								if P then
									table.insert(N, DetectNameTablePart(y))
									repeat
										wait()
										toTarget(P.CFrame * CFrame.new(0, 60, 0))
									until (P.Position - t.Character.HumanoidRootPart.Position).Magnitude <= 100
										or (DetectMob(y))
										or not Settings["Attack Dough King"]
									wait(1)
								end
							else
								local P = DetectPartSpawnMob(y, true)
								if P then
									Instance.new("IntValue", P).Name = "Ignored"
									repeat
										wait()
										toTarget(P.CFrame * CFrame.new(0, 60, 0))
									until (P.Position - t.Character.HumanoidRootPart.Position).Magnitude <= 100
										or (DetectMob(y))
										or not Settings["Attack Dough King"]
									wait(1)
								else
									DeleteIgnoredMobSpawn()
								end
							end
						else
							local P = DetectMob(y)
							repeat
								task.wait()
								sizepart(P)
								BringMob(P)
								UsedualFlock()
								ClickM1(P)
								if Settings["Select Weapon"] == "Blox Fruit" then
									toTarget(getgenv().FruitFarmCF(P))
								else
									toTarget(P.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
								end
							until not P or not P.Parent or P.Humanoid.Health == 0 or not Settings["Attack Dough King"]
						end
					end
				end
			end
			if Settings["Auto Elite Hunter"] then
				local y = DetectEliteHunter()
				if y then
					StackFarm = false
					StackFarmOther = false
					BananaOwner("Auto Elite Hunter")
					if not EnsureEliteQuest(y.Name) then
						task.wait()
					else
						repeat
							task.wait()
							sizepart(y)
							if Settings["Select Weapon"] == "Blox Fruit" then
								toTarget(getgenv().FruitFarmCF(y))
							else
								toTarget(y.HumanoidRootPart.CFrame * CFrame.new(7, BuddhaFarmY(), 0))
							end
							ClickM1(y)
							UsedualFlock()
						until not IsMobAlive(y) or not Settings["Auto Elite Hunter"]
						if getgenv().QuestTrainer and getgenv().QuestTrainer.CountKillMob then
							getgenv().QuestTrainer.CountKillMob = getgenv().QuestTrainer.CountKillMob + 1
						end
					end
					return
				elseif Settings["Hop Server Elite Hunter"] then
					if not DetectItemPlr("God's Chalice") then
						HopServer()
					else
						toTarget(CFrame.new(-12463.8740234375, 374.9144592285156, -7523.77392578125))
					end
				end
			end
			if Settings["Auto Factory"] then
				CoreBoss = CheckNameBoss("Core")
				if CoreBoss then
					StackFarm = false
					StackFarmOther = false
					BananaOwner("Auto Factory")
					repeat
						task.wait()
						toTarget(CoreBoss.HumanoidRootPart.CFrame * CFrame.new(0, 20, 0))
						ClickM1(CoreBoss)
						UsedualFlock()
					until not IsMobAlive(CoreBoss) or not Settings["Auto Factory"]
					return
				end
			end
			if Settings["Auto Pirate Raid"] then
				local y = GetPirateRaid() or (GetPirateRaid(true))
				if y then
					getgenv().DetectRaidCastle = true
					StackFarm = false
					StackFarmOther = false
					BananaOwner("Auto Pirate Raid")
					local P = Settings["Select Weapon"] == "Blox Fruit" and (CFrame.new(-7, getgenv().YPosFruit or 20, 0))
						or (CFrame.new(7, BuddhaFarmY(), 0))
					repeat
						task.wait()
						UsedualFlock()
						sizepart(y)
						ClickM1(y)
						toTarget(Settings["Select Weapon"] == "Blox Fruit" and getgenv().FruitFarmCF(y) or (y.HumanoidRootPart.CFrame * P))
					until not IsMobAlive(y) or not Settings["Auto Pirate Raid"]
				elseif getgenv().DetectRaidCastle then
					StackFarm = false
					StackFarmOther = false
					BananaOwner("Auto Pirate Raid")
					local y, P = os.clock(), false
					repeat
						task.wait()
						P = (function() if GetPirateRaid() or (GetPirateRaid(true)) then return true else return P end end)()
					until os.clock() - y >= 10 or P
					if not P then
						getgenv().DetectRaidCastle = false
					end
				end
			end
			if Settings["Teleport To Fruit"] then
				local y = GetPathFruit()
				if y then
					StackFarm = false
					StackFarmOther = false
					BananaOwner("Teleport To Fruit")
					if (y.Handle.Position - t.Character.HumanoidRootPart.Position).Magnitude <= 5 then
						getgenv().noclip = false
						game:GetService("VirtualInputManager"):SendKeyEvent(true, "Space", false, game)
						wait()
						game:GetService("VirtualInputManager"):SendKeyEvent(false, "Space", false, game)
					else
						toTarget(y.Handle.CFrame, true)
					end
					return
				elseif Settings["Teleport To Fruit [ Hop Server ]"] then
					HopServer()
					wait(5)
				end
			end
			if not StackFarm then
				StackFarm = true
			end
			if not StackFarmOther then
				StackFarmOther = true
			end
		end)
		if V then
			print(V)
		end
	end
end)

HiddenEventSection = Tabs.MainFarm:AddSection("Secret Quest")
StatusHiddenProgress = HiddenEventSection:CreateLabel({ Title = "Secret Quest : 0/39 Quests" })
StatusHiddenQuest = HiddenEventSection:CreateLabel({ Title = "Title Quest : ..." })
StatusHiddenStep = HiddenEventSection:CreateLabel({ Title = "Doing Quest : None" })
StatusHiddenBoss = HiddenEventSection:CreateLabel({ Title = "Title Awakened Boss : None" })


	HiddenEvent = {
		progress = {},
		checked = 0,
		current = nil,
		step = "Idle",
		handlers = {},
		skipped = {},
		lastNotify = {},
	}

	GetHiddenProgress = function(arg)
		local flag

		if arg then
			flag = arg
		else
			local checked = HiddenEvent.checked
			flag = os.clock() - checked > 15
		end

		if flag then
			HiddenEvent.checked = os.clock()

			local ok, result = pcall(function()
				return ReplicatedStorage.Modules.Net["RF/RequestBonusMomentReplication"]:InvokeServer({ Type = "GetMomentProgress" })
			end)

			if ok and type(result) == "table" and type(result.Data) == "table" then
				ReportHiddenDone(HiddenEvent.progress, result.Data)
				HiddenEvent.progress = result.Data
			end
		end

		return HiddenEvent.progress
	end

	ReportHiddenDone = function(arg, arg2)
		local done = 0

		for k, v6 in pairs(arg2) do
			if type(v6) == "table" and v6.Completed then
				done = done + (1)
				local flag = type(arg) == "table" and arg[k]

				if type(flag) == "table" and not flag.Completed then
					HiddenNotify((tostring(k):match("([^/]+)$") or tostring(k)) .. " completed", "done" .. tostring(k), "reward", { SubContent = done .. "/39 secret quests", Duration = 8 })
				end
			end
		end

		HiddenEvent.done = done
	end

	HiddenNotify = function(arg, key, arg2, arg3)
		key = key or arg
		if os.clock() - (HiddenEvent.lastNotify[key] or 0) < 20 then
			return
		end
		HiddenEvent.lastNotify[key] = os.clock()
		local tbl9 = arg3 or {}
		tbl9.Key = key
		InfinityNotify("Hidden Event", arg, arg2 or "info", tbl9)
	end

	SetHiddenStep = function(step)
		if step ~= HiddenEvent.step then
			local stepShape = tostring(step):gsub("%d+", "#")

			if stepShape ~= HiddenEvent.stepShape then
				HiddenEvent.stepShape = stepShape
				InfinityLog("Hidden", step)
			end
		end

		HiddenEvent.step = step
	end

	HiddenModules = setmetatable({}, { __index = function(arg, arg2)
		local handlers = {
			Controller = function()
				return require(ReplicatedStorage.Controllers.BonusMomentsController)
			end,
			Guide = function()
				return require(ReplicatedStorage.BonusMomentsGuide)
			end,
			Map = function()
				return require(ReplicatedStorage.Definitions.Map)
			end,
			NpcList = function()
				return require(ReplicatedStorage.NPCManager.NPCList)
			end,
			Dialogues = function()
				return require(ReplicatedStorage.DialoguesList)
			end,
			RegisterAttack = function()
				return ReplicatedStorage.Modules.Net:WaitForChild("RE/RegisterAttack")
			end,
			RegisterHit = function()
				return require(ReplicatedStorage.Modules.Net):RemoteEvent("RegisterHit", true)
			end,
		}

		local v6 = handlers[arg2] and handlers[arg2]()
		rawset(arg, arg2, v6)
		return v6
	end })

	GetHiddenIsland = function(arg)
		HiddenEvent.islands = HiddenEvent.islands or {}

		if HiddenEvent.islands[arg] == nil then
			local v6 = HiddenModules.Map.findCurrentMap()
			local v7 = pairs
			local islands = v6 and v6.Islands or {}

			for _, island in v7(islands) do
				if island.Index.Key == arg then
					HiddenEvent.islands[arg] = island
				end
			end
		end

		return HiddenEvent.islands[arg]
	end

	GetHiddenMoment = function(arg)
		return HiddenModules.Controller:GetLoadedMoments()[arg]
	end

	HiddenRelease = function()
		local anchored = HiddenEvent.anchored

		if anchored and anchored.Parent then
			anchored.Anchored = false
		end

		HiddenEvent.anchored = nil
	end

	HiddenMove = function(arg)
		HiddenRelease()

		if IsSecretQuestOn() then
			ToTarget(arg)
		end
	end

	HiddenGoTo = function(arg, arg2)
		if localPlayer:DistanceFromCharacter(arg) <= (arg2 or 8) then
			return true
		end
		HiddenMove(CFrame.new(arg))
		return false
	end

	HiddenGoToIsland = function(arg)
		local v6 = GetHiddenIsland(arg)
		if not v6 then
			return
		end
		SetHiddenStep("Travel to " .. arg)
		local position = v6.TeleportPoints[1].Position
		local v7 = nil

		for _, child in ipairs(workspace._WorldOrigin.Locations:GetChildren()) do
			if child.Name == v6.Reference.Location then
				local magnitude = (child.Position - v6.World.Position).Magnitude

				if not v7 or magnitude < v7 then
					position = child.Position
					v7 = magnitude
				end
			end
		end

		return HiddenGoTo(position + Vector3.new(0, 30, 0), 150)
	end

	HiddenHold = function(arg)
		local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end

		if (humanoidRootPart.Position - arg.Position).Magnitude > 3 then
			HiddenMove(arg)
			return
		end

		if HiddenEvent.anchored ~= humanoidRootPart then
			humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
			humanoidRootPart.Anchored = true
			HiddenEvent.anchored = humanoidRootPart
		end

		HiddenEvent.holdTime = tick()
		TweenHoldUntil = tick() + 1
	end

	SweepHiddenTrigger = function(arg, arg2, arg3)
		HiddenRelease()
		local character = localPlayer.Character
		local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
		character = character and character:FindFirstChildOfClass("Humanoid")
		if not humanoidRootPart or not character then
			return
		end
		HiddenEvent.walking = true
		local floatForce = humanoidRootPart:FindFirstChild("FloatForce")
		local maxForce = floatForce and floatForce.MaxForce

		if floatForce then
			floatForce.MaxForce = Vector3.zero
		end

		for k in pairs(NoclipChanged) do
			if k.Parent then
				k.CanCollide = true
			end
		end

		table.clear(NoclipChanged)
		humanoidRootPart.CFrame = CFrame.new(arg2)
		humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
		task.wait(0.4)
		character:MoveTo(arg3)
		local now = tick()

		while true do local __brk = false repeat 
			task.wait(0.1)
			tbl3.LastCall = tick()
			TweenHoldUntil = tick() + 1
			if not ((humanoidRootPart.Position - arg3).Magnitude < 6 or tick() - now > 6 or not humanoidRootPart.Parent) then
				break
			end
			__brk = true break
		until true if __brk then break end end

		if floatForce and floatForce.Parent then
			floatForce.MaxForce = maxForce
		end

		HiddenEvent.walking = false
	end

	HiddenDialoguePriority = {
		"not this time",
		"help hasan",
		"return the hat",
		"you're welcome",
		"hand over",
		"claim",
		"reward",
		"i'll get it",
		"accept",
		"let's go",
		"start",
		"yes",
		"sure",
		"okay",
		"go on",
		"continue",
		"so go get it back",
	}

	HiddenDialogueAvoid = {
		"walk away",
		"leave",
		"nevermind",
		"never mind",
		"not now",
		"maybe later",
		"no thanks",
		"no, ",
		"cancel",
		"skip",
		"bye",
		"goodbye",
		"forget it",
		"i'll pass",
		"decline",
		"quit",
		"exit",
		"stop",
	}

	PickHiddenDialogue = function(arg)
		local DialogueController = require(ReplicatedStorage.DialogueController)
		if not DialogueController.Active then
			return false
		end
		local ok, result = pcall(DialogueController.getActiveDialogue)
		ok = ok and result and result._pageStack and result._pageStack[#result._pageStack]
		if not ok then
			return false
		end
		local options2 = ok._options or {}
		if #options2 == 0 then
			pcall(DialogueController.advance)
			return false
		end
		local v6 = ipairs
		arg = arg or {}

		for _, v7 in v6(arg) do
			for _, v8 in ipairs(options2) do
				if string.find(string.lower(type(v8._text) == "table" and table.concat(v8._text, " ") or tostring(v8._text)), string.lower(v7), 1, true) then
					pcall(DialogueController.select, v8)
					return true
				end
			end
		end

		return false
	end

	AutoHiddenDialogue = function()
		if tick() < (HiddenEvent.talking or 0) then
			HiddenEvent.strayDialogue = nil
			return
		end

		if PickHiddenDialogue(HiddenDialoguePriority) then
			HiddenEvent.strayDialogue = nil
			return
		end
		local DialogueController = require(ReplicatedStorage.DialogueController)
		local ok, result = pcall(DialogueController.getActiveDialogue)
		local pageStack = DialogueController.Active and ok and result and result._pageStack and result._pageStack[#result._pageStack]

		if pageStack then
			pageStack = #(pageStack._options or {}) > 0
		end

		if pageStack then
			pageStack = tick() > (HiddenEvent.dialogueBusy or 0)
		end

		if pageStack then
			HiddenEvent.strayDialogue = HiddenEvent.strayDialogue or tick()
			local strayDialogue = HiddenEvent.strayDialogue

			if tick() - strayDialogue > 1.5 then
				HiddenEvent.strayDialogue = nil
				pcall(DialogueController.close)
			end
		else
			HiddenEvent.strayDialogue = nil
		end
	end

	HiddenDialogueLoop = function()
		while IsSecretQuestOn() do
			pcall(AutoHiddenDialogue)
			task.wait(0.4)
		end
	end

	HiddenMaterialMobs = {
		["Yeti Fur"] = { mobs = { "Snow Bandit", "Snowman" }, center = Vector3.new(1350, 60, -1300) },
		Leather = { mobs = { "Brute", "Pirate" }, center = Vector3.new(-1436, 28, 4357) },
		["Scrap Metal"] = { mobs = { "Brute", "Pirate" }, center = Vector3.new(-1436, 28, 4357) },
		["Magma Ore"] = { mobs = { "Military Soldier", "Military Spy" }, center = Vector3.new(-5300, 20, 8500) },
		["Angel Wings"] = { mobs = { "Royal Soldier", "Royal Squad" }, center = Vector3.new(-7030, 5545, 1120) },
		["Fish Tail"] = { mobs = { "Fishman Warrior", "Fishman Commando" }, center = Vector3.new(61000, 23, 1300) },
	}

	CountHiddenMaterial = function(arg)
		local v6, v7, v8 = ipairs(GetInventoryItems() or {})
		local n = 0

		for _, v9 in v6, v7, v8 do
			if tostring(v9.Name) == arg then
				n = tonumber(v9.Count) or tonumber(v9.Amount) or 1
			end
		end

		return n
	end

	FarmHiddenMaterial = function(arg, arg2)
		local v6 = HiddenMaterialMobs[arg]
		if not v6 then
			return
		end
		arg2 = arg2 or 1
		local now = tick()
		local now2 = tick()
		local str2

		while true do local __brk = false repeat 
			local v7 = FindHiddenEnemy(v6.mobs, v6.center, 1500)

			if not v7 then
				HiddenGoTo(v6.center, 120)
				str2 = "Look for " .. v6.mobs[1] .. " to farm " .. arg
				task.wait(0.2)
			else
				str2 = "Farm " .. arg .. " from " .. v7.Name
				HiddenEvent.stallGrace = tick() + 20
				SizePart(v7)
				BringMob(v7)
				UsedualFlock()
				HiddenMove(GetHiddenFarmCFrame(v7))
				getgenv().ClickM1(v7, true)
				task.wait()
			end

			local flag

			if tick() - now2 > 4 then
				local now3 = tick()

				if not (arg2 <= CountHiddenMaterial(arg)) then
					now2 = now3
					flag = tick() - now > 45 or not IsSecretQuestOn()

					if flag then
						__brk = true break
					else
						break
					end
				end
			else
				flag = tick() - now > 45 or not IsSecretQuestOn()

				if flag then
					__brk = true break
				else
					break
				end
			end

			__brk = true break
		until true if __brk then break end end

		return str2
	end

	FindHiddenWaterSpot = function()
		local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not humanoidRootPart then
			return
		end
		local GetWaterHeightAtLocation = require(ReplicatedStorage.Util.GetWaterHeightAtLocation)
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude
		raycastParams.FilterDescendantsInstances = { localPlayer.Character, workspace.Characters, workspace.Enemies }

		local function fn(arg)
			local ok, result = pcall(GetWaterHeightAtLocation, arg)
			return ok and tonumber(result)
		end

		local function fn2(arg, arg2)
			local hit = workspace:Raycast(Vector3.new(arg.X, arg2 + 200, arg.Z), Vector3.new(0, -500, 0), raycastParams)
			return hit and hit.Position or nil
		end

		for i_ = 15, 400, 15 do
			for i_2 = 0, 11 do
				local v6 = math.rad(i_2 * 30)
				local sin = math.sin
				local vector = Vector3.new(math.cos(v6), 0, sin(v6))
				local n = humanoidRootPart.Position + vector * i_
				local v7 = fn(n)

				if v7 then
					local v8 = fn2(n, v7)

					if v8 and v8.Y >= v7 - 1 then
						local n3 = n + vector * 14
						local v9 = fn(n3)
						local v10 = v9 and fn2(n3, v9)
						if v9 and (not v10 or v10.Y < v9 - 2) then
							return Vector3.new(v8.X, v8.Y + 3, v8.Z), Vector3.new(n3.X, v9, n3.Z)
						end
					end
				end
			end
		end
	end

	TalkFishermanDialogue = function(arg, arg2, arg3)
		local DialogueController = require(ReplicatedStorage.DialogueController)
		HiddenEvent.dialogueBusy = tick() + (arg3 or 20) + 4
		pcall(DialogueController.close)
		task.wait(0.4)
		local fisherman = HiddenModules.NpcList.List.Fisherman
		if not fisherman then
			return false
		end
		local ok, result = pcall(fisherman.DialogueCallback)
		if not ok or not result then
			return false
		end
		task.spawn(pcall, DialogueController.start, result)
		local now = tick()
		local n = 1

		while true do local __brk = false repeat 
			task.wait(0.4)
			local ok2, result2 = pcall(DialogueController.getActiveDialogue)
			local pageStack = ok2 and result2 and result2._pageStack and result2._pageStack[#result2._pageStack]

			if pageStack then
				local options2 = pageStack._options or {}

				if #options2 == 0 then
					pcall(DialogueController.advance)
				else
					local v6 = nil

					for _, v7 in ipairs(options2) do
						local v8 = string.lower(type(v7._text) == "table" and table.concat(v7._text, " ") or tostring(v7._text))
						local v9 = ipairs
						local tbl9 = arg or {}

						for _, v10 in v9(tbl9) do
							if not v6 and string.find(v8, string.lower(v10), 1, true) then
								v6 = v7
							end
						end
					end

					pcall(DialogueController.select, v6 or options2[1])
					n = n + (1)
				end
			end

			local flag = arg2 and arg2() or n > 6

			if not flag then
				flag = tick() - now > (arg3 or 15)
			end

			if not flag then
				break
			end
			__brk = true break
		until true if __brk then break end end

		task.wait(0.5)
		pcall(DialogueController.close)
		return arg2 and arg2() or true
	end

	GoToFisherman = function()
		local fisherman = workspace.NPCs:FindFirstChild("Fisherman")
		fisherman = fisherman and fisherman:GetPivot().Position or Vector3.new(1065, 6, -1083)
		if localPlayer:DistanceFromCharacter(fisherman) <= 12 then
			return true
		end

		if IsSecretQuestOn() then
			return HiddenSettle(fisherman + Vector3.new(0, 1.5, 4), 10)
		end
		ToTarget(CFrame.new(fisherman + Vector3.new(0, 1.5, 4)))
		return false
	end

	CountFishingBait = function(arg)
		local v6 = ipairs
		local tbl9 = GetInventoryItems() or {}

		for _, v7 in v6(tbl9) do
			if tostring(v7.Name) == arg then
				return tonumber(v7.Count) or tonumber(v7.Amount) or 1
			end
		end

		return 0
	end

	BuyHiddenFishingGear = function(arg)
		local selectBait = arg or Settings["Select Bait"] or "Basic Bait"
		if DetectRod() and CountFishingBait(selectBait) > 0 then
			return true
		end

		if not GoToFisherman() then
			return false
		end

		if tick() - (HiddenEvent.rodAsked or 0) < 20 then
			return DetectRod() ~= nil
		end
		HiddenEvent.rodAsked = tick()

		if not DetectRod() then
			TalkFishermanDialogue({ "Thanks" }, function()
				return DetectRod() ~= nil
			end, 15)
		end

		if DetectRod() and CountFishingBait(selectBait) <= 0 then
			local v6 = CountFishingBait(selectBait)

			TalkFishermanDialogue({ "Bait", selectBait, "Craft", "Buy", "Confirm", "Yes" }, function()
				return CountFishingBait(selectBait) > v6
			end, 20)
		end

		return DetectRod() ~= nil
	end

	RunHiddenFishing = function()
		if not DetectRod() then
			if not BuyHiddenFishingGear() then
				HiddenNotify("Getting a Fishing Rod from the Fisherman for Chef's Kiss", "chefrod", "start")
				return "Get a Fishing Rod from the Fisherman"
			end
			DetectRod()
		end

		local selectBait = Settings["Select Bait"] or "Basic Bait"
		local fishingData = localPlayer.Data:FindFirstChild("FishingData")
		fishingData = fishingData and fishingData:GetAttribute("SelectedBait")

		if not fishingData or fishingData == "None" then
			if CountFishingBait(selectBait) > 0 then
				CommF:InvokeServer("LoadItem", selectBait, { "Usables" })
				task.wait(0.5)
			elseif not BuyHiddenFishingGear(selectBait) then
				return "Buy fishing bait from the Fisherman"
			end
		end

		local fishSpot = HiddenEvent.fishSpot

		if fishSpot then
			fishSpot = tick() - (HiddenEvent.fishSpotAt or 0) > 120
		end

		if fishSpot then
			HiddenEvent.fishSpot = nil
		end

		if not HiddenEvent.fishSpot then
			local v6 = HiddenEvent
			local v7 = HiddenEvent
			local v8, v9 = FindHiddenWaterSpot()
			v6.fishSpot = v8
			v7.fishWater = v9
			HiddenEvent.fishSpotAt = tick()
		end

		local fishSpot2 = HiddenEvent.fishSpot
		if not fishSpot2 then
			return "Looking for a shore to fish from"
		end

		if localPlayer:DistanceFromCharacter(fishSpot2) > 10 then
			HiddenMove(CFrame.new(fishSpot2, HiddenEvent.fishWater or fishSpot2 + Vector3.new(0, 0, 5)))
			return "Go to the shore to fish"
		end
		HiddenHold(CFrame.new(fishSpot2, HiddenEvent.fishWater or fishSpot2 + Vector3.new(0, 0, 5)))
		pcall(RunFishingCycle)
		task.wait(0.4)
		return "Fishing at the shore for Chef's Kiss"
	end

	GetHiddenFishCount = function()
		local tbl9 = {}

		for _, child in ipairs(ReplicatedStorage.FishReplicated.FishData:GetChildren()) do
			tbl9[child.Name] = true
		end

		local v6, v7, v8 = ipairs(GetInventoryItems() or {})
		local n = 0

		for _, v9 in v6, v7, v8 do
			if tbl9[tostring(v9.Name)] then
				n = n + (tonumber(v9.Count) or 1)
			end
		end

		return n
	end

	PrepareHiddenChef = function(arg)
		if arg["Sea1/Pirate Village/Chef's Kiss"] == true then
			return
		end

		if CountHiddenMaterial("Yeti Fur") < 1 then
			HiddenEvent.current = "Chef's Kiss"
			HiddenEvent.prepUntil = tick() + 60
			SetHiddenStep(FarmHiddenMaterial("Yeti Fur", 1) or "Farm Yeti Fur for Chef's Kiss")
			return true
		end

		if GetHiddenFishCount() < 1 then
			HiddenEvent.current = "Chef's Kiss"
			HiddenEvent.prepUntil = tick() + 60
			SetHiddenStep(RunHiddenFishing() or "Fishing for Chef's Kiss")
			return true
		end

		HiddenEvent.prepUntil = nil
	end

	GatherChefIngredients = function()
		local text = HiddenEvent.chefMissing and HiddenEvent.chefMissing.text or ""
		local v6 = string.lower(text)

		for k in pairs(HiddenMaterialMobs) do
			if string.find(text, k, 1, true) and CountHiddenMaterial(k) < 1 then
				local v7 = FarmHiddenMaterial(k)
				if v7 then
					return v7
				end
			end
		end

		local flag = string.find(v6, "fish", 1, true) ~= nil

		if not flag then
			for _, child in ipairs(ReplicatedStorage.FishReplicated.FishData:GetChildren()) do
				if string.find(text, child.Name, 1, true) then
					flag = true
					break
				end
			end
		end

		if flag then
			local v7 = RunHiddenFishing()
			if v7 then
				return v7
			end
		end

		if string.find(v6, "material", 1, true) or string.find(v6, "ingredient", 1, true) then
			for k in pairs(HiddenMaterialMobs) do
				if CountHiddenMaterial(k) > 0 then
					return
				end
			end

			local v7 = FarmHiddenMaterial("Yeti Fur", 1)
			if v7 then
				return v7
			end
		end
	end

	ResetHiddenMomentFlag = function(arg, arg2, arg3)
		for _, v6 in pairs(getgc()) do
			if type(v6) == "function" and islclosure(v6) and debug.info(v6, "n") == arg2 and string.find(tostring(debug.info(v6, "s")), arg, 1, true) then
				local ok, result = pcall(debug.getupvalues, v6)

				if ok and type(result[arg3]) == "boolean" then
					pcall(debug.setupvalue, v6, arg3, false)
				end
			end
		end
	end

	TalkHiddenQuestNpc = function(arg, arg2)
		pcall(function()
			local v6 = HiddenModules.NpcList.List[arg].DialogueCallback()

			if type(v6) == "table" and type(v6.Get) == "function" then
				v6:Get()
			end
		end)

		task.wait(0.6)
		local v6 = GetHiddenDialogueKey(arg)

		if v6 then
			pcall(HiddenModules.Guide.interactQuestGiver, v6)
		end

		return RunHiddenDialogue(arg2, 10)
	end

	RunHiddenDialogue = function(arg, arg2)
		local DialogueController = require(ReplicatedStorage.DialogueController)
		local now = tick()
		HiddenEvent.dialogueBusy = tick() + (arg2 or 12) + 2
		local flag = false

		while true do local __brk = false repeat 
			task.wait(0.3)
			HiddenEvent.stallGrace = tick() + 20

			if PickHiddenDialogue(arg) then
				flag = true
			end

			local flag2 = flag and not DialogueController.Active

			if not flag2 then
				flag2 = tick() - now > (arg2 or 12)
			end

			if not flag2 then
				break
			end
			__brk = true break
		until true if __brk then break end end

		if flag and DialogueController.Active then
			task.wait(1)
			pcall(DialogueController.close)
		end

		return flag
	end

	HiddenSettle = function(arg, arg2)
		if not HiddenGoTo(arg, arg2) then
			HiddenEvent.arrived = nil
			return false
		end
		HiddenHold(CFrame.new(arg))
		HiddenEvent.arrived = HiddenEvent.arrived or tick()

		if not game:GetService("CollectionService"):HasTag(localPlayer, "Teleporting") then
			HiddenEvent.teleportTag = nil
		else
			HiddenEvent.teleportTag = HiddenEvent.teleportTag or tick()
		end

		local arrived = HiddenEvent.arrived
		local flag = tick() - arrived > 1.5

		if flag then
			flag = not HiddenEvent.teleportTag

			if not flag then
				local teleportTag = HiddenEvent.teleportTag
				flag = tick() - teleportTag > 6
			end
		end

		return flag
	end

	ListenHiddenMoment = function(arg, arg2)
		return ReplicatedStorage.Remotes.BonusMomentsRemoteEvent.OnClientEvent:Connect(function(arg3, arg4, ...)
			if arg3 == arg then
				arg2(arg4, ...)
			end
		end)
	end

	HitHiddenPart = function(arg)
		if localPlayer:DistanceFromCharacter(arg.Position) > 12 then
			HiddenMove(arg.CFrame * CFrame.new(0, 0, 6))
			return
		end
		HiddenHold(localPlayer.Character.HumanoidRootPart.CFrame)
		EquipHiddenWeapon("Melee")

		if os.clock() - (HiddenEvent.lastHit or 0) >= 0.4 then
			HiddenEvent.lastHit = os.clock()
			HiddenModules.RegisterAttack:FireServer(0.3)
			HiddenModules.RegisterHit:FireServer(arg)
		end
	end

	IsHiddenEnemyMine = function(arg)
		local attribute = arg:GetAttribute("LocalEnemy")
		if attribute and attribute ~= localPlayer.Name then
			return false
		end
		local num = tonumber(arg:GetAttribute("BossEngagedWith"))
		if num and num ~= localPlayer.UserId and not arg:GetAttribute("BossIndicatorAwakened") then
			return false
		end
		return true
	end

	IsHiddenTarget = function(arg)
		local humanoid = arg and arg.Parent and arg:FindFirstChildWhichIsA("Humanoid")
		return humanoid ~= nil and humanoid.Health > 0 and arg:FindFirstChild("HumanoidRootPart") ~= nil and IsHiddenEnemyMine(arg)
	end

	FindHiddenEnemyNear = function(arg, arg2)
		local huge = math.huge
		local v6 = nil

		for _, child in ipairs(workspace.Enemies:GetChildren()) do
			if IsHiddenTarget(child) and (child:GetPivot().Position - arg).Magnitude <= arg2 then
				local v7 = localPlayer:DistanceFromCharacter(child:GetPivot().Position)

				if v7 < huge then
					huge = v7
					v6 = child
				end
			end
		end

		return v6
	end

	FindHiddenEnemy = function(arg, arg2, arg3)
		local huge = math.huge
		local v6 = nil

		for _, child in ipairs(workspace.Enemies:GetChildren()) do
			if table.find(arg, child.Name) and IsHiddenTarget(child) and (child:GetPivot().Position - arg2).Magnitude <= arg3 then
				local v7 = localPlayer:DistanceFromCharacter(child:GetPivot().Position)

				if v7 < huge then
					huge = v7
					v6 = child
				end
			end
		end

		return v6
	end

	HiddenDodge = { untilTime = 0, target = nil, animations = {}, connection = nil, watching = false }
	IsHiddenDodging = function()return HiddenDodge.target~=nil and tick()<HiddenDodge.untilTime;end
	TriggerHiddenDodge = function(c)if HiddenDodge.target then HiddenDodge.untilTime=math.max(HiddenDodge.untilTime,tick()+math.clamp(c,0.3,8));end;end

	IsHiddenBoss = function(arg)
		if arg:GetAttribute("BossIndicatorAwakened") then
			return true
		end
		local v6 = ipairs
		local tbl9 = HiddenQuests or {}

		for _, v7 in v6(tbl9) do
			if v7.BossNames and table.find(v7.BossNames, arg.Name) then
				return true
			end
		end

		return false
	end

	OnHiddenEnemyAnimation = function(c)if c.Looped then return;end;local n,L=c.Animation and c.Animation.AnimationId or"",tick();local U=HiddenDodge.animations[n];if not U or L-U.since>20 then U={count=0,since=L};HiddenDodge.animations[n]=U;end;U.count=U.count+1;if U.count>4 then return;end;task.wait(0.05);if c.IsPlaying and c.Length>=0.9 then TriggerHiddenDodge(c.Length/math.max(c.Speed,0.1)+0.3);end;end
	OnHiddenEnemySkill = function(n)if not HiddenDodge.target then return;end;if not n:IsA("BodyGyro")and not n:IsA("BodyPosition")and not string.find(n.Name,"KiBlast",1,true)then return;end;local L=n.Parent;while L and L.Parent~=workspace.Enemies do L=L.Parent;end;local U=L and(L:FindFirstChild("HumanoidRootPart"));if not U or L~=HiddenDodge.target and  localPlayer :DistanceFromCharacter(U.Position)>70 then return;end;L=tick();TriggerHiddenDodge(1);while n.Parent and HiddenDodge.target and tick()-L<8 do TriggerHiddenDodge(0.5);task.wait(0.2);end;end

	WatchHiddenEnemy = function(target)
		if HiddenDodge.target == target then
			return
		end
		StopHiddenDodge()
		HiddenDodge.target = target
		local humanoid = target:FindFirstChildOfClass("Humanoid")

		if humanoid then
			humanoid = humanoid:FindFirstChildOfClass("Animator") or humanoid
		end

		if humanoid then
			HiddenDodge.connection = humanoid.AnimationPlayed:Connect(OnHiddenEnemyAnimation)
		end

		if not HiddenDodge.watching then
			HiddenDodge.watching = true
			workspace.Enemies.DescendantAdded:Connect(OnHiddenEnemySkill)
		end
	end

	StopHiddenDodge = function()
		if HiddenDodge.connection then
			HiddenDodge.connection:Disconnect()
			HiddenDodge.connection = nil
		end

		table.clear(HiddenDodge.animations)
		HiddenDodge.target = nil
		HiddenDodge.untilTime = 0
	end

	GetHiddenFarmCFrame = function(c)local n,L=c.HumanoidRootPart,Settings["Select Weapon"]=="Blox Fruit";local U=HiddenEvent.farmHeight or L and(getgenv().YPosFruit or 20)or 20;return n.CFrame*CFrame.new(L and-7 or 7,(function() if IsHiddenDodging() then return U+(IsHiddenBoss(c)and 40 or 25) else return U end end)(),0);end

	KillHiddenEnemy = function(fighting)
		local now = tick()
		local v6 = IsHiddenBoss(fighting)
		local n = v6 and 180 or 45
		HiddenEvent.fighting = fighting
		WatchHiddenEnemy(fighting)

		while true do local __brk = false repeat 
			task.wait()

			if not fighting:FindFirstChild("HumanoidRootPart") then
				__brk = true break
			else
				SizePart(fighting)

				if not v6 then
					BringMob(fighting)
				end

				UsedualFlock()
				local humanoidRootPart = fighting:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					local cFrame = humanoidRootPart.CFrame
					getgenv().AimPos = cFrame
				end

				HiddenMove(GetHiddenFarmCFrame(fighting))
				getgenv().ClickM1(fighting, true)
				if not (not IsHiddenTarget(fighting) or not IsSecretQuestOn() or tick() - now > n) then
					break
				end
				__brk = true break
			end
		until true if __brk then break end end

		HiddenEvent.fighting = nil
		StopHiddenDodge()
	end

	GetHiddenDialogueKey = function(arg)
		local v6 = HiddenModules.NpcList.List[arg]
		local tbl9 = {}
		local fn = nil

		fn = function(arg2, arg3)
			if type(arg2) ~= "function" or tbl9[arg2] or arg3 > 3 then
				return nil
			end
			tbl9[arg2] = true
			local ok, result = pcall(debug.getconstants, arg2)
			local v7 = ipairs
			local tbl10 = ok and result or {}

			for _, v8 in v7(tbl10) do
				if type(v8) == "string" and rawget(HiddenModules.Dialogues, v8) ~= nil then
					return v8
				end
			end

			local ok2, result2 = pcall(debug.getupvalues, arg2)
			local v8 = pairs
			result2 = ok2 and result2 or {}

			for _, v9 in v8(result2) do
				local flag = fn(v9, arg3 + 1) or type(v9) == "table" and fn(rawget(v9, "original"), arg3 + 1)
				if flag then
					return flag
				end
			end
		end

		return fn(v6 and v6.DialogueCallback, 0)
	end

	FindHiddenNpc = function(arg, arg2)
		for _, v6 in ipairs({ workspace.NPCs, ReplicatedStorage.NPCs }) do
			for _, child in ipairs(v6:GetChildren()) do
				if child:IsA("Model") and (child:GetPivot().Position - arg).Magnitude <= arg2 then
					return child
				end
			end
		end
	end

	ClaimHiddenReward = function()
		local v6 = HiddenModules.Guide.getRewardTracker()
		local target = v6 and v6.Options and v6.Options.Target
		HiddenEvent.rewardSeen = HiddenEvent.rewardSeen or {}

		if typeof(target) == "Vector3" then
			HiddenEvent.rewardSeen[tostring(target)] = { position = target, time = tick() }
		end

		local rewardLock = HiddenEvent.rewardLock
		local v7 = rewardLock and HiddenEvent.rewardSeen[tostring(rewardLock)]
		local flag = not v7
		local flag2

		if flag then
			flag2 = flag
		else
			local time_ = v7.time
			flag2 = tick() - time_ > 8
		end

		if not flag2 then
			flag2 = tick() < (HiddenEvent.skipped["Reward:" .. tostring(rewardLock)] or 0)
		end

		if flag2 then
			local v8 = nil
			rewardLock = nil

			for k, v9 in pairs(HiddenEvent.rewardSeen) do
				local v10 = localPlayer:DistanceFromCharacter(v9.position)
				local time_ = v9.time
				local flag3 = tick() - time_ <= 8

				if flag3 then
					flag3 = tick() >= (HiddenEvent.skipped["Reward:" .. k] or 0)
				end

				if flag3 and (not v8 or v10 < v8) then
					rewardLock = v9.position
					v8 = v10
				end
			end

			HiddenEvent.rewardLock = rewardLock
		end

		if typeof(rewardLock) ~= "Vector3" then
			return false
		end
		local reward = tostring(rewardLock)
		local v8 = FindHiddenNpc(rewardLock, 15)
		HiddenEvent.current = "Claim Reward"
		SetHiddenStep("Talk to " .. (v8 and v8.Name or "the quest giver") .. " for reward")
		if not v8 then
			HiddenGoTo(rewardLock + Vector3.new(0, 5, 0), 20)
			return true
		end

		if HiddenSettle(rewardLock + Vector3.new(0, 1.5, 4), 10) then
			HiddenEvent.dialogueBusy = tick() + 12

			pcall(function()
				local v9 = HiddenModules.NpcList.List[v8.Name].DialogueCallback()

				if type(v9) == "table" and type(v9.Get) == "function" then
					v9:Get()
				end
			end)

			task.wait(1)
			local v9 = HiddenModules.Guide.getRewardTracker()
			local v10 = GetHiddenDialogueKey(v8.Name)

			if v10 and v9 and v9.Options and v9.Options.Target == rewardLock then
				HiddenModules.Guide.interactQuestGiver(v10)
			end

			HiddenEvent.checked = 0
			HiddenEvent.rewardSeen[tostring(rewardLock)] = nil
			HiddenEvent.rewardLock = nil
			local flag3 = false

			for i_ = 1, 8 do
				task.wait(0.5)
				local v11 = HiddenModules.Guide.getRewardTracker()
				flag3 = flag3 or v11 and v11.Options and v11.Options.Target == rewardLock
			end

			if flag3 then
				HiddenEvent.skipped["Reward:" .. reward] = tick() + 300
				HiddenNotify("Could not claim the reward from " .. v8.Name .. ", retry later", nil, "warning")
			else
				HiddenNotify("Claimed reward from " .. v8.Name, nil, "reward")
			end
		end

		return true
	end

	EquipHiddenWeapon = function(arg)
		local character = localPlayer.Character
		local v6 = NameWeapon(arg, true)
		local flag = not v6

		if flag then
			flag = os.clock() - (HiddenEvent.loadedWeapon or 0) > 5
		end

		if flag then
			HiddenEvent.loadedWeapon = os.clock()

			for _, v7 in ipairs(GetInventoryItems()) do
				if v7.Type == arg then
					CommF:InvokeServer("LoadItem", v7.Name)
					task.wait(0.5)
					v6 = NameWeapon(arg, true)
					break
				end
			end
		end

		local flag2 = not v6 and arg == "Gun"

		if flag2 then
			flag2 = os.clock() - (HiddenEvent.boughtGun or 0) > 30
		end

		if flag2 then
			HiddenEvent.boughtGun = os.clock()
			InfinityNotify("Hidden Event", "No gun in backpack or inventory, buying a Slingshot for the quest", "info", { Key = "hiddenbuygun" })

			pcall(function()
				CommF:InvokeServer("BuyItem", "Slingshot")
			end)

			task.wait(1)

			for _, v7 in ipairs(GetInventoryItems()) do
				if v7.Type == "Gun" then
					CommF:InvokeServer("LoadItem", v7.Name)
					task.wait(0.5)
					break
				end
			end

			v6 = NameWeapon(arg, true)
		end

		if v6 and v6.Parent ~= character then
			character.Humanoid:EquipTool(v6)
		end

		return v6
	end

	GetHiddenState = function(arg, arg2)
		HiddenEvent.states = HiddenEvent.states or {}
		local tbl9 = HiddenEvent.states[arg]

		if not tbl9 then
			tbl9 = {}
			HiddenEvent.states[arg] = tbl9

			ListenHiddenMoment(arg, function(arg3, ...)
				local v6 = tbl9
				local v7 = table.pack(...)
				local v8 = arg2
				v7.n = 3 + v7.n - 1
				table.move(v7, 1, v7.n, 3, v7)
				v7[1] = v6
				v7[2] = arg3
				v8(table.unpack(v7, 1, v7.n))
			end)
		end

		return tbl9
	end

	FindTaggedPartNear = function(arg, arg2)
		for _, v6 in ipairs(game:GetService("CollectionService"):GetTagged("M1HitRegistry")) do
			if (v6.Position - arg).Magnitude <= arg2 then
				return v6
			end
		end
	end

	GetPrisonLocation = function(arg)
		local bonusMomentLocations = workspace.Map.Prison:FindFirstChild("BonusMoment_Locations", true)
		bonusMomentLocations = bonusMomentLocations and bonusMomentLocations:FindFirstChild(arg, true)
		return bonusMomentLocations and bonusMomentLocations:GetPivot().Position
	end

	FindHiddenEnemyMatch = function(arg, arg2, arg3)
		local huge = math.huge
		local v6 = nil

		for _, child in ipairs(workspace.Enemies:GetChildren()) do
			if IsHiddenTarget(child) and (child:GetPivot().Position - arg2).Magnitude <= arg3 then
				for _, v7 in ipairs(arg) do
					if string.find(child.Name, v7, 1, true) then
						local v8 = localPlayer:DistanceFromCharacter(child:GetPivot().Position)

						if v8 < huge then
							huge = v8
							v6 = child
						end

						break
					end
				end
			end
		end

		return v6
	end

	FindHiddenPromptNear = function(arg, arg2, arg3)
		local v6, v7, v8 = ipairs(arg)
		local v9 = nil
		local v10 = nil

		for _, v11 in v6, v7, v8 do
			for _, descendant in ipairs(v11:GetDescendants()) do
				if descendant:IsA("ProximityPrompt") and descendant.Enabled then
					local parent = descendant.Parent
					local worldPosition = parent:IsA("Attachment") and parent.WorldPosition or parent:IsA("BasePart") and parent.Position or parent:IsA("Model") and parent:GetPivot().Position
					local magnitude = worldPosition and (worldPosition - arg2).Magnitude

					if magnitude and magnitude <= arg3 and (not v9 or magnitude < v9) then
						v9 = magnitude
						v10 = descendant
					end
				end
			end
		end

		return v10
	end

	HoldHiddenPrompt = function(arg)
		if not pcall(function()
			arg:InputHoldBegin()
			task.wait(arg.HoldDuration + 0.35)
			arg:InputHoldEnd()
		end) and fireproximityprompt then
			pcall(fireproximityprompt, arg, arg.HoldDuration + 0.35)
		end
	end

	FindTaggedPartIn = function(arg)
		if not arg then
			return nil
		end
		local v6 = nil
		local v7 = nil

		for _, v8 in ipairs(game:GetService("CollectionService"):GetTagged("M1HitRegistry")) do
			if v8:IsDescendantOf(arg) then
				local v9 = localPlayer:DistanceFromCharacter(v8.Position)

				if not v6 or v9 < v6 then
					v6 = v9
					v7 = v8
				end
			end
		end

		return v7
	end

	GetNpcPosition = function(arg)
		local v6 = workspace.NPCs:FindFirstChild(arg) or ReplicatedStorage.NPCs:FindFirstChild(arg)
		if v6 then
			return v6:GetPivot().Position
		end
		local v7 = require(ReplicatedStorage.NPCManager).getNPCsByName(arg)[1]
		local instance = v7 and v7._modelState and v7._modelState._instance
		return instance and instance:GetPivot().Position
	end

	HoistHiddenFlag = function(arg, arg2)
		local humanoidRootPart = localPlayer.Character.HumanoidRootPart
		local tbl9 = {}
		local flag = false

		local v6 = ListenHiddenMoment("Fortress Flagpole", function(arg3, arg4, arg5, arg6)
			if arg3 == "Shell" and typeof(arg4) == "Vector3" then
				table.insert(tbl9, { position = arg4, time = tick() + (arg5 or 1.4), radius = arg6 or 9 })
			elseif arg3 == "Completed" then
				flag = true
			end
		end)

		arg:FireServer("Hoist")
		local now = tick()
		local v7 = arg2

		while IsSecretQuestOn() and not flag and tick() - now < 100 and humanoidRootPart.Parent do
			task.wait(0.05)
			local flag2 = false

			for _, v8 in ipairs(tbl9) do
				local vector = Vector3.new(v7.X - v8.position.X, 0, v7.Z - v8.position.Z)

				if not flag2 then
					local n = v8.time + 0.5
					flag2 = tick() < n and vector.Magnitude < v8.radius + 4
				end
			end

			if flag2 then
				local v8 = nil

				for i_ = 0, 330, 30 do
					for _, v9 in ipairs({ 2, 7, 12, 15 }) do
						local n = arg2 + Vector3.new(math.cos(math.rad(i_)) * v9, 0, math.sin(math.rad(i_)) * v9)
						local v10, v11, v12 = ipairs(tbl9)
						local huge = math.huge

						for _, v13 in v10, v11, v12 do
							local n3 = v13.time + 0.5

							if tick() < n3 then
								local radius = v13.radius
								huge = math.min(huge, Vector3.new(n.X - v13.position.X, 0, n.Z - v13.position.Z).Magnitude - radius)
							end
						end

						if not v8 or huge > v8 then
							v8 = huge
							v7 = n
						end
					end
				end
			end

			if (humanoidRootPart.Position - v7).Magnitude > 1.5 then
				humanoidRootPart.CFrame = CFrame.new(v7)
			end

			humanoidRootPart.AssemblyLinearVelocity = Vector3.zero

			for i_ = #tbl9, 1, -1 do
				if tbl9[i_].time + 1.5 < tick() then
					table.remove(tbl9, i_)
				end
			end
		end

		v6:Disconnect()
		HiddenEvent.checked = 0
	end

	TalkHiddenNpc = function(arg, arg2)
		local DialogueController = require(ReplicatedStorage.DialogueController)
		HiddenEvent.talking = tick() + 25

		local function fn()
			local v6 = DialogueController.getActiveDialogue()
			return v6 and v6._pageStack[#v6._pageStack]
		end

		pcall(DialogueController.close)
		task.wait(0.3)
		task.spawn(pcall, DialogueController.start, HiddenModules.NpcList.List[arg].DialogueCallback())
		local now = tick()
		local n = 0

		while true do local __brk = false repeat 
			if tick() - now < 20 and n < #arg2 then
				task.wait(0.4)
				local v6 = fn()

				if v6 then
					local options2 = v6._options or {}

					if #options2 == 0 then
						pcall(DialogueController.advance)
						break
					else
						local v7 = nil

						for _, v8 in ipairs(options2) do
							if table.concat(v8._text or {}, " ") == arg2[n + 1] then
								v7 = v8
							end
						end

						if v7 then
							n = n + (1)
							DialogueController.select(v7)
							task.wait(1)
							break
						end
					end
				else
					break
				end
			end

			__brk = true break
		until true if __brk then break end end

		task.wait(1)
		pcall(DialogueController.close)
		return n == #arg2
	end

	RunHiddenTempleIntel = function(arg)
		local v6 = GetHiddenState("Temple Intel", function(arg2, arg3, arg4, arg5)
			if arg3 == "Reveal" then
				arg2.revealed = tick()
				arg2.solved = arg5 == true
			elseif arg3 == "Storm" then
				arg2.storm = arg4 == true
			elseif arg3 == "Clear" or arg3 == "Dropped" then
				arg2.storm = false
				arg2.solved = false
				arg2.carrying = false
			end
		end)

		if not rawget(arg, "HiddenGuard") then
			local fireServer = arg.FireServer
			arg.HiddenGuard = true

			arg.FireServer = function(arg2, arg3, ...)
				if arg3 == "Struck" then
					return
				end
				local v7 = table.pack(...)
				local v8 = fireServer
				v7.n = 3 + v7.n - 1
				table.move(v7, 1, v7.n, 3, v7)
				v7[1] = arg2
				v7[2] = arg3
				return v8(table.unpack(v7, 1, v7.n))
			end
		end

		if v6.carrying or v6.storm then
			local v7 = GetNpcPosition("Sky Quest Giver 2")

			if v7 and HiddenSettle(v7 + Vector3.new(0, 1.5, 4), 10) then
				TalkHiddenNpc("Sky Quest Giver 2", { "The old temple", "Hand over the Intel" })
				HiddenEvent.checked = 0
				v6.carrying = false
			end

			return "Bring the Intel back to Sky Quest Giver 2"
		end

		local flag = not v6.revealed

		if not flag then
			local revealed = v6.revealed
			flag = tick() - revealed > 6
		end

		if flag then
			if HiddenSettle(Vector3.new(-7389.5, 5599, 339) + Vector3.new(0, 6, 0), 10) then
				local arrived = HiddenEvent.arrived

				if tick() - arrived > 9 then
					HiddenEvent.arrived = nil
					local v7 = GetNpcPosition("Sky Quest Giver 2")
					local now = tick()

					while IsSecretQuestOn() and tick() - now < 60 do
						task.wait(0.3)
						if v7 and HiddenSettle(v7 + Vector3.new(0, 1.5, 4), 10) then
							TalkHiddenNpc("Sky Quest Giver 2", { "The old temple", "I'll get it" })
							return "Accept The old temple quest"
						end
					end

					return "Accept The old temple quest"
				end
			end

			return "Enter the old temple"
		end

		if not HiddenSettle(Vector3.new(-7389.5, 5599, 339) + Vector3.new(0, 6, 0), 10) then
			HiddenEvent.stallGrace = tick() + 5
			return "Go back into the old temple"
		end

		if not v6.solved then
			arg:FireServer("Solved")
			task.wait(2)
			return "Turn the coils"
		end

		if arg:InvokeServer("TakeIntel") == true then
			v6.carrying = true
			HiddenNotify("Took the Intel, running back", nil, "found")
		end

		return "Take the Intel"
	end

	RunHiddenLookout = function(arg)
		local response = arg:InvokeServer("StartAttempt")
		if type(response) ~= "table" or type(response.Token) ~= "string" or type(response.Manifest) ~= "table" then
			return "Captain is not ready for lookout duty", true
		end
		local response2

		while IsSecretQuestOn() do repeat 
			local str2 = "/4: watching " .. #response.Manifest .. " ships"
			SetHiddenStep("Lookout round " .. tostring(response.Round) .. str2)
			local now = tick()

			while true do local __brk = false repeat 
				response2 = arg:InvokeServer("ObservationFinished", response.Token)
				local v6 = nil

				if type(response2) ~= "table" then
					response2 = v6
					__brk = true break
				else
					if response2.Ready == false then
						task.wait(math.clamp(tonumber(response2.RetryAfter) or 1, 0.2, 5))
						response2 = nil
						if not (tick() - now > 120) then
							break
						end
					end

					__brk = true break
				end
			until true if __brk then break end end

			if not response2 then
				arg:InvokeServer("AbortAttempt", response.Token)
				return "Lookout observation failed, retrying", true
			end
			local n = 0

			for _, v6 in ipairs(response.Manifest) do
				if v6.Boat == response2.TargetBoat and v6.FlagColor == response2.TargetFlagColor then
					n = n + (1)
				end
			end

			local response3 = arg:InvokeServer("SubmitAnswer", response.Token, n)
			if type(response3) ~= "table" then
				return "Lookout answer was rejected", true
			end

			if response3.Correct ~= true then
				if type(response3.FinaleToken) == "string" then
					arg:InvokeServer("FinishFinale", response3.FinaleToken)
				end

				HiddenNotify("Lookout miscounted (" .. n .. " " .. tostring(response2.TargetFlagColor) .. " " .. tostring(response2.TargetBoat) .. "), retrying", nil, "warning")
				return "Lookout miscount, retrying"
			end

			if type(response3.NextRound) == "table" and type(response3.NextRound.Token) == "string" then
				response = response3.NextRound
				task.wait(1.25)
				break
			end

			if type(response3.FinaleToken) == "string" then
				arg:InvokeServer("FinishFinale", response3.FinaleToken)
			end

			HiddenModules.Guide.interactQuestGiver("TravelDressrosa")
			HiddenEvent.checked = 0
			HiddenNotify("Lookout duty complete", nil, "success")
			return "Lookout duty complete"
		until true end

		return "Lookout stopped"
	end

	BuildHiddenSnowman = function(arg)
		if not HiddenSettle(Vector3.new(1300, 60, -1450), 40) then
			return "Go to the Frozen Village square"
		end
		local tbl9 = {}
		local flag = false

		local Snowman = ListenHiddenMoment("Snowman", function(arg2, arg3)
			if arg2 == "Setup" and type(arg3) == "table" then
				for k, v6 in pairs(arg3) do
					tbl9[k] = v6
				end
			elseif arg2 == "Alive" then
				flag = true
			end
		end)

		arg:FireServer("Init")
		task.wait(3)
		if not next(tbl9) then
			Snowman:Disconnect()
			return "Waiting for snow piles on Frozen Village", true
		end
		local humanoidRootPart = localPlayer.Character.HumanoidRootPart
		local snowmanBallRemote = ReplicatedStorage.Remotes.SnowmanBallRemote
		local snowmanStackRemote = ReplicatedStorage.Remotes.SnowmanStackRemote
		local tbl10 = {}
		local tbl11 = {}
		HiddenEvent.snowSequence = (HiddenEvent.snowSequence or 0) + 1000

		local function fn()
			local v6 = HiddenEvent
			v6.snowSequence = v6.snowSequence + 1
			local tbl12 = {}

			for _, v7 in ipairs(tbl10) do
				table.insert(tbl12, { i = v7.i, c = v7.c, d = v7.d })
			end

			snowmanBallRemote:FireServer(HiddenEvent.snowSequence, tbl12)
		end

		local function fn2(arg2)
			local now = tick()
			HiddenEvent.arrived = nil

			while IsSecretQuestOn() and tick() - now < 60 do
				task.wait(0.1)
				fn()
				if HiddenSettle(arg2, 8) then
					return true
				end
			end
		end

		local n = 0
		local cframe = nil

		for k, v6 in pairs(tbl9) do local __brk = false repeat 
			if not (not IsSecretQuestOn() or not fn2(v6.Position + Vector3.new(0, 3, 0))) then
				SetHiddenStep("Roll snowball " .. n + 1 .. "/3")
				arg:FireServer("GrabSnowball", k)
				n = n + (1)
				local tbl12 = { i = n, c = humanoidRootPart.CFrame, d = 5 }
				table.insert(tbl10, tbl12)
				local n3 = humanoidRootPart.CFrame.LookVector * Vector3.new(1, 0, 1)
				local vector = n3.Magnitude < 0.1 and Vector3.new(0, 0, -1) or n3.Unit

				for i_ = 3.5, 315, 3.5 do
					task.wait(0.066666666666666666)
					tbl12.d = math.clamp(i_ / 300, 0, 1) * 10 + 5
					tbl12.c = CFrame.new(humanoidRootPart.Position + vector * (tbl12.d / 2 + 2.5))
					fn()
				end

				if not cframe then
					cframe = CFrame.new(tbl12.c.Position - Vector3.new(0, tbl12.d / 2, 0))
				else
					SetHiddenStep("Stack snowball " .. n .. "/3")
					fn2(cframe.Position + Vector3.new(0, 3, 12))
					tbl12.c = CFrame.new(cframe.Position + Vector3.new(0, 7.5, 0))
					fn()
					task.wait(0.2)
					table.insert(tbl11, 15)

					if #tbl11 == 1 then
						table.insert(tbl11, 15)
					end

					tbl10 = {}
					fn()
					snowmanStackRemote:FireServer(tbl11, cframe)
				end

				task.wait(1)
				break
			end

			__brk = true break
		until true if __brk then break end end

		local now = tick()

		while true do local __brk = false repeat 
			task.wait(0.5)
			if not (flag or tick() - now > 8) then
				break
			end
			__brk = true break
		until true if __brk then break end end

		Snowman:Disconnect()

		if flag then
			task.wait(2)
			arg:FireServer("Finished")
			HiddenEvent.checked = 0
			HiddenNotify("Snowman is alive again", nil, "found")
			return "Snowman built"
		end

		tbl10 = {}
		fn()
		return "Snowman failed, retrying", true
	end

	FaceHiddenTarget = function(arg)
		local humanoidRootPart = localPlayer.Character.HumanoidRootPart
		humanoidRootPart.CFrame = CFrame.lookAt(humanoidRootPart.Position, Vector3.new(arg.X, humanoidRootPart.Position.Y, arg.Z))
		workspace.CurrentCamera.CFrame = CFrame.lookAt(humanoidRootPart.Position + Vector3.new(0, 2, 0), arg)
	end

	GetHiddenFruitM1 = function()
		local v6 = NameWeapon("Blox Fruit")
		local character = localPlayer.Character

		if v6 then
			v6 = character and character:FindFirstChild(v6) or localPlayer.Backpack:FindFirstChild(v6)
		end

		return v6
	end

	NotifyHiddenFruitM1 = function(arg)
		if os.clock() - (HiddenEvent.fruitNotified or -300) < 300 then
			return
		end
		HiddenEvent.fruitNotified = os.clock()
		local value = localPlayer.Data.DevilFruit.Value
		InfinityNotify("Hidden Event", (value == "" and "You have no Blox Fruit" or value .. " has no M1 attack") .. ", please eat a Blox Fruit that has M1 (left click) for " .. arg, "warning", { Duration = 10 })
	end

	FindHiddenFruitTool = function()
		for _, v6 in ipairs({ localPlayer.Backpack, localPlayer.Character }) do
			for _, child in ipairs(v6:GetChildren()) do
				if child:IsA("Tool") and child:FindFirstChild("EatRemote") then
					return child
				end
			end
		end
	end

	EnsureHiddenFruit = function(arg)
		if GetHiddenFruitM1() then
			return true
		end

		if localPlayer.Data.DevilFruit.Value ~= "" then
			return false, "your eaten fruit has no M1 attack"
		end
		local v6 = FindHiddenFruitTool()

		if not v6 then
			local v7 = TakeFruitInventory()
			if not v7 then
				return false, "no Blox Fruit in backpack or inventory, skipping this quest"
			end
			InfinityNotify("Hidden Event", "Loading " .. v7 .. " from inventory to eat for " .. tostring(arg), "info", { Key = "hiddenloadfruit" })
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit", v7)
			local now = tick()

			while true do local __brk = false repeat 
				task.wait(0.3)
				v6 = FindHiddenFruitTool()
				if not (v6 or tick() - now > 4) then
					break
				end
				__brk = true break
			until true if __brk then break end end

			if not v6 then
				return false, "could not load a Blox Fruit from inventory, skipping this quest"
			end
		end

		pcall(function()
			localPlayer.Character.Humanoid:EquipTool(v6)
		end)

		task.wait(0.4)
		local eatRemote = v6:FindFirstChild("EatRemote")

		if eatRemote then
			pcall(function()
				eatRemote:InvokeServer("Eat")
			end)
		end

		local now = tick()

		while true do local __brk = false repeat 
			task.wait(0.3)
			if not (localPlayer.Data.DevilFruit.Value ~= "" or tick() - now > 4) then
				break
			end
			__brk = true break
		until true if __brk then break end end

		if localPlayer.Data.DevilFruit.Value == "" then
			return false, "could not eat the Blox Fruit, skipping this quest"
		end
		InfinityNotify("Hidden Event", "Ate " .. tostring(localPlayer.Data.DevilFruit.Value) .. " for " .. tostring(arg), "success", { Key = "hiddenatefruit" })
		task.wait(1.5)
		if not GetHiddenFruitM1() then
			return false, "the eaten fruit has no M1 attack"
		end
		return true
	end

	UseHiddenSkillAt = function(arg)
		if not EquipHiddenWeapon("Blox Fruit") then
			return false
		end
		local skills = localPlayer.PlayerGui.Main:FindFirstChild("Skills")
		skills = skills and skills:FindFirstChild(localPlayer.Data.DevilFruit.Value)
		local v6 = nil

		for _, v7 in ipairs({ "Z", "X", "C", "V", "F" }) do
			local v8 = skills and skills:FindFirstChild(v7)
			local title = v8 and v8:FindFirstChild("Title")
			local cooldown = v8 and v8:FindFirstChild("Cooldown")
			if v8 and (not title or not title:IsA("TextLabel") or title.TextColor3.R > 0.9) and (not cooldown or cooldown.Size.X.Scale <= 0) then
				v6 = v7
				break
			end
		end

		if not skills then
			HiddenEvent.skillIndex = (HiddenEvent.skillIndex or 0) % 4 + 1
			v6 = ({ "Z", "X", "C", "V" })[HiddenEvent.skillIndex]
		end

		if not v6 then
			task.wait(0.5)
			return true
		end
		FaceHiddenTarget(arg.Position)

		pcall(function()
			VirtualInputManager:SendKeyEvent(true, v6, false, game)
		end)

		task.wait(0.1)

		pcall(function()
			VirtualInputManager:SendKeyEvent(false, v6, false, game)
		end)

		task.wait(1.5)
		return true
	end

	ShootHiddenGunAt = function(arg)
		local Gun = EquipHiddenWeapon("Gun")
		local flag = not Gun
		local flag2

		if flag then
			flag2 = os.clock() - (HiddenEvent.boughtGun or 0) > 30
		else
			flag2 = flag
		end

		if flag2 then
			HiddenEvent.boughtGun = os.clock()
			CommF:InvokeServer("BuyItem", "Slingshot")
			return false
		end

		if flag then
			return false
		end
		FaceHiddenTarget(arg.Position)
		task.wait(0.1)
		local v6 = workspace.CurrentCamera:WorldToViewportPoint(arg.Position)
		local v7 = getupvalues(require(ReplicatedStorage.Controllers.CombatController).Attack)[9]

		if type(v7) == "function" and debug.info(v7, "n") == "shootGun" and Gun.Parent == localPlayer.Character then
			local guiInset = game:GetService("GuiService"):GetGuiInset()

			pcall(v7, Gun, {
				UserInputType = Enum.UserInputType.Touch,
				Position = Vector3.new(v6.X - guiInset.X, v6.Y - guiInset.Y, 0),
			})
		else
			pcall(function()
				VirtualInputManager:SendMouseButtonEvent(v6.X, v6.Y, 0, true, game, 0)
			end)

			task.wait(0.05)

			pcall(function()
				VirtualInputManager:SendMouseButtonEvent(v6.X, v6.Y, 0, false, game, 0)
			end)
		end

		task.wait(1.2)
		return true
	end

	GetHiddenRaidHint = function()
		local flag = not HiddenEvent.hint

		if not flag then
			local time_ = HiddenEvent.hint.time
			flag = tick() - time_ > 20
		end

		if flag then
			local ok, result = pcall(function()
				return ReplicatedStorage.Modules.Net["RF/RequestNextRaidHint"]:InvokeServer()
			end)

			HiddenEvent.hint = { time = tick(), data = ok and type(result) == "table" and result or {} }

			if HiddenEvent.hint.data.Island and tonumber(HiddenEvent.hint.data.Seconds) then
				HiddenEvent.expectedBoss = {
					key = os.date("!%Y%m%d%H", os.time() + tonumber(HiddenEvent.hint.data.Seconds) + 5),
					hint = HiddenEvent.hint.data,
				}
			end
		end

		local expectedBoss = HiddenEvent.expectedBoss
		if not HiddenEvent.hint.data.Island and expectedBoss and expectedBoss.key == os.date("!%Y%m%d%H") and os.date("!*t").min < 8 then
			return { Island = expectedBoss.hint.Island, Boss = expectedBoss.hint.Boss, State = "Triggered", Seconds = 0 }
		end
		return HiddenEvent.hint.data
	end

	FindHiddenBoss = function(arg, arg2)
		for _, child in ipairs(workspace.Enemies:GetChildren()) do
			local position = child:GetPivot().Position

			if IsHiddenTarget(child) and ((position - arg2).Magnitude < 1500 or localPlayer:DistanceFromCharacter(position) < 1500) then
				for _, v6 in ipairs(arg) do
					if string.find(child.Name, v6, 1, true) then
						return child
					end
				end
			end
		end
	end

	GetChargedClouds = function()
		return GetHiddenState("Electric Fighting Teacher", function(arg, arg2, arg3, arg4)
			if arg2 == "Charge" and typeof(arg3) == "Instance" then
				arg[arg3] = arg[arg3] or {}

				if typeof(arg4) == "Instance" and not table.find(arg[arg3], arg4) then
					table.insert(arg[arg3], arg4)
				end
			elseif arg2 == "Split" and typeof(arg3) == "Instance" and type(arg4) == "table" then
				arg[arg3] = arg[arg3] or {}

				for _, v6 in ipairs(arg4) do
					table.insert(arg[arg3], v6)
				end
			elseif arg2 == "Break" and typeof(arg3) == "Instance" then
				arg[arg3] = nil
			end
		end)
	end

	HitChargedCloud = function()
		for k, v6 in pairs(GetChargedClouds()) do
			local M1HitRegistry = nil

			for _, v7 in ipairs(v6) do
				if v7.Parent and v7:HasTag("M1HitRegistry") then
					M1HitRegistry = v7
					break
				else
					M1HitRegistry = nil
				end
			end

			M1HitRegistry = M1HitRegistry or k.Parent and k:HasTag("M1HitRegistry") and k
			if M1HitRegistry then
				HitHiddenPart(M1HitRegistry)
				return true
			end
			GetChargedClouds()[k] = nil
		end
	end

	PlayHiddenBellTune = function(arg, arg2)
		for i_, note in ipairs(arg.notes) do
			local str2 = tostring(note)
			local n = arg.start + (i_ - 1) * arg.beat
			local v6 = workspace
			local n3 = n + arg.good

			if v6:GetServerTimeNow() <= n3 then
				if str2 == "Fruit" and not GetHiddenFruitM1() then
					pcall(EnsureHiddenFruit, "Echoes Through the Clouds")
				end

				local v7 = EquipHiddenWeapon(str2 == "Fruit" and "Blox Fruit" or str2)

				while true do local __brk = false repeat 
					task.wait()

					if v7 and v7.Parent ~= localPlayer.Character then
						pcall(localPlayer.Character.Humanoid.EquipTool, localPlayer.Character.Humanoid, v7)
					end

					if not (workspace:GetServerTimeNow() >= n - 0.08 or not IsSecretQuestOn()) then
						break
					end
					__brk = true break
				until true if __brk then break end end

				FaceHiddenTarget(arg2.Position)

				if str2 == "Gun" and v7 then
					local v8 = workspace.CurrentCamera:WorldToViewportPoint(arg2.Position)
					local v9 = getupvalues(require(ReplicatedStorage.Controllers.CombatController).Attack)[9]

					if type(v9) == "function" and v7.Parent == localPlayer.Character then
						local guiInset = game:GetService("GuiService"):GetGuiInset()

						pcall(v9, v7, {
							UserInputType = Enum.UserInputType.Touch,
							Position = Vector3.new(v8.X - guiInset.X, v8.Y - guiInset.Y, 0),
						})
					else
						pcall(function()
							VirtualInputManager:SendMouseButtonEvent(v8.X, v8.Y, 0, true, game, 0)
						end)

						pcall(function()
							VirtualInputManager:SendMouseButtonEvent(v8.X, v8.Y, 0, false, game, 0)
						end)
					end
				elseif str2 == "Fruit" and v7 then
					pcall(function()
						VirtualInputManager:SendKeyEvent(true, "Z", false, game)
					end)

					pcall(function()
						VirtualInputManager:SendKeyEvent(false, "Z", false, game)
					end)
				elseif str2 == "Fruit" then
					NotifyHiddenFruitM1("Echoes Through the Clouds")
				end

				if str2 ~= "Gun" then
					HiddenModules.RegisterAttack:FireServer(0.3)
					HiddenModules.RegisterHit:FireServer(arg2)
				end
			end
		end

		HiddenEvent.bellQuiet = tick() + 6
		task.wait(1)
	end

	FindHiddenRaidShip = function(arg)
		local v6 = nil
		local v7

		local function fn(arg2)
			for _, child in ipairs(arg2:GetChildren()) do
				if child:IsA("Model") and child ~= workspace.Map then
					local v8 = string.lower(child.Name)

					if string.find(v8, "ship", 1, true) or string.find(v8, "brigade", 1, true) or string.find(v8, "galleon", 1, true) or string.find(v8, "boat", 1, true) then
						local ok, result = pcall(function()
							return child:GetPivot().Position
						end)

						if ok then
							local magnitude = (result - arg).Magnitude

							if magnitude < 2500 and (not v7 or magnitude < v7) then
								v6 = child
								v7 = magnitude
							end
						end
					end
				end
			end
		end

		fn(workspace)
		fn(workspace.Map)
		fn(workspace.Enemies)
		return v6
	end

	ListHiddenRaidShips = function(arg)
		local tbl9 = {}

		local function fn(arg2)
			for _, child in ipairs(arg2:GetChildren()) do
				if child:IsA("Model") and child ~= workspace.Map then
					local v6 = string.lower(child.Name)

					if string.find(v6, "brigade", 1, true) or string.find(v6, "ship", 1, true) or string.find(v6, "galleon", 1, true) then
						local ok, result = pcall(function()
							return child:GetPivot().Position
						end)

						if ok and (result - arg).Magnitude < 3000 then
							table.insert(tbl9, { model = child, pos = result, dist = (result - arg).Magnitude })
						end
					end
				end
			end
		end

		fn(workspace.Enemies)
		fn(workspace)
		fn(workspace.Map)

		table.sort(tbl9, function(arg2, arg3)
			return arg2.dist < arg3.dist
		end)

		return tbl9
	end

	ListenHiddenRaidChat = function()
		if HiddenEvent.raidChat then
			return
		end
		local tbl9 = {}

		for _, descendant in ipairs(ReplicatedStorage:GetDescendants()) do
			if (descendant:IsA("RemoteEvent") or descendant:IsA("UnreliableRemoteEvent")) and string.find(descendant.Name, "Chat", 1, true) then
				table.insert(tbl9, descendant)
			end
		end

		if #tbl9 == 0 then
			return
		end
		HiddenEvent.raidChat = true

		local function fn(...)
			local str2 = ""

			local function fn2(arg)
				if type(arg) == "string" then
					str2 = str2 .. (" " .. arg)
				elseif type(arg) == "table" then
					for _, v6 in pairs(arg) do
						if type(v6) == "string" then
							str2 = str2 .. (" " .. v6)
						end
					end
				end
			end

			for _, v6 in ipairs({ ... }) do
				fn2(v6)
			end

			str2 = string.lower(str2)

			if string.find(str2, "pirate sails", 1, true) or string.find(str2, "fleet will be", 1, true) or string.find(str2, "lookouts have spotted", 1, true) then
				HiddenEvent.raidWarn = tick()
				HiddenNotify("Pirate fleet spotted, manning the fortress cannons", "raidwarn" .. math.floor(tick() / 60), "found")
			end
		end

		for _, v6 in ipairs(tbl9) do
			v6.OnClientEvent:Connect(fn)
		end
	end

	GetCannonAimState = function(arg)
		if HiddenEvent.cannonState and HiddenEvent.cannonState.seat == arg then
			return HiddenEvent.cannonState
		end

		if tick() - (HiddenEvent.cannonScanAt or 0) < 3 then
			return nil
		end
		HiddenEvent.cannonScanAt = tick()

		for _, v6 in pairs(getgc(true)) do
			if type(v6) == "table" and rawget(v6, "targetYaw") ~= nil and rawget(v6, "seat") == arg then
				HiddenEvent.cannonState = v6
				return v6
			end
		end
	end

	SetCannonAim = function(arg, arg2)
		local center = arg.center
		local position = arg.seat.Position
		local vector = Vector3.new(arg2.X - center.X, 0, arg2.Z - center.Z)
		if vector.Magnitude < 40 then
			return
		end
		local vector2 = Vector3.new(arg2.X - position.X, 0, arg2.Z - position.Z)
		local restForward = vector2.Magnitude <= 0.01 and arg.restForward or vector2.Unit
		local n = math.clamp(arg2.Y - position.Y, -300, 60)
		local n3 = position + restForward * math.clamp(vector2.Magnitude, 8, 700) + Vector3.new(0, n, 0)
		local restForward2 = arg.restForward
		local targetYaw = (math.atan2(vector.Unit.X, vector.Unit.Z) - math.atan2(restForward2.X, restForward2.Z) + 3.1415926535897931) % 6.2831853071795862 - 3.1415926535897931
		local n4 = math.max(Vector3.new(n3.X - position.X, 0, n3.Z - position.Z).Magnitude, 8) / 180
		local targetPitch = math.clamp(math.atan2((n3.Y - position.Y + 2.25 + 0.5 * workspace.Gravity * n4 * n4) / n4, 180), 0, 1.1344640137963142)
		arg.targetYaw = targetYaw
		arg.targetPitch = targetPitch
		arg.yaw = targetYaw
		arg.pitch = targetPitch
		arg.yawVel = 0
		local model = arg.model
		local parent

		if model then
			parent = model
		else
			parent = arg.seat and arg.seat.Parent
		end

		local remotes = ReplicatedStorage:FindFirstChild("Remotes")
		remotes = remotes and remotes:FindFirstChild("MarineBusterAim")
		local flag = parent and remotes

		if flag then
			flag = tick() - (HiddenEvent.cannonRelay or 0) > 0.05
		end

		if flag then
			HiddenEvent.cannonRelay = tick()

			pcall(function()
				remotes:FireServer(parent, targetYaw, targetPitch)
			end)
		end
	end

	AimHiddenCannon = function(cannonTarget)
		local bonusMomentLocations = workspace.Map.MarineBase:FindFirstChild("BonusMoment_Locations")
		local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")
		local seatPart = humanoid and humanoid.SeatPart

		if not seatPart or seatPart.Parent.Name ~= "MarineBusterCannon" then
			local v6 = ipairs
			bonusMomentLocations = bonusMomentLocations and bonusMomentLocations:GetChildren() or {}
			local v7 = nil
			seatPart = nil

			for _, bonusMomentLocation in v6(bonusMomentLocations) do
				local seat = bonusMomentLocation.Name == "MarineBusterCannon" and bonusMomentLocation:FindFirstChild("Seat")
				local flag

				if seat then
					flag = not seat.Occupant or seat.Occupant.Parent == localPlayer.Character
				else
					flag = seat
				end

				if flag then
					local magnitude = (seat.Position - cannonTarget).Magnitude

					if not v7 or magnitude < v7 then
						v7 = magnitude
						seatPart = seat
					end
				end
			end

			if not seatPart then
				return false
			end

			if localPlayer:DistanceFromCharacter(seatPart.Position) > 10 then
				HiddenMove(seatPart.CFrame * CFrame.new(0, 4, 0))
				return true
			end
			HiddenRelease()
			TweenManager.CancelTweenOnly()
			localPlayer.Character.HumanoidRootPart.CFrame = seatPart.CFrame * CFrame.new(0, 2, 0)
			task.wait(0.2)
			seatPart:Sit(humanoid)
			task.wait(0.6)
			HiddenEvent.cannonState = nil
		end

		local v6 = GetCannonAimState(seatPart)
		if not v6 then
			return false
		end
		HiddenEvent.cannonTarget = cannonTarget

		if not HiddenEvent.cannonLoop then
			HiddenEvent.cannonLoop = game:GetService("RunService").RenderStepped:Connect(function(...) end)
		end

		pcall(SetCannonAim, v6, cannonTarget)
		task.wait(0.2)
		return true
	end

	FireHiddenCannon = function(arg)
		local bonusMomentLocations = workspace.Map.MarineBase:FindFirstChild("BonusMoment_Locations")
		local v6 = ipairs
		bonusMomentLocations = bonusMomentLocations and bonusMomentLocations:GetChildren() or {}
		local v7 = nil
		local v8 = nil

		for _, bonusMomentLocation in v6(bonusMomentLocations) do
			local seat = bonusMomentLocation.Name == "MarineBusterCannon" and bonusMomentLocation:FindFirstChild("Seat")

			if seat and (not seat.Occupant or seat.Occupant.Parent == localPlayer.Character) then
				local magnitude = (seat.Position - arg).Magnitude

				if not v7 or magnitude < v7 then
					v7 = magnitude
					v8 = seat
				end
			end
		end

		if not v8 then
			return false
		end
		local humanoid = localPlayer.Character:FindFirstChildOfClass("Humanoid")

		if humanoid.SeatPart ~= v8 then
			if localPlayer:DistanceFromCharacter(v8.Position) > 8 then
				HiddenMove(v8.CFrame * CFrame.new(0, 3, 0))
				return true
			end
			HiddenRelease()
			TweenManager.CancelTweenOnly()
			localPlayer.Character.HumanoidRootPart.CFrame = v8.CFrame * CFrame.new(0, 2, 0)
			task.wait(0.2)
			v8:Sit(humanoid)
			task.wait(0.5)
		end

		local currentCamera = workspace.CurrentCamera
		currentCamera.CFrame = CFrame.lookAt(v8.Position + Vector3.new(0, 12, 0) + (v8.Position - arg).Unit * 10, arg)
		task.wait(0.1)
		local v9, v10 = currentCamera:WorldToViewportPoint(arg)

		if v10 then
			pcall(function()
				VirtualInputManager:SendMouseButtonEvent(v9.X, v9.Y, 0, true, game, 0)
			end)

			task.wait(0.05)

			pcall(function()
				VirtualInputManager:SendMouseButtonEvent(v9.X, v9.Y, 0, false, game, 0)
			end)
		end

		task.wait(0.6)
		return true
	end

	ShootHiddenCannon = function(arg)
		local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")
		humanoid = humanoid and humanoid.SeatPart
		if not humanoid or humanoid.Parent.Name ~= "MarineBusterCannon" then
			return false
		end

		if tick() - (HiddenEvent.cannonShot or 0) < 1.2 then
			return true
		end
		local currentCamera = workspace.CurrentCamera
		local v6, v7 = currentCamera:WorldToViewportPoint(arg)

		if not v7 then
			currentCamera.CFrame = CFrame.lookAt(humanoid.Position + Vector3.new(0, 10, 0) + (humanoid.Position - arg).Unit * 8, arg)
			task.wait(0.12)
			v6, v7 = currentCamera:WorldToViewportPoint(arg)
		end

		if not v7 then
			return false
		end
		HiddenEvent.cannonShot = tick()

		pcall(function()
			VirtualInputManager:SendMouseButtonEvent(v6.X, v6.Y, 0, true, game, 0)
		end)

		task.wait(0.06)

		pcall(function()
			VirtualInputManager:SendMouseButtonEvent(v6.X, v6.Y, 0, false, game, 0)
		end)

		return true
	end

	LeaveHiddenCannon = function()
		local humanoid = localPlayer.Character and localPlayer.Character:FindFirstChildOfClass("Humanoid")

		if humanoid and humanoid.SeatPart and humanoid.SeatPart.Parent.Name == "MarineBusterCannon" then
			humanoid.Sit = false
			humanoid.Jump = true
		end
	end

	AttackHiddenSpot = function(arg)
		if localPlayer:DistanceFromCharacter(arg.Position) > 10 then
			HiddenMove(arg.CFrame * CFrame.new(0, 4, 4))
			return
		end
		HiddenHold(arg.CFrame * CFrame.new(0, 4, 4))
		EquipHiddenWeapon("Melee")

		if os.clock() - (HiddenEvent.lastHit or 0) >= 0.4 then
			HiddenEvent.lastHit = os.clock()
			HiddenModules.RegisterAttack:FireServer(0.3)
			HiddenModules.RegisterHit:FireServer(arg)
		end
	end

	RunMagmaOreCave = function()
		local magmaCave = workspace.Map:FindFirstChild("MagmaCave")
		local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not magmaCave or not humanoidRootPart then
			return
		end
		local bonusMomentLocations = magmaCave:FindFirstChild("BonusMoment_Locations")
		bonusMomentLocations = bonusMomentLocations and bonusMomentLocations:FindFirstChildWhichIsA("BasePart")
		if not bonusMomentLocations or (humanoidRootPart.Position - bonusMomentLocations.Position).Magnitude > 1500 then
			return
		end

		for _, child in ipairs(workspace.Enemies:GetChildren()) do
			if child.Name == "Magma Drill" and IsHiddenTarget(child) then
				KillHiddenEnemy(child)
				HiddenEvent.checked = 0
				return "Destroy the Magma Drill"
			end
		end
	end

	FindAwakenedBoss = function(arg, arg2)
		for _, child in ipairs(workspace.Enemies:GetChildren()) do
			if child:GetAttribute("BossIndicatorAwakened") and IsHiddenTarget(child) then
				local flag = true

				if arg2 then
					flag = false

					for _, v6 in ipairs(arg2) do
						if string.find(child.Name, v6, 1, true) then
							flag = true
						end
					end
				end

				if flag and (not arg or (child:GetPivot().Position - arg).Magnitude < 3000) then
					return child
				end
			end
		end
	end

	HitHiddenTriggers = function(arg, arg2)
		local v6 = nil
		local v7 = nil

		for _, v8 in ipairs(arg) do
			local descendants = v8 and v8:GetDescendants() or {}
			table.insert(descendants, v8)

			for _, descendant in ipairs(descendants) do
				if descendant:IsA("BasePart") and descendant:HasTag("M1HitRegistry") and (arg2 or descendant.Transparency < 1) then
					local v9 = localPlayer:DistanceFromCharacter(descendant.Position)

					if not v6 or v9 < v6 then
						v6 = v9
						v7 = descendant
					end
				end
			end
		end

		if v7 then
			HitHiddenPart(v7)
			return true
		end
	end

	GetHiddenBossHour = function()
		local v6 = os.date("!%Y%m%d%H")

		if not HiddenEvent.bossHour or HiddenEvent.bossHour.key ~= v6 then
			HiddenEvent.bossHour = { key = v6, checked = {}, active = nil }
			local expectedBoss = HiddenEvent.expectedBoss

			if expectedBoss and expectedBoss.key == v6 then
				for _, v7 in ipairs(HiddenQuests) do
					if v7.BossNames and not IsHiddenBossHinted(expectedBoss.hint, v7.HintIsland, v7.BossNames) then
						HiddenEvent.bossHour.checked[v7.Name] = true
					end
				end
			end
		end

		return HiddenEvent.bossHour
	end

	IsHiddenBossHinted = function(arg, arg2, arg3)
		if not arg.Island then
			return false
		end

		if table.find(arg3, arg.Boss) then
			return true
		end

		for _, v6 in ipairs(HiddenQuests) do
			if v6.BossNames and table.find(v6.BossNames, arg.Boss) then
				return false
			end
		end

		return arg.Island == arg2
	end

	IsHiddenHourUseful = function(arg)
		local v6 = GetHiddenRaidHint()
		if not v6 or not v6.Island or not v6.Boss then
			return true
		end

		for _, v7 in ipairs(HiddenQuests) do repeat 
			if arg["Sea1/" .. v7.Island .. "/" .. v7.Name] ~= true then
				if v7.BossNames then
					if IsHiddenBossHinted(v6, v7.HintIsland or v7.Island, v7.BossNames) then
						return true
					end
					break
				end

				if v6.Island == (v7.HintIsland or v7.Island) then
					return true
				end
			end
		until true end

		return false
	end

	ListHiddenServers = function()
		local tbl9 = {}

		local ok, result = pcall(function()
			return ReplicatedStorage.__ServerBrowser:InvokeServer(1)
		end)

		if ok and type(result) == "table" then
			for k in pairs(result) do
				if type(k) == "string" then
					tbl9[k] = true
				end
			end
		end

		return tbl9
	end

	QueueHiddenReload = function()
		return true
	end

	HopHiddenServer = function()
		HiddenEvent.hopped = HiddenEvent.hopped or {}
		QueueHiddenReload()
		local v6 = ListHiddenServers()

		for i_ = 1, 2 do
			for k in pairs(v6) do
				if k ~= game.JobId and not HiddenEvent.hopped[k] then
					HiddenEvent.hopped[k] = true
					HiddenNotify("Dead boss hour, switching server", "hop" .. k, "travel")

					local function fn()
						ReplicatedStorage.__ServerBrowser:InvokeServer("teleport", k)
					end

					pcall(fn)
					return true
				end
			end

			HiddenEvent.hopped = {}
		end

		return false
	end

	RunChefsKiss = function(arg)
		local chefMissing = HiddenEvent.chefMissing
		local flag

		if chefMissing then
			local time_ = HiddenEvent.chefMissing.time
			flag = tick() - time_ < 300
		else
			flag = chefMissing
		end

		if flag then
			local v6 = GatherChefIngredients(arg)
			if v6 then
				return v6
			end
			HiddenEvent.chefMissing = nil
			HiddenEvent.cooked = 0
		end

		local cauldronMoment = workspace.Map.Pirate:FindFirstChild("Cauldron_Moment")

		if cauldronMoment then
			cauldronMoment = cauldronMoment:FindFirstChild("Cauldron") or cauldronMoment:FindFirstChildWhichIsA("BasePart", true)
		end

		local flag2 = not cauldronMoment

		if not flag2 then
			flag2 = tick() - (HiddenEvent.cooked or 0) <= 15
		end

		if flag2 then
			return
		end

		if not HiddenSettle(cauldronMoment:GetPivot().Position + Vector3.new(0, 3, 6), 10) then
			return "Go to the tavern cauldron"
		end
		HiddenEvent.cooked = tick()
		local response = arg:InvokeServer("OpenCauldron")
		if type(response) ~= "table" then
			return "Waiting for the cauldron to open"
		end
		local tbl9 = {}
		local v6 = ipairs
		local slots = response.Slots or {}

		for _, slot in v6(slots) do
			if not response.Placed[slot] then
				local v7 = pairs
				local owned = response.Owned and response.Owned[slot] or {}
				local flag3 = nil

				for k, v8 in v7(owned) do
					if not (v8 > 0) then
						flag3 = nil
					else
						local response2 = arg:InvokeServer("Insert", k)

						if type(response2) == "table" then
							flag3 = true
							response = response2
							break
						else
							flag3 = nil
						end
					end
				end

				if not flag3 then
					table.insert(tbl9, tostring(response.Examples and response.Examples[slot] and response.Examples[slot][1] or slot))
				end
			end
		end

		if #tbl9 > 0 then
			arg:FireServer("CloseCauldron")
			HiddenNotify("Chef's Kiss needs: " .. table.concat(tbl9, ", "), "chefmissing", "warning")
			HiddenEvent.chefMissing = { time = tick(), text = "Chef's Kiss needs " .. table.concat(tbl9, ", "), needs = response.Slots }
			return HiddenEvent.chefMissing.text, true
		end

		local response2 = arg:InvokeServer("Cook")
		arg:FireServer("CloseCauldron")
		HiddenEvent.awakened = HiddenEvent.awakened or {}

		if response2 == "Cooked" then
			HiddenEvent.awakened["Chef's Kiss"] = tick()
			HiddenNotify("Chef's Kiss: recipe cooked, the Chef is awakening", "chefcooked", "success")
		end

		return "Cook the Chef's recipe"
	end

	CreateBossQuest = function(arg, active, arg2, arg3, arg4, arg5)
		return {
			Island = arg,
			Name = active,
			HintIsland = arg2,
			BossNames = arg3,
			RetryDelay = 300,
			Precheck = function(arg6)
				local v6 = GetHiddenBossHour()
				local flag = IsHiddenBossHinted(arg6, arg2, arg3) or v6.active == active
				local flag2

				if flag then
					flag2 = flag
				else
					flag2 = tick() - ((HiddenEvent.announced or {})[active] or 0) < 400
				end

				if flag2 then
					return true
				end

				if v6.active then
					return false, "awakened boss is on " .. tostring(v6.active) .. " this hour"
				end
				return false, "waiting for the XX:50 boss hint"
			end,
			Run = function(arg6)
				local v6 = GetHiddenIsland(arg)
				local position = v6 and v6.World.Position or localPlayer.Character:GetPivot().Position
				FindHiddenBoss(arg3, position)
				HiddenEvent.awakened = HiddenEvent.awakened or {}
				local v7 = FindAwakenedBoss(position, arg3)

				if v7 then
					GetHiddenBossHour().active = active
					HiddenEvent.bossFight = { quest = active, time = tick() }
					KillHiddenEnemy(v7)
					HiddenEvent.checked = 0
					return "Defeat the awakened " .. v7.Name
				end

				local v8 = GetHiddenBossHour()
				local v9 = GetHiddenRaidHint()
				local v10 = IsHiddenBossHinted(v9, arg2, arg3)

				if arg6.Active and not v10 and os.date("!*t").min >= 12 then
					v8.checked[active] = true
					v8.active = nil
					return arg3[1] .. " window passed this hour, wait for XX:50 hint", true
				end

				if arg6.Active then
					v8.active = active

					if arg4 then
						local v11, v12 = arg4(arg6)
						if v11 then
							return v11, v12
						end
					end

					return "Waiting for " .. arg3[1] .. " to awaken"
				end

				if v8.active == active then
					v8.active = nil
				end

				if v10 then
					local num = tonumber(v9.Seconds)
					local flag = arg5

					if arg5 then
						flag = v9.State == "Triggered"

						if not flag then
							flag = (num or math.huge) <= 0
						end
					end

					if flag then
						local v11, v12 = arg5(arg6)
						if v11 then
							return v11, v12
						end
					end

					return arg3[1] .. " stirs on " .. arg .. (num and " in ~" .. FormatMagnetTime(num) or " soon"), (num or 0) > 180
				end

				v8.checked[active] = true
				return "No awakened " .. arg3[1] .. " this hour", true
			end,
		}
	end

	do
		local tbl9 = {}

		local Jungle = CreateBossQuest("Jungle", "Banana Tree", "Jungle", { "Gorilla King" }, function()
			local v6 = GetHiddenState("Banana Tree", function(arg, arg2, arg3)
				if arg2 == "Availability" then
					arg.tree = typeof(arg3) == "Instance" and arg3 or nil
				elseif arg2 == "Reset" or arg2 == "Finale" then
					arg.tree = nil
				end
			end)

			if HitHiddenTriggers({ v6.tree and v6.tree.Parent and v6.tree or workspace.Map.Jungle:FindFirstChild("BananaTrees") }) then
				return "Shake the banana tree"
			end
		end)

		local v6 = CreateBossQuest("Frozen Village", "Frozen Defense", "Frozen Village", { "Yeti" }, function()
			local bonusMomentLocations = workspace.Map.Ice:FindFirstChild("BonusMoment_Locations")
			local v6 = ipairs
			local descendants = bonusMomentLocations and bonusMomentLocations:GetDescendants() or {}
			local v7 = nil
			local v8 = nil

			for _, descendant in v6(descendants) do
				local attribute = descendant:GetAttribute("FrozenDefenseRockPresent")
				local isBasePart = descendant:IsA("BasePart") and descendant or descendant:IsA("Model") and (descendant.PrimaryPart or descendant:FindFirstChildWhichIsA("BasePart", true))

				if attribute ~= nil and attribute ~= false and isBasePart then
					local v9 = localPlayer:DistanceFromCharacter(isBasePart.Position)

					if not v7 or v9 < v7 then
						v7 = v9
						v8 = isBasePart
					end
				end
			end

			if v8 then
				AttackHiddenSpot(v8)
				return "Break the cursed ice rocks"
			end

			if HitHiddenTriggers({ bonusMomentLocations }) then
				return "Break the cursed ice rocks"
			end
			local bossFight = HiddenEvent.bossFight
			local flag = bossFight and bossFight.quest == "Frozen Defense"

			if flag then
				local time_ = bossFight.time
				flag = tick() - time_ < 240
			end

			if flag then
				local position = GetHiddenIsland("Frozen Village")
				position = position and position.World.Position

				for _, child in ipairs(workspace.NPCs:GetChildren()) do
					if string.find(string.lower(child.Name), "villager", 1, true) and position and (child:GetPivot().Position - position).Magnitude < 900 then
						if not HiddenSettle(child:GetPivot().Position + Vector3.new(0, 2, 4), 8) then
							return "Go to " .. child.Name
						end
						TalkHiddenQuestNpc(child.Name, { "Yeti", "thank", "reward", "done" })
						HiddenEvent.bossFight = nil
						return "Report the Yeti to " .. child.Name
					end
				end
			end
		end)

		local v7 = CreateBossQuest("Magma Village", "One Last Eruption", "Magma Village", { "Magma Admiral", "Magma General" }, function(arg)
			local v7 = GetHiddenState("One Last Eruption", function(arg2, arg3, spots)
				if arg3 == "Setup" and type(spots) == "table" then
					arg2.spots = spots
					arg2.destroyed = {}
				elseif arg3 == "Destroyed" and arg2.destroyed then
					arg2.destroyed[spots] = true
				end
			end)

			if not v7.spots then
				if tick() - (v7.asked or 0) > 5 then
					v7.asked = tick()
					arg:FireServer("Init")
				end

				return "Waiting for the lava fissures"
			end

			local bonusMomentLocations = workspace.Map.Magma:FindFirstChild("BonusMoment_Locations")
			local v8 = nil
			local v9 = nil

			for k, spot in pairs(v7.spots) do
				if not v7.destroyed[k] then
					local v10 = localPlayer:DistanceFromCharacter(spot.Position)

					if not v8 or v10 < v8 then
						v8 = v10
						v9 = spot
					end
				end
			end

			if not v9 then
				return
			end

			if v8 > 10 then
				HiddenMove(v9 * CFrame.new(0, 4, 3))
				return "Go to the next lava fissure"
			end
			local v10 = ipairs
			bonusMomentLocations = bonusMomentLocations and bonusMomentLocations:GetChildren() or {}
			local v11 = nil
			local v12 = nil

			for _, bonusMomentLocation in v10(bonusMomentLocations) do
				if bonusMomentLocation.Name == "Volcano Fissure" and bonusMomentLocation:IsA("BasePart") then
					local magnitude = (bonusMomentLocation.Position - v9.Position).Magnitude

					if not v11 or magnitude < v11 then
						v11 = magnitude
						v12 = bonusMomentLocation
					end
				end
			end

			HiddenHold(v9 * CFrame.new(0, 4, 3))
			EquipHiddenWeapon("Melee")
			HiddenModules.RegisterAttack:FireServer(0.3)
			local v13 = nil
			local v14 = nil

			for _, child in ipairs(workspace:GetChildren()) do
				if child.Name == "MagmaFissure" and child:IsA("Model") then
					local ok, result = pcall(child.GetPivot, child)
					ok = ok and (result.Position - v9.Position).Magnitude

					if ok and (not v13 or ok < v13) then
						v13 = ok
						v14 = child
					end
				end
			end

			if v14 and v13 < 25 then
				local flag = false

				for _, descendant in ipairs(v14:GetDescendants()) do
					if descendant:IsA("BasePart") then
						HiddenModules.RegisterHit:FireServer(descendant)
						flag = true
					end
				end

				if not flag then
					HiddenModules.RegisterHit:FireServer(v14)
				end
			elseif v12 then
				HiddenModules.RegisterHit:FireServer(v12)
			end

			pcall(getgenv().ClickM1)
			task.wait(0.35)
			return "Break the lava fissures"
		end)

		local Fountain = CreateBossQuest("Fountain", "Fountain Wire Repair", "Fountain City", { "Cyborg" }, function()
			if HitHiddenTriggers({ workspace._WorldOrigin:FindFirstChild("FountainWireNodes") }, true) then
				return "Repair the sparking wires"
			end
		end)

		local v8 = CreateBossQuest("Marine Fortress", "Fortress Under Fire", "Marine Fortress", { "Vice Admiral" }, function()
			local bonusMomentLocations = workspace.Map.MarineBase:FindFirstChild("BonusMoment_Locations")
			bonusMomentLocations = bonusMomentLocations and bonusMomentLocations:FindFirstChild("MainBase")
			if not bonusMomentLocations then
				return
			end
			local y = nil
			local v8 = nil

			for _, descendant in ipairs(bonusMomentLocations:GetDescendants()) do
				if descendant:IsA("BasePart") and descendant.Transparency < 1 and (descendant:HasTag("M1HitRegistry") or descendant.Name:find("Target")) then
					if not y or descendant.Position.Y > y then
						y = descendant.Position.Y
						v8 = descendant
					end
				end
			end

			local boundingBox, v9 = bonusMomentLocations:GetBoundingBox()
			if FireHiddenCannon(v8 and v8.Position or boundingBox.Position + Vector3.new(0, v9.Y / 4, 0)) then
				return "Shell the fortress building with the cannon"
			end
		end)

		local SkyArea2 = CreateBossQuest("SkyArea2", "The Tyrant Awakens", "Upper Skylands", { "Wysper", "Sky Warlord", "Tyrant" }, function()
			local skyArea2 = workspace.Map:FindFirstChild("SkyArea2")
			local v9 = HitHiddenTriggers
			local tbl10 = {}
			local tyrantClouds = skyArea2 and skyArea2:FindFirstChild("TyrantClouds")
			skyArea2 = skyArea2 and skyArea2:FindFirstChild("BonusMoment_Locations")
			tbl10[1] = tyrantClouds
			tbl10[2] = skyArea2
			if v9(tbl10) then
				return "Break the dark clouds"
			end
		end)

		local SkyArea22 = CreateBossQuest("SkyArea2", "Echoes Through the Clouds", "Upper Skylands", { "Thunder God", "Lightning God" }, function()
			local v9 = GetHiddenState("Echoes Through the Clouds", function(arg, arg2, arg3, arg4, arg5, arg6, arg7)
				if arg2 == "Listen" and type(arg3) == "table" and type(arg4) == "number" and type(arg5) == "number" then
					arg.round = { notes = arg3, start = arg4, beat = arg5, good = tonumber(arg7) or 0.7 }
					arg.listen = tick()
				elseif arg2 == "Finale" or arg2 == "Witness" or arg2 == "SetActive" then
					arg.round = nil
				end
			end)

			local goldenBell = workspace.Map:FindFirstChild("SkyArea2") and workspace.Map.SkyArea2:FindFirstChild("Golden Bell")

			if goldenBell then
				goldenBell = goldenBell:FindFirstChild("Bell", true) or goldenBell:FindFirstChildWhichIsA("BasePart", true)
			end

			if not goldenBell then
				return
			end

			if not HiddenSettle(goldenBell.Position + Vector3.new(0, 2, 7), 10) then
				return "Go to the Golden Bell"
			end
			local round = v9.round
			local flag

			if round then
				local n = round.start + #round.notes * round.beat
				flag = workspace:GetServerTimeNow() < n
			else
				flag = round
			end

			if flag then
				v9.round = nil
				PlayHiddenBellTune(round, goldenBell)
				return "Play the bell tune (" .. #round.notes .. " notes)"
			end

			local flag2 = tick() < (HiddenEvent.bellQuiet or 0)

			if not flag2 then
				flag2 = tick() - (v9.listen or 0) < 12
			end

			if flag2 then
				return "Listen to the bell"
			end
			EquipHiddenWeapon("Melee")
			HiddenModules.RegisterAttack:FireServer(0.3)
			HiddenModules.RegisterHit:FireServer(goldenBell)
			task.wait(1)
			return "Ring the Golden Bell"
		end)

		local v9 = CreateBossQuest("Underwater City", "Pearl of the Deep", "Underwater City", { "Fishman Lord" }, function(arg)
			if not HiddenEvent.clamListener then
				HiddenEvent.clamListener = ListenHiddenMoment("Pearl of the Deep", function(arg2, arg3)
					if arg2 == "ClamRespawned" and HiddenEvent.openedClams then
						HiddenEvent.openedClams[arg3] = nil
					elseif arg2 == "SetActive" or arg2 == "Loaded" then
						HiddenEvent.openedClams = {}
					end
				end)
			end

			HiddenEvent.openedClams = HiddenEvent.openedClams or {}
			if os.date("!*t").min >= 45 then
				return "Saving the clams for the XX:00 Fishman Lord window", true
			end
			local position = localPlayer.Character:GetPivot().Position

			for _, child in ipairs(workspace.Enemies:GetChildren()) do
				if IsHiddenTarget(child) and string.find(child.Name, "Mimic") and (child:GetPivot().Position - position).Magnitude < 300 then
					KillHiddenEnemy(child)
					return "Defeat the mimic clam"
				end
			end

			local v9 = nil
			local v10 = nil

			for _, v11 in ipairs(game:GetService("CollectionService"):GetTagged("PearlClam")) do
				local isBasePart = v11:IsA("BasePart") and v11 or v11:FindFirstChildWhichIsA("BasePart", true)

				if isBasePart and v11:IsDescendantOf(workspace) and not HiddenEvent.openedClams[v11] then
					local v12 = localPlayer:DistanceFromCharacter(isBasePart.Position)

					if not v9 or v12 < v9 then
						v9 = v12
						v10 = v11
					end
				end
			end

			if not v10 then
				local v11 = FindHiddenBoss({ "Fishman Lord" }, position)
				if v11 then
					KillHiddenEnemy(v11)
					return "Defeat Fishman Lord while the clams refill"
				end
				return "Waiting for the clams to reappear", true
			end

			if HiddenSettle((v10:IsA("BasePart") and v10 or v10:FindFirstChildWhichIsA("BasePart", true)).CFrame * Vector3.new(0, 0, -3.5) + Vector3.new(0, 2, 0), 9) then
				local response = arg:InvokeServer("OpenClam", v10)
				HiddenEvent.openedClams[v10] = tick()
				HiddenEvent.arrived = nil

				if response == "Black" then
					task.wait(1.5)

					for i_ = 1, 5 do
						if arg:InvokeServer("ClaimPearl") == true then
							HiddenEvent.awakened["Pearl of the Deep"] = tick()
							HiddenNotify("Found the black pearl, the Fishman Lord awakens", nil, "found")
							break
						else
							task.wait(1)
						end
					end
				end
			end

			return "Search the clams for the black pearl"
		end)

		local v10 = CreateBossQuest("Pirate Village", "Chef's Kiss", "Pirate Village", { "Chef" }, RunChefsKiss, RunChefsKiss)

		local Prison = CreateBossQuest("Prison", "Lever Jailbreak", "Prison", { "Warden" }, function(arg)
			local bonusMomentLocations = workspace.Map.Prison:FindFirstChild("BonusMoment_Locations", true)
			bonusMomentLocations = bonusMomentLocations and bonusMomentLocations:FindFirstChild("Levers")
			if not bonusMomentLocations then
				return
			end
			local tbl10 = {}

			for _, child in ipairs(bonusMomentLocations:GetChildren()) do
				local lever = child:FindFirstChild("Lever")

				if lever then
					table.insert(tbl10, lever)
				end
			end

			table.sort(tbl10, function(arg2, arg3)
				if math.abs(arg2.Position.X - arg3.Position.X) <= 0.001 then
					return arg2.Position.Z < arg3.Position.Z
				end
				return arg2.Position.X < arg3.Position.X
			end)

			local leverPuzzle = HiddenEvent.leverPuzzle or { known = {}, pulled = 0, wrong = {} }
			HiddenEvent.leverPuzzle = leverPuzzle
			local v11

			if leverPuzzle.pulled < #leverPuzzle.known then
				v11 = leverPuzzle.known[leverPuzzle.pulled + 1]
			else
				local tbl11 = { 2, 3, 4, 1 }

				for i_ = 1, #tbl10 do
					if not table.find(tbl11, i_) then
						table.insert(tbl11, i_)
					end
				end

				v11 = tbl11[#leverPuzzle.known + 1]
				local flag = v11 and v11 <= #tbl10 and not table.find(leverPuzzle.known, v11) and not leverPuzzle.wrong[#leverPuzzle.known + 1 .. ":" .. v11]
				local v12 = nil

				if not flag then
					v11 = v12
				end

				for _, v13 in ipairs(tbl11) do local __brk = false repeat 
					if not v11 then
						if v13 <= #tbl10 and not table.find(leverPuzzle.known, v13) and not leverPuzzle.wrong[#leverPuzzle.known + 1 .. ":" .. v13] then
							v11 = v13
						end

						break
					end

					__brk = true break
				until true if __brk then break end end
			end

			if not v11 then
				HiddenEvent.leverPuzzle = nil
				return
			end
			local vector = Vector3.zero

			for _, v12 in ipairs(tbl10) do
				vector = vector + (v12.Position / #tbl10)
			end

			HiddenEvent.stallGrace = tick() + 5

			if HiddenSettle(vector + Vector3.new(0, 3, 8), 12) then
				local response = arg:InvokeServer("Pull", v11)
				local result = type(response) == "table" and response.Result or response

				if result == "Accepted" then
					if leverPuzzle.pulled == #leverPuzzle.known then
						table.insert(leverPuzzle.known, v11)
					end

					leverPuzzle.pulled = leverPuzzle.pulled + 1
				elseif result == "Solved" then
					HiddenEvent.leverPuzzle = nil
				elseif result == "Reset" then
					if leverPuzzle.pulled == #leverPuzzle.known then
						leverPuzzle.wrong[#leverPuzzle.known + 1 .. ":" .. v11] = true
					end

					leverPuzzle.pulled = 0
				end

				task.wait(0.4)
			end

			return "Solve the lever puzzle (" .. #leverPuzzle.known .. "/" .. #tbl10 .. ")"
		end)

		tbl9[1] = Jungle
		tbl9[2] = v6
		tbl9[3] = v7
		tbl9[4] = Fountain
		tbl9[5] = v8
		tbl9[6] = SkyArea2
		tbl9[7] = SkyArea22
		tbl9[8] = v9
		tbl9[9] = v10
		tbl9[10] = Prison

		tbl9[11] = {
			Island = "Prison",
			Name = "Escape from Alcatraz",
			Run = function(arg)
				local prisoners = arg.MiscData and arg.MiscData.Prisoners
				prisoners = type(prisoners) == "table" and prisoners or {}
				local prisonerKey = HiddenEvent.prisonerKey
				local v11 = prisonerKey and prisoners[prisonerKey]

				if not v11 or typeof(v11.Model) ~= "Instance" or not v11.Model.Parent then
					local v12 = nil
					prisonerKey = nil
					v11 = nil

					for k, prisoner in pairs(prisoners) do
						local model = prisoner.Model

						if typeof(model) == "Instance" and model.Parent then
							local v13 = localPlayer:DistanceFromCharacter(model:GetPivot().Position)

							if not v12 or v13 < v12 then
								v12 = v13
								prisonerKey = k
								v11 = prisoner
							end
						end
					end

					HiddenEvent.prisonerKey = prisonerKey
				end

				if not v11 then
					return "Waiting for prisoners to escape", true
				end
				local model = v11.Model
				local flag = HiddenEvent.provoked == model

				if flag then
					flag = tick() - (HiddenEvent.provokedAt or 0) > 25
				end

				if flag then
					HiddenEvent.provoked = nil
				end

				if HiddenEvent.provoked ~= model then
					local n = model:GetPivot() * CFrame.new(0, 1.5, 6)

					if localPlayer:DistanceFromCharacter(model:GetPivot().Position) > 12 then
						HiddenMove(n)
					else
						HiddenHold(n)
						HiddenEvent.provokeTry = HiddenEvent.provokeTry or {}

						if tick() - (HiddenEvent.provokeTry[prisonerKey] or 0) > 1.5 then
							HiddenEvent.provokeTry[prisonerKey] = tick()
							arg:InvokeServer("Provoke", prisonerKey)
							local v12 = HiddenEvent
							local v13 = HiddenEvent
							local now = tick()
							v12.provoked = model
							v13.provokedAt = now
						end
					end

					return "Confront the escaping prisoner (" .. tostring(prisonerKey) .. ")"
				end

				HiddenEvent.stallGrace = tick() + 5
				local humanoidRootPart = model:FindFirstChild("HumanoidRootPart") or model.PrimaryPart

				if humanoidRootPart then
					HitHiddenPart(humanoidRootPart)

					if model:FindFirstChildOfClass("Humanoid") then
						SizePart(model)
						pcall(BringMob, model)
						UsedualFlock()
						local cFrame = humanoidRootPart.CFrame
						getgenv().AimPos = cFrame
						HiddenMove(GetHiddenFarmCFrame(model))
						getgenv().ClickM1(model, true)
					end
				end

				return "Catch the prisoner (" .. tostring(prisonerKey) .. ")"
			end,
		}

		tbl9[12] = {
			Island = "Prison",
			Name = "Don Megalo",
			Run = function(arg)
				local v11 = GetHiddenState("Don Megalo", function(arg2, arg3, stage)
					if arg3 == "Stage" then
						arg2.stage = stage
					elseif arg3 == "GateUnlocked" then
						arg2.gateOpen = true
					end
				end)

				if tick() - (v11.initialized or 0) > 30 then
					v11.initialized = tick()
					arg:FireServer("Init")
					task.wait(1)
				end

				local v12 = FindHiddenEnemyMatch({ "Megalo Guard", "Bouncer" }, Vector3.new(5277, 5, 743), 900)
				if v12 then
					KillHiddenEnemy(v12)
					return "Defeat " .. v12.Name
				end
				local SharkCape = GetPrisonLocation("SharkCape")

				if SharkCape and v11.gateOpen then
					if HiddenSettle(SharkCape + Vector3.new(0, 1.5, 3), 8) then
						arg:FireServer("BouncerReady")
						local v13 = FindHiddenPromptNear({ workspace.Map.Prison, workspace._WorldOrigin }, SharkCape, 25)

						if v13 then
							HoldHiddenPrompt(v13)
						end

						if arg:InvokeServer("TakeCape") == true then
							arg:InvokeServer("ClaimCape")
							HiddenEvent.checked = 0
						end

						task.wait(1)
					end

					return "Hold to steal Don Megalo's coat"
				end

				local MegaloGate = GetPrisonLocation("MegaloGate")

				if MegaloGate and not v11.gateOpen then
					local Key = GetPrisonLocation("Key")

					if Key and not v11.hasKey then
						if HiddenSettle(Key + Vector3.new(0, 3, 3), 8) then
							v11.hasKey = arg:InvokeServer("TakeKey") == true
							task.wait(1)
						end

						return "Find the cell key"
					end

					if HiddenSettle(MegaloGate + Vector3.new(0, 3, 4), 8) then
						v11.gateOpen = arg:InvokeServer("Unlock") == true
						task.wait(1)
					end

					return "Unlock the tower gate"
				end

				return "Waiting for Don Megalo's tower", true
			end,
		}

		tbl9[13] = {
			Island = "Magma Village",
			Name = "Magma Ore Extraction",
			RetryDelay = 600,
			NoMoment = function()
				return RunMagmaOreCave()
			end,
			Run = function(arg)
				local v11 = RunMagmaOreCave()
				if v11 then
					return v11
				end
				local magmaOreExtraction = HiddenEvent.announced and HiddenEvent.announced["Magma Ore Extraction"]
				local flag = not arg.Active

				if flag then
					flag = not (magmaOreExtraction and tick() - magmaOreExtraction < 900)
				end

				if flag then
					return "Waiting for the drilling at Magma Village", true
				end
				local backArea = workspace.Map.Magma:FindFirstChild("BackArea")
				backArea = backArea and backArea:FindFirstChild("Elevator")
				backArea = backArea and backArea:FindFirstChild("Part")
				if not backArea then
					return "Waiting for the drilling at Magma Village", true
				end
				local humanoidRootPart = localPlayer.Character.HumanoidRootPart

				if HiddenGoTo(backArea.Position + Vector3.new(0, 4, 0), 6) then
					HiddenHold(CFrame.new(backArea.Position + Vector3.new(0, 4, 0)))
					pcall(firetouchinterest, humanoidRootPart, backArea, 0)
					task.wait(0.2)
					pcall(firetouchinterest, humanoidRootPart, backArea, 1)
					task.wait(3)
				end

				return "Take the mine elevator"
			end,
		}

		tbl9[14] = {
			Island = "Frozen Village",
			Name = "Snowman",
			Run = function(arg)
				return BuildHiddenSnowman(arg)
			end,
		}

		tbl9[15] = {
			Island = "Marine Fortress",
			Name = "Battle Plans",
			RetryDelay = 300,
			Run = function(arg)
				ListenHiddenRaidChat()

				local v11 = GetHiddenState("Battle Plans", function(arg2, arg3)
					if arg3 == "RaidStart" then
						arg2.raid = tick()
						arg2.failed = nil
					elseif arg3 == "Failed" then
						arg2.raid = nil
						arg2.failed = tick()
					end
				end)

				local position = workspace.Map.MarineBase:GetPivot().Position
				local bonusMomentLocations = workspace.Map.MarineBase:FindFirstChild("BonusMoment_Locations")
				bonusMomentLocations = bonusMomentLocations and bonusMomentLocations:FindFirstChild("PirateShip_Spawn")
				bonusMomentLocations = bonusMomentLocations and bonusMomentLocations.Position or position
				local v12 = ListHiddenRaidShips(bonusMomentLocations)
				local battlePlans = (HiddenEvent.announced or {})["Battle Plans"]
				local raidWarn = HiddenEvent.raidWarn

				if raidWarn then
					local raidWarn2 = HiddenEvent.raidWarn
					raidWarn = tick() - raidWarn2 < 900
				end

				raidWarn = raidWarn or battlePlans and tick() - battlePlans < 900
				local raid = v11.raid

				if raid then
					local raid2 = v11.raid
					raid = tick() - raid2 < 900
				end

				if not arg.Active and not raid and not raidWarn and #v12 == 0 then
					LeaveHiddenCannon()
					return "Waiting for pirates to raid the Marine Fortress", true
				end
				HiddenEvent.stallGrace = tick() + 60
				local v13 = v12[1]

				if v13 and v13.model.Parent then
					local model = v13.model
					if not AimHiddenCannon(v13.pos) then
						return "Boarding the fortress cannon"
					end

					if ShootHiddenCannon(v13.pos) then
						return "Shelling " .. model.Name .. " (" .. #v12 .. " ships left)"
					end
					return "Aiming the cannon at " .. model.Name
				end

				if AimHiddenCannon(bonusMomentLocations + Vector3.new(0, 20, 0)) then
					return "Manning the cannon, waiting for the pirate fleet"
				end
				return "Go to the fortress cannon"
			end,
		}

		tbl9[16] = {
			Island = "Colosseum",
			Name = "Crowd Favorite",
			RetryDelay = 600,
			Run = function()
				local v11 = GetHiddenState("Crowd Favorite", function(arg, arg2, target, fill)
					if arg2 == "ShowTarget" then
						arg.target = target
					elseif arg2 == "Hit" then
						arg.fill = fill
					elseif arg2 == "SetActive" then
						arg.active = target == true
					end
				end)

				local target = v11.target or workspace:FindFirstChild("Ring")
				local v12 = ipairs
				local descendants = target and target.Parent and target:GetDescendants() or {}
				local v13 = nil

				for _, descendant in v12(descendants) do
					if descendant:IsA("BasePart") and descendant:HasTag("M1HitRegistry") then
						v13 = descendant
						break
					else
						v13 = nil
					end
				end

				if not v13 then
					return "Waiting for a Colosseum target", true
				end
				HitHiddenPart(v13)
				if v11.active then
					return "Crowd show: " .. math.floor((tonumber(v11.fill) or 0) * 100) .. "%"
				end
				return "Hit the ring to start the show"
			end,
		}

		tbl9[17] = {
			Island = "SkyArea2",
			Name = "Temple Intel",
			Run = function(arg)
				return RunHiddenTempleIntel(arg)
			end,
		}

		tbl9[18] = {
			Island = "Pirate Village",
			Name = "Tavern Brawl",
			RetryDelay = 600,
			Run = function(arg)
				local v11 = GetHiddenState("Tavern Brawl", function(arg2, arg3, arg4)
					if arg3 == "SetAvailable" then
						arg2.available = arg4 == true
					elseif arg3 == "BreachStart" then
						arg2.stage = "breach"
					elseif arg3 == "DoorsBurst" then
						arg2.stage = "inside"
					elseif arg3 == "FightStart" then
						arg2.stage = "fight"
					elseif arg3 == "GangUpStart" then
						arg2.stage = "gang"
					elseif arg3 == "BrawlersDefeated" then
						arg2.stage = "defeated"
					elseif arg3 == "ResetProgress" then
						arg2.stage = nil
						arg2.sent = {}
					end
				end)

				local tavernNEW = workspace.Map.Pirate:FindFirstChild("TavernNEW", true)
				tavernNEW = tavernNEW and tavernNEW:FindFirstChild("TavernDoor", true)
				local position = tavernNEW and tavernNEW:GetPivot().Position or Vector3.new(-1121, 14, 4121)

				if v11.stage == "defeated" then
					local tavernOwner = workspace.Terrain:FindFirstChild("Tavern Owner")

					if HiddenSettle(tavernOwner and (tavernOwner:GetPivot() * CFrame.new(0, 0, -4)).Position or position, 6) then
						arg:FireServer("ClaimReward")
						arg:FireServer("ExitTavern")
						HiddenEvent.checked = 0
						task.wait(1.5)
					end

					return "Take the brew from the Bartender"
				end

				v11.sent = v11.sent or {}

				if v11.stage and not v11.sent[v11.stage] then
					v11.sent[v11.stage] = true

					if v11.stage == "gang" then
						arg:FireServer("BeginGangUp")
					elseif v11.stage == "fight" or v11.stage == "inside" then
						arg:FireServer("BeginFight")
					elseif v11.stage == "breach" then
						arg:FireServer("TakeBreachSpot")
						task.wait(0.6)
						arg:FireServer("DoorsKicked")
					end

					task.wait(1)
					return "Start the tavern brawl (" .. v11.stage .. ")"
				end

				for _, child in ipairs(workspace.Enemies:GetChildren()) do
					if IsHiddenTarget(child) and (child:GetPivot().Position - position).Magnitude < 120 and string.find(child.Name, "Tavern") then
						KillHiddenEnemy(child)
						return "Beat up the tavern punks"
					end
				end

				if v11.stage == "gang" or v11.stage == "fight" or v11.stage == "inside" or v11.stage == "breach" then
					if tick() - (v11.resent or 0) > 15 then
						v11.resent = tick()
						v11.sent[v11.stage] = nil
					end

					return "Waiting for the brawlers"
				end

				if not v11.available and not arg.Active then
					return "Waiting for the tavern brawl (strange winds)", true
				end

				if HiddenSettle(position + Vector3.new(0, 3, 6), 10) then
					arg:FireServer("Breach")
					task.wait(2)
				end

				return "Breach the shaking tavern door"
			end,
		}

		tbl9[19] = {
			Island = "Fountain",
			Name = "Sewer Gangs",
			RetryDelay = 600,
			Precheck = function()
				local clockTime = game:GetService("Lighting").ClockTime
				if clockTime >= 18 or clockTime < 6 then
					return true
				end
				return false, "waiting for night time"
			end,
			Run = function(arg)
				local v11 = GetHiddenState("Sewer Gangs", function(arg2, arg3, arg4)
					if arg3 == "TreasureReady" and typeof(arg4) == "CFrame" then
						arg2.chest = arg4.Position
					end
				end)

				if v11.chest then
					if HiddenSettle(v11.chest + Vector3.new(0, 3, 0), 5) then
						if arg:InvokeServer("ClaimTreasure") == true then
							v11.chest = nil
							HiddenEvent.checked = 0
						end

						task.wait(1)
					end

					return "Claim the gang's treasure"
				end

				local sewerSystem = workspace.Map:FindFirstChild("SewerSystem")

				if sewerSystem and (localPlayer:GetAttribute("CurrentLocation") == "Sewers" or localPlayer.Character:GetPivot().Position.Y < -300) then
					local position = localPlayer.Character:GetPivot().Position

					for _, child in ipairs(workspace.Enemies:GetChildren()) do
						if IsHiddenTarget(child) and (child:GetPivot().Position - position).Magnitude < 700 then
							KillHiddenEnemy(child)
							return "Fight Megalo's sewer gang"
						end
					end

					if HitHiddenTriggers({ sewerSystem:FindFirstChild("BreakableWalls", true) }) then
						return "Break through the sewer walls"
					end
					local sewerEnemyRooms = sewerSystem:FindFirstChild("SewerEnemyRooms", true)
					HiddenEvent.sewerRoom = (HiddenEvent.sewerRoom or 0) % math.max(#(sewerEnemyRooms and sewerEnemyRooms:GetChildren() or {}), 1) + 1
					local v12

					if sewerEnemyRooms then
						local sewerRoom = HiddenEvent.sewerRoom
						v12 = sewerEnemyRooms:GetChildren()[sewerRoom]
					else
						v12 = sewerEnemyRooms
					end

					if v12 then
						HiddenGoTo(v12:GetPivot().Position + Vector3.new(0, 5, 0), 20)
						task.wait(2)
					end

					return "Search the sewers"
				end

				local cranes = workspace.Map.Fountain:FindFirstChild("Cranes")
				local sewerEntrancePrompt = cranes and cranes:FindFirstChild("SewerEntrancePrompt", true)
				cranes = cranes and cranes:FindFirstChild("CraneBonus")
				local sewerEntrance = workspace.Map.Fountain:FindFirstChild("SewerEntrance")

				if cranes and sewerEntrance and cranes:GetAttribute("SewerEntranceLifted") then
					HiddenMove(CFrame.new(sewerEntrance.Position + Vector3.new(0, 1, 0)))
					local humanoidRootPart = localPlayer.Character.HumanoidRootPart

					pcall(function()
						firetouchinterest(humanoidRootPart, sewerEntrance, 0)
						firetouchinterest(humanoidRootPart, sewerEntrance, 1)
					end)

					task.wait(8)
					return "Drop into the sewer entrance"
				end

				if sewerEntrancePrompt and sewerEntrancePrompt.Enabled then
					if HiddenSettle(sewerEntrancePrompt.Parent.WorldPosition + Vector3.new(0, 3, 0), 6) then
						HoldHiddenPrompt(sewerEntrancePrompt)
						local now = tick()

						while true do local __brk = false repeat 
							task.wait(0.3)
							if not (cranes and cranes:GetAttribute("SewerEntranceLifted") or tick() - now > 5) then
								break
							end
							__brk = true break
						until true if __brk then break end end

						task.wait(2.6)
					end

					return "Lift the crane over the sewer"
				end

				return "The sewers only open at night", true
			end,
		}

		tbl9[20] = {
			Island = "Jungle",
			Name = "The Thieving Monkey",
			RetryDelay = 600,
			Run = function(arg)
				local v11 = GetHiddenState("The Thieving Monkey", function(arg2, arg3, footprints, arg4)
					if arg3 == "Footprints" then
						footprints = type(footprints) == "table" and footprints or nil
						arg2.footprints = footprints
					elseif arg3 == "HatState" then
						arg2.ownsHat = footprints == true

						if arg2.ownsHat then
							arg2.pickup = nil
						end
					elseif arg3 == "HatDropped" then
						local position = typeof(footprints) == "CFrame" and footprints.Position
						local flag

						if position then
							flag = position
						else
							flag = typeof(footprints) == "Vector3" and footprints
						end

						arg2.pickup = flag or typeof(arg4) == "CFrame" and arg4.Position or typeof(arg4) == "Vector3" and arg4 or nil
						arg2.dropped = tick()
					elseif arg3 == "ClearHatPickup" then
						arg2.pickup = nil
					elseif arg3 == "MonkeyFalling" then
						arg2.monkey = typeof(footprints) == "Instance" and footprints or arg2.monkey
						arg2.landed = tick()
					elseif arg3 == "MonkeyLanded" then
						arg2.landed = tick()
					elseif arg3 == "MonkeyRetreat" or arg3 == "MonkeyDefeated" then
						arg2.landed = nil
					end
				end)

				local flag = not v11.landed and not v11.pickup

				if flag then
					flag = tick() - (v11.initialized or 0) > 30
				end

				if flag then
					v11.initialized = tick()
					arg:FireServer("Initialize")
					task.wait(1)
				end

				if v11.ownsHat or localPlayer.Backpack:FindFirstChild("Adventurer's Hat") or localPlayer.Character:FindFirstChild("Adventurer's Hat") then
					v11.pickup = nil

					if HiddenSettle((GetNpcPosition("Adventurer") or Vector3.new(-1680, 48, 175)) + Vector3.new(0, 1.5, 4), 8) then
						arg:FireServer("ReturnHat")
						task.wait(1)

						if not arg.Completed then
							pcall(TalkHiddenNpc, "Adventurer", { "Return the hat", "You're welcome." })
						end

						HiddenEvent.checked = 0
						task.wait(1.5)
					end

					return "Return the hat to the Adventurer"
				end

				local adventurerSHat = workspace._WorldOrigin:FindFirstChild("Adventurer's Hat")
				local handle = adventurerSHat and adventurerSHat:FindFirstChild("Handle")

				if handle then
					v11.pickup = v11.pickup or handle.Position
				end

				if v11.pickup then
					local position = handle and handle.Position or v11.pickup

					if HiddenGoTo(position + Vector3.new(0, 2, 0), 8) then
						HiddenHold(CFrame.new(position + Vector3.new(0, 2, 0)))
						handle = handle and handle:FindFirstChildOfClass("ProximityPrompt")

						if handle and handle.Enabled then
							pcall(fireproximityprompt, handle)
						else
							arg:FireServer("ClaimHat")
						end

						task.wait(1)
					end

					local flag2 = not adventurerSHat

					if flag2 then
						flag2 = tick() - (v11.dropped or 0) > 20
					end

					if flag2 then
						v11.pickup = nil
					end

					return "Pick up the Adventurer's Hat"
				end

				local v12 = nil

				for _, child in ipairs(workspace.Enemies:GetChildren()) do
					local flag2 = child.Name == "Monkey"

					if flag2 then
						local name_ = localPlayer.Name
						flag2 = child:GetAttribute("LocalEnemy") == name_
					end

					if flag2 then
						v12 = child
						break
					else
						v12 = nil
					end
				end

				local humanoidRootPart = v12 and v12:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart and v11.landed then
					HiddenEvent.stallGrace = tick() + 5

					if HiddenGoTo(humanoidRootPart.Position + Vector3.new(0, 2, 4), 12) then
						HiddenHold(humanoidRootPart.CFrame * CFrame.new(0, 2, 4))
						EquipHiddenWeapon("Melee")

						if os.clock() - (HiddenEvent.lastHit or 0) >= 0.4 then
							HiddenEvent.lastHit = os.clock()
							HiddenModules.RegisterAttack:FireServer(0.3)
							HiddenModules.RegisterHit:FireServer(humanoidRootPart, { { v12, humanoidRootPart } })
						end
					end

					return "Catch the thieving monkey"
				end

				if not v11.footprints then
					return "Waiting for the monkey to steal the hat", true
				end
				local vector = Vector3.zero
				local n = 0

				for _, footprint in pairs(v11.footprints) do
					if typeof(footprint) == "CFrame" then
						vector = vector + (footprint.Position)
						n = n + (1)
					end
				end

				local position = n > 0 and vector / n or localPlayer.Character:GetPivot().Position
				local v13 = nil
				local v14 = nil

				for _, v15 in ipairs(game:GetService("CollectionService"):GetTagged("ValidMonkeyTree")) do
					local magnitude = (v15:GetPivot().Position - position).Magnitude

					if not v13 or magnitude < v13 then
						v13 = magnitude
						v14 = v15
					end
				end

				local v15 = ipairs
				local descendants = v14 and v14:GetDescendants() or {}
				local v16 = nil

				for _, descendant in v15(descendants) do
					if descendant.Name == "Leaves" and descendant:IsA("BasePart") and descendant:HasTag("M1HitRegistry") then
						if not v16 or (descendant.Position - position).Magnitude < (v16.Position - position).Magnitude then
							v16 = descendant
						end
					end
				end

				if v16 then
					if HiddenGoTo(v16.Position + Vector3.new(0, 0, 6), 10) then
						HiddenHold(CFrame.new(v16.Position + Vector3.new(0, 0, 6)))
						HitHiddenPart(v16)
					end

					return "Follow the footprints and shake the tree"
				end

				if v14 and HitHiddenTriggers({ v14 }) then
					return "Follow the footprints and shake the tree"
				end
				return "Follow the monkey footprints", true
			end,
		}

		tbl9[21] = {
			Island = "Underwater City",
			Name = "Fishman Karate",
			Run = function(arg)
				if arg:InvokeServer("Initialize") == true then
					arg:InvokeServer("Complete")
					HiddenEvent.checked = 0
					task.wait(2)
					return "Bend the light for the Water Kung Fu Teacher"
				end

				return "Waiting for the sealed door", true
			end,
		}

		tbl9[22] = {
			Island = "Underwater City",
			Name = "Beyond the Bubble",
			Run = function(arg)
				local v11 = FindHiddenEnemy({ "Evil Wraith" }, Vector3.new(61696, 532, -1420), 400)
				if v11 then
					KillHiddenEnemy(v11)
					return "Clear the evil from the cavern"
				end
				local v12 = game:GetService("CollectionService"):GetTagged("CursedChest")[1]

				if v12 then
					local isBasePart = v12:IsA("BasePart") and v12 or v12:FindFirstChildWhichIsA("BasePart", true)

					if isBasePart and HiddenSettle(isBasePart.Position + Vector3.new(0, 3, 0), 9) then
						arg:InvokeServer("OpenChest")
						HiddenEvent.checked = 0
						task.wait(2)
					end

					return "Open the cursed chest"
				end

				HiddenGoTo(Vector3.new(61696, 532, -1420), 30)
				return "Ride the bubble to the cavern", localPlayer:DistanceFromCharacter(Vector3.new(61696, 532, -1420)) < 40
			end,
		}

		tbl9[23] = {
			Island = "Magma Village",
			Name = "Evil Slimes",
			Run = function()
				local bonusMomentLocations = workspace.Map.Magma:FindFirstChild("BonusMoment_Locations")
				bonusMomentLocations = bonusMomentLocations and bonusMomentLocations:FindFirstChild("SlimeGeyser")
				if not bonusMomentLocations then
					return "Waiting for the slime geyser", true
				end
				local position = bonusMomentLocations:GetPivot().Position
				local v11 = nil

				for _, child in ipairs(workspace.Enemies:GetChildren()) do
					if string.find(child.Name, "Slime") and IsHiddenTarget(child) and (child:GetPivot().Position - position).Magnitude < 400 then
						v11 = child
						break
					else
						v11 = nil
					end
				end

				if v11 then
					KillHiddenEnemy(v11)
					return "Defeat the Evil Slimes"
				end
				local tbl10 = {}

				for _, descendant in ipairs(bonusMomentLocations:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant:HasTag("M1HitRegistry") then
						table.insert(tbl10, descendant)
					end
				end

				if #tbl10 == 0 then
					return "Waiting for the slime geyser", true
				end

				table.sort(tbl10, function(arg, arg2)
					return localPlayer:DistanceFromCharacter(arg.Position) < localPlayer:DistanceFromCharacter(arg2.Position)
				end)

				HitHiddenPart(tbl10[1])
				return "Smash the strange geyser"
			end,
		}

		tbl9[24] = {
			Island = "Sky",
			Name = "Unexpected Guest",
			RetryDelay = 600,
			Run = function(arg)
				local v11 = GetHiddenState("Unexpected Guest", function(arg2, arg3)
					if arg3 == "Cleared" then
						arg2.cleared = true
					elseif arg3 == "VaultGuards" or arg3 == "ArchOpen" then
						arg2.guards = true
					elseif arg3 == "AmbushCleared" then
						arg2.ambushCleared = true
					elseif arg3 == "VaultOpened" then
						arg2.vaultOpened = true
					elseif arg3 == "DoorSealed" or arg3 == "Occupants" then
						arg2.cleared = nil
						arg2.guards = nil
						arg2.ambushCleared = nil
						arg2.vaultOpened = nil
					end
				end)

				local skyCastle = workspace.Map.Sky:FindFirstChild("SkyCastle")
				if not skyCastle or not arg.Active then
					return "Waiting for strangers at the castle", true
				end
				local skyInterior = skyCastle:FindFirstChild("SkyInterior")
				local vault = skyInterior and skyInterior:FindFirstChild("Vault")

				if v11.vaultOpened then
					local angelicVaultChest = workspace:FindFirstChild("AngelicVaultChest")
					angelicVaultChest = angelicVaultChest and angelicVaultChest:GetPivot().Position or vault and vault:GetPivot().Position

					if angelicVaultChest and HiddenSettle(angelicVaultChest + Vector3.new(0, 3, 5), 10) then
						arg:InvokeServer("TakeChest")
						HiddenEvent.checked = 0
						task.wait(1.5)
					end

					return "Take the vault treasure"
				end

				local position = skyCastle:GetPivot().Position

				for _, child in ipairs(workspace.Enemies:GetChildren()) do
					if IsHiddenTarget(child) and (child:GetPivot().Position - position).Magnitude < 350 then
						KillHiddenEnemy(child)
						return "Clear out the castle intruders"
					end
				end

				if v11.code and v11.ambushCleared and vault then
					if HiddenSettle(vault:GetPivot().Position + Vector3.new(0, 3, 6), 12) then
						arg:InvokeServer("VaultCodes")
						arg:InvokeServer("TryCode", v11.code)
						task.wait(1.5)
					end

					return "Open the Angelic Vault (" .. v11.code .. ")"
				end

				skyInterior = skyInterior and skyInterior:FindFirstChild("Letter")

				if skyInterior and not v11.code then
					if HiddenSettle(skyInterior.Position + Vector3.new(0, 3, 3), 8) then
						local response = arg:InvokeServer("ReadLetter")
						v11.code = type(response) == "string" and response or nil
						task.wait(1)
					end

					return "Read the crumpled letter"
				end

				if v11.code and not v11.guards then
					arg:FireServer("CutsceneDone")
					arg:FireServer("GuardsOut")
					task.wait(2)
					return "Wait for the vault guards"
				end

				local secretDoor = skyCastle:FindFirstChild("SecretDoor")

				if secretDoor and v11.cleared then
					local n = 0
					local v12 = nil

					for _, descendant in ipairs(secretDoor:GetDescendants()) do
						if descendant:IsA("BasePart") and descendant.Size.X * descendant.Size.Y * descendant.Size.Z > n then
							n = descendant.Size.X * descendant.Size.Y * descendant.Size.Z
							v12 = descendant
						end
					end

					if v12 and HiddenSettle(v12.Position + Vector3.new(0, 0, 4), 10) then
						arg:FireServer("BreakDoor")
						task.wait(1.5)
					end

					return "Break the secret door"
				end

				HiddenGoTo(position + Vector3.new(0, 20, 0), 60)
				return "Search the castle", true
			end,
		}

		tbl9[25] = {
			Island = "Sky",
			Name = "The Clown's Jewels",
			RetryDelay = 600,
			Run = function(arg)
				local v11 = GetHiddenState("The Clown's Jewels", function(arg2, arg3, arg4, arg5)
					if arg3 == "CloudStruck" then
						arg2.chest = typeof(arg5) == "CFrame" and arg5.Position or nil
						arg2.provoked = nil
						arg2.ready = nil
					elseif arg3 == "Restore" then
						arg2.chest = typeof(arg4) == "CFrame" and arg4.Position or arg2.chest
					elseif arg3 == "ChestReady" then
						arg2.ready = typeof(arg4) == "CFrame" and arg4.Position or nil
					elseif arg3 == "Reset" or arg3 == "Setup" then
						arg2.chest = nil
						arg2.ready = nil
						arg2.provoked = nil
					end
				end)

				if v11.ready then
					if HiddenGoTo(v11.ready + Vector3.new(0, 3, 0), 4) then
						arg:FireServer("Collect")
						v11.ready = nil
						HiddenEvent.checked = 0
						task.wait(1)
					end

					return "Collect the Skylands treasure"
				end

				for _, v12 in ipairs(game:GetService("CollectionService"):GetTagged("ClownJewelsGuard")) do
					local name_ = localPlayer.Name
					if v12:GetAttribute("LocalEnemy") == name_ and IsHiddenTarget(v12) then
						KillHiddenEnemy(v12)
						return "Defeat the Sky Bandits"
					end
				end

				if v11.chest and localPlayer:DistanceFromCharacter(v11.chest) <= 25 then
					if workspace:FindFirstChild("ClownJewelsLockedChest") or workspace:FindFirstChild("ClownJewelsChest") then
						v11.missing = nil
					else
						v11.missing = v11.missing or tick()
						local missing = v11.missing

						if tick() - missing > 8 then
							v11.chest = nil
							v11.missing = nil
							v11.provoked = nil
						end
					end
				end

				if v11.chest then
					local flag = HiddenSettle(v11.chest + Vector3.new(0, 3, 6), 12)

					if flag then
						flag = tick() - (v11.provoked or 0) > 15
					end

					if flag then
						v11.provoked = tick()
						arg:FireServer("Provoke")
						task.wait(1)
						arg:FireServer("BeginFight")
					end

					return "Claim the chained chest"
				end

				if not arg.Active then
					return "The treasure clouds are quiet", true
				end
				local persistentParts = workspace._WorldOrigin:FindFirstChild("PersistentParts")
				local v12 = FindTaggedPartIn(persistentParts and persistentParts:FindFirstChild("ClownJewelsClouds"))
				if v12 then
					HitHiddenPart(v12)
					return "Break the treasure cloud"
				end
				return "Waiting for the treasure cloud", true
			end,
		}

		tbl9[26] = {
			Island = "Sky",
			Name = "Electric Fighting Teacher",
			Run = function()
				local v11 = GetChargedClouds()
				local electro = HiddenEvent.electro
				local flag = not electro
				local flag2

				if flag then
					flag2 = flag
				else
					local time_ = electro.time
					flag2 = tick() - time_ > 5
				end

				if flag2 then
					electro = { time = tick(), state = CommF:InvokeServer("ElectroQuestState") }
					HiddenEvent.electro = electro
				end

				local vector = GetNpcPosition("Mad Scientist") or Vector3.new(-4628.9, 12, -355.7)

				if electro.state == 4 then
					if HiddenSettle(vector + Vector3.new(0, 1.5, 4), 8) then
						if CommF:InvokeServer("DeliverLightningBolt") ~= 1 then
							CommF:InvokeServer("BuyElectro")
						end

						HiddenEvent.electro = nil
						HiddenEvent.checked = 0
						task.wait(1.5)
					end

					return "Bring the Lightning Bolt to the Mad Scientist"
				end

				if electro.state ~= 1 and electro.state ~= 2 then
					if HiddenSettle(vector + Vector3.new(0, 1.5, 4), 8) then
						CommF:InvokeServer("AcceptElectroQuest")
						HiddenEvent.electro = nil
						task.wait(1)
					end

					return "Ask the Mad Scientist about Electric"
				end

				for k, v12 in pairs(v11) do
					local M1HitRegistry = nil

					for _, v13 in ipairs(v12) do
						if v13.Parent and v13:HasTag("M1HitRegistry") then
							M1HitRegistry = v13
							break
						else
							M1HitRegistry = nil
						end
					end

					M1HitRegistry = M1HitRegistry or k.Parent and k:HasTag("M1HitRegistry") and k

					if M1HitRegistry then
						HitHiddenPart(M1HitRegistry)
						HiddenEvent.electro.time = tick() - 4
						return "Strike the charged storm cloud"
					end

					v11[k] = nil
				end

				HiddenGoTo(Vector3.new(-5025, 820, -640), 200)
				return "Look for a charged storm cloud", true
			end,
		}

		tbl9[27] = {
			Island = "Fountain",
			Name = "Fountain Pipe Repair",
			Run = function(arg)
				local fountainPipeRepairState = arg.MiscData._fountainPipeRepairState
				local fountainPipeNodes = workspace._WorldOrigin:FindFirstChild("FountainPipeNodes")
				if not fountainPipeRepairState or not fountainPipeNodes or not fountainPipeRepairState.pipes then
					return "Waiting for the fountain pipes", true
				end

				if not fountainPipeRepairState.fullyRepaired then
					for _, child in ipairs(fountainPipeNodes:GetChildren()) do
						local attribute = child:GetAttribute("FountainPipeRepairId")
						local v11 = attribute and fountainPipeRepairState.pipes[attribute]
						if v11 and v11.currentSteps ~= 0 then
							HitHiddenPart(child)
							return "Rotate " .. attribute .. " (" .. fountainPipeRepairState.repairedCount .. "/" .. fountainPipeRepairState.totalPipes .. ")"
						end
					end

					return "Waiting for the water to flow", true
				end

				local boat = fountainPipeRepairState.boat
				boat = boat and boat:FindFirstChild("FakeVehicleSeat")

				if boat and HiddenSettle(boat.Position + Vector3.new(0, 3, 0), 5) then
					arg:InvokeServer("TurnIn")
					HiddenEvent.checked = 0
					task.wait(3)
				end

				return "Launch the stuck ship"
			end,
		}

		tbl9[28] = {
			Island = "Colosseum",
			Name = "King's Apprentice",
			Run = function(arg)
				local vector = GetNpcPosition("Colosseum Emperor") or Vector3.new(-1846.5, 90, -3333.6)
				local kingSApprentice = workspace:FindFirstChild("King's Apprentice")

				if arg.Progress == 1 then
					if HiddenSettle(vector + Vector3.new(0, 1.5, 4), 8) then
						arg:FireServer("Report")
						task.wait(1.5)
						HiddenEvent.checked = 0
					end

					return "Report to the Emperor"
				end

				local v11 = kingSApprentice and FindHiddenEnemy({ "Gladiator", "Upgraded Gladiator", "Supreme Gladiator" }, kingSApprentice.StartMatchHitbox.Position, 250)
				if v11 then
					KillHiddenEnemy(v11)
					return "Defeat the gladiator waves"
				end

				if not arg.Active then
					if HiddenSettle(vector + Vector3.new(0, 1.5, 4), 8) then
						arg:FireServer("Interact")
						task.wait(1.5)
					end

					return "Accept the Emperor's challenge"
				end

				if kingSApprentice and HiddenSettle(kingSApprentice.StartMatchHitbox.Position + Vector3.new(0, 3, 0), 6) then
					if tick() - (HiddenEvent.matchStarted or 0) > 20 then
						HiddenEvent.matchStarted = tick()
						arg:FireServer("StartMatch")
					end
				end

				return "Step into the arena"
			end,
		}

		tbl9[29] = {
			Island = "Colosseum",
			Name = "Legendary Creator Statues",
			RetryDelay = 1800,
			Precheck = function()
				if not GetHiddenFruitM1() then
					local v11, v12 = EnsureHiddenFruit("Legendary Creator Statues")
					if not v11 then
						NotifyHiddenFruitM1("Legendary Creator Statues")
						return false, v12 or "needs an eaten Blox Fruit with M1 for the Fruit statue"
					end
				end

				return true
			end,
			Run = function()
				local podiumModels = workspace.Map.Colosseum:FindFirstChild("PodiumModels")
				if not podiumModels then
					return "Waiting for the statues", true
				end

				local v11 = GetHiddenState("Legendary Creator Statues", function(arg, arg2, arg3)
					if typeof(arg3) == "Instance" then
						arg3 = arg3.Name
					end

					if arg2 == "PodiumLit" then
						arg[arg3] = true
					elseif arg2 == "PodiumHit" then
						arg.seen = arg.seen or {}
						arg.seen[arg3] = (arg.seen[arg3] or 0) + 1
					elseif arg2 == "PodiumWrong" or arg2 == "Loaded" or arg2 == "Completed" then
						for _, v11 in ipairs({ "Melee", "Sword", "Fruit", "Gun" }) do
							arg[v11] = nil
						end

						arg.seen = nil
						arg.tries = nil
					end
				end)

				for _, v12 in ipairs({ "Sword", "Fruit", "Melee", "Gun" }) do
					local podiumTouchBox = podiumModels:FindFirstChild(v12)
					podiumTouchBox = podiumTouchBox and podiumTouchBox:FindFirstChild("PodiumTouchBox")

					if podiumTouchBox and not v11[v12] then
						if localPlayer:DistanceFromCharacter(podiumTouchBox.Position) > 12 then
							HiddenMove(podiumTouchBox.CFrame * CFrame.new(0, 3, 9))
						else
							if not HiddenSettle((podiumTouchBox.CFrame * CFrame.new(0, 3, 6)).Position, 10) then
								return "Go to the " .. v12 .. " statue"
							end

							if v12 == "Fruit" then
								if not GetHiddenFruitM1() then
									EnsureHiddenFruit("the Fruit statue")
								end

								if not GetHiddenFruitM1() or not EquipHiddenWeapon("Blox Fruit") then
									NotifyHiddenFruitM1("the Fruit statue")
									HiddenEvent.skipped["Legendary Creator Statues"] = tick() + 1800
									return "Need a Blox Fruit with M1 for the Fruit statue", true
								end

								UseHiddenSkillAt(podiumTouchBox)
							elseif v12 == "Gun" then
								if not ShootHiddenGunAt(podiumTouchBox) then
									return "Getting a gun for the Gun statue"
								end
							else
								if not EquipHiddenWeapon(v12) then
									return "Need a " .. v12 .. " weapon", true
								end

								if os.clock() - (HiddenEvent.lastHit or 0) >= 0.6 then
									HiddenEvent.lastHit = os.clock()
									HiddenModules.RegisterAttack:FireServer(0.3)
									HiddenModules.RegisterHit:FireServer(podiumTouchBox)
									v11.tries = v11.tries or {}
									v11.tries[v12] = (v11.tries[v12] or 0) + 1
									local flag = v11.tries[v12] >= 10

									if flag then
										flag = not (v11.seen and v11.seen[v12])
									end

									if flag then
										v11[v12] = true
									end
								end
							end
						end

						return "Power the " .. v12 .. " statue"
					end
				end

				HiddenEvent.checked = 0
				return "Waiting for the statues to answer", true
			end,
		}

		tbl9[30] = {
			Island = "Marine Fortress",
			Name = "Fortress Flagpole",
			Run = function(arg)
				local v11 = GetHiddenState("Fortress Flagpole", function(arg2, arg3, arg4, arg5, arg6, arg7)
					if arg3 == "Setup" then
						arg2.flag = typeof(arg4) == "CFrame" and arg4.Position or arg2.flag
						arg2.rope = typeof(arg5) == "CFrame" and arg5.Position or arg2.rope
						arg2.hasRope = arg7 == true
						arg2.time = tick()
					elseif arg3 == "Started" then
						arg2.rope = typeof(arg4) == "CFrame" and arg4.Position or arg2.rope
					elseif arg3 == "RopeTaken" then
						arg2.hasRope = true
					end
				end)

				local flag = not v11.time

				if not flag then
					local time_ = v11.time
					flag = tick() - time_ > 20
				end

				if flag then
					v11.time = tick()
					arg:FireServer("Init")
					task.wait(1.5)
					return "Check the flagpole"
				end

				if v11.hasRope and v11.flag then
					if HiddenSettle(v11.flag + Vector3.new(0, 3, 0), 3) then
						SetHiddenStep("Raise the flag and dodge the cannons")
						HoistHiddenFlag(arg, v11.flag + Vector3.new(0, 3, 0))
						v11.time = nil
					end

					return "Raise the flag and dodge the cannons"
				end

				if not arg.Active or not v11.rope then
					local Parlus = GetNpcPosition("Parlus")

					if Parlus and HiddenSettle(Parlus + Vector3.new(0, 1.5, 3), 8) then
						arg:FireServer("Start")
						task.wait(1.5)
					end

					return "Talk to Parlus"
				end

				if HiddenSettle(v11.rope + Vector3.new(0, 3, 0), 6) then
					arg:FireServer("TakeRope")
					task.wait(1.5)
					v11.time = nil
				end

				return "Take the hidden rope"
			end,
		}

		tbl9[31] = {
			Island = "Frozen Village",
			Name = "Breaking the Ice",
			Run = function()
				local iceberg = workspace:FindFirstChild("Iceberg")
				iceberg = iceberg and iceberg:FindFirstChild("IceRock")
				if not iceberg then
					return "Waiting for the frozen teacher", true
				end
				HitHiddenPart(iceberg)
				return "Break the ice around the Ability Teacher"
			end,
		}

		tbl9[32] = {
			Island = "Middle Town",
			Name = "Early Access",
			RetryDelay = 600,
			Run = function(arg)
				local earlyAccess = HiddenEvent.earlyAccess
				local flag = not earlyAccess

				if not flag then
					local time_ = earlyAccess.time
					flag = tick() - time_ > 8
				end

				if flag then
					earlyAccess = {
						time = tick(),
						available = arg:InvokeServer("IsAvailable") == true,
						stage = arg:InvokeServer("GetState"),
					}

					HiddenEvent.earlyAccess = earlyAccess
				end

				local n = tonumber(earlyAccess.stage) or 0

				local function fn(arg2, ...)
					if not HiddenSettle(arg2, 8) then
						return
					end

					for _, v11 in ipairs({ ... }) do
						local response, v12 = arg:InvokeServer(v11)

						if type(v12) == "number" then
							earlyAccess.stage = v12
						end

						task.wait(0.5)
					end

					earlyAccess.time = 0
				end

				local robotmegaSuperfan = workspace.NPCs:FindFirstChild("robotmega superfan")
				robotmegaSuperfan = robotmegaSuperfan and robotmegaSuperfan:GetPivot().Position + Vector3.new(0, 1.5, 3) or Vector3.new(-1044.5, 26, 1683)

				if n == 0 then
					if not earlyAccess.available then
						return "DevBros are not visiting Middle Town now", true
					end
					fn(robotmegaSuperfan, "InteractQuestGiver", "AcceptQuest")
					return "Talk to robotmega superfan"
				end

				if n == 1 then
					local earlyAccessBonusMomentAssets = workspace._WorldOrigin:FindFirstChild("EarlyAccessBonusMomentAssets")
					earlyAccessBonusMomentAssets = earlyAccessBonusMomentAssets and earlyAccessBonusMomentAssets:FindFirstChild("KeySpot")
					fn(earlyAccessBonusMomentAssets and earlyAccessBonusMomentAssets.Position + Vector3.new(0, 3, 0) or Vector3.new(-1052, 13, 1781), "CollectKey")
					return "Find the Rear Door Key"
				end

				if n == 2 then
					fn(Vector3.new(-1091.8, 14, 1806), "InteractMansionDoor")
					return "Open the rear door"
				end

				if n == 3 then
					HiddenEvent.infiltration = HiddenEvent.infiltration or tick()
					local infiltration = HiddenEvent.infiltration

					if tick() - infiltration > 9 then
						HiddenEvent.infiltration = nil
						fn(localPlayer.Character:GetPivot().Position, "FinishInfiltration")
					end

					return "Sneak into the dev room"
				end

				if n == 4 then
					fn(robotmegaSuperfan, "InteractQuestGiver", "ClaimReward")
					return "Report to robotmega superfan"
				end
				return "Waiting for Early Access", true
			end,
		}

		tbl9[33] = {
			Island = "Middle Town",
			Name = "Lookout",
			RetryDelay = 1200,
			Run = function(arg)
				local lookout = HiddenEvent.lookout
				local flag = not lookout

				if not flag then
					local time_ = lookout.time
					flag = tick() - time_ > 10
				end

				if flag then
					local response = arg:InvokeServer("GetProgress")
					lookout = { time = tick(), progress = type(response) == "table" and response or nil }
					HiddenEvent.lookout = lookout
				end

				local progress = lookout.progress
				if not progress then
					return "Waiting for Experienced Captain", true
				end

				if progress.Unlocked then
					local experiencedCaptain = workspace.NPCs:FindFirstChild("Experienced Captain")
					if experiencedCaptain and HiddenSettle(experiencedCaptain:GetPivot().Position + Vector3.new(0, 1.5, 4), 10) then
						HiddenEvent.lookout = nil
						return RunHiddenLookout(arg)
					end
					return "Go to the Experienced Captain for lookout duty"
				end

				if (progress.SecondsRemaining or 0) > 0 then
					local time_ = lookout.time
					local n = progress.SecondsRemaining - (tick() - time_)

					if n > 0 then
						HiddenEvent.readyAt = HiddenEvent.readyAt or {}
						HiddenEvent.readyAt.Lookout = tick() + n
					end

					return "Captain needs time (" .. FormatMagnetTime(math.max(0, n)) .. ")", n > 0
				end

				local experiencedCaptain = workspace.NPCs:FindFirstChild("Experienced Captain")

				if experiencedCaptain and HiddenSettle(experiencedCaptain:GetPivot().Position + Vector3.new(0, 1.5, 4), 10) then
					arg:InvokeServer("AdvanceIntroduction")
					HiddenEvent.lookout = nil
					task.wait(1)
				end

				return "Talk to Experienced Captain (" .. (progress.IntroVisits or 0) .. "/3)"
			end,
		}

		tbl9[34] = {
			Island = "Middle Town",
			Name = "X Marks The Spot",
			Run = function(arg)
				local v11 = GetHiddenState("X Marks The Spot", function(arg2, arg3, stage, arg4, arg5, arg6, arg7)
					if arg3 == "State" then
						arg2.stage = stage
						arg2.target = typeof(arg4) == "CFrame" and arg4.Position or nil
						arg2.piece = typeof(arg7) == "CFrame" and arg7.Position or nil
					elseif arg3 == "Setup" or arg3 == "MapDropped" then
						stage = arg3 == "Setup" and stage or arg4
						arg2.pickup = typeof(stage) == "CFrame" and stage.Position or arg2.pickup
					end
				end)

				local flag = not v11.stage

				if not flag then
					flag = tick() - (v11.initialized or 0) > 60
				end

				if flag then
					v11.initialized = tick()
					arg:FireServer("Initialize")
					task.wait(1.5)
					return "Read treasure map state"
				end

				if v11.stage == "Tree" then
					local v12 = FindTaggedPartIn(workspace.Map:FindFirstChild("Town"))

					if v12 then
						HitHiddenPart(v12)
					end

					return "Shake the tree for the map"
				end

				if v11.stage == "Pickup" and v11.pickup then
					if HiddenSettle(v11.pickup + Vector3.new(0, 2, 0), 6) then
						arg:FireServer("PickupMap")
						task.wait(1.5)
					end

					return "Pick up Treasure Map"
				end

				if v11.stage == "Map" and v11.piece then
					if HiddenSettle(v11.piece + Vector3.new(0, 2, 0), 6) then
						arg:FireServer("CollectCheckpoint")
						task.wait(1.5)
					end

					return "Collect broken map piece"
				end

				if v11.stage == "Dig" and v11.target then
					local v12 = FindTaggedPartNear(v11.target, 4)

					if v12 then
						HitHiddenPart(v12)
					else
						HiddenGoTo(v11.target + Vector3.new(0, 3, 5), 6)
					end

					return "Dig at the X"
				end

				if v11.stage == "Chest" then
					local persistentParts = workspace._WorldOrigin:FindFirstChild("PersistentParts")
					persistentParts = persistentParts and persistentParts:FindFirstChild("Buried Treasure")
					local openPrompt = persistentParts and persistentParts:FindFirstChild("OpenPrompt", true)

					if openPrompt and HiddenSettle(openPrompt.Parent.Position + Vector3.new(0, 2, 3), 6) then
						fireproximityprompt(openPrompt)
						task.wait(1.5)
					end

					return "Open Buried Treasure"
				end

				if v11.stage == "Enemies" then
					local v12 = FindHiddenEnemy({ "Desert Skeleton" }, v11.target or localPlayer.Character:GetPivot().Position, 300)

					if v12 then
						KillHiddenEnemy(v12)
					end

					return "Defeat treasure guards"
				end

				return "Waiting for treasure", true
			end,
		}

		tbl9[35] = {
			Island = "Pirate Village",
			Name = "Windmill Maintenance",
			Run = function()
				local windmillRig = workspace.Map.Pirate:FindFirstChild("WindmillRig")
				windmillRig = windmillRig and windmillRig:FindFirstChild("Windmill_rig")
				if not windmillRig then
					return "Waiting for windmill", true
				end

				if not EquipHiddenWeapon("Sword") then
					return "Need a sword to cut the ropes", true
				end

				if not HiddenEvent.windmill then
					HiddenEvent.windmill = { cut = {} }

					HiddenEvent.windmill.connection = ListenHiddenMoment("Windmill Maintenance", function(arg, arg2)
						if arg == "RopeCut" then
							HiddenEvent.windmill.cut[arg2] = true
						end
					end)
				end

				for i_ = 1, 5 do
					local v11 = windmillRig:FindFirstChild("Rope" .. i_ .. "A")

					if v11 and not HiddenEvent.windmill.cut["Rope" .. i_] and v11.Transparency < 1 then
						if localPlayer:DistanceFromCharacter(v11.Position) > 12 then
							HiddenMove(v11.CFrame * CFrame.new(0, 0, 5))
						elseif os.clock() - (HiddenEvent.lastHit or 0) >= 0.6 then
							HiddenEvent.lastHit = os.clock()
							HiddenModules.RegisterAttack:FireServer(0.3)
							HiddenModules.RegisterHit:FireServer(v11)
						end

						return "Cut windmill rope " .. i_ .. "/5"
					end
				end

				return "Waiting for windmill to spin", true
			end,
		}

		tbl9[36] = {
			Island = "Jungle",
			Name = "Zipline Repair",
			Run = function(arg)
				local zipline = HiddenEvent.zipline
				local flag = not zipline

				if not flag then
					local time_ = zipline.time
					flag = tick() - time_ > 30
				end

				if flag then
					local v11 = nil

					v11 = ListenHiddenMoment("Zipline Repair", function(arg2, arg3, arg4, arg5, arg6, arg7, arg8)
						if arg2 == "Setup" and typeof(arg3) == "CFrame" then
							HiddenEvent.zipline = { time = tick(), pickup = arg3.Position, target = arg7, source = arg8 }
							v11:Disconnect()
						end
					end)

					arg:FireServer("Initialize")
					task.wait(2)

					if v11.Connected then
						v11:Disconnect()
					end

					return "Locate grappling hook"
				end

				local character = localPlayer.Character
				local grapplingHook = character:FindFirstChild("Grappling Hook") or localPlayer.Backpack:FindFirstChild("Grappling Hook")

				if not grapplingHook then
					if HiddenSettle(zipline.pickup + Vector3.new(0, 2, 0), 6) then
						arg:FireServer("PickupTool")
						task.wait(1.5)
					end

					return "Pick up grappling hook"
				end

				if HiddenSettle(zipline.source + Vector3.new(0, 4, 0), 6) then
					if grapplingHook.Parent ~= character then
						character.Humanoid:EquipTool(grapplingHook)
						task.wait(0.5)
					end

					local position = character.HumanoidRootPart.Position
					local target = zipline.target
					local v11 = require(ReplicatedStorage.Util.Trajectory).getArcAim(position, target)
					arg:InvokeServer("Throw", "Grappling Hook", v11)
					HiddenEvent.checked = 0
					task.wait(2)
				end

				return "Throw hook to the zipline"
			end,
		}

		tbl9[37] = {
			Island = "Desert",
			Name = "Archaeologist's Tablet",
			Run = function()
				local archaeologistSTablet = workspace:FindFirstChild("Archaeologist's Tablet")
				if not archaeologistSTablet then
					return "Waiting for tablet", true
				end

				for _, child in ipairs(archaeologistSTablet.Pillars:GetChildren()) do
					local attribute = child:GetAttribute("NumHits") or 0
					if attribute < 3 then
						HitHiddenPart(child:FindFirstChild("SandLayer" .. attribute + 1) or child.SandLayer3)
						return "Clear sand " .. child.Name .. " (" .. attribute .. "/3)"
					end
				end

				return "Waiting for completion", true
			end,
		}

		tbl9[38] = {
			Island = "Desert",
			Name = "Rescue Hasan",
			RetryDelay = 600,
			Run = function(arg)
				local hasan = workspace.NPCs:FindFirstChild("Hasan")
				local position = hasan and hasan:GetPivot().Position or Vector3.new(1308, 23, 4492)

				if (arg.Progress or 0) >= 1 then
					hasan = hasan and HiddenSettle(position + Vector3.new(0, 1.5, 4), 10)

					if hasan then
						arg:FireServer("Interact")
						HiddenEvent.checked = 0
						task.wait(1.5)
					end

					return "Talk to Hasan"
				end

				local v11 = FindHiddenEnemy({ "Desert Skeleton" }, Vector3.new(1300, 15, 4460), 250)

				if v11 then
					HiddenEvent.farmHeight = 25
					KillHiddenEnemy(v11)
					HiddenEvent.farmHeight = nil
					HiddenEvent.hasanTries = 0
					HiddenEvent.waveStarted = tick()
					return "Kill Desert Skeleton"
				end

				local rescueHasan = workspace:FindFirstChild("Rescue Hasan")
				rescueHasan = rescueHasan and rescueHasan:FindFirstChild("CutsceneTrigger")
				if not rescueHasan then
					return "Waiting for the pyramid scene", true
				end

				if tick() - (HiddenEvent.hasanHelped or 0) < 90 then
					HiddenEvent.stallGrace = tick() + 20
					return "Waiting for Hasan's skeletons to come out of the coffins"
				end
				local flag = (HiddenEvent.hasanTries or 0) >= 2
				local flag2

				if flag then
					flag2 = (HiddenEvent.hasanTries or 0) < 4
				else
					flag2 = flag
				end

				if flag2 and hasan then
					if HiddenSettle(position + Vector3.new(0, 1.5, 4), 10) then
						arg:FireServer("Interact")
						HiddenEvent.checked = 0
						HiddenEvent.hasanTries = (HiddenEvent.hasanTries or 0) + 1
						task.wait(1.5)
					end

					return "Talk to Hasan to claim the reward"
				end

				if (HiddenEvent.hasanTries or 0) >= 4 then
					HiddenEvent.hasanTries = 0
					HiddenEvent.skipped["Rescue Hasan"] = tick() + 600
					HiddenEvent.waiting["Rescue Hasan"] = "Hasan's intro did not start"
					HiddenEvent.current = nil
					return "Hasan's intro did not start, trying again later", true
				end

				if not HiddenEvent.hasanEntering then
					if not HiddenSettle(rescueHasan.Position + Vector3.new(0, 5, 38), 8) then
						return "Go to the pyramid entrance"
					end
					HiddenRelease()
					StopTweenNow()
					task.wait(1.5)
					HiddenEvent.hasanEntering = tick()
					localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(rescueHasan.Position + Vector3.new(0, 4, 0))
				end

				HiddenEvent.stallGrace = tick() + 30
				local v12 = RunHiddenDialogue({ "Help Hasan" }, 14)
				HiddenEvent.hasanEntering = nil

				if v12 then
					HiddenEvent.hasanHelped = tick()
					HiddenEvent.hasanTries = 0
					return "Help Hasan"
				end

				HiddenEvent.hasanTries = (HiddenEvent.hasanTries or 0) + 1
				return "Walk into the pyramid again"
			end,
		}

		tbl9[39] = {
			Island = "Desert",
			Name = "Prickly Harvest",
			Requires = "Sea1/Desert/Rescue Hasan",
			RetryDelay = 900,
			Run = function(arg)
				local desertMerchant = workspace.NPCs:FindFirstChild("Desert Merchant")
				local flag = arg:InvokeServer("TurnInReady") == true

				if flag or not HiddenEvent.cactusStarted then
					if desertMerchant and HiddenSettle(desertMerchant:GetPivot().Position + Vector3.new(0, 1.5, 4), 10) then
						local response = arg:InvokeServer("Interact")
						HiddenEvent.cactusStarted = response == "StartQuest" or response == "InProgress"
						if response == "Unavailable" then
							return "Cacti not blooming yet", true
						end
					end

					return flag and "Turn in Cactus Petals" or "Talk to Desert Merchant"
				end

				local huge = math.huge
				local v11 = nil

				for _, child in ipairs(workspace.Map.Desert.Cacti:GetChildren()) do
					local trunk = child:FindFirstChild("Trunk")

					if trunk and trunk:HasTag("M1HitRegistry") then
						local v12 = localPlayer:DistanceFromCharacter(trunk.Position)

						if v12 < huge then
							huge = v12
							v11 = trunk
						end
					end
				end

				if v11 then
					HitHiddenPart(v11)
					return "Harvest cactus"
				end
				return "Waiting for cacti", true
			end,
		}

		HiddenQuests = tbl9
	end

	HiddenAnnouncements = {
		{ "pirate sails", "Battle Plans" },
		{ "drilling", "Magma Ore Extraction" },
		{ "bananas", "Banana Tree" },
		{ "curious smell", "Chef's Kiss" },
		{ "rumbling echoes", "One Last Eruption" },
		{ "dark energy", "Frozen Defense" },
		{ "alarm has sounded", "Fortress Under Fire" },
		{ "bell shimmers", "Echoes Through the Clouds" },
		{ "skyland castle", "Unexpected Guest" },
		{ "sewer", "Sewer Gangs" },
		{ "clouds", "The Clown's Jewels" },
		{ "cell", "Lever Jailbreak" },
		{ "tavern", "Tavern Brawl" },
		{ "snow heavily", "Snowman" },
		{ "stands are filling", "Crowd Favorite" },
		{ "crowd wants a show", "Crowd Favorite" },
		{ "storm brews", "The Tyrant Awakens" },
		{ "invaded skylands", "Unexpected Guest" },
		{ "water is stirring", "Pearl of the Deep" },
		{ "fishman lord has risen", "Pearl of the Deep" },
		{ "junkyard", "Fountain Wire Repair" },
		{ "magnetized", "Fountain Wire Repair" },
		{ "military weaponry", "Fortress Under Fire" },
		{ "loud drilling", "Magma Ore Extraction" },
		{ "overflowing with bananas", "Banana Tree" },
		{ "pirate sails", "Battle Plans" },
		{ "fleet will be", "Battle Plans" },
		{ "lookouts have spotted", "Battle Plans" },
		{ "roar of excitement", "Crowd Favorite" },
		{ "light of a full moon", "Sewer Gangs" },
		{ "secret cloud", "The Clown's Jewels" },
		{ "skylands castle", "Unexpected Guest" },
	}

	HiddenAnnounceDriven = {}

	for _, v6 in ipairs(HiddenAnnouncements) do
		HiddenAnnounceDriven[v6[2]] = true
	end

	HiddenRemoteChecks = {
		["Crowd Favorite"] = function()
			return workspace:FindFirstChild("Ring") ~= nil
		end,
		["Archaeologist's Tablet"] = function()
			return workspace:FindFirstChild("Archaeologist's Tablet") ~= nil
		end,
		["Breaking the Ice"] = function()
			local iceberg = workspace:FindFirstChild("Iceberg")
			return iceberg ~= nil and iceberg:FindFirstChild("IceRock") ~= nil
		end,
		["Rescue Hasan"] = function()
			local rescueHasan = workspace:FindFirstChild("Rescue Hasan")
			return rescueHasan ~= nil and rescueHasan:FindFirstChild("CutsceneTrigger") ~= nil
		end,
		["Battle Plans"] = function()
			local v6 = GetHiddenIsland("Marine Fortress")
			return v6 ~= nil and #ListHiddenRaidShips(v6.World.Position) > 0
		end,
	}

	for _, v6 in ipairs(HiddenQuests) do
		if v6.BossNames and not HiddenRemoteChecks[v6.Name] then
			local bossNames = v6.BossNames

			HiddenRemoteChecks[v6.Name] = function()
				return FindAwakenedBoss(nil, bossNames) ~= nil
			end
		end
	end

	SweepHiddenRemote = function(arg)
		if tick() - (HiddenEvent.remoteSweep or 0) < 5 then
			return
		end
		HiddenEvent.remoteSweep = tick()
		HiddenEvent.remoteSeen = HiddenEvent.remoteSeen or {}

		for _, v6 in ipairs(HiddenQuests) do
			local v7 = HiddenRemoteChecks[v6.Name]

			if v7 and arg["Sea1/" .. v6.Island .. "/" .. v6.Name] ~= true then
				local ok, result = pcall(v7)

				if ok and result then
					if not HiddenEvent.remoteSeen[v6.Name] then
						HiddenEvent.remoteSeen[v6.Name] = true
						HiddenEvent.skipped[v6.Name] = nil
						HiddenEvent.announced = HiddenEvent.announced or {}
						HiddenEvent.announced[v6.Name] = tick()
						HiddenNotify(v6.Name .. " is up (seen from afar), heading there", v6.Name .. "remote", "found")
					end
				else
					HiddenEvent.remoteSeen[v6.Name] = nil
				end
			end
		end
	end

	HiddenPresenceQuests = {
		["Battle Plans"] = "Marine Fortress",
		["Magma Ore Extraction"] = "Magma Village",
		["Crowd Favorite"] = "Colosseum",
		["Unexpected Guest"] = "Sky",
		["The Clown's Jewels"] = "Sky",
		Snowman = "Frozen Village",
		["Prickly Harvest"] = "Desert",
		["The Thieving Monkey"] = "Jungle",
		["Tavern Brawl"] = "Pirate Village",
		["Sewer Gangs"] = "Fountain",
	}

	NearestHiddenSpawn = function(arg)
		local playerSpawns = workspace._WorldOrigin:FindFirstChild("PlayerSpawns")
		local v6, v7, v8 = ipairs(playerSpawns and playerSpawns:GetDescendants() or {})
		local v9 = nil
		local v10 = nil

		for _, v11 in v6, v7, v8 do
			if v11:IsA("BasePart") then
				local magnitude = (v11.Position - arg).Magnitude

				if not v9 or magnitude < v9 then
					v9 = magnitude
					v10 = v11
				end
			end
		end

		return v10 and v10.Position + Vector3.new(0, 4, 0), v9
	end

	PickHiddenParkSpot = function(arg)
		local tbl9 = {}

		for _, v6 in ipairs(HiddenQuests) do
			local island = HiddenPresenceQuests[v6.Name] and v6.Island

			if island and arg["Sea1/" .. v6.Island .. "/" .. v6.Name] ~= true and (not v6.Requires or arg[v6.Requires] == true) and not table.find(tbl9, island) then
				table.insert(tbl9, island)
			end
		end

		local park = HiddenEvent.park
		local flag

		if park then
			flag = not table.find(tbl9, park.island)

			if not flag then
				local since = park.since
				flag = tick() - since > 900
			end
		else
			flag = park
		end

		if flag then
			local n = (table.find(tbl9, park.island) or 0) % math.max(#tbl9, 1) + 1
			park = tbl9[n] and { island = tbl9[n], since = tick() } or nil
		elseif not park and #tbl9 > 0 then
			park = { island = tbl9[1], since = tick() }
		end

		HiddenEvent.park = park

		if park then
			local v6 = GetHiddenIsland(park.island)

			if v6 then
				local v7, v8 = NearestHiddenSpawn(v6.World.Position)
				if v7 and v8 < 2500 then
					return v7
				end
				return v6.TeleportPoints[1].Position + Vector3.new(0, 4, 0)
			end
		end

		return NearestHiddenSpawn(localPlayer.Character:GetPivot().Position) or Vector3.new(-826, 30, 1613)
	end

	HiddenSkipFile = "Infinity Hub/hidden_skip.json"

	SaveHiddenSkip = function()
		if type(writefile) ~= "function" then
			return
		end
		local tbl9 = { user = localPlayer.UserId, skips = {} }

		for k, v6 in pairs(HiddenEvent.skipped) do
			if type(k) == "string" and not k:find("^Reward:") and v6 > tick() then
				local floor = math.floor
				tbl9.skips[k] = os.time() + floor(v6 - tick())
			end
		end

		pcall(function()
			writefile(HiddenSkipFile, game:GetService("HttpService"):JSONEncode(tbl9))
		end)
	end

	LoadHiddenSkip = function()
		if HiddenEvent.skipLoaded then
			return
		end
		HiddenEvent.skipLoaded = true

		pcall(function()
			if type(isfile) == "function" and isfile(HiddenSkipFile) then
				local data = game:GetService("HttpService"):JSONDecode(readfile(HiddenSkipFile))

				if data.user == localPlayer.UserId then
					local v6 = pairs
					local skips = data.skips or {}

					for k, skip in v6(skips) do
						local n = skip - os.time()

						if n > 0 and not HiddenEvent.skipped[k] then
							HiddenEvent.skipped[k] = tick() + n
						end
					end
				end
			end
		end)
	end

	HiddenRetryDelay = function(arg)
		local readyAt = HiddenEvent.readyAt and HiddenEvent.readyAt[arg.Name]
		if readyAt then
			return math.max(readyAt - tick(), 5)
		end
		local retryOverride = HiddenEvent.retryOverride and HiddenEvent.retryOverride[arg.Name]
		if retryOverride then
			HiddenEvent.retryOverride[arg.Name] = nil
			return math.max(retryOverride, 120)
		end
		local retryDelay = arg.RetryDelay or 420
		if HiddenAnnounceDriven[arg.Name] then
			return math.max(retryDelay, 3600)
		end
		return retryDelay
	end

	OnHiddenAnnouncement = function(arg)
		local v6 = string.lower(tostring(arg))

		for _, v7 in ipairs(HiddenAnnouncements) do
			if string.find(v6, v7[1], 1, true) then
				HiddenEvent.announced = HiddenEvent.announced or {}
				HiddenEvent.announced[v7[2]] = tick()
				HiddenEvent.skipped[v7[2]] = nil
			end
		end
	end

	WatchHiddenAnnouncements = function()
		if HiddenEvent.watching then
			return
		end
		HiddenEvent.watching = true
		HiddenEvent.momentEvent = {}

		ReplicatedStorage.Remotes.BonusMomentsRemoteEvent.OnClientEvent:Connect(function(arg)
			HiddenEvent.momentEvent[tostring(arg)] = tick()
		end)

		local notifications = localPlayer.PlayerGui:WaitForChild("Notifications", 10)

		if notifications then
			notifications.DescendantAdded:Connect(function(descendant)
				if descendant:IsA("TextLabel") then
					task.wait(0.1)
					OnHiddenAnnouncement(descendant.Text)
				end
			end)
		end

		pcall(function()
			game:GetService("TextChatService").MessageReceived:Connect(function(arg)
				if not arg.TextSource then
					OnHiddenAnnouncement(arg.Text)
				end
			end)
		end)
	end

	CheckHiddenStall = function()
		local current = HiddenEvent.current
		local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not current or not humanoidRootPart then
			HiddenEvent.stall = nil
			return
		end
		local stall = HiddenEvent.stall
		local position = humanoidRootPart.Position
		local parent = not stall or stall.quest ~= current or stall.step ~= HiddenEvent.step or (position - stall.position).Magnitude > 25 or HiddenEvent.fighting and HiddenEvent.fighting.Parent

		if not parent then
			parent = tick() < (HiddenEvent.stallGrace or 0)
		end

		local flag

		if parent then
			flag = parent
		else
			flag = tick() - (HiddenEvent.momentEvent and HiddenEvent.momentEvent[current] or 0) < 20
		end

		local flag2

		if flag then
			flag2 = flag
		else
			flag2 = tick() - (HiddenEvent.announced and HiddenEvent.announced[current] or 0) < 420
		end

		if flag2 then
			HiddenEvent.stall = { quest = current, step = HiddenEvent.step, position = position, time = tick() }
			return
		end

		if os.date("!*t").min < 8 and string.find(tostring(HiddenEvent.step), "awaken", 1, true) then
			return
		end
		local time_ = stall.time
		if tick() - time_ < 60 then
			return
		end
		HiddenEvent.stall = nil
		HiddenEvent.skipped[current] = tick() + 120
		HiddenEvent.current = nil
		HiddenEvent.arrived = nil
		HiddenEvent.islandArrived = nil
		HiddenEvent.waitingSince = nil
		LeaveHiddenCannon()
		pcall(require(ReplicatedStorage.DialogueController).close)
		HiddenNotify(current .. " got stuck on \"" .. tostring(stall.step) .. "\", trying another quest", current .. "stall", "warning")
	end

	HiddenWakeBoost = function(name)
		HiddenEvent.readyBoost = HiddenEvent.readyBoost or {}
		return tick() < (HiddenEvent.readyBoost[name] or 0)
	end

	WakeHiddenQuests = function(progress, hint)
		HiddenEvent.waiting = HiddenEvent.waiting or {}
		HiddenEvent.readyBoost = HiddenEvent.readyBoost or {}
		HiddenEvent.readyAt = HiddenEvent.readyAt or {}
		HiddenEvent.wokeMoment = HiddenEvent.wokeMoment or {}
		HiddenEvent.wakeCheck = HiddenEvent.wakeCheck or {}

		local function wake(quest, why)
			if HiddenEvent.current == quest.Name then
				return
			end
			HiddenEvent.skipped[quest.Name] = nil
			HiddenEvent.readyAt[quest.Name] = nil
			HiddenEvent.readyBoost[quest.Name] = tick() + 300
			HiddenEvent.wakeCheck[quest.Name] = tick() + 60
			HiddenNotify(quest.Name .. " is ready (" .. why .. "), going back", quest.Name .. "wake", "found")
		end

		for _, quest in ipairs(HiddenQuests) do
			local name = quest.Name
			local key = "Sea1/" .. quest.Island .. "/" .. name
			local skipped = (HiddenEvent.skipped[name] or 0) > tick()
			local blocked = HiddenEvent.waiting[name] ~= nil or HiddenEvent.readyAt[name] ~= nil

			if progress[key] ~= true and skipped and blocked and tick() >= (HiddenEvent.wakeCheck[name] or 0) then
				local readyAt = HiddenEvent.readyAt[name]
				if readyAt and tick() >= readyAt then
					wake(quest, "timer done")
				else
					local moment = GetHiddenMoment(name)
					local up = moment and (not quest.HintIsland or moment.Active)
					if up and HiddenEvent.wokeMoment[name] ~= moment then
						HiddenEvent.wokeMoment[name] = moment
						wake(quest, "quest appeared")
					elseif not up then
						HiddenEvent.wokeMoment[name] = nil
						if quest.Precheck and not readyAt and tick() >= (HiddenEvent.precheckAt and HiddenEvent.precheckAt[name] or 0) then
							HiddenEvent.precheckAt = HiddenEvent.precheckAt or {}
							HiddenEvent.precheckAt[name] = tick() + 10
							local ok, pass = pcall(quest.Precheck, hint)
							if ok and pass == true then
								wake(quest, "conditions met")
							end
						end
					end
				end
			end
		end
	end

	AutoHiddenEvent = function()
		WatchHiddenAnnouncements()
		LoadHiddenSkip()
		local v6 = GetHiddenProgress()
		SweepHiddenRemote(v6)
		if ClaimHiddenReward() then
			return
		end
		local v7 = GetHiddenRaidHint()
		local flag = v7.State == "Arming" or v7.State == "Armed" or v7.State == "Triggered"

		if not flag then
			flag = (tonumber(v7.Seconds) or math.huge) < 300
		end

		local flag2 = v7.State ~= "Triggered"

		if flag2 then
			flag2 = (tonumber(v7.Seconds) or 0) > 180
		end

		pcall(WakeHiddenQuests, v6, v7)

		local tbl9 = {}
		local tbl10 = {}
		local tbl11 = {}

		for k, v8 in pairs(v6) do
			local flag3 = v8 == true and string.match(k, "^Sea1/([^/]+)/")

			if flag3 then
				tbl11[flag3] = (tbl11[flag3] or 0) + 1
			end
		end

		for _, v8 in ipairs(HiddenQuests) do
			local active = GetHiddenMoment(v8.Name)
			local flag3 = v8.Name == "Rescue Hasan" and active

			if flag3 then
				flag3 = tick() - (HiddenEvent.hasanHelped or 0) < 150
			end

			if flag3 then
				tbl10[v8] = -2
				HiddenEvent.skipped[v8.Name] = nil
			else
				local hintIsland = v8.HintIsland
				local readyBoost = HiddenWakeBoost(v8.Name)

				if hintIsland then
					active = active and active.Active

					if active then
						local name_ = v8.Name
						hintIsland = not GetHiddenBossHour().checked[name_]
					else
						hintIsland = active
					end

					hintIsland = hintIsland or flag and not flag2 and IsHiddenBossHinted(v7, v8.HintIsland, v8.BossNames)
				end

				if readyBoost then
					tbl10[v8] = -1.5
				elseif hintIsland then
					tbl10[v8] = -1
					HiddenEvent.skipped[v8.Name] = nil
				elseif tick() - ((HiddenEvent.announced or {})[v8.Name] or 0) < 600 then
					tbl10[v8] = -0.5
				elseif v8.Name == HiddenEvent.current then
					tbl10[v8] = 0
				else
					local n = GetHiddenIsland(v8.Island)
					n = n and localPlayer:DistanceFromCharacter(n.World.Position) or 1000000

					if v8.Island == HiddenEvent.currentIsland then
						n = n * (0.0001)
					end

					tbl10[v8] = 1 + math.max(n - (tbl11[v8.Island] or 0) * 4000, 0)
				end
			end

			if not HiddenEvent.only or HiddenEvent.only[v8.Name] then
				table.insert(tbl9, v8)
			end
		end

		table.sort(tbl9, function(arg, arg2)
			return tbl10[arg] < tbl10[arg2]
		end)

		HiddenEvent.waiting = HiddenEvent.waiting or {}
		local n = 0

		for _, v8 in ipairs(tbl9) do repeat 
			local str2 = "Sea1/" .. v8.Island .. "/" .. v8.Name

			if v6[str2] ~= true then
				n = n + (1)
			end

			local flag3 = v6[str2] ~= true and (not v8.Requires or v6[v8.Requires] == true)

			if flag3 then
				flag3 = tick() >= (HiddenEvent.skipped[v8.Name] or 0)
			end

			if flag3 then
				flag3 = not (tick() < (HiddenEvent.prepUntil or 0) and tbl10[v8] >= 1)
			end

			if flag3 then
				local v9 = GetHiddenMoment(v8.Name)
				local v10 = HiddenRemoteChecks[v8.Name]
				local flag4 = v10 and HiddenPresenceQuests[v8.Name] and not v8.HintIsland and not v9

				if flag4 then
					flag4 = tick() - ((HiddenEvent.announced or {})[v8.Name] or 0) > 900
				end

				if flag4 then
					local flag5 = v8.Name == "Rescue Hasan"

					if flag5 then
						flag5 = tick() - (HiddenEvent.hasanHelped or 0) < 150
					end

					flag4 = not flag5
				end

				local flag5 = true
				local awakenedBossQuests = nil

				if flag4 then
					local ok, result = pcall(v10)
					ok = ok and not result
					awakenedBossQuests = nil

					if ok then
						flag5 = false
						awakenedBossQuests = "not up yet (checked from afar)"
					end
				end

				if flag5 and v8.Precheck and (not v9 or v8.HintIsland and not v9.Active) then
					flag5, awakenedBossQuests = v8.Precheck(v7)
				end

				if not flag5 then
					if HiddenEvent.waiting[v8.Name] ~= awakenedBossQuests then
						if v8.HintIsland then
							HiddenNotify("Awakened boss quests: " .. awakenedBossQuests, "bosshint", "found")
						else
							HiddenNotify(v8.Name .. ": " .. awakenedBossQuests, v8.Name .. awakenedBossQuests)
						end
					end

					HiddenEvent.waiting[v8.Name] = awakenedBossQuests
					HiddenEvent.skipped[v8.Name] = tick() + 30
					break
				end

				if HiddenEvent.current ~= v8.Name then
					HiddenEvent.current = v8.Name
					HiddenEvent.currentIsland = v8.Island
					HiddenEvent.waitingSince = nil
					HiddenEvent.arrived = nil
					HiddenEvent.islandArrived = nil
					HiddenNotify("Start " .. v8.Name .. " (" .. v8.Island .. ")", v8.Name, "start")
				end

				HiddenEvent.idleSince = nil
				local flag6 = not v9

				if flag6 and v8.BossNames then
					for _, child in ipairs(workspace.Enemies:GetChildren()) do
						if child:GetAttribute("BossIndicatorAwakened") and IsHiddenTarget(child) then
							for _, bossName in ipairs(v8.BossNames) do
								if string.find(child.Name, bossName, 1, true) and localPlayer:DistanceFromCharacter(child:GetPivot().Position) < 2500 then
									SetHiddenStep("Defeat the awakened " .. child.Name)
									KillHiddenEnemy(child)
									HiddenEvent.checked = 0
									return
								end
							end
						end
					end
				end

				if flag6 and v8.NoMoment then
					local v11 = v8.NoMoment()
					if v11 then
						SetHiddenStep(v11)
						return
					end
				end

				if flag6 then
					if HiddenGoToIsland(v8.Island) then
						HiddenEvent.islandArrived = HiddenEvent.islandArrived or tick()
						local islandArrived = HiddenEvent.islandArrived

						if tick() - islandArrived > 8 then
							HiddenEvent.islandArrived = nil

							if v8.HintIsland then
								local name_ = v8.Name
								GetHiddenBossHour().checked[name_] = true
							end

							HiddenEvent.skipped[v8.Name] = math.max(HiddenEvent.skipped[v8.Name] or 0, tick() + HiddenRetryDelay(v8))
							SaveHiddenSkip()
							HiddenEvent.waiting[v8.Name] = v8.Name .. " is not happening on " .. v8.Island
							HiddenEvent.current = nil
							HiddenNotify(HiddenEvent.waiting[v8.Name] .. " yet, checking again later", v8.Name .. "notloaded", "warning")
						end
					else
						HiddenEvent.islandArrived = nil
					end

					return
				end

				HiddenEvent.islandArrived = nil
				local v11, v12 = v8.Run(v9)
				SetHiddenStep(v11 or "Working")

				if v12 then
					HiddenEvent.waitingSince = HiddenEvent.waitingSince or tick()
					local announced = HiddenEvent.announced and HiddenEvent.announced[v8.Name]
					local waitingSince = HiddenEvent.waitingSince
					local n3 = tick() - waitingSince
					announced = announced and tick() - announced < 420

					if announced then
						announced = v9 and v9.Active and 420 or 60
					end

					if (announced or 6) < n3 then
						HiddenEvent.waiting[v8.Name] = v11
						HiddenEvent.skipped[v8.Name] = math.max(HiddenEvent.skipped[v8.Name] or 0, tick() + HiddenRetryDelay(v8))
						SaveHiddenSkip()
						HiddenEvent.current = nil
						local name_ = v8.Name
						HiddenNotify(v8.Name .. ": " .. tostring(v11) .. ", switching to another quest", name_ .. tostring(v11), "warning")
					end
				else
					HiddenEvent.waiting[v8.Name] = nil
					HiddenEvent.waitingSince = nil
					if HiddenEvent.readyAt then
						HiddenEvent.readyAt[v8.Name] = nil
					end
				end

				return
			end
		until true end

		HiddenEvent.current = nil

		if n == 0 and HiddenEvent.only then
			SetHiddenStep("Targeted quest finished")
			HiddenEvent.checked = 0
			return
		end

		if n == 0 then
			SetHiddenStep("All 39 secrets are complete")
			SaveSettings("Auto Secret Quest", false)

			if getgenv().ToggleSecretQuest and getgenv().ToggleSecretQuest.SetStage then
				getgenv().ToggleSecretQuest:SetStage(false)
			end

			HiddenNotify("All 39 secret quests are done, turning off", "secretalldone", "success")
			return
		end

		HiddenEvent.idleSince = HiddenEvent.idleSince or tick()

		if tick() - (HiddenEvent.idleNotified or 0) > 300 then
			HiddenEvent.idleNotified = tick()
			HiddenNotify("No secret quest is available right now (" .. n .. " left), checking again soon", "idle", "warning")
		end

		local tbl12 = {}

		for k in pairs(HiddenEvent.waiting) do
			local str2 = nil

			for _, v8 in ipairs(HiddenQuests) do
				if v8.Name == k then
					str2 = "Sea1/" .. v8.Island .. "/" .. v8.Name
				end
			end

			if str2 and v6[str2] ~= true then
				table.insert(tbl12, k)
			end
		end

		local v8 = nil

		for _, v9 in pairs(HiddenEvent.skipped) do
			if v9 > tick() and (not v8 or v9 < v8) then
				v8 = v9
			end
		end

		if PrepareHiddenChef(v6) then
			return
		end
		local min = os.date("!*t").min
		local flag3 = Settings["Hidden Hop Dead Hour"] ~= false and min >= 50 and min <= 58

		if flag3 then
			flag3 = tick() - (HiddenEvent.hopAt or 0) > 100
		end

		if flag3 and not IsHiddenHourUseful(v6) then
			HiddenEvent.hopAt = tick()
			if HopHiddenServer() then
				SetHiddenStep("Next awakened boss is not needed here, switching server")
				return
			end
		end

		local park = HiddenEvent.park
		local flag4 = Settings["Hidden Hop Dead Hour"] ~= false and park
		local flag5

		if flag4 then
			flag5 = tick() - (HiddenEvent.idleSince or tick()) > 1200
		else
			flag5 = flag4
		end

		flag5 = flag5 and min >= 5 and min < 45

		if flag5 then
			flag5 = tick() - (HiddenEvent.hopAt or 0) > 1200
		end

		if flag5 then
			HiddenEvent.hopAt = tick()
			if HopHiddenServer() then
				SetHiddenStep("Nothing triggered on " .. park.island .. " for 20 min, switching server")
				return
			end
		end

		if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
			local v9 = PickHiddenParkSpot(v6)
			HiddenEvent.idlePark = v9

			if HiddenGoTo(v9, 60) then
				HiddenHold(CFrame.new(v9))
			end
		end

		SetHiddenStep("Waiting " .. n .. " quests" .. (v8 and " (next check in " .. math.ceil(v8 - tick()) .. "s)" or "") .. ": " .. table.concat(tbl12, ", "))
	end

	task.spawn(function()
		while task.wait(1) do
			pcall(function()
				if not SeaOnly(StatusHiddenQuest, "Title Quest", { 1 }) then
					SeaOnly(StatusHiddenStep, "Doing Quest", { 1 })
					SeaOnly(StatusHiddenBoss, "Title Awakened Boss", { 1 })
					return
				end

				local v6 = GetHiddenProgress()
				local n = 0
				local doneCount = 0

				for _, v7 in pairs(v6) do
					n = n + (1)
					doneCount = doneCount + (v7 == true and 1 or 0)
				end

				if HiddenEvent.doneCount ~= doneCount then
					HiddenEvent.doneCount = doneCount
					HiddenEvent.doneAt = tick()
				end

				StatusHiddenProgress.SetText(string.format("Secret Quest : %d/39 Quests", doneCount))
				StatusHiddenQuest.SetText("Title Quest : " .. (HiddenEvent.current or "None"))
				StatusHiddenStep.SetText("Doing Quest : " .. (IsSecretQuestOn() and HiddenEvent.step or "None"))

				if Place_Id.sea1() then
					local v7 = GetHiddenRaidHint()
					local setText = StatusHiddenBoss.SetText
					local boss = v7.Boss

					if boss then
						boss = v7.Boss .. " on " .. tostring(v7.Island) .. " in " .. FormatMagnetTime(tonumber(v7.Seconds) or 0)
					end

					setText("Title Awakened Boss : " .. (boss or "None"))
				end
			end)
		end
	end)


HiddenEventSection:CreateToggle({
	Title = "Hop Server For Secret Quest",
	Desc = "Hop khi không có quest / giờ chết",
	Default = Settings["Hop Server For Secret Quest"] or false,
}, function(v)
	SaveSettings("Hop Server For Secret Quest", v)
end)

if Settings["Hidden Hop Dead Hour"] == nil then
	Settings["Hidden Hop Dead Hour"] = true
end

HiddenEventSection:CreateToggle({
	Title = "Auto Secret Quest",
	Desc = "Auto complete 39 Sea 1 secret quests (Hidden Event)",
	Default = Settings["Auto Secret Quest"] or false,
}, function(arg)
	if arg and not Place_Id.sea1() then
		SaveSettings("Auto Secret Quest", false)
		InfinityNotify("Auto Secret Quest", "Only works in Sea 1", "warning")
		if getgenv().ToggleSecretQuest and getgenv().ToggleSecretQuest.SetStage then
			pcall(function()
				getgenv().ToggleSecretQuest:SetStage(false)
			end)
		end
		return
	end

	SaveSettings("Auto Secret Quest", arg)
	getgenv().ToggleSecretQuest = {
		SetStage = function(_, on)
			SaveSettings("Auto Secret Quest", on and true or false)
		end,
	}

	if not arg then
		HiddenEvent.running = false
		pcall(HiddenRelease)
		pcall(function()
			TweenManager.CancelCurrent()
		end)
		return
	end

	if HiddenEvent.running then
		return
	end
	HiddenEvent.running = true

	task.spawn(function()
		pcall(function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
		end)
	end)

	if type(HiddenDialogueLoop) == "function" then
		task.spawn(HiddenDialogueLoop)
	end

	task.spawn(function()
		while Settings["Auto Secret Quest"] and task.wait(0.15) do
			local ok, result
			local stackOk = (StackFarmOther ~= false) and (getgenv().StackFarmOther ~= false)
			if stackOk then
				ok, result = pcall(AutoHiddenEvent)
			else
				SetHiddenStep("Paused while another feature is running")
				ok = true
				result = nil
			end

			if not ok then
				print("[SecretQuest]", result)
				HiddenEvent.lastError = tostring(result)
				HiddenEvent.errors = (HiddenEvent.errors or 0) + 1
				if HiddenEvent.errors % 20 == 1 then
					HiddenNotify("Error: " .. tostring(result):sub(1, 120), "error", "error")
				end
			end

			pcall(function()
				if CheckHiddenStall then
					CheckHiddenStall()
				end
			end)

			local anchored = HiddenEvent.anchored
			if anchored then
				anchored = tick() - (HiddenEvent.holdTime or 0) > 0.6
			end
			if anchored and HiddenRelease then
				HiddenRelease()
			end

			local str2 = tostring(HiddenEvent.step or "")
			if str2:find("^Waiting") or str2:find(" stirs on ") or str2 == "Idle" then
				task.wait(0.6)
			end
		end

		pcall(function()
			if HiddenRelease then
				HiddenRelease()
			end
		end)
		HiddenEvent.running = false
	end)
end)


BuyMeleeQuestDefs = {
	["Electro"] = { Name = "Electric Fighting Teacher", Island = "Sky" },
	["Fishman Karate"] = { Name = "Fishman Karate", Island = "Underwater City" },
}
BuyMeleePending = {}
BuyMeleeDone = {}
BuyMeleeChecked = {}
BuyMeleeDriverRunning = false
BuyMeleeTravelAt = 0

function BuyMeleeQuestDone(def, force)
	local key = "Sea1/" .. def.Island .. "/" .. def.Name
	local ok, progress = pcall(GetHiddenProgress, force)
	if not ok or type(progress) ~= "table" then
		return nil
	end
	local v = progress[key]
	if v == true or (type(v) == "table" and v.Completed == true) then
		return true
	end
	if next(progress) == nil then
		return nil
	end
	return false
end

function BuyMeleeStartDriver()
	if BuyMeleeDriverRunning or HiddenEvent.running then
		return
	end
	BuyMeleeDriverRunning = true
	BuyMeleeSecretForce = true
	HiddenEvent.running = true

	task.spawn(function()
		pcall(function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyHaki", "Geppo")
		end)
	end)

	if type(HiddenDialogueLoop) == "function" then
		task.spawn(HiddenDialogueLoop)
	end

	task.spawn(function()
		while next(BuyMeleePending) and Place_Id.sea1() and task.wait(0.15) do
			local ok, result
			local stackOk = (StackFarmOther ~= false) and (getgenv().StackFarmOther ~= false)
			if stackOk then
				ok, result = pcall(AutoHiddenEvent)
			else
				SetHiddenStep("Paused while another feature is running")
				ok = true
			end

			if not ok then
				print("[BuyMeleeQuest]", result)
			end

			pcall(function()
				if CheckHiddenStall then
					CheckHiddenStall()
				end
			end)

			local anchored = HiddenEvent.anchored
			if anchored then
				anchored = tick() - (HiddenEvent.holdTime or 0) > 0.6
			end
			if anchored and HiddenRelease then
				HiddenRelease()
			end

			local step = tostring(HiddenEvent.step or "")
			if step:find("^Waiting") or step:find(" stirs on ") or step == "Idle" then
				task.wait(0.6)
			end
		end

		BuyMeleeSecretForce = false
		pcall(function()
			if HiddenRelease then
				HiddenRelease()
			end
		end)
		pcall(function()
			TweenManager.CancelCurrent()
		end)
		HiddenEvent.running = false
		BuyMeleeDriverRunning = false
	end)
end

function BuyMeleeSync()
	if next(BuyMeleePending) then
		HiddenEvent.only = BuyMeleePending
		if Place_Id.sea1() then
			BuyMeleeStartDriver()
		end
	else
		HiddenEvent.only = nil
	end
end

function BuyMeleeCancel(melee)
	local def = BuyMeleeQuestDefs[melee]
	if def then
		BuyMeleePending[def.Name] = nil
		BuyMeleeSync()
	end
end

function BuyMeleeGate(melee)
	local def = BuyMeleeQuestDefs[melee]
	if not def then
		return true
	end
	if BuyMeleeDone[melee] then
		return true
	end

	local force = tick() - (BuyMeleeChecked[melee] or 0) > 5
	if force then
		BuyMeleeChecked[melee] = tick()
	end

	local done = BuyMeleeQuestDone(def, force)
	if done == true then
		BuyMeleeDone[melee] = true
		BuyMeleePending[def.Name] = nil
		BuyMeleeSync()
		pcall(function()
			HiddenNotify(melee .. " quest done, buying melee", "buymelee" .. melee, "success")
		end)
		return true
	end

	if not Place_Id.sea1() then
		BuyMeleePending[def.Name] = nil
		BuyMeleeSync()
		if tick() - BuyMeleeTravelAt > 20 then
			BuyMeleeTravelAt = tick()
			pcall(function()
				HiddenNotify(melee .. " quest not done, traveling to Sea 1", "buymelee" .. melee .. "travel", "info")
			end)
			task.spawn(function()
				pcall(function()
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
				end)
			end)
		end
		return false
	end

	if done == nil then
		return false
	end

	if not BuyMeleePending[def.Name] then
		BuyMeleePending[def.Name] = true
		pcall(function()
			HiddenNotify(melee .. " quest not done, starting hidden quest", "buymelee" .. melee .. "start", "info")
		end)
	end
	BuyMeleeSync()
	return false
end

print("[BananaCat] Secret Quest (39) module loaded — section ở đầu Farming Other")
-- ================================================================
-- Halloween features ported from Topi Halloween section.
-- Existing Banana Halloween Event features above are intentionally kept.
-- ================================================================
