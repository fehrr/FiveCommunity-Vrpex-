cfg = {}

cfg.geral = {
    tempoMin = 10
}

cfg.types = {
    ['Consertar'] = {
        anim = 'WORLD_HUMAN_WELDING',
        dict = nil,
        prop = nil,
        reduzir = 2
    }
}

cfg.locations = {
    [1] = {type = 'Consertar', coords = vec3(1664.76, 2501.32, 45.57), heading = 2.44, minBlip = 0},
    [2] = {type = 'Consertar', coords = vec3(1622.97, 2507.82, 45.57), heading = 101.15, minBlip = 0},
    [3] = {type = 'Consertar', coords = vec3(1706.32, 2481.38, 45.57), heading = 223.69, minBlip = 0},
    [4] = {type = 'Consertar', coords = vec3(1699.78, 2474.98, 45.57), heading = 227.57, minBlip = 0},
    [5] = {type = 'Consertar', coords = vec3(1679.88, 2480.59, 45.57), heading = 133.06, minBlip = 0},
    [6] = {type = 'Consertar', coords = vec3(1643.79, 2491.07, 45.57), heading = 192.73, minBlip = 0},
    [7] = {type = 'Consertar', coords = vec3(1610.12, 2539.85, 45.57), heading = 131.28, minBlip = 0},
    [8] = {type = 'Consertar', coords = vec3(1609.3, 2566.87, 45.57), heading = 49.95, minBlip = 0},
    [9] = {type = 'Consertar', coords = vec3(1623.94, 2577.3, 45.57), heading = 266.28, minBlip = 0},
    [10] = {type = 'Consertar', coords = vec3(1630.0, 2563.93, 45.57), heading = 1.59, minBlip = 0},
    [11] = {type = 'Consertar', coords = vec3(1652.58, 2563.86, 45.57), heading = 0.35, minBlip = 0},
    [12] = {type = 'Consertar', coords = vec3(1760.09, 2519.11, 45.57), heading = 258.51, minBlip = 0},
    [13] = {type = 'Consertar', coords = vec3(1737.34, 2505.04, 45.57), heading = 163.18, minBlip = 0}
}
local nveh = nil
local pveh01 = nil
local pveh02 = nil
local Transporte = false
local chegou = false
local prisioneiro = false

function bridge.checkPrisonArea()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId()))
    local _, i = GetGroundZFor_3dCoord(-1091.29, -821.44, 5.48)
    local distance = Vdist(x, y, z, -1091.29, -821.44, 5.48, i)
    if distance <= 20.0 then
        return true
    end
end

function bridge.levarPrisioneiro(prisionTime)
    if GetInvokingResource() ~= nil then
        return
    end

    local ped = PlayerPedId()
    SetEntityCoords(ped, 1716.85,2525.78,45.54)
    vSERVER.colocarPrisao(prisionTime)
    print('oi3')
    Transporte = false
    chegou = true

end

-----------------------------------------------------------------------------------------------------------------------------------------
-- PRISÃO ADM
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent(
    'prisaoADM',
    function(status)
        prisioneiro = status
        local ped = PlayerPedId()
        if (not prisioneiro) then
            return
        end
        SetEntityInvincible(ped, false) --mqcu
        FreezeEntityPosition(ped, true)
        SetEntityVisible(ped, false, false)
        SetTimeout(
            10000,
            function()
                SetEntityInvincible(ped, false)
                FreezeEntityPosition(ped, false)
                SetEntityVisible(ped, true, false)
            end
        )
    end
)

-- RegisterNetEvent('blacklistADM',function(status)
--     prisioneiro = status
--     local ped = PlayerPedId()
--     if (not prisioneiro) then
--         return
--     end
--     SetEntityInvincible(ped, false) --mqcu
--     FreezeEntityPosition(ped, true)
--     SetEntityVisible(ped, false, false)
--     SetTimeout(10000,function()
--         SetEntityInvincible(ped, false)
--         FreezeEntityPosition(ped, false)
--         SetEntityVisible(ped, true, false)
--     end)
-- end)

function bridge.prisioneiro(status)
    if GetInvokingResource() ~= nil then
        return
    end
    prisioneiro = status
    -- DoScreenFadeOut(1000)

    Wait(1000)
    local ped = PlayerPedId()
    if prisioneiro then
        SetEntityInvincible(ped, false) --mqcu
        FreezeEntityPosition(ped, true)
        SetEntityVisible(ped, false, false)
        SetTimeout(
            3000,
            function()
                SetEntityInvincible(ped, false)
                FreezeEntityPosition(ped, false)
                SetEntityVisible(ped, true, false)
            end
        )
        clearPeds()
        vRP.teleport(1679.1, 2514.55, 45.55)
    end

    Wait(3500)
    DoScreenFadeIn(1000)
