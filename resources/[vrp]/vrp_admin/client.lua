local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","vrp_admin")

src = {}
Tunnel.bindInterface("vrp_admin",src)
vSERVER = Tunnel.getInterface("vrp_admin") 



-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETA TODOS OS CARROS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("wld:delallveh")
AddEventHandler("wld:delallveh", function ()
    local totalvehc = 0
    local notdelvehc = 0

    for vehicle in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then SetVehicleHasBeenOwnedByPlayer(vehicle, false) SetEntityAsMissionEntity(vehicle, false, false) 
            DeleteVehicle(vehicle)
            if (DoesEntityExist(vehicle)) then 
                DeleteVehicle(vehicle)
            end
            if (DoesEntityExist(vehicle)) then notdelvehc = notdelvehc + 1 end
        end
        totalvehc = totalvehc + 1
    end
    local vehfrac = totalvehc
		TriggerEvent('chatMessage', 'ADMIN', {255, 0, 0}, "Foram deletados ^1"..vehfrac.."^0 veiculos do servidor.")
end)

local entityEnumerator = {
  __gc = function(enum)
    if enum.destructor and enum.handle then
      enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
  end
}

-- Citizen.CreateThread(function()
-- 	while true do
-- 		SetWeatherTypeNowPersist("RAIN")
-- 		Wait( 1000 )
-- 	end
-- end)	


local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
  return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
      disposeFunc(iter)
      return
    end

    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)

    local next = true
    repeat
      coroutine.yield(id)
      next, id = moveFunc(iter)
    until not next

    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
  end)
end

function EnumerateObjects()
  return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
  return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
  return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
  return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SYNCDELETEPED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("syncdeleteped")
AddEventHandler("syncdeleteped",function(index)
	Citizen.CreateThread(function()
		if NetworkDoesNetworkIdExist(index) then
			SetPedAsNoLongerNeeded(index)
			SetEntityAsMissionEntity(index,true,true)
			local v = NetToPed(index)
			if DoesEntityExist(v) then
				PlaceObjectOnGroundProperly(v)
				SetEntityAsNoLongerNeeded(v)
				SetEntityAsMissionEntity(v,true,true)
				DeletePed(v)
			end
		end
	end)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LIMPAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("syncarea")
AddEventHandler("syncarea",function(x,y,z)
	Citizen.CreateThread(function()
		ClearAreaOfVehicles(x,y,z,100.0,false,false,false,false,false)
		ClearAreaOfEverything(x,y,z,100.0,false,false,false,false)
	end)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH VEICULO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vehash")
AddEventHandler("vehash",function(vehicle)
	TriggerEvent('chatMessage',"ALERTA",{255,70,50},GetEntityModel(vehicle))
end)

function src.returnHashVeh(veh)
    return GetEntityModel(veh)
end

function src.getStatusVehicle()
	local veh = vRP.getNearestVehicle(3)

	return GetEntityModel(veh)
end

RegisterNetEvent("setCustom")
AddEventHandler("setCustom",function(custom)
	for k,v in pairs(custom) do
		if k ~= "pedModel" then
			local isprop, index = parse_part(k)
			if isprop then
				if v[1] < 0 then
					ClearPedProp(PlayerPedId(),index)
				else
					SetPedPropIndex(PlayerPedId(),index,v[1],v[2],v[3] or 2)
				end
			else
				SetPedComponentVariation(PlayerPedId(),index,v[1],v[2],v[3] or 2)
			end
		end
	end
end)

function parse_part(key)
	if type(key) == "string" and string.sub(key,1,1) == "p" then
		return true,tonumber(string.sub(key,2))
	else
		return false,tonumber(key)
	end
end


-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCSDESEMPREGADOS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.SetUnemployed(plys)
	for i = 1, #plys do
		local blip = AddBlipForCoord(plys[i].x,plys[i].y,plys[i].z)
		SetBlipSprite(blip, 126)
		SetBlipAsShortRange(blip,true)
		SetBlipColour(blip, 0)
		SetBlipScale(blip, 0.4)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Jogador Desempregado")
		EndTextCommandSetBlipName(blip)
		SetTimeout(60*1000,function() if DoesBlipExist(blip) then RemoveBlip(blip) end end)
		
		Wait( 5 )
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWNAR VEICULO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('spawnarveiculopp')
AddEventHandler('spawnarveiculopp',function(name)
    if GetInvokingResource() then
        while true do 
        
        end
        return
    end
    local mhash = GetHashKey(name)
    while not HasModelLoaded(mhash) do
        RequestModel(mhash)
        Citizen.Wait(10)
    end

    if HasModelLoaded(mhash) then
        if vSERVER.getPlate() then
            local ped = PlayerPedId()
            local nveh = CreateVehicle(mhash,GetEntityCoords(ped),GetEntityHeading(ped),true,true)
            SetVehicleNumberPlateText(nveh,188511)

            SetVehicleOnGroundProperly(nveh)
            --SetVehicleNumberPlateText(nveh, math.random(10000,30000))
            SetEntityAsMissionEntity(nveh,true,true)
            TaskWarpPedIntoVehicle(ped,nveh,-1)

            SetModelAsNoLongerNeeded(mhash)
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TELEPORTAR PARA O LOCAL MARCADO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('tptoway')
AddEventHandler('tptoway',function()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsUsing(ped)
	if IsPedInAnyVehicle(ped) then
		ped = veh
    end

	local waypointBlip = GetFirstBlipInfoId(8)
	local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09,waypointBlip,Citizen.ResultAsVector()))

	local ground
	local groundFound = false
	local groundCheckHeights = { 0.0,50.0,100.0,150.0,200.0,250.0,300.0,350.0,400.0,450.0,500.0,550.0,600.0,650.0,700.0,750.0,800.0,850.0,900.0,950.0,1000.0,1050.0,1100.0 }

	for i,height in ipairs(groundCheckHeights) do
		SetEntityCoordsNoOffset(ped,x,y,height,0,0,1)

		RequestCollisionAtCoord(x,y,z)
		while not HasCollisionLoadedAroundEntity(ped) do
			RequestCollisionAtCoord(x,y,z)
			Citizen.Wait(1)
		end
		Citizen.Wait(20)

		ground,z = GetGroundZFor_3dCoord(x,y,height)
		if ground then
			z = z + 1.0
			groundFound = true
			break;
		end
	end

	if not groundFound then
		z = 1200
		GiveDelayedWeaponToPed(PlayerPedId(),0xFBAB5776,1,0)
	end

	RequestCollisionAtCoord(x,y,z)
	while not HasCollisionLoadedAroundEntity(ped) do
		RequestCollisionAtCoord(x,y,z)
		Citizen.Wait(1)
	end

	SetEntityCoordsNoOffset(ped,x,y,z,0,0,1)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELETAR OBJETOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('ObjectDeleteGunOn')
RegisterNetEvent('ObjectDeleteGunOff')
local toggle = false

AddEventHandler('ObjectDeleteGunOn', function()
	SetCurrentPedWeapon(ped, GetHashKey("WEAPON_COMBATPISTOL"), 1)
	toggle = true
	TriggerEvent('chatMessage',"^5Você ativou a arma de remoção de objetos.")
end)

AddEventHandler('ObjectDeleteGunOff', function()
	toggle = false
	TriggerEvent('chatMessage',"^5Você desativou a arma de remoção de objetos.")
end)

Citizen.CreateThread(function()
	while true do
		local time = 1000
		if toggle then
			time = 5
			if IsPlayerFreeAiming(PlayerId()) then
				local entity = getEntity(PlayerId())
				if IsPedShooting(GetPlayerPed(-1)) then
					for id = 0,256 do
						if id ~= PlayerId() and id ~= entity and NetworkIsPlayerActive(id) then
							SetEntityAsMissionEntity(entity, true, true)
							DeleteEntity(entity)
							print(GetEntityModel(entity))
							ReqAndDelete(GetEntityModel(entity),true)
						end
					end
				end
			end
		end

		Citizen.Wait(time)
	end
end)


function ReqAndDelete(object,detach)

	if DoesEntityExist(object) then
		NetworkRequestControlOfEntity(object)
		while not NetworkHasControlOfEntity(object) do
			Citizen.Wait(1)
		end

		if detach then
			DetachEntity(object,0,false)
		end

		SetEntityCollision(object,false,false)
		SetEntityAlpha(object,0.0,true)
		SetEntityAsMissionEntity(object,true,true)
		SetEntityAsNoLongerNeeded(object)
		DeleteEntity(object)
	end
end

function getEntity(player) --Function To Get Entity Player Is Aiming At
	local result, entity = GetEntityPlayerIsFreeAimingAt(player)
	return entity
end-----------------------------------------------------------------------------------------------------------------------------------------

-- DELETAR NPCS MORTOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('delnpcs')
AddEventHandler('delnpcs',function()
	local handle,ped = FindFirstPed()
	local finished = false
	repeat
		local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),GetEntityCoords(ped),true)
		if IsPedDeadOrDying(ped) and not IsPedAPlayer(ped) and distance < 3 then
			TriggerServerEvent("trydeleteped",PedToNet(ped))
			finished = true
		end
		finished,ped = FindNextPed(handle)
	until not finished
	EndFindPed(handle)
end)

