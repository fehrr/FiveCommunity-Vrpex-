local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("vrp_policia",src)
Proxy.addInterface("vrp_policia",src)

vCLIENT = Tunnel.getInterface("vrp_policia")

local idgens = Tools.newIDGenerator()

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Itens Ilegais
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local blackItens = {
	"algemas",
	"chave_algemas",
	"c4",
	--"bolsadinheiro",
	"masterpick",
	"pendrive",
	"furadeira",
	"lockpick",
	"m-aco",
	"m-capa_colete",
	"m-corpo_ak47_mk2",
	"m-corpo_g3",
	"m-corpo_machinepistol",
	"m-corpo_pistol_mk2",
	"m-corpo_shotgun",
	"m-corpo_smg_mk2",
	"m-corpo_snspistol_mk2",
	"m-gatilho",
	"capsulas",
	"polvora",
	"pecadearma",
	"metal",
	"molas",
	"gatilho",
	"m-malha",
	"aluminio",
	"m-tecido",
	"c-cobre",
	"c-ferro",
	"c-fio",
	"c-polvora",
	"l-alvejante",
	"folhamaconha",
	"maconha",
	"haxixe",
	"lancaperfume",
	"resinacannabis",
	"pastabase",
	"cocaina",
	"acidolsd",
	"body_armor",
	"capuz",
	"dirty_money",
	"scubagear",
	"relogioroubado",
	"colarroubado",
	"anelroubado",
	"brincoroubado",
	"pulseiraroubada",
	"carnedepuma",
	"carnedelobo",
	"carnedejavali",
	"lsd",
	"morfina",
	"heroina",
	"opio",
	"anfetamina",
	"metanfetamina",
	"tartaruga",
	"balinha",
	"WEAPON_SNSPISTOL_MK2",
	"AMMO_SNSPISTOL_MK2",
	"WEAPON_PISTOL_MK2",
	-- "WEAPON_PISTOL",
	-- "AMMO_PISTOL",
	"WEAPON_MILITARYRIFLE",

	
	"WEAPON_FIREWORK",
	"WEAPON_SNOWBALL",
	"WEAPON_BZGAS",

	"WEAPON_GUSENBERG",
	"WEAPON_PISTOL50",
	"WEAPON_HATCHET",
	"AMMO_PISTOL_MK2",
	"WEAPON_COMBATPISTOL",
	"WEAPON_COMBATPDW",
	"AMMO_COMBATPISTOL",
	"WEAPON_MACHINEPISTOL",
	"AMMO_MACHINEPISTOL",
	"WEAPON_SMG_MK2",
	"AMMO_SMG_MK2",
	"WEAPON_SMG",
	"AMMO_SMG",
	"WEAPON_ASSAULTSMG",
	"WEAPON_MICROSMG",
	"AMMO_ASSAULTSMG",
	"WEAPON_SAWNOFFSHOTGUN",
	"AMMO_SAWNOFFSHOTGUN",
	"WEAPON_PUMPSHOTGUN_MK2",
	"AMMO_PUMPSHOTGUN_MK2",
	"WEAPON_ASSAULTRIFLE_MK2",
	"AMMO_ASSAULTRIFLE_MK2",
	"WEAPON_ASSAULTRIFLE",
	"AMMO_ASSAULTRIFLE",
	"AMMO_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_SPECIALCARBINE_MK2",
	"AMMO_SPECIALCARBINE_MK2",
	"WEAPON_CARBINERIFLE",
	"AMMO_CARBINERIFLE",
	"WEAPON_CARBINERIFLE_MK2",
	"AMMO_CARBINERIFLE_MK2",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_PARAFAL",
	"AMMO_SPECIALCARBINE",
	"WEAPON_STUNGUN",
	"WEAPON_PETROLCAN",
	"AMMO_PETROLCAN",
	"AMMO_BZGAS",
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PEGAR RG
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local choice_pedirrg = {function(source,choice)
    local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,4)
	if user_id then
		if nplayer then
			local nuser_id = vRP.getUserId(nplayer)
			local identity = vRP.getUserIdentity(nuser_id)
			local carteira = vRP.getMoney(nuser_id)
			local trabalho = vRP.getUserGroupByType(nuser_id, "job") if (trabalho == nil or trabalho == "") or (trabalho == "Vendedor de Drogas" or trabalho == "Traficante de Tartartuga" or trabalho == "Hacker" or trabalho == "Cacador" or trabalho == "Clandestino") then trabalho = "Desempregado" end

			if vCLIENT.enviarIdentidade(source, true, identity.user_id, identity.nome,identity.sobrenome,identity.idade,identity.registro,identity.telefone,vRP.format(carteira),trabalho) then
				TriggerClientEvent("Notify",nplayer,"importante","O Policial esta checando seu documento.", 5)
				if vRP.request(source, "Deseja fechar a identidade do individuo?", 120) then
					vCLIENT._enviarIdentidade(source, false) else vCLIENT.enviarIdentidade(source, false)
				end
            end
        else
            TriggerClientEvent("Notify",source,"negado","Nenhum jogador proximo.", 5)
		end
	end
end}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ALGEMAR
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local choice_algemar = {function(source,choice)
    local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local nplayer = vRPclient.getNearestPlayer(source,3)
		if GetEntityHealth(GetPlayerPed(source)) <= 105 then return end

		if nplayer then
			if not vCLIENT.checkAnim(nplayer) and not vRP.hasPermission(user_id, "admin.permissao") then
				TriggerClientEvent("Notify",source,"importante","O jogador não está rendido.", 5)
				return
			end
			
			if vRP.getInventoryItemAmount(user_id, "algemas") >= 1 or vRP.hasPermission(user_id, "perm.core") or vRP.hasPermission(user_id, "perm.policiafederal") or vRP.hasPermission(user_id, "perm.policiacivil") or vRP.hasPermission(user_id, "perm.policia") or vRP.hasPermission(user_id, "admin.permissao") or vRP.hasPermission(user_id, "moderador.permissao") or vRP.hasPermission(user_id,"suporte.permissao") then
				if vRPclient._isHandcuffed(nplayer) then
					TriggerClientEvent("vrp_sound:source",source,'uncuff',0.4)
					TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.4)
					vRPclient._setHandcuffed(nplayer, false)
				else
					vCLIENT.arrastar(nplayer,source)
					vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
					vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
					SetTimeout(3500,function()
						vRPclient._stopAnim(source,false)
						vRPclient._toggleHandcuff(nplayer)
						vCLIENT._arrastar(nplayer,source)
						TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
						TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
						vRPclient._setHandcuffed(nplayer, true)
					end)
				end
			end
		end
	end
