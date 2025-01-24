ConfigMainRoutes = {}

ConfigMainRoutes.images = {
	url = "http://45.40.99.21:4020/lotus/inventario_cda/",
	format = ".png"
}

ConfigMainRoutes.distAlt = 10 --Distancia  minima de alternancia entre uma rota e outra
ConfigMainRoutes.timeAlt = 10 --Tempo minimo de alternancia entre uma rota e outra ( Segundos )
ConfigMainRoutes.freezeTime = 2 --Tempo de freeze ( Segundos )

ConfigMainRoutes.textBlip = {
	text = "Pressione ~g~E~w~ para acessar as rotas.",
	textCollect = "Pressione ~g~E~w~ para coletar.",
}

ConfigMainRoutes.mainBlips = {
	--[ MUNICAO ]--

	{ coords = vec3(1357.8,-781.58,67.48), typeRoute = "Municao", typeReward = "Municao", permissions = {"perm.tcp"} },
	{ coords = vec3(-886.25,-1464.59,7.57), typeRoute = "Municao", typeReward = "Municao", permissions = {"perm.yakuza"} },
	{ coords = vec3(-1468.19,-47.93,54.64), typeRoute = "Municao", typeReward = "Municao", permissions = {"perm.espanha"} },
	{ coords = vec3(1399.46,-2539.74,55.23), typeRoute = "Municao", typeReward = "Municao", permissions = {"perm.escocia"} },
	{ coords = vec3(720.45,-284.63,61.55), typeRoute = "Municao", typeReward = "Municao", permissions = {"perm.mexico"} },
	{ coords = vec3(1232.58,-1069.74,46.84), typeRoute = "Municao", typeReward = "Municao", permissions = {"perm.ada"} },
	{ coords = vec3(-3197.93,837.71,8.93), typeRoute = "Municao", typeReward = "Municao", permissions = {"perm.okayda"} },
	{ coords = vec3(-52.6,832.88,235.71), typeRoute = "Municao", typeReward = "Municao", permissions = {"perm.cartel"} },
	{ coords = vec3(-170.3,295.01,93.75), typeRoute = "Municao", typeReward = "Municao", permissions = {"perm.korea"} },
	{ coords = vec3(-802.6,168.84,72.82), typeRoute = "Municao", typeReward = "Municao", permissions = {"perm.colombia"} },
	{ coords = vec3(-1041.69,301.23,66.99), typeRoute = "Municao", typeReward = "Municao", permissions = {"perm.turquia"} },
	

	--[ DESMANCHE ]--

	{ coords = vec3(-1192.86,-1728.64,11.9), typeRoute = "ItensIlegal", typeReward = "Desmanche", permissions = {"perm.cdd"} },
	{ coords = vec3(1715.77,-2085.38,113.67), typeRoute = "ItensIlegal", typeReward = "Desmanche", permissions = {"perm.pedreira"} },
	{ coords = vec3(-198.19,-1341.79,34.91), typeRoute = "ItensIlegal", typeReward = "Desmanche", permissions = {"perm.bennys"} },
	{ coords = vec3(726.47,-1067.24,28.31), typeRoute = "ItensIlegal", typeReward = "Desmanche", permissions = {"perm.lacoste"} },
	{ coords = vec3(1035.93,-2534.25,32.27), typeRoute = "ItensIlegal", typeReward = "Desmanche", permissions = {"perm.hellsangels"} },
	{ coords = vec3(994.15,-132.3,78.89), typeRoute = "ItensIlegal", typeReward = "Desmanche", permissions = {"perm.motoclub"} },
	{ coords = vec3(119.58,-1968.97,21.33), typeRoute = "ItensIlegal", typeReward = "Desmanche", permissions = {"perm.roxos"} },
	{ coords = vec3(-1574.22,-412.25,48.26), typeRoute = "ItensIlegal", typeReward = "Desmanche", permissions = {"perm.cohab"} },
	{ coords = vec3(-560.71,281.85,85.68), typeRoute = "ItensIlegal", typeReward = "Desmanche", permissions = {"perm.vk"} },
	


	--[ LAVAGEM ]--

	{ coords = vec3(750.18,-542.4,33.63), typeRoute = "Lavagem", typeReward = "Lavagem", permissions = {"perm.medusa"} },
	{ coords = vec3(-1391.24,-608.2,30.31), typeRoute = "Lavagem", typeReward = "Lavagem", permissions = {"perm.bahamas"} },
	{ coords = vec3(960.65,33.55,71.83), typeRoute = "Lavagem", typeReward = "Lavagem", permissions = {"perm.cassino"} },
	-- { coords = vec3(95.68,-1294.02,29.27), typeRoute = "Lavagem", typeReward = "Lavagem", permissions = {"perm.vanilla"} },
	{ coords = vec3(-219.61,-281.55,29.25), typeRoute = "Lavagem", typeReward = "Lavagem", permissions = {"perm.galaxy"} },
	{ coords = vec3(-319.47,205.93,87.94), typeRoute = "Lavagem", typeReward = "Lavagem", permissions = {"perm.lux"} },
	
	{ coords = vec3(417.61,-1496.8,30.14), typeRoute = "Lavagem", typeReward = "Lavagem", permissions = {"perm.anonymous"} },
	{ coords = vec3(-1045.3,-240.54,37.96), typeRoute = "Lavagem", typeReward = "Lavagem", permissions = {"perm.tequila"} },
	{ coords = vec3(-1146.58,376.26,71.31), typeRoute = "Lavagem", typeReward = "Lavagem", permissions = {"perm.sete"} },

	--[ ARMAS ]--

	{ coords = vec3(-1725.82,-228.59,57.53), typeRoute = "Armas", typeReward = "Armas", permissions = {"perm.pcc"} },
	{ coords = vec3(-1539.41,81.49,56.75), typeRoute = "Armas", typeReward = "Armas", permissions = {"perm.inglaterra"} },
	{ coords = vec3(3044.852, 2975.232, 89.79719), typeRoute = "Armas", typeReward = "Armas", permissions = {"perm.cv"} },
	{ coords = vec3(-3110.08,1725.08,36.13), typeRoute = "Armas", typeReward = "Armas", permissions = {"perm.milicia"} },
	{ coords = vec3(1167.749, -162.062027, 74.71558), typeRoute = "Armas", typeReward = "Armas", permissions = {"perm.grota"} },
	-- { coords = vec3(-1546.48,99.12,56.75), typeRoute = "Armas", typeReward = "Armas", permissions = {"perm.playboy"} },
	{ coords = vec3(-2948.57,46.9,11.9), typeRoute = "Armas", typeReward = "Armas", permissions = {"perm.magnatas"} },
	{ coords = vec3(411.83,3.29,84.92), typeRoute = "Armas", typeReward = "Armas", permissions = {"perm.mafia"} },
	{ coords = vec3(1394.31,1144.54,114.33), typeRoute = "Armas", typeReward = "Armas", permissions = {"perm.medellin"} },
	{ coords = vec3(-1520.58,857.93,181.78), typeRoute = "Armas", typeReward = "Armas", permissions = {"perm.vaticano"} },

	--[ CONTRABANDO ]--

	--{ coords = vec3(706.88,-966.26,30.4), typeRoute = "ItensIlegal", typeReward = "Contrabando", permissions = {"perm.anonymous"} },
	
	--[ COCAINA E LANÇA ]--
	
	{ coords = vec3(-1863.33,2054.23,135.46), typeRoute = "Drogas", typeReward = "MaconhaCoca", permissions = {"perm.hellzera"} },
	{ coords = vec3(297.59,1865.06,209.65), typeRoute = "Drogas", typeReward = "MaconhaCoca", permissions = {"perm.vidigal"} },
	{ coords = vec3(-1077.83,-1675.71,4.57), typeRoute = "Drogas", typeReward = "MaconhaCoca", permissions = {"perm.vermelhos"} },

	--[ BALINHA E HAXIXE ]--

	{ coords = vec3(865.373169, 1021.9408, 269.5164), typeRoute = "Drogas", typeReward = "BalinhaHaxixe", permissions = {"perm.argentina"} },
	-- { coords = vec3(694.49,-300.31,59.38), typeRoute = "Drogas", typeReward = "Haxixe", permissions = {"perm.portugal"} },
	{ coords = vec3(-350.84,-1519.38,33.19), typeRoute = "Drogas", typeReward = "BalinhaHaxixe", permissions = {"perm.grecia"} },
	{ coords = vec3(2093.56,2323.22,101.67), typeRoute = "Drogas", typeReward = "BalinhaHaxixe", permissions = {"perm.hamas"} },
	{ coords = vec3(1881.82,759.14,228.08), typeRoute = "Drogas", typeReward = "BalinhaHaxixe", permissions = {"perm.suecia"} },

	--[ META E LANÇA ]--

	-- { coords = vec3(-808.74,171.5,76.73), typeRoute = "Drogas", typeReward = "MetanfetaminaLanca", permissions = {"perm.colombia"} },
	{ coords = vec3(706.88,-966.67,30.41), typeRoute = "Drogas", typeReward = "MetanfetaminaLanca", permissions = {"perm.anonymous"} },

	--[ OPIO E HEROINA ]--

	{ coords = vec3(333.05,-2012.18,22.39), typeRoute = "Drogas", typeReward = "OpioHeroina", permissions = {"perm.vagos"} },
	-- MACONHA | HEROINA | OPIO | BALINHA

	{ coords = vec3(-2214.81,-214.8,65.09), typeRoute = "Drogas", typeReward = "DrugsHMOB", permissions = {"perm.irlanda"} },
	{ coords = vec3(-2365.17,1704.3,234.09), typeRoute = "Drogas", typeReward = "DrugsHMOB", permissions = {"perm.franca"} },
	{ coords = vec3(-502.68,-1476.64,16.33), typeRoute = "Drogas", typeReward = "DrugsHMOB", permissions = {"perm.palestina"} },
	{ coords = vec3(153.61,647.93,212.75), typeRoute = "Drogas", typeReward = "DrugsHMOB", permissions = {"perm.belgica"} },
	{ coords = vec3(924.36,354.02,112.3), typeRoute = "Drogas", typeReward = "DrugsHMOB", permissions = {"perm.russia"} },


	--[ META | LANÇA | HAXIXE | COCAINA ]--
	{ coords = vec3(-149.24,-1606.32,35.03), typeRoute = "Drogas", typeReward = "DrugsMLHC", permissions = {"perm.elements"} },

	{ coords = vec3(1384.65,-1281.79,78.69), typeRoute = "Drogas", typeReward = "DrugsMLHC", permissions = {"perm.italia"} },
	{ coords = vec3(-72.14,994.17,239.5), typeRoute = "Drogas", typeReward = "DrugsMLHC", permissions = {"perm.mercenarios"} },
	{ coords = vec3(-827.22,-713.12,23.78), typeRoute = "Drogas", typeReward = "DrugsMLHC", permissions = {"perm.china"} },
	{ coords = vec3(-1672.81,587.48,161.3), typeRoute = "Drogas", typeReward = "DrugsMLHC", permissions = {"perm.israel"} },
}