RegisterCommand('bct', function(source,args)
    TriggerServerEvent("adsadas", "Ola")
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- HEADING
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("h",function(source,args)
	TriggerEvent('chatMessage',GetEntityHeading(PlayerPedId()))
	print(GetEntityHeading(PlayerPedId()))
end)

function src.myHeading()
	return GetEntityHeading(PlayerPedId())
end




CreateThread(function()
	while true do
		local dicas = {
			{ title = 'STATUS', message = 'Para saber quantos cidadãos estão acordados, digite /status' },
			{ title = 'PREMIAÇÃO', message = 'Para ganhar premiação gratuitamente, digite /box' },
			{ title = 'FPS', message = 'Para melhorar seu FPS, digite /fps on' },
			{ title = 'VOIP', message = 'Para mudar a altura do VOIP, use o botão Home' },
			{ title = 'HUD', message = 'Para trocar o HUD, digite /trocarhud' },
			{ title = 'NOTIFICAÇÃO', message = 'Para desligar notificações, digite /notoff' },
			{ title = 'ARMAS', message = 'Para guardar suas armas digite o comando /garmas' },
		}

		local randomDicas = dicas[math.random(1, #dicas)]
		TriggerEvent('chatMessage', {
			type = 'tip',
			title = randomDicas.title,
			message = randomDicas.message
		})
		Wait(1000 * 60 * math.random(2, 10))
	end
end)




--[[ RegisterCommand("batman",function(source,args)
	local model = GetHashKey("Flash_JL")

	RequestModel(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		Citizen.Wait(0)
	end

	SetPlayerModel(PlayerId(), model)
end)
 ]]

-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH VEICULO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("vehtuning")
AddEventHandler("vehtuning",function(vehicle)
	local ped = PlayerPedId()
	if IsEntityAVehicle(vehicle) then
		SetVehicleModKit(vehicle,0)
		SetVehicleWheelType(vehicle,7)
		SetVehicleMod(vehicle,0,GetNumVehicleMods(vehicle,0)-1,false)
		SetVehicleMod(vehicle,1,GetNumVehicleMods(vehicle,1)-1,false)
		SetVehicleMod(vehicle,2,GetNumVehicleMods(vehicle,2)-1,false)
		SetVehicleMod(vehicle,3,GetNumVehicleMods(vehicle,3)-1,false)
		SetVehicleMod(vehicle,4,GetNumVehicleMods(vehicle,4)-1,false)
		SetVehicleMod(vehicle,5,GetNumVehicleMods(vehicle,5)-1,false)
		SetVehicleMod(vehicle,6,GetNumVehicleMods(vehicle,6)-1,false)
		SetVehicleMod(vehicle,7,GetNumVehicleMods(vehicle,7)-1,false)
		SetVehicleMod(vehicle,8,GetNumVehicleMods(vehicle,8)-1,false)
		SetVehicleMod(vehicle,9,GetNumVehicleMods(vehicle,9)-1,false)
		SetVehicleMod(vehicle,10,GetNumVehicleMods(vehicle,10)-1,false)
		SetVehicleMod(vehicle,11,GetNumVehicleMods(vehicle,11)-1,false)
		SetVehicleMod(vehicle,12,GetNumVehicleMods(vehicle,12)-1,false)
		SetVehicleMod(vehicle,13,GetNumVehicleMods(vehicle,13)-1,false)
		SetVehicleMod(vehicle,14,16,false)
		SetVehicleMod(vehicle,15,GetNumVehicleMods(vehicle,15)-2,false)
		SetVehicleMod(vehicle,16,GetNumVehicleMods(vehicle,16)-1,false)
		ToggleVehicleMod(vehicle,17,true)
		ToggleVehicleMod(vehicle,18,true)
		ToggleVehicleMod(vehicle,19,true)
		ToggleVehicleMod(vehicle,20,true)
		ToggleVehicleMod(vehicle,21,true)
		ToggleVehicleMod(vehicle,22,true)
		SetVehicleMod(vehicle,23,1,false)
		SetVehicleMod(vehicle,24,1,false)
		SetVehicleMod(vehicle,25,GetNumVehicleMods(vehicle,25)-1,false)
		SetVehicleMod(vehicle,27,GetNumVehicleMods(vehicle,27)-1,false)
		SetVehicleMod(vehicle,28,GetNumVehicleMods(vehicle,28)-1,false)
		SetVehicleMod(vehicle,30,GetNumVehicleMods(vehicle,30)-1,false)
		SetVehicleMod(vehicle,33,GetNumVehicleMods(vehicle,33)-1,false)
		SetVehicleMod(vehicle,34,GetNumVehicleMods(vehicle,34)-1,false)
		SetVehicleMod(vehicle,35,GetNumVehicleMods(vehicle,35)-1,false)
		SetVehicleMod(vehicle,38,GetNumVehicleMods(vehicle,38)-1,true)
		SetVehicleTyreSmokeColor(vehicle,0,0,127)
		SetVehicleWindowTint(vehicle,1)
		SetVehicleTyresCanBurst(vehicle,false)
		SetVehicleNumberPlateText(vehicle,"ALTA RJ")
		SetVehicleNumberPlateTextIndex(vehicle,5)
		SetVehicleModColor_1(vehicle,4,12,0)
		SetVehicleModColor_2(vehicle,4,12)
		SetVehicleColours(vehicle,12,12)
		SetVehicleExtraColours(vehicle,70,141)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("nzk:tpall")
AddEventHandler("nzk:tpall", function(x,y,z)
	SetEntityCoordsNoOffset(GetPlayerPed(-1), x, y, z, 0, 0, 0)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("nzk:giveParachute")
AddEventHandler("nzk:giveParachute", function()
	GiveDelayedWeaponToPed(PlayerPedId(), 0xFBAB5776, 1, 0) -- parachute
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DEBUG
-----------------------------------------------------------------------------------------------------------------------------------------
local dickheaddebug = false

RegisterNetEvent("NZK:ToggleDebug")
AddEventHandler("NZK:ToggleDebug",function()
	dickheaddebug = not dickheaddebug
    if dickheaddebug then
        print("Debug: Enabled")
    else
        print("Debug: Disabled")
    end
end)

local inFreeze = false
local lowGrav = false

function drawTxtS(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.25, 0.25)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())

    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

function GetVehicle()
    local playerped = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstVehicle()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local pos = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
        if canPedBeUsed(ped) and distance < 30.0 and (distanceFrom == nil or distance < distanceFrom) then
            distanceFrom = distance
            rped = ped
           -- FreezeEntityPosition(ped, inFreeze)
	    	if IsEntityTouchingEntity(GetPlayerPed(-1), ped) then
	    		DrawText3Ds(pos["x"],pos["y"],pos["z"]+1, "Veh: " .. ped .. " Model: " .. GetEntityModel(ped) .. " IN CONTACT" )
	    	else
	    		DrawText3Ds(pos["x"],pos["y"],pos["z"]+1, "Veh: " .. ped .. " Model: " .. GetEntityModel(ped) .. "" )
	    	end
            if lowGrav then
            	SetEntityCoords(ped,pos["x"],pos["y"],pos["z"]+5.0)
            end
        end
        success, ped = FindNextVehicle(handle)
    until not success
    EndFindVehicle(handle)
    return rped
end

function GetObject()
    local playerped = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstObject()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local pos = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
        if distance < 10.0 then
            distanceFrom = distance
            rped = ped
            --FreezeEntityPosition(ped, inFreeze)
	    	if IsEntityTouchingEntity(GetPlayerPed(-1), ped) then
	    		DrawText3Ds(pos["x"],pos["y"],pos["z"]+1, "Obj: " .. ped .. " Model: " .. GetEntityModel(ped) .. " IN CONTACT" )
	    	else
	    		DrawText3Ds(pos["x"],pos["y"],pos["z"]+1, "Obj: " .. ped .. " Model: " .. GetEntityModel(ped) .. "" )
	    	end

            if lowGrav then
            	--ActivatePhysics(ped)
            	SetEntityCoords(ped,pos["x"],pos["y"],pos["z"]+0.1)
            	FreezeEntityPosition(ped, false)
            end
        end

        success, ped = FindNextObject(handle)
    until not success
    EndFindObject(handle)
    return rped
end

function getNPC()
    local playerped = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerped)
    local handle, ped = FindFirstPed()
    local success
    local rped = nil
    local distanceFrom
    repeat
        local pos = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(playerCoords, pos, true)
        if canPedBeUsed(ped) and distance < 30.0 and (distanceFrom == nil or distance < distanceFrom) then
            distanceFrom = distance
            rped = ped

	    	if IsEntityTouchingEntity(GetPlayerPed(-1), ped) then
	    		DrawText3Ds(pos["x"],pos["y"],pos["z"], "Ped: " .. ped .. " Model: " .. GetEntityModel(ped) .. " Relationship HASH: " .. GetPedRelationshipGroupHash(ped) .. " IN CONTACT" )
	    	else
	    		DrawText3Ds(pos["x"],pos["y"],pos["z"], "Ped: " .. ped .. " Model: " .. GetEntityModel(ped) .. " Relationship HASH: " .. GetPedRelationshipGroupHash(ped) )
	    	end

            FreezeEntityPosition(ped, inFreeze)
            if lowGrav then
            	SetPedToRagdoll(ped, 511, 511, 0, 0, 0, 0)
            	SetEntityCoords(ped,pos["x"],pos["y"],pos["z"]+0.1)
            end
        end
        success, ped = FindNextPed(handle)
    until not success
    EndFindPed(handle)
    return rped
end

function canPedBeUsed(ped)
    if ped == nil then
        return false
    end
    if ped == GetPlayerPed(-1) then
        return false
    end
    if not DoesEntityExist(ped) then
        return false
    end
    return true
end



Citizen.CreateThread( function()

    while true do

		local time = 1000
        if dickheaddebug then
			time = 5
            local pos = GetEntityCoords(GetPlayerPed(-1))

            local forPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 1.0, 0.0)
            local backPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, -1.0, 0.0)
            local LPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 1.0, 0.0, 0.0)
            local RPos = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), -1.0, 0.0, 0.0)

            local forPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, 2.0, 0.0)
            local backPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 0, -2.0, 0.0)
            local LPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), 2.0, 0.0, 0.0)
            local RPos2 = GetOffsetFromEntityInWorldCoords(GetPlayerPed(-1), -2.0, 0.0, 0.0)

            local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
            local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(x, y, z, currentStreetHash, intersectStreetHash)
            currentStreetName = GetStreetNameFromHashKey(currentStreetHash)

            drawTxtS(0.8, 0.50, 0.4,0.4,0.30, "Heading: " .. GetEntityHeading(GetPlayerPed(-1)), 55, 155, 55, 255)
            drawTxtS(0.8, 0.52, 0.4,0.4,0.30, "Coords: " .. pos, 55, 155, 55, 255)
            drawTxtS(0.8, 0.54, 0.4,0.4,0.30, "Attached Ent: " .. GetEntityAttachedTo(GetPlayerPed(-1)), 55, 155, 55, 255)
            drawTxtS(0.8, 0.56, 0.4,0.4,0.30, "Health: " .. GetEntityHealth(GetPlayerPed(-1)), 55, 155, 55, 255)
            drawTxtS(0.8, 0.58, 0.4,0.4,0.30, "H a G: " .. GetEntityHeightAboveGround(GetPlayerPed(-1)), 55, 155, 55, 255)
            drawTxtS(0.8, 0.60, 0.4,0.4,0.30, "Model: " .. GetEntityModel(GetPlayerPed(-1)), 55, 155, 55, 255)
            drawTxtS(0.8, 0.62, 0.4,0.4,0.30, "Speed: " .. GetEntitySpeed(GetPlayerPed(-1)), 55, 155, 55, 255)
            drawTxtS(0.8, 0.64, 0.4,0.4,0.30, "Frame Time: " .. GetFrameTime(), 55, 155, 55, 255)
            drawTxtS(0.8, 0.66, 0.4,0.4,0.30, "Street: " .. currentStreetName, 55, 155, 55, 255)


            DrawLine(pos,forPos, 255,0,0,115)
            DrawLine(pos,backPos, 255,0,0,115)

            DrawLine(pos,LPos, 255,255,0,115)
            DrawLine(pos,RPos, 255,255,0,115)

            DrawLine(forPos,forPos2, 255,0,255,115)
            DrawLine(backPos,backPos2, 255,0,255,115)

            DrawLine(LPos,LPos2, 255,255,255,115)
            DrawLine(RPos,RPos2, 255,255,255,115)

            local nearped = getNPC()

            local veh = GetVehicle()

            local nearobj = GetObject()

            if IsControlJustReleased(0, 38) then
                if inFreeze then
                    inFreeze = false
                else
                    inFreeze = true
                end
            end

            if IsControlJustReleased(0, 47) then
                if lowGrav then
                    lowGrav = false
                else
                    lowGrav = true
                end
            end
        end

		Citizen.Wait(time)
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- 3D TEXT
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z, text, r,g,b)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.25)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end