end} 


function src.algemar(inZone)
	local source = source
    local user_id = vRP.getUserId(source)
	if user_id ~= nil then		
		if vRP.getInventoryItemAmount(user_id, "algemas") >= 1 or vRP.hasPermission(user_id, "perm.algemar") or vRP.hasPermission(user_id, "perm.unizk") or vRP.hasPermission(user_id, "perm.judiciario") or vRP.hasPermission(user_id, "perm.core") or vRP.hasPermission(user_id, "perm.core") or vRP.hasPermission(user_id, "perm.policiafederal") or vRP.hasPermission(user_id, "perm.policiacivil") or vRP.hasPermission(user_id, "perm.policia") or vRP.hasPermission(user_id, "admin.permissao") or vRP.hasPermission(user_id, "moderador.permissao") or vRP.hasPermission(user_id," suporte.permissao") then
			local nplayer = vRPclient.getNearestPlayer(source,3)
			if GetEntityHealth(GetPlayerPed(source)) <= 105 then return end

			if nplayer then

				if not vCLIENT.checkAnim(nplayer) and not vRP.hasPermission(user_id, "perm.algemar") then
					TriggerClientEvent("Notify",source,"importante","O jogador não está rendido.", 5)
					return
				end

				if inZone then 
					if vRP.hasPermission(user_id,'admin.permissao') or vRP.hasPermission(user_id,'moderador.permissao') or vRP.hasPermission(user_id,'suporte.permissao') then 
						if not vRPclient.isInVehicle(nplayer) then
							if vRPclient.isHandcuffed(nplayer) then
								TriggerClientEvent("vrp_sound:source",source,'uncuff',0.4)
								TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.4)
								vRPclient._setHandcuffed(nplayer, false)
							else
								vCLIENT._arrastar(nplayer,source)
								vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
								vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
								SetTimeout(3500,function()
									vRPclient._stopAnim(source,false)
									vRPclient._toggleHandcuff(nplayer)
									vCLIENT._arrastar(nplayer,source)
									TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
									TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
									vRPclient._setHandcuffed(nplayer, true)
								end)
							end
						end
					else
						TriggerClientEvent("Notify",source,"importante","O jogador está em uma safezone.", 5)
					end
				else
					if not vRPclient.isInVehicle(nplayer) then
						if vRPclient.isHandcuffed(nplayer) then
							TriggerClientEvent("vrp_sound:source",source,'uncuff',0.4)
							TriggerClientEvent("vrp_sound:source",nplayer,'uncuff',0.4)
							vRPclient._setHandcuffed(nplayer, false)
						else
							vCLIENT._arrastar(nplayer,source)
							vRPclient._playAnim(source,false,{{"mp_arrest_paired","cop_p2_back_left"}},false)
							vRPclient._playAnim(nplayer,false,{{"mp_arrest_paired","crook_p2_back_left"}},false)
							SetTimeout(3500,function()
								vRPclient._stopAnim(source,false)
								vRPclient._toggleHandcuff(nplayer)
								vCLIENT._arrastar(nplayer,source)
								TriggerClientEvent("vrp_sound:source",source,'cuff',0.1)
								TriggerClientEvent("vrp_sound:source",nplayer,'cuff',0.1)
								vRPclient._setHandcuffed(nplayer, true)
							end)
						end
					end
				end				
			end
		end
	end
