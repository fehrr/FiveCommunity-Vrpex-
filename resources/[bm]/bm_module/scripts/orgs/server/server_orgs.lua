----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PREPARES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
vRP.prepare('bm_module/orgs/GetDataTable', " SELECT user_id,dvalue FROM vrp_user_data WHERE dkey = 'vRP:datatable' ")
vRP.prepare('bm_module/orgs/CreateOrgIfNotExist', " INSERT IGNORE INTO bm_orgs(org) VALUES (@org) ")
vRP.prepare('bm_module/orgs/GetOrgsInfo', " SELECT bank,description,pix FROM bm_orgs WHERE org = @org ")
vRP.prepare('bm_module/orgs/GetLastLogins', "SELECT id,ultimo_login FROM vrp_users ")
vRP.prepare('bm_module/orgs/GetOrgsBanksInfos', " SELECT bank,bank_transactions FROM bm_orgs WHERE org = @org ")
vRP.prepare("bm_module/orgs/UpdateBankTransactions", " UPDATE bm_orgs SET bank_transactions = @value WHERE org = @org ")
vRP.prepare("bm_module/orgs/UpdateBankInfo", " UPDATE bm_orgs SET bank = @bank WHERE org = @org ")
vRP.prepare('bm_module/orgs/GetOrgsPermissions', 'SELECT org,permissions FROM bm_orgs')
vRP.prepare('bm_module/orgs/updateOrgsPermissions', "UPDATE bm_orgs SET permissions = @permissions WHERE org = @org")
vRP.prepare("Select_Reward", "SELECT * FROM mirtin_orgs_rewards WHERE user_id = @user_id")
vRP.prepare("Update_Reward", "INSERT IGNORE INTO mirtin_orgs_rewards(user_id,org,invite_userid) VALUES(@user_id,@org,@invite_userid)")
vRP.prepare("identity/getImagem", "SELECT avatarURL from smartphone_instagram WHERE user_id = @user_id ")
vRP.prepare('bm_module/orgs/addPlayerFarm', 'INSERT IGNORE INTO bm_orgs_farms(org, user_id, item, amount, day, month) VALUES(@org, @user_id, @item, @amount, @day, @month) ON DUPLICATE KEY UPDATE amount = amount + @amount;')
vRP.prepare('bm_module/orgs/getOrgFarmForDate', 'SELECT * FROM bm_orgs_farms WHERE day = @day AND month = @month AND org = @org AND item = @item ORDER BY amount DESC')
vRP.prepare('bm_module/orgs/getOrgConfig', 'SELECT bank,bank_transactions,config_goals FROM bm_orgs WHERE org = @org')
vRP.prepare('bm_module/orgs/setOrgConfig', 'UPDATE bm_orgs SET config_goals = @config_goals WHERE org = @org')
vRP.prepare('bm_module/orgs/getAllPlayerFarm', 'SELECT * FROM bm_orgs_farms WHERE user_id = @user_id AND item = @item AND month = @month ')
vRP.prepare('bm_module/orgs/getPlayerFarm', 'SELECT * FROM bm_orgs_farms WHERE user_id = @user_id and org = @org and day = @day and item = @item')
vRP.prepare('bm_module/orgs/UpdatePlayerFarm', 'UPDATE bm_orgs_farms SET reward = @reward WHERE user_id = @user_id and org = @org and day = @day and item = @item')

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIABLES
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local func = exports["vrp"]
local PaymentReward = {}
local ORGS = {
    List = {
        --["Lider [MAFIA02]"] = "Mafia 02" @params group(string), @params groupType(string)
    },

    Member = {
        --[1] = { @params user_id(integer)
        --  group = "Lider [MAFIA02]" @params group(string)
        --  groupType = "MAFIA02" @params groupType(string)
        --}
    },

    MembersList = {
        --["Mafia 02"] = { @params group(string)
        -- [1] = true @params user_id(int)
        --}
    },

    LastLogins = {
        --[1] = "12/03/2001"
    },

    Chat = {
        -- ['PCC'] = {
        --     { message = "dasdsa", author = 'Mirtin Zera #1',  }
        -- }
    },

    Permissions = {
        -- ['Hospital'] = {
        --      ["Vice-Diretor"] = { 
        --         invite = false, -- Permissao para Convidar
        --         demote = false, -- Permissao Para Demitir
        --         promove = false, -- Permissao Para Promover
        --         withdraw = false, -- Permissao Para Sacar Dinheiro
        --         deposit = false, -- Permissao Para Depositar Dinheiro
        --         message = false, -- Permissao para Escrever nas anotaçoes
        --         action = false, -- Permissao para Marcar Ação
        --         pix = false, -- Permissao para Alterar o Pix
        --     }
        -- }
    }
}

print = function()
    -- OFF TEMPORARIO
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ORGS:AddUserGroup(user_id, v)
    self.Member[user_id] = v
    
    if not self.MembersList[v.groupType] then
        self.MembersList[v.groupType] = {}
    end

    self.MembersList[v.groupType][user_id] = true
end

