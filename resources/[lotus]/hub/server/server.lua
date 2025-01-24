local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
local idgens = Tools.newIDGenerator()

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local openedRequests = {}
local requestCall = {}
local serviceList = {
    ["god"] = { permission = "ticket.permissao", category = "Staff", icon = "crown" },
    ["medico"] = { permission = "perm.chamadoshp", category = "Hospital", icon = "crown" },
}

vRP.prepare("hub/getqtdok", "SELECT qtd FROM bm_chamados WHERE user_id = @user_id")
vRP.prepare("hub/setqtdok","INSERT INTO bm_chamados(user_id,qtd) VALUES(@user_id,@qtd)")
vRP.prepare("hub/upqtd", "UPDATE bm_chamados SET qtd = @qtd WHERE user_id = @user_id")

RegisterCommand("call",function(source,args,rawCmd)
    local source = source

    if not args[1] then return end
    serviceName = args[1]
    if not serviceList[serviceName] then
        return TriggerClientEvent("Notify",source,"negado","Serviço não existente.")
    end

    TriggerClientEvent("hub:openfac", source, serviceName)
end)

RegisterServerEvent("hub:sendCall")
AddEventHandler("hub:sendCall", function(desc)
    local userId = vRP.getUserId(source)
    if userId then
        if requestCall[userId] then
            if GetGameTimer() < requestCall[userId] then
                local callTime = parseInt((requestCall[userId] - GetGameTimer()) / 1000)
                TriggerClientEvent("Notify",source,"negado","Aguarde <b>"..callTime.." segundos</b>.",5000)
                return
            end
        end

        if not serviceList[serviceName] then
            return TriggerClientEvent("Notify",source,"negado","Serviço não existente.")
        end

        local description = tostring(desc)
        if description == "" or description == nil then return end

        local targets = vRP.getUsersByPermission(serviceList[serviceName].permission)
        if #targets <= 0 then
            return TriggerClientEvent("Notify",source,"negado","Não possui STAFFs em serviço para poder atende-lo no momento!",true)
        end

        local ped = GetPlayerPed(source)
        local coords = GetEntityCoords(ped)
        local location = { ceil(coords.x),ceil(coords.y),ceil(coords.z) }
        local identity = vRP.getUserIdentity(userId)

        requestCall[userId] = GetGameTimer() + 180000
        local sqlQuery = exports.oxmysql:query_async("INSERT INTO `requests` (`category`,`requested_by`,`description`,`location`) VALUES (@category,@requested_by,@description,@location)", { category = serviceList[serviceName].category, requested_by = userId, description = description, location = json.encode(location) })
        if sqlQuery.insertId then
            sendRequest(userId,serviceList[serviceName].permission,serviceList[serviceName].icon," ["..serviceList[serviceName].category.."] - "..(identity.nome or "N/A").." "..(identity.sobrenome or "N/A").." ("..userId..") ",description,sqlQuery.insertId,location)
        end
    end
end)



function sendRequest(requestedBy,permission,icon,title,description,requestId,location)
    if not openedRequests[requestId] and vRP.getUserSource(requestedBy) then
        openedRequests[requestId] = { 
            requestedBy = requestedBy, 
            permission = permission, 
            timer = 120, 
            location = location,
            description = description
        }
        
        local requestedBy = openedRequests[requestId].requestedBy
        local requestedSource = vRP.getUserSource(requestedBy)
        TriggerClientEvent("hub:closefac",requestedSource)

        local targets = vRP.getUsersByPermission(serviceList[serviceName].permission)
        if #targets > 0 then
            for k,v in pairs(targets) do
                async(function()
                    TriggerClientEvent("hub:sendRequest",vRP.getUserSource(parseInt(v)),icon,title,description,requestId)
                end)
            end
        end
    end
end

