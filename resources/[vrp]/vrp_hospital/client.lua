local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

src = {}
Tunnel.bindInterface("vrp_hospital",src)
vSERVER = Tunnel.getInterface("vrp_hospital")

local segundos = 0

----------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE TRATAMENTO
----------------------------------------------------------------------------------------------------------------------------------------
local in_area = 0 
local deitado = false
local tratamento = false
local segundosT = 0
local vida = 0

local macas = {
    [1] = { -458.41,-281.07,34.91, deitado = { -458.88,-280.1,35.84,198.32 } }, 
    [2] = { -462.18,-282.6,34.91, deitado = { -462.55,-281.55,35.84,203.53 } }, 
    [3] = { -465.98,-284.13,34.91, deitado = { -466.25,-283.3,35.84,206.4 } }, 
    [4] = { -469.29,-285.56,34.91, deitado = { -469.76,-284.5,35.84,204.57 } }, 
    [5] = { -467.6,-289.96,34.91, deitado = { -467.16,-291.07,35.84,29.48 } }, 
    [6] = { -464.29,-288.63,34.91, deitado = { -463.87,-289.67,35.82,20.15 } }, 
    [7] = { -460.85,-287.22,34.91, deitado = { -460.36,-288.35,35.82,18.77 } }, 
    [8] = { -455.64,-285.08,34.91, deitado = { -455.09,-286.03,35.82,25.32 } }, 
    [9] = { -454.52,-279.49,34.91, deitado = { -454.78,-278.55,35.84,207.53 } }, 
    [10] = { -449.03,-282.34,34.91, deitado = { -448.43,-283.58,35.82,22.36 } },

 
}
--[[
-- pra quando inverter denovo
for k,v in pairs(macas) do 
    local deitadoxyz = v.deitado[1]..', '..v.deitado[2]..', '..v.deitado[3]
    local e_xyz = v[1]..', '..v[2]..', '..v[3]
    print('['..k..'] = { '..deitadoxyz..', deitado = { '..e_xyz..' } },')
end
https://www.tutorialspoint.com/execute_lua_online.php
]]
-----------------------------------------------------------------------------------------------------------------------------------------
-- CHECAR AREA
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local time = 1000
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))

		for k,v in pairs(macas) do
            local entrada = (GetDistanceBetweenCoords(v[1],v[2],v[3],x,y,z,true) <= 2)

			if entrada then
				in_area = tonumber(k)
			end 
		end

		Citizen.Wait(time)
	end
end)

function src.retirarMascaraH()
    SetPedComponentVariation(PlayerPedId(), 1, 0,0,2)
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE MACAS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		local time = 1000
		local ped = PlayerPedId()
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))

		if tonumber(in_area) > 0 and not deitado then
			if GetDistanceBetweenCoords(macas[tonumber(in_area)][1],macas[tonumber(in_area)][2],macas[tonumber(in_area)][3],x,y,z,true) <= 1.5 then
				time = 5
				DrawText3Ds(macas[tonumber(in_area)][1],macas[tonumber(in_area)][2],macas[tonumber(in_area)][3], "~b~[MACA: "..tonumber(tonumber(in_area)).."]\n~w~[~g~E~w~] Deitar\n~w~[~b~F~w~] Iniciar tratamento")


                if IsControlJustReleased(1, 51) and segundos <= 0 and vSERVER.checkPagamento(3000) then
                    segundos = 5
                    DoScreenFadeOut(1000)

                    Citizen.Wait(2000)
                    SetEntityHeading(ped, macas[tonumber(in_area)].deitado[4])
                    SetEntityCoords(ped, macas[tonumber(in_area)].deitado[1],macas[tonumber(in_area)].deitado[2],macas[tonumber(in_area)].deitado[3]-0.9)
                    vRP.playAnim(false,{{"amb@world_human_sunbathe@female@back@idle_a","idle_a",1}},true)

                    Citizen.Wait(2000)
                    DoScreenFadeIn(1000)

                    if vSERVER.checkUNZIK() then
                        deitado = true
                        tratamento = false
                        segundosT = 0
                        TriggerEvent("blockcel", true)
                    else
                        deitado = true
                        tratamento = true
                        segundosT = 60
                        vida = 110
                        SetEntityHealth(ped, vida)
                        vSERVER._blockCommands(59)
                        TriggerEvent("Notify","importante","Nenhum medico em expediente, você esta sendo tratado pelos medicos da prefeitura", 5)
                        TriggerEvent("blockcel", true)
                    end
                end

                if IsControlJustReleased(1, 49) and segundos <= 0 then
                    segundos = 5
                    if vSERVER.checkTratamento() then
                        TriggerEvent("Notify","importante","Você iniciou tratamento nesse jogador.", 5)
                    end
                end
            end

			if GetDistanceBetweenCoords(macas[tonumber(in_area)][1],macas[tonumber(in_area)][2],macas[tonumber(in_area)][3],x,y,z,true) >= 3 then
				in_area = 0
			end
		end
	
		Citizen.Wait(time)
	end
