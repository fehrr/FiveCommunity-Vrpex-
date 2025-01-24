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
cO = {}
Tunnel.bindInterface("vrp_barbearia",cO)
vCLIENT = Tunnel.getInterface("vrp_barbearia")

-----------------------------------------------------------------------------------------------------------------------------------------
-- BARBER
-----------------------------------------------------------------------------------------------------------------------------------------
cO.checkOpen = function()
	local source = source
    local player = vRP.getPlayerBySource(source)
    if player then 
        return player.isWanted()
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- UPDATESKIN
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.updateSkin(myClothes)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		vRP.updateUserApparence(user_id, "rosto", myClothes)
		vRP.execute("apparence/rosto",{ user_id = user_id, rosto = json.encode(myClothes) })
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SPAWN CHARACTER
-----------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("barbershop:init", function(user_id)
	local source = vRP.getUserSource(user_id)
	if source then
		local data = vRP.getUserApparence(user_id)
		if user_id then
			if data.rosto then
				vCLIENT._setCharacter(source, data.rosto)
			end
		end
	end
end)


RegisterCommand('debugrosto', function(source,args)
	local user_id = vRP.getUserId(source)
	if source then
		if GetEntityHealth(GetPlayerPed(source)) > 110 then
			local data = vRP.getUserApparence(user_id)
			
			if user_id then
				if data.rosto then
					vCLIENT._setCharacter(source, data.rosto)
				end

				vRPclient._setCustomization(source, data.clothes)
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- SETINSTANCE
-----------------------------------------------------------------------------------------------------------------------------------------
function cO.setInstance(status)
    local source = source 
    local user_id = vRP.getUserId(source)
    if user_id then 
        if status then 
			Player(source).state:set('routingBucket',parseInt(user_id),true)
        else
			Player(source).state:set('routingBucket',0,true)
        end
		SetPlayerRoutingBucket(source, Player(source).state.routingBucket)
    end
end