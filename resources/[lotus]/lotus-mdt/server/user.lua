User = {}
User.__index = User -- metamethod
local cfg = module('cfg/groups')
grupos = cfg.groups


isAdmin = function(user_id)
    if (not user_id) then
        return
    end
    for _, perm in pairs(config.adminPerms) do
        if (vRP.hasPermission(user_id, perm)) then
            return true
        end
    end
    return false
end

getRole = function(user_id)
    local online = vRP.getUserSource(user_id)
    local groups

    if (online) then
        groups = vRP.getUserGroups(user_id)
    else
        local filteredQ = queryFilter(SINGLE_USER_DATA_QUERY)
        local res = exports['oxmysql']:executeSync(filteredQ, {user_id})
        if (not res[1]) then
            return false
        end
        groups = json.decode(res[1].dvalue).groups
        print('^1fazendo query pra pegar os groups^0')
    end

    for group in pairs(groups) do
        if (grupos[group] and grupos[group]._config and grupos[group]._config['orgName']) then
            local name = grupos[group]._config['orgName']
            if (config.cargos[name]) then
                return {org = name, role = group, tier = config.cargos[name][group]?.tier}
            end
        end
    end

    return false
end

local getName = function(user_id)
    if (not user_id) then
        return
    end

    local online = vRP.getUserSource(user_id)

    if (online) then
        local identity = vRP.getUserIdentity(user_id)

        if (identity) then
            local nome = ('%s %s'):format(identity.nome, identity.sobrenome)

            return nome
        end

        local nome = 'Individuo Indigente'

        return nome
    end

    local res = exports['oxmysql']:executeSync(USER_IDENTITY_QUERY, {user_id})

    if (not res[1]) then
        local nome = 'Individuo Indigente'

        return nome
    end

    local nome = ('%s %s'):format(res[1].nome, res[1].sobrenome)

    return nome
end

local getUptime = function(user_id)
    if (not user_id) then
        return
    end

    local online = vRP.getUserSource(user_id)

    if (online) then
        return os.time()
    end
end

function User:get(user_id)
    if (not user_id) then
        return
    end
    local self = setmetatable({}, User)

    self.user_id = user_id
    self.group = getRole(user_id)
    self.name = getName(user_id)
    self.uptime = getUptime(user_id)

    if (not self.group) then
        return false
    end

    return self
end

bridge.getName = function(id)
    if (not id) then return end
    local src = source
    local user_id = vRP.getUserId(src)
    if (not user_id) then return end 
    local rows = vRP.query("vRP/get_user_identity",{ user_id = id })
    if #rows == 0 then
        return false
    end
    local name = ('%s %s'):format(rows[1].nome, rows[1].sobrenome)
    return name
end