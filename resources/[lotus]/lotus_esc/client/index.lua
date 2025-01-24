isOpened = false
RegisterKeyMapping("openSettinggmenu","Abrir as configurações","keyboard","Escape")
RegisterKeyMapping("Map","Abrir o mapa","keyboard","P")

RegisterCommand('openSettinggmenu', function()
  if not isOpened and not IsPauseMenuActive() then
    isOpened = true
    SetNuiFocus(true,true)
    TransitionToBlurred(1000)
    SendNUIMessage({
      action = 'open'
    })
  end
end)

RegisterCommand("Map",function()
	ActivateFrontendMenu(GetHashKey("FE_MENU_VERSION_MP_PAUSE"),0,-1)
end)

CreateThread(function()
  while true do 
    SetPauseMenuActive(false) 
    Wait(1)
  end
end)