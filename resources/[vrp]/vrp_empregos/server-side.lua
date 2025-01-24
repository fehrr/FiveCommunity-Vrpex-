local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("vrp_empregos",src)
vCLIENT = Tunnel.getInterface("vrp_empregos")

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR PLACA
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.checkPlate()
    local source = source
    local user_id = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(user_id)
    if identity then
        return identity.registro
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PAGAMENTOS EMPREGOS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local minerios = {
    [1] = { "bronze", math.random(2,5) },
    [2] = { "ferro", math.random(2,5) },
    [3] = { "ouro", math.random(2,4) },
    [4] = { "diamante", math.random(2,4) },
    [5] = { "rubi", math.random(1,3) },
    [6] = { "safira", math.random(1,3) }
}

local peixes = {
    [1] = { "pacu" },
    [2] = { "tilapia" },
    [3] = { "salmao" },
    [4] = { "tucunare" },
    [5] = { "dourado" }
}

local RouteCheck = {}

function src.payment(tipo, quantidade, selecionado, mode)
    if GetInvokingResource() ~= nil then DropPlayer(source, "Opaa, Até mais :)") return end
    local source = source
    local user_id = vRP.getUserId(source)

    if user_id then
        -- VERIFICACOES DE INJECT
        local status, time = exports['vrp']:getCooldown(user_id, "empregos")
        if not status then
            print("^1[EMPREGOS]^7 Usuário: "..user_id.." | Intervalo: "..time.."s | Banindo ")
            DropPlayer(source,"Trigger [Empregos]")
            vRP.setBanned(user_id, true, "Trigger [Empregos] ¹a")
            return
        end

        --CHECANDO SE ESTA PEGANDO MESMA ROTA
        if RouteCheck[user_id] and RouteCheck[user_id] == selecionado then
            print("^1[EMPREGOS]^7 Usuário: "..user_id.." | Pegou Mesma Rota Seguida | Banindo ")
            DropPlayer(source,"Trigger [Empregos]")
            vRP.setBanned(user_id, true, "Trigger [Empregos] ¹")
            return
        end
        RouteCheck[user_id] = selecionado

        -- CHECANDO SE A ROTA EXISTE
        if cfg.config[tipo] and not cfg.config[tipo].rotas[selecionado] then
            print("^1[EMPREGOS]^7 Usuário: "..user_id.." | Rota não encontrada | Banindo ")
            DropPlayer(source,"Trigger [Empregos]")
            vRP.setBanned(user_id, true, "Trigger [Empregos] ²")
            return
        end

        -- CHECANDO A DISTANCIA DA ROTA QUE ELE ESTA
        local pedCoords = GetEntityCoords(GetPlayerPed(source))
        local dist = #(pedCoords - cfg.config[tipo].rotas[selecionado].coords)
        if dist > 150 then
            print("^1[EMPREGOS]^7 Usuário: "..user_id.." | Distance de "..dist.." da rota | Banindo ")
            DropPlayer(source,"Trigger [Empregos]")
            vRP.setBanned(user_id, true, "Trigger [Empregos] ³ : ".. dist)
            return
        end

        if GetPlayerPing(source) > 0 and status then

            exports['vrp']:setCooldown(user_id, "empregos", 2)
            
            if tipo == "Drogas" then
                local plyCoords = GetEntityCoords(GetPlayerPed(source))
                local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]
                local policia = vRP.getUsersByPermission("perm.countpolicia")
                local valorPolicial = cfg.config[tipo].valorPorPolicia*#policia
                local chance = math.random(100)

                if mode == 1 then
                    if chance >= 75 then
                        exports['vrp']:alertPolice({ x = x, y = y, z = z, blipID = 161, blipColor = 63, blipScale = 0.5, time = 20, code = "911", title = "Vende de Drogas", name = "Um novo registro de vendas de drogas vá até o local no mapa."})
                    end

                    if vRP.tryGetInventoryItem(user_id, "maconha", quantidade, true) then
                        local value = cfg.config[tipo].valorPorDroga
                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                        local valortotal = (value*quantidade)+valorPolicial
                        return true
                    elseif vRP.tryGetInventoryItem(user_id, "lancaperfume", quantidade, true) then
                        local value = cfg.config[tipo].valorPorDroga
                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                        local valortotal = (value*quantidade)+valorPolicial
                        return true
                    elseif vRP.tryGetInventoryItem(user_id, "cocaina", quantidade, true) then
                        local value = cfg.config[tipo].valorPorDroga
                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                        local valortotal = (value*quantidade)+valorPolicial
                        return true
                    elseif vRP.tryGetInventoryItem(user_id, "lsd", quantidade, true) then
                        local value = 1500
                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                        local valortotal = (value*quantidade)+valorPolicial
                        return true
                    elseif vRP.tryGetInventoryItem(user_id, "lancaperfume", quantidade, true) then
                        local value = cfg.config[tipo].valorPorDroga
                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                        local valortotal = (value*quantidade)+valorPolicial
                        return true
                    elseif vRP.tryGetInventoryItem(user_id, "balinha", quantidade, true) then
                        local value = cfg.config[tipo].valorPorDroga
                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                        local valortotal = (value*quantidade)+valorPolicial
                        return true
                    elseif vRP.tryGetInventoryItem(user_id, "heroina", quantidade, true) then
                        local value = cfg.config[tipo].valorPorDroga
                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                        local valortotal = (value*quantidade)+valorPolicial
                        return true
                    elseif vRP.tryGetInventoryItem(user_id, "metanfetamina", quantidade, true) then
                        local value = cfg.config[tipo].valorPorDroga
                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                        local valortotal = (value*quantidade)+valorPolicial
                        return true
                    elseif vRP.tryGetInventoryItem(user_id, "opio", quantidade, true) then
                        local value = cfg.config[tipo].valorPorDroga
                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                        local valortotal = (value*quantidade)+valorPolicial
                        return true
                    elseif vRP.tryGetInventoryItem(user_id, "haxixe", quantidade, true) then
                        local value = cfg.config[tipo].valorPorDroga
                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)

                        local valortotal = (value*quantidade)+valorPolicial
                        return true
                    else
                        TriggerClientEvent("Notify",source,"negado","Você não possui a quantia de <b>"..quantidade.." x</b> drogas.", 5)
                        return false
                    end
                else
                    if chance >= 25 then
                        exports['vrp']:alertPolice({ x = x, y = y, z = z, blipID = 161, blipColor = 63, blipScale = 0.5, time = 20, code = "911", title = "Vende de Drogas", name = "Um novo registro de vendas de drogas vá até o local no mapa."})
                    end

                    if vRP.tryGetInventoryItem(user_id, "maconha", quantidade, true) then
                        local value = cfg.config[tipo].valorPorDroga+400
                       -- print("MACONHA => ",value*quantidade, valorPolicial, quantidade)

                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                    end

                    if vRP.tryGetInventoryItem(user_id, "lancaperfume", quantidade, true) then
                        local value = cfg.config[tipo].valorPorDroga+400
                       -- print("MACONHA => ",value*quantidade, valorPolicial, quantidade)

                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                    end

                    if vRP.tryGetInventoryItem(user_id, "cocaina", quantidade, true) then

                        local value = cfg.config[tipo].valorPorDroga+400
                       -- print("COCAINA => ",value*quantidade, valorPolicial, quantidade)

                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                    end

                    if vRP.tryGetInventoryItem(user_id, "lsd", quantidade, true) then
                        local value = 1500+400
                       -- print("LSD => ", value, valorPolicial)

                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                    end

                    if vRP.tryGetInventoryItem(user_id, "balinha", quantidade, true) then

                        local value = cfg.config[tipo].valorPorDroga+400
                       -- print("BALINHA => ",value*quantidade, valorPolicial, quantidade)

                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                    end
                    
                    if vRP.tryGetInventoryItem(user_id, "heroina", quantidade, true) then

                        local value = cfg.config[tipo].valorPorDroga+400
                       -- print("HEROINA => ",value*quantidade, valorPolicial, quantidade)

                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                    end

                    if vRP.tryGetInventoryItem(user_id, "metanfetamina", quantidade, true) then

                        local value = cfg.config[tipo].valorPorDroga+400
                       -- print("META => ",value*quantidade, valorPolicial, quantidade)

                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                    end

                    if vRP.tryGetInventoryItem(user_id, "opio", quantidade, true) then

                        local value = cfg.config[tipo].valorPorDroga+400
                       -- print("OPIO => ",value*quantidade, valorPolicial, quantidade)

                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                    end

                    if vRP.tryGetInventoryItem(user_id, "haxixe", quantidade, true) then

                        local value = cfg.config[tipo].valorPorDroga+400
                       -- print("HAXIXE => ", value*quantidade, valorPolicial, quantidade)

                        vRP.giveInventoryItem(user_id, "dirty_money", (value*quantidade)+valorPolicial, true)
                    end

                    return true
                end

            elseif tipo == "Desmanche" then
                local plyCoords = GetEntityCoords(GetPlayerPed(source))
                local x,y,z = plyCoords[1],plyCoords[2],plyCoords[3]
                local policia = vRP.getUsersByPermission("perm.countpolicia")
                local chance = math.random(100)

                if chance >= 25 then
                    exports['vrp']:alertPolice({ x = x, y = y, z = z, blipID = 161, blipColor = 63, blipScale = 0.5, time = 20, code = "911", title = "Venda de Peças", name = "Um novo registro de vendas de peças desmanchadas vá até o local no mapa."})
                    TriggerClientEvent("Notify",source,"imporante","KOE MEU FILHO, A POLICIA FOI ALERTADA! METE O PÉ!", 5)
                end

                local valormotor = cfg.config[tipo].price
                local valorpneu = cfg.config[tipo].price2

                if vRP.tryGetInventoryItem(user_id, "motor", quantidade, true) then
                    vRP.giveInventoryItem(user_id, "dirty_money", (valormotor*quantidade), true)
                end
                
                if vRP.tryGetInventoryItem(user_id, "pneuusado", quantidade, true) then
                    vRP.giveInventoryItem(user_id, "dirty_money", (valorpneu*quantidade), true)
                end
                return true
            end

            return false
        end
    end
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ENTREGADOR
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.giveCaixas(quantidade)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.computeInvWeight(user_id)+vRP.getItemWeight("caixa")*quantidade <= vRP.getInventoryMaxWeight(user_id) then
            vRP.giveInventoryItem(user_id, "caixa", quantidade, true)
        else
            TriggerClientEvent("Notify",source,"negado","Mochila cheia.", 5)
        end
    end
