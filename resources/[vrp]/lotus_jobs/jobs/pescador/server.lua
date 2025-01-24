--------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
--------------------------------------------------------------------------------------------------------------------------------------------------------
Fisher = {
    ActualRoute = {},
    Alerts = {}
}

--------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
--------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.FisherCollect()
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    -- VERIFICANDO TEMPO DAS ULTIMAS COLETAS
    local status, time = exports['vrp']:getCooldown(user_id, "FisherReward")
    if not status then
        Fisher:AddUserAlert(user_id)
        print(("^1[ANTI-INJECT] (Fisher) ^0USER_ID %s VERY FAST FARMING %s REMANING SECONDS"):format(user_id, time))
        return
    end

    -- VERIFICANDO DISTANCIA DO PRIMEIRO PONTO
    local PlyCoords = GetEntityCoords(GetPlayerPed(source))
    local Dist = #(vec3(FisherConfig.Locations[1].x,FisherConfig.Locations[1].y,FisherConfig.Locations[1].z) - PlyCoords)
    if Dist >= 80 then
        Fisher:AddUserAlert(user_id)

        print(("^1[ANTI-INJECT] (Fisher) ^0USER_ID %s DISTANCE TO ROUTE %s"):format(user_id, Dist))
        return
    end
    
     -- VERIFICANDO ALERTAS
    local UserAlerts = Fisher:CheckUserAlert(user_id)
    if UserAlerts >= 3 then
        print(("^1[ANTI-INJECT] (Fisher) ^0 USER_ID %s TO %s ALERTS"):format(user_id, UserAlerts))
        SendLog(("```lua\nUSER_ID: %s\nTOTAL DE ALERTAS: %s\nEMPREGO: %s```"):format(user_id, UserAlerts, "PESCADOR"))

        return Miner.ActualRoute[user_id]
    end

    -- VERIFICANDO ITEM NO INVENTARIO
    if not vRP.tryGetInventoryItem(user_id, FisherConfig.NecessaryItem) then
        TriggerClientEvent("Notify",source,"negado","Você não possui 1x <b>"..vRP.getItemName(FisherConfig.NecessaryItem).."</b>. ", 3)
        return
    end

    -- GIVANDO RECOMPENSAS
    local Reward = FisherConfig.Payment[math.random(#FisherConfig.Payment)]
    vRP.tryGetInventoryItem(user_id, FisherConfig.NecessaryItem, 1)
    vRP.giveInventoryItem(user_id, Reward.item, math.random(Reward.min, Reward.max), true)

    exports['vrp']:setCooldown(user_id, "FisherReward", 10)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------------------------------------
function Fisher:AddUserAlert(user_id)
    if not self.Alerts[user_id] then self.Alerts[user_id] = 0 end
    
    self.Alerts[user_id] += 1
end

function Fisher:CheckUserAlert(user_id)
    return self.Alerts[user_id] or 0
end
