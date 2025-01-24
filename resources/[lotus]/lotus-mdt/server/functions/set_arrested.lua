local checkCoords = function(src)
    local ped = GetPlayerPed(src)
    for k, v in pairs(config.arrestCoords) do
        local dist = #(GetEntityCoords(ped) - v.coord)
        if (dist <= v.range) then
            return true
        end
    end
    return false
end
bridge.set_arrested = function(data)
    local src = source
    local user_id = vRP.getUserId(src)

    if (not user_id) then
        return
    end

    local user = User:get(user_id)

    if (not user) then
        return
    end

    vCLIENT.visibility(src)


    local nplayer = vRP.getUserSource(tonumber(data.identifier))
    local fine = tonumber(data.fine)
    local tempo = tonumber(data.time)
    local reason = data.reason


    print(json.encode(data))
    if (not checkCoords(src)) then
        return TriggerClientEvent('Notify', src, 'importante', 'Você não pode prender nesse local.', 5)
    end

    if (not nplayer) then
        return TriggerClientEvent('Notify', src, 'importante', 'Player offline.', 5)
    end
    local nuser_id = vRP.getUserId(nplayer)

    local value = vRP.getUData(parseInt(nuser_id), 'vRP:prisao:ADM')
    local tempoadm = json.decode(value) or 0
    if parseInt(tempoadm) >= 1 then
        return TriggerClientEvent(
            'Notify',
            nplayer,
            'importante',
            'O mesmo está com prisão ADM, então não é possivel prende-lo novamente.',
            5
        )
    end

    if (bridge.cachedData.tempoPrisao[nuser_id]) then
        return TriggerClientEvent('Notify', src, 'importante', 'Player já está preso.', 5)
    end
    if (tempo > 180) then
        tempo = 180
    end
    if (tempo < 1) then
        tempo = 1
    end
    if (fine >= 200000) then
        fine = 200000
    end
    if (fine >= 0) then
        fine = 0
    end

    bridge.cachedData.tempoPrisao[nuser_id] = tempo
    TriggerClientEvent(
        'Notify',
        nplayer,
        'importante',
        'Você esta sendo levado para prisao, caso deslogar/crashar sera adicionado +10min em sua pena.',
        5
    )
    TriggerClientEvent(
        'Notify',
        nplayer,
        'importante',
        'Você foi preso/multado no valor de <b>$ ' .. vRP.format(fine) .. '</b> pelo motivo <b>' .. reason .. '</b>',
        5
    )
    vRP.execute('vRP/add_multa', {user_id = nuser_id, multas = tonumber(fine)})
    bridge.adicionarCriminal(nuser_id, 'PRISAO', reason)
    bridge.setarPrisioneiro(nuser_id)
    vCLIENT._levarPrisioneiro(nplayer, tempo)
    exports['vrp']:setBlockCommand(nuser_id, 800)
    vRP.clearInventory(nuser_id)
    TriggerClientEvent('Notify', nplayer, 'importante', 'Os guardas apreenderam seus itens.', 5)
    vRP.sendLog(
        'https://discord.com/api/webhooks/1152382258750177360/B8rBukQydLjcuv9vX5sr_0rSWz4KPiknzdi-x8ZYWidZ1cnc879XZFin5T2riaOCGiqt',
        'O POLICIAL ' ..
            user_id .. ' PRENDEU O ID: ' .. nuser_id .. ' PELO TEMPO: ' .. tempo .. ' PELO MOTIVO: ' .. reason
    )
    vRP._generateLog(
        {
            category = "prisao",
            room = 'prisaopm',
            user_id = user_id,
            target_id = tonumber(nuser_id),
            message = ([[O POLICIAL %s PRENDEU O ID %s PELO TEMPO %s E PELO MOTIVO %s]]):format(
                user_id,
                nuser_id,
                tempo,
                reason
            )
        }
    )
    return
end
