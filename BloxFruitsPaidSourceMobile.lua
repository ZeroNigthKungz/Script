
do
    local gui = game:GetService("CoreGui"):FindFirstChild("HovxrzGui")
    if gui then
        gui:Destroy()
    end
end

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		local Tween = TweenService:Create(object, TweenInfo.new(0.2), {Position = pos})
		Tween:Play()
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local library = {}

function library:CreateWindow(text,maincolor,text2,logo)
    logo = logo or 0
    maincolor = maincolor or Color3.fromRGB(63,233,233)
    local isselected = false

    local HovxrzGui = Instance.new("ScreenGui")
    HovxrzGui.Name = "HovxrzGui"
    HovxrzGui.Parent = game:GetService("CoreGui")
    HovxrzGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local Main = Instance.new("Frame")
    Main.Name = "Main"
    Main.Parent = HovxrzGui
    Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Main.BorderColor3 = Color3.fromRGB(25, 25, 25)
    Main.Position = UDim2.new(0.5, 0,0.499, 0)
    -- Main.Size = UDim2.new(0, 375, 0, 460)
    Main.AnchorPoint = Vector2.new(0.5,0.5)

    local Top = Instance.new("Frame")
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Top.BorderSizePixel = 0
    -- Top.Size = UDim2.new(0, 375, 0, 20)
    Top.ClipsDescendants = true
    
    local NameHub = Instance.new("TextLabel")
    NameHub.Name = "NameHub"
    NameHub.Parent = Top
    NameHub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NameHub.BackgroundTransparency = 1.000
    NameHub.Position = UDim2.new(0, 25, 0, 0)
    NameHub.Size = UDim2.new(0, 50, 0, 20)
    NameHub.Font = Enum.Font.GothamSemibold
    NameHub.Text = string.upper(text)
    NameHub.TextColor3 = Color3.fromRGB(225, 225, 225)
    NameHub.TextSize = 15.000
    
    local Hub = Instance.new("TextLabel")
    Hub.Name = "Hub"
    Hub.Parent = Top
    Hub.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Hub.BackgroundTransparency = 1.000
    Hub.Position = UDim2.new(0, 75, 0, 0)
    Hub.Size = UDim2.new(0, 60, 0, 20)
    Hub.Font = Enum.Font.GothamSemibold
    Hub.Text = "HUB"
    Hub.TextColor3 = maincolor
    Hub.TextSize = 15.000
    Hub.TextXAlignment = Enum.TextXAlignment.Left
    
    local Logo = Instance.new("ImageLabel")
    Logo.Name = "Logo"
    Logo.Parent = Top
    Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Logo.BackgroundTransparency = 1.000
    Logo.BorderSizePixel = 0
    Logo.Position = UDim2.new(0, 5, 0, 0)
    Logo.Size = UDim2.new(0, 20, 0, 20)
    Logo.Image = "rbxassetid://11649824457"..tostring(logo)

    local Barrier = Instance.new("Frame")
    Barrier.Name = "Barrier"
    Barrier.Parent = Top
    Barrier.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    Barrier.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Barrier.BorderSizePixel = 0
    Barrier.Position = UDim2.new(0, 115, 0, 3)
    Barrier.Size = UDim2.new(0, 2, 0, 14)

    local Description = Instance.new("TextLabel")
    Description.Name = "Description"
    Description.Parent = Top
    Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Description.BackgroundTransparency = 1.000
    Description.Position = UDim2.new(0, 125, 0, 0)
    Description.Size = UDim2.new(0, 250, 0, 20)
    Description.Font = Enum.Font.GothamSemibold
    Description.Text = text2
    Description.TextColor3 = Color3.fromRGB(225, 225, 225)
    Description.TextSize = 15.000
    Description.TextXAlignment = Enum.TextXAlignment.Left

    local Tab = Instance.new("Frame")
    Tab.Name = "Tab"
    Tab.Parent = Main
    Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Tab.BorderSizePixel = 0
    Tab.Position = UDim2.new(0, 5, 0, 25)
    Tab.Size = UDim2.new(0, 365, 0, 25)

    local ScrollTab = Instance.new("ScrollingFrame")
    ScrollTab.Name = "ScrollTab"
    ScrollTab.Parent = Tab
    ScrollTab.Active = true
    ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollTab.BackgroundTransparency = 1.000
    ScrollTab.BorderSizePixel = 0
    ScrollTab.Size = UDim2.new(0, 365, 0, 25)
    ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollTab.ScrollBarThickness = 0

    local TabListLayout = Instance.new("UIListLayout")
    TabListLayout.Name = "TabListLayout"
    TabListLayout.Parent = ScrollTab
    TabListLayout.FillDirection = Enum.FillDirection.Horizontal
    TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    TabListLayout.Padding = UDim.new(0, 5)

    local Page = Instance.new("Frame")
    Page.Name = "Page"
    Page.Parent = Main
    Page.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Page.BorderSizePixel = 0
    Page.Position = UDim2.new(0.0133333337, 0, 0.130434781, 0)
    Page.Size = UDim2.new(0, 365, 0, 395)

    local pagesFolder = Instance.new("Folder")
    pagesFolder.Name = "pagesFolder"
    pagesFolder.Parent = Page

    MakeDraggable(Top,Main)
    
    Main.BackgroundTransparency = 1
    Tab.Visible = false
    Page.Visible = false
    Main.Size = UDim2.new(0,375,0,0)
    Top.Size = UDim2.new(0,0,0,20)
    TweenService:Create(
        Top,
        TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 375, 0, 20)}
    ):Play()
    repeat wait() until Top.Size == UDim2.new(0, 375, 0, 20)
    Main.BackgroundTransparency = 0
    TweenService:Create(
        Main,
        TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 375, 0, 460)}
    ):Play()
    repeat wait() until Main.Size == UDim2.new(0, 375, 0, 460)
    Tab.Visible = true
    Page.Visible = true

    local uihide = false
    local ScreenGui = Instance.new("ScreenGui")
    local ImageButton = Instance.new("ImageButton")

    ScreenGui.Parent = game.CoreGui

    ImageButton.Parent = ScreenGui
    ImageButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
    ImageButton.Size = UDim2.new(0, 50, 0, 50)
    ImageButton.BorderSizePixel = 0
    ImageButton.Image = "rbxassetid://11649824457" -- LOGO
    ImageButton.MouseButton1Down:connect(function()
        if uihide == false then
            uihide = true
            Tab.Visible = false
            Page.Visible = false
            TweenService:Create(
                Main,
                TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {Size = UDim2.new(0,375,0,0)}
            ):Play()
            repeat wait() until Main.Size == UDim2.new(0,375,0,0)
            Main.BackgroundTransparency = 1
            TweenService:Create(
                Top,
                TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {Size = UDim2.new(0,0,0,20)}
            ):Play()
        else
            uihide = false
            TweenService:Create(
                Top,
                TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 375, 0, 20)}
            ):Play()
            repeat wait() until Top.Size == UDim2.new(0, 375, 0, 20)
            Main.BackgroundTransparency = 0
            TweenService:Create(
                Main,
                TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {Size = UDim2.new(0, 375, 0, 460)}
            ):Play()
            repeat wait() until Main.Size == UDim2.new(0, 375, 0, 460)
            Tab.Visible = true
            Page.Visible = true
        end
    end)

    local uitab = {}
    function uitab:AddTab(text)
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "TabButton"
        TabButton.Parent = ScrollTab
        TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.BackgroundTransparency = 1.000
        TabButton.Size = UDim2.new(0, 80, 0, 25)
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.Text = text
        TabButton.TextColor3 = Color3.fromRGB(225, 225, 225)
        TabButton.TextSize = 14.000
        TabButton.TextTransparency = 0.5

        local MainPage = Instance.new("Frame")
        MainPage.Name = "MainPage"
        MainPage.Parent = pagesFolder
        MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainPage.BackgroundTransparency = 1.000
        MainPage.Size = UDim2.new(0, 365, 0, 395)
        MainPage.Visible = false

        local MainFramePage = Instance.new("ScrollingFrame")
        MainFramePage.Name = "MainFramePage"
        MainFramePage.Parent = MainPage
        MainFramePage.Active = true
        MainFramePage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        MainFramePage.BackgroundTransparency = 1.000
        MainFramePage.BorderSizePixel = 0
        MainFramePage.Size = UDim2.new(0, 365, 0, 395)
        MainFramePage.CanvasSize = UDim2.new(0, 0, 0, 0)
        MainFramePage.ScrollBarThickness = 0

        local PageListLayout = Instance.new("UIListLayout")
        PageListLayout.Name = "PageListLayout"
        PageListLayout.Padding = UDim.new(0, 15)
        PageListLayout.Parent = MainFramePage
        PageListLayout.SortOrder = Enum.SortOrder.LayoutOrder

        local PagePadding = Instance.new("UIPadding")
        PagePadding.Name = "PagePadding"
        PagePadding.Parent = MainFramePage
        PagePadding.PaddingLeft = UDim.new(0,15)
        PagePadding.PaddingTop = UDim.new(0,15)

        TabButton.MouseButton1Click:Connect(function()
            for i,v in next,pagesFolder:GetChildren() do
                if v.Name == "MainPage" then
                    v.Visible = false
                end
                MainPage.Visible = true
            end
            for i,v in next,ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
        end)

        if isselected == false then
            for i,v in next,pagesFolder:GetChildren() do
                if v.Name == "MainPage" then
                    v.Visible = false
                end
                MainPage.Visible = true
            end
            for i,v in next,ScrollTab:GetChildren() do
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextTransparency = 0.5}
                    ):Play()
                end
                TweenService:Create(
                    TabButton,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()
            end
            isselected = true
        end

        game:GetService("RunService").Stepped:Connect(function()
            ScrollTab.CanvasSize = UDim2.new(0, TabListLayout.AbsoluteContentSize.X + 10, 0, 0)
            MainFramePage.CanvasSize = UDim2.new(0, 0, 0, PageListLayout.AbsoluteContentSize.Y + 30)
        end)

        local main = {}
        function main:AddButton(text,callback)
            local ButtonFrame = Instance.new("Frame")
            ButtonFrame.Name = "ButtonFrame"
            ButtonFrame.Parent = MainFramePage
            ButtonFrame.BackgroundColor3 = maincolor
            ButtonFrame.BorderSizePixel = 0
            ButtonFrame.Size = UDim2.new(0, 335, 0, 30)
            
            local UICorner = Instance.new("UICorner")
            UICorner.Parent = ButtonFrame
            UICorner.CornerRadius = UDim.new(0,5)
            
            local Button = Instance.new("TextButton")
            Button.Name = "Button"
            Button.Parent = ButtonFrame
            Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Button.BorderSizePixel = 0
            Button.Position = UDim2.new(0, 1, 0, 1)
            Button.Size = UDim2.new(0, 333, 0, 28)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.GothamSemibold
            Button.Text = text
            Button.TextColor3 = Color3.fromRGB(225, 225, 225)
            Button.TextSize = 14.000

            local UICorner_2 = Instance.new("UICorner")
            UICorner_2.Parent = Button
            UICorner_2.CornerRadius = UDim.new(0,5)
            
            local Black = Instance.new("Frame")
            Black.Name = "Black"
            Black.Parent = Button
            Black.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Black.BackgroundTransparency = 1.000
            Black.Size = UDim2.new(0, 335, 0, 28)

            Button.MouseEnter:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = maincolor}
                ):Play()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundTransparency = 0.7}
                ):Play()
            end)

            Button.MouseLeave:Connect(function()
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(225, 225, 225)}
                ):Play()
                TweenService:Create(
                    Black,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundTransparency = 1}
                ):Play()
            end)

            Button.MouseButton1Click:Connect(function()
                callback()
                Button.TextSize = 0
				TweenService:Create(
					Button,
					TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{TextSize = 14}
				):Play()
            end)
        end

        function main:AddToggle(text,config,callback)
            config = config or false
            local istoggled = config

            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = "ToggleFrame"
            ToggleFrame.Parent = MainFramePage
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleFrame.BackgroundTransparency = 1.000
            ToggleFrame.Size = UDim2.new(0, 335, 0, 25)

            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = ToggleFrame
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButton.BackgroundTransparency = 1.000
            ToggleButton.Size = UDim2.new(0, 335, 0, 25)
            ToggleButton.Font = Enum.Font.SourceSans
            ToggleButton.Text = ""
            ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButton.TextSize = 14.000

            local ToggleLabel = Instance.new("TextLabel")
            ToggleLabel.Name = "ToggleLabel"
            ToggleLabel.Parent = ToggleFrame
            ToggleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleLabel.BackgroundTransparency = 1.000
            ToggleLabel.Position = UDim2.new(0.0447761193, 0, 0, 0)
            ToggleLabel.Size = UDim2.new(0, 276, 0, 25)
            ToggleLabel.Font = Enum.Font.GothamSemibold
            ToggleLabel.Text = text
            ToggleLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
            ToggleLabel.TextSize = 15.000
            ToggleLabel.TextXAlignment = Enum.TextXAlignment.Left

            local ToggleImage = Instance.new("Frame")
            ToggleImage.Name = "ToggleImage"
            ToggleImage.Parent = ToggleFrame
            ToggleImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
            ToggleImage.Position = UDim2.new(0, 290, 0, 1)
            ToggleImage.Size = UDim2.new(0, 46, 0, 21)

            local UICorner = Instance.new("UICorner")
            UICorner.CornerRadius = UDim.new(0, 10)
            UICorner.Parent = ToggleImage

            local Circle = Instance.new("Frame")
            Circle.Name = "Circle"
            Circle.Parent = ToggleImage
            Circle.BackgroundColor3 = Color3.fromRGB(233, 63, 63)
            Circle.Position = UDim2.new(0, 2, 0, 1)
            Circle.Size = UDim2.new(0, 19, 0, 19)

            local UICorner_2 = Instance.new("UICorner")
            UICorner_2.CornerRadius = UDim.new(0, 10)
            UICorner_2.Parent = Circle

            ToggleButton.MouseButton1Click:Connect(function()
                if istoggled == false then
                    istoggled = true
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Position = UDim2.new(0, 24, 0, 1)}
                    ):Play()
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = maincolor}
                    ):Play()
                else
                    istoggled = false
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {Position = UDim2.new(0, 2, 0, 1)}
                    ):Play()
                    TweenService:Create(
                        Circle,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {BackgroundColor3 = Color3.fromRGB(233, 63, 63)}
                    ):Play()
                end
                pcall(callback,istoggled)
            end)

            if config == true then
                if istoggled == false then
                    istoggled = true
                end
                TweenService:Create(
                    Circle,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {Position = UDim2.new(0, 24, 0, 1)}
                ):Play()
                TweenService:Create(
                    Circle,
                    TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {BackgroundColor3 = maincolor}
                ):Play()
                pcall(callback,istoggled)
            end
		end

        function main:AddDropdown(text,option,callback)
			local isdropping = false
			local Dropdown = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local DropTitle = Instance.new("TextLabel")
			local DropScroll = Instance.new("ScrollingFrame")
			local UIListLayout = Instance.new("UIListLayout")
			local UIPadding = Instance.new("UIPadding")
			local DropButton = Instance.new("TextButton")
			local DropImage = Instance.new("ImageLabel")
			
			Dropdown.Name = "Dropdown"
			Dropdown.Parent = MainFramePage
			Dropdown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Dropdown.ClipsDescendants = true
			Dropdown.Size = UDim2.new(0, 335, 0, 30)
			
			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = Dropdown
			
			DropTitle.Name = "DropTitle"
			DropTitle.Parent = Dropdown
			DropTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropTitle.BackgroundTransparency = 1.000
			DropTitle.Size = UDim2.new(0, 335, 0, 30)
			DropTitle.Font = Enum.Font.GothamSemibold
			DropTitle.Text = text.. " : "
			DropTitle.TextColor3 = Color3.fromRGB(225, 225, 225)
			DropTitle.TextSize = 15.000
            DropTitle.TextXAlignment = Enum.TextXAlignment.Left

            local UIPaddingHAHA = Instance.new("UIPadding")
            UIPaddingHAHA.Parent = DropTitle
            UIPaddingHAHA.Name = "UIPaddingHAHA"
            UIPaddingHAHA.PaddingLeft = UDim.new(0,15)
			
			DropScroll.Name = "DropScroll"
			DropScroll.Parent = Dropdown
			DropScroll.Active = true
			DropScroll.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropScroll.BackgroundTransparency = 1.000
			DropScroll.BorderSizePixel = 0
			DropScroll.Position = UDim2.new(0, 0, 0, 31)
			DropScroll.Size = UDim2.new(0, 335, 0, 70)
			DropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
			DropScroll.ScrollBarThickness = 3
			
			UIListLayout.Parent = DropScroll
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0, 5)
			
			UIPadding.Parent = DropScroll
			UIPadding.PaddingLeft = UDim.new(0, 5)
			UIPadding.PaddingTop = UDim.new(0, 5)
			
			DropImage.Name = "DropImage"
			DropImage.Parent = Dropdown
			DropImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropImage.BackgroundTransparency = 1.000
			DropImage.Position = UDim2.new(0, 305, 0, 5)
			DropImage.Rotation = 180.000
			DropImage.Size = UDim2.new(0, 20, 0, 20)
			DropImage.Image = "rbxassetid://6031090990"
			
			DropButton.Name = "DropButton"
			DropButton.Parent = Dropdown
			DropButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropButton.BackgroundTransparency = 1.000
			DropButton.Size = UDim2.new(0, 335, 0, 30)
			DropButton.Font = Enum.Font.SourceSans
			DropButton.Text = ""
			DropButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			DropButton.TextSize = 14.000

			for i,v in next,option do
				local Item = Instance.new("TextButton")

				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 335, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(v)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					callback(Item.Text)
					DropTitle.Text = text.." : "..Item.Text
				end)
			end

			DropScroll.CanvasSize = UDim2.new(0,0,0,UIListLayout.AbsoluteContentSize.Y + 10)

			DropButton.MouseButton1Click:Connect(function()
				if isdropping == false then
					isdropping = true
					Dropdown:TweenSize(UDim2.new(0,335,0,100),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 0}
					):Play()
				else
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
				end
			end)

			local dropfunc = {}
			function dropfunc:Add(t)
				local Item = Instance.new("TextButton")
				Item.Name = "Item"
				Item.Parent = DropScroll
				Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Item.BackgroundTransparency = 1.000
				Item.Size = UDim2.new(0, 335, 0, 26)
				Item.Font = Enum.Font.GothamSemibold
				Item.Text = tostring(t)
				Item.TextColor3 = Color3.fromRGB(225, 225, 225)
				Item.TextSize = 13.000
				Item.TextTransparency = 0.500

				Item.MouseEnter:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0}
					):Play()
				end)

				Item.MouseLeave:Connect(function()
					TweenService:Create(
						Item,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{TextTransparency = 0.5}
					):Play()
				end)

				Item.MouseButton1Click:Connect(function()
					isdropping = false
					Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
					TweenService:Create(
						DropImage,
						TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
						{Rotation = 180}
					):Play()
					callback(Item.Text)
					DropTitle.Text = text.." : "..Item.Text
				end)
			end
			function dropfunc:Clear()
				DropTitle.Text = tostring(text).." : "
				isdropping = false
				Dropdown:TweenSize(UDim2.new(0,335,0,30),"Out","Quad",0.3,true)
				TweenService:Create(
					DropImage,
					TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
					{Rotation = 180}
				):Play()
				for i,v in next, DropScroll:GetChildren() do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
			end
			return dropfunc
		end
        function main:AddSlider(text,min,max,set,callback)
			local Slider = Instance.new("Frame")
			local slidercorner = Instance.new("UICorner")
			local sliderr = Instance.new("Frame")
			local sliderrcorner = Instance.new("UICorner")
			local SliderLabel = Instance.new("TextLabel")
			local HAHA = Instance.new("Frame")
			local AHEHE = Instance.new("TextButton")
			local bar = Instance.new("Frame")
			local bar1 = Instance.new("Frame")
			local bar1corner = Instance.new("UICorner")
			local barcorner = Instance.new("UICorner")
			local circlebar = Instance.new("Frame")
			local UICorner = Instance.new("UICorner")
			local slidervalue = Instance.new("Frame")
			local valuecorner = Instance.new("UICorner")
			local TextBox = Instance.new("TextBox")
			local UICorner_2 = Instance.new("UICorner")

			Slider.Name = "Slider"
			Slider.Parent = MainFramePage
			Slider.BackgroundColor3 = maincolor
			Slider.BackgroundTransparency = 0
			Slider.Size = UDim2.new(0, 335, 0, 51)

			slidercorner.CornerRadius = UDim.new(0, 5)
			slidercorner.Name = "slidercorner"
			slidercorner.Parent = Slider

			sliderr.Name = "sliderr"
			sliderr.Parent = Slider
			sliderr.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			sliderr.Position = UDim2.new(0, 1, 0, 1)
			sliderr.Size = UDim2.new(0, 333, 0, 49)

			sliderrcorner.CornerRadius = UDim.new(0, 5)
			sliderrcorner.Name = "sliderrcorner"
			sliderrcorner.Parent = sliderr

			SliderLabel.Name = "SliderLabel"
			SliderLabel.Parent = sliderr
			SliderLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderLabel.BackgroundTransparency = 1.000
			SliderLabel.Position = UDim2.new(0, 15, 0, 0)
			SliderLabel.Size = UDim2.new(0, 180, 0, 26)
			SliderLabel.Font = Enum.Font.GothamSemibold
			SliderLabel.Text = text
			SliderLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
			SliderLabel.TextSize = 16.000
			SliderLabel.TextTransparency = 0
			SliderLabel.TextXAlignment = Enum.TextXAlignment.Left

			HAHA.Name = "HAHA"
			HAHA.Parent = sliderr
			HAHA.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			HAHA.BackgroundTransparency = 1.000
			HAHA.Size = UDim2.new(0, 333, 0, 29)

			AHEHE.Name = "AHEHE"
			AHEHE.Parent = sliderr
			AHEHE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			AHEHE.BackgroundTransparency = 1.000
			AHEHE.Position = UDim2.new(0, 10, 0, 35)
			AHEHE.Size = UDim2.new(0, 313, 0, 5)
			AHEHE.Font = Enum.Font.SourceSans
			AHEHE.Text = ""
			AHEHE.TextColor3 = Color3.fromRGB(0, 0, 0)
			AHEHE.TextSize = 14.000

			bar.Name = "bar"
			bar.Parent = AHEHE
			bar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			bar.Size = UDim2.new(0, 313, 0, 5)

			bar1.Name = "bar1"
			bar1.Parent = bar
			bar1.BackgroundColor3 = maincolor
			bar1.BackgroundTransparency = 0
			bar1.Size = UDim2.new(set/max, 0, 0, 5)

			bar1corner.CornerRadius = UDim.new(0, 5)
			bar1corner.Name = "bar1corner"
			bar1corner.Parent = bar1

			barcorner.CornerRadius = UDim.new(0, 5)
			barcorner.Name = "barcorner"
			barcorner.Parent = bar

			circlebar.Name = "circlebar"
			circlebar.Parent = bar1
			circlebar.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
			circlebar.Position = UDim2.new(1, -2, 0, -3)
			circlebar.Size = UDim2.new(0, 10, 0, 10)

			UICorner.CornerRadius = UDim.new(0, 100)
			UICorner.Parent = circlebar

			slidervalue.Name = "slidervalue"
			slidervalue.Parent = sliderr
			slidervalue.BackgroundColor3 = maincolor
			slidervalue.BackgroundTransparency = 0
			slidervalue.Position = UDim2.new(0, 265, 0, 5)
			slidervalue.Size = UDim2.new(0, 65, 0, 18)

			valuecorner.CornerRadius = UDim.new(0, 5)
			valuecorner.Name = "valuecorner"
			valuecorner.Parent = slidervalue

			TextBox.Parent = slidervalue
			TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			TextBox.Position = UDim2.new(0, 1, 0, 1)
			TextBox.Size = UDim2.new(0, 63, 0, 16)
			TextBox.Font = Enum.Font.GothamSemibold
			TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
			TextBox.TextSize = 9.000
			TextBox.Text = set
			TextBox.TextTransparency = 0

			UICorner_2.CornerRadius = UDim.new(0, 5)
			UICorner_2.Parent = TextBox

			local mouse = game.Players.LocalPlayer:GetMouse()
			local uis = game:GetService("UserInputService")

			if Value == nil then
				Value = set
				pcall(function()
					callback(Value)
				end)
			end
			
			AHEHE.MouseButton1Down:Connect(function()
				Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min)) or 0
				pcall(function()
					callback(Value)
				end)
				bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 315), 0, 5)
				circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 305), 0, -3)
				moveconnection = mouse.Move:Connect(function()
					TextBox.Text = Value
					Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min))
					pcall(function()
						callback(Value)
					end)
					bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 315), 0, 5)
					circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 305), 0, -3)
				end)
				releaseconnection = uis.InputEnded:Connect(function(Mouse)
					if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
						Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min))
						pcall(function()
							callback(Value)
						end)
						bar1.Size = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X, 0, 315), 0, 5)
						circlebar.Position = UDim2.new(0, math.clamp(mouse.X - bar1.AbsolutePosition.X - 2, 0, 305), 0, -3)
						moveconnection:Disconnect()
						releaseconnection:Disconnect()
					end
				end)
			end)
			releaseconnection = uis.InputEnded:Connect(function(Mouse)
				if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
					Value = math.floor((((tonumber(max) - tonumber(min)) / 315) * bar1.AbsoluteSize.X) + tonumber(min))
					TextBox.Text = Value
				end
			end)

			TextBox.FocusLost:Connect(function()
				if tonumber(TextBox.Text) > max then
					TextBox.Text  = max
				end
				bar1.Size = UDim2.new((TextBox.Text or 0) / max, 0, 0, 5)
				circlebar.Position = UDim2.new(1, -2, 0, -3)
				TextBox.Text = tostring(TextBox.Text and math.floor( (TextBox.Text / max) * (max - min) + min) )
				pcall(callback, TextBox.Text)
			end)
		end

        function main:AddTextbox(text,disappear,callback)
			local Textbox = Instance.new("Frame")
			local TextboxCorner = Instance.new("UICorner")
			local Textboxx = Instance.new("Frame")
			local TextboxxCorner = Instance.new("UICorner")
			local TextboxLabel = Instance.new("TextLabel")
			local txtbtn = Instance.new("TextButton")
			local RealTextbox = Instance.new("TextBox")
			local UICorner = Instance.new("UICorner")

			Textbox.Name = "Textbox"
			Textbox.Parent = MainFramePage
			Textbox.BackgroundColor3 = maincolor
			Textbox.BackgroundTransparency = 0
			Textbox.Size = UDim2.new(0, 335, 0, 31)

			TextboxCorner.CornerRadius = UDim.new(0, 5)
			TextboxCorner.Name = "TextboxCorner"
			TextboxCorner.Parent = Textbox

			Textboxx.Name = "Textboxx"
			Textboxx.Parent = Textbox
			Textboxx.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Textboxx.Position = UDim2.new(0, 1, 0, 1)
			Textboxx.Size = UDim2.new(0, 333, 0, 29)

			TextboxxCorner.CornerRadius = UDim.new(0, 5)
			TextboxxCorner.Name = "TextboxxCorner"
			TextboxxCorner.Parent = Textboxx

			TextboxLabel.Name = "TextboxLabel"
			TextboxLabel.Parent = Textbox
			TextboxLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TextboxLabel.BackgroundTransparency = 1.000
			TextboxLabel.Position = UDim2.new(0, 15, 0, 0)
			TextboxLabel.Text = text
			TextboxLabel.Size = UDim2.new(0, 145, 0, 31)
			TextboxLabel.Font = Enum.Font.GothamSemibold
			TextboxLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
			TextboxLabel.TextSize = 16.000
			TextboxLabel.TextTransparency = 0
			TextboxLabel.TextXAlignment = Enum.TextXAlignment.Left

			txtbtn.Name = "txtbtn"
			txtbtn.Parent = Textbox
			txtbtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			txtbtn.BackgroundTransparency = 1.000
			txtbtn.Position = UDim2.new(0, 1, 0, 1)
			txtbtn.Size = UDim2.new(0, 333, 0, 29)
			txtbtn.Font = Enum.Font.SourceSans
			txtbtn.Text = ""
			txtbtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			txtbtn.TextSize = 14.000

			RealTextbox.Name = "RealTextbox"
			RealTextbox.Parent = Textbox
            RealTextbox.ClipsDescendants = true
			RealTextbox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
			RealTextbox.BackgroundTransparency = 0
			RealTextbox.Position = UDim2.new(0, 255, 0, 6)
			RealTextbox.Size = UDim2.new(0, 75, 0, 20)
			RealTextbox.Font = Enum.Font.GothamSemibold
			RealTextbox.Text = ""
			RealTextbox.TextColor3 = Color3.fromRGB(225, 225, 225)
			RealTextbox.TextSize = 11.000
			RealTextbox.TextTransparency = 0

			RealTextbox.FocusLost:Connect(function()
				callback(RealTextbox.Text)
				if disappear then
					RealTextbox.Text = ""
				end
			end)

			UICorner.CornerRadius = UDim.new(0, 5)
			UICorner.Parent = RealTextbox
		end
		function main:AddLabel(text)
			local Label = Instance.new("TextLabel")
			local PaddingLabel = Instance.new("UIPadding")
			local labell = {}
	
			Label.Name = "Label"
			Label.Parent = MainFramePage
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.Size = UDim2.new(0, 335, 0, 20)
			Label.Font = Enum.Font.GothamSemibold
			Label.TextColor3 = Color3.fromRGB(225, 225, 225)
			Label.TextSize = 16.000
			Label.Text = text
			Label.TextXAlignment = Enum.TextXAlignment.Left

			PaddingLabel.PaddingLeft = UDim.new(0,15)
			PaddingLabel.Parent = Label
			PaddingLabel.Name = "PaddingLabel"
	
			function labell:Set(newtext)
				Label.Text = newtext
			end

			return labell
		end
		function main:AddSeperator(text)
			local Seperator = Instance.new("Frame")
			local Sep1 = Instance.new("Frame")
			local Sep2 = Instance.new("TextLabel")
			local Sep3 = Instance.new("Frame")
			
			Seperator.Name = "Seperator"
			Seperator.Parent = MainFramePage
			Seperator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Seperator.BackgroundTransparency = 1.000
			Seperator.Size = UDim2.new(0, 335, 0, 20)
			
			Sep1.Name = "Sep1"
			Sep1.Parent = Seperator
			Sep1.BackgroundColor3 = maincolor
			Sep1.BorderSizePixel = 0
			Sep1.Position = UDim2.new(0, 0, 0, 10)
			Sep1.Size = UDim2.new(0, 80, 0, 1)
			
			Sep2.Name = "Sep2"
			Sep2.Parent = Seperator
			Sep2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Sep2.BackgroundTransparency = 1.000
			Sep2.Position = UDim2.new(0, 120, 0, 0)
			Sep2.Size = UDim2.new(0, 100, 0, 20)
			Sep2.Font = Enum.Font.GothamSemibold
			Sep2.Text = text
			Sep2.TextColor3 = Color3.fromRGB(255, 255, 255)
			Sep2.TextSize = 14.000
			
			Sep3.Name = "Sep3"
			Sep3.Parent = Seperator
			Sep3.BackgroundColor3 = maincolor
			Sep3.BorderSizePixel = 0
			Sep3.Position = UDim2.new(0, 255, 0, 10)
			Sep3.Size = UDim2.new(0, 80, 0, 1)
		end

		function main:AddLine()
			local Linee = Instance.new("Frame")
			local Line = Instance.new("Frame")
			
			Linee.Name = "Linee"
			Linee.Parent = MainFramePage
			Linee.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Linee.BackgroundTransparency = 1.000
			Linee.Position = UDim2.new(0, 0, 0.119999997, 0)
			Linee.Size = UDim2.new(0, 335, 0, 20)
			
			Line.Name = "Line"
			Line.Parent = Linee
			Line.BackgroundColor3 = maincolor
			Line.BorderSizePixel = 0
			Line.Position = UDim2.new(0, 0, 0, 10)
			Line.Size = UDim2.new(0, 335, 0, 1)
		end
        return main
    end
    return uitab
