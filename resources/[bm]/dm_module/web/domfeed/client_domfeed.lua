RegisterCommand('showfeed', function() 
    print('ta aqui')
    SendNUIMessage({'SHOW_NUI', 'domfeed'})
end)