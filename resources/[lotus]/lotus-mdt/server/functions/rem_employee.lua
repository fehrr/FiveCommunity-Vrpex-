bridge.rem_employee = function(data)
    print('rem_employee, called')
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
    local role = data.role

    if (not id or not role) then
        return
    end

    if (id == user_id) then
        return TriggerClientEvent('Notify', src, 'negado', 'Você não pode alterar seu próprio cargo.', 5)
    end

    local org = getOrgByRole(role)

    
    local isDemote = config.cargos[user['group'].org][user['group'].role]['permissions'].demote
    if not isDemote then 
        return TriggerClientEvent('Notify',src,'negado','O seu cargo não tem permissão para demitir.',5)
    end

    local userTier = user['group'].tier
    local otherUserTier = config.cargos[org][data.role].tier 

    if otherUserTier > userTier then 
        return TriggerClientEvent('Notify',src,'negado','Você não pode demitir um cargo maior que o seu.',5)
    end

    if (not org) then 
        return TriggerClientEvent('Notify', src, 'negado', ('Organização do cargo %s não encontrada, contate um desenvolvedor...'):format(group), 5)
    end
    
    local nsource = vRP.getUserSource(parseInt(id))

    if (not nsource) then
        local rows = vRP.getUData(parseInt(id), 'vRP:datatable')
        if #rows > 0 then
            local data = json.decode(rows) or {}
            if data then
                if data then
                    data.groups[role] = nil
                end
            end

            vRP.setUData(parseInt(id), 'vRP:datatable', json.encode(data))

            for k,v in pairs(orgCache[org]) do
                if (v.user_id == id) then 
                    table.remove(orgCache[org], k)
                end
            end
        
            vRP.sendLog(config.webhooks['demitir'], ('O POLICIAL %s DEMITIU O ID %s DA ORG'):format(user_id, parseInt(id), org))

            return TriggerClientEvent(
                'Notify',
                src,
                'negado',
                '** OFFLINE ** Você removeu o <b>(ID: ' .. parseInt(id) .. ')</b> no grupo: <b>' .. role .. '</b>',
                5
            )
            
        end
        return
    end
    
    for k,v in pairs(orgCache[org]) do 
        if (v.user_id == id) then 
            table.remove(orgCache[org], k)
        end
    end

    print('removing user group')
    vRP.removeUserGroup(parseInt(id), role)
    vRP.removePatrulhamento(id)
    vRP.tryGetInventoryItem(id, 'chave_algemas', vRP.getInventoryItemAmount(id, 'chave_algemas'), true)
    vRP.tryGetInventoryItem(id, 'radio', vRP.getInventoryItemAmount(id, 'radio'), true)
    vRPC._giveWeapons(nsource, {}, true)
    return TriggerClientEvent(
        'Notify',
        src,
        'negado',
        'Você removeu o <b>(ID: ' .. parseInt(id) .. ')</b> no grupo: <b>' .. role .. '</b>',
        5
    )
end
