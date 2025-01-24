-----------------------------------------------------------------------------------------------------------------------------------------
-- VRP
-----------------------------------------------------------------------------------------------------------------------------------------
local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
local Tools = module("vrp","lib/Tools")
vRP = Proxy.getInterface("vRP")
vRPC = Tunnel.getInterface("vRP")
vCLIENT = Tunnel.getInterface(GetCurrentResourceName())
vSKIN = Tunnel.getInterface("vrp_skinshop")
-----------------------------------------------------------------------------------------------------------------------------------------
-- CONEXÃO
-----------------------------------------------------------------------------------------------------------------------------------------
cO = {}
Tunnel.bindInterface(GetCurrentResourceName(),cO)

-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
vRP._prepare("saveClothes","INSERT IGNORE INTO clothes(name,permiss,service,custom,sexo) VALUES(@name,@permiss,@service,@custom,@sexo)")
vRP._prepare("updateClothes","UPDATE clothes SET custom = @custom WHERE name = @name AND permiss = @permiss")
vRP._prepare("deleteClothes","DELETE FROM clothes WHERE name = @name")
vRP._prepare("selectClothesT","SELECT * FROM clothes WHERE service = @service AND sexo = @sexo")
vRP._prepare("selectClothesW","SELECT * FROM clothes WHERE name = @name AND sexo = @sexo")
vRP._prepare("selectClothes","SELECT * FROM clothes WHERE name = @name AND permiss = @permiss")

-----------------------------------------------------------------------------------------------------------------------------------------
-- DEFAULTCOMMAND
-----------------------------------------------------------------------------------------------------------------------------------------
local maxServices = {
    ["POLICIAthunder"] = {30},
    ["POLICIAPMERJ"] = {30},
    ["POLICIAEXERCITO"] = {30},
    ["POLICIACIVIL"] = {30},
    ["POLICIABOPE"] = {30},
    ["POLICIAFEDERAL"] = {30},
    ["POLICIAPRF"] = {30},
    ["HOSPITAL"] = {30},
    ["BOMBEIRO"] = {30},
    ["MECANICA"] = {30},
}

