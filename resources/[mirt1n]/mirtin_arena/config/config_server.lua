local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")

src = {}
Tunnel.bindInterface("mirtin_arena",src)
Proxy.addInterface("mirtin_arena",src)

vCLIENT = Tunnel.getInterface("mirtin_arena")
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local old_weapons = {}
local old_health = {}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CONFIGS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config = {}

config.weebhook = {
    link = "",
    logo = "https://i.imgur.com/Ta9YOaY.png",
    color = 6356736
}

config.license = "new" -- não mexa aqui ( isso server para updates exclusivos )
config.voip = "pma-voice2" -- ou tokovoip [ Para o VO-IP Funcionar no sistema de dimensoes ]
config.maxHealth = 300 -- Maximo de vida em seu servidor
config.rhealth = true -- Recuperar Vida quando matar alguem
config.aKillstreak = false -- Ativar sistema de killstreak
config.forceClearWeapons = true -- Ativar essa função caso acontece qualquer tentativa de bugar armas ( deslogar / crashar ) limpar todas as armas do jogador ( Não que vai acontecer, mas isso é uma forma pra previnir tambem. )
config.cmdarena = "pvpoff" -- Comando de sair da arena
config.cmdkickarena = "arenakick" -- Comando para kickar todos os jogadores de todas as arenas
config.permKick = "admin.permissao" -- Permissao para kickar os jogadores da arena
config.chatkill = true -- Ligar/Desligar chatkill da arena
config.chatKillDelay = 3000 -- Delay para sumir as mensagem do chatkill

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ARENAS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.arenas = {
    [1] = { 
        nome = "ARENA SNIPER", -- Nome da Arena 
        descricacao = "<b>Arma:</b> SNIPER <br> <b>Tempo:</b> 20 Minutos<br> <b>Vagas:</b> 15 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_HEAVYSNIPER_MK2", -- Arma da Arena
        imagem = "https://cdn.discordapp.com/attachments/1126326342623957204/1156493578948853760/image.png", -- Imagem da Arena
        maxPlayers = 15, -- Maximo de Jogadores na Arena 10X10
        timeArena = 20, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA            
            [1] = vector3(-3277.78,-2526.52,18.33),
            [2] = vector3(-3282.29,-2535.5,18.33),
            [3] = vector3(-3272.94,-2518.18,18.33),
            [4] = vector3(-3275.59,-2533.04,22.06),
            [5] = vector3(-3276.25,-2519.01,22.06),
            [6] = vector3(-3275.55,-2533.19,25.78),
            [7] = vector3(-3254.14,-2511.16,12.52),
            [8] = vector3(-3240.17,-2507.26,12.27),
            [9] = vector3(-3223.43,-2450.34,6.4),
            [10] = vector3( -3237.81,-2444.92,6.44),
            [11] = vector3(-3273.32,-2448.44,6.39),
            [12] = vector3(-3301.59,-2477.88,6.35),
            [13] = vector3(-3215.11,-2540.63,16.06),
            [14] = vector3(-3210.34,-2552.83,12.33),
            [15] = vector3(-3213.3,-2529.79,12.33),
            [16] = vector3(-3207.08,-2552.51,16.06),
            [17] = vector3(-3268.14,-2622.83,14.9),
            [18] = vector3(-3286.11,-2569.39,12.23),
            [19] = vector3(-3309.75,-2552.63,18.21),
            [20] = vector3(-3209.26,-2570.67,12.22),
            [21] = vector3(-3217.41,-2570.69,12.25),
            [22] = vector3(-3270.83,-2448.0,6.39),
            [23] = vector3(-3387.3,-2511.23,6.35),
        }
    },
    [2] = { 
        nome = "ARENA PREDIO", -- Nome da Arena 
        descricacao = "<b>Arma:</b> FIVE SEVEN <br> <b>Tempo:</b> 20 Minutos<br> <b>Vagas:</b> 4 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_PISTOL_MK2", -- Arma da Arena
        imagem = "https://cdn.discordapp.com/attachments/1138551826036314213/1163907300302520370/logo-altarj.png", -- Imagem da Arena
        maxPlayers = 4, -- Maximo de Jogadores na Arena 10X10
        timeArena = 15, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA            
            [1] = vector3(81.82,-864.92,134.76),
            [2] = vector3(102.61,-860.84,134.76),
            [3] = vector3(121.52,-879.21,134.76),
            [4] = vector3(99.39,-881.24,134.76),
        }
    },
    [3] = { 
        nome = "DUST 2", -- Nome da Arena 
        descricacao = "<b>Arma:</b> FUZIL <br> <b>Tempo:</b> 15 Minutos<br> <b>Vagas:</b> 20 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_SPECIALCARBINE_MK2", -- Arma da Arena
        imagem = "https://media.discordapp.net/attachments/1126326342623957204/1147261615968895038/image.png", -- Imagem da Arena
        maxPlayers = 20, -- Maximo de Jogadores na Arena 10X10
        timeArena = 15, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA            
            [1] = vector3(-4488.32,2754.49,412.33),
            [2] = vector3(-4494.42,2780.22,409.05),
            [3] = vector3(-4493.4,2805.24,410.04),
            [4] = vector3(-4495.75,2846.37,409.59),
            [5] = vector3(-4466.03,2836.79,407.13),
            [6] = vector3(-4437.73,2840.34,405.93),
            [7] = vector3(-4416.38,2833.57,408.86),
            [8] = vector3(-4408.37,2854.88,412.21),
            [9] = vector3(-4436.51,2843.03,411.67),
            [10] = vector3(-4408.31,2787.59,405.51),
            [11] = vector3(-4426.98,2802.84,409.16),
            [12] = vector3(-4433.12,2775.9,409.16),
            [13] = vector3(-4443.41,2754.66,409.1),
            [14] = vector3(-4456.6,2769.59,409.16),

            [15] = vector3(-4497.82,2791.81,410.16),
            [16] = vector3(-4434.15,2825.56,411.67),
            [17] = vector3(-4471.09,2814.04,406.25),
            [18] = vector3(-4460.32,2788.67,409.27),
            [19] = vector3(-4427.68,2788.24,408.84),
            [20] = vector3(-4397.35,2800.29,408.91),
            [21] = vector3(-4417.33,2786.43,409.23),
            [22] = vector3(-4428.72,2806.59,409.16),
        }
    },
    [4] = { 
        nome = "Arena TRAINING", -- Nome da Arena 
        descricacao = "<b>Arma:</b> Pistola MK2 <br> <b>Tempo:</b> 10 Minutos<br> <b>Vagas:</b> 20 Vagas<br> <b>Aposta Minima:</b> R$ 5000 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_PISTOL_MK2", -- Arma da Arena
        imagem = "https://media.discordapp.net/attachments/1126326342623957204/1137124897064243252/image.png?width=1129&height=671", -- Imagem da Arena
        maxPlayers = 20, -- Maximo de Jogadores na Arena
        timeArena = 15, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vec3(-3320.43,-2986.91,294.33),
            [2] = vec3(-3336.69,-2966.71,294.33),
            [3] = vec3( -3349.3,-2972.14,294.33),
            [4] = vec3(-3358.37,-2985.57,294.33),
            [5] = vec3(-3366.22,-2996.54,294.33),
            [6] = vec3(-3365.84,-2976.29,294.33),
            [7] = vec3(-3350.22,-2997.78,294.33),
            [8] = vec3(-3357.05,-3007.04,294.33),
            [9] = vec3(-3375.23,-3005.74,294.33),
            [10] = vec3(-3381.44,-3002.61,294.33),
            [11] = vec3(-3380.98,-2970.92,294.33),
            [12] = vec3(-3400.18,-2987.47,294.33),
            [13] = vec3(-3401.53,-2958.1,294.33),
        }
    },
    [5] = {
        nome = "Arena 5X5", -- Nome da Arena 
        descricacao = "<b>Arma:</b> PISTOL <br> <b>Tempo:</b> 15 Minutos<br> <b>Vagas:</b> 20 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_PISTOL_MK2", -- Arma da Arena
        imagem = "https://media.discordapp.net/attachments/1126326342623957204/1147359798283735081/image.png?width=1354&height=675", -- Imagem da Arena
        maxPlayers = 10, -- Maximo de Jogadores na Arena 10X10
        timeArena = 15, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vec3(723.02,-3547.41,139.82),
            [2] = vec3(705.08,-3547.54,139.82),
            [3] = vec3(693.17,-3534.67,139.82),
            [4] = vec3(700.49,-3515.41,139.82),
            [5] = vec3(724.75,-3505.14,139.82),
            [6] = vec3(738.64,-3494.46,139.82),
            [7] = vec3(723.37,-3485.12,139.82),
            [8] = vec3(728.31,-3464.04,139.82),
            [9] = vec3(756.35,-3462.17,139.82),
            [10] = vec3(689.31,-3462.75,139.82),

        }
    },
    [6] = { 
        nome = "Arena 2x2", -- Nome da Arena 
        descricacao = "<b>Arma:</b> PISTOL <br> <b>Tempo:</b> 10 Minutos<br> <b>Vagas:</b> 20 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_PISTOL_MK2", -- Arma da Arena
        imagem = "https://media.discordapp.net/attachments/1126326342623957204/1147360372219723917/image.png?width=1197&height=675", -- Imagem da Arena
        maxPlayers = 4, -- Maximo de Jogadores na Arena 10X10
        timeArena = 10, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vec3(624.9,-3733.92,140.44),
            [2] = vec3(606.56,-3742.98,140.44),
            [3] = vec3(595.52,-3724.53,140.44),
            [4] = vec3(610.5,-3714.29,140.44),
            [5] = vec3(641.77,-3710.61,140.44),
            [6] = vec3(630.6,-3689.4,140.44),
            [7] = vec3(617.46,-3684.55,140.44),
            [8] = vec3(583.15,-3703.5,140.44),
        }
    },
    [7] = {
        nome = "Arena 1x1", -- Nome da Arena 
        descricacao = "<b>Arma:</b> PISTOL <br> <b>Tempo:</b> 5 Minutos<br> <b>Vagas:</b> 20 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_PISTOL_MK2", -- Arma da Arena
        imagem = "https://media.discordapp.net/attachments/1126326342623957204/1147359056932130896/image.png?width=1067&height=674", -- Imagem da Arena
        maxPlayers = 2, -- Maximo de Jogadores na Arena 10X10
        timeArena = 5, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vec3(814.41,-3704.96,139.65),
            [2] = vec3(866.23,-3734.62,139.65),
            [3] = vec3(831.09,-3740.53,139.65),
            [4] = vec3(847.22,-3701.96,139.65),
            [5] = vec3(856.86,-3755.7,139.65),
            [6] = vec3(880.5,-3713.82,139.65),
        }
    },
    [8] = {
        nome = "CLOCK TOWER", -- Nome da Arena 
        descricacao = "<b>Arma:</b> ASSAULTRIFLE MK2 <br> <b>Tempo:</b> 20 Minutos<br> <b>Vagas:</b> 20 Vagas<br> <b>Aposta Minima:</b> R$ 5000,00 <br><b>Para Sair:</b> /pvpoff", -- Descricao da NUI
        arma = "WEAPON_ASSAULTRIFLE_MK2", -- Arma da Arena
        imagem = "https://cdn.discordapp.com/attachments/1126326342623957204/1148672548175872161/image.png", -- Imagem da Arena
        maxPlayers = 20, -- Maximo de Jogadores na Arena 10X10
        timeArena = 20, -- Tempo da Arena (em minutos)
        minAposta = 5000, -- Valor minimo da Aposta
        coords = { -- CORDENADAS DE SPAWNS NA ARENA
            [1] = vec3(-3277.78,-2526.52,18.33),
            [2] = vec3(-3282.29,-2535.5,18.33),
            [3] = vec3(-3272.94,-2518.18,18.33),
            [4] = vec3(-3275.59,-2533.04,22.06),
            [5] = vec3(-3276.25,-2519.01,22.06),
            [6] = vec3(-3275.55,-2533.19,25.78),
            [7] = vec3(-3254.14,-2511.16,12.52),
            [8] = vec3(-3240.17,-2507.26,12.27),
            [9] = vec3(-3223.43,-2450.34,6.4),
            [10] = vec3(-3237.81,-2444.92,6.44),
            [11] = vec3(-3273.32,-2448.44,6.39),
            [12] = vec3(-3301.59,-2477.88,6.35),
            [13] = vec3(-3215.11,-2540.63,16.06),
            [14] = vec3(-3210.34,-2552.83,12.33),
            [15] = vec3(-3213.3,-2529.79,12.33),
            [16] = vec3(-3207.08,-2552.51,16.06),
            [17] = vec3(-3268.14,-2622.83,14.9),
            [18] = vec3(-3286.11,-2569.39,12.23),
            [19] = vec3(-3309.75,-2552.63,18.21),
            [20] = vec3(-3209.26,-2570.67,12.22),
            [21] = vec3(-3217.41,-2570.69,12.25),
            [22] = vec3(-3270.83,-2448.0,6.39),
            [23] = vec3(-3387.3,-2511.23,6.35),
        }
    },
}


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TRADUCOES
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.lang = {
    arenaFinalizada = function(id) return TriggerClientEvent('chatMessage', -1, "^1[ARENA] ^0 Arena ^2"..id.."^0 acaba de ser finalizada.") end, -- Quando a Arena for finalizada
    arenaCancelada = function(id) return TriggerClientEvent('chatMessage', -1, "^1[ARENA] ^0 Arena ^2"..id.."^0 acaba de ser cancelada por falta de jogadores.") end, -- Quando a Arena for finalizada
    arenaLotada = function(source) return TriggerClientEvent("Notify",source,"negado","Está arena está lotada.", 3) end, -- Quando a Arena estiver Lotada
    kickAllArena = function(source) return TriggerClientEvent("Notify",source,"sucesso","Você kickou todos os jogadores da arena", 3) end, -- Kickar todos jogadores da arena
}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE APOSTAS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.apostarArena = function(source, user_id, id)
    local minAposta = parseInt(config.arenas[parseInt(id)].minAposta)
    local aposta = vRP.prompt(source, "Digite a sua Aposta: ", minAposta)
    if aposta ~= nil and aposta ~= "" and tonumber(aposta) then
        if tonumber(aposta) < minAposta then
            TriggerClientEvent("Notify",source,"sucesso","O Valor minimo de aposta é <b>"..vRP.format(minAposta).."</b>", 3)
            return
        end

        if vRP.tryFullPayment(user_id, tonumber(aposta)) then
            entrarArena(source, user_id, id, tonumber(aposta))
        else
            TriggerClientEvent("Notify",source,"negado","Você não possui essa quantia para apostar.", 3)
        end
    end
