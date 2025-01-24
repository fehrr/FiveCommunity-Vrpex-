local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPserver = Tunnel.getInterface("vRP","comandorj_bank")

src = {}
Tunnel.bindInterface("comandorj_bank",src)
vSERVER = Tunnel.getInterface("comandorj_bank")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local segundos = 0
local oppened = nil

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BANCO teste
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local locations = {
  --[[[1] = { tipo = "banco", coords = vec3(150.12,-1040.8,29.38), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [2] = { tipo = "banco", coords = vec3(237.35,217.86,106.29), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [3] = { tipo = "banco", coords = vec3(314.09,-279.04,54.18), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [4] = { tipo = "banco", coords = vec3(-2962.58,482.54,15.71), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [5] = { tipo = "banco", coords = vec3(-112.29,6469.39,31.63), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [6] = { tipo = "banco", coords = vec3(-1215.57,-324.39,37.71), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [7] = { tipo = "banco", coords = vec3(-349.31,-44.9,49.04), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [8] = { tipo = "banco", coords = vec3(-1212.57,-330.67,37.79), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [9] = { tipo = "banco", coords = vec3(-351.18,-49.91,49.05), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [10] = { tipo = "banco", coords = vec3(-350.85,-49.92,49.05), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },--]]

  [1] = { tipo = "banco", coords = vec3(-1213.44,-331.02,37.78), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [2] = { tipo = "banco", coords = vec3(313.47,-278.81,54.17), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [3] =  { tipo = "banco", coords = vec3(149.35,-1040.53,29.37), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [4] =  { tipo = "banco", coords = vec3(-2962.60,482.17,15.70), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [5] =  { tipo = "banco", coords = vec3(-112.81,6469.91,31.62), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [6] =  { tipo = "banco", coords = vec3(1175.74,2706.80,38.09), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [7] =  { tipo = "banco", coords = vec3(235.12,216.84,106.28), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },

  [10] = { tipo = "caixaeletronico", coords = vec3(89.57,2.16,68.32), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [13] = { tipo = "caixaeletronico", coords = vec3(-821.61,-1082.05,11.13), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [14] = { tipo = "caixaeletronico", coords = vec3(1686.60,4815.74,42.00), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [15] = { tipo = "caixaeletronico", coords = vec3(-386.82,6045.96,31.50), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [16] = { tipo = "caixaeletronico", coords = vec3(1172.47,2702.48,38.17), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [17] = { tipo = "banco", coords = vec3(1968.07,3743.59,32.34), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [18] = { tipo = "caixaeletronico", coords = vec3(2558.94,350.94,108.62), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [19] = { tipo = "caixaeletronico", coords = vec3(1153.74,-326.77,69.20), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [20] = { tipo = "caixaeletronico", coords = vec3(-56.98,-1752.12,29.42), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [21] = { tipo = "caixaeletronico", coords = vec3(-3241.09,997.48,12.55), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [22] = { tipo = "caixaeletronico", coords = vec3(-1827.16,784.97,138.30), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [23] = { tipo = "caixaeletronico", coords = vec3(-1091.33,2708.48,18.95), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [24] = { tipo = "caixaeletronico", coords = vec3(112.63,-819.19,31.33), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [25] = { tipo = "caixaeletronico", coords = vec3(-256.15,-716.03,33.51), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [26] = { tipo = "caixaeletronico", coords = vec3(-258.62,-723.49,33.43), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [27] = { tipo = "caixaeletronico", coords = vec3(174.32,6637.82,31.57), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [28] = { tipo = "caixaeletronico", coords = vec3(-660.69,-853.86,24.48), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [29] = { tipo = "caixaeletronico", coords = vec3(147.64,-1035.50,29.34), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar" },
  [30] = { tipo = "caixaeletronico", coords = vec3(146.09,-1034.96,29.34), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar" },
  [31] = { tipo = "caixaeletronico", coords = vec3(-866.53,-187.66,37.83), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [32] = { tipo = "caixaeletronico", coords = vec3(-867.49,-186.01,37.83), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [33] = { tipo = "caixaeletronico", coords = vec3(418.82,-986.33,29.39), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [34] = { tipo = "caixaeletronico", coords = vec3(296.18,-591.49,43.27), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [35] = { tipo = "caixaeletronico", coords = vec3(296.23,-894.11,29.22), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [36] = { tipo = "caixaeletronico", coords = vec3(295.67,-896.07,29.21), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [37] = { tipo = "caixaeletronico", coords = vec3(-717.56,-915.68,19.21), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [38] = { tipo = "caixaeletronico", coords = vec3(33.16,-1348.11,29.49), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [39] = { tipo = "caixaeletronico", coords = vec3(130.05,-1292.67,29.26), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [40] = { tipo = "caixaeletronico", coords = vec3(129.63,-12,29.26), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [41] = { tipo = "caixaeletronico", coords = vec3(129.21,-1291.11,29.26), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [42] = { tipo = "caixaeletronico", coords = vec3(288.95,-1256.81,29.44), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [43] = { tipo = "caixaeletronico", coords = vec3(-31.49,-1121.46,26.55), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [44] = { tipo = "caixaeletronico", coords = vec3(-203.75,-861.52,30.26), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [45] = { tipo = "caixaeletronico", coords = vec3(-1109.71,-1690.73,4.37), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [46] = { tipo = "caixaeletronico", coords = vec3(-1430.10,-211.08,46.50), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [47] = { tipo = "caixaeletronico", coords = vec3(540.28,2671.14,42.15), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [48] = { tipo = "caixaeletronico", coords = vec3(2683.08,3286.57,55.24), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [49] = { tipo = "caixaeletronico", coords = vec3(2564.62,2584.77,38.08), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [50] = { tipo = "caixaeletronico", coords = vec3(1077.71,-776.35,58.23), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [51] = { tipo = "caixaeletronico", coords = vec3(1735.34,6410.66,35.04), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [52] = { tipo = "caixaeletronico", coords = vec3(-3240.82,1008.61,12.84), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [53] = { tipo = "caixaeletronico", coords = vec3(-2975.28,380.17,15.0), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [54] = { tipo = "caixaeletronico", coords = vec3(-2956.87,487.64,15.47), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [55] = { tipo = "caixaeletronico", coords = vec3(-2958.95,487.78,15.47), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [56] = { tipo = "caixaeletronico", coords = vec3(-254.34,-692.32,33.61), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [57] = { tipo = "caixaeletronico", coords = vec3(-301.72,-830.24,32.42), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [58] = { tipo = "caixaeletronico", coords = vec3(-303.28,-829.9,32.42), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [59] = { tipo = "caixaeletronico", coords = vec3(315.26,-593.74,43.29), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar\n ~w~~r~F~w~ para roubar" },
  [62] = { tipo = "caixaeletronico", coords = vec3(-809.36,-1238.23,7.34), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar" },
  [64] = { tipo = "caixaeletronico", coords = vec3(380.49,323.55,103.57), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar" },
  [65] = { tipo = "caixaeletronico", coords = vec3(93.01,124.93,80.54), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar" },


  [66] = { tipo = "banco", coords = vec3(-104.84,996.27,235.78), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  -- Anonymous
  [67] = { tipo = "banco", coords = vec3(-1527.05,837.13,181.59), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  -- Cassino
  [68] = { tipo = "banco", coords = vec3(932.6,43.07,81.08), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  --
  [69] = { tipo = "banco", coords = vec3(-1536.05,110.92,56.77), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  --
  [70] = { tipo = "banco", coords = vec3(50.34,-1771.55,29.28), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  --
  [71] = { tipo = "banco", coords = vec3(-1535.84,110.77,56.78), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  --
  [71] = { tipo = "banco", coords = vec3(236.56,219.61,106.29), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [72] = { tipo = "banco", coords = vec3(237.38,217.75,106.29), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [73] = { tipo = "banco", coords = vec3(238.22,215.87,106.29), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [74] = { tipo = "banco", coords = vec3(265.06,212.0,106.27), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [75] = { tipo = "banco", coords = vec3(2610.24,5308.15,45.28), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [76] = { tipo = "banco", coords = vec3(444.43,-1154.12,31.34), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [77] = { tipo = "banco", coords = vec3(-2035.46,-457.81,12.27), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [78] = { tipo = "banco", coords = vec3(-3159.71,1372.57,22.61), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  --[79] = { tipo = "banco", coords = vec3(1149.72,-159.73,70.67), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },

  [80] = { tipo = "banco", coords = vec3(-329.64,-162.14,39.01), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [81] = { tipo = "banco", coords = vec3(-2372.87,-212.28,31.51), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [82] = { tipo = "banco", coords = vec3(-434.26,-326.38,34.91), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [83] = { tipo = "banco", coords = vec3(-370.31,206.18,77.48), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [84] = { tipo = "banco", coords = vec3(-1185.19,-1730.3,11.9), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [85] = { tipo = "banco", coords = vec3(-288.38,214.95,81.77), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },

  [86] = { tipo = "banco", coords = vec3(-3234.44,811.32,14.07), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [87] = { tipo = "banco", coords = vec3(754.41,-565.09,33.63), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [88] = { tipo = "banco", coords = vec3(-345.46,-1538.67,28.58), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [89] = { tipo = "banco", coords = vec3(-374.72,206.15,77.48), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [90] = { tipo = "banco", coords = vec3(-1027.02,309.64,66.99), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [91] = { tipo = "banco", coords = vec3(-1475.81,2562.49,14.37), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [92] = { tipo = "banco", coords = vec3(-458.82,6107.46,31.86), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [93] = { tipo = "banco", coords = vec3(-816.34,181.18,72.15), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [94] = { tipo = "banco", coords = vec3(-886.2,-1461.42,7.53), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },

  [95] = { tipo = "banco", coords = vec3(1000.75,-131.18,74.05), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [96] = { tipo = "banco", coords = vec3(1000.67,-131.4,74.05), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [97] = { tipo = "banco", coords = vec3(817.18,-929.4,32.39), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [98] = { tipo = "banco", coords = vec3(-1566.4,280.54,68.75), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [99] = { tipo = "banco", coords = vec3(-812.37,267.18,86.19), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [100] = { tipo = "banco", coords = vec3(-919.41,-2032.39,9.4), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [101] = { tipo = "banco", coords = vec3(-432.51,1098.39,327.68), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [102] = { tipo = "banco", coords = vec3(224.81,-430.54,48.09), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },

  [103] = { tipo = "banco", coords = vec3(-1386.36,-597.2,30.31), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [104] = { tipo = "banco", coords = vec3(1215.45,-219.5,70.67), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [105] = { tipo = "banco", coords = vec3(848.37,-290.1,66.79), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },

  [106] = { tipo = "banco", coords = vec3(1359.6,1939.5,102.45), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [107] = { tipo = "banco", coords = vec3(-1754.71,-206.05,57.83), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [108] = { tipo = "banco", coords = vec3(-563.35,286.19,85.38), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [109] = { tipo = "banco", coords = vec3(421.03,15.88,91.93), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [110] = { tipo = "caixaeletronico", coords = vec3(4905.64,-4939.45,3.37), text = "[~r~Caixa Eletronico~w~]\n ~w~~r~E~w~ para acessar" },
  [111] = { tipo = "banco", coords = vec3(1070.58,634.53,138.45), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [112] = { tipo = "banco", coords = vec3(-189.41,-1317.46,30.89), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [113] = { tipo = "banco", coords = vec3(-483.13,-1475.6,16.6), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [114] = { tipo = "banco", coords = vec3(-2988.88,51.79,12.27), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [115] = { tipo = "banco", coords = vec3(-2345.55,3268.86,32.81), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [116] = { tipo = "banco", coords = vec3(-1148.96,372.37,71.31), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [117] = { tipo = "banco", coords = vec3(388.95,266.76,94.98), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [118] = { tipo = "banco", coords = vec3(205.8,1721.29,227.29), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
 -- [119] = { tipo = "banco", coords = vec3(2554.12,6176.4,165.4), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [120] = { tipo = "banco", coords = vec3(-2091.67,-1010.4,8.96), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [121] = { tipo = "banco", coords = vec3(-2055.54,-1023.99,11.9), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [122] = { tipo = "banco", coords = vec3(1215.5,-906.42,70.62), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [123] = { tipo = "banco", coords = vec3(1021.52,-2549.2,32.28), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [124] = { tipo = "banco", coords = vec3(197.9,-1646.25,29.81), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [125] = { tipo = "banco", coords = vec3(-2617.31,1704.31,142.36), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },
  [126] = { tipo = "banco", coords = vec3(-850.48,-36.09,39.6), text = "[~r~Banco~w~]\n ~w~~r~E~w~ para acessar" },

}

Citizen.CreateThread(function()
    while true do
      local time = 1000
      local pedCoords = GetEntityCoords(PlayerPedId())
        for k,v in pairs(locations) do
            local distance = #(pedCoords - v.coords)
            if distance <= 0.7 then
                time = 5
                DrawText3D(v.coords[1], v.coords[2], v.coords[3]+0.2, "~g~E~w~   ABRIR",400)
                if IsControlJustPressed(0,38) and distance <= 5.5 then
                  
                  local banco,carteira,identidade,multas,checkout = vSERVER.openBank()

                  if checkout and oppened == nil then
                    oppened = v.tipo
                    TransitionToBlurred(1000)
            
                    SetNuiFocus(true, true)
                    SendNUIMessage({ action = "openNui", data = { money = banco, wallet = carteira, name = identidade } })
                  end
                end
            end
        end

      Citizen.Wait(time)
    end
end)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NUI CALLBACKS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
RegisterNUICallback('balance', function(data, cb)
  SendNUIMessage({openSection = "balance"})
end)

RegisterNUICallback('withdraw', function(data, cb)
  SendNUIMessage({openSection = "withdraw"})
end)

RegisterNUICallback('deposit', function(data, cb)
  SendNUIMessage({openSection = "deposit"})
end)

RegisterNUICallback('transfer', function(data, cb)
  SendNUIMessage({openSection = "transfer"})
end)


RegisterNUICallback('withdrawSubmit', function(data, cb)
  if oppened ~= nil and segundos <= 0 and NetworkIsSessionActive() then
    segundos = 5
    if vSERVER.sacarDinheiro(data.amount) then
      vSERVER._updateBank()
    end
  end

  cb(true)
end)

RegisterNUICallback('depositSubmit', function(data, cb)
    if oppened ~= nil and oppened == "banco" and segundos <= 0 and NetworkIsSessionActive() then
      segundos = 5
      if vSERVER.depositarDinheiro(data.amount) then
        vSERVER._updateBank()
      end
    else
      TriggerEvent("Notify","negado","Você so pode efetuar depositos em um banco.", 5)
    end

    cb(true)
end)

RegisterNUICallback('transferSubmit', function(data, cb)
  if oppened ~= nil and segundos <= 0 and NetworkIsSessionActive() then
    segundos = 5
    if vSERVER.transferirDinheiro(data.toPlayer, data.amount) then
      vSERVER._updateBank()
    end
  end

  cb(true)
end)

RegisterNUICallback('multasSubmit', function(data, cb)
  if oppened ~= nil and segundos <= 0 and NetworkIsSessionActive() then
    segundos = 5
    if vSERVER.pagarMultas(data.amount) then
      vSERVER._updateBank()
    end
  end
  cb(true)
end)

RegisterNUICallback('requestHistoric', function(data, cb)
  cb(vSERVER.getHistoric())
end)

RegisterNUICallback('close', function(data, cb)
  TransitionFromBlurred(1000)
  oppened = nil
  SetNuiFocus(false, false)
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-----------------------------------------------------------------------------------------------------------------------------------------
function src.atualizarBanco(banco,carteira,multas)
  SendNUIMessage({ updateBalance = true, bank = banco, cart = carteira, multas = multas })
end

Citizen.CreateThread(function()
    while true do
      segundos = segundos - 1
      if segundos <= 0 then
        segundos = 0
      end
      Citizen.Wait(1000)
    end
end)

-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAW3DS
-----------------------------------------------------------------------------------------------------------------------------------------
function DrawText3D(x,y,z,text)
	SetTextFont(4)
	SetTextCentre(1)
	SetTextEntry("STRING")
	SetTextScale(0.35,0.35)
	SetTextColour(255,255,255,150)
	AddTextComponentString(text)
	SetDrawOrigin(x,y,z,0)
	DrawText(0.0,0.0)
	local factor = (string.len(text) / 375) + 0.01
	DrawRect(0.0,0.0125,factor,0.03,38,42,56,200)
	ClearDrawOrigin()
end