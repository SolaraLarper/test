local Lighting = game:GetService("Lighting")

Lighting.Ambient = Color3.fromRGB(128, 128, 128)
Lighting.OutdoorAmbient = Color3.fromRGB(70, 70, 70)
Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
Lighting.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
Lighting.GeographicLatitude = 0
Lighting.Brightness = 1.081
Lighting.GlobalShadows = false
Lighting.EnvironmentDiffuseScale = 0.1
Lighting.EnvironmentSpecularScale = 0.1

Instance.new("ColorGradingEffect", Lighting).TonemapperPreset = "Retro"
sethiddenproperty(game:GetService("MaterialService"), "Use2022Materials", false)

-- Generated using RoadToGlory's Converter v1.1 (RoadToGlory#9879)

-- Instances:

local Converted = {
	["_TopBarApp"] = Instance.new("ScreenGui");
	["_LegacyCloseMenu"] = Instance.new("Frame");
	["_CloseMenuButton"] = Instance.new("ImageButton");
	["_TopBarFrame"] = Instance.new("Frame");
	["_RightFrame"] = Instance.new("Frame");
	["_MoreMenu"] = Instance.new("Frame");
	["_OpenButton"] = Instance.new("ImageButton");
	["_StateOverlay"] = Instance.new("ImageLabel");
	["_Icon"] = Instance.new("ImageLabel");
	["_MoreMenuContainer"] = Instance.new("Frame");
	["_ContextualMenu"] = Instance.new("Frame");
	["_PositionFrame"] = Instance.new("Frame");
	["_BaseMenu"] = Instance.new("Frame");
	["_ClippingFrame"] = Instance.new("Frame");
	["_ScrollingFrame"] = Instance.new("ScrollingFrame");
	["_layout"] = Instance.new("UIListLayout");
	["_cell 2"] = Instance.new("Frame");
	["_Cell"] = Instance.new("ImageButton");
	["_LeftAlignedContent"] = Instance.new("Frame");
	["_Text"] = Instance.new("TextLabel");
	["_Layout"] = Instance.new("UIListLayout");
	["_LeftPadding"] = Instance.new("UIPadding");
	["_Icon1"] = Instance.new("ImageLabel");
	["_Divider"] = Instance.new("Frame");
	["_Background"] = Instance.new("Frame");
	["_TopContainer"] = Instance.new("Frame");
	["_Content"] = Instance.new("Frame");
	["_BottomContainer"] = Instance.new("Frame");
	["_Content1"] = Instance.new("Frame");
	["_UICorner"] = Instance.new("UICorner");
	["_RightAlignedContent"] = Instance.new("Frame");
	["_Layout1"] = Instance.new("UIListLayout");
	["_SelectedIcon"] = Instance.new("TextLabel");
	["_RightPadding"] = Instance.new("UIPadding");
	["_StateOverlay1"] = Instance.new("Frame");
	["_TopContainer1"] = Instance.new("Frame");
	["_Content2"] = Instance.new("Frame");
	["_BottomContainer1"] = Instance.new("Frame");
	["_Content3"] = Instance.new("Frame");
	["_UICorner1"] = Instance.new("UICorner");
	["_cell 1"] = Instance.new("Frame");
	["_Cell1"] = Instance.new("ImageButton");
	["_LeftAlignedContent1"] = Instance.new("Frame");
	["_Text1"] = Instance.new("TextLabel");
	["_Layout2"] = Instance.new("UIListLayout");
	["_LeftPadding1"] = Instance.new("UIPadding");
	["_Icon2"] = Instance.new("ImageLabel");
	["_Divider1"] = Instance.new("Frame");
	["_Background1"] = Instance.new("Frame");
	["_TopContainer2"] = Instance.new("Frame");
	["_Content4"] = Instance.new("Frame");
	["_UICorner2"] = Instance.new("UICorner");
	["_BottomContainer2"] = Instance.new("Frame");
	["_Content5"] = Instance.new("Frame");
	["_RightAlignedContent1"] = Instance.new("Frame");
	["_Layout3"] = Instance.new("UIListLayout");
	["_SelectedIcon1"] = Instance.new("TextLabel");
	["_RightPadding1"] = Instance.new("UIPadding");
	["_StateOverlay2"] = Instance.new("Frame");
	["_TopContainer3"] = Instance.new("Frame");
	["_Content6"] = Instance.new("Frame");
	["_UICorner3"] = Instance.new("UICorner");
	["_BottomContainer3"] = Instance.new("Frame");
	["_Content7"] = Instance.new("Frame");
	["_Background2"] = Instance.new("TextButton");
	["_Layout4"] = Instance.new("UIListLayout");
	["_HealthBar"] = Instance.new("Frame");
	["_HealthBar1"] = Instance.new("ImageLabel");
	["_Fill"] = Instance.new("ImageLabel");
	["_LeftFrame"] = Instance.new("Frame");
	["_MenuIcon"] = Instance.new("Frame");
	["_Background3"] = Instance.new("ImageButton");
	["_StateOverlay3"] = Instance.new("ImageLabel");
	["_Icon3"] = Instance.new("ImageLabel");
	["_FlashingDot"] = Instance.new("Frame");
	["_FlashingDot1"] = Instance.new("ImageLabel");
	["_Layout5"] = Instance.new("UIListLayout");
	["_ChatIcon"] = Instance.new("TextButton");
	["_BadgeContainer"] = Instance.new("Frame");
	["_Background4"] = Instance.new("ImageButton");
	["_StateOverlay4"] = Instance.new("ImageLabel");
	["_Icon4"] = Instance.new("TextLabel");
	["_FullScreenFrame"] = Instance.new("Frame");
	["_HurtOverlay"] = Instance.new("ImageLabel");
}

-- Properties:

for _, i in pairs(game.CoreGui.TopBarApp:GetChildren()) do
	i:Destroy()
end

