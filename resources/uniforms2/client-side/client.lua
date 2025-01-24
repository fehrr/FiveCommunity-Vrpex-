-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
-----------------------------------------------------------------------------------------------------------------------------------------
-- PROXY
-----------------------------------------------------------------------------------------------------------------------------------------
cO = {}
Tunnel.bindInterface(GetCurrentResourceName(),cO)
vSERVER = Tunnel.getInterface(GetCurrentResourceName())
-----------------------------------------------------------------------------------------------------------------------------------------
--  DECODE
-----------------------------------------------------------------------------------------------------------------------------------------
local services = { 
    [1] = {"POLICIAthunder",-2277.38,336.37,178.57,"perm.policia", "developer.permissao" },

    [2] = {"POLICIAPMERJ",-1654.1,188.59,61.75,"perm.policia", "developer.permissao" },

    [3] = {"POLICIAEXERCITO",-2198.83,3170.52,32.82,"perm.policia", "developer.permissao" },

    [4] = {"POLICIACIVIL",-935.18,-2057.56,9.4,"perm.policia", "developer.permissao" },

    [5] = {"Bope",-935.18,-2057.56,9.4,"perm.policia", "developer.permissao" },

    [6] = {"PoliciaFederal",-935.18,-2057.56,9.4,"perm.pf", "developer.permissao" },

    [7] = {"PRF",-3535.89,742.41,5.88,"perm.policia", "developer.permissao" },

    [8] = {"HOSPITAL",-443.63,-310.01,34.92    ,"perm.unizk", "developer.permissao" },

    [9] = {"POLICIACIVIL",-915.34,-2038.18,9.4,"perm.policiacivil", "developer.permissao" },
    
    [10] = {"MECANICA",145.62,99.19,83.52,"perm.mecanica", "developer.permissao" },

    [11] = {"BOMBEIRO",1566.77,828.99,78.79 ,"perm.unizk", "developer.permissao" },
}

Citizen.CreateThread(function()
    while true do
        local timeDistance = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

        for k, v in pairs(services) do
            -- Calculando a distância entre o jogador e o serviço (usando coordenadas v[2], v[3], v[4])
            local distance = #(coords - vector3(v[2], v[3], v[4]))
            
            -- Se o jogador estiver perto o suficiente (1.5 metros)
            if distance <= 1.5 then
                timeDistance = 5  -- Reduz a espera para 5ms para manter o loop ativo

                -- Desenha o texto 3D na posição do serviço
                DrawText3D(v[2], v[3], v[4], "~r~E~w~   ABRIR")

                -- Desenha o marcador 3D na mesma posição
                DrawMarker(1, vector3(v[2], v[3], v[4]) - vector3(0.0, 0.0, 1.95), 0, 0, 0, 0, 0, 0, 0.80, 0.80, 1.50, 223, 20, 77, 255, 0, 0, 0, 0)

                -- Verifica se o jogador pressionou a tecla "E"
                if IsControlJustPressed(0, 38) then
                    -- Verifica permissões
                    local checkPermission, checkLider = vSERVER.requestPermission(v[5], v[6])
                    
                    -- Se tiver permissão e for líder, exibe as opções de gerenciamento
                    if checkPermission and checkLider then
                        exports["dynamic"]:SubMenu("Equipar", "Todas os uniformes de sua corporação.", "uniforms")
                        exports["dynamic"]:AddButton("Sair", "Sair de Patrulhamento.", "sysClothes:applyPreset", "sairPtr", "uniforms", true)

                        exports["dynamic"]:SubMenu("Opções", "Gerenciamento de uniformes líder.", "optionsUniforms")
                        exports["dynamic"]:AddButton("Adicionar", "Adicione o uniforme que está em seu corpo.", "sysClothes:applyPreset", "apply", "optionsUniforms", true)
                        exports["dynamic"]:AddButton("Deletar", "Delete algum uniforme existente.", "sysClothes:applyPreset", "delete", "optionsUniforms", true)
                    elseif checkPermission then
                        -- Se apenas tiver permissão, exibe opções de uniforme
                        exports["dynamic"]:SubMenu("Equipar", "Todas os uniformes de sua corporação.", "uniforms")
                        exports["dynamic"]:AddButton("Sair", "Sair de Patrulhamento.", "sysClothes:applyPreset", "sairPtr", "uniforms", true)
                    end

                    -- Solicita os uniformes para o serviço
                    local uniforms = vSERVER.requestClothes(v[1], v[5])
                    if uniforms then
                        for _, x in pairs(uniforms) do
                            exports["dynamic"]:AddButton(x.name, "Roupa para utilizar em serviço.", "sysClothes:applyPreset", x.name, "uniforms", true)
                        end
                    end
                end
            end
        end
        Citizen.Wait(timeDistance)
    end
end)


-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTEXT3D
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	SetTextFont(4)
	SetTextCentre(1)
	SetTextEntry("STRING")
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z,0)
	DrawText(0.0,0.0)
	local factor = (string.len(text) / 450) + 0.01
	DrawRect(0.0,0.0125,factor,0.03,40,36,52,240)
	ClearDrawOrigin()
end
