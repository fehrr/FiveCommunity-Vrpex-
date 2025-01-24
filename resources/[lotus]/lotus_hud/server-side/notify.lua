src.messageSent = function(message)
  local source = source;
	local user_id = vRP.getUserId(source)
	local location,y,z = GetEntityCoords(GetPlayerPed(source))

	local org = vRP.getUserGroupOrg(user_id)
	exports['vrp']:setCooldown(9, 'notify_interactive-'..org, 900)

	for id,source in pairs(vRP.getUsers()) do
		if not vRP.hasPermission(id, "perm.ilegal") and not vRP.hasPermission(id, "perm.disparo") and not vRP.hasPermission(id, "perm.unizk") and not vRP.hasPermission(id, "perm.bombeiro")  then  
			vCLIENT._request(tonumber(source), message, location.x, location.y)
		end
	end
end


RegisterCommand("rec", function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if not isLeader(user_id) then return end
	local org = vRP.getUserGroupOrg(user_id)
	local status,time = exports['vrp']:getCooldown(9, 'notify_interactive-'..org)

	if not status then
		local timeLeft = time
		if timeLeft <= 60 then
			timeLeft = timeLeft..' segundos'
		elseif timeLeft <= 3600 then
			timeLeft = math.floor(timeLeft / 60)..' minutos'
		else
			timeLeft = math.floor(timeLeft / 60 / 60)..' horas'
		end

		TriggerClientEvent('Notify', source, 'negado', 'Você não pode utilizar esse comando durante '..timeLeft )
		return
	end
	vCLIENT.open(source)
end)


function isLeader(user_id) 
	local getGroup = vRP.getUserGroupByType(user_id, 'org')

	return string.find(getGroup, "Lider") ~= nil
end