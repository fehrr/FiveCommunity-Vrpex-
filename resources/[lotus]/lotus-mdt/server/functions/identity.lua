bridge.identity = function()
    local src = source
    local user_id = vRP.getUserId(src)

    if (not user_id) then
        return
    end

    local user = User:get(user_id)

    if (not isAdmin(user_id) and not user) then
        return
    end

    local user_id = tonumber(data.data.value)
    local identity = vRP.getUserIdentity(user_id)
    if (not identity) then
        return 'Individuo inexistente'
    end
    local fullname = identity.nome .. ' ' .. identity.sobrenome
    local registro = identity.registro
    local dob = identity.data_nascimento
    local telefone = identity.telefone
    local relacionamento = nil
    local retval = json.decode(identity.relacionamento)
    if (#retval == 0) then
        relacionamento = 'Solteiro(a)'
    else
        relacionamento = data.relacionamento['tipo']
    end
    return 'Nome: ' ..
        fullname ..
            '<br>Registro: ' ..
                registro ..
                    '<br>Data de nascimento: ' ..
                        dob .. '<br>Telefone: ' .. telefone .. '<br>Estado civil: ' .. relacionamento
end
