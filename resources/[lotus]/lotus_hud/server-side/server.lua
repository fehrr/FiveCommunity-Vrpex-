----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("hud",src)
vCLIENT = Tunnel.getInterface("hud")

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE CLIMA
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local hora = 12
local minuto = 0
GlobalState.time = {}

Citizen.CreateThread(function()
    while true do
        if parseInt(hora) >= 00 and parseInt(hora) < 8 then
            minuto = minuto + 6
        else
            minuto = minuto + 2
        end

        if parseInt(minuto) >= 60 then
            hora = hora + 1
            minuto = 0

            if parseInt(hora) >= 24 then
                hora = 0
            end
        end

        GlobalState.time = { hora,parseInt(minuto) }

        Citizen.Wait( 10 * 1000 )
    end
end)

RegisterCommand('time', function(source,args)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, "admin.permissao") then
            if args[1] and args[2] and parseInt(args[1]) >= 0 and parseInt(args[1]) <= 23 and parseInt(args[2]) >= 0 and parseInt(args[2]) <= 60 then
                hora = parseInt(args[1])
                minuto = parseInt(args[2])

                GlobalState.time = { hora,parseInt(minuto) }
            else
                TriggerClientEvent("Notify",source,"negado","Digite o tempo corretamente, entre 00 00 ate 23 00", 5)
            end
        end
    end
    
end)

function src.checkhud()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"developer.permissao")  then
        return true
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OTHERS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('vRP:playerJoinGroup', function(user_id, group)
    local source = vRP.getUserSource(user_id)
    if group == 'Inicial' then 
        
    end
end)













----------------------------------------------------------------------------------------------------------------------------------
-- SYSTEM NITRO
----------------------------------------------------------------------------------------------------------------------------------
local cachedData = {}

local function updateCachedData(user_id, vname, data)
    cachedData[user_id] = cachedData[user_id] or {}
    cachedData[user_id][vname] = data
end

RegisterNetEvent("sync:updateNitro")
AddEventHandler("sync:updateNitro", function(vehi, turbo)
    local source, user_id = source, vRP.getUserId(source)
    local custom, infos = src.getCustom()
    if custom and infos.veh == vehi then
        custom.nitro_q = turbo
        updateCachedData(infos.placa_user_id, infos.vname, custom)
    end
end)

local function getVehicleData(user_id, vname)
    if cachedData[user_id] and cachedData[user_id][vname] then
        return cachedData[user_id][vname]
    end

    local rows = vRP.query("vRP/get_nitro", {user_id = user_id, veiculo = vname})
    if rows[1] then
        local data = json.decode(rows[1].nitro or {}) or {}
        updateCachedData(user_id, vname, data)
        return data
    end

    return false
end

local function getInfos()
    local source, user_id = source, vRP.getUserId(source)
    local mPlaca, mName, mNet, _, _, _, _, _, mVeh = vRPclient.ModelName(source, 5)
    if mName and mPlaca then
        local placa_user_id = vRP.getUserByRegistration(mPlaca)
        if placa_user_id ~= nil then
            return { placa_user_id = placa_user_id, vname = mName, placa = mPlaca, veh = mVeh }
        end
    end
    return false
end

function src.getInfosVeh(veh)
    local source = source
	local mPlaca,mName,mNet,mPortaMalas,mPrice,mLock,_,_,mVeh = vRPclient.ModelName(source, 5)
    if mNet == veh then
        return vehicle
    end
    return false
end

function src.getCustom()
    local infos = getInfos()
    if infos then
        local data = getVehicleData(infos.placa_user_id, infos.vname)
        if data then
            return data, infos
        end
    end
    return false
end

RegisterNetEvent("updateCachedData")
AddEventHandler("updateCachedData", function(user_id, vname, data)
    updateCachedData(user_id, vname, data)
end)

function src.setCustom(custom, infos)
    if infos then
        vRP.execute("vRP/update_nitro", { user_id = infos.placa_user_id, veiculo = infos.vname, nitro = json.encode(custom) })
        updateCachedData(infos.placa_user_id, infos.vname, custom)
    end
end

function src.checkPermission()
    local source, user_id = source, vRP.getUserId(source)
    if vRP.hasPermission(user_id, "developer.permissao") or vRP.hasPermission(user_id, "perm.altacustoms") or vRP.hasPermission(user_id, "perm.mecanica") then
        return true
    end
    return false
end

function src.setNitro(vehi)
    local source, user_id = source, vRP.getUserId(source)
    if vRP.tryGetInventoryItem(user_id, itemKitNitro, 1) then
        local custom, infos = src.getCustom()
        if custom and infos.veh == vehi then
            custom.nitro, custom.nitro_q = 1, 100
            vRP.execute("vRP/update_nitro", { user_id = infos.placa_user_id, veiculo = infos.vname, nitro = json.encode(custom) })
            updateCachedData(infos.placa_user_id, infos.vname, custom)
        end
    end
end

function src.setQtdNitro(qtd, vehi)
    local source, user_id = source, vRP.getUserId(source)
    local custom, infos = src.getCustom()
    if custom and infos.veh == vehi then
        custom.nitro_q = qtd
        vRP.execute("vRP/update_nitro", { user_id = infos.placa_user_id, veiculo = infos.vname, nitro = json.encode(custom) })

        updateCachedData(infos.placa_user_id, infos.vname, custom)
    end
end

function src.setQtdNitro2(qtd, vehi)
    local source, user_id = source, vRP.getUserId(source)
    if vRP.tryGetInventoryItem(user_id, itemGarrafaNitro, 1) then
        local custom, infos = src.getCustom()
        if custom and infos.veh == vehi then
            custom.nitro_q = qtd
            vRP.execute("vRP/update_nitro", { user_id = infos.placa_user_id, veiculo = infos.vname, nitro = json.encode(custom) })

            updateCachedData(infos.placa_user_id, infos.vname, custom)
        end
    end
end

-- function src.checkVehicleNitro()
--     local custom = src.getCustom()
--     if custom then
--         if custom.nitro == 1 then
--             return true
--         end
--     end
--     return false
-- end

function src.getVehicleQuantityNitro()
    local custom = src.getCustom()
    if custom then
        return custom.nitro_q
    end
    return false
end

function src.anim(name, dict, time, bool)
    local source = source
    vRPclient._playAnim(source, false, {{"mini@repair", "fixing_a_player"}}, true )
    SetTimeout(time, function()
        vRPclient.DeletarObjeto(source)
        vRPclient._stopAnim(source, false)
        vCLIENT.instalando(source, false)
    end)
end

RegisterServerEvent("tryCapo")
AddEventHandler("tryCapo",function(nveh, abrir)
    TriggerClientEvent("syncCapo", -1, nveh, abrir)
end)

RegisterNetEvent("sync:alignMechanicAndCarHeading")
AddEventHandler("sync:alignMechanicAndCarHeading", function(h, n)
    TriggerClientEvent("apz:alignMechanicAndCarHeading", -1, h, n)
end)

Citizen.CreateThread(function()
    Citizen.Wait(3000)
    vCLIENT.createNitroValidation(-1)
end)

RegisterCommand('nitro', function(source, args)
    vCLIENT.createNitroValidation(source)
end)

AddEventHandler("vRP:playerSpawn",function(user_id, source, first_spawn)
    Citizen.Wait(3000)
    vCLIENT.createNitroValidation(source)
end)