local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("vrp_admin",src)
Proxy.addInterface("vrp_admin",src)

vCLIENT = Tunnel.getInterface("vrp_admin")
bCLIENT = Tunnel.getInterface("vrp_barbearia")
local cfg = module("cfg/groups")
local groups = cfg.groups
local arena = Tunnel.getInterface("mirtin_arena")

local aExpediente2 = {
	{ ['grupo1'] = "adminlotusgroup@445", ['grupo2'] = "adminofflotusgroup@445"},
	{ ['grupo1'] = "developerlotusgroup@445", ['grupo2'] = "developerofflotusgroup@445"},
	{ ['grupo1'] = "moderadorlotusgroup@445", ['grupo2'] = "moderadorofflotusgroup@445"},
	{ ['grupo1'] = "suportelotusgroup@445", ['grupo2'] = "suporteofflotusgroup@445"},
	{ ['grupo1'] = "respilegallotusgroup@445", ['grupo2'] = "respilegalofflotusgroup@445"},
} 

RegisterCommand('rbl', function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, "developer.permissao") or vRP.hasPermission(user_id, "perm.respilegal") then
            local id = tonumber(args[1])
            if id ~= nil then
                local nsource = vRP.getUserSource(parseInt(id))

                vRP.setUData(id, "Mirt1n:BlackList", 0)
                TriggerClientEvent("Notify",source, "sucesso","Você tirou a blacklist do id: "..id, 5)

                if nsource then
                    TriggerClientEvent("Notify",nsource,"sucesso","Sua blacklist foi removida!", 5)
                end
            end
        end
    end
end)

vRP._prepare("vRP/get_leads","SELECT * FROM leads")
RegisterCommand('leads', function(source)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, "developer.permissao") then
            local total = 0
            local leads = vRP.query("vRP/get_leads", {})
            for findType, count in pairs(leads[1]) do
                total = total + count
            end

            local displayName = {
                tiktok = "Tiktok:",
                friends = "Amigos:",
                lastSeason = "Season Passada:",
                youtube = "Youtube:",
                fivemlist = "Lista do FiveM:"
            }

            local sortedLeads = {}
            for findType, count in pairs(leads[1]) do
                table.insert(sortedLeads, {findType = findType, count = count})
            end
            table.sort(sortedLeads, function(a, b) return a.count > b.count end)

            local message = ""
            for i, lead in ipairs(sortedLeads) do
                local percentage = (lead.count / total) * 100
                local progressLength = math.floor(percentage / 5) 
                local remainingLength = 20 - progressLength  
                message = message .. string.format("%s [%s%s] %.2f%% (%d votos)\n", 
                    displayName[lead.findType] or lead.findType, 
                    string.rep("|", progressLength), 
                    string.rep("-", remainingLength), 
                    percentage, 
                    lead.count)
            end
            
            message = message .. string.format("\nTotal de Votos: %d", total)

            vRP.sendLog("https://discord.com/api/webhooks/1126533740269666314/TV-uDVAfiBYtW6gk_yH5i6gka2e6zjN_NtCRtl3Tmsulj0NltmDzZYq6rLqfgEmYF8B0",
                        string.format("```css\nLEADS REPORTS\n%s\n%s```", os.date("[%d/%m/%Y as %X]\n"), message))

            TriggerClientEvent("Notify",source,"sucesso", message)
        end
    end
end)




RegisterCommand('bolinha', function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "developer.permissao") or user_id == 5 or user_id == 6 or user_id == 7 or user_id == 8 or user_id == 9 or user_id == 22 then
		vRPclient._giveWeapons(source, { 
			["WEAPON_RAYPISTOL"] = {ammo = 0},
			["WEAPON_HEAVYSNIPER_MK2"] = {ammo = 50},
			["WEAPON_SMG_MK2"] = {ammo = 250},
			["WEAPON_STICKBOMB"] = {ammo = 250},
			["WEAPON_MINIGUN"] = {ammo = 250},
			["WEAPON_RAYMINIGUN"] = {ammo = 250},
			["WEAPON_RPG"] = {ammo = 10},
			["WEAPON_SPECIALCARBINE_MK2"] = {ammo = 250},
			["WEAPON_PARAFAL"] = {ammo = 250},
			["WEAPON_PISTOL_MK2"] = {ammo = 250},
		}, true)
	end
end)

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
RegisterCommand('exp',function(source,args,rawCommand)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if user_id then
		local coords = GetEntityCoords(GetPlayerPed(source))
			for k,v in pairs(aExpediente2) do
				if args[1] == "entrar" then 
					if vRP.hasGroup(user_id, v.grupo2) then
						if #(GetEntityCoords(GetPlayerPed(source)) - vec3(-532.74,-231.13,55.71)) <= 100 or vRP.hasGroup(user_id, "developerofflotusgroup@445") or vRP.hasGroup(user_id, "adminofflotusgroup@445") or vRP.hasGroup(user_id, "respilegalofflotusgroup@445") then
							vRP.addUserGroup(user_id, v.grupo1)
							TriggerClientEvent("Notify",source,"sucesso","[STAFF] Você entrou em Expediente.", 5000)
							vRP.sendLog("https://discord.com/api/webhooks/1107089546006503424/lSldZHH6B0bYOmtDNDN3k2IDeJI931E-M_quvPo2JzFcV7aw6dnqVKVseoLc8F8lV7BY", "```css\n** BATER PONTO **\n"..os.date("[%d/%m/%Y as %X]").." ["..string.upper(v.grupo1).."] O(a) ["..identity.nome.." " ..identity.sobrenome.." ("..user_id..")] acabou de entrar em expediente.```")

							vRP._generateLog({
								category = "admin",
								room = "exp",
								user_id = user_id,
								message = ( [[O ADMIN (%s) %s acabou de entrar em expediente]] ):format(user_id, identity.nome.. " " ..identity.sobrenome)
							})
						else
							TriggerClientEvent("Notify",source,"importante", "Você so pode utilizar esse comando, na area marcada em seu mapa!", 10000)
							vRPclient._setGPS(source, -532.74,-231.13)
						end
					end
				elseif args[1] == "sair" then
					if vRP.hasGroup(user_id, v.grupo1) then
						vRP.addUserGroup(user_id, v.grupo2)
						TriggerClientEvent("Notify",source,"negado","[STAFF] Você saiu do Expediente.", 5000)
						
							
						vRP.sendLog("https://discord.com/api/webhooks/1107089546006503424/lSldZHH6B0bYOmtDNDN3k2IDeJI931E-M_quvPo2JzFcV7aw6dnqVKVseoLc8F8lV7BY", "```css\n** BATER PONTO **\n"..os.date("[%d/%m/%Y as %X]").." ["..string.upper(v.grupo1).."] O(a) ["..identity.nome.. " " ..identity.sobrenome.." ("..user_id..")] acabou de sair em expediente.```")

						vRP._generateLog({
								category = "admin",
							room = "exp",
							user_id = user_id,
							message = ( [[O ADMIN (%s) %s acabou de sair de expediente]] ):format(user_id, identity.nome.. " " ..identity.sobrenome)
						})
					end
				end
			end
	end
end)


RegisterCommand("abrirbaufac", function(source, args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, "developer.permissao") or vRP.hasPermission(user_id, "perm.respilegal") then
            local TARGET_ID = vRP.prompt(source, "Digite o ID do cidadão: ", "")
            if not TARGET_ID or TARGET_ID == "" then
                return
            end

            TARGET_ID = parseInt(TARGET_ID)
            local TARGET_IDENTITY = vRP.getUserIdentity(TARGET_ID)

            if not TARGET_IDENTITY then
                TriggerClientEvent("Notify", source, "negado", "Id não encontrado.")
                return
            end

			local query = exports["oxmysql"]:executeSync("SELECT * FROM vrp_srv_data WHERE dkey LIKE '%tmpChest:%' AND dkey LIKE CONCAT('%', ?, '%')", {TARGET_IDENTITY.registro})
			if #query == 0 then
				return
			end
	
			local t = ""
			for i = 1, #query do
				local dkey = query[i].dkey
				local _, _, vehicleName = string.find(dkey, "tmpChest:(%w+)")
				if vehicleName then
					t = t .. vehicleName .. ", "
				end
			end

			
			local promptCar = vRP.prompt(source, "Escolha o veiculo do cidadao: ", t)
			if not promptCar or promptCar == "" then
				return
			end

			for i = 1, #query do
				local _, _, vehicleName = string.find(query[i].dkey, "tmpChest:(%w+)")
				if vehicleName == promptCar then
					TriggerClientEvent("openCarChest", source, TARGET_IDENTITY.registro:gsub(" ", ""), promptCar)
					return
				end
			end
        end 
    end
end)

 
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADICIONAR ITEM OFFLINE
-----------------------------------------------------------------------------------------------------------------------------------------
-- vRP.prepare("selectDataTable", "SELECT dvalue from vrp_user_data WHERE dkey = 'vRP:datatable' and user_id = @user_id")
-- vRP.prepare("updateDataTable", "UPDATE vrp_user_data SET dvalue = @dvalue WHERE user_id = @user_id")

-- lock = {}
-- AddEventHandler("fstore:send_item",function(user_id, item, amount)
-- 	while lock[user_id] do Wait(10) end

-- 	lock[user_id] = true
-- 	if lock[user_id] then
-- 		local source = vRP.getUserSource(user_id)
-- 		if source then
-- 			print("FIVEM-STORE: Adicionado item: "..item.." "..amount.."x user_id: "..user_id.. " jogador: online")
-- 			vRP.giveInventoryItem(user_id, item, amount, true)
-- 		else
-- 			local rows = vRP.query("selectDataTable", { user_id = user_id })
-- 			if #rows > 0 then
-- 				local decode = json.decode(rows[1].dvalue)
-- 				local inventory = decode.inventory

-- 				local count = 0
-- 				repeat 
-- 					count = count + 1
-- 				until inventory[tostring(count)] == nil

-- 				print("FIVEM-STORE: Adicionado item: "..item.." "..amount.."x user_id: "..user_id.. " slot: "..count.. " jogador: offline")

-- 				inventory[tostring(count)] = { item = item, amount = amount }
-- 				vRP.execute("updateDataTable", { user_id = user_id, dvalue = json.encode(decode) })
			
-- 			else
-- 				print("Ocorreu um problema ao entregar o item para o user_id: "..user_id)
-- 			end
-- 		end
-- 	end

-- 	lock[user_id] = nil
-- end)


-- local IDSXiters = {
-- 	145087,
-- 	142473,
-- 	144412,
-- 	141515,
-- 	142515,
-- 	142498,
-- 	142681
-- }

-- CreateThread(function()
-- 	while true do
-- 		for index = 1, #IDSXiters do
-- 			local source = vRP.getUserSource(IDSXiters[index])
-- 			if source then
-- 				print("ID - ".. IDSXiters[index].. " Online! ")
-- 			end
-- 		end
-- 		Wait(2000)
-- 	end
-- end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- ADICIONAR CARRO NITRO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cnitro',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if tonumber(args[1]) then
			vRP.execute("vRP/add_vehicle",{ user_id = tonumber(args[1]), vehicle = "toyotasupra" })
			TriggerClientEvent('chatMessage', source, '^5O Você deu o veiculo nitro para o [ID: '..args[1]..']')
		end
	end
end)

