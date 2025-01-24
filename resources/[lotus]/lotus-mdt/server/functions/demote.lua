bridge.demote = function()
    local src = source
    local user_id = vRP.getUserId(src)

    if (not user_id) then
        return
    end

    local user = User:get(user_id)

    if (not isAdmin(user_id) and not user) then
        return
    end

    local currentOrg = user.group.org
    local currentRole = user.group.role
    
    local org = getOrgByRole(currentRole)

    if (not org) then 
        return TriggerClientEvent('Notify', src, 'negado', ('Organização do cargo %s não encontrada, contate um desenvolvedor...'):format(group), 5)
    end

    if vRP.request(src, 'Tem certeza que deseja se demitir da org: ' .. currentOrg .. '?') then
        vRP.removeUserGroup(parseInt(user_id), currentRole)
        vRP.removePatrulhamento(user_id)
        vRP.tryGetInventoryItem(user_id, 'chave_algemas', vRP.getInventoryItemAmount(user_id, 'chave_algemas'), true)
        vRP.tryGetInventoryItem(user_id, 'radio', vRP.getInventoryItemAmount(user_id, 'radio'), true)
        vRP.sendLog(config.webhooks['demitir'], ('O USER_ID %s SE DEMITIU DO CARGO %s DA ORG %s'):format(user_id, currentRole, currentOrg))

        for k,v in pairs(orgCache[org]) do
            if (v.user_id == user_id) then 
                table.remove(orgCache[org], k)
            end
        end

        vRPC._giveWeapons(src, {}, true)

        vRP.sendLog(config.webhooks['demitir'], ('O POLICIAL %s SE DEMITIU DA ORG: %s'):format(user_id, currentOrg))

        return TriggerClientEvent('Notify', src, 'importante', 'Você se demitiu da org: ' .. currentOrg, 5)
    end
end
