local ts = game:GetService("TweenService")
local uis = game:GetService("UserInputService")

local function generateName()
	local data = ""
	for i = 0, 20, 1 do
		data = data .. tostring(string.char(math.ceil(math.random() * 254)))
	end
	return data
end

function draggable(obj)
	local globals = {}
	globals.dragging = nil
	globals.uiorigin = nil
	globals.morigin = nil
	obj.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			globals.dragging = true
			globals.uiorigin = obj.Position
			globals.morigin = input.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					globals.dragging = false
				end
			end)
		end
	end)
	uis.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement and globals.dragging then
			local change = input.Position - globals.morigin
			obj.Position = UDim2.new(globals.uiorigin.X.Scale,globals.uiorigin.X.Offset+change.X,globals.uiorigin.Y.Scale,globals.uiorigin.Y.Offset+change.Y)
		end
	end)
end

local library = {}

local windowInfo = {
	Name = "",
	ColorScheme = Color3.fromRGB(64, 136, 253),
	UseKey = false,
	Key = "",
}

local notificationInfo = {
	Name = "",
	Content = "",
	Image = "",
	DisplayTime = 5,
}

local screenGui = Instance.new("ScreenGui")
local notifications = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

screenGui.Parent = game.CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Name = generateName()

notifications.Name = "notifications"
notifications.Parent = screenGui
notifications.AnchorPoint = Vector2.new(0.5, 0.5)
notifications.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
notifications.BackgroundTransparency = 1.000
notifications.Position = UDim2.new(0.931809187, 0, 0.501912415, 0)
notifications.Size = UDim2.new(0.126589686, 0, 0.976446867, 0)

UIListLayout.Parent = notifications
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0, 10)

local function notif(notificationInfo)
	local ting = {}
	local holder = Instance.new("Frame")
	local mainFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local title = Instance.new("TextLabel")
	local icon = Instance.new("ImageLabel")
	local text = Instance.new("TextLabel")
	local closeButton = Instance.new("TextButton")
	local back = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local UICorner_3 = Instance.new("UICorner")

	holder.Name = "holder"
	holder.Parent = notifications
	holder.AnchorPoint = Vector2.new(0.5, 1)
	holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	holder.BackgroundTransparency = 1.000
	holder.Position = UDim2.new(0.5, 0, 1, 0)
	holder.Size = UDim2.new(1, 0, 0.0920000002, 0)

	mainFrame.Name = "mainFrame"
	mainFrame.Parent = holder
	mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	mainFrame.BackgroundColor3 = Color3.fromRGB(14, 16, 27)
	mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainFrame.Size = UDim2.new(0.964999974, 0, 0.939999998, 0)
	mainFrame.Visible = false

	UICorner.Parent = mainFrame

	title.Name = "title"
	title.Parent = mainFrame
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.Position = UDim2.new(0.186589241, 0, 0.128392369, 0)
	title.Size = UDim2.new(0.746463895, 0, 0.189983487, 0)
	title.Font = Enum.Font.GothamMedium
	title.Text = "e"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextScaled = true
	title.TextSize = 18.000
	title.TextWrapped = true
	title.TextXAlignment = Enum.TextXAlignment.Left

	icon.Name = "icon"
	icon.Parent = mainFrame
	icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	icon.BackgroundTransparency = 1.000
	icon.Position = UDim2.new(0.0213289484, 0, 0.0640534908, 0)
	icon.Size = UDim2.new(0.127973691, 0, 0.320267439, 0)
	--icon.Image = notificationInfo.Image

	text.Name = "text"
	text.Parent = mainFrame
	text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	text.BackgroundTransparency = 1.000
	text.Position = UDim2.new(0.0213289484, 0, 0.482798994, 0)
	text.Size = UDim2.new(0.911724031, 0, 0.419828355, 0)
	text.Font = Enum.Font.GothamMedium
	text.Text = "e"
	text.TextColor3 = Color3.fromRGB(255, 255, 255)
	text.TextSize = 14.000
	text.TextWrapped = true
	text.TextXAlignment = Enum.TextXAlignment.Left
	text.TextYAlignment = Enum.TextYAlignment.Top

	closeButton.Name = "closeButton"
	closeButton.Parent = mainFrame
	closeButton.AnchorPoint = Vector2.new(0.5, 0.5)
	closeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	closeButton.BackgroundTransparency = 1.000
	closeButton.Position = UDim2.new(0.5, 0, 0.5, 0)
	closeButton.Size = UDim2.new(1, 0, 1, 0)
	closeButton.ZIndex = 10
	closeButton.AutoButtonColor = false
	closeButton.Font = Enum.Font.SourceSans
	closeButton.Text = ""
	closeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	closeButton.TextSize = 14.000

	back.Name = "back"
	back.Parent = holder
	back.AnchorPoint = Vector2.new(0.5, 0.5)
	back.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	back.Position = UDim2.new(0.5, 0, 0.5, 0)
	back.Size = UDim2.new(1, 0, 1, 0)
	back.ZIndex = -1

	UICorner_2.Parent = back


	closeButton.MouseButton1Click:Connect(function()
		holder:Destroy()
	end)

	task.wait(4)

	for i, v in pairs(holder:GetDescendants()) do
		if v:IsA("Frame") then
			local tween9 = ts:Create(v, TweenInfo.new(0.1), {BackgroundTransparency = 1})
			tween9:Play()
		elseif v:IsA("TextLabel") then
			local tween10 = ts:Create(v, TweenInfo.new(0.1), {TextTransparency = 1})
			tween10:Play()
		else
			task.wait(0.1)
			v:Destroy()
		end
	end
	holder:Destroy()
	return ting
end

function library:CreateNotification(notificationInfo)
	notif()
end