RegisterServerEvent("hub:tryAcceptRequest")
AddEventHandler("hub:tryAcceptRequest", function(requestId)
    local source = source
    requestId = parseInt(requestId)

    if not openedRequests[requestId] then
        TriggerClientEvent("Notify",source,"negado","Este chamado já foi atendido e não existe mais.")
        return false
    end

    local userId = vRP.getUserId(source)
    if not vRP.hasPermission(userId, openedRequests[requestId].permission) then
        return false
    end


    local requestedBy = openedRequests[requestId].requestedBy
    local requestedSource = vRP.getUserSource(requestedBy)
    local identity = vRP.getUserIdentity(userId)
    local possiblePlayers = vRP.getUsersByPermission(openedRequests[requestId].permission)

    exports.oxmysql:query("UPDATE `requests` SET `attended_by` = @userId, `attended_at` = NOW() WHERE `id` = @id",{ id = requestId, userId = userId })
    if (not requestedSource) then 
        TriggerClientEvent("Notify",source,"negado","O player não se encontra na cidade!")
        return false
    end

    TriggerClientEvent("hub:sendNotification",requestedSource,"check-circle","<b>Chamado Aceito</b>","Por favor, aguarde no local.",true)
    TriggerClientEvent("Notify",requestedSource,"sucesso","SEU CHAMADO FOI ATENTIDO AGUARDE NO LOCAL, QUEM ATENDEU: "..identity.nome.." "..identity.sobrenome.." ("..userId..")",20)
    local requester_coords = GetEntityCoords(GetPlayerPed(requestedSource))

    if serviceList[serviceName].category == "Staff" and vRP.hasPermission(userId, "ticket.permissao") then
        vRPclient._teleport(source, requester_coords.x, requester_coords.y, requester_coords.z)
    else    
        vRPclient._setGPS(source, requester_coords.x, requester_coords.y)
    end

    openedRequests[requestId] = nil
    
    for k,possible_user_id in pairs(possiblePlayers) do
        local source = vRP.getUserSource(parseInt(possible_user_id))
        if userId ~= possible_user_id then
            TriggerClientEvent("hub:setAcceptedRequest", source, requestId, userId)
        else
            TriggerClientEvent("hub:setAcceptedRequest", source, requestId, "ok")
        end
    end

    -- add chamados
    if serviceList[serviceName].category == "Staff" then
        local consultqtd = vRP.query("hub/getqtdok",{ user_id = parseInt(userId) })
        if consultqtd[1] then
            local qtdatual = consultqtd[1]["qtd"] or 0
            local newqtd = qtdatual + 1
            vRP.execute("hub/upqtd",{ user_id = parseInt(userId), qtd = newqtd })
        else
            vRP.execute("hub/setqtdok",{ user_id = parseInt(userId), qtd = 1 })
        end
    end

    return true
end)

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(openedRequests) do
            if v.timer > 0 then
                v.timer = v.timer - 1

                if v.timer <= 0 then
                    local possiblePlayers = vRP.getUsersByPermission(v.permission)
                    local triggerSource = vRP.getUserSource(v.requestedBy)

                    if triggerSource then
                        if (v.requestedBy and vRP.getUserSource(v.requestedBy) and serviceList[serviceName] and serviceList[serviceName].category) then 
                            TriggerClientEvent("hub:sendNotification",vRP.getUserSource(v.requestedBy),"warning","<b>Notificação</b>","Por favor, tente novamente mais tarde.",true)
                            TriggerClientEvent("Notify",vRP.getUserSource(v.requestedBy),"importante","NÃO HÁ NENHUM "..serviceList[serviceName].category.." DISPONIVEL NO MOMENTO, SE ESTIVER COM UM PROBLEMA SUBA EM NOSSO ATENDIMENTO NO DISCORD",10)
                        end
                    end

                    for l, possible_user_id in pairs(possiblePlayers) do
                        local source = vRP.getUserSource(parseInt(possible_user_id))
        
                        if source and requestedBy ~= possible_user_id then
                            TriggerClientEvent("hub:setAcceptedRequest",source,k,"ninguém")
                        end
                    end
                    
                    openedRequests[k] = nil
                end
            end
        end
        Citizen.Wait(1000)
    end
end)

RegisterCommand("reply", function(source,args,rawCmd)
    local userId = vRP.getUserId(source)
    local identity = vRP.getUserIdentity(userId)
    if not vRP.hasPermission(userId,"ticket.permissao") then
        return
    end

    if not args[1] then return end

    local description = vRP.prompt(source,"Descrição","")
    local persistentText = vRP.prompt(source, "Persistente (0 ou 1)","")
    local persistent = false

    local identity2 = vRP.getUserIdentity(parseInt(args[1]))

    
    if persistentText == "1" then
        persistent = true
    end

    if string.len(description) > 0 then
        if vRP.getUserSource(parseInt(args[1])) then
            TriggerClientEvent("hub:sendNotification", vRP.getUserSource(parseInt(args[1])),"warning","<b>"..identity.nome.." diz:</b>", description, persistent)
        end

        local adminAmount = vRP.getUsersByPermission("ticket.permissao")
        if #adminAmount > 0 then
            for k,v in pairs(adminAmount) do
                async(function()
                    TriggerClientEvent('chatME',v,"^8"..identity2.nome.." "..identity2.sobrenome.." ("..(parseInt(args[1])).."): ^4"..description)
                end)
            end
        end
    end
end)

function ceil(n)
    n = math.ceil(n * 100) / 100
    return n
end