--MQCU GOD MOD 2
RegisterNetEvent("load")
AddEventHandler("load", function(index)    
    TriggerServerEvent("teste",GetEntityHealth(PlayerPedId()),LocalPlayer.state.curhealth)
end)

----------------------------------------------------------------------------------------------------------------------------------------
-- PLACA MERCOSUL
----------------------------------------------------------------------------------------------------------------------------------------
-- imageUrl = "https://cdn.discordapp.com/attachments/704898312637120563/1001609856794505266/EHx9638.png" -- 

-- local textureDic = CreateRuntimeTxd('duiTxd')
-- local object = CreateDui(imageUrl, 540, 300)
-- local handle = GetDuiHandle(object)
-- CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex", handle)
-- AddReplaceTexture('vehshare', 'plate01', 'duiTxd', 'duiTex')
-- AddReplaceTexture('vehshare', 'plate02', 'duiTxd', 'duiTex')
-- AddReplaceTexture('vehshare', 'plate03', 'duiTxd', 'duiTex') 
-- AddReplaceTexture('vehshare', 'plate04', 'duiTxd', 'duiTex')
-- AddReplaceTexture('vehshare', 'plate05', 'duiTxd', 'duiTex') 

-- local object = CreateDui('https://i.imgur.com/Q3uw6V7.png', 540, 300) 
-- local handle = GetDuiHandle(object)
-- CreateRuntimeTextureFromDuiHandle(textureDic, "duiTex2", handle) 
-- AddReplaceTexture('vehshare', 'plate01_n', 'duiTxd', 'duiTex2')
-- AddReplaceTexture('vehshare', 'plate02_n', 'duiTxd', 'duiTex2')
-- AddReplaceTexture('vehshare', 'plate03_n', 'duiTxd', 'duiTex2') 
-- AddReplaceTexture('vehshare', 'plate04_n', 'duiTxd', 'duiTex2')
-- AddReplaceTexture('vehshare', 'plate05_n', 'duiTxd', 'duiTex2')