end

RegisterCommand('soltarh', function(source,args)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source, 3)
	if user_id and nplayer then
		if vRP.hasPermission(user_id, "perm.resppolicia") or vRP.hasPermission(user_id, "diretor.permissao") or vRP.hasPermission(user_id, "perm.respilegal")  then
			vCLIENT._arrastar(source,nplayer)
		end
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RETIRAR MASCARA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local choice_rmascara = {function(source,choice)
    local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local nplayer = vRPclient.getNearestPlayer(source,3)
		if nplayer then
			vCLIENT._retirarMascara(nplayer)
		else
			TriggerClientEvent("Notify",source,"negado","Nenhum jogador proximo.", 5)
		end
	end
end} 

RegisterCommand('rmascara',function(source,args,rawCommand)
    local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"perm.policia") or vRP.hasPermission(user_id,"perm.unizk") or vRP.hasPermission(user_id,"perm.bombeiro") then
		if user_id ~= nil then
			local nplayer = vRPclient.getNearestPlayer(source,3)
			if nplayer then
				vCLIENT._retirarMascara(nplayer)
			else
				TriggerClientEvent("Notify",source,"negado","Nenhum jogador proximo.", 5)
			end
		end
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ARRASTAR
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local choice_arrastar = {function(source,choice)
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local nplayer = vRPclient.getNearestPlayer(source,3)
		if nplayer then
			if vRP.hasPermission(user_id, "perm.policia") or vRP.hasPermission(user_id,"perm.unizk") then
				if not vRP.checkPatrulhamento(user_id) then
					return
				end
			end
			
			vCLIENT._arrastar(nplayer,source)
		else
			TriggerClientEvent("Notify",source,"negado","Nenhum jogador proximo.", 5)
		end
	end
end}