function ORGS:RemUserGroup(user_id)
    local groupType = self.Member[user_id] and (self.Member[user_id].groupType or false)
    if not groupType then print("Houve um problema no RemUserGroup do USER_ID: "..user_id) return end

    if self.MembersList[groupType] then
        self.MembersList[groupType][user_id] = nil
    end

    self.Member[user_id] = nil
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TUNNELS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTunnel.RequestOrg()
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local identity = vRP.getUserIdentity(user_id)
    if not identity then return end

    local user = ORGS.Member[user_id]
    if not user then print("Você não faz parte de nenhuma organização!") return end

    if not ORGS.MembersList[user.groupType] then print("Ops, houve um problema contate um administrador.") return end

    local query = vRP.query("bm_module/orgs/GetOrgsInfo", { org = user.groupType  })
    if #query == 0 then print("Ops, houve um problema ao consultar no banco de dados.") return end

    --[[ local rows = vRP.query("identity/getImagem", { user_id = user_id }) ]]

    local FormatMembers = {}
    local MembersActive = 0
    for ply_id in pairs(ORGS.MembersList[user.groupType]) do
        local nidentity = vRP.getUserIdentity(ply_id)
        if not nidentity then print("Problemas ao carregar identidade.") goto skip end

        local hasActive = (vRP.getUserSource(ply_id) ~= nil)
        if hasActive then MembersActive = (MembersActive + 1) end

        local nuser = ORGS.Member[ply_id]
        if not nuser then print("Problemas ao carregar organizacao.") goto skip end

        FormatMembers[#FormatMembers + 1] = {
            name = nidentity.nome.. " "..nidentity.sobrenome,
            user_id = ply_id,
            online = hasActive,
            groupPrefix = orgsConfig.List[nuser.groupType] and orgsConfig.List[nuser.groupType].groups[nuser.group].prefix or "Indefinido",
            last_login = ORGS.LastLogins[ply_id]
        }

        :: skip ::
    end

    return { 
        Organization = user.groupType,
        Members = FormatMembers,
        TotalMembers = #FormatMembers,  
        TotalMembersActive = MembersActive,
        Chat = ORGS:RequestOrgsMessage(user.groupType),
        BankValue = query[1].bank and (query[1].bank or 0),
        Description = (query[1].description ~= "") and (query[1].description or ""),
        Permissions = ORGS.Permissions[user.groupType] and ORGS.Permissions[user.groupType][user.group] or {},
        Leader = (orgsConfig.List[user.groupType].groups[user.group].leader == true),
        Name = (identity.nome .. " ".. identity.sobrenome),
        User_id = user_id,
        Avatar = "images/avatar.png"
    }
end

function RegisterTunnel.requestPlayerName(ply_id)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        print(([[%s Tentou Injetar o Tunnel requestPlayerName]]):format(user_id))
        return
    end

    local identity = vRP.getUserIdentity(ply_id)
    if not identity then return end

    return ([[%s %s (%d)]]):format(identity.nome, identity.sobrenome, ply_id),org.groupType,vRP.hasPermission(user_id, "admin.permissao")
end

function RegisterTunnel.requestOffices()
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local user = ORGS.Member[user_id]
    if not user then
        print(([[%s Tentou Injetar o Tunnel requestOffices]]):format(user_id))
        return
    end

    local formatOrgs = {}
    local lastTier = 0
    for groupName, v in pairs(orgsConfig.List[user.groupType].groups) do
        if not v.leader then
            formatOrgs[v.tier] = { prefix = v.prefix, index = groupName }

            if v.tier > lastTier then
                lastTier = v.tier
                tierPermission = ORGS.Permissions[user.groupType] and ORGS.Permissions[user.groupType][groupName] or {}
            end
        end
    end

    return {formatOrgs, tierPermission}
end

function RegisterTunnel.requestSelectOffices(group)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local user = ORGS.Member[user_id]
    if not user then
        print(([[%s Tentou Injetar o Tunnel requestSelectOffices]]):format(user_id))
        return
    end

    return ORGS.Permissions[user.groupType] and ORGS.Permissions[user.groupType][group] or {}
end

function RegisterTunnel.requestPromovePlayer(ply_id)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        print(([[%s Tentou Injetar o Tunnel requestPromovePlayer]]):format(user_id))
        return
    end

    return org.groupType,vRP.hasPermission(user_id, "admin.permissao")
end

function RegisterTunnel.promovePlayer(ply_id, orgInvited, group)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        print(([[%s Tentou Injetar o Tunnel promovePlayer]]):format(user_id))
        return
    end

    if org.groupType ~= orgInvited or ORGS.List[group] ~= org.groupType then
        print(([[%s Tentou Injetar o Tunnel promovePlayer]]):format(user_id))
        return
    end

    local isMember = string.sub(org.group, 1, 6) == "Membro"
    local isRecruiter = string.sub(org.group, 1, 10) == "Recrutador"
    if isRecruiter or isMember then
        if orgsConfig.List[orgInvited].groups[group].tier >= 4 then
            TriggerClientEvent("Notify", source, "negado", "Membros/Recrutadores não podem promover membros para serem líderes, sublíderes ou gerentes.", 5)
            return
        end
    end

    local hasLeader = orgsConfig.List[org.groupType] and (orgsConfig.List[org.groupType].groups[org.group].leader or false)
    if not hasLeader then
        local Permission = ORGS.Permissions[org.groupType] and (ORGS.Permissions[org.groupType][org.group].promove or false)
        if not Permission then
            TriggerClientEvent("Notify",source,"negado","Você não possui permissão para promover.", 5)
            return
        end
    end

    if ply_id == user_id then
        TriggerClientEvent("Notify",source,"negado","Você não pode se promover.", 5)
        return
    end

    if orgsConfig.List[org.groupType].groups[group] and orgsConfig.List[org.groupType].groups[group].maxSets ~= nil then
        local plysInGroup = 0
        for ply_id in pairs(ORGS.MembersList[org.groupType]) do
            if ORGS.Member[ply_id] and ORGS.Member[ply_id].group == group then
                plysInGroup = (plysInGroup + 1)
            end
        end

        if plysInGroup > orgsConfig.List[org.groupType].groups[group].maxSets then
            TriggerClientEvent("Notify",source,"negado","Maximo de pessoas nesse cargo excedida.", 5)
            return
        end
    end

    if not ORGS.Member[ply_id] then
        TriggerClientEvent("Notify",source,"negado","Este jogador não se encontra em nenhuma organização.", 5)
        return
    end

    local ply_src = vRP.getUserSource(ply_id)
    if ply_src then
        TriggerClientEvent("Notify",ply_src,"importante","Você foi promovido/rebaixado.", 5)
        vRP.addUserGroup(ply_id, group)
    else
        local datatable = json.decode(vRP.getUData(ply_id, "vRP:datatable")) or {}
        datatable.groups[group] = true
        
        if datatable.groups[ORGS.Member[ply_id].group] then
            datatable.groups[ORGS.Member[ply_id].group] = nil
        end

        local rows = exports["oxmysql"]:executeSync('UPDATE vrp_user_data SET dvalue = ? WHERE user_id = ? and dkey = "vRP:datatable"', { json.encode(datatable), ply_id })
        if rows.affectedRows > 0 then
            ORGS:AddUserGroup(ply_id, {
                group = group,
                groupType = ORGS.List[group]
            })
        else
            TriggerClientEvent("Notify",source,"negado","Ops, houve um problema tente novamente.", 5)
            return false
        end
    end

    TriggerClientEvent("Notify",source,"sucesso","Você promoveu/rebaixou esse jogador com sucesso.", 5)
    return true