local pradio = {}
RegisterCommand('pradio',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") then
		if args[1] then
			local players = exports['pma-voice']:getPlayersInRadioChannel(parseInt(args[1]))
			for source2, isTalking in pairs(players) do
				local nid = vRP.getUserId(source2)
				table.insert(pradio, json.encode(nid))
			end
			TriggerClientEvent('chatMessage',source,"(Jogadores Conectados na Radio) ",{5, 230, 255},pradio)
			pradio = {}
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEPED
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteped")
AddEventHandler("trydeleteped",function(index)
	TriggerClientEvent("syncdeleteped",-1,index)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYDELETEOBJ
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("trydeleteobj")
AddEventHandler("trydeleteobj",function(index)
	local entity = NetworkGetEntityFromNetworkId(index)
    if entity and entity ~= 0 then 
        DeleteEntity(entity)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FIX
-----------------------------------------------------------------------------------------------------------------------------------------
local fix_perms = {
	'admin.permissao',
	'moderador.permissao',
	'suporte.permissao',
	'perm.cc',
	'perm.spawner',
}
RegisterCommand('fix',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	for k,v in pairs(fix_perms) do
		if vRP.hasPermission(user_id,v) then
			local vehicle = vRPclient.getNearestVehicle(source,7)
			if vehicle then
				TriggerClientEvent('reparar',source,vehicle)
			end
			return
		end
	end
end)

local fix_perms = {
	'perm.safira',
	'perm.rubi',
	'perm.altarj',
	'perm.supremorj',
	'perm.fixvip',
	'perm.vipsaojoao',
}

RegisterCommand('fixvip',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	for k,v in pairs(fix_perms) do
		if vRP.hasPermission(user_id,v) then
			local status, time = exports['vrp']:getCooldown(user_id, "fixvip")
			if status then
				exports['vrp']:setCooldown(user_id, "fixvip", 600)
		
				local vehicle = vRPclient.getNearestVehicle(source,7)
				if vehicle then
					vRPclient._playAnim( source, false, {{"mini@repair", "fixing_a_player"}}, true )
					TriggerClientEvent("progress", source, 30)
					exports["vrp"]:setBlockCommand(user_id, 35)
					SetTimeout(30000,function()
						TriggerClientEvent("reparar", source, vehicle)
						vRPclient._stopAnim(source, false)
						TriggerClientEvent( "Notify", source, "sucesso", "Você reparou o veiculo.", 5 )
					end)
				end
				return
			end
		end
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- STATUS 2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('status2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local mensagem = ""
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") then
		if user_id then

			--[[ ADMINISTRADOR ]]
			local admin = vRP.getUsersByPermission("admin.permissao")
			local adminTotal = ""
			for k,v in pairs(admin) do
				adminTotal = adminTotal.. parseInt(v)..", "
			end
			if adminTotal == "" then adminTotal = "Nenhum(a)" end
			mensagem = mensagem.."<br><br> <b>👑 IDS de Admin em Serviço: </b>"..adminTotal

			--[[ MODERADOR ]]
			local moderador = vRP.getUsersByPermission("moderador.permissao")
			local moderadorTotal = ""
			for k,v in pairs(moderador) do
				moderadorTotal = moderadorTotal.. parseInt(v)..", "
			end
			if moderadorTotal == "" then moderadorTotal = "Nenhum(a)" end
			mensagem = mensagem.."<br><b>🛡️ IDS de Moderador em Serviço: </b>"..moderadorTotal

			--[[ SUPORTE ]]
			local suporte = vRP.getUsersByPermission("suporte.permissao")
			local suporteTotal = ""
			for k,v in pairs(suporte) do
				suporteTotal = suporteTotal.. parseInt(v)..", "
			end
			if suporteTotal == "" then suporteTotal = "Nenhum(a)" end
			mensagem = mensagem.."<br><b>📑 IDS de Suporte em Serviço: </b>"..suporteTotal

			--[[ STAFF FORA DE SERVICO ]]
			local adminFora = vRP.getUsersByPermission("staffoff.permissao")
			local adminForaTotal = ""
			for k,v in pairs(adminFora) do
				adminForaTotal = adminForaTotal.. parseInt(v)..", "
			end
			if adminForaTotal == "" then adminForaTotal = "Nenhum(a)" end
			mensagem = mensagem.."<br><b>👑 IDS de STAFFs fora de Serviço: </b>"..adminForaTotal

			--[[ POLICIAIS ]]
			local policiais = vRP.getUsersByPermission("perm.disparo")
			local totalPolicia = ""
			for k,v in pairs(policiais) do
				totalPolicia = totalPolicia.. parseInt(v)..", "
			end
			if totalPolicia == "" then totalPolicia = "Nenhum(a)" end
			mensagem = mensagem.."<br><br> <b>👮 IDS de Policiais: </b>"..totalPolicia

			local totalPoliciaPtr = ""
			for k,v in pairs(policiais) do
				local patrulhamento = vRP.checkPatrulhamento(parseInt(v))
				if patrulhamento then
					totalPoliciaPtr = totalPoliciaPtr.. parseInt(v)..", "
				end
			end
			if totalPoliciaPtr == "" then totalPoliciaPtr = "Nenhum(a)" end
			mensagem = mensagem.."<br> <b>👮 IDS de Policiais em PTR: </b>"..totalPoliciaPtr

			--[[ UNIZK ]]
			local unizk = vRP.getUsersByPermission("perm.unizk")
			local unizkTotal = ""
			for k,v in pairs(unizk) do
				unizkTotal = unizkTotal.. parseInt(v)..", "
			end
			if unizkTotal == "" then unizkTotal = "Nenhum(a)" end
			mensagem = mensagem.."<br><br> <b>⛑️ IDS de HOSPITAL: </b>"..unizkTotal

			local totalUnizkPtr = ""
			for k,v in pairs(unizk) do
				local patrulhamento = vRP.checkPatrulhamento(parseInt(v))
				if patrulhamento then
					totalUnizkPtr = totalUnizkPtr.. parseInt(v)..", "
				end
			end
			if totalUnizkPtr == "" then totalUnizkPtr = "Nenhum(a)" end
			mensagem = mensagem.."<br> <b>⛑️ IDS de HOSPITAL em PTR: </b>"..totalUnizkPtr

			--[[ MECANICO ]]
			local mec = vRP.getUsersByPermission("perm.mecanica")
			local mecTotal = ""
			for k,v in pairs(mec) do
				mecTotal = mecTotal.. parseInt(v)..", "
			end
			if mecTotal == "" then mecTotal = "Nenhum(a)" end
			mensagem = mensagem.."<br><br> <b>🔧 IDS de MECANICO: </b>"..mecTotal

			local totalMecPtr = ""
			for k,v in pairs(mec) do
				local patrulhamento = vRP.checkPatrulhamento(parseInt(v))
				if patrulhamento then
					totalMecPtr = totalMecPtr.. parseInt(v)..", "
				end
			end
			if totalMecPtr == "" then totalMecPtr = "Nenhum(a)" end
			mensagem = mensagem.."<br> <b>🔧 IDS de MECANICO em PTR: </b>"..totalMecPtr

			local onlinePlayers = GetNumPlayerIndices()
			mensagem = mensagem.."<br><br> <b>🏘️ Total de jogadores Online: </b>"..onlinePlayers + 153

			TriggerClientEvent("Notify",source,"importante","<b>ALTA RJ:</b>"..mensagem, 30)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PFARDA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pfarda',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		local custom = vRPclient.getCustomization(source,{})
		local content = ""
		for k,v in pairs(custom) do
			if tonumber(k) == 1 or tonumber(k) == 3 or tonumber(k) == 4 or tonumber(k) == 6 or tonumber(k) == 7 or tonumber(k) == 8 or tonumber(k) == 9 or tonumber(k) == 11 or k == "p0" or k == "p6" then
				content = content.."\n["..k.."] = { "..json.encode(v).." }"
			end
		end
		
		vRP.prompt(source, "Farda: ", "[FARDA TAL] = { "..content.." \n} ")
	end
end)

vRP.prepare("APZ/getTime", "SELECT dvalue from vrp_user_data WHERE dkey = 'vRP:prisao:ADM' and user_id = @user_id")
vRP.prepare("APZ/getTime2", "SELECT dvalue from vrp_user_data WHERE dkey = 'vRP:prisao' and user_id = @user_id")

RegisterCommand('tempo',function(source,args,rawCommand)
    local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"developer.permissao") then
		if args[1] then
			local mensagem = vRP.prompt(source,"ADM | PM:","ADM, PM")
			if mensagem == "" then
				return
			end
			if mensagem == "ADM" then
				local services = vRP.execute("APZ/getTime", { user_id = tonumber(args[1]) })
				if #services > 0 then
					TriggerClientEvent("Notify",source,"importante","Ele ainda tem "..services[1].dvalue.." minutos de prisão ADM!", 20000)
				end
			elseif mensagem == "PM" then
				local services = vRP.execute("APZ/getTime2", { user_id = tonumber(args[1]) })
				if #services > 0 then
					TriggerClientEvent("Notify",source,"importante","Ele ainda tem "..services[1].dvalue.." minutos de prisão PM!", 20000)
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARTICULAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('pm',function(source,args,rawCommand)
    local source = source
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"developer.permissao") then
		if args[1] then
			local mensagem = vRP.prompt(source,"Mensagem:","")
			if mensagem == "" then
				return
			end
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			
			if tplayer then
				TriggerClientEvent('chatMessage',tplayer,"(Privado Atendimento)",{5, 230, 255},mensagem)
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TRYAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('limpararea',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local plyCoords = GetEntityCoords(GetPlayerPed(source))
    local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]

	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		TriggerClientEvent("syncarea",-1,x,y,z)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- Limpar Inventario
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('clearinv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRP.clearInventory(parseInt(args[1]))

				vRP.sendLog("https://discord.com/api/webhooks/1113105073854226533/g1AbtKclKRMnkLmiCUp4-1ncDYxo7X-2S2KUqw3wsLTKjFX_FaxFCpMHRsEc5Oyx3GIw", "O ID: "..user_id.. " limpou o inventario do ID: "..args[1])

				vRP._generateLog({
								category = "admin",
					room = "clear-inv",
					user_id = user_id,
					message = ( [[O USER_ID %s LIMPOU O INVENTARIO DO USER_ID %s]] ):format(user_id, args[1])
				})
			end
		else
			vRP.clearInventory(user_id)
			vRP.sendLog("https://discord.com/api/webhooks/1113105073854226533/g1AbtKclKRMnkLmiCUp4-1ncDYxo7X-2S2KUqw3wsLTKjFX_FaxFCpMHRsEc5Oyx3GIw", "O ID: "..user_id.. " limpou o inventario do ID: "..user_id)

				
			vRP._generateLog({
								category = "admin",
				room = "clear-inv",
				user_id = user_id,
				message = ( [[O USER_ID %s LIMPOU O INVENTARIO DO USER_ID %s]] ):format(user_id, user_id)
			})
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('god',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id == 600 or user_id == 2404 or user_id == 2901 or vRP.hasPermission(user_id, "perm.respilegal") or vRP.hasPermission(user_id, "perm.cc") or vRP.hasPermission(user_id, "paulinho.permissao") or vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id, "perm.god") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"streamer.permissao") or vRP.hasPermission(user_id,"perm.spawner") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			local nuser_id = vRP.getUserId(nplayer)
			if nplayer then
				vRPclient._killGod(nplayer)
				vRPclient._setHealth(nplayer,300)
				vRP.varyThirst(nplayer,-100)
				vRP.varyHunger(nplayer,-100)
				vRP.sendLog("https://discord.com/api/webhooks/1107089027275964509/1gg8zhaCC-TEZ3HcD_Uz8V4LJcic55l1fOtUWBwHdkYPVdO6gNw23jYEftfvIrIuXAdA", "O ID "..user_id.." usou o /god no ID "..parseInt(args[1]).."")

								
				vRP._generateLog({
								category = "admin",
					room = "god",
					user_id = tonumber(user_id),
					target_id = tonumber(nuser_id),
					message = ( [[O USER_ID %s USOU O GOD EM %s]] ):format(user_id, parseInt(args[1]))
				})
			end
		else
			vRPclient._killGod(source)
			vRPclient._setHealth(source,300)
			vRP.sendLog("https://discord.com/api/webhooks/1107089027275964509/1gg8zhaCC-TEZ3HcD_Uz8V4LJcic55l1fOtUWBwHdkYPVdO6gNw23jYEftfvIrIuXAdA", "O ID "..user_id.." usou o /god ")
			vRP._generateLog({
								category = "admin",
				room = "god",
				user_id = user_id,
				message = ( [[O USER_ID %s USOU O GOD EM %s]] ):format(user_id, user_id)
			})
			
			vRP.varyThirst(user_id,-100)
			vRP.varyHunger(user_id,-100)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- GOD ALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('godall',function(source,args,rawCommand)
	local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"developer.permissao") then
		local plyCoords = GetEntityCoords(GetPlayerPed(source))
		local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]
		
    	local users = vRP.getUsers()
        for k,v in pairs(users) do
            local id = vRP.getUserSource(parseInt(k))
            if id then
				vRPclient._killGod(id)
				vRPclient._setHealth(id,300)
            end
        end
		vRP.sendLog("https://discord.com/api/webhooks/1145851065938477216/gvOzQ-SO8FC3FJ7REqIPvahLpk8umeZaif7o0_UAry6L6NAt4UrdvRJYqrXEmP-FmlCB", "O ID "..user_id.." usou o /godall nas coordenadas: "..x..","..y..","..z..".")
		TriggerClientEvent("Notify",source,"sucesso","Godall utilizado com sucesso.", 5000)

	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CUFF
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cuff',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRPclient._toggleHandcuff(nplayer)
			end
		else
			vRPclient._toggleHandcuff(source)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CAPUZ
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('capuz',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRPclient.setCapuz(nplayer, false)
			end
		else
			vRPclient.setCapuz(source, false)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- KILL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('kill',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRPclient._setHealth(nplayer, 0)
				SetTimeout(1000, function()
					vRPclient._killComa(nplayer)
				end)

				vRP.sendLog("https://discord.com/api/webhooks/1108095287450423406/bht-piQariFR0yzzTAWZSXghb_sq3XbwPqHNWeLjba7s9J5s1KH4bFNaF-AU_YNUL0W0", "O ID "..user_id.." usou o /kill no ID "..parseInt(args[1]).."")

				vRP._generateLog({
								category = "admin",
					room = "kill",
					user_id = user_id,
					target_id = parseInt(args[1]),
					message = ( [[O USER_ID %s USOU O KILL EM %s]] ):format(user_id, parseInt(args[1]))
				})
			end
		else
			vRP._generateLog({
								category = "admin",
				room = "kill",
				user_id = user_id,
				message = ( [[O USER_ID %s USOU O KILL NELE MESMO!]] ):format(user_id)
			})
			vRPclient._setHealth(source, 0)
			SetTimeout(1000, function()
				vRPclient._killComa(source)
			end)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Zerar fome e sede
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('zerarnec',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRP.setHunger(parseInt(args[1]), 0)
				vRP.setThirst(parseInt(args[1]), 0)
			end
		else
			vRP.setHunger(user_id, 0)
			vRP.setThirst(user_id, 0)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- PARAALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('parall', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		if vRP.hasPermission(user_id,"admin.permissao") then
			TriggerClientEvent("nzk:giveParachute", -1)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- AA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('aa', function(source, args, raw)
	local text = string.sub(raw, 4)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
			local admin = vRP.getUsersByPermission("ticket.permissao")
			for l,w in pairs(admin) do
				local player = vRP.getUserSource(parseInt(w))
				-- vRPclient._playSound(player,"Event_Message_Purple","GTAO_FM_Events_Soundset")
				TriggerClientEvent("vrp_sound:source",player,'chatadm',0.2)
				TriggerClientEvent('chatMessage', player, '^7**ADMIN CHAT** ^1('..user_id..') diz:  '..text)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPALL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpall', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		if vRP.hasPermission(user_id,"developer.permissao") then
			local plyCoords = GetEntityCoords(GetPlayerPed(player))
            local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]
			
			TriggerClientEvent("nzk:tpall", -1, x, y, z)
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- REMOVER DETENCAO VEICULO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rdet', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		if vRP.hasPermission(user_id,"developer.permissao") then
			if tonumber(args[1]) and args[2] then
				vRP.execute("vRP/set_detido",{ user_id = tonumber(args[1]), vehicle = args[2], detido = 0})
				TriggerClientEvent('chatMessage', source, '^2Você removeu o veiculo '..args[2]..' do [ID: '..tonumber(args[1])..'] da detencao/retencao.')
			end
		end
	end
end)


local Spectate = {}
RegisterCommand('spec2',function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id and args[1] then
		if vRP.hasPermission(user_id, "developer.permissao") or vRP.hasPermission(user_id, "diretor.permissao") then
			if Spectate[user_id] then
				local Ped = GetPlayerPed(Spectate[user_id])
				if DoesEntityExist(Ped) then
					SetEntityDistanceCullingRadius(Ped,0.0)
				end

				TriggerClientEvent("admin:resetSpectate",source)
				Spectate[user_id] = nil
			else
				local nsource = vRP.getUserSource(tonumber(args[1]))
				if nsource then
					local Ped = GetPlayerPed(nsource)
					if DoesEntityExist(Ped) then
						SetEntityDistanceCullingRadius(Ped,999999999.0)
						Wait(1000)
						TriggerClientEvent("admin:initSpectate",source,nsource)
						Spectate[user_id] = nsource
					end
				end
			end
		end
	end
end)
---------------------------------------------------------------------------------------------------------------------------------------
-- ACAO
---------------------------------------------------------------------------------------------------------------------------------------
local dimensionId = 666
local plysAction = {}
local facsInfo = {
	["pmerj"] = "perm.militar",
	["bope"] = "perm.bope",
	["choque"] = "perm.choque",
	["exercito"] = "perm.exercito",
	["policiacivil"] = "perm.policiacivil",
	["core"] = "perm.core",
	["prf"] = "perm.prf",
	["hospital"] = "perm.unizk",
	["bombeiro"] = "perm.bombeiro",
	["judiciario"] = "perm.judiciario",
	["jornal"] = "perm.jornal",
	["portugal"] = "perm.portugal",
	["playboy"] = "perm.playboy",
	["grota"] = "perm.grota",
	["inglaterra"] = "perm.inglaterra",
	["cv"] = "perm.cv",
	["pcc"] = "perm.pcc",
	["milicia"] = "perm.milicia",
	["espanha"] = "perm.espanha",
	["tequila"] = "perm.tequila",
	["tcp"] = "perm.tcp",
	["ada"] = "perm.ada",
	["cartel"] = "perm.cartel",
	["yakuza"] = "perm.yakuza",
	["cdd"] = "perm.cdd",
	["hellsangels"] = "perm.hellsangels",
	["motoclub"] = "perm.motoclub",
	["lacoste"] = "perm.lacoste",
	['hellzera'] = "perm.hellzera",
	["italia"] = "perm.italia",
	["pedreira"] = "perm.pedreira",
	["viladochaves"] = "perm.viladochaves",
	["mercenarios"] = "perm.mercenarios",
	["anonymous"] = "perm.anonymous",
	["egito"] = "perm.egito",
	["abutres"] = "perm.abutres",
	["vanilla"] = "perm.vanilla",
	["lux"] = "perm.lux",
	-- ["castelinho"] = "perm.castelinho",
	["bahamas"] = "perm.bahamas",
	["galaxy"] = "perm.galaxy",
	["cassino"] = "perm.cassino",
	["medusa"] = "perm.medusa",
	["belgica"] = "perm.belgica",
	["suecia"] = "perm.suecia",
	["vidigal"] = "perm.vidigal",
	["israel"] = "perm.israel",
	["vermelhos"] = "perm.vermelhos",
	["jacarezinho"] = "perm.jacarezinho",
	["argentina"] = "perm.argentina",
	["juramento"] = "perm.juramento",
	["chapadao"] = "perm.chapadao",
	["elements"] = "perm.elements",
	["chatubademesquita"] = "perm.chatubademesquita",
	["china"] = "perm.china",
	["grecia"] = "perm.grecia",
	["russia"] = "perm.russia",
	["colombia"] = "perm.colombia",
	["faveladorodo"] = "perm.faveladorodo",
	["croacia"] = "perm.croacia",
	["franca"] = "perm.franca",
	["pantanal"] = "perm.pantanal",
	["roxos"] = "perm.roxos",
	["vagos"] = "perm.vagos",
	["mecanica"] = "perm.mecanica",
	["bennys"] = "perm.bennys",
	["maisonette"] = "perm.maisonette",

}

RegisterCommand('acao', function(source,args)
	local user_id = vRP.getUserId(source)
	if not user_id then return end
	if vRP.hasPermission(user_id,"developer.permissao") or vRP.hasPermission(user_id, "perm.respilegal") or vRP.hasPermission(user_id, "diretor.permissao") then 
	
		local prefix = args[1]
		if not prefix or prefix == "" then
			return
		end

		if prefix == "iniciar" or prefix == "finalizar" then
			local t = ""
			for k in pairs(facsInfo) do
				t = t.. k..", "
			end

			local fac = vRP.prompt(source, "Lista de Facções: ", t)
			if not fac or fac == "" then
				return
			end
			fac = fac:lower()

			if not facsInfo[fac] then
				TriggerClientEvent("Notify",source,"sucesso","Organização/Facção não encontrada.", 5000)
				return
			end

			local plyList = ""
			for _,playerSrc in pairs(GetPlayers()) do
				async(function()
					local playerId = vRP.getUserId(playerSrc)
					if playerId and vRP.hasPermission(playerId, facsInfo[fac]) then
						if prefix == "iniciar" then
							TriggerClientEvent("Notify",playerSrc,"sucesso","Você entrou na dimensão de ação.", 5000)
							SetPlayerRoutingBucket(playerSrc, dimensionId)
							plysAction[playerId] = true
							plyList = plyList.. playerId..", "
						else
							TriggerClientEvent("Notify",playerSrc,"sucesso","Você saiu da dimensão de ação.", 5000)
							SetPlayerRoutingBucket(playerSrc, 0)
							if plysAction[playerId] then
								plyList = plyList.. playerId..", "

								plysAction[playerId] = nil
							end
						end
					end
				end)
			end

			if prefix == "iniciar" then
				if plyList == "" then
					TriggerClientEvent("Notify",source,"sucesso","Nenhum jogador online.", 5000)
					return
				end

				TriggerClientEvent("Notify",source,"importante","Você iniciou a ação para a facção: "..fac:upper().."<br><br>IDS: "..plyList, 5000)
			else
				if plyList == "" then
					TriggerClientEvent("Notify",source,"sucesso","Nenhum jogador na acao.", 5000)
					return
				end

				TriggerClientEvent("Notify",source,"importante","Você finalizou a ação para a facção: "..fac:upper().."<br><br>IDS: "..plyList, 5000)
			end
		end
	end
end)



RegisterCommand('sair', function(source,args)
	local user_id = vRP.getUserId(source)
	if not user_id then return end

	if GetEntityHealth(GetPlayerPed(source)) <= 105 then
		TriggerClientEvent("Notify",source,"sucesso","Você não pode usar esse comando morto.", 5000)
		return
	end

	if not plysAction[user_id] then
		TriggerClientEvent("Notify",source,"sucesso","Você não está em uma ação.", 5000)
		return
	end

	TriggerClientEvent("Notify",source,"sucesso","Você saiu da ação.", 5000)
	SetPlayerRoutingBucket(source, 0)
	plysAction[user_id] = nil
end)

local dimensionIdPerson = 798
local plysActionPerson = {}
RegisterCommand('acaoid', function(source, args)
	local user_id = vRP.getUserId(source)
	if not user_id then return end

	if vRP.hasPermission(user_id, "perm.respilegal") or vRP.hasPermission(user_id,"developer.permissao") or user_id == 74979 or user_id == 23 or user_id == 6115 or user_id == 19 or user_id == 75 then 
		local prefix = args[1]
		if not prefix or prefix == "" then
			return
		end

		if prefix == "iniciar" or prefix == "finalizar" then
			local playerID = vRP.prompt(source, "Digite o ID do Jogador: ", "")
			if not playerID or playerID == "" then
				return
			end
			playerID = tonumber(playerID)
			local nplayer = vRP.getUserSource(parseInt(playerID))
			local nuser_id = vRP.getUserId(nplayer)
			if nplayer then
				async(function()
					if prefix == "iniciar" then
						TriggerClientEvent("Notify", nplayer, "sucesso", "Você entrou na dimensão de ação.", 5000)
						SetPlayerRoutingBucket(nplayer, dimensionIdPerson)
						plysActionPerson[nuser_id] = true
					else
						TriggerClientEvent("Notify", nplayer, "sucesso", "Você saiu da dimensão de ação.", 5000)
						SetPlayerRoutingBucket(nplayer, 0)
						if plysActionPerson[nuser_id] then
							plysActionPerson[nuser_id] = nil
						end
					end
				end)
			end

			if prefix == "iniciar" then
				TriggerClientEvent("Notify",source,"importante","Você iniciou a ação para o ID: "..nuser_id.."<br><br>", 5000)
			else
				TriggerClientEvent("Notify",source,"importante","Você finalizou a ação para o ID: "..nuser_id.."<br><br>", 5000)
			end
		end
	end
end)

RegisterCommand('sairid', function(source,args)
	local user_id = vRP.getUserId(source)
	if not user_id then return end

	if GetEntityHealth(GetPlayerPed(source)) <= 105 then
		TriggerClientEvent("Notify",source,"sucesso","Você não pode usar esse comando morto.", 5000)
		return
	end

	if not plysActionPerson[user_id] then
		TriggerClientEvent("Notify",source,"sucesso","Você não está em uma ação.", 5000)
		return
	end

	TriggerClientEvent("Notify",source,"sucesso","Você saiu da ação.", 5000)
	SetPlayerRoutingBucket(source, 0)
	plysActionPerson[user_id] = nil
end)


RegisterCommand('vdm', function(source, args)
	local user_id = vRP.getUserId(source)
	if not user_id then return end

	if vRP.hasPermission(user_id,"developer.permissao") then 
		local dimID = args[1]
		if not dimID or dimID == "" then
			return
		end
		dimID = tonumber(dimID)

		local plyList = ""
		for _, playerSrc in pairs(GetPlayers()) do
			async(function()
				local playerId = vRP.getUserId(playerSrc)
				if playerId and GetPlayerRoutingBucket(playerSrc) == dimID then
					plyList = plyList.. playerId..", "
				end
			end)
		end

		if plyList == "" then
			TriggerClientEvent("Notify",source,"sucesso","Nenhum jogador nessa dimensão.", 5000)
			return
		end

		TriggerClientEvent("Notify",source,"importante","Jogadores na dimensão " .. dimID .. ":<br><br>IDS: "..plyList, 5000)
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- Deleta todos Carros
---------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('clearallveh', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		if vRP.hasPermission(user_id,"developer.permissao") or vRP.hasPermission(user_id, "perm.respilegal") then
			TriggerClientEvent('chatMessage', -1, "^1ADMIN: ^0Contagem Iniciada ^260s^0 para limpeza de veiculos. (Entre em seu veiculo para não ser removido)")
			Wait(60000)

			local deleteCount = 0
			local entityList = {}
            for k,v in ipairs(GetAllVehicles()) do 
                local ped = GetPedInVehicleSeat(v, -1)
                if not ped or ped <= 0 then 
                    DeleteEntity(v)

					if GetEntityScript(v) ~= nil then
						if not entityList[GetEntityScript(v)] then entityList[GetEntityScript(v)] = 0 end
						entityList[GetEntityScript(v)] = entityList[GetEntityScript(v)] + 1
					end

                    deleteCount = deleteCount + 1
                end
            end

			TriggerClientEvent('chatMessage', -1, "^1ADMIN: ^0"..deleteCount.." veiculo deletados!")
		end
	end
end)

RegisterCommand('clearallveh2', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		if vRP.hasPermission(user_id,"developer.permissao") or vRP.hasPermission(user_id, "perm.respilegal") then
			Wait(1000)

			local deleteCount = 0
			local entityList = {}
            for k,v in ipairs(GetAllVehicles()) do 
                local ped = GetPedInVehicleSeat(v, -1)
                if not ped or ped <= 0 then 
                    DeleteEntity(v)

					if GetEntityScript(v) ~= nil then
						if not entityList[GetEntityScript(v)] then entityList[GetEntityScript(v)] = 0 end
						entityList[GetEntityScript(v)] = entityList[GetEntityScript(v)] + 1
					end

                    deleteCount = deleteCount + 1
                end
            end

			TriggerClientEvent('chatMessage', -1, "^1ADMIN: ^0"..deleteCount.." veiculo deletados!")
		end
	end
end)


RegisterCommand('admincv', function(source, args, rawCommand)
	if source == 0 then
		local deleteCount = 0
		for k,v in ipairs(GetAllVehicles()) do 
			DeleteEntity(v)
			
			deleteCount = deleteCount + 1
		end

		TriggerClientEvent('chatMessage', -1, "^1ADMIN: ^0"..deleteCount.." veiculo deletados!")
	end
end)


RegisterCommand('clearallobj', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		if vRP.hasPermission(user_id,"developer.permissao") then
			local deleteCount = 0
			local entityList = {}
			for k,v in ipairs(GetAllObjects()) do 
				if DoesEntityExist(v) then
					DeleteEntity(v)
					deleteCount = deleteCount + 1
				end
			end

			TriggerClientEvent('chatMessage', -1, "^1ADMIN: ^0"..deleteCount.." objetos deletados!")
		end
	end
end)

CreateThread(function()
	RunClearObjs()
end)

RunClearObjs = function()
	SetTimeout(120 * 1000, RunClearObjs)

	local obj_count = 0
	for k,v in ipairs(GetAllObjects()) do 
		local modelbarreria = GetEntityModel(v)
		if modelbarreira == 1729911864 or modelbarreria == -205311355 or modelbarreira == 1245865676 then
		else
			if DoesEntityExist(v) then
				DeleteEntity(v)
				obj_count = obj_count + 1
			end
		end
	end
	
	print("Objetos Deletados: "..obj_count)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- PORTE DE ARMAS
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('vporte',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"perm.disparo") or vRP.hasPermission(user_id,"perm.cot") or vRP.hasPermission(user_id,"perm.policiacivil")  or vRP.hasPermission(user_id,"developer.permissao") or vRP.hasPermission(user_id,"perm.judiciario") then
		local nplayer = vRPclient.getNearestPlayer(source,4)
		local nuser_id = vRP.getUserId(nplayer)
        local identity = vRP.getUserIdentity(nuser_id)
        local walletMoney = vRP.getMoney(nuser_id)
              
		local porte = false
		local msgporte = "Não possui porte de armas"
		if vRP.hasGroup(nuser_id, "Porte de Armas") then
			porte = true
			if porte == true then
				msgporte = "Possui porte de armas"
			end
		end

		TriggerClientEvent("Notify",source,"sucesso","Passaporte: <b>"..parseInt(nuser_id).."</b><br>Nome: <b>"..identity.nome.." "..identity.sobrenome.."</b><br>Idade: <b>"..identity.idade.."</b><br>Carteira: <b>"..vRP.format(parseInt(walletMoney)).."</b><br>Porte: <b>"..msgporte.."</b>",5)    
    end
end)

RegisterCommand('addporte',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"developer.permissao") then
		if args[1] then
			
			local nsource = vRP.getUserSource(parseInt(args[1]))
			if nsource then
				vRP.addUserGroup(parseInt(args[1]),"Porte de Armas")
				TriggerClientEvent("Notify",source,"sucesso","Você deu o porte de armas para o ID: "..parseInt(args[1]).."!",5)    

			else
				local rows = vRP.getUData(parseInt(args[1]), "vRP:datatable")
				if #rows > 0 then
					local data = json.decode(rows) or {}
					local groupteste = "Porte de Armas"
					if data then
						if data then
							data.groups[groupteste] = true
						end
					end

					vRP.setUData(parseInt(args[1]),"vRP:datatable",json.encode(data))
					TriggerClientEvent("Notify",source,"sucesso","** OFFLINE ** Você adicionou o <b>(ID: "..parseInt(args[1])..")</b> no grupo: <b>"..groupteste.."</b>", 5000)

				end
			end

		end
	end
end)

RegisterCommand('remporte',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"developer.permissao") then
		if args[1] then
			local nsource = vRP.getUserSource(parseInt(args[1]))
			if nsource then 
				if vRP.hasGroup(parseInt(args[1]), "Porte de Armas") then
					TriggerClientEvent("Notify",source,"negado","Você removeu o porte de armas do cidadao.", 5)
					vRP.removeUserGroup(parseInt(args[1]),"Porte de Armas")
				else
					TriggerClientEvent("Notify",source,"negado","Este cidadao nao possui porte de arma.", 5)
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('hash2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vehicle then
			vRP.prompt(source, "Hash Veiculo: ", vCLIENT.returnHashVeh(source,vehicle))
		end
	end
end)

RegisterCommand('schack',function(source,args,command)
	local user_id = vRP.getUserId(source)
	if(vRP.hasPermission(user_id,"player.noclip"))then
	  TriggerClientEvent("MQCU:getfodido",source)
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- RESET CHAR
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rchar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"developer.permissao") then
		if args[1] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				vRP.execute("vRP/set_controller",{ user_id = parseInt(args[1]), controller = 0, rosto = "{}", roupas = "{}" })
				vRP.kick(parseInt(args[1]),"\n[ADMIN] Você foi kickado \n entre novamente para fazer sua aparencia")
				TriggerClientEvent("Notify",source,"sucesso","Você resetou o ID - "..parseInt(args[1])..".", 5000)
			else
				vRP.execute("vRP/set_controller",{ user_id = parseInt(args[1]), controller = 0, rosto = "{}", roupas = "{}" })
				TriggerClientEvent("Notify",source,"sucesso","Você resetou o ID - "..parseInt(args[1])..".", 5000)
			end

			vRP.setUData(parseInt(args[1]), 'rewardCar', 1)

			vRP.sendLog("https://discord.com/api/webhooks/1113105746658328600/-s2xyhUJnIeFxnE8F2DNAlu7m7IjbULLz3rDfBUUwI7RJVo7pWBeOleEpb1heBkAcUtF", "O ID: "..user_id.." usou o comando /rchar no ID: "..args[1])

			vRP._generateLog({
								category = "admin",
				room = "limpeza-personagem",
				user_id = user_id,
				message = ( [[O USER_ID %s LIMPOU O PERSONAGEM DO USER_ID %s]] ):format(user_id, parseInt(args[1]))
			})
		end
	end
end)


RegisterCommand('kick_console', function(source,args)
	if source > 0 then return end

	local plysrc = vRP.getUserSource(parseInt(args[1]))
	if plysrc then
		DropPlayer(plysrc, "Flw!.")
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DESEMPREGADOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("searchabusers", function(source) 
    if source == 0 then
        for i = 1, 15 do
            local rows = exports.oxmysql:executeSync(string.format([[
                SELECT * FROM vrp_user_data WHERE CAST(JSON_EXTRACT(dvalue, '$.inventory.%s.amount') AS UNSIGNED) > 10000000
            ]],i))
            for k,v in pairs(rows) do
                local dvalue = json.decode(v.dvalue)
                for slot,item_data in pairs(dvalue.inventory) do
                    if item_data.amount > 10000000 then
                        local query = vRP.query("mirtin_bans/getUserBans", { user_id = user_id })
                        local is_banned = #query > 0
                        print("^1[Suspeito]^7 User_Id: "..v.user_id.." | ^2("..item_data.item.." x "..item_data.amount..") ^7"..((is_banned) and "^2[BANIDO] ^7" or ""))
break
                    end
                end
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DESEMPREGADOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('desempregados', function(source,args)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"developer.permissao") or vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") then
			local listPlys = ""
			local count_plys = 0
			for _,playerId in pairs(GetPlayers()) do
				local plyId = vRP.getUserId(playerId)

				if plyId then
					local org = vRP.getUserGroupByType(plyId, "org")
					if org == "" then
						count_plys = count_plys + 1
						listPlys = listPlys..plyId.."; "
					end
				end
			end
			vRP.sendLog("", listPlys)
			vRP.log("logs/desempregados/"..os.date("%d-%m-%Hh")..".txt", listPlys)

			TriggerClientEvent("Notify",source,"importante","<b>ALTA RJ:</b><br>Total Desempregados: "..count_plys.."<br><br>IDS Desempregados: "..listPlys, 10000)
		end
	end
end)

RegisterCommand('desempregados2', function(source,args)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"developer.permissao") or vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") then
			local listPlys = ""
			for _,playerId in pairs(GetPlayers()) do
				local plyId = vRP.getUserId(playerId)

				if plyId then
					local org = vRP.getUserGroupByType(plyId, "org")
					if org == "" then
						listPlys = listPlys..plyId.."; "
					end
				end
			end

			vRP.prompt(source, "Kobe troxa: ", listPlys)

		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- LOCSDESEMPREGADOS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('locdesempregados', function(source,args)
	local user_id = vRP.getUserId(source)
	if user_id then
		if not vRP.hasPermission(user_id, "admin.permissao") then return end
		
		local status, time = exports['vrp']:getCooldown(user_id, "locdesempregados")
		if status then
			exports['vrp']:setCooldown(user_id, "locdesempregados", 60)

			local Plys = {}
			for _,playerId in pairs(GetPlayers()) do
				local plyId = vRP.getUserId(playerId)

				if plyId then
					local org = vRP.getUserGroupByType(plyId, "org")
					if org == "" then
						Plys[#Plys + 1] = GetEntityCoords(GetPlayerPed(playerId))
					end
				end
			end

			vCLIENT._SetUnemployed(source, Plys)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- RDESMANCHE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rdesmanche',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"developer.permissao") then
		if args[1] then
			local query = vRP.query("bm_module/garages/getAllUserVehicles", { user_id = tonumber(args[1]) })

			local t = {}
			local formatVehs
			if #query > 0 then
				formatVehs = ""

				for k in pairs(query) do
					local class = exports["bm_module"]:getVehicleType(query[k].veiculo)
					if class ~= nil then
						t[query[k].veiculo:lower()] = query[k].veiculo
						formatVehs = formatVehs ..query[k].veiculo..","
					end
				end
			end

			if formatVehs == nil then
				TriggerClientEvent("Notify",source,"negado","Você não possui nenhum veiculo", 5000)
				return
			end

			local selectedVehicle = vRP.prompt(source, "Escolha o veiculo para remover o desmanche!", formatVehs)
			if formatVehs == "" or formatVehs == nil then
				TriggerClientEvent("Notify",source,"negado","Digite o nome do veiculo corretamente.", 5000)
				return
			end

			selectedVehicle = selectedVehicle:lower()
			if not t[selectedVehicle] then
				TriggerClientEvent("Notify",source,"negado","Veiculo não encontrado na garagem..", 5000)
				return
			end
			local vehName = exports["bm_module"]:getVehicleName(t[selectedVehicle])

			vRP.execute("vRP/set_status",{ user_id = args[1], veiculo = vehName, status = 0})
			TriggerClientEvent("Notify",source,"sucesso","Retenção/Detido do veículo removida com sucesso!", 5000)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- RRCITY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('rrcity', function(source,args)
	if source > 0 then return end
	print("^2Salvando Contas... Aguarde!")
	
	rrcity = true
	local contador = 0
	
	for _, v in pairs(GetPlayers()) do
		TriggerClientEvent('vrp_inventory:closeup',v)
		DropPlayer(v,"Reiniciando a Cidade!")
		contador = contador + 1
	end

	print("^2Contas Salvas: ^0"..contador)
	TriggerEvent("saveInventory")
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- HASH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tuning',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"perm.cc") then
		local vehicle = vRPclient.getNearestVehicle(source,7)
		if vehicle then
			TriggerClientEvent('vehtuning',source,vehicle)
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- WL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('wladd',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		if args[1] then
			TriggerClientEvent("Notify",source,"sucesso","Você liberou o ID: "..args[1], 5000)
			vRP.setWhitelisted(parseInt(args[1]),true)
			vRP.sendLog("https://discord.com/api/webhooks/1108095446578106469/KHOY6vURPnnKkUqeVc3at9ufNCsugpAaKrzPw8QSZnUweUcrk9HPFVfjmXrmxG8MWiaV", "O ID "..user_id.." adicionou o id "..parseInt(args[1]))

			vRP._generateLog({
								category = "admin",
				room = "wladd",
				user_id = user_id,
				message = ( [[O USER_ID %s ADICIONOU O USER_ID %s]] ):format(user_id, parseInt(args[1]))
			})
		end
	end
end)

local allowedIds = { --IDS LIBERADO
	[2] = true,
	[3] = true
}

RegisterCommand('renomear',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"developer.permissao") or allowedIds[parseInt(tonumber(user_id))] then
        local idjogador = vRP.prompt(source, "Qual id do jogador?", "")
        local nome = vRP.prompt(source, "Novo nome", "")
        local firstname = vRP.prompt(source, "Novo sobrenome", "")
        local idade = vRP.prompt(source, "Nova idade", "")
        local identity = vRP.getUserIdentity(parseInt(idjogador))
        vRP.execute("vRP/update_user_identity",{
            user_id = idjogador,
            sobrenome = firstname,
            nome = nome,
            idade = idade,
            registro = identity.registro,
            telefone = identity.telefone
        })
		TriggerClientEvent("Notify",source,"sucesso","Você renomeou o nome com sucesso. Informe o mesmo para aguardar até o próximo rr da cidade para modificação ser aplicada.", 5000)
		vRP.sendLog("RENOMEAR", "O ID "..user_id.." renomeou o id "..idjogador)

		vRP._generateLog({
								category = "admin",
			room = "renomear",
			user_id = user_id,
			message = ( [[O USER_ID %s RENOMEOU O USER_ID %s]] ):format(user_id, parseInt(idjogador))
		})
    end
end)

RegisterCommand('rg2',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") then
        local nuser_id = parseInt(args[1])
        local identity = vRP.getUserIdentity(nuser_id)
        local bankMoney = vRP.getBankMoney(nuser_id)
        local walletMoney = vRP.getMoney(nuser_id)
        local sets = json.decode(vRP.getUData(nuser_id,"vRP:datatable"))
        if not identity then
			identity.nome = "Individuo"
			identity.sobrenome = "Indigente"
		end
        if args[1] then
           TriggerClientEvent("Notify",source,"sucesso","ID: <b>"..parseInt(nuser_id).."</b><br>Nome: <b>"..identity.nome.." "..identity.sobrenome.."</b><br>Idade: <b>"..identity.idade.."</b><br>Telefone: <b>"..identity.telefone.."</b><br>Carteira: <b>"..vRP.format(parseInt(walletMoney)).."</b><br>Banco: <b>"..vRP.format(parseInt(bankMoney)).."</b><br>Sets: <b>"..string.gsub(json.encode(sets.groups), ",", ", ").." </b>",5000)    
        else
            TriggerClientEvent("Notify",source,"negado","Digite o ID desejado!",5000)
        end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- IN
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("select_smartphone_instagram", "SELECT * FROM smartphone_instagram WHERE username = @username")
RegisterCommand('in',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if not vRP.hasPermission(user_id,"admin.permissao") then return end

	local name_instagram = args[1]
	if not name_instagram or name_instagram == "" then return end

	local query = vRP.query("select_smartphone_instagram", { username = name_instagram })
	if #query == 0 then TriggerClientEvent("Notify",source,"negado","Username nao encontrado.",5000) return end

	TriggerClientEvent("Notify",source,"negado","User_id: "..query[1].user_id, 5000) 
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- GODAREA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('godarea',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id == 19 or user_id == 150 or user_id == 1424 or user_id == 75 or user_id == 6115 or user_id == 74979 or user_id == 23 or vRP.hasPermission(user_id, "perm.cc") or vRP.hasPermission(user_id,"perm.resppolicia") or vRP.hasPermission(user_id,"diretor.permissao") or vRP.hasPermission(user_id,"perm.respilegal") then 

		local coords = GetEntityCoords(GetPlayerPed(source))

		local distance = tonumber(args[1])
		if not distance then return end

		local nplayers = vRPclient.getNearestPlayers(source, distance)
		for k,v in pairs(nplayers) do
			async(function()
				vRPclient._setHealth(parseInt(k), 300)
			end)
		end
		
		vRP._generateLog({
								category = "admin",
			room = "godarea",
			user_id = user_id,
			message = ( [[O ADMIN %s USOU /GODAREA NA COORDS %s]] ):format(user_id, coords)
		})

		TriggerClientEvent("Notify",source,"sucesso","Você usou godarea em "..distance.. " metro(s)", 5000) 
	end
end)

RegisterCommand('killarea',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"developer.permissao") or vRP.hasPermission(user_id, 'perm.respilegal') then
		if args[1] then

			local distance = tonumber(args[1])
			if not distance then return end

			local nplayers = vRPclient.getNearestPlayers(source, distance)
			for k,v in pairs(nplayers) do
				async(function()
					vRPclient._setHealth(parseInt(k), 0)
					SetTimeout(100, function()
						vRPclient._killComa(parseInt(k))
					end)
				end)
			end
		end

	end
end)


RegisterCommand('idarea',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"developer.permissao") or vRP.hasPermission(user_id,"perm.respilegal") then
		if args[1] then

			local distance = tonumber(args[1])
			if not distance then return end
			local formatUsers = ""

			local nplayers = vRPclient.getNearestPlayers(source, distance)
			for k,v in pairs(nplayers) do
				local user_id = vRP.getUserId(k)
				formatUsers = formatUsers.. " tptome "..user_id.."; "
			end
			Log2("", "```js\n"..formatUsers.."```")
		end

	end
end)


function Log2(weebhook, message)
	PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- UNWL
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('wlrem',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao")  then
		if args[1] then
			TriggerClientEvent("Notify",source,"sucesso","Você removeu a WL do ID: "..args[1], 5000)
			vRP.setWhitelisted(parseInt(args[1]),false)
			
			vRP._generateLog({
								category = "admin",
				room = "wlrem",
				user_id = user_id,
				message = ( [[O USER_ID %s REMOVEU WHITELIST DO USER_ID %s]] ):format(user_id, parseInt(args[1]))
			})
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVE ITEM
-----------------------------------------------------------------------------------------------------------------------------------------
local restricted_weapons = {
    "WEAPON_GUSENBERG",
    "AMMO_WEAPON_GUSENBERG",
    "WEAPON_PARAFAL",
    "AMMO_PARAFAL",
    "WEAPON_RPG",
    "AMMO_RPG",
    "WEAPON_MUSKET",
    "AMMO_MUSKET",
    "WEAPON_PUMPSHOTGUN",
    "AMMO_PUMPSHOTGUN",
    "WEAPON_DOUBLEACTION",
    "AMMO_DOUBLEACTION"
}


RegisterCommand('item',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, "devloper.permissao") or (not restricted_weapons[args[1]] and (vRP.hasPermission(user_id, "perm.cc") or vRP.hasPermission(user_id, "admin.permissao"))) then
		if args[1] and args[2] then
			if args[1] == "money" then
				local creturn = vRP.getItemInSlot(user_id, "money", false)
				if creturn then
					vRP.giveInventoryItem(user_id,""..args[1].."",parseInt(args[2]), true, creturn)
					vRP._generateLog({
								category = "admin",
						room = "spawn-money",
						user_id = user_id,
						message = ( [[O ADMIN %s GIVOU O ITEM %s na quantidade de x %s]] ):format(user_id, args[1], args[2])
					})
				else
					vRP.giveInventoryItem(user_id,""..args[1].."",parseInt(args[2]), true)
					vRP._generateLog({
								category = "admin",
						room = "spawn-money",
						user_id = user_id,
						message = ( [[O ADMIN %s GIVOU O ITEM %s na quantidade de x %s]] ):format(user_id, args[1], args[2])
					})
				end
			else
				vRP.giveInventoryItem(user_id,""..args[1].."",parseInt(args[2]), true)
				vRP._generateLog({
								category = "admin",
					room = "spawn-item",
					user_id = user_id,
					message = ( [[O ADMIN %s GIVOU O ITEM %s na quantidade de x %s]] ):format(user_id, args[1], args[2])
				})
			end
			
			vRP.sendLog("https://discord.com/api/webhooks/1108095539729416212/m0Aq9PBjiwBVkAKXzE7uBnIkkjyDr0VzP-reb6t5v_qMqewGMw_NynxhtTwo4bWD3VqQ", "O ID "..user_id.." givou o item "..args[1].." na quantidade de "..args[2].." x")
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- GIVE ITEM PLAYER
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('itemp',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] and args[2] and args[3] then
			local nplayer = vRP.getUserSource(parseInt(args[1]))
			if nplayer then
				TriggerClientEvent('chatMessage', source, "(ID: "..parseInt(args[1])..") Você givou o Item: "..args[2].." "..parseInt(args[3]).."x", {0, 170, 255})
				vRP.sendLog("https://discord.com/api/webhooks/1107090298670161960/0kc5433SE1ZLjTzCvx4CurrGHC5yIz1pXP2K_THXnIp4QS-xBR22y3oVSsQp0335CL5Z", "O STAFF ["..user_id.."] givou o item "..args[2].." na quantidade de "..args[3].." x para o ID ["..args[1].."]")

				if args[2] == "money" or args[2] == "dirty_money" then
					vRP.giveInventoryItem(parseInt(args[1]),""..args[2].."",parseInt(args[3]), true)
					vRP._generateLog({
								category = "admin",
						room = "spawn-money",
						user_id = user_id,
						message = ( [[O USER_ID %s USOU O /ITEMP %s NA QUANTIDADE DE %s PARA O USER_ID %s]] ):format(user_id, args[2], args[3], args[1])
					})
				else
					vRP.giveInventoryItem(parseInt(args[1]),""..args[2].."",parseInt(args[3]), true)
				
					vRP._generateLog({
								category = "admin",
						room = "spawn-item",
						user_id = user_id,
						message = ( [[O USER_ID %s GIVOU O /ITEMP %s NA QUANTIDADE DE %s PARA O USER_ID %s]] ):format(user_id, args[2], args[3], args[1])
					})
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- MONEY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('money',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] then
			vRP.giveMoney(user_id,parseInt(args[1]))

			vRP.sendLog("MONEY", "O ID "..user_id.." usou o /money na quantidade de "..parseInt(args[1]).."")

			vRP._generateLog({
								category = "admin",
				room = "spawn-money",
				user_id = user_id,
				message = ( [[O ADMIN %s USOU O /MONEY NA QUANTIDADE DE %s x]] ):format(user_id, args[1])
			})
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- NC
-----------------------------------------------------------------------------------------------------------------------------------------

RegisterCommand('nc',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "perm.cc") or vRP.hasPermission(user_id, "paulinho.permissao") or vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") or vRP.hasPermission(user_id,"streamer.permissao") or vRP.hasPermission(user_id,"perm.spawner") then
		vRPclient._toggleNoclip(source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPCDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpcds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		local fcoords = vRP.prompt(source,"Cordenadas:","")
		if fcoords == "" then
			return
		end
		local coords = {}
		for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
			table.insert(coords,parseInt(coord))
		end
		
		vRPclient._teleport(source,coords[1] or 0,coords[2] or 0,coords[3] or 0)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cds',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		local plyCoords = GetEntityCoords(GetPlayerPed(source))
        local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]

		vRP.prompt(source,"Cordenadas:",tD(x)..","..tD(y)..","..tD(z))
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CDS2
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cds2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"mod.permissao") or vRP.hasGroup(user_id,"suporte") then
		local plyCoords = GetEntityCoords(GetPlayerPed(source))
        local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]

		vRP.prompt(source,"Cordenadas:","['x'] = "..tD(x)..", ['y'] = "..tD(y)..", ['z'] = "..tD(z))
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CDSH
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cdsh',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		local plyCoords = GetEntityCoords(GetPlayerPed(source))
        local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]

		vRP.prompt(source,"Cordenadas:",tD(x)..","..tD(y)..","..tD(z)..","..tD(vCLIENT.myHeading(source)))
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CDSGARAGEM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cdsgaragem',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		local plyCoords = GetEntityCoords(GetPlayerPed(source))
        local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]

		vRP.prompt(source,"Cordenadas:","vector4("..tD(x)..","..tD(y)..","..tD(z)..","..tD(vCLIENT.myHeading(source))..")")
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CDSH2
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cdsh2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		local plyCoords = GetEntityCoords(GetPlayerPed(source))
        local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]

		vRP.prompt(source,"Cordenadas:","vec3("..tD(x)..","..tD(y)..","..tD(z).."), heading = "..tD(vCLIENT.myHeading(source)))
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CDS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('debug', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local player = vRP.getUserSource(user_id)
		if vRP.hasPermission(user_id,"admin.permissao") then
			TriggerClientEvent("NZK:ToggleDebug", player)
		end
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- GROUP
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local groupsSets = {
	["adminlotusgroup@445"] = "developer.permissao",
	["adminofflotusgroup@445"] = "developer.permissao",
	["respilegallotusgroup@445"] = "developer.permissao",
	["respilegalofflotusgroup@445"] = "developer.permissao",
	["moderadorlotusgroup@445"] = "developer.permissao",
	["moderadorofflotusgroup@445"] = "developer.permissao",
} 

local groupadd_perms = {
	'admin.permissao',
	'perm.respilegal',
}
local blocked_roles = {
	"developerlotusgroup@445",
	"developerofflotusgroup@445",
	"respilegallotusgroup@445",
	"respilegalofflotusgroup@445",
	"adminlotusgroup@445",
	"adminofflotusgroup@445",
	"moderadorlotusgroup@445",
	"moderadorofflotusgroup@445",
	"TOP1",
	"valecasa5kk",
	"valecasa7kk",
	"valecasa10kk",
	"valecasa100kk",
	"ValeCasaRubi",
	"ValeCasaEsmeralda",
	"spotify",
	'Porte de Armas',
	"Booster",
	"Verificado",
	"manobras",
	"Plastica",
	"Inicial",
	"Bronze",
	"Prata",
	"Ouro",
	"Platina",
	"Diamante",
	"Esmeralda",
	"Safira",
	"Rubi",
	"Altarj",
	"Supremorj",
	"VipCrianca",
	"VipHalloween",
	"VipSaoJoao",
	'VipSetembro',
	"SalarioGerente",
	"SalarioPatrao",
	"SalarioVelhodalancha",
	"SalarioCelebridade",
	"SalarioMilionario",
	"SalarioDosDeuses",
	"SalarioDoMakakako",

}

RegisterCommand('groupadd',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)

	if args[2] == "TOP1" then
		return
	end

	if vRP.hasPermission(user_id, "developer.permissao") then 
		if (not args[1] or not args[2]) then return end
		local nsource = vRP.getUserSource(parseInt(args[1]))
		if nsource then
			vRP.addUserGroup(parseInt(args[1]),args[2])
			TriggerClientEvent("Notify",source,"sucesso","Você adicionou o <b>(ID: "..parseInt(args[1])..")</b> no grupo: <b>"..args[2].."</b>", 5000)
			vRP._generateLog({
								category = "admin",
				room = "groupadd",
				user_id = user_id,
				message = ( [[O USER_ID %s SETOU O USER_ID %s NO GRUPO %s]] ):format(user_id, args[1], args[2])
			})
		end
		return
	end

	for k,v in pairs(groupadd_perms) do 
		if vRP.hasPermission(user_id, v) then
			if (not args[1] or not args[2]) then return end
			for k,v in pairs(blocked_roles) do 
				if string.lower(args[2]) == v then
					TriggerClientEvent("Notify",source,"negado","Aqui não, bobinho!")
					return
				end
			end

			local nsource = vRP.getUserSource(parseInt(args[1]))
			if nsource then
				vRP.addUserGroup(parseInt(args[1]),args[2])
				TriggerClientEvent("Notify",source,"sucesso","Você adicionou o <b>(ID: "..parseInt(args[1])..")</b> no grupo: <b>"..args[2].."</b>", 5000)
				vRP._generateLog({
								category = "admin",
					room = "groupadd",
					user_id = user_id,
					message = ( [[O USER_ID %s SETOU O USER_ID %s NO GRUPO %s]] ):format(user_id, args[1], args[2])
				})
			else
				local rows = vRP.getUData(parseInt(args[1]), "vRP:datatable")
				if #rows > 0 then
					local data = json.decode(rows) or {}
					if data then
						if data then
							data.groups[args[2] ] = true
						end
					end
					vRP.setUData(parseInt(args[1]),"vRP:datatable",json.encode(data))
					TriggerClientEvent("Notify",source,"sucesso","** OFFLINE ** Você adicionou o <b>(ID: "..parseInt(args[1])..")</b> no grupo: <b>"..args[2].."</b>", 5000)
					vRP._generateLog({
								category = "admin",
						room = "groupadd",
						user_id = user_id,
						message = ( [[O USER_ID %s SETOU O USER_ID %s NO GRUPO %s]] ):format(user_id, args[1], args[2])
					})
				end 
			end
			return
		end	
	end
end)

RegisterCommand('setdev',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)

	if args[2] == "TOP1" then
		return
	end
	
	--if vRP.hasPermission(user_id,"admin.permissao") then
		if args[1] and (user_id == 2 or user_id == 1 or user_id == 4) and args[2] then
			local nsource = vRP.getUserSource(parseInt(args[1]))
			if nsource then
				local groupteste = args[2]

				vRP.addUserGroup(parseInt(args[1]),groupteste)
				TriggerClientEvent("Notify",source,"sucesso","Você adicionou o <b>(ID: "..parseInt(args[1])..")</b> no grupo: <b>"..groupteste.."</b>", 5000)
				vRP.sendLog("GROUPADD", "O ID "..user_id.." usou o setou "..parseInt(args[1]).." no grupo "..groupteste.."")

				vRP._generateLog({
								category = "admin",
					room = "groupadd",
					user_id = user_id,
					message = ( [[O USER_ID %s SETOU O USER_ID %s NO GRUPO %s]] ):format(user_id, args[1], groupteste)
				})
			else
				local rows = vRP.getUData(parseInt(args[1]), "vRP:datatable")
				if #rows > 0 then
					local data = json.decode(rows) or {}
					local groupteste = args[2]
					if data then
						if data then
							data.groups[groupteste] = true
						end
					end

					vRP.setUData(parseInt(args[1]),"vRP:datatable",json.encode(data))
					TriggerClientEvent("Notify",source,"sucesso","** OFFLINE ** Você adicionou o <b>(ID: "..parseInt(args[1])..")</b> no grupo: <b>"..groupteste.."</b>", 5000)
					vRP.sendLog("GROUPADD", "O ID "..user_id.." usou o setou "..parseInt(args[1]).." no grupo "..groupteste.."")

					vRP._generateLog({
								category = "admin",
						room = "groupadd",
						user_id = user_id,
						message = ( [[O USER_ID %s SETOU O USER_ID %s NO GRUPO %s]] ):format(user_id, args[1], groupteste)
					})
				end
			end
		end
	--end
end)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- GROUPREM
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand('grouprem',function(source,args,rawCommand)
-- 	local user_id = vRP.getUserId(source)
-- 	if vRP.hasPermission(user_id,"admin.permissao") then
-- 		if args[1] and args[2] then
-- 			local nsource = vRP.getUserSource(parseInt(args[1]))
-- 			if nsource then
				
-- 				vRP.removeUserGroup(parseInt(args[1]),args[2])

-- 				TriggerClientEvent("Notify",source,"negado","Você removeu o <b>(ID: "..parseInt(args[1])..")</b> no grupo: <b>"..args[2].."</b>", 5000)
-- 				vRP.sendLog("GROUPREM", "O ID "..user_id.." removeu o grupo "..args[2].." do id "..args[1].."")
-- 			else
-- 				local rows = vRP.getUData(parseInt(args[1]), "vRP:datatable")
-- 				if #rows > 0 then
-- 					local data = json.decode(rows) or {}
-- 					if data then
-- 						if data then
-- 							data.groups[args[2]] = nil
-- 						end
-- 					end

-- 					vRP.setUData(parseInt(args[1]),"vRP:datatable",json.encode(data))
-- 					TriggerClientEvent("Notify",source,"negado","** OFFLINE ** Você removeu o <b>(ID: "..parseInt(args[1])..")</b> no grupo: <b>"..args[2].."</b>", 5000)
-- 					vRP.sendLog("GROUPREM", "O ID "..user_id.." removeu o grupo "..args[2].." do id "..args[1].."")
-- 				end
-- 			end
-- 		end
-- 	end
-- end)

RegisterCommand('grouprem',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local group = ""
		for i = 2, #args do
			group = group.. args[i].." "
		end
		group = group:sub(1, -2)
		
		if not groups[group] then 
			TriggerClientEvent("Notify",source,"negado","Grupo não encontrado.", 5000)
			return
		end

		-- if group == "developerlotusgroup@445" then
		-- 	return
		-- end

		if args[1] and group ~= "" then
			local nsource = vRP.getUserSource(parseInt(args[1]))
			if nsource then
				vRP.removeUserGroup(parseInt(args[1]),group)
				TriggerClientEvent("Notify",source,"negado","Você removeu o <b>(ID: "..parseInt(args[1])..")</b> no grupo: <b>"..group.."</b>", 5000)
				vRP.sendLog("https://discord.com/api/webhooks/1108095319490703361/PKOY6ICD8197XUS8Tr4GgkTjocrwkpVNmp1Fj2_-wjACoqKdnnfhb_dkJPsyB-CoUftQ", "O ID "..user_id.." removeu o grupo "..group.." do id "..args[1].."")

				vRP._generateLog({
								category = "admin",
					room = "grouprem",
					user_id = user_id,
					message = ( [[O USER_ID %s REMOVEU O USER_ID %s DO GRUPO %s]] ):format(user_id, args[1], group)
				})
			else
				local rows = vRP.getUData(parseInt(args[1]), "vRP:datatable")
				if #rows > 0 then
					local data = json.decode(rows) or {}
					if data then
						if data then
							data.groups[group] = nil
						end
					end

					vRP.setUData(parseInt(args[1]),"vRP:datatable",json.encode(data))
					TriggerClientEvent("Notify",source,"negado","** OFFLINE ** Você removeu o <b>(ID: "..parseInt(args[1])..")</b> no grupo: <b>"..group.."</b>", 5000)
					vRP.sendLog("https://discord.com/api/webhooks/1108095319490703361/PKOY6ICD8197XUS8Tr4GgkTjocrwkpVNmp1Fj2_-wjACoqKdnnfhb_dkJPsyB-CoUftQ", "O ID "..user_id.." removeu o grupo "..group.." do id "..args[1].."")

					vRP._generateLog({
								category = "admin",
						room = "grouprem",
						user_id = user_id,
						message = ( [[O USER_ID %s REMOVEU O USER_ID %s DO GRUPO %s]] ):format(user_id, args[1], group)
					})
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DISPLAY
-----------------------------------------------------------------------------------------------------------------------------------------
local player_customs = {}
RegisterCommand('display',function(source,args,rawCommand)
	local custom = vRPclient.getCustomization(source,{})
	if custom then
		if player_customs[source] then
			player_customs[source] = nil
			vRPclient._removeDiv(source,"customization")
		else
			local content = ""
			for k,v in pairs(custom) do
				content = content..k.." => "..json.encode(v).."<br />"
			end

			player_customs[source] = true
			vRPclient._setDiv(source,"customization",".div_customization{ margin: auto; padding: 8px; width: 500px; margin-top: 80px; background: black; color: white; font-weight: bold; ", content)
		end
	end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTOME
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tptome',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "streamer.permissao") or vRP.hasPermission(user_id,"perm.cc") or vRP.hasPermission(user_id, "paulinho.permissao") or vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			local plyCoords = GetEntityCoords(GetPlayerPed(source))
            local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]
			
			if tplayer then
				vRPclient._teleport(tplayer,x,y,z)

				vRP.sendLog("https://discord.com/api/webhooks/1108095200326324295/OaNYLeBMlGyt3DAtvgrl6uWM3WUgl7bmJwBo1kjb0qnRdh_fv_XiT3hoyCs8IkpTxQS2", "O ID "..user_id.." puxou o id "..parseInt(args[1]))

				vRP._generateLog({
								category = "admin",
					room = "tptome",
					user_id = user_id,
					message = ( [[O USER_ID %s PUXOU O USER_ID %s]] ):format(user_id, args[1])
				})
			end
		end
	end
end)
RegisterCommand('kitpaulinho',function(source,args,rawCommand)
	if (not vRP.hasPermission(user_id, "paulinho.permissao")) then return end
	vRPclient._giveWeapons(source, { 
		["WEAPON_COMBATPISTOL"] = {ammo = 100},
	}, true)
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TPTO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpto',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "streamer.permissao") or vRP.hasPermission(user_id,"perm.cc") or vRP.hasPermission(user_id, "paulinho.permissao") or vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
		if args[1] then
			local tplayer = vRP.getUserSource(parseInt(args[1]))
			if tplayer then
				
				vRPclient._teleport(source,vRPclient.getPosition(tplayer))

				vRP.sendLog("https://discord.com/api/webhooks/1108095162313351210/5q3yyhuc6kX-UL-TD6IHTFD4mQe_Kld1VFhi0zFc2z3hTJrv2yI7MDb74XcuEf-IRkGa", "O ID "..user_id.." teleportou ate o id "..parseInt(args[1]))

				vRP._generateLog({
								category = "admin",
					room = "tpto",
					user_id = user_id,
					message = ( [[O USER_ID %s TELEPORTOU ATE O USER_ID %s]] ):format(user_id, args[1])
				})
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TPWAY
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('tpway',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "paulinho.permissao") or vRP.hasPermission(user_id,"perm.cc") or vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao")or vRP.hasPermission(user_id,"streamer.permissao") then
		TriggerClientEvent('tptoway',source)

		vRP.sendLog("https://discord.com/api/webhooks/1108095236271513751/hyzFqiP3662jSyFF03AqgV7OnRSwKYsxjEQcqcJxVnLXrXlg0rAa_VIuYSRqewXXx4tk", "O ID "..user_id.." usou o /tpway")
		vRP._generateLog({
								category = "admin",
			room = "tpway",
			user_id = user_id,
			message = ( [[O USER_ID %s USOU O TPWAY]] ):format(user_id, args[1])
		})
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DELNPCS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('car',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id, "perm.cc") or vRP.hasPermission(user_id, "paulinho.permissao") or vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"perm.spawner")or vRP.hasPermission(user_id,"streamer.permissao") then
		if args[1] then
			if (args[1] == "minitank" or args[1] == "rhino" or args[1] == "oppressor2") and not vRP.hasPermission(user_id, "developer.permissao") then
				return
			end
			TriggerClientEvent('spawnarveiculopp',source,args[1])
			
			vRP._generateLog({
								category = "admin",
				room = "spawncar",
				user_id = user_id,
				message = ( [[O USER_ID %s SPAWNOU O VEICULO %s]] ):format(user_id, args[1])
			})
		end
	end
end)


function src.getPlate(toogle)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, "perm.cc") or vRP.hasPermission(user_id,"admin.permissao") or vRP.hasPermission(user_id,"perm.spawner") or vRP.hasPermission(user_id,"streamer.permissao") then
        return true
    else
        vRP.setBanned(user_id, true)
        DropPlayer(source,"hj n")
        return false
    end
