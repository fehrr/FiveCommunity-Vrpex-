local cache = {}
cache['inArena'] = {}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SETARENA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function vRP.setArena(source, status)
	if status then
		cache['inArena'][source] = true
	else
		cache['inArena'][source] = nil
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CRIAR ITENS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local cfg = module("cfg/items")

vRP.items = {}

function vRP.defInventoryItem(idname, name, tipo, weight, fome, sede)
	if weight == nil then
		weight = 0
	end
	
	local item = { name = name, tipo = tipo, weight = weight, fome = fome, sede = sede }
	vRP.items[idname] = item
end


for k,v in pairs(cfg.items) do
    vRP.defInventoryItem(k,v[1],v[2],v[3],v[4],v[5])
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS PADROES
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getAllItens()
	return vRP.items
end

function vRP.getItemName(idname)
	local args = vRP.parseItem(idname)
	local item = vRP.items[args[1]]
	if item then
		return vRP.computeItemName(item,args)
	end
	return args[1]
end

function vRP.getItemWeight(idname)
	local args = vRP.parseItem(idname)
	local item = vRP.items[args[1]]
	if item then
		return vRP.computeItemWeight(item,args)
	end
	return 0
end

function vRP.itemFood(args)
    local item = vRP.items[args]
    if item then
        return item.fome,item.sede
    end
end

function vRP.computeItemName(item,args)
	if type(item.name) == "string" then
		return item.name
	else
		return item.name(args)
	end
end

function vRP.computeItemWeight(item,args)
	if type(item.weight) == "number" then
		return item.weight
	else
		return item.weight(args)
	end
end

function vRP.getItemType(args)
	local item = vRP.items[args]
	if item then
		return item.tipo
	end
end

function vRP.computeInvWeight(user_id)
	local weight = 0
	local inventory = vRP.getInventory(user_id)
	if inventory then
		for k in pairs(inventory) do
			if vRP.items[inventory[k].item] then
				weight = weight + vRP.getItemWeight(inventory[k].item) * parseInt(inventory[k].amount)
			end
		end
		return weight
	end
	return 0
end 

function vRP.computeItemsWeight(items)
	local weight = 0
	if items then
		for k in pairs(items) do
			if vRP.items[items[k].item] then
				weight = weight + vRP.getItemWeight(items[k].item) * parseInt(items[k].amount)
			end
		end
		return weight
	end
	return 0
end 

function vRP.getInventoryItemAmount(user_id,idname)
	local data = vRP.getInventory(user_id)
	if data then
		for k in pairs(data) do
			if data[k].item == idname then
				vRP.checkInventoryWeightAndBan(user_id)
				return parseInt(data[k].amount)
			end
		end
	end
	return 0
end

function vRP.getItemInSlot(user_id, idname, target)
	local data = vRP.getInventory(user_id)
	if data then
		for k in pairs(data) do
			if data[k].item == idname then
				return k
			end
		end
	end
	return target
end