end

--Function

function ToTarget1(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 250 then
        Speed = 700
    elseif Distance < 500 then
        Speed = 500
    elseif Distance < 1000 then
        Speed = 450
    elseif Distance >= 1000 then
        Speed = 300
    end
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
end

function ToTarget2(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 250 then
        Speed = 700
    elseif Distance < 500 then
        Speed = 500
    elseif Distance < 1000 then
        Speed = 450
    elseif Distance >= 1000 then
        Speed = 300
    end
    local Tween = game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
	_G.Part = true
	wait(Distance/Speed)
	_G.Part = false
end

function CheckLv()
	local Lv = game:GetService("Players").LocalPlayer.Data.Level.Value
	if Lv == 1 or Lv <= 9 then
		Ms = "Bandit [Lv. 5]"
		NameMon = "Bandit"
		QuestName = "BanditQuest1"
		QuestLevel = 1
		QuestPos = CFrame.new(1060.29016, 16.3556061, 1549.03186, -0.972990334, -4.48481501e-08, 0.230845898, -4.51752733e-08, 1, 3.86858368e-09, -0.230845898, -6.66443212e-09, -0.972990334)
		MonPos = CFrame.new(1199.0957, 16.6963673, 1617.98853, -0.997941971, -3.4484497e-08, -0.0641237721, -3.12641006e-08, 1, -5.12249763e-08, 0.0641237721, -4.91147816e-08, -0.997941971)
	elseif Lv == 10 or Lv <= 14 then
		Ms = "Monkey [Lv. 14]"
		NameMon = "Monkey"
		QuestName = "JungleQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(-1599.86877, 36.8521385, 152.94693, -0.0401183814, -2.3783409e-08, -0.99919492, 6.88362221e-08, 1, -2.65663953e-08, 0.99919492, -6.98466067e-08, -0.0401183814)
		MonPos = CFrame.new(-1611.37549, 15.8521042, 73.2128143, -0.905018926, 3.26734129e-09, -0.425371259, -2.00530437e-08, 1, 5.03459603e-08, 0.425371259, 5.40940377e-08, -0.905018926)
	elseif Lv == 15 or Lv <= 29 then
		Ms = "Gorilla [Lv. 20]"
		NameMon = "Gorilla"
		QuestName = "JungleQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(-1599.86877, 36.8521385, 152.94693, -0.0401183814, -2.3783409e-08, -0.99919492, 6.88362221e-08, 1, -2.65663953e-08, 0.99919492, -6.98466067e-08, -0.0401183814)
		MonPos = CFrame.new(-1230.89185, 6.27937412, -506.495331, 0.899415851, -6.46419451e-08, 0.437093973, 8.4829388e-08, 1, -2.66646332e-08, -0.437093973, 6.10610087e-08, 0.899415851)
	elseif Lv == 30 or Lv <= 39 then
		Ms = "Pirate [Lv. 35]"
		NameMon = "Pirate"
		QuestName = "BuggyQuest1"
		QuestLevel = 1
		QuestPos = CFrame.new(-1140.75586, 4.75206137, 3830.00928, -0.978316069, -4.24352677e-08, 0.207117409, -2.72875607e-08, 1, 7.59926877e-08, -0.207117409, 6.86931401e-08, -0.978316069)
		MonPos = CFrame.new(-1100.77087, 13.7520561, 3975.49878, -0.996037304, 6.88737813e-08, -0.0889365152, 6.89962647e-08, 1, 1.69699454e-09, 0.0889365152, -4.44601778e-09, -0.996037304)
	elseif Lv == 40 or Lv <= 59 then
		Ms = "Brute [Lv. 45]"
		NameMon = "Brute"
		QuestName = "BuggyQuest1"
		QuestLevel = 2
		QuestPos = CFrame.new(-1140.75586, 4.75206137, 3830.00928, -0.978316069, -4.24352677e-08, 0.207117409, -2.72875607e-08, 1, 7.59926877e-08, -0.207117409, 6.86931401e-08, -0.978316069)
		MonPos = CFrame.new(-1152.54651, 14.809885, 4361.49512, -0.999999642, -5.70388572e-08, 0.00086655101, -5.70611682e-08, 1, -2.57222794e-08, -0.00086655101, -2.57717154e-08, -0.999999642)
	elseif Lv == 60 or Lv <= 74 then
		Ms = "Desert Bandit [Lv. 60]"
		NameMon = "Desert Bandit"
		QuestName = "DesertQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(894.835266, 6.43847418, 4390.37305, -0.856274426, -9.69668434e-09, 0.516521156, -1.13663443e-08, 1, -6.97467362e-11, -0.516521156, -5.9306795e-09, -0.856274426)
		MonPos = CFrame.new(931.08844, 6.4504776, 4481.84424, 0.183763906, -9.80146009e-09, -0.982970417, -1.71072347e-08, 1, -1.3169422e-08, 0.982970417, 1.9235971e-08, 0.183763906)
	elseif Lv == 75 or Lv <= 89 then
		Ms = "Desert Officer [Lv. 70]"
		NameMon = "Desert Officer"
		QuestName = "DesertQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(894.835266, 6.43847418, 4390.37305, -0.856274426, -9.69668434e-09, 0.516521156, -1.13663443e-08, 1, -6.97467362e-11, -0.516521156, -5.9306795e-09, -0.856274426)
		MonPos = CFrame.new(1628.30664, 1.61096632, 4367.17871, -0.692698359, 3.7529059e-08, -0.721227407, 2.47063277e-08, 1, 2.83059514e-08, 0.721227407, 1.78860637e-09, -0.692698359)
	elseif Lv == 90 or Lv <= 99 then
		Ms = "Snow Bandit [Lv. 90]"
		NameMon = "Snow Bandit"
		QuestName = "SnowQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(1388.32629, 87.2727966, -1298.38855, 0.421851248, 1.67225185e-08, -0.906665027, 3.12471187e-08, 1, 3.29825838e-08, 0.906665027, -4.22444124e-08, 0.421851248)
		MonPos = CFrame.new(1346.88062, 87.2727737, -1430.40942, 0.919056177, 1.28202506e-08, 0.394126534, 1.69656111e-08, 1, -7.20900459e-08, -0.394126534, 7.29413969e-08, 0.919056177)
	elseif Lv == 100 or Lv <= 119 then
		Ms = "Snowman [Lv. 100]"
		NameMon = "Snowman"
		QuestName = "SnowQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(1388.32629, 87.2727966, -1298.38855, 0.421851248, 1.67225185e-08, -0.906665027, 3.12471187e-08, 1, 3.29825838e-08, 0.906665027, -4.22444124e-08, 0.421851248)
		MonPos = CFrame.new(1172.86572, 105.773315, -1484.91821, 0.999249279, 3.47523397e-08, 0.0387419201, -3.34662644e-08, 1, -3.38445005e-08, -0.0387419201, 3.25225429e-08, 0.999249279)
	elseif Lv == 120 or Lv <= 149 then
		Ms = "Chief Petty Officer [Lv. 120]"
		NameMon = "Chief Petty Officer"
		QuestName = "MarineQuest2"
		QuestLevel = 1
		QuestPos = CFrame.new(-5037.62939, 28.6520443, 4324.82422, 2.6140362e-05, -1.46247636e-08, 1, -2.43722393e-08, 1, 1.46254004e-08, -1, -2.4372623e-08, 2.6140362e-05)
		MonPos = CFrame.new(-4901.05273, 20.6520443, 4007.98975, 0.935388923, -9.69922311e-08, 0.353620708, 8.39348715e-08, 1, 5.22607557e-08, -0.353620708, -1.92030214e-08, 0.935388923)
	elseif Lv == 150 or Lv <= 174 then
		Ms = "Sky Bandit [Lv. 150]"
		NameMon = "Sky Bandit"
		QuestName = "SkyQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(-4840.49902, 717.669373, -2620.63623, -0.843173027, -5.55945014e-08, -0.5376423, -4.37175331e-11, 1, -1.03335694e-07, 0.5376423, -8.71063648e-08, -0.843173027)
		MonPos = CFrame.new(-5008.59473, 278.067017, -2848.06982, 0.41242978, -1.02003046e-08, 0.910989404, -8.39685939e-08, 1, 4.92118275e-08, -0.910989404, -9.67909202e-08, 0.41242978)
	elseif Lv == 175 or Lv <= 189 then
		Ms = "Dark Master [Lv. 175]"
		NameMon = "Dark Master"
		QuestName = "SkyQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(-4840.49902, 717.669373, -2620.63623, -0.843173027, -5.55945014e-08, -0.5376423, -4.37175331e-11, 1, -1.03335694e-07, 0.5376423, -8.71063648e-08, -0.843173027)
		MonPos = CFrame.new(-5261.9917, 388.651947, -2280.15161, 0.398467302, 2.56651411e-08, 0.917182565, 3.83671299e-08, 1, -4.46510775e-08, -0.917182565, 5.29816582e-08, 0.398467302)
	elseif Lv == 190 or Lv <= 209 then
		Ms = "Prisoner [Lv. 190]"
		NameMon = "Prisoner"
		QuestName = "PrisonerQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(5307.86523, 1.65514696, 474.632904, -0.102480404, -1.06170495e-08, -0.994735003, 4.35499992e-08, 1, -1.51598876e-08, 0.994735003, -4.48742981e-08, -0.102480404)
		MonPos = CFrame.new(5119.0542, 0.523922741, 464.480469, 0.636900544, 4.51006272e-08, 0.770945966, -4.44949926e-08, 1, -2.17417853e-08, -0.770945966, -2.04558805e-08, 0.636900544)
	elseif Lv == 210 or Lv <= 219 then
		Ms = "Dangerous Prisoner [Lv. 210]"
		NameMon = "Dangerous Prisoner"
		QuestName = "PrisonerQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(5307.86523, 1.65514696, 474.632904, -0.102480404, -1.06170495e-08, -0.994735003, 4.35499992e-08, 1, -1.51598876e-08, 0.994735003, -4.48742981e-08, -0.102480404)
		MonPos = CFrame.new(5589.75684, 1.65149343, 764.281677, 0.953318715, -1.8591404e-09, -0.301965952, 1.75048296e-08, 1, 4.91066636e-08, 0.301965952, -5.21001624e-08, 0.953318715)
	elseif Lv == 250 or Lv <= 274 then
		Ms = "Toga Warrior [Lv. 250]"
		NameMon = "Toga Warrior"
		QuestName = "ColosseumQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(-1578.15601, 7.38934898, -2985.81152, 0.485308826, -8.00141606e-08, 0.874342799, -1.44736703e-08, 1, 9.95471794e-08, -0.874342799, -6.09660731e-08, 0.485308826)
		MonPos = CFrame.new(-1918.36255, 7.28908348, -2784.85913, 0.896581054, 1.85238527e-08, 0.442879677, -1.85511517e-08, 1, -4.27032898e-09, -0.442879677, -4.38723191e-09, 0.896581054)
	elseif Lv == 275 or Lv <= 299 then
		Ms = "Gladiator [Lv. 275]"
		NameMon = "Gladiator"
		QuestName = "ColosseumQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(-1578.15601, 7.38934898, -2985.81152, 0.485308826, -8.00141606e-08, 0.874342799, -1.44736703e-08, 1, 9.95471794e-08, -0.874342799, -6.09660731e-08, 0.485308826)
		MonPos = CFrame.new(-1278.80054, 7.44255638, -3275.71289, -0.437109798, -8.05278066e-09, 0.899408162, -1.55208859e-08, 1, 1.41031498e-09, -0.899408162, -1.33431497e-08, -0.437109798)
	elseif Lv == 300 or Lv <= 324 then
		Ms = "Military Soldier [Lv. 300]"
		NameMon = "Military Soldier"
		QuestName = "MagmaQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(-5314.89795, 12.2367077, 8516.79688, 0.516234636, 1.59358748e-08, -0.85644716, -8.71449579e-09, 1, 1.33541809e-08, 0.85644716, 5.69614467e-10, 0.516234636)
		MonPos = CFrame.new(-5459.36279, 8.98336792, 8429.72754, 0.849475741, -3.28582885e-08, 0.527627707, -2.07252739e-08, 1, 9.56430171e-08, -0.527627707, -9.21816508e-08, 0.849475741)
	elseif Lv == 325 or Lv <= 374 then
		Ms = "Military Spy [Lv. 325]"
		NameMon = "Military Spy"
		QuestName = "MagmaQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(-5314.89795, 12.2367077, 8516.79688, 0.516234636, 1.59358748e-08, -0.85644716, -8.71449579e-09, 1, 1.33541809e-08, 0.85644716, 5.69614467e-10, 0.516234636)
		MonPos = CFrame.new(-5843.85693, 77.2306442, 8820.91309, -0.00215803669, -5.49462236e-08, 0.999997675, 3.99615629e-08, 1, 5.50325936e-08, -0.999997675, 4.00802307e-08, -0.00215803669)
	elseif Lv == 375 or Lv <= 399 then
		Ms = "Fishman Warrior [Lv. 375]"
		NameMon = "Fishman Warrior"
		QuestName = "FishmanQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(61121.5547, 18.4716454, 1566.37036, 0.922316909, 1.45940433e-08, 0.386434436, -3.02368086e-09, 1, -3.05491703e-08, -0.386434436, 2.70075624e-08, 0.922316909)
		MonPos = CFrame.new(60891.5586, 18.48283, 1587.48535, -0.557101727, 3.34541781e-08, 0.830444276, -7.0102617e-09, 1, -4.49874946e-08, -0.830444276, -3.08842409e-08, -0.557101727)
	elseif Lv == 400 or Lv <= 449 then
		Ms = "Fishman Commando [Lv. 400]"
		NameMon = "Fishman Commando"
		QuestName = "FishmanQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(61121.5547, 18.4716454, 1566.37036, 0.922316909, 1.45940433e-08, 0.386434436, -3.02368086e-09, 1, -3.05491703e-08, -0.386434436, 2.70075624e-08, 0.922316909)
		MonPos = CFrame.new(61916.3789, 18.48283, 1461.89832, -0.998045862, -3.06450332e-08, 0.0624853484, -3.08483976e-08, 1, -2.28985519e-09, -0.0624853484, -4.21295354e-09, -0.998045862)
	elseif Lv == 450 or Lv <= 474 then
		Ms = "God's Guard [Lv. 450]"
		NameMon = "God's Guard"
		QuestName = "SkyExp1Quest"
		QuestLevel = 1
		QuestPos = CFrame.new(-4721.69629, 845.92688, -1951.23413, -0.992632329, 4.70104915e-08, 0.121165335, 5.00912236e-08, 1, 2.23799574e-08, -0.121165335, 2.82843899e-08, -0.992632329)
		MonPos = CFrame.new(-4711.77979, 845.276978, -1919.3158, 0.990525007, -1.883385e-08, 0.137332603, 2.38186892e-08, 1, -3.46542457e-08, -0.137332603, 3.75969762e-08, 0.990525007)
	elseif Lv == 475 or Lv <= 524 then
		Ms = "Shanda [Lv. 475]"
		NameMon = "Shanda"
		QuestName = "SkyExp1Quest"
		QuestLevel = 2
		QuestPos = CFrame.new(-7860.61572, 5545.4917, -380.37381, 0.41818288, 9.70686855e-08, -0.908362865, -5.99544805e-08, 1, 7.92598982e-08, 0.908362865, 2.13152909e-08, 0.41818288)
		MonPos = CFrame.new(-7633.15918, 5545.4917, -519.972839, 0.15734823, -1.08362186e-09, -0.987543166, -1.83448119e-08, 1, -4.02022504e-09, 0.987543166, 1.87488691e-08, 0.15734823)
	elseif Lv == 525 or Lv <= 549 then
		Ms = "Royal Squad [Lv. 525]"
		NameMon = "Royal Squad"
		QuestName = "SkyExp2Quest"
		QuestLevel = 1
		QuestPos = CFrame.new(-7904.73438, 5635.9624, -1412.08142, 0.00413449481, -2.92529716e-08, 0.999991477, -9.00092445e-08, 1, 2.9625367e-08, -0.999991477, -9.01309605e-08, 0.00413449481)
		MonPos = CFrame.new(-7641.88818, 5606.87695, -1472.5387, 0.573091447, -9.76830989e-08, -0.819491446, 4.70965773e-08, 1, -8.62638103e-08, 0.819491446, 1.08418083e-08, 0.573091447)
	elseif Lv == 550 or Lv <= 624 then
		Ms = "Royal Soldier [Lv. 550]"
		NameMon = "Royal Soldier"
		QuestName = "SkyExp2Quest"
		QuestLevel = 2
		QuestPos = CFrame.new(-7904.73438, 5635.9624, -1412.08142, 0.00413449481, -2.92529716e-08, 0.999991477, -9.00092445e-08, 1, 2.9625367e-08, -0.999991477, -9.01309605e-08, 0.00413449481)
		MonPos = CFrame.new(-7863.77832, 5606.87793, -1838.03601, 0.312302649, 3.96729618e-08, -0.949982643, -2.28553141e-08, 1, 3.42481883e-08, 0.949982643, 1.10163514e-08, 0.312302649)
	elseif Lv == 625 or Lv <= 649 then
		Ms = "Galley Pirate [Lv. 625]"
		NameMon = "Galley Pirate"
		QuestName = "FountainQuest"
		QuestLevel = 1
		QuestPos = CFrame.new(5257.96484, 38.5011406, 4049.2373, -0.227916867, -7.86337822e-08, -0.973680615, 2.18198721e-08, 1, -8.58668585e-08, 0.973680615, -4.08160901e-08, -0.227916867)
		MonPos = CFrame.new(5490.73779, 38.5386391, 3984.00708, -0.891013086, -9.39245126e-09, -0.453977615, -1.13007648e-08, 1, 1.49055235e-09, 0.453977615, 6.4583956e-09, -0.891013086)
	elseif Lv >= 650 then
		Ms = "Galley Captain [Lv. 650]"
		NameMon = "Galley Captain"
		QuestName = "FountainQuest"
		QuestLevel = 2
		QuestPos = CFrame.new(5257.96484, 38.5011406, 4049.2373, -0.227916867, -7.86337822e-08, -0.973680615, 2.18198721e-08, 1, -8.58668585e-08, 0.973680615, -4.08160901e-08, -0.227916867)
		MonPos = CFrame.new(5653.11133, 38.5011406, 4924.39111, -0.999997973, 6.95528755e-08, 0.00200896896, 6.97511666e-08, 1, 9.86329169e-08, -0.00200896896, 9.87728441e-08, -0.999997973)
	end
end

function CheckBoss()
	if SelectedBoss == "The Gorilla King [Lv. 25] [Boss]" then
		Boss = "The Gorilla King [Lv. 25] [Boss]"
		NameBoss = "The Gorilla King"
		BossQuestName = "JungleQuest"
		BossQuestLevel = 3
		BossQuestPos = CFrame.new(-1599.86877, 36.8521385, 152.94693, -0.0401183814, -2.3783409e-08, -0.99919492, 6.88362221e-08, 1, -2.65663953e-08, 0.99919492, -6.98466067e-08, -0.0401183814)
		BossPos = CFrame.new(-1047.5755615234375, 12.647231101989746, -437.074951171875)
	end
end

spawn(function()
	while wait() do
		if _G.AutoFarmLevel then
			CheckLv()
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				LevelBring = false
				ToTarget2(QuestPos)
				local args = {
					[1] = "StartQuest",
					[2] = QuestName,
					[3] = QuestLevel
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
				pcall(function()
					CheckLv()
					if game:GetService("Workspace").Enemies:FindFirstChild(Ms) then
						for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
							if v.Name == Ms and v:FindFirstChild("Humanoid") then
								if v.Humanoid.Health > 0 then
									if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameMon) then
										repeat wait()
											_G.Part = true
											EquipTool(SelectTool)
											AutoHaki()
											ToTarget1(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											if v.Humanoid:FindFirstChild("Animator") then
												v.Humanoid.Animator:Destroy()
											end
											v.Humanoid:ChangeState(11)
											v.Humanoid:ChangeState(14)
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(5,5,5)
                                            game:GetService("VirtualUser"):CaptureController()
			                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
											PosMon = v.HumanoidRootPart.CFrame
											LevelBring = true
										until _G.AutoFarmLevel == false or v.Humanoid.Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false or not game:GetService("Workspace").Enemies:FindFirstChild(Ms)
										_G.Part = false
									else
										LevelBring = false
										local args = {
											[1] = "AbandonQuest"
										}

										game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
									end
								end
							end
						end
					else
						LevelBring = false
						ToTarget2(MonPos)
					end
				end)
			end
		end
	end
end)

spawn(function()
	while wait() do
		if _G.AutoFarmLevelFast then
			CheckLv()
			if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
				LevelBring = false
				ToTarget2(QuestPos)
				local args = {
					[1] = "StartQuest",
					[2] = QuestName,
					[3] = QuestLevel
				}
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
			elseif kuy then
				
			end
		end
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			CheckLv()
			if _G.AutoFarmLevel and _G.BringMob and LevelBring then
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
						if v.Name == Ms and (v.HumanoidRootPart.Position - PosMon.Position).magnitude <= 350 then
							if v.Humanoid:FindFirstChild("Animator") then
								v.Humanoid.Animator:Destroy()
							end
							v.Humanoid:ChangeState(11)
							v.Humanoid:ChangeState(14)
							v.Humanoid.JumpPower = 0
							v.Humanoid.WalkSpeed = 0
							v.HumanoidRootPart.CanCollide = false
							v.HumanoidRootPart.Size = Vector3.new(5,5,5)
							v.HumanoidRootPart.CFrame = PosMon
							sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
						end
					end
				end
			end
		end)
	end
end)

spawn(function()
	while wait() do
		pcall(function()
			if _G.AutoFarmBoss then
				CheckBoss()
				if _G.BossQuest and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
					ToTarget2(BossQuestPos)
					local args = {
						[1] = "StartQuest",
						[2] = BossQuestName,
						[3] = BossQuestLevel
					}
					game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
				elseif _G.BossQuest and game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
					pcall(function()
						CheckBoss()
						if game:GetService("Workspace").Enemies:FindFirstChild(Boss) then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == Boss and v:FindFirstChild("Humanoid") then
									if v.Humanoid.Health > 0 then
										if string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, NameBoss) then
											repeat wait()
												_G.Part = true
												EquipTool(SelectTool)
												AutoHaki()
												ToTarget1(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
												if v.Humanoid:FindFirstChild("Animator") then
													v.Humanoid.Animator:Destroy()
												end
												v.Humanoid.JumpPower = 0
												v.Humanoid.WalkSpeed = 0
												v.HumanoidRootPart.CanCollide = false
												v.HumanoidRootPart.Size = Vector3.new(5,5,5)
												v.HumanoidRootPart.CFrame = PosMon
												sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
												game:GetService("VirtualUser"):CaptureController()
			                                	game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
											until _G.AutoFarmBoss == false or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(Boss)
											_G.Part = false
										else
											local args = {
												[1] = "AbandonQuest"
											}
											game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
										end
									end
								end
							end
						else
							ToTarget2(BossPos)
							if not game:GetService("Workspace").Enemies:FindFirstChild(Boss) then
								_G.AutoFarmBoss = false
								_G.Part = false
							end
						end
					end)
				else
					pcall(function()
						CheckBoss()
						if game:GetService("Workspace").Enemies:FindFirstChild(Boss) then
							for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
								if v.Name == Boss and v:FindFirstChild("Humanoid") then
									if v.Humanoid.Health > 0 then
										repeat wait()
											_G.Part = true
											EquipTool(SelectTool)
											AutoHaki()
											ToTarget1(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
											if v.Humanoid:FindFirstChild("Animator") then
												v.Humanoid.Animator:Destroy()
											end
											v.Humanoid.JumpPower = 0
											v.Humanoid.WalkSpeed = 0
											v.HumanoidRootPart.CanCollide = false
											v.HumanoidRootPart.Size = Vector3.new(5,5,5)
											v.HumanoidRootPart.CFrame = PosMon
											sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
											game:GetService("VirtualUser"):CaptureController()
			                                game:GetService("VirtualUser"):Button1Down(Vector2.new(1280, 670),workspace.CurrentCamera.CFrame)
										until _G.AutoFarmBoss == false or v.Humanoid.Health <= 0 or not game:GetService("Workspace").Enemies:FindFirstChild(Boss)
										_G.Part = false
									end
								end
							end
						else
							ToTarget2(BossPos)
							if not game:GetService("Workspace").Enemies:FindFirstChild(Boss) then
								_G.AutoFarmBoss = false
								_G.Part = false
							end
						end
					end)
				end
			end
		end)
	end
end)

spawn(function()
	while task.wait(0.1) do
		if _G.Fast_Attack then
			pcall(function()
				local plr = game.Players.LocalPlayer

				local CbFw = debug.getupvalues(require(plr.PlayerScripts.CombatFramework))
				local CbFw2 = CbFw[2]
				
				function GetCurrentBlade() 
					local p13 = CbFw2.activeController
					local ret = p13.blades[1]
					if not ret then return end
					while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
					return ret
				end
				function AttackNoCD() 
					local AC = CbFw2.activeController
					for i = 1, 1 do 
						local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
							plr.Character,
							{plr.Character.HumanoidRootPart},
							60
						)
						local cac = {}
						local hash = {}
						for k, v in pairs(bladehit) do
							if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
								table.insert(cac, v.Parent.HumanoidRootPart)
								hash[v.Parent] = true
							end
						end
						bladehit = cac
						if #bladehit > 0 then
							local u8 = debug.getupvalue(AC.attack, 5)
							local u9 = debug.getupvalue(AC.attack, 6)
							local u7 = debug.getupvalue(AC.attack, 4)
							local u10 = debug.getupvalue(AC.attack, 7)
							local u12 = (u8 * 798405 + u7 * 727595) % u9
							local u13 = u7 * 798405
							(function()
								u12 = (u12 * u9 + u13) % 1099511627776
								u8 = math.floor(u12 / u9)
								u7 = u12 - u8 * u9
							end)()
							u10 = u10 + 1
							debug.setupvalue(AC.attack, 5, u8)
							debug.setupvalue(AC.attack, 6, u9)
							debug.setupvalue(AC.attack, 4, u7)
							debug.setupvalue(AC.attack, 7, u10)
							pcall(function()
								for k, v in pairs(AC.animator.anims.basic) do
									v:Play()
								end                  
							end)
							if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
								game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
								game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
								game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
							end
						end
					end
				end
				function AttackNoCD2() 
					local AC = CbFw2.activeController
					for i = 1, 1 do 
						local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(
							plr.Character,
							{plr.Character.HumanoidRootPart},
							60
						)
						local cac = {}
						local hash = {}
						for k, v in pairs(bladehit) do
							if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
								table.insert(cac, v.Parent.HumanoidRootPart)
								hash[v.Parent] = true
							end
						end
						bladehit = cac
						if #bladehit > 0 then
							local u8 = debug.getupvalue(AC.attack, 5)
							local u9 = debug.getupvalue(AC.attack, 6)
							local u7 = debug.getupvalue(AC.attack, 4)
							local u10 = debug.getupvalue(AC.attack, 7)
							local u12 = (u8 * 798405 + u7 * 727595) % u9
							local u13 = u7 * 798405
							(function()
								u12 = (u12 * u9 + u13) % 1099511627776
								u8 = math.floor(u12 / u9)
								u7 = u12 - u8 * u9
							end)()
							u10 = u10 + 1
							debug.setupvalue(AC.attack, 5, u8)
							debug.setupvalue(AC.attack, 6, u9)
							debug.setupvalue(AC.attack, 4, u7)
							debug.setupvalue(AC.attack, 7, u10)
							pcall(function()
								for k, v in pairs(AC.animator.anims.basic) do
									v:Play()
								end                  
							end)
							if plr.Character:FindFirstChildOfClass("Tool") and AC.blades and AC.blades[1] then 
								game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
								game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(u12 / 1099511627776 * 16777215), u10)
								game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "") 
							end
						end
					end
				end
				spawn(function()
					while wait(.5) do
						pcall(function()
							if _G.Fast_Attack then
								repeat wait(0.3)
									AttackNoCD()
									AttackNoCD2()
								until not _G.Fast_Attack
							end
						end)
					end
				end)
			end)
		end
	end
end)

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.Part then
            if not game:GetService("Workspace"):FindFirstChild("LOL") then
                local LOL = Instance.new("Part")
                LOL.Name = "LOL"
                LOL.Parent = game.Workspace
                LOL.Anchored = true
                LOL.Transparency = 1
                LOL.Size = Vector3.new(20,-0.5,20)
                LOL.Material = "Neon"
            elseif game:GetService("Workspace"):FindFirstChild("LOL") then
                game.Workspace["LOL"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-3.5,0)
            end
        else
            if game:GetService("Workspace"):FindFirstChild("LOL") then
            	game:GetService("Workspace"):FindFirstChild("LOL"):Destroy()
            end
        end
    end)
