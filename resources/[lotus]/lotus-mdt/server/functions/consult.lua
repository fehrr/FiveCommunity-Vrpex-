bridge.consult = function(data) 
    local src = source
    local user_id = vRP.getUserId(src)

    if (not user_id) then
        return
    end

    local user = User:get(user_id)

    if (not isAdmin(user_id) and not user) then
        return
    end

    if (data.type == 'vehicles') then
        local plate  = data.value
        local multas = vRP.getMultas(plate)

        if (multas == 0) then
            return 'Nenhuma multa pendente'
        end

        return ('%s R$ em multas pendentes'):format(multas)
    end
    if (data.type == 'identity') then
        local user_id  = tonumber(data.value)
        local identity = vRP.getUserIdentity(user_id)

        if (not identity) then
            return 'Individuo indigente'
        end

        local fullname       = ('%s %s'):format(identity.nome, identity.sobrenome)
        local registro       = identity.registro
        local dob            = identity.data_nascimento
        local telefone       = identity.telefone
        local relacionamento = nil
        local retval         = json.decode(identity.relacionamento)

        if (#retval == 0) then
            relacionamento = 'Solteiro(a)'
        else
            relacionamento = data.relacionamento['tipo']
        end

        return ('Nome: %s<br>Registro: %s<br>Data de nascimento: %s<br>Telefone: %s<br>Estado civil: %s'):format(fullname, registro, dob, telefone, relacionamento)
    end
    if (data.type == 'prisons') then
        local user_id  = tonumber(data.value)
        local identity = vRP.getUserIdentity(user_id)
		local infos    = vRP.query("vRP/get_user_identity",{ user_id = user_id })
        if (not infos[1]) then 
            return {}
        end
		local criminal = json.decode(infos[1].criminal)
        local prisoes = 0
        
        return criminal or {}
    end
end