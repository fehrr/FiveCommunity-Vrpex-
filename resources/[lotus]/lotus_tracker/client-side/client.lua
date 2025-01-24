
-- ## SYSTEM OPEN TRACKER
isMenuOpen = false
-- RegisterKeyMapping("tracker","Abrir painel do tracker","keyboard","F7")
RegisterCommand('tracker', function()
    if not isMenuOpen and server.checkPermission() then
        isMenuOpen = true
        SetNuiFocus(true,true)
        TransitionToBlurred(1000)
        SendNUIMessage({
            action = 'open',
            vehicles = server.getPersonalVehicles()
        })
    end
end)

-- ## SYSTEM CLOSE TRACKER
function closeInterface()
    isMenuOpen = false
    SetNuiFocus(false, false)
    TransitionFromBlurred(1000)
end

RegisterNUICallback("closeInterface", function(data, cb)
	closeInterface()
end)

-- ## TRACKER
client.selectedCar = function(name)
    local vehicleId = name 
    TriggerServerEvent('trackVehicle', vehicleId)
end

-- ## VARIAVEIS
local searchBlip = {}
local isTracking = {}
local currentVehicles = {}

local trackCooldown = 0
local currentTracking = nil

-- ## FUNÇÕES E EVENTOS
client.searchBlip = function(name, coords)
    if DoesBlipExist(searchBlip[name]) then
        RemoveBlip(searchBlip[name])
        searchBlip[name] = nil
    end
    searchBlip[name] = AddBlipForCoord(coords[1],coords[2],coords[3])
    SetBlipSprite(searchBlip[name],225)
    SetBlipColour(searchBlip[name],2)
    SetBlipScale(searchBlip[name],0.6)
    SetBlipAsShortRange(searchBlip[name],true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Veículo Rastreado: "..name)
    EndTextCommandSetBlipName(searchBlip[name])
end

client.stopTrack = function(name)
    if DoesBlipExist(searchBlip[name]) then
        RemoveBlip(searchBlip[name])
        searchBlip[name] = nil
        isTracking[name] = false
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000) 
        for name,isTrack in pairs(isTracking) do
            if isTrack then
                TriggerEvent("Notify","sucesso","Atualização sobre o veículo "..name.." em seu GPS!",3)
                TriggerServerEvent('updateTrack', name)
            end
        end
    end
end)

RegisterNUICallback('track', function(data, cb)
    local name = data.name
    if GetGameTimer() < trackCooldown then
        TriggerEvent("Notify","negado","Você precisa esperar antes de rastrear outro veículo.",10)
    else
        -- currentTracking = name
        client.selectedCar(name)
        TriggerServerEvent('updateTrack', name)
    end
end)


RegisterNetEvent('trackVehicleResult')
AddEventHandler('trackVehicleResult', function(data)
    local name = data.name
    local coords = data.coords
    if coords then
        isTracking[name] = true
        client.searchBlip(name, coords)
    else
        TriggerEvent("Notify","negado","Veículo "..name.." fora do radar!",10)
        isTracking[name] = false
    end
end)

RegisterNetEvent('stopTrackVehicle')
AddEventHandler('stopTrackVehicle', function(name)
    client.stopTrack(name)
    -- if name == currentTracking then
    --     currentTracking = nil
        trackCooldown = GetGameTimer() + 1 * 60 * 1000
    -- end
end)
