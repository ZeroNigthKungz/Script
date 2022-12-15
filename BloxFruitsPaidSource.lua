local library = {}

local UIConfig = {Bind = Enum.KeyCode.RightControl}
local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
local length = 20
local randomString = ""

math.randomseed(os.time())

charTable = {}
for c in chars:gmatch "." do
    table.insert(charTable, c)
end

for i = 1, length do
    randomString = randomString .. charTable[math.random(1, #charTable)]
end

for i, v in pairs(game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules"):GetChildren()) do
    if v.ClassName == "ScreenGui" then
        for i1, v1 in pairs(v:GetChildren()) do
            if v1.Name == "Main" then
                do
                    local ui = v
                    if ui then
                        ui:Destroy()
                    end
                end
            end
        end
    end
end
function CircleClick(Button, X, Y)
    coroutine.resume(
        coroutine.create(
            function()
                local Circle = Instance.new("ImageLabel")
                Circle.Parent = Button
                Circle.Name = "Circle"
                Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Circle.BackgroundTransparency = 1.000
                Circle.ZIndex = 10
                Circle.Image = "rbxassetid://266543268"
                Circle.ImageColor3 = Color3.fromRGB(255, 255, 255)
                Circle.ImageTransparency = 0.7
                local NewX = X - Circle.AbsolutePosition.X
                local NewY = Y - Circle.AbsolutePosition.Y
                Circle.Position = UDim2.new(0, NewX, 0, NewY)

                local Time = 0.2
                Circle:TweenSizeAndPosition(
                    UDim2.new(0, 30.25, 0, 30.25),
                    UDim2.new(0, NewX - 15, 0, NewY - 10),
                    "Out",
                    "Quad",
                    Time,
                    false,
                    nil
                )
                for i = 1, 10 do
                    Circle.ImageTransparency = Circle.ImageTransparency + 0.01
                    wait(Time / 10)
                end
                Circle:Destroy()
            end
        )
    )
end
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
function dragify(Frame, object)
    dragToggle = nil
    dragSpeed = .25
    dragInput = nil
    dragStart = nil
    dragPos = nil

    function updateInput(input)
        Delta = input.Position - dragStart
        Position =
            UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
        game:GetService("TweenService"):Create(object, TweenInfo.new(dragSpeed), {Position = Position}):Play()
    end

    Frame.InputBegan:Connect(
        function(input)
            if
                (input.UserInputType == Enum.UserInputType.MouseButton1 or
                    input.UserInputType == Enum.UserInputType.Touch)
             then
                dragToggle = true
                dragStart = input.Position
                startPos = object.Position
                input.Changed:Connect(
                    function()
                        if (input.UserInputState == Enum.UserInputState.End) then
                            dragToggle = false
                        end
                    end
                )
            end
        end
    )

    Frame.InputChanged:Connect(
        function(input)
            if
                (input.UserInputType == Enum.UserInputType.MouseMovement or
                    input.UserInputType == Enum.UserInputType.Touch)
             then
                dragInput = input
            end
        end
    )

    game:GetService("UserInputService").InputChanged:Connect(
        function(input)
            if (input == dragInput and dragToggle) then
                updateInput(input)
            end
        end
    )
end

local UI = Instance.new("ScreenGui")
UI.Name = randomString
UI.Parent = game.CoreGui:WaitForChild("RobloxGui"):WaitForChild("Modules")
UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if syn then
   syn.protect_gui(UI)
end

function library:Destroy()
    library:Destroy()
end

function library:UNIVERSE()
    local Main = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Top = Instance.new("Frame")
    local TabHolder = Instance.new("Frame")
    local UICorner_2 = Instance.new("UICorner")
    local TabContainer = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    local UIPadding = Instance.new("UIPadding")
    local Logo = Instance.new("ImageLabel")
    local Title = Instance.new("TextLabel")
    local Desc = Instance.new("TextLabel")
    
    Main.Name = "Main"
    Main.Parent = UI
    Main.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 520, 0, 650)
    Main.ClipsDescendants = true
    Main.AnchorPoint = Vector2.new(0.5, 0.5)

	Logo.Name = "Logo"
	Logo.Parent = Main
	Logo.Active = true
	Logo.AnchorPoint = Vector2.new(0.5, 0.5)
	Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Logo.BackgroundTransparency = 1.000
	Logo.Position = UDim2.new(0, 35, 0, 35)
	Logo.Size = UDim2.new(0, 50, 0, 50)
	Logo.Image = "rbxassetid://11649824457"

	Title.Name = "Title"
	Title.Parent = Main
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0882352963, 20, 0, 10)
	Title.Size = UDim2.new(0, 483, 0, 31)
	Title.Font = Enum.Font.GothamMedium
	Title.Text = "ZERKRO HUB"
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 14.000
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Desc.Name = "Desc"
	Desc.Parent = Main
	Desc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Desc.BackgroundTransparency = 1.000
	Desc.Position = UDim2.new(0.0882352963, 20, 0, 25)
	Desc.Size = UDim2.new(0, 483, 0, 31)
	Desc.Font = Enum.Font.GothamMedium
	Desc.Text = "Version Beta"
	Desc.TextColor3 = Color3.fromRGB(255, 255, 255)
	Desc.TextSize = 14.000
	Desc.TextWrapped = true
	Desc.TextTransparency = .5
	Desc.TextXAlignment = Enum.TextXAlignment.Left
	
    local UiToggle_UiStroke1 = Instance.new("UIStroke")

    UiToggle_UiStroke1.Color = Color3.fromRGB(25,25,25)
    UiToggle_UiStroke1.Thickness = 2
    UiToggle_UiStroke1.Name = "UiToggle_UiStroke1"
    UiToggle_UiStroke1.Parent = Main
            
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = Main
        
    Top.Name = "Top"
    Top.Parent = Main
    Top.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Top.BackgroundTransparency = 1.000
    Top.Position = UDim2.new(0.021956088, 0, 0.0133333337, 65)
    Top.Size = UDim2.new(0, 490, 0, 39)

    TabHolder.Name = "TabHolder"
    TabHolder.Parent = Top
    TabHolder.BackgroundColor3 = Color3.fromRGB(25,25,25)
    TabHolder.Position = UDim2.new(-0.010309278, 6, -0.0123075824, 0)
    TabHolder.Size = UDim2.new(0, 495, 0, 38)

    UICorner_2.Parent = TabHolder

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = TabHolder
    TabContainer.Active = true
    TabContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.Size = UDim2.new(0, 495, 0, 38)
    TabContainer.CanvasSize = UDim2.new(2, 0, 0, 0)
    TabContainer.ScrollBarThickness = 0
    TabContainer.VerticalScrollBarInset = Enum.ScrollBarInset.Always

    UIListLayout.Parent = TabContainer
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.Padding = UDim.new(0, 30)
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
        function()
            TabContainer.CanvasSize = UDim2.new(0, UIListLayout.AbsoluteContentSize.X, 0, 0)
        end
    )
    UIPadding.Parent = TabContainer
    UIPadding.PaddingLeft = UDim.new(0, 3)
    UIPadding.PaddingTop = UDim.new(0, 3)
    local Bottom = Instance.new("Frame")
    Bottom.Name = "Bottom"
    Bottom.Parent = Main
    Bottom.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Bottom.BackgroundTransparency = 1.000
    Bottom.Position = UDim2.new(0.0119760484, 7, 0.0916666687, 60)
    Bottom.Size = UDim2.new(0, 500, 0, 525)
    
    local uitoggled = false
    UserInputService.InputBegan:Connect(
        function(io, p)
            if io.KeyCode == UIConfig.Bind then
                if uitoggled == false then
                    Main:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 1, true)
                    uitoggled = true
                    wait(.5)
                    UI.Enabled = false
                else
                    Main:TweenSize(
                        UDim2.new(0, 520, 0, 650),
                        Enum.EasingDirection.Out,
                        Enum.EasingStyle.Quart,
                        1,
                        true
                    )
                    UI.Enabled = true
                    uitoggled = false
                end
            end
        end
    )

    dragify(Top, Main)
    local tabs = {}
    local S = false
    function tabs:Tab(Name, icon)
        local FrameTab = Instance.new("Frame")
        local Tab = Instance.new("TextButton")
        local UICorner_3 = Instance.new("UICorner")
        local UICorner_Tab = Instance.new("UICorner")
        local ImageLabel = Instance.new("ImageLabel")
        local TextLabel = Instance.new("TextLabel")
        
        FrameTab.Name = "FrameTab"
        FrameTab.Parent = Tab
        FrameTab.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
        FrameTab.Size = UDim2.new(0, 140, 0, 30)
        UICorner_Tab.CornerRadius = UDim.new(0, 3)
        UICorner_Tab.Parent = FrameTab
        
        Tab.Name = "Tab"
        Tab.Parent = TabContainer
        Tab.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
        Tab.Size = UDim2.new(0, 114, 0, 30)
        Tab.BackgroundTransparency = 1
        Tab.Text = ""
        UICorner_3.CornerRadius = UDim.new(0, 3)
        UICorner_3.Parent = Tab

        ImageLabel.Parent = Tab
        ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.Position = UDim2.new(0, 5, 0.2, 0)
        ImageLabel.Size = UDim2.new(0, 20, 0, 20)
        ImageLabel.Image = "http://www.roblox.com/asset/?id=" .. icon
        ImageLabel.ImageColor3 = Color3.fromRGB(255, 255, 255)
        ImageLabel.ImageTransparency = 0.2
        ImageLabel.BackgroundTransparency = 1

        TextLabel.Parent = Tab
        TextLabel.Text = Name.." "

        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.Position = UDim2.new(0.342105269, 0, 0.100000001, 0)
        TextLabel.Size = UDim2.new(0, 87, 0, 27)
        TextLabel.Font = Enum.Font.GothamBold
        TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.TextSize = 12.300
        TextLabel.TextXAlignment = Enum.TextXAlignment.Left
        TextLabel.TextTransparency = 0.200

		if TextLabel.Name == Name.." " then
			Tab.Size = UDim2.new(0, 70 + TextLabel.TextBounds.X, 0, 25)
		end
		
        local Page = Instance.new("ScrollingFrame")
        local Left = Instance.new("ScrollingFrame")
        local Right = Instance.new("ScrollingFrame")
        local UIListLayout_5 = Instance.new("UIListLayout")
        local UIPadding_5 = Instance.new("UIPadding")

        Page.Name = "Page"
        Page.Parent = Bottom
        Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Page.BackgroundTransparency = 1.000
        Page.Size = UDim2.new(0, 500, 0, 525)
        Page.ScrollBarThickness = 0
        Page.CanvasSize = UDim2.new(0, 0, 0, 0)
        Page.Visible = false

        Left.Name = "Left"
        Left.Parent = Page
        Left.Active = true
        Left.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Left.BackgroundTransparency = 1.000
        Left.Size = UDim2.new(0, 240, 0, 525)
        Left.ScrollBarThickness = 0
        Left.CanvasSize = UDim2.new(0, 0, 0, 0)

        Right.Name = "Right"
        Right.Parent = Page
        Right.Active = true
        Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Right.BackgroundTransparency = 1.000
        Right.Size = UDim2.new(0, 240, 0, 525)
        Right.ScrollBarThickness = 0
        Right.CanvasSize = UDim2.new(0, 0, 0, 0)

        local LeftList = Instance.new("UIListLayout")
        local RightList = Instance.new("UIListLayout")

        LeftList.Parent = Left
        LeftList.SortOrder = Enum.SortOrder.LayoutOrder
        LeftList.Padding = UDim.new(0, 8)

        RightList.Parent = Right
        RightList.SortOrder = Enum.SortOrder.LayoutOrder
        RightList.Padding = UDim.new(1, 1)

        UIListLayout_5.Parent = Page
        UIListLayout_5.FillDirection = Enum.FillDirection.Horizontal
        UIListLayout_5.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout_5.Padding = UDim.new(0, 13)

        UIPadding_5.Parent = Page

        LeftList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                Left.CanvasSize = UDim2.new(0, 240, 0, LeftList.AbsoluteContentSize.Y)
            end
        )
        RightList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                Right.CanvasSize = UDim2.new(0, 240, 0, RightList.AbsoluteContentSize.Y )
            end
        )
        if S == false then
            S = true
            Page.Visible = true
            TextLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
            TextLabel.TextTransparency = 0
            ImageLabel.ImageColor3 = Color3.fromRGB(0, 255, 255)
        end

        Tab.MouseButton1Click:Connect(
            function()
                for _, x in next, TabContainer:GetChildren() do
                    if x.Name == "Tab" then
                        TweenService:Create(
                            x.TextLabel,
                            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextColor3 = Color3.fromRGB(255, 255, 255)}
                        ):Play()
                        TweenService:Create(
                            x.ImageLabel,
                            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {ImageColor3 = Color3.fromRGB(255, 255, 255)}
                        ):Play()
                        TweenService:Create(
                            x.ImageLabel,
                            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {ImageTransparency = 0.2}
                        ):Play()
                        TweenService:Create(
                            x.TextLabel,
                            TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                            {TextTransparency = 0.2}
                        ):Play()
                        for index, y in next, Bottom:GetChildren() do
                            y.Visible = false
                        end
                    end
                end
                TweenService:Create(
                    TextLabel,
                    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(0, 255, 255)}
                ):Play()
                TweenService:Create(
                    ImageLabel,
                    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {ImageColor3 = Color3.fromRGB(0, 255, 255)}
                ):Play()
                TweenService:Create(
                    ImageLabel,
                    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {ImageTransparency = 0}
                ):Play()
                TweenService:Create(
                    TextLabel,
                    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                    {TextTransparency = 0}
                ):Play()

                Page.Visible = true
            end
        )
        local function GetSide(Longest)
            if Longest then
                if LeftList.AbsoluteContentSize.Y > RightList.AbsoluteContentSize.Y then
                    return Left
                else
                    return Right
                end
            else
                if LeftList.AbsoluteContentSize.Y > RightList.AbsoluteContentSize.Y then
                    return Right
                else
                    return Left
                end
            end
        end

        LeftList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                if GetSide(true).Name == Left.Name then
                    Left.CanvasSize = UDim2.new(0, 0, 0, LeftList.AbsoluteContentSize.Y)
                else
                    Right.CanvasSize = UDim2.new(0, 0, 0, RightList.AbsoluteContentSize.Y)
                end
            end
        )
        RightList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
            function()
                if GetSide(true).Name == Left.Name then
                    Left.CanvasSize = UDim2.new(0, 0, 0, LeftList.AbsoluteContentSize.Y)
                else
                    Right.CanvasSize = UDim2.new(0, 0, 0, RightList.AbsoluteContentSize.Y)
                end
            end
        )

        local sections = {}
        function sections:Section(Name,side)
                local Side2 = nil
            if side then
                Side2= side:lower() or "left"
            else
                Side2=GetSide(false)
            end


            local Section = Instance.new("Frame")
            local UICorner_5 = Instance.new("UICorner")
            local Top_2 = Instance.new("Frame")
            local Line = Instance.new("Frame")
            local Sectionname = Instance.new("TextLabel")
            local SectionContainer = Instance.new("Frame")
            local SectionContainer_2 = Instance.new("Frame")
            local UIListLayout_2 = Instance.new("UIListLayout")
            local UIPadding_2 = Instance.new("UIPadding")

            Section.Name = "Section"
            Section.Parent = Side2 == "left" and Left or Right or GetSide(false)
            Section.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Section.ClipsDescendants = true
            Section.Size = UDim2.new(0, 240, 0, 343)

            UICorner_5.CornerRadius = UDim.new(0, 5)
            UICorner_5.Parent = Section

            Top_2.Name = "Top"
            Top_2.Parent = Section
            Top_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Top_2.BackgroundTransparency = 1.000
            Top_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
            Top_2.Size = UDim2.new(0, 238, 0, 31)

            Line.Name = "Line"
            Line.Parent = Top_2
            Line.BackgroundColor3 = Color3.fromRGB(0, 194, 194)
            Line.BorderSizePixel = 0
            Line.Size = UDim2.new(0, 239, 0, 1)

            Sectionname.Name = "Sectionname"
            Sectionname.Parent = Top_2
            Sectionname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Sectionname.BackgroundTransparency = 1.000
            Sectionname.Position = UDim2.new(0.0591227226, 0, 0.0222222228, 0)
            Sectionname.Size = UDim2.new(0, 224, 0, 24)
            Sectionname.Font = Enum.Font.GothamBold
            Sectionname.Text = Name
            Sectionname.TextColor3 = Color3.fromRGB(255, 255, 255)
            Sectionname.TextSize = 14.000
            Sectionname.TextTransparency = 0.300
            Sectionname.TextXAlignment = Enum.TextXAlignment.Left

            SectionContainer.Name = "SectionContainer"
            SectionContainer.Parent = Top_2
            SectionContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionContainer.BackgroundTransparency = 1.000
            SectionContainer.BorderSizePixel = 0
            SectionContainer.Position = UDim2.new(0, 0, 0.796416223, 0)
            SectionContainer.Size = UDim2.new(0, 239, 0, 318)

            SectionContainer_2.Name = "SectionContainer_2"
            SectionContainer_2.Parent = Top_2
            SectionContainer_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            SectionContainer_2.BackgroundTransparency = 1.000
            SectionContainer_2.BorderSizePixel = 0
            SectionContainer_2.Position = UDim2.new(0, 0, 0.796416223, 0)
            SectionContainer_2.Size = UDim2.new(0, 239, 0, 318)
            
            UIListLayout_2.Parent = SectionContainer
            UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
            UIListLayout_2.Padding = UDim.new(0, 5)

            UIPadding_2.Parent = SectionContainer
            UIPadding_2.PaddingLeft = UDim.new(0, 5)

            UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                function()

                    Section.Size = UDim2.new(1, 0, 0, UIListLayout_2.AbsoluteContentSize.Y + 35)
                end
            )

            local functionitem = {}

            function functionitem:Label(text)
                local textas = {}
                local Label = Instance.new("Frame")
                local Text = Instance.new("TextLabel")
                Label.Name = "Label"
                Label.Parent = SectionContainer
                Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0.975000024, 0, 0, 30)

                Text.Name = "Text"
                Text.Parent = Label
                Text.AnchorPoint = Vector2.new(0.5, 0.5)
                Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text.BackgroundTransparency = 1.000
                Text.Position = UDim2.new(0.5, 0, 0.5, 0)
                Text.Size = UDim2.new(0, 53, 0, 12)
                Text.ZIndex = 16
                Text.Font = Enum.Font.GothamBold
                Text.Text = text
                Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text.TextSize = 12.000
                function textas:Change(newtext)
                    Text.Text = newtext
                end
                return textas
            end

            function functionitem:LabelColor(text,color)
                local textas = {}
                local Label = Instance.new("Frame")
                local Text = Instance.new("TextLabel")
                Label.Name = "Label"
                Label.Parent = SectionContainer
                Label.AnchorPoint = Vector2.new(0.5, 0.5)
                Label.BackgroundTransparency = 1.000
                Label.Size = UDim2.new(0.975000024, 0, 0, 30)

                Text.Name = "Text"
                Text.Parent = Label
                Text.AnchorPoint = Vector2.new(0.5, 0.5)
                Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text.BackgroundTransparency = 1.000
                Text.Position = UDim2.new(0.5, 0, 0.5, 0)
                Text.Size = UDim2.new(0, 53, 0, 12)
                Text.ZIndex = 16
                Text.Font = Enum.Font.GothamBold
                Text.Text = text
                Text.TextColor3 = Color3.fromRGB(color)
                Text.TextSize = 12.000
                function textas:Change(newtext)
                    Text.Text = newtext
                end
                return textas
            end
            
            function functionitem:ButtonTog(Title, default, callback)
                local b3Func = {}
                local callback = callback or function()
                end
                local Tgs = default
                local Button_2 = Instance.new("Frame")
                local UICorner_21 = Instance.new("UICorner")
                local TextLabel_4 = Instance.new("TextLabel")
                local TextButton_4 = Instance.new("TextButton")

                Button_2.Name = "Button"
                Button_2.Parent = SectionContainer
                Button_2.BackgroundColor3 = Color3.fromRGB(33, 132, 112)
                Button_2.Size = UDim2.new(0.975000024, 0, 0, 25)
                Button_2.ZIndex = 16

                if default then
                    Button_2.BackgroundColor3 = Color3.fromRGB(33, 132, 112)
                else
                    Button_2.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
                end

                UICorner_21.CornerRadius = UDim.new(0, 4)
                UICorner_21.Parent = Button_2

                TextLabel_4.Parent = Button_2
                TextLabel_4.AnchorPoint = Vector2.new(0.5, 0.5)
                TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_4.BackgroundTransparency = 1.000
                TextLabel_4.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextLabel_4.Size = UDim2.new(0, 40, 0, 12)
                TextLabel_4.ZIndex = 16
                TextLabel_4.Font = Enum.Font.GothamBold
                TextLabel_4.Text = tostring(Title)
                TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_4.TextSize = 12.000

                TextButton_4.Parent = Button_2
                TextButton_4.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                TextButton_4.BackgroundTransparency = 1.000
                TextButton_4.BorderSizePixel = 0
                TextButton_4.ClipsDescendants = true
                TextButton_4.Size = UDim2.new(1, 0, 1, 0)
                TextButton_4.ZIndex = 16
                TextButton_4.AutoButtonColor = false
                TextButton_4.Font = Enum.Font.Gotham
                TextButton_4.Text = ""
                TextButton_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_4.TextSize = 14.000

                TextButton_4.MouseButton1Click:Connect(
                    function()
                        Tgs = not Tgs
                        b3Func:Update(Tgs)
                        CircleClick(Button_2, Mouse.X, Mouse.Y)
                    end
                )

                if default then
                    TweenService:Create(
                        Button_2,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            BackgroundColor3 = state and Color3.fromRGB(0, 255, 255) or Color3.fromRGB(33, 132, 112)
                        }
                    ):Play()
                    callback(default)
                    Tgs = default
                end
                function b3Func:Update(state)
                    TweenService:Create(
                        Button_2,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            BackgroundColor3 = state and Color3.fromRGB(33, 132, 112) or Color3.fromRGB(0, 255, 255)
                        }
                    ):Play()
                    callback(state)
                    Tgs = state
                end

                return b3Func
            end


            function functionitem:Button(Name, callback)
                local Button = Instance.new("Frame")
                local UICorner_6 = Instance.new("UICorner")
                local TextLabel_3 = Instance.new("TextLabel")
                local TextButton = Instance.new("TextButton")

                Button.Name = "Button"
                Button.Parent = SectionContainer
                Button.BackgroundColor3 = Color3.fromRGB(0, 231, 231)
                Button.Size = UDim2.new(0.975000024, 0, 0, 20)
                Button.ZIndex = 16

                UICorner_6.CornerRadius = UDim.new(0, 4)
                UICorner_6.Parent = Button

                TextLabel_3.Parent = Button
                TextLabel_3.AnchorPoint = Vector2.new(0.5, 0.5)
                TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_3.BackgroundTransparency = 1.000
                TextLabel_3.Position = UDim2.new(0.5, 0, 0.5, 0)
                TextLabel_3.Size = UDim2.new(0, 40, 0, 12)
                TextLabel_3.ZIndex = 16
                TextLabel_3.Font = Enum.Font.GothamBold
                TextLabel_3.Text = Name
                TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextLabel_3.TextSize = 12.000

                TextButton.Parent = Button
                TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderSizePixel = 0
                TextButton.ClipsDescendants = true
                TextButton.Size = UDim2.new(1, 0, 1, 0)
                TextButton.ZIndex = 16
                TextButton.AutoButtonColor = false
                TextButton.Font = Enum.Font.Gotham
                TextButton.Text = ""
                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.TextSize = 14.000

                TextButton.MouseButton1Click:Connect(
                    function()
                        CircleClick(Button, Mouse.X, Mouse.Y)
                        callback()
                    end
                )
            end
            
            function functionitem:Toggle(Name, default, callback)
                local ToglFunc = {}
                local Tgo = default
                local MainToggle = Instance.new("Frame")
                local UICorner = Instance.new("UICorner")
                local Text = Instance.new("TextLabel")
                local MainToggle_2 = Instance.new("ImageLabel")
                local UICorner_2 = Instance.new("UICorner")
                local MainToggle_3 = Instance.new("ImageLabel")
                local UICorner_3 = Instance.new("UICorner")
                local TextButton = Instance.new("TextButton")
                
                MainToggle.Name = "MainToggle"
                MainToggle.Parent = SectionContainer
                MainToggle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                MainToggle.BackgroundTransparency = 0.700
                MainToggle.BorderSizePixel = 0
                MainToggle.ClipsDescendants = true
                MainToggle.Size = UDim2.new(0.975000024, 0, 0, 35)
                MainToggle.ZIndex = 16
                
                UICorner.CornerRadius = UDim.new(0, 4)
                UICorner.Parent = MainToggle
                
                Text.Name = "Text"
                Text.Parent = MainToggle
                Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text.BackgroundTransparency = 1.000
                Text.Position = UDim2.new(0, 10, 0, 10)
                Text.Size = UDim2.new(0, 100, 0, 12)
                Text.ZIndex = 16
                Text.Font = Enum.Font.GothamBold
                Text.Text = Name
                Text.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text.TextSize = 12.000
                Text.TextTransparency = 0.4
                Text.TextXAlignment = Enum.TextXAlignment.Left
                
                MainToggle_2.Name = "MainToggle"
                MainToggle_2.Parent = MainToggle
                MainToggle_2.AnchorPoint = Vector2.new(0.5, 0.5)
                MainToggle_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                MainToggle_2.ClipsDescendants = true
                MainToggle_2.Position = UDim2.new(0.899999976, 0, 0.5, 0)
                MainToggle_2.Size = UDim2.new(0, 23, 0, 23)
                MainToggle_2.ZIndex = 16
                
                UICorner_2.CornerRadius = UDim.new(0, 3)
                UICorner_2.Parent = MainToggle_2
                
                MainToggle_3.Name = "MainToggle"
                MainToggle_3.Parent = MainToggle_2
                MainToggle_3.AnchorPoint = Vector2.new(0.5, 0.5)
                MainToggle_3.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                MainToggle_3.ClipsDescendants = true
                MainToggle_3.Position = UDim2.new(0.5, 0, 0.5, 0)
                MainToggle_3.Size = UDim2.new(0, 0, 0, 0)
                MainToggle_3.ZIndex = 16
                MainToggle_3.Image = "http://www.roblox.com/asset/?id=6031068421"
                MainToggle_3.ImageColor3 = Color3.fromRGB(0, 255, 255)
                MainToggle_3.Visible =false
                UICorner_3.CornerRadius = UDim.new(0, 3)
                UICorner_3.Parent = MainToggle_3
                
                TextButton.Name = ""
                TextButton.Parent = MainToggle
                TextButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                TextButton.BackgroundTransparency = 1.000
                TextButton.BorderSizePixel = 0
                TextButton.Size = UDim2.new(1, 0, 1, 0)
                TextButton.ZIndex = 16
                TextButton.AutoButtonColor = false
                TextButton.Font = Enum.Font.Gotham
                TextButton.Text = ""
                TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton.TextSize = 14.000

                TextButton.MouseButton1Click:Connect(
                    function()
                        Tgo = not Tgo
                        ToglFunc:Update(Tgo)
                        CircleClick(Button, Mouse.X, Mouse.Y)
                    end
                )

                if default then
                    if default then
                        MainToggle_3.Visible = default
                        end
                    TweenService:Create(
                        Text,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            TextTransparency = default and 0 or 0.4
                        }
                    ):Play()
                    local we = TweenService:Create(
                        MainToggle_3,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                        {
                            Size = default and UDim2.new(0, 25, 0, 25) or UDim2.new(0, 0, 0, 0) 
                        }
                    )
                    we:Play()
                    we.Completed:Wait()
                    if default == false then
                        MainToggle_3.Visible = default
                    end
                    callback(default)
                    Tgo = default
                end
                function ToglFunc:Update(state)
                    if state then
                        MainToggle_3.Visible = state
                        end
                    TweenService:Create(
                        Text,
                        TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {
                            TextTransparency = state and 0 or 0.4
                        }
                    ):Play()
                    local we = TweenService:Create(
                        MainToggle_3,
                        TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                        {
                            Size = state and UDim2.new(0, 25, 0, 25) or UDim2.new(0, 0, 0, 0) 
                        }
                    )
                    we:Play()
                    we.Completed:Wait()
                    if state == false then
                    MainToggle_3.Visible = state
                    end
                    callback(state)
                    Tgo = state
                end
                return ToglFunc
            end

            function functionitem:Textbox(Name, dissapear, Placeholder, callback)
                local Textbox = Instance.new("Frame")
                local UICorner_16 = Instance.new("UICorner")
                local Text_5 = Instance.new("TextLabel")
                local TextboxHoler = Instance.new("Frame")
                local UICorner_17 = Instance.new("UICorner")
                local HeadTitle = Instance.new("TextBox")
                Textbox.Name = "Textbox"
                Textbox.Parent = SectionContainer
                Textbox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                Textbox.BackgroundTransparency = 0.700
                Textbox.BorderSizePixel = 0
                Textbox.ClipsDescendants = true
                Textbox.Size = UDim2.new(0.975000024, 0, 0, 60)
                Textbox.ZIndex = 16

                UICorner_16.CornerRadius = UDim.new(0, 4)
                UICorner_16.Parent = Textbox

                Text_5.Name = "Text"
                Text_5.Parent = Textbox
                Text_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text_5.BackgroundTransparency = 1.000
                Text_5.Position = UDim2.new(0, 10, 0, 10)
                Text_5.Size = UDim2.new(0, 43, 0, 12)
                Text_5.ZIndex = 16
                Text_5.Font = Enum.Font.GothamBold
                Text_5.Text = Name
                Text_5.TextColor3 = Color3.fromRGB(0, 231, 231)
                Text_5.TextSize = 11.000
                Text_5.TextXAlignment = Enum.TextXAlignment.Left

                TextboxHoler.Name = "TextboxHoler"
                TextboxHoler.Parent = Textbox
                TextboxHoler.AnchorPoint = Vector2.new(0.5, 0.5)
                TextboxHoler.BackgroundColor3 = Color3.fromRGB(13, 13, 15)
                TextboxHoler.BackgroundTransparency = 1.000
                TextboxHoler.BorderSizePixel = 0
                TextboxHoler.Position = UDim2.new(0.5, 0, 0.5, 13)
                TextboxHoler.Size = UDim2.new(0.970000029, 0, 0, 30)

                UICorner_17.CornerRadius = UDim.new(0, 6)
                UICorner_17.Parent = TextboxHoler

                HeadTitle.Name = "HeadTitle"
                HeadTitle.Parent = TextboxHoler
                HeadTitle.AnchorPoint = Vector2.new(0.5, 0.5)
                HeadTitle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                HeadTitle.BackgroundTransparency = 1.000
                HeadTitle.BorderSizePixel = 0
                HeadTitle.ClipsDescendants = true
                HeadTitle.Position = UDim2.new(0.5, 0, 0.5, 0)
                HeadTitle.Size = UDim2.new(0.949999988, 0, 0, 40)
                HeadTitle.ZIndex = 16
                HeadTitle.Font = Enum.Font.GothamBold
                HeadTitle.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
                HeadTitle.PlaceholderText = Placeholder
                HeadTitle.Text = ""
                HeadTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                HeadTitle.TextSize = 13.000
                HeadTitle.TextTransparency = 0.700
                HeadTitle.TextXAlignment = Enum.TextXAlignment.Left
                HeadTitle.FocusLost:Connect(
                    function(ep)
                        if ep then
                            if #HeadTitle.Text > 0 then
                                callback(HeadTitle.Text)
                                if disapper then
                                    HeadTitle.Text = ""
                                end
                            end
                        end
                    end
                )
            end

            function functionitem:Dropdown(Name, list, default, callback)
                local Dropfunc = {}

                local MainDropDown = Instance.new("Frame")
                local UICorner_7 = Instance.new("UICorner")
                local MainDropDown_2 = Instance.new("Frame")
                local UICorner_8 = Instance.new("UICorner")
                local v = Instance.new("TextButton")
                local Text_2 = Instance.new("TextLabel")
                local ImageButton = Instance.new("ImageButton")
                local Scroll_Items = Instance.new("ScrollingFrame")
                local UIListLayout_3 = Instance.new("UIListLayout")
                local UIPadding_3 = Instance.new("UIPadding")

                MainDropDown.Name = "MainDropDown"
                MainDropDown.Parent = SectionContainer
                MainDropDown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                MainDropDown.BackgroundTransparency = 0.700
                MainDropDown.BorderSizePixel = 0
                MainDropDown.ClipsDescendants = true
                MainDropDown.Size = UDim2.new(0.975000024, 0, 0, 30)
                MainDropDown.ZIndex = 16

                UICorner_7.CornerRadius = UDim.new(0, 4)
                UICorner_7.Parent = MainDropDown

                MainDropDown_2.Name = "MainDropDown"
                MainDropDown_2.Parent = MainDropDown
                MainDropDown_2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                MainDropDown_2.BackgroundTransparency = 0.700
                MainDropDown_2.BorderSizePixel = 0
                MainDropDown_2.ClipsDescendants = true
                MainDropDown_2.Size = UDim2.new(1, 0, 0, 30)
                MainDropDown_2.ZIndex = 16

                UICorner_8.CornerRadius = UDim.new(0, 4)
                UICorner_8.Parent = MainDropDown_2

                v.Name = "v"
                v.Parent = MainDropDown_2
                v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v.BackgroundTransparency = 1.000
                v.BorderSizePixel = 0
                v.Size = UDim2.new(1, 0, 1, 0)
                v.ZIndex = 16
                v.AutoButtonColor = false
                v.Font = Enum.Font.GothamBold
                v.Text = ""
                v.TextColor3 = Color3.fromRGB(255, 255, 255)
                v.TextSize = 12.000
                function getpro()
                    if default then
                        if table.find(list, default) then
                            callback(default)
                            return Name .. " : " .. default
                        else
                            return Name .. " : "
                        end
                    else
                        return Name .. " : "
                    end
                end
                Text_2.Name = "Text"
                Text_2.Parent = MainDropDown_2
                Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text_2.BackgroundTransparency = 1.000
                Text_2.Position = UDim2.new(0, 10, 0, 10)
                Text_2.Size = UDim2.new(0, 62, 0, 12)
                Text_2.ZIndex = 16
                Text_2.Font = Enum.Font.GothamBold
                Text_2.Text = getpro()
                Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text_2.TextSize = 12.000
                Text_2.TextXAlignment = Enum.TextXAlignment.Left

                ImageButton.Parent = MainDropDown_2
                ImageButton.AnchorPoint = Vector2.new(0, 0.5)
                ImageButton.BackgroundTransparency = 1.000
                ImageButton.Position = UDim2.new(1, -25, 0.5, 0)
                ImageButton.Size = UDim2.new(0, 12, 0, 12)
                ImageButton.ZIndex = 16
                ImageButton.Image = "http://www.roblox.com/asset/?id=6282522798"

                Scroll_Items.Name = "Scroll_Items"
                Scroll_Items.Parent = MainDropDown
                Scroll_Items.Active = true
                Scroll_Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Scroll_Items.BackgroundTransparency = 1.000
                Scroll_Items.BorderSizePixel = 0
                Scroll_Items.Position = UDim2.new(0, 0, 0, 35)
                Scroll_Items.Size = UDim2.new(1, 0, 1, -35)
                Scroll_Items.ZIndex = 16
                Scroll_Items.CanvasSize = UDim2.new(0, 0, 0, 265)
                Scroll_Items.ScrollBarThickness = 0

                UIListLayout_3.Parent = Scroll_Items
                UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_3.Padding = UDim.new(0, 5)
                UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                    function()
                        Scroll_Items.CanvasSize = UDim2.new(1, 0, 0, UIListLayout_2.AbsoluteContentSize.Y+40)
                    end
                )
                UIPadding_3.Parent = Scroll_Items
                UIPadding_3.PaddingLeft = UDim.new(0, 10)
                UIPadding_3.PaddingTop = UDim.new(0, 5)

                function Dropfunc:TogglePanel(state)
                    TweenService:Create(
                        MainDropDown,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = state and UDim2.new(0.975000024, 0, 0, 200) or UDim2.new(0.975000024, 0, 0, 30)}
                    ):Play()
                    TweenService:Create(
                        ImageButton,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Rotation = state and 180 or 0}
                    ):Play()
                end
                local Tof = false
                ImageButton.MouseButton1Click:Connect(
                    function()
                        Tof = not Tof
                        Dropfunc:TogglePanel(Tof)
                    end
                )
                v.MouseButton1Click:Connect(
                    function()
                        Tof = not Tof
                        Dropfunc:TogglePanel(Tof)
                    end
                )
    function Dropfunc:Clear()
        for i, v in next, Scroll_Items:GetChildren() do
            if v:IsA("TextButton") then 
                v:Destroy()
            end
        end
    end
    
                function Dropfunc:Add(Text)
                    local _5 = Instance.new("TextButton")
                    local UICorner_9 = Instance.new("UICorner")
                    _5.Name = Text
                    _5.Parent = Scroll_Items
                    _5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    _5.BorderSizePixel = 0
                    _5.ClipsDescendants = true
                    _5.Size = UDim2.new(1, -10, 0, 20)
                    _5.ZIndex = 17
                    _5.AutoButtonColor = false
                    _5.Font = Enum.Font.GothamBold
                    _5.Text = Text
                    _5.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _5.TextSize = 12.000

                    UICorner_9.CornerRadius = UDim.new(0, 4)
                    UICorner_9.Parent = _5

                   _5.MouseButton1Click:Connect(
                        function()
                            if _x == nil then
                            Tof = false
                            Dropfunc:TogglePanel(Tof)
                            callback(Text)
                            Text_2.Text = Text
                            _x = nil
                            end
                        end
                    )
                end
                for i, v in next, list do
                    Dropfunc:Add(v)
                end
                    
 
                return Dropfunc
            end
            function functionitem:MultiDropdown(Name, list, default, callback)
                local Dropfunc = {}

                local MainDropDown = Instance.new("Frame")
                local UICorner_7 = Instance.new("UICorner")
                local MainDropDown_2 = Instance.new("Frame")
                local UICorner_8 = Instance.new("UICorner")
                local v = Instance.new("TextButton")
                local Text_2 = Instance.new("TextLabel")
                local ImageButton = Instance.new("ImageButton")
                local Scroll_Items = Instance.new("ScrollingFrame")
                local UIListLayout_3 = Instance.new("UIListLayout")
                local UIPadding_3 = Instance.new("UIPadding")

                MainDropDown.Name = "MainDropDown"
                MainDropDown.Parent = SectionContainer
                MainDropDown.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                MainDropDown.BackgroundTransparency = 0.700
                MainDropDown.BorderSizePixel = 0
                MainDropDown.ClipsDescendants = true
                MainDropDown.Size = UDim2.new(0.975000024, 0, 0, 30)
                MainDropDown.ZIndex = 16

                UICorner_7.CornerRadius = UDim.new(0, 4)
                UICorner_7.Parent = MainDropDown

                MainDropDown_2.Name = "MainDropDown"
                MainDropDown_2.Parent = MainDropDown
                MainDropDown_2.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                MainDropDown_2.BackgroundTransparency = 0.700
                MainDropDown_2.BorderSizePixel = 0
                MainDropDown_2.ClipsDescendants = true
                MainDropDown_2.Size = UDim2.new(1, 0, 0, 30)
                MainDropDown_2.ZIndex = 16

                UICorner_8.CornerRadius = UDim.new(0, 4)
                UICorner_8.Parent = MainDropDown_2

                v.Name = "v"
                v.Parent = MainDropDown_2
                v.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                v.BackgroundTransparency = 1.000
                v.BorderSizePixel = 0
                v.Size = UDim2.new(1, 0, 1, 0)
                v.ZIndex = 16
                v.AutoButtonColor = false
                v.Font = Enum.Font.GothamBold
                v.Text = ""
                v.TextColor3 = Color3.fromRGB(255, 255, 255)
                v.TextSize = 12.000
                function getpro()
                    if default then
                        for i, v in next, default do
                            if table.find(list, v) then
                                callback(default)
                                return Name .. " : " .. table.concat(default, ", ")
                            else
                                return Name
                            end
                        end
                    else
                        return Name
                    end
                end
                
                Text_2.Name = "Text"
                Text_2.Parent = MainDropDown_2
                Text_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text_2.BackgroundTransparency = 1.000
                Text_2.Position = UDim2.new(0, 10, 0, 10)
                Text_2.Size = UDim2.new(0, 62, 0, 12)
                Text_2.ZIndex = 16
                Text_2.Font = Enum.Font.GothamBold
                Text_2.Text = getpro()
                Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text_2.TextSize = 12.000
                Text_2.TextXAlignment = Enum.TextXAlignment.Left

                ImageButton.Parent = MainDropDown_2
                ImageButton.AnchorPoint = Vector2.new(0, 0.5)
                ImageButton.BackgroundTransparency = 1.000
                ImageButton.Position = UDim2.new(1, -25, 0.5, 0)
                ImageButton.Size = UDim2.new(0, 12, 0, 12)
                ImageButton.ZIndex = 16
                ImageButton.Image = "http://www.roblox.com/asset/?id=6282522798"
                local DropTable = {}
                Scroll_Items.Name = "Scroll_Items"
                Scroll_Items.Parent = MainDropDown
                Scroll_Items.Active = true
                Scroll_Items.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Scroll_Items.BackgroundTransparency = 1.000
                Scroll_Items.BorderSizePixel = 0
                Scroll_Items.Position = UDim2.new(0, 0, 0, 35)
                Scroll_Items.Size = UDim2.new(1, 0, 1, -35)
                Scroll_Items.ZIndex = 16
                Scroll_Items.CanvasSize = UDim2.new(0, 0, 0, 265)
                Scroll_Items.ScrollBarThickness = 0

                UIListLayout_3.Parent = Scroll_Items
                UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
                UIListLayout_3.Padding = UDim.new(0, 5)
                UIListLayout_2:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(
                    function()
                        Scroll_Items.CanvasSize = UDim2.new(1, 0, 0, UIListLayout_2.AbsoluteContentSize.Y+40)
                    end
                )
                UIPadding_3.Parent = Scroll_Items
                UIPadding_3.PaddingLeft = UDim.new(0, 10)
                UIPadding_3.PaddingTop = UDim.new(0, 5)

                function Dropfunc:TogglePanel(state)
                    TweenService:Create(
                        MainDropDown,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = state and UDim2.new(0.975000024, 0, 0, 200) or UDim2.new(0.975000024, 0, 0, 30)}
                    ):Play()
                    TweenService:Create(
                        ImageButton,
                        TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Rotation = state and 180 or 0}
                    ):Play()
                end
                local Tof = false
                ImageButton.MouseButton1Click:Connect(
                    function()
                        Tof = not Tof
                        Dropfunc:TogglePanel(Tof)
                    end
                )
                v.MouseButton1Click:Connect(
                    function()
                        Tof = not Tof
                        Dropfunc:TogglePanel(Tof)
                    end
                )
                function Dropfunc:Add(Text)
                    local _5 = Instance.new("TextButton")
                    local UICorner_9 = Instance.new("UICorner")
                    _5.Name = Text
                    _5.Parent = Scroll_Items
                    _5.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                    _5.BorderSizePixel = 0
                    _5.ClipsDescendants = true
                    _5.Size = UDim2.new(1, -10, 0, 20)
                    _5.ZIndex = 17
                    _5.AutoButtonColor = false
                    _5.Font = Enum.Font.GothamBold
                    _5.Text = Text
                    _5.TextColor3 = Color3.fromRGB(255, 255, 255)
                    _5.TextSize = 12.000

                    UICorner_9.CornerRadius = UDim.new(0, 4)
                    UICorner_9.Parent = _5
                    _5.MouseButton1Click:Connect(
                        function()
                            if not table.find(DropTable, Text) then
                                table.insert(DropTable, Text)
                                callback(DropTable, Text)
                                Text_2.Text = Name .. " : " .. table.concat(DropTable, ", ")
                                TweenService:Create(
                                    _5,
                                    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = Color3.fromRGB(0, 255, 255)}
                                ):Play()
                            else
                                TweenService:Create(
                                    _5,
                                    TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                    {TextColor3 = Color3.fromRGB(255,255,255)}
                                ):Play()
                                for i2, v2 in pairs(DropTable) do
                                    if v2 == Text then
                                        table.remove(DropTable, i2)
                                        Text_2.Text = Name .. " : " .. table.concat(DropTable, ", ")
                                    end
                                end
                                callback(DropTable, Text)
                            end
                        end
                    )
                end
    function Dropfunc:Clear()
    for i, v in next, Scroll_Items:GetChildren() do
        if v:IsA("TextButton")  then 
        v:Destroy()
        
        end
    end 
    end
    
                for i, v in next, list do
                    Dropfunc:Add(v)
                end
                return Dropfunc
            end

            function functionitem:Slider(Name, min, max, default, callback)
                local sliderfunc = {}
                local min = min or 1
                local max = max or 100
                local default = default or max / 2
                local callback = callback or function()
                    end
                local offset = 70
                if default > max then
                    default = max
                elseif default < min then
                    default = min
                end

                local MainSlider = Instance.new("Frame")
                local UICorner_12 = Instance.new("UICorner")
                local Text_4 = Instance.new("TextLabel")
                local SliderBar = Instance.new("TextButton")
                local UICorner_13 = Instance.new("UICorner")
                local SliderBar_2 = Instance.new("TextButton")
                local UICorner_14 = Instance.new("UICorner")
                local TextButton_2 = Instance.new("TextButton")

                MainSlider.Name = "MainSlider"
                MainSlider.Parent = SectionContainer
                MainSlider.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                MainSlider.BackgroundTransparency = 0.700
                MainSlider.BorderSizePixel = 0
                MainSlider.ClipsDescendants = true
                MainSlider.Size = UDim2.new(0.975000024, 0, 0, 50)
                MainSlider.ZIndex = 16

                UICorner_12.CornerRadius = UDim.new(0, 4)
                UICorner_12.Parent = MainSlider

                Text_4.Name = "Text"
                Text_4.Parent = MainSlider
                Text_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                Text_4.BackgroundTransparency = 1.000
                Text_4.Position = UDim2.new(0, 10, 0, 10)
                Text_4.Size = UDim2.new(0, 63, 0, 12)
                Text_4.ZIndex = 16
                Text_4.Font = Enum.Font.GothamBold
                Text_4.Text = Name .. " : " .. default
                Text_4.TextColor3 = Color3.fromRGB(255, 255, 255)
                Text_4.TextSize = 12.000
                Text_4.TextXAlignment = Enum.TextXAlignment.Left

                TextButton_2.Parent = SliderBar
                TextButton_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                TextButton_2.BackgroundTransparency = 1.000
                TextButton_2.BorderSizePixel = 0
                TextButton_2.ClipsDescendants = true
                TextButton_2.Position = UDim2.new(0, 0, 0, -8)
                TextButton_2.Size = UDim2.new(1, 5, 1, 18)
                TextButton_2.ZIndex = 16
                TextButton_2.AutoButtonColor = false
                TextButton_2.Font = Enum.Font.Gotham
                TextButton_2.Text = ""
                TextButton_2.TextColor3 = Color3.fromRGB(255, 255, 255)
                TextButton_2.TextSize = 14.000

                local SliderValueFrame = Instance.new("Frame")
                SliderValueFrame.Name = "SliderValueFrame"
                SliderValueFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                SliderValueFrame.Size = UDim2.new(0, 197, 0, 4)
                SliderValueFrame.Position = UDim2.new(0.4857185, 0, 0.7700002, 0)
                SliderValueFrame.BorderSizePixel = 0
                SliderValueFrame.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
                SliderValueFrame.Parent = MainSlider
                local dragging = false

                local SliderValueFrame1 = Instance.new("Frame")
                SliderValueFrame1.Name = "SliderValueFrame"
                SliderValueFrame1.Size = UDim2.new(0.5, 0, 0, 4)
                SliderValueFrame1.BorderSizePixel = 0
                SliderValueFrame1.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
                SliderValueFrame1.Parent = SliderValueFrame

                local SliderValueFrame2 = Instance.new("TextButton")
                SliderValueFrame2.Name = "SliderValueFrame"
                SliderValueFrame2.Size = UDim2.new(0, 15, 0, 15)

                SliderValueFrame2.Position = UDim2.new(0.5, 0, 0, 0)
                SliderValueFrame2.BorderSizePixel = 0
                SliderValueFrame2.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
                SliderValueFrame2.Parent = SliderValueFrame
                SliderValueFrame2.Text = ""
                UICorner_1s2 = Instance.new "UICorner"
                UICorner_1s2.CornerRadius = UDim.new(0, 90)
                UICorner_1s2.Parent = SliderValueFrame2
                
                
                local Value = start
                local mouse = game:GetService("Players").LocalPlayer:GetMouse()
                local function move(input)
                    local pos =
                        UDim2.new(
                        math.clamp(
                            (input.Position.X - SliderValueFrame.AbsolutePosition.X) / SliderValueFrame.AbsoluteSize.X,
                            0,
                            1
                        ),
                        0,
                        0,
                        -6
                    )
                    local pos1 =
                        UDim2.new(
                        math.clamp(
                            (input.Position.X - SliderValueFrame.AbsolutePosition.X) / SliderValueFrame.AbsoluteSize.X,
                            0,
                            1
                        ),
                        0,
                        0,
                        4
                    )
                    SliderValueFrame1.Size = pos1
                    SliderValueFrame2.Position = pos

                    local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
                    Value = value
                    repeat 
                        task.wait()
                        if min <= 1000 or max <= 1000 or default >= 1000 then
                            Text_4.Text = Name .. " : " .. Value
                        elseif max >= 1000 or min >= 1000 or default >= 1000 then
                            Text_4.Text = Name .. " : ..."
                        end
                    until 
                    callback(Value)
                end
                SliderValueFrame2.InputBegan:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = true
                        end
                    end
                )
                SliderValueFrame2.InputEnded:Connect(
                    function(input)
                        if input.UserInputType == Enum.UserInputType.MouseButton1 then
                            dragging = false
                        end
                    end
                )
                game:GetService("UserInputService").InputChanged:Connect(
                    function(input)
                        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                            move(input)
                        end
                    end
                )

                if default then
                    local pos = UDim2.new(math.clamp((default) / max, 0, 1), -6, -1.5, 0)
                    SliderValueFrame2.Position = pos
                    SliderValueFrame1.Size = UDim2.new((default or 0) / max, 0, 0, 4)
                        if max >= 1000 then
                            Text_4.Text = Name .. " : ..."
                        else
                            Text_4.Text = Name .. " : " .. Value
                        end
                    callback(default)
                end
                function sliderfunc:Update(value)
                    local pos = UDim2.new(math.clamp((default) / max, 0, 1), -6, -1.5, 0)
                    SliderValueFrame2.Position = pos
                    SliderValueFrame1.Size = UDim2.new((default or 0) / max, 0, 0, 4)
                        if max >= 1000 then
                            Text_4.Text = Name .. " : ..."
                        else
                            Text_4.Text = Name .. " : " .. Value
                        end
                    callback(value)
                end
                return sliderfunc
            end
            return functionitem
        end
        return sections
    end
    return tabs
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