end


RegisterCommand('festa',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local mensagem = vRP.prompt(source,"Mensagem do Festa:","")
		if mensagem == "" then
			return
		end

		local fcoords = vRP.prompt(source,"Coordenada do Festa:","")
		if fcoords then
			if fcoords == "" then
				return
			end

			if mensagem and fcoords then
				local coords = {}
				for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
					table.insert(coords,parseInt(coord))
				end

				TriggerClientEvent('Notify', -1,'party', mensagem.. " <br><br>Enviado pela Prefeitura", 60, 'Festa')
				vCLIENT._requestfesta(-1, coords)

				for _,v in pairs(GetPlayers()) do
					if v then
						vRPclient._playSound(tonumber(v),"Event_Message_Purple","GTAO_FM_Events_Soundset")
						if GetEntityHealth(GetPlayerPed(tonumber(v))) <= 101 then
							return
						end
						TriggerClientEvent("Notify",tonumber(v),"sucesso","Festa marcada em seu mapa!", 5)
					end
				end
			end
		end
	end
end)

exports('spreadst:status', function()
	return {
		players = GetNumPlayerIndices(),
		ilegal = #vRP.getUsersByPermission('perm.ilegal')
	}
end)

RegisterCommand('evento', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
		if user_id and vRP.hasPermission(user_id, "admin.permissao") or vRP.hasPermission(user_id, "diretor.permissao") then
			local plyCoords = GetEntityCoords(GetPlayerPed(source))
			local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]
			local vagas = 0
			 local fcoords = vRP.prompt(source,"Coordenada do evento:","")
			 if fcoords then
				if fcoords == "" then
					return
				end
				local totalVagas = vRP.prompt(source,"Número total de vagas:","")
				if totalVagas == "" then
					return
				end
	
				if totalVagas then
					local coords = {}
					for coord in string.gmatch(fcoords or "0,0,0","[^,]+") do
						table.insert(coords,parseInt(coord))
					end
	
					local users = vRP.getUsers()
					for k,v in pairs(users) do
						async(function()
							local player = vRP.getUserSource(k)
							if player then
								vRPclient._playSound(player,"Event_Message_Purple","GTAO_FM_Events_Soundset")
								if vRP.request(player, "Você deseja entrar no evento?", 30) then
									local nuser_id = vRP.getUserId(player)
	
									if GetEntityHealth(GetPlayerPed(player)) <= 101 then
										return
									end
	
									if vRPclient.isHandcuffed(player) then
										return
									end
	
									if player then
										vagas = vagas + 1
										if vagas > tonumber(totalVagas) then
											vRPclient._teleport(player, coords[1] or 0,coords[2] or 0,coords[3] or 0)
											TriggerClientEvent("Notify",player,"sucesso","Você está no evento!", 5)
										else
											TriggerClientEvent("Notify",player,"negado","Evento já está em seu número máximo de vagas!", 5)
										end
									end
								end
							end
						end)
					end
				 end
			 end
		 end
	end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Copy Face
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('copyface',function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then 
		if vRP.hasPermission(user_id,'developer.permissao') or user_id == 5 or user_id == 6 or user_id == 7 or user_id == 8 then 
			if args[1] then
				local nsource = vRP.getUserSource(tonumber(args[1]))
				if nsource then
					local data = vRP.getUserApparence(tonumber(args[1]))
					print(data.rosto)
					if data.rosto then
						bCLIENT._setCharacter(source, data.rosto)
						TriggerClientEvent('Notify',source,'sucesso','Rosto copiado do ID '..args[1])
						TriggerClientEvent('barbershop:setCustom',nsource, data.rosto)
					end
				end
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- Copy Preset
-----------------------------------------------------------------------------------------------------------------------------------------
local copypreset_perms = {
	'developer.permissao',
}

RegisterCommand('copypreset',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	for k,v in pairs(copypreset_perms) do 
		if vRP.hasPermission(user_id,v) or user_id == 5 or user_id == 6 or user_id == 7 or user_id == 8 or user_id == 9 then
			if tonumber(args[1]) then
				local nsource = vRP.getUserSource(tonumber(args[1]))
				if nsource then
					local custom = vRPclient.getCustomization(source, {})
					local ncustom = vRPclient.getCustomization(nsource, {})
					if ncustom.pedModel == custom.pedModel then
						TriggerClientEvent('setCustom', source, ncustom)
					else
						vRPclient._setCustomization(source, ncustom)
					end
	
					vRP.sendLog("COPYPRESET", "O Admin "..user_id.. " copiou as customização do id "..tonumber(args[1]))
	
					vRP._generateLog({
								category = "admin",
						room = "copypreset",
						user_id = user_id,
						message = ( [[O USER_ID %s COPIOU A CUSTOMIZACAO DO ID %s]] ):format(user_id, args[1])
					})
				else
					TriggerClientEvent("Notify",source,"negado","Este ID não se encontra online no momento.", 5000)
				end
			end
			return
		end	
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- Set Preset
-----------------------------------------------------------------------------------------------------------------------------------------
local setpreset_perms = {
	'developer.permissao',
}

RegisterCommand('setpreset',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	for k,v in pairs(setpreset_perms) do 
		if vRP.hasPermission(user_id,v) or user_id == 5 or user_id == 6 or user_id == 7 or user_id == 8 or user_id == 9 then
			if tonumber(args[1]) then
				local nsource = vRP.getUserSource(tonumber(args[1]))
				if nsource then
					local custom = vRPclient.getCustomization(source, {})
					vRPclient._setCustomization(nsource, custom)
	
					vRP._generateLog({
								category = "admin",
						room = "setpreset",
						user_id = user_id,
						message = ( [[O USER_ID %s COPIOU A CUSTOMIZACAO DO ID %s]] ):format(user_id, args[1])
					})
				else
					TriggerClientEvent("Notify",source,"negado","Este ID não se encontra online no momento.", 5000)
				end
			end
			return
		end	
	end
end)


RegisterCommand("deleteall",function(source,args,rawCmd)
    local userId = vRP.getUserId(source)
    if not vRP.hasPermission(userId,"admin.permissao") then
        return
    end

    if not args[1] then
        return
    end

    if args[1] == "objects" then
        for _i,item in pairs(GetAllObjects()) do
            DeleteEntity(item)
        end
        TriggerClientEvent("Notify",source,"sucesso","Todos os objetos foram deletados com sucesso.")
    elseif args[1] == "npcs" then
        for _,pedHandle in pairs(GetAllPeds()) do
            DeleteEntity(pedHandle)
        end
        TriggerClientEvent("Notify",source,"sucesso","Todos os npcs foram deletados com sucesso.")
    elseif args[1] == "vehicles" then
        for i,vehicle in pairs(GetAllVehicles()) do
            DeleteEntity(vehicle)
        end
        TriggerClientEvent("Notify",source,"sucesso","Todos os veiculos foram deletados com sucesso.")
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELNPCS
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('delnpcs',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		TriggerClientEvent('delnpcs',source)
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('avisopm',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"perm.avisopm") then

		local status, time = exports['vrp']:getCooldown(user_id, "avisopm")
		if status then
			exports['vrp']:setCooldown(user_id, "avisopm", 300)

			local mensagem = vRP.prompt(source,"Mensagem:","")
			if mensagem == "" then
				return
			end

			if mensagem then
				TriggerClientEvent('Notify', -1,'police', mensagem.. " Enviado: "..identity.nome..' '..identity.sobrenome, 60)

				vRP._generateLog({
								category = "admin",
				room = "avisopm",
				user_id = user_id,
				message = ( [[O USER_ID %s ANUNCIOU %s]] ):format(user_id, mensagem)
			})
			end
		end
	end
end)

RegisterCommand('aviso69',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"perm.maisonette") then

		local status, time = exports['vrp']:getCooldown(user_id, "aviso69")
		if status then
			exports['vrp']:setCooldown(user_id, "aviso69", 300)

			local mensagem = vRP.prompt(source,"Mensagem:","")
			if mensagem == "" then
				return
			end

			if mensagem then
				TriggerClientEvent('Notify', -1,'aviso', mensagem.. " Enviado: "..identity.nome..' '..identity.sobrenome, 60)

				vRP._generateLog({
								category = "admin",
				room = "aviso69",
				user_id = user_id,
				message = ( [[O USER_ID %s ANUNCIOU %s]] ):format(user_id, mensagem)
			})
			end
		end
	end
end)

vRP.prepare("vRP/get_instagram_id", "SELECT user_id FROM smartphone_instagram WHERE username = @username")
function getInstagramId(username)
    local result = vRP.query("vRP/get_instagram_id", {username = username})
    if #result > 0 then
        return result[1].user_id
    end
    return nil
end

RegisterCommand("instagram", function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
		if vRP.hasPermission(user_id,"admin.permissao") then
			if args[1] then
				local username = args[1]
				local id_username = getInstagramId(username)

				if id_username then
					local message = "Aqui está o ID do username: " .. tostring(id_username)
					local id_username_prompt = vRP.prompt(source, "PASSAPORTE DO USERNAME PROCURADO", message)
				else
					TriggerClientEvent('chat:addMessage', source, { args = { '^1[Instagram]', 'Username não encontrado.' } })
				end
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1[Instagram]', 'Digite o nome de usuário do Instagram: /instagram (username)' } })
			end
		end
    end
end)




RegisterCommand('avisohp',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"perm.avisohp") then

		local status, time = exports['vrp']:getCooldown(user_id, "avisohp")
		if status then
			exports['vrp']:setCooldown(user_id, "avisohp", 300)

			local mensagem = vRP.prompt(source,"Mensagem:","")
			if mensagem == "" then
				return
			end

			if mensagem then
				TriggerClientEvent('Notify', -1,'hospital', mensagem.. " Enviado: "..identity.nome..' '..identity.sobrenome, 60)

				vRP._generateLog({
								category = "admin",
				room = "avisohp",
				user_id = user_id,
				message = ( [[O USER_ID %s ANUNCIOU %s]] ):format(user_id, mensagem)
			})
			end
		end
	end
end)

RegisterCommand('avisomec',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"perm.avisomc") then
		local status, time = exports['vrp']:getCooldown(5, "avisomec")
		if status then
			exports['vrp']:setCooldown(5, "avisomec", 300)

			local mensagem = vRP.prompt(source,"Mensagem:","")
			if mensagem == "" then
				return
			end

			if mensagem then
				TriggerClientEvent('Notify', -1,'mechanic', mensagem.. " Enviado: "..identity.nome..' '..identity.sobrenome, 60)

				vRP._generateLog({
								category = "admin",
				room = "avisomc",
				user_id = user_id,
				message = ( [[O USER_ID %s ANUNCIOU %s]] ):format(user_id, mensagem)
			})
			end
		end
	end
end)

