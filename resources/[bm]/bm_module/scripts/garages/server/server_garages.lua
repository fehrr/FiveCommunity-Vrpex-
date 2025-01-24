------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- QUERYS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("bm_module/garages/getAllUserVehicles", "SELECT user_id,veiculo,status,motor,lataria,gasolina,ipva,tunagem,favorite FROM vrp_user_veiculos WHERE user_id = @user_id")
vRP._prepare("bm_module/garages/getSpawnVehInfo", "SELECT veiculo,motor,lataria,gasolina,tunagem FROM vrp_user_veiculos WHERE veiculo = @veiculo AND user_id = @user_id")
vRP._prepare("bm_module/garages/getStatus", "SELECT status,ipva FROM vrp_user_veiculos WHERE veiculo = @veiculo AND user_id = @user_id")
vRP._prepare("bm_module/garages/updateFavorite", "UPDATE vrp_user_veiculos SET favorite = @favorite WHERE user_id = @user_id AND veiculo = @veiculo")
vRP._prepare("bm_module/garages/updateStatus", "UPDATE vrp_user_veiculos SET status = @status WHERE user_id = @user_id AND veiculo = @veiculo")
vRP._prepare("bm_module/garages/updateIpva", "UPDATE vrp_user_veiculos SET ipva = @ipva WHERE user_id = @user_id AND veiculo = @veiculo")
vRP._prepare("bm_module/garages/updateVehicleInfos", "UPDATE vrp_user_veiculos SET motor = @motor, lataria = @lataria, gasolina = @gasolina WHERE user_id = @user_id AND veiculo = @veiculo")
vRP._prepare("bm_module/garages/updateOwnerVehicle", "UPDATE vrp_user_veiculos SET user_id = @new_owner, portamalas = @portamalas WHERE user_id = @user_id AND veiculo = @veiculo")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local userPersonalCar = {}
local userJobCar = {}
local housesGarages = {}
local allSpawnedCars = {}
local lastEntitys = {}
vehKeys = {}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- GET USERS VEHICLES
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.garageGetUserVehicles()
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if user_id then
        local query = vRP.query("bm_module/garages/getAllUserVehicles", { user_id = user_id })
        local t = {}

        for i = 1, #query do
            t[i] = {
                ['vehicle'] = query[i].veiculo,
                ['plate'] = identity.registro,
                ['engine'] = query[i].motor,
                ['body'] = query[i].lataria,
                ['fuel'] = 100,
                ['custom'] = json.decode(query[i].tunagem),
                ['favorite'] = (query[i].favorite == 1),
                ['status'] = (query[i].status > 0),
                ['ipva'] = (query[i].ipva+garagesConfig.main['ipvaVencimento']*24*60*60 <= os.time())
            }
        end
        
        return t or {}
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRY SPAWN VEHICLE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local VEHICLES_PERMISSIONS = {
    ['wrbmwi8exc'] = 'perm.disparo',
}

