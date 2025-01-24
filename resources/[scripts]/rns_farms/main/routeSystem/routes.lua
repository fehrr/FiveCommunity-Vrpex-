ConfigRoutes = {}

ConfigRoutes.rewards = {
    ["Armas"] = { --Nome da Bancada
        ["Rota de arma"] = { --Nome da rota
            ["image"] = "WEAPON_PISTOL_MK2", --Nome da imagem
            ["items"] = {
                { item = "molas", min = 3, max = 3}, --Spawn dos itens
                { item = "metal", min = 3, max = 3},
                { item = "gatilho", min = 1, max = 1},
                { item = "pecadearma", min = 10, max = 10},
            }
        },
    },

    ["Municao"] = {
        ["Rota de munição"] = {
            ["image"] = "AMMO_PISTOL_MK2",
            ["items"] = {
                { item = "polvora", min = 35, max = 35},
                { item = "capsulas", min = 25, max = 25},
            }
        },
    },

    ["Lavagem"] = {
        ["Rota de lavagem"] = {
            ["image"] = "l-alvejante",
            ["items"] = {
                { item = "l-alvejante", min = 12, max = 15},
            }
        },

        ["Ferro e Aluminio"] = {
            ["image"] = "ferro",
            ["items"] = {
                { item = "ferro", min = 10, max = 10},
                { item = "aluminio", min = 10, max = 10},
            }
        },

        ["Fibra de carbono e Poliester"] = {
            ["image"] = "fibradecarbono",
            ["items"] = {
                { item = "fibradecarbono", min = 5, max = 5},
                { item = "poliester", min = 5, max = 5},
            }
        },
    },

    ["Desmanche"] = {
        ["Rota de desmanche"] = {
            ["image"] = "aluminio",
            ["items"] = {
                { item = "ferro", min = 10, max = 10},
                { item = "aluminio", min = 10, max = 10},
                { item = "fibradecarbono", min = 5, max = 5},
                { item = "poliester", min = 5, max = 5},
            }
        },

        ["Rota de papel"] = {
            ["image"] = "papel",
            ["items"] = {
                { item = "papel", min = 5, max = 5},
            }
        },
    },

    ["Contrabando"] = {
        ["Rota de papel"] = {
            ["image"] = "papel",
            ["items"] = {
                { item = "papel", min = 12, max = 15},
            }
        },

        ["Ferro e Aluminio"] = {
            ["image"] = "ferro",
            ["items"] = {
                { item = "ferro", min = 10, max = 10},
                { item = "aluminio", min = 10, max = 10},
            }
        },

        ["Fibra de carbono e Poliester"] = {
            ["image"] = "fibradecarbono",
            ["items"] = {
                { item = "fibradecarbono", min = 5, max = 5},
                { item = "poliester", min = 5, max = 5},
            }
        },
    },

    ["DrugsHMOB"] = {
        ["Rota de maconha, heroina, opio e balinha"] = {
            ["image"] = "hmob",
            ["items"] = {
                { item = "folhamaconha", min = 4, max = 6},
                { item = "morfina", min = 4, max = 6},
                { item = "opiopapoula", min = 4, max = 6},
                { item = "podemd", min = 4, max = 6},
            }
        },
    },

    ["DrugsMLHC"] = {
        ["Rota de meta, lanca, haxixe e cocaina"] = {
            ["image"] = "mlhc",
            ["items"] = {
                { item = "respingodesolda", min = 4, max = 6},
                { item = "anfetamina", min = 4, max = 6},
                { item = "resinacannabis", min = 4, max = 6},
                { item = "pastabase", min = 4, max = 6},
            }
        },
    },

    ["MaconhaCoca"] = {
        ["Rota de maconha e cocaina"] = {
            ["image"] = "maconhacoca",
            ["items"] = {
                { item = "folhamaconha", min = 4, max = 6},
                { item = "pastabase", min = 4, max = 6},
            }
        },
    },

    ["BalinhaHaxixe"] = {
        ["Rota de balinha e haxixe"] = {
            ["image"] = "balinhahaxixe",
            ["items"] = {
                { item = "podemd", min = 4, max = 6},
                { item = "resinacannabis", min = 4, max = 6},
            }
        },
    },

    ["MetanfetaminaLanca"] = {
        ["Rota de metanfetamina e lança"] = {
            ["image"] = "metanfetaminalanca",
            ["items"] = {
                { item = "respingodesolda", min = 4, max = 6},
                { item = "anfetamina", min = 4, max = 6},
            }
        },
    },

    
    ["OpioHeroina"] = {
        ["Rota de ópio e heroina"] = {
            ["image"] = "opioheroina",
            ["items"] = {
                { item = "opiopapoula", min = 4, max = 6},
                { item = "morfina", min = 4, max = 6},
            }
        },
    },

    ["Cocaina"] = {
        ["Rota de cocaina"] = {
            ["image"] = "cocaina",
            ["items"] = {
                { item = "pastabase", min = 4, max = 6},
            }
        },
    },

    ["Maconha"] = {
        ["Rota de maconha"] = {
            ["image"] = "maconha",
            ["items"] = {
                { item = "folhamaconha", min = 4, max = 6},
            }
        },
    },

    ["Metanfetamina"] = {
        ["Rota de metanfetamina"] = {
            ["image"] = "metanfetamina",
            ["items"] = {
                { item = "anfetamina", min = 4, max = 6},
            }
        },
    },

    ["Haxixe"] = {
        ["Rota de haxixe"] = {
            ["image"] = "haxixe",
            ["items"] = {
                { item = "resinacannabis", min = 4, max = 6},
            }
        },
    },

    ["Opio"] = {
        ["Rota de opio"] = {
            ["image"] = "opio",
            ["items"] = {
                { item = "opiopapoula", min = 4, max = 6},
            }
        },
    },

    ["Heroina"] = {
        ["Rota de heroina"] = {
            ["image"] = "heroina",
            ["items"] = {
                { item = "morfina", min = 4, max = 6},
            }
        },
    },

    ["Lancaperfume"] = {
        ["Rota de lança"] = {
            ["image"] = "lancaperfume",
            ["items"] = {
                { item = "respingodesolda", min = 4, max = 6},
            }
        },
    },

    ["Balinha"] = {
        ["Rota de balinha"] = {
            ["image"] = "balinha",
            ["items"] = {
                { item = "podemd", min = 4, max = 6},
            }
        },
    },

}