function library:CreateWindow(windowInfo)
	local window = {}

	local screenGui = Instance.new("ScreenGui")
	local holder = Instance.new("Frame")
	local mainFrame = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local title = Instance.new("TextLabel")
	local sideBar = Instance.new("Frame")
	local selectors = Instance.new("ScrollingFrame")
	local UIPadding = Instance.new("UIPadding")
	local UIListLayout = Instance.new("UIListLayout")
	local profile = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local playerImage = Instance.new("ImageLabel")
	local UICorner_3 = Instance.new("UICorner")
	local text = Instance.new("TextLabel")
	local playerName = Instance.new("TextLabel")
	local minimise = Instance.new("ImageButton")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local back = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
	local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
	local display = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")
	local UIStroke = Instance.new("UIStroke")
	local UIStroke_2 = Instance.new("UIStroke")
	local glow = Instance.new("ImageLabel")
	local UICorner_6 = Instance.new("UICorner")

	screenGui.Name = generateName()
	screenGui.Parent = game.CoreGui
	screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	screenGui.ResetOnSpawn = false
	screenGui.DisplayOrder = 99999

	holder.Name = "holder"
	holder.Parent = screenGui
	holder.AnchorPoint = Vector2.new(0.5, 0.5)
	holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	holder.BackgroundTransparency = 1.000
	holder.Position = UDim2.new(0.499907643, 0, 0.499586314, 0)
	holder.Size = UDim2.new(0.409164816, 0, 0.386654168, 0)
	holder.ClipsDescendants = true

	mainFrame.Name = "mainFrame"
	mainFrame.Parent = holder
	mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	mainFrame.BackgroundColor3 = Color3.fromRGB(14, 16, 27)
	mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	mainFrame.Size = UDim2.new(0.985000014, 0, 0.980000019, 0)

	UICorner.Parent = mainFrame

	title.Name = "title"
	title.Parent = mainFrame
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1
	title.Position = UDim2.new(0.0177498553, 0, 0.0289575271, 0)
	title.Size = UDim2.new(0.401136369, 0, 0.0598455593, 0)
	title.Font = Enum.Font.GothamMedium
	title.Text = windowInfo.Name
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextSize = 18
	title.TextWrapped = true
	title.TextXAlignment = Enum.TextXAlignment.Left

	sideBar.Name = "sideBar"
	sideBar.Parent = mainFrame
	sideBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	sideBar.BackgroundTransparency = 1.000
	sideBar.ClipsDescendants = true
	sideBar.Position = UDim2.new(0.00939102098, 0, 0.111800052, 0)
	sideBar.Size = UDim2.new(0.185143054, 0, 0.866, 0)

	selectors.Name = "selectors"
	selectors.Parent = sideBar
	selectors.Active = true
	selectors.AnchorPoint = Vector2.new(0.5, 0.5)
	selectors.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	selectors.BackgroundTransparency = 1.000
	selectors.BorderColor3 = Color3.fromRGB(27, 42, 53)
	selectors.BorderSizePixel = 0
	selectors.Position = UDim2.new(0.513249993, 0, 0.602, 0)
	selectors.Size = UDim2.new(0.973500013, 0, 0.775180042, 0)
	selectors.ScrollBarThickness = 0
	selectors.CanvasSize = UDim2.new(0, 0, 0, 0)
	selectors.AutomaticCanvasSize = "Y"

	UIPadding.Parent = selectors
	UIPadding.PaddingLeft = UDim.new(0, 2)
	UIPadding.PaddingTop = UDim.new(0, 2)

	UIListLayout.Parent = selectors
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 8)

	profile.Name = "profile"
	profile.Parent = sideBar
	profile.AnchorPoint = Vector2.new(0.5, 0.5)
	profile.BackgroundColor3 = Color3.fromRGB(14, 16, 27)
	profile.BorderSizePixel = 0
	profile.Position = UDim2.new(0.509531379, 0, 0.105999982, 0)
	profile.Size = UDim2.new(0.952095926, 0, 0.171417549, 0)

	UICorner_2.CornerRadius = UDim.new(0, 3)
	UICorner_2.Parent = profile

	UIStroke_2.Thickness = 1.7
	UIStroke_2.Color = windowInfo.ColorScheme
	UIStroke_2.ApplyStrokeMode = "Border"
	UIStroke_2.Parent = profile
	
	local player = game.Players.LocalPlayer
	local userId = player.UserId
	local thumbType = Enum.ThumbnailType.HeadShot
	local thumbSize = Enum.ThumbnailSize.Size420x420
	local content, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

	playerImage.Name = "playerImage"
	playerImage.Parent = profile
	playerImage.AnchorPoint = Vector2.new(0.5, 0.5)
	playerImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	playerImage.BackgroundTransparency = 1.000
	playerImage.Position = UDim2.new(0.215000004, 0, 0.5, 0)
	playerImage.Size = UDim2.new(0.33, 0, 0.742, 0)
	playerImage.Image = content

	UICorner_3.CornerRadius = UDim.new(0, 3)
	UICorner_3.Parent = playerImage

	text.Name = "text"
	text.Parent = profile
	text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	text.BackgroundTransparency = 1.000
	text.Position = UDim2.new(0.426136881, 0, 0.128000021, 0)
	text.Size = UDim2.new(0.530911565, 0, 0.351549208, 0)
	text.Font = Enum.Font.GothamMedium
	text.Text = "Welcome,"
	text.TextColor3 = Color3.fromRGB(255, 255, 255)
	text.TextScaled = true
	text.TextSize = 24.000
	text.TextWrapped = true
	text.TextXAlignment = Enum.TextXAlignment.Left

	playerName.Name = "playerName"
	playerName.Parent = profile
	playerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	playerName.BackgroundTransparency = 1.000
	playerName.Position = UDim2.new(0.430000007, 0, 0.518999994, 0)
	playerName.Size = UDim2.new(0.530911565, 0, 0.351549208, 0)
	playerName.Font = Enum.Font.GothamMedium
	playerName.Text = player.Name
	playerName.TextColor3 = Color3.fromRGB(255, 255, 255)
	playerName.TextScaled = true
	playerName.TextSize = 24.000
	playerName.TextWrapped = true
	playerName.TextXAlignment = Enum.TextXAlignment.Left

	minimise.Name = "minimise"
	minimise.Parent = mainFrame
	minimise.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	minimise.BackgroundTransparency = 1.000
	minimise.Position = UDim2.new(0.944999993, 0, 0.0320000015, 0)
	minimise.Size = UDim2.new(0.0288417172, 0, 0.0492474958, 0)
	minimise.Image = "rbxassetid://7897968293"

	UIAspectRatioConstraint.Parent = mainFrame
	UIAspectRatioConstraint.AspectRatio = 1.891

	back.Name = "back"
	back.Parent = holder
	back.AnchorPoint = Vector2.new(0.5, 0.5)
	back.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	back.Position = UDim2.new(0.5, 0, 0.5, 0)
	back.Size = UDim2.new(1, 0, 1, 0)
	back.ZIndex = -1

	UICorner_4.Parent = back

	UIAspectRatioConstraint_2.Parent = back
	UIAspectRatioConstraint_2.AspectRatio = 1.881

	UIAspectRatioConstraint_3.Parent = holder
	UIAspectRatioConstraint_3.AspectRatio = 1.881

	display.Name = "display"
	display.Parent = mainFrame
	display.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	display.BackgroundTransparency = 1.000
	display.Position = UDim2.new(0.205000013, 0, 0.128999934, 0)
	display.Size = UDim2.new(0.779367328, 0, 0.839904666, 0)
	display.ClipsDescendants = true

	UIStroke.Thickness = 1.7
	UIStroke.Color = windowInfo.ColorScheme
	UIStroke.ApplyStrokeMode = "Border"
	UIStroke.Parent = display

	UICorner_5.CornerRadius = UDim.new(0, 3)
	UICorner_5.Parent = display

	glow.Name = "glow"
	glow.Parent = holder
	glow.AnchorPoint = Vector2.new(0.5, 0.5)
	glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	glow.BackgroundTransparency = 1.000
	glow.Position = UDim2.new(0.5, 0, 0.501943529, 0)
	glow.Size = UDim2.new(1.11, 0, 1.15, 0)
	glow.ZIndex = -2
	glow.Image = "http://www.roblox.com/asset/?id=11062358333"
	glow.ImageColor3 = windowInfo.ColorScheme
	glow.ImageTransparency = 0.500

	UICorner_6.CornerRadius = UDim.new(0, 99)
	UICorner_6.Parent = glow

	local loginPage = Instance.new("Frame")
	local UICorner = Instance.new("UICorner")
	local title = Instance.new("TextLabel")
	local exit = Instance.new("ImageButton")
	local circles = Instance.new("Frame")
	local UICorner_2 = Instance.new("UICorner")
	local circle = Instance.new("Frame")
	local UICorner_3 = Instance.new("UICorner")
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	local circle_2 = Instance.new("Frame")
	local UICorner_4 = Instance.new("UICorner")
	local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
	local circle_3 = Instance.new("Frame")
	local UICorner_5 = Instance.new("UICorner")
	local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
	local circle_4 = Instance.new("Frame")
	local UICorner_6 = Instance.new("UICorner")
	local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
	local circle_5 = Instance.new("Frame")
	local UICorner_7 = Instance.new("UICorner")
	local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
	local circle_6 = Instance.new("Frame")
	local UICorner_8 = Instance.new("UICorner")
	local UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
	local circle_7 = Instance.new("Frame")
	local UICorner_9 = Instance.new("UICorner")
	local UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
	local circle_8 = Instance.new("Frame")
	local UICorner_10 = Instance.new("UICorner")
	local UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
	local circle_9 = Instance.new("Frame")
	local UICorner_11 = Instance.new("UICorner")
	local UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
	local circle_10 = Instance.new("Frame")
	local UICorner_12 = Instance.new("UICorner")
	local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint")
	local circle_11 = Instance.new("Frame")
	local UICorner_13 = Instance.new("UICorner")
	local UIAspectRatioConstraint_11 = Instance.new("UIAspectRatioConstraint")
	local circle_12 = Instance.new("Frame")
	local UICorner_14 = Instance.new("UICorner")
	local UIAspectRatioConstraint_12 = Instance.new("UIAspectRatioConstraint")
	local circle_13 = Instance.new("Frame")
	local UICorner_15 = Instance.new("UICorner")
	local UIAspectRatioConstraint_13 = Instance.new("UIAspectRatioConstraint")
	local circle_14 = Instance.new("Frame")
	local UICorner_16 = Instance.new("UICorner")
	local UIAspectRatioConstraint_14 = Instance.new("UIAspectRatioConstraint")
	local circle_15 = Instance.new("Frame")
	local UICorner_17 = Instance.new("UICorner")
	local UIAspectRatioConstraint_15 = Instance.new("UIAspectRatioConstraint")
	local circle_16 = Instance.new("Frame")
	local UICorner_18 = Instance.new("UICorner")
	local UIAspectRatioConstraint_16 = Instance.new("UIAspectRatioConstraint")
	local circle_17 = Instance.new("Frame")
	local UICorner_19 = Instance.new("UICorner")
	local UIAspectRatioConstraint_17 = Instance.new("UIAspectRatioConstraint")
	local circle_18 = Instance.new("Frame")
	local UICorner_20 = Instance.new("UICorner")
	local UIAspectRatioConstraint_18 = Instance.new("UIAspectRatioConstraint")
	local sub = Instance.new("Frame")
	local UICorner_21 = Instance.new("UICorner")
	local title_2 = Instance.new("TextLabel")
	local key = Instance.new("TextBox")
	local UICorner_22 = Instance.new("UICorner")
	local title_3 = Instance.new("TextLabel")
	local confirm = Instance.new("TextButton")
	local UICorner_23 = Instance.new("UICorner")
	local title_4 = Instance.new("TextLabel")
	local getKey = Instance.new("TextButton")
	local UICorner_24 = Instance.new("UICorner")
	local UIStroke_4 = Instance.new("UIStroke")
	local UIStroke_5 = Instance.new("UIStroke")

	loginPage.Name = "loginPage"
	loginPage.Parent = holder
	loginPage.AnchorPoint = Vector2.new(0.5, 0.5)
	loginPage.BackgroundColor3 = Color3.fromRGB(14, 16, 27)
	loginPage.ClipsDescendants = true
	loginPage.Position = UDim2.new(0.5, 0, 0.5, 0)
	loginPage.Size = UDim2.new(0.985000014, 0, 0.980000019, 0)

	UICorner.Parent = loginPage

	title.Name = "title"
	title.Parent = loginPage
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.Position = UDim2.new(0.0177498553, 0, 0.0289575271, 0)
	title.Size = UDim2.new(0.401136369, 0, 0.0598455593, 0)
	title.Font = Enum.Font.GothamMedium
	title.Text = "cool hub ig"
	title.TextColor3 = Color3.fromRGB(255, 255, 255)
	title.TextSize = 18.000
	title.TextWrapped = true
	title.TextXAlignment = Enum.TextXAlignment.Left
	title.ZIndex = 99

	exit.Name = "exit"
	exit.Parent = loginPage
	exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	exit.BackgroundTransparency = 1.000
	exit.Position = UDim2.new(0.944999993, 0, 0.0320000015, 0)
	exit.Size = UDim2.new(0.0288417172, 0, 0.0492474958, 0)
	exit.ZIndex = 20
	exit.Image = "rbxassetid://7897968293"

	circles.Name = "circles"
	circles.Parent = loginPage
	circles.AnchorPoint = Vector2.new(0.5, 0.5)
	circles.BackgroundColor3 = Color3.fromRGB(19, 18, 23)
	circles.BackgroundTransparency = 1.000
	circles.Position = UDim2.new(0.984000027, 0, 0.971000016, 0)
	circles.Size = UDim2.new(2, 0, 2, 0)

	UICorner_2.CornerRadius = UDim.new(0, 12)
	UICorner_2.Parent = circles

	circle.Name = "circle"
	circle.Parent = circles
	circle.AnchorPoint = Vector2.new(0.5, 0.5)
	circle.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle.Position = UDim2.new(0.934403777, 0, 0.212134242, 0)
	circle.Size = UDim2.new(0.35907805, 0, 0.592319667, 0)
	circle.ZIndex = 10

	UICorner_3.CornerRadius = UDim.new(0, 999999)
	UICorner_3.Parent = circle

	UIAspectRatioConstraint.Parent = circle
	UIAspectRatioConstraint.AspectRatio = 0.998

	circle_2.Name = "circle"
	circle_2.Parent = circles
	circle_2.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_2.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_2.Position = UDim2.new(0.487226248, 0, 0.0503391176, 0)
	circle_2.Size = UDim2.new(0.323500723, 0, 0.254808724, 0)
	circle_2.ZIndex = 10

	UICorner_4.CornerRadius = UDim.new(0, 999999)
	UICorner_4.Parent = circle_2

	UIAspectRatioConstraint_2.Parent = circle_2
	UIAspectRatioConstraint_2.AspectRatio = 0.998

	circle_3.Name = "circle"
	circle_3.Parent = circles
	circle_3.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_3.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_3.Position = UDim2.new(-0.00697395625, 0, 0.382283509, 0)
	circle_3.Size = UDim2.new(0.191323936, 0, 0.319412231, 0)
	circle_3.ZIndex = 10

	UICorner_5.CornerRadius = UDim.new(0, 999999)
	UICorner_5.Parent = circle_3

	UIAspectRatioConstraint_3.Parent = circle_3
	UIAspectRatioConstraint_3.AspectRatio = 0.998

	circle_4.Name = "circle"
	circle_4.Parent = circles
	circle_4.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_4.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_4.Position = UDim2.new(0.124847673, 0, 0.953496754, 0)
	circle_4.Size = UDim2.new(0.184713155, 0, 0.231328294, 0)
	circle_4.ZIndex = 10

	UICorner_6.CornerRadius = UDim.new(0, 999999)
	UICorner_6.Parent = circle_4

	UIAspectRatioConstraint_4.Parent = circle_4
	UIAspectRatioConstraint_4.AspectRatio = 0.998

	circle_5.Name = "circle"
	circle_5.Parent = circles
	circle_5.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_5.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_5.Position = UDim2.new(0.982067645, 0, 0.887458265, 0)
	circle_5.Size = UDim2.new(0.210442394, 0, 0.31424275, 0)
	circle_5.ZIndex = 10

	UICorner_7.CornerRadius = UDim.new(0, 999999)
	UICorner_7.Parent = circle_5

	UIAspectRatioConstraint_5.Parent = circle_5
	UIAspectRatioConstraint_5.AspectRatio = 0.998

	circle_6.Name = "circle"
	circle_6.Parent = circles
	circle_6.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_6.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_6.Position = UDim2.new(0.74220556, 0, 0.499893814, 0)
	circle_6.Size = UDim2.new(0.0904621705, 0, 0.150763839, 0)
	circle_6.ZIndex = 10

	UICorner_8.CornerRadius = UDim.new(0, 999999)
	UICorner_8.Parent = circle_6

	UIAspectRatioConstraint_6.Parent = circle_6
	UIAspectRatioConstraint_6.AspectRatio = 0.998

	circle_7.Name = "circle"
	circle_7.Parent = circles
	circle_7.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_7.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_7.Position = UDim2.new(0.18819645, 0, 0.219890133, 0)
	circle_7.Size = UDim2.new(0.127378151, 0, 0.143735275, 0)
	circle_7.ZIndex = 10

	UICorner_9.CornerRadius = UDim.new(0, 999999)
	UICorner_9.Parent = circle_7

	UIAspectRatioConstraint_7.Parent = circle_7
	UIAspectRatioConstraint_7.AspectRatio = 0.998

	circle_8.Name = "circle"
	circle_8.Parent = circles
	circle_8.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_8.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_8.Position = UDim2.new(0.51441443, 0, 0.92583698, 0)
	circle_8.Size = UDim2.new(0.0722778067, 0, 0.112200215, 0)
	circle_8.ZIndex = 10

	UICorner_10.CornerRadius = UDim.new(0, 999999)
	UICorner_10.Parent = circle_8

	UIAspectRatioConstraint_8.Parent = circle_8
	UIAspectRatioConstraint_8.AspectRatio = 0.998

	circle_9.Name = "circle"
	circle_9.Parent = circles
	circle_9.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_9.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_9.Position = UDim2.new(0.172158167, 0, 0.520878434, 0)
	circle_9.Size = UDim2.new(0.0771206021, 0, 0.116155788, 0)
	circle_9.ZIndex = 10

	UICorner_11.CornerRadius = UDim.new(0, 999999)
	UICorner_11.Parent = circle_9

	UIAspectRatioConstraint_9.Parent = circle_9
	UIAspectRatioConstraint_9.AspectRatio = 0.998

	circle_10.Name = "circle"
	circle_10.Parent = circles
	circle_10.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_10.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_10.Position = UDim2.new(0.147501141, 0, 0.0104933977, 0)
	circle_10.Size = UDim2.new(0.135317788, 0, 0.271087259, 0)
	circle_10.ZIndex = 10

	UICorner_12.CornerRadius = UDim.new(0, 999999)
	UICorner_12.Parent = circle_10

	UIAspectRatioConstraint_10.Parent = circle_10
	UIAspectRatioConstraint_10.AspectRatio = 0.998

	circle_11.Name = "circle"
	circle_11.Parent = circles
	circle_11.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_11.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_11.Position = UDim2.new(0.569819272, 0, 0.286870152, 0)
	circle_11.Size = UDim2.new(0.0894579515, 0, 0.125649616, 0)
	circle_11.ZIndex = 10

	UICorner_13.CornerRadius = UDim.new(0, 999999)
	UICorner_13.Parent = circle_11

	UIAspectRatioConstraint_11.Parent = circle_11
	UIAspectRatioConstraint_11.AspectRatio = 0.998

	circle_12.Name = "circle"
	circle_12.Parent = circles
	circle_12.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_12.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_12.Position = UDim2.new(0.440054983, 0, 0.605168581, 0)
	circle_12.Size = UDim2.new(0.0661526769, 0, 0.0996303335, 0)
	circle_12.ZIndex = 10

	UICorner_14.CornerRadius = UDim.new(0, 999999)
	UICorner_14.Parent = circle_12

	UIAspectRatioConstraint_12.Parent = circle_12
	UIAspectRatioConstraint_12.AspectRatio = 0.998

	circle_13.Name = "circle"
	circle_13.Parent = circles
	circle_13.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_13.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_13.Position = UDim2.new(0.67260313, 0, 0.819200575, 0)
	circle_13.Size = UDim2.new(0.152826279, 0, 0.292734683, 0)
	circle_13.ZIndex = 10

	UICorner_15.CornerRadius = UDim.new(0, 999999)
	UICorner_15.Parent = circle_13

	UIAspectRatioConstraint_13.Parent = circle_13
	UIAspectRatioConstraint_13.AspectRatio = 0.998

	circle_14.Name = "circle"
	circle_14.Parent = circles
	circle_14.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_14.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_14.Position = UDim2.new(0.335908771, 0, 0.764754117, 0)
	circle_14.Size = UDim2.new(0.127984777, 0, 0.210110456, 0)
	circle_14.ZIndex = 10

	UICorner_16.CornerRadius = UDim.new(0, 999999)
	UICorner_16.Parent = circle_14

	UIAspectRatioConstraint_14.Parent = circle_14
	UIAspectRatioConstraint_14.AspectRatio = 0.998

	circle_15.Name = "circle"
	circle_15.Parent = circles
	circle_15.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_15.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_15.Position = UDim2.new(0.877589703, 0, 0.624465942, 0)
	circle_15.Size = UDim2.new(0.0904621705, 0, 0.150763839, 0)
	circle_15.ZIndex = 10

	UICorner_17.CornerRadius = UDim.new(0, 999999)
	UICorner_17.Parent = circle_15

	UIAspectRatioConstraint_15.Parent = circle_15
	UIAspectRatioConstraint_15.AspectRatio = 0.998

	circle_16.Name = "circle"
	circle_16.Parent = circles
	circle_16.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_16.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_16.Position = UDim2.new(0.368511379, 0, 0.35778451, 0)
	circle_16.Size = UDim2.new(0.156010628, 0, 0.196714833, 0)
	circle_16.ZIndex = 10

	UICorner_18.CornerRadius = UDim.new(0, 999999)
	UICorner_18.Parent = circle_16

	UIAspectRatioConstraint_16.Parent = circle_16
	UIAspectRatioConstraint_16.AspectRatio = 0.998

	circle_17.Name = "circle"
	circle_17.Parent = circles
	circle_17.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_17.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_17.Position = UDim2.new(0.579863131, 0, 0.534273684, 0)
	circle_17.Size = UDim2.new(0.127378151, 0, 0.143735275, 0)
	circle_17.ZIndex = 10

	UICorner_19.CornerRadius = UDim.new(0, 999999)
	UICorner_19.Parent = circle_17

	UIAspectRatioConstraint_17.Parent = circle_17
	UIAspectRatioConstraint_17.AspectRatio = 0.998

	circle_18.Name = "circle"
	circle_18.Parent = circles
	circle_18.AnchorPoint = Vector2.new(0.5, 0.5)
	circle_18.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	circle_18.Position = UDim2.new(0.810568869, 0, 0.855254889, 0)
	circle_18.Size = UDim2.new(0.0470040776, 0, 0.0804475918, 0)
	circle_18.ZIndex = 10

	UICorner_20.CornerRadius = UDim.new(0, 999999)
	UICorner_20.Parent = circle_18

	UIAspectRatioConstraint_18.Parent = circle_18
	UIAspectRatioConstraint_18.AspectRatio = 0.998

	sub.Name = "sub"
	sub.Parent = loginPage
	sub.AnchorPoint = Vector2.new(0.5, 0.5)
	sub.BackgroundColor3 = Color3.fromRGB(14, 16, 27)
	sub.Position = UDim2.new(0.5, 0, 0.5, 0)
	sub.Size = UDim2.new(0.330000013, 0, 0.396767259, 0)
	sub.ZIndex = 20

	UICorner_21.CornerRadius = UDim.new(0, 5)
	UICorner_21.Parent = sub

	title_2.Name = "title"
	title_2.Parent = sub
	title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title_2.BackgroundTransparency = 1.000
	title_2.Position = UDim2.new(0.0710000023, 0, 0.075000003, 0)
	title_2.Size = UDim2.new(0.855555534, 0, 0.0753514394, 0)
	title_2.ZIndex = 2
	title_2.Font = Enum.Font.GothamBold
	title_2.Text = "Welcome, loading"
	title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
	title_2.TextScaled = true
	title_2.TextSize = 20.000
	title_2.TextWrapped = true

	key.Name = "key"
	key.Parent = sub
	key.BackgroundColor3 = Color3.fromRGB(17, 19, 33)
	key.Position = UDim2.new(0.0689999983, 0, 0.409999996, 0)
	key.Size = UDim2.new(0.855555534, 0, 0.118566968, 0)
	key.ZIndex = 2
	key.Font = Enum.Font.GothamBold
	key.PlaceholderText = "Click to enter key"
	key.Text = ""
	key.TextColor3 = Color3.fromRGB(255, 255, 255)
	key.TextScaled = true
	key.TextWrapped = true
	key.PlaceholderText = "Click to enter key"
	key.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)

	UICorner_22.CornerRadius = UDim.new(0, 3)
	UICorner_22.Parent = key

	title_3.Name = "title"
	title_3.Parent = sub
	title_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title_3.BackgroundTransparency = 1.000
	title_3.Position = UDim2.new(0.075000003, 0, 0.319999993, 0)
	title_3.Size = UDim2.new(0.419999987, 0, 0.0579506457, 0)
	title_3.ZIndex = 2
	title_3.Font = Enum.Font.GothamBold
	title_3.Text = "Key"
	title_3.TextColor3 = Color3.fromRGB(255, 255, 255)
	title_3.TextScaled = true
	title_3.TextSize = 20.000
	title_3.TextWrapped = true
	title_3.TextXAlignment = Enum.TextXAlignment.Left

	confirm.Name = "confirm"
	confirm.Parent = sub
	confirm.BackgroundColor3 = windowInfo.ColorScheme
	confirm.Position = UDim2.new(0.075000003, 0, 0.790000021, 0)
	confirm.Size = UDim2.new(0.848888874, 0, 0.122362435, 0)
	confirm.ZIndex = 3
	confirm.Font = Enum.Font.GothamBold
	confirm.Text = "Confirm"
	confirm.TextColor3 = Color3.fromRGB(255, 255, 255)
	confirm.TextSize = 16.000
	confirm.TextWrapped = true

	UICorner_23.CornerRadius = UDim.new(0, 6)
	UICorner_23.Parent = confirm

	title_4.Name = "title"
	title_4.Parent = sub
	title_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title_4.BackgroundTransparency = 1.000
	title_4.Position = UDim2.new(0.0710000023, 0, 0.189999998, 0)
	title_4.Size = UDim2.new(0.855555534, 0, 0.100000001, 0)
	title_4.ZIndex = 2
	title_4.Font = Enum.Font.GothamBold
	title_4.Text = "Enter key to continue"
	title_4.TextColor3 = Color3.fromRGB(255, 255, 255)
	title_4.TextScaled = true
	title_4.TextSize = 25.000
	title_4.TextWrapped = true

	getKey.Name = "getKey"
	getKey.Parent = sub
	getKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	getKey.BackgroundTransparency = 1.000
	getKey.Position = UDim2.new(0.0759999976, 0, 0.629999995, 0)
	getKey.Size = UDim2.new(0.851000011, 0, 0.0599999987, 0)
	getKey.ZIndex = 3
	getKey.Font = Enum.Font.GothamBold
	getKey.Text = "Don't have a key? Click here to get one."
	getKey.TextColor3 = Color3.fromRGB(255, 255, 255)
	getKey.TextScaled = true
	getKey.TextSize = 20.000
	getKey.TextWrapped = true

	UICorner_24.CornerRadius = UDim.new(0, 6)
	UICorner_24.Parent = getKey

	UIStroke_4.Thickness = 2
	UIStroke_4.Color = Color3.fromRGB(25, 30, 50)
	UIStroke_4.ApplyStrokeMode = "Border"
	UIStroke_4.Parent = sub

	UIStroke_5.Thickness = 2
	UIStroke_5.Color = Color3.fromRGB(25, 30, 50)
	UIStroke_5.ApplyStrokeMode = "Border"
	UIStroke_5.Parent = key

	-- This function repeats a word every time its coroutine is resumed
	local function repeatThis()
		while true do
			circles:TweenPosition(UDim2.new(0.044, 0, 0.174, 0), nil, nil, 4)
			task.wait(5)
			circles:TweenPosition(UDim2.new(1, 0, 0.971, 0), nil, nil, 4)
			task.wait(5)
			coroutine.yield()
		end
	end

	local authenticated = false
	if windowInfo.UseKey == true then
		confirm.MouseButton1Click:Connect(function()
			if key.Text == windowInfo.Key then
				authenticated = true
				ts:Create(glow, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(34, 255, 122)}):Play()
				ts:Create(confirm, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(34, 255, 122)}):Play()
				circles:TweenPosition(UDim2.new(-2, 0, -2, 0), nil, nil, 1)
				task.wait(0.375)
				sub:TweenPosition(UDim2.new(0.5, 0, 0.55, 0), nil, nil, 0.1)
				wait(0.3)
				sub:TweenPosition(UDim2.new(0.5, 0, -1.5, 0), nil, nil, 0.5)
				task.wait(0.375)
				ts:Create(glow, TweenInfo.new(0.25), {ImageColor3 = windowInfo.ColorScheme}):Play()
				ts:Create(confirm, TweenInfo.new(0.25), {BackgroundColor3 = windowInfo.ColorScheme}):Play()
				circles:Destroy()
				loginPage:Destroy()
			else
				ts:Create(confirm, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(255, 66, 66)}):Play()
				ts:Create(glow, TweenInfo.new(0.25), {ImageColor3 = Color3.fromRGB(255, 66, 66)}):Play()
				confirm.Text = "Incorrect"
				ts:Create(UIStroke_4, TweenInfo.new(0.1), {Color = Color3.fromRGB(255, 66, 66)}):Play()
				sub:TweenPosition(UDim2.new(0.51, 0, 0.5, 0), nil, nil, 0.05)
				task.wait(0.05)
				sub:TweenPosition(UDim2.new(0.49, 0, 0.5, 0), nil, nil, 0.05)
				task.wait(0.05)
				sub:TweenPosition(UDim2.new(0.51, 0, 0.5, 0), nil, nil, 0.05)
				task.wait(0.05)
				sub:TweenPosition(UDim2.new(0.49, 0, 0.5, 0), nil, nil, 0.05)
				task.wait(0.05)
				sub:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), nil, nil, 0.1)
				ts:Create(UIStroke_4, TweenInfo.new(0.25), {Color = Color3.fromRGB(25, 30, 50)}):Play()
				ts:Create(confirm, TweenInfo.new(0.25), {BackgroundColor3 = windowInfo.ColorScheme}):Play()
				ts:Create(glow, TweenInfo.new(0.25), {ImageColor3 = windowInfo.ColorScheme}):Play()
				wait(0.3)
				confirm.Text = "Confrim"
			end
		end)
	else
		loginPage:Destroy()
		authenticated = true
	end

	-- shrinking anim

