routes = {
  ['requestInfos'] = function(data)
    return server.manageClient('requestInfos')
  end,
  ['loadList'] = function(data)
    return server.manageClient('loadList')
  end,
  ['close'] = function(data)
    isOpened = false
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'close' })
    TransitionFromBlurred(0)
    return
  end,
  ['option'] = function(data)
    isOpened = false
    SendNUIMessage({ action = 'close' })
    SetNuiFocus(false, false)
    TransitionFromBlurred(0)

    if data.option == 'settings' then 
      ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'),0,-1) 
    elseif data.option == 'map' then 
      ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'),0,-1) 
    end
  end
}

RegisterRoutes = function()
  for k,v in pairs(routes) do
    RegisterNuiCallback(k, function(data, cb)
      local res = v(data)
      cb(res or {})
    end)
  end 
end

CreateThread(RegisterRoutes)