RegisterNetEvent("garage:garageTrySpawnVehicle",function(isPersonal, name, spawnLoc, types)
    if not name then return end
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)

    if user_id then
        if isPersonal then
            local query = vRP.query("bm_module/garages/getSpawnVehInfo", { user_id = user_id, veiculo = name })
            if #query > 0 then
                if userPersonalCar[name..":"..user_id] then
                    if (DoesEntityExist(NetworkGetEntityFromNetworkId(userPersonalCar[name..":"..user_id])) == 1) then
                        TriggerClientEvent("Notify",source,"negado","Você já possui um veiculo desse fora da garagem.", 5)
                        return false
                    end

                    allSpawnedCars[userPersonalCar[name..":"..user_id] ] = nil
                    userPersonalCar[name..":"..user_id] = nil
                end

                if VEHICLES_PERMISSIONS[name] then
                    if not vRP.hasPermission(user_id, VEHICLES_PERMISSIONS[name]) then
                        return TriggerClientEvent("Notify",source,"negado","Você não possui permissão para puxar esse veiculo.", 5)
                    end
                end

                if garagesConfig.main['spawnClientVehicle'] then
                    if spawnLoc then
                        TriggerClientEvent("garage:clientSpawnVehicle", source, name, {
                            plate = identity.registro,
                            engine = query[1].motor or 1000,
                            body = query[1].lataria or 1000,
                            fuel = 100,
                            custom = json.decode(query[1].tunagem) or {}
                        }, true, spawnLoc)
                    end
                else
                    if spawnLoc then
                        local vehicleHash = GetHashKey(name)
                        local entity

                        entity = CreateVehicle(vehicleHash,spawnLoc.x,spawnLoc.y,spawnLoc.z,spawnLoc.w,true,true,true)
                        if not entity or entity == 0 then return false end

                        while not DoesEntityExist(entity) do 
                            Wait(250)
                        end

                        local netid = NetworkGetNetworkIdFromEntity(entity)

                        userPersonalCar[name..":"..user_id] = netid
                        allSpawnedCars[netid] = { user_id,name,netid }

                        CreateThread(function()
                            local vehOwner = NetworkGetEntityOwner(entity)
                            local plate = identity.registro
                            
                            local timeout = 0
                            while vehOwner == -1 do
                                Wait(1000)
                                timeout = timeout + 1

                                if DoesEntityExist(entity) and NetworkGetEntityOwner(entity) then
                                    vehOwner = source
                                    break;
                                end

                                if timeout > 3 then
                                    vehOwner = source
                                    break;
                                end
                            end

                            if not vehOwner then return end

                            SetVehicleNumberPlateText(entity, plate)
                            SetVehicleDoorsLocked(entity, 2)

                            TriggerClientEvent("garage:updateVehicle", vehOwner, netid, {
                                engine = query[1].motor or 1000,
                                body = query[1].lataria or 1000,
                                fuel = 100,
                                custom = json.decode(query[1].tunagem) or {}
                            }, true)
                        end)
                    end
                end
            end
        else
            if userJobCar[name..":"..user_id] then
                if (DoesEntityExist(NetworkGetEntityFromNetworkId(userJobCar[name..":"..user_id])) == 1) then
                    TriggerClientEvent("Notify",source,"negado","Você já possui um veiculo desse fora da garagem.", 5)
                    return
                end

                userJobCar[name..":"..user_id] = nil
            end
            if garagesConfig.main['spawnClientVehicle'] then

                local chosenVehicleLivery = nil
                for i, vehicle in ipairs(types["vehicles"]) do
                    if vehicle.vehicle == name and vehicle.livery then
                        chosenVehicleLivery = vehicle.livery
                        break
                    end
                end
                
                TriggerClientEvent("garage:clientSpawnVehicle", source, name, {
                    plate = identity.registro,
                    engine = 1000,
                    body = 1000,
                    fuel = 100,
                    custom = {},
                    livery = chosenVehicleLivery 
                }, false, spawnLoc)
            else
                if spawnLoc then
                    local vehicleHash = GetHashKey(name)
                    local entity

                    entity = CreateVehicle(vehicleHash,spawnLoc.x,spawnLoc.y,spawnLoc.z,spawnLoc.w,true,true,true)
                    if not entity or entity == 0 then return false end

                    while not DoesEntityExist(entity) do 
                        Wait(250)
                    end

                    local netid = NetworkGetNetworkIdFromEntity(entity)

                    userJobCar[name..":"..user_id] = netid

                    CreateThread(function()
                        local vehOwner = NetworkGetEntityOwner(entity)
                        local plate = identity.registro
                        
                        local timeout = 0
                        while vehOwner == -1 do
                            Wait(1000)
                            timeout = timeout + 1

                            if DoesEntityExist(entity) and NetworkGetEntityOwner(entity) then
                                vehOwner = source
                                break;
                            end

                            if timeout > 3 then
                                vehOwner = source
                                break;
                            end
                        end

                        if not vehOwner then return end

                        SetVehicleNumberPlateText(entity, plate)
                        SetVehicleDoorsLocked(entity, 2)

                        TriggerClientEvent("garage:updateVehicle", vehOwner, netid, {
                            engine = 1000,
                            body = 1000,
                            fuel = 100,
                            custom = {}
                        }, true)
                    end)
                end
            end
        end
    end