function src.arrastar(inZone)
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		local allowedPermissions = {
            "perm.arrastar", "perm.arrastaraltacustoms", "perm.arrastarmecanica",
            "perm.jornal", "perm.policia", "perm.judiciario", "perm.policiafederal",
            "perm.core", "perm.policiacivil", "admin.permissao", "moderador.permissao",
            "suporte.permissao", "perm.unizk", "perm.core", "perm.prf", "perm.bombeiro"
        }
		
		local hasPermission = false
        for _, permission in ipairs(allowedPermissions) do
            if vRP.hasPermission(user_id, permission) then
                hasPermission = true
                break
            end
        end

		if hasPermission then
			if GetEntityHealth(GetPlayerPed(source)) <= 105 then return end
			if inZone then 
				if vRP.hasPermission(user_id,'admin.permissao') or vRP.hasPermission(user_id,'moderador.permissao') or vRP.hasPermission(user_id,'suporte.permissao') or vRP.hasPermission(user_id,'perm.unizk') or vRP.hasPermission(user_id,'perm.arrastaraltacustoms') or vRP.hasPermission(user_id,'perm.arrastarmecanica') or vRP.hasPermission(user_id, "perm.bombeiro") or vRP.hasPermission(user_id,'perm.policia') then 
					local nplayer = vRPclient.getNearestPlayer(source,3)
					if nplayer then
						vCLIENT._arrastar(nplayer,source)
					end
				else
					TriggerClientEvent("Notify",source,"importante","O jogador está em uma safezone.", 5)
				end
			else
				local nplayer = vRPclient.getNearestPlayer(source,3)
				if nplayer then
					vCLIENT._arrastar(nplayer,source)
				end
			end
			-- if vRP.hasPermission(user_id, "perm.policia") then 
			-- 	if not vRP.checkPatrulhamento(user_id) then
			-- 		return
			-- 	end
			-- else 
				
			--end
		end
	end
end

function src.arrastar2()
	local source = source
	local user_id = vRP.getUserId(source)
	if user_id ~= nil then
		if vRP.hasPermission(user_id, "developer.permissao") then
			if GetEntityHealth(GetPlayerPed(source)) <= 105 then return end

			-- if vRP.hasPermission(user_id, "perm.policia") then 
			-- 	if not vRP.checkPatrulhamento(user_id) then
			-- 		return
			-- 	end
			-- else 
				local nplayer = vRPclient.getNearestPlayer(source,3)
				if nplayer then
					vCLIENT._arrastar2(nplayer,source)
				end
			--end
		end
	end
end


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COLOCAR NO VEICULO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local choice_colocarveh = {function(source,choice)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,4)
	if user_id then
		if nplayer then
			if vRPclient.isHandcuffed(nplayer) then
				vRPclient._putInNearestVehicleAsPassenger(nplayer, 5)
				TriggerClientEvent("Notify",source,"sucesso","Voce colocou o cidadao no veiculo.", 5)
			else
				TriggerClientEvent("Notify",source,"negado","O Jogador não está algemado.", 5)
			end
		else
			TriggerClientEvent("Notify",source,"negado","Nenhum jogador proximo.", 5)
		end
	end
end}

RegisterCommand('cv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,4)
	if vRP.hasPermission(user_id,"perm.policia") or vRP.hasPermission(user_id,"perm.unizk") or vRP.hasPermission(user_id,"perm.bombeiro") or vRP.hasPermission(user_id,"admin.permissao") then 
		if user_id then
			if nplayer then
				if vRPclient.isHandcuffed(nplayer) then
					vRPclient._putInNearestVehicleAsPassenger(nplayer, 5)
					TriggerClientEvent("Notify",source,"sucesso","Voce colocou o cidadao no veiculo.", 5)
				else
					TriggerClientEvent("Notify",source,"negado","O Jogador não está algemado.", 5)
				end
			else
				TriggerClientEvent("Notify",source,"negado","Nenhum jogador proximo.", 5)
			end
		end
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RETIRAR DO VEICULO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local choive_retirarveh = {function(source,choice)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,4)
	if user_id then
		if nplayer then
			if vRPclient.isHandcuffed(nplayer) then
				vRPclient._ejectVehicle(nplayer, {})
				TriggerClientEvent("Notify",source,"negado","Voce retirou o cidadao no veiculo.", 5)
			else
				TriggerClientEvent("Notify",source,"negado","O Jogador não está algemado.", 5)
			end
		else
			TriggerClientEvent("Notify",source,"negado","Nenhum jogador proximo.", 5)
		end
	end
end}

