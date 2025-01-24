------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

vSERVER = Tunnel.getInterface("mirtin_arena")
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config = {}
config.rangeDistance = 100 -- Distancia se o player se afastar muito voltar para a arena

config.locArenas = { -- Localizações das arenas
    vec3(-1631.7,-1015.05,13.13)
}

config.keys = {
    scoreboard = 137, -- CAPS
    spawn = 38, -- SPAWNAR
}

config.drawMarker = function(coords) -- DRAWMARKER DO BLIP DA ARENA
    -- DrawText3Ds(coords[1],coords[2],coords[3], "Aperte ~g~ E ~w~ para acessar a arena")

    if not HasStreamedTextureDictLoaded("blip3d") then
        RequestStreamedTextureDict("blip3d", true)
        while not HasStreamedTextureDictLoaded("blip3d") do
                Wait(1)
        end
        else
        DrawMarker(9, coords[1],coords[2],coords[3],0,0,0,90.0,0.0,0,0.6,0.6,0,255, 255, 255, 255,false, true, 1, false, "blip3d", "pvp_blip", false)
    end

end

config.drawTxt = function()
    drawTxt("VOCÊ ESTÁ MORTO PRESSIONE ~b~E~w~ PARA SPAWNAR",4,0.5,0.93,0.50,255,255,255,255)
end

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

--[[ -- COLOQUE ISSO NAS FUNCOES DE CLIENTS
    local in_arena = false

    RegisterNetEvent("mirtin_survival:updateArena", function(boolean)
        in_arena = boolean
    end)
]] 