recentlyHired = {}
getOrgByRole = function(role)
    for org, roles in pairs(config.cargos) do
        for k, v in pairs(config.cargos[org]) do
            if (k == role) then
                return org
            end
        end
    end
    return false
end
local isUserRecentlyHired = function(hirer_id, employee_id)
    for _, hired_id in pairs(recentlyHired[hirer_id]) do 
        if (hired_id == employee_id) then
            return false
        end
    end
    return true
end
bridge.add_employee = function(data)
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
    local group = data.group
    local nUData = User:get(id)

    if (nUData and nUData.role == group) then
        return TriggerClientEvent('Notify', src, 'negado', 'Erro, esse usuário já possui esse cargo...', 5)
    end

    local nsource = vRP.getUserSource(parseInt(id))
    local newUser = User:get(id)
    local org = getOrgByRole(group)

    if (not org) then
        return TriggerClientEvent('Notify',src,'negado',('Organização do cargo %s não encontrada, contate um desenvolvedor...'):format(group),5)
    end

    for orgName, _ in pairs(orgCache) do
        for k, v in pairs(orgCache[orgName]) do
            if (v.user_id == id) then
                if (vRP.hasGroup(id, v.group.role)) then
                    vRP.removeUserGroup(id, v.group.role)
                end
                table.remove(orgCache[orgName], k)
            end
        end
    end

    newUser = User:get(id) -- getting new data
    
    if (not newUser) then
        local identidade = vRP.getUserIdentity(id)
        newUser = {}
        newUser.name = ('%s %s'):format(identidade.nome, identidade.sobrenome)
        newUser.group = {
            role = group
        }
    end

    if (not recentlyHired[user_id]) then 
        recentlyHired[user_id] = {}
    end

    local checkNewUser = isUserRecentlyHired(user_id, id) -- check if user recently hired someone to prevent money farming

    if (checkNewUser) then
		vRP.giveInventoryItem(user_id, "money", config.hireReward, false)
        TriggerClientEvent('Notify',src,'sucesso',('Você ganhou %s por contratar %s'):format(config.hireReward, newUser.name),5)
        recentlyHired[user_id][#recentlyHired[user_id]+1] = id
    else
        TriggerClientEvent('Notify',src,'negado', 'Você não recebeu a recompensa de contratação por que já havia contratado esse cidadão nessa mesma sessão...',5)
    end

    if (not nsource) then
        local rows = vRP.getUData(parseInt(id), 'vRP:datatable')
        if #rows > 0 then
            local data = json.decode(rows) or {}
            if data then
                if data then
                    if (not data.groups or type(data.groups) ~= 'table') then
                        data.groups = {}
                    end
                    data.groups[group] = true
                end
            end
            vRP.setUData(parseInt(id), 'vRP:datatable', json.encode(data))
        end
        orgCache[org][#orgCache[org] + 1] = {
            name = newUser.name,
            group = newUser.group,
            status = 0,
            user_id = id,
            last_login = 'Recente'
        }
        return TriggerClientEvent('Notify',src,'sucesso','** OFFLINE ** Você adicionou o <b>(ID: ' .. parseInt(id) .. ')</b> no grupo: <b>' .. group .. '</b>',5)
    end

    vRP.addUserGroup(parseInt(id), group)
    vRP.sendLog(config.webhooks['contratar/promover'],'[PROMOTE/INVITE] O USER_iD ' .. id .. ' FOI PROMOVIDO OU ADICIONADO NO CARGO ' .. group .. ' POR ' .. user_id)

    orgCache[org][#orgCache[org] + 1] = {
        name = newUser.name,
        group = newUser.group,
        status = 1,
        user_id = id,
        last_login = 'Recente'
    }

    return TriggerClientEvent('Notify',src,'sucesso','Você adicionou o <b>(ID: ' .. parseInt(id) .. ')</b> no grupo: <b>' .. group .. '</b>',5)
end
