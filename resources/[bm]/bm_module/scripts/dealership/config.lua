dealershipConfig = {}

dealershipConfig.main = {
    dir = "http://45.40.99.21:4020/lotus/carros/", -- Diretorio das imagens dos veiculos
    
    showVehicleOutStock = true, -- Mostrar na concessionaria veiculo sem estoque
    
    commandConce = 'conce',

    cooldownTestDriver = 120, -- TEMPO DO TEST DRIVER EM SEGUNDOS
    maxDistanceTestDriver = 1500.0, -- MAXIMO DE DISTANCIA QUE O JOGADOR PODE SE AFASTAR DA ZONA DO TEST-DRIVE

    sellVehicle = 99, -- PORCENTAGEM QUE VAI RECEBER DA CONCESSIONARIA APOS VENDER VEICULO
    maxCars = 5, -- Total de maximo de carros

    zoneVips = { -- DESCONTOS E MAXIMO DE CARROS NA GARAGEM
        { permission = "perm.vagas11", discount = 0, maxCars = 11 },
        { permission = "perm.vagas12", discount = 0, maxCars = 12 },
        { permission = "perm.vagas15", discount = 0, maxCars = 15 },
        { permission = "perm.vagas32", discount = 0, maxCars = 32 },
        { permission = "perm.vagas30", discount = 0, maxCars = 30 },
        { permission = "perm.vagas19", discount = 0, maxCars = 19 },
        { permission = "perm.vagas36", discount = 0, maxCars = 36 },
        
        { permission = "perm.vagastres", discount = 0, maxCars = 3 },
        { permission = "perm.inicial", discount = 5, maxCars = 5 },
        { permission = "perm.vipcopa", discount = 5, maxCars = 5 },
        
    
        { permission = "perm.bronze", discount = 5, maxCars = 3 },
        { permission = "perm.prata", discount = 5, maxCars = 5 },
        { permission = "perm.ouro", discount = 9, maxCars = 8 },
        { permission = "perm.platina", discount = 9 , maxCars = 8 },
        { permission = "perm.diamante", discount = 13 , maxCars = 15 },
        { permission = "perm.esmeralda", discount = 13 , maxCars = 15 }, 
        { permission = "perm.safira", discount = 25 , maxCars = 25 },
        { permission = "perm.rubi", discount = 30 , maxCars = 30 },
        { permission = "perm.vipsaojoao", discount = 35 , maxCars = 25 },
        { permission = "perm.vipsetembro", discount = 35 , maxCars = 25 },
        { permission = "perm.altarj", discount = 40 , maxCars = 30 },
        { permission = "perm.supremorj", discount = 50 , maxCars = 35 },
        { permission = "perm.vipcrianca", discount = 50 , maxCars = 25 },
        { permission = "perm.viphalloween", discount = 50 , maxCars = 50 },
    }
}

dealershipConfig.locations = {
    -- {
    --     coords = vec3(-1607.19,-976.74,13.13),
    --     test_drive = vector4(1695.92,3247.27,40.56,104.18),
    -- },
    {
        coords = vec3(-41.32,-1096.77,26.42),
        test_drive = vector4(1695.92,3247.27,40.56,104.18),
    },
}