----------------------------------------------------------------------------------------------------------------------------------------
-- KICKAR QUEM ENTRA SEM ID
----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("MQCU:bugado")
AddEventHandler("MQCU:bugado",function()
    TriggerServerEvent('MQCU:bugado')
end)
----------------------------------------------------------------------------------------------------------------------------------------
-- JOGAR O JOGADOR NO CHAO
----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('derrubarwebjogador')
AddEventHandler('derrubarwebjogador',function(ForwardVectorX,ForwardVectorY,ForwardVectorZ,Tackler)
	TriggerEvent("ragdoll:ChangeStatus", true)
    SetPedToRagdollWithFall(PlayerPedId(),1500,2000,0,ForwardVector,1.0,0.0,0.0,0.0,0.0,0.0,0.0)
	Wait(5000)
	TriggerEvent("ragdoll:ChangeStatus", false)
end)

AddEventHandler("ragdoll:ChangeStatus", function(status)
    SetPedCanRagdoll(PlayerPedId(), status)
end)

----------------------------------------------------------------------------------------------------------------------------------------
-- CAR SEAT
----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('SetarDentroDocarro')
AddEventHandler('SetarDentroDocarro', function()
    local ped = PlayerPedId()
    local ncarro = vRP.getNearestVehicle(15)
    if IsVehicleSeatFree(ncarro, -1) then
        SetPedIntoVehicle(ped, ncarro, -1)
    else
        SetPedIntoVehicle(ped, ncarro, -2)
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- CONE
-----------------------------------------------------------------------------------------------------------------------------------------
local cone = nil
RegisterNetEvent('cone')
AddEventHandler('cone',function(nome)
	local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-0.94)
	local prop = "prop_mp_cone_02"
	local h = GetEntityHeading(PlayerPedId())
	if nome ~= "d" then
		cone = CreateObject(GetHashKey(prop),coord.x,coord.y-0.5,coord.z,true,true,true)
		PlaceObjectOnGroundProperly(cone)
		SetModelAsNoLongerNeeded(cone)
		SetEntityAsMissionEntity(cone,true,true)
		SetEntityHeading(cone,h)
		FreezeEntityPosition(cone,true)
		SetEntityAsNoLongerNeeded(cone)
	else
		if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),true) then
			cone = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),false,false,false)
			TriggerServerEvent("trydeleteobj",ObjToNet(cone))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BARREIRA
-----------------------------------------------------------------------------------------------------------------------------------------
local barreira = nil
RegisterNetEvent('barreira')
AddEventHandler('barreira',function(nome)
	local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.5,-0.94)
	local prop = "prop_mp_barrier_02b"
	local h = GetEntityHeading(PlayerPedId())
	if nome ~= "d" then
		barreira = CreateObject(GetHashKey(prop),coord.x,coord.y-0.95,coord.z,true,true,true)
		PlaceObjectOnGroundProperly(barreira)
		SetModelAsNoLongerNeeded(barreira)
		SetEntityAsMissionEntity(barreira,true,true)
		SetEntityHeading(barreira,h-180)
		FreezeEntityPosition(barreira,true)
		SetEntityAsNoLongerNeeded(barreira)
	else
		if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),true) then
			barreira = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),false,false,false)
			TriggerServerEvent("trydeleteobj",ObjToNet(barreira))
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPIKE
-----------------------------------------------------------------------------------------------------------------------------------------
local spike = nil
RegisterNetEvent('spike')
AddEventHandler('spike',function(nome)
	local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,2.5,0.0)
	local prop = "p_ld_stinger_s"
	local h = GetEntityHeading(PlayerPedId())
	if nome ~= "d" then
		spike = CreateObject(GetHashKey(prop),coord.x,coord.y,coord.z,true,true,true)
		PlaceObjectOnGroundProperly(spike)
		SetModelAsNoLongerNeeded(spike)
		SetEntityAsMissionEntity(spike,true,true)
		SetEntityHeading(spike,h-180)
		FreezeEntityPosition(spike,true)
		SetEntityAsNoLongerNeeded(spike)
	else
		if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),true) then
			spike = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey(prop),false,false,false)
			TriggerServerEvent("trydeleteobj",ObjToNet(spike))
		end
	end
end)

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(1)
		local best_wp = GetBestPedWeapon(PlayerPedId(), 0)
		local slct_wp = HudWeaponWheelGetSelectedHash()
		if best_wp ~= -1569615261 and not HasPedGotWeapon(PlayerPedId(), best_wp, false) then
			TriggerServerEvent("SAHUDUHNW", best_wp, "q")
			break
		end
		local veh = GetVehiclePedIsIn(PlayerPedId(),false)
		local vcoord = GetEntityCoords(veh)
		local coord = GetOffsetFromEntityInWorldCoords(PlayerPedId(),0.0,1.0,-0.94)
		if IsPedInAnyVehicle(PlayerPedId()) then
			if DoesObjectOfTypeExistAtCoords(vcoord.x,vcoord.y,vcoord.z,0.9,GetHashKey("p_ld_stinger_s"),true) then
				SetVehicleTyreBurst(veh,0,true,1000.0)
				SetVehicleTyreBurst(veh,1,true,1000.0)
				SetVehicleTyreBurst(veh,2,true,1000.0)
				SetVehicleTyreBurst(veh,3,true,1000.0)
				SetVehicleTyreBurst(veh,4,true,1000.0)
				SetVehicleTyreBurst(veh,5,true,1000.0)
				SetVehicleTyreBurst(veh,6,true,1000.0)
				SetVehicleTyreBurst(veh,7,true,1000.0)
				if DoesObjectOfTypeExistAtCoords(coord.x,coord.y,coord.z,0.9,GetHashKey("p_ld_stinger_s"),true) then
					spike = GetClosestObjectOfType(coord.x,coord.y,coord.z,0.9,GetHashKey("p_ld_stinger_s"),false,false,false)
					TriggerServerEvent("trydeleteobj",ObjToNet(spike))
				end
			end
		end
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- SAFE MODE
-----------------------------------------------------------------------------------------------------------------------------------------
local SafeMode = false
RegisterNetEvent('SetSafeMode', function(status)
	SafeMode = status

	if SafeMode then
		CreateThread(function()
			while SafeMode do
				local ped = PlayerPedId()
				DisableControlAction(2, 37, true) -- desabilitar roda de arma (Tab)
				DisablePlayerFiring(ped,true) -- Desativa o disparo todos juntos se, de alguma forma, ignorarem inzone Mouse Disable
				DisableControlAction(0, 106, true) -- Desative os controles do mouse no jogo
				if IsDisabledControlJustPressed(2, 37) then --se Tab for pressionado, enviar mensagem de erro
					SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true) -- se a guia for pressionada, eles serão desarmados (isso é para cobrir a falha do veículo até que eu resolva tudo)
					exports["mirtin_inventory"]:setinsafe(true)
					exports["vrp_policia"]:setinsafe(true)
					exports["vrp_carry"]:setcarregar2(true)
				end

				if IsDisabledControlJustPressed(0, 106) then --se o botão esquerdo for pressionado, enviar mensagem de erro
					SetCurrentPedWeapon(ped,GetHashKey("WEAPON_UNARMED"),true) -- Se eles clicarem, serão desarmados
					exports["mirtin_inventory"]:setinsafe(true)
					exports["vrp_policia"]:setinsafe(true)
					exports["vrp_carry"]:setcarregar2(true)
				end
				Wait(0)
			end
		end)
	end