end

function RegisterTunnel.invitePlayer(ply_id, orgInvited, group)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        print(([[%s Tentou Injetar o Tunnel invitePlayer]]):format(user_id))
        return
    end

    if org.groupType ~= orgInvited or ORGS.List[group] ~= org.groupType then
        print(([[%s Tentou Injetar o Tunnel invitePlayer]]):format(user_id))
        return
    end

    local isMember = string.sub(org.group, 1, 6) == "Membro"
    local isRecruiter = string.sub(org.group, 1, 10) == "Recrutador"
    if isRecruiter or isMember then
        if orgsConfig.List[orgInvited].groups[group].tier >= 4 then
            TriggerClientEvent("Notify", source, "negado", "Membros/Recrutadores não podem convidar membros para ser líderes, sublíderes ou gerentes.", 5)
            return
        end
    end

    local hasLeader = orgsConfig.List[org.groupType] and (orgsConfig.List[org.groupType].groups[org.group].leader or false)
    if not hasLeader then
        local Permission = ORGS.Permissions[org.groupType] and (ORGS.Permissions[org.groupType][org.group].invite or false)
        if not Permission then
            TriggerClientEvent("Notify",source,"negado","Você não possui permissão para convidar.", 5)
            return
        end
    end

    if ply_id == user_id then
        TriggerClientEvent("Notify",source,"negado","Você não pode se convidar.", 5)
        return
    end

    if orgsConfig.List[org.groupType].groups[group] and orgsConfig.List[org.groupType].groups[group].maxSets ~= nil then
        local plysInGroup = 0
        for ply_id in pairs(ORGS.MembersList[org.groupType]) do
            if ORGS.Member[ply_id] and ORGS.Member[ply_id].group == group then
                plysInGroup = (plysInGroup + 1)
            end
        end

        if plysInGroup > orgsConfig.List[org.groupType].groups[group].maxSets then
            TriggerClientEvent("Notify",source,"negado","Maximo de pessoas nesse cargo excedida.", 5)
            return
        end
    end

    local ply_src = vRP.getUserSource(ply_id)
    if not ply_src then
        TriggerClientEvent("Notify",source,"negado","O Jogador não se encontra na cidade no momento.", 5)
        return
    end

    if ORGS.Member[ply_id] then
        TriggerClientEvent("Notify",source,"negado","Este jogador já está em uma organização.", 5)
        return
    end

    -- local isBlackList,tempoBlackList = ORGS:checkBlackList(ply_id)
    -- if isBlackList then
    --     orgsConfig.langs['haveBlackList'](source, os.date("%d/%m/%Y", tempoBlackList))
    --     return
    -- end

    local request = vRP.request(ply_src, "Estão te convidando para a organização "..org.groupType.." deseja aceitar?", 30)
    if not request then
        TriggerClientEvent("Notify",source,"negado","O Jogador recusou seu convite.", 5)
        return
    end

    -- SISTEMA DE RECOMPENSA POR INVITE NOVO
    local Query = vRP.query("Select_Reward", { user_id = ply_id })
    PaymentReward[ply_id] = true
    for index = 1, #Query do
        local ply = Query[index]
        if ply.org == orgInvited then
            PaymentReward[ply_id] = false
        end
    end

    if PaymentReward[ply_id] then
        local plyOrg = vRP.getUserGroupOrg(ply_id)
        if plyOrg ~= orgInvited then
            local PaymentValue = 50000
            vRP.execute("Update_Reward", { user_id = ply_id, org = orgInvited, invite_userid = user_id })
            vRP.giveMoney(user_id, PaymentValue)
            TriggerClientEvent("Notify",source, "sucesso","Você recebeu "..vRP.format(PaymentValue).." por essa contratação.", 5)
        end
    end

    TriggerClientEvent("Notify",source,"sucesso","O Jogador aceitou seu convite.", 5)
    vRP.addUserGroup(ply_id, group)
    vRP.sendLog("https://discord.com/api/webhooks/1129869604899008543/gTla-z5ltMYYKUSGZko3fUmO8tTsC9-50SkFMN9wOo1w8qHu7zsB2oJLQ52519JXuFYY", "O ID "..user_id.." INVITOU O "..ply_id.." PARA A ORGANIZAÇÃO: "..group)
    return true
end

