---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local vehiclesTruckeds = {
    -- [4] = {
    --     lastClass = 4,
    --     vehs = {
    --         [1] = true,
    --         [2] = true,
    --     }
    -- }
}


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    while true do
        local SLEEP_TIME = 1000

        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        local vehicle = GetVehiclePedIsIn(ped, false)
        
        local truck = GetClosestVehiclePlayer(20.0)
        if vehicle and truck and carTruckConfig.list[GetEntityModel(truck)] then
            local config = carTruckConfig.list[GetEntityModel(truck)] and carTruckConfig.list[GetEntityModel(truck)].slotsVehicles[GetVehicleClass(vehicle)] or false
            local carCoords = GetEntityCoords(truck)

            if config and #(pedCoords - carCoords) <= config.distance and vehicle then
                SLEEP_TIME = 0
                DrawText3D(carCoords.x,carCoords.y,carCoords.z+0.3,'Pressione ~b~E~w~ para ~g~subir/descer~w~ uma moto.')
                
                if IsControlJustPressed(0,38) then
                    -- FAZER VALIDACAO SE O VEICULO E DA PESSOA, APENAS O PROPRIETARIO CONSEGUIR SUBIR/DESCER VEICULO.
                    if vTunnel.tryTrunk(GetVehicleNumberPlateText(truck):gsub(' ', '')) then
                        -- GERANDO VARIAVEL CASO NAO EXISTA
                        if not vehiclesTruckeds[VehToNet(truck)] then
                            vehiclesTruckeds[VehToNet(truck)] = {
                                lastClass = 0,
                                vehs = {}
                            }
                        end
                
                        if vehiclesTruckeds[VehToNet(truck)].vehs[VehToNet(vehicle)] then -- TIRAR DA CARRETA
                            vehiclesTruckeds[VehToNet(truck)].vehs[VehToNet(vehicle)] = nil

                            -- CONTANDO OS VEICULOS QUE EXISTE EM CIMA DA CARRETA
                            local countVehs = 0
                            for netId in pairs(vehiclesTruckeds[VehToNet(truck)].vehs) do
                                countVehs = (countVehs + 1)
                            end
                            
                            if countVehs <= 0 then
                                vehiclesTruckeds[VehToNet(truck)] = nil
                            end

                            -- RETIRANDO DA CARRETA
                            AttachEntityToEntity(vehicle,truck,0,0.0,-7.0,0.0,0.0,0.0,0.0,false,false,true,false,5,true)
                            DetachEntity(vehicle,false,false)
                            PlaceObjectOnGroundProperly(vehicle)
                            FreezeEntityPosition(vehicle, false)
                        else
                            -- CONTANDO OS VEICULOS QUE EXISTE EM CIMA DA CARRETA
                            local countVehs = 0
                            for netId in pairs(vehiclesTruckeds[VehToNet(truck)].vehs) do
                                countVehs = (countVehs + 1)
                            end

                            -- VALIDANDO QUANTIDADE DE VEICULO EM CIMA DA CARRETA
                            if countVehs >=  config.maxVehicles then
                                TriggerEvent("Notify","negado","Não é possivel colocar mais veiculos aqui.",5)
                                goto finish
                            end

                            if vehiclesTruckeds[VehToNet(truck)].lastClass > 0 then
                                if vehiclesTruckeds[VehToNet(truck)].lastClass ~= GetVehicleClass(vehicle) then
                                    TriggerEvent("Notify","negado","Não é possivel colocar veiculos de tipos diferentes em cima.",5)
                                    goto finish
                                end
                            end

                            vehiclesTruckeds[VehToNet(truck)].vehs[VehToNet(vehicle)] = true
                            vehiclesTruckeds[VehToNet(truck)].lastClass = GetVehicleClass(vehicle)

                            -- ADICIONAR NA CARRETA
                            countVehs = (countVehs + 1)

                            AttachEntityToEntity(vehicle, truck, 20, config.positions[countVehs].x,config.positions[countVehs].y,config.positions[countVehs].z, 0.0,0.0,0.0, false,false,true,false,20,true)
                            FreezeEntityPosition(vehicle, true)
                        end
                    end
                end

            end
        end

        :: finish ::
        
        Wait( SLEEP_TIME )
    end
end)


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
GetClosestVehiclePlayer = function(range)
    local ped = PlayerPedId()

    local vehicles = GetGamePool("CVehicle")
    local vehicle, min = nil, range+0.0001
    for i = 1, #vehicles do
        local veh = vehicles[i]
        local dist = #(GetEntityCoords(ped) - GetEntityCoords(veh))

        if IsEntityAVehicle(veh) and dist <= range then
            if dist < min and veh ~= GetVehiclePedIsIn(ped, false) then
                min = dist
                vehicle = veh
            end
        end
    end

    return vehicle
end
