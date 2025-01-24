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
vRP._prepare("UpdateAttachs","UPDATE clothes SET custom = @custom WHERE name = @name AND permiss = @permiss")
vRP._prepare("deleteClothes","DELETE FROM clothes WHERE name = @name")
vRP._prepare("selectClothesT","SELECT * FROM clothes WHERE service = @service AND sexo = @sexo")
vRP._prepare("selectClothesW","SELECT * FROM clothes WHERE name = @name AND sexo = @sexo")
vRP._prepare("selectClothes","SELECT * FROM clothes WHERE name = @name AND permiss = @permiss")

-----------------------------------------------------------------------------------------------------------------------------------------
-- DEFAULTCOMMAND
-----------------------------------------------------------------------------------------------------------------------------------------
local maxServices = {
    ["POLICIAMILITAR"] = {30},
    ["PRF"] = {30},
    ["HOSPITAL"] = {30},
    ["POLICIACIVIL"] = {30},
    ["MECANICA"] = {30},
    ["TATICA"] = {30},
    ["JORNAL"] = {30},
    ["POLICIAFEDERAL"] = {30},
    ["CORE"] = {30},
    ["JUDICIARIO"] = {30},
    ["COT"] = {30},
    ["CORE"] = {30},
    ["BOPE"] = {30},
    ["BOMBEIRO"] = {30},
    ["EXERCITO"] = {30},
    ["CHOQUE"] = {30},
    ["ALTACUSTOMS"] = {30},
    
}

local mec = false

-----------------------------------------------------------------------------------------------------------------------------------------
-- DEFAULTCOMMAND
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterServerEvent("sysClothes:enterPTR")
AddEventHandler("sysClothes:enterPTR",function()
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasGroup(user_id, "CoronelPM") then
            
            vRP.setPatrulhamento(user_id)											
            vRPC.giveWeapons(source, { 
                ["WEAPON_ASSAULTSMG"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "TenenteCoronelPM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "MajorPM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_CARBINERIFLE_MK2"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_PARAFAL"] = {ammo=250},

                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "ComandoChoquePM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "ChoquePM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "ComandoGatePM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "GatePM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "ComandoSpeedPM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}   
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "SpeedPM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
    
        elseif vRP.hasGroup(user_id, "ComandoRocamPM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
    
        elseif vRP.hasGroup(user_id, "RocamPM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "ComandoGrpaePM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_PARAFAL"] = {ammo=250},

                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "GrpaePM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "CapitaoPM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250},
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_PARAFAL"] = {ammo=250},
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "PrimeiroTenentePM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "SegundoTenentePM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "SubTenentePM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
    
    
        elseif vRP.hasGroup(user_id, "PrimeiroSargentoPM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_PARAFAL"] = {ammo=250}, ["WEAPON_CARBINERIFLE_MK2"] = {ammo= 250}, ["WEAPON_COMBATPISTOL"] = {ammo= 250}, ["WEAPON_STUNGUN"] = {ammo=1}, ["WEAPON_FLASHLIGHT"] = {ammo=1}, ["WEAPON_NIGHTSTICK"] = {ammo=1} }, true)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            vRPC.setArmour(source,100)
    
        elseif vRP.hasGroup(user_id, "SegundoSargentoPM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_PARAFAL"] = {ammo=250}, ["WEAPON_CARBINERIFLE_MK2"] = {ammo= 250}, ["WEAPON_COMBATPISTOL"] = {ammo= 250}, ["WEAPON_STUNGUN"] = {ammo=1}, ["WEAPON_FLASHLIGHT"] = {ammo=1}, ["WEAPON_NIGHTSTICK"] = {ammo=1} }, true)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            vRPC.setArmour(source,100)
    
        elseif vRP.hasGroup(user_id, "TerceiroSargentoPM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_PARAFAL"] = {ammo= 250}, ["WEAPON_COMBATPISTOL"] = {ammo= 250}, ["WEAPON_STUNGUN"] = {ammo=1}, ["WEAPON_FLASHLIGHT"] = {ammo=1}, ["WEAPON_NIGHTSTICK"] = {ammo=1} }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "CaboPM") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_PARAFAL"] = {ammo= 250}, ["WEAPON_COMBATPISTOL"] = {ammo= 250}, ["WEAPON_STUNGUN"] = {ammo=1}, ["WEAPON_FLASHLIGHT"] = {ammo=1}, ["WEAPON_NIGHTSTICK"] = {ammo=1} }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "SoldadoPM") then
    
            if not vRP.hasPermission(user_id, "perm.cam") then 
                
            end
    
            vRPC.setArmour(source,100)
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            vCLIENT._UpdateAttachs(source)
    
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "AlunoPM") then
    
            if not vRP.hasPermission(user_id, "perm.cam") then 
                
            end
    
            vRPC.setArmour(source,100)
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            vCLIENT._UpdateAttachs(source)
    
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
    
        elseif vRP.hasGroup(user_id, "CoronelPRF") then
                
                vRP.setPatrulhamento(user_id)
                vRPC.giveWeapons(source, { 
                    ["WEAPON_ASSAULTSMG"] = {ammo= 250}, 
                    ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                    ["WEAPON_PARAFAL"] = {ammo= 250}, 
                    ["WEAPON_STUNGUN"] = {ammo=1}, 
                    ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                    ["WEAPON_NIGHTSTICK"] = {ammo=1}  
                }, true)
                limparItems(user_id)
                vRPC.setArmour(source,100)
                vRP.giveInventoryItem(user_id, "radio", 1, true)    
                --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
                TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            
        elseif vRP.hasGroup(user_id, "SubComandoPRF") then

            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_ASSAULTSMG"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)    
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        
        elseif vRP.hasGroup(user_id, "SupervisorGeralPRF") then

            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_ASSAULTSMG"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)    
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        
        elseif vRP.hasGroup(user_id, "SupervisorPRF") then

            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_ASSAULTSMG"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)    
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        
        elseif vRP.hasGroup(user_id, "RecrutadorPRF") then

            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_ASSAULTSMG"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)    
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        

        elseif vRP.hasGroup(user_id, "InspetorEspecialPRF") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        
        elseif vRP.hasGroup(user_id, "InspetorPRF") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        
        elseif vRP.hasGroup(user_id, "ComandoGRRPRF") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
              
        elseif vRP.hasGroup(user_id, "GRRPRF") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    


        elseif vRP.hasGroup(user_id, "AgenteEspecialPRF") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_CARBINERIFLE_MK2"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_PARAFAL"] = {ammo=250},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "AgentePRF") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        
        elseif vRP.hasGroup(user_id, "Agente2PRF") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "Agente3PRF") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "EstagiarioPRF") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- CORE
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif vRP.hasGroup(user_id, "MarechalEXERCITO") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "GeneralEXERCITO") then

            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "CoronelEXERCITO") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "TenenteCoronelEXERCITO") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "MajorEXERCITO") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "CapitaoEXERCITO") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "TenenteEXERCITO") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
            
        elseif vRP.hasGroup(user_id, "SubtenenteEXERCITO") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_PARAFAL"] = {ammo=250}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
            
        elseif vRP.hasGroup(user_id, "SargentoEXERCITO") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo=250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
            
        elseif vRP.hasGroup(user_id, "CaboEXERCITO") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo=250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
            
        elseif vRP.hasGroup(user_id, "SoldadoEXERCITO") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_PARAFAL"] = {ammo=250}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- CORE
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif vRP.hasGroup(user_id, "ComandoGeralCORE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "SubComandoCORE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "EliteCORE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "OficialCORE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "SargentoCORE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "RecrutaCORE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- BOPE
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif vRP.hasGroup(user_id, "ComandanteGeralBOPE") then
                            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)

            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)         

        elseif vRP.hasGroup(user_id, "SubComandanteBOPE") then
                    
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)

            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)        

        elseif vRP.hasGroup(user_id, "CoronelBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "TenenteCoronelBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "MajorBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
            
        elseif vRP.hasGroup(user_id, "CapitaoBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
            
        elseif vRP.hasGroup(user_id, "PrimeiroTenenteBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
        elseif vRP.hasGroup(user_id, "SegundoTenenteBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
        elseif vRP.hasGroup(user_id, "SubTenenteBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
            
        elseif vRP.hasGroup(user_id, "PrimeiroSargentoBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
        elseif vRP.hasGroup(user_id, "SegundoSargentoBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
        elseif vRP.hasGroup(user_id, "TerceiroSargenteBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
            
        elseif vRP.hasGroup(user_id, "CaboBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
            
        elseif vRP.hasGroup(user_id, "SoldadoBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
        elseif vRP.hasGroup(user_id, "EstagiarioBope") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- CHOQUE
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
     

        elseif vRP.hasGroup(user_id, "ComandanteGeralCHOQUE") then
                    
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)

            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRPC.setArmour(source,100)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

        elseif vRP.hasGroup(user_id, "SubComandanteCHOQUE") then
                    
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)

            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

        elseif vRP.hasGroup(user_id, "CoronelCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "TenenteCoronelCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    
        elseif vRP.hasGroup(user_id, "MajorCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
            
        elseif vRP.hasGroup(user_id, "CapitaoCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
            
        elseif vRP.hasGroup(user_id, "PrimeiroTenenteCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
        elseif vRP.hasGroup(user_id, "SegundoTenenteCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
        elseif vRP.hasGroup(user_id, "SubTenenteCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
            
        elseif vRP.hasGroup(user_id, "PrimeiroSargentoCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
        elseif vRP.hasGroup(user_id, "SegundoSargentoCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
        elseif vRP.hasGroup(user_id, "TerceiroSargenteCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            vRPC.setArmour(source,100)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
            
        elseif vRP.hasGroup(user_id, "CaboCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo=250},
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
            
        elseif vRP.hasGroup(user_id, "SoldadoCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo=250},
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            vRPC.setArmour(source,100)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
        elseif vRP.hasGroup(user_id, "EstagiarioCHOQUE") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- COT
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif vRP.hasGroup(user_id, "ComandoCot") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "ComissarioCot") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "SubcomandoCot") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "DiretorCot") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "SupervisorCot") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "Elite3Cot") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "Elite2Cot") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "Elite1Cot") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
    
        elseif vRP.hasGroup(user_id, "EstagiarioCot") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vCLIENT._UpdateAttachs(source)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Policial", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIAFEDERAL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------            
        elseif vRP.hasGroup(user_id, "ComandanteGeralPF") then
                            
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_PARAFAL"] = {ammo=250},
                ["WEAPON_COMBATPISTOL"] = {ammo=250},
                ["WEAPON_COMBATPDW"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRP.setPatrulhamento(user_id)
            vRPC.setArmour(source,100)
            vCLIENT._UpdateAttachs(source)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialFederal", src = source, color = 44 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        elseif vRP.hasGroup(user_id, "DelegadoGeralPF") then
                    
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_PARAFAL"] = {ammo=250},
                ["WEAPON_COMBATPISTOL"] = {ammo=250},
                ["WEAPON_COMBATPDW"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRP.setPatrulhamento(user_id)
        vRPC.setArmour(source,100)
            vCLIENT._UpdateAttachs(source)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialFederal", src = source, color = 44 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        elseif vRP.hasGroup(user_id, "DelegadoPF") then
                    
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_PARAFAL"] = {ammo=250},
                ["WEAPON_COMBATPISTOL"] = {ammo=250},
                ["WEAPON_COMBATPDW"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRP.setPatrulhamento(user_id)
        vRPC.setArmour(source,100)
            vCLIENT._UpdateAttachs(source)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialFederal", src = source, color = 44 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        elseif vRP.hasGroup(user_id, "DelegadoAdjuntoPF") then
                    
            limparItems(user_id)
            
            vRPC.giveWeapons(source, { 
                ["WEAPON_PARAFAL"] = {ammo=250},
                ["WEAPON_COMBATPISTOL"] = {ammo=250},
                ["WEAPON_COMBATPDW"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRP.setPatrulhamento(user_id)
        vRPC.setArmour(source,100)
            vCLIENT._UpdateAttachs(source)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialFederal", src = source, color = 44 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        elseif vRP.hasGroup(user_id, "ComandoGTF") then
                    
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_PARAFAL"] = {ammo=250},
                ["WEAPON_COMBATPISTOL"] = {ammo=250},
                ["WEAPON_COMBATPDW"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRP.setPatrulhamento(user_id)
        vRPC.setArmour(source,100)
            vCLIENT._UpdateAttachs(source)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialFederal", src = source, color = 44 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        elseif vRP.hasGroup(user_id, "GTF") then
                    
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_PARAFAL"] = {ammo=250},
                ["WEAPON_COMBATPISTOL"] = {ammo=250},
                ["WEAPON_COMBATPDW"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRP.setPatrulhamento(user_id)
        vRPC.setArmour(source,100)
            vCLIENT._UpdateAttachs(source)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialFederal", src = source, color = 44 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        elseif vRP.hasGroup(user_id, "PeritoPF") then
                    
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo=250},
                ["WEAPON_CARBINERIFLE_MK2"] = {ammo=250},
                ["WEAPON_COMBATPDW"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
        vRPC.setArmour(source,100)
            vCLIENT._UpdateAttachs(source)
            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialFederal", src = source, color = 44 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        elseif vRP.hasGroup(user_id, "EscrivaoPF") then
                    
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo=250},
                ["WEAPON_CARBINERIFLE_MK2"] = {ammo=250},
                ["WEAPON_COMBATPDW"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
        vRPC.setArmour(source,100)
            vCLIENT._UpdateAttachs(source)
            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialFederal", src = source, color = 44 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        elseif vRP.hasGroup(user_id, "AgentePF") then
                    
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo=250},
                ["WEAPON_NIGHTSTICK"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_STUNGUN"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vCLIENT._UpdateAttachs(source)
            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialFederal", src = source, color = 44 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)      
            ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- POLICIA CIVIL
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif vRP.hasGroup(user_id, "ComandoGeralCivil") then
                    
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_ASSAULTSMG"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)

            vRPC.setArmour(source,100)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
        elseif vRP.hasGroup(user_id, "DelegadoGeral") then
             
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_ASSAULTSMG"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            vRPC.setArmour(source,100)
            limparItems(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
        elseif vRP.hasGroup(user_id, "Delegado") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_ASSAULTSMG"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
    
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
        elseif vRP.hasGroup(user_id, "ComandoCore") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_ASSAULTSMG"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
        elseif perm == "Core" and vRP.hasGroup(user_id, "Core") then
            
            vRP.setPatrulhamento(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_ASSAULTSMG"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1}  
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
    
    
    
        elseif vRP.hasGroup(user_id, "Perito") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_CARBINERIFLE_MK2"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo=250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
        elseif vRP.hasGroup(user_id, "Escrivao") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_CARBINERIFLE_MK2"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo=250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 

        elseif vRP.hasGroup(user_id, "EstagiarioDraco") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_CARBINERIFLE_MK2"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo=250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 

        elseif vRP.hasGroup(user_id, "AgenteDraco") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_CARBINERIFLE_MK2"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo=250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 

        elseif vRP.hasGroup(user_id, "SubComandoDraco") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_CARBINERIFLE_MK2"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo=250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 

        elseif vRP.hasGroup(user_id, "ComandoDraco") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_CARBINERIFLE_MK2"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo=250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
         
        elseif vRP.hasGroup(user_id, "Investigador") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_CARBINERIFLE_MK2"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_PARAFAL"] = {ammo=250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
         
        elseif vRP.hasGroup(user_id, "Agente") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
                ["WEAPON_COMBATPDW"] = {ammo= 250}, 
                ["WEAPON_CARBINERIFLE_MK2"] = {ammo= 250}, 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1},  
                ["WEAPON_PARAFAL"] = {ammo=250}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
    
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
    
        elseif vRP.hasGroup(user_id, "Recruta") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo=1}, 
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
    
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "PolicialCivil", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
    
    
    
        elseif vRP.hasGroup(user_id, "Desembargador") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_COMBATPISTOL"] = {ammo=250} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRPC.setArmour(source,100)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
        elseif vRP.hasGroup(user_id, "Juiz") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo= 0}, 
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Judiciario", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
        elseif vRP.hasGroup(user_id, "Promotor") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
                ["WEAPON_STUNGUN"] = {ammo= 0}, 
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Judiciario", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000) 
    
        
        elseif vRP.hasGroup(user_id, "Supervisor") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo= 250}, 
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Judiciario", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

        elseif vRP.hasGroup(user_id, "Advogado") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { 
            }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Judiciario", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
        elseif vRP.hasGroup(user_id, "EstagiarioADV") then
            
            vRP.setPatrulhamento(user_id)
            vRPC._giveWeapons(source, { }, true)
            limparItems(user_id)
            vRPC.setArmour(source,100)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            --TriggerEvent('eblips:add',{ name = "Judiciario", src = source, color = 3 })
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)
            
    
    ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    -- BOMBEIRO
    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif vRP.hasGroup(user_id, "CoronelBombeiro") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo=250},
                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })
    
        elseif vRP.hasGroup(user_id, "TenenteCoronelBombeiro") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })
    
        elseif vRP.hasGroup(user_id, "MajorBombeiro") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })
    
        elseif vRP.hasGroup(user_id, "CapitaoBombeiro") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })
    
        elseif vRP.hasGroup(user_id, "TenenteBombeiro") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })
    
        elseif vRP.hasGroup(user_id, "AspiranteBombeiro") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })
    
        elseif vRP.hasGroup(user_id, "AlunoOficialBombeiro") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { 
                ["WEAPON_COMBATPISTOL"] = {ammo=250},

                ["WEAPON_STUNGUN"] = {ammo=1},
                ["WEAPON_FLASHLIGHT"] = {ammo=1}, 
                ["WEAPON_NIGHTSTICK"] = {ammo=1} 
            }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HOSPITAL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif vRP.hasGroup(user_id, "Diretor") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })

        elseif vRP.hasGroup(user_id, "ViceDiretor") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })

        elseif vRP.hasGroup(user_id, "Gestao") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })

        elseif vRP.hasGroup(user_id, "Medico Psiquiatra") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })

        elseif vRP.hasGroup(user_id, "Medico") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })

        elseif vRP.hasGroup(user_id, "Enfermeiro") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })

        elseif vRP.hasGroup(user_id, "Psicologo") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })

        elseif vRP.hasGroup(user_id, "Socorrista") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })

        elseif vRP.hasGroup(user_id, "Segurança") then
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            vRP.setPatrulhamento(user_id)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Unizk",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            --TriggerEvent('eblips:add',{ name = "Hospital", src = source, color = 5 })

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MECANICA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif vRP.hasGroup(user_id, "Lider [Mecanica]") then
            mec = true
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            vRP.sendLog("", "**PONTO BATIDO** O mecanico "..user_id.." está em serviço!\nHORARIO - ".. os.date("[%d/%m/%Y as %H:%M]") .."")

        elseif vRP.hasGroup(user_id, "Sub-Lider [Mecanica]") then
            mec = true
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            vRP.sendLog("", "**PONTO BATIDO** O mecanico "..user_id.." está em serviço!\nHORARIO - ".. os.date("[%d/%m/%Y as %H:%M]") .."")

        elseif vRP.hasGroup(user_id, "Gerente [Mecanica]") then
            mec = true
            
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)

            limparItems(user_id)

            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            vRP.sendLog("", "**PONTO BATIDO** O mecanico "..user_id.." está em serviço!\nHORARIO - ".. os.date("[%d/%m/%Y as %H:%M]") .."")

        elseif vRP.hasGroup(user_id, "Membro [Mecanica]") then
            mec = true
            
            limparItems(user_id)

            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            vRP.sendLog("", "**PONTO BATIDO** O mecanico "..user_id.." está em serviço!\nHORARIO - ".. os.date("[%d/%m/%Y as %H:%M]") .."")

        elseif vRP.hasGroup(user_id, "Novato [Mecanica]") then
            mec = true
            
            limparItems(user_id)

            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Mecanica",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            vRP.sendLog("", "**PONTO BATIDO** O mecanico "..user_id.." está em serviço!\nHORARIO - ".. os.date("[%d/%m/%Y as %H:%M]") .."")

        elseif vRP.hasGroup(user_id, "Lider [AltaCustoms]") then
            mec = true
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"AltaCustoms",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            vRP.sendLog("", "**PONTO BATIDO** O mecanico "..user_id.." está em serviço!\nHORARIO - ".. os.date("[%d/%m/%Y as %H:%M]") .."")

        elseif vRP.hasGroup(user_id, "Sub-Lider [AltaCustoms]") then
            mec = true
            
            limparItems(user_id)
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)
            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"AltaCustoms",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            vRP.sendLog("", "**PONTO BATIDO** O mecanico "..user_id.." está em serviço!\nHORARIO - ".. os.date("[%d/%m/%Y as %H:%M]") .."")

        elseif vRP.hasGroup(user_id, "Gerente [AltaCustoms]") then
            mec = true
            
            vRPC.giveWeapons(source, { ["WEAPON_STUNGUN"] = {ammo=1} }, true)

            limparItems(user_id)

            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"AltaCustoms",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            vRP.sendLog("", "**PONTO BATIDO** O mecanico "..user_id.." está em serviço!\nHORARIO - ".. os.date("[%d/%m/%Y as %H:%M]") .."")

        elseif vRP.hasGroup(user_id, "Membro [AltaCustoms]") then
            mec = true
            
            limparItems(user_id)

            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"AltaCustoms",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            vRP.sendLog("", "**PONTO BATIDO** O mecanico "..user_id.." está em serviço!\nHORARIO - ".. os.date("[%d/%m/%Y as %H:%M]") .."")

        elseif vRP.hasGroup(user_id, "Novato [AltaCustoms]") then
            mec = true
            
            limparItems(user_id)

            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"AltaCustoms",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            vRP.sendLog("", "**PONTO BATIDO** O mecanico "..user_id.." está em serviço!\nHORARIO - ".. os.date("[%d/%m/%Y as %H:%M]") .."")


        elseif vRP.hasGroup(user_id, "Recrutador [AltaCustoms]") then
            mec = true
            
            limparItems(user_id)

            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"AltaCustoms",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  

            vRP.sendLog("", "**PONTO BATIDO** O mecanico "..user_id.." está em serviço!\nHORARIO - ".. os.date("[%d/%m/%Y as %H:%M]") .."")


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BENNYS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        elseif vRP.hasGroup(user_id, "DiretorJornal") then
            
            limparItems(user_id)
            
            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Jornalista",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)

        elseif vRP.hasGroup(user_id, "ProdutorJornal") then
            
            limparItems(user_id)

            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Jornalista",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            
        elseif vRP.hasGroup(user_id, "Reporter") then
            
            limparItems(user_id)

            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Jornalista",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            
        elseif vRP.hasGroup(user_id, "EstagiarioJornal") then
            
            limparItems(user_id)

            vRP.setPatrulhamento(user_id)
            vRP.giveInventoryItem(user_id, "radio", 1, true)
            TriggerClientEvent("vrp_blipsystem:serviceEnter",source,"Jornalista",26)
            TriggerClientEvent("Notify",source,"sucesso","Você pegou seus equipamentos.",6000)  
            

        else
            TriggerClientEvent("Notify",source,"negado","Você não possui permissao.",6000)  
        end
    end
end)

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
        elseif GetEntityModel(GetPlayerPed(source)) then 
            sexo = "mp_m_freemode_01"
        end
        
        
        if perm == "sairPtr" then
            vRP.removePatrulhamento(user_id)
            vRPC.giveWeapons(source, {}, true)
            limparItems(user_id)
            TriggerClientEvent("Notify",source,"negado","Você saiu de patrulhamento..",6000)  
            TriggerEvent('eblips:remove',source)
            vRPC.setArmour(source,0)

            if mec then
                vRP.sendLog("", "**SAIU DO PONTO** O mecanico "..user_id.." saiu de serviço!\nHORARIO - ".. os.date("[%d/%m/%Y as %H:%M]") .."")
            end
            mec = false
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
            elseif GetEntityModel(GetPlayerPed(source)) ~= GetHashKey("mp_f_freemode_01") then 
                sexo = "mp_m_freemode_01"
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
end