ConfigRoutes.locs = {
    ["Armas"] = {
        ["south"] = {
            [1] = { coords = vec3(244.81,-41.27,69.89) },
            [2] = { coords = vec3(772.34,-152.28,74.43) },
            [3] = { coords = vec3(1217.81,-416.55,67.77) },
            [4] = { coords = vec3(1200.48,-1276.62,35.22) },
            [5] = { coords = vec3(787.46,-1770.31,29.28) },
            [6] = { coords = vec3(1432.66,-1682.29,64.79) },
            [7] = { coords = vec3(1021.11,-2434.61,29.66) },
            [8] = { coords = vec3(433.39,-1979.14,23.13) },
            [9] = { coords = vec3(-142.56,-1994.05,22.83) },
            [10] = { coords = vec3(-81.08,-1832.61,27.09) },
            [11] = { coords = vec3(-324.87,-1356.42,31.29) },
            [12] = { coords = vec3(-680.45,-945.73,20.93) },
            [13] = { coords = vec3(-1064.25,-1159.3,2.16) },
            [14] = { coords = vec3(-1305.28,-1363.85,4.52) },
            [15] = { coords = vec3(-1806.59,-402.98,44.64) },
            [16] = { coords = vec3(-715.76,303.7,85.31) },
            [17] = { coords = vec3(-766.82,-23.7,41.08) },
            [18] = { coords = vec3(-72.1,65.17,71.83) },
            [19] = { coords = vec3(736.91,132.28,80.71) },
        },
    
        ["north"] = {
            [1] = { coords = vec3(1561.67,867.3,77.46) },
            [2] = { coords = vec3(2559.5,373.69,108.61) },
            [3] = { coords = vec3(2521.59,2629.88,37.95) },
            [4] = { coords = vec3(1224.73,2728.37,38.0) },
            [5] = { coords = vec3(379.43,2629.81,44.67) },
            [6] = { coords = vec3(-1123.02,2682.0,18.7) },
            [7] = { coords = vec3(241.28,3107.68,42.48) },
            [8] = { coords = vec3(915.66,3565.17,33.8) },
            [9] = { coords = vec3(2039.86,3183.75,45.24) },
            --[10] = { coords = vec3(2396.62,3122.1,48.16) },
            [10] = { coords = vec3(2931.96,4624.54,48.71) },
            [11] = { coords = vec3(2252.08,5154.94,57.68) },
            [12] = { coords = vec3(1662.94,4776.44,42.01) },
            [13] = { coords = vec3(2467.39,4101.01,38.06) },
            [14] = { coords = vec3(1705.86,6425.2,32.76) },
            [15] = { coords = vec3(-151.35,6322.55,31.56) },
            [16] = { coords = vec3(-841.52,5401.3,34.61) },
            [17] = { coords = vec3(-3155.98,1125.54,20.86) },
            [18] = { coords = vec3(-2205.45,-373.39,13.31) },
        },
    },
    
    ["Municao"] = {
        ["south"] = {
            [1] = { coords = vec3(-1778.09,-427.29,41.45) },
            [2] = { coords = vec3(-1304.36,-1318.32,4.87) },
            [3] = { coords = vec3(-1215.05,-1505.03,4.33) },
            [4] = { coords = vec3(-495.21,-975.74,23.54) },
            [5] = { coords = vec3(-631.81,-1779.59,23.98) },
            -- [6] = { coords = vec3(11.19,-1843.64,24.48) },
            [6] = { coords = vec3(1448.73,-1934.3,70.99) },
            [7] = { coords = vec3(869.78,-2327.76,30.6) },
            [8] = { coords = vec3(919.4,-1269.29,25.54) },
            [9] = { coords = vec3(497.5,-100.33,61.38) },
            [10] = { coords = vec3(1211.56,-445.21,66.94) },
            [11] = { coords = vec3(368.0,-775.29,29.27) },
            [12] = { coords = vec3(445.96,-1242.79,30.28) },
            [13] = { coords = vec3(283.28,-1814.99,27.06) },
            -- [15] = { coords = vec3(-232.4,-1311.58,31.29) },
            [14] = { coords = vec3(-769.72,-223.38,37.41) },
            [15] = { coords = vec3(-511.8,-40.83,44.52) },
            [16] = { coords = vec3(227.37,-284.04,49.72) },
            [17] = { coords = vec3(1057.09,217.22,80.98) },
        },
    
        ["north"] = {
            [1] = { coords = vec3(-2187.49,-409.0,13.13) },
            [2] = { coords = vec3(-3147.49,1121.32,20.86) },
            [3] = { coords = vec3(-2544.11,2316.06,33.21) },
            [4] = { coords = vec3(-1123.3,2682.08,18.72) },
            [5] = { coords = vec3(241.44,3107.75,42.48) },
            [6] = { coords = vec3(915.5,3564.98,33.8) },
            [7] = { coords = vec3(1705.71,3779.48,34.76) },
            [8] = { coords = vec3(2389.35,3310.29,47.63 ) },
            [9] = { coords = vec3(2054.92,3196.38,45.19) },
            [10] = { coords = vec3(1224.9,2728.05,38.0) },
            [11] = { coords = vec3(2521.42,2630.0,37.95) },
            [12] = { coords = vec3(2847.92,4450.0,48.51) },
            [13] = { coords = vec3(2456.39,4058.06,38.06) },
            [14] = { coords = vec3(1804.05,4596.33,37.61) },
            [15] = { coords = vec3(1702.29,4916.54,42.07) },
            [16] = { coords = vec3(2242.86,5154.18,57.88) },
            [17] = { coords = vec3(770.92,226.81,86.04) },
            [18] = { coords = vec3(1561.51,867.22,77.46) },
        },
    },
    
    ["Drogas"] = {
        ["south"] = {
            [1] = { coords = vec3(-1178.79,-365.97,36.65) },
            [2] = { coords = vec3(-1318.1,-832.23,16.97) },
            [3] = { coords = vec3(-1482.73,-1029.85,6.13) },
            [4] = { coords = vec3(-1312.07,-1336.56,4.63) },
            [5] = { coords = vec3(-494.72,-976.53,23.54) },
            [6] = { coords = vec3(-753.38,-2499.7,13.93) },
            [7] = { coords = vec3(217.97,-2012.82,18.89) },
            [8] = { coords = vec3(393.08,-1814.24,28.98) },
            [9] = { coords = vec3(105.02,-1569.25,29.72) },
            [10] = { coords = vec3(519.25,-1734.01,30.68) },
            [11] = { coords = vec3(1193.06,-1656.47,43.02) },
            [12] = { coords = vec3(1200.52,-1276.72,35.22) },
            [13] = { coords = vec3(847.22,-1315.05,26.45) },
            [14] = { coords = vec3(292.41,-223.3,53.97) },
            [15] = { coords = vec3(222.43,-595.88,43.88) },
            [16] = { coords = vec3(-516.18,-679.79,33.67) },
            [17] = { coords = vec3(-929.18,-390.98,38.96) },
            [18] = { coords = vec3(-763.62,-34.32,37.83) },
            [19] = { coords = vec3(-654.64,313.53,83.09) },
        },
    
        ["north"] = {
            [1] = { coords = vec3(2527.79,2617.42,37.95) },
            [2] = { coords = vec3(1194.12,2722.04,38.62) },
            [3] = { coords = vec3(719.57,2312.06,50.33) },
            [4] = { coords = vec3(1195.76,1819.46,78.92) },
            [5] = { coords = vec3(218.13,2602.17,45.78) },
            [6] = { coords = vec3(-1122.76,2682.2,18.7) },
            [7] = { coords = vec3(-2544.01,2316.69,33.21) },
            [8] = { coords = vec3(-2198.2,4272.57,48.53) },
            [9] = { coords = vec3(-841.16,5401.46,34.61) },
            [10] = { coords = vec3(-319.88,6085.84,31.46) },
            [11] = { coords = vec3(-36.13,6639.88,30.46) },
            [12] = { coords = vec3(-128.5,6341.23,31.49) },
            [13] = { coords = vec3(1743.06,6409.65,35.1) },
            [14] = { coords = vec3(2241.04,5163.42,58.44) },
            [15] = { coords = vec3(1726.63,4682.85,43.66) },
            [16] = { coords = vec3(2471.33,4110.86,38.06) },
            [17] = { coords = vec3(1846.28,3914.6,33.46) },
            [18] = { coords = vec3(1296.0,3629.93,33.03) },
            [19] = { coords = vec3(191.21,3082.03,43.47) },
        },
    },
    
    ["ItensIlegal"] = {
        ["south"] = {
            [1] = { coords = vec3(-985.42,-1198.58,5.49) },
            [2] = { coords = vec3(-700.37,-1402.36,5.49) },
            [3] = { coords = vec3(-528.81,-1784.55,21.58) },
            [4] = { coords = vec3(-41.4,-1747.78,29.4) },
            [5] = { coords = vec3(445.89,-1241.65,30.28 ) },
            [6] = {coords = vec3(449.93,-650.84,28.48 ) },
            [7] = { coords = vec3(972.33,125.61,80.98) },
            [8] = { coords = vec3(642.36,260.47,103.29) },
            [9] = { coords = vec3(15.31,378.07,112.37 ) },
            [10] = { coords = vec3(-515.88,413.54,97.51) },
            [11] = { coords = vec3(-1460.8,-154.97,48.83) },
            [12] = { coords = vec3(-1607.4,-431.72,40.42 ) },
            [13] = { coords = vec3(-1789.26,-660.39,10.46 ) },
            [14] = { coords = vec3(-1320.77,-1044.84,7.46) },
            [15] = { coords = vec3(-1120.56,-1508.88,4.4) },
            [16] = { coords = vec3(-935.68,-1522.99,5.22) },
            [17] = { coords = vec3(-1153.68,-1249.6,7.19) },
            [18] = { coords = vec3(-1188.3,-1575.69,4.36) },
            [19] = { coords = vec3(-1125.71,-1061.34,2.14) },
        },
    
        ["north"] = {
            [1] = { coords = vec3(862.03,2173.79,52.28) },
            [2] = { coords = vec3(265.8,2598.45,44.82) },
            [3] = { coords = vec3(1141.86,2650.99,38.13) },
            [4] = { coords = vec3(1776.72,3327.66,41.43) },
            [5] = { coords = vec3(2389.35,3310.29,47.63) },
            [6] = { coords = vec3(2539.31,2603.45,37.95) },
            [7] = { coords = vec3(2897.69,4481.86,48.21) },
            [8] = { coords = vec3(2872.49,4721.33,48.8) },
            [9] = { coords = vec3(2251.79,5155.28,57.88) },
            [10] = { coords = vec3(1726.66,4765.75,41.91) },
            [11] = { coords = vec3(2467.48,4100.8,38.06) },
            [12] = { coords = vec3(1543.88,3715.59,34.81) },
            [13] = { coords = vec3(915.42,3564.94,33.8) },
            [14] = { coords = vec3(15.8,3687.68,39.56) },
            [15] = { coords = vec3(-1122.75,2682.27,18.7) },
            [16] = { coords = vec3(-2203.48,4276.28,48.46) },
            [17] = { coords = vec3(-840.97,5401.4,34.61) },
            [18] = { coords = vec3(1705.94,6425.11,32.76) },
            [19] = { coords = vec3(2677.93,3467.56,55.55) },
        },
    },
    
    ["Lavagem"] = {
        ["south"] = {
            [1] = { coords = vec3(-985.42,-1198.58,5.49) },
            [2] = { coords = vec3(-700.37,-1402.36,5.49) },
            [3] = { coords = vec3(-528.81,-1784.55,21.58) },
            [4] = { coords = vec3(-41.4,-1747.78,29.4) },
            [5] = { coords = vec3(445.89,-1241.65,30.28) },
            [6] = {coords = vec3(449.93,-650.84,28.48 ) },
            [7] = { coords = vec3(972.33,125.61,80.98) },
            [8] = { coords = vec3(642.36,260.47,103.29) },
            [9] = { coords = vec3(15.31,378.07,112.37 ) },
            [10] = { coords = vec3(-515.88,413.54,97.51) },
            [11] = { coords = vec3(-1460.8,-154.97,48.83) },
            [12] = { coords = vec3(-1607.4,-431.72,40.42 ) },
            [13] = { coords = vec3(-1789.26,-660.39,10.46 ) },
            [14] = { coords = vec3(-1320.77,-1044.84,7.46) },
            [15] = { coords = vec3(-1120.56,-1508.88,4.4) },
            [16] = { coords = vec3(-935.68,-1522.99,5.22) },
            [17] = { coords = vec3(-1153.68,-1249.6,7.19) },
            [18] = { coords = vec3(-1188.3,-1575.69,4.36) },
            [19] = { coords = vec3(-1125.71,-1061.34,2.14) },
        },
    
        ["north"] = {
            [1] = { coords = vec3(-2187.49,-409.0,13.13) },
            [2] = { coords = vec3(-3147.49,1121.32,20.86) },
            [3] = { coords = vec3(-2544.11,2316.06,33.21) },
            [4] = { coords = vec3(-1123.3,2682.08,18.72) },
            [5] = { coords = vec3(241.44,3107.75,42.48) },
            [6] = { coords = vec3(915.5,3564.98,33.8) },
            [7] = { coords = vec3(1705.71,3779.48,34.76) },
            [8] = { coords = vec3(2389.35,3310.29,47.63 ) },
            [9] = { coords = vec3(2054.92,3196.38,45.19) },
            [10] = { coords = vec3(1224.9,2728.05,38.0) },
            [11] = { coords = vec3(2521.42,2630.0,37.95) },
            [12] = { coords = vec3(2847.92,4450.0,48.51) },
            [13] = { coords = vec3(2456.39,4058.06,38.06) },
            [14] = { coords = vec3(1804.05,4596.33,37.61) },
            [15] = { coords = vec3(1702.29,4916.54,42.07) },
            [16] = { coords = vec3(2242.86,5154.18,57.88) },
            [17] = { coords = vec3(770.92,226.81,86.04) },
            [18] = { coords = vec3(1561.51,867.22,77.46) },
        },
    },
    
    ["Outros"] = {
        ["south"] = {
            [1] = { coords = vec3(-801.9,-922.02,18.77) },
            [2] = { coords = vec3(-978.39,-1108.45,2.14) },
            [3] = { coords = vec3(-801.99,-921.37,18.8) }, 
            [4] = { coords = vec3(-1277.45,-1336.2,4.25) },
            [5] = { coords = vec3(-1753.49,-694.36,10.14) }, 
            [6] = { coords = vec3(-1965.0,-297.0,41.1) },
            [7] = { coords = vec3(-1245.66,376.54,75.34) },
            [8] = { coords = vec3(-355.85,469.81,112.64) },
            [9] = { coords = vec3(412.67,151.02,103.2) },
            [10] = { coords = vec3(888.61,-141.81,78.33) },
            [11] = { coords = vec3(378.24,-371.92,46.89 ) },
            [12] = { coords = vec3(255.78,-665.48,38.18) },
            [13] = { coords = vec3(-229.0,-1118.0,23.02) },
            [14] = { coords = vec3(-545.01,-1228.0,18.45) },
            [15] = { coords = vec3(-786.0,-1045.0,12.97) },
            [16] = { coords = vec3(-1053.86,-1144.02,2.16) },
            [17] = { coords = vec3(-1090.52,-954.19,2.43) },
            [18] = { coords = vec3(-1053.13,-908.42,4.3) },
            [19] = { coords = vec3(-812.91,-980.45,14.17) },
    
        },
    
        ["north"] = {
            [1] = { coords = vec3(2527.79,2617.42,37.95) },
            [2] = { coords = vec3(1194.12,2722.04,38.62) },
            [3] = { coords = vec3(719.57,2312.06,50.33) },
            [4] = { coords = vec3(1195.76,1819.46,78.92) },
            [5] = { coords = vec3(218.13,2602.17,45.78) },
            [6] = { coords = vec3(-1122.76,2682.2,18.7) },
            [7] = { coords = vec3(-2544.01,2316.69,33.21) },
            [8] = { coords = vec3(-2198.2,4272.57,48.53) },
            [9] = { coords = vec3(-841.16,5401.46,34.61) },
            [10] = { coords = vec3(-319.88,6085.84,31.46) },
            [11] = { coords = vec3(-36.13,6639.88,30.46) },
            [12] = { coords = vec3(-128.5,6341.23,31.49) },
            [13] = { coords = vec3(1743.06,6409.65,35.1) },
            [14] = { coords = vec3(2241.04,5163.42,58.44) },
            [15] = { coords = vec3(1726.63,4682.85,43.66) },
            [16] = { coords = vec3(2471.33,4110.86,38.06) },
            [17] = { coords = vec3(1846.28,3914.6,33.46) },
            [18] = { coords = vec3(1296.0,3629.93,33.03) },
            [19] = { coords = vec3(191.21,3082.03,43.47) },
        },
    },
}