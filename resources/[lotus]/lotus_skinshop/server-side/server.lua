-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRPC = Tunnel.getInterface("vRP")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_roupas",cRP)
vCLIENT = Tunnel.getInterface("vrp_roupas")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECKOPEN
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.updateBucket(status)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if status then
			SetPlayerRoutingBucket(source, user_id)
		else
			SetPlayerRoutingBucket(source, 0)
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATECLOTHES
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.updateClothes(clothes)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.execute("apparence/roupas",{ user_id = user_id, roupas = json.encode(clothes) })
		vRP.updateUserApparence(user_id, "clothes", clothes)
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- COMMANDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('oculos', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id, "roupas") >= 1 or vRP.hasPermission(user_id,"perm.roupas") then
			-- vCLIENT._updateClothes(source, "oculos", tonumber(args[1]), tonumber(args[2]))
			TriggerClientEvent("oculos",source,args[1],args[2])

		end
	end
end)

RegisterCommand('chapeu', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id, "roupas") >= 1 or vRP.hasPermission(user_id,"perm.roupas") then
			TriggerClientEvent("chapeu",source,args[1],args[2])
			-- vCLIENT._updateClothes(source, "chapeu", tonumber(args[1]), tonumber(args[2]))
		end
	end
end)

RegisterCommand('sapatos', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id, "roupas") >= 1 or vRP.hasPermission(user_id,"perm.roupas") then
			-- vCLIENT._updateClothes(source, "sapato", tonumber(args[1]), tonumber(args[2]))
			TriggerClientEvent("sapatos",source,args[1],args[2])
		end
	end
end)

RegisterCommand('maos', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id, "roupas") >= 1 or vRP.hasPermission(user_id,"perm.roupas") then
			-- vCLIENT._updateClothes(source, "mao", tonumber(args[1]), tonumber(args[2]))
			TriggerClientEvent("maos",source,args[1],args[2])

		end
	end
end)

RegisterCommand('colete', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id, "roupas") >= 1 or vRP.hasPermission(user_id,"perm.roupas") then
			-- vCLIENT._updateClothes(source, "colete", tonumber(args[1]), tonumber(args[2]))
			TriggerClientEvent("setcolete",source,args[1],args[2])

		end
	end
end)

RegisterCommand('jaqueta', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id, "roupas") >= 1 or vRP.hasPermission(user_id,"perm.roupas") then
			-- vCLIENT._updateClothes(source, "jaqueta", tonumber(args[1]), tonumber(args[2]))
			TriggerClientEvent("jaqueta",source,args[1],args[2])
			
		end
	end
end)

RegisterCommand('mascara', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id, "roupas") >= 1 or vRP.hasPermission(user_id,"perm.roupas") then
			-- vCLIENT._updateClothes(source, "mascara", tonumber(args[1]), tonumber(args[2]))
			TriggerClientEvent("mascara",source,args[1],args[2])

		end
	end
end)

RegisterCommand('acessorio', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id, "roupas") >= 1 or vRP.hasPermission(user_id,"perm.roupas") then
			-- vCLIENT._updateClothes(source, "acessorio", tonumber(args[1]), tonumber(args[2]))
			TriggerClientEvent("acessorios",source,args[1],args[2])

		end
	end
end)

RegisterCommand('blusa', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id, "roupas") >= 1 or vRP.hasPermission(user_id,"perm.roupas") then
			-- vCLIENT._updateClothes(source, "blusa", tonumber(args[1]), tonumber(args[2]))
			TriggerClientEvent("blusa",source,args[1],args[2])

		end
	end
end)

RegisterCommand('calca', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.getInventoryItemAmount(user_id, "roupas") >= 1 or vRP.hasPermission(user_id,"perm.roupas") then
			-- vCLIENT._updateClothes(source, "calca", tonumber(args[1]), tonumber(args[2]))
			TriggerClientEvent("calca",source,args[1],args[2])

		end
	end
end)



function cRP.checkPermission()
    local source = source
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "streamer.permissao") or vRP.hasPermission(user_id, "diretor.permissao") then
        return true
    end
end