end)

RegisterNetEvent("garage:registerVehicle",function(name, netID, isPersonal)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if isPersonal then
            if netID and name then
                userPersonalCar[name..":"..user_id] = netID
                allSpawnedCars[netID] = { user_id,name,netID }
            end
        else
            if netID and name then
                userJobCar[name..":"..user_id] = netID
            end
        end
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRY PAYMENT VEHICLE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.garageTryPaymentVehicle(name)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local query = vRP.query("bm_module/garages/getStatus", { veiculo = name, user_id = user_id })
        if #query > 0 then
            local vehPrice = getVehiclePrice(name) 

            if query[1].status == 1 then
                local payment = parseInt(vehPrice * garagesConfig.main['detidoValue'])
                if vRP.request(source, "Você deseja pagar <b>$ "..vRP.format(payment).."</b> para tirar seu veiculo da apreensão ?") then
                    if vRP.tryFullPayment(user_id, payment) then
                        vRP._execute("bm_module/garages/updateStatus", { status = 0, user_id = user_id, veiculo = name })
                        TriggerClientEvent("Notify",source,"sucesso","Você Pagou $ "..vRP.format(payment).." para tirar o veiculo da apreensão.", 5)
                    else
                        TriggerClientEvent("Notify",source,"negado","Você não possui dinheiro.", 5)
                    end
                end
            end

            if query[1].status == 2 then
                local payment = parseInt(vehPrice * garagesConfig.main['retidoValue']) 

                if vRP.request(source, "Você deseja pagar <b>$ "..vRP.format(payment).."</b> para tirar seu veiculo da retenção ?") then
                    if vRP.tryFullPayment(user_id, payment) then
                        vRP._execute("bm_module/garages/updateStatus", { status = 0, user_id = user_id, veiculo = name })
                        TriggerClientEvent("Notify",source,"sucesso","Você Pagou $ "..vRP.format(payment).." para tirar o veiculo da retenção.", 5)
                    else
                        TriggerClientEvent("Notify",source,"negado","Você não possui dinheiro.", 5)
                    end
                end
            end

            if (query[1].ipva+garagesConfig.main['ipvaVencimento']*24*60*60 <= os.time()) then
                local payment = parseInt(vehPrice * garagesConfig.main['ipvaValue'])

                
                if vRP.hasPermission(user_id, "perm.supremorj") then
                    payment = 1
                elseif vRP.hasPermission(user_id, "perm.altarj") then
                    payment = payment * 0.5
                elseif vRP.hasPermission(user_id, "perm.rubi") then
                    payment = payment * 0.75
                elseif vRP.hasPermission(user_id, "perm.safira") then
                    payment = payment * 0.9
                else
                    payment = payment
                end

                if vRP.request(source, "Você deseja pagar <b>$ "..vRP.format(payment).."</b> para deixar o ipva de seu veiculo em dia ?") then
                    if vRP.tryFullPayment(user_id, payment) then
                        vRP._execute("bm_module/garages/updateIpva", { ipva = os.time(), user_id = user_id, veiculo = name })
                        TriggerClientEvent("Notify",source,"sucesso","Você Pagou $ "..vRP.format(payment).." para deixar o ipva de seu veiculo em dia.", 5)
                    else
                        TriggerClientEvent("Notify",source,"negado","Você não possui dinheiro.", 5)
                    end
                end
            end
        end
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- STORE USER VEHICLE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.garageStoreUserVehicle(isPersonal, name, proximity, vehicle)
    if not name then return end
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if proximity then
            if vehicle and vehicle > 0 then
                local entity = NetworkGetEntityFromNetworkId(vehicle)

                if isPersonal then
                    if (DoesEntityExist(entity) == 1) then
                        if (GetPedInVehicleSeat(entity, -1) > 0) then
                            TriggerClientEvent("Notify",source,"negado","Você não pode guardar este veiculo, pois ele está em uso.", 5)
                            return
                        end
                    end

                    if allSpawnedCars[vehicle] then
                        SaveVehicleInfos(allSpawnedCars[vehicle][1],allSpawnedCars[vehicle][2],allSpawnedCars[vehicle][3], entity, source)
        
                        if userPersonalCar[allSpawnedCars[vehicle][2]..":"..allSpawnedCars[vehicle][1] ] then
                            userPersonalCar[allSpawnedCars[vehicle][2]..":"..allSpawnedCars[vehicle][1] ] = nil
                        end
        
                        allSpawnedCars[vehicle] = nil
                    end

                    DeleteVehicle(entity)
                    TriggerClientEvent("Notify",source,"negado","Você guardou este veiculo.", 5)
                else
                    if (DoesEntityExist(entity) == 1) then
                        if (GetPedInVehicleSeat(entity, -1) > 0) then
                            TriggerClientEvent("Notify",source,"negado","Você não pode guardar este veiculo, pois ele está em uso.", 5)
                            return
                        end
                    end

                    if userJobCar[name..":"..user_id] then
                        userJobCar[name..":"..user_id] = nil
                    end

                    DeleteVehicle(entity)
                    TriggerClientEvent("Notify",source,"negado","Você guardou este veiculo.", 5)
                end
            end
        else
            if isPersonal then
                if userPersonalCar[name..":"..user_id] then
                    local entity = NetworkGetEntityFromNetworkId(userPersonalCar[name..":"..user_id])
    
                    if (DoesEntityExist(entity) == 1) then
                        if #(GetEntityCoords(entity) - GetEntityCoords(GetPlayerPed(source))) >= 100 then
                            TriggerClientEvent("Notify",source,"negado","Este veiculo que você está tentando guardar, está muito longe de você.", 5)
                            return
                        end
    
                        if (GetPedInVehicleSeat(entity, -1) > 0) then
                            TriggerClientEvent("Notify",source,"negado","Você não pode guardar este veiculo, pois ele está em uso.", 5)
                            return
                        end
                    end
                    
                    if allSpawnedCars[userPersonalCar[name..":"..user_id]] then
                        SaveVehicleInfos(allSpawnedCars[userPersonalCar[name..":"..user_id]][1],allSpawnedCars[userPersonalCar[name..":"..user_id]][2],allSpawnedCars[userPersonalCar[name..":"..user_id]][3], entity, source)
                    end
    
                    DeleteVehicle(entity)
    
                    if userPersonalCar[name..":"..user_id] then
                        allSpawnedCars[userPersonalCar[name..":"..user_id]] = nil
                        userPersonalCar[name..":"..user_id] = nil
                    end
                    
                    TriggerClientEvent("Notify",source,"negado","Você guardou este veiculo.", 5)
                    return
                end
    
                TriggerClientEvent("Notify",source,"negado","Este veiculo não está fora da garagem.", 5)
            else
                if userJobCar[name..":"..user_id] then
                    local entity = NetworkGetEntityFromNetworkId(userJobCar[name..":"..user_id])
    
                    if (DoesEntityExist(entity) == 1) then
                        if (GetPedInVehicleSeat(entity, -1) > 0) then
                            TriggerClientEvent("Notify",source,"negado","Você não pode guardar este veiculo, pois ele está em uso.", 5)
                            return
                        end
                    end
    
                    if userJobCar[name..":"..user_id] then
                        userJobCar[name..":"..user_id] = nil
                    end
    
                    DeleteVehicle(entity)
                    TriggerClientEvent("Notify",source,"negado","Você guardou este veiculo.", 5)
                    return
                end
    
                TriggerClientEvent("Notify",source,"negado","Este veiculo não está fora da garagem.", 5)
            end
        end
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SET FAVORITE CAR
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.garageSetFavorite(vehicle, status)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP._execute("bm_module/garages/updateFavorite", { user_id = user_id, veiculo = vehicle, favorite = ((status == true) and 0 or 1) })
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SAVE VEHICLES INFOS / DELETE VEHICLE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function SaveVehicleInfos(user_id, name, netID, vehicle, source)
    if vehicle then
        local body = GetVehicleBodyHealth(vehicle) or 1000.0
        local engine = GetVehicleEngineHealth(vehicle) or 1000.0
        local fuel = vTunnel.garageGetVehicleFuel(source, netID) or 100.0

        if engine <= 100 then engine = 1000 end
		if body <= 100 then body = 1000 end
		if fuel == nil or fuel >= 100 then fuel = 100 end
        
        vRP._execute("bm_module/garages/updateVehicleInfos", { lataria = body, motor = engine, gasolina = 100, user_id = user_id, veiculo = name })
    end
end

function DeleteVehicle(entityID)
    if DoesEntityExist(entityID) then
        DeleteEntity(entityID)
    end
end

function syncDeleteVehicle(source, netID)
    local entity = NetworkGetEntityFromNetworkId(netID)
    if entity then
        if allSpawnedCars[netID] and allSpawnedCars[netID][1] and allSpawnedCars[netID][2] then
            SaveVehicleInfos(allSpawnedCars[netID][1],allSpawnedCars[netID][2],allSpawnedCars[netID][3], entity, source)

            if userPersonalCar[allSpawnedCars[netID][2]..":"..allSpawnedCars[netID][1]] then
                userPersonalCar[allSpawnedCars[netID][2]..":"..allSpawnedCars[netID][1]] = nil
            end

            allSpawnedCars[netID] = nil
        end
        
        DeleteEntity(entity)
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECK PERMISSION
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.garageCheckPermission(permission)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, permission) then
            return true
        end

        return false
    end
