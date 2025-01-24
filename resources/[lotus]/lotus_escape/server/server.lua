local Tunnel = module('vrp', 'lib/Tunnel')
local Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface('vRP')

-- Server API
ServerAPI = {}
Tunnel.bindInterface(GetCurrentResourceName(), ServerAPI)

-- Example of server-side variables
local activeProps = {}
local lockedDoors = {}

-- Function to handle requests from the client to toggle door lock state
function ServerAPI.toggleDoorLock(doorId)
    if lockedDoors[doorId] == nil then
        lockedDoors[doorId] = false
    end

    lockedDoors[doorId] = not lockedDoors[doorId]
    TriggerClientEvent('doorStateChanged', -1, doorId, lockedDoors[doorId]) -- Notify all clients
end

-- Function to log actions for security/audit
function ServerAPI.logAction(user_id, action)
    print(string.format("User %s performed action: %s", user_id, action))
    -- Add database logging here if necessary
end
