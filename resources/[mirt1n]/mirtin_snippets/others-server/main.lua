local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("mirtin_snippets",src)
Proxy.addInterface("mirtin_snippets",src)

vCLIENT = Tunnel.getInterface("mirtin_snippets")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local trancas = {}

function src.syncLock(area, status, permissao)
    if type(area) == 'table' or type(status) == 'table' then return end
    
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, permissao) or vRP.hasPermission(user_id, "developer.permissao") then
            vCLIENT._setLock(-1, area, status)
            trancas[area] = status
            return true
        else
            TriggerClientEvent("Notify",source,"negado","Você não possui a chave dessa fechadura", 5)
        end
    end
end

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if first_spawn then
        if user_id then
            vCLIENT._syncAllLock(source, trancas)
        end
	end
end)

