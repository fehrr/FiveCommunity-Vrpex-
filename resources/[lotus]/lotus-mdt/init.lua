Tunnel = module('vrp', 'lib/Tunnel')
Proxy = module('vrp', 'lib/Proxy')
vRP = Proxy.getInterface('vRP')

local server = IsDuplicityVersion()
if server then
    bridge = {} -- vrp server => client bridge
    bridge.cachedData = {} -- storage
    bridge.cachedData.tempoPrisao = {} -- storage
    vRPC = Tunnel.getInterface('vRP')
    Tunnel.bindInterface(GetCurrentResourceName(), bridge)
    vCLIENT = Tunnel.getInterface(GetCurrentResourceName())
else
    bridge = {} -- vrp client => server bridge
    Tunnel.bindInterface(GetCurrentResourceName(), bridge)
    vSERVER = Tunnel.getInterface(GetCurrentResourceName())
end
