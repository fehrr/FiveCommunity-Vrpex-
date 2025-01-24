----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local DelayTimer = GetGameTimer()
local OrgOpen
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.OpenOrg(groupType)
    OrgOpen = groupType

    SetNuiFocus(true, true)
    SendNUIMessage({ action = "orgs" })

    ExecuteCommand("e tablet")
end

function RegisterTunnel.UpdateMessages(content)
    SendNUIMessage({ action = "UPDATE_MESSAGES-ORGS", content = content })
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CALLBACKS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('requestOrgs', function(data, cb)
    cb((vTunnel.RequestOrg() or {}))
end)

RegisterNUICallback('leaveOrg', function(data, cb)
    cb((vTunnel.leaveOrg(data.org)))

    vRP.DeletarObjeto()
end)

RegisterNUICallback('invitePlayer', function(data, cb)
    cb((vTunnel.invitePlayer(data.plyid, data.org, data.group)))
end)

RegisterNUICallback('promovePlayer', function(data, cb)
    cb((vTunnel.promovePlayer(data.plyid, data.org, data.group)))
end)

RegisterNUICallback('demotePlayer', function(data, cb)
    cb((vTunnel.demotePlayer(data.plyid, data.org)))
end)

RegisterNUICallback('requestPromovePlayer', function(data, cb)
    local Org,AdminMode = vTunnel.requestPromovePlayer(data.plyid)

    local FormatOrg = {}
    for index in pairs(orgsConfig.List[Org].groups) do
        if not orgsConfig.List[Org].groups[index].leader or AdminMode then
            FormatOrg[orgsConfig.List[Org].groups[index].tier] = { group = index, prefix = orgsConfig.List[Org].groups[index].prefix }
        end
    end


    cb({ list = FormatOrg})
end)

RegisterNUICallback('requestPlayerName', function(data, cb)
    local PlayerName,Org,AdminMode = vTunnel.requestPlayerName(data.plyid)
    if not PlayerName then return end
    
    local FormatOrg = {}
    for index in pairs(orgsConfig.List[Org].groups) do
        if not orgsConfig.List[Org].groups[index].leader or AdminMode then
            FormatOrg[orgsConfig.List[Org].groups[index].tier] = { group = index, prefix = orgsConfig.List[Org].groups[index].prefix }
        end
    end

    cb({ name = (PlayerName or "Não encontrado"), list = FormatOrg })
end)

RegisterNUICallback('requestBank', function(data, cb)
    cb((vTunnel.requestBank()))
end)

RegisterNUICallback('confirmBank', function(data, cb)
    cb((vTunnel.executeBank(data)))
end)

RegisterNUICallback('addMessage', function(data, cb)
    cb((vTunnel.registerChat(data.message)))
end)

RegisterNUICallback('requestOffices', function(data, cb)
    local Response = vTunnel.requestOffices()

    for index,status in pairs(Response[2]) do
        Response[2][index] = { status = status, name = orgsConfig.Permissions[index].name, description = orgsConfig.Permissions[index].description  }
    end

    cb(Response or {})
end)

RegisterNUICallback('requestSelectOffice', function(data, cb)
    local Response = vTunnel.requestSelectOffices(data.index)
    for index,status in pairs(Response) do
        Response[index] = { status = status, name = orgsConfig.Permissions[index].name, description = orgsConfig.Permissions[index].description }
    end

    cb(Response or {})
end)

RegisterNUICallback('saveOffice', function(data, cb)
    local formatOffices = {}
    for index,v in pairs(data.offices) do
        formatOffices[index] = v.status
    end

    vTunnel._updateOffice(data.index, formatOffices)
end)

RegisterNUICallback('requestConfigDatas', function(data, cb)
    local Storage = exports.dm_module:GetSelectStorage(OrgOpen)
    if not Storage then return end
    
    local Response = vTunnel.requestConfigDatas(Storage[1].value)
    cb({ 
        firstType = Storage[1].value,
        options = Storage,
        goal = Response.goals or {},
        info = Response.player or {}    
    })
end)

RegisterNUICallback('setConfigType', function(data, cb)
    local Response = vTunnel.requestConfigDatas(data.type)
    cb({ 
        goal = Response.goals or {},
        info = Response.player or {}   
    })
end)

RegisterNUICallback('newDate', function(data, cb)
    local Response = vTunnel.requestConfigDatas(data.type, data.day, data.month)
    cb({ 
        goal = Response.goals or {},
        info = Response.player or {}   
    })
end)

RegisterNUICallback('newGoals', function(data, cb)
    local Response = vTunnel.updateGoals(data)

    cb({ 
        goal = Response.goals or {},
        info = Response.player or {}   
    })
end)

RegisterNUICallback('reward', function(data, cb)
    vTunnel._reward(data)
end)