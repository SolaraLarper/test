pcall(function()
    if getgenv then
        getgenv().identifyexecutor = function(...)
            return "Potassium"
        end
    end
end)
