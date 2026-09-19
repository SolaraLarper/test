local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer
local character = nil
if lp.Character then
    character = lp.Character
end
lp.CharacterAdded:Connect(function(char)
    character = char
end)
local Camera = game.Workspace.CurrentCamera

local settings = {}
settings.box = {}
    settings.box.transparency = 1
    settings.box.color = Color3.new(1,1,1)
    settings.box.thickness = 1
settings.boxoutline = {}
    settings.boxoutline.transparency = 1
    settings.boxoutline.color = Color3.new(0,0,0)
    settings.boxoutline.thickness = 1 -- size of outline on either side of box
settings.healthbar = {}
    settings.healthbar.healthcolor = Color3.new(0,1,0)
    settings.healthbar.backgroundcolor = Color3.new(0,0,0)
    settings.healthbar.borderthickness = 1 -- pixels on either side
    settings.healthbar.width = 1 -- pixels
    settings.healthbar.gap = 3 -- pixels
settings.text = {}
    settings.text.spacing = 2 -- pixels
    settings.text.priority = {}
    settings.text.priority.top = {}
        settings.text.priority.top.name = 1
    settings.text.priority.bottom = {}
        settings.text.priority.bottom.distance = 1
        settings.text.priority.bottom.weapon = 2
settings.name = {}
    settings.name.top = true
    settings.name.transparency = 1
    settings.name.color = Color3.new(1,1,1)
    settings.name.size = 11
    settings.name.outline = true
    settings.name.outlinecolor = Color3.new(0,0,0)
settings.distance = {}
    settings.distance.top = false
    settings.distance.transparency = 1
    settings.distance.color = Color3.new(1,1,1)
    settings.distance.size = 11
    settings.distance.outline = true
    settings.distance.outlinecolor = Color3.new(0,0,0)
settings.weapon = {}
    settings.weapon.top = false
    settings.weapon.transparency = 1
    settings.weapon.color = Color3.new(1,1,1)
    settings.weapon.size = 11
    settings.weapon.outline = true
    settings.weapon.outlinecolor = Color3.new(0,0,0)

local toggles = {}
    toggles.healthcheck = true
toggles.box = true
toggles.boxoutline = true
toggles.name = true
toggles.distance = true
toggles.healthbar = true
toggles.healthbarbackground = true
toggles.weapon = true

local whitelistedweapons = {"Salvaged AK47"}

local entities = {} -- esp entities
entities.box = {}
entities.boxoutline = {}
entities.healthbar = {}
entities.healthbarbackground = {}
entities.text = {} -- table per id, table.top & table.bottom, both will have multiple text entities within them, first is closest to the box, last is furthest
    entities.text.top = {}
    entities.text.bottom = {}

local valid = {}
local charconnections = {}

local mins = {}
local maxes = {}
local onscreens = {}

local Math = {}
Math.calculateExtent = function(cf, size)
    local r = cf.RightVector
    local u = cf.UpVector
    local b = cf.LookVector

    local hx = size.X * 0.5
    local hy = size.Y * 0.5
    local hz = size.Z * 0.5

    return Vector3.new(
        math.abs(r.X)*hx + math.abs(u.X)*hy + math.abs(b.X)*hz,
        math.abs(r.Y)*hx + math.abs(u.Y)*hy + math.abs(b.Y)*hz,
        math.abs(r.Z)*hx + math.abs(u.Z)*hy + math.abs(b.Z)*hz
    )
end

Math.minMaxFromExtent = function(cf, extent)
    local c = cf.Position
    return c - extent, c + extent
end

Math.getboundingbox = function(instances: {BasePart}, orientation: CFrame?)
    if not orientation then
        orientation = CFrame.new()
    end
    
    local j = 0

    repeat
        j += 1
    
        if instances[j] == nil then
            return CFrame.new(), Vector3.new()
        end
    
    until instances[j]:IsA("BasePart")

    orientation = CFrame.new(instances[j].Position) * orientation
    local inversedOrientation = orientation:Inverse()
    local localCF = inversedOrientation * instances[j].CFrame
    local extent = Math.calculateExtent(localCF, instances[j].Size)
    local min, max = Math.minMaxFromExtent(localCF, extent)

    for i = j + 1, #instances do
        local part = instances[i]
        if part:IsA("BasePart") then
            local cf = inversedOrientation * part.CFrame
            local e = Math.calculateExtent(cf, part.Size)
            local lmin, lmax = Math.minMaxFromExtent(cf, e)

            min = Vector3.new(
                math.min(min.X, lmin.X),
                math.min(min.Y, lmin.Y),
                math.min(min.Z, lmin.Z)
            )

            max = Vector3.new(
                math.max(max.X, lmax.X),
                math.max(max.Y, lmax.Y),
                math.max(max.Z, lmax.Z)
            )
        end
    end
    
    local centerLocal = (min + max) * 0.5
    local size = max - min
    local centerWorld = orientation * CFrame.new(centerLocal)

    return centerWorld, size
