------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PREPARES
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare('monit/getItemPlayer', "SELECT user_id, CAST(JSON_EXTRACT(dvalue, CONCAT('$.', SUBSTRING_INDEX(SUBSTRING_INDEX(JSON_SEARCH(dvalue,'one',@itemid,NULL,'$**.item'), '$.', -1), '.item', 1), '.amount')) AS UNSIGNED) AS amount FROM vrp_user_data ORDER BY amount DESC LIMIT 25;")
vRP.prepare('monit/getItemFac', "SELECT dkey, CAST(JSON_EXTRACT(dvalue, CONCAT('$.', SUBSTRING_INDEX(SUBSTRING_INDEX(JSON_SEARCH(dvalue,'one',@itemid,NULL,'$**.item'), '$.', -1), '.item', 1), '.amount')) AS UNSIGNED) AS amount FROM vrp_srv_data ORDER BY amount DESC LIMIT 25;")
vRP.prepare('monit/getItemHouse', "SELECT houseID,proprietario, CAST(JSON_EXTRACT(bau, CONCAT('$.', SUBSTRING_INDEX(SUBSTRING_INDEX(JSON_SEARCH(bau,'one',@itemid,NULL,'$**.item'), '$.', -1), '.item', 1), '.amount')) AS UNSIGNED) AS amount FROM mirtin_users_homes ORDER BY amount DESC LIMIT 25;")
vRP.prepare('monit/getBauHouse', "SELECT bau FROM mirtin_users_homes WHERE houseID = @houseID")
vRP.prepare('monit/getBauFac', "SELECT dvalue FROM vrp_srv_data WHERE dkey = @chestId")
vRP.prepare('monit/getPortamalasVehicle', "SELECT portamalas FROM vrp_user_veiculos WHERE veiculo = @vehicleId AND user_id = @user_id")

vRP.prepare('monit/getItemVehicles', "SELECT user_id,veiculo, CAST(JSON_EXTRACT(portamalas, CONCAT('$.', SUBSTRING_INDEX(SUBSTRING_INDEX(JSON_SEARCH(portamalas,'one',@itemid,NULL,'$**.item'), '$.', -1), '.item', 1), '.amount')) AS UNSIGNED) AS amount FROM vrp_user_veiculos ORDER BY amount DESC LIMIT 25;")
vRP.prepare('monit/topCarsFac', "SELECT CAST( JSON_EXTRACT( dvalue, CONCAT( '$.', SUBSTRING_INDEX(SUBSTRING_INDEX(JSON_SEARCH(dvalue, 'one', @item, NULL, '$**.item'), '$.', -1), '.item', 1), '.amount' ) ) AS UNSIGNED ) AS amount, SUBSTRING_INDEX(SUBSTRING_INDEX(dkey, ':', -1), '_', 1) AS name, (SELECT user_id FROM vrp_user_identities WHERE registro = SUBSTRING_INDEX(dkey, '_', -1)) AS user_id FROM vrp_srv_data WHERE dkey LIKE 'tmpChest:%' AND JSON_UNQUOTE(JSON_EXTRACT(dvalue, CONCAT('$.', SUBSTRING_INDEX(SUBSTRING_INDEX(JSON_SEARCH(dvalue, 'one', @item, NULL, '$**.item'), '$.', -1), '.item', 1), '.item'))) = @item ORDER BY amount DESC LIMIT 25;")

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local ListItens = vRP.getAllItens()

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMANDOS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('topplayer', function(source,args)
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    if not vRP.hasPermission(user_id, "admin.permissao") then return end

    local item = args[1]
    if not item or item == "" then return end

    if not ListItens[item] then
        TriggerClientEvent("Notify",source,"negado","Este item não existe cadastrado.")
        return
    end
    local itemName = ListItens[item].name

    local query = vRP.query('monit/getItemPlayer', { itemid = item })
    local result = ""
    local result2 = ""
    for i = 1, #query do
        if query[i].amount ~= nil then
            result = result .. ("USER_ID: <b>%s</b> ITEM: <b>%s</b> <b>%s</b>x <br>"):format(query[i].user_id, itemName, query[i].amount)
            result2 = result2 .. ("clearinvall %s; | ITEM: %s %sx \n"):format(query[i].user_id, itemName, query[i].amount)
        end
    end

    local result = result ~= "" and result or "Nenhuma Informação encontrada"
    vRP.sendLog("https://discord.com/api/webhooks/1135584334418563162/DF99b7aTRKNo5CNTZubmG91RGHvvn4FkdqVdfA5w_-fZ90i2V0b1iwDKzyxKYZ95oYxx", "```prolog\n( INVENTARIO PLAYER )\n[ITEM]: "..itemName.."\n[USUARIOS]: \n"..result2.."```")
    TriggerClientEvent("Notify",source,"importante","( INVENTARIO PLAYER ) Filtrando pelo item: <b> "..itemName.. "</b>:<br><br>".. result, 30)
end)