function vRP.getInventoryMaxWeight(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		local mochila = data.mochila
		
		if user_id then
			if vRP.hasGroup(user_id, "developerlotusgroup@445") or vRP.hasPermission(user_id, "diretor.permissao") or vRP.hasGroup(user_id, "developerofflotusgroup@445") or vRP.hasGroup(user_id, "respilegallotusgroup@445") or vRP.hasGroup(user_id, "respilegalofflotusgroup@445") then 
				vRP.checkInventoryWeightAndBan(user_id)
				return 100000000+30*tonumber(mochila.quantidade)
			else
				vRP.checkInventoryWeightAndBan(user_id)
				return 10+30*tonumber(mochila.quantidade)
			end
		end
	end
end

function vRP.clearInventory(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		data.inventory = {}
	end
end

function vRP.parseItem(idname)
	return splitString(idname,"|")
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNÇÕES DO INVENTARIO
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.giveInventoryItem(user_id,idname,amount,notify, slot)
	local amount = parseInt(amount)
	if amount < 0 then
		amount = 1
	end

	local source = vRP.getUserSource(user_id)
	local data = vRP.getInventory(user_id)
	if user_id then
		if idname ~= "money" then
			if source then
				if cache['inArena'][source] ~= nil then
					return
				end
			end
		end

		if idname == "dirty_money" then
			if amount > 5000000 then
				vRP.sendLog("https://discord.com/api/webhooks/1052365982926123108/GJAWxcYCxCrM5UxPOMGz_NjE4eF12mOR2Lp0DWPmjF7N9KVoWLmW-qDsiTiZThgRtLLT", "```prolog\n[USER_ID]: "..user_id.."\n[QUANTIDADE]: "..amount.."\n[RESOURCE]: "..GetInvokingResource().."``` @everyone")

				
			end
		end

		if vRP.items[idname] == nil and idname then
			TriggerClientEvent( "Notify", source, "negado", "Este item <b>"..idname.."</b> não existe cadastrado na base.", 5 )
			return
		end
		
		if data and parseInt(amount) > 0 then
			if not slot then
				local initial = 0
				repeat
					initial = initial + 1
				until data[tostring(initial)] == nil or (data[tostring(initial)] and data[tostring(initial)].item == idname)
				
				initial = tostring(initial)
				
				if data[initial] == nil then
					data[initial] = { item = idname, amount = parseInt(amount) }
				elseif data[initial] and data[initial].item == idname then
					data[initial].amount = parseInt(data[initial].amount) + parseInt(amount)
				end

				if notify then
					vRP.checkInventoryWeightAndBan(user_id)
					TriggerClientEvent("itensNotify",source,"sucesso", amount , vRP.getItemName(idname), idname, vRP.getItemWeight(idname)*amount)
				end
			else
				slot = tostring(slot)

				if data[slot] then
					if data[slot].item == idname then
						local oldAmount = parseInt(data[slot].amount)
						data[slot] = { item = idname, amount = parseInt(oldAmount) + parseInt(amount) }
					end
				else
					data[slot] = { item = idname, amount = parseInt(amount) }
				end

				if notify then
					vRP.checkInventoryWeightAndBan(user_id)
					TriggerClientEvent("itensNotify",source,"sucesso", amount , vRP.getItemName(idname), idname, vRP.getItemWeight(idname)*amount)
				end
			end
		end
	end
end

function vRP.tryGetInventoryItem(user_id,idname,amount,notify,slot)
	local amount = parseInt(amount)
	if amount < 0 then
		amount = 1
	end
	
	local source = vRP.getUserSource(user_id)
	local data = vRP.getInventory(user_id)
	if user_id then
		if data then
			if not slot then
				for k,v in pairs(data) do
					if v.item == idname and parseInt(v.amount) >= parseInt(amount) then
						v.amount = parseInt(v.amount) - parseInt(amount)

						if parseInt(v.amount) <= 0 then
							data[k] = nil
						end

						if notify then
							TriggerClientEvent("itensNotify",source,"negado", amount , vRP.getItemName(idname), idname, vRP.getItemWeight(idname)*amount)
						end
						vRP.checkInventoryWeightAndBan(user_id)
						return true
					end
				end
			else
				local slot  = tostring(slot)

				if data[slot] and data[slot].item == idname and parseInt(data[slot].amount) >= parseInt(amount) then
					data[slot].amount = parseInt(data[slot].amount) - parseInt(amount)

					if parseInt(data[slot].amount) <= 0 then
						data[slot] = nil
					end

					if notify then
						TriggerClientEvent("itensNotify",source,"negado", amount , vRP.getItemName(idname), idname, vRP.getItemWeight(idname)*amount)
					end
					vRP.checkInventoryWeightAndBan(user_id)
					return true
				end
			end
		end
	end
	return false
end

function vRP.removeInventoryItem(user_id,idname,amount)
	local source = vRP.getUserSource(user_id)
	local data = vRP.getInventory(user_id)
	if user_id then
		if data then
			for k,v in pairs(data) do
				if v.item == idname and parseInt(v.amount) >= parseInt(amount) then
					v.amount = parseInt(v.amount) - parseInt(amount)

					if parseInt(v.amount) <= 0 then
						data[k] = nil
					end
					break
				end
			end
			vRP.checkInventoryWeightAndBan(user_id)
			TriggerClientEvent("itensNotify",source,"negado", amount , vRP.getItemName(idname), idname, vRP.getItemWeight(idname)*amount)
		end
	end
end


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECKAMOUNT BAN
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function vRP.checkInventoryWeightAndBan(user_id)
    local totalWeight = vRP.computeInvWeight(user_id)  
    local source = vRP.getUserSource(user_id)

    if totalWeight > 6500 and not vRP.hasPermission(user_id, "perm.mochilastaff") then
		vRP.sendLog("https://discord.com/api/webhooks/1114419411068145774/CkuLk-B99INt3Jxs6hjSM3icgptdHJ31HZ0togn8wehnj7lAoTXLVC6kZQtACd75xv9y", "O ID "..user_id.." está com "..totalWeight.." KG no inventário!")
		DropPlayer(source, 'Você foi pego pelo makakero LGBT!')
		vRP.setBanned(user_id, 1, "Você foi pego pelo makakero LGBT!")
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE MOCHILA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function vRP.addMochila(user_id)
	local data = vRP.getUserDataTable(user_id)
	local mochila = data.mochila

	if data then
		if not mochila.perder then
			mochila.perder = 0
		end

		data.mochila = { quantidade = mochila.quantidade+1, perder = mochila.perder }
	end
end

function vRP.remMochila(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then
		if data.mochila then

			if not data.mochila.perder then
				data.mochila.perder = 0
			end

			data.mochila = { quantidade = 0, perder = data.mochila.perder }
		end
	end
end

function vRP.getMochilaAmount(user_id)
	local data = vRP.getUserDataTable(user_id)
	if data then

		if data.mochila then
			vRP.checkInventoryWeightAndBan(user_id)
			return (data.mochila.quantidade or 0)
		end
	end

	return 0
end

function vRP.atualizarMochila(user_id, time)
	local data = vRP.getUserDataTable(user_id)
	local mochila = data.mochila
	if data then
		vRP.checkInventoryWeightAndBan(user_id)
		data.mochila = { quantidade = mochila.quantidade, perder = time }
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EVENTOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerJoin", function(user_id,source,name)
	local data = vRP.getUserDataTable(user_id)
	if not data then return end
	
	if not data.inventory then
		data.inventory = {}
	end

	if not data.mochila then
		data.mochila = { quantidade = 0, perder = 0 }
	end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NATION GET INVENTARIO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function vRP.getVehicleName(name)
	return exports["bm_module"]:getVehicleName(name)
end

function vRP.getVehicleTrunk(name)
	return exports["bm_module"]:getVehicleTrunk(name)
end