end

Math.getcorners = function(char)
    local centerWorld, size = Math.getboundingbox(char:GetChildren())

    local half = size/2
    local pos = centerWorld.Position

    local minV = pos - half
    local maxV = pos + half

    local minScreen, minOnscreen = Camera:WorldToViewportPoint(minV)
    local maxScreen, maxOnscreen = Camera:WorldToViewportPoint(maxV)

    local onscreen = minOnscreen or maxOnscreen
    local min = {
        x = math.min(minScreen.X, maxScreen.X),
        y = math.min(minScreen.Y, maxScreen.Y)
    }

    local max = {
        x = math.max(minScreen.X, maxScreen.X),
        y = math.max(minScreen.Y, maxScreen.Y)
    }

    return min, max, onscreen
end


local util = {}
util.watchCharacter = function(plr, id)
    if plr == lp then
        return
    end

    charconnections[id] = plr.CharacterAdded:Connect(function(char)
        valid[id] = char
    end)
end


local check = {}
check.valid = function(plr) -- handles all player checks to see if they are a valid candidate for esp
    if (not plr) or (not plr.Parent) then
        return false
    end 

    if plr == lp then
        return false
    end

    local char = plr.Character

    if not char then
        return false
    end

    if toggles.healthcheck then
        local hum = char:FindFirstChild("Humanoid")
        if not hum then
            return false
        end

        if not (hum.Health > 0) then
            return false
        end
    end

    return true
end

check.exists = function(Type, id, istext) -- checks if id under esp Type exists
    if not istext then
        return entities[Type][id]
    else
        local place = 'top'
        if settings[Type].top == false then
            place = 'bottom'
        end

        return entities.text[place][Type][id]
    end
end


local create = {}
create.box = function(id, min, max, onscreen) -- creates a new box
    local outline = Drawing.new('Square')
    outline.Visible = onscreen
    outline.Transparency = settings.boxoutline.transparency
    outline.Color = settings.boxoutline.color
    outline.Thickness = settings.box.thickness + settings.boxoutline.thickness * 2

    local box = Drawing.new('Square')
    box.Visible = onscreen
    box.Transparency = settings.box.transparency
    box.Color = settings.box.color
    box.Thickness = settings.box.thickness

    if onscreen then
        local pos = Vector2.new(min.x, min.y)
        outline.Position = pos
        box.Position = pos
        local length = max.x - min.x
        local height = max.y - min.y
        outline.Size = Vector2.new(length, height)
        box.Size = Vector2.new(length, height)
    end

    entities.box[id] = box
    entities.boxoutline[id] = outline
end
create.name = function(id, plrname, min, max, onscreen) -- creates a new box
    local text = Drawing.new('Text')
    text.Visible = onscreen

    local place = 'bottom'
    if settings.name.top then
        place = 'top'
    end
    
    text.Transparency = settings.name.transparency
    text.Color = settings.name.color
    text.Size = settings.name.size
    text.Outline = settings.name.outline
    text.OutlineColor = settings.name.outlinecolor
    text.Center = true
    text.Text = plrname

    local priority = settings.text.priority[place].name
    local location = priority
    for i,v in pairs(settings.text.priority[place]) do
        if v < priority then
            if toggles[i] == false then
                location -= 1
            end
        end
    end

    if onscreen then
        local offset
        if place == 'top' then
            offset = (settings.text.spacing + settings.name.size) * (location)
        else
            offset = settings.text.spacing + (settings.text.spacing + settings.name.size) * (location-1)
        end

        local yPos = place == 'top' and (min.y - offset) or (max.y + offset)
        local pos = Vector2.new(min.x + (max.x - min.x) / 2, yPos)
        text.Position = pos
    end

    entities.text[place].name[id] = text
