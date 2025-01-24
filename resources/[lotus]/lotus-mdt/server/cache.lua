creatingCache = false
orgCache = {}
last_login = {}
ID_QUERY = 'SELECT * FROM vrp_user_identities'
USER_IDENTITY_QUERY = 'SELECT * FROM vrp_user_identities WHERE user_id = ?'
SINGLE_USER_DATA_QUERY = [[
    SELECT ui.user_id, ui.nome, ui.sobrenome, ud.dvalue, u.ultimo_login
    FROM vrp_user_identities ui
    JOIN vrp_user_data ud ON ui.user_id = ud.user_id
    JOIN vrp_users u ON ui.user_id = u.id
    WHERE ui.user_id = ? AND (
        %s
    );
]]
ALL_USER_DATA_QUERY = [[
    SELECT ui.user_id, ui.nome, ui.sobrenome, ud.dvalue, u.ultimo_login
    FROM vrp_user_identities ui
    JOIN vrp_user_data ud ON ui.user_id = ud.user_id
    JOIN vrp_users u ON ui.user_id = u.id
    WHERE %s
]]

queryFilter = function(query)
    if (not query) then
        return
    end
    local str = ''

    for orgName, _ in pairs(config.cargos) do
        for cargo, _ in pairs(config.cargos[orgName]) do
            str = ([[%s OR ud.dvalue LIKE  %s%s%s]]):format(str, [['%]], cargo, [[%']])
        end
    end
    local filter_roles = str:sub(4)

    return (query):format(filter_roles)
end

local formatRole = function(groups)
    for group in pairs(groups) do
        if (grupos[group] and grupos[group]._config and grupos[group]._config['orgName']) then
            local name = grupos[group]._config['orgName']
            if (config.cargos[name]) then
                return {org = name, role = group, tier = config.cargos[name][group]?.tier}
            end
        end
    end
end

AddEventHandler("vRP:playerLeave",function(user_id,source)
    if (not user_id) then
        return
    end
    local user = User:get(user_id)
    if (not user) then
        return
    end
    for k,v in pairs(orgCache[user.group.org]) do
        if (user_id == v.user_id) then
            orgCache[user.group.org][k].status = 0
            return
        end
    end
end)

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if not user_id then
        return
	end
    local user = User:get(user_id)
    if (not user) then
        return
    end
    for k,v in pairs(orgCache[user.group.org]) do
        if (user_id == v.user_id) then
            orgCache[user.group.org][k].status = 1
            return
        end
    end
end)

local init = function()
    local res = exports['oxmysql']:executeSync(ID_QUERY)
    if (not res[1]) then
        return
    end

    local filteredQ = queryFilter(ALL_USER_DATA_QUERY)
    local policeOnly = exports['oxmysql']:executeSync(filteredQ)
    local count = 0

    for k,v in pairs(config.cargos) do 
        if (not orgCache[k]) then
            orgCache[k] = {}
            print(('^2criando estrutura de cache para a org => %s'):format(k))
        end
    end

    for _,data in pairs(policeOnly) do
        local user_id, nome, sobrenome, dvalue, ultimo_login in data
        local groups = json.decode(dvalue).groups
        local roleFormat = formatRole(groups)
        if (roleFormat) then
            if (not orgCache[roleFormat.org]) then
                orgCache[roleFormat.org] = {}
            end

            orgCache[roleFormat.org][#orgCache[roleFormat.org]+1] = {
                name = ('%s %s'):format(nome, sobrenome),
                group = formatRole(groups),
                status = (vRP.getUserSource(user_id) and 1 or 0),
                user_id = user_id,
                last_login = ultimo_login
            }
            count += 1
        end
    end
    creatingCache = true
    print('^2cache criado para => ', count, 'policiais^0')
end
CreateThread(init)
