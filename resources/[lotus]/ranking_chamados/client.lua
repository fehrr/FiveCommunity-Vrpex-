local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
atl = Tunnel.getInterface("ranking_chamados")


local menuactive = false
RegisterCommand("topchamados",function(source,args)
	if atl.checkpermranking() then
		local ranking, name = atl.ranking()
		ToggleActionMenu(ranking, name)
	end
end)

function ToggleActionMenu(attr, name)


	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		print(json.encode(attr))
		SendNUIMessage({ showmenu = true, ranking = attr, name = name})
	else
		SetNuiFocus(false)
		SendNUIMessage({ showmenu = false })
	end
end



RegisterNUICallback("close",function(data)
	menuactive = not menuactive
	SetNuiFocus(false)
	SendNUIMessage({ showmenu = false })
end)