end
create.distance = function(id, min, max, onscreen) -- creates a new box
    local text = Drawing.new('Text')
    text.Visible = onscreen

    local place = 'bottom'
    if settings.distance.top then
        place = 'top'
    end
    
    local priority = settings.text.priority[place].distance
    local location = priority
    for i,v in pairs(settings.text.priority[place]) do
        if v < priority then
            if toggles[i] == false then
                location -= 1
            end
        end
    end
    
    text.Transparency = settings.distance.transparency
    text.Color = settings.distance.color
    text.Size = settings.distance.size
    text.Outline = settings.distance.outline
    text.OutlineColor = settings.distance.outlinecolor
    text.Center = true
    text.Text = '[0 m]'

    if onscreen then
        local offset
        if place == 'top' then
            offset = (settings.text.spacing + settings.distance.size) * (location)
        else
            offset = settings.text.spacing + (settings.text.spacing + settings.distance.size) * (location-1)
        end

        local yPos = place == 'top' and (min.y - offset) or (max.y + offset)
        local pos = Vector2.new(min.x + (max.x - min.x) / 2, yPos)
        text.Position = pos
    end

    entities.text[place].distance[id] = text
end
create.weapon = function(id, min, max, onscreen) -- creates a new box
    local text = Drawing.new('Text')
    text.Visible = onscreen

    local place = 'bottom'
    if settings.weapon.top then
        place = 'top'
    end
    
    local priority = settings.text.priority[place].weapon
    local location = priority
    for i,v in pairs(settings.text.priority[place]) do
        if v < priority then
            if toggles[i] == false then
                location -= 1
            end
        end
    end
    
    text.Transparency = settings.weapon.transparency
    text.Color = settings.weapon.color
    text.Size = settings.weapon.size
    text.Outline = settings.weapon.outline
    text.OutlineColor = settings.weapon.outlinecolor
    text.Center = true
    text.Text = '[None]'

    if onscreen then
        local offset
        if place == 'top' then
            offset = (settings.text.spacing + settings.weapon.size) * (location)
        else
            offset = settings.text.spacing + (settings.text.spacing + settings.weapon.size) * (location-1)
        end

        local yPos = place == 'top' and (min.y - offset) or (max.y + offset)
        local pos = Vector2.new(min.x + (max.x - min.x) / 2, yPos)
        text.Position = pos
    end

    entities.text[place].weapon[id] = text
end
create.healthbar = function(id, min, max, onscreen)
    local left = min.x - settings.healthbar.gap - settings.healthbar.width - settings.healthbar.borderthickness -- left of the actual bar not the background
    local height = max.y - min.y

    local background = Drawing.new("Square")
    background.Visible = onscreen and toggles.healthbarbackground and toggles.healthbar
    background.Transparency = 1
    background.Color = settings.healthbar.backgroundcolor
    background.Filled = true

    local bar = Drawing.new('Square')
    bar.Visible = onscreen and toggles.healthbar
    bar.Transparency = 1
    bar.Color = settings.healthbar.healthcolor
    bar.Filled = true
    
    if onscreen and toggles.healthbar then
        if toggles.healthbarbackground then
            local size = Vector2.new(settings.healthbar.width + settings.healthbar.borderthickness * 2, height + settings.healthbar.borderthickness * 2)
            local pos = Vector2.new(left - settings.healthbar.borderthickness, min.y - settings.healthbar.borderthickness)

            background.Position = pos
            background.Size = size
        end

        local hum = valid[id]:FindFirstChild("Humanoid")
        local health
        if hum then
            health = hum.Health
        else
            health = 100
        end

        local healthchange = height * (1 - health/100)

        local size = Vector2.new(settings.healthbar.width, height - healthchange)
        local pos = Vector2.new(left, min.y + healthchange)

        bar.Size = size
        bar.Position = pos
    end

    entities.healthbar[id] = bar
    entities.healthbarbackground[id] = background
end

local update = {}
update.box = function(id, min, max, onscreen) -- updates an existing box
    local box = entities.box[id]
    local outline = entities.boxoutline[id]

    box.Visible = onscreen and toggles.box
    outline.Visible = onscreen and toggles.boxoutline

    if onscreen and toggles.box then
        box.Transparency = settings.box.transparency
        box.Color = settings.box.color
        box.Thickness = settings.box.thickness

        local pos = Vector2.new(min.x, min.y)

        box.Position = pos
        local length = max.x - min.x
        local height = max.y - min.y
        local size = Vector2.new(length, height)
        box.Size = size

        if toggles.boxoutline then
            outline.Transparency = settings.boxoutline.transparency
            outline.Color = settings.boxoutline.color
            outline.Thickness = settings.box.thickness + settings.boxoutline.thickness * 2

            outline.Position = pos
            outline.Size = size
        end
    end