function RegisterTunnel.leaveOrg(orgInvited)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        print(([[%s Tentou Injetar o Tunnel invitePlayer]]):format(user_id))
        return
    end
    
    if org.groupType ~= orgInvited then
        print(([[%s Tentou Injetar o Tunnel invitePlayer]]):format(user_id))
        return
    end

    if org.groupType == "Mecanica" or org.groupType == "Hospital" or org.groupType == "Policia" or org.groupType == "Cot" or org.groupType == "PoliciaCivil" then
        vRPclient._giveWeapons(source, {} ,true) 
    end

    -- ORGS:addBlackList(user_id)
    vRP.removeUserGroup(user_id, org.group) -- Caso der problema ( filtrar pelo getUserGroupByType )
    TriggerClientEvent("Notify",source,"sucesso","Você saiu da sua organização.", 5)
end

function RegisterTunnel.demotePlayer(ply_id, orgInvited)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local org = ORGS.Member[user_id]
    if not org then
        print(([[%s Tentou Injetar o Tunnel demotePlayer]]):format(user_id))
        return
    end

    if org.groupType ~= orgInvited  then
        print(([[%s Tentou Injetar o Tunnel demotePlayer]]):format(user_id))
        return
    end

    local isMember = string.sub(org.group, 1, 6) == "Membro"
    local isRecruiter = string.sub(org.group, 1, 10) == "Recrutador"
    if isRecruiter or isMember then
        if orgsConfig.List[orgInvited].groups[group].tier >= 4 then
            TriggerClientEvent("Notify", source, "negado", "Membros/Recrutadores não podem demitir líderes, sublíderes ou gerentes.", 5)
            return
        end
    end
    
    local hasLeader = orgsConfig.List[org.groupType] and (orgsConfig.List[org.groupType].groups[org.group].leader or false)
    if not hasLeader then
        local Permission = ORGS.Permissions[org.groupType] and (ORGS.Permissions[org.groupType][org.group].demote or false)
        if not Permission then
            TriggerClientEvent("Notify",source,"negado","Você não possui permissão para demitir.", 5)
            return
        end
    end

    if ply_id == user_id then
        TriggerClientEvent("Notify",source,"negado","Você não pode se demitir.", 5)
        return
    end

    if not ORGS.Member[ply_id] then
        TriggerClientEvent("Notify",source,"negado","Este não se encontra em nenhuma organização.", 5)
        return
    end

    local ply_src = vRP.getUserSource(ply_id)
    if ply_src then
        TriggerClientEvent("Notify",ply_src,"negado","Você foi demitido de sua Organização.", 5)
        vRP.removeUserGroup(ply_id, ORGS.Member[ply_id].group) -- Caso der problema ( filtrar pelo getUserGroupByType )
        -- ORGS:addBlackList(ply_id)

        if org.groupType == "Mecanica" or org.groupType == "Hospital" or org.groupType == "Policia" or org.groupType == "Cot" or org.groupType == "PoliciaCivil" then
            vRPclient._giveWeapons(ply_src, {} ,true) 
        end
        vRP.sendLog("https://discord.com/api/webhooks/1129869604899008543/gTla-z5ltMYYKUSGZko3fUmO8tTsC9-50SkFMN9wOo1w8qHu7zsB2oJLQ52519JXuFYY", "O ID "..user_id.." DEMITIU O "..ply_id.." DA ORGANIZAÇÃO: "..org.groupType)

    else
        local datatable = json.decode(vRP.getUData(ply_id, "vRP:datatable")) or {}
        datatable.groups[ORGS.Member[ply_id].group] = nil

        local rows = exports["oxmysql"]:executeSync('UPDATE vrp_user_data SET dvalue = ? WHERE user_id = ? and dkey = "vRP:datatable"', { json.encode(datatable), ply_id })
        if rows.affectedRows > 0 then
            -- ORGS:addBlackList(ply_id)
            ORGS:RemUserGroup(ply_id)
            vRP.sendLog("https://discord.com/api/webhooks/1129869604899008543/gTla-z5ltMYYKUSGZko3fUmO8tTsC9-50SkFMN9wOo1w8qHu7zsB2oJLQ52519JXuFYY", "O ID "..user_id.." DEMITIU O "..ply_id.." DA ORGANIZAÇÃO: "..org.groupType)
        else
            TriggerClientEvent("Notify",source,"negado","Ops, houve um problema tente novamente.", 5)
            return false
        end
    end

    TriggerClientEvent("Notify",source,"sucesso","Você demitiu esse jogador de sua organização.", 5)

    return true
end

function RegisterTunnel.requestBank()
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local user = ORGS.Member[user_id]
    if not user then
        print(([[%s Tentou Injetar o Tunnel requestBank]]):format(user_id))
        return
    end

    local query = vRP.query("bm_module/orgs/GetOrgsBanksInfos", { org = user.groupType  })
    if #query == 0 then print("Ops, houve um problema ao consultar no banco de dados.") return end

    return { 
        BankValue = query[1].bank and (query[1].bank or 0),
        Historic = query[1].bank_transactions and (json.decode(query[1].bank_transactions) or {}),
    }
end