RegisterCommand('rv',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,4)
	if vRP.hasPermission(user_id,"perm.policia") or vRP.hasPermission(user_id,"perm.unizk") or vRP.hasPermission(user_id,"perm.bombeiro") or vRP.hasPermission(user_id,"admin.permissao") then 
		if user_id then
			if nplayer then
				if vRPclient.isHandcuffed(nplayer) then
					vRPclient._ejectVehicle(nplayer, {})
					TriggerClientEvent("Notify",source,"negado","Voce retirou o cidadao no veiculo.", 5)
				else
					TriggerClientEvent("Notify",source,"negado","O Jogador não está algemado.", 5)
				end
			else
				TriggerClientEvent("Notify",source,"negado","Nenhum jogador proximo.", 5)
			end
		end
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- APREENDER ITENS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local choice_apreenderitens = {function(source,choice)
	local user_id = vRP.getUserId(source)
	local nplayer = vRPclient.getNearestPlayer(source,4)
	local nuser_id = vRP.getUserId(nplayer)
	if user_id then
		local status, time = exports['vrp']:getCooldown(user_id, "choice_apreenderitens")
		if status then
			exports['vrp']:setCooldown(user_id, "choice_apreenderitens", 60)
			-- if vRPclient._isHandcuffed(nplayer) then

				if nplayer then
					for k,v in pairs(blackItens) do
						if vRP.getInventoryItemAmount(nuser_id, v) > 0 then
							vRP.tryGetInventoryItem(nuser_id, v, vRP.getInventoryItemAmount(nuser_id, v), true)
						end
					end

					vRPclient._giveWeapons(nplayer, {}, true)
					vCLIENT._updateWeapons(nplayer)

					TriggerClientEvent("Notify",nplayer,"negado","Seus Itens ilegais foram apreendidos.", 5)
					TriggerClientEvent("Notify",source,"sucesso","Você aprendeu os itens ilegais.", 5)
				else
					TriggerClientEvent("Notify",source,"negado","Nenhum jogador proximo.", 5)
				end
			-- else
			-- 	TriggerClientEvent("Notify",source,"negado","Player não está algemado", 5)
			-- end
		else
			TriggerClientEvent("Notify",source,"negado","Você está em cooldown: "..time.."s", 5)
		end
	end
end}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONSULTAR VEICULO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local choice_consultarveh = {function(source,choice)
    local user_id = vRP.getUserId(source)
	if user_id then
		local mPlaca,mName = vRPclient.ModelName(source, 5)
		local nuser_id = vRP.getUserByRegistration(mPlaca)
		if nuser_id then
			local identity = vRP.getUserIdentity(nuser_id)
			if identity then
				TriggerClientEvent("Notify",source,"importante","• Veiculo: <b>"..mName.."</b><br>• Placa: <b>"..mPlaca.."</b><br>• Proprietario: <b>"..identity.nome.. " "..identity.sobrenome.. "</b> (<b>"..identity.idade.."</b>)<br>• Telefone: <b>"..identity.telefone.."</b> <br>• Passaporte: <b>"..identity.user_id.."</b> ", 10)
			end
		else
			TriggerClientEvent("Notify",source,"negado","Não foi possivel consultar esse veiculo.", 5)
		end
	end
end}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- APREENDER VEICULO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local choice_apv = {function(source,choice)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasGroup(user_id, "Aluno") or vRP.hasGroup(user_id, "Recruta") then
			TriggerClientEvent("Notify",source,"negano","Você não pode fazer isto!")
			return false
		end

		local mPlaca,mName,mNetVeh = vRPclient.ModelName(source, 5)
		local nuser_id = vRP.getUserByRegistration(mPlaca)
		local rows = vRP.query("vRP/get_veiculos_status", {user_id = nuser_id, veiculo = mName})

		if nuser_id then
			local identity = vRP.getUserIdentity(nuser_id)
			
			if identity then
				if #rows > 0 and rows[1] and rows[1].status == 0 then
					vRP.execute("vRP/set_status",{ user_id = nuser_id, veiculo = mName, status = 1})

					local rows2 = vRP.query("vRP/get_portaMalas",{ user_id = nuser_id, veiculo = mName })
					local malas = json.decode(rows2[1].portamalas) or {}

					if #rows2 > 0 then
						local textLog = "ID " .. user_id .. " apreendeu:"

						for item, data in pairs(malas) do
							local amount = data.amount
							local itemName = vRP.getItemName(data.item)
					
							textLog = textLog .. "\n" .. amount .. "x " .. itemName
						end

						textLog = textLog .. " do veículo " ..mName.. " placa "..mPlaca

					
						vRP.sendLog("https://discord.com/api/webhooks/1136549444893036674/hkt-2sog-Hlghr56F0I6t-z9mSj5eogUB7MPAxRStpuidMIrOQcvHhm47Cn6lOArdBAq", textLog)

						exports['bm_module']:deleteVehicle(source, vRPclient.getNearestVehicle(source, 5))
						vRP.execute("vRP/update_portaMalas",{ user_id = nuser_id, veiculo = mName, portamalas = '{}' })
					end
					
					
					vRP.log("logs/querys/"..os.date("%d-%m-%Hh")..".txt", "Vitima: "..nuser_id.. " Apreendeu: "..user_id.. "  Veiculo: "..mName)
					TriggerClientEvent("Notify",source,"importante","<b> VEICULO APREENDIDO: </b> <br>• Veiculo: <b>"..mName.."</b><br>• Placa: <b>"..mPlaca.."</b><br>• Proprietario: <b>"..identity.nome.. " "..identity.sobrenome.. "</b> (<b>"..identity.idade.."</b>)<br>• Telefone: <b>"..identity.telefone.."</b> ", 15)
				else
					TriggerClientEvent("Notify",source,"importante","Este veiculo ja se encontra apreendido ", 5)
				end
			end

		end
	end
end}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MULTAR
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local choice_multar = {function(source,choice)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasGroup(user_id, "Aluno") or vRP.hasGroup(user_id, "Recruta") then
			TriggerClientEvent("Notify",source,"negano","Você não pode fazer isto!")
			return false
		end


		local nplayer = vRPclient.getNearestPlayer(source,4)
		local nuser_id = vRP.getUserId(nplayer)
		if nplayer then
			local valorMulta = vRP.prompt(source, "Digite o valor da Multa: ", "")

			if tonumber(valorMulta) >= 1 and tonumber(valorMulta) <= 500000 then
				local motivoMulta = vRP.prompt(source, "Digite o motivo da Multa: ", "")
				if motivoMulta ~= nil and motivoMulta ~= "" then
					TriggerClientEvent("Notify",source,"importante","Você multou o cidadao em <b>$ "..vRP.format(valorMulta).."</b>", 5)
					TriggerClientEvent("Notify",nplayer,"importante","Você foi multado no valor de <b>$ "..vRP.format(valorMulta).."</b> pelo motivo <b>"..motivoMulta.."</b>", 5)
					vRP.execute("vRP/add_multa",{ user_id = nuser_id, multas = tonumber(valorMulta) })
					src.adicionarCriminal(nuser_id, "MULTA", motivoMulta)
					vRP.sendLog("", "O "..user_id.." Multou o ID: "..nuser_id.." no valor de: R$ "..valorMulta)
				else
					TriggerClientEvent("Notify",source,"importante","Digite um motivo correto", 5)
				end
			else
				TriggerClientEvent("Notify",source,"importante","Digite um valor correto entre 1-500000 ", 5)
			end
		end
	end
end}