end
update.name = function(id, min, max, onscreen) -- updates an existing box
    local place = 'bottom'
    if settings.name.top then
        place = 'top'
    end

    local text = entities.text[place].name[id]

    text.Visible = onscreen and toggles.name

    local priority = settings.text.priority[place].name
    local location = priority
    for i,v in pairs(settings.text.priority[place]) do
        if v < priority then
            if toggles[i] == false then
                location -= 1
            end
        end
    end

    if onscreen and toggles.name then
        local priority = settings.text.priority[place].name
        local location = priority
        for i,v in pairs(settings.text.priority[place]) do
            if v < priority then
                if toggles[i] == false then
                    location -= 1
                end
            end
        end

        local offset
        if place == 'top' then
            offset = (settings.text.spacing + settings.name.size) * (location)
        else
            offset = settings.text.spacing + (settings.text.spacing + settings.name.size) * (location-1)
        end

        text.Transparency = settings.name.transparency
        text.Color = settings.name.color
        text.Size = settings.name.size
        text.Outline = settings.name.outline
        text.OutlineColor = settings.name.outlinecolor

        local yPos = place == 'top' and (min.y - offset) or (max.y + offset)
        local pos = Vector2.new(min.x + (max.x - min.x) / 2, yPos)
        text.Position = pos
    end
end
update.distance = function(id, min, max, onscreen) -- updates an existing box
    local place = 'bottom'
    if settings.distance.top then
        place = 'top'
    end

    local text = entities.text[place].distance[id]

    text.Visible = onscreen and toggles.distance

    if onscreen and toggles.distance then
        local priority = settings.text.priority[place].distance
        local location = priority
        for i,v in pairs(settings.text.priority[place]) do
            if v < priority then
                if toggles[i] == false then
                    location -= 1
                end
            end
        end

        local char = valid[id]
        local distance = (character:GetPivot().Position - char:GetPivot().Position).Magnitude
        distance = math.round(distance)

        text.Text = '['..tostring(distance)..' m]'
        local offset
        if place == 'top' then
            offset = (settings.text.spacing + settings.distance.size) * (location)
        else
            offset = settings.text.spacing + (settings.text.spacing + settings.distance.size) * (location-1)
        end

        text.Transparency = settings.distance.transparency
        text.Color = settings.distance.color
        text.Size = settings.distance.size
        text.Outline = settings.distance.outline
        text.OutlineColor = settings.distance.outlinecolor

        local yPos = place == 'top' and (min.y - offset) or (min.y + (max.y - min.y) + offset)
        local pos = Vector2.new(min.x + (max.x - min.x) / 2, yPos)
        text.Position = pos
    end
end
update.weapon = function(id, min, max, onscreen) -- updates an existing box
    local place = 'bottom'
    if settings.weapon.top then
        place = 'top'
    end

    local text = entities.text[place].weapon[id]

    text.Visible = onscreen and toggles.weapon

    if onscreen and toggles.weapon then
        local priority = settings.text.priority[place].weapon
        local location = priority
        for i,v in pairs(settings.text.priority[place]) do
            if v < priority then
                if toggles[i] == false then
                    location -= 1
                end
            end
        end

        local char = valid[id]
        local children = char:GetChildren()
        local weapon = 'None'
        for _,child in pairs(children) do
            if child:IsA('Tool') and (table.find(whitelistedweapons, child.Name) ~= nil) then
                weapon = child.Name
            end
        end

        text.Text = '['..weapon..']'
        local offset
        if place == 'top' then
            offset = (settings.text.spacing + settings.weapon.size) * (location)
        else
            offset = settings.text.spacing + (settings.text.spacing + settings.weapon.size) * (location-1)
        end

        text.Transparency = settings.weapon.transparency
        text.Color = settings.weapon.color
        text.Size = settings.weapon.size
        text.Outline = settings.weapon.outline
        text.OutlineColor = settings.weapon.outlinecolor

        local yPos = place == 'top' and (min.y - offset) or (max.y + offset)
        local pos = Vector2.new(min.x + (max.x - min.x) / 2, yPos)
        text.Position = pos
    end
end
update.healthbar = function(id, min, max, onscreen)
    local background = entities.healthbarbackground[id]
    local bar = entities.healthbar[id]

    background.Visible = onscreen and toggles.healthbarbackground and toggles.healthbar
    bar.Visible = onscreen and toggles.healthbar
    
    if onscreen and toggles.healthbar then
        local left = min.x - settings.healthbar.gap - settings.healthbar.width - settings.healthbar.borderthickness -- left of the actual bar not the background
        local height = max.y - min.y

        if toggles.healthbarbackground then
            background.Transparency = 1
            background.Color = settings.healthbar.backgroundcolor
            
            local size = Vector2.new(settings.healthbar.width + settings.healthbar.borderthickness * 2, height + settings.healthbar.borderthickness * 2)
            local pos = Vector2.new(left - settings.healthbar.borderthickness, min.y - settings.healthbar.borderthickness)

            background.Position = pos
            background.Size = size
        end

        bar.Transparency = 1
        bar.Color = settings.healthbar.healthcolor

        local hum = valid[id]:FindFirstChild("Humanoid")
        local health
        if hum then
            health = hum.Health
        else
            health = 100
        end

        local healthchange = height * (1 - health/100)

        local size = Vector2.new(settings.healthbar.width, height - healthchange)
        local pos = Vector2.new(left, min.y + healthchange)

        bar.Size = size
        bar.Position = pos
    end