function RegisterTunnel.executeBank(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end
    
    local identity = vRP.getUserIdentity(user_id)
    if not identity then return end

    local user = ORGS.Member[user_id]
    if not user then
        print(([[%s Tentou Injetar o Tunnel requestBank]]):format(user_id))
        return
    end

    if user.groupType ~= data.org then
        print(([[%s Tentou Injetar o Tunnel requestBank]]):format(user_id))
        return
    end

    local status,time = func:getCooldown(user.groupType, "Bank:Cooldown")
    if not status then return end
    func:setCooldown(user.groupType, "Bank:Cooldown", 3)

    local query = vRP.query("bm_module/orgs/GetOrgsBanksInfos", { org = user.groupType  })
    if #query == 0 then print("Ops, houve um problema ao consultar no banco de dados.") return end

    local ACTION = data.action
    local VALUE = (data.value <= 0) and 1 or parseInt(data.value)

    if ACTION == 'deposit' then
        local hasLeader = orgsConfig.List[user.groupType] and (orgsConfig.List[user.groupType].groups[user.group].leader or false)
        if not hasLeader then
            local Permission = ORGS.Permissions[user.groupType] and (ORGS.Permissions[user.groupType][user.group].deposit or false)
            if not Permission then
                print("Retornou")
                TriggerClientEvent("Notify",source,"negado","Você não possui permissao para depositar.", 5)
                return
            end
        end

        local CALC_VALUE = query[1].bank
        if vRP.tryFullPayment(user_id, VALUE) then
            CALC_VALUE = (VALUE + CALC_VALUE)

            vRP.execute('bm_module/orgs/UpdateBankInfo', { org = user.groupType, bank = CALC_VALUE })
            ORGS:AddBankHistoric(user.groupType, query[1].bank_transactions, { user_id = user_id, action = "Deposito", value = VALUE, name = identity.nome.." "..identity.sobrenome })

            TriggerClientEvent("Notify",source,"sucesso","Você Depositou R$ "..vRP.format(VALUE)..". ", 5)
        end

        return { 
            BankValue = CALC_VALUE,
            Historic = ORGS:GetBankHistoric(user.groupType)
        }
    end

    if ACTION == 'withdraw' then
        local hasLeader = orgsConfig.List[user.groupType] and (orgsConfig.List[user.groupType].groups[user.group].leader or false)
        if not hasLeader then
            local Permission = ORGS.Permissions[user.groupType] and (ORGS.Permissions[user.groupType][user.group].withdraw or false)
            if not Permission then
                TriggerClientEvent("Notify",source,"negado","Você não possui permissao para sacar.", 5)
                return
            end
        end

        local CALC_VALUE = query[1].bank

        if (CALC_VALUE >= VALUE) then
            CALC_VALUE = (CALC_VALUE - VALUE)

            vRP.execute('bm_module/orgs/UpdateBankInfo', { org = user.groupType, bank = CALC_VALUE })
            ORGS:AddBankHistoric(user.groupType, query[1].bank_transactions, { user_id = user_id, action = "Saque", value = VALUE, name = identity.nome.." "..identity.sobrenome })
            vRP.giveMoney(user_id, VALUE)

            TriggerClientEvent("Notify",source,"sucesso","Você Sacou R$ "..vRP.format(VALUE)..". ", 5)
        end

        return { 
            BankValue = CALC_VALUE,
            Historic = ORGS:GetBankHistoric(user.groupType)
        }
    end

    return false
end

function RegisterTunnel.registerChat(message)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local user = ORGS.Member[user_id]
    if not user then
        print(([[%s Tentou Injetar o Tunnel registerChat]]):format(user_id))
        return
    end

    local hasLeader = orgsConfig.List[user.groupType] and (orgsConfig.List[user.groupType].groups[user.group].leader or false)
    if not hasLeader then
        local Permission = ORGS.Permissions[user.groupType] and (ORGS.Permissions[user.groupType][user.group].chat or false)
        if not Permission then
            TriggerClientEvent("Notify",source,"negado","Você não possui permissao para usar o chat.", 5)
            return
        end
    end

    local identity = vRP.getUserIdentity(user_id)
    if not identity then return end

    ORGS:AddChatMessage(user.groupType, { author = identity.nome.. " "..identity.sobrenome.. " #"..user_id, message = message }, user_id)

    return ORGS:RequestOrgsMessage(user.groupType)
end

function RegisterTunnel.updateOffice(groupName, permissions)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end
    
    local user = ORGS.Member[user_id]
    if not user then
        print(([[%s Tentou Injetar o Tunnel updateOffice]]):format(user_id))
        return
    end

    local hasLeader = orgsConfig.List[user.groupType] and (orgsConfig.List[user.groupType].groups[user.group].leader or false)
    if not hasLeader then
        TriggerClientEvent("Notify",source,"negado","Você não possui permissao para atualizar a permissão.", 5)
        return
    end

    local status,time = func:getCooldown(user.groupType, "Permission:Cooldown")
    if not status then return end
    func:setCooldown(user.groupType, "Permission:Cooldown", 3)

    ORGS.Permissions[user.groupType][groupName] = permissions

    vRP.execute('bm_module/orgs/updateOrgsPermissions', { org = user.groupType, permissions = json.encode(ORGS.Permissions[user.groupType]) })

    TriggerClientEvent("Notify",source,"sucesso","Você atualizou as permissões. ", 5)
end

function RegisterTunnel.requestConfigDatas(item, date, month)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local user = ORGS.Member[user_id]
    if not user then
        print(([[%s Tentou Injetar o Tunnel requestConfigDatas]]):format(user_id))
        return
    end

    return { 
        goals = ORGS:RequestFarms(user.groupType, item, date, month), 
        player = ORGS:RequestPlayerFarms(user_id, user.groupType, item) 
    }
end

function RegisterTunnel.updateGoals(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local user = ORGS.Member[user_id]
    if not user then
        print(([[%s Tentou Injetar o Tunnel requestConfigDatas]]):format(user_id))
        return
    end

    local org = user.groupType

    local query = vRP.query('bm_module/orgs/getOrgConfig', { org = user.groupType }) 

    if #query == 0 then return end
    local result = json.decode(query[1].config_goals) or {}

    result[data.currentType] = {
        minMonthly = parseInt(data.monthly) < 0 and 30000 or data.monthly,
        minDaily = parseInt(data.daily) < 0 and 1000 or data.daily,
        payment = parseInt(data.payment) < 0 and 50000 or data.payment
    }

    vRP.execute('bm_module/orgs/setOrgConfig', { org = org, config_goals = json.encode(result)  })

    return {
        goals = ORGS:RequestFarms(org, data.currentType), 
        player = ORGS:RequestPlayerFarms(user_id, user.groupType, data.currentType) 
    }
end

function RegisterTunnel.reward(data)
    local source = source
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    local identity = vRP.getUserIdentity(user_id)
    if not identity then return end

    local user = ORGS.Member[user_id]
    if not user then
        print(([[%s Tentou Injetar o Tunnel reward]]):format(user_id))
        return
    end

    local status,time = func:getCooldown(user.groupType, "reward:check")
    if not status then TriggerClientEvent("Notify",source,"negado","Aguarde para resgatar, alguem acabou de resgatar..", 5) return end
    func:setCooldown(user.groupType, "reward:check", 5)

    local orgConfig = vRP.query('bm_module/orgs/getOrgConfig', { org = user.groupType }) 
    if #orgConfig == 0 then return end

    local result = json.decode(orgConfig[1].config_goals) or {}

    -- CASO NAO ESTEJA CONFIGURADA, DEFININDO VALOR PADRAO.
    if not result[data.currentType] then
        result[data.currentType] = {
            minMonthly = 30000,
            minDaily = 1000,
            payment = 50000,
        }
    end

    local query = vRP.query('bm_module/orgs/getPlayerFarm', { user_id = user_id, org = user.groupType, item = data.currentType, day = os.date('%d') })
    if (query[1].reward == 1) then
        TriggerClientEvent("Notify",source,"negado","Você já resgatou a meta de hoje.", 5)
        return
    end

    local amount = parseInt(query[1].amount) or 0
    if (amount >= parseInt(result[data.currentType].minDaily)) then

        local payment = parseInt(result[data.currentType].payment)
        if payment <= 0 then payment = 1 end

        local bankValue = parseInt(orgConfig[1].bank) or 0
        if bankValue < payment then
            TriggerClientEvent("Notify",source,"negado","O Cofre da sua facção não possui dinheiro para te pagar.", 5)
            return
        end

        local CALC_BANK = (bankValue - payment)
        if CALC_BANK < 0 then CALC_BANK = 0 end

        vRP.execute('bm_module/orgs/UpdateBankInfo', { org = user.groupType, bank = CALC_BANK  })
        vRP.execute('bm_module/orgs/UpdatePlayerFarm', { user_id = user_id, org = user.groupType, item =  data.currentType, day = os.date('%d'), reward = 1 })
        ORGS:AddBankHistoric(user.groupType, orgConfig[1].bank_transactions, { user_id = user_id, action = "Resgatou a Meta Diaria", value = payment, name = identity.nome.." "..identity.sobrenome })

        vRP.giveMoney(user_id, payment, true)
        TriggerClientEvent("Notify",source,"sucesso","Você resgatou a meta de hoje, Valor recebido: "..vRP.format(payment), 5)
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BANKS FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ORGS:AddBankHistoric(org, transactions, new_transaction)
    local TRANSACTIONS = json.decode(transactions) or {}
    
    if (#TRANSACTIONS >= 25) then
        table.remove(TRANSACTIONS, 1)
    end
    TRANSACTIONS[#TRANSACTIONS + 1] = new_transaction

    vRP.execute("bm_module/orgs/UpdateBankTransactions", { org = org, value = json.encode(TRANSACTIONS)  })
end

function ORGS:GetBankHistoric(org)
    local query = vRP.query("bm_module/orgs/GetOrgsBanksInfos", { org = org  })
    if #query == 0 then print("Ops, houve um problema ao consultar no banco de dados.") return end

    return (json.decode(query[1].bank_transactions) or {})
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHAT FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ORGS:AddChatMessage(org, content, author_id)
    if not self.Chat[org] then self.Chat[org] = {} end
    local CHAT = self.Chat[org]

    if #CHAT >= 25 then
        table.remove(CHAT, 1)
    end

    CHAT[#CHAT + 1] = content

    -- SYNCRONIZANDO MENSAGEM COM JOGADORES
    for user_id in pairs(self.MembersList[org]) do
        async(function()
            local plySrc = vRP.getUserSource(user_id)
            if not plySrc or (GetPlayerPed(plySrc) == 0) then return end
            if user_id == author_id then return end

            vTunnel._UpdateMessages(plySrc, CHAT)
        end)
    end
end

function ORGS:RequestOrgsMessage(org)
    return self.Chat[org] or {}
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BLACKLIST
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- function ORGS:addBlackList(id)
--     local source = vRP.getUserSource(id)
--     if source then
--         local blackListed = os.time()+orgsConfig.blackList*24*60*60
--         orgsConfig.langs['isBlackList'](source, os.date("%d/%m/%Y", blackListed))

--         vRP.setUData(id, "Mirt1n:BlackList", blackListed)
--     end
-- end

-- function ORGS:checkBlackList(id)
--     local source = vRP.getUserSource(id)
--     if source then
--         local blacklisted = parseInt(vRP.getUData(id, "Mirt1n:BlackList")) or 0
--         print(blacklisted)
--         if blacklisted > 0 then
--             if os.time() > blacklisted then
--                 print("removendo blacklist")
--                 vRP.setUData(id, "Mirt1n:BlackList", 0)
--                 return false
--             end

--             return true,blacklisted
--         end

--         return false
--     end
-- end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FARMS FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ORGS:RequestPlayerFarms(user_id, org, item) 
    local query = vRP.query('bm_module/orgs/getOrgConfig', { org = org }) 

    if #query == 0 then return end
    local result = json.decode(query[1].config_goals) or {}

    local playerMonthlyFarm,playerDailyFarm,playerRewarded = {}, {}, false
    local player = vRP.query('bm_module/orgs/getAllPlayerFarm', { user_id = user_id, item = item, month = os.date('%m') }) 
    for i = 1, #player do
        local ply = player[i]

        if not playerMonthlyFarm[ply.user_id] then
            playerMonthlyFarm[ply.user_id] = ply.amount
        else
            playerMonthlyFarm[ply.user_id] += ply.amount
        end

        if (ply.day == tonumber(os.date('%d'))) then
            if not playerDailyFarm[ply.user_id] then
                playerDailyFarm[ply.user_id] = ply.amount
            else
                playerDailyFarm[ply.user_id] += ply.amount
            end

            playerRewarded = (ply.reward == 1)
        end
    end

    return {
        playerDailyFarm = playerDailyFarm[user_id] and playerDailyFarm[user_id] or 0,
        playerMonthly = playerMonthlyFarm[user_id] and playerMonthlyFarm[user_id] or 0,
        playerRewarded = playerRewarded or false,
        maxMonthly = result[item] and result[item].minMonthly or 30000,
        maxDaily = result[item] and result[item].minDaily or 1000,
        payment = result[item] and result[item].payment or 50000,
        itemName = vRP.getItemName(item) or item
    }
end

function ORGS:RequestFarms(org, item, date, month)
    if not date then date = os.date('%d') end 
    if not month then month = os.date('%m') end

    local query = vRP.query('bm_module/orgs/getOrgFarmForDate', { org = org, item = item, day = date, month = month }) or {}
    local FormatUsers = {}

    for i = 1, #query do
        local ply = query[i]
        local ply_identity = vRP.getUserIdentity(ply.user_id)
        if not ply_identity then goto next_player end

        FormatUsers[#FormatUsers + 1] = {
            user_id = ply.user_id,
            name = ply_identity.nome.. " ".. ply_identity.sobrenome,
            rank = self.Member[ply.user_id] and  orgsConfig.List[self.Member[ply.user_id].groupType].groups[self.Member[ply.user_id].group].prefix or "Indefinido",
            item = vRP.getItemName(ply.item) or ply.item,
            amount = ply.amount,
            reward = (ply.reward == 1)
        }

        :: next_player ::
    end
    
    return FormatUsers or {}
end

function ORGS:AddPlayerFarm(user_id, item, amount)
    local org = self.Member[user_id]
    if not org then print(('user %s not found export AddPlayerFarm'):format(user_id)) return end

    vRP.execute('bm_module/orgs/addPlayerFarm', { org = org.groupType, user_id = user_id, item = item, amount = amount, day = os.date('%d'), month = os.date('%m') })
end

exports('AddPlayerFarm', function(...)
    ORGS:AddPlayerFarm(...)
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- COMMANDS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('org', function(source,args)
    local user_id = vRP.getUserId(source)
    if not user_id then return end
    
    local status,time = func:getCooldown(user_id, "BM:ORGS")
    if not status then return end
    func:setCooldown(user_id, "BM:ORGS", 3)

    local user = ORGS.Member[user_id]
    if not user then TriggerClientEvent("Notify",source,"negado","Você não faz parte de nenhuma organização!", 5) return end

    vTunnel._OpenOrg(source, user.groupType)
end)

RegisterCommand('orgadm', function(source,args)
    local user_id = vRP.getUserId(source)
    if not user_id then return end
     
    if not vRP.hasPermission(user_id, "admin.permissao") then return end

    local orgName = args[1]
    if not orgName or orgName == "" then
        return
    end
    
    if not orgsConfig.List[orgName] then
        return
    end

    local bestTier = 0
    local bestGroup = ""
    for group,v in pairs(orgsConfig.List[orgName].groups) do
        local tier = v.tier
        if tier > bestTier then
            bestTier = tier
            bestGroup = group
        end
    end

    vRP.addUserGroup(user_id, bestGroup)
    vTunnel._OpenOrg(source)
end)

RegisterCommand('clearorg', function(source,args)
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    if vRP.hasPermission(user_id, "diretor.permissao") or vRP.hasPermission(user_id, "perm.respilegal") then 

        local FormatNames = ""
        for index in pairs(orgsConfig.List) do
            FormatNames = FormatNames.. ("%s,"):format(index)
        end

        local OrgName = vRP.prompt(source, 'Digite a Org que deseja limpar? ', FormatNames)
        if not OrgName or OrgName == "" or not orgsConfig.List[OrgName] then
            return
        end

        local request = vRP.request(source, "Tem certeza que deseja limpar todos membros da facção: "..OrgName.." ?", 30)
        if not request then
            return
        end
        
        local Members = ORGS.MembersList[OrgName]
        
        print("Limpando armazem: "..OrgName)
        vRP.setSData('armazem:'..OrgName, json.encode({}))

        -- Limpando orgChest
        local allKeys = vRP.getSDataKeys() -- supondo que esta função retorna todas as chaves
        for _, key in ipairs(allKeys) do
            if string.find(key, OrgName) then
                print(key, json.encode(key))
                vRP.setSData(key, json.encode({}))
            end
        end

        for ply_id, _ in pairs(Members) do
            local source = vRP.getUserSource(ply_id)
            if source then
                vRP.removeUserGroup(ply_id, ORGS.Member[ply_id].group) -- Caso der problema ( filtrar pelo getUserGroupByType )
            else
                local datatable = json.decode(vRP.getUData(ply_id, "vRP:datatable")) or {}
                datatable.groups[ORGS.Member[ply_id].group] = nil

                local rows = exports["oxmysql"]:executeSync('UPDATE vrp_user_data SET dvalue = ? WHERE user_id = ? and dkey = "vRP:datatable"', { json.encode(datatable), ply_id })
                if rows.affectedRows > 0 then
                    ORGS:RemUserGroup(ply_id)
                else
                    TriggerClientEvent("Notify",source,"negado","Ops, houve um problema tente novamente.", 5)
                    return false
                end
            end
        end
    end
end)

function MembersLength(t)
	local count = 0
	for index in pairs(t) do
		count = count + 1
	end

	return count
end

RegisterCommand('setados', function(source,args)
    local user_id = vRP.getUserId(source)
    if not user_id then return end

    if vRP.hasPermission(user_id, "developer.permissao") then 
        local memberCount = {}

        for OrgName in pairs(orgsConfig.List) do
            local Members = ORGS.MembersList[OrgName]
            local totalMembers = 0
            
            for ply_id, _ in pairs(Members) do
                totalMembers = totalMembers + 1
            end
            memberCount[OrgName] = totalMembers
        end

        vRP.sendLog("https://discord.com/api/webhooks/1129869604899008543/gTla-z5ltMYYKUSGZko3fUmO8tTsC9-50SkFMN9wOo1w8qHu7zsB2oJLQ52519JXuFYY", "```prolog\n"..json.encode(memberCount, { indent = true }).."\n```")
    end
end)



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- RECIVE HANDLERS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler('vRP:playerJoinGroup', function(user_id,group)
    if ORGS.List[group] then
        ORGS:AddUserGroup(user_id, {
            group = group,
            groupType = ORGS.List[group]
        })
    end
end)

AddEventHandler('vRP:playerLeaveGroup', function(user_id,group)
    if ORGS.List[group] then
        ORGS:RemUserGroup(user_id)
    end
end)

AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
	if user_id then
		ORGS.LastLogins[user_id] = os.date("%d/%m/%Y")
	end
end)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CACHE FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function ORGS:FormatConfig()
    local setOrg = {}
    for orgName in pairs(orgsConfig.List) do
        if (orgsConfig.List[orgName]) then 
            print(orgName, 'oainwdioawnd')
            if ( orgsConfig.List[orgName].groups) then 


                for Group in pairs(orgsConfig.List[orgName].groups) do
                    self.List[Group] = orgName
        
                    if (orgsConfig.main.createAutomatic) then
                        if not setOrg[orgName] then
                            setOrg[orgName] = true
                            exports["oxmysql"]:execute([[INSERT IGNORE INTO bm_orgs(org) VALUES(?)]], { orgName })
                        end
                    end
                    
                    if not self.Permissions[orgName] then self.Permissions[orgName] = {} end
        
                    if not orgsConfig.List[orgName].groups[Group].leader then
                        if not self.Permissions[orgName][Group] then self.Permissions[orgName][Group] = {} end
        
                        for permission in pairs(orgsConfig.Permissions) do
                            self.Permissions[orgName][Group][permission] = false
                        end 
                    end
        
                end
                print(orgName, 'formatting config')    
            else
                print('problema na config da ORG: ', orgName)    
            end
        end
        
    end 

    self:GenerateCache()
    self:VerifyPlayers()
end

function ORGS:GenerateCache()
    local time = os.time()
    print('^1[BM_MODULE] ^0Iniciando Cache dos jogadores.')

    local query = vRP.query('bm_module/orgs/GetDataTable')
    local FormatUser = {}
    for i = 1, #query do
        local ply = query[i]
        local plyData = json.decode(ply.dvalue) or {}

        FormatUser[ply.user_id] = (plyData.groups or {})
    end

    for user_id, groups in pairs(FormatUser) do
        for groupName in pairs(groups) do
            if self.List[groupName] then
                self:AddUserGroup(user_id, {
                    group = groupName,
                    groupType = self.List[groupName]
                })
            end
        end
    end

    local query = vRP.query('bm_module/orgs/GetLastLogins')
    for i = 1, #query do
        local ply = query[i]
        self.LastLogins[ply.id] = (ply.ultimo_login and ply.ultimo_login or os.date("%d/%m/%Y") )
    end

    self:GenerateCachePermissions()

    print(('^1[BM_MODULE] ^0Cache dos jogadores gerados com sucesso tempo %s segundo(s).'):format(os.time() - time))

    FormatUser = {} -- Limpando Variavel para Poupar Memoria
end

function ORGS:GenerateCachePermissions()
    local query = vRP.query('bm_module/orgs/GetOrgsPermissions', {})
    for i = 1, #query do
        local v = query[i]
        if not v then goto next_org end

        local permissions = v.permissions ~= "{}" and json.decode(v.permissions) or false
        if not permissions then goto next_org end

        self.Permissions[v.org] = json.decode(v.permissions) or {}

        :: next_org ::
    end
end

function ORGS:VerifyPlayers()
    local users = vRP.getUsers()
    for user_id,source in pairs(users) do
        local plyGroups = vRP.getUserGroups(user_id)
        for group in pairs(plyGroups) do

            if ORGS.Member[user_id] then -- VERIFICAR SE O JOGADOR ESTIVER ONLINE COM O GRUPO NO BANCO DE DADOS E SEM O GRUPO NO JOGO ( REMOVER DO CACHE ) ( CASO ENSURE )
                if ORGS.List[ORGS.Member[user_id].group] then
                    if not vRP.hasGroup(user_id, ORGS.Member[user_id].group) then
                        ORGS:RemUserGroup(user_id)
                    end
                end
            end
            
            if ORGS.List[group] then
                ORGS:AddUserGroup(user_id, {
                    group = group,
                    groupType = ORGS.List[group]
                })
            end
        end
    end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THREADS
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CreateThread(function()
    ORGS:FormatConfig()
end)