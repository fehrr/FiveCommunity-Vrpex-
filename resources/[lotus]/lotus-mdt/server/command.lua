viewing = nil
local isInCache = function(user_id)
    for orgName,_ in pairs(orgCache) do
        for k,v in pairs(orgCache[orgName]) do 
            if (v.user_id == user_id) then
                return true
            end
        end
    end
    return false
end
local addToCache = function(user, org)
    if (not user or not org) then return end
    orgCache[org][#orgCache[org] + 1] = {
        name = user.name,
        group = user.group,
        status = 1,
        user_id = user.user_id,
        last_login = 'Recente'
    }
end
local open = function(source, args)
    local src = source
    local user_id = vRP.getUserId(src)

    if (not user_id) then
        return
    end

    local user = User:get(user_id)
    local adminMode = (args[1] == 'adm')

    if (not creatingCache) then
        return TriggerClientEvent('Notify', src, 'negado', 'Sistema inicializando, aguarde alguns segundos...', 5)
    end

    if (adminMode) then
        if (not args[2]) then
            local str = ''
            for orgName, _ in pairs(config.cargos) do
                str = ('%s <br>/mdt adm %s'):format(str, orgName)
            end
            return TriggerClientEvent('Notify', src, 'negado', str, 5)
        end

        if (not isAdmin(user_id)) then
            return TriggerClientEvent('Notify', src, 'negado', 'Você não é um administrador', 5)
        end

        if (not orgCache[args[2]]) then
            return TriggerClientEvent('Notify', src, 'negado', 'Essa organização não existe', 5) 
        end

        if (not user) then 
            user = {}
            user.group = {}    
        end

        user.name = 'Administrador'
        user.group.role = 'Gerenciamento'
        user.group.org = args[2]

        local payload = {
            action = 'open',
            user = user,
            members = orgCache[user.group.org] or {},
            requests = {},
            ranks = config.cargos[user.group.org],
            isAdmin = true
        }

        return vCLIENT.visibility(src, payload)
    end

    if (not user) then 
        return TriggerClientEvent('Notify', src, 'negado', 'Você não é um policial...', 5)
    end

    if (not isInCache(user_id)) then
        addToCache(user, user.group.org)
    end

    local payload = {
        action = 'open',
        user = user,
        members = orgCache[user.group.org] or {},
        requests = {},
        ranks = config.cargos[user.group.org]
    }

    return vCLIENT.visibility(src, payload)
end
RegisterCommand('mdt', open)