RegisterCommand('multarem',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"developer.permissao") then
			if args[1] then
				local nplayer = vRP.getUserSource(parseInt(args[2]))
				local nuser_id = vRP.getUserId(nplayer)
				if nplayer then
					TriggerClientEvent("Notify",source,"importante","A multa foi removida!", 5)
					TriggerClientEvent("Notify",nplayer,"importante","Sua multa total foi removida!", 5)
					vRP.execute("vRP/add_multa",{ user_id = nuser_id, multas = tonumber(0) })
				else
					TriggerClientEvent("Notify",source,"negado","O mesmo não se encontra na cidade!")
				end
			end
		end
	end
end)

RegisterCommand('multar',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if user_id then
		if vRP.hasPermission(user_id,"perm.unizk") then
			local nplayer = vRPclient.getNearestPlayer(source,4)
			local nuser_id = vRP.getUserId(nplayer)
			if nplayer then
				local valorMulta = vRP.prompt(source, "Digite o valor da Multa: ", "")

				if tonumber(valorMulta) >= 1 and tonumber(valorMulta) <= 500000 then
					local motivoMulta = vRP.prompt(source, "Digite o motivo da Multa: ", "")
					if motivoMulta ~= nil and motivoMulta ~= "" then
						TriggerClientEvent("Notify",source,"importante","Você multou o cidadao em <b>$ "..vRP.format(valorMulta).."</b>", 5)
						TriggerClientEvent("Notify",nplayer,"importante","Você foi multado no valor de <b>$ "..vRP.format(valorMulta).."</b> pelo motivo <b>"..motivoMulta.."</b>", 5)
						vRP.execute("vRP/add_multa",{ user_id = nuser_id, multas = tonumber(valorMulta) })
						src.adicionarCriminal(nuser_id, "MULTA", motivoMulta)
					else
						TriggerClientEvent("Notify",source,"importante","Digite um motivo correto", 5)
					end
				else
					TriggerClientEvent("Notify",source,"importante","Digite um valor correto entre 1-500000 ", 5)
				end
			end
		end
	end
end)

