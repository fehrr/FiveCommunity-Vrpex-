----- Lojas de Departamento -----
Shops = {
    ['Loja de Bebidas'] = {
        mode = 'buy',
        items = {
            ['cerveja'] = 5000,
            ['absinto'] = 5000,
            ['whisky'] = 5000,
            ['conhaque'] = 5000,
            ['vodka'] = 5000,
            ['tequila'] = 5000
        },
        coords = {
            { coords = vec3(1184.08, -197.7, 62.41), blip = true },
            { coords = vec3(1003.72, -2550.38, 28.29), blip = true },
            { coords = vec3(128.33, -1285.3, 29.28), blip = true },
            { coords = vec3(4902.39, -4941.16, 3.35), blip = true },
            { coords = vec3(-465.41, 4392.95, 31.96), blip = true },
            { coords = vec3(-86.28, 826.61, 227.78), blip = true },
            { coords = vec3(-161.27, 905.99, 235.64), blip = true },
            { coords = vec3(-521.26, 510.16, 108.07), blip = true },
            { coords = vec3(-823.54, 265.5, 86.19), blip = true },
            { coords = vec3(-1990.9, -513.27, 25.9), blip = true },
            { coords = vec3(-2580.77, 1868.22, 163.8), blip = true },
            { coords = vec3(-11.88, 516.56, 174.63), blip = true },
            { coords = vec3(-2800.82, -18.22, 15.92), blip = true },
            { coords = vec3(-1149.01, 372.4, 71.31), blip = true },
            { coords = vec3(1385.37, 4700.72, 134.83), blip = true },
            { coords = vec3(-3025.8, 60.8, 11.61), blip = true },
            { coords = vec3(-2977.45, 11.0, 6.76), blip = true },
            { coords = vec3(-2963.98, -52.6, 1.75), blip = true },
            { coords = vec3(-3020.2, 37.92, 10.11), blip = true },
            { coords = vec3(-1430.65, -1261.89, 3.49), blip = true },
            { coords = vec3(204.55, -1638.46, 33.38), blip = true },
            { coords = vec3(129.43,-1281.05,29.27), blip = true },
        }
    },

    ['Ammunation'] = {
        mode = 'buy',
        items = {
            ["SCUBAGEAR"] = 500,
            ["WEAPON_KNIFE"] = 100000,
            ["WEAPON_DAGGER"] = 100000,
            ["WEAPON_KNUCKLE"] = 100000,
            ["WEAPON_MACHETE"] = 100000,
            ["WEAPON_SWITCHBLADE"] = 100000,
            ["WEAPON_WRENCH"] = 100000,
            ["WEAPON_HAMMER"] = 100000,
            ["WEAPON_GOLFCLUB"] = 100000,
            ["WEAPON_CROWBAR"] = 100000,
            ["WEAPON_HATCHET"] = 100000,
            ["WEAPON_FLASHLIGHT"] = 100000,
            ["WEAPON_BAT"] = 100000,
            ["WEAPON_BOTTLE"] = 100000,
            ["WEAPON_BATTLEAXE"] = 100000,
            ["WEAPON_POOLCUE"] = 100000,
            ["GADGET_PARACHUTE"] = 10000,
        },
        coords = {
            { coords = vec3(1692.62,3759.50,34.70) },
            { coords = vec3(252.89,-49.25,69.94)   },
            { coords = vec3(843.28,-1034.02,28.19) },
            { coords = vec3(-331.35,6083.45,31.45) },
            { coords = vec3(-663.15,-934.92,21.82) },
            { coords = vec3(-1305.18,-393.48,36.69)},
            { coords = vec3(-1118.80,2698.22,18.55)},
            { coords = vec3(2568.83,293.89,108.73) },
            { coords = vec3(-3172.68,1087.10,20.83)},
            { coords = vec3(21.32,-1106.44,29.79)  },
            { coords = vec3(811.19,-2157.67,29.61) },
        }
    },

    
    
    -- ['Oficina'] = {
    --     mode = 'buy',
    --     items = {
    --         ["pneus"] = 500,
    --         ["kitnitro"] = 550,
    --     },
    --     coords = {
    --         vec3(36.77,-1763.92,29.3), 
    --         vec3(120.84,134.09,81.25), 
    --         vec3(-322.95,-146.58,39.01), 
    --     }
    -- },

    

    ['Peixes'] = {
        mode = 'sell',
        blip = { index = 277, color = 0,  text = "Venda de Peixes" },
        items = {
            ["tilapia"] = 750,
            ["pacu"] = 750,
            ["tucunare"] = 750,
            ["salmao"] = 750,
            ["dourado"] = 750,
        },
        coords = {
            { coords = vec3(-1817.08,-1193.61,14.31), blip = true }, 
        }
    },

    ['Peixes AFK'] = {
        mode = 'sell',
        blip = { index = 277, color = 0,  text = "Venda de Peixes" },
        items = {
            ["pirarucu"] = 50000,
            ["piranha"] = 25000,
        },
        coords = {
            { coords = vec3(1300.49,4319.5,38.18), blip = true }, 
        }
    },
    ['Itens Peixe'] = {
        mode = 'buy',
        items = {
            ["vara"] = 50000,
            ["isca"] = 1000,
        },
        coords = {
            { coords = vec3(1332.68,4325.29,38.08) },
        }
    },

    ['Joalheria'] = {
        mode = 'sell',
        items = {
            ["bronze"] = 550,
            ["safira"] = 650,
            ["rubi"] = 600,
            ["ouro"] = 500,
        },
        coords = {
            {coords = vec3(2954.18,2743.36,43.61)}, 
        }
    },

    ['Graos'] = {
        mode = 'sell',
        items = {
            ["graosimpuros"] = 200,
        },
        coords = {
            { coords = vec3(-112.49,2818.82,53.16) }, 
        }
    },

    ['Tartarugas'] = {
        mode = 'sell',
        items = {
            ["tomate"] = 3000,
        },
        coords = {
            -- {coords = vec3(3725.21,4525.16,22.48)}, 
        }
    },

    ['Quitanda'] = {
        mode = 'sell',
        items = {
            ["tomate"] = 350,
            ["laranja"] = 500,
        },
        coords = {
            {coords = vec3(1785.64,4591.1,37.68)}, 
        }
    },

    ['Farmacia'] = {
        mode = 'buy',
        items = {
            ['bandagem'] = 10000,

        },
        coords = {
            { coords = vec3(-1278.63,321.5,69.51) },
        }
    },

    ['Farmacia2'] = {
        mode = 'buy',
        items = {
            ['anticoncepcional'] = 1000,
            ['camisinha'] = 1000,
            ['dorflex'] = 1000,
            ['paracetamol'] = 1000,
            ['dipirona'] = 1000,
            ['cataflan'] = 1000,
            ['riopan'] = 1000,
            ['luftal'] = 1000,
            ['amoxilina'] = 1000,
            ['coumadin'] = 1000,
            ['clozapina'] = 1000,
            ['fluoxetina'] = 1000,
            ['rivotril'] = 1000,
            ['cicatricure'] = 1000,

        },
        coords = {
            { coords = vec3(92.33,-229.58,54.66) },
            { coords = vec3(-176.42,6383.61,31.49) },
            { coords = vec3(-508.39,290.46,83.39) },
            { coords = vec3(318.49,-1076.99,29.47) },
        }
    },

    ['Mercado'] = {
        mode = 'buy',
        items = {
            ['repairkit3'] = 25000,
            ['pneus'] = 5000,
            ['mochila'] = 6000,
            ['radio'] = 2000,
            ['celular'] = 3000,
            ['roupas'] = 10000,
            ['energetico'] = 15000,
            ['fireworks'] = 5000,
            ['alianca'] = 50000,
            ['isca'] = 200,
        },
        blip = { index = 52, color = 0,  text = "Mercado" }, 
        coords = {
            { coords = vec3(-47.52,-1756.85,29.42), blip = true },
            { coords = vec3(-1223.38,-907.15,12.32), blip = true },
            { coords = vec3(25.74,-1345.26,29.49), blip = true },
            { coords = vec3(1135.7,-981.79,46.41), blip = true },
            { coords = vec3(1163.53,-323.54,69.2), blip = true },
            { coords = vec3(374.19,327.5,103.56), blip = true },
            { coords = vec3(2555.35,382.16,108.62), blip = true },
            { coords = vec3(2676.76,3281.57,55.24), blip = true },
            { coords = vec3(1960.5,3741.84,32.34), blip = true },
            { coords = vec3(1393.23,3605.17,34.98), blip = true },
            { coords = vec3(1166.08,2709.24,38.15), blip = true },
            { coords = vec3(547.98,2669.75,42.15), blip = true },
            { coords = vec3(1698.3,4924.37,42.06), blip = true },
            { coords = vec3(1729.54,6415.76,35.03), blip = true },
            { coords = vec3(-3243.9,1001.4,12.83), blip = true },
            { coords = vec3(-2968.0,390.8,15.04), blip = true },
            { coords = vec3(-3041.17,585.16,7.9), blip = true },
            { coords = vec3(-1820.55,792.77,138.11), blip = true },
            { coords = vec3(-1486.87,-379.77,40.16), blip = true },
            { coords = vec3(-707.4,-913.68,19.21), blip = true },
            { coords = vec3(-1611.99,-1078.24,13.08), blip = true },
            { coords = vec3(-3165.08,1379.32,22.6), blip = true },
            
            { coords = vec3(-2932.53,57.57,11.61), blip = false },
            { coords = vec3(1217.49,-220.99,70.67), blip = false },
            { coords = vec3(1426.33,-736.89,71.14), blip = false },
            { coords = vec3(-1275.91,320.14,69.51), blip = false },
            { coords = vec3(-1678.24,-231.33,55.64), blip = false },
            { coords = vec3(1217.42,-1487.89,34.69), blip = false },
            { coords = vec3(-427.46,1107.06,327.68), blip = false },
            { coords = vec3(-740.72,-1255.01,5.7), blip = false },
            { coords = vec3(-3206.18,791.85,8.93), blip = false },
            { coords = vec3(-1507.46,846.35,181.59), blip = false },
            { coords = vec3(-1026.93,309.5,66.99), blip = false },
            { coords = vec3(-810.92,167.87,72.22), blip = false },
            { coords = vec3(-2169.94,3171.74,32.82), blip = false },
            { coords = vec3(2605.1,5342.4,47.6), blip = false },

        }
    }

}