coroutine.wrap(function()
local StopCamera = require(game.ReplicatedStorage.Util.CameraShaker)StopCamera:Stop()
    for v,v in pairs(getreg()) do
        if typeof(v) == "function" and getfenv(v).script == game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework then
             for v,v in pairs(debug.getupvalues(v)) do
                if typeof(v) == "table" then
                    spawn(function()
                        game:GetService("RunService").RenderStepped:Connect(function()
                            if _G.Fast_Attack then
                                 pcall(function()
                                     v.activeController.timeToNextAttack = 0
                                     v.activeController.attacking = false
                                     v.activeController.increment = 4
                                     v.activeController.blocking = false   
                                     v.activeController.hitboxMagnitude = 150
    		                         v.activeController.humanoid.AutoRotate = true
    	                      	     v.activeController.focusStart = 0
    	                      	     v.activeController.currentAttackTrack = 0
                                     sethiddenproperty(game:GetService("Players").LocalPlayer, "SimulationRaxNerous", math.huge)
                                 end)
                             end
                         end)
                    end)
                end
            end
        end
    end
end)();

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
		if _G.AutoMelee then
			local args = {
				[1] = "AddPoint",
				[2] = "Melee",
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

-- UI UNIVERSE HUB BY LIBRARY #CELEBRATE
local Window=library:UNIVERSE()

local Main = Window:Tab("Main","")
local Stat = Window:Tab("Status-Raid","")
local Plr = Window:Tab("Players","")
local Tp = Window:Tab("Teleport","")
local Shop = Window:Tab("Shop","")
local Esp = Window:Tab("Esp-Mirage Island","")
local Df = Window:Tab("DevilFruit","")
local Misc = Window:Tab("Misc","")

local SecMainL1 = Main:Section("Autofarm","Left")
local SecMainL2 = Main:Section("Other","Left")
local SecMainR1 = Main:Section("Setting Farm","Right")

local SecStatL1 = Stat:Section("Raid","Left")
local SecStatR1 = Stat:Section("Stat","Right")

local SecTpL1 = Tp:Section("Island","Left")
local SecTpR1 = Tp:Section("World","Right")

local SecDfL1 = Df:Section("Buy Fruit","Left")
local SecDfR1 = Df:Section("Blox Fruit","Right")

local SecMiscL1 = Misc:Section("More Function","Left")
local SecMiscR1 = Misc:Section("Servers","Right")

--Main
SecMainL1:Toggle("Auto Farm Level",false,function(value)
	_G.AutoFarmLevel = value
end)

SecMainL1:Toggle("Auto Farm Level[Fast]",false,function(value)
	_G.AutoFarmLevelFast = value
end)

local DropBoss = SecMainL1:Dropdown("Select Boss",BossList,{""},function(value)
	SelectedBoss = value
end)

SecMainL1:Button("Refresh Boss",function()
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

SecMainL1:Toggle("Auto Farm Boss",false,function(value)
	_G.AutoFarmBoss = value
end)

SecMainL1:Toggle("Accept QuestBoss",true,function(value)
	_G.BossQuest = value
end)

local DropTool = SecMainR1:Dropdown("Select Weapon",WeaponList,{""},function(value)
	SelectTool = value
end)

SecMainR1:Button("Refresh Weapon",function()
	DropTool:Clear()
	WeaponList = {}
	for i,t in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
		if t:IsA("Tool") then
			DropTool:Add(t.Name)
		end
	end
end)

SecMainR1:Toggle("Super Fast Attack",true,function(value)
	_G.Fast_Attack = value
end)

SecMainR1:Toggle("BringMob",true,function(value)
	_G.BringMob = value
end)

--Stat
SecStatR1:Button("Check Point",function()
    game.StarterGui:SetCore("SendNotification", {
        Icon = "rbxassetid://11649832223";
        Title = "Zerkro Hub",
        Text = "Your Stat Point is "..StatPoint..""
    })
end)

SecStatR1:Toggle("Melee",false,function(value)
	_G.AutoMelee = value
end)

SecStatR1:Toggle("Defense",false,function(value)
	_G.AutoDefense = value
end)

SecStatR1:Toggle("Sword",false,function(value)
	_G.AutoSword = value
end)

SecStatR1:Toggle("Gun",false,function(value)
	_G.AutoGun = value
end)

SecStatR1:Toggle("BloxFruit",false,function(value)
	_G.AutoBloxFruit = value
end)

--Players


--Teleport
SecTpL1:Button("Stop Tween",function()
	Tween:Cancel()
end)

SecTpL1:Label("")

SecTpL1:Button("Pirate Starter",function()
	ToTarget2(CFrame.new(1096.70923, 16.2664795, 1446.47766, -0.842923939, -7.25230294e-08, -0.53803277, -3.17505666e-08, 1, -8.50500612e-08, 0.53803277, -5.4607888e-08, -0.842923939))
end)

SecTpL1:Button("Marine Starter",function()
	ToTarget2(CFrame.new(-2763.16528, 24.4316978, 2156.80957, 0.199746728, 7.57859056e-08, -0.97984755, -4.45534027e-08, 1, 6.82621604e-08, 0.97984755, 3.00203986e-08, 0.199746728))
end)

SecTpL1:Button("Middle Town",function()
	ToTarget2(CFrame.new(-655.80603, 7.85223389, 1573.32971, -0.364562601, 9.69804077e-08, 0.931178868, 8.04423053e-08, 1, -7.26543021e-08, -0.931178868, 4.84191354e-08, -0.364562601))
end)

SecTpL1:Button("Jungle",function()
	ToTarget2(CFrame.new(-1613.46411, 36.8449554, 145.669052, 0.902628958, 1.08512751e-07, -0.430419505, -1.09732383e-07, 1, 2.19904575e-08, 0.430419505, 2.73817342e-08, 0.902628958))
end)

SecTpL1:Button("Pirate Village",function()
	ToTarget2(CFrame.new(-1213.79846, 4.74492025, 3917.68896, -0.995943129, 3.61450212e-08, 0.0899850801, 3.50883944e-08, 1, -1.33241667e-08, -0.0899850801, -1.01126796e-08, -0.995943129))
end)

SecTpL1:Button("Desert Island",function()
	ToTarget2(CFrame.new(942.70343, 6.60178375, 4275.38086, 0.974750519, -5.67372282e-09, -0.223296762, -4.44893145e-09, 1, -4.4829676e-08, 0.223296762, 4.46911805e-08, 0.974750519))
end)

SecTpL1:Button("Frozen Village",function()
	ToTarget2(CFrame.new(1283.92407, 87.2727737, -1258.15759, -0.950028539, 9.52087298e-09, 0.312163085, -5.61330493e-09, 1, -4.75830539e-08, -0.312163085, -4.69575276e-08, -0.950028539))
end)

SecTpL1:Button("Marine Fortress",function()
	ToTarget2(CFrame.new(-4841.4248, 20.6520443, 4371.40186, -0.538602531, 4.96288912e-08, 0.842559993, 1.17757999e-08, 1, -5.13748759e-08, -0.842559993, -1.77488193e-08, -0.538602531))
end)

SecTpL1:Button("Sky 1st Floor",function()
	ToTarget2(CFrame.new(-5262.55273, 323.869995, -2627.47021, -0.170813233, -1.42706158e-08, 0.985303402, -1.74241901e-08, 1, 1.14627969e-08, -0.985303402, -1.52101176e-08, -0.170813233))
end)

SecTpL1:Button("Sky 2nd Floor",function()
	ToTarget2(CFrame.new(-4785.3418, 717.686279, -2621.16162, 0.99622339, 6.25240801e-08, 0.086827457, -6.43223572e-08, 1, 1.79131572e-08, -0.086827457, -2.34304522e-08, 0.99622339))
end)

SecTpL1:Button("Sky 3rd Floor",function()
	ToTarget2(CFrame.new(-4576.79883, 872.542419, -1684.81812, -0.748490274, 8.59872085e-09, -0.663145781, 2.86456281e-08, 1, -1.93656557e-08, 0.663145781, -3.34912329e-08, -0.748490274))
end)

SecTpL1:Button("Prison",function()
	ToTarget2(CFrame.new(4848.82471, 5.65201807, 735.799255, -0.0664369985, -4.37240288e-08, -0.997790635, -4.62295624e-09, 1, -4.35130296e-08, 0.997790635, 1.7218672e-09, -0.0664369985))
end)

SecTpL1:Button("Colosseum",function()
	ToTarget2(CFrame.new(-1454.33875, 7.28654194, -2879.13062, -0.991750717, -3.33694983e-09, -0.128181443, -1.25186546e-08, 1, 7.08248749e-08, 0.128181443, 7.18452853e-08, -0.991750717))
end)

SecTpL1:Button("Magma",function()
	ToTarget2(CFrame.new(-5378.03613, 8.99068451, 8482.01172, 0.920642078, 3.54393173e-08, -0.390407652, -3.36253478e-08, 1, 1.14813483e-08, 0.390407652, 2.55738097e-09, 0.920642078))
end)

SecTpL1:Button("UnderWater City",function()
	ToTarget2(CFrame.new(3868.27271, 5.37315893, -1909.35669, -0.390500426, 7.37886765e-08, -0.920602739, 8.97523833e-08, 1, 4.2081485e-08, 0.920602739, -6.61934578e-08, -0.390500426))
end)

SecTpL1:Button("Fountain City",function()
	ToTarget2(CFrame.new(5196.77734, 38.5011406, 4126.08154, 0.574243724, 7.93770596e-08, 0.818684399, -8.45396144e-08, 1, -3.76588574e-08, -0.818684399, -4.75858997e-08, 0.574243724))
end)

SecTpR1:Button("First Sea",function()
	
end)

SecTpR1:Button("Second Sea",function()
	
end)

SecTpR1:Button("Third Sea",function()
	
end)

--Df
SecDfR1:Toggle("Auto Random Fruit",false,function(value)
	_G.AutoRandomFruit = value
end)

SecDfR1:Button("Random Fruit",function()
	local args = {
		[1] = "Cousin",
		[2] = "Buy"
	}

	game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
end)

SecMiscL1:Toggle("Auto Buso Haki",true,function(value)
	_G.AutoBuso = value
end)

SecMiscR1:Button("Rejoin Server",function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players"))
end)