RegisterCommand('limparficha',function(source,args,rawCommand)
	local user_id = vRP.getUserId(source)
	if vRP.hasPermission(user_id,"admin.permissao") then
		if user_id then
			local nuser_id = tonumber(args[1])
			if nuser_id ~= nil then
				local gCriminal = {}
				vRP.execute("vRP/add_criminal",{ user_id = nuser_id, criminal = json.encode(gCriminal) })
				TriggerClientEvent("Notify",source,"sucesso","Você limpo a ficha do (ID: "..nuser_id..") .", 5)
			end
		end
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FICHA CRIMINAL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.adicionarCriminal(user_id, tipo, criminal)
	local source = vRP.getUserSource(user_id)
	local cCriminal = vRP.query("vRP/get_user_identity",{ user_id = user_id })
	local gCriminal = json.decode(cCriminal[1].criminal) or nil
	if user_id then
	  gCriminal[os.time()] = {tipo = tipo, motivo = criminal}
	  vRP.execute("vRP/add_criminal",{ user_id = user_id, criminal = json.encode(gCriminal) })
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- QTH
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('p', function(source,args)
	local source = source
	local user_id = vRP.getUserId(source)
	local plyCoords = GetEntityCoords(GetPlayerPed(source))
    local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]
			
	local status, time = exports['vrp']:getCooldown(user_id, "barrap")
	if status then
		exports['vrp']:setCooldown(user_id, "barrap", 10)

		if user_id then
			if vRP.hasPermission(user_id, "perm.disparo") then
				local identity = vRP.getUserIdentity(user_id)
				exports['vrp']:alertPolice({ x = x, y = y, z = z, blipID = 304, blipColor = 3, blipScale = 0.7, time = 20, code = "911", title = "QTH", name = "QTH DE "..identity.nome.." "..identity.sobrenome.." ." })
			end
		end
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NOTIFICAO DE DISPARO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.sendLocationFire(x,y,z)
	local source = source
	local user_id = vRP.getUserId(source)
	local plyCoords = GetEntityCoords(GetPlayerPed(source))
    local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]
	
	if user_id then
		if not vRP.hasPermission(user_id, "perm.disparo") then
			exports['vrp']:alertPolice({ x = x, y = y, z = z, blipID = 161, blipColor = 63, blipScale = 0.5, time = 10, code = "911", title = "QRU Disparos", name = "Um novo registro de disparos foi registrado." })
		end
	end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sistema de ficha criminal
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.infoUser(user)
	local source = source 
	if user then
		local identity = vRP.getUserIdentity(parseInt(user))
		local infos = vRP.query("vRP/get_user_identity",{ user_id = user })
		local criminal = json.decode(infos[1].criminal)
		local prisoes = 0
		local avisos = 0

		for k,v in pairs(criminal) do 
			if v.tipo == "PRISAO" then
				prisoes = prisoes + 1
			end

			if v.tipo == "MULTA" then
				avisos = avisos + 1
			end
		end


		if identity then
			return infos[1].multas,identity.nome,identity.sobrenome,identity.registro,parseInt(identity.idade),prisoes,avisos
		end
	end