end


local remove = function(Type, id) -- removes an existing box
    local isText

    if settings[Type] then
        isText = settings[Type].top
    else
        isText = nil
    end

    local place = 'top'
    if isText == false then
        place = 'bottom'
    end

    if isText ~= nil then
        if not entities.text[place][Type][id] then
            return
        end

        entities.text[place][Type][id]:Remove()
        local index = table.find(entities.text[place][Type], id)
        if index then
            table.remove(entities.text[place][Type], index)
        end
        return
    elseif isText == nil then
        if not entities[Type][id] then
            return
        end

        entities[Type][id]:Remove()
        local index = table.find(entities[Type], id)
        if index then
            table.remove(entities[Type], index)
        end
        return
    end
end


local handler = {}
handler.box = function(id, char) -- coordinates everything box related
    if toggles.box ~= true then
        return
    end

    local min = mins[id]
    local max = maxes[id]
    local onscreen = onscreens[id]

    if not check.exists('box', id, false) then -- doesnt exist? create one
        create.box(id, min, max, onscreen)
        return
    else -- exists? update it
        update.box(id, min, max, onscreen)
        return
    end
end

handler.name = function(id, char)
    if toggles.name ~= true then
        return
    end

    local min = mins[id]
    local max = maxes[id]
    local onscreen = onscreens[id]

    if not check.exists('name', id, true) then -- doesnt exist? create one
        create.name(id, char.Name, min, max, onscreen)
        return
    else -- exists? update it
        update.name(id, min, max, onscreen)
        return
    end
end

handler.distance = function(id, char)
    if toggles.distance ~= true then
        return
    end

    local min = mins[id]
    local max = maxes[id]
    local onscreen = onscreens[id]

    if not check.exists('distance', id, true) then -- doesnt exist? create one
        create.distance(id, min, max, onscreen)
        return
    else -- exists? update it
        update.distance(id, min, max, onscreen)
        return
    end
end

handler.weapon = function(id, char)
    if toggles.weapon ~= true then
        return
    end

    local min = mins[id]
    local max = maxes[id]
    local onscreen = onscreens[id]

    if not check.exists('weapon', id, true) then -- doesnt exist? create one
        create.weapon(id, min, max, onscreen)
        return
    else -- exists? update it
        update.weapon(id, min, max, onscreen)
        return
    end
end

handler.healthbar = function(id, char)
    if toggles.healthbar ~= true then
        return
    end

    local min = mins[id]
    local max = maxes[id]
    local onscreen = onscreens[id]

    if not check.exists('healthbar', id, false) then -- doesnt exist? create one
        create.healthbar(id, min, max, onscreen)
        return
    else -- exists? update it
        update.healthbar(id, min, max, onscreen)
        return
    end
end

--init text types
for text, _ in pairs(handler) do
    if settings[text].top == true then
        entities.text.top[text] = {}
    elseif settings[text].top == false then
        entities.text.bottom[text] = {}
    end
end

--init valid table
for _, player in pairs(Players:GetChildren()) do
    local id = player.UserId
    util.watchCharacter(player, id)
    if check.valid(player) then
        valid[id] = player.Character
    end
end


-- main thread
RunService:BindToRenderStep("render", Enum.RenderPriority.Camera.Value + 1, function()
    for id, char in valid do
        local min, max, onscreen = Math.getcorners(char)
        mins[id] = min
        maxes[id] = max
        onscreens[id] = onscreen

        for _, func in pairs(handler) do
            func(id, char)
        end
    end
end)

--player leave
Players.PlayerRemoving:Connect(function(plr)
    local id = plr.UserId
    table.remove(valid, id)

    for Type, _ in pairs(entities) do
        if Type == 'text' then
            continue
        end

        remove(Type, id)
    end

    for Type, _ in pairs(entities.text.top) do
        remove(Type, id)
    end

    for Type, _ in pairs(entities.text.bottom) do
        remove(Type, id)
    end
end)

--player add
Players.PlayerAdded:Connect(function(player)
    repeat task.wait() until player.Character

    local id = player.UserId

    if check.valid(player) then
        valid[id] = player.Character
        util.watchCharacter(player, id)
    end
end)
