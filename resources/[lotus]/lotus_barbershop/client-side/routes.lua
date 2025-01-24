local function RegisterRoutes()
    local routes = {
        ["CAM"] = function(camPos)
            changeCamPosition(camPos)
        end,

        ["HORIZONTAL"] = function(floatPos)
            moveCamPosition("HORIZONTAL", floatPos)
            return true
        end,

        ["VERTICAL"] = function(floatPos)
            moveCamPosition("VERTICAL", floatPos)
            return true
        end,

        ["CLOSE"] = function()
            clientFunctions.closeNuiShop(true)
            return true
        end,
        
        ["SAVE"] = function()
            clientFunctions.saveBarberShop()
        end,

        ["UPDATE_CUSTOM"] = function(data)
            changeBarber(data)
            return true
        end,

        ["ROTATE"] = function(rotation)
            userRotate(rotation)
            return true
        end,
    }

    for k, v in pairs(routes) do
        RegisterNUICallback(
            tostring(k),
            function(data, cb)
                cb(v(data))
            end
        )
    end
end
CreateThread(RegisterRoutes)

function clientFunctions.openNui(id, type)
    opennedGarageId = id
    opennedGarageType = type

    SetNuiFocus(true, true)
    SendNUIMessage({action = "open"})
end

function clientFunctions.closeNui()
    SendNUIMessage({action = "close"})
    SetNuiFocus(false, false)
end
