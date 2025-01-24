local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

client = {}
Tunnel.bindInterface(GetCurrentResourceName(), client)
server = Tunnel.getInterface(GetCurrentResourceName())