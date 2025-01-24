-- ## PREPARES
vRP._prepare("tracker/getAllPersonagelVehicles", "SELECT user_id,veiculo,status,motor,lataria,gasolina,ipva,tunagem,favorite FROM vrp_user_veiculos WHERE user_id = @user_id")

-- ## FUNÇÕES E EVENTOS
server.getPersonalVehicles = function()
    local source = source
    local user_id = vRP.getUserId(source)
    local queryVehicles = vRP.query("tracker/getAllPersonagelVehicles", { user_id = user_id })
    local myVehiclesTracker = {}
    for k in pairs(queryVehicles) do
        myVehiclesTracker[k] = {
            ['name'] = queryVehicles[k].veiculo
        }
    end
    return myVehiclesTracker or {}
end

-- ## PERMISSÃO
function server.checkPermission()
    local source = source
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "perm.tracker") or vRP.hasPermission(user_id, "perm.rubiplus") or vRP.hasPermission(user_id, "perm.rubi") or vRP.hasPermission(user_id, "developer.permissao") then
        return true
    end
end

local trackedVehicles = {}

RegisterNetEvent('updateTrack')
AddEventHandler('updateTrack', function(name)
    local source = source
    local user_id = vRP.getUserId(source)
    local result, vehNet = trackVehicle(name)
    local idNetwork = NetworkGetEntityFromNetworkId(vehNet)
    local coords = GetEntityCoords(idNetwork)

    local isTrackable = isVehicleTrackable(user_id, name)
    if not isTrackable then
        TriggerClientEvent("Notify", source, "negado", "O rastreamento deste veículo foi desativado!", 10)
        return false
    end

    if result and DoesEntityExist(idNetwork) then
        TriggerClientEvent('trackVehicleResult', source, { name = name, coords = coords })
    else
        TriggerClientEvent('trackVehicleResult', source, { name = name, coords = false })
    end
end)

RegisterNetEvent('trackVehicle')
AddEventHandler('trackVehicle', function(name)
    local source = source
    local user_id = vRP.getUserId(source)

    if not trackedVehicles[source] then
        trackedVehicles[source] = {}
    end

    local isVehicleFound, vehNet = trackVehicle(name)

    TriggerClientEvent('updateTrack', source, name)
    if isVehicleFound then
        trackedVehicles[source][name] = true
        TriggerEvent("Notify",source,"sucesso","Veículo "..name.." localizado!",5)

        Citizen.SetTimeout(30000, function() 
            if trackedVehicles[source] and trackedVehicles[source][name] then
                TriggerClientEvent("Notify",source,"aviso","Fim da localização do veículo "..name.."!",10)
                TriggerClientEvent('stopTrackVehicle', source, name)
                trackedVehicles[source][name] = nil
            end
        end)
    end
end)

function trackVehicle(vehicleId)
    local user_id = vRP.getUserId(source)
    local vehicles = exports["bm_module"]:allSpawnedCars()
    local vehiclesCheckSpawn = false
    local vehNet
    for k,v in pairs(vehicles) do
        if v[1] == user_id then
            if vehicleId == v[2] then
                vehiclesCheckSpawn = true
                vehNet = v[3]
                break
            end
        end
    end
    return vehiclesCheckSpawn, vehNet
end

-- ## Disable Tracker

-- Estado padrão do rastreador dos veículos: ativo
local trackableVehicles = setmetatable({}, {
    __index = function() return true end
})

-- Armazena o tempo de última ativação do rastreador para cada veículo
local lastTrackingActivation = {}

-- Cooldown em segundos para ativar o rastreador novamente (3 minutos)
local trackingCooldown = 3 * 60

function isVehicleTrackable(ownerId, vehicleName)
    local trackable = trackableVehicles[ownerId .. vehicleName] ~= false
    print("isVehicleTrackable ownerId=" .. ownerId .. ", vehicleName=" .. vehicleName .. ", trackable=" .. tostring(trackable))
    return trackable
end

function disableVehicleTracking(ownerId, vehicleName)
    trackableVehicles[ownerId .. vehicleName] = false
    removeAfterCooldown(ownerId, vehicleName)  
end

function enableVehicleTracking(ownerId, vehicleName)
    print("enableVehicleTracking ownerId=" .. ownerId .. ", vehicleName=" .. vehicleName)
    trackableVehicles[ownerId .. vehicleName] = true
end


function canActivateTracker(vehicleName)
    if not lastTrackingActivation[vehicleName] then return true end
    return (os.time() - lastTrackingActivation[vehicleName]) >= trackingCooldown
end

RegisterNetEvent('disableVehicleTracker')
AddEventHandler('disableVehicleTracker', function(source)
    local user_id = vRP.getUserId(source)
    if user_id ~= nil then
        local plate,mName,mNetVeh = vRPclient.ModelName(source, 7)
        if mName then
            local placa_user_id = vRP.getUserByRegistration(plate)
            if not isVehicleTrackable(placa_user_id, mName) then
                TriggerClientEvent("Notify", source, "negado", "Este veículo já está com o rastreador desativado!", 10)
                return
            end
            disableVehicleTracking(placa_user_id, mName)
        else
            TriggerClientEvent("Notify", source, "negado", "Nenhum veículo encontrado próximo a você!", 10)
        end
    end
end)

function removeAfterCooldown(ownerId, vehicleName)
    Citizen.SetTimeout(1 * 60 * 1000, function()  
        trackableVehicles[ownerId .. vehicleName] = nil
        local nsource = vRP.getUserSource(ownerId)
        TriggerClientEvent("Notify", nsource, "sucesso", "Rastreador habilitado novamente do seu veículo: "..vehicleName, 5)
    end)
end