RegisterCommand('topfacs', function(source,args)
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    if not vRP.hasPermission(user_id, "admin.permissao") then return end

    local item = args[1]
    if not item or item == "" then return end

    if not ListItens[item] then
        TriggerClientEvent("Notify",source,"negado","Este item não existe cadastrado.")
        return
    end
    local itemName = ListItens[item].name

    local query = vRP.query('monit/getItemFac', { itemid = item })
    local result = {}
    for i = 1, #query do
        local chestId = query[i].dkey
        if string.sub(chestId, 1, 8) == "orgChest" then 

            local rows = vRP.query('monit/getBauFac', { chestId = chestId })
            for _, row in ipairs(rows) do
                local bauData = json.decode(row.dvalue)
                for _, itemData in pairs(bauData) do
                    local itemName = itemData.item
                    local itemAmount = itemData.amount
                    
                    if item == itemName then 
                        if not result[chestId] then
                            result[chestId] = 0
                        end
                        
                        result[chestId] = result[chestId] + itemAmount
                    end
                end
            end
        end
    end 

    local resultExib = ""

    local sortedResults = {}
    for facName, totalAmount in pairs(result) do
        table.insert(sortedResults, { facName = facName, totalAmount = totalAmount })
    end
    
    table.sort(sortedResults, function(a, b)
        return a.totalAmount > b.totalAmount
    end)
    
    for _, playerData in ipairs(sortedResults) do
        local facName = playerData.facName:gsub("orgChest:", "")
        local totalAmount = playerData.totalAmount

        print(("Facção: %s, Total do Item %s: %d"):format(facName, item, totalAmount))
        resultExib = resultExib .. ("FAC: <b>%s</b> ITEM: <b>%s</b> <b>%s</b>x <br>"):format(facName, itemName, totalAmount)
    end
    
    local notificationMessage = "( INVENTARIO FAC ) Filtrando pelo item: <b>" .. itemName .. "</b>:<br><br>" .. (resultExib ~= "" and resultExib or "Nenhuma Informação encontrada")
    TriggerClientEvent("Notify", source, "importante", notificationMessage, 30)
end)

RegisterCommand('tophouses', function(source,args)
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    if not vRP.hasPermission(user_id, "admin.permissao") then return end

    local item = args[1]
    if not item or item == "" then return end

    if not ListItens[item] then
        TriggerClientEvent("Notify",source,"negado","Este item não existe cadastrado.")
        return
    end
    local itemName = ListItens[item].name
    local query = vRP.query('monit/getItemHouse', { itemid = item })
    local result = {}
    for i = 1, #query do
        local houseID = query[i].houseID
        local playerName = query[i].proprietario
        
        local rows = vRP.query('monit/getBauHouse', { houseID = houseID })
        for _, row in ipairs(rows) do
            local bauData = json.decode(row.bau)
            
            for _, itemData in pairs(bauData) do
                local itemName = itemData.item
                local itemAmount = itemData.amount
                
                if item == itemName then 
                    if not result[playerName] then
                        result[playerName] = 0
                    end
                    
                    result[playerName] = result[playerName] + itemAmount
                end
            end
        end
    end
    
    local resultExib = ""

    local sortedResults = {}
    for playerName, totalAmount in pairs(result) do
        table.insert(sortedResults, { playerName = playerName, totalAmount = totalAmount })
    end
    
    table.sort(sortedResults, function(a, b)
        return a.totalAmount > b.totalAmount
    end)
    
    for _, playerData in ipairs(sortedResults) do
        local playerName = playerData.playerName
        local totalAmount = playerData.totalAmount
        print(("Jogador: %s, Total do Item %s: %d"):format(playerName, item, totalAmount))
        resultExib = resultExib .. ("USER_ID: <b>%s</b> ITEM: <b>%s</b> <b>%s</b>x <br>"):format(playerName, itemName, totalAmount)
    end
    
    local notificationMessage = "( INVENTARIO CASAS ) Filtrando pelo item: <b>" .. itemName .. "</b>:<br><br>" .. (resultExib ~= "" and resultExib or "Nenhuma Informação encontrada")
    TriggerClientEvent("Notify", source, "importante", notificationMessage, 30)
end)