end

function RegisterTunnel.garageCheckHouseOwner(home)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if housesGarages[home].tipo == "casa" then
            local owner = vRP.query("mirtin/ownerPropriedade", { houseID = home }) or 0
            if owner then
                if #owner > 0 then
                    if user_id == parseInt(owner[1].proprietario) then
                        return true
                    end
    
                    local moradores = json.decode(owner[1].moradores)
                    if moradores[tostring(user_id)] ~= nil then
                        return true
                    end
                end
            end
        end
    
        if housesGarages[home].tipo == "apartamento" then
            local owner = vRP.query("mirtin/ownerPropriedade", { houseID = home }) or 0
            if owner then
                if #owner > 0 then
                    for k,v in pairs(owner) do
                        if parseInt(v.proprietario) == parseInt(user_id) then
                            return true
                        end
                    end
                end
            end
        end
    
        TriggerClientEvent("Notify",source,"negado","Você não tem acesso à essa residência.",3000)
        return false
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LOCK VEHICLE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.garageTryLockVehicle(vnetid, vhash)
    local source = source
    local user_id = vRP.getUserId(source)
    if source then
        local entity = NetworkGetEntityFromNetworkId(vnetid)
        local vname = getVehicleModel(vhash)
        if entity > 0 then
            plate = GetVehicleNumberPlateText(entity)
            if plate then
                plate = plate:gsub(" ","")

                local plateOwnerId = vRP.getUserByRegistration(plate)
                if plateOwnerId and (plateOwnerId == user_id or canAcessVehicle(user_id, vname:lower(), plateOwnerId)) then
                    local status = GetVehicleDoorLockStatus(entity)
                    SetVehicleDoorsLocked(entity, ((status == 2) and 1 or 2))
                    
                    vTunnel._garageAnimLock(source, vnetid, status)
                end
            end
        else
            local plate,name,netid = vRPclient.ModelName(source, 5.0)
            if plate then
                plate = plate:gsub(" ", "")
                local plateOwnerId = vRP.getUserByRegistration(plate)

                if plateOwnerId and plateOwnerId == user_id then
                    if GetVehiclePedIsIn(GetPlayerPed(source),false) == 0 then
                        vRPclient._playAnim(source,true,{{"anim@mp_player_intmenu@key_fob@","fob_click"}},false)
                    end

                    vTunnel._syncLock(source, netid)
                end
            end
        end
    end
