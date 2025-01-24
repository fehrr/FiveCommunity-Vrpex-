bridge.add_fine = function(data)
    local src = source
    local user_id = vRP.getUserId(src)

    if (not user_id) then
        return
    end

    local user = User:get(user_id)

    if (not isAdmin(user_id) and not user) then
        return
    end

    vCLIENT.visibility(src)

    local id = tonumber(data.id)
    local valorMulta = tonumber(data.amount)
    local motivoMulta = tostring(data.reason)
    local nsrc = vRP.getUserSource(id)
    local nplayer = vRP.getUserId(nsrc)

    if (not id or not valorMulta or not motivoMulta or not nplayer) then
        return TriggerClientEvent('Notify', src, 'negado', 'Erro, tente novamente...', 5)
    end

    if tonumber(valorMulta) >= 1 and tonumber(valorMulta) <= 500000 then
        if motivoMulta ~= nil and motivoMulta ~= '' then
            TriggerClientEvent(
                'Notify',
                src,
                'importante',
                'Você multou o cidadao em <b>$ ' .. vRP.format(valorMulta) .. '</b>',
                15
            )
            TriggerClientEvent(
                'Notify',
                nsrc,
                'importante',
                'Você foi multado no valor de <b>$ ' ..
                    vRP.format(valorMulta) .. '</b> pelo motivo <b>' .. motivoMulta .. '</b>',
                15
            )
            vRP.execute('vRP/add_multa', {user_id = id, multas = tonumber(valorMulta)})
            bridge.adicionarCriminal(nplayer, 'MULTA', motivoMulta)
        else
            TriggerClientEvent('Notify', src, 'importante', 'Digite um motivo correto', 5)
        end
    else
        TriggerClientEvent('Notify', src, 'importante', 'Digite um valor correto entre 1 e 500000 ', 5)
    end
end
