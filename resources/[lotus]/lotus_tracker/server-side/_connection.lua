local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

server = {}
Tunnel.bindInterface(GetCurrentResourceName(), server)
vCLIENT = Tunnel.getInterface(GetCurrentResourceName())