end

config.pagamentoApostas = function(user_id, kills, arena, cofre)
    local pagamento = cofre * 0.8 -- 80% Do valor do cofre da arena de apostas
    local identity = vRP.getUserIdentity(user_id)

    TriggerClientEvent('chatMessage', -1, "^1[ARENA] ^0O Cidadão ^2"..identity.nome.." "..identity.sobrenome.."^0 venceu a arena ^2 "..arena.."^0 com ^2"..kills.." kill(s)^0.")
    vRP.giveMoney(user_id, pagamento)

    corpoHook = { { ["color"] = config.weebhook['color'], ["title"] = "**".. "Vencedor ( ".. arena .." )" .."**\n", ["thumbnail"] = { ["url"] = config.weebhook['logo'] }, ["description"] = "**ID:** ```css\n- "..user_id.." ```\n**KILLS** ```css\n- ".. kills .."```\n**RECEBEU** ```css\n- ".. vRP.format(pagamento) .."```\n**HORARIO** ```css\n- ".. os.date("%d/%m/%Y") .." ```", ["footer"] = { ["text"] = "Mirt1n Store", }, } }
    sendToDiscord(config.weebhook['link'], corpoHook)
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SISTEMA DE KILL STREAK
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.killStreak = function(source, user_id, kills, arena)
    if kills > 3 then
        local pagamento = 50 + (5 * kills)
        TriggerClientEvent('chatMessage', source, "^1[ARENA] ^0 ** KILL STREAK ** Você matou ^2"..kills.."^0 sem morrer e recebeu ^2"..pagamento.."^0 por isso.")
        -- vRP.giveInventoryItem(user_id, "money", pagamento, true)

        corpoHook = { { ["color"] = config.weebhook['color'], ["title"] = "**".. "Kill Streak ( ".. arena .." )" .."**\n", ["thumbnail"] = { ["url"] = config.weebhook['logo'] }, ["description"] = "**ID:** ```css\n- "..user_id.." ```\n**KILLS** ```css\n- ".. kills .."```\n**RECEBEU** ```css\n- ".. vRP.format(pagamento) .."```\n**HORARIO** ```css\n- ".. os.date("%d/%m/%Y") .." ```", ["footer"] = { ["text"] = "Mirt1n Store", }, } }
        sendToDiscord(config.weebhook['link'], corpoHook)
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ENTRAR ARENA
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.joinArena = function(user_id, id)
    local source = vRP.getUserSource(user_id)

    if source then
        old_weapons[user_id] = vRPclient.getWeapons(source)
        old_health[user_id] = vRPclient.getHealth(source)

        local weapon = config.arenas[parseInt(id)].arma
        vRPclient._setHealth(source, config.maxHealth)
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- SAIR DA ARENA
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.leaveArena = function(user_id)
    local source = vRP.getUserSource(user_id)

    if source then
        if old_weapons[user_id] ~= nil then
            vRPclient._giveWeapons(source, old_weapons[user_id], true)
            old_weapons[user_id] = nil
        end

        if old_health[user_id] ~= nil then
            vRPclient._setHealth(source, old_health[user_id])
            old_health[user_id] = nil
        end
    end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- IDENTIDADE
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
config.identity = function(user_id)
    local identity = vRP.getUserIdentity(user_id)

    if identity then
        identity.nome = identity.nome
        identity.sobrenome = identity.sobrenome

        return identity
    end
end

--[[ COLOQUE ISSO NAS FUNCOES SERVER
    local arena = Tunnel.getInterface("mirtin_arena")

    if arena.inArena(source) then
		return
    end


    function vRP.limparArmas(user_id) -- COLOCAR ISSO DENTRO DE QUALQUER VRP>MODULES [ CASO SUA FUNÇÃO forceClearWeapons for ativada ]
        local data = vRP.getUserDataTable(user_id)
        if user_id then
            if data then
                data.weapons = {}
            end
        end
    end
]]