end

function bridge.setarRoupasPrisional()
    if GetInvokingResource() ~= nil then
        return
    end

    if GetEntityModel(PlayerPedId()) == GetHashKey('mp_m_freemode_01') then
        SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 2)
        SetPedComponentVariation(PlayerPedId(), 3, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 4, 138, 0, 2)
        SetPedComponentVariation(PlayerPedId(), 6, 34, 0, 2)
        SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 2)
        SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 2)
        SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 11, 382, 0, 2)
        SetPedPropIndex(PlayerPedId(), 0, -1, 0, 0)
        SetPedPropIndex(PlayerPedId(), 6, -1, 0, 0)
    elseif GetEntityModel(PlayerPedId()) == GetHashKey('mp_f_freemode_01') then
        SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 3, 1, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 4, 145, 0, 2)
        SetPedComponentVariation(PlayerPedId(), 6, 35, 0, 2)
        SetPedComponentVariation(PlayerPedId(), 7, 47, 0, 2)
        SetPedComponentVariation(PlayerPedId(), 8, 7, 0, 2)
        SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
        SetPedComponentVariation(PlayerPedId(), 11, 402, 0, 2)
        SetPedPropIndex(PlayerPedId(), 0, -1, 0, 0)
        SetPedPropIndex(PlayerPedId(), 6, -1, 0, 0)
    end
end

function clearPeds()
    TriggerServerEvent('bm_module:deleteVehicles', VehToNet(nveh))
    TriggerServerEvent('trydeleteped', PedToNet(pveh01))
    TriggerServerEvent('trydeleteped', PedToNet(pveh02))
end

Citizen.CreateThread(
    function()
        while true do
            Citizen.Wait(5000)
            if prisioneiro then
                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1717.26, 2526.04, 47.9, true)
                if distance >= 150 then
                    SetEntityCoords(PlayerPedId(), 1717.26, 2526.04, 47.9)
                    TriggerEvent('Notify', 'negado', 'O agente penitenciário encontrou você tentando escapar.', 5)
                end
            end
        end
    end
)

local agindo = false
local reducaopenal = false
local delayServico = {}

Citizen.CreateThread(
    function()
        while true do
            local time = 1000
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            if prisioneiro then
                if not agindo then
                    for k, v in pairs(cfg.locations) do
                        local distance = #(pedCoords - v.coords)
                        if distance <= 15.0 then
                            time = 5
                            DrawMarker(
                                21,
                                v.coords[1],
                                v.coords[2],
                                v.coords[3] - v.minBlip,
                                0,
                                0,
                                0,
                                0,
                                0,
                                130.0,
                                0.5,
                                1.0,
                                0.5,
                                0,
                                210,
                                0,
                                180,
                                1,
                                0,
                                0,
                                1
                            )
                            if distance <= 3.0 then
                                if IsControlJustReleased(1, 51) then
                                    if delayServico[k] == nil or not delayServico[k] then
                                        if vSERVER.checkTempoPrisao() > cfg.geral.tempoMin then
                                            iniciarServico(k, v.type, v.coords, v.heading)
                                        else
                                            TriggerEvent('Notify', 'negado', 'Não precisamos mais de seus serviços.', 5)
                                        end
                                    else
                                        TriggerEvent(
                                            'Notify',
                                            'negado',
                                            'Você já passou por esse local aguarde <b>' ..
                                                delayServico[k] .. ' segundo(s)</b>.',
                                            5
                                        )
                                    end
                                end
                            end
                        end
                    end
                end
            end

            Citizen.Wait(time)
        end
    end
)

function iniciarServico(id, servico, coords, heading)
    local ped = PlayerPedId()
    if ped then
        if servico == 'Consertar' then
            agindo = true
            SetEntityCoords(ped, coords[1], coords[2], coords[3] - 0.8)
            SetEntityHeading(ped, heading)
            vRP._playAnim(false, {task = cfg.types[servico].anim}, false)

            local finished = vRP.taskBar(15000, math.random(10, 15))
            if finished then
                local finished = vRP.taskBar(15000, math.random(10, 15))
                if finished then
                    local finished = vRP.taskBar(15000, math.random(10, 15))
                    if finished then
                        delayServico[id] = 90

                        vRP._DeletarObjeto()
                        ClearPedTasks(GetPlayerPed(-1))
                        reduzirTempo(cfg.types[servico].reduzir)
                    end
                end
            end
            agindo = false
        end
    end
