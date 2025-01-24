server.factionsCache = {}
server.richersCache = {}
server.onlineCache = {}


server.refresh = function()
  local queryFactions = exports.oxmysql:executeSync('SELECT * FROM dm_ranks ORDER BY wins DESC LIMIT 10')
  local queryRichers = exports.oxmysql:executeSync("SELECT user_id, banco FROM vrp_user_identities ORDER BY banco DESC LIMIT 10;")
  local queryOnlines = exports.oxmysql:executeSync('SELECT user_id, time FROM lotus_loot ORDER BY time DESC LIMIT 10')

  for k,v in pairs(queryFactions) do
    table.insert(server.factionsCache, {
      name = v.org,
      type = v.orgType,
      wins = v.wins
    })
  end

  for k,v in pairs(queryRichers) do
    local identity = vRP.getUserIdentity(v.user_id)
    table.insert(server.richersCache, {
      name = identity.nome
    })
  end

  for k,v in pairs(queryOnlines) do
    local identity = vRP.getUserIdentity(v.user_id)
    if identity then
      table.insert(server.onlineCache, {
        name = identity.nome
      })
    end
  end
end

server.manageClient = function(action, description) 
  local source = source
  local user_id = vRP.getUserId(source)

  if action == 'requestInfos' and user_id then
    local identity = vRP.getUserIdentity(user_id)
    local org = vRP.getUserGroupOrg(user_id)
    if not org or org == nil or org == "" then
      org = "Não possui"
    end

    return {
      user = {
        id = user_id,
        age = identity.idade,
        org = org,
        name = identity.nome .. " " .. identity.sobrenome,
        number = identity.telefone,
      },
      url = config.url
    }
  end
  if action == 'loadList' and user_id then
    return {
      rich = server.richersCache,
      faction = server.factionsCache,
      online = server.onlineCache,
    }
    --[[ if description == 'rich' then
      return server.richersCache
    elseif description == 'faction' then
      return server.factionsCache
    elseif description == 'online' then
      return server.onlineCache
    end ]]
  end
end

exports('refresh', function()
  server.refresh()
end)

CreateThread(function()
  while true do
    server.refresh()
    Wait(1000000)
  end
end)
