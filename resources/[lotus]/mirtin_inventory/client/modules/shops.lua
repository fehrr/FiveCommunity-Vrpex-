local NEAR_SHOP = false

local SystemBlips = {}
function CreateSystemBlips()
    for k in pairs(Shops) do
        if Shops[k].blip then 
            local onBlipInfos = Shops[k].blip
            for index,v in pairs(Shops[k].coords) do 
                if not v.blip then goto continue end 

                SystemBlips[index] = AddBlipForCoord(v.coords.x,v.coords.y,v.coords.z)
                SetBlipSprite(SystemBlips[index], onBlipInfos.index)
                SetBlipColour(SystemBlips[index], onBlipInfos.color)
                SetBlipScale(SystemBlips[index], 0.5)
                SetBlipAsShortRange(SystemBlips[index], true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(onBlipInfos.text)
                EndTextCommandSetBlipName(SystemBlips[index])
                Citizen.Wait(150)

                ::continue::
            end
        end
    end
end

Citizen.CreateThread(function()
    CreateSystemBlips()
end)

local function ParseItems(items) 
    local response = {}
    local count = 0
    for k,v in pairs(items) do
        count += 1 
        response[tostring(count)] = {
            price = items[k],
            item = k,
            slot = tostring(count)
        }
    end
    return response
end
CreateThread(function() 
    for k,v in pairs(Shops) do 
        Shops[k].items = ParseItems(v.items)
    end
    SearchShopThread()
end)

function SearchShopThread()
    CreateThread(function() 
        while not NEAR_SHOP do 
            local sleep = 1002
            local ply       = PlayerPedId()
            local plyCds    = GetEntityCoords(ply)
            for k,v in pairs(Shops) do
                for i = 1, #v.coords do
                    local distance = #(plyCds - v.coords[i].coords)
                    if distance < 7.0 then
                        NEAR_SHOP = true
                        NearShopThread(k, i)
                    end
                end
            end
            Wait(sleep)
        end
    end)
end


function NearShopThread(store, coordIndex)
    CreateThread(function()
        while NEAR_SHOP do
            local sleep = 4
            local ply = PlayerPedId()
            local plyCds = GetEntityCoords(ply)
            local distance = #(plyCds - Shops[store].coords[coordIndex].coords)
            if distance > 7.0 or (GetEntityHealth(PlayerPedId()) <= 101) then
                CloseShop()
                break
            end 
            DrawMarker(29, Shops[store].coords[coordIndex].coords.x,Shops[store].coords[coordIndex].coords.y,Shops[store].coords[coordIndex].coords.z-0.4, 0, 0, 0, 0, 180.0, 0, 0.7, 0.7, 0.7, 177,13,37, 75, 1, 0, 0, 1)
            if distance <= 1.3 then
                if IsControlJustPressed(0, 38) then
                    if (not Shops[store].perm or Remote.checkPermission(Shops[store].perm)) then 
                        SendNUIMessage({
                            route = "OPEN_SHOP",
                            payload = {
                                mode = Shops[store].mode, -- buy|sell
                                store_name = store, -- buy|sell
                                inventory = Shops[store].items, -- [item: string] = price;
                            }
                        })
                        SetNuiFocus(true,true)
                    end  
                end
            end
            Wait(sleep)
        end
    end)
end

CloseShop = function()
    NEAR_SHOP = false
    SearchShopThread()

    SendNUIMessage({
        route = "CLOSE_INVENTORY",
        payload = false
    })
    SetNuiFocus(false,false)
end 