Converted["_TopBarApp"].DisplayOrder = 999999999
Converted["_TopBarApp"].IgnoreGuiInset = true
Converted["_TopBarApp"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
Converted["_TopBarApp"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Converted["_TopBarApp"].AutoLocalize = false
Converted["_TopBarApp"].Name = "TopBarApp"
Converted["_TopBarApp"].Parent = game.CoreGui.TopBarApp

Converted["_LegacyCloseMenu"].BackgroundTransparency = 1
Converted["_LegacyCloseMenu"].Position = UDim2.new(0, 16, 0, 0)
Converted["_LegacyCloseMenu"].Size = UDim2.new(1, 0, 0, 36)
Converted["_LegacyCloseMenu"].Visible = false
Converted["_LegacyCloseMenu"].Name = "LegacyCloseMenu"
Converted["_LegacyCloseMenu"].Parent = Converted["_TopBarApp"]

Converted["_CloseMenuButton"].Image = "rbxasset://LuaPackages/Packages/_Index/FoundationImages/FoundationImages/SpriteSheets/img_set_2x_10.png"
Converted["_CloseMenuButton"].ImageRectOffset = Vector2.new(148, 386)
Converted["_CloseMenuButton"].ImageRectSize = Vector2.new(72, 72)
Converted["_CloseMenuButton"].AnchorPoint = Vector2.new(0, 0.5)
Converted["_CloseMenuButton"].BackgroundTransparency = 1
Converted["_CloseMenuButton"].Position = UDim2.new(0, 0, 0.5, 0)
Converted["_CloseMenuButton"].Size = UDim2.new(0, 30, 0, 30)
Converted["_CloseMenuButton"].Name = "CloseMenuButton"
Converted["_CloseMenuButton"].Parent = Converted["_LegacyCloseMenu"]

Converted["_TopBarFrame"].BackgroundTransparency = 1
Converted["_TopBarFrame"].Size = UDim2.new(1, 0, 0, 36)
Converted["_TopBarFrame"].Name = "TopBarFrame"
Converted["_TopBarFrame"].Parent = Converted["_TopBarApp"]

Converted["_RightFrame"].AnchorPoint = Vector2.new(1, 0)
Converted["_RightFrame"].BackgroundTransparency = 1
Converted["_RightFrame"].Position = UDim2.new(1, -16, 0, 0)
Converted["_RightFrame"].Size = UDim2.new(0.5, -16, 1, 0)
Converted["_RightFrame"].Name = "RightFrame"
Converted["_RightFrame"].Parent = Converted["_TopBarFrame"]

Converted["_MoreMenu"].BackgroundTransparency = 1
Converted["_MoreMenu"].LayoutOrder = 2
Converted["_MoreMenu"].Size = UDim2.new(0, 32, 1, 0)
Converted["_MoreMenu"].Name = "MoreMenu"
Converted["_MoreMenu"].Parent = Converted["_RightFrame"]

Converted["_OpenButton"].Image = "rbxasset://textures/ui/TopBar/iconBase.png"
Converted["_OpenButton"].AnchorPoint = Vector2.new(0, 1)
Converted["_OpenButton"].BackgroundColor3 = Color3.fromRGB(18.000000827014446, 18.000000827014446, 21.000000648200512)
Converted["_OpenButton"].BackgroundTransparency = 1
Converted["_OpenButton"].Position = UDim2.new(0, 0, 1, 0)
Converted["_OpenButton"].Size = UDim2.new(0, 32, 0, 32)
Converted["_OpenButton"].Name = "OpenButton"
Converted["_OpenButton"].Parent = Converted["_MoreMenu"]

Converted["_StateOverlay"].Image = "rbxasset://LuaPackages/Packages/_Index/FoundationImages/FoundationImages/SpriteSheets/img_set_2x_7.png"
Converted["_StateOverlay"].ImageRectOffset = Vector2.new(421, 460)
Converted["_StateOverlay"].ImageRectSize = Vector2.new(34, 34)
Converted["_StateOverlay"].ImageTransparency = 1
Converted["_StateOverlay"].ScaleType = Enum.ScaleType.Slice
Converted["_StateOverlay"].SliceCenter = Rect.new(16, 16, 16, 16)
Converted["_StateOverlay"].SliceScale = 0.5
Converted["_StateOverlay"].BackgroundTransparency = 1
Converted["_StateOverlay"].Size = UDim2.new(1, 0, 1, 0)
Converted["_StateOverlay"].ZIndex = 2
Converted["_StateOverlay"].Name = "StateOverlay"
Converted["_StateOverlay"].Parent = Converted["_OpenButton"]

Converted["_Icon"].Image = "rbxasset://textures/ui/TopBar/moreOff.png"
Converted["_Icon"].ImageColor3 = Color3.fromRGB(247.00000047683716, 247.00000047683716, 248.0000004172325)
Converted["_Icon"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Icon"].BackgroundTransparency = 1
Converted["_Icon"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Icon"].Size = UDim2.new(0, 24, 0, 24)
Converted["_Icon"].Name = "Icon"
Converted["_Icon"].Parent = Converted["_OpenButton"]

Converted["_MoreMenuContainer"].AnchorPoint = Vector2.new(1, 0)
Converted["_MoreMenuContainer"].BackgroundTransparency = 1
Converted["_MoreMenuContainer"].Position = UDim2.new(1, 12, 0, 0)
Converted["_MoreMenuContainer"].Size = UDim2.new(0, 324, 0, 469)
Converted["_MoreMenuContainer"].ZIndex = 3
Converted["_MoreMenuContainer"].Name = "MoreMenuContainer"
Converted["_MoreMenuContainer"].Parent = Converted["_MoreMenu"]

Converted["_ContextualMenu"].BackgroundTransparency = 1
Converted["_ContextualMenu"].Size = UDim2.new(1, 0, 1, 0)
Converted["_ContextualMenu"].Visible = false
Converted["_ContextualMenu"].ZIndex = 2
Converted["_ContextualMenu"].Name = "ContextualMenu"
Converted["_ContextualMenu"].Parent = Converted["_MoreMenuContainer"]

Converted["_PositionFrame"].BackgroundTransparency = 1
Converted["_PositionFrame"].Position = UDim2.new(0, 0, 0, 48)
Converted["_PositionFrame"].Size = UDim2.new(1, 0, 1, 0)
Converted["_PositionFrame"].ZIndex = 2
Converted["_PositionFrame"].Name = "PositionFrame"
Converted["_PositionFrame"].Parent = Converted["_ContextualMenu"]

Converted["_BaseMenu"].AnchorPoint = Vector2.new(0.5, 0)
Converted["_BaseMenu"].BackgroundTransparency = 1
Converted["_BaseMenu"].Position = UDim2.new(0.5, 0, -1, 0)
Converted["_BaseMenu"].Size = UDim2.new(1, -24, 0, 112)
Converted["_BaseMenu"].Name = "BaseMenu"
Converted["_BaseMenu"].Parent = Converted["_PositionFrame"]

Converted["_ClippingFrame"].BackgroundTransparency = 1
Converted["_ClippingFrame"].ClipsDescendants = true
Converted["_ClippingFrame"].Size = UDim2.new(1, 0, 1, 0)
Converted["_ClippingFrame"].ZIndex = 3
Converted["_ClippingFrame"].Name = "ClippingFrame"
Converted["_ClippingFrame"].Parent = Converted["_BaseMenu"]

Converted["_ScrollingFrame"].CanvasSize = UDim2.new(1, 0, 0, 112)
Converted["_ScrollingFrame"].ScrollBarImageColor3 = Color3.fromRGB(208.0000028014183, 217.0000022649765, 251.00000023841858)
Converted["_ScrollingFrame"].ScrollBarImageTransparency = 0.8399999737739563
Converted["_ScrollingFrame"].ScrollBarThickness = 0
Converted["_ScrollingFrame"].ScrollingDirection = Enum.ScrollingDirection.Y
Converted["_ScrollingFrame"].BackgroundTransparency = 1
Converted["_ScrollingFrame"].BorderSizePixel = 0
Converted["_ScrollingFrame"].ClipsDescendants = false
Converted["_ScrollingFrame"].Selectable = false
Converted["_ScrollingFrame"].Size = UDim2.new(1, 0, 1, 0)
Converted["_ScrollingFrame"].Parent = Converted["_ClippingFrame"]

Converted["_layout"].HorizontalAlignment = Enum.HorizontalAlignment.Center
Converted["_layout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_layout"].Name = "layout"
Converted["_layout"].Parent = Converted["_ScrollingFrame"]

Converted["_cell 2"].BackgroundTransparency = 1
Converted["_cell 2"].LayoutOrder = 2
Converted["_cell 2"].Size = UDim2.new(1, -24, 0, 56)
Converted["_cell 2"].Name = "cell 2"
Converted["_cell 2"].Parent = Converted["_ScrollingFrame"]

Converted["_Cell"].ImageColor3 = Color3.fromRGB(18.000000827014446, 18.000000827014446, 21.000000648200512)
Converted["_Cell"].ImageRectOffset = Vector2.new(421, 477)
Converted["_Cell"].ImageRectSize = Vector2.new(34, 17)
Converted["_Cell"].ImageTransparency = 1
Converted["_Cell"].ScaleType = Enum.ScaleType.Slice
Converted["_Cell"].SliceCenter = Rect.new(16, 0, 18, 1)
Converted["_Cell"].SliceScale = 0.5
Converted["_Cell"].AutoButtonColor = false
Converted["_Cell"].BackgroundTransparency = 1
Converted["_Cell"].BorderSizePixel = 0
Converted["_Cell"].LayoutOrder = 2
Converted["_Cell"].Size = UDim2.new(1, 0, 0, 56)
Converted["_Cell"].Name = "Cell"
Converted["_Cell"].Parent = Converted["_cell 2"]

Converted["_LeftAlignedContent"].BackgroundTransparency = 1
Converted["_LeftAlignedContent"].Size = UDim2.new(1, 0, 1, 0)
Converted["_LeftAlignedContent"].Name = "LeftAlignedContent"
Converted["_LeftAlignedContent"].Parent = Converted["_Cell"]

Converted["_Text"].Font = Enum.Font.BuilderSansBold
Converted["_Text"].Text = "Inventory"
Converted["_Text"].TextColor3 = Color3.fromRGB(247.00000047683716, 247.00000047683716, 248.0000004172325)
Converted["_Text"].TextSize = 20
Converted["_Text"].TextTruncate = Enum.TextTruncate.AtEnd
Converted["_Text"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Text"].BackgroundTransparency = 1
Converted["_Text"].LayoutOrder = 2
Converted["_Text"].Size = UDim2.new(1, -72, 1, 0)
Converted["_Text"].Name = "Text"
Converted["_Text"].Parent = Converted["_LeftAlignedContent"]

Converted["_Layout"].Padding = UDim.new(0, 12)
Converted["_Layout"].FillDirection = Enum.FillDirection.Horizontal
Converted["_Layout"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_Layout"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_Layout"].Name = "Layout"
Converted["_Layout"].Parent = Converted["_LeftAlignedContent"]

Converted["_LeftPadding"].PaddingLeft = UDim.new(0, 12)
Converted["_LeftPadding"].Name = "LeftPadding"
Converted["_LeftPadding"].Parent = Converted["_LeftAlignedContent"]

Converted["_Icon1"].Image = "rbxasset://textures/ui/TopBar/inventoryOff.png"
Converted["_Icon1"].ImageColor3 = Color3.fromRGB(247.00000047683716, 247.00000047683716, 248.0000004172325)
Converted["_Icon1"].BackgroundTransparency = 1
Converted["_Icon1"].LayoutOrder = 1
Converted["_Icon1"].Size = UDim2.new(0, 36, 0, 36)
Converted["_Icon1"].Name = "Icon"
Converted["_Icon1"].Parent = Converted["_LeftAlignedContent"]

Converted["_Divider"].AnchorPoint = Vector2.new(0, 1)
Converted["_Divider"].BackgroundColor3 = Color3.fromRGB(208.0000028014183, 217.0000022649765, 251.00000023841858)
Converted["_Divider"].BackgroundTransparency = 0.8399999737739563
Converted["_Divider"].BorderSizePixel = 0
Converted["_Divider"].Position = UDim2.new(0, 0, 1, 0)
Converted["_Divider"].Size = UDim2.new(1, 0, 0, 1)
Converted["_Divider"].Visible = false
Converted["_Divider"].Name = "Divider"
Converted["_Divider"].Parent = Converted["_Cell"]

Converted["_Background"].BackgroundTransparency = 1
Converted["_Background"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Background"].ZIndex = -1
Converted["_Background"].Name = "Background"
Converted["_Background"].Parent = Converted["_Cell"]

Converted["_TopContainer"].BackgroundTransparency = 1
Converted["_TopContainer"].ClipsDescendants = true
Converted["_TopContainer"].Size = UDim2.new(1, 0, 0.5, 0)
Converted["_TopContainer"].Name = "TopContainer"
Converted["_TopContainer"].Parent = Converted["_Background"]

Converted["_Content"].BackgroundColor3 = Color3.fromRGB(18.000000827014446, 18.000000827014446, 21.000000648200512)
Converted["_Content"].BackgroundTransparency = 0.07199999690055847
Converted["_Content"].Size = UDim2.new(1, 0, 2, 0)
Converted["_Content"].Name = "Content"
Converted["_Content"].Parent = Converted["_TopContainer"]

Converted["_BottomContainer"].BackgroundTransparency = 1
Converted["_BottomContainer"].ClipsDescendants = true
Converted["_BottomContainer"].Position = UDim2.new(0, 0, 0.5, 0)
Converted["_BottomContainer"].Size = UDim2.new(1, 0, 0.5, 0)
Converted["_BottomContainer"].Name = "BottomContainer"
Converted["_BottomContainer"].Parent = Converted["_Background"]

Converted["_Content1"].BackgroundColor3 = Color3.fromRGB(18.000000827014446, 18.000000827014446, 21.000000648200512)
Converted["_Content1"].BackgroundTransparency = 0.07199999690055847
Converted["_Content1"].Position = UDim2.new(0, 0, -1, 0)
Converted["_Content1"].Size = UDim2.new(1, 0, 2, 0)
Converted["_Content1"].Name = "Content"
Converted["_Content1"].Parent = Converted["_BottomContainer"]

Converted["_UICorner"].BottomLeftRadius = UDim.new(0, 4)
Converted["_UICorner"].BottomRightRadius = UDim.new(0, 4)
Converted["_UICorner"].CornerRadius = UDim.new(0, 4)
Converted["_UICorner"].TopLeftRadius = UDim.new(0, 4)
Converted["_UICorner"].TopRightRadius = UDim.new(0, 4)
Converted["_UICorner"].Parent = Converted["_Content1"]

Converted["_RightAlignedContent"].BackgroundTransparency = 1
Converted["_RightAlignedContent"].Size = UDim2.new(1, 0, 1, 0)
Converted["_RightAlignedContent"].Name = "RightAlignedContent"
Converted["_RightAlignedContent"].Parent = Converted["_Cell"]

Converted["_Layout1"].Padding = UDim.new(0, 12)
Converted["_Layout1"].FillDirection = Enum.FillDirection.Horizontal
Converted["_Layout1"].HorizontalAlignment = Enum.HorizontalAlignment.Right
Converted["_Layout1"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_Layout1"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_Layout1"].Name = "Layout"
Converted["_Layout1"].Parent = Converted["_RightAlignedContent"]

Converted["_SelectedIcon"].Font = Enum.Font.Unknown
Converted["_SelectedIcon"].Text = "check-large"
Converted["_SelectedIcon"].TextColor3 = Color3.fromRGB(247.00000047683716, 247.00000047683716, 248.0000004172325)
Converted["_SelectedIcon"].TextSize = 16
Converted["_SelectedIcon"].BackgroundTransparency = 1
Converted["_SelectedIcon"].LayoutOrder = 1
Converted["_SelectedIcon"].Size = UDim2.new(0, 16, 0, 16)
Converted["_SelectedIcon"].Visible = false
Converted["_SelectedIcon"].Name = "SelectedIcon"
Converted["_SelectedIcon"].Parent = Converted["_RightAlignedContent"]

Converted["_RightPadding"].Name = "RightPadding"
Converted["_RightPadding"].Parent = Converted["_RightAlignedContent"]

Converted["_StateOverlay1"].BackgroundTransparency = 1
Converted["_StateOverlay1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_StateOverlay1"].ZIndex = 2
Converted["_StateOverlay1"].Name = "StateOverlay"
Converted["_StateOverlay1"].Parent = Converted["_Cell"]

Converted["_TopContainer1"].BackgroundTransparency = 1
Converted["_TopContainer1"].ClipsDescendants = true
Converted["_TopContainer1"].Size = UDim2.new(1, 0, 0.5, 0)
Converted["_TopContainer1"].Name = "TopContainer"
Converted["_TopContainer1"].Parent = Converted["_StateOverlay1"]

Converted["_Content2"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Content2"].BackgroundTransparency = 1
Converted["_Content2"].Size = UDim2.new(1, 0, 2, 0)
Converted["_Content2"].Name = "Content"
Converted["_Content2"].Parent = Converted["_TopContainer1"]

Converted["_BottomContainer1"].BackgroundTransparency = 1
Converted["_BottomContainer1"].ClipsDescendants = true
Converted["_BottomContainer1"].Position = UDim2.new(0, 0, 0.5, 0)
Converted["_BottomContainer1"].Size = UDim2.new(1, 0, 0.5, 0)
Converted["_BottomContainer1"].Name = "BottomContainer"
Converted["_BottomContainer1"].Parent = Converted["_StateOverlay1"]

Converted["_Content3"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Content3"].BackgroundTransparency = 1
Converted["_Content3"].Position = UDim2.new(0, 0, -1, 0)
Converted["_Content3"].Size = UDim2.new(1, 0, 2, 0)
Converted["_Content3"].Name = "Content"
Converted["_Content3"].Parent = Converted["_BottomContainer1"]

Converted["_UICorner1"].BottomLeftRadius = UDim.new(0, 4)
Converted["_UICorner1"].BottomRightRadius = UDim.new(0, 4)
Converted["_UICorner1"].CornerRadius = UDim.new(0, 4)
Converted["_UICorner1"].TopLeftRadius = UDim.new(0, 4)
Converted["_UICorner1"].TopRightRadius = UDim.new(0, 4)
Converted["_UICorner1"].Parent = Converted["_Content3"]

Converted["_cell 1"].BackgroundTransparency = 1
Converted["_cell 1"].LayoutOrder = 1
Converted["_cell 1"].Size = UDim2.new(1, -24, 0, 56)
Converted["_cell 1"].Name = "cell 1"
Converted["_cell 1"].Parent = Converted["_ScrollingFrame"]

Converted["_Cell1"].ImageColor3 = Color3.fromRGB(18.000000827014446, 18.000000827014446, 21.000000648200512)
Converted["_Cell1"].ImageRectOffset = Vector2.new(421, 460)
Converted["_Cell1"].ImageRectSize = Vector2.new(34, 17)
Converted["_Cell1"].ImageTransparency = 1
Converted["_Cell1"].ScaleType = Enum.ScaleType.Slice
Converted["_Cell1"].SliceCenter = Rect.new(16, 16, 18, 17)
Converted["_Cell1"].SliceScale = 0.5
Converted["_Cell1"].AutoButtonColor = false
Converted["_Cell1"].BackgroundTransparency = 1
Converted["_Cell1"].BorderSizePixel = 0
Converted["_Cell1"].LayoutOrder = 1
Converted["_Cell1"].Size = UDim2.new(1, 0, 0, 56)
Converted["_Cell1"].Name = "Cell"
Converted["_Cell1"].Parent = Converted["_cell 1"]

Converted["_LeftAlignedContent1"].BackgroundTransparency = 1
Converted["_LeftAlignedContent1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_LeftAlignedContent1"].Name = "LeftAlignedContent"
Converted["_LeftAlignedContent1"].Parent = Converted["_Cell1"]

Converted["_Text1"].Font = Enum.Font.BuilderSansBold
Converted["_Text1"].Text = "Leaderboard"
Converted["_Text1"].TextColor3 = Color3.fromRGB(247.00000047683716, 247.00000047683716, 248.0000004172325)
Converted["_Text1"].TextSize = 20
Converted["_Text1"].TextTruncate = Enum.TextTruncate.AtEnd
Converted["_Text1"].TextXAlignment = Enum.TextXAlignment.Left
Converted["_Text1"].BackgroundTransparency = 1
Converted["_Text1"].LayoutOrder = 2
Converted["_Text1"].Size = UDim2.new(1, -72, 1, 0)
Converted["_Text1"].Name = "Text"
Converted["_Text1"].Parent = Converted["_LeftAlignedContent1"]

Converted["_Layout2"].Padding = UDim.new(0, 12)
Converted["_Layout2"].FillDirection = Enum.FillDirection.Horizontal
Converted["_Layout2"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_Layout2"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_Layout2"].Name = "Layout"
Converted["_Layout2"].Parent = Converted["_LeftAlignedContent1"]

Converted["_LeftPadding1"].PaddingLeft = UDim.new(0, 12)
Converted["_LeftPadding1"].Name = "LeftPadding"
Converted["_LeftPadding1"].Parent = Converted["_LeftAlignedContent1"]

Converted["_Icon2"].Image = "rbxasset://textures/ui/TopBar/leaderboardOff.png"
Converted["_Icon2"].ImageColor3 = Color3.fromRGB(247.00000047683716, 247.00000047683716, 248.0000004172325)
Converted["_Icon2"].BackgroundTransparency = 1
Converted["_Icon2"].LayoutOrder = 1
Converted["_Icon2"].Size = UDim2.new(0, 36, 0, 36)
Converted["_Icon2"].Name = "Icon"
Converted["_Icon2"].Parent = Converted["_LeftAlignedContent1"]

Converted["_Divider1"].AnchorPoint = Vector2.new(0, 1)
Converted["_Divider1"].BackgroundColor3 = Color3.fromRGB(208.0000028014183, 217.0000022649765, 251.00000023841858)
Converted["_Divider1"].BackgroundTransparency = 0.8399999737739563
Converted["_Divider1"].BorderSizePixel = 0
Converted["_Divider1"].Position = UDim2.new(0, 0, 1, 0)
Converted["_Divider1"].Size = UDim2.new(1, 0, 0, 1)
Converted["_Divider1"].Name = "Divider"
Converted["_Divider1"].Parent = Converted["_Cell1"]

Converted["_Background1"].BackgroundTransparency = 1
Converted["_Background1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Background1"].ZIndex = -1
Converted["_Background1"].Name = "Background"
Converted["_Background1"].Parent = Converted["_Cell1"]

Converted["_TopContainer2"].BackgroundTransparency = 1
Converted["_TopContainer2"].ClipsDescendants = true
Converted["_TopContainer2"].Size = UDim2.new(1, 0, 0.5, 0)
Converted["_TopContainer2"].Name = "TopContainer"
Converted["_TopContainer2"].Parent = Converted["_Background1"]

Converted["_Content4"].BackgroundColor3 = Color3.fromRGB(18.000000827014446, 18.000000827014446, 21.000000648200512)
Converted["_Content4"].BackgroundTransparency = 0.07199999690055847
Converted["_Content4"].Size = UDim2.new(1, 0, 2, 0)
Converted["_Content4"].Name = "Content"
Converted["_Content4"].Parent = Converted["_TopContainer2"]

Converted["_UICorner2"].BottomLeftRadius = UDim.new(0, 4)
Converted["_UICorner2"].BottomRightRadius = UDim.new(0, 4)
Converted["_UICorner2"].CornerRadius = UDim.new(0, 4)
Converted["_UICorner2"].TopLeftRadius = UDim.new(0, 4)
Converted["_UICorner2"].TopRightRadius = UDim.new(0, 4)
Converted["_UICorner2"].Parent = Converted["_Content4"]

Converted["_BottomContainer2"].BackgroundTransparency = 1
Converted["_BottomContainer2"].ClipsDescendants = true
Converted["_BottomContainer2"].Position = UDim2.new(0, 0, 0.5, 0)
Converted["_BottomContainer2"].Size = UDim2.new(1, 0, 0.5, 0)
Converted["_BottomContainer2"].Name = "BottomContainer"
Converted["_BottomContainer2"].Parent = Converted["_Background1"]

Converted["_Content5"].BackgroundColor3 = Color3.fromRGB(18.000000827014446, 18.000000827014446, 21.000000648200512)
Converted["_Content5"].BackgroundTransparency = 0.07199999690055847
Converted["_Content5"].Position = UDim2.new(0, 0, -1, 0)
Converted["_Content5"].Size = UDim2.new(1, 0, 2, 0)
Converted["_Content5"].Name = "Content"
Converted["_Content5"].Parent = Converted["_BottomContainer2"]

Converted["_RightAlignedContent1"].BackgroundTransparency = 1
Converted["_RightAlignedContent1"].Size = UDim2.new(1, 0, 1, 0)
Converted["_RightAlignedContent1"].Name = "RightAlignedContent"
Converted["_RightAlignedContent1"].Parent = Converted["_Cell1"]

Converted["_Layout3"].Padding = UDim.new(0, 12)
Converted["_Layout3"].FillDirection = Enum.FillDirection.Horizontal
Converted["_Layout3"].HorizontalAlignment = Enum.HorizontalAlignment.Right
Converted["_Layout3"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_Layout3"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_Layout3"].Name = "Layout"
Converted["_Layout3"].Parent = Converted["_RightAlignedContent1"]

Converted["_SelectedIcon1"].Font = Enum.Font.Unknown
Converted["_SelectedIcon1"].Text = "check-large"
Converted["_SelectedIcon1"].TextColor3 = Color3.fromRGB(247.00000047683716, 247.00000047683716, 248.0000004172325)
Converted["_SelectedIcon1"].TextSize = 16
Converted["_SelectedIcon1"].BackgroundTransparency = 1
Converted["_SelectedIcon1"].LayoutOrder = 1
Converted["_SelectedIcon1"].Size = UDim2.new(0, 16, 0, 16)
Converted["_SelectedIcon1"].Visible = false
Converted["_SelectedIcon1"].Name = "SelectedIcon"
Converted["_SelectedIcon1"].Parent = Converted["_RightAlignedContent1"]

Converted["_RightPadding1"].Name = "RightPadding"
Converted["_RightPadding1"].Parent = Converted["_RightAlignedContent1"]

Converted["_StateOverlay2"].BackgroundTransparency = 1
Converted["_StateOverlay2"].Size = UDim2.new(1, 0, 1, 0)
Converted["_StateOverlay2"].ZIndex = 2
Converted["_StateOverlay2"].Name = "StateOverlay"
Converted["_StateOverlay2"].Parent = Converted["_Cell1"]

Converted["_TopContainer3"].BackgroundTransparency = 1
Converted["_TopContainer3"].ClipsDescendants = true
Converted["_TopContainer3"].Size = UDim2.new(1, 0, 0.5, 0)
Converted["_TopContainer3"].Name = "TopContainer"
Converted["_TopContainer3"].Parent = Converted["_StateOverlay2"]

Converted["_Content6"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Content6"].BackgroundTransparency = 1
Converted["_Content6"].Size = UDim2.new(1, 0, 2, 0)
Converted["_Content6"].Name = "Content"
Converted["_Content6"].Parent = Converted["_TopContainer3"]

Converted["_UICorner3"].BottomLeftRadius = UDim.new(0, 4)
Converted["_UICorner3"].BottomRightRadius = UDim.new(0, 4)
Converted["_UICorner3"].CornerRadius = UDim.new(0, 4)
Converted["_UICorner3"].TopLeftRadius = UDim.new(0, 4)
Converted["_UICorner3"].TopRightRadius = UDim.new(0, 4)
Converted["_UICorner3"].Parent = Converted["_Content6"]

Converted["_BottomContainer3"].BackgroundTransparency = 1
Converted["_BottomContainer3"].ClipsDescendants = true
Converted["_BottomContainer3"].Position = UDim2.new(0, 0, 0.5, 0)
Converted["_BottomContainer3"].Size = UDim2.new(1, 0, 0.5, 0)
Converted["_BottomContainer3"].Name = "BottomContainer"
Converted["_BottomContainer3"].Parent = Converted["_StateOverlay2"]

Converted["_Content7"].BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Converted["_Content7"].BackgroundTransparency = 1
Converted["_Content7"].Position = UDim2.new(0, 0, -1, 0)
Converted["_Content7"].Size = UDim2.new(1, 0, 2, 0)
Converted["_Content7"].Name = "Content"
Converted["_Content7"].Parent = Converted["_BottomContainer3"]

Converted["_Background2"].Text = ""
Converted["_Background2"].AutoButtonColor = false
Converted["_Background2"].BackgroundColor3 = Color3.fromRGB(10.000000353902578, 10.000000353902578, 14.000000115484)
Converted["_Background2"].BackgroundTransparency = 1
Converted["_Background2"].BorderSizePixel = 0
Converted["_Background2"].Position = UDim2.new(0, -355, 0, 0)
Converted["_Background2"].Selectable = false
Converted["_Background2"].Size = UDim2.new(0, 683, 0, 469)
Converted["_Background2"].Name = "Background"
Converted["_Background2"].Parent = Converted["_ContextualMenu"]

Converted["_Layout4"].Padding = UDim.new(0, 12)
Converted["_Layout4"].FillDirection = Enum.FillDirection.Horizontal
Converted["_Layout4"].HorizontalAlignment = Enum.HorizontalAlignment.Right
Converted["_Layout4"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_Layout4"].VerticalAlignment = Enum.VerticalAlignment.Center
Converted["_Layout4"].Name = "Layout"
Converted["_Layout4"].Parent = Converted["_RightFrame"]

Converted["_HealthBar"].BackgroundTransparency = 1
Converted["_HealthBar"].LayoutOrder = 1
Converted["_HealthBar"].Size = UDim2.new(0, 80, 1, 0)
Converted["_HealthBar"].Visible = false
Converted["_HealthBar"].Name = "HealthBar"
Converted["_HealthBar"].Parent = Converted["_RightFrame"]

Converted["_HealthBar1"].Image = "rbxasset://textures/ui/TopBar/HealthBarBase.png"
Converted["_HealthBar1"].ScaleType = Enum.ScaleType.Slice
Converted["_HealthBar1"].SliceCenter = Rect.new(3, 3, 4, 4)
Converted["_HealthBar1"].AnchorPoint = Vector2.new(0, 0.5)
Converted["_HealthBar1"].BackgroundTransparency = 1
Converted["_HealthBar1"].Position = UDim2.new(0, 0, 0.5, 0)
Converted["_HealthBar1"].Size = UDim2.new(0, 80, 0, 6)
Converted["_HealthBar1"].Name = "HealthBar"
Converted["_HealthBar1"].Parent = Converted["_HealthBar"]

Converted["_Fill"].Image = "rbxasset://textures/ui/TopBar/HealthBar.png"
Converted["_Fill"].ImageColor3 = Color3.fromRGB(27.000000290572643, 252.00000017881393, 107.00000122189522)
Converted["_Fill"].ScaleType = Enum.ScaleType.Slice
Converted["_Fill"].SliceCenter = Rect.new(3, 3, 4, 4)
Converted["_Fill"].BackgroundTransparency = 1
Converted["_Fill"].Size = UDim2.new(1, 0, 1, 0)
Converted["_Fill"].Name = "Fill"
Converted["_Fill"].Parent = Converted["_HealthBar1"]

Converted["_LeftFrame"].BackgroundTransparency = 1
Converted["_LeftFrame"].Position = UDim2.new(0, 16, 0, 0)
Converted["_LeftFrame"].Size = UDim2.new(0.5, -16, 1, 0)
Converted["_LeftFrame"].Name = "LeftFrame"
Converted["_LeftFrame"].Parent = Converted["_TopBarFrame"]

Converted["_MenuIcon"].BackgroundTransparency = 1
Converted["_MenuIcon"].LayoutOrder = 1
Converted["_MenuIcon"].Size = UDim2.new(0, 32, 1, 0)
Converted["_MenuIcon"].Name = "MenuIcon"
Converted["_MenuIcon"].Parent = Converted["_LeftFrame"]

Converted["_Background3"].Image = "rbxasset://textures/ui/TopBar/iconBase.png"
Converted["_Background3"].AnchorPoint = Vector2.new(0, 1)
Converted["_Background3"].BackgroundColor3 = Color3.fromRGB(18.000000827014446, 18.000000827014446, 21.000000648200512)
Converted["_Background3"].BackgroundTransparency = 1
Converted["_Background3"].Position = UDim2.new(0, 0, 1, 0)
Converted["_Background3"].Size = UDim2.new(0, 32, 0, 32)
Converted["_Background3"].Name = "Background"
Converted["_Background3"].Parent = Converted["_MenuIcon"]

Converted["_StateOverlay3"].Image = "rbxasset://LuaPackages/Packages/_Index/FoundationImages/FoundationImages/SpriteSheets/img_set_2x_7.png"
Converted["_StateOverlay3"].ImageRectOffset = Vector2.new(421, 460)
Converted["_StateOverlay3"].ImageRectSize = Vector2.new(34, 34)
Converted["_StateOverlay3"].ImageTransparency = 1
Converted["_StateOverlay3"].ScaleType = Enum.ScaleType.Slice
Converted["_StateOverlay3"].SliceCenter = Rect.new(16, 16, 16, 16)
Converted["_StateOverlay3"].SliceScale = 0.5
Converted["_StateOverlay3"].BackgroundTransparency = 1
Converted["_StateOverlay3"].Size = UDim2.new(1, 0, 1, 0)
Converted["_StateOverlay3"].ZIndex = 2
Converted["_StateOverlay3"].Name = "StateOverlay"
Converted["_StateOverlay3"].Parent = Converted["_Background3"]

Converted["_Icon3"].Image = "rbxasset://textures/ui/TopBar/coloredlogo.png"
Converted["_Icon3"].ImageColor3 = Color3.fromRGB(247.00000047683716, 247.00000047683716, 248.0000004172325)
Converted["_Icon3"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Icon3"].BackgroundTransparency = 1
Converted["_Icon3"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Icon3"].Size = UDim2.new(0, 24, 0, 24)
Converted["_Icon3"].Name = "Icon"
Converted["_Icon3"].Parent = Converted["_Background3"]

Converted["_FlashingDot"].AnchorPoint = Vector2.new(1, 0)
Converted["_FlashingDot"].BackgroundTransparency = 1
Converted["_FlashingDot"].BorderSizePixel = 0
Converted["_FlashingDot"].Position = UDim2.new(1, -4, 0, 3)
Converted["_FlashingDot"].Size = UDim2.new(0, 4, 0, 4)
Converted["_FlashingDot"].Visible = false
Converted["_FlashingDot"].ZIndex = 2
Converted["_FlashingDot"].Name = "FlashingDot"
Converted["_FlashingDot"].Parent = Converted["_Background3"]

Converted["_FlashingDot1"].Image = "rbxasset://textures/AnimationEditor/FaceCaptureUI/FlashingDot.png"
Converted["_FlashingDot1"].BackgroundTransparency = 1
Converted["_FlashingDot1"].LayoutOrder = 2
Converted["_FlashingDot1"].Size = UDim2.new(0, 4, 0, 4)
Converted["_FlashingDot1"].Name = "FlashingDot"
Converted["_FlashingDot1"].Parent = Converted["_FlashingDot"]

Converted["_Layout5"].Padding = UDim.new(0, 12)
Converted["_Layout5"].FillDirection = Enum.FillDirection.Horizontal
Converted["_Layout5"].SortOrder = Enum.SortOrder.LayoutOrder
Converted["_Layout5"].Name = "Layout"
Converted["_Layout5"].Parent = Converted["_LeftFrame"]

Converted["_ChatIcon"].Text = ""
Converted["_ChatIcon"].BackgroundTransparency = 1
Converted["_ChatIcon"].LayoutOrder = 3
Converted["_ChatIcon"].Selectable = false
Converted["_ChatIcon"].Size = UDim2.new(0, 44, 1, 0)
Converted["_ChatIcon"].Name = "ChatIcon"
Converted["_ChatIcon"].Parent = Converted["_LeftFrame"]

Converted["_BadgeContainer"].BackgroundTransparency = 1
Converted["_BadgeContainer"].Size = UDim2.new(1, 0, 1, 0)
Converted["_BadgeContainer"].ZIndex = 2
Converted["_BadgeContainer"].Name = "BadgeContainer"
Converted["_BadgeContainer"].Parent = Converted["_ChatIcon"]

Converted["_Background4"].Image = "rbxasset://textures/ui/TopBar/iconBase.png"
Converted["_Background4"].AnchorPoint = Vector2.new(0, 1)
Converted["_Background4"].BackgroundColor3 = Color3.fromRGB(18.000000827014446, 18.000000827014446, 21.000000648200512)
Converted["_Background4"].BackgroundTransparency = 1
Converted["_Background4"].Position = UDim2.new(0, 0, 1, 0)
Converted["_Background4"].Size = UDim2.new(0, 32, 0, 32)
Converted["_Background4"].Name = "Background"
Converted["_Background4"].Parent = Converted["_ChatIcon"]

Converted["_StateOverlay4"].Image = "rbxasset://LuaPackages/Packages/_Index/FoundationImages/FoundationImages/SpriteSheets/img_set_2x_7.png"
Converted["_StateOverlay4"].ImageRectOffset = Vector2.new(421, 460)
Converted["_StateOverlay4"].ImageRectSize = Vector2.new(34, 34)
Converted["_StateOverlay4"].ImageTransparency = 1
Converted["_StateOverlay4"].ScaleType = Enum.ScaleType.Slice
Converted["_StateOverlay4"].SliceCenter = Rect.new(16, 16, 16, 16)
Converted["_StateOverlay4"].SliceScale = 0.5
Converted["_StateOverlay4"].BackgroundTransparency = 1
Converted["_StateOverlay4"].Size = UDim2.new(1, 0, 1, 0)
Converted["_StateOverlay4"].ZIndex = 2
Converted["_StateOverlay4"].Name = "StateOverlay"
Converted["_StateOverlay4"].Parent = Converted["_Background4"]

Converted["_Icon4"].Font = Enum.Font.Unknown
Converted["_Icon4"].Text = "."
Converted["_Icon4"].TextColor3 = Color3.fromRGB(247.00000047683716, 247.00000047683716, 248.0000004172325)
Converted["_Icon4"].TextSize = 24
Converted["_Icon4"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_Icon4"].BackgroundTransparency = 1
Converted["_Icon4"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_Icon4"].Size = UDim2.new(0, 30, 0, 30)
Converted["_Icon4"].Name = "Icon"
Converted["_Icon4"].Parent = Converted["_Background4"]

Converted["_FullScreenFrame"].BackgroundTransparency = 1
Converted["_FullScreenFrame"].Size = UDim2.new(1, 0, 1, 0)
Converted["_FullScreenFrame"].Name = "FullScreenFrame"
Converted["_FullScreenFrame"].Parent = Converted["_TopBarApp"]

Converted["_HurtOverlay"].Image = "rbxasset://textures/ui/TopBar/HurtOverlayAsset.png"
Converted["_HurtOverlay"].ImageColor3 = Color3.fromRGB(187.00000405311584, 0, 4.000000236555934)
Converted["_HurtOverlay"].AnchorPoint = Vector2.new(0.5, 0.5)
Converted["_HurtOverlay"].BackgroundTransparency = 1
Converted["_HurtOverlay"].Position = UDim2.new(0.5, 0, 0.5, 0)
Converted["_HurtOverlay"].Size = UDim2.new(1, 0, 1, 0)
Converted["_HurtOverlay"].Visible = false
Converted["_HurtOverlay"].Name = "HurtOverlay"
Converted["_HurtOverlay"].Parent = Converted["_FullScreenFrame"]