RegisterCommand('topcars', function(source, args)
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    if not vRP.hasPermission(user_id, "admin.permissao") then return end

    local item = args[1]
    if not item or item == "" then return end

    if not ListItens[item] then
        TriggerClientEvent("Notify", source, "negado", "Este item não existe cadastrado.")
        return
    end
    local itemName = ListItens[item].name

    local query = vRP.query('monit/getItemVehicles', { itemid = item })
    local result = {}
    for i = 1, #query do
        local vehicleId = query[i].veiculo
        local playerName = query[i].user_id

        local rows = vRP.query('monit/getPortamalasVehicle', { vehicleId = vehicleId, user_id = tonumber(playerName) })
        for _, row in ipairs(rows) do
            local bauData = json.decode(row.portamalas)
            
            for _, itemData in pairs(bauData) do
                local itemName = itemData.item
                local itemAmount = itemData.amount
                
                if item == itemName then 
                    if not result[playerName] then
                        result[playerName] = {}
                    end
                    
                    if not result[playerName][vehicleId] then
                        result[playerName][vehicleId] = 0
                    end
                    
                    result[playerName][vehicleId] = result[playerName][vehicleId] + itemAmount
                end
            end
        end
    end

    local resultExib = ""

    local sortedResults = {}
    for playerName, vehicles in pairs(result) do
        for vehicleId, totalAmount in pairs(vehicles) do
            table.insert(sortedResults, { playerName = playerName, totalAmount = totalAmount, vehicleId = vehicleId })
        end
    end
    
    table.sort(sortedResults, function(a, b)
        return a.totalAmount > b.totalAmount
    end)
    
    for _, playerData in ipairs(sortedResults) do
        local playerName = playerData.playerName
        local totalAmount = playerData.totalAmount
        local vehicleId = playerData.vehicleId
        
        print(("Jogador: %s, Veiculo: %s, Total do Item %s: %d"):format(playerName, vehicleId, itemName, totalAmount))
        resultExib = resultExib .. ("USER_ID: <b>%s (%s)</b> ITEM: <b>%s</b> <b>%s</b>x <br>"):format(playerName, vehicleId, itemName, totalAmount)
    end

    local notificationMessage = "( INVENTARIO DOS CARROS ) Filtrando pelo item: <b>" .. itemName .. "</b>:<br><br>" .. (resultExib ~= "" and resultExib or "Nenhuma Informação encontrada")
    TriggerClientEvent("Notify", source, "importante", notificationMessage, 30)
end)


RegisterCommand('topcarsfac', function(source,args)
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    if not vRP.hasPermission(user_id, "admin.permissao") then return end

    local item = args[1]
    if not item or item == "" then return end

    if not ListItens[item] then
        TriggerClientEvent("Notify",source,"negado","Este item não existe cadastrado.")
        return
    end
    local itemName = ListItens[item].name

    local query = vRP.query('monit/topCarsFac', { item = item })
    local result = {}
    for i = 1, #query do
        local vehicleId = query[i].name
        local playerName = query[i].user_id
        local playerIdentity = vRP.getUserIdentity(playerName)
        local rows = exports["oxmysql"]:executeSync("SELECT * FROM vrp_srv_data WHERE dkey LIKE '%tmpChest:%' AND dkey LIKE CONCAT('%', ?, '%')", {playerIdentity.registro})
        for _, row in ipairs(rows) do
            local bauData = json.decode(row.dvalue)
            
            for _, itemData in pairs(bauData) do
                local itemName = itemData.item
                local itemAmount = itemData.amount
                
                if item == itemName then 
                    if not result[playerName] then
                        result[playerName] = {}
                    end
                    
                    if not result[playerName][vehicleId] then
                        result[playerName][vehicleId] = 0
                    end
                    
                    result[playerName][vehicleId] = result[playerName][vehicleId] + itemAmount
                end
            end
        end
    end

    local resultExib = ""

    local sortedResults = {}
    for playerName, vehicles in pairs(result) do
        for vehicleId, totalAmount in pairs(vehicles) do
            table.insert(sortedResults, { playerName = playerName, totalAmount = totalAmount, vehicleId = vehicleId })
        end
    end
    
    table.sort(sortedResults, function(a, b)
        return a.totalAmount > b.totalAmount
    end)
    
    for _, playerData in ipairs(sortedResults) do
        local playerName = playerData.playerName
        local totalAmount = playerData.totalAmount
        local vehicleId = playerData.vehicleId
        
        print(("Jogador: %s, Veiculo: %s, Total do Item %s: %d"):format(playerName, vehicleId, itemName, totalAmount))
        resultExib = resultExib .. ("USER_ID: <b>%s (%s)</b> ITEM: <b>%s</b> <b>%s</b>x <br>"):format(playerName, vehicleId, itemName, totalAmount)
    end

    local notificationMessage = "( INVENTARIO DOS CARROS ) Filtrando pelo item: <b>" .. itemName .. "</b>:<br><br>" .. (resultExib ~= "" and resultExib or "Nenhuma Informação encontrada")
    TriggerClientEvent("Notify", source, "importante", notificationMessage, 30)
end)