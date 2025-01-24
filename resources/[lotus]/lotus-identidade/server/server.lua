local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

local identity = {}
Tunnel.bindInterface(GetCurrentResourceName(), identity)

-- Carrega a configuração de VIPs e Licença do arquivo config.lua
local Vips = Config.VIPs
local license = tostring(Config.License)

-- Função para obter a lista de VIPs do jogador
local function getVIPs(user_id, source)
    local FormatVips = {}
    for _, vip in ipairs(Vips) do
        if vRP.hasGroup(user_id, vip) then
            table.insert(FormatVips, vip)
        end
    end
    return #FormatVips > 0 and FormatVips or {"Nenhum"}
end

-- Função principal para obter as informações do jogador
function identity.getInfos()
    local source = source
    local user_id = vRP.getUserId(source)

    if user_id then
        local playerIdentity = vRP.getUserIdentity(user_id)
        if playerIdentity then
            local money = vRP.getMoney(user_id)
            local bankMoney = vRP.getBankMoney(user_id)
            local phone = playerIdentity.telefone or "N/A"
            local org = vRP.getUserGroupByType(user_id, "org") or "Sem organização"
            local status = playerIdentity.status_relacionamento or "Solteiro"
           
            local data = {
                action = "open",
                id = user_id,
                name = playerIdentity.nome .. " " .. playerIdentity.sobrenome,
                birth = playerIdentity.idade or "N/A",
                telephone = phone,
                wallet = money or 0,
                bank = bankMoney or 0,
                org = org,
                carry = vRP.hasPermission(user_id, "porte.permissao") and "Porte Autorizado" or "Sem Porte",
                staff = vRP.hasPermission(user_id, "admin.permissao") and "Administrador" or 
                        (vRP.hasPermission(user_id, "moderador.permissao") and "Moderador" or "N/A"),
                spouse = status,
                vips = getVIPs(user_id, source)
            }

            return data
        end
    end
    return {action = "close"}
end
