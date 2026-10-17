-- beautified by n0thingsnew 
-- https://lua.expert/
local Character = game.Players.LocalPlayer.Character
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Symbols = {
    ".",
    " ",
    "",
    "-",
    ",",
    "&",
    "#",
    "<",
    ">",
    "0",
    ";",
    "*",
    "\"",
    "+",
    "(",
    ")"
}
local Remote = ReplicatedStorage.Remote
local Number = Symbols[math.random(1, #Symbols)]

script.Name = Number .. math.random(9999, 9999999)

local BindableEvent = Instance.new("BindableEvent")
local Proxy = newproxy(true)

getmetatable(Proxy).__tostring = function() --[[ Line: 35 | Upvalues: v2 (copy), ReplicatedStorage (copy) ]]
    for i = 1, 20 do
        local ok, result = pcall(getfenv, i)

        if ok and (result and result.getgenv) then
            BindableEvent:FireServer(ReplicatedStorage.BR.Team44.Value, "Hook: 1")
        end
    end

    return ""
end

while true do
    BindableEvent:Fire({
        [Proxy] = {}
    })
    task.wait()
end
