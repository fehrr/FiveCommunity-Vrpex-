local disabledRequest = false

RegisterKeyMapping("hub:open","Abrir Menu de Call","keyboard","f5")
RegisterCommand("hub:open",function(source,args)
    SetNuiFocus(true,true)
    SendNUIMessage({ action = "open" })
end)

RegisterNUICallback("close",function(data,cb)
    SetNuiFocus(false,false)
    cb("ok")
end)

RegisterNUICallback("tryAcceptRequest",function(data,cb)
    if data.id then
        TriggerServerEvent("hub:tryAcceptRequest", data.id)
    end
    cb({})
end)

RegisterNUICallback("sendCall",function(data,cb)
    if data.description then
        print(data.description)
        TriggerServerEvent("hub:sendCall", data.description)
    end
end)

RegisterNetEvent("hub:sendNotification")
RegisterNetEvent("hub:sendNotification", function(type, title, description, persistent)
    if disabledRequest then return end 
    SendNUIMessage({ action = "addNotification", type = type, title = title, description = description, persistent = persistent })
end)

RegisterNetEvent("hub:sendRequest")
RegisterNetEvent("hub:sendRequest", function(type, title, description, id)
    if disabledRequest then return end 
    SendNUIMessage({ action = "addRequest", type = type, title = title, description = description, id = id })
end)

RegisterNetEvent("hub:setAcceptedRequest")
RegisterNetEvent("hub:setAcceptedRequest", function(requestId, userId)
    SendNUIMessage({ action = 'setAcceptedRequest', id = requestId, user_id = userId })
end)

RegisterNetEvent("hub:openfac")
RegisterNetEvent("hub:openfac", function(serviceName)
    SetNuiFocus(true,true)
    SendNUIMessage({ action = 'faq:open', serviceName = serviceName })
end)

RegisterNetEvent("hub:closefac")
RegisterNetEvent("hub:closefac", function(source)
    SetNuiFocus(false,false)
    SendNUIMessage({ action = 'faq:close' })
end)

RegisterNetEvent('lotus_hud:toggleRequests')
RegisterNetEvent('lotus_hud:toggleRequests', function(source)
    disabledRequest = not disabledRequest
    SendNUIMessage({ action = 'toggleRequests', disabled = disabledRequest })
end)

local sendSos = true

RegisterCommand("sos",function(source,args,rawCmd)
    local ped = PlayerPedId()
    if GetEntityHealth(ped) < 102 then 
        sendSos = false
        TriggerServerEvent("hub:sendSos",source, "Cidadão ferido ou desmaiado na seguinte localização.")
        SetTimeout(5000, function()
            sendSos = true
        end)
    end
end)