end

function src.cooldowndrogas()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local status, time = exports['vrp']:getCooldown(user_id, "startdrogas")
        if status then
            exports['vrp']:setCooldown(user_id, "startdrogas",100)
            TriggerClientEvent("Notify",source,"negado","Cuidado! Você entrou em cooldown para pegar a rota novamente! (100 Segundos)")
            return true
        else
            TriggerClientEvent("Notify",source,"negado","Você está em cooldown, aguarde "..time.." segundos!")
            return false
        end
    end
end

function src.checkItems(quantidade)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id,'perm.unizk') or vRP.hasPermission(user_id,'perm.mecanica') or vRP.hasPermission(user_id,'perm.militar') then
            TriggerClientEvent("Notify",source,"negado","Você não pode entregar drogas em expediente.")
            return false
        end

        if vRP.getInventoryItemAmount(user_id,"lancaperfume") >= quantidade or vRP.getInventoryItemAmount(user_id,"maconha") >= quantidade or vRP.getInventoryItemAmount(user_id,"opio") >= quantidade or vRP.getInventoryItemAmount(user_id,"heroina") >= quantidade or vRP.getInventoryItemAmount(user_id,"balinha") >= quantidade or vRP.getInventoryItemAmount(user_id,"metanfetamina") >= quantidade or vRP.getInventoryItemAmount(user_id,"cocaina") >= quantidade or vRP.getInventoryItemAmount(user_id,"lsd") >= quantidade  or vRP.getInventoryItemAmount(user_id,"haxixe") >= quantidade then
            return true
        else
            TriggerClientEvent("Notify",source,"negado","Você não possui itens suficientes para isto!")
            return false
        end
    end
end



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PESCADOR
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.tryIsca()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.tryGetInventoryItem(user_id, "isca", 1, true) then
            return true
        else
            TriggerClientEvent("Notify",source,"negado","Acabou suas iscas, volte a central e busque mais.", 5)
        end
    end
end

function src.giveIsca(quantidade)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.computeInvWeight(user_id)+vRP.getItemWeight("isca")*quantidade <= vRP.getInventoryMaxWeight(user_id) then
            vRP.giveInventoryItem(user_id, "isca", quantidade, true)
        else
            TriggerClientEvent("Notify",source,"negado","Mochila cheia.", 5)
        end
    end
end

function tD(n)
    n = math.ceil(n * 100) / 100
    return n
end



RegisterCommand("DASUDUNADNBWBd", function(source)
	TriggerEvent("AC:ForceBan", source, {
		reason = "Vehicle Spawn [Empregos]",
		forceBan = true
	})
end)