end) 

-----------------------------------------------------------------------------------------------------------------------------------------
-- DEITADO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local time = 1000

        if deitado and not tratamento and segundosT == 0 then
            time = 5
            drawTxt("VOCÊ ESTÁ ~r~DEITADO~w~, PARA LEVANTAR PRESSIONE ~b~[F6]~w~ OU AGUARDE UM MÉDICO VIR TE ATENDER.",4,0.5,0.96,0.50,255,255,255,180)

            if IsControlJustPressed(0, 167) then
                deitado = false
                segundosT = 0
                tratamento = false
                TriggerEvent("blockcel", false)
            end
            
            DisableControlAction(2, 37, true)
            if IsDisabledControlJustPressed(2, 37) then
				SetCurrentPedWeapon(GetPlayerPed(-1),GetHashKey("WEAPON_UNARMED"),true)
            end
        elseif deitado and tratamento and segundosT > 0 then
            time = 5
            drawTxt("VOCÊ ESTÁ EM ~b~TRATAMENTO~w~, AGUARDE ~b~"..segundosT.."~w~ SEGUNDO(s) PARA SE LEVANTAR.",4,0.5,0.96,0.50,255,255,255,180)

            DisableControlAction(2, 37, true)
            if IsDisabledControlJustPressed(2, 37) then
				SetCurrentPedWeapon(GetPlayerPed(-1),GetHashKey("WEAPON_UNARMED"),true)
            end
        elseif deitado and segundosT == -1 and not tratamento then
            time = 5
            drawTxt("SEU ~b~TRATAMENTO~w~ ACABOU, PRESSIONE ~b~[F6]~w~ PARA LEVANTAR.",4,0.5,0.96,0.50,255,255,255,180)
   
            if IsControlJustPressed(0, 167) then
                deitado = false
                segundosT = 0
                tratamento = false
                TriggerEvent("blockcel", false)
            end

            DisableControlAction(2, 37, true)
            if IsDisabledControlJustPressed(2, 37) then
				SetCurrentPedWeapon(GetPlayerPed(-1),GetHashKey("WEAPON_UNARMED"),true)
            end
        end

        Citizen.Wait(time)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA TRATAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
function src.iniciarTratamento()
    deitado = true
    tratamento = true
    segundosT = 60

    vida = 110
    SetEntityHealth(ped, vida)
end

function src.checkPaciente()
    return deitado,tratamento
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- CONTADOR TRATAMENTO
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        local time = 1000
        local ped = PlayerPedId()

        if deitado and tratamento and segundosT > 0 then
            segundosT = segundosT - 1

            if vida >= 300 then
                SetEntityHealth(ped, 300)
            else
                vida = vida + 6
                SetEntityHealth(ped, vida)
            end

            if segundosT == 0 then
                tratamento = false
                segundosT = -1
            end
        end

        Citizen.Wait(time)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- OUTROS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.checkSexo()
    if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then
        return "H"
    elseif GetEntityModel(PlayerPedId()) == GetHashKey("mp_f_freemode_01") then
        return "M"
    end
end

Citizen.CreateThread(function()
    while true do
        local time = 1000
        if segundos > 0 then
            segundos = segundos - 1

            if segundos <= 0 then
                segundos = 0 
            end
        end

        Citizen.Wait(time)
    end
end)

function DrawText3Ds(x,y,z,text)
	local onScreen,_x,_y = World3dToScreen2d(x,y,z)
	SetTextFont(4)
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
end

function drawTxt(text,font,x,y,scale,r,g,b,a)
    SetTextFont(font)
    SetTextScale(scale,scale)
    SetTextColour(r,g,b,a)
    SetTextOutline()
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x,y)
end