--[[
		script.Parent.Parent.Parent:TweenSize(UDim2.new(0.625, 0, 0, 0), nil, nil, .5)
		script.Parent.Parent.Parent.Parent.border:TweenSize(UDim2.new(0.633, 0, 0, 0), nil, nil, .5)
		script.Parent.Parent.Parent.Parent.glow1:TweenSize(UDim2.new(0.633, 0, 0, 0), nil, nil, .5)
		script.Parent.Parent.Parent.Parent.glow2:TweenSize(UDim2.new(0.633, 0, 0, 0), nil, nil, .5)
		task.wait(.51)
		script.Parent.Parent.Parent:TweenSize(UDim2.new(0, 0, 0, 0), nil, nil, .25)
		script.Parent.Parent.Parent.Parent.border:TweenSize(UDim2.new(0, 0, 0, 0), nil, nil, .5)
		script.Parent.Parent.Parent.Parent.glow1:TweenSize(UDim2.new(0, 0, 0, 0), nil, nil, .5)
		script.Parent.Parent.Parent.Parent.glow2:TweenSize(UDim2.new(0, 0, 0, 0), nil, nil, .5)
		task.wait(.51)
		script.Parent.Parent.Parent.Visible = false
		script.Parent.Parent.Parent.Parent.border.Visible = false
]]--

	local tabInfo = {
		Name = "",
	}
	function window:AddTab(tabInfo)
		local tab = {}

		local selector = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		local UIStroke = Instance.new("UIStroke")
		local frame = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		local UIPadding = Instance.new("UIPadding")

		selector.Name = tabInfo.Name
		selector.Parent = selectors
		selector.BackgroundColor3 = Color3.fromRGB(14, 16, 27)
		selector.BackgroundTransparency = 0
		selector.Position = UDim2.new(0, 0, 0, 0)
		selector.Size = UDim2.new(0.984, 0, 0.131, 0)
		selector.Font = Enum.Font.GothamBold
		selector.Text = tabInfo.Name
		selector.TextColor3 = Color3.fromRGB(255, 255, 255)
		selector.TextSize = 14
		selector.AutoButtonColor = false

		UICorner.CornerRadius = UDim.new(0, 3)
		UICorner.Parent = selector

		UIStroke.Thickness = 1.7
		UIStroke.Color = Color3.fromRGB(25, 30, 50)
		UIStroke.ApplyStrokeMode = "Border"
		UIStroke.Parent = selector

		frame.Name = tabInfo.Name.."Frame"
		frame.Parent = display
		frame.Active = true
		frame.AnchorPoint = Vector2.new(0.5, 0.5)
		frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		frame.BackgroundTransparency = 1.000
		frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
		frame.BorderSizePixel = 0
		frame.Position = UDim2.new(0.5, 0, 0.51, 0)
		frame.Size = UDim2.new(0.966, 0, 0.93, 0)
		frame.AutomaticCanvasSize = "Y"
		frame.ScrollBarThickness = 4
		frame.Visible = false

		UIListLayout.Parent = frame
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 9)

		UIPadding.Parent = frame
		UIPadding.PaddingLeft = UDim.new(0, 2)
		UIPadding.PaddingTop = UDim.new(0, 2)
		
		selector.MouseButton1Click:Connect(function()
			local tween = ts:Create(selector.UIStroke, TweenInfo.new(0.25), {Color = windowInfo.ColorScheme})
			tween:Play()
			for i, v in pairs(selectors:GetChildren()) do
				if v:IsA("TextButton") and v ~= selector then
					local tween2 = ts:Create(v.UIStroke, TweenInfo.new(0.25), {Color = Color3.fromRGB(25, 30, 50)})
					tween2:Play()
					for a, b in pairs(display:GetChildren()) do
						if b:IsA("ScrollingFrame") and b ~= frame and b.Visible == true then
							local cover = Instance.new("Frame")
							cover.BackgroundTransparency = 1
							cover.Name = "cover"
							cover.Parent = display
							cover.BackgroundColor3 = Color3.fromRGB(14, 16, 27)
							cover.BorderSizePixel = 0
							cover.ZIndex = 9
							cover.Size = UDim2.new(0.97, 0, 0.97, 0)
							cover.Position = UDim2.new(0.503, 0, 0.5, 0)
							cover.AnchorPoint = Vector2.new(0.5, 0.5)

							local tween5 = ts:Create(cover, TweenInfo.new(0.5), {BackgroundTransparency = 0})
							local tween6 = ts:Create(cover, TweenInfo.new(0.5), {BackgroundTransparency = 1})
							tween5:Play()
							task.wait(0.1)
							b.Visible = false
							frame.Visible = true
							tween6:Play()
							task.wait(0.1)
							cover:Destroy()
						end
					end
				end
			end
			frame.Visible = true
		end)
		
		local sectionInfo = {
			Name = "",
			TextPosition = Enum.TextXAlignment.Center
		}

		local toggleInfo = {
			Name = "",
			Default = false,
			Callback = function(Value)

			end
		}

		function tab:AddToggle(toggleInfo)
			local toggle = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local text = Instance.new("TextLabel")
			local toggleBG = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local circle = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local toggleButton = Instance.new("TextButton")
			local UICorner_4 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")

			toggle.Name = "toggle"
			toggle.Parent = frame
			toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggle.BackgroundTransparency = 1.000
			toggle.ClipsDescendants = true
			toggle.Position = UDim2.new(0, 0, 0, 0)
			toggle.Size = UDim2.new(0.996, 0, 0.13, 0)

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = toggle

			text.Name = "text"
			text.Parent = toggle
			text.AnchorPoint = Vector2.new(0.5, 0.5)
			text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			text.BackgroundTransparency = 1.000
			text.Position = UDim2.new(0.383429706, 0, 0.49999994, 0)
			text.Size = UDim2.new(0.719886661, 0, 0.587906659, 0)
			text.Font = Enum.Font.GothamMedium
			text.Text = toggleInfo.Name
			text.TextColor3 = Color3.fromRGB(255, 255, 255)
			text.TextSize = 17.000
			text.TextXAlignment = Enum.TextXAlignment.Left

			toggleBG.Name = "toggleBG"
			toggleBG.Parent = toggle
			toggleBG.AnchorPoint = Vector2.new(0.5, 0.5)
			toggleBG.BackgroundColor3 = Color3.fromRGB(255, 66, 66)
			toggleBG.ClipsDescendants = true
			toggleBG.Position = UDim2.new(0.939999998, 0, 0.5, 0)
			toggleBG.Size = UDim2.new(0.075000003, 0, 0.5, 0)

			UICorner_2.CornerRadius = UDim.new(0, 999)
			UICorner_2.Parent = toggleBG

			circle.Name = "circle"
			circle.Parent = toggleBG
			circle.AnchorPoint = Vector2.new(0.5, 0.5)
			circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			circle.ClipsDescendants = true
			circle.Position = UDim2.new(0.25, 0, 0.501999974, 0)
			circle.Size = UDim2.new(0.324999988, 0, 0.699999988, 0)

			UICorner_3.CornerRadius = UDim.new(0, 999)
			UICorner_3.Parent = circle

			toggleButton.Name = "toggleButton"
			toggleButton.Parent = toggle
			toggleButton.AnchorPoint = Vector2.new(0.5, 0.5)
			toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			toggleButton.BackgroundTransparency = 1.000
			toggleButton.Position = UDim2.new(0.939999998, 0, 0.5, 0)
			toggleButton.Size = UDim2.new(0.075000003, 0, 0.5, 0)
			toggleButton.ZIndex = 10
			toggleButton.AutoButtonColor = false
			toggleButton.Font = Enum.Font.SourceSans
			toggleButton.Text = ""
			toggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			toggleButton.TextSize = 14.000

			UICorner_4.CornerRadius = UDim.new(0, 999)
			UICorner_4.Parent = toggleButton

			UIStroke.Thickness = 1.7
			UIStroke.Color = Color3.fromRGB(25, 30, 50)
			UIStroke.ApplyStrokeMode = "Border"
			UIStroke.Parent = toggle

			if toggleInfo.Default == false then
				circle.Position = UDim2.new(0.25, 0, 0.502, 0)
				toggleBG.BackgroundColor3 = Color3.fromRGB(255, 66, 66)
			elseif toggleInfo.Default == true then
				circle.Position = UDim2.new(0.75, 0, 0.502, 0)
				toggleBG.BackgroundColor3 = Color3.fromRGB(34, 255, 122)
			end

			local status = toggleInfo.Default
			toggleButton.MouseButton1Click:Connect(function()
				if status == false then
					local tween3 = ts:Create(toggleBG, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(34, 255, 122)})
					tween3:Play()
					circle:TweenPosition(UDim2.new(0.75, 0, 0.502, 0), nil, nil, 0.25)
					toggleInfo.Callback(toggleButton)
					status = true
				elseif status == true then
					local tween4 = ts:Create(toggleBG, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(255, 66, 66)})
					tween4:Play()
					circle:TweenPosition(UDim2.new(0.25, 0, 0.502, 0), nil, nil, 0.25)
					toggleInfo.Callback(toggleButton)
					status = false
				end
			end)
		end

		local buttonInfo = {
			Name = "",
			Color = Color3.fromRGB(64, 136, 253),
			Callback = function(Value)

			end
		}

		function tab:AddButton(buttonInfo)
			local button = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local text = Instance.new("TextLabel")
			local buttonButton = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")


			button.Name = "button"
			button.Parent = frame
			button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			button.BackgroundTransparency = 1.000
			button.ClipsDescendants = true
			button.Position = UDim2.new(0, 0, 0, 0)
			button.Size = UDim2.new(0.996, 0, 0.13, 0)

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = button

			text.Name = "text"
			text.Parent = button
			text.AnchorPoint = Vector2.new(0.5, 0.5)
			text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			text.BackgroundTransparency = 1.000
			text.Position = UDim2.new(0.383429706, 0, 0.49999994, 0)
			text.Size = UDim2.new(0.719886661, 0, 0.587906659, 0)
			text.Font = Enum.Font.GothamMedium
			text.Text = buttonInfo.Name
			text.TextColor3 = Color3.fromRGB(255, 255, 255)
			text.TextSize = 17.000
			text.TextXAlignment = Enum.TextXAlignment.Left

			buttonButton.Name = "buttonButton"
			buttonButton.Parent = button
			buttonButton.AnchorPoint = Vector2.new(0.5, 0.5)
			buttonButton.BackgroundColor3 = buttonInfo.Color
			buttonButton.Position = UDim2.new(0.959999979, 0, 0.5, 0)
			buttonButton.Size = UDim2.new(0.0430000015, 0, 0.600000024, 0)
			buttonButton.AutoButtonColor = false
			buttonButton.Font = Enum.Font.SourceSans
			buttonButton.Text = ""
			buttonButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			buttonButton.TextSize = 14.000

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = buttonButton

			UIStroke.Thickness = 1.7
			UIStroke.Color = Color3.fromRGB(25, 30, 50)
			UIStroke.ApplyStrokeMode = "Border"
			UIStroke.Parent = button

			buttonButton.MouseButton1Click:Connect(function()
				buttonInfo.Callback(buttonButton)
			end)
		end

		local dropdownInfo = {
			Name = "",
			Default = "",
			Options = {"1", "2"},
			Callback = function(Value)

			end
		}

		function tab:AddDropdown(dropdownInfo)
			local dropdown = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local text = Instance.new("TextLabel")
			local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
			local openButton = Instance.new("ImageButton")
			local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
			local options = Instance.new("Frame")
			local UICorner_2 = Instance.new("UICorner")
			local UIStroke = Instance.new("UIStroke")

			dropdown.Name = "dropdown"
			dropdown.Parent = frame
			dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			dropdown.BackgroundTransparency = 1.000
			dropdown.ClipsDescendants = true
			dropdown.Position = UDim2.new(0, 0, 0, 0)
			dropdown.Size = UDim2.new(0.996, 0, 0.13, 0)
			dropdown.AutomaticSize = "Y"

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = dropdown

			text.Name = "text"
			text.Parent = dropdown
			text.Active = true
			text.AnchorPoint = Vector2.new(0.5, 0.5)
			text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			text.BackgroundTransparency = 1.000
			text.Position = UDim2.new(0.383429706, 0, 0.49999994, 0)
			text.Size = UDim2.new(0.719886661, 0, 0.587906659, 0)
			text.Font = Enum.Font.GothamMedium
			text.Text = dropdownInfo.Name
			text.TextColor3 = Color3.fromRGB(255, 255, 255)
			text.TextSize = 17.000
			text.TextXAlignment = Enum.TextXAlignment.Left

			UIAspectRatioConstraint.Parent = text
			UIAspectRatioConstraint.AspectRatio = 17.180

			openButton.Name = "openButton"
			openButton.Parent = dropdown
			openButton.AnchorPoint = Vector2.new(0.5, 0.5)
			openButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			openButton.BackgroundTransparency = 1.000
			openButton.Position = UDim2.new(0.959999979, 0, 0.5, 0)
			openButton.Size = UDim2.new(0.0430000015, 0, 0.600000024, 0)
			openButton.AutoButtonColor = false
			openButton.Image = "http://www.roblox.com/asset/?id=10413772499"

			UIAspectRatioConstraint_2.Parent = openButton
			UIAspectRatioConstraint_2.AspectRatio = 1.005

			options.Name = "options"
			options.Parent = dropdown
			options.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			options.BackgroundTransparency = 1.000
			options.ClipsDescendants = true
			options.Position = UDim2.new(0, 0, 1, 0)
			options.Size = UDim2.new(1, 0, 0, 0)
			options.Visible = false

			UICorner_2.CornerRadius = UDim.new(0, 3)
			UICorner_2.Parent = options

			UIStroke.Thickness = 1.7
			UIStroke.Color = Color3.fromRGB(25, 30, 50)
			UIStroke.ApplyStrokeMode = "Border"
			UIStroke.Parent = dropdown
			frame.AutomaticCanvasSize = "Y"

			local open = false

			openButton.MouseButton1Click:Connect(function()
				if open == false then
					options:TweenSize(UDim2.new(1, 0, 2, 0), nil, nil, .25)
					local tween7 = ts:Create(openButton, TweenInfo.new(0.25), {Rotation = -90})
					tween7:Play()
					open = true
				else
					options:TweenSize(UDim2.new(1, 0, 0, 0), nil, nil, .25)
					local tween8 = ts:Create(openButton, TweenInfo.new(0.25), {Rotation = 0})
					tween8:Play()
					open = false
				end
			end)
		end

		local sliderInfo = {
			Name = "",
			Min = 0,
			Max = 100,
			Default = 16,
			Color = Color3.fromRGB(64, 136, 253),
			Increment = 1,
			ValueName = "",
			Callback = function(Value)

			end
		}

		function tab:AddSlider(sliderInfo)
			local slider = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local resetButton = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			local sliderSlider = Instance.new("TextButton")
			local move = Instance.new("TextButton")
			local UICorner_3 = Instance.new("UICorner")
			local text = Instance.new("TextLabel")
			local block = Instance.new("Frame")
			local UIStroke = Instance.new("UIStroke")

			slider.Name = "slider"
			slider.Parent = frame
			slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			slider.BackgroundTransparency = 1.000
			slider.ClipsDescendants = true
			slider.Position = UDim2.new(0, 0, 0, 0)
			slider.Size = UDim2.new(0.996, 0, 0.13, 0)

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = slider

			resetButton.Name = "resetButton"
			resetButton.Parent = slider
			resetButton.AnchorPoint = Vector2.new(0.5, 0.5)
			resetButton.BackgroundColor3 = windowInfo.ColorScheme
			resetButton.Position = UDim2.new(0.890250027, 0, 0.500000119, 0)
			resetButton.Size = UDim2.new(0.182500005, 0, 0.600000024, 0)
			resetButton.AutoButtonColor = false
			resetButton.Font = Enum.Font.GothamMedium
			resetButton.Text = "Reset"
			resetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
			resetButton.TextSize = 14.000

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = resetButton

			sliderSlider.Name = "sliderSlider"
			sliderSlider.Parent = slider
			sliderSlider.AnchorPoint = Vector2.new(0, 0.5)
			sliderSlider.BackgroundColor3 = Color3.fromRGB(14, 16, 27)
			sliderSlider.BorderSizePixel = 0
			sliderSlider.ClipsDescendants = true
			sliderSlider.Position = UDim2.new(-0.00100000005, 0, 0.5, 0)
			sliderSlider.Size = UDim2.new(0.785, 0, 0.95, 0)
			sliderSlider.AutoButtonColor = false
			sliderSlider.Font = Enum.Font.SourceSans
			sliderSlider.Text = ""
			sliderSlider.TextColor3 = Color3.fromRGB(0, 0, 0)
			sliderSlider.TextSize = 14.000

			move.Name = "move"
			move.Parent = sliderSlider
			move.AnchorPoint = Vector2.new(0, 0.5)
			move.BackgroundColor3 = windowInfo.ColorScheme
			move.Position = UDim2.new(0.0010000316, 0, 0.500001132, 0)
			move.Size = UDim2.new(0.438121915, 0, 0.984799445, 0)
			move.AutoButtonColor = false
			move.Font = Enum.Font.SourceSans
			move.Text = ""
			move.TextColor3 = Color3.fromRGB(0, 0, 0)
			move.TextSize = 14.000

			UICorner_3.CornerRadius = UDim.new(0, 4)
			UICorner_3.Parent = move

			text.Name = "text"
			text.Parent = sliderSlider
			text.AnchorPoint = Vector2.new(0, 0.5)
			text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			text.BackgroundTransparency = 1.000
			text.Position = UDim2.new(0.0329999998, 0, 0.5, 0)
			text.Size = UDim2.new(0.967000067, 0, 0.800000012, 0)
			text.Font = Enum.Font.GothamMedium
			text.Text = "Slider"
			text.TextColor3 = Color3.fromRGB(255, 255, 255)
			text.TextSize = 18.000
			text.TextWrapped = true
			text.TextXAlignment = Enum.TextXAlignment.Left

			block.Name = "block"
			block.Parent = slider
			block.BackgroundColor3 = Color3.fromRGB(25, 30, 50)
			block.BorderSizePixel = 0
			block.ClipsDescendants = true
			block.Position = UDim2.new(0.779823959, 0, 0.0250001103, 0)
			block.Size = UDim2.new(0.00400000019, 0, 1.07299995, 0)

			UIStroke.Thickness = 1.7
			UIStroke.Color = Color3.fromRGB(25, 30, 50)
			UIStroke.ApplyStrokeMode = "Border"
			UIStroke.Parent = slider

			local minvalue = sliderInfo.Min or 0
			local maxvalue = sliderInfo.Max or 100

			local player = game.Players.LocalPlayer
			local mouse = player:GetMouse()
			local Value = sliderInfo.Default

			move.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 425) * move.AbsoluteSize.X) + tonumber(minvalue)) or 0
				pcall(function()
					sliderInfo.Callback(Value)
				end)
				move.Size = UDim2.new(0, math.clamp(mouse.X - move.AbsolutePosition.X, 0, 425), 1, 0)
				moveconnection = mouse.Move:Connect(function()
					move.Parent.text.Text = sliderInfo.ValueName..Value
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 425) * move.AbsoluteSize.X) + tonumber(minvalue))
					pcall(function()
						sliderInfo.Callback(Value)
					end)
					move.Size = UDim2.new(0, math.clamp(mouse.X - move.AbsolutePosition.X, 0, 425), 1, 0)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 425) * move.AbsoluteSize.X) + tonumber(minvalue))
						pcall(function()
							sliderInfo.Callback(Value)
						end)
						move.Parent.text.Text = sliderInfo.ValueName..Value
						move.Size = UDim2.new(0, math.clamp(mouse.X - move.AbsolutePosition.X, 0, 425), 1, 0)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)

			sliderSlider.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 425) * move.AbsoluteSize.X) + tonumber(minvalue)) or 0
				move.Parent.text.Text = sliderInfo.ValueName..Value
				pcall(function()
					sliderInfo.Callback(Value)
				end)
				move.Size = UDim2.new(0, math.clamp(mouse.X - move.AbsolutePosition.X, 0, 425), 1, 0)
				moveconnection = mouse.Move:Connect(function()
					move.Parent.text.Text = sliderInfo.ValueName..Value
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 425) * move.AbsoluteSize.X) + tonumber(minvalue))
					pcall(function()
						sliderInfo.Callback(Value)
					end)
					move.Size = UDim2.new(0, math.clamp(mouse.X - move.AbsolutePosition.X, 0, 425), 1, 0)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 425) * move.AbsoluteSize.X) + tonumber(minvalue))
						pcall(function()
							sliderInfo.Callback(Value)
						end)
						move.Size = UDim2.new(0, math.clamp(mouse.X - move.AbsolutePosition.X, 0, 425), 1, 0)
						move.Parent.text.Text = sliderInfo.ValueName..Value
						releaseconnection:Disconnect()
						moveconnection:Disconnect()
					end
				end)
			end)

			resetButton.MouseButton1Click:Connect(function()
				Value = sliderInfo.Default
				move.Parent.text.Text = sliderInfo.ValueName..Value
				move.Size = UDim2.new(0, math.clamp(mouse.X - move.AbsolutePosition.X, 0, 50), 1, 0)
				sliderInfo.Callback(Value)
			end)
		end
		
		local titleInfo = {
			Name = "",
			Text = "",
		}
		
		function tab:AddTitle(titleInfo)
			local paragraph = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local text = Instance.new("TextLabel")
			local UIStroke = Instance.new("UIStroke")
			local UICorner = Instance.new("UICorner")

			paragraph.Name = "paragraph"
			paragraph.Parent = frame
			paragraph.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			paragraph.BackgroundTransparency = 1.000
			paragraph.ClipsDescendants = true
			paragraph.Position = UDim2.new(-1.05128983e-07, 0, 0.971491575, 0)
			paragraph.Size = UDim2.new(0.976000011, 0, 0.127000004, 0)
			paragraph.AutomaticSize = "Y"

			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = paragraph

			text.Name = titleInfo.Name
			text.Parent = paragraph
			text.AnchorPoint = Vector2.new(0.5, 0.5)
			text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			text.BackgroundTransparency = 1.000
			text.Position = UDim2.new(0.500688791, 0, 0.499999613, 0)
			text.Size = UDim2.new(0.954404593, 0, 0.587906659, 0)
			text.Font = Enum.Font.GothamMedium
			text.Text = titleInfo.Text
			text.TextColor3 = Color3.fromRGB(255, 255, 255)
			text.TextSize = 17.000
			text.TextWrapped = true
			text.TextXAlignment = Enum.TextXAlignment.Left
			text.AutomaticSize = "Y"
			
			UICorner.CornerRadius = UDim.new(0, 3)
			UICorner.Parent = paragraph
			
			UIStroke.Parent = paragraph
			UIStroke.Color = Color3.fromRGB(25, 30, 50)
			UIStroke.Thickness = 1.7
			UIStroke.ApplyStrokeMode = "Border"
		end

		return tab
	end
	draggable(holder)
	return window
end
return library