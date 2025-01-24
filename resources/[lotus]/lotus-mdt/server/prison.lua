function prison_soltar(user_id)
    local source = vRP.getUserSource(parseInt(user_id))
    if (not user_id or not source) then
        return
    end
    local value = vRP.getUData(parseInt(user_id), 'vRP:prisao')
    local tempo = json.decode(value) or 0
    if parseInt(tempo) >= 0 then
        vCLIENT.prisioneiro(source, false)
        vRP.setUData(parseInt(user_id), 'vRP:prisao', json.encode(-1))
        TriggerClientEvent('Notify', source, 'importante', 'Sua detenção acabou, esperamos não ve-lo novamente.', 5)
        vRPC._teleport(source, 1847.94, 2586.04, 45.68)
        vRP.carregarConta(user_id, false)
        vRPC._addPrisioneiro(source, false)
    end
end
function bridge.setarPrisioneiro(user_id)
    if GetInvokingResource() ~= nil then
        return
    end

    local source = vRP.getUserSource(user_id)
    if user_id then
        vRP.setHunger(user_id, 0)
        vRP.setThirst(user_id, 0)
        vRPC._setHealth(source, 300)
        -- vRPC._setHandcuffed(source, true)
        vRP.clearInventory(user_id)
        vRPC._giveWeapons(source, {}, true)
        vCLIENT._updateWeapons(source)
        TriggerClientEvent('Notify', source, 'negado', 'Seus Itens ilegais foram apreendidos.', 5)
    end
end
function bridge.colocarPrisao(time)
    print('bridge.colocarPrisao')
    if GetInvokingResource() ~= nil then
        return
    end

    local source = source
    local user_id = vRP.getUserId(source)

    if user_id then
        time = time - 5

        if time <= 0 then
            time = 0
        end

        TriggerClientEvent(
            'chatMessage',
            -1,
            'PRISÃO',
            {0, 0, 0},
            '^0 O ^3' .. GetPlayerName(source) .. ' ^0 foi preso(a) e condenado(a) por ^3' .. time .. ' ^0mes(s).'
        )

        print('removendo algemas 1')
        vRP.setUData(user_id, 'vRP:prisao', json.encode(tonumber(time)))
        vCLIENT._prisioneiro(source, true)
        print('removendo algemas 2')
        vCLIENT.setarRoupasPrisional(source)
        print('removendo algemas 3')
        bridge.setarPrisioneiro(user_id)
        print('removendo algemas 4')
        bridge.cachedData.tempoPrisao[user_id] = nil
        print('removendo algemas5 ')
        vRPC._setHandcuffed(source, false)
        ClearPedTasksImmediately(GetPlayerPed(source))
        prison_lock(parseInt(user_id))
    end
end
prison_lock = function(user_id)
    local source = vRP.getUserSource(parseInt(user_id))
    if not source then
        return
    end
    SetTimeout(
        60000,
        function()
            local value = vRP.getUData(parseInt(user_id), 'vRP:prisao')
            local tempo = json.decode(value) or 0
            if parseInt(tempo) >= 1 then
                vRP.setUData(parseInt(user_id), 'vRP:prisao', json.encode(parseInt(tempo) - 1))
                vRPC._setHealth(source, 300)
                TriggerClientEvent(
                    'Notify',
                    source,
                    'importante',
                    'Você ainda vai passar ' .. parseInt(tempo) .. ' meses na prisão.',
                    5
                )
                prison_lock(parseInt(user_id))
            elseif parseInt(tempo) == 0 or parseInt(tempo) == -1 then
                vCLIENT._prisioneiro(source, false)
                vRP.setUData(parseInt(user_id), 'vRP:prisao', json.encode(-1))
                TriggerClientEvent(
                    'Notify',
                    source,
                    'importante',
                    'Sua detenção acabou, esperamos não ve-lo novamente.',
                    5
                )
                vRPC._teleport(source, 1847.94, 2586.04, 45.68)
            end
        end
    )