end)

WeaponList = {}

for i,t in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
	if t:IsA("Tool") then
		table.insert(WeaponList,t.Name)
	end
end

BossList = {}

for i,b in pairs(game.ReplicatedStorage:GetChildren()) do
	if string.find(b.Name, "Boss") then
		if b.Name == "Ice Admiral [Lv. 700] [Boss]" then
		elseif b.Name == "rip_indra [Lv. 1500] [Boss]" then
		else
			table.insert(BossList,b.Name)
		end
	end
end

for i,b in pairs(game.workspace.Enemies:GetChildren()) do
	if string.find(b.Name, "Boss") then
		if b.Name == "Ice Admiral [Lv. 700] [Boss]" then
		elseif b.Name == "rip_indra [Lv. 1500] [Boss]" then
		else
			table.insert(BossList,b.Name)
		end
	end
end

function EquipTool(ToolSelect)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSelect) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSelect)
		wait(.3)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end

spawn(function()
	while wait(.3) do
		if _G.AutoSword then
			local args = {
				[1] = "AddPoint",
				[2] = "Sword",
				[3] = 1
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
end)

spawn(function()
	while wait(.3) do
		if _G.AutoDefense then
			local args = {
				[1] = "AddPoint",
				[2] = "Defense",
				[3] = 1
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
end)

spawn(function()
	while wait(.3) do
		if _G.AutoSword then
			local args = {
				[1] = "AddPoint",
				[2] = "Sword",
				[3] = 1
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
end)

spawn(function()
	while wait(.3) do
		if _G.AutoGun then
			local args = {
				[1] = "AddPoint",
				[2] = "Gun",
				[3] = 1
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
end)

spawn(function()
	while wait(.3) do
		if _G.AutoBloxFruit then
			local args = {
				[1] = "AddPoint",
				[2] = "BloxFruit",
				[3] = 1
			}
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
end)

spawn(function()
	while wait(1) do
		if _G.AutoRandomFruit then
			local args = {
				[1] = "Cousin",
				[2] = "Buy"
			}

			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		end
	end
end)

function AutoHaki()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        local args = {
            [1] = "Buso"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end

spawn(function()
	while wait() do
		if _G.AutoBuso then
			AutoHaki()
		end
	end
end)

local StatPoint = game:GetService("Players").LocalPlayer.Data.Points.Value
--------------------------------------------------------------------
local Win = library:CreateWindow("Zerkro  ",Color3.fromRGB(175,238,238),"Blox Fruits")
--------------------------------------------------------------------
local Main = Win:AddTab("Main")
local Auto = Win:AddTab("Automatics")
local Stat = Win:AddTab("Status")
local Plr = Win:AddTab("Players")
local Tp = Win:AddTab("Teleport")
local Df = Win:AddTab("Devil Fruit")
local Shop = Win:AddTab("Shop")
local Esp = Win:AddTab("Esp-Raid")
local Misc = Win:AddTab("Misc")
--------------------------------------------------------------------
Main:AddSeperator("Settings")

local DropTool = Main:AddDropdown("Select Weapon",WeaponList,function(value)
    SelectTool = value
end)

Main:AddButton("Refresh Weapon",function()
    DropTool:Clear()
	WeaponList = {}
	for i,t in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
		if t:IsA("Tool") then
			DropTool:Add(t.Name)
		end
	end
end)

Main:AddToggle("Fast Attack",true,function(value)
    _G.Fast_Attack = value
end)

Main:AddToggle("Bring Mob",true,function(value)
    _G.BringMob = value
end)

Main:AddSeperator("Farm Level")

Main:AddToggle("Auto Farm Level",false,function(value)
    _G.AutoFarmLevel = value
end)

Main:AddToggle("Auto Farm Level [Fast]",false,function(value)
    _G.AutoFarmLevelFast = value
end)

Main:AddSeperator("Farm Boss")

Main:AddToggle("Auto Farm Boss",false,function(value)
    _G.AutoFarmBoss = value
end)

Main:AddToggle("Accept QuestBoss",true,function(value)
    _G.BossQuest = value
end)

local DropBoss = Main:AddDropdown("Select Bossn",BossList,function(value)
    SelectedBoss = value
end)

Main:AddButton("Refresh Boss",function()
    DropBoss:Clear()
	BossList = {}
	for i,b in pairs(game.ReplicatedStorage:GetChildren()) do
		if string.find(b.Name, "Boss") then
			if b.Name == "Ice Admiral [Lv. 700] [Boss]" then
			elseif b.Name == "rip_indra [Lv. 1500] [Boss]" then
			else
				DropBoss.Add(b.Name)
			end
		end
	end
	
	for i,b in pairs(game.workspace.Enemies:GetChildren()) do
		if string.find(b.Name, "Boss") then
			if b.Name == "Ice Admiral [Lv. 700] [Boss]" then
			elseif b.Name == "rip_indra [Lv. 1500] [Boss]" then
			else
				DropBoss.Add(b.Name)
			end
		end
	end
end)
--------------------------------------------------------------------