end

function reduzirTempo(tempo)
    vSERVER.reduzirPrisao(tempo)
end

Citizen.CreateThread(
    function()
        while true do
            local time = 1000
            if prisioneiro then
                time = 5
                local distance01 =
                    GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1691.59, 2566.05, 45.56, true)
                local distance02 =
                    GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), 1669.51, 2487.71, 45.82, true)

                if GetEntityHealth(PlayerPedId()) <= 101 then
                    reducaopenal = false
                    vRP._DeletarObjeto()
                end

                if distance01 <= 100 and not reducaopenal then
                    DrawMarker(
                        21,
                        1691.59,
                        2566.05,
                        45.56,
                        0,
                        0,
                        0,
                        0,
                        180.0,
                        130.0,
                        1.0,
                        1.0,
                        0.5,
                        255,
                        255,
                        255,
                        100,
                        1,
                        0,
                        0,
                        1
                    )
                    if distance01 <= 1.2 then
                        drawTxt('PRESSIONE  ~b~E~w~  PARA COLETAR', 4, 0.5, 0.93, 0.50, 255, 255, 255, 180)
                        if IsControlJustPressed(0, 38) then
                            reducaopenal = true
                            ResetPedMovementClipset(PlayerPedId(), 0)
                            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
                            vRP._CarregarObjeto('anim@heists@box_carry@', 'idle', 'hei_prop_heist_box', 50, 28422)
                        end
                    end
                end

                if distance02 <= 100 and reducaopenal then
                    DrawMarker(
                        21,
                        1669.51,
                        2487.71,
                        45.82,
                        0,
                        0,
                        0,
                        0,
                        180.0,
                        130.0,
                        1.0,
                        1.0,
                        0.5,
                        255,
                        255,
                        255,
                        100,
                        1,
                        0,
                        0,
                        1
                    )
                    if distance02 <= 1.2 then
                        drawTxt('PRESSIONE  ~b~E~w~  PARA CONCLUIR', 4, 0.5, 0.93, 0.50, 255, 255, 255, 180)
                        if IsControlJustPressed(0, 38) then
                            reducaopenal = false
                            reduzirTempo(1)
                            vRP._DeletarObjeto()
                        end
                    end
                end
            end

            Citizen.Wait(time)
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            local time = 1000
            if reducaopenal then
                time = 5
                BlockWeaponWheelThisFrame()
                DisableControlAction(0, 21, true)
                DisableControlAction(0, 24, true)
                DisableControlAction(0, 25, true)
                DisableControlAction(0, 58, true)
                DisableControlAction(0, 263, true)
                DisableControlAction(0, 264, true)
                DisableControlAction(0, 257, true)
                DisableControlAction(0, 140, true)
                DisableControlAction(0, 141, true)
                DisableControlAction(0, 142, true)
                DisableControlAction(0, 143, true)
                DisableControlAction(0, 75, true)
                DisableControlAction(0, 22, true)
                DisableControlAction(0, 32, true)
                DisableControlAction(0, 268, true)
                DisableControlAction(0, 33, true)
                DisableControlAction(0, 269, true)
                DisableControlAction(0, 34, true)
                DisableControlAction(0, 270, true)
                DisableControlAction(0, 35, true)
                DisableControlAction(0, 271, true)
                DisableControlAction(0, 288, true)
                DisableControlAction(0, 289, true)
                DisableControlAction(0, 170, true)
                DisableControlAction(0, 166, true)
                DisableControlAction(0, 73, true)
                DisableControlAction(0, 167, true)
                DisableControlAction(0, 177, true)
                DisableControlAction(0, 311, true)
                DisableControlAction(0, 344, true)
                DisableControlAction(0, 29, true)
                DisableControlAction(0, 182, true)
                DisableControlAction(0, 245, true)
                DisableControlAction(0, 246, true)
                DisableControlAction(0, 303, true)
                DisableControlAction(0, 187, true)
                DisableControlAction(0, 189, true)
                DisableControlAction(0, 190, true)
                DisableControlAction(0, 188, true)
            end

            Citizen.Wait(time)
        end
    end
)

function drawTxt(text, font, x, y, scale, r, g, b, a)
    SetTextFont(font)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextOutline()
    SetTextCentre(1)
    SetTextEntry('STRING')
    AddTextComponentString(text)
    DrawText(x, y)
end