end

function canAcessVehicle(user_id, vname, owner_id)
    if vehKeys[owner_id..":"..vname] then
        if vehKeys[owner_id..":"..vname][user_id] then
            return true
        end
    end

    return false
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- UPDATE VEHICLE JOIN
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.garageUpdateVehicleJoin(netID)
    local entityId = NetworkGetEntityFromNetworkId(netID) 
    if entityId and entityId > 0 then
        lastEntitys[entityId] = os.time()
    end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HANDLERS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("mirtin:getGarages")
AddEventHandler("mirtin:getGarages", function(value, id) 
    housesGarages = value

    if id ~= nil then
        TriggerClientEvent("mirtin:reciveGarages", -1, false, housesGarages[id], id)
    end
end)

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if user_id then
        TriggerClientEvent("mirtin:reciveGarages", source, true, housesGarages)
    end
end)


local CountVehicles = {}
RegisterServerEvent("bm_module:deleteVehicles")
AddEventHandler("bm_module:deleteVehicles", function(vehID) 
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    if not CountVehicles[user_id] then
        CountVehicles[user_id] = 0
    end
    CountVehicles[user_id] = (CountVehicles[user_id] + 1)

    if CountVehicles[user_id] > 3 then
        print("^1[EMPREGOS]^7 Usuário: "..user_id.." | Deletando Veiculos | Banindo ")
        DropPlayer(source,"Trigger [DELETE VEHICLES]")
        vRP.setBanned(user_id, true, "Trigger [DELETE VEHICLES]")
        return
    end

    SetTimeout(5 * 1000, function()
        if CountVehicles[user_id] then
            CountVehicles[user_id] = (CountVehicles[user_id] - 1)
        end

        if not CountVehicles[user_id] or CountVehicles[user_id] < 0 then
            CountVehicles[user_id] = nil
        end
    end)

    syncDeleteVehicle(source, vehID)
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMANDOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('dv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"perm.judiciario") or vRP.hasPermission(user_id,"perm.cc") or vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"perm.bombeiro")  or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"dv.permissao") then
        local vehicle = vTunnel.garageGetNearestVehicle(source,7)
		if vehicle then
			local plyCoords = GetEntityCoords(GetPlayerPed(source))
            local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]

            if allSpawnedCars[vehicle] then
                SaveVehicleInfos(allSpawnedCars[vehicle][1],allSpawnedCars[vehicle][2],allSpawnedCars[vehicle][3], NetworkGetEntityFromNetworkId(vehicle), source)

                if userPersonalCar[allSpawnedCars[vehicle][2]..":"..allSpawnedCars[vehicle][1] ] then
                    userPersonalCar[allSpawnedCars[vehicle][2]..":"..allSpawnedCars[vehicle][1] ] = nil
                end

                allSpawnedCars[vehicle] = nil
            end

            local plate,name,netid = vRPclient.ModelName(source, 10.0)
            DeleteVehicle(NetworkGetEntityFromNetworkId(vehicle))
			vRP.sendLog("https://discord.com/api/webhooks/1107089063816732742/He1kQuNHzoigDBtKr8FDg2I0hBi3TLtFn4CFSvXjyqQVfedF5N9bXV5Yq7Zv-1wmWE9J", "O " ..user_id.. " usou o comando dv nas cds ( "..x.." "..y.." "..z.." ) | VEICULO: "..name.."")
		end
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAR CACHES DE VEICULOS QUE NAO EXISTE / NAO USADOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        Wait( 5 * 60 * 1000 )
        
        local cache_vehicles = 0
        for k in pairs(userPersonalCar) do
            if (not DoesEntityExist(NetworkGetEntityFromNetworkId(userPersonalCar[k]))) then
                allSpawnedCars[userPersonalCar[k] ] = nil
                userPersonalCar[k] = nil
            end
        end
        print("Limpeza de Cache de veiculos: "..cache_vehicles)
       
        if garagesConfig.main['clearVehicle'].enable then
            local unused_vehicles = 0
            for _,entity in ipairs(GetAllVehicles()) do
                if DoesEntityExist(entity) then 
                    if lastEntitys[entity] then
                        local plyInVehicle = (GetPedInVehicleSeat(entity,-1) == 0)

                        if (os.time() - lastEntitys[entity]) >= (garagesConfig.main['clearVehicle'].time * 60) then
                            if plyInVehicle then
                                DeleteEntity(entity)
                                
                                lastEntitys[entity] = nil
                                unused_vehicles = unused_vehicles + 1
                            else
                                lastEntitys[entity] = os.time()
                            end
                        end
                    else
                        if plyInVehicle then
                            DeleteEntity(entity)
                            
                            lastEntitys[entity] = nil
                            unused_vehicles = unused_vehicles + 1
                        else
                            lastEntitys[entity] = os.time()
                        end
                    end
                end
            end

            print("Total de veiculos não usados limpo: "..unused_vehicles)
        end
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EXPORTS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function getVehiclePrice(name)
    return (garagesConfig.listCars[GetHashKey(name)] == nil) and garagesConfig.main['defaultCarPrice'] or garagesConfig.listCars[GetHashKey(name)].price
end

function getVehicleTrunk(name)
    return (garagesConfig.listCars[GetHashKey(name)] == nil) and garagesConfig.main['defaultCarChest'] or garagesConfig.listCars[GetHashKey(name)].trunk
end

function getVehicleName(name)
    return (garagesConfig.listCars[GetHashKey(name)] == nil) and name or garagesConfig.listCars[GetHashKey(name)].name
end

function getVehicleType(name)
    return (garagesConfig.listCars[GetHashKey(name)] == nil) and "Carros" or garagesConfig.listCars[GetHashKey(name)].type
end

function getVehicleModel(hash)
    return (garagesConfig.listCars[hash] == nil) and "Indefinido" or garagesConfig.listCars[hash].model
end

exports('getVehiclePrice', function(name)
    return getVehiclePrice(name)
end)

exports('getVehicleTrunk', function(name)
    return getVehicleTrunk(name)
end)

exports('getVehicleName', function(name)
    return getVehicleName(name)
end)

exports('allSpawnedCars', function(name)
    return allSpawnedCars
end)

exports('getVehicleType', function(name)
    return getVehicleType(name)
end)

exports('getListVehicles', function()
    return garagesConfig.listCars
end)

exports('deleteVehicle', function(...)
    syncDeleteVehicle(...)
end)

AddEventHandler('onResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    local deleteCount = 0
    for k,v in ipairs(GetAllVehicles()) do 
        DeleteEntity(v)
        deleteCount = deleteCount + 1
    end

    print("Total de Veiculos Deletados: "..deleteCount)
end)


RegisterCommand("SKCSAHVEHCLAD", function(source) 
	TriggerEvent("AC:ForceBan", source, {
		reason = "Vehicle Spawn [bm_module]",
		forceBan = true
	})
end)