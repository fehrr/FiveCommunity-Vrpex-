CreateTunnel.getPrimaryName = function()
    local source = source
    local user_id = vRP.getUserId(source)

    if (not user_id) then
        return
    end

    local Identity = vRP.getUserIdentity(user_id)
    if (not Identity) then
        return
    end

    Infos = {
        name = Identity["nome"]
    }

    return Infos
end