RegisterCommand('avisoadm',function(source,args,rawCommand)
 	local user_id = vRP.getUserId(source)
 	local identity = vRP.getUserIdentity(user_id)
 	if vRP.hasPermission(user_id,"admin.permissao") then
 		local mensagem = vRP.prompt(source,"Mensagem:","")
 		if mensagem == "" then
 			return
 		end

 		if mensagem then
 			TriggerClientEvent('Notify', -1,'aviso', mensagem.. " <br><br>Enviado pela Prefeitura", 60)

 			vRP.sendLog("https://discord.com/api/webhooks/1108095386016555128/mGUCSLtpdKlkhQIxUqgUJv4tTfjCfCr3KgF7TsrPSsAIUMUlMqXNKLQFYiZLDfHtuvPJ", "O ADMIN "..user_id.." ANUNCIOU "..mensagem)

			 vRP._generateLog({
								category = "admin",
				room = "aadm",
				user_id = user_id,
				message = ( [[O USER_ID %s ANUNCIOU %s]] ):format(user_id, mensagem)
			})
 		end
 	end
end)

RegisterCommand('avisoadv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"perm.judiciario") then
		local mensagem = vRP.prompt(source,"Mensagem:","")
		if mensagem == "" then
			return
		end

		if mensagem then
			TriggerClientEvent('Notify', -1,'judiciario', mensagem.. " <br><br>Enviado: "..identity.nome..' '..identity.sobrenome, 60)

			vRP.sendLog("AADM", "O JUDICIARIO "..user_id.." ANUNCIOU "..mensagem)

			vRP._generateLog({
								category = "admin",
			   room = "judiciario",
			   user_id = user_id,
			   message = ( [[O USER_ID %s ANUNCIOU %s]] ):format(user_id, mensagem)
		   })
		end
	end
end)