end
function bridge.reduzirPrisao(reduzir)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local value = vRP.getUData(parseInt(user_id), 'vRP:prisao')
        local tempo = json.decode(value) or 0
        if tempo > 0 then
            vRP.setUData(user_id, 'vRP:prisao', json.encode(tonumber(tempo - reduzir)))
            TriggerClientEvent(
                'Notify',
                source,
                'sucesso',
                'Parabens! Você acabou de reduzir <b>' ..
                    reduzir .. ' mes(es)</b> de sua prisão, agora restam <b>' .. tempo - reduzir .. '</b> meses.',
                5
            )
        end
    end
end
function bridge.checkTempoPrisao()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local value = vRP.getUData(parseInt(user_id), 'vRP:prisao')
        local tempo = json.decode(value) or 0
        return tonumber(tempo)
    end
end
function bridge.adicionarCriminal(user_id, tipo, criminal)
    local source = vRP.getUserSource(user_id)
    local cCriminal = vRP.query('vRP/get_user_identity', {user_id = user_id})
    local gCriminal = json.decode(cCriminal[1].criminal) or nil
    if user_id then
        gCriminal[os.time()] = {tipo = tipo, motivo = criminal}
        vRP.execute('vRP/add_criminal', {user_id = user_id, criminal = json.encode(gCriminal)})
    end
end
AddEventHandler(
    'vRP:playerSpawn',
    function(user_id, source, first_spawn)
        if not user_id then
            return
        end

        local value = vRP.getUData(parseInt(user_id), 'vRP:prisao')
        local tempo = json.decode(value)
        if tempo then
            if tempo == nil then
                tempo = 0
            end
            if parseInt(tempo) >= 0 then
                vRPC._teleport(source, 1717.26, 2526.04, 47.9)
                prison_lock(parseInt(user_id))
                vCLIENT._prisioneiro(source, true)
                vCLIENT._setarRoupasPrisional(source)
            end
        end
    end
)
AddEventHandler(
    'vRP:playerLeave',
    function(user_id, player)
        if user_id then
            if bridge.cachedData.tempoPrisao[user_id] ~= nil then
                TriggerClientEvent(
                    'chatMessage',
                    -1,
                    'PRISÃO',
                    {0, 0, 0},
                    '^0 O ^3' .. GetPlayerName(player) .. ' ^0 tentou escapar do transporte para a prisao e foi pego.'
                )
                vRP.setUData(user_id, 'vRP:prisao', json.encode(tonumber(bridge.cachedData.tempoPrisao[user_id] + 10)))
                bridge.cachedData.tempoPrisao[user_id] = nil
            end
        end
    end
)
-----------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE PRISAO ADMIN
-----------------------------------------------------------------------------------------------------------------------------------------
local prenderadm = function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') or vRP.hasPermission(user_id, 'moderador.permissao') or vRP.hasPermission(user_id, 'suporte.permissao') then
        local idPlayer = vRP.prompt(source, 'Digite o ID:', '')
        if tonumber(idPlayer) then
            local nplayer = vRP.getUserSource(tonumber(idPlayer))
            if nplayer then
                local tempoPrisao = vRP.prompt(source, 'Digite o tempo da prisão', '')
                if tonumber(tempoPrisao) then
                    local motivoPrisao = vRP.prompt(source, 'Digite o motivo da prisão', '')
                    if motivoPrisao ~= nil and motivoPrisao ~= '' then
                        local nidentity = vRP.getUserIdentity(tonumber(idPlayer))
                        if nidentity then
                            TriggerClientEvent(
                                'chatMessage',
                                -1,
                                'PRISÃO ADM',
                                {0, 0, 0},
                                '^0 O ^3' ..
                                    nidentity.nome ..
                                        ' ' ..
                                            nidentity.sobrenome ..
                                                ' ^0 foi preso(a) por ^3' ..
                                                    tonumber(tempoPrisao) ..
                                                        ' ^0minutos ^0 pelo motivo: ^3 ' .. motivoPrisao
                            )
                            TriggerClientEvent(
                                'chatMessage',
                                nplayer,
                                'PRISÃO ADM',
                                {0, 0, 0},
                                '^0Você foi preso pelo admin: ^2' .. GetPlayerName(source) .. ' (' .. user_id .. ')^0.'
                            )
                            vRPC._teleport(nplayer, 1717.26, 2526.04, 47.97)
                            prison_lock_adm(tonumber(idPlayer))
                            TriggerClientEvent('prisaoADM', nplayer, true)
                            vCLIENT.setarRoupasPrisional(nplayer)
                            vRP.setUData(tonumber(idPlayer), 'vRP:prisao:ADM', json.encode(tonumber(tempoPrisao)))
                            vRP.sendLog(
                                'https://discord.com/api/webhooks/1152380942929891358/RAII99ztiEpbDg_n5ELP9vEVvdNhJVQN-Dlxn6Xg9mNR5nQ-Wtgyt-g5M2cviQZ9dpFz',
                                'O ADMIN ' ..
                                    user_id .. ' PRENDEU O ID: ' .. idPlayer .. 'PELO MOTIVO: ' .. motivoPrisao
                            )
                            vRP.clearInventory(tonumber(idPlayer))
                            TriggerClientEvent('Notify', nplayer, 'importante', 'Os guardas apreenderam seus itens.', 5)

                        end
                    else
                        TriggerClientEvent('chatMessage', source, '^2Digite o Motivo Corretamente.')
                    end
                else
                    TriggerClientEvent('chatMessage', source, '^2Digite o Tempo da Prisao Corretamente.')
                end
            else
                local tempoPrisao = vRP.prompt(source, 'Digite o tempo da prisão', '')
                if tonumber(tempoPrisao) then
                    local motivoPrisao = vRP.prompt(source, 'Digite o motivo da prisão', '')
                    if motivoPrisao ~= nil and motivoPrisao ~= '' then
                        TriggerClientEvent(
                            'chatMessage',
                            source,
                            '** Jogador Offline ** ^2 Você prendeu ' .. idPlayer .. ' por ' .. tempoPrisao .. ' mese(s)'
                        )
                        vRP.setUData(tonumber(idPlayer), 'vRP:prisao:ADM', json.encode(tonumber(tempoPrisao)))
                        vRP.sendLog(
                            'https://discord.com/api/webhooks/1103750328152768763/AtNl0kd23vnYXrkn8cr42zcglnpwuwyG708cHz3k0F5Ddxvp1ODu1uaJ8Q9gGgJbe4ox',
                            'O ADMIN ' .. user_id .. ' PRENDEU O ID: ' .. idPlayer .. 'PELO MOTIVO: ' .. motivoPrisao
                        )
                    end
                end
            end
        else
            TriggerClientEvent('chatMessage', source, '^2Digite o ID Do player Corretamente.')
        end
    end