-----------------------------------------------------------------------------------------------------------------------------------------
-- DEFAULTCOMMAND
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("sysClothes:applyPreset")
AddEventHandler("sysClothes:applyPreset",function(perm)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then

        local sexo
        if GetEntityModel(GetPlayerPed(source)) == GetHashKey("mp_m_freemode_01") then 
            sexo = "mp_m_freemode_01"
        elseif GetEntityModel(GetPlayerPed(source)) == GetHashKey("mp_f_freemode_01") then 
            sexo = "mp_f_freemode_01"
        end

        if perm == "apply" then 
            local permiss = string.upper(vRP.getUserGroupOrg(user_id))
            if permiss == "" then permiss = "Nenhum" end
            TriggerClientEvent("dynamic:closeSystem2", source)
            local clothes = vRP.prompt(source, "Insira o nome do uniforme", "")
            if clothes and clothes ~= "" and clothes ~= nil and maxServices[permiss] then
                local myClothes = vRPC.getCustomization(source)
                if myClothes then 
                    local maxconsult = vRP.query("selectClothesT",{ service = permiss })
                    if parseInt(#maxconsult) >= maxServices[permiss][1] then 
                        TriggerClientEvent("Notify",source,"negado","Você atingiu o número máximo de uniformes, delete algum para prosseguir.",6000)
                        return false 
                    end

                    vRP.execute("saveClothes",{ name = clothes, service = permiss, permiss = permiss, custom = json.encode(myClothes), sexo = sexo })
                    TriggerClientEvent("Notify",source,"importante","Preset salvo com sucesso",6000)
                end
            end

        elseif perm == "delete" then 
            local permiss = vRP.getUserGroupOrg(user_id)
            if permiss == "" then permiss = "Nenhum" end
            TriggerClientEvent("dynamic:closeSystem2", source)
            local clothes = vRP.prompt(source, "Insira o nome do uniforme que deseja deletar.", "")
            if clothes then 
                local consult = vRP.query("selectClothes",{ permiss = permiss, name = clothes })
                if consult[1] then 
                    vRP.execute("deleteClothes",{ name = clothes })
                    TriggerClientEvent("Notify",source,"importante","Uniforme deletado",6000)  
                end
            end

        elseif perm == "sairPtr" then
            vRP.removePatrulhamento(user_id)
            vRPC.giveWeapons(source, {}, true)
            limparItems(user_id)
            TriggerClientEvent("Notify",source,"negado","Você saiu de patrulhamento..",6000)  
            TriggerEvent('eblips:remove',source)
        end

        local consult = vRP.query("selectClothesW",{ name = perm, sexo = sexo })
        local myClothes = vRPC.getCustomization(source)
        if consult[1] and consult[1].custom then

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA thunder
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if perm == "Comandothunder" and vRP.hasGroup(user_id, "Comandothunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_COMBATPDW"] = {ammo= 250}, 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)


elseif perm == "Coronelthunder" and vRP.hasGroup(user_id, "Coronelthunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "TenenteCoronelthunder" and vRP.hasGroup(user_id, "TenenteCoronelthunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Majorthunder" and vRP.hasGroup(user_id, "Majorthunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Capitaothunder" and vRP.hasGroup(user_id, "Capitaothunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "PrimeiroTenentethunder" and vRP.hasGroup(user_id, "PrimeiroTenentethunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SegundoTenentethunder" and vRP.hasGroup(user_id, "SegundoTenentethunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SubTenentethunder" and vRP.hasGroup(user_id, "SubTenentethunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "PrimeiroSargentothunder" and vRP.hasGroup(user_id, "PrimeiroSargentothunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SegundoSargentothunder" and vRP.hasGroup(user_id, "SegundoSargentothunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "TerceiroSargentothunder" and vRP.hasGroup(user_id, "TerceiroSargentothunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Cabothunder" and vRP.hasGroup(user_id, "Cabothunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Soldadothunder" and vRP.hasGroup(user_id, "Soldadothunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)



elseif perm == "Alunothunder" and vRP.hasGroup(user_id, "Alunothunder") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "Policiathunder", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
end
 

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA PMERJ
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if perm == "ComandoPMERJ" and vRP.hasGroup(user_id, "ComandoPMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_COMBATPDW"] = {ammo= 250}, 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "CoronelPMERJ" and vRP.hasGroup(user_id, "CoronelPMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "TenenteCoronelPMERJ" and vRP.hasGroup(user_id, "TenenteCoronelPMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "MajorPMERJ" and vRP.hasGroup(user_id, "MajorPMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "CapitaoPMERJ" and vRP.hasGroup(user_id, "CapitaoPMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "PrimeiroTenentePMERJ" and vRP.hasGroup(user_id, "PrimeiroTenentePMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SegundoTenentePMERJ" and vRP.hasGroup(user_id, "SegundoTenentePMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SubTenentePMERJ" and vRP.hasGroup(user_id, "SubTenentePMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "PrimeiroSargentoPMERJ" and vRP.hasGroup(user_id, "PrimeiroSargentoPMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SegundoSargentoPMERJ" and vRP.hasGroup(user_id, "SegundoSargentoPMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "TerceiroSargentoPMERJ" and vRP.hasGroup(user_id, "TerceiroSargentoPMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "CaboPMERJ" and vRP.hasGroup(user_id, "CaboPMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SoldadoPMERJ" and vRP.hasGroup(user_id, "SoldadoPMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)



elseif perm == "AlunoPMERJ" and vRP.hasGroup(user_id, "AlunoPMERJ") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "PilotoGam" and vRP.hasGroup(user_id, "PilotoGam") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Corregedoria" and vRP.hasGroup(user_id, "Corregedoria") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPMERJ", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA EXERCITO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if perm == "Coronel" and vRP.hasGroup(user_id, "Coronel") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_COMBATPDW"] = {ammo= 250}, 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaExercito", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "TenenteCoronel" and vRP.hasGroup(user_id, "TenenteCoronel") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaExercito", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Major" and vRP.hasGroup(user_id, "Major") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaExercito", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Capitao" and vRP.hasGroup(user_id, "Capitao") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaExercito", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "PrimeiroTenente" and vRP.hasGroup(user_id, "PrimeiroTenente") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaExercito", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SegundoTenente" and vRP.hasGroup(user_id, "SegundoTenente") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaExercito", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SubTenente" and vRP.hasGroup(user_id, "SubTenente") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaExercito", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "PrimeiroSargento" and vRP.hasGroup(user_id, "PrimeiroSargento") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaExercito", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SegundoSargento" and vRP.hasGroup(user_id, "SegundoSargento") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaExercito", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "TerceiroSargento" and vRP.hasGroup(user_id, "TerceiroSargento") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaExercito", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Cabo" and vRP.hasGroup(user_id, "Cabo") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaExercito", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Soldado" and vRP.hasGroup(user_id, "Soldado") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaExercito", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA CIVIL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if perm == "DelegadoGeral" and vRP.hasGroup(user_id, "DelegadoGeral") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_COMBATPDW"] = {ammo= 250}, 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaCivil", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "ComandanteCore" and vRP.hasGroup(user_id, "ComandanteCore") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaCivil", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SubComandanteCore" and vRP.hasGroup(user_id, "SubComandanteCore") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaCivil", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Delegado" and vRP.hasGroup(user_id, "Delegado") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaCivil", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Core" and vRP.hasGroup(user_id, "Core") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaCivil", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Perito" and vRP.hasGroup(user_id, "Perito") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaCivil", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Escrivao" and vRP.hasGroup(user_id, "Escrivao") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaCivil", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Investigador" and vRP.hasGroup(user_id, "Investigador") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaCivil", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Agente" and vRP.hasGroup(user_id, "Agente") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaCivil", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Recruta" and vRP.hasGroup(user_id, "Recruta") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaCivil", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA BOPE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if perm == "CoronelBope" and vRP.hasGroup(user_id, "CoronelBope") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_COMBATPDW"] = {ammo= 250}, 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaBope", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Ten.CoronelBope" and vRP.hasGroup(user_id, "Ten.CoronelBope") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaBope", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "MajorBope" and vRP.hasGroup(user_id, "MajorBope") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaBope", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "CapitaoBope" and vRP.hasGroup(user_id, "CapitaoBope") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaBope", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "TenenteBope" and vRP.hasGroup(user_id, "TenenteBope") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaBope", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SargentoBope" and vRP.hasGroup(user_id, "SargentoBope") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaBope", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "CaboBope" and vRP.hasGroup(user_id, "CaboBope") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaBope", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "SoldadoBope" and vRP.hasGroup(user_id, "SoldadoBope") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaBope", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "RecrutaBope" and vRP.hasGroup(user_id, "RecrutaBope") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaBope", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA FEDERAL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if perm == "ComandoGeralPF" and vRP.hasGroup(user_id, "ComandoGeralPF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaFederal", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "DelegadoPF" and vRP.hasGroup(user_id, "DelegadoPF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaFederal", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "DelegadoADJ.PF" and vRP.hasGroup(user_id, "DelegadoADJ.PF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaFederal", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "PeritoPF" and vRP.hasGroup(user_id, "PeritoPF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaFederal", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "EscrivaoPF" and vRP.hasGroup(user_id, "EscrivaoPF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaFederal", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "InspetorPF" and vRP.hasGroup(user_id, "InspetorPF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaFederal", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Agente.Cl1" and vRP.hasGroup(user_id, "Agente.Cl1") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaFederal", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Agente.Cl2" and vRP.hasGroup(user_id, "Agente.Cl2") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaFederal", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Agente.Cl3" and vRP.hasGroup(user_id, "Agente.Cl3") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaFederal", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Agente.Cl4" and vRP.hasGroup(user_id, "Agente.Cl4") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaFederal", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Agente.Cl5" and vRP.hasGroup(user_id, "Agente.Cl5") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaFederal", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "AlunoPF" and vRP.hasGroup(user_id, "AlunoPF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaFederal", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA PRF
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if perm == "ComandoGeralPRF" and vRP.hasGroup(user_id, "ComandoGeralPRF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_COMBATPDW"] = {ammo= 250}, 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPRF", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Sub.ComandoPRF" and vRP.hasGroup(user_id, "Sub.ComandoPRF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPRF", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "DiretorPRF" and vRP.hasGroup(user_id, "DiretorPRF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPRF", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "InspetorPRF" and vRP.hasGroup(user_id, "InspetorPRF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPRF", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Agente.especialPRF" and vRP.hasGroup(user_id, "Agente.especialPRF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPRF", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Clase3.PRF" and vRP.hasGroup(user_id, "Clase3.PRF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPRF", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Clase2.PRF" and vRP.hasGroup(user_id, "Clase2.PRF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPRF", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

elseif perm == "Clase1.PRF" and vRP.hasGroup(user_id, "Clase1.PRF") then
    vRPC._setCustomization(source,json.decode(consult[1].custom))
    vRP.setPatrulhamento(user_id)
    vRPC.giveWeapons(source, { 
        ["WEAPON_SPECIALCARBINE"] = {ammo= 250}, 
        ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
        ["WEAPON_STUNGUN"] = {ammo=1}, 
        ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
        ["WEAPON_NIGHTSTICK"] = {ammo=1} 
    }, true)
    limparItems(user_id)
    vRP.addPeso(user_id, 15)
    vRP.giveInventoryItem(user_id, "radio", 1, true)
    vRP.giveInventoryItem(user_id, "distintivopolicial", 1, true)
    TriggerEvent('eblips:add',{ name = "PoliciaPRF", src = source, color = 3 })
    TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
end



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HOSPITAL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            if perm == "Diretor" and vRP.hasGroup(user_id, "Diretor") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                vRP.setPatrulhamento(user_id)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Hospital",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            elseif perm == "ViceDiretor" and vRP.hasGroup(user_id, "ViceDiretor") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                vRP.setPatrulhamento(user_id)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Hospital",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            elseif perm == "Medico" and vRP.hasGroup(user_id, "Medico") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                vRP.setPatrulhamento(user_id)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Hospital",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            elseif perm == "Enfermeiro" and vRP.hasGroup(user_id, "Enfermeiro") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                vRP.setPatrulhamento(user_id)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Hospital",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
 
            elseif perm == "Socorrista" and vRP.hasGroup(user_id, "Socorrista") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                vRP.setPatrulhamento(user_id)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Hospital",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            elseif perm == "Estagiario" and vRP.hasGroup(user_id, "Estagiario") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                vRP.setPatrulhamento(user_id)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Hospital",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            end

            
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BOMBEIROS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        if perm == "CoronelBombeiros" and vRP.hasGroup(user_id, "CoronelBombeiros") then
            vRPC._setCustomization(source,json.decode(consult[1].custom))
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"bombeiro",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

        elseif perm == "MajorBombeiros" and vRP.hasGroup(user_id, "MajorBombeiros") then
            vRPC._setCustomization(source,json.decode(consult[1].custom))
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"bombeiro",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

        elseif perm == "SargentoBombeiros" and vRP.hasGroup(user_id, "SargentoBombeiros") then
            vRPC._setCustomization(source,json.decode(consult[1].custom))
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"bombeiro",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

        elseif perm == "TenenteBombeiros" and vRP.hasGroup(user_id, "TenenteBombeiros") then
            vRPC._setCustomization(source,json.decode(consult[1].custom))
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"bombeiro",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

        elseif perm == "SubTenenteBombeiros" and vRP.hasGroup(user_id, "SubTenenteBombeiros") then
            vRPC._setCustomization(source,json.decode(consult[1].custom))
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"bombeiro",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

        elseif perm == "SocorristaBombeiros" and vRP.hasGroup(user_id, "SocorristaBombeiros") then
            vRPC._setCustomization(source,json.decode(consult[1].custom))
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"bombeiro",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        end
            
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MECANICA CUSTOM
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            if perm == "LiderCustom" and vRP.hasGroup(user_id, "LiderCustom") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRP.addPeso(user_id, 15)
                vRP.setPatrulhamento(user_id)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            elseif perm == "SubLiderCustom" and vRP.hasGroup(user_id, "SubLiderCustom") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRP.addPeso(user_id, 15)
                vRP.setPatrulhamento(user_id)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            elseif perm == "GerenteCustom" and vRP.hasGroup(user_id, "GerenteCustom") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRP.addPeso(user_id, 15)
                vRP.setPatrulhamento(user_id)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            elseif perm == "MecanicoCustom" and vRP.hasGroup(user_id, "MecanicoCustom") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRP.addPeso(user_id, 15)
                vRP.setPatrulhamento(user_id)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            elseif perm == "AprendizCustom" and vRP.hasGroup(user_id, "AprendizCustom") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRP.addPeso(user_id, 15)
                vRP.setPatrulhamento(user_id)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MECANICA RANSING
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
            if perm == "LiderStreetRacing" and vRP.hasGroup(user_id, "LiderStreetRacing") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRP.addPeso(user_id, 15)
                vRP.setPatrulhamento(user_id)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            elseif perm == "SubLiderStreetRacinge" and vRP.hasGroup(user_id, "SubLiderStreetRacinge") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRP.addPeso(user_id, 15)
                vRP.setPatrulhamento(user_id)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            elseif perm == "GerenteStreetRacing" and vRP.hasGroup(user_id, "GerenteStreetRacing") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRP.addPeso(user_id, 15)
                vRP.setPatrulhamento(user_id)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            elseif perm == "MecanicoStreetRacing" and vRP.hasGroup(user_id, "MecanicoStreetRacing") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRP.addPeso(user_id, 15)
                vRP.setPatrulhamento(user_id)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            elseif perm == "AprendizStreetRacinge" and vRP.hasGroup(user_id, "AprendizStreetRacinge") then
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRP.addPeso(user_id, 15)
                vRP.setPatrulhamento(user_id)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)   
                
            else
                vRPC._setCustomization(source,json.decode(consult[1].custom))
                limparItems(user_id)
                vRP.addPeso(user_id, 15)
                vRP.setPatrulhamento(user_id)
                vRP.giveInventoryItem(user_id, "radio", 1, true)
                TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)   
            end
        end
    end
end)


cO.requestClothes = function(sv,perm)
    local source = source 
    local user_id = vRP.getUserId(source)
    if user_id then 
        if vRP.hasPermission(user_id, perm) then 
            local sexo
            if GetEntityModel(GetPlayerPed(source)) == GetHashKey("mp_m_freemode_01") then 
                sexo = "mp_m_freemode_01"
            elseif GetEntityModel(GetPlayerPed(source)) == GetHashKey("mp_f_freemode_01") then 
                sexo = "mp_f_freemode_01"
            end

            local consult = vRP.query("selectClothesT",{ service = sv, sexo = sexo })
            if consult[1] then 
                return consult
            end

            return false
        end
    end
end

cO.requestPermission = function(perm,perm2)
    local source = source 
    local user_id = vRP.getUserId(source)
    if user_id then 
        return vRP.hasPermission(user_id, perm),vRP.hasPermission(user_id, perm2)
    end
end
       
function limparItems(id)
    vRP.tryGetInventoryItem(id, "chave_algemas", vRP.getInventoryItemAmount(id, "chave_algemas"), true)
	vRP.tryGetInventoryItem(id, "radio", vRP.getInventoryItemAmount(id, "radio"), true)
	vRP.tryGetInventoryItem(id, "distintivopolicial", vRP.getInventoryItemAmount(id, "distintivopolicial"), true)
end

            