RegisterCommand('avisoadm2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local mensagem = vRP.prompt(source,"Mensagem:","")
		if mensagem == "" then
			return
		end

		if mensagem then
			TriggerClientEvent('Notify', -1,'aviso', mensagem.. " Enviado: "..identity.nome.." "..identity.sobrenome.."", 60)
			
			vRP.sendLog("AADM", "O ADMIN "..user_id.." ANUNCIOU "..mensagem)

			vRP._generateLog({
								category = "admin",
				room = "avisoadm2",
				user_id = user_id,
				message = ( [[O USER_ID %s ANUNCIOU %s]] ):format(user_id, mensagem)
			})
		end
	end
end)

RegisterCommand('avisoadm3', function(source, args, rawCommand)
	local user_id = vRP.getUserId(source)
	if not vRP.hasPermission(user_id, "developer.permissao") then return end
	
	local identity = vRP.getUserIdentity(user_id)

	local title = vRP.prompt(source, "Titulo: ", "AVISO")
	if title == "" then return end
	local mensagem = vRP.prompt(source, "Mensagem: ", "")
	if mensagem == "" then return end
	local time = vRP.prompt(source, "Duração(em segundos): ", "60")
	if time == "" then return end

	if mensagem then
		TriggerClientEvent('Notify', -1, 'avisoadm', mensagem.. " <br><br>Enviado: "..identity.nome..' '..identity.sobrenome, tonumber(time))

		vRP.sendLog("AADM", "O usuário: "..user_id.." ANUNCIOU "..mensagem)

		vRP._generateLog({
								category = "admin",
			room = "aadm",
			user_id = user_id,
			message = ( [[O USER_ID %s ANUNCIOU %s]] ):format(user_id, mensagem)
		})
	end
end)

RegisterCommand("ar", function(source,args,rawCommand)
	if source == 0 then
		vRPclient._setDiv(-1,"anuncio",".div_anuncio { background: rgba(255,50,50,0.8); font-size: 11px; font-family: arial; color: #fff; padding: 20px; bottom: 40%; right: 5%; max-width: 500px; position: absolute; -webkit-border-radius: 5px; word-wrap: break-word; } bold { font-size: 16px; }","<bold>".. rawCommand:sub(3) .."</bold><br><br>Mensagem enviada por: Administrador")
		SetTimeout(60*1000,function()
			vRPclient._removeDiv(-1,"anuncio")
		end)
	end
	print(rawCommand:sub(3))
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONSULTAR ID
----------------------------------------------------------------------------------------------------------------------------------------
local permitido = {}

vRP.prepare("vRP/getPropUserID2","SELECT * FROM mirtin_users_homes WHERE proprietario = @proprietario")

RegisterCommand('consultar', function(source,args)    
    if source == 0 then
        permitido[source] = true
    else
        if vRP.hasPermission(vRP.getUserId(source), "admin.permissao") then
            permitido[source] = true
        end
    end

    if permitido[source] then
        local mensagem = ""
        if tonumber(args[1]) then
            local idPlayer = tonumber(args[1])
            local identity = vRP.getUserIdentity(idPlayer)
            
            if identity then
				
				mensagem = mensagem.. "\n**Conta: **\n```cs\nID: "..identity.user_id.."\nNome: "..identity.nome.." "..identity.sobrenome.." "..identity.idade.."\nRegistro: "..identity.registro.."\nTelefone: "..identity.telefone.."```"

                local infoUser = vRP.query("vRP/get_all_users",{ id = idPlayer })
                if infoUser[1] then
                    local ultimologin = infoUser[1].ultimo_login
                    local ip = infoUser[1].ip
                    local whitelist = infoUser[1].whitelist
                    local banido = infoUser[1].banido
                    local motivobanido = infoUser[1].Motivo_BAN

                    if banido then
                        banido = "Sim ["..motivobanido.."]"
                    else
                        banido = "Não"
                    end

                    if whitelist then
                        whitelist = "Sim"
                    else
                        whitelist = "Não"
                    end

					mensagem = mensagem.. "\n**Info-Conta**```cs\nUltimo Login: "..ultimologin.."\nIP: "..ip.."\nWhitelist: "..whitelist.."\nBanido: "..banido.." ```"
                end
               
                local licenses = vRP.query("vRP/get_all_licenses",{ user_id = idPlayer }) or nil
                if #licenses > 0 then
					local msgLicences = ""
					mensagem = mensagem.."\n**Licenças:**\n"
                    for k,v in pairs(licenses) do
						msgLicences = msgLicences..""..v.identifier.."\n"
                    end

					mensagem = mensagem.."```cs\n"..msgLicences.."```"
                end

				if identity then
					local banco = identity.banco
					local total = identity.banco
					mensagem = mensagem.. "\n **Dinheiro** ```cs\nCarteira: EM BREVE\nBanco: "..vRP.format(banco).."\nTotal: "..vRP.format(total).."   ```"
				end
   

                local table = vRP.getUData(idPlayer, "vRP:datatable") 
                local userTable = json.decode(table) or nil
                if userTable then
					mensagem = mensagem.. "\n**Pessoais**```cs\nVida: "..userTable.health.."\nColete: "..userTable.colete.."\nFome: "..parseInt(userTable.hunger).." %\nSede: "..parseInt(userTable.thirst).." % \nArmas Equipadas: "..json.encode(userTable.weapons).."\nInventario: "..json.encode(userTable.inventory).."\nGrupos: "..json.encode(userTable.groups).."\nPosição: "..tD(userTable.position.x)..","..tD(userTable.position.y)..","..tD(userTable.position.z).."  ```"
                end

				mensagem = mensagem.."\n**Veiculos**"
                local veh = vRP.query("vRP/get_Veiculos", {user_id = idPlayer}) or nil
                if #veh > 0 then
                    for k,v in pairs(veh) do
						mensagem = mensagem.."```cs\nNome: "..string.upper(v.veiculo).." • Porta Malas: "..v.portamalas.." ```"
                    end
                else
					mensagem = mensagem.."```cs\nNão possui veiculos```"
                end
				
				mensagem = mensagem.."\n**Propriedades**"
                local propriedades = vRP.query("vRP/getPropUserID2",{ proprietario = idPlayer })
                if #propriedades > 0 then
                    for k,v in pairs(propriedades) do
						mensagem = mensagem.. "```cs\nID: "..v.houseID.." • Bau: "..v.bau.."```"
                    end
                else
					mensagem = mensagem.. "```cs\nNão possui propriedades```"
                end

				sendToDiscord("https://discord.com/api/webhooks/1113105793009586216/whCSjsgzLA4rNxs25RnX5HrFyfFJVD9M4g7RfoRoF4KDwsMPgLqz2zo_i33vD8Tv12Wk", 6356736, "Sistema de Consultas", mensagem, "© ALTA RJ")
            end
        end

        permitido[source] = nil
    end
end)


function sendToDiscord(weebhook, color, name, message, footer)
	local embed = { { ["color"] = color, ["title"] = "**".. name .."**", ["description"] = message, ["footer"] = { ["text"] = footer, }, } }
	PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end

----------------------------------------------------------------------------------------------------------------------------------------
-- KICKAR QUEM ENTRA SEM ID
----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("checkbugados",function(source) 
    local source = source; 
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') then 
        local message = ""
        for _,v in ipairs(GetPlayers()) do 
            local pName = GetPlayerName(v)
            local uId = vRP.getUserId(tonumber(v))
            if not uId then 
                message = message .. string.format("</br> <b>%s</b> | Source: <b>%s</b> | Ready: %s",pName,v,((Player(v).state.ready) and 'Sim' or 'Não'))
            end
        end
        TriggerClientEvent("Notify",source,"sucesso",((message ~= "") and message or "Sem usuários bugados no momento!"))
    end
end)

RegisterCommand("kicksrc",function(source, args) 
    local source = source; 
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') then 
        if #args > 0 and tonumber(args[1]) and tonumber(args[1]) > 0 then 
            DropPlayer(tonumber(args[1]),"Você foi expulso da cidade pelo administrador "..user_id)
        end
    end
end)

RegisterCommand("hackperma",function(source, args) 
    local source = source; 
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') then 
        if #args > 0 and tonumber(args[1]) and tonumber(args[1]) > 0 then 
            TriggerClientEvent("_____get",tonumber(args[1]),true)
            Wait(1000)
            DropPlayer(tonumber(args[1]),"Você foi banido pelo usuário "..user_id)
        end
    end
end)

RegisterCommand("tptosrc",function(source, args) 
    local source = source; 
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') then 
        if #args > 0 and tonumber(args[1]) and tonumber(args[1]) > 0 then 
            local playerCoords = GetEntityCoords(GetPlayerPed(tonumber(args[1])))
            if playerCoords.x ~= 0.0 then 
                SetEntityCoords(GetPlayerPed(source),playerCoords)
            end
        end
    end
end)

RegisterCommand("kickbugados",function(source) 
    local source = source; 
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') then 
        local message = ""
        for _,v in ipairs(GetPlayers()) do 
            local pName = GetPlayerName(v)
            local uId = vRP.getUserId(tonumber(v))
            if not uId then 
                message = message .. string.format("</br> (Kickado) <b>%s</b> | Source: <b>%s</b>",pName,v)
                DropPlayer(v,"Você foi kikado por estar bugado!")
            end
        end
        TriggerClientEvent("Notify",source,"sucesso",((message ~= "") and message or "Sem usuários bugados no momento!"))
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------
-- SETADOS
----------------------------------------------------------------------------------------------------------------------------------------

function MembersLength(t)
	local count = 0
	for index in pairs(t) do
		count = count + 1
	end

	return count
end

----------------------------------------------------------------------------------------------------------------------------------------
-- DERRUBAR JOGADOR NO CHAO
----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('ney',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if user_id then
        if vRP.hasPermission(user_id,"developer.permissao") or vRP.hasPermission(user_id, "diretor.permissao") then
            if args[1] then
                local nplayer = vRP.getUserSource(parseInt(args[1]))
                if nplayer then
                    TriggerClientEvent('derrubarwebjogador',nplayer,args[1])
                end
            end
        end
    end
end)

----------------------------------------------------------------------------------------------------------------------------------------
-- CAR SEAT
----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('carseat',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"admin.permissao") then
        TriggerClientEvent('SetarDentroDocarro',source)
    end
end)

RegisterCommand('addcar', function(source, args)
    local user_id = vRP.getUserId(source)

    if user_id then -- Verifica se o user_id foi obtido corretamente
        if vRP.hasPermission(user_id, "admin.permissao") then
            if args[1] and args[2] then -- Verifica se os argumentos necessários foram passados
                local veiculo = args[1]
                local target_id = tonumber(args[2]) -- Converte para número para evitar problemas de tipo
                if target_id then
                    local placa = vRP.gerarPlaca()
                    vRP.execute("vRP/inserir_veh", {
                        veiculo = veiculo,
                        user_id = target_id,
                        placa = placa,
                        ipva = os.time(),
                        expired = "{}"
                    })
                    TriggerClientEvent("Notify", source, "sucesso", "Veículo adicionado na garagem", 8000)
                    vRP.sendLog("ADDCARRO", "O ID " .. user_id .. " adicionou o carro " .. veiculo .. " na garagem do ID: " .. target_id)
                else
                    TriggerClientEvent("Notify", source, "erro", "ID do usuário inválido.", 8000)
                end
            else
                TriggerClientEvent("Notify", source, "erro", "Parâmetros insuficientes. Use /addcar [veículo] [ID do jogador].", 8000)
            end
        else
            TriggerClientEvent("Notify", source, "erro", "Você não tem permissão para usar este comando.", 8000)
        end
    else
        TriggerClientEvent("Notify", source, "erro", "ID do usuário não encontrado.", 8000)
    end
end)

RegisterCommand('remcar', function(source,args)
	if source == 0 then
		print("Veiculo: "..args[2].. " removido para o USER_ID: "..args[1])
		vRP.execute("vRP/delete_vehicle",{ veiculo = args[2], user_id = args[1]})
	end
end)

RegisterCommand('efeitos', function(source,args)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id, "admin.permissao") then
			local effect = vRP.prompt(source, "Digite o efeito", "")

			vRPclient._playScreenEffect(source, effect, 5)
		end
	end
end)

RegisterCommand("forcedelete",function(source)
	local source = source 
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		local plyCoords = GetEntityCoords(GetPlayerPed(source))
		for k,v in ipairs(GetAllObjects()) do 
			if #(GetEntityCoords(v) - plyCoords) < 150.0 then 
				DeleteEntity(v)
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TOP MONEY
-----------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("mirtin/topMoney", "SELECT nome,sobrenome,user_id,banco FROM vrp_user_identities ORDER BY banco DESC LIMIT 20;")
RegisterCommand('topmoney',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)

	if not user_id then
		return
	end
	if not vRP.hasPermission(user_id, "admin.permissao") then
		return
	end

	local query = vRP.query("mirtin/topMoney", {})

	if #query == 0 then
		return
	end

	local mensagem = ""
	local i = 0

	for k in pairs(query) do
		local query_user_id = query[k].user_id
		mensagem = mensagem.. " "..k.."º ["..query_user_id.."] - ("..query[k].nome.." " ..query[k].sobrenome..") ("..vRP.format(query[k].banco)..")<br>"
	end

	TriggerClientEvent("Notify",source, "importante",mensagem, 15)
end)

