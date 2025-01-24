local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("vrp_farms",src)
Proxy.addInterface("vrp_farms",src)

vCLIENT = Tunnel.getInterface("vrp_farms")


src.DevTools = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        vRP.setBanned(user_id, true)
        vRP.kick(source, "OPA!!! Bobinho, Não pode não..")
    end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local actived = {}
local validItems = {}
local RouteType = {}

CreateThread(function() 
    for k,v in pairs(cfg.bancadaNui) do 
        for item, data in pairs(v.itens) do 
            validItems[item] = {
                max = 30
            }
        end
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- GERAL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function src.requestBancada(bancada)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local itens = {}
        local items = cfg.bancadaNui[bancada].itens
        if items then
            for k,v in pairs(items) do
                if vRP.getItemName(k) then
                    table.insert(itens,{ id = k, imagem = cfg.gerais["imagens"]..k..cfg.gerais["formatoImagens"], nome = vRP.getItemName(k), minAmount = 1, maxAmount = 2, action = k })
                end
            end
           
            return cfg.bancadaNui[bancada].bancadaName,itens,bancada
        end
    end
end
function src.fabricarItem(item, minAmout, maxAmount, bancada,direction)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local status, time = exports['vrp']:getCooldown(user_id, "farms")
        if status then 
            exports['vrp']:setCooldown(user_id, "farms", 10)

            vCLIENT._iniciarRota(source, item, vRP.getItemName(item), minAmout, maxAmount, bancada,direction)
            TriggerClientEvent("Notify",source,"importante","Você iniciou as rotas de <b>"..vRP.getItemName(item).."</b>.", 3)

            RouteType[user_id] = bancada

            vCLIENT._closeNui(source)
        else
            TriggerClientEvent("Notify",source,"negado","Aguarde <b>"..time.." segundo(s)</b> para iniciar novamente..", 3) 
        end
    end
end

function src.checkPermission(perm)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if perm == nil or vRP.hasPermission(user_id, perm) then
            return true
        end
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE FARM DE DROGAS
-----------------------------------------------------------------------------------------------------------------------------------------
local giveCount = {} 
local maxGiveAttempts = 10

function src.giveItem(item, quantidade, ponto, bancada,direction)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then

        if direction == "north" then
            routeIndexed = cfg.northRoutes[parseInt(ponto)].coords
        elseif direction == "south" then
            routeIndexed = cfg.southRoutes[parseInt(ponto)].coords
        else
            routeIndexed = cfg.allRoutes[parseInt(ponto)].coords
        end

        local Coords = routeIndexed
        if not Coords then return end

        if GetPlayerPed(source) > 0 then
            if vRP.computeInvWeight(user_id) + vRP.getItemWeight(item) * quantidade <= vRP.getInventoryMaxWeight(user_id) then
                
                -- VERIFICACAO DA MESA SELECIONADA
                local ActualRoute = RouteType[user_id]
                if not ActualRoute then
                    DropPlayer(source,"Opss! ♥")
                    vRP.setBanned(user_id, 1, "[FARMS] SPAWN ¹")
                    return
                end

                local ItemVerify = cfg.bancadaNui[ActualRoute].itens
                if not ItemVerify[item] then
                    DropPlayer(source,"Opss! ♥")
                    vRP.setBanned(user_id, 1, "[FARMS] SPAWN ²")
                    return 
                end

                -- OUTROS
                if not validItems[item] or quantidade <= 0 then
                    DropPlayer(source,"Tentou spawnar "..item.." x"..quantidade)
                    vRP.setBanned(user_id,1)
                    print(("user_id %s attempt spawn %s x %s"):format(user_id, item, quantidade))
                    return
                end

                local status, time = exports['vrp']:getCooldown(user_id, "pegaritemrota")
                if not status and time > 0 then 
                    giveCount[user_id] = (giveCount[user_id] or 0) + 1
                    if giveCount[user_id] > maxGiveAttempts then
                        vRP.setBanned(user_id, true, "[VRP_EMPREGOS] - BANIDO POR TENTAR PEGAR ITEM DURANTE COOLDOWN")
                        vRP.setBanned(user_id,1, "TRIGGER EMPREGOS")
                        DropPlayer(source, "Banido por tentar pegar item durante cooldown")
                        return
                    end

                    TriggerClientEvent("Notify",source,"negado","Você não pode pegar ainda a rota, está em cooldown "..time,3)
                    return
                else
                    giveCount[user_id] = 0
                end
                exports['vrp']:setCooldown(user_id, "pegaritemrota", 2)

                if parseInt(ponto) == 0 or parseInt(ponto) == nil then
                    vRP.setBanned(user_id, true, "[VRP_EMPREGOS] - BANIDO PONTO ZERO")
                    vRP.setBanned(user_id,1)
                    DropPlayer(source, "Banido Ponto ZERO")
                    return
                end



                
                if routeIndexed ~= nil then
                    local distance = #(GetEntityCoords(GetPlayerPed(source)) - routeIndexed)
                    if distance <= 15 then 

                        for k,v in pairs(cfg.bancadaNui[bancada].itens) do

                            for i=1,#v.tableItens do
                                local amount = math.random(v.tableItens[i].min,v.tableItens[i].max)

                                if vRP.computeInvWeight(user_id)+vRP.getItemWeight(v.tableItens[i].item) * amount >= vRP.getInventoryMaxWeight(user_id) then
                                    TriggerClientEvent("Notify",source,"aviso","Sua mochila está cheia.")
                                    return false
                                end

                                vRP.giveInventoryItem(user_id, v.tableItens[i].item, amount, true)

                            end

                        end
                        return true
                    end
                end

            else
                TriggerClientEvent("Notify",source,"negado","Sua mochila está cheia.", 3) 
            end
        end
    end
end

 

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE DESMANCHE
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local desmanchando = {}

function src.checkVehicleStatus(mPlaca,mName)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        
        if mName == "hornet" or mName == "Hornet" then
            TriggerClientEvent("Notify",source,"negado","Este veiculo nao pode ser desmanchado.", 5)
            return
        end
        
        if desmanchando[mPlaca] or desmanchando[mPlaca] ~= nil then
            TriggerClientEvent("Notify",source,"negado","Este veiculo ja esta sendo desmanchado.", 5)
            return
        end

        local nuser_id = vRP.getUserByRegistration(mPlaca)
        if nuser_id then
            local rows = vRP.query("vRP/get_veiculos_status", {user_id = nuser_id, veiculo = mName})
            if rows[1] then
                if rows[1].status == 0 then
                    desmanchando[mPlaca] = user_id
                    exports["vrp"]:setBlockCommand(user_id, 40)
                    return true
                else
                    TriggerClientEvent("Notify",source,"negado","Este veiculo ja se encontra detido/retido.", 5)
                end
            end
        else
            TriggerClientEvent("Notify",source,"negado","Este veiculo nao possui nenhum proprietario.", 5)
        end
    end
end

function src.pagarDesmanche(mPlaca,mName,mPrice,mVeh)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local nuser_id = vRP.getUserByRegistration(mPlaca)
        if nuser_id then
            if mName == "hornet" or mName == "Hornet" then
                TriggerClientEvent("Notify",source,"negado","Este veiculo nao pode ser desmanchado.", 5)
                return
            end

            if desmanchando[mPlaca] == user_id then
    
                local rows = vRP.query("vRP/get_nitro", {user_id = user_id, veiculo = mName})
                if rows[1] then
                    local custom = json.decode(rows[1].nitro or {}) or {}
                    custom.nitro = nil
                    custom.nitro_q = nil
                    print("removendo nitro da tunagem do veículo")
                    vRP.execute("vRP/update_nitro",{ user_id = user_id, veiculo = mName, nitro = json.encode(custom) })
                end

                -- COPIAR DAQ
                local price = exports.bm_module:getVehiclePrice(mName)
                if price then
                    exports["vrp"]:setBlockCommand(user_id, 0)
                    vRP.execute("vRP/set_status",{ user_id = nuser_id, veiculo = mName, status = 2})
                    vRP.giveInventoryItem(user_id, "dirty_money", price*0.15, true)

                    vRP._generateLog({
                        category = "desmanche",
                        room = "desmanche",
                        user_id = user_id,
                        message = ( [[O USER_ID %s DESMANCHOU O VEICULO DO USER_ID %s VEICULO %s PLACA %s VALOR %s]] ):format(user_id, nuser_id, mName, mPlaca, vRP.format(price*0.15))
                    })

                    exports['bm_module']:deleteVehicle(source, mVeh)
                    desmanchando[mPlaca] = nil
                else
                    print("Problemas com preco do veiculo - "..mName)
                end
                -- ATE AQ

            else
                print(user_id, "Troxa dupando #DUPANDO")
            end
        else
            TriggerClientEvent("Notify",source,"negado","Este veiculo nao possui nenhum proprietario.", 5)
        end
    end
end

local itensDesmanche = {
    ["macarico"] = 2,
}

function src.checkItensD()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local mensagem = ""
        local status = true

        for k,v in pairs(itensDesmanche) do
            if vRP.getInventoryItemAmount(user_id, k) < v then
                status = false
                mensagem = mensagem .. "Você não possui "..vRP.getItemName(k).." na quantidade de "..v..".<br>"
            end

            if status then
                vRP.tryGetInventoryItem(user_id, k, v) 
            end
        end

         if mensagem ~= "" then
             TriggerClientEvent("Notify",source,"negado",mensagem, 5)
         end

         return status
    end
end 
