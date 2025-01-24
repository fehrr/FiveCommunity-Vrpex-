visible = false

routes = {
    ['close'] = function(data)
        return bridge.visibility()
    end,
    ['pressCode'] = function(data)
        return print(json.encode(data))
    end,
    ['consult'] = function(data)
        return vSERVER.consult(data)
    end,
    ['requestAccept'] = function(data)
        return vSERVER.accept(data)
    end,
    ['requestRefuse'] = function(data)
        return vSERVER.refuse(data)
    end,
    ['report'] = function(data)
        return vSERVER.add_fine(data)
    end,
    ['applyPunish'] = function(data)
        return vSERVER.set_arrested(data)
    end,
    ['nameRegistered'] = function(data)
        local name = vSERVER.getName(data.value)
        if (not name) then
            return SendNUIMessage({action = 'updateInviteName', name = 'Player inexistente'})
        end
        return SendNUIMessage({action = 'updateInviteName', name = name})
    end,
    ['confirmExonerate'] = function(data)
        return vSERVER.rem_employee(data)
    end,
    ['confirmInvite'] = function(data)
        return vSERVER.add_employee(data)
    end,
    ['demote'] = function(data)
        return vSERVER.demote({})
    end,
    ['addfine'] = function(data)
        return vSERVER.add_fine(data)
    end
}

registerRoutes = function()
    for name, v in pairs(routes) do
        local resolveResponses = function(data, cb)
            local res = v(data)
            if cb then
                cb(res)
            end
        end
        RegisterNUICallback(name, resolveResponses)
    end
end
bridge.visibility = function(payload)
    if (payload and type(payload) == 'table') then
        visible = true
        TransitionToBlurred(0)
    else
        visible = false
        payload = {action = 'close'}
        TransitionFromBlurred(0)
    end
    print(json.encode(payload))
    SetNuiFocus(visible, visible)
    SendNUIMessage(payload)
end

CreateThread(registerRoutes)
