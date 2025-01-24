local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
atl = {}
Tunnel.bindInterface("ranking_chamados",atl)
	
local ranking = {}
local name = {}

vRP.prepare('apz/Ranking', 'SELECT * FROM bm_chamados ORDER BY qtd DESC')

function atl.ranking() 
    local source = source
    local id_ranking 
    
    ranking = vRP.query("apz/Ranking", {})
    for k in pairs(ranking) do
        id_ranking = ranking[k].user_id
        local user_data = vRP.getUserIdentity(parseInt(id_ranking))
        if user_data then
            local user_name = user_data.nome..' | '..id_ranking
            table.insert(name, { name = user_name })

        -- else
        --     local user_name = 'Indigente | '..id_ranking
        end

    end 


    return ranking, name
end

function atl.checkpermranking()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, "developer.permissao") or vRP.hasPermission(user_id, "diretor.permissao") then
        return true
    else
        TriggerClientEvent("Notify",source,"negado","Você não tem permissão a este comando!")
        return false
    end
end