--discord.gg/sergin

config = {}

config.prices = {

---------tipos de cor-----------

	["colortypes"] = {
		["cromado"] = 2000,  -- + o preco da cor normal
		["metálico"] = 2000,
		["fosco"] = 0,
		["metal"] = 0 
	},

----------cor secundária custom--------
	["cor-secundaria"] = {
		startprice = 0,
	},	
----------cor primaria custom--------
	["cor-primaria"] = {
		startprice = 0,
	},
----------cor secundária--------
	["secundaria"] = {
		startprice = 1000,
	},	
----------cor primaria--------
	["primaria"] = {
		startprice = 2000,
	},
----------Perolado--------
	["perolado"] = {
		startprice = 0,
	},
----------Cor da roda--------
	["wheelcolor"] = {
		startprice = 1000,
	},
----------Neon--------
	["neon"] = {
		startprice = 13000,
	},
----------Pneu custom--------
	["custom"] = {
		startprice = 1000,
	},
----------Pneu a prova de balas--------
	["bulletproof"] = {
		startprice = 240000,
	},
----------Placa--------
	["placa"] = {
		startprice = 1000,
		increaseby = 0
	},
----------Vidro--------
	["vidro"] = {
		startprice = 3000,
		increaseby = 0
	},
----------Liveries--------
	[48] = {
		startprice = 5000,
		increaseby = 0
	},
	
----------Windows--------
	[46] = {
		startprice = 3000,
		increaseby = 0
	},
	
----------Tank--------
	[45] = {
		startprice = 20000,
		increaseby = 20000
	},
	
----------Trim--------
	[44] = {
		startprice = 1000,
		increaseby = 0
	},
	
----------Aerials--------
	[43] = {
		startprice = 2000,
		increaseby = 0
	},

----------Arch cover--------
	[42] = {
		startprice = 2000,
		increaseby = 0
	},

----------Struts--------
	[41] = {
		startprice = 5000,
		increaseby = 0
	},
	
----------Air filter--------
	[40] = {
		startprice = 2000,
		increaseby = 0
	},
	
----------Engine block--------
	[39] = {
		startprice = 2000,
		increaseby = 0
	},

----------Hydraulics--------
	[38] = {
		startprice = 5000,
		increaseby = 0
	},
	
----------Trunk--------
	[37] = {
		startprice = 4000,
		increaseby = 0
	},

----------Speakers--------
	[36] = {
		startprice = 5000,
		increaseby = 0
	},

----------Plaques--------
	[35] = {
		startprice = 2000,
		increaseby = 0
	},
	
----------Shift leavers--------
	[34] = {
		startprice = 3000,
		increaseby = 0
	},
	
----------Steeringwheel--------
	[33] = {
		startprice = 3000,
		increaseby = 0
	},
	
----------Seats--------
	[32] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Door speaker--------
	[31] = {
		startprice = 5000,
		increaseby = 0
	},

----------Dial--------
	[30] = {
		startprice = 4000,
		increaseby = 0
	},
----------Dashboard--------
	[29] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Ornaments--------
	[28] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Trim--------
	[27] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Vanity plates--------
	[26] = {
		startprice = 3000,
		increaseby = 0
	},
	
----------Plate holder--------
	[25] = {
		startprice = 3000,
		increaseby = 0
	},
---------Back Wheels---------
	[24] = {
		startprice = 5000,
		increaseby = 0
	},
---------Front Wheels---------
	[23] = {
		startprice = 5000,
		increaseby = 0
	},
---------Headlights---------
	[22] = {
		startprice = 15000,
	},
	
----------Turbo---------
	[18] = {
		startprice = 20000,
	},
	
-----------Armor-------------
	[16] = {
		startprice = 20000,
		increaseby = 20000
	},

---------Suspension-----------
	[15] = {
		startprice = 5000,
		increaseby = 5000
	},
-----------Horn----------
    [14] = {
        startprice = 2000,
		increaseby = 0
    },
-----------Transmission-------------
    [13] = {
        startprice = 30000,
		increaseby = 10000
	},
	
-----------Brakes-------------
	[12] = {
        startprice = 10000,
		increaseby = 10000
	},
	
------------Engine----------
	[11] = {
        startprice = 10000,
		increaseby = 10000
	},
    ---------Roof----------
	[10] = {
		startprice = 2000,
		increaseby = 0
	},
	
------------Fenders---------
	[8] = {
		startprice = 4000,
		increaseby = 0
	},
	
------------Hood----------
	[7] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Grille----------
	[6] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Roll cage----------
	[5] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Exhaust----------
	[4] = {
		startprice = 4000,
		increaseby = 0
	},
	
----------Skirts----------
	[3] = {
		startprice = 5000,
		increaseby = 0
	},
	
-----------Rear bumpers----------
	[2] = {
		startprice = 5000,
		increaseby = 0
	},
	
----------Front bumpers----------
	[1] = {
		startprice = 5000,
		increaseby = 0
	},
	
----------Spoiler----------
	[0] = {
		startprice = 5000,
		increaseby = 0
	},
}


config.locais = {
	[1] = vec3(-211.97,-1324.45,30.89),
	[2] = vec3(887.23,-2126.32,30.55),
	-- [3] = vec3(259.31,-1744.06,29.3),
	-- [4] = vec3(271.16,-1752.65,29.28),
	[3] = vec3(897.74,-2127.11,30.55),
	[4] = vec3(909.14,-2128.04,30.55),
	-- [7] = vec3(259.69,-1767.53,29.28),
	-- [5] = vec3(67.93,-1732.44,29.3),
	-- [6] = vec3(64.25,-1738.02,29.3),
	-- [7] = vec3(59.31,-1744.06,29.3),
	-- [8] = vec3(71.16,-1752.65,29.28),
	-- [9] = vec3(67.61,-1757.26,29.28),
	-- [10] = vec3(62.66,-1763.15,29.28),
	-- [11] = vec3(59.69,-1767.53,29.28),
	-- [12] = vec3(72.04,-1742.33,49.54),
	-- [13] = vec3(-312.38,-102.79,39.01),
	-- [14] = vec3(-316.03,-113.3,39.01),
	-- [15] = vec3(-319.34,-123.77,39.01),
	-- [16] = vec3(-323.63,-133.83,39.01),
	-- [17] = vec3(-327.13,-144.09,39.01),
	-- [18] = vec3(-341.52,-142.0,60.61),

	-- [19] = vec3(-342.79,-113.92,39.02),
	-- [20] = vec3(-338.55,-95.22,39.01),
	-- [21] = vec3(-351.9,-90.31,39.01),
	-- [22] = vec3(-365.11,-85.88,39.01),
	-- [23] = vec3(-346.94,-124.68,39.02),
	-- [24] = vec3(-349.12,-131.36,39.02),

	
	
	
	
	
	
}

config.logo = "https://media.discordapp.net/attachments/999123993330200656/1111409407218171934/logo.png?width=517&height=602"