end

local prenderpm = function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if
        vRP.hasPermission(user_id, 'admin.permissao') or vRP.hasPermission(user_id, 'developer.permissao') or
            vRP.hasPermission(user_id, 'perm.respilegal')
     then
        local idPlayer = vRP.prompt(source, 'Digite o ID:', '')
        if idPlayer ~= nil then
            local nplayer = vRP.getUserSource(tonumber(idPlayer))
            local value = vRP.getUData(parseInt(idPlayer), 'vRP:prisao:ADM')
            if value then
                local tempoadm = json.decode(value)
                if (tonumber(tempoadm) and tonumber(tempoadm) > 0) then
                    TriggerClientEvent(
                        'Notify',
                        source,
                        'negado',
                        'Esse player está com PRISÃO ADM, então a soltura é NEGADA!'
                    )
                    return
                end
            end

            if nplayer then
                local motivoPrisao = vRP.prompt(source, 'Digite o motivo da soltura', '')
                if motivoPrisao ~= nil and motivoPrisao ~= '' then
                    local nidentity = vRP.getUserIdentity(tonumber(idPlayer))
                    if nidentity then
                        prison_soltar(tonumber(idPlayer))
                        vRP.sendLog(
                            'PRENDERADM',
                            'O ADMIN ' .. user_id .. ' SOLTOU O ID: ' .. idPlayer .. 'PELO MOTIVO: ' .. motivoPrisao
                        )
                    end
                else
                    TriggerClientEvent('chatMessage', source, '^2Digite o Motivo Corretamente.')
                end
            else
                local motivoPrisao = vRP.prompt(source, 'Digite o motivo da soltura', '')
                if motivoPrisao ~= nil and motivoPrisao ~= '' then
                    TriggerClientEvent(
                        'chatMessage',
                        source,
                        '** Jogador Offline ** ^2 Você soltou ' .. idPlayer .. ' por ' .. motivoPrisao .. '!'
                    )
                    vRP.setUData(tonumber(idPlayer), 'vRP:prisao', json.encode(-1))
                    vRP.sendLog(
                        'PRENDERADM',
                        'O ADMIN ' .. user_id .. ' SOLTOU O ID: ' .. idPlayer .. 'PELO MOTIVO: ' .. motivoPrisao
                    )

                    vRP._generateLog(
                        {
                            category = "prisao",
                            room = 'prenderadm',
                            user_id = user_id,
                            target_id = tonumber(idPlayer),
                            message = ([[O ADMIN %s SOLTOU O ID %s PELO MOTIVO %s]]):format(
                                user_id,
                                idPlayer,
                                motivoPrisao
                            )
                        }
                    )
                end
            end
        else
            TriggerClientEvent('chatMessage', source, '^2Digite o ID Do player Corretamente.')
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------
-- PRISÃO ADM
--------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler(
    'vRP:playerSpawn',
    function(user_id, source, first_spawn)
        if not source then
            return
        end

        local value = vRP.getUData(parseInt(user_id), 'vRP:prisao:ADM')
        local tempo = json.decode(value)
        if tempo ~= nil then
            if tempo == nil then
                tempo = 0
            end

            if parseInt(tempo) > 0 then
                TriggerClientEvent('prisaoADM', source, true)
                vRPC.teleport(source, 1717.26, 2526.04, 47.9)
                prison_lock_adm(parseInt(user_id))
                vCLIENT._setarRoupasPrisional(source)
            end
        end
    end
)