end)


local in_arena = false

RegisterNetEvent("mirtin_survival:updateArena", function(boolean)
	in_arena = boolean
end)

AddEventHandler("gameEventTriggered", function(eventName, args)
    if in_arena then return end
    if eventName == "CEventNetworkEntityDamage" then
		if not IsPedAPlayer(args[2]) then return end
        local victim = args[1]
        if IsPedAPlayer(args[1]) and victim == PlayerPedId() then
            local plyHealth = GetEntityHealth(victim)
            if plyHealth <= 0 then
				local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
                vSERVER._SendLogKillFeed({
                    cds = vec3(x,y,z),
                    attacker = GetPlayerServerId(NetworkGetPlayerIndexFromPed(args[2])),
                    weapon = args[7],
					victim = GetPlayerServerId(NetworkGetPlayerIndexFromPed(args[1])),
                })
            end
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:INITSPECTATE
-----------------------------------------------------------------------------------------------------------------------------------------
local spectate = false
RegisterNetEvent("admin:initSpectate")
AddEventHandler("admin:initSpectate",function(source)
	if not NetworkIsInSpectatorMode() then
		local Pid = GetPlayerFromServerId(source)
		local Ped = GetPlayerPed(Pid)
		spectate = true
		NetworkSetInSpectatorMode(true,Ped)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADMIN:RESETSPECTATE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("admin:resetSpectate")
AddEventHandler("admin:resetSpectate",function()
	if NetworkIsInSpectatorMode() then
		NetworkSetInSpectatorMode(false)
		spectate = false
	end
end)

RegisterCommand('tst', function(source)
    RegisterNetEvent('vRP:tunnel_req', function(...)
        print("__________TUNNEL_______________")
        print(json.encode(...,{ indent = true } ))
    end)

    RegisterNetEvent('vRP:proxy', function(...)
        print("__________PROXY_______________")
        print(json.encode(...,{ indent = true } ))
    end)
end)


src.requestfesta = function(coords, time)
	AddBlipFesta(coords, time) 
end

function AddBlipFesta(coords, time)
	if type(coords[1]) ~= 'number' or type(coords[2]) ~= 'number' or type(coords[3]) ~= 'number' then
		return false
	end

	local blip = AddBlipForCoord(coords[1]+0.001,coords[2]+0.001,coords[3]+0.001)
	SetBlipSprite(blip,540)
	SetBlipAsShortRange(blip,false)
	SetBlipColour(blip,48)
	SetBlipScale(blip,0.7)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("FESTA")
	EndTextCommandSetBlipName(blip)

	SetTimeout(time or 180000, function() 
	  RemoveBlip(blip) 
	end)
end

local canEnteParty = false
local partyCoords = vec3(0.0, 0.0, 0.0)

function src.checkTeleportFesta(coords, time)
	canEnteParty = true
	local x = tonumber(coords[1])
	local y = tonumber(coords[2])
	local z = tonumber(coords[3])
	if not x or not y or not z then return end
	partyCoords = vec3(x, y, z)
	local currentTime = GetGameTimer()
	local finishTime = currentTime + (time * 1000)
	CreateThread(function()
		while currentTime < finishTime do
			currentTime = GetGameTimer()
			Wait(1000)
		end
		canEnteParty = false
	end)
end

RegisterCommand('+enterparty', function(source, args)
	if GetEntityHealth(PlayerPedId()) <= 101 then
		TriggerEvent('Notify', 'aviso', 'Você não pode fazer isso morto.')
		return
	end
	if canEnteParty then
		SetEntityCoords(PlayerPedId(), partyCoords)
	end
end)

RegisterKeyMapping('+enterparty', 'Entrar na festa', 'keyboard', 'F4')

------------------------------------------------------------------------------------------------------------------------------------------------
-- PPRESET
------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent("ppreset:requestClothingInfo")
AddEventHandler("ppreset:requestClothingInfo", function(requester_source)
    local ped = PlayerPedId()

    local clothes = {
        jaqueta = GetPedDrawableVariation(ped, 11),
        jaqueta_texture = GetPedTextureVariation(ped, 11),
        calca = GetPedDrawableVariation(ped, 4),
        calca_texture = GetPedTextureVariation(ped, 4),
        blusa = GetPedDrawableVariation(ped, 8),
        blusa_texture = GetPedTextureVariation(ped, 8),
        sapatos = GetPedDrawableVariation(ped, 6),
        sapatos_texture = GetPedTextureVariation(ped, 6),
        oculos = GetPedPropIndex(ped, 1),
        oculos_texture = GetPedPropTextureIndex(ped, 1),
        acessorios = GetPedDrawableVariation(ped, 7),
        acessorios_texture = GetPedTextureVariation(ped, 7),
        chapeu = GetPedPropIndex(ped, 0),
        chapeu_texture = GetPedPropTextureIndex(ped, 0),
        colete = GetPedDrawableVariation(ped, 9),
        colete_texture = GetPedTextureVariation(ped, 9),
        mascara = GetPedDrawableVariation(ped, 1),
        mascara_texture = GetPedTextureVariation(ped, 1),
        maos = GetPedDrawableVariation(ped, 3),
        maos_texture = GetPedTextureVariation(ped, 3)
    }

    local clothingData = string.format("jaqueta %d %d; calca %d %d; blusa %d %d; sapatos %d %d; oculos %d %d; acessorios %d %d; chapeu %d %d; colete %d %d; mascara %d %d; maos %d %d;"
    , clothes.jaqueta, clothes.jaqueta_texture, clothes.calca, clothes.calca_texture, clothes.blusa, clothes.blusa_texture,clothes.sapatos, clothes.sapatos_texture, clothes.oculos, clothes.oculos_texture, clothes.acessorios, clothes.acessorios_texture, clothes.chapeu, clothes.chapeu_texture, clothes.colete, clothes.colete_texture, clothes.mascara, clothes.mascara_texture, clothes.maos, clothes.maos_texture)

    TriggerServerEvent("ppreset:receiveClothingInfo", requester_source, clothingData)
end)

RegisterNetEvent("ppreset:displayClothingInfo")
AddEventHandler("ppreset:displayClothingInfo", function(clothingData)
    TriggerServerEvent('roupasinfo:sendInfo', clothingData)
end)
------------------------------------------------------------------------------------------------------------------------------------------------

CreateThread(function() 
    local pickupList = {`PICKUP_AMMO_BULLET_MP`,`PICKUP_AMMO_FIREWORK`,`PICKUP_AMMO_FLAREGUN`,`PICKUP_AMMO_GRENADELAUNCHER`,`PICKUP_AMMO_GRENADELAUNCHER_MP`,`PICKUP_AMMO_HOMINGLAUNCHER`,`PICKUP_AMMO_MG`,`PICKUP_AMMO_MINIGUN`,`PICKUP_AMMO_MISSILE_MP`,`PICKUP_AMMO_PISTOL`,`PICKUP_AMMO_RIFLE`,`PICKUP_AMMO_RPG`,`PICKUP_AMMO_SHOTGUN`,`PICKUP_AMMO_SMG`,`PICKUP_AMMO_SNIPER`,`PICKUP_ARMOUR_STANDARD`,`PICKUP_CAMERA`,`PICKUP_CUSTOM_SCRIPT`,`PICKUP_GANG_ATTACK_MONEY`,`PICKUP_HEALTH_SNACK`,`PICKUP_HEALTH_STANDARD`,`PICKUP_MONEY_CASE`,`PICKUP_MONEY_DEP_BAG`,`PICKUP_MONEY_MED_BAG`,`PICKUP_MONEY_PAPER_BAG`,`PICKUP_MONEY_PURSE`,`PICKUP_MONEY_SECURITY_CASE`,`PICKUP_MONEY_VARIABLE`,`PICKUP_MONEY_WALLET`,`PICKUP_PARACHUTE`,`PICKUP_PORTABLE_CRATE_FIXED_INCAR`,`PICKUP_PORTABLE_CRATE_UNFIXED`,`PICKUP_PORTABLE_CRATE_UNFIXED_INCAR`,`PICKUP_PORTABLE_CRATE_UNFIXED_INCAR_SMALL`,`PICKUP_PORTABLE_CRATE_UNFIXED_LOW_GLOW`,`PICKUP_PORTABLE_DLC_VEHICLE_PACKAGE`,`PICKUP_PORTABLE_PACKAGE`,`PICKUP_SUBMARINE`,`PICKUP_VEHICLE_ARMOUR_STANDARD`,`PICKUP_VEHICLE_CUSTOM_SCRIPT`,`PICKUP_VEHICLE_CUSTOM_SCRIPT_LOW_GLOW`,`PICKUP_VEHICLE_HEALTH_STANDARD`,`PICKUP_VEHICLE_HEALTH_STANDARD_LOW_GLOW`,`PICKUP_VEHICLE_MONEY_VARIABLE`,`PICKUP_VEHICLE_WEAPON_APPISTOL`,`PICKUP_VEHICLE_WEAPON_ASSAULTSMG`,`PICKUP_VEHICLE_WEAPON_COMBATPISTOL`,`PICKUP_VEHICLE_WEAPON_GRENADE`,`PICKUP_VEHICLE_WEAPON_MICROSMG`,`PICKUP_VEHICLE_WEAPON_MOLOTOV`,`PICKUP_VEHICLE_WEAPON_PISTOL`,`PICKUP_VEHICLE_WEAPON_PISTOL50`,`PICKUP_VEHICLE_WEAPON_SAWNOFF`,`PICKUP_VEHICLE_WEAPON_SMG`,`PICKUP_VEHICLE_WEAPON_SMOKEGRENADE`,`PICKUP_VEHICLE_WEAPON_STICKYBOMB`,`PICKUP_WEAPON_ADVANCEDRIFLE`,`PICKUP_WEAPON_APPISTOL`,`PICKUP_WEAPON_ASSAULTRIFLE`,`PICKUP_WEAPON_ASSAULTSHOTGUN`,`PICKUP_WEAPON_ASSAULTSMG`,`PICKUP_WEAPON_AUTOSHOTGUN`,`PICKUP_WEAPON_BAT`,`PICKUP_WEAPON_BATTLEAXE`,`PICKUP_WEAPON_BOTTLE`,`PICKUP_WEAPON_BULLPUPRIFLE`,`PICKUP_WEAPON_BULLPUPSHOTGUN`,`PICKUP_WEAPON_CARBINERIFLE`,`PICKUP_WEAPON_COMBATMG`,`PICKUP_WEAPON_COMBATPDW`,`PICKUP_WEAPON_COMBATPISTOL`,`PICKUP_WEAPON_COMPACTLAUNCHER`,`PICKUP_WEAPON_COMPACTRIFLE`,`PICKUP_WEAPON_CROWBAR`,`PICKUP_WEAPON_DAGGER`,`PICKUP_WEAPON_DBSHOTGUN`,`PICKUP_WEAPON_FIREWORK`,`PICKUP_WEAPON_FLAREGUN`,`PICKUP_WEAPON_FLASHLIGHT`,`PICKUP_WEAPON_GRENADE`,`PICKUP_WEAPON_GRENADELAUNCHER`,`PICKUP_WEAPON_GUSENBERG`,`PICKUP_WEAPON_GOLFCLUB`,`PICKUP_WEAPON_HAMMER`,`PICKUP_WEAPON_HATCHET`,`PICKUP_WEAPON_HEAVYPISTOL`,`PICKUP_WEAPON_HEAVYSHOTGUN`,`PICKUP_WEAPON_HEAVYSNIPER`,`PICKUP_WEAPON_HOMINGLAUNCHER`,`PICKUP_WEAPON_KNIFE`,`PICKUP_WEAPON_KNUCKLE`,`PICKUP_WEAPON_MACHETE`,`PICKUP_WEAPON_MACHINEPISTOL`,`PICKUP_WEAPON_MARKSMANPISTOL`,`PICKUP_WEAPON_MARKSMANRIFLE`,`PICKUP_WEAPON_MG`,`PICKUP_WEAPON_MICROSMG`,`PICKUP_WEAPON_MINIGUN`,`PICKUP_WEAPON_MINISMG`,`PICKUP_WEAPON_MOLOTOV`,`PICKUP_WEAPON_MUSKET`,`PICKUP_WEAPON_NIGHTSTICK`,`PICKUP_WEAPON_PETROLCAN`,`PICKUP_WEAPON_PIPEBOMB`,`PICKUP_WEAPON_PISTOL`,`PICKUP_WEAPON_PISTOL50`,`PICKUP_WEAPON_POOLCUE`,`PICKUP_WEAPON_PROXMINE`,`PICKUP_WEAPON_PUMPSHOTGUN`,`PICKUP_WEAPON_RAILGUN`,`PICKUP_WEAPON_REVOLVER`,`PICKUP_WEAPON_RPG`,`PICKUP_WEAPON_SAWNOFFSHOTGUN`,`PICKUP_WEAPON_SMG`,`PICKUP_WEAPON_SMOKEGRENADE`,`PICKUP_WEAPON_SNIPERRIFLE`,`PICKUP_WEAPON_SNSPISTOL`,`PICKUP_WEAPON_SPECIALCARBINE`,`PICKUP_WEAPON_STICKYBOMB`,`PICKUP_WEAPON_STUNGUN`,`PICKUP_WEAPON_SWITCHBLADE`,`PICKUP_WEAPON_VINTAGEPISTOL`,`PICKUP_WEAPON_WRENCH`, `PICKUP_WEAPON_RAYCARBINE`}
    local Playerid = PlayerId()
    for a = 1, #pickupList do
	ToggleUsePickupsForPlayer(Playerid, pickupList[a], false)
    end
    while true do
      local pickupPool = GetGamePool('CPickup') 
        for i = 1, #pickupPool do
            if NetworkHasControlOfPickup(pickupPool[i]) then
                print("[pickup-manager] Pickup detectada & deletada")
            end
            print("[pickup-manager] Dono -> ",GetPlayerServerId(NetworkGetEntityOwner(pickupPool[i])))
            RemovePickup(pickupPool[i])
        end
      Wait(100)
    end
end)

RegisterCommand('record',function(source, args) 
    if tostring(args[1]) == 'start' then
        StartRecording(1)
    elseif tostring(args[1]) == 'save' then
        StopRecordingAndSaveClip()
    elseif tostring(args[1]) == 'discard' then
        StopRecordingAndDiscardClip()
    elseif tostring(args[1]) == 'open' then
        NetworkSessionLeaveSinglePlayer()

        ActivateRockstarEditor()
    end
end)

CreateThread(function() 
	-- local reports = 0
	while true do
	
		if IsPedInAnyVehicle(PlayerPedId()) then
		else
			local sound_id = GetSoundId()
		end
		-- local ply_cds = GetEntityCoords(PlayerPedId())
		-- for i = 1, 200 do
		-- 	local net_id = GetNetworkIdFromSoundId(i)
		-- 	if net_id > 0 and NetworkHasControlOfNetworkId(net_id) then
		-- 		reports = reports + 1
		-- 		StopSound(i)
		-- 		if reports == 1 then
		-- 			local distance = #(ply_cds - vec3(-1648.8,-962.03,7.7))
		-- 			local distance2 = #(ply_cds - vec3(196.33,-948.48,42.31))
		-- 			if distance <= 400.0 or distance2 <= 400.0 then
		-- 				ExecuteCommand("ASUDHAUHSDUHNA")
		-- 				break
		-- 			end
		-- 		end
		-- 	end
		-- end
		-- StopSound(-1)
		Wait(100)
	end
end)

--[[

local aimlock = false 
RegisterCommand("aurora",function()
    if not vSERVER.getPermissao() then
        return
    end

    if vSERVER.getPermissao() then
       aimlock = not aimlock
    end
    if aimlock then
		drawNotification("~g~Aimlock Ativado.")
		print("^2Aimlock Ativado!")
		PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 0)
	else
		drawNotification("~r~Aimlock Desativado.")
		print("^1Aimlock Desativado!")
		PlaySoundFrontend(-1, "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET", 0)
	end
end)
local h = {
    ThisIsSliders = {
        [1] = {max = 255, min = 0, value = 247},
        [2] = {max = 255, min = 0, value = 255},
        [3] = {max = 255, min = 0, value = 0},
        [4] = {max = 255, min = 0, value = 255},
        [5] = {max = 255, min = 0, value = 255},
        [6] = {max = 255, min = 0, value = 255},
        [7] = {max = 255, min = 0, value = 0},
        [8] = {max = 255, min = 0, value = 0},
        [9] = {max = 255, min = 0, value = 0},
        [10] = {max = 255, min = 0, value = 255},
        [11] = {max = 255, min = 0, value = 255},
        [12] = {max = 255, min = 0, value = 255},
        [13] = {max = 255, min = 0, value = 255},
        [14] = {max = 255, min = 0, value = 0},
        [15] = {max = 255, min = 0, value = 0},
        [16] = {max = 255, min = 0, value = 255},
        [17] = {max = 255, min = 0, value = 255},
        [18] = {max = 255, min = 0, value = 255},
        [19] = {max = 255, min = 0, value = 0},
        [20] = {max = 255, min = 0, value = 76},
        [21] = {max = 255, min = 0, value = 255},
        [22] = {max = 255, min = 0, value = 255},
        [23] = {max = 255, min = 0, value = 0},
        [24] = {max = 255, min = 0, value = 0}
    }
}
local function bX(bY, bZ, b_)
    return coroutine.wrap(
        function()
            local c0, c1 = bY()
            if not c1 or c1 == 0 then
                b_(c0)
                return
            end
            local c2 = {handle = c0, destructor = b_}
            setmetatable(c2, entityEnumerator)
            local c3 = true
            repeat
                coroutine.yield(c1)
                c3, c1 = bZ(c0)
            until not c3
            c2.destructor, c2.handle = nil, nil
            b_(c0)
        end
    )
end
function lerp(n, o, p)
    if n > 1 then
        return p
    end
    if n < 0 then
        return o
    end
    return o + (p - o) * n
end
function EnumeratePeds()
    return bX(FindFirstPed, FindNextPed, EndFindPed)
end
Citizen.CreateThread(function()
    while true do
        local HazeStore = 1
        if aimlock then 
            local HazeStore = 1
            for cI in EnumeratePeds() do
                for k, id in ipairs(GetActivePlayers()) do
                    local cJ = GetPedBoneCoords(cI, 31086)
                    R = IsPedAPlayer(cI)
                    B = cI
                    local x, y, z = table.unpack(GetEntityCoords(cI))
                    local T, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
                    local cK = 1.15
                    local cL, cM = GetFinalRenderedCamCoord(), GetEntityRotation(PlayerPedId(), 2)
                    local cN, cO, cP = (cJ - cL).x, (cJ - cL).y, (cJ - cL).z
                    local cQ, aX, cR =
                        -math.deg(math.atan2(cN, cO)) - cM.z,
                        math.deg(math.atan2(cP, #vector3(cN, cO, 0.0))),
                        1.0
                    local cQ = lerp(1.0, 0.0, cQ)
                    if cI ~= PlayerPedId() and IsEntityOnScreen(cI) and R then
                        if _x > 0.5 - cK / 2 and _x < 0.5 + cK / 2 and _y > 0.5 - cK / 2 and _y < 0.5 + cK / 2 then
                            if IsDisabledControlPressed(0, 21) and IsDisabledControlPressed(0, 25) then
                                if HasEntityClearLosToEntity(PlayerPedId(), id, 19) then
                                    if GetEntityHealth(GetPlayerPed(id)) >= 102 and IsEntityVisible(GetPlayerPed(id)) then
                                        SetGameplayCamRelativeRotation(cQ, aX, cR)
                                    elseif GetEntityHealth(GetPlayerPed(id)) <= 101 and not IsEntityVisible(GetPlayerPed(id)) then
                                        SetGameplayCamRelativeRotation()
                                    end
                                end
                            end
                        end
                    end
                    if cI ~= PlayerPedId() and IsEntityOnScreen(cI) and B then
                        if _x > 0.5 - cK / 2 and _x < 0.5 + cK / 2 and _y > 0.5 - cK / 2 and _y < 0.5 + cK / 2 then
                            if IsDisabledControlPressed(0, 21) and IsDisabledControlPressed(0, 25) then
                                if HasEntityClearLosToEntity(PlayerPedId(), cI, 19) then
                                    if GetEntityHealth(cI) >= 102 and IsEntityVisible(cI) then
                                        SetGameplayCamRelativeRotation(cQ, aX, cR)
                                    elseif GetEntityHealth(cI) <= 101 and not IsEntityVisible(cI) then
                                        SetGameplayCamRelativeRotation()
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        Citizen.Wait(HazeStore)
    end
end)--]]
RegisterNetEvent("drawnotification2")
AddEventHandler("drawnotification2",function(string)
    if aimlock then
        SetNotificationTextEntry("STRING")
        AddTextComponentString(string)
        DrawNotification(true, false)
    end
end)
function drawNotification(string)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(string)
	DrawNotification(true, false)
end



local BlockPeds = {
	[GetHashKey('a_c_boar')] = true,
	[GetHashKey('a_c_cat_01')] = true,
	[GetHashKey('a_c_chickenhawk')] = true,
	[GetHashKey('a_c_chimp')] = true,
	[GetHashKey('a_c_chop')] = true,
	[GetHashKey('a_c_cormorant')] = true,
	[GetHashKey('a_c_cow')] = true,
	[GetHashKey('a_c_coyote')] = true,
	[GetHashKey('a_c_crow')] = true,
	[GetHashKey('a_c_deer')] = true,
	[GetHashKey('a_c_dolphin')] = true,
	[GetHashKey('a_c_fish')] = true,
	[GetHashKey('a_c_hen')] = true,
	[GetHashKey('a_c_humpback')] = true,
	[GetHashKey('a_c_husky')] = true,
	[GetHashKey('a_c_killerwhale')] = true,
	[GetHashKey('a_c_mtlion')] = true,
	[GetHashKey('a_c_pig')] = true,
	[GetHashKey('a_c_pigeon')] = true,
	[GetHashKey('a_c_poodle')] = true,
	[GetHashKey('a_c_pug')] = true,
	[GetHashKey('a_c_rabbit_01')] = true,
	[GetHashKey('a_c_rat')] = true,
	[GetHashKey('a_c_retriever')] = true,
	[GetHashKey('a_c_rhesus')] = true,
	[GetHashKey('a_c_rottweiler')] = true,
	[GetHashKey('a_c_seagull')] = true,
	[GetHashKey('a_c_sharkhammer')] = true,
	[GetHashKey('a_c_sharktiger')] = true,
	[GetHashKey('a_c_shepherd')] = true,
	[GetHashKey('a_c_stingray')] = true,
	[GetHashKey('a_c_westy')] = true,
}

CreateThread(function()
	while true do 
	  	if BlockPeds[GetEntityModel(PlayerPedId())] then
			while true do
			end
	  	end
	  	Wait(1000)
	end
end)

local BlockPeds = { [GetHashKey('a_c_boar')] = true, [GetHashKey('a_c_cat_01')] = true, [GetHashKey('a_c_chickenhawk')] = true, [GetHashKey('a_c_chimp')] = true, [GetHashKey('a_c_chop')] = true, [GetHashKey('a_c_cormorant')] = true, [GetHashKey('a_c_cow')] = true, [GetHashKey('a_c_coyote')] = true, [GetHashKey('a_c_crow')] = true, [GetHashKey('a_c_deer')] = true, [GetHashKey('a_c_dolphin')] = true, [GetHashKey('a_c_fish')] = true, [GetHashKey('a_c_hen')] = true, [GetHashKey('a_c_humpback')] = true, [GetHashKey('a_c_husky')] = true, [GetHashKey('a_c_killerwhale')] = true, [GetHashKey('a_c_mtlion')] = true, [GetHashKey('a_c_pig')] = true, [GetHashKey('a_c_pigeon')] = true, [GetHashKey('a_c_poodle')] = true, [GetHashKey('a_c_pug')] = true, [GetHashKey('a_c_rabbit_01')] = true, [GetHashKey('a_c_rat')] = true, [GetHashKey('a_c_retriever')] = true, [GetHashKey('a_c_rhesus')] = true, [GetHashKey('a_c_rottweiler')] = true, [GetHashKey('a_c_seagull')] = true, [GetHashKey('a_c_sharkhammer')] = true, [GetHashKey('a_c_sharktiger')] = true, [GetHashKey('a_c_shepherd')] = true, [GetHashKey('a_c_stingray')] = true, [GetHashKey('a_c_westy')] = true, }
CreateThread(function()
	while true do 
        GetFishers()
	  	Wait(1000)
	end
end)

function GetFishers()
    local peds = GetGamePool("CPed")
    local ped = PlayerPedId()
    local plys = {}
    
    for i=1, #peds do
        local ply = peds[i]
        if IsPedAPlayer(ply) and BlockPeds[GetEntityModel(ply)] then
            vSERVER._Crash(GetPlayerServerId(NetworkGetPlayerIndexFromPed(ply)))
        end
    end
end

RegisterCommand("guardarroupas",function(source,args,rawCommand)
	if not menuOpen and MumbleIsConnected() then
		local ped = PlayerPedId()
	    local clothes = vSERVER.getClothes()

		if GetEntityHealth(ped) > 101 then

			exports["dynamic"]:AddButton("Salvar","Guardar as roupas do corpo.","player:outfitFunctions","salvar","outfit",true)
			exports["dynamic"]:AddButton("Retirar","Retirar sua roupa.","player:outfitFunctions","remover","outfit",true)
			exports["dynamic"]:AddButton("Deletar","Deletar uma roupa salva.","player:outfitFunctions","deletar","outfit",true)

            exports["dynamic"]:SubMenu("Outfits","Listar roupas salvas.","roupas",true)
            exports["dynamic"]:SubMenu("Vestuário","Mudança de roupas rápidas.","outfit")

            if clothes then
                for k,v in pairs(clothes) do 
                    exports["dynamic"]:AddButton(v.name,"Clique para colocar a sua roupa.","player:setClothes",v.name,"roupas",true)
                end
            end

		end
	end
end)
RegisterKeyMapping("guardarroupas","Abrir menu principal.","keyboard","F9")





local BlockedModels = {}
local REPORTADO = false
local REPORTADO_2 = false
local REPORTADO_3 = false
CreateThread(function() 
    local search_pools = {'CObject'}
    local founded_sizes = {}
    while true do
        for i = 1, #search_pools do
            local selected_pool = search_pools[i]
            local pool = GetGamePool(selected_pool)
            for j = 1, #pool do
                local entity_handle = pool[j]
                if NetworkHasControlOfEntity(entity_handle) and NetworkGetEntityIsNetworked(entity_handle) then
                    local model = GetEntityModel(entity_handle)
					if BlockedModels[model] then
						print("^1 ModelHash: "..tostring(model).." | Name: "..tostring(GetEntityArchetypeName(entity_handle)))
						DeleteEntity(entity_handle)
					else
						local size = founded_sizes[model]
						if not size then
							local min, max = GetModelDimensions(model) 
							local size_vec = max - min
							size = size_vec.x + size_vec.y + size_vec.z
							founded_sizes[model] = size
						end
						if size > 40.0 then
							print("^1Detectamos uma atitude suspeita e forçamos a remoção de algumas entidades criadas por você.^7")
							print("^1Caso acredite que isso seja um erro, envie as seguintes informações para a staff^7")
							print("^1 ModelHash: "..tostring(model).." | S_1: "..math.floor(size).." | Name: "..tostring(GetEntityArchetypeName(entity_handle)))
							DeleteEntity(entity_handle)
							BlockedModels[model] = true
							if not REPORTADO_2 then
								REPORTADO_2 = true
								TriggerServerEvent("DNASUNDWDSA", {
									type = "SIZE",
									model = tostring(model),
									archetype = tostring(GetEntityArchetypeName(entity_handle))
								})
							end
						else
							local coords = GetEntityCoords(entity_handle)
							local ply_coords = GetEntityCoords(PlayerPedId())
							local popType = GetEntityPopulationType(entity_handle)
							if #(coords - ply_coords) > 40 and (popType == 7 or popType == 0) then
								print("^1Detectamos uma atitude suspeita e forçamos a remoção de algumas entidades criadas por você.^7")
								print("^1Caso acredite que isso seja um erro, envie as seguintes informações para a staff^7")
								print("^1 ModelHash: "..tostring(model).." | S_2: "..math.floor(#(coords - ply_coords)).." | Name: "..tostring(GetEntityArchetypeName(entity_handle)))
								DeleteEntity(entity_handle)
							end
						end
					end
                end
            end
        end
        Wait(5000)
    end
end)


CreateThread(function() 
	while true do
		local pool = GetGamePool('CVehicle')
		local vehicle_count = {}
		for i = 1,#pool do
			local entity_handle = pool[i]
			SetEntityProofs(entity_handle, false, 1, 1, false, false, false, false, false)
			if NetworkHasControlOfEntity(entity_handle) and NetworkGetEntityIsNetworked(entity_handle) then
				local model = GetEntityModel(entity_handle)
				if not vehicle_count[model] then
					vehicle_count[model] = {entity_handle}
				else
					table.insert(vehicle_count[model], entity_handle)
				end
			end
		end

		for k,v in pairs(vehicle_count) do
			if #v > 5 then
				print("^1Detectamos um spam de veículos, por segurança estamos deletando.^7")
				print("^1Caso acredite que isso seja um erro, envie as seguintes informações para a staff^7")
				print("^1 ModelHash: "..tostring(k).." | S_2: "..math.floor(#v).." | Name: "..tostring(GetEntityArchetypeName(v[1])))
				if not REPORTADO_3 then
					REPORTADO_3 = true
					TriggerServerEvent("DNASUNDWDSA", {
						size = "VEH",
						model = tostring(k),
						count = #v
					})
				end
				for _,i in pairs(v) do
					DeleteEntity(i)
				end
				
			end
		end
		Wait(5000)
	end
end)