bridge.vehicles = function()
    local src = source
    local user_id = vRP.getUserId(src)

    if (not user_id) then
        return
    end

    local user = User:get(user_id)

    if (not isAdmin(user_id) and not user) then
        return
    end

    local plate = data.data.value
    local nUData = User:get(plate)
    if (not nUData) then
        return 'Veículo inexistente'
    end
    local multas = vRP.getMultas(plate)
    if (multas == 0) then
        return 'Nenhuma multa pendente'
    end
    return multas .. ' R$ em multas pendentes'
end