prison_lock_adm = function(target_id)
    local player = vRP.getUserSource(parseInt(target_id))
    if player then
        SetTimeout(
            60000,
            function()
                local value = vRP.getUData(parseInt(target_id), 'vRP:prisao:ADM')
                local tempo = json.decode(value) or 0
                if parseInt(tempo) >= 1 then
                    TriggerClientEvent(
                        'chatMessage',
                        player,
                        'PRISAO ADM',
                        {0, 0, 0},
                        '^0Você Ainda vai passar ^5' .. parseInt(tempo) .. 'm^0 preso.'
                    )
                    vRP.setUData(parseInt(target_id), 'vRP:prisao:ADM', json.encode(parseInt(tempo) - 1))
                    prison_lock_adm(parseInt(target_id))
                    vRPC._setHealth(player, 300)
                    vRP.setHunger(parseInt(target_id), 0)
                    vRP.setThirst(parseInt(target_id), 0)
                elseif parseInt(tempo) == 0 or parseInt(tempo) == -1 then
                    TriggerClientEvent('prisaoADM', player, false)
                    vRPC.teleport(player, 1847.94, 2586.04, 45.68)
                    vRP.setUData(parseInt(target_id), 'vRP:prisao:ADM', json.encode(-1))
                end
            end
        )
    end
end