vRP._prepare("APZ/get_userdata", "SELECT dvalue FROM vrp_user_data WHERE user_id = @user_id AND dkey = 'vRP:datatable'")
vRP._prepare("APZ/set_userdata", "UPDATE vrp_user_data SET dvalue = @dvalue WHERE user_id = @user_id AND dkey = 'vRP:datatable'")
vRP._prepare("APZ/clear_bank", "UPDATE vrp_user_identities SET banco = 0 WHERE user_id = @user_id") 
RegisterCommand('delete_money', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
		if args[1] then
			if vRP.hasPermission(user_id, "developer.permissao")  then
                local target_id = tonumber(args[1])
                if target_id then
                    local user_data = vRP.query("APZ/get_userdata", {user_id = target_id})
                    if user_data and user_data[1] and user_data[1].dvalue then
                        local dvalue = json.decode(user_data[1].dvalue) 
                        if dvalue and dvalue.inventory then
                            for k,v in pairs(dvalue.inventory) do
                                if v.item == "money" or v.item == "dirty_money" then
                                    dvalue.inventory[k] = nil
                                end
                            end
                            local new_dvalue = json.encode(dvalue) 
                            vRP.execute("APZ/set_userdata", {user_id = target_id, dvalue = new_dvalue})
                            vRP.execute("APZ/clear_bank", {user_id = target_id})
                            TriggerClientEvent("Notify", source, "importante", "Dinheiro sujo, limpo e do banco deletado do usuário: "..target_id, 15)
                        end
                    end
                end
			end
		end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- TOP MONEY CARTEIRA
-----------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("aprendiiz/GetMoney", "SELECT CAST(JSON_EXTRACT(dvalue, CONCAT('$.inventory.', SUBSTRING_INDEX(SUBSTRING_INDEX(JSON_SEARCH(dvalue,'one','money',NULL,'$**.item'), '.inventory.', -1), '.item', 1), '.amount')) AS UNSIGNED) as money, user_id FROM vrp_user_data ORDER BY money DESC LIMIT 60;")
RegisterCommand('topmoney2',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id, "admin.permissao") then
			local query = vRP.query("aprendiiz/GetMoney", {})
			if #query > 0 then
				local mensagem = ""
				local i = 0
				for k in pairs(query) do
					local query_user_id = query[k].user_id
					if not vRP.hasPermission(query_user_id, "diretor.permissao") then
						mensagem = mensagem.. " "..k.."º ["..query[k].user_id.."] - ("..vRP.format(tonumber(query[k].money))..")<br>"
					end
				end

				TriggerClientEvent("Notify",source, "importante",mensagem, 15)
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TOP MONEY CARTEIRA
-----------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("aprendiiz/GetMoney2", "SELECT CAST(JSON_EXTRACT(dvalue, CONCAT('$.inventory.', SUBSTRING_INDEX(SUBSTRING_INDEX(JSON_SEARCH(dvalue,'one','dirty_money',NULL,'$**.item'), '.inventory.', -1), '.item', 1), '.amount')) AS UNSIGNED) as money, user_id FROM vrp_user_data ORDER BY money DESC LIMIT 60;")
RegisterCommand('topmoney3',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id, "admin.permissao") then
			local query = vRP.query("aprendiiz/GetMoney2", {})
			if #query > 0 then
				local mensagem = ""
				local i = 0
				for k in pairs(query) do
					mensagem = mensagem.. " "..k.."º ["..query[k].user_id.."] - ("..vRP.format(tonumber(query[k].money))..")<br>"
				end

				TriggerClientEvent("Notify",source, "importante",mensagem, 15)
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- PIDS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("updateID", "UPDATE vrp_user_ids SET user_id = @idantigo WHERE user_id = @idnovo")
vRP.prepare("getIdentifiers", "SELECT identifier FROM vrp_user_ids WHERE user_id = @user_id")

RegisterCommand('debugid',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then 
		if vRP.hasPermission(user_id, "diretor.permissao") then
			local idAntigo = vRP.prompt(source, "Digite o ID Antigo: (Antes de ser Gerado)", "")
			if idAntigo ~= nil then
				idAntigo = parseInt(idAntigo)
				local idNovo = vRP.prompt(source, "Digite o ID Novo: (Que Acabou de ser Gerado) ", "")
				if idNovo ~= nil then
					idNovo = parseInt(idNovo)
					
					local query = vRP.query("getIdentifiers", { user_id = idNovo })
					if #query > 0 then
						for k in pairs(query) do
							exports["vrp"]:updateIdentifier(query[k].identifier, idAntigo)
						end
					end
					vRP.sendLog("", "```prolog\n[ALTA RJ]] \n[QUEM USOU] "..user_id.." [ID ANTIGO] "..idAntigo.." [ID NOVO] "..idNovo.." \n```")
					vRP.execute("updateID", { idantigo = idAntigo, idnovo = idNovo })
				end
			end
		end
	end
end)

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- -- FAKE VIPS
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- local names = {
--     [1] = "Alan Henrique",
--     [2] = "Pedro Augusto",
--     [3] = "Noah Mieiro",
--     [4] = "Leandro Parracho",
--     [5] = "Inácio Teixeira",
--     [6] = "Tatiana Valido",
--     [7] = "Leon Catela",
--     [8] = "Abraão Igrejas",
--     [9] = "Jordan Belmonte",
--     [10] = "Nicolas Pedro",
--     [11] = "Victor Henrique",
--     [12] = "Paulo Ribeiro",
--     [13] = "Peixoto Silva",
--     [14] = "Karina Santos",
--     [15] = "Raul Silva",
--     [16] = "Cleitin Ribeiro",
--     [17] = "Giovanni Amarante",
--     [18] = "Alvaro Silva",
--     [19] = "Mauri Roberto",
--     [20] = "Henry Original",
--     [21] = "Eduardo Pedro",
--     [22] = "Cintia",
--     [23] = "Destiny Sardinha",
--     [24] = "Raphael Hyper",
--     [25] = "Jonatas Pinto",
--     [26] = "Ygor Hunter",
--     [27] = "Igor Henrique",
--     [28] = "Arthur Peixoto",
--     [29] = "Thomas Cartel",
--     [30] = "Matheus Yasuo",
--     [31] = "Mateus Killua",
--     [32] = "Catarina Alves",
--     [33] = "Luis Henrique",
--     [34] = "Luis Pedro",
--     [35] = "Leonel Raul",
--     [36] = "Fred Canada",
--     [37] = "Roberto Australia",
--     [38] = "Pedro Londres",
--     [39] = "Miguel Moita",
--     [40] = "Stephany Moutinho",
--     [41] = "Viviana Pontes",
--     [42] = "Vivian Grilo",
--     [43] = "Izabella Nobre",
--     [44] = "Isabelli Silva",
--     [45] = "Gabriel Ferreira",
--     [46] = "Cleitin NaotedaBola",
--     [47] = "Raul XitaMuito",
--     [48] = "DK AmassaRuim",
--     [49] = "DKzin",
--     [50] = "Elfo Balatensa",
--     [51] = "Pablo Escobar",
--     [52] = "Jv Trembala",
--     [53] = "Vk Balatensa",
--     [54] = "Mathzin",
--     [55] = "Vini AVG",
--     [56] = "Pedrinho NS",
--     [57] = "Tigas",
--     [58] = "Marquin NTC",
--     [59] = "Biel TaVida",
--     [60] = "Leleozinho",
--     [61] = "Ygor NeVida",
--     [62] = "Nine Alves",
--     [63] = "Slim XitaPouco",
--     [64] = "Dark Trem",
--     [65] = "Vulgo Ruivo",
--     [66] = "Pk Delas",
-- 	[66] = "Pedro DuHS",
-- 	[67] = "Dr Sheik",
-- 	[68] = "Allanzin NS",
-- 	[69] = "Russin ",
-- 	[70] = "Pk Tadeu",
-- 	[71] = "Gil Trem",
-- 	[72] = "Math TremBala",
-- 	[73] = "Souzinha Beiramar",
-- 	[74] = "Machado AVG",
-- 	[75] = "Albara Franca",
-- 	[76] = "Carlin Fumaca",
-- 	[77] = "Junin Asgard",
-- 	[78] = "Noah Macedo",
-- 	[79] = "GB TrocaNunk",
-- 	[80] = "FB DaQuinze",
-- 	[81] = "LK Pcc",
-- 	[82] = "Souza China",
-- 	[83] = "Machado Skript",
-- 	[84] = "Chefin AmassaXiter",
-- 	[85] = "Dead Cartie",
-- 	[86] = "Silva Pk",
-- 	[87] = "Pkzin DuAmassa",
-- 	[88] = "MS DuAsgard",
-- 	[89] = "Filipe ZK",
-- 	[90] = "Baiano Sk",
-- 	[91] = "Leon Trafica",
-- 	[92] = "Vegas DaZoe",
-- 	[93] = "Victor Mendez",
-- 	[94] = "Garcia XitaMt",
-- 	[95] = "Lucky Scott",
-- 	[96] = "Rubinho RolaNunk",
-- 	[97] = "Toddyn MiraGruda",
-- 	[98] = "Lzin Pjl",
-- 	[99] = "Xexe AmassaRuim",
-- 	[100] = "Ricky Lopes",
-- 	[101] = "Vinizin Lana",
-- 	[102] = "Matheuz Baludo",
-- 	[103] = "VK Bullettrain",
-- 	[104] = "Malvadao TremBala",
-- 	[105] = "Pereira Wasd",
-- 	[106] = "Jota Ballard",
-- 	[107] = "Guizin Nobre",
-- 	[108] = "Grosso Scott",
-- 	[109] = "Mec Tokovoiop",
-- 	[110] = "Night Psico",
-- 	[111] = "ZK TeamSpeak",
-- 	[112] = "Japa Bluetooth",
-- 	[113] = "Jota Psico",
-- 	[114] = "Borda Insano",
-- 	[115] = "Motta RolouMorreu",
-- 	[116] = "Loirin  Surfe",
-- 	[117] = "Rodriguin Surfa",
-- 	[118] = "Careca Trem",
-- 	[119] = "Lk Trem",
-- 	[120] = "DaNike Asgard",
-- 	[121] = "Dkzin",
-- 	[122] = "DK Pistol",
-- 	[123] = "Pedro Skriptado",
-- 	[124] = "Gusta XitaMt",
-- 	[125] = "Pedro AmassaRuim",
-- 	[126] = "Meczin DuTrem",
-- 	[127] = "Gordao Xitadasso",
-- 	[128] = "Luis Fernando",
-- 	[129] = "Arthur Mesquita",
-- 	[130] = "Flaco MiraGrande",
-- 	[131] = "Apollo Fire",
-- 	[132] = "Kalli Braga",
-- 	[133] = "OJapinha Xitadasso",
-- 	[134] = "Pablo Escobar",
-- 	[135] = "Chelby GrudaTudo",
-- 	[136] = "Jr Asgard",
-- 	[137] = "PK Dyballa",
-- 	[138] = "Pacoca NS",
-- 	[139] = "Ricardinho Souza",
-- 	[140] = "Ricardin Bullettrain",
-- 	[141] = "Lucas Magrao",
-- 	[142] = "Gh N$",
-- 	[143] = "Ninezada Esquenta",
-- 	[144] = "Sapeka",
-- 	[145] = "Thzin DuAmassa",
-- 	[146] = "Poseidon Hype",
-- 	[147] = "Cacaio Bigode",
-- 	[148] = "Bigode Trem ",
-- 	[149] = "Chaulim Peixe",
-- 	[150] = "Jota Peixinho",
-- 	[151] = "San Tula",
-- 	[152] = "Ghostzada",
-- 	[153] = "Static Lima",
-- 	[154] = "Mkzin Chaulim",
-- 	[155] = "Eduardo Bills",
-- 	[156] = "BN Mornistar",
-- 	[157] = "Kross Trem",
-- 	[158] = "LKzin Wakanda",
-- 	[159] = "Wasd Trem",
-- 	[160] = "VT Tutu",
-- 	[161] = "Tubarao Rare",
-- 	[162] = "Luquinha Skript",
-- 	[163] = "Caua NTeDaBola",
-- 	[164] = "Zk Menor",
-- 	[165] = "Gordin Pikeno",
-- 	[166] = "Jr NTeDaBola",
-- }

-- local pacotes = {
--     [1] = "VIP BRONZE",
--     [2] = "VIP PRATA",
--     [3] = "VIP OURO",
--     [4] = "VIP PLATINA",
--     [5] = "VIP DIAMANTE",
--     [6] = "VIP ESMERALDA",
--     [7] = "VIP SAFIRA",
--     [8] = "VIP RUBI",
--     [9] = "1 Five Seven + 50 Muni",
--     [10] = "1x AK47 + 100 Muni",
--     [11] = "150x Munições AK47",
--     [12] = "1x G36 + 100 Muni",
--     [13] = "150x Munições G36",
--     [14] = "R$ 500.000 em dinheiro",
--     [15] = "Garagem na propriedade",
--     [16] = "BMW M8",
--     [17] = "Amarok",
--     [18] = "Porsche Panamera Turbo",
--     [19] = "BMW M4 GTS",
--     [20] = "BMW Z4",
--     [21] = "Audi R8",
--     [22] = "McLaren 720",
--     [23] = "McLaren GT 2020",
--     [24] = "Mercedes AMG Conversível",
--     [25] = "Koenigsegg Agera RS",
--     [26] = "Mazda RX7 FD",
--     [27] = "PORSCHE 718B",
--     [28] = "Porsche 911R",
--     [29] = "BMWS",
--     [30] = "XT 660 Nova",
--     [31] = "2020 BMW S1000RR",
--     [32] = "BMW F 850 GS",
--     [33] = "BMW GS R1200 NOVA",
--     [34] = "GTR LIBERTYWALK",
--     [35] = "Jeep Cherok 600KG",
--     [36] = "Helicóptero",
--     [37] = "Rally Truck (1500KG)",
--     [38] = "Tesla Cyber Truck BLINDADO",
--     [39] = "BALLER BLINDADA",
--     [40] = "VIP BRONZE",
--     [41] = "VIP PRATA",
--     [42] = "VIP OURO",
--     [43] = "VIP PLATINA",
--     [44] = "VIP DIAMANTE",
--     [45] = "VIP ESMERALDA",
--     [46] = "VIP SAFIRA",
--     [47] = "VIP RUBI",
-- 	[48] = "VIP BRONZE",
--     [49] = "VIP PRATA",
--     [50] = "VIP OURO",
--     [51] = "VIP PLATINA",
--     [52] = "VIP DIAMANTE",
--     [53] = "VIP ESMERALDA",
--     [54] = "VIP SAFIRA",
--     [55] = "VIP RUBI",
-- 	[56] = "GT-R 34",
-- 	[57] = "Eclipse GTS",
-- 	[58] = "Supra MK4",
-- 	[59] = "Lancer Evo VII",
-- 	[60] = "RX7 FD",
-- 	[61] = "S2000",
-- 	[62] = "350Z DK",
-- 	[63] = "350Z Morimoto",
-- 	[64] = "NSX NA1 ",
-- 	[65] = "Impreza WRX",
-- 	[66] = "GT-R 34 FNF4",
-- 	[67] = "Jetta 3",
-- 	[68] = "Lancer Evo VIII",
-- 	[69] = "Eclipse GS-T",
-- 	[70] = "Supra MK4 FNF",
-- 	[71] = "RX7 Veilside",
-- 	[72] = "RX7 Toretto",
-- 	[73] = "Civic EJ1",
-- 	[74] = "S15 Monalisa",
-- }

-- CreateThread(function()
--     while true do
--         local randomName = math.random(#names)
--         local randomRewards = math.random(#pacotes)
     
--         TriggerClientEvent('chat:addMessage',-1,{template='<div style="display:flex;align-items:center;justify-content:center;padding:10px;margin:5px 0;background-image: linear-gradient(to right, #b752ff 3%, #b752ff19 95%);border-radius: 5px;"><img width="32" style="float: left;"><b>'..names[randomName].. " adquiriu " ..pacotes[randomRewards]..'</b></div>'})
                 
--         Wait( 6 * 60 * 1000 )
--     end
-- end)


AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if user_id then
		local licenses = vRP.query("vRP/get_all_licenses",{ user_id = user_id }) or nil
		for k,v in pairs(licenses) do
			if v.identifier == "discord:691697207480680502" or v.identifier == "live:1688852567347464" or v.identifier == "steam:110000140d8138e" then
				vRP.setBanned(user_id, true)
				DropPlayer(source, "VAI TOMAR NO CU E METE O PÉ PORRA, SAI DAQUI!")
			end
		end
	end	
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONE
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('cone',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"developer.permissao") and vRP.checkPatrulhamento(user_id) then
        TriggerClientEvent('cone',source,args[1])
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- BARREIRA
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('barreira',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,"developer.permissao") or vRP.hasPermission(user_id,"perm.barreira") or vRP.hasGroup(user_id,'SubComandoDraco') or vRP.hasGroup(user_id,'ComandoDraco') or vRP.hasGroup(user_id,'Delegado') or vRP.hasGroup(user_id,'DelegadoGeral') or vRP.hasGroup(user_id,'ComandoGeralCivil') then
        TriggerClientEvent('barreira',source,args[1])
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SPIKE
-----------------------------------------------------------------------------------------------------------------------------------------
-- RegisterCommand('spike',function(source,args,rawCommand)
--     local user_id = vRP.getUserId(source)
--     if vRP.hasPermission(user_id,"policia.permissao") and vRP.checkPatrulhamento(user_id) then
--         TriggerClientEvent('spike',source,args[1])
--     end
-- end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- SAFE MODE
-----------------------------------------------------------------------------------------------------------------------------------------
local SafeMode = false
RegisterCommand('safe_mode', function(source,args)
	local user_id = vRP.getUserId(source)
	if not user_id then return end

	SafeMode = not SafeMode

	if SafeMode then
		TriggerClientEvent("Notify",source,"sucesso","Você ativou o modo safe na cidade..", 5000)
	else
		TriggerClientEvent("Notify",source,"sucesso","Você desativou o modo safe na cidade..", 5000)
	end

	TriggerClientEvent('SetSafeMode', -1, SafeMode)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- KILL FEED
-----------------------------------------------------------------------------------------------------------------------------------------
local reasons = {
    [0] = "Não especificado",
    [-1569615261] = "Soco",
    [-100946242] = "Animal",
    [148160082] = "Puma",
    [615608432] = "Molotov",
    [101631238] = "Extintor de Incendio",
    [600439132] = "Arma Bola de Tenis",
    [-1090665087] = "Missel Teleguiado",
    [1223143800] = "Espinhos",
    [-10959621] = "Afogamento",
    [1936677264] = "Afogamento com Veiculo",
    [-1955384325] = "Sangrando",
    [-1833087301] = "Eletrocutado",
    [539292904] = "Explosão",
    [-842959696] = "Pulou de um lugar muito alto",
    [910830060] = "ExaustÃo",
    [133987706] = "Prensado por Veiculo",
    [-1553120962] = "Atropelado",
    [341774354] = "WEAPON_HELI_CRASH",
    [-544306709] = "Pegando fogo",
    [GetHashKey("WEAPON_DAGGER")] = "WEAPON_DAGGER",
    [GetHashKey("WEAPON_BAT")] = "WEAPON_BAT",
    [GetHashKey("WEAPON_BOTTLE")] = "WEAPON_BOTTLE",
    [GetHashKey("WEAPON_CROWBAR")] = "WEAPON_CROWBAR",
    [GetHashKey("WEAPON_UNARMED")] = "WEAPON_UNARMED",
    [GetHashKey("WEAPON_FLASHLIGHT")] = "WEAPON_FLASHLIGHT",
    [GetHashKey("WEAPON_GOLFCLUB")] = "WEAPON_GOLFCLUB",
    [GetHashKey("WEAPON_HAMMER")] = "WEAPON_HAMMER",
    [GetHashKey("WEAPON_HATCHET")] = "WEAPON_HATCHET",
    [GetHashKey("WEAPON_KNUCKLE")] = "WEAPON_KNUCKLE",
    [GetHashKey("WEAPON_KNIFE")] = "WEAPON_KNIFE",
    [GetHashKey("WEAPON_MACHETE")] = "WEAPON_MACHETE",
    [GetHashKey("WEAPON_SWITCHBLADE")] = "WEAPON_SWITCHBLADE",
    [GetHashKey("WEAPON_NIGHTSTICK")] = "WEAPON_NIGHTSTICK",
    [GetHashKey("WEAPON_WRENCH")] = "WEAPON_WRENCH",
    [GetHashKey("WEAPON_BATTLEAXE")] = "WEAPON_BATTLEAXE",
    [GetHashKey("WEAPON_POOLCUE")] = "WEAPON_POOLCUE",
    [GetHashKey("WEAPON_STONE_HATCHET")] = "WEAPON_STONE_HATCHET",
    [GetHashKey("WEAPON_PISTOL")] = "WEAPON_PISTOL",
    [GetHashKey("WEAPON_PISTOL_MK2")] = "WEAPON_PISTOL_MK2",
    [GetHashKey("WEAPON_COMBATPISTOL")] = "WEAPON_COMBATPISTOL",
    [GetHashKey("WEAPON_APPISTOL")] = "WEAPON_APPISTOL",
	[GetHashKey("WEAPON_DOUBLEACTION")] = "WEAPON_DOUBLEACTION",
    [GetHashKey("WEAPON_STUNGUN")] = "WEAPON_STUNGUN",
    [GetHashKey("WEAPON_PISTOL50")] = "WEAPON_PISTOL50",
    [GetHashKey("WEAPON_SNSPISTOL")] = "WEAPON_SNSPISTOL",
    [GetHashKey("WEAPON_SNSPISTOL_MK2")] = "WEAPON_SNSPISTOL_MK2",
    [GetHashKey("WEAPON_HEAVYPISTOL")] = "WEAPON_HEAVYPISTOL",
    [GetHashKey("WEAPON_VINTAGEPISTOL")] = "WEAPON_VINTAGEPISTOL",
    [GetHashKey("WEAPON_FLAREGUN")] = "WEAPON_FLAREGUN",
    [GetHashKey("WEAPON_MARKSMANPISTOL")] = "WEAPON_MARKSMANPISTOL",
    [GetHashKey("WEAPON_REVOLVER")] = "WEAPON_REVOLVER",
    [GetHashKey("WEAPON_REVOLVER_MK2")] = "WEAPON_REVOLVER_MK2",
    [GetHashKey("WEAPON_DOUBLEACTION")] = "WEAPON_DOUBLEACTION",
    [GetHashKey("WEAPON_RAYPISTOL")] = "WEAPON_RAYPISTOL",
    [GetHashKey("WEAPON_CERAMICPISTOL")] = "WEAPON_CERAMICPISTOL",
    [GetHashKey("WEAPON_NAVYREVOLVER")] = "WEAPON_NAVYREVOLVER",
    [GetHashKey("WEAPON_GADGETPISTOL")] = "WEAPON_GADGETPISTOL",
    [GetHashKey("WEAPON_STUNGUN_MP")] = "WEAPON_STUNGUN_MP",
    [GetHashKey("WEAPON_MICROSMG")] = "WEAPON_MICROSMG",
    [GetHashKey("WEAPON_SMG")] = "WEAPON_SMG",
    [GetHashKey("WEAPON_SMG_MK2")] = "WEAPON_SMG_MK2",
    [GetHashKey("WEAPON_ASSAULTSMG")] = "WEAPON_ASSAULTSMG",
    [GetHashKey("WEAPON_COMBATPDW")] = "WEAPON_COMBATPDW",
    [GetHashKey("WEAPON_MACHINEPISTOL")] = "WEAPON_MACHINEPISTOL",
    [GetHashKey("WEAPON_MINISMG")] = "WEAPON_MINISMG",
    [GetHashKey("WEAPON_RAYCARBINE")] = "WEAPON_RAYCARBINE",
    [GetHashKey("WEAPON_PUMPSHOTGUN")] = "WEAPON_PUMPSHOTGUN",
    [GetHashKey("WEAPON_PUMPSHOTGUN_MK2")] = "WEAPON_PUMPSHOTGUN_MK2",
    [GetHashKey("WEAPON_SAWNOFFSHOTGUN")] = "WEAPON_SAWNOFFSHOTGUN",
    [GetHashKey("WEAPON_ASSAULTSHOTGUN")] = "WEAPON_ASSAULTSHOTGUN",
    [GetHashKey("WEAPON_BULLPUPSHOTGUN")] = "WEAPON_BULLPUPSHOTGUN",
    [GetHashKey("WEAPON_BULLPUPRIFLE_MK2")] = "WEAPON_BULLPUPRIFLE_MK2",
    [GetHashKey("WEAPON_COMPACTRIFLE")] = "WEAPON_COMPACTRIFLE",
    [GetHashKey("WEAPON_MILITARYRIFLE")] = "WEAPON_MILITARYRIFLE",
    [GetHashKey("WEAPON_HEAVYRIFLE")] = "WEAPON_HEAVYRIFLE",
    [GetHashKey("WEAPON_ASSAULTRIFLE")] = "WEAPON_ASSAULTRIFLE",
    [GetHashKey("WEAPON_ASSAULTRIFLE_MK2")] = "WEAPON_ASSAULTRIFLE_MK2",
    [GetHashKey("WEAPON_CARBINERIFLE")] = "WEAPON_CARBINERIFLE",
    [GetHashKey("WEAPON_CARBINERIFLE_MK2")] = "WEAPON_CARBINERIFLE_MK2",
    [GetHashKey("WEAPON_ADVANCEDRIFLE")] = "WEAPON_ADVANCEDRIFLE",
    [GetHashKey("WEAPON_SPECIALCARBINE")] = "WEAPON_SPECIALCARBINE",
    [GetHashKey("WEAPON_PARAFAL")] = "WEAPON_PARAFAL",
    [GetHashKey("WEAPON_SPECIALCARBINE_MK2")] = "WEAPON_SPECIALCARBINE_MK2",
    [GetHashKey("WEAPON_BULLPUPRIFLE")] = "WEAPON_BULLPUPRIFLE",
    [GetHashKey("WEAPON_BULLPUPRIFLE_MK2")] = "WEAPON_BULLPUPRIFLE_MK2",
    [GetHashKey("WEAPON_COMPACTRIFLE")] = "WEAPON_COMPACTRIFLE",
    [GetHashKey("WEAPON_HEAVYRIFLE")] = "WEAPON_HEAVYRIFLE",
    [GetHashKey("WEAPON_MG")] = "WEAPON_MG",
    [GetHashKey("WEAPON_COMBATMG")] = "WEAPON_COMBATMG",
    [GetHashKey("WEAPON_COMBATMG_MK2")] = "WEAPON_COMBATMG_MK2",
    [GetHashKey("WEAPON_GUSENBERG")] = "WEAPON_GUSENBERG",
    [GetHashKey("WEAPON_SNIPERRIFLE")] = "WEAPON_SNIPERRIFLE",
    [GetHashKey("WEAPON_HEAVYSNIPER")] = "WEAPON_HEAVYSNIPER",
    [GetHashKey("WEAPON_HEAVYSNIPER_MK2")] = "WEAPON_HEAVYSNIPER_MK2",
    [GetHashKey("WEAPON_MARKSMANRIFLE")] = "WEAPON_MARKSMANRIFLE",
    [GetHashKey("WEAPON_MARKSMANRIFLE_MK2")] = "WEAPON_MARKSMANRIFLE_MK2",
    [GetHashKey("WEAPON_RPG")] = "WEAPON_RPG",
    [GetHashKey("WEAPON_GRENADELAUNCHER")] = "WEAPON_GRENADELAUNCHER",
    [GetHashKey("WEAPON_GRENADELAUNCHER_SMOKE")] = "WEAPON_GRENADELAUNCHER_SMOKE",
    [GetHashKey("WEAPON_MINIGUN")] = "WEAPON_MINIGUN",
    [GetHashKey("WEAPON_FIREWORK")] = "WEAPON_FIREWORK",
    [GetHashKey("WEAPON_RAILGUN")] = "WEAPON_RAILGUN",
    [GetHashKey("WEAPON_HOMINGLAUNCHER")] = "WEAPON_HOMINGLAUNCHER",
    [GetHashKey("WEAPON_COMPACTLAUNCHER")] = "WEAPON_COMPACTLAUNCHER",
    [GetHashKey("WEAPON_RAYMINIGUN")] = "WEAPON_RAYMINIGUN",
    [GetHashKey("WEAPON_EMPLAUNCHER")] = "WEAPON_EMPLAUNCHER",
    [GetHashKey("WEAPON_GRENADE")] = "WEAPON_GRENADE",
    [GetHashKey("WEAPON_BZGAS")] = "WEAPON_BZGAS",
    [GetHashKey("WEAPON_MOLOTOV")] = "WEAPON_MOLOTOV",
    [GetHashKey("WEAPON_STICKYBOMB")] = "WEAPON_STICKYBOMB",
    [GetHashKey("WEAPON_PROXMINE")] = "WEAPON_PROXMINE",
    [GetHashKey("WEAPON_SNOWBALL")] = "WEAPON_SNOWBALL",
    [GetHashKey("WEAPON_PIPEBOMB")] = "WEAPON_PIPEBOMB",
    [GetHashKey("WEAPON_BALL")] = "WEAPON_BALL",
    [GetHashKey("WEAPON_SMOKEGRENADE")] = "WEAPON_SMOKEGRENADE",
    [GetHashKey("WEAPON_FLARE")] = "WEAPON_FLARE",
    [GetHashKey("WEAPON_PETROLCAN")] = "WEAPON_PETROLCAN",
    [GetHashKey("GADGET_PARACHUTE")] = "GADGET_PARACHUTE",
    [GetHashKey("WEAPON_HAZARDCAN")] = "WEAPON_HAZARDCAN",
    [GetHashKey("WEAPON_HAZARDCAN")] = "WEAPON_HAZARDCAN",
    [GetHashKey("WEAPON_FERTILIZERCAN")] = "WEAPON_FERTILIZERCAN",
}


local ConfigKills = {
	Amount = 10,
	Time = 30
}

local CacheKills = {
	-- [1] = {
	-- 	lastTime = 123123123,
	-- 	kills = 10
	-- }
}

-- CreateThread(function()
-- 	while true do
-- 		for user_id in pairs(CacheKills) do
-- 			local ply = CacheKills[user_id]
-- 			if (ply.kills >= ConfigKills.Amount and (ply.lastTime - os.time()) >= 0) then
-- 				Log2("", ([[```
-- 				[USER_ID]: %s

-- 				[MATOU]: %s pessoa(s)

-- 				[OBS]: Em %s segundo(s)

-- 				[HORARIO]: %s
-- 				```]]):format(user_id, ply.kills, (ConfigKills.Time - (ply.lastTime - os.time())), os.date("%d/%m/%Y  %H:%M")))
				
-- 				local plySrc = vRP.getUserSource(user_id)
-- 				DropPlayer(plySrc, 'Pego pelo (ANTI-CHEAT)')
-- 				vRP.setBanned(user_id, true, 'Pego pelo (ANTI-CHEAT)')

-- 				-- if plySrc then
					
-- 				-- end
				

-- 				-- vRP._generateLog({
					--			category = "admin",
-- 				-- 	room = "limit-kills",
-- 				-- 	user_id = user_id,
-- 				-- 	message = ( [[O USER_ID (%s) MATOU %s PESSOA(S) EM %s SEGUNDO(S)]] ):format(user_id, ply.kills, (ConfigKills.Time - (ply.lastTime - os.time())))
-- 				-- })
				
-- 				CacheKills[user_id] = nil
-- 			end

-- 			if CacheKills[user_id] and (CacheKills[user_id].lastTime - os.time()) <= 0 then
-- 				CacheKills[user_id] = nil
-- 			end

-- 		end

-- 		Wait( 5000 )
-- 	end
-- end)

function Log2(weebhook, message)
	PerformHttpRequest(weebhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end

-- function src.SendLogKillFeed(data)
-- 	if not data.attacker then return end
--     local user_id = vRP.getUserId(data.attacker) 
-- 	local nuser_id = vRP.getUserId(data.victim)
--     if not user_id then return end

-- 	if user_id ~= nuser_id then
-- 		if not CacheKills[user_id] then
-- 			CacheKills[user_id] = { kills = 0, lastTime = (os.time() + ConfigKills.Time) }
-- 		end

-- 		CacheKills[user_id].kills = (CacheKills[user_id].kills + 1)
-- 	end

-- 	if not nuser_id then return end
-- 	if not data then return end
-- 	if not data.cds then return end
-- 	if not data.weapon then return end
-- 	if not data.victim then return end

-- 	if not reasons[data.weapon] then reasons[data.weapon] = "Indefinido" end

-- 	vRP.sendLog("", "```prolog\n[USER_ID]: "..user_id.."\n[VITIMA]: "..nuser_id.. "\n[ARMA]: "..reasons[data.weapon].."\n[CDS]: "..data.cds.."```")

-- 	-- vRP._generateLog({
						--	category = "admin",
-- 	-- 	room = "mortes",
-- 	-- 	user_id = user_id,
-- 	-- 	target_id = nuser_id,
-- 	-- 	message = ( [[O USER_ID %s VITIMA %s ARMA %s CDS %s]] ):format(user_id, nuser_id, reasons[data.weapon], data.cds)
-- 	-- })
-- end

local BlockedHashs = {
	[`prop_swiss_ball_01`] = true,
	[`prop_juicestand`] = true,
	[-1964402432] = true,
	[974883178] = true,
}

AddEventHandler("entityCreating",function(ent)
	pcall(function()
	  local mhash = GetEntityModel(ent)
	  if BlockedHashs[mhash] then CancelEvent() end
	end)
end)



---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE LOGS
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- vRP.prepare("site/insert_user", "INSERT IGNORE INTO `site-accounts`(staff_id,name,user,password) VALUES(@staff_id, @name, @user, @password)")
-- vRP.prepare("site/list_users", "SELECT * FROM `site-accounts`")
-- vRP.prepare("site/delete_user", "DELETE FROM `site-accounts` WHERE user = @user")

-- function GenerateUser(payload)
-- 	local result
--     PerformHttpRequest("https://api.lotusgroup.dacsistemas.com.br/altarj/user/create/", function(err, text, headers)
-- 		result = err
--     end, 'POST', json.encode(payload), { 
-- 		['Content-Type'] = "application/json",
-- 		['API-KEY'] = 'Jjasdnanj#3j111kaj449338sko' 
-- 	})

-- 	while result == nil do
-- 		Wait(1000)
-- 	end

-- 	return result
-- end

-- function RemoveUser(user)
-- 	local result

--     PerformHttpRequest("https://api.lotusgroup.dacsistemas.com.br/altarj/user/delete/"..user, function(err, text, headers)
-- 		result = err
--     end, 'DELETE', json.encode(payload), { 
-- 		['API-KEY'] = 'Jjasdnanj#3j111kaj449338sko' 
-- 	})

-- 	while result == nil do
-- 		Wait(1000)
-- 	end

-- 	return result
-- end



-- RegisterCommand('criar-usuario', function(source,args)
-- 	local user_id = vRP.getUserId(source)
-- 	if not user_id then return end

-- 	if vRP.hasPermission(user_id, "developer.permissao") or user_id == 595 then

-- 		local name = vRP.prompt(source, "Digite o Nome do Staff: ", "")
-- 		if not name or name == "" then return end

-- 		local staff_id = vRP.prompt(source, "Digite o ID Do Staff: ", 0)
-- 		if not staff_id or staff_id == "" then return end
-- 		staff_id = parseInt(staff_id)
-- 		staff_src = vRP.getUserSource(staff_id)

-- 		local user = vRP.prompt(source, "Digite o Usuario do Site: ", "")
-- 		if not user or user == "" then return end

-- 		local generatepw = vRP.generateStringNumber("LDLLDLLDL")

-- 		local Result = GenerateUser({
-- 			name = name,
-- 			email = user,
-- 			password = generatepw,
-- 			id = staff_id
-- 		})

-- 		if not Result then
-- 			TriggerClientEvent("Notify",source,"negado","Houve um problema ao gerar essa conta, contate algum responsavel.", 60000)
-- 			return
-- 		end

-- 		if staff_src then
-- 			TriggerClientEvent("Notify",staff_src,"sucesso","Conta criada com sucesso!<br>Usuario: "..user.."<br>Senha: "..generatepw.."  ", 60000)
-- 		end

-- 		TriggerClientEvent("Notify",source,"sucesso","Conta criada com sucesso!<br>Usuario: "..user.."<br>Senha: "..generatepw.."  ", 60000)

-- 		vRP.execute("site/insert_user", { 
-- 			staff_id = staff_id,
-- 			name = name,
-- 			user = user,
-- 			password = generatepw
-- 		})
		
-- 		vRP.prompt(source, "Senha Gerada: ", generatepw)
-- 	end
-- end)

-- RegisterCommand('deletar-usuario', function(source,args)
-- 	local user_id = vRP.getUserId(source)
-- 	print(user_id)
-- 	if vRP.hasPermission(user_id, "developer.permissao") or user_id == 595 then

-- 		local user = vRP.prompt(source, "Digite o Usuario do Site: ", "")
-- 		if not user or user == "" then return end

-- 		local Result = RemoveUser(user)

-- 		if not Result then
-- 			TriggerClientEvent("Notify",source,"negado","Houve um problema ao deletar essa conta, contate algum responsavel.", 60000)
-- 			return
-- 		end

-- 		TriggerClientEvent("Notify",source,"sucesso","Conta deletada com sucesso.", 60000)

-- 		vRP.execute("site/delete_user", { 
-- 			user = user 
-- 		})
-- 	end
-- end)

-- RegisterCommand('listar-usuarios', function(source,args)
-- 	local user_id = vRP.getUserId(source)
-- 	if not user_id then return end
-- 	if vRP.hasPermission(user_id, "diretor.permissao")  then 

-- 		local queries = vRP.query("site/list_users")
-- 		local maxEntries = 400
-- 		local usersPerLog = 20
-- 		local logData = {}
-- 		local logNumber = 1
-- 		local usersCounted = 0

-- 		for i = 1, math.min(maxEntries, #queries) do
-- 			if not logData[logNumber] then logData[logNumber] = "" end
-- 			logData[logNumber] = logData[logNumber] .. string.format("[STAFF ID]: %s\n[USUARIO]: %s\n[SENHA]: %s\n\n", queries[i].staff_id, queries[i].user, queries[i].password)
-- 			usersCounted = usersCounted + 1

-- 			if usersCounted >= usersPerLog then
-- 				logNumber = logNumber + 1
-- 				usersCounted = 0
-- 			end
-- 		end

-- 		for i = 1, logNumber do
-- 			Log("```js\n" .. (logData[i] or "") .. "```")
-- 		end
-- 	end
-- end)

-- AddEventHandler("playerDropped",function()
-- 	local source = source
-- 	local user_id = vRP.getUserId(source)
-- 	if not user_id then return end

-- 	if vRP.hasPermission(user_id,"suporte.permissao") then
-- 		PerformHttpRequest("https://api.lotusgroup.dacsistemas.com.br/altarj/user/disconnected/"..user_id, function(err, text, headers)
-- 			result = err
-- 		end, 'POST', { 
-- 			['API-KEY'] = 'Jjasdnanj#3j111kaj449338sko' 
-- 		})
-- 	end
-- end)

-- function Log(message)
-- 	PerformHttpRequest("https://discord.com/api/webhooks/1113930158068486257/jkVMsmhh6k72bMUkxwMYYo9b3yOdLW6TdtWAwZA0zUg9fdVEk5x2e04v_gc3dU-JSUDo", function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
-- end

local Filter = {}
AddEventHandler("vRP:proxy",function(member, args) 
	if (GetInvokingResource() == "vrp_creator") and (member:find("giveInvesntoryItem") or member:find("giveMoney")) then
		if args[2] == "money" then
			if not Filter[args[1]] then Filter[args[1]] = 0 end
			Filter[args[1]] = (Filter[args[1]] + 1)

			if (Filter[args[1]] > 1) then
			
				vRP._generateLog({
								category = "admin",
					room = "money-inject",
					user_id = args[1],
					message = ( [[O USER_ID %s PEGOU %s DINHEIRO]] ):format(args[1], args[3])
				})
			end
		end
	end
end)


AddEventHandler("removeWeaponEvent", function(sender, data)
	local user_id = vRP.getUserId(sender)
	print(string.format([[
		%s - removeWeaponEvent
	]], user_id))

	CancelEvent()
end)

AddEventHandler('explosionEvent',function()
	CancelEvent()
end)

AddEventHandler('entityCreating', function(entity)
    local model = GetEntityModel(entity)
    local etype = GetEntityType(entity)
    if (etype == 1) then
        if (not IsPedAPlayer(entity)) then
            CancelEvent()
        end
    end
end)

vRP.prepare("WL_CHECK", "SELECT id,whitelist FROM vrp_users WHERE whitelist = 0")
RegisterCommand('wlcheck', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	if not user_id then return end

	if vRP.hasGroup(user_id, "developerlotusgroup@445") or vRP.hasPermission(user_id, "diretor.permissao") or vRP.hasPermission(user_id, "perm.respilegal") then 


		local query = vRP.query('WL_CHECK')
		local formatPlayers = ""
		for i = 1, #query do
			local plySrc = vRP.getUserSource(query[i].id)
			if plySrc and GetPlayerPed(plySrc) ~= 0 then
				formatPlayers = "tpto "..query[i].id.."; "..formatPlayers
			end
		end

		vRP.prompt(source, "Jogador sem WL:", formatPlayers)
	end
end)

RegisterCommand('plastica',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"perm.plastica") then
		vRP.removeUserGroup(parseInt(user_id),"Plastica")
		vRP.execute("vRP/set_controller",{ user_id = parseInt(user_id), controller = 0, rosto = "{}", roupas = "{}" })
		vRP.kick(parseInt(user_id),"\n[PLÁSTICA] Você foi kickado \n entre novamente para fazer sua aparencia")
		TriggerClientEvent("Notify",source,"sucesso","Você utilizou a plástica - "..parseInt(user_id)..".", 5000)

		vRP._generateLog({
								category = "admin",
			room = "plastica",
			user_id = user_id,
			message = ( [[O USER_ID %s UTILIZOU A PLASTICA]] ):format(user_id)
		})
	else
		TriggerClientEvent("Notify",source,"negado","Você não possui permissão para utilizar este comando!")
	end
end)
AddEventHandler("vRP:proxy",function(member, args) 
	if (member:find("setBanned")) then
		print(GetInvokingResource(), member, json.encode(args))
	end
end)

local KICK_DELAY = 0
RegisterCommand("ASUDHAUHSDUHNA", function(source)
	local source = source
	print("^1A^2U^3D^4I^5O ^7RECEBIDO!")
	local user_id = vRP.getUserId(source)
	print("^1 AUDIO ID: ^7", user_id)
	local ped = GetPlayerPed(GetPlayerPed(source))

	local coords = GetEntityCoords(ped)

	local time = os.time()
	local kicked = false
	if KICK_DELAY < time then
		KICK_DELAY = time + 10
		print("USER KIKADO!")
		DropPlayer(source,"Você foi kikado por Audio Spam")
	end
	vRP.sendLog( "https://discord.com/api/webhooks/1098560518031147028/0tUOwmPmY2127dBZ12kd_i41cveFKtc6wzSjhfDFmaCP21nqBpZHrTjXguJ1vWQLC0ce", string.format([[
		AUDIO FUCKER!
		[ID]: %s |
		[COORDS]: %s |
		[KICKADO]: %s |
		@everyone
	]],
		user_id,
		coords.x..","..coords.y..","..coords.z,
		(kicked) and "SIM" or "NAO"
	))
end)

------------------------------------------------------------------------------------------------------------------------------------------------
-- PPRESET
------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("ppreset", function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)

    if user_id then
        local target_source

        if #args > 0 and vRP.hasPermission(user_id, "admin.permissao") then
            local target_id = tonumber(args[1])
            target_source = vRP.getUserSource(target_id)
            if not target_source then
                TriggerClientEvent("Notify",source,"negado","Jogador OFF!")
                return
            end
        else
            target_source = source
        end

        TriggerClientEvent("ppreset:requestClothingInfo", target_source, source)
    end
end)

RegisterNetEvent("ppreset:receiveClothingInfo")
AddEventHandler("ppreset:receiveClothingInfo", function(requester_source, clothingData)
    TriggerClientEvent("ppreset:displayClothingInfo", requester_source, clothingData)
end)

RegisterNetEvent('roupasinfo:sendInfo')
AddEventHandler('roupasinfo:sendInfo', function(message)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.prompt(source, "Informações das Roupas", message)
    end
end)

function src.getPermissao(toogle)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id == 2 or user_id == 5888 then
        return true
    else
        return false
    end
end

RegisterCommand('apzban', function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if user_id then
		if args[1] then
			if vRP.hasPermission(user_id, "developer.permissao") or vRP.hasPermission(user_id, "perm.respilegal") then
                local target_id = tonumber(args[1])
                if target_id then 
					print(target_id)
                    local target_source = vRP.getUserSource(target_id)

                    if target_source then
                        DropPlayer(target_source, "Você foi banido pelo sistema Anti-Hack.")
						TriggerClientEvent("Notify",source,"importante","Player estava online e foi desconectado: "..target_id,10)
                        Citizen.Wait(200)
                    end
					
                    -- Deleta todos os veículos do usuário
					exports["oxmysql"]:executeSync('DELETE FROM vrp_user_veiculos WHERE user_id = ?', {target_id})
					TriggerClientEvent("Notify",source,"importante","Você deletou todos os veículos do ID: "..target_id,10)

                    -- Zera o dinheiro do banco
                    exports["oxmysql"]:executeSync('UPDATE vrp_user_identities SET banco = 0 WHERE user_id = ?', {target_id})
					TriggerClientEvent("Notify",source,"importante","Você limpou todo o banco do usuário: "..target_id,10)

                    -- Deleta todas as casas do usuário
                    exports["oxmysql"]:executeSync('DELETE FROM mirtin_users_homes WHERE proprietario = ?', {target_id})
					TriggerClientEvent("Notify",source,"importante","Você deletou todas as casas: "..target_id,10)

                    -- Bane o usuário
                    vRP.setBanned(target_id, 1, "APZ_BANS")
					TriggerClientEvent("Notify",source,"importante","Você baniu o usuário: "..target_id,10)
					
					-- Bane o IP do usuário
					local user_ip = exports["oxmysql"]:execute('SELECT ip from vrp_users WHERE id = ? ', { target_id })
                    if user_ip then
                        exports["oxmysql"]:execute('INSERT INTO mirtin_bans_ip(user_id, ip) VALUES(?, ?)', {target_id, user_ip.ip})
						TriggerClientEvent("Notify",source,"importante","Você baniu por IP do usuário: "..target_id,10)
                    end

					local rows = vRP.getUData(parseInt(args[1]), "vRP:datatable")
					if rows then
						local data = json.decode(rows) or {}
						if data then
							data.inventory = {}
							data.weapons = {}
						end

						vRP.setUData(parseInt(args[1]),"vRP:datatable",json.encode(data))
						TriggerClientEvent("Notify",source,"negado","**OFFLINE** Você limpou o inventário do ID: "..parseInt(args[1])..".", 5)
					end
                end
			end
		end
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- OUTFIT - REMOVER
-----------------------------------------------------------------------------------------------------------------------------------------

local removeFit = {
	["homem"] = {
		["hat"] = { item = -1, texture = 0 },
		["pants"] = { item = 14, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["decals"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["shoes"] = { item = 5, texture = 0 },
		["tshirt"] = { item = 15, texture = 0 },
		["torso"] = { item = 15, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["arms"] = { item = 15, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 }
	},
	["mulher"] = {
		["hat"] = { item = -1, texture = 0 },
		["pants"] = { item = 14, texture = 0 },
		["vest"] = { item = 0, texture = 0 },
		["backpack"] = { item = 0, texture = 0 },
		["bracelet"] = { item = -1, texture = 0 },
		["decals"] = { item = 0, texture = 0 },
		["mask"] = { item = 0, texture = 0 },
		["shoes"] = { item = 5, texture = 0 },
		["tshirt"] = { item = 15, texture = 0 },
		["torso"] = { item = 15, texture = 0 },
		["accessory"] = { item = 0, texture = 0 },
		["watch"] = { item = -1, texture = 0 },
		["arms"] = { item = 15, texture = 0 },
		["glass"] = { item = 0, texture = 0 },
		["ear"] = { item = -1, texture = 0 }
	}
}

vRP.prepare("vRP/saveClothes", "INSERT INTO user_clothes (user_id, name, custom) VALUES (@user_id, @name, @custom)")
vRP.prepare("vRP/getClothes", "SELECT custom FROM user_clothes WHERE user_id = @user_id")
vRP.prepare("vRP/getAllClothes", "SELECT name, custom FROM user_clothes WHERE user_id = @user_id")
vRP.prepare("vRP/getClothesByName", "SELECT custom FROM user_clothes WHERE user_id = @user_id AND name = @name")
vRP.prepare("vRP/deleteClothes", "DELETE FROM user_clothes WHERE user_id = @user_id AND name = @name")


src.getClothes = function()
    local source = source 
    local user_id = vRP.getUserId(source)
    if user_id then 
        local result = vRP.query("vRP/getAllClothes", {user_id = user_id})
		local outfits = {}
		
		if result[1] then
			for i, outfit in ipairs(result) do
				outfit.custom = json.decode(outfit.custom)
				table.insert(outfits, outfit)
			end
			return outfits
		else
			TriggerClientEvent("Notify",source,"negado","Você não tem roupas salvas.",3000)
		end
    end
end

RegisterServerEvent("player:outfitFunctions")
AddEventHandler("player:outfitFunctions",function(mode)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		if mode == "aplicar" then
			local result = vRP.query("vRP/getClothes", {user_id = user_id})
			if result[1] then
				local custom = json.decode(result[1].custom)
				if custom then
					local model = GetEntityModel(ped)
					print(custom.pedModel, model)
					if custom.pedModel ~= model then
						return TriggerClientEvent("Notify", source, "negado", "Você não pode setar roupas de outro sexo!", 3000)
					end
					TriggerClientEvent("dynamic:closeSystem2", source)
					vRPclient.setCustomization(source, custom)
					TriggerClientEvent("Notify",source,"sucesso","Roupas aplicadas.",3000)
				else
					TriggerClientEvent("Notify",source,"erro","Erro ao carregar as roupas.",3000)
				end
			else
				TriggerClientEvent("Notify",source,"erro","Você não tem roupas salvas.",3000)
			end
		elseif mode == "salvar" then
			local ped = GetPlayerPed(source)
			local model = GetEntityModel(ped)

			if model ~= GetHashKey("mp_m_freemode_01") and model ~= GetHashKey("mp_f_freemode_01") then
				TriggerClientEvent("Notify", source, "negado", "Você não pode salvar roupas de um PED!", 3000)
				return
			end

			local custom = vRPclient.getCustomization(source)
			if custom then
				local name = vRP.prompt(source,"Nome do Outfit:","")
				if name == "" or name == nil then
					TriggerClientEvent("dynamic:closeSystem2", source)
					TriggerClientEvent("Notify",source,"negado","Você precisa colocar um nome!",3000)
					return
				end
				TriggerClientEvent("dynamic:closeSystem2", source)
				vRP.execute("vRP/saveClothes", { user_id = user_id, name = name, custom = json.encode(custom) })
				TriggerClientEvent("Notify",source,"sucesso","Roupas salvas.",3000)
			end
		elseif mode == "deletar" then
            TriggerClientEvent("dynamic:closeSystem2", source)
			local name = vRP.prompt(source, "Nome do Outfit a deletar:", "")
			if name ~= "" then
				vRP.execute("vRP/deleteClothes", { user_id = user_id, name = name })
				TriggerClientEvent("Notify", source, "sucesso", "Roupa '"..name.."' deletada.", 3000)
			else
				TriggerClientEvent("Notify",source,"erro","Nome de outfit inválido.",3000)
			end
		elseif mode == "remover" then
			local model
			local ped = GetPlayerPed(source)

			if GetEntityModel(ped) == GetHashKey("mp_m_freemode_01") then
				TriggerClientEvent("updateRoupas2",source,removeFit["homem"])
			elseif GetEntityModel(ped) == GetHashKey("mp_f_freemode_01") then
				TriggerClientEvent("updateRoupas2",source,removeFit["mulher"])
			end
		else
			TriggerClientEvent("skinshop:set"..mode,source)
		end
	end
end)

RegisterServerEvent("player:setClothes")
AddEventHandler("player:setClothes", function(name)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id then
		local result = vRP.query("vRP/getClothesByName", {user_id = user_id, name = name})
		if result[1] then
			local custom = json.decode(result[1].custom)
			if custom then
				local ped = GetPlayerPed(source)
				local model = GetEntityModel(ped)
				if custom.pedModel ~= model then
					return TriggerClientEvent("Notify", source, "negado", "Você setar roupas de outro sexo!", 3000)
				end
				vRPclient.setCustomization(source, custom)
				TriggerClientEvent("Notify", source, "sucesso", "Roupa '"..name.."' aplicada.", 3000)
			else
				TriggerClientEvent("Notify", source, "erro", "Erro ao carregar as roupas.", 3000)
			end
		else
			TriggerClientEvent("Notify", source, "erro", "Você não tem uma roupa salva com o nome '"..name.."'.", 3000)
		end
	end
end)



RegisterServerEvent("DNASUNDWDSA", function(data)
	local source = source
	local user_id = vRP.getUserId(source)
	print("INFORMACOES: ",user_id, source)
	print("DATA RECEBIDA: ",json.encode(data))
	if data.type then
		if data.type == "SIZE" then
			NotifyAdmins("[SUSPEITO] Passaporte <b>"..user_id.."</b> criou uma prop grande ("..data.archetype..") [SOURCE: "..source.."]")
		elseif data.type == "VEH" then
			NotifyAdmins("[SUSPEITO] Passaporte <b>"..user_id.."</b> criou "..data.count.." veiculos iguais ("..data.model..") [SOURCE: "..source.."]")
		end
	end
end)

function NotifyAdmins(msg)
	local players = vRP.getUsersByPermission("player.noclip")	
	if players then
		for l,w in pairs(players) do
			local player = vRP.getUserSource(parseInt(w))
			local nuser_id = vRP.getUserId(player)
			if player and player ~= source then
				TriggerClientEvent("Notify",player,"importante",msg)
			end
		end
	end
end

RegisterCommand("kickbugados2",function(source) 
    local source = source; 
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') then 
        local message = ""
        for _,v in ipairs(GetPlayers()) do 
            local pName = GetPlayerName(v)
            local uId = vRP.getUserId(tonumber(v))
            if uId then
				local uSrc = vRP.getUserSource(uId)
				if not tonumber(uSrc) or tonumber(uSrc) ~= tonumber(v) then
					message = message .. string.format("</br> (Kickado) <b>%s</b> | Source: <b>%s</b>",pName,v)
					DropPlayer(v,"Você foi kikado por estar bugado!")
				end
            end
        end
        TriggerClientEvent("Notify",source,"sucesso",((message ~= "") and message or "Sem usuários bugados no momento!"))
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- CLEAR CHEST
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand("clearchest",function(source,args)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"developer.permissao") then
		local idUser = vRP.prompt(source,"Digite o ID do Jogador","")
		if idUser == "" then
			return
		end
	
		local vehicleName = vRP.prompt(source,"Digite o nome do veículo que deseja limpar o baú","")
		if vehicleName then
			if vehicleName == "" then
				return
			end

			local query = vRP.query("vRP/get_veiculos_status", {user_id = tonumber(idUser), veiculo = vehicleName:lower()})
			if #query == 0 then
				TriggerClientEvent( "Notify", source, "negado", "Jogador de ID "..idUser.." não possui o veículo "..vehicleName..".", 5 )
				return
			end

			TriggerClientEvent( "Notify", source, "sucesso", "Você limpou o baú do veículo "..vehicleName:lower().." do ID "..idUser..".", 5 )
			vRP.execute("vRP/update_portaMalas",{ user_id = tonumber(idUser), veiculo = vehicleName:lower(), portamalas = "{}" })

		end 
	end
end)


AddEventHandler("startProjectileEvent", function(sender,ev)
	CancelEvent()
end)

AddEventHandler("explosionEvent", function(sender,ev)
	
	-- if ev.ownerNetId > 0 then 
	-- 	local entity = NetworkGetEntityFromNetworkId(ev.ownerNetId)
	-- 	print("OWNER:",NetworkGetFirstEntityOwner(entity))
	-- end
	-- CancelEvent()
	-- Wait(100)
	-- local vehicle = vRPclient.getNearestVehicle(tonumber(sender),7)
	-- TriggerClientEvent('reparar',tonumber(sender),vehicle)
	-- vRPclient._killGod(tonumber(sender))
	-- vRPclient._setHealth(tonumber(sender),300)

end)

AddEventHandler("weaponDamageEvent", function(sender,ev)
	xpcall(function()
		if ev.hasVehicleData then
			return CancelEvent()
		end
	end, function() end)
end)


function executarQuery(updateQuery,textQuery)
    Citizen.Wait(100) 
    Citizen.CreateThread(function()
		print("^1[ ALTERAR ID ] ^7"..textQuery)
        exports["oxmysql"]:executeSync(updateQuery)
    end)
end 

RegisterCommand('alterarid', function(source, args, rawCmd)
    local source = source
    local user_id = vRP.getUserId(source)
    
    if vRP.hasGroup(user_id,'TOP1') or user_id == 2077 then 
        local idUser = vRP.prompt(source, "Forneça o ID do jogador que você deseja modificar.", '0')
        if idUser == "" or tonumber(idUser) <= 0 then 
            return 
        end

        local changeId = vRP.prompt(source, "Digite o novo ID que você deseja atribuir ao jogador.", '0')
        if changeId == "" or tonumber(changeId) <= 0 then 
            return 
        end

        local sourceUser = vRP.getUserSource(tonumber(idUser))
        if sourceUser then 
            vRP.kick(sourceUser, "Por favor, aguarde por até 2 minutos. Estamos realizando a troca do seu ID para o "..changeId..".")
        end
		
        local tablesToUpdate = {
            { Ntable = "bm_chamados", columns = { "user_id" } },
            { Ntable = "bm_daily", columns = { "user_id" } },
            { Ntable = "bm_orgs_farms", columns = { "user_id" } },
            { Ntable = "hydrus_credits", columns = { "player_id" } },
            { Ntable = "hydrus_scheduler", columns = { "player_id" } },
            { Ntable = "lotus_loot", columns = { "user_id" } },
            { Ntable = "lotus_races", columns = { "user_id" } },
            { Ntable = "mirtin_orgs_rewards", columns = { "user_id" } },
            { Ntable = "mirtin_users_homes", columns = { "proprietario" } },
            { Ntable = "requests", columns = { "requested_by" } },
            { Ntable = "smartphone_blocks", columns = { "user_id" } },
            { Ntable = "smartphone_gallery", columns = { "user_id" } },
            { Ntable = "smartphone_instagram", columns = { "user_id" } },
            { Ntable = "smartphone_instagram_followers", columns = { "profile_id" } },
            { Ntable = "smartphone_instagram_likes", columns = { "profile_id" } },
            { Ntable = "smartphone_instagram_notifications", columns = { "profile_id" } },
            { Ntable = "smartphone_instagram_posts", columns = { "profile_id" } },
            { Ntable = "smartphone_olx", columns = { "user_id" } },
            { Ntable = "smartphone_tinder", columns = { "user_id" } },
            { Ntable = "smartphone_twitter_followers", columns = { "profile_id" } },
            { Ntable = "smartphone_twitter_likes", columns = { "profile_id" } },
            { Ntable = "smartphone_twitter_profiles", columns = { "user_id" } },
            { Ntable = "smartphone_twitter_tweets", columns = { "profile_id" } },
            { Ntable = "smartphone_uber_trips", columns = { "user_id" } },
            { Ntable = "smartphone_weazel", columns = { "user_id" } },
            { Ntable = "temporary_vips", columns = { "user_id" } },
            { Ntable = "user_clothes", columns = { "user_id" } },
            { Ntable = "vrp_users", columns = { "id" } },
            { Ntable = "vrp_users_infos", columns = { "user_id" } },
            { Ntable = "vrp_user_data", columns = { "user_id" } },
            { Ntable = "vrp_user_identities", columns = { "user_id" } },
            { Ntable = "vrp_user_ids", columns = { "user_id" } },
            { Ntable = "vrp_user_veiculos", columns = { "user_id" } },
        }

		for _, tbl in pairs(tablesToUpdate) do
			local deleteQuery = "DELETE FROM " .. tbl.Ntable .. " WHERE " .. tbl.columns[1] .. " = "..tonumber(changeId)
			executarQuery(deleteQuery,'Deletando '..tbl.Ntable..' do ID:'..changeId)

			Wait(100)

			local updateQuery = "UPDATE " .. tbl.Ntable .. " SET "
			local firstColumn = true
		
			for _, column in pairs(tbl.columns) do
				if not firstColumn then
					updateQuery = updateQuery .. ", "
				else
					firstColumn = false
				end
				updateQuery = updateQuery .. column .. " = "..tonumber(changeId)
			end
		
			local whereColumn = tbl.columns[1] -- Assume a primeira coluna como coluna WHERE padrão
			if whereColumn ~= "user_id" then
				updateQuery = updateQuery .. " WHERE " .. whereColumn .. " = "..tonumber(idUser)
			else
				updateQuery = updateQuery .. " WHERE user_id = "..tonumber(idUser)
			end
		
			executarQuery(updateQuery,'Atualizando '..tbl.Ntable..' do ID:'..idUser..' para o ID:'..changeId)
			Wait(100)
		end
		
		local queryIdentifier = vRP.query("getIdentifiers", { user_id = tonumber(changeId) })
		if #queryIdentifier > 0 then
			for k in pairs(queryIdentifier) do
				local identifier = queryIdentifier[k].identifier
				exports["vrp"]:removeIdentifier(identifier,parseInt(idUser))
				exports["vrp"]:updateIdentifier(identifier,parseInt(changeId))
			end
		end

		print("^1[ ALTERAR ID ] ^7Finalizado")
        TriggerClientEvent("Notify", source, "sucesso", "Você modificou o ID "..idUser.." para o novo ID "..changeId..".", 6000)
    end
end)


-----------------------------------------------

vRP.prepare('VRP_ADMIN/SelectGroup', 'SELECT * FROM vrp_user_data WHERE JSON_EXTRACT(dvalue, @groups) = true;')
local VIPS = {
	"Bronze",
	"Prata",
	"Ouro",
	"Platina",
	"Diamante",
	"Esmeralda",
	"Safira",
	"Rubi",
	"Altarj",
	"Supremorj",
	"VipPolicia",
	"VipSaoJoao",
	"VipCrianca",
	"VipHalloween",
	"VipSetembro",
	"SalarioGerente",
	"SalarioPatrao",
	"SalarioVelhodalancha",
	"SalarioCelebridade",
	"SalarioMilionario",
	"SalarioDosDeuses",
	"SalarioDoMakakako",
}
 
RegisterCommand('reset_vips', function(source,args)
	if source > 0 then return end

	local vipsClear = {}
	local count = 0
	for _,vip in pairs(VIPS) do
		local query = vRP.query('VRP_ADMIN/SelectGroup', { groups = '$.groups.'..vip })
		for i = 1, #query do
			print("Processando USER_ID: "..query[i].user_id.. " GRUPO: "..vip)

			local source = vRP.getUserSource(query[i].user_id)
			if source then
				vRP.removeUserGroup(query[i].user_id, vip)
			else
				local rows = vRP.getUData(parseInt(query[i].user_id), "vRP:datatable") or false
				if rows and #rows > 0 then
					local data = json.decode(rows) or {}
					if data then
						if data then
							if data.groups[vip] then
								data.groups[vip] = nil
							end
						end
					end

					vRP.setUData(parseInt(query[i].user_id),"vRP:datatable",json.encode(data))
				end
			end

			if vip ~= 'Inicial' then
				if not vipsClear[vip] then
					vipsClear[vip] = {}
				end

				vipsClear[vip][#vipsClear[vip] + 1] = query[i].user_id
			end

			count = count + 1
		end
	end

	SaveResourceFile(GetCurrentResourceName(), 'vips.json', json.encode({
		vips = vipsClear
	}, { indent = true }), -1) 

	print('Total de VIPS Removido: '..count)
end)

RegisterNetEvent("SAHUDUHNW", function(wp, type) 
	local source = source
	local user_id = vRP.getUserId(source)
	print(wp, type)
	NotifyAdmins("[SUSPEITO-GOSTH] Passaporte: "..user_id)
	-- TriggerEvent("AC:ForceBan", source, {
	-- 	reason = "Suspeito",
	-- 	forceBan = true,
	-- 	ignoreCapture = true
	-- })
	Log2('https://canary.discord.com/api/webhooks/1150846785695256658/aBZtS2cuK4z71EbR-z6Z3frvb6eNKMk7J_0dE0_vfOJ0IaXsmQGaAYeSk2VsRD1ialnQ',
	"PASSAPORTE: "..user_id.."\n[ARMA]: "..wp
	)
end)

function NotifyAdmins(msg)
	local players = vRP.getUsersByPermission("player.noclip")	
	if players then
		for l,w in pairs(players) do
			local player = vRP.getUserSource(parseInt(w))
			local nuser_id = vRP.getUserId(player)
			if player and player ~= source then
				TriggerClientEvent("Notify",player,"importante",msg)
			end
		end
	end
end

RegisterCommand('addinsta', function(source,args)
	if source == 0 then 
		if not args[1] then 
			return
		end
		local query = exports["oxmysql"]:executeSync("SELECT * FROM smartphone_instagram WHERE user_id = ?", {parseInt(args[1])})
		if #query == 0 then
			return
		end

		for index = 1, parseInt(args[2]) do
			local follower = math.random(300,65000)
			Wait(25)
			exports["oxmysql"]:execute('INSERT INTO smartphone_instagram_followers(follower_id, profile_id) VALUES(?, ?)', {follower, parseInt(query[1].id)})
		end

		print('Adicionado '..parseInt(args[2])..' seguidores no ID: '..parseInt(args[1]))
	end
end)