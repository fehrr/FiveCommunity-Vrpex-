-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONNECTION
-----------------------------------------------------------------------------------------------------------------------------------------
cRP = {}
Tunnel.bindInterface("vrp_tattos",cRP)
vCLIENT = Tunnel.getInterface("vrp_tattos")

-----------------------------------------------------------------------------------------------------------------------------------------
-- GETPLAYERS
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.updateTattoo(status)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.updateUserApparence(user_id, "tattos", status)
		vRP.execute("apparence/tattos",{ user_id = user_id, tattos = json.encode(status) })
		vCLIENT._setTattos(source, status)
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SETINSTANCE
-----------------------------------------------------------------------------------------------------------------------------------------
function cRP.setInstance(status)
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
-- PLAYERSPAWN
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("tattos:init", function(user_id)
	local source = vRP.getUserSource(user_id)
	if source and user_id then
		local data = vRP.getUserApparence(user_id)
		vCLIENT._setTattos(source, data.tattos)
	end
end)

RegisterCommand('test', function(source,args)
	local user_id = vRP.getUserId(source)
	if source then
		local data = vRP.getUserApparence(user_id)
		if user_id then
			vCLIENT._setTattos(source, data.tattos)
		end
	end
end)