local addbl = function(source, args, rawCommand)
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id, 'admin.permissao') then
        local idPlayer = vRP.prompt(source, 'Digite o ID:', '')
        if tonumber(idPlayer) then
            local nplayer = vRP.getUserSource(tonumber(idPlayer))
            if nplayer then
                local tempoPrisao = vRP.prompt(source, 'Digite o tempo de blacklist', '')
                if tonumber(tempoPrisao) then
                    local motivoPrisao = vRP.prompt(source, 'Digite o motivo da blacklist', '')
                    if motivoPrisao ~= nil and motivoPrisao ~= '' then
                        local nidentity = vRP.getUserIdentity(tonumber(idPlayer))
                        if nidentity then
                            TriggerClientEvent(
                                'chatMessage',
                                -1,
                                'BLACKLIST ADM',
                                {0, 0, 0},
                                '^0 O ^3' ..
                                    nidentity.nome ..
                                        ' ' ..
                                            nidentity.sobrenome ..
                                                ' ^0 foi adicionado(a) na blacklist^3' ..
                                                    tonumber(tempoPrisao) ..
                                                        ' ^0minutos ^0 pelo motivo: ^3 ' .. motivoPrisao
                            )
                            TriggerClientEvent(
                                'chatMessage',
                                nplayer,
                                'BLACKLIST ADM',
                                {0, 0, 0},
                                '^0Você foi adicionado na blacklist pelo admin: ^2' ..
                                    GetPlayerName(source) .. ' (' .. user_id .. ')^0.'
                            )
                            blacklist_adm(tonumber(idPlayer))
                            vRP.setUData(tonumber(idPlayer), 'vRP:blacklist:ADM', json.encode(tonumber(tempoPrisao)))
                            vRP.clearInventory(tonumber(idPlayer))
                            TriggerClientEvent('Notify', nplayer, 'importante', 'Os guardas apreenderam seus itens.', 5)
                            vRP.addUserGroup(tonumber(idPlayer), 'camisadeforca')
                            vRPC._giveWeapons(nplayer, {}, true)

                            vRP._generateLog(
                                {
                                    category = "blacklist",
                                    room = 'blacklistuser',
                                    user_id = user_id,
                                    target_id = tonumber(idPlayer),
                                    message = ([[O ADMIN %s ADD BLACKLIST O ID %s PELO MOTIVO %s]]):format(
                                        user_id,
                                        idPlayer,
                                        motivoPrisao
                                    )
                                }
                            )
                        end
                    else
                        TriggerClientEvent('chatMessage', source, '^2Digite o Motivo Corretamente.')
                    end
                else
                    TriggerClientEvent('chatMessage', source, '^2Digite o Tempo da Prisao Corretamente.')
                end
            else
                local tempoPrisao = vRP.prompt(source, 'Digite o tempo da blacklist', '')
                if tonumber(tempoPrisao) then
                    local motivoPrisao = vRP.prompt(source, 'Digite o motivo da blacklist', '')
                    if motivoPrisao ~= nil and motivoPrisao ~= '' then
                        TriggerClientEvent(
                            'chatMessage',
                            source,
                            '** Jogador Offline ** ^2 Você add blacklist ' ..
                                idPlayer .. ' por ' .. tempoPrisao .. ' mese(s)'
                        )
                        vRP.setUData(tonumber(idPlayer), 'vRP:blacklist:ADM', json.encode(tonumber(tempoPrisao)))
                        vRP._generateLog(
                            {
                                category = "blacklist",
                                room = 'blacklistuser',
                                user_id = user_id,
                                target_id = tonumber(idPlayer),
                                message = ([[O ADMIN %s ADD BLACKLIST O ID %s PELO MOTIVO %s]]):format(
                                    user_id,
                                    idPlayer,
                                    motivoPrisao
                                )
                            }
                        )
                    end
                end
            end
        else
            TriggerClientEvent('chatMessage', source, '^2Digite o ID Do player Corretamente.')
        end
    end
end

AddEventHandler(
    'vRP:playerSpawn',
    function(user_id, source, first_spawn)
        if not source then
            return
        end
        local value = vRP.getUData(parseInt(user_id), 'vRP:blacklist:ADM')
        local tempo = json.decode(value)
        if tempo ~= nil then
            if tempo == nil then
                tempo = 0
            end
            if parseInt(tempo) > 0 then
                blacklist_adm(parseInt(user_id))
            end
        end
    end
)

blacklist_adm = function(target_id)
    local player = vRP.getUserSource(parseInt(target_id))
    if player then
        SetTimeout(
            60000,
            function()
                local value = vRP.getUData(parseInt(target_id), 'vRP:blacklist:ADM')
                local tempo = json.decode(value) or 0
                if parseInt(tempo) >= 1 then
                    TriggerClientEvent(
                        'chatMessage',
                        player,
                        'BLACKLIST ADM',
                        {0, 0, 0},
                        '^0Você Ainda vai passar ^5' .. parseInt(tempo) .. 'm^0 em blacklist.'
                    )
                    vRP.setUData(parseInt(target_id), 'vRP:blacklist:ADM', json.encode(parseInt(tempo) - 2))
                    blacklist_adm(parseInt(target_id))
                elseif parseInt(tempo) == 0 or parseInt(tempo) == -1 then
                    vRP.setUData(parseInt(target_id), 'vRP:blacklist:ADM', json.encode(-1))
                    vRP.removeUserGroup(parseInt(target_id), 'camisadeforca')
                end
            end
        )
    end
end

RegisterCommand('prenderpm', prenderpm)
RegisterCommand('prenderadm', prenderadm)
RegisterCommand('addbl', addbl)
