---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.tryTrunk(vehPlate)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

     if not vRP.hasPermission(user_id, 'perm.carreta') then
        TriggerClientEvent("Notify",source,"negado","Você não possui permissão para guardar.", 5)
        return false
    end

    local plateOwner = vRP.getUserByRegistration(vehPlate)
    if plateOwner and plateOwner == user_id then
        return true
    end

    TriggerClientEvent("Notify",source,"negado","Você não possui permissão para guardar o veiculo nessa carreta", 5)
    return false
end