end

function src.arrestsUser(user)
	local source = source
	if user then
		local infos = vRP.query("vRP/get_user_identity",{ user_id = user })
		local criminal = json.decode(infos[1].criminal)
		local arrest = {}
		if infos then
			for k,v in pairs(criminal) do
				if v.tipo == "PRISAO" then
					table.insert(arrest,{ data = os.date("%d/%m/%Y", k), value = 0, info = v.motivo, officer = "Policia SX" })
				end
			end
			return arrest
		end
	end 
end

function src.ticketsUser(user)
	local source = source
	if user then
		local infos = vRP.query("vRP/get_user_identity",{ user_id = user })
		local criminal = json.decode(infos[1].criminal)
		local ticket = {}
		if infos then
			for k,v in pairs(criminal) do
				if v.tipo == "MULTA" then
					table.insert(ticket,{ data = os.date("%d/%m/%Y", k), value = 0, info = v.motivo, officer = "Policia SX" })
				end
			end
			return ticket
		end
	end
end

function src.warningsUser(user)
	local source = source
	if user then
		local warning = {}
		table.insert(warning,{ data = "Em Breve", value = "0", info = "Em Breve", officer = "Em Breve" })
		return warning
	end
end

function src.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,"perm.policia")
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MENU
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
vRP._registerMenuBuilder("police_menu", function(add, data)
	local user_id = vRP.getUserId(data.player)
	local nsource = vRP.getUserSource(user_id)
	if GetEntityHealth(GetPlayerPed(nsource)) <= 105 then 
		TriggerClientEvent("Notify",source,"negado","Você está morto, não pode abrir o insert.", 5)
		return 
	end

	if user_id then
		local choices = {}
        choices["01. Pedir RG"] = choice_pedirrg
        choices["02. Algemar"] = choice_algemar
        choices["03. Arrastar"] = choice_arrastar
		-- choices["04. Prender"] = choice_prisao
		choices["05. Colocar Veiculo"] = choice_colocarveh
        choices["06. Retirar Veiculo"] = choive_retirarveh
		choices["07. Apreender Itens"] = choice_apreenderitens
		choices["08. Consultar Veiculo"] = choice_consultarveh
        choices["09. Apreender Veiculo"] = choice_apv
		choices["09. Multar"] = choice_multar
		choices["10. Retirar Mascara"] = choice_rmascara
		add(choices)
	end
end)
