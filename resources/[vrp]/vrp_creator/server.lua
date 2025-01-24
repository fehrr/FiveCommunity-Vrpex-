local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface(GetCurrentResourceName(), src)


local inCreator = {}


src.getUserId = function()
	local source = source
	local id = vRP.getUserId(source)
	return id
end

src.checkWhitelist = function()
	local source = source
	local user_id = vRP.getUserId(source)

	if user_id then
		local query = exports.oxmysql:executeSync('SELECT * FROM vrp_users WHERE id = '..user_id)
		if #query > 0 and query[1].whitelist > 0 then
			return true
		end
	end
	return false
end

local cars = {
	["z4bmw"] = true,
	["golf7gti"] = true,
	["z1000"] = true,
}

-- vRP.prepare("vRP/increment_find","UPDATE leads SET "..find.." = "..find.." + 1")
src.finishWhitelist = function(data)
	local source = source
	local user_id = vRP.getUserId(source)
	if not user_id then return end

	if not inCreator[user_id] then
		DropPlayer(source, ":)")
		vRP.setBanned(user_id, true, "INJECT finishWhitelist")
		return
	end

	local findType = data.find
	if findType then
		local query = "INSERT INTO leads_new (user_id, type, created_at) VALUES (?, ?, ?)"
		exports.oxmysql:executeSync(query, {user_id, findType, os.date('%Y-%m-%d %H:%M:%S')})
		
        local query = "UPDATE leads SET " .. findType .. " = " .. findType .. " + 1"
        exports.oxmysql:executeSync(query)
	end

	vRP.execute("vRP/update_user_first_spawn",{ user_id = user_id, nome = data.name, sobrenome = data.surname, idade = data.age })
	vRP.updateIdentity(user_id)

	local uData = vRP.getUData(user_id, 'rewardCar') or false
	if uData == "" then
		if cars[data.vehicle] then
			vRP.setUData(user_id, 'rewardCar', 1)
			vRP.execute("vRP/inserir_veh",{ veiculo = data.vehicle, user_id = user_id, ipva = os.time(), expired = "{}" })
		end
	else
		TriggerClientEvent("Notify",source,"negado","Você já resgatou um veiculo anteriormente.", 5)
	end
end

local userlogin = {}
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if first_spawn then
		Wait(1500)
		local rows = vRP.query("vRP/get_controller",{ user_id = user_id }) or 0
		if rows and rows[1].controller then
			processSpawnController(source,rows[1].controller,user_id)
		end
	end
end)

function processSpawnController(source,statusSent,user_id)
	local source = source
	if statusSent >= 1 then
		if not userlogin[user_id] then
			userlogin[user_id] = true
			doSpawnPlayer(source,user_id,false)
		else
			doSpawnPlayer(source,user_id,true)
		end
	elseif statusSent == 0 then
		inCreator[user_id] = true
		userlogin[user_id] = true
		TriggerClientEvent("character:characterCreate",source)
		SetPlayerRoutingBucket(source, user_id)
	end
end

RegisterServerEvent("character:finishedCharacter")
AddEventHandler("character:finishedCharacter",function(currentCharacterMode,Clothes)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local query = vRP.query("vRP/get_controller", { user_id = user_id })
		if #query > 0 then
			if not inCreator[user_id] then
				DropPlayer(source, ":)")
				vRP.setBanned(user_id, true, "INJECT finishWhitelist")
				return
			end
			inCreator[user_id] = nil
			
			vRP.execute("vRP/set_controller",{ user_id = user_id, controller = 1, rosto = json.encode(currentCharacterMode), roupas = json.encode(Clothes) })
			vRP.updateUserApparence(user_id, "clothes", Clothes)
			vRP.updateUserApparence(user_id, "rosto", currentCharacterMode)
			
			-- SetTimeout(60*1000, function()
			-- 	exports.bm_module:getAccount(source)
			-- end) 

			vRP.giveInventoryItem(user_id, "money", 5000, false, 1)
			vRP.giveInventoryItem(user_id, "celular", 1, false, 2)

			SetPlayerRoutingBucket(source, 0)
		
			TriggerEvent("barbershop:init", user_id)
		end
	end
end)

function doSpawnPlayer(source,user_id,firstspawn)
	if source then
		TriggerClientEvent("character:normalSpawn",source,firstspawn)

		-- SetTimeout(5000,function() 
		-- 	exports.bm_module:getAccount(source)
		-- end)
	end
end