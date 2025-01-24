------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- QUERYS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare("dm_ranks/UpdateRank", "INSERT IGNORE INTO dm_ranks(org, orgType, wins) VALUES(@org, @orgType, @wins) ON DUPLICATE KEY UPDATE wins = wins + @wins")
vRP.prepare("dm_ranks/TopRanks", "SELECT * FROM dm_ranks ORDER BY wins DESC")
vRP.prepare("dm_ranks/SelectRanks", "SELECT * FROM dm_ranks WHERE orgType = @orgType ORDER BY wins DESC")

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local groups = module("cfg/groups").groups
local Domination = {
    Running = {
        --[1] = { user_id = 10, org = "Mafia01", orgType = 'Armas' },
    },

    Owners = {
        --[1] = "Mafia01" @@index = domination_id, @@value = orgName
    },

    PlayersZones = {
        --[1] = 1 @@index = user_id, @@value = domination_id
    },

    Cooldown = {
        --[1] = os.time() @@index = domination_id, @@value = time stamp 
    },

    KillsTiming = {
        -- [1] = { -- @@index == domination_id
        --     [1] = 5  -- @@index = user_id, value = kills_amount
        -- }
    },

    KillsInZone = {
        -- [1] = {
            --[1] = true,
        -- }
    }
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Domination:RequestInit(source, user_id, data)
    local plyType,plyOrg = Domination:GetGroupType(user_id)

    if (not plyType or DominationConfig.Zones[data.id].name ~= plyType) then
        TriggerClientEvent("Notify",source,"negado","Você não possui permissão para dominar essa area.",6000)
        return 
    end

    if self.Running[data.id] then
        TriggerClientEvent("Notify",source,"negado","Está area já está em andamento, mate quem está dominando.",6000)
        return
    end

    if (self.Owners[data.id] == plyOrg) then -- VALIDAR SE BATE COM A ORG DELE
        TriggerClientEvent("Notify",source,"negado","Você já possui o controle dessa area.",6000)
        return
    end

    if self.Cooldown[data.id] and self.Cooldown[data.id] - os.time() >= 0 then
        TriggerClientEvent("Notify",source,"negado","Aguarde ".. (self.Cooldown[data.id] - os.time()) .." segundo(s) para dominar esta area..",6000)
        return
    end
    self.Cooldown[data.id] = (os.time() + 10)

    TriggerClientEvent("Notify",source,"sucesso","Você iniciou a dominação nessa area.",6000)

    Domination:Init(data.id, { user_id = user_id, source = source, org = plyOrg, orgType = plyType })

    return true
end

function Domination:Init(zone_id, ply)
    self.Running[zone_id] = { user_id = ply.user_id, org = ply.org, orgType = ply.orgType }
    
    CreateThread(function()
        local zone_id = zone_id
        local counter = (DominationConfig.Zones[zone_id].time * 60)

        while self.Running[zone_id] do
            counter -= 1

            local plyId = self.Running[zone_id].user_id
            local plySrc = vRP.getUserSource(plyId)

            local plyPed = GetPlayerPed(plySrc) 
            if (plyPed == 0) then
                self:Cancel(zone_id, "^9[DOMINACAO] ^0A zona de conflito foi controlada, um dos invasores fugiram.")
                return
            end

            local plyHealth = GetEntityHealth(plyPed)
            if plyHealth <= 101 then
                self:Cancel(zone_id, "^9[DOMINACAO] ^0A zona de conflito foi controlada, um dos invasores morreu.")
                return
            end

            if counter <= 0 then
                self:Finish(zone_id, self.Running[zone_id])
                return
            end

            Wait( 1000 )
        end
    end)

    Domination:AlertMessages("^9[DOMINACAO] ^0Uma zona de conflito esta sendo dominada nesse momento.")
    vTunnel._updateDomination(-1, zone_id, true, false, ply.source)
end

function Domination:Cancel(zone_id, reason)
    self.Running[zone_id] = nil
    self.KillsTiming[zone_id] = nil

    Domination:AlertMessages(reason)
    vTunnel._updateDomination(-1, zone_id, nil)
end

function Domination:Finish(zone_id, ply)

    -- GIVAR DROGAS
    if DominationConfig.Zones[zone_id].reward then
        DominationConfig.Zones[zone_id].reward(ply.user_id)
    end

    -- RESETANDO / ATUALIZANDO VARIAVEIS
    self.Running[zone_id] = nil
    self.KillsTiming[zone_id] = nil
    self.Owners[zone_id] = ply.org
    self.Cooldown[zone_id] = (os.time() + DominationConfig.Zones[zone_id].cooldown * 60)

    -- ANUNCIANDO VENCEDOR
    Domination:AlertMessages(("^9[DOMINACAO] ^0Organização %s venceu a dominação."):format(ply.org))
    
    -- DESLIGANDO DOMINACAO DO CLIENTE
    vTunnel._updateDomination(-1, zone_id, nil, ply.org)

    -- SISTEMA DE RANKS
    vRP.execute("dm_ranks/UpdateRank", { org = ply.org, orgType = DominationConfig.FormatNames[ply.orgType], wins = 1 })

    -- ATUALIZAR NO BANCO DE DADOS
    if DominationConfig.saveDB then
        local data = vRP.getSData("dm_dominacao", {})
        local result = json.decode(data) or {}
        if data then
            result[tostring(zone_id)] = { zone = DominationConfig.Zones[zone_id].name, org = ply.org }
            vRP.setSData("dm_dominacao", json.encode(result))
        end
    end

end

function Domination:GetGroupType(user_id)
    local plyGroup = vRP.getUserGroupByType(user_id, "org")
    if plyGroup == "" and not groups[plyGroup] then return false end
    
    return (groups[plyGroup]._config and groups[plyGroup]._config.orgType or false), (groups[plyGroup]._config and groups[plyGroup]._config.orgName or false)
end

function Domination:EnterArea(user_id, domination_id)
    self.PlayersZones[user_id] = domination_id
end

function Domination:LeaveArea(user_id, domination_id)
    self.PlayersZones[user_id] = nil
end

function Domination:AlertMessages(message)
    TriggerClientEvent('chatMessage', -1, message)
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterTunnel.RequestInit = function(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    return Domination:RequestInit(source, user_id, data)
end

local AlertTimer = {}
RegisterTunnel.EnterZone = function(domination_id, running)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    Domination:EnterArea(user_id, domination_id)
    

    -- VERIFICANDO SE NAO MORREU NOS ULTIMOS 40MIN DE DOMINACAO
    if Domination.KillsInZone[domination_id] and Domination.KillsInZone[domination_id][user_id] then
        if (Domination.KillsInZone[domination_id][user_id] - os.time()) > 0 then

            local time = (Domination.KillsInZone[domination_id][user_id] - os.time())
            TriggerClientEvent('Notify',source,'negado',"Aguarde "..  math.floor((time / 3600)).."h:".. math.floor((time / 60) % 60) .."m:"..(time % 60).."s" .." segundo(s) para ter acesso a esse local novamente.")

            CreateThread(function()
                while Domination.PlayersZones[user_id] do
                    if not AlertTimer[user_id] then
                        AlertTimer[user_id] = 10
                    end

                    TriggerClientEvent('Notify',source,'negado',"Saia Imediatamente dessa area, caso contrario você vai morrer em "..AlertTimer[user_id].." segundo(s).")

                    if AlertTimer[user_id] <= 0 then
                        AlertTimer[user_id] = nil
                        vRPclient._setHealth(source, 101)
                    end

                    if AlertTimer[user_id] then
                        AlertTimer[user_id] = (AlertTimer[user_id] - 2)
                    end

                    Wait( 2000 )
                end
            end)

        else
            if Domination.KillsInZone[domination_id] and Domination.KillsInZone[domination_id][user_id] then
                Domination.KillsInZone[domination_id][user_id] = nil
                AlertTimer[user_id] = nil
            end
        end
    end

end

RegisterTunnel.LeaveZone = function(domination_id)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    Domination:LeaveArea(user_id, domination_id)
end

RegisterTunnel.CancelDomination = function(domination_id)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end
    if domination_id == 0 then return end
    
    Domination:Cancel(domination_id, "^9[DOMINACAO] ^0A Zona de conflito foi controlada, um dos invasores fugiram.")
end

RegisterTunnel.SendKillFeed = function(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    if data.zone and not Domination.Running[data.zone] then return end

    local t = {}
    local videntity = vRP.getUserIdentity(user_id)

    t.victim = videntity.nome.. ' '..videntity.sobrenome
    t.weapon = data.weapon
    t.killer = 0

    if (data.attacker > 0) then
        local kuser_id = vRP.getUserId(data.attacker)
        local kidentity = vRP.getUserIdentity(kuser_id)

        t.killer = kidentity.nome.. ' '..kidentity.sobrenome 

        -- SISTEMA DE KILL STREAK
        if not Domination.KillsTiming[data.zone] then Domination.KillsTiming[data.zone] = {} end

        if not Domination.KillsTiming[data.zone][kuser_id] then Domination.KillsTiming[data.zone][kuser_id] = 0 end
        Domination.KillsTiming[data.zone][kuser_id] += 1

        SetTimeout(20*1000, function() if Domination.KillsTiming[data.zone] then Domination.KillsTiming[data.zone][kuser_id] -= 1 end end)

        local ksource = vRP.getUserSource(kuser_id)
        if not ksource then return end

        vTunnel._updateKillStreak(ksource, Domination.KillsTiming[data.zone][kuser_id])
    end

    if not Domination.KillsInZone[data.zone] then Domination.KillsInZone[data.zone] = {} end
    Domination.KillsInZone[data.zone][user_id] = (os.time() + DominationConfig.delayDeath * 60)

    for ply_id,zone_id in pairs(Domination.PlayersZones) do
        async(function()
            local plySrc = vRP.getUserSource(ply_id)
            if not plySrc then return end

            if (zone_id == data.zone) then
                vTunnel._syncDeath(plySrc, t)
            end
        end)
    end
end

RegisterTunnel.TopRanks = function()
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local query = vRP.query('dm_ranks/TopRanks', {})
    
    local topRanks = {}
    local listRanks = {}
    for i = 1, #query do
        if #topRanks < 3 then
            topRanks[i] = { org = query[i].org, orgType = query[i].orgType, wins = query[i].wins, position = i } 
        end

        if i >= 4 then
            listRanks[i] = { org = query[i].org, orgType = query[i].orgType, wins = query[i].wins, position = i } 
        end
    end

    return {topRanks,listRanks}
end

RegisterTunnel.getRank = function(orgType)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local query = vRP.query('dm_ranks/SelectRanks', { orgType = orgType })
    
    local listRanks = {}
    for i = 1, #query do
        listRanks[i] = { org = query[i].org, orgType = query[i].orgType, wins = query[i].wins, position = i } 
    end

    return listRanks
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CREATE MODE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.SendZone(zone)
    local source = source
    local user_id = vRP.getUserId(source)
    if user_id then
        local FormatZones = ""

        for i = 1, #zone do
            if i == #zone then
                FormatZones = FormatZones.. "    vec3("..tD(zone[i].x)..","..tD(zone[i].y)..","..tD(zone[i].z)..")"
            else
                FormatZones = FormatZones.. "    vec3("..tD(zone[i].x)..","..tD(zone[i].y)..","..tD(zone[i].z).."),\n"
            end
        end

        vRPclient.prompt(source, "Copie sua zona: ", "coordsZone = { -- CORDENADAS DA ZONA DE DOMINAÇÃO ( LIGUE OS PONTOS EM LINHA RETAS SEM CRUZAR )\n"..FormatZones.."\n},")
    end
end

RegisterCommand('create_zone', function(source,args)
    local user_id = vRP.getUserId(source)
    if user_id then
        if vRP.hasPermission(user_id, "admin.permissao") then
            vTunnel._openCreateMode(source)
        end
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREAD
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    local data = vRP.getSData("dm_dominacao", {})
    local result = json.decode(data) or {}
    if data then
        for index,v in pairs(result) do
            index = parseInt(index)

            Domination.Owners[index] = v.org
        end
    end

    SetTimeout(2000,function()
        vTunnel._syncBlipsDomination(-1, Domination.Owners)
    end)
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HANDLERS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
    if user_id then
        vTunnel._syncBlipsDomination(source, Domination.Owners)

        for index in pairs(Domination.Running) do
            vTunnel._updateDomination(source, index, true, false, (vRP.getUserSource(Domination.Running[index].user_id) or 0) )
        end
    end
end)

AddEventHandler("vRP:playerLeave",function(user_id,source)
    for index,v in pairs(Domination.Running) do
        if v.user_id == user_id then
            Domination:Cancel(index, "^9[DOMINACAO] ^0A zona de conflito foi controlada, um dos invasores fugiram.")
        end
    end
end)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OTHERS COMMANDS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('dominacao', function(source,args)
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local formatMessage = ""

   
    for zone_id in pairs(DominationConfig.Zones) do
        local OwnerZone = "Ninguem"
        if Domination.Owners[zone_id] then
            OwnerZone = Domination.Owners[zone_id]
        end

        local AvaliableZone = "Disponivel"
        if Domination.Cooldown[zone_id] then
            local time = (Domination.Cooldown[zone_id] - os.time())
            if time > 0 then
                AvaliableZone = math.floor((time / 3600)).."h:".. math.floor((time / 60) % 60) .."m:"..(time % 60).."s"
            else
                AvaliableZone = "Disponivel"
            end
        end
    
        formatMessage = formatMessage.. "Zona: "..DominationConfig.FormatNames[DominationConfig.Zones[zone_id].name].. "<br>Dono: "..OwnerZone.. "<br>Status: "..AvaliableZone.." <br><br>"
    end

    TriggerClientEvent("Notify",source,"importante","Lista das Zonas: <br><br>"..formatMessage, 15)
end)

RegisterCommand('resetardominacao', function(source,args)
    local user_id = vRP.getUserId(source)
    
    if not user_id then return end
    if not vRP.hasPermission(user_id, 'admin.permissao') then return end

    local formatText = ""
    local zones = {}
    for index in pairs(DominationConfig.Zones) do
        local zone = DominationConfig.Zones[index]

        formatText = ('%s,'):format(zone.name).. formatText
        zones[zone.name] = index
    end

    local prompt = vRP.prompt(source, 'Escolha a Dominação que deseja resetar!', formatText)
    if prompt == "" or not prompt or not zones[prompt] then
        return
    end
    
    local zone_id = zones[prompt]
    Domination.Owners[zone_id] = nil

    vTunnel._syncBlipDomination(-1, zone_id)
    TriggerClientEvent('Notify',source,'sucesso','Você resetou essa zona de dominação.')

    local data = vRP.getSData("dm_dominacao", {})
    local result = json.decode(data) or {}
    if data then
        result[tostring(zone_id)] = nil

        vRP.setSData("dm_dominacao", json.encode(result))
    end
end)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EXPORTS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
exports('GetUserDomination', function(user_id)
    local orgType, orgName = Domination:GetGroupType(user_id)
    if not orgName or not orgType then return end

    local orgDominationData = { orgName = orgName, orgType = orgType, zones = {} }
    local zoneFound = false

    for index in pairs(Domination.Owners) do
        local dominedOrg = Domination.Owners[index]
        if dominedOrg == orgName then
            zoneFound = true
            local zoneData = { zone = DominationConfig.FormatNames[DominationConfig.Zones[index].name], orgName = orgName, orgType = orgType }
            table.insert(orgDominationData.zones, zoneData)
        end
    end

    if zoneFound then
        return orgDominationData
    else
        return nil
    end
end)
