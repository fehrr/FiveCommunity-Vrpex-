garagesConfig = {}

garagesConfig.main = {
	dir = "http://45.40.99.21:4020/lotus/carros/",
	spawnClientVehicle = true, -- Spawnar veiculo via client-side

	clearVehicle = { -- LIMPAR VEICULOS QUE NÃO ESTEJAM USADOS
		enable = true,  -- CASO QUEIRA ATIVAR / DESATIVAR
		time = 7, -- TEMPO EM MINUTOS
	},

	ipvaVencimento = 7, -- DIAS PARA O VENCIMENTO DO IPVA
	ipvaValue = 0.05, -- 5% VALOR  DO VEICULO IPVA

	detidoValue = 0.20, -- 5% VALOR DO VEICULO DETIDO
	retidoValue = 0.15, -- 10% VALOR DO VEICULO RETIDO 

	defaultCarPrice = 5000, -- Valor padrão caso o carro não seja encontrado na lista abaixo.
	defaultCarChest = 50, -- Valor padrão caso o carro não seja encontrado na lista abaixo.

	commands = {
		prefix = "veh", -- PREFIX
		sellVeh = "vender", -- comando para vender carro /veh vender
		keyAdd = "add", -- comando para  addchave carro /veh add
		keyRem = "rem", -- comando para rem chave carro /veh rem
	}
}

garagesConfig.listCars = {
	--[[VEÍCULOS NOVOS]]-- 
	[GetHashKey('intruder')] = { model = 'intruder', price = 90000, banned = false, name = 'Intruder', trunk = 50, type = 'sedans' },
    [GetHashKey('exemplar')] = { model = 'exemplar', price = 250000, banned = false, name = 'Exemplar', trunk = 50, type = 'sedans' },
    [GetHashKey('f620')] = { model = 'f620', price = 160000, banned = false, name = 'F620', trunk = 30, type = 'sedans' },
    [GetHashKey('felon')] = { model = 'felon', price = 300000, banned = false, name = 'Felon', trunk = 50, type = 'sedans' },
    [GetHashKey('ingot')] = { model = 'ingot', price = 100000, banned = false, name = 'Ingot', trunk = 60, type = 'sedans' },
    [GetHashKey('jackal')] = { model = 'jackal', price = 200000, banned = false, name = 'Jackal', trunk = 50, type = 'sedans' },
    [GetHashKey('oracle')] = { model = 'oracle', price = 120000, banned = false, name = 'Oracle', trunk = 50, type = 'sedans' },
    [GetHashKey('oracle2')] = { model = 'oracle2', price = 150000, banned = false, name = 'Oracle2', trunk = 60, type = 'sedans' },
    [GetHashKey('sentinel')] = { model = 'sentinel', price = 140000, banned = false, name = 'Sentinel', trunk = 50, type = 'sedans' },
    [GetHashKey('sentinel2')] = { model = 'sentinel2', price = 130000, banned = false, name = 'Sentinel2', trunk = 40, type = 'sedans' },
    [GetHashKey('windsor')] = { model = 'windsor', price = 220000, banned = false, name = 'Windsor', trunk = 20, type = 'sedans' },
    [GetHashKey('windsor2')] = { model = 'windsor2', price = 170000, banned = false, name = 'Windsor2', trunk = 40, type = 'sedans' },
    [GetHashKey('zion')] = { model = 'zion', price = 150000, banned = false, name = 'Zion', trunk = 50, type = 'sedans' },
    [GetHashKey('zion2')] = { model = 'zion2', price = 300000, banned = false, name = 'Zion2', trunk = 40, type = 'sedans' },
    [GetHashKey('blade')] = { model = 'blade', price = 150000, banned = false, name = 'Blade', trunk = 40, type = 'sedans' },
    [GetHashKey('buccaneer')] = { model = 'buccaneer', price = 200000, banned = false, name = 'Buccaneer', trunk = 50, type = 'sedans' },
    [GetHashKey('buccaneer2')] = { model = 'buccaneer2', price = 500000, banned = false, name = 'Buccaneer2', trunk = 60, type = 'sedans' },
    [GetHashKey('primo')] = { model = 'primo', price = 130000, banned = false, name = 'Primo', trunk = 50, type = 'sedans' },
	[GetHashKey('issi2')] = { model = 'issi2', price = 1835000, banned = false, name = 'Issi2', trunk = 20, type = 'sedans' },
    [GetHashKey('prairie')] = { model = 'prairie', price = 80000, banned = false, name = 'Prairie', trunk = 25, type = 'sedans' },
    [GetHashKey('rhapsody')] = { model = 'rhapsody', price = 10000, banned = false, name = 'Rhapsody', trunk = 30, type = 'sedans' },
    [GetHashKey('cogcabrio')] = { model = 'cogcabrio', price = 220000, banned = false, name = 'Cogcabrio', trunk = 60, type = 'sedans' },
    [GetHashKey('emperor')] = { model = 'emperor', price = 70000, banned = false, name = 'Emperor', trunk = 60, type = 'sedans' },
    [GetHashKey('emperor2')] = { model = 'emperor2', price = 100000, banned = false, name = 'Emperor 2', trunk = 60, type = 'sedans' },
    [GetHashKey('phoenix')] = { model = 'phoenix', price = 160000, banned = false, name = 'Phoenix', trunk = 40, type = 'sedans' },
    [GetHashKey('premier')] = { model = 'premier', price = 150000, banned = false, name = 'Premier', trunk = 50, type = 'sedans' },
    [GetHashKey('glendale')] = { model = 'glendale', price = 80000, banned = false, name = 'Glendale', trunk = 50, type = 'sedans' }, 

	[GetHashKey('lotusraptor')] = { model = 'lotusraptor', price = 1835000, banned = false, name = 'Raptor', trunk = 180, type = 'service'},
	[GetHashKey('lotusscania')] = { model = 'lotusscania', price = 1835000, banned = false, name = 'Scania', trunk = 180, type = 'service'},
	[GetHashKey('wrtrxmeclotus')] = { model = 'wrtrxmeclotus', price = 1835000, banned = false, name = 'wrtrxmeclotus', trunk = 30, type = 'service'},
	[GetHashKey('wrflatbedlotus')] = { model = 'wrflatbedlotus', price = 1835000, banned = false, name = 'wrflatbedlotus', trunk = 30, type = 'service'},

	[GetHashKey('wrtrxmecdk')] = { model = 'wrtrxmecdk', price = 1835000, banned = false, name = 'wrtrxmecdk', trunk = 30, type = 'service'},
	[GetHashKey('wrflatbeddk')] = { model = 'wrflatbeddk', price = 1835000, banned = false, name = 'wrflatbeddk', trunk = 30, type = 'service'},
	[GetHashKey('wrvelarno')] = { model = 'wrvelarno', price = 1835000, banned = false, name = 'Velar', trunk = 30, type = 'service'},
	
	[GetHashKey('wrtrxmecmotors')] = { model = 'wrtrxmecmotors', price = 1835000, banned = false, name = 'wrtrxmecmotors', trunk = 30, type = 'service'},
	[GetHashKey('wrflatbedmotors')] = { model = 'wrflatbedmotors', price = 1835000, banned = false, name = 'wrflatbedmotors', trunk = 30, type = 'service'},
	[GetHashKey('bruiser')] = { model = 'bruiser', price = 1835000, banned = false, name = 'bruiser', trunk = 30, type = 'service'}, 

	[GetHashKey('WRVolito')] = { model = 'WRVolito', price = 1835000, banned = false, name = 'Helicoptero HP', trunk = 180, type = 'service'},

	[GetHashKey('veto2')] = { model = 'veto2', price = 900000, banned = false, name = 'Veto 2', trunk = 30, type = 'outros'},
	[GetHashKey('caddy')] = { model = 'caddy', price = 900000, banned = false, name = 'Caddy', trunk = 30, type = 'outros'},
	[GetHashKey('dominator6')] = { model = 'dominator6', price = 900000, banned = false, name = 'Dominator 6', trunk = 30, type = 'outros'},
	[GetHashKey('openwheel2')] = { model = 'openwheel2', price = 900000, banned = false, name = 'Open Wheel', trunk = 30, type = 'vip'},
	[GetHashKey('wrarmoredgle')] = { model = 'wrarmoredgle', price = 900000, banned = false, name = 'Mercedes GLE Blindada', trunk = 30, type = 'vip'},
	[GetHashKey('wrthundersasuke')] = { model = 'wrthundersasuke', price = 900000, banned = false, name = 'wrthundersasuke', trunk = 30, type = 'vip'},
	[GetHashKey('tractor')] = { model = 'tractor', price = 50000, banned = false, name = 'Tractor', trunk = 20, type = 'outros'},

	[GetHashKey('vwgti23')] = { model = 'vwgti23', price = 3500000, banned = false, name = 'vwgti23', trunk = 40, type = 'vip' },
	[GetHashKey('duke90')] = { model = 'duke90', price = 3500000, banned = false, name = 'duke90', trunk = 40, type = 'vip' },
	[GetHashKey('wrbb64')] = { model = 'wrbb64', price = 3500000, banned = false, name = 'Brabus G900', trunk = 60, type = 'vip' },
	[GetHashKey('2xla80neondragon')] = { model = '2xla80neondragon', price = 3500000, banned = false, name = '2xla80neondragon', trunk = 30, type = 'vip' },
	[GetHashKey('freecrawler')] = { model = 'freecrawler', price = 3500000, banned = false, name = 'freecrawler', trunk = 350, type = 'vip' },
	[GetHashKey('impala67')] = { model = 'impala67', price = 3500000, banned = false, name = 'Impala Supernatural', trunk = 30, type = 'vip' },
	[GetHashKey('truckhalloween')] = { model = 'truckhalloween', price = 3500000, banned = false, name = 'Caminhão Halloween', trunk = 3000, type = 'vip' },
	[GetHashKey('zxhalloween')] = { model = 'zxhalloween', price = 3500000, banned = false, name = 'ZX10 Halloween', trunk = 15, type = 'vip' },
	[GetHashKey('718c')] = { model = '718c', price = 3500000, banned = false, name = 'Porsche 718 GT4', trunk = 30, type = 'vip' },
	[GetHashKey('seal24')] = { model = 'seal24', price = 3500000, banned = false, name = 'Seal 2024', trunk = 15, type = 'vip' },
	[GetHashKey('ix22')] = { model = 'ix22', price = 3500000, banned = false, name = 'IX 2022', trunk = 15, type = 'vip' },
	[GetHashKey('wrr1sakura')] = { model = 'wrr1sakura', price = 3500000, banned = false, name = 'R1 SAKURA', trunk = 15, type = 'vip' },
	[GetHashKey('m2out')] = { model = 'm2out', price = 3500000, banned = false, name = 'M2 Outubro Rosa', trunk = 15, type = 'vip' },
	[GetHashKey('chironss22')] = { model = 'chironss22', price = 3500000, banned = false, name = 'Chiron SS', trunk = 15, type = 'vip' },
	[GetHashKey('718c')] = { model = '718c', price = 3500000, banned = false, name = '718 GT4', trunk = 15, type = 'vip' },
	[GetHashKey('nivou')] = { model = 'nivou', price = 3500000, banned = false, name = 'Volkswagen Nivus', trunk = 15, type = 'vip' },
	[GetHashKey('wrarmoredx6')] = { model = 'wrarmoredx6', price = 3500000, banned = false, name = 'BMW X6 Blindada', trunk = 30, type = 'vip' },
	[GetHashKey('chironss22')] = { model = 'chironss22', price = 3500000, banned = false, name = 'Chiron SS', trunk = 30, type = 'vip' },
	[GetHashKey('mbc')] = { model = 'mbc', price = 3500000, banned = false, name = 'Mercedes MBC', trunk = 30, type = 'vip' },

	[GetHashKey('2xlr35kuromi')] = { model = '2xlr35kuromi', price = 3500000, banned = false, name = 'R35 Kuromi', trunk = 40, type = 'vip' },
	[GetHashKey('2xlr35sakura')] = { model = '2xlr35sakura', price = 3500000, banned = false, name = 'R35 Sakura', trunk = 40, type = 'vip' },

	[GetHashKey('f850new')] = { model = 'f850new', price = 3500000, banned = false, name = 'BMW GS F850', trunk = 20, type = 'vip' },
	[GetHashKey('wrarmoredconada')] = { model = 'wrarmoredconada', price = 3500000, banned = false, name = 'Conada Blindado', trunk = 20, type = 'vip' },
	[GetHashKey('xc90r')] = { model = 'xc90r', price = 3500000, banned = false, name = 'Volvo XC90r', trunk = 20, type = 'vip' },

	[GetHashKey('wrq6hosp')] = { model = 'wrq6hosp', price = 3500000, banned = false, name = 'wrq6hosp', trunk = 20, type = 'vip' },
	[GetHashKey('wrbugbomb')] = { model = 'wrbugbomb', price = 3500000, banned = false, name = 'wrbugbomb', trunk = 20, type = 'vip' },
	[GetHashKey('wrmachmec')] = { model = 'wrmachmec', price = 3500000, banned = false, name = 'wrmachmec', trunk = 20, type = 'vip' },
	[GetHashKey('wrmustpol')] = { model = 'wrmustpol', price = 3500000, banned = false, name = 'wrmustpol', trunk = 20, type = 'vip' },

	[GetHashKey('wrarmoredcayenne')] = { model = 'wrarmoredcayenne', price = 900000, banned = false, name = 'wrarmoredcayenne', trunk = 30, type = 'vip'},
	[GetHashKey('wrarmoredm3g80c')] = { model = 'wrarmoredm3g80c', price = 900000, banned = false, name = 'wrarmoredm3g80c', trunk = 30, type = 'vip'},
	[GetHashKey('wrarmoredm5')] = { model = 'wrarmoredm5', price = 900000, banned = false, name = 'wrarmoredm5', trunk = 30, type = 'vip'},
	[GetHashKey('wrarmoredmacan')] = { model = 'wrarmoredmacan', price = 900000, banned = false, name = 'wrarmoredmacan', trunk = 30, type = 'vip'},
	[GetHashKey('wrarmoredrs7')] = { model = 'wrarmoredrs7', price = 900000, banned = false, name = 'wrarmoredrs7', trunk = 30, type = 'vip'},
	[GetHashKey('wrarmoredx7m60i')] = { model = 'wrarmoredx7m60i', price = 900000, banned = false, name = 'wrarmoredx7m60i', trunk = 30, type = 'vip'},
	[GetHashKey('wrarmoredct')] = { model = 'wrarmoredct', price = 900000, banned = false, name = 'wrarmoredct', trunk = 30, type = 'vip'},

	[GetHashKey('3500sd')] = { model = '3500sd', price = 3500000, banned = false, name = 'Dodge RAM 3500 Super Duty', trunk = 150, type = 'vip' },

	[GetHashKey('insurgent2')] = { model = 'insurgent2', price = 1835000, banned = false, name = 'Insurgent 2', trunk = 200, type = 'vip' },
	[GetHashKey('hiaceil')] = { model = 'hiaceil', price = 1835000, banned = false, name = 'Hiaceil', trunk = 200, type = 'vip' },
	[GetHashKey('avenger')] = { model = 'Avenger', price = 1835000, banned = false, name = 'Avenger', trunk = 100, type = 'vip' },
	[GetHashKey('pounder')] = { model = 'pounder', price = 1835000, banned = false, name = 'Pounder', trunk = 3000, type = 'vip'},

	[GetHashKey('devel22')] = { model = 'devel22', price = 1835000, banned = false, name = 'Devel22', trunk = 30, type = 'vip'},
	[GetHashKey('lambose')] = { model = 'lambose', price = 1835000, banned = false, name = 'Lambose', trunk = 30, type = 'vip'},
	[GetHashKey('pyro')] = { model = 'pyro', price = 1835000, banned = false, name = 'Pyro', trunk = 30, type = 'vip'},

	[GetHashKey('venatus')] = { model = 'venatus', price = 3500000, banned = false, name = 'Lamborghini Mansory Urus', trunk = 60, type = 'vip' },
	[GetHashKey('speedo4')] = { model = 'speedo4', price = 3500000, banned = false, name = 'Speedo 4', trunk = 1000, type = 'vip' },
	
	
	[GetHashKey('amels200')] = { model = 'amels200', price = 1835000, banned = false, name = 'Iate Amels', trunk = 30, type = 'vip' },
	[GetHashKey('havok')] = { model = 'havok', price = 1835000, banned = false, name = 'Havok', trunk = 50, type = 'vip' },
	[GetHashKey('stockade3')] = { model = 'stockade3', price = 1835000, banned = false, name = 'Stockade', trunk = 100, type = 'vip'},
	[GetHashKey('thruster')] = { model = 'thruster', price = 1835000, banned = false, name = 'Thruster', trunk = 10, type = 'vip'},
	[GetHashKey('ahksv')] = { model = 'ahksv', price = 1835000, banned = false, name = 'Ahksv', trunk = 30, type = 'vip'},
	[GetHashKey('rmodf40')] = { model = 'rmodf40', price = 1835000, banned = false, name = 'Rmodf40', trunk = 30, type = 'vip'},
	[GetHashKey('rmodjesko')] = { model = 'rmodjesko', price = 1835000, banned = false, name = 'Jesko', trunk = 40, type = 'vip' },
	[GetHashKey('rmodgtr50')] = { model = 'rmodgtr50', price = 1835000, banned = false, name = 'Nissan GTR 50', trunk = 30, type = 'vip'},
	[GetHashKey('rmodmi8lb')] = { model = 'rmodmi8lb', price = 1835000, banned = false, name = 'Bmw i8 conversível ', trunk = 30, type = 'vip'},
	[GetHashKey('agerars')] = { model = 'agerars', price = 1835000, banned = false, name = 'Koenisegg Agera', trunk = 30, type = 'vip'},
	[GetHashKey('rmodf12tdf')] = { model = 'rmodf12tdf', price = 1835000, banned = false, name = 'Ferrari 12 TDF', trunk = 30, type = 'vip'},
	[GetHashKey('chironss')] = { model = 'chironss', price = 1835000, banned = false, name = 'Bugatti Chiron', trunk = 30, type = 'vip'},
	[GetHashKey('350z')] = { model = '350z', price = 1835000, banned = false, name = 'Nissan 350z', trunk = 40, type = 'vip'},
	[GetHashKey('rmodjeep')] = { model = 'rmodjeep', price = 1835000, banned = false, name = 'Jeep Cherokee', trunk = 600, type = 'vip'},
	[GetHashKey('audiq8')] = { model = 'audiq8', price = 1835000, banned = false, name = 'Audi Q8', trunk = 50, type = 'vip'},
	[GetHashKey('911r')] = { model = '911r', price = 900000, banned = false, name = 'Porshe 911r', trunk = 30, type = 'vip'},
	[GetHashKey('panamera17turbo')] = { model = 'panamera17turbo', price = 900000, banned = false, name = 'Panamera Turbo', trunk = 30, type = 'vip'},
	[GetHashKey('amarok')] = { model = 'amarok', price = 900000, banned = false, name = 'Amarok', trunk = 120, type = 'vip'},
	[GetHashKey('fox720m')] = { model = 'fox720m', price = 900000, banned = false, name = 'Ahksv', trunk = 30, type = 'vip'},
	[GetHashKey('s10')] = { model = 's10', price = 1835000, banned = false, name = 'Chevrolet S10', trunk = 30, type = 'vip'},
	[GetHashKey('xreagstore')] = { model = 'xreagstore', price = 1835000, banned = false, name = 'Honda XRE 300', trunk = 30, type = 'vip'},
	[GetHashKey('survolt')] = { model = 'survolt', price = 1835000, banned = false, name = 'Citroen Survolt', trunk = 30, type = 'vip'},
	[GetHashKey('18velar')] = { model = '18velar', price = 1835000, banned = false, name = 'Range Rover Velar', trunk = 30, type = 'vip'},
	[GetHashKey('WRvelar')] = { model = 'WRvelar', price = 1835000, banned = false, name = 'Range Rover Velar', trunk = 30, type = 'vip'},
	[GetHashKey('WRc7')] = { model = 'WRvelar', price = 1835000, banned = false, name = 'WR Corvette', trunk = 30, type = 'vip'},
	-- [GetHashKey('WRsw4')] = { model = 'WRsw4', price = 1835000, banned = false, name = 'WRsw4', trunk = 30, type = 'vip'},

	[GetHashKey('blacks')] = { model = 'blacks', price = 1835000, banned = false, name = 'Blacks', trunk = 30, type = 'vip' },

	-- HOSPITAL
	[GetHashKey('WRxreparamedico')] = { model = 'WRxreparamedico', price = 1835000, banned = false, name = 'XRE SAMU', trunk = 40, type = 'vip'},
	[GetHashKey('WRas350samu')] = { model = 'WRas350samu', price = 1835000, banned = false, name = 'AS350 SAMU', trunk = 40, type = 'vip'},
	[GetHashKey('WRsw4')] = { model = 'WRsw4', price = 1835000, banned = false, name = 'SW4 SAMU', trunk = 40, type = 'vip'},
	[GetHashKey('WRsprinter22')] = { model = 'WRsprinter22', price = 1835000, banned = false, name = 'Sprinter SAMU', trunk = 40, type = 'vip'},
	
	-- IFOOD
	[GetHashKey('wrcargo150')] = { model = 'wrcargo150', price = 1835000, banned = false, name = 'IFOOD', trunk = 40, type = 'vip'},
			
	-- BOMBEIRO
	[GetHashKey('WRsprinter22cbm')] = { model = 'WRsprinter22cbm', price = 1835000, banned = false, name = 'WRsprinter22cbm', trunk = 40, type = 'vip'},
	[GetHashKey('WRas350cbm')] = { model = 'WRas350cbm', price = 1835000, banned = false, name = 'WRas350cbm', trunk = 40, type = 'vip'},
	[GetHashKey('WR21hiluxcbm')] = { model = 'WR21hiluxcbm', price = 1835000, banned = false, name = 'WR21hiluxcbm', trunk = 40, type = 'vip'},
	[GetHashKey('WRsw4cbm')] = { model = 'WRsw4cbm', price = 1835000, banned = false, name = 'WRsw4cbm', trunk = 40, type = 'vip'},
				
	-- BANCO DO BRASIL
	[GetHashKey('insurgentbb')] = { model = 'insurgentbb', price = 1835000, banned = false, name = 'insurgentbb', trunk = 40, type = 'vip'},
		
	-- LIXEIRO
	[GetHashKey('WRtrashrio')] = { model = 'WRtrashrio', price = 1835000, banned = false, name = 'Caminhão de Lixo', trunk = 40, type = 'vip'},
	
	-- MECANICA
	[GetHashKey('wrtrxmec')] = { model = 'wrtrxmec', price = 1835000, banned = false, name = 'TRX', trunk = 40, type = 'vip'},
	[GetHashKey('wrflatbed')] = { model = 'wrflatbed', price = 1835000, banned = false, name = 'Flatbed', trunk = 40, type = 'vip'},
	
	-- EXERCITO
	[GetHashKey('WRranger23ebc')] = { model = 'WRranger23ebc', price = 1835000, banned = false, name = 'WRranger23ebc', trunk = 40, type = 'vip'},
	[GetHashKey('WRranger23eb')] = { model = 'WRranger23eb', price = 1835000, banned = false, name = 'WRranger23eb', trunk = 40, type = 'vip'},
	[GetHashKey('WR5ton')] = { model = 'WR5ton', price = 1835000, banned = false, name = 'WR5ton', trunk = 40, type = 'vip'},
	[GetHashKey('uh1exercito')] = { model = 'uh1exercito', price = 1835000, banned = false, name = 'uh1exercito', trunk = 40, type = 'vip'},
	[GetHashKey('haitun')] = { model = 'haitun', price = 1835000, banned = false, name = 'haitun', trunk = 40, type = 'vip'},

	 
	-- POLICIA
	[GetHashKey('caveiraopmerj')] = { model = 'caveiraopmerj', price = 1835000, banned = false, name = 'Caveirão PMERJ', trunk = 40, type = 'vip'},
	[GetHashKey('WRvelar')] = { model = 'WRvelar', price = 1835000, banned = false, name = 'Range Rover Velar', trunk = 40, type = 'vip'},
	[GetHashKey('WRjeep')] = { model = 'WRjeep', price = 1835000, banned = false, name = 'Jeep Grand Cherokee', trunk = 40, type = 'vip'},
	[GetHashKey('WRas350')] = { model = 'WRas350', price = 1835000, banned = false, name = 'AS350', trunk = 40, type = 'vip'},
	[GetHashKey('WRc7')] = { model = 'WRc7', price = 1835000, banned = false, name = 'Corvette C7', trunk = 40, type = 'vip'},
	[GetHashKey('WRduster22')] = { model = 'WRduster22', price = 1835000, banned = false, name = 'Duster', trunk = 40, type = 'vip'},
	[GetHashKey('WRl200')] = { model = 'WRl200', price = 1835000, banned = false, name = 'L200', trunk = 40, type = 'vip'},
	[GetHashKey('WRpajero')] = { model = 'WRpajero', price = 1835000, banned = false, name = 'Pajero', trunk = 40, type = 'vip'},
	[GetHashKey('WRranger23')] = { model = 'WRranger23', price = 1835000, banned = false, name = 'Ranger 23', trunk = 40, type = 'vip'},
	[GetHashKey('WRxt660')] = { model = 'WRxt660', price = 1835000, banned = false, name = 'XT 660', trunk = 40, type = 'vip'},
	[GetHashKey('WRtrailblazer22')] = { model = 'WRtrailblazer22', price = 1835000, banned = false, name = 'Trailblazer', trunk = 40, type = 'vip'},
	[GetHashKey('WRstorm')] = { model = 'WRstorm', price = 1835000, banned = false, name = 'Storm', trunk = 40, type = 'vip'},
	[GetHashKey('wrjettapm')] = { model = 'wrjettapm', price = 1835000, banned = false, name = 'Jetta', trunk = 40, type = 'vip'},

	
	
	-- PRF
	[GetHashKey('WRas350prf')] = { model = 'WRas350prf', price = 1835000, banned = false, name = 'AS350', trunk = 40, type = 'vip'},
	[GetHashKey('WRbell407prf')] = { model = 'WRbell407prf', price = 1835000, banned = false, name = 'BELL 407', trunk = 40, type = 'vip'},
	[GetHashKey('WRcruzeprf')] = { model = 'WRcruzeprf', price = 1835000, banned = false, name = 'Cruze', trunk = 40, type = 'vip'},
	[GetHashKey('WRl200prf')] = { model = 'WRl200prf', price = 1835000, banned = false, name = 'L200', trunk = 40, type = 'vip'},
	[GetHashKey('WRprfcamaro19')] = { model = 'WRprfcamaro19', price = 1835000, banned = false, name = 'Camaro', trunk = 40, type = 'vip'},
	[GetHashKey('WRranger21')] = { model = 'WRranger21', price = 1835000, banned = false, name = 'Ranger 21', trunk = 40, type = 'vip'},
	[GetHashKey('WRtrailblazerprf')] = { model = 'WRtrailblazerprf', price = 1835000, banned = false, name = 'Trailblazer', trunk = 40, type = 'vip'},


	[GetHashKey('r8spyder20')] = { model = 'r8spyder20', price = 1835000, banned = false, name = 'Audi R8 Spyder', trunk = 30, type = 'vip'},
	[GetHashKey('moss')] = { model = 'moss', price = 1835000, banned = false, name = 'Mercedes Moss', trunk = 30, type = 'vip'},
	[GetHashKey('m135i')] = { model = 'm135i', price = 1835000, banned = false, name = 'BMW M1', trunk = 30, type = 'vip'},
	[GetHashKey('sonata18')] = { model = 'sonata18', price = 1835000, banned = false, name = 'Sonata', trunk = 30, type = 'vip'},
	[GetHashKey('fordka')] = { model = 'fordka', price = 1835000, banned = false, name = 'Ford Ka', trunk = 30, type = 'vip'},
	[GetHashKey('palio')] = { model = 'palio', price = 1835000, banned = false, name = 'Palio', trunk = 30, type = 'vip'},
	[GetHashKey('mbc')] = { model = 'mbc', price = 1835000, banned = false, name = 'Mercedes Concept', trunk = 150, type = 'vip'},
	[GetHashKey('trailcat')] = { model = 'trailcat', price = 1835000, banned = false, name = 'Jeep Trailcat 4x4', trunk = 150, type = 'vip'},
	[GetHashKey('WRspeedoems')] = { model = 'WRspeedoems', price = 1000000, banned = false, name = 'WRspeedoems', trunk = 50, type = 'service' },
	[GetHashKey('WRurus')] = { model = 'WRurus', price = 1000000, banned = false, name = 'WRurus', trunk = 50, type = 'service' },
	[GetHashKey('mercxclass')] = { model = 'mercxclass', price = 1835000, banned = false, name = 'Mercedes Class X', trunk = 150, type = 'vip'},
	[GetHashKey('submersible')] = { model = 'submersible', price = 1835000, banned = false, name = 'Submarino', trunk = 30, type = 'vip'},
	[GetHashKey('civic2016')] = { model = 'civic2016', price = 1835000, banned = false, name = 'Civic 2016', trunk = 30, type = 'vip'},
	[GetHashKey('m2f22')] = { model = "m2f22", price = 1835000, banned = false, name = "BMW M2", trunk = 30, type = "vip" },
	[GetHashKey('eletran17')] = { model = 'eletran17', price = 1835000, banned = false, name = 'Elantra 17', trunk = 30, type = 'vip' },
	[GetHashKey('z4bmw')] = { model = 'z4bmw', price = 1835000, banned = false, name = 'BMW Z4', trunk = 30, type = 'vip' },
	[GetHashKey('punto')] = { model = 'punto', price = 1835000, banned = false, name = 'Fiat Punto', trunk = 30, type = 'vip' },
	[GetHashKey('veneno')] = { model = 'veneno', price = 1835000, banned = false, name = 'Lamborghini Veneno', trunk = 20, type = 'vip' },
	[GetHashKey('urus')] = { model = 'urus', price = 1835000, banned = false, name = 'Lamborghini Urus', trunk = 40, type = 'vip' },
	[GetHashKey('tenere1200')] = { model = 'tenere1200', price = 1835000, banned = false, name = 'YAMAHA SUPER TENERÊ 1200', trunk = 30, type = 'vip' },
	[GetHashKey('pcx')] = { model = 'pcx', price = 1835000, banned = false, name = 'PCX 2018', trunk = 30, type = 'vip' },
	[GetHashKey('pboxstergts')] = { model = 'pboxstergts', price = 1835000, banned = false, name = 'PORSCHE BOXTER 2013', trunk = 30, type = 'vip' },
	[GetHashKey('gs2013')] = { model = 'gs2013', price = 1835000, banned = false, name = 'R1200 GS 2013', trunk = 30, type = 'vip' },
	[GetHashKey('fxxkevo')] = { model = 'fxxkevo', price = 1835000, banned = false, name = 'Ferrari FXXK Evo', trunk = 30, type = 'vip' },
	[GetHashKey('fc15')] = { model = 'fc15', price = 1835000, banned = false, name = 'Ferrari California', trunk = 20, type = 'vip' },
	[GetHashKey('f850')] = { model = 'f850', price = 1835000, banned = false, name = 'F850 GS', trunk = 30, type = 'vip' },
	[GetHashKey('biz25')] = { model = "biz25", price = 1835000, banned = false, name = 'Biz 25', trunk = 40, type = 'vip' },
	[GetHashKey('f150')] = { model = "f150", price = 1835000, banned = false, name = 'Ford 150', trunk = 40, type = 'vip' },
	[GetHashKey('370z')] = { model = "370z", price = 1835000, banned = false, name = 'Nissan 370z', trunk = 40, type = 'vip' },
	[GetHashKey('a452')] = { model = "a452", price = 1835000, banned = false, name = 'Mercedes A45', trunk = 40, type = 'vip' },
	[GetHashKey('bikelete')] = { model = "bikelete", price = 1835000, banned = false, name = 'Bikelete', trunk = 40, type = 'vip' },
	[GetHashKey('c63w205')] = { model = 'c63w205', price = 1835000, banned = false, name = 'MERCEDES-AMG C63W205', trunk = 30, type = 'vip'},
	[GetHashKey('evo9')] = { model = 'evo9', price = 1835000, banned = false, name = 'Lancer Evolution 9', trunk = 30, type = 'vip'},
	[GetHashKey('ftoro')] = { model = 'ftoro', price = 1835000, banned = false, name = 'Ford Toro', trunk = 30, type = 'vip'},
	[GetHashKey('gle53')] = { model = 'gle53', price = 1835000, banned = false, name = 'Mercedes GLE53', trunk = 30, type = 'vip'},
	[GetHashKey('Hilux2019')] = { model = 'Hilux2019', price = 1835000, banned = false, name = 'Toyota Hilux 2019', trunk = 30, type = 'vip'},
	[GetHashKey('huayrar')] = { model = 'huayrar', price = 1835000, banned = false, name = 'Pagani Huayra', trunk = 30, type = 'vip'},
	[GetHashKey('subwrx')] = { model = 'subwrx', price = 1835000, banned = false, name = 'Subaru WRX', trunk = 30, type = 'vip'},
	[GetHashKey('ds4')] = { model = 'ds4', price = 1835000, banned = false, name = 'DS4', trunk = 30, type = 'vip'},
	[GetHashKey('amggtc')] = { model = 'amggtc', price = 1835000, banned = false, name = 'AMG Conversivel', trunk = 60, type = 'vip'},
	[GetHashKey('avisa')] = { model = 'avisa', price = 1835000, banned = false, name = 'Submarino Avisa', trunk = 30, type = 'outros' },

	[GetHashKey('675ltsp')] = { model = '675ltsp ', price = 1835000, banned = false, name = 'McLaren 675 LT SP', trunk = 30, type = 'vip'},
	[GetHashKey('wladlc500')] = { model = 'wladlc500', price = 1835000, banned = false, name = 'Lexus LC 500', trunk = 30, type = 'vip'},
	[GetHashKey('rs520')] = { model = 'rs520', price = 1835000, banned = false, name = 'Audi RS5 2020', trunk = 30, type = 'vip'},
	[GetHashKey('amgone')] = { model = 'amgone', price = 1835000, banned = false, name = 'Mercedes AMG ONE', trunk = 30, type = 'vip'},
	[GetHashKey('sjdodge')] = { model = 'sjdodge', price = 1835000, banned = false, name = 'Dodge Charger Hellcat', trunk = 30, type = 'vip'},
	[GetHashKey('bmwg07')] = { model = 'bmwg07', price = 1835000, banned = false, name = 'BMW X7 2021', trunk = 30, type = 'vip'},
	[GetHashKey('c8z0623')] = { model = 'c8z0623', price = 1835000, banned = false, name = 'Corvette C7 2023', trunk = 30, type = 'vip'},
	[GetHashKey('dd911gtrsr')] = { model = 'dd911gtrsr', price = 1835000, banned = false, name = 'Porsche 911R GT2 DD', trunk = 30, type = 'vip'},
	[GetHashKey('lpi8004')] = { model = 'lpi8004 ', price = 1835000, banned = false, name = 'Lamborghini Countach LPI800-4', trunk = 30, type = 'vip'},

	--[[VEÍCULOS VELOZES E FURIOSOS]]--
	[GetHashKey('rmodskyline34')] = { model = "rmodskyline34", price = 1835000, banned = false, name = 'Skyline R34', trunk = 40, type = 'vip' },
	[GetHashKey('fnflan')] = { model = 'fnflan', price = 1835000, banned = false, name = 'Mitsubishi Lancer Evolution IX GSR', trunk = 30, type = 'vip'},
	[GetHashKey('ff4wrx')] = { model = 'ff4wrx', price = 1835000, banned = false, name = 'Subaru Impreza Fast and Furious', trunk = 30, type = 'vip'},
	[GetHashKey('2f2fmk4')] = { model = '2f2fmk4', price = 1835000, banned = false, name = 'Toyota Supra Fast and Furious', trunk = 30, type = 'vip'},
	[GetHashKey('fnfmk4')] = { model = 'fnfmk4', price = 1835000, banned = false, name = 'Toyota Supra Fast and Furious 2', trunk = 30, type = 'vip'},
	[GetHashKey('fnfmits')] = { model = 'fnfmits', price = 1835000, banned = false, name = 'Mitsubishi Eclipse do Brian', trunk = 30, type = 'vip'},
	[GetHashKey('fnfrx7')] = { model = 'fnfrx7', price = 1835000, banned = false, name = 'Mazda RX7 do Han', trunk = 0, type = 'vip'},
	[GetHashKey('2f2fmle7')] = { model = '2f2fmle7', price = 1835000, banned = false, name = 'Lancer Evolution do Brian', trunk = 30, type = 'vip'},
	[GetHashKey('2f2fgts')] = { model = '2f2fgts', price = 1835000, banned = false, name = 'Mitsubishi Spyder do Roman', trunk = 30, type = 'vip'},
		
	--[[VEÍCULOS EMPREGOS]]--
	[GetHashKey('quadri')] = { model = 'quadri', price = 1000000, banned = false, name = 'Quadriciclo', trunk = 0, type = 'service'},
	[GetHashKey('phantom')] = { model = 'phantom', price = 1000000, banned = false, name = 'Phantom', trunk = 0, type = 'service'},
	[GetHashKey('trash2')] = { model = 'trash2', price = 1000000, banned = false, name = 'Trash 2', trunk = 0, type = 'service' },
	[GetHashKey('tiptruck')] = { model = 'tiptruck', price = 1000000, banned = false, name = 'Tip Truck', trunk = 80, type = 'service' },
	[GetHashKey('boxville2')] = { model = 'boxville2', price = 1000000, banned = false, name = 'Box ville', trunk = 80, type = 'service' },
	[GetHashKey('airbus')] = { model = 'airbus', price = 1000000, banned = false, name = 'Airbus', trunk = nil, type = 'service' },
	[GetHashKey('bus')] = { model = 'bus', price = 1000000, banned = false, name = 'Bus', trunk = nil, type = 'service' },
	[GetHashKey('dinghy')] = { model = 'dinghy', price = 1000000, banned = false, name = 'Dinghy', trunk = nil, type = 'service' },
	[GetHashKey('dinghy2')] = { model = 'dinghy2', price = 1000000, banned = false, name = 'Dinghy 2', trunk = nil, type = 'service' },
	[GetHashKey('dinghy3')] = { model = 'dinghy3', price = 1000000, banned = false, name = 'Dinghy 3', trunk = nil, type = 'service' },
	[GetHashKey('dinghy4')] = { model = 'dinghy4', price = 1000000, banned = false, name = 'Dinghy 4', trunk = nil, type = 'service' },
	[GetHashKey('trailerlogs')] = { model = 'trailerlogs', price = 1000000, banned = false, name = 'Trailer Logs', trunk = nil, type = 'service' },
	[GetHashKey('taxi')] = { model = 'taxi', price = 1000000, banned = false, name = 'Táxi', trunk = nil, type = 'service' },
	[GetHashKey('towtruck2')] = { model = 'towtruck2', price = 1000000, banned = false, name = 'TowTruck 2', trunk = nil, type = 'service' },
	[GetHashKey('flatbed')] = { model = 'flatbed', price = 1000000, banned = false, name = 'Flatbed', trunk = nil, type = 'service' },

	--[[HELIS]]--
	[GetHashKey('supervolito')] = { model = 'supervolito', price = 1835000, banned = false, name = 'Supervolito', trunk = 150, type = 'vip' },
	[GetHashKey('supervolito2')] = { model = 'supervolito2', price = 1835000, banned = false, name = 'Supervolito 2', trunk = 150, type = 'vip' },
	[GetHashKey('frogger')] = { model = 'frogger', price = 1835000, banned = false, name = 'Frogger', trunk = 150, type = 'vip' },
	[GetHashKey('frogger2')] = { model = 'frogger2', price = 1835000, banned = false, name = 'Frogger2', trunk = 150, type = 'vip' },
	[GetHashKey('volatus')] = { model = 'volatus', price = 1835000, banned = false, name = 'Volatus', trunk = 150, type = 'vip' },

	[GetHashKey('luxor')] = { model = 'luxor', price = 1835000, banned = false, name = 'Luxor', trunk = 50, type = 'vip' },

	
	[GetHashKey('swift2')] = { model = 'swift2', price = 1835000, banned = false, name = 'Swift2', trunk = 150, type = 'vip' },
	-- [GetHashKey('havok')] = { temodel = 'havok', price = 1835000, banned = false, name = 'Havok', trunk = 150, type = 'vip' },

	--[[VEÍCULOS ORGANIZACIONAIS]]--
	[GetHashKey('coach')] = { model = 'coach', price = 1000000, banned = false, name = 'Coach Civil', trunk = 50, type = 'service' },
	[GetHashKey('VRa3')] = { model = 'VRa3', price = 1000000, banned = false, name = 'VRa3', trunk = 50, type = 'service' },
	[GetHashKey('VRq8')] = { model = 'VRq8', price = 1000000, banned = false, name = 'VRq8', trunk = 50, type = 'service' },


	[GetHashKey('WRsubaru')] = { model = 'WRsubaru', price = 1000000, banned = false, name = 'WRsubaru', trunk = 50, type = 'service' },
	[GetHashKey('WRclassxxc')] = { model = 'WRclassxxc', price = 1000000, banned = false, name = 'WRclassxxc', trunk = 50, type = 'service' },
	[GetHashKey('WRm5')] = { model = 'WRm5', price = 1000000, banned = false, name = 'WRm5', trunk = 50, type = 'service' },


	[GetHashKey('VRraptor')] = { model = 'VRraptor', price = 1000000, banned = false, name = 'VRraptor', trunk = 50, type = 'service' },
	[GetHashKey('WRpolmav')] = { model = 'WRpolmav', price = 1000000, banned = false, name = 'Helicóptero Policia', trunk = 50, type = 'service' },
	[GetHashKey('ambulance')] = { model = 'ambulance', price = 1000000, banned = false, name = 'Ambulância', trunk = 50, type = 'service' },
	[GetHashKey('paramedicoheli')] = { model = 'paramedicoheli', price = 1000000, banned = false, name = 'Helicóptero Serviços', trunk = 50, type = 'service' },
	[GetHashKey('amggtr')] = { model = "amggtr", price = 1000000, banned = false, name = "Mercedes-Benz AMGGTR", trunk = 50, type = 'service' },
	[GetHashKey('mercedesgt')] = { model = 'mercedesgt', price = 1000000, banned = false, name = 'Mercedes-Benz GT63', trunk = 50, type = 'service' },
	[GetHashKey('nc750x')] = { model = 'nc750x', price = 1000000, banned = false, name = 'NC750X', trunk = 50, type = 'service' },
	[GetHashKey('paramedicoambu')] = { model = "paramedicoambu", price = 1000000, banned = false, name = 'Ambulância', trunk = nil, type = 'service' },
	[GetHashKey('wrcb500x')] = { model = "wrcb500x", price = 1000000, banned = false, name = "CB 500 Policia", trunk = 30, type = "service" },
	[GetHashKey('riot')] = { model = "riot", price = 1000000, banned = false, name = "Blindado Policia", trunk = 30, type = "service" }, 


	--[[NOVOS VEICULOS]]--
	[GetHashKey('maverick')] = { model = 'maverick', price = 1835000, banned = false, name = 'Maverick', trunk = 30, type = 'vip'},
	[GetHashKey('fc15')] = { model = 'fc15', price = 1835000, banned = false, name = 'Ferrari California', trunk = 30, type = 'vip'},
	[GetHashKey('ttrs')] = { model = 'ttrs', price = 1835000, banned = false, name = 'Audi TTrs', trunk = 30, type = 'vip'},
	[GetHashKey('f250deboxe')] = { model = 'f250deboxe', price = 1835000, banned = false, name = 'F250 Deboxe', trunk = 100, type = 'vip'},
	[GetHashKey('africatAG')] = { model = 'africatAG', price = 1835000, banned = false, name = 'africatAG', trunk = 30, type = 'vip' },
	[GetHashKey('m8gte')] = { model = 'm8gte', price = 1835000, banned = false, name = 'm8gte', trunk = 30, type = 'vip' },
	[GetHashKey('polestar1')] = { model = 'polestar1', price = 1835000, banned = false, name = 'polestar1', trunk = 30, type = 'vip' },

	[GetHashKey('WRx6')] = { model = "WRx6", price = 1000000, banned = false, name = "Bmw x6", trunk = 30, type = "service" },
	[GetHashKey('WRsxr')] = { model = "WRsxr", price = 1000000, banned = false, name = "Sxr", trunk = 30, type = "service" },
	[GetHashKey('WRram2500')] = { model = "WRram2500", price = 1000000, banned = false, name = "Ram 2500", trunk = 30, type = "service" },
	[GetHashKey('WRBmwm8')] = { model = "WRBmwm8", price = 1000000, banned = false, name = "Bmw m8", trunk = 30, type = "service" },
	[GetHashKey('WRBmwm1')] = { model = "WRBmwm1", price = 1000000, banned = false, name = "Bmw m1", trunk = 30, type = "service" },
	[GetHashKey('WRbmwi8')] = { model = "WRbmwi8", price = 1000000, banned = false, name = "Bmw i8", trunk = 30, type = "service" },
	[GetHashKey('WRbmwm4')] = { model = "WRbmwm4", price = 1000000, banned = false, name = "BMW M4 Policia", trunk = 30, type = "service" },
	[GetHashKey('WRclassxx')] = { model = "WRclassxx", price = 1000000, banned = false, name = "Class xx", trunk = 30, type = "service" },
	[GetHashKey('WRpolmav')] = 	{ model = "WRpolmav", price = 1000000, banned = false, name = "Pol Mav", trunk = 30, type = "service" },
	

	[GetHashKey('WRafricat')] = { model = "WRafricat", price = 1000000, banned = false, name = "WRafricat", trunk = 50, type = "service" },
	[GetHashKey('WRpgt322')] = { model = "WRpgt322", price = 1000000, banned = false, name = "WRpgt322", trunk = 50, type = "service" },
	[GetHashKey('WRbell407')] = { model = "WRbell407", price = 1000000, banned = false, name = "WRbell407", trunk = 50, type = "service" },
	[GetHashKey('WRpanamera')] = { model = "WRpanamera", price = 1000000, banned = false, name = "WRpanamera", trunk = 50, type = "service" },
	[GetHashKey('WRtacoma22')] = { model = "WRtacoma22", price = 1000000, banned = false, name = "WRtacoma22", trunk = 50, type = "service" },
	[GetHashKey('WRtacoma22choque')] = { model = "WRtacoma22choque", price = 1000000, banned = false, name = "WRtacoma22choque", trunk = 50, type = "service" },
	[GetHashKey('WRtacoma22cot')] = { model = "WRtacoma22cot", price = 1000000, banned = false, name = "WRtacoma22cot", trunk = 50, type = "service" },
	[GetHashKey('WRtaycan')] = { model = "WRtaycan", price = 1000000, banned = false, name = "WRtaycan", trunk = 50, type = "service" },
	[GetHashKey('WRauditron')] = { model = 'WRauditron', price = 1000000, banned = false, name = 'WRauditron', trunk = 50, type = 'service' },
	[GetHashKey('WRq7')] = { model = 'WRq7', price = 1000000, banned = false, name = 'WRq7', trunk = 50, type = 'service' },
	[GetHashKey('WRr8')] = { model = 'WRr8', price = 1000000, banned = false, name = 'WRr8', trunk = 50, type = 'service' },
	[GetHashKey('WRtacoma22core')] = { model = 'WRtacoma22core', price = 1000000, banned = false, name = 'WRtacoma22core', trunk = 50, type = 'service' },
	[GetHashKey('wrpolo')] = { model = "wrpolo", price = 3000000, banned = false, name = 'Polo', trunk = 20, type = 'vip' },



	[GetHashKey('WRbmwm4')] = { model = "WRbmwm4", price = 1000000, banned = false, name = "BMW M4 Policia", trunk = 30, type = "service" },
	[GetHashKey('WRclassxx')] = { model = "WRclassxx", price = 1000000, banned = false, name = "Class xx", trunk = 30, type = "service" },


	[GetHashKey('dodgeems')] = { model = "dodgeems", price = 1000000, banned = false, name = "Dodge EMS", trunk = 30, type = "service" },
	
	--[[VEÍCULOS VIP]]--
	[GetHashKey('rmodlegosenna')] = { model = 'rmodlegosenna', price = 1835000, banned = false, name = 'Mclaren Lego Senna ', trunk = 30, type = 'vip'},
	[GetHashKey('foxc8')] = { model = 'foxc8', price = 1835000, banned = false, name = 'Corvette C8 ', trunk = 30, type = 'vip'},
	[GetHashKey('m3e46')] = { model = 'm3e46', price = 1835000, banned = false, name = 'BMW M3 E46', trunk = 30, type = 'vip'},
	[GetHashKey('rmodcharger69')] = { model = 'rmodcharger69', price = 1835000, banned = false, name = 'Dodge Charger', trunk = 30, type = 'vip'},
	[GetHashKey('civic')] = { model = 'civic', price = 1835000, banned = false, name = 'Civic', trunk = 40, type = 'vip'},
	[GetHashKey('rmodcamaro')] = { model = 'rmodcamaro', price = 1835000, banned = false, name = 'Camaro', trunk = 40, type = 'vip'},
	[GetHashKey('rmodmartin')] = { model = 'rmodmartin', price = 1835000, banned = false, name = 'rmodmartin', trunk = 40, type = 'vip'},
	[GetHashKey('jetta2017')] = { model = 'jetta2017', price = 1835000, banned = false, name = 'Jetta 2017', trunk = 30, type = 'vip' },
	[GetHashKey('rmodessenza')] = { model = 'rmodessenza', price = 1835000, banned = false, name = 'Lamborghini Essenza', trunk = 30, type = 'vip' },
	[GetHashKey('adr8')] = { model = 'adr8', price = 1835000, banned = false, name = 'Audi R8 2021', trunk = 30, type = 'vip' },
	[GetHashKey('dukes2')] = { model = 'dukes2', price = 1835000, banned = false, name = 'Dukes Blindado', trunk = 30, type = 'vip' },
	[GetHashKey('dm1200')] = { model = 'dm1200', price = 1835000, banned = false, name = 'Ducati', trunk = 30, type = 'vip' },
	[GetHashKey('nissanskyliner34')] = 	{ model = 'nissanskyliner34', price = 1835000, banned = false, name = 'Skyline R34', trunk = 100, type = 'vip' },
	[GetHashKey('r1')] = { model = 'r1', price = 1835000, banned = false, name = 'Yamaha R1', trunk = 50, type = 'vip' },
	[GetHashKey('s1000rr')] = { model = 's1000rr', price = 1835000, banned = false, name = 'BMW S1000RR', trunk = 30, type = 'vip' },
	[GetHashKey('pcj')] = { model = 'pcj', price = 1835000, banned = false, name = 'KTM', trunk = 5, type = 'vip' },
	[GetHashKey('audirs7')] = { model = 'audirs7', price = 1835000, banned = false, name = 'Audi RS7', trunk = 40, type = 'vip' },
	[GetHashKey('718b')] = { model = '718b', price = 1835000, banned = false, name = 'Porsche 718B', trunk = 40, type = 'vip' },
	[GetHashKey('ferrariitalia')] = { model = 'ferrariitalia', price = 1835000, banned = false, name = 'Ferrari Itália', trunk = 40, type = 'vip' },
	[GetHashKey('fordmustang')] = { model = 'fordmustang', price = 1835000, banned = false, name = 'Ford Mustang', trunk = 40, type = 'vip' },
	[GetHashKey('lancerevolutionx')] = { model = 'lancerevolutionx', price = 1835000, banned = false, name = 'Lancer Evolution X', trunk = 40, type = 'vip' },
	[GetHashKey('teslaprior')] = { model = 'teslaprior', price = 1835000, banned = false, name = 'Tesla Prior', trunk = 40, type = 'vip' },
	[GetHashKey('bmws')] = { model = 'bmws', price = 1835000, banned = false, name = 'BMW S', trunk = 40, type = 'vip' },
	[GetHashKey('panigale')] = { model = 'panigale', price = 1835000, banned = false, name = 'Ducati', trunk = 40, type = 'vip' },
	[GetHashKey('gsxr')] = { model = 'gsxr', price = 1835000, banned = false, name = 'Suzuki GSXR', trunk = 40, type = 'vip' },
	[GetHashKey('hayabusa')] = { model = 'hayabusa', price = 1835000, banned = false, name = 'Hayabusa', trunk = 40, type = 'vip' },
	[GetHashKey('r6')] = { model = 'r6', price = 1835000, banned = false, name = 'Yamaha R6', trunk = 40, type = 'vip' },
	[GetHashKey('tiger')] = { model = "tiger", price = 1835000, banned = false, name = "Tiger", trunk = 40, type = 'vip' },
	[GetHashKey('xj6')] = { model = 'xj6', price = 1835000, banned = false, name = 'XJ6', trunk = 40, type = 'vip' },
	[GetHashKey('xt660vip')] = { model = 'xt660vip', price = 1835000, banned = false, name = 'XT 660', trunk = 40, type = 'vip' },
	[GetHashKey('z1000')] = { model = 'z1000', price = 20000, banned = false, name = 'Z1000', trunk = 40, type = 'vip' },
	[GetHashKey('zx6r')] = { model = 'zx6r', price = 1835000, banned = false, name = 'ZX6R', trunk = 40, type = 'vip' },
	[GetHashKey('zx10')] = { model = 'zx10', price = 1835000, banned = false, name = 'ZX10', trunk = 40, type = 'vip' },
	[GetHashKey('rmodbacalar')] = { model = 'rmodbacalar', price = 1835000, banned = false, name = 'Bacalar', trunk = 40, type = 'vip' },
	[GetHashKey('rmodbentleygt')] = { model = 'rmodbentleygt', price = 1835000, banned = false, name = 'Bentley GT', trunk = 40, type = 'vip' },
	[GetHashKey('rmodbmwm8')] = { model = 'rmodbmwm8', price = 1835000, banned = false, name = 'BMW M8', trunk = 40, type = 'vip' },
	[GetHashKey('africat')] = { model = 'africat', price = 1835000, banned = false, name = 'Africat', trunk = 40, type = 'vip' },
	[GetHashKey('c7')] = { model = 'c7', price = 1835000, banned = false, name = 'Corvette Conversivel 7', trunk = 40, type = 'vip' },
	[GetHashKey('cx75')] = { model = 'cx75', price = 1835000, banned = false, name = 'Jaguar C-X75', trunk = 40, type = 'vip' },
	[GetHashKey('divo')] = { model = 'divo', price = 1835000, banned = false, name = 'Bugatti Divo', trunk = 40, type = 'vip' },
	[GetHashKey('evoque')] = { model = 'evoque', price = 1835000, banned = false, name = 'Range Rover Evoque', trunk = 40, type = 'vip' },
	[GetHashKey('f8t')] = { model = 'f8t', price = 1835000, banned = false, name = 'Ferrari Pista 8', trunk = 40, type = 'vip' },
	[GetHashKey('fz07')] = { model = 'fz07', price = 1835000, banned = false, name = 'Yamaha FZ-07', trunk = 40, type = 'vip' },
	[GetHashKey('nh2r')] = { model = 'nh2r', price = 1835000, banned = false, name = 'Kawasaki Ninja H2R', trunk = 40, type = 'vip' },
	[GetHashKey('pamodelra17turbo')] = { model = 'pamodelra17turbo', price = 1835000, banned = false, name = 'Porsche Pamodelra 17 TURBO', trunk = 40, type = 'vip' },
	[GetHashKey('r1200')] = { model = 'r1200', price = 1835000, banned = false, name = 'BMW R1250', trunk = 40, type = 'vip' },
	[GetHashKey('terzo')] = { model = 'terzo', price = 1835000, banned = false, name = 'Lamborghini Terzo', trunk = 40, type = 'vip' },
	[GetHashKey('hornet')] = { model = 'hornet', price = 100000, banned = false, name = 'Hornet', trunk = 40, type = 'vip' },
	[GetHashKey('civictyper')] = { model = 'civictyper', price = 1835000, banned = false, name = 'CivicType R', trunk = 40, type = 'vip' },
	[GetHashKey('18performante')] = { model = '18performante', price = 1835000, banned = false, name = 'Lamborghini Huracan NOVA', trunk = 40, type = 'vip' },
	[GetHashKey('bmwi8')] = { model = 'bmwi8', price = 1835000, banned = false, name = 'BMW I8', trunk = 40, type = 'vip' },
	[GetHashKey('silvias15')] = { model = 'silvias15', price = 1835000, banned = false, name = 'Nissan Silvia S15', trunk = 50, type = 'vip' },
	[GetHashKey('silvia')] = { model = 'silvia', price = 1835000, banned = false, name = 'Silvia GK', trunk = 50, type = 'vip' },
	[GetHashKey('24humevof')] = { model = '24humevof', price = 1835000, banned = false, name = 'Hummer EV 2024', trunk = 150, type = 'vip' },
	[GetHashKey('d99')] = { model = 'd99', price = 1835000, banned = false, name = 'Ducati 1199 Panigale', trunk = 50, type = 'vip' },
	[GetHashKey('elva')] = { model = 'elva', price = 1835000, banned = false, name = 'Elva', trunk = 40, type = 'vip' },
	[GetHashKey('foxct')] = { model = 'foxct', price = 1835000, banned = false, name = 'Tesla CyberTruck', trunk = 40, type = 'vip' },
	[GetHashKey('foxevo')] = { model = 'foxevo', price = 1835000, banned = false, name = 'Lamborghini Evo', trunk = 40, type = 'vip' },
	[GetHashKey('foxgt2')] = { model = 'foxgt2', price = 1835000, banned = false, name = 'McLaren GT2', trunk = 40, type = 'vip' },
	[GetHashKey('foxsenna')] = { model = 'foxsenna', price = 1835000, banned = false, name = 'McLaren Senna', trunk = 40, type = 'vip' },
	[GetHashKey('gemera')] = { model = 'gemera', price = 1835000, banned = false, name = 'Koenigsegg', trunk = 40, type = 'vip' },
	[GetHashKey('giuliagta')] = { model = 'giuliagta', price = 1835000, banned = false, name = 'Giulia', trunk = 40, type = 'vip' },
	[GetHashKey('golf7gti')] = { model = 'golf7gti', price = 20000, banned = false, name = 'GOLF GTI', trunk = 40, type = 'vip' },
	[GetHashKey('rmodgt63')] = { model = 'rmodgt63', price = 1835000, banned = false, name = 'Mercedes GT63', trunk = 40, type = 'vip' },
	[GetHashKey('lwgtr')] = { model = 'lwgtr', price = 1835000, banned = false, name = 'LWGTR', trunk = 40, type = 'vip' },
	[GetHashKey('huracangt3evo')] = { model = 'huracangt3evo', price = 1835000, banned = false, name = 'Lamborghini Huracan GT3 EVO', trunk = 40, type = 'vip' },
	[GetHashKey('l200')] = { model = 'l200', price = 1835000, banned = false, name = 'L200', trunk = 40, type = 'vip' },
	[GetHashKey('bmwm4gts')] = { model = 'bmwm4gts', price = 1835000, banned = false, name = 'BMW M4GTS', trunk = 40, type = 'vip' },
	[GetHashKey('mansgt')] = { model = 'mansgt', price = 1835000, banned = false, name = 'MANSGT', trunk = 40, type = 'vip' },
	[GetHashKey('monza')] = { model = 'monza', price = 1835000, banned = false, name = 'Monza', trunk = 40, type = 'vip' },
	[GetHashKey('paredao')] = { model = 'paredao', price = 1835000, banned = false, name = 'Paredão', trunk = 40, type = 'vip' },
	[GetHashKey('pct18')] = { model = "pct18", price = 1835000, banned = false, name = 'Cayenne Turbo', trunk = 40, type = 'vip' },
	[GetHashKey('pistaspider19')] = { model = 'pistaspider19', price = 1835000, banned = false, name = 'Ferrari Spider', trunk = 40, type = 'vip' },
	-- [GetHashKey('ram2500')] = { model = 'ram2500', price = 1835000, banned = false, name = 'Caminhonete RAM2500', trunk = 130, type = 'vip' },
	[GetHashKey('fd')] = { model = 'fd', price = 1835000, banned = false, name = 'RX7', trunk = 40, type = 'vip' },
	[GetHashKey('rs7c821')] = { model = 'rs7c821', price = 1835000, banned = false, name = 'rs7c821', trunk = 40, type = 'vip' },
	[GetHashKey('mt07')] = { model = 'mt07', price = 1835000, banned = false, name = 'mt07', trunk = 40, type = 'vip' },

	
	[GetHashKey('a80')] = { model = 'a80', price = 1835000, banned = false, name = 'Toyota Supra', trunk = 40, type = 'vip' },
	[GetHashKey('rs6wb')] = { model = 'rs6wb', price = 1835000, banned = false, name = 'RS6WB', trunk = 40, type = 'vip' },
	[GetHashKey('valkyrietp')] = { model = 'valkyrietp', price = 1835000, banned = false, name = 'Valkyrie TP', trunk = 40, type = 'vip' },
	[GetHashKey('rmodx6')] = { model = 'rmodx6', price = 1835000, banned = false, name = 'BMW X6', trunk = 40, type = 'vip' },
	[GetHashKey('918S')] = { model = '918S', price = 1835000, banned = false, name = 'Porsche Spyder', trunk = 30, type = 'vip' },
	[GetHashKey('macanturbo')] = { model = 'macanturbo', price = 1835000, banned = false, name = 'Porshe Macan', trunk = 30, type = 'vip' },
	[GetHashKey('taycan21')] = { model = 'taycan21', price = 1835000, banned = false, name = 'Porshe Taycan', trunk = 30, type = 'vip' },
	[GetHashKey('WRtiger900')] = { model = 'WRtiger900', price = 1835000, banned = false, name = 'Triumph Tiger 900', trunk = 30, type = 'vip' },
	[GetHashKey('rmodsianr')] = { model = 'rmodsianr', price = 1835000, banned = false, name = 'Lamborghini Sian', trunk = 30, type = 'vip' },
	[GetHashKey('chevette')] = { model = 'chevette', price = 300000, banned = false, name = 'Chevette', trunk = 30, type = 'vip'},
	[GetHashKey('saveiro')] = { model = 'saveiro', price = 300000, banned = false, name = 'Saveiro', trunk = 50, type = 'vip'},
	[GetHashKey('terbyte')] = { model = 'terbyte', price = 1835000, banned = false, name = 'Terbyte', trunk = 2000, type = 'vip'},
	[GetHashKey('WRtrailblazercore')] = { model = 'WRtrailblazercore', price = 1, banned = false, name = 'Blazer Core', trunk = 30, type = 'service' },
	[GetHashKey('WRlwgtr')] = { model = 'WRlwgtr', price = 1, banned = false, name = 'WR GTR', trunk = 30, type = 'service' },
	[GetHashKey('wrbmwi8exc')] = { model = 'wrbmwi8exc', price = 1500000, banned = false, name = 'Storm', trunk = 40, type = 'vip'},
	
	
	[GetHashKey('2f2fgtr34')] = { model = '2f2fgtr34', price = 1835000, banned = false, name = 'GT-R 34', trunk = 30, type = 'vip'},
	[GetHashKey('2f2fgts')] = { model = '2f2fgts', price = 1835000, banned = false, name = 'Eclipse GTS', trunk = 30, type = 'vip'},
	[GetHashKey('2f2fmk4')] = { model = '2f2fmk4', price = 1835000, banned = false, name = 'Supra MK4', trunk = 30, type = 'vip'},
	[GetHashKey('2f2fmle7')] = { model = '2f2fmle7', price = 1835000, banned = false, name = 'Lancer Evo VII', trunk = 30, type = 'vip'},
	[GetHashKey('2f2frx7')] = { model = '2f2frx7', price = 1835000, banned = false, name = 'RX7 FD', trunk = 30, type = 'vip'},
	[GetHashKey('2f2fs2000')] = { model = '2f2fs2000', price = 1835000, banned = false, name = 'S2000', trunk = 30, type = 'vip'},
	[GetHashKey('350zdk')] = { model = '350zdk', price = 1835000, banned = false, name = '350Z DK', trunk = 30, type = 'vip'},
	[GetHashKey('350zm')] = { model = '350zm', price = 1835000, banned = false, name = '350Z Morimoto', trunk = 30, type = 'vip'},
	[GetHashKey('acura2f2f')] = { model = 'acura2f2f', price = 1835000, banned = false, name = 'NSX NA1', trunk = 30, type = 'vip'},
	[GetHashKey('ff4wrx')] = { model = 'ff4wrx', price = 1835000, banned = false, name = 'Impreza WRX', trunk = 30, type = 'vip'},
	[GetHashKey('fnf4r34')] = { model = 'fnf4r34', price = 1835000, banned = false, name = 'GT-R 34 FNF4', trunk = 30, type = 'vip'},
	[GetHashKey('fnfjetta')] = { model = 'fnfjetta', price = 1835000, banned = false, name = 'Jetta 3', trunk = 30, type = 'vip'},
	[GetHashKey('fnflan')] = { model = 'fnflan', price = 1835000, banned = false, name = 'Lancer Evo VIII', trunk = 30, type = 'vip'},
	[GetHashKey('fnfmits')] = { model = 'fnfmits', price = 1835000, banned = false, name = 'Eclipse GS-T', trunk = 30, type = 'vip'},
	[GetHashKey('fnfmk4')] = { model = 'fnfmk4', price = 1835000, banned = false, name = 'Supra MK4 FNF', trunk = 30, type = 'vip'},
	[GetHashKey('fnfrx7')] = { model = 'fnfrx7', price = 1835000, banned = false, name = 'RX7 Veilside', trunk = 30, type = 'vip'},
	[GetHashKey('fnfrx7dom')] = { model = 'fnfrx7dom', price = 1835000, banned = false, name = 'RX7 Toretto', trunk = 30, type = 'vip'},
	[GetHashKey('hcej1')] = { model = 'hcej1', price = 1835000, banned = false, name = 'Civic EJ1', trunk = 30, type = 'vip'},
	[GetHashKey('silvias15varietta ')] = { model = 'silvias15varietta ', price = 1835000, banned = false, name = 'S15 Monalisa', trunk = 30, type = 'vip'},
	[GetHashKey('WRs10')] = { model = 'WRs10', price = 1835000, banned = false, name = 'S10 2021', trunk = 80, type = 'vip'},
	[GetHashKey('minittrs')] = { model = 'minittrs', price = 1835000, banned = false, name = 'Audi TRS KID', trunk = 10, type = 'vip'},
	[GetHashKey('wrbmwx6civ')] = { model = 'wrbmwx6civ', price = 1835000, banned = false, name = 'wrbmwx6civ', trunk = 30, type = 'vip'},
	
	--[[FIM DOS VIP]]--
	[GetHashKey('furia')] = { model = 'furia', price = 10000000, banned = false, name = 'Furia', trunk = 50, type = 'imports' },
	[GetHashKey('italirsx')] = { model = 'italirsx', price = 10000000, banned = false, name = 'ItaliRSX', trunk = 30, type = 'outros' },
	[GetHashKey('krieger')] = { model = 'krieger', price = 4000000, banned = false, name = 'Krieger', trunk = 30, type = 'imports', },
	[GetHashKey('emerus')] = { model = 'emerus', price = 2000000, banned = false, name = 'Emerus', trunk = 30, type = 'imports' },
	[GetHashKey('zorrusso')] = { model = 'zorrusso', price = 3500000, banned = false, name = 'Zorrusso', trunk = 30, type = 'imports'  },
	[GetHashKey('thrax')] = { model = 'thrax', price = 5000000, banned = false, name = 'Thrax', trunk = 30, type = 'imports' },
	[GetHashKey('vstr')] = { model = 'vstr', price = 200000, banned = false, name = 'Vstr', trunk = 30, type = 'outros' },
	[GetHashKey('caracara2')] = { model = 'caracara2', price = 1000000, banned = false, name = 'Caracara2', trunk = 90, type = 'suvs' },
	[GetHashKey('verus')] = { model = 'verus', price = 1000000, banned = false, name = 'Verus', trunk = 50, type = 'motos' },
	[GetHashKey('hellion')] = { model = "hellion", price = 800000, banned = false, name = "Hellion", trunk = 70, type = 'suvs' },
	[GetHashKey('novak')] = { model = "novak", price = 800000, banned = false, name = "Novak", trunk = 70, type = 'suvs' },
	[GetHashKey('rebla')] = { model = 'rebla', price = 800000, banned = false, name = 'Rebla', trunk = 70, type = 'suvs' },
	[GetHashKey('paragon')] = { model = 'paragon', price = 800000, banned = false, name = 'Paragon', trunk = 30, type = 'outros' },
	[GetHashKey('jugular')] = { model = 'jugular', price = 700000, banned = false, name = 'Jugular', trunk = 30, type = 'outros' },
	[GetHashKey('komoda')] = { model = 'komoda', price = 850000, banned = false, name = 'Komoda', trunk = 30, type = 'outros' },
	[GetHashKey('drafter')] = { model = 'drafter', price = 800000, banned = false, name = 'Drafter', trunk = 30, type = 'outros' },
	[GetHashKey('pounder2')] = { model = 'pounder2', price = 800000, banned = false, name = 'pounder2', trunk = 5000, type = 'service' },
	[GetHashKey('benson')] = { model = "benson", price = 100000000, banned = false, name = "Benson", trunk = 1000, type = 'service' },
	 
	[GetHashKey('brickade')] = { model = 'brickade', price = 1000000, banned = false, name = 'Brickade', trunk = 2000, type = 'vip' },
	[GetHashKey('club')] = { model = 'club', price = 800000, banned = false, name = 'Club', trunk = 30, type = 'outros' },
	[GetHashKey('kanjo')] = { model = 'kanjo', price = 90000, banned = false, name = 'Kanjo', trunk = 30, type = 'outros'},
	[GetHashKey('issi5')] = { model = 'issi5', price = 1000000, banned = false, name = 'Issi 5', trunk = 30, type = 'outros' },
	[GetHashKey('issi4')] = { model = 'issi4', price = 1000000, banned = false,  name = 'Issi 4', trunk = 30, type = 'outros' },
	[GetHashKey('panto')] = { model = 'panto', price = 5000, banned = false, name = 'Panto', trunk = 30, type = 'outros' },
	[GetHashKey('glendale2')] = { model = 'glendale2', price = 250000, banned = false, name = 'Glendale 2', trunk = 30, type = 'sedans' },
	[GetHashKey('regina')] = { model = 'regina', price = 200000, banned = false,  name = 'Regina', trunk = 30, type = 'sedans' },
	[GetHashKey('romero')] = { model = 'romero', price = 500000, banned = false, name = 'Funerário', trunk = 30, type = 'sedans' },
	[GetHashKey('stretch')] = { model = 'stretch', price = 18350000, banned = false, name = 'Limousine', trunk = 60, type = 'sedans' },
	[GetHashKey('pbus2')] = { model = 'pbus2', price = 1000, banned = false, name = 'Bus Fest', trunk = 0, type = 'service' },
	[GetHashKey('imorgon')] = { model = 'imorgon', price = 900000, banned = false, name = 'Imorgon', trunk = 30, type = 'outros' },
	[GetHashKey('issi7')] = { model = 'issi7', price = 400000, banned = false, name = 'Issi 7', trunk = 30, type = 'outros'},
	[GetHashKey('locust')] = { model = 'locust', price = 2000000, banned = false, name = 'Ocelot', trunk = 45, type = 'outros' },
	[GetHashKey('neo')] = { model = 'neo', price = 2000000, banned = false, name = 'Neo', trunk = 30, type = 'outros' },
	[GetHashKey('penumbra2')] = { model = 'penumbra2', price = 600000, banned = false, name = 'Penumbra 2', trunk = 30, type = 'outros' },
	[GetHashKey('revolter')] = { model = 'revolter', price = 200000, banned = false, name = 'Revolter', trunk = 30, type = 'outros' },
	[GetHashKey('schafter2')] = { model = 'schafter2', price = 100000, banned = false, name = 'Schafter 2', trunk = 30, type = 'outros' },
	[GetHashKey('blista')] = { model = 'blista', price = 90000, banned = false, name = 'Blista', trunk = 40, type = 'outros'},

	[GetHashKey('sultan2')] = { model = 'sultan2', price = 500000, banned = false, name = 'Sultan 2', trunk = 30, type = 'outros' },
	[GetHashKey('dynasty')] = { model = 'dynasty', price = 200000, banned = false, name = 'Dynasty', trunk = 30, type = 'outros' },
	[GetHashKey('manana2')] = { model = 'manana2', price = 300000, banned = false, name = 'Manana 2', trunk = 30, type = 'outros' },
	[GetHashKey('peyote3')] = { model = 'peyote3', price = 300000, banned = false, name = 'Peyote 3', trunk = 30, type = 'outros' },
	[GetHashKey('retinue2')] = { model = 'retinue2', price = 300000, banned = false, name = 'Retinue 2', trunk = 30, type = 'outros' },
	[GetHashKey('savestra')] = { model = 'savestra', price = 400000, banned = false, name = 'Savestra', trunk = 30, type = 'outros' },
	-- [GetHashKey('viseris')] = { model = 'viseris', price = 600000, banned = false, name = 'Viseris', trunk = 30, type = 'outros' },
	[GetHashKey('s80')] = { model = 's80', price = 1000000, banned = false, name = 'S80', trunk = 30, type = 'imports' },
	[GetHashKey('tigon')] = { model = 'tigon', price = 2000000, banned = false, name = 'Tigon', trunk = 30, type = 'imports' },
	[GetHashKey('brioso')] = { model = 'brioso', price = 45000, banned = false, name = 'Brioso', trunk = 30, type = 'outros' },
	[GetHashKey('brioso2')] = { model = "brioso2", price = 70000, banned = false, name = "Brioso 2", trunk = 30, type = 'outros' },
	[GetHashKey('dilettante')] = { model = 'dilettante', price = 100000, banned = false, name = 'Dilettante', trunk = 30, type = 'outros' },
	[GetHashKey('primo2')] = { model = 'primo2', price = 150000, banned = false, name = 'Primo2', trunk = 60, type = 'sedans' },
	[GetHashKey('chino')] = { model = 'chino', price = 150000, banned = false, name = 'Chino', trunk = 50, type = 'outros' },
	[GetHashKey('chino2')] = { model = 'chino2', price = 600000, banned = false, name = 'Chino2', trunk = 60, type = 'outros' },
	[GetHashKey('coquette3')] = { model = 'coquette3', price = 1835000, banned = false, name = 'Coquette3', trunk = 40, type = 'outros' },
	[GetHashKey('dominator')] = { model = 'dominator', price = 200000, banned = false, name = 'Dominator', trunk = 50, type = 'outros' },
	[GetHashKey('dominator2')] = { model = 'dominator2', price = 300000, banned = false, name = 'Dominator2', trunk = 50, type = 'outros' },
	[GetHashKey('dukes')] = { model = 'dukes', price = 200000, banned = false, name = 'Dukes', trunk = 40, type = 'outros' },
	[GetHashKey('faction')] = { model = 'faction', price = 140000, banned = false, name = 'Faction', trunk = 50, type = 'outros' },
	[GetHashKey('faction2')] = { model = 'faction2', price = 500000, banned = false, name = 'Faction2', trunk = 40, type = 'outros' },
	[GetHashKey('faction3')] = { model = 'faction3', price = 500000, banned = false, name = 'Faction3', trunk = 60, type = 'outros' },
	[GetHashKey('gauntlet4')] = { model = 'gauntlet4', price = 1000000, banned = false, name = 'Gauntlet 4', trunk = 30, type = 'outros' },
	[GetHashKey('gauntlet3')] = { model = 'gauntlet3', price = 150000, banned = false, name = 'Gauntlet 3', trunk = 30, type = 'outros' },
	[GetHashKey('gauntlet2')] = { model = 'gauntlet2', price = 400000, banned = false, name = 'Gauntlet2', trunk = 40, type = 'outros' },
	[GetHashKey('hermes')] = { model = 'hermes', price = 200000, banned = false, name = 'Hermes', trunk = 50, type = 'outros' },
	[GetHashKey('hotknife')] = { model = 'hotknife', price = 500000, banned = false, name = 'Hotknife', trunk = 30, type = 'outros' },
	[GetHashKey('moonbeam')] = { model = 'moonbeam', price = 10000000, banned = false, name = 'Moonbeam', trunk = 80, type = 'outros' },
	[GetHashKey('moonbeam2')] = { model = 'moonbeam2', price = 5000000, banned = false, name = 'Moonbeam2', trunk = 70, type = 'outros' },
	[GetHashKey('nightshade')] = { model = 'nightshade', price = 450000, banned = false, name = 'Nightshade', trunk = 30, type = 'outros' },
	[GetHashKey('picador')] = { model = 'picador', price = 200000, banned = false, name = 'Picador', trunk = 90, type = 'outros' },
	[GetHashKey('ruiner')] = { model = 'ruiner', price = 100000, banned = false, name = 'Ruiner', trunk = 50, type = 'outros' },
	[GetHashKey('sabregt')] = { model = 'sabregt', price = 120000, banned = false, name = 'Sabregt', trunk = 60, type = 'outros' },
	[GetHashKey('sabregt2')] = { model = 'sabregt2', price = 150000, banned = false, name = 'Sabregt2', trunk = 60, type = 'outros' },
	[GetHashKey('gburrito')] = { model = 'gburrito', price = 1835000, banned = false, name = 'GBurrito', trunk = 100, type = 'service' },
	[GetHashKey('tokyoamarokjornal')] = { model = 'tokyoamarokjornal', price = 800000, banned = false, name = 'Amarok Jornal', trunk = 50, type = 'service' },
	[GetHashKey('slamvan')] = { model = 'slamvan', price = 800000, banned = false, name = 'Slamvan', trunk = 80, type = 'outros' },
	[GetHashKey('slamvan2')] = { model = 'slamvan2', price = 800000, banned = false, name = 'Slamvan2', trunk = 50, type = 'service' },
	[GetHashKey('slamvan3')] = { model = 'slamvan3', price = 800000, banned = false, name = 'Slamvan3', trunk = 80, type = 'outros' },
	[GetHashKey('stalion')] = { model = 'stalion', price = 400000, banned = false, name = 'Stalion', trunk = 30, type = 'outros' },
	[GetHashKey('stalion2')] = { model = 'stalion2', price = 260000, banned = false, name = 'Stalion2', trunk = 20, type = 'outros' },
	[GetHashKey('tampa')] = { model = 'tampa', price = 200000, banned = false, name = 'Tampa', trunk = 40, type = 'outros' },
	[GetHashKey('vigero')] = { model = 'vigero', price = 170000, banned = false, name = 'Vigero', trunk = 30, type = 'outros' },
	[GetHashKey('virgo')] = { model = 'virgo', price = 150000, banned = false, name = 'Virgo', trunk = 60, type = 'outros' },
	[GetHashKey('virgo2')] = { model = 'virgo2', price = 150000, banned = false, name = 'Virgo2', trunk = 50, type = 'outros' },
	[GetHashKey('virgo3')] = { model = 'virgo3', price = 150000, banned = false, name = 'Virgo3', trunk = 60, type = 'outros' },
	[GetHashKey('voodoo')] = { model = 'voodoo', price = 300000, banned = false, name = 'Voodoo', trunk = 60, type = 'outros' },
	[GetHashKey('voodoo2')] = { model = 'voodoo2', price = 100000, banned = false, name = 'Voodoo2', trunk = 60, type = 'outros' },
	[GetHashKey('yosemite')] = { model = 'yosemite', price = 800000, banned = false, name = 'Yosemite', trunk = 130, type = 'outros' },
	[GetHashKey('yosemite3')] = { model = 'yosemite3', price = 1000000, banned = false, name = 'Yosemite 3', trunk = 70, type = 'outros' },
	[GetHashKey('bfinjection')] = { model = 'bfinjection', price = 60000, banned = false, name = 'Bfinjection', trunk = 20, type = 'suvs' },
	[GetHashKey('bifta')] = { model = 'bifta', price = 800000, banned = false, name = 'Bifta', trunk = 20, type = 'suvs' },
	[GetHashKey('bodhi2')] = { model = 'bodhi2', price = 900000, banned = false, name = 'Bodhi2', trunk = 90, type = 'suvs' },
	[GetHashKey('brawler')] = { model = 'brawler', price = 4000000, banned = false, name = 'Brawler', trunk = 100, type = 'outros' },
	[GetHashKey('trophytruck')] = { model = 'trophytruck', price = 2000000, banned = false, name = 'Trophytruck', trunk = 10, type = 'suvs' },
	[GetHashKey('trophytruck2')] = { model = 'trophytruck2', price = 2000000, banned = false, name = 'Trophytruck2', trunk = 15, type = 'suvs' },
	[GetHashKey('dubsta3')] = { model = 'dubsta3', price = 5000000, banned = false, name = 'Dubsta3', trunk = 90, type = 'suvs' },
	[GetHashKey('mesa3')] = { model = 'mesa3', price = 1835000, banned = false, name = 'Mesa3', trunk = 60, type = 'suvs' },
	[GetHashKey('rancherxl')] = { model = 'rancherxl', price = 200000, banned = false, name = 'Rancherxl', trunk = 70, type = 'suvs' },
	[GetHashKey('rebel')] = { model = 'rebel', price = 2500000, banned = false, name = 'Rebel', trunk = 250, type = 'service' },
	[GetHashKey('rebel2')] = { model = 'rebel2', price = 2000000, banned = false, name = 'Rebel2', trunk = 200, type = 'suvs' },
	[GetHashKey('riata')] = { model = 'riata', price = 2500000, banned = false, name = 'Riata', trunk = 250, type = 'suvs' },
	[GetHashKey('dloader')] = { model = 'dloader', price = 150000, banned = false, name = 'Dloader', trunk = 80, type = 'outros' },
	[GetHashKey('ratloader')] = { model = 'ratloader', price = 1000000, banned = false, name = 'Caminhão', trunk = 80, type = 'service' },
	[GetHashKey('sandking')] = { model = 'sandking', price = 2500000, banned = false, name = 'Sandking', trunk = 250, type = 'suvs' },
	[GetHashKey('sandking2')] = { model = 'sandking2', price = 2500000, banned = false, name = 'Sandking2', trunk = 250, type = 'outros' },
	[GetHashKey('baller')] = { model = 'baller', price = 1000000, banned = false, name = 'Baller', trunk = 50, type = 'suvs' },
	[GetHashKey('baller2')] = { model = 'baller2', price = 1835000, banned = false, name = 'Baller2', trunk = 50, type = 'suvs' },
	[GetHashKey('baller3')] = { model = 'baller3', price = 2000000, banned = false, name = 'Baller3', trunk = 50, type = 'suvs' },
	[GetHashKey('baller4')] = { model = 'baller4', price = 2500000, banned = false, name = 'Baller4', trunk = 50, type = 'suvs' },
		-- aqui
	[GetHashKey('baller5')] = { model = 'baller5', price = 270000, banned = false, name = 'Baller5', trunk = 50, type = 'vip' },
	[GetHashKey('oppressor2')] = { model = 'oppressor2', price = 100000, banned = false, name = 'oppressor2', trunk = 30, type = 'vip' },
	
	[GetHashKey('baller6')] = { model = 'baller6', price = 280000, banned = false, name = 'Baller6', trunk = 50, type = 'suvs' },
	[GetHashKey('bjxl')] = { model = 'bjxl', price = 1000000, banned = false, name = 'Bjxl', trunk = 50, type = 'suvs' },
	[GetHashKey('cavalcade')] = { model = 'cavalcade', price = 500000, banned = false, name = 'Cavalcade', trunk = 60, type = 'suvs' },
	[GetHashKey('cavalcade2')] = { model = 'cavalcade2', price = 200000, banned = false, name = 'Cavalcade2', trunk = 60, type = 'suvs' },
	[GetHashKey('contender')] = { model = 'contender', price = 7000000, banned = false, name = 'Contender', trunk = 80, type = 'suvs' },
	[GetHashKey('dubsta')] = { model = 'dubsta', price = 1835000, banned = false, name = 'Dubsta', trunk = 70, type = 'suvs' },
	[GetHashKey('dubsta2')] = { model = 'dubsta2', price = 2000000, banned = false, name = 'Dubsta2', trunk = 70, type = 'suvs' },
	[GetHashKey('fq2')] = { model = 'fq2', price = 400000, banned = false, name = 'Fq2', trunk = 50, type = 'suvs' },
	[GetHashKey('granger')] = { model = 'granger', price = 600000, banned = false, name = 'Granger', trunk = 100, type = 'suvs' },
	[GetHashKey('gresley')] = { model = 'gresley', price = 300000, banned = false, name = 'Gresley', trunk = 50, type = 'suvs' },
	[GetHashKey('habanero')] = { model = 'habanero', price = 220000, banned = false, name = 'Habanero', trunk = 50, type = 'suvs' },
	[GetHashKey('seminole')] = { model = 'seminole', price = 230000, banned = false, name = 'Seminole', trunk = 60, type = 'suvs' },
	[GetHashKey('seminole2')] = { model = 'seminole2', price = 800000, banned = false, name = 'Seminole 2', trunk = 70, type = 'suvs' },
	[GetHashKey('serrano')] = { model = 'serrano', price = 250000, banned = false, name = 'Serrano', trunk = 50, type = 'suvs' },
	[GetHashKey('xls')] = { model = 'xls', price = 400000, banned = false, name = 'Xls', trunk = 50, type = 'suvs' },
	[GetHashKey('xls2')] = { model = 'xls2', price = 350000, banned = false, name = 'Xls2', trunk = 50, type = 'outros' },
	[GetHashKey('asea')] = { model = 'asea', price = 100000, banned = false, name = 'Asea', trunk = 30, type = 'sedans' },
	[GetHashKey('asterope')] = { model = 'asterope', price = 150000, banned = false, name = 'Asterope', trunk = 30, type = 'sedans' },
	[GetHashKey('cog55')] = { model = 'cog55', price = 200000, banned = false, name = 'Cog55', trunk = 50, type = 'sedans' },
	[GetHashKey('cog552')] = { model = 'cog552', price = 200000, banned = false, name = 'Cog552', trunk = 50, type = 'outros' },
	[GetHashKey('cognoscenti')] = { model = 'cognoscenti', price = 190000, banned = false, name = 'Cognoscenti', trunk = 50, type = 'outros' },
	[GetHashKey('cognoscenti2')] = { model = 'cognoscenti2', price = 200000, banned = false, name = 'Cognoscenti2', trunk = 50, type = 'outros' },
	[GetHashKey('stanier')] = { model = 'stanier', price = 130000, banned = false, name = 'Stanier', trunk = 60, type = 'sedans' },
	[GetHashKey('stratum')] = { model = 'stratum', price = 100000, banned = false, name = 'Stratum', trunk = 70, type = 'sedans' },
	[GetHashKey('importsd')] = { model = 'importsd', price = 150000, banned = false, name = 'importsd', trunk = 30, type = 'sedans' },
	[GetHashKey('surge')] = { model = 'surge', price = 220000, banned = false, name = 'Surge', trunk = 60, type = 'sedans' },
	[GetHashKey('tailgater')] = { model = 'tailgater', price = 160000, banned = false, name = 'Tailgater', trunk = 50, type = 'sedans' },
	[GetHashKey('warrener')] = { model = 'warrener', price = 100000, banned = false, name = 'Warrener', trunk = 40, type = 'sedans' },
	[GetHashKey('washington')] = { model = 'washington', price = 150000, banned = false, name = 'Washington', trunk = 60, type = 'sedans' },
	[GetHashKey('alpha')] = { model = 'alpha', price = 200000, banned = false, name = 'Alpha', trunk = 40, type = 'outros' },
	[GetHashKey('banshee')] = { model = 'banshee', price = 300000, banned = false, name = 'Banshee', trunk = 30, type = 'outros' },
	[GetHashKey('bestiagts')] = { model = 'bestiagts', price = 400000, banned = false, name = 'Bestiagts', trunk = 60, type = 'outros' },
	[GetHashKey('blista2')] = { model = 'blista2', price = 100000, banned = false, name = 'Blista2', trunk = 40, type = 'outros' },
	[GetHashKey('blista3')] = { model = 'blista3', price = 200000, banned = false, name = 'Blista3', trunk = 40, type = 'outros' },
	[GetHashKey('buffalo')] = { model = 'buffalo', price = 450000, banned = false, name = 'Buffalo', trunk = 50, type = 'outros' },
	[GetHashKey('buffalo2')] = { model = 'buffalo2', price = 450000, banned = false, name = 'Buffalo2', trunk = 30, type = 'outros' },
	[GetHashKey('buffalo3')] = { model = 'buffalo3', price = 400000, banned = false, name = 'Buffalo3', trunk = 50, type = 'outros' },
	[GetHashKey('carbonizzare')] = { model = 'carbonizzare', price = 1835000, banned = false, name = 'Carbonizzare', trunk = 30, type = 'outros' },
	[GetHashKey('comet2')] = { model = 'comet2', price = 400000, banned = false, name = 'Comet2', trunk = 40, type = 'outros' },
	[GetHashKey('comet3')] = { model = 'comet3', price = 500000, banned = false, name = 'Comet3', trunk = 40, type = 'outros' },
	[GetHashKey('comet5')] = { model = 'comet5', price = 1250000, banned = false, name = 'Comet5', trunk = 40, type = 'outros' },
	[GetHashKey('coquette')] = { model = 'coquette', price = 500000, banned = false, name = 'Coquette', trunk = 30, type = 'outros' },
	[GetHashKey('coquette4')] = { model = 'coquette4', price = 8000000, banned = false, name = 'Coquette 4', trunk = 130, type = 'outros' },
	[GetHashKey('elegy')] = { model = 'elegy', price = 500000, banned = false, name = 'Elegy', trunk = 30, type = 'outros' },
	[GetHashKey('elegy2')] = { model = 'elegy2', price = 400000, banned = false, name = 'Elegy2', trunk = 30, type = 'outros' },
	[GetHashKey('feltzer2')] = { model = 'feltzer2', price = 200000, banned = false, name = 'Feltzer2', trunk = 40, type = 'outros' },
	[GetHashKey('furoregt')] = { model = 'furoregt', price = 200000, banned = false, name = 'Furoregt', trunk = 30, type = 'outros' },
	[GetHashKey('fusilade')] = { model = 'fusilade', price = 200000, banned = false, name = 'Fusilade', trunk = 40, type = 'outros' },
	[GetHashKey('futo')] = { model = 'futo', price = 150000, banned = false, name = 'Futo', trunk = 40, type = 'outros' },
	[GetHashKey('jester')] = { model = 'jester', price = 5000000, banned = false, name = 'Jester', trunk = 30, type = 'outros' },
	[GetHashKey('khamelion')] = { model = 'khamelion', price = 1000000, banned = false, name = 'Khamelion', trunk = 50, type = 'outros' },
	[GetHashKey('kuruma2')] = { model = "kuruma2", price = 3000000, banned = false, name = 'Kuruma 2', trunk = 30, type = 'vip' },
	[GetHashKey('kuruma')] = { model = 'kuruma', price = 750000, banned = false, name = 'Kuruma', trunk = 40, type = 'outros' },

	[GetHashKey('armored18velar')] = { model = "armored18velar", price = 3000000, banned = false, name = 'Velar Blindada', trunk = 80, type = 'vip' },
	[GetHashKey('armoredx7m60i')] = { model = "armoredx7m60i", price = 3000000, banned = false, name = 'X7 2024 Blindada', trunk = 80, type = 'vip' },
	[GetHashKey('10r24nbrt')] = { model = "10r24nbrt", price = 3000000, banned = false, name = 'ZX10-R KRT Edition', trunk = 20, type = 'vip' },

	[GetHashKey('wri8e')] = { model = "wri8e", price = 3000000, banned = false, name = 'I8E 2021', trunk = 40, type = 'vip' },
	[GetHashKey('wrlwcla45')] = { model = "wrlwcla45", price = 3000000, banned = false, name = 'A45 LW', trunk = 40, type = 'vip' },
	[GetHashKey('22macgt')] = { model = "22macgt", price = 3000000, banned = false, name = 'Mustang Mach-E', trunk = 40, type = 'vip' },
	[GetHashKey('er34n')] = { model = "er34n", price = 3000000, banned = false, name = 'ER34 (Skyline 4 Portas)', trunk = 40, type = 'vip' },
	[GetHashKey('s15lbwk')] = { model = "s15lbwk", price = 3000000, banned = false, name = 'S15 LW', trunk = 40, type = 'vip' },
	[GetHashKey('ram226x6')] = { model = "ram226x6", price = 3000000, banned = false, name = 'RAM TRX 6X6', trunk = 40, type = 'vip' },
	[GetHashKey('etrongt22')] = { model = "etrongt22", price = 3000000, banned = false, name = 'Audi E-TRON', trunk = 40, type = 'vip' },
	[GetHashKey('23s63l')] = { model = "23s63l", price = 3000000, banned = false, name = 'S63 Luxury', trunk = 40, type = 'vip' },
	[GetHashKey('xplaid24c')] = { model = "xplaid24c", price = 3000000, banned = false, name = 'Tesla Model X', trunk = 40, type = 'vip' },
	[GetHashKey('noire19wb')] = { model = "noire19wb", price = 2000000, banned = false, name = 'Bugatti La Voiture Noire', trunk = 40, type = 'vip' },
	[GetHashKey('x7m60i')] = { model = "x7m60i", price = 3000000, banned = false, name = 'BMW X7 2024', trunk = 40, type = 'vip' },
	[GetHashKey('m3g80c')] = { model = "m3g80c", price = 3000000, banned = false, name = 'BMW M3 G80 Competition', trunk = 40, type = 'vip' },
	[GetHashKey('lexuslfa')] = { model = "lexuslfa", price = 3000000, banned = false, name = 'Lexus LFA', trunk = 40, type = 'vip' },
	[GetHashKey('wrxt660civ')] = { model = "wrxt660civ", price = 3000000, banned = false, name = 'XT 660 Nova', trunk = 15, type = 'vip' },
	[GetHashKey('wrtiger1200')] = { model = "wrtiger1200", price = 3000000, banned = false, name = 'Tiger 1200', trunk = 15, type = 'vip' },


	[GetHashKey('massacro')] = { model = 'massacro', price = 750000, banned = false, name = 'Massacro', trunk = 40, type = 'outros' },
	[GetHashKey('massacro2')] = { model = 'massacro2', price = 1000000, banned = false, name = 'Massacro2', trunk = 40, type = 'outros' },
	[GetHashKey('ninef')] = { model = 'ninef', price = 950000, banned = false, name = 'Ninef', trunk = 40, type = 'outros' },
	[GetHashKey('ninef2')] = { model = 'ninef2', price = 950000, banned = false, name = 'Ninef2', trunk = 40, type = 'outros' },
	[GetHashKey('omnis')] = { model = 'omnis', price = 200000, banned = false, name = 'Omnis', trunk = 20, type = 'outros' },
	[GetHashKey('pariah')] = { model = 'pariah', price = 950000, banned = false, name = 'Pariah', trunk = 30, type = 'outros' },
	[GetHashKey('penumbra')] = { model = 'penumbra', price = 800000, banned = false, name = 'Penumbra', trunk = 40, type = 'outros' },
	[GetHashKey('raiden')] = { model = 'raiden', price = 850000, banned = false, name = 'Raiden', trunk = 50, type = 'outros' },
	[GetHashKey('rapidgt')] = { model = 'rapidgt', price = 800000, banned = false, name = 'Rapidgt', trunk = 20, type = 'outros' },
	[GetHashKey('rapidgt2')] = { model = 'rapidgt2', price = 1000000, banned = false, name = 'Rapidgt2', trunk = 20, type = 'outros' },
	[GetHashKey('ruston')] = { model = 'ruston', price = 3000000, banned = false, name = 'Ruston', trunk = 30, type = 'outros' },
	[GetHashKey('schafter3')] = { model = 'schafter3', price = 300000, banned = false, name = 'Schafter3', trunk = 50, type = 'outros' },
	[GetHashKey('schafter4')] = { model = 'schafter4', price = 250000, banned = false, name = 'Schafter4', trunk = 30, type = 'outros' },
	[GetHashKey('schafter5')] = { model = 'schafter5', price = 175000, banned = false, name = 'Schafter5', trunk = 50, type = 'outros' },
	[GetHashKey('schwarzer')] = { model = 'schwarzer', price = 250000, banned = false, name = 'Schwarzer', trunk = 50, type = 'outros' },
	[GetHashKey('sentinel3')] = { model = 'sentinel3', price = 350000, banned = false, name = 'Sentinel3', trunk = 30, type = 'outros' },
	[GetHashKey('seven70')] = { model = 'seven70', price = 1000000, banned = false, name = 'Seven70', trunk = 20, type = 'outros' },
	[GetHashKey('specter')] = { model = 'specter', price = 2000000, banned = false, name = 'Specter', trunk = 20, type = 'outros' },
	[GetHashKey('specter2')] = { model = 'specter2', price = 900000, banned = false, name = 'Specter2', trunk = 20, type = 'outros' },
	[GetHashKey('streiter')] = { model = 'streiter', price = 600000, banned = false, name = 'Streiter', trunk = 70, type = 'outros' },
	[GetHashKey('sultan')] = { model = 'sultan', price = 800000, banned = false, name = 'Sultan', trunk = 50, type = 'outros' },
	[GetHashKey('surano')] = { model = 'surano', price = 1835000, banned = false, name = 'Surano', trunk = 30, type = 'outros' },
	[GetHashKey('tampa2')] = { model = 'tampa2', price = 300000, banned = false, name = 'Tampa2', trunk = 20, type = 'outros' },
	[GetHashKey('tropos')] = { model = 'tropos', price = 450000, banned = false, name = 'Tropos', trunk = 20, type = 'outros' },
	[GetHashKey('verlierer2')] = { model = 'verlierer2', price = 350000, banned = false, name = 'Verlierer2', trunk = 20, type = 'outros' },
	[GetHashKey('btype')] = { model = 'btype', price = 1000000, banned = false, name = 'Btype', trunk = 40, type = 'outros' },
	[GetHashKey('btype2')] = { model = 'btype2', price = 1835000, banned = false, name = 'Btype2', trunk = 20, type = 'outros' },
	[GetHashKey('btype3')] = { model = 'btype3', price = 1000000, banned = false, name = 'Btype3', trunk = 40, type = 'outros' },
	[GetHashKey('casco')] = { model = 'casco', price = 500000, banned = false, name = 'Casco', trunk = 50, type = 'outros' },
	[GetHashKey('cheetah')] = { model = 'cheetah', price = 1000000, banned = false, name = 'Cheetah', trunk = 20, type = 'imports' },
	[GetHashKey('coquette2')] = { model = 'coquette2', price = 400000, banned = false, name = 'Coquette2', trunk = 40, type = 'outros' },
	[GetHashKey('feltzer3')] = { model = 'feltzer3', price = 390000, banned = false, name = 'Feltzer3', trunk = 40, type = 'outros' },
	[GetHashKey('gt500')] = { model = 'gt500', price = 600000, banned = false, name = 'GT500', trunk = 40, type = 'outros' },
	[GetHashKey('infernus2')] = { model = 'infernus2', price = 1000000, banned = false, name = 'Infernus2', trunk = 20, type = 'outros' },
	[GetHashKey('jb700')] = { model = 'jb700', price = 250000, banned = false, name = 'Jb700', trunk = 30, type = 'outros' },
	[GetHashKey('mamba')] = { model = 'mamba', price = 400000, banned = false, name = 'Mamba', trunk = 50, type = 'outros' },
	[GetHashKey('manana')] = { model = 'manana', price = 75000, banned = false, name = 'Manana', trunk = 60, type = 'outros' },
	[GetHashKey('monroe')] = { model = 'monroe', price = 400000, banned = false, name = 'Monroe', trunk = 20, type = 'outros' },
	[GetHashKey('peyote')] = { model = 'peyote', price = 80000, banned = false, name = 'Peyote', trunk = 50, type = 'outros' },
	[GetHashKey('pigalle')] = { model = 'pigalle', price = 80000, banned = false, name = 'Pigalle', trunk = 60, type = 'outros' },
	[GetHashKey('rapidgt3')] = { model = 'rapidgt3', price = 650000, banned = false, name = 'Rapidgt3', trunk = 40, type = 'outros' },
	[GetHashKey('retinue')] = { model = 'retinue', price = 200000, banned = false, name = 'Retinue', trunk = 40, type = 'outros' },
	[GetHashKey('stinger')] = { model = 'stinger', price = 450000, banned = false, name = 'Stinger', trunk = 20, type = 'outros' },
	[GetHashKey('stingergt')] = { model = 'stingergt', price = 400000, banned = false, name = 'Stingergt', trunk = 20, type = 'outros' },
	[GetHashKey('torero')] = { model = 'torero', price = 300000, banned = false, name = 'Torero', trunk = 30, type = 'outros' },
	[GetHashKey('tornado')] = { model = 'tornado', price = 100000, banned = false, name = 'Tornado', trunk = 70, type = 'outros' },
	[GetHashKey('tornado2')] = { model = 'tornado2', price = 300000, banned = false, name = 'Tornado2', trunk = 60, type = 'outros' },
	[GetHashKey('tornado5')] = { model = 'tornado5', price = 500000, banned = false, name = 'Tornado5', trunk = 60, type = 'outros' },
	[GetHashKey('tornado6')] = { model = 'tornado6', price = 800000, banned = false, name = 'Tornado6', trunk = 50, type = 'outros' },
	[GetHashKey('turismo2')] = { model = 'turismo2', price = 1000000, banned = false, name = 'Turismo2', trunk = 30, type = 'outros' },
	[GetHashKey('ztype')] = { model = 'ztype', price = 1000000, banned = false, name = 'Ztype', trunk = 20, type = 'outros' },
	[GetHashKey('adder')] = { model = 'adder', price = 700000, banned = false, name = 'Adder', trunk = 20, type = 'outros' },
	[GetHashKey('autarch')] = { model = 'autarch', price = 3000000, banned = false, name = 'Autarch', trunk = 20, type = 'imports' },
	[GetHashKey('banshee2')] = { model = 'banshee2', price = 700000, banned = false, name = 'Banshee2', trunk = 20, type = 'imports' },
	[GetHashKey('bullet')] = { model = 'bullet', price = 800000, banned = false, name = 'Bullet', trunk = 20, type = 'imports' },
	[GetHashKey('cheetah2')] = { model = 'cheetah2', price = 1000000, banned = false, name = 'Cheetah2', trunk = 20, type = 'outros' },
	[GetHashKey('entityxf')] = { model = 'entityxf', price = 1835000, banned = false, name = 'Entityxf', trunk = 20, type = 'imports' },
	[GetHashKey('fmj')] = { model = 'fmj', price = 1200000, banned = false, name = 'Fmj', trunk = 20, type = 'imports' },
	[GetHashKey('gp1')] = { model = 'gp1', price = 2000000, banned = false, name = 'Gp1', trunk = 20, type = 'imports' },
	[GetHashKey('infernus')] = { model = 'infernus', price = 700000, banned = false, name = 'Infernus', trunk = 20, type = 'imports' },
	[GetHashKey('nero')] = { model = 'nero', price = 4500000, banned = false, name = 'Nero', trunk = 20, type = 'imports' },
	[GetHashKey('nero2')] = { model = 'nero2', price = 3000000, banned = false, name = 'Nero2', trunk = 20, type = 'imports' },
	[GetHashKey('osiris')] = { model = 'osiris', price = 4000000, banned = false, name = 'Osiris', trunk = 20, type = 'imports' },
	[GetHashKey('penetrator')] = { model = 'penetrator', price = 1200000, banned = false, name = 'Penetrator', trunk = 20, type = 'imports' },
	[GetHashKey('pfister811')] = { model = 'pfister811', price = 2000000, banned = false, name = 'Pfister811', trunk = 20, type = 'imports' },
	[GetHashKey('reaper')] = { model = 'reaper', price = 2500000, banned = false, name = 'Reaper', trunk = 20, type = 'imports' },
	[GetHashKey('sc1')] = { model = 'sc1', price = 2500000, banned = false, name = 'Sc1', trunk = 20, type = 'imports' },
	[GetHashKey('sultanrs')] = { model = 'sultanrs', price = 2000000, banned = false, name = 'Sultan RS', trunk = 30, type = 'imports' },
	[GetHashKey('t20')] = { model = 't20', price = 2500000, banned = false, name = 'T20', trunk = 20, type = 'imports' },
	[GetHashKey('tempesta')] = { model = 'tempesta', price = 4000000, banned = false, name = 'Tempesta', trunk = 20, type = 'imports' },
	[GetHashKey('turismor')] = { model = 'turismor', price = 5000000, banned = false, name = 'Turismor', trunk = 20, type = 'imports' },
	[GetHashKey('tyrus')] = { model = 'tyrus', price = 1200000, banned = false, name = 'Tyrus', trunk = 20, type = 'imports' },
	[GetHashKey('vacca')] = { model = 'vacca', price = 1000000, banned = false, name = 'Vacca', trunk = 30, type = 'imports' },
	[GetHashKey('visione')] = { model = 'visione', price = 10000000, banned = false, name = 'Visione', trunk = 20, type = 'imports' },
	[GetHashKey('voltic')] = { model = 'voltic', price = 800000, banned = false, name = 'Voltic', trunk = 20, type = 'imports' },
	[GetHashKey('zentorno')] = { model = 'zentorno', price = 10000000, banned = false, name = 'Zentorno', trunk = 20, type = 'imports' },
	[GetHashKey('sadler')] = { model = 'sadler', price = 1835000, banned = false, name = 'Sadler', trunk = 70, type = 'utility' },
	[GetHashKey('bison')] = { model = 'bison', price = 1000000, banned = false, name = 'Bison', trunk = 70, type = 'outros' },
	[GetHashKey('bison2')] = { model = 'bison2', price = 1000000, banned = false, name = 'Bison2', trunk = 70, type = 'outros' },
	[GetHashKey('bobcatxl')] = { model = 'bobcatxl', price = 650000, banned = false, name = 'Bobcatxl', trunk = 100, type = 'outros' },
	[GetHashKey('burrito')] = { model = 'burrito', price = 2000000, banned = false, name = 'Burrito', trunk = 200, type = 'outros' },
	[GetHashKey('burrito2')] = { model = 'burrito2', price = 6000000, banned = false, name = 'Burrito2', trunk = 300, type = 'outros' },
	[GetHashKey('burrito3')] = { model = 'burrito3', price = 8000000, banned = false, name = 'Burrito3', trunk = 400, type = 'outros' },
	[GetHashKey('burrito4')] = { model = 'burrito4', price = 10000000, banned = false, name = 'Burrito4', trunk = 500, type = 'outros' },
	[GetHashKey('minivan')] = { model = 'minivan', price = 800000, banned = false, name = 'Minivan', trunk = 70, type = 'outros' },
	[GetHashKey('minivan2')] = { model = 'minivan2', price = 5000000, banned = false, name = 'Minivan2', trunk = 60, type = 'outros' },
	[GetHashKey('paradise')] = { model = 'paradise', price = 1000000, banned = false, name = 'Paradise', trunk = 120, type = 'outros' },
	[GetHashKey('pony')] = { model = 'pony', price = 160000, banned = false, name = 'Pony', trunk = 120, type = 'outros' },
	[GetHashKey('pony2')] = { model = 'pony2', price = 2000000, banned = false, name = 'Pony2', trunk = 120, type = 'outros' },
	[GetHashKey('rumpo')] = { model = 'rumpo', price = 1000000, banned = false, name = 'Rumpo', trunk = 120, type = 'outros' },
	[GetHashKey('rumpo2')] = { model = 'rumpo2', price = 160000, banned = false, name = 'Rumpo2', trunk = 120, type = 'outros' },
	[GetHashKey('rumpo3')] = { model = 'rumpo3', price = 2000000, banned = false, name = 'Rumpo3', trunk = 120, type = 'vip' },
	[GetHashKey('speedo')] = { model = 'speedo', price = 500000, banned = false, name = 'Speedo', trunk = 120, type = 'service' },
	[GetHashKey('surfer')] = { model = 'surfer', price = 500000, banned = false, name = 'Surfer', trunk = 120, type = 'outros' },
	[GetHashKey('youga')] = { model = 'youga', price = 1835000, banned = false, name = 'Youga', trunk = 250, type = 'outros' },
	[GetHashKey('youga2')] = { model = 'youga2', price = 750000, banned = false, name = 'Youga2', trunk = 80, type = 'service' },
	[GetHashKey('youga3')] = { model = 'youga3', price = 750000, banned = false, name = 'Youga3', trunk = 250, type = 'service' },
	[GetHashKey('tractor2')] = { model = 'tractor2', price = 160000, banned = false, name = 'Tractor2', trunk = 80, type = 'service' },
	[GetHashKey('huntley')] = { model = 'huntley', price = 400000, banned = false, name = 'Huntley', trunk = 60, type = 'suvs' },
	[GetHashKey('landstalker')] = { model = 'landstalker', price = 600000, banned = false, name = 'Landstalker', trunk = 70, type = 'suvs' },
	[GetHashKey('landstalker2')] = { model = 'landstalker2', price = 800000, banned = false, name = 'Landstalker 2', trunk = 70, type = 'suvs' },
	[GetHashKey('mesa')] = { model = 'mesa', price = 400000, banned = false, name = 'Mesa', trunk = 50, type = 'suvs' },
	[GetHashKey('patriot')] = { model = 'patriot', price = 800000, banned = false, name = 'Patriot', trunk = 70, type = 'suvs' },
	[GetHashKey('radi')] = { model = 'radi', price = 300000, banned = false, name = 'Radi', trunk = 50, type = 'suvs' },
	[GetHashKey('rocoto')] = { model = 'rocoto', price = 110000, banned = false, name = 'Rocoto', trunk = 60, type = 'suvs' },
	[GetHashKey('tyrant')] = { model = 'tyrant', price = 5000000, banned = false, name = 'Tyrant', trunk = 30, type = 'imports' },
	[GetHashKey('entity2')] = { model = 'entity2', price = 1835000, banned = false, name = 'Entity2', trunk = 20, type = 'imports' },
	[GetHashKey('cheburek')] = { model = 'cheburek', price = 230000, banned = false, name = 'Cheburek', trunk = 50, type = 'outros' },
	[GetHashKey('hotring')] = { model = 'hotring', price = 500000, banned = false, name = 'Hotring', trunk = 60, type = 'outros' },
	[GetHashKey('jester2')] = { model = "jester2", price = 1000000, banned = false, name = 'Jester 2', trunk = 30, type = 'imports'},
	[GetHashKey('jester3')] = { model = 'jester3', price = 1000000, banned = false, name = 'Jester3', trunk = 30, type = 'outros' },
	[GetHashKey('flashgt')] = { model = 'flashgt', price = 700000, banned = false, name = 'Flashgt', trunk = 30, type = 'outros' },
	[GetHashKey('ellie')] = { model = 'ellie', price = 400000, banned = false, name = 'Ellie', trunk = 50, type = 'outros' },
	[GetHashKey('michelli')] = { model = 'michelli', price = 200000, banned = false, name = 'Michelli', trunk = 40, type = 'outros' },
	[GetHashKey('fagaloa')] = { model = 'fagaloa', price = 100000, banned = false, name = 'Fagaloa', trunk = 80, type = 'outros' },
	[GetHashKey('dominator3')] = { model = 'dominator3', price = 400000, banned = false, name = 'Dominator3', trunk = 30, type = 'outros' },
	[GetHashKey('issi3')] = { model = 'issi3', price = 100000, banned = false, name = 'Issi3', trunk = 20, type = 'outros' },
	[GetHashKey('taipan')] = { model = 'taipan', price = 2000000, banned = false, name = 'Taipan', trunk = 20, type = 'imports' },
	[GetHashKey('gb200')] = { model = 'gb200', price = 500000, banned = false, name = 'Gb200', trunk = 20, type = 'outros' },
	[GetHashKey('guardian')] = { model = 'guardian', price = 5000000, banned = false, name = 'Guardian', trunk = 150, type = 'industrial' },
	[GetHashKey('kamacho')] = { model = 'kamacho', price = 1835000, banned = false, name = 'Kamacho', trunk = 90, type = 'suvs' },
	[GetHashKey('neon')] = { model = 'neon', price = 2000000, banned = false, name = 'Neon', trunk = 30, type = 'outros' },
	[GetHashKey('cyclone')] = { model = 'cyclone', price = 1000000, banned = false, name = 'Cyclone', trunk = 20, type = 'imports' },
	[GetHashKey('italigtb')] = { model = 'italigtb', price = 1000000, banned = false, name = 'Italigtb', trunk = 20, type = 'imports' },
	[GetHashKey('italigtb2')] = { model = 'italigtb2', price = 1835000, banned = false, name = 'Italigtb2', trunk = 20, type = 'imports' },
	[GetHashKey('vagner')] = { model = 'vagner', price = 2000000, banned = false, name = 'Vagner', trunk = 20, type = 'imports' },
	[GetHashKey('xa21')] = { model = 'xa21', price = 10000000, banned = false, name = 'Xa21', trunk = 20, type = 'imports' },
	[GetHashKey('tezeract')] = { model = 'tezeract', price = 7000000, banned = false, name = 'Tezeract', trunk = 20, type = 'outros' },
	[GetHashKey('prototipo')] = { model = 'prototipo', price = 10000000, banned = false, name = 'Prototipo', trunk = 20, type = 'imports' },
	[GetHashKey('patriot2')] = { model = 'patriot2', price = 5000000, banned = false, name = 'Patriot2', trunk = 60, type = 'suvs' },
	[GetHashKey('stafford')] = { model = 'stafford', price = 200000, banned = false, name = 'Stafford', trunk = 40, type = 'sedans' },
	[GetHashKey('swinger')] = { model = 'swinger', price = 550000, banned = false, name = 'Swinger', trunk = 20, type = 'outros' },
	[GetHashKey('clique')] = { model = 'clique', price = 200000, banned = false, name = 'Clique', trunk = 40, type = 'outros' },
	[GetHashKey('deveste')] = { model = 'deveste', price = 2000000, banned = false, name = 'Deveste', trunk = 20, type = 'outros' },
	[GetHashKey('deviant')] = { model = 'deviant', price = 1000000, banned = false, name = 'Deviant', trunk = 50, type = 'outros' },
	[GetHashKey('impaler')] = { model = 'impaler', price = 1300000, banned = false, name = 'Impaler', trunk = 60, type = 'outros' },
	[GetHashKey('italigto')] = { model = 'italigto', price = 5000000, banned = false, name = 'Italigto', trunk = 30, type = 'outros' },
	[GetHashKey('schlagen')] = { model = 'schlagen', price = 500000, banned = false, name = 'Schlagen', trunk = 30, type = 'outros' },
	[GetHashKey('toros')] = { model = 'toros', price = 5000000, banned = false, name = 'Toros', trunk = 50, type = 'suvs' },
	[GetHashKey('tulip')] = { model = 'tulip', price = 850000, banned = false, name = 'Tulip', trunk = 60, type = 'outros' },
	[GetHashKey('vamos')] = { model = 'vamos', price = 900000, banned = false, name = 'Vamos', trunk = 60, type = 'outros' },
	[GetHashKey('freecrawler')] = { model = 'freecrawler', price = 900000, banned = false, name = 'Freecrawler', trunk = 350, type = 'suvs' },
	[GetHashKey('fugitive')] = { model = 'fugitive', price = 190000, banned = false, name = 'Fugitive', trunk = 30, type = 'sedans' },
	[GetHashKey('le7b')] = { model = 'le7b', price = 3000000, banned = false, name = 'Le7b', trunk = 20, type = 'imports' },
	[GetHashKey('lurcher')] = { model = 'lurcher', price = 200000, banned = false, name = 'Lurcher', trunk = 60, type = 'outros' },
	[GetHashKey('lynx')] = { model = 'lynx', price = 800000, banned = false, name = 'Lynx', trunk = 30, type = 'outros' },
	[GetHashKey('raptor')] = { model = 'raptor', price = 1000000, banned = false, name = 'Raptor', trunk = 20, type = 'outros' },
	[GetHashKey('sheava')] = { model = 'sheava', price = 4000000, banned = false, name = 'Sheava', trunk = 20, type = 'imports' },
	[GetHashKey('z190')] = { model = 'z190', price = 400000, banned = false, name = 'Z190', trunk = 40, type = 'outros' },
	[GetHashKey('akuma')] = { model = 'akuma', price = 2000000, banned = false, name = 'Akuma', trunk = 15, type = 'motos' },
	[GetHashKey('avarus')] = { model = 'avarus', price = 200000, banned = false, name = 'Avarus', trunk = 15, type = 'motos' },
	[GetHashKey('bagger')] = { model = 'bagger', price = 200000, banned = false, name = 'Bagger', trunk = 40, type = 'motos' },
	[GetHashKey('bati')] = { model = 'bati', price = 1000000, banned = false, name = 'Bati', trunk = 15, type = 'motos' },
	[GetHashKey('bati2')] = { model = 'bati2', price = 800000, banned = false, name = 'Bati2', trunk = 15, type = 'motos' },
	[GetHashKey('bf400')] = { model = 'bf400', price = 1000000, banned = false, name = 'Bf400', trunk = 15, type = 'motos' },
	[GetHashKey('carbonrs')] = { model = 'carbonrs', price = 800000, banned = false, name = 'Carbonrs', trunk = 15, type = 'motos' },
	[GetHashKey('chimera')] = { model = 'chimera', price = 400000, banned = false, name = 'Chimera', trunk = 15, type = 'motos' },
	[GetHashKey('cliffhanger')] = { model = 'cliffhanger', price = 250000, banned = false, name = 'Cliffhanger', trunk = 15, type = 'motos' },
	[GetHashKey('daemon')] = { model = 'daemon', price = 200000, banned = false, name = 'Daemon', trunk = 15, type = 'motos' },
	[GetHashKey('daemon2')] = { model = 'daemon2', price = 200000, banned = false, name = 'Daemon2', trunk = 15, type = 'motos' },
	[GetHashKey('defiler')] = { model = 'defiler', price = 700000, banned = false, name = 'Defiler', trunk = 15, type = 'motos' },
	[GetHashKey('diablous')] = { model = 'diablous', price = 500000, banned = false, name = 'Diablous', trunk = 15, type = 'motos' },
	[GetHashKey('diablous2')] = { model = 'diablous2', price = 700000, banned = false, name = 'Diablous2', trunk = 15, type = 'motos' },
	[GetHashKey('double')] = { model = 'double', price = 800000, banned = false, name = 'Double', trunk = 15, type = 'motos' },
	[GetHashKey('enduro')] = { model = 'enduro', price = 400000, banned = false, name = 'Enduro', trunk = 15, type = 'motos' },
	[GetHashKey('esskey')] = { model = 'esskey', price = 400000, banned = false, name = 'Esskey', trunk = 15, type = 'motos' },
	[GetHashKey('faggio')] = { model = 'faggio', price = 4000, banned = false, name = 'Faggio', trunk = 30, type = 'motos' },
	[GetHashKey('faggio2')] = { model = 'faggio2', price = 5000, banned = false, name = 'Faggio2', trunk = 30, type = 'motos' },
	[GetHashKey('faggio3')] = { model = 'faggio3', price = 5000, banned = false, name = 'Faggio3', trunk = 30, type = 'motos' },
	[GetHashKey('fcr')] = { model = 'fcr', price = 300000, banned = false, name = 'Fcr', trunk = 15, type = 'motos' },
	[GetHashKey('fcr2')] = { model = 'fcr2', price = 400000, banned = false, name = 'Fcr2', trunk = 15, type = 'motos' },
	[GetHashKey('gargoyle')] = { model = 'gargoyle', price = 450000, banned = false, name = 'Gargoyle', trunk = 15, type = 'motos' },
	[GetHashKey('hakuchou')] = { model = 'hakuchou', price = 3000000, banned = false, name = 'Hakuchou', trunk = 15, type = 'motos' },
	[GetHashKey('hakuchou2')] = { model = 'hakuchou2', price = 1000000, banned = false, name = 'Hakuchou2', trunk = 15, type = 'motos' },
	[GetHashKey('hexer')] = { model = 'hexer', price = 200000, banned = false, name = 'Hexer', trunk = 15, type = 'motos' },
	[GetHashKey('innovation')] = { model = 'innovation', price = 200000, banned = false, name = 'Innovation', trunk = 15, type = 'motos' },
	[GetHashKey('lectro')] = { model = 'lectro', price = 200000, banned = false, name = 'Lectro', trunk = 15, type = 'motos' },
	[GetHashKey('manchez')] = { model = 'manchez', price = 800000, banned = false, name = 'Manchez', trunk = 15, type = 'motos' },
	[GetHashKey('nemesis')] = { model = 'nemesis', price = 250000, banned = false, name = 'Nemesis', trunk = 15, type = 'motos' },
	[GetHashKey('nightblade')] = { model = 'nightblade', price = 800000, banned = false, name = 'Nightblade', trunk = 15, type = 'outros' },
	[GetHashKey('pcj')] = { model = 'pcj', price = 300000, banned = false, name = 'Pcj', trunk = 15, type = 'motos' },
	[GetHashKey('ruffian')] = { model = 'ruffian', price = 450000, banned = false, name = 'Ruffian', trunk = 15, type = 'motos' },
	[GetHashKey('sanchez')] = { model = 'sanchez', price = 400000, banned = false, name = 'Sanchez', trunk = 15, type = 'motos' },
	[GetHashKey('sanchez2')] = { model = 'sanchez2', price = 500000, banned = false, name = 'Sanchez2', trunk = 15, type = 'motos' },
	[GetHashKey('sanctus')] = { model = 'sanctus', price = 400000, banned = false, name = 'Sanctus', trunk = 15, type = 'motos' },
	[GetHashKey('sovereign')] = { model = 'sovereign', price = 1835000, banned = false, name = 'Sovereign', trunk = 50, type = 'motos' },
	[GetHashKey('thrust')] = { model = 'thrust', price = 650000, banned = false, name = 'Thrust', trunk = 15, type = 'motos' },
	[GetHashKey('vader')] = { model = 'vader', price = 400000, banned = false, name = 'Vader', trunk = 15, type = 'motos' },
	[GetHashKey('vindicator')] = { model = 'vindicator', price = 1000000, banned = false, name = 'Vindicator', trunk = 15, type = 'motos' },
	[GetHashKey('vortex')] = { model = 'vortex', price = 800000, banned = false, name = 'Vortex', trunk = 15, type = 'motos' },
	[GetHashKey('wolfsbane')] = { model = 'wolfsbane', price = 400000, banned = false, name = 'Wolfsbane', trunk = 15, type = 'motos' },
	[GetHashKey('zombiea')] = { model = 'zombiea', price = 250000, banned = false, name = 'Zombiea', trunk = 15, type = 'motos' },
	[GetHashKey('zombieb')] = { model = 'zombieb', price = 250000, banned = false, name = 'Zombieb', trunk = 15, type = 'motos' },
	[GetHashKey('blazer')] = { model = 'blazer', price = 750000, banned = false, name = 'Blazer', trunk = 15, type = 'motos' },
	[GetHashKey('blazer4')] = { model = 'blazer4', price = 800000, banned = false, name = 'Blazer4', trunk = 15, type = 'motos' },
	[GetHashKey('shotaro')] = { model = 'shotaro', price = 2000000, banned = false, name = 'Shotaro', trunk = 30, type = 'motos' },
	[GetHashKey('ratbike')] = { model = 'ratbike', price = 200000, banned = false, name = 'Ratbike', trunk = 30, type = 'motos' },
	[GetHashKey('policiaheli')] = { model = 'policiaheli', price = 1000000, banned = false, name = 'Policia Helicóptero', trunk = 0, type = 'service' },
	[GetHashKey('fbi2')] = { model = 'fbi2', price = 1000000, banned = false, name = 'Granger SOG', trunk = 0, type = 'service' },
	[GetHashKey('policeb')] = { model = 'policeb', price = 1000000, banned = false, name = 'Harley Davidson', trunk = 0, type = 'service' },
	[GetHashKey('paramedicoambu')] = { model = 'paramedicoambu', price = 1000000, banned = false, name = 'Ambulância', trunk = 0, type = 'service' },
	[GetHashKey('paramedicocharger2014')] = { model = 'paramedicocharger2014', price = 1000000, banned = false, name = 'Dodge Charger 2014', trunk = 0, type = 'service' },
	[GetHashKey('pbus')] = { model = 'pbus', price = 1000000, banned = false, name = 'Ônibus da Penitenciária', trunk = 0, type = 'service' },
	[GetHashKey('mule4')] = { model = 'mule4', price = 4000000, banned = false, name = 'Mule 4', trunk = 400, type = 'outros' },
	[GetHashKey('mule2')] = { model = 'mule2', price = 4000000, banned = false, name = 'Mule 2', trunk = 2000, type = 'outros' },
	[GetHashKey('rallytruck')] = { model = 'rallytruck', price = 20000000, banned = false, name = 'RallyTruck', trunk = 3000, type = 'vip' },
	[GetHashKey('rallytruck2')] = { model = 'rallytruck2', price = 20000000, banned = false, name = 'RallyTruck 2', trunk = 3000, type = 'vip' },
	[GetHashKey('bus')] = { model = 'bus', price = 1000000, banned = false, name = 'Ônibus', trunk = 0, type = 'service' },
	[GetHashKey('flatbed')] = { model = 'flatbed', price = 1000000, banned = false, name = 'Reboque', trunk = 0, type = 'service' },
	[GetHashKey('towtruck')] = { model = 'towtruck', price = 1000000, banned = false, name = 'Towtruck', trunk = 0, type = 'service' },
	[GetHashKey('towtruck2')] = { model = 'towtruck2', price = 1000000, banned = false, name = 'Towtruck2', trunk = 0, type = 'service' },
	[GetHashKey('ratloader')] = { model = 'ratloader', price = 1000000, banned = false, name = 'Caminhão', trunk = 80, type = 'service' },
	[GetHashKey('ratloader2')] = { model = 'ratloader2', price = 180000, banned = false, name = 'Ratloader2', trunk = 70, type = 'outros' },
	[GetHashKey('rubble')] = { model = 'rubble', price = 1000000, banned = false, name = 'Caminhão', trunk = 100, type = 'service' },
	[GetHashKey('taxi')] = { model = 'taxi', price = 1000000, banned = false, name = 'Taxi', trunk = 0, type = 'service' },
	[GetHashKey('boxville4')] = { model = 'boxville4', price = 1000000, banned = false, name = 'Caminhão', trunk = 70, type = 'service' },
	[GetHashKey('trash2')] = { model = 'trash2', price = 1000000, banned = false, name = 'Caminhão', trunk = 100, type = 'service' },
	[GetHashKey('tiptruck')] = { model = 'tiptruck', price = 1000000, banned = false, name = 'Tiptruck', trunk = 100, type = 'service' },
	[GetHashKey('scorcher')] = { model = 'scorcher', price = 1000000, banned = false, name = 'Scorcher', trunk = 0, type = 'service' },
	[GetHashKey('tribike')] = { model = 'tribike', price = 1000000, banned = false, name = 'Tribike', trunk = 0, type = 'service' },
	[GetHashKey('tribike2')] = { model = 'tribike2', price = 1000000, banned = false, name = 'Tribike2', trunk = 0, type = 'service' },
	[GetHashKey('tribike3')] = { model = 'tribike3', price = 1000000, banned = false, name = 'Tribike3', trunk = 0, type = 'service' },
	[GetHashKey('fixter')] = { model = 'fixter', price = 1000000, banned = false, name = 'Fixter', trunk = 0, type = 'service' },
	[GetHashKey('cruiser')] = { model = 'cruiser', price = 1000000, banned = false, name = 'Cruiser', trunk = 0, type = 'service' },
	[GetHashKey('bmx')] = { model = 'bmx', price = 1000000, banned = false, name = 'Bmx', trunk = 100, type = 'service' },
	[GetHashKey('dinghy')] = { model = 'dinghy', price = 1000000, banned = false, name = 'Dinghy', trunk = 100, type = 'vip' },
	[GetHashKey('jetmax')] = { model = 'jetmax', price = 1000000, banned = false, name = 'Jetmax', trunk = 100, type = 'vip' },
	[GetHashKey('marquis')] = { model = 'marquis', price = 1000000, banned = false, name = 'Marquis', trunk = 100, type = 'vip' },
	[GetHashKey('seashark3')] = { model = 'seashark3', price = 1000000, banned = false, name = 'Seashark3', trunk = 100, type = 'vip' },
	[GetHashKey('speeder')] = { model = 'speeder', price = 1000000, banned = false, name = 'Speeder', trunk = 100, type = 'vip' },
	[GetHashKey('speeder2')] = { model = 'speeder2', price = 1000000, banned = false, name = 'Speeder2', trunk = 100, type = 'vip' },
	[GetHashKey('squalo')] = { model = 'squalo', price = 1000000, banned = false, name = 'Squalo', trunk = 100, type = 'vip' },
	[GetHashKey('suntrap')] = { model = 'suntrap', price = 1000000, banned = false, name = 'Suntrap', trunk = 100, type = 'vip' },
	[GetHashKey('toro')] = { model = 'toro', price = 1000000, banned = false, name = 'Toro', trunk = 100, type = 'vip' },
	[GetHashKey('toro2')] = { model = 'toro2', price = 1000000, banned = false, name = 'Toro2', trunk = 100, type = 'vip' },
	[GetHashKey('tropic')] = { model = 'tropic', price = 1000000, banned = false, name = 'Tropic', trunk = 100, type = 'vip' },
	[GetHashKey('tropic2')] = { model = 'tropic2', price = 1000000, banned = false, name = 'Tropic2', trunk = 100, type = 'vip' },
	[GetHashKey('yacht2')] = { model = 'yacht2', price = 1000000, banned = false, name = 'yacht2', trunk = 100, type = 'vip' },
	[GetHashKey('phantom')] = { model = 'phantom', price = 1000000, banned = false, name = 'Phantom', trunk = 0, type = 'service' },
	[GetHashKey('packer')] = { model = 'packer', price = 800000, banned = false, name = 'Packer', trunk = 100, type = 'service' },
	[GetHashKey('importsvolito')] = { model = 'importsvolito', price = 1000000, banned = false, name = 'importsvolito', trunk = 100, type = 'vip' },
	[GetHashKey('importsvolito2')] = { model = 'importsvolito2', price = 1000000, banned = false, name = 'importsvolito2', trunk = 100, type = 'vip' },
	[GetHashKey('seasparrow')] = { model = 'seasparrow', price = 1000000, banned = false, name = 'Paramédico Helicóptero Água', trunk = 0, type = 'service' },
	[GetHashKey('cuban800')] = { model = 'cuban800', price = 1000000, banned = false, name = 'Cuban800', trunk = 100, type = 'vip' },
	[GetHashKey('mammatus')] = { model = 'mammatus', price = 1000000, banned = false, name = 'Mammatus', trunk = 100, type = 'vip' },
	[GetHashKey('vestra')] = { model = 'vestra', price = 1000000, banned = false, name = 'Vestra', trunk = 100, type = 'vip' },
	[GetHashKey('velum2')] = { model = 'velum2', price = 1000000, banned = false, name = 'Velum2', trunk = 100, type = 'vip' },
	[GetHashKey('buzzard2')] = { model = 'buzzard2', price = 1000000, banned = false, name = 'Buzzard2', trunk = 100, type = 'vip' },
	[GetHashKey('maverick')] = { model = 'maverick', price = 1000000, banned = false, name = 'Maverick', trunk = 0, type = 'service' },
	[GetHashKey('tanker2')] = { model = 'tanker2', price = 1000000, banned = false, name = 'Gas', trunk = 0, type = 'service' },
	[GetHashKey('armytanker')] = { model = 'armytanker', price = 1000000, banned = false, name = 'Diesel', trunk = 0, type = 'service' },
	[GetHashKey('tvtrailer')] = { model = 'tvtrailer', price = 1000000, banned = false, name = 'Show', trunk = 0, type = 'service' },
	[GetHashKey('trailerlogs')] = { model = 'trailerlogs', price = 1000000, banned = false, name = 'Woods', trunk = 0, type = 'service' },
	[GetHashKey('tr4')] = { model = 'tr4', price = 1000000, banned = false, name = 'Cars', trunk = 0, type = 'service' },
	[GetHashKey('nissangtr')] = { model = 'nissangtr', price = 3000000, banned = false, name = 'Nissan GTR', trunk = 100, type = 'vip' },
	[GetHashKey('weevil')] = { model = 'weevil', price = 150000, banned = false, name = 'Fusca', trunk = 150, type = 'vip' },
	[GetHashKey('nissan370z')] = { model = 'nissan370z', price = 1000000, banned = false, name = 'Nissan 370Z', trunk = 40, type = 'vip' },
	[GetHashKey('dodgechargersrt')] = { model = 'dodgechargersrt', price = 2000000, banned = false, name = 'Dodge Charger SRT', trunk = 50, type = 'import' },
	[GetHashKey('14r8')] = { model = '14r8', price = 1000000, banned = false, name = 'Audi R8 2014', trunk = 30, type = 'vip' },
	[GetHashKey('bmwm3f80')] = { model = 'bmwm3f80', price = 1350000, banned = false, name = 'BMW M3 F80', trunk = 50, type = 'import' },
	[GetHashKey('nissangtrnismo')] = { model = 'nissangtrnismo', price = 2900000, banned = false, name = 'Nissan GTR Nismo', trunk = 40, type = 'vip' },
	
	[GetHashKey('seasparrow2')] = { model = 'seasparrow2', price = 1835000, banned = false, name = 'Sea Sparrow2', trunk = 30, type = 'vip' },
	[GetHashKey('mule')] = { model = 'mule', price = 1835000, banned = false, name = 'Mule', trunk = 1000, type = 'vip' },

	[GetHashKey('mercedesa45')] = { model = 'mercedesa45', price = 1200000, banned = false, name = 'Mercedes A45', trunk = 40, type = 'import' },
	[GetHashKey('rcbandito')] = { model = 'rcbandito', price = 1200000, banned = false, name = 'Mini carro', trunk = 10, type = 'vip' },
	[GetHashKey('focusrs')] = { model = 'focusrs', price = 1000000, banned = false, name = 'Focus RS', trunk = 40, type = 'import' },
	[GetHashKey('lancerevolution9')] = { model = 'lancerevolution9', price = 1400000, banned = false, name = 'Lancer Evolution 9', trunk = 50, type = 'import' },
	[GetHashKey('ninjah2')] = { model = 'ninjah2', price = 1000000, banned = false, name = 'Ninja H2', trunk = 15, type = 'vip' },
	[GetHashKey('trr')] = { model = 'trr', price = 1000000, banned = false, name = 'KTM TRR', trunk = 15, type = 'vip' },
	[GetHashKey('p1')] = { model = 'p1', price = 1000000, banned = false, name = 'Mclaren P1', trunk = 20, type = 'vip' },
	[GetHashKey('i8')] = { model = 'i8', price = 1000000, banned = false, name = 'BMW i8', trunk = 35, type = 'vip' },
	[GetHashKey('bme6tun')] = { model = 'bme6tun', price = 1000000, banned = false, name = 'BMW M5', trunk = 50, type = 'vip' },
	[GetHashKey('aperta')] = { model = 'aperta', price = 1000000, banned = false, name = 'La Ferrari', trunk = 20, type = 'vip' },

	[GetHashKey('devel22')] = { model = 'devel22', price = 1000000, banned = false, name = 'devel22', trunk = 20, type = 'vip' },
	[GetHashKey('lambose')] = { model = 'lambose', price = 1000000, banned = false, name = 'lambose', trunk = 20, type = 'vip' },


	[GetHashKey('bettle')] = { model = 'bettle', price = 1000000, banned = false, name = 'New Bettle', trunk = 35, type = 'vip' },
	[GetHashKey('senna')] = { model = 'senna', price = 1000000, banned = false, name = 'Mclaren Senna', trunk = 20, type = 'vip' },
	[GetHashKey('bnteam')] = { model = 'bnteam', price = 1000000, banned = false, name = 'Bentley', trunk = 20, type = 'vip' },
	[GetHashKey('rmodlp770')] = { model = 'rmodlp770', price = 1000000, banned = false, name = 'Lamborghini Centenario', trunk = 20, type = 'vip' },
	[GetHashKey('s15')] = { model = 's15', price = 1000000, banned = false, name = 'Nissan Silvia S15', trunk = 20, type = 'vip' },
	[GetHashKey('amggtr')] = { model = 'amggtr', price = 1000000, banned = false, name = 'Mercedes AMG', trunk = 20, type = 'vip' },
	[GetHashKey('lamtmc')] = { model = 'lamtmc', price = 1000000, banned = false, name = 'Lamborghini Terzo', trunk = 20, type = 'vip' },
	[GetHashKey('vantage')] = { model = 'vantage', price = 1000000, banned = false, name = 'Aston Martin Vantage', trunk = 20, type = 'vip' },
	[GetHashKey('slsamg')] = { model = 'slsamg', price = 1000000, banned = false, name = 'Mercedes SLS', trunk = 20, type = 'vip' },
	[GetHashKey('g65amg')] = { model = 'g65amg', price = 1000000, banned = false, name = 'Mercedes G65', trunk = 0, type = 'vip' },
	[GetHashKey('celta')] = { model = 'celta', price = 30000, banned = false, name = 'Celta Paredão', trunk = 0, type = 'vip' },
	[GetHashKey('eleanor')] = { model = 'eleanor', price = 1000000, banned = false, name = 'Mustang Eleanor', trunk = 30, type = 'vip' },
	[GetHashKey('rmodamgc63')] = { model = 'rmodamgc63', price = 1000000, banned = false, name = 'Mercedes AMG C63', trunk = 40, type = 'vip' },
	[GetHashKey('palameila')] = { model = 'palameila', price = 1000000, banned = false, name = 'Porsche Pamodelra', trunk = 50, type = 'vip' },
	[GetHashKey('cb500x')] = { model = 'cb500x', price = 1000000, banned = false, name = 'Honda CB500', trunk = 15, type = 'vip' },
	[GetHashKey('rsvr16')] = { model = 'rsvr16', price = 1000000, banned = false, name = 'Ranger Rover', trunk = 50, type = 'vip' },
	[GetHashKey('19ramdonk')] = { model = '19ramdonk', price = 1000000, banned = false, name = 'Dodge Ram Donk', trunk = 80, type = 'vip' },
	[GetHashKey('silv86')] = { model = 'silv86', price = 1000000, banned = false, name = 'Silverado Donk', trunk = 80, type = 'vip' },
	[GetHashKey('bc')] = { model = 'bc', price = 1000000, banned = false, name = 'Pagani Huayra', trunk = 20, type = 'vip' },
	[GetHashKey('70camarofn')] = { model = '70camarofn', price = 1000000, banned = false, name = 'camaro Z28 1970', trunk = 20, type = 'vip' },
	[GetHashKey('bbentayga')] = { model = 'bbentayga', price = 1000000, banned = false, name = 'Bentley Bentayga', trunk = 50, type = 'vip' },
	[GetHashKey('nissantitan17')] = { model = 'nissantitan17', price = 1000000, banned = false, name = 'Nissan Titan 2017', trunk = 120, type = 'vip' },
	[GetHashKey('regera')] = { model = 'regera', price = 1000000, banned = false, name = 'Koenigsegg Regera', trunk = 20, type = 'vip' },
	[GetHashKey('msohs')] = { model = 'msohs', price = 1000000, banned = false, name = 'Mclaren 688 HS', trunk = 20, type = 'vip' },
	[GetHashKey('gt17')] = { model = 'gt17', price = 1000000, banned = false, name = 'Ford GT 17', trunk = 20, type = 'vip' },
	[GetHashKey('19ftype')] = { model = '19ftype', price = 1000000, banned = false, name = 'Jaguar F-Type', trunk = 50, type = 'vip' },
	[GetHashKey('488gtb')] = { model = '488gtb', price = 1000000, banned = false, name = 'Ferrari 488 GTB', trunk = 30, type = 'vip' },
	[GetHashKey('m2')] = { model = 'm2', price = 1000000, banned = false, name = 'BMW M2', trunk = 50, type = 'vip' },
	[GetHashKey('defiant')] = { model = 'defiant', price = 1000000, banned = false, name = 'AMC Javelin 72', trunk = 40, type = 'vip' },
	[GetHashKey('f12tdf')] = { model = 'f12tdf', price = 1000000, banned = false, name = 'Ferrari F12 TDF', trunk = 20, type = 'vip' },
	[GetHashKey('71gtx')] = { model = '71gtx', price = 1000000, banned = false, name = 'Plymouth 71 GTX', trunk = 50, type = 'vip' },
	[GetHashKey('porsche992')] = { model = 'porsche992', price = 1000000, banned = false, name = 'Porsche 992', trunk = 20, type = 'vip' },
	[GetHashKey('18macan')] = { model = '18macan', price = 1000000, banned = false, name = 'Porsche Macan', trunk = 60, type = 'vip' },
	[GetHashKey('m6e63')] = { model = 'm6e63', price = 1000000, banned = false, name = 'BMW M6 E63', trunk = 50, type = 'vip' },
	[GetHashKey('180sx')] = { model = '180sx', price = 1000000, banned = false, name = 'Nissan 180SX', trunk = 10, type = 'vip' },
	[GetHashKey('hondafk8')] = { model = 'hondafk8', price = 1700000, banned = false, name = 'Honda FK8', trunk = 40, type = 'import' },
	[GetHashKey('mustangmach1')] = { model = 'mustangmach1', price = 1100000, banned = false, name = 'Mustang Mach 1', trunk = 40, type = 'import' },
	[GetHashKey('porsche930')] = { model = 'porsche930', price = 1300000, banned = false, name = 'Porsche 930', trunk = 20, type = 'import' },
	[GetHashKey('raptor2017')] = { model = 'raptor2017', price = 2000000, banned = false, name = 'Ford Raptor 2017', trunk = 150, type = 'vip' },
	[GetHashKey('filthynsx')] = { model = 'filthynsx', price = 1000000, banned = false, name = 'Honda NSX', trunk = 20, type = 'vip' },
	[GetHashKey('2018zl1')] = { model = '2018zl1', price = 1000000, banned = false, name = 'Camaro ZL1', trunk = 40, type = 'vip' },
	[GetHashKey('eclipse')] = { model = 'eclipse', price = 1000000, banned = false, name = 'Mitsubishi Eclipse', trunk = 30, type = 'vip' },
	[GetHashKey('lp700r')] = { model = 'lp700r', price = 1000000, banned = false, name = 'Lamborghini LP700R', trunk = 0, type = 'vip' },
	[GetHashKey('db11')] = { model = 'db11', price = 1000000, banned = false, name = 'Aston Martin DB11', trunk = 0, type = 'vip' },
	[GetHashKey('beetle74')] = { model = 'beetle74', price = 500000, banned = false, name = 'Fusca 74', trunk = 40, type = 'import' },
	[GetHashKey('fe86')] = { model = 'fe86', price = 500000, banned = false, name = 'Escorte', trunk = 40, type = 'import' },
	[GetHashKey('type263')] = { model = 'type263', price = 500000, banned = false, name = 'Kombi 63', trunk = 60, type = 'import' },
	[GetHashKey('pistas')] = { model = 'pistas', price = 1000000, banned = false, name = 'Ferrari Pista', trunk = 30, type = 'vip' },
	[GetHashKey('yzfr125')] = { model = 'yzfr125', price = 1000000, banned = false, name = 'Yamaha YZF R125', trunk = 10, type = 'vip' },
	[GetHashKey('mt03')] = { model = 'mt03', price = 1000000, banned = false, name = 'Yamaha MT 03', trunk = 10, type = 'vip' },
	[GetHashKey('flatbed3')] = { model = 'flatbed3', price = 1000000, banned = false, name = 'flatbed3', trunk = 0, type = 'service' },
	[GetHashKey('20r1')] = { model = '20r1', price = 1000000, banned = false, name = 'Yamaha YZF R1', trunk = 10, type = 'vip' },
	[GetHashKey('SVR14')] = { model = 'SVR14', price = 1000000, banned = false, name = 'Ranger Rover', trunk = 50, type = 'vip' },
	[GetHashKey('Bimota')] = { model = 'Bimota', price = 1000000, banned = false, name = 'Ducati Bimota', trunk = 10, type = 'vip' },
	[GetHashKey('r8ppi')] = { model = 'r8ppi', price = 1000000, banned = false, name = 'Audi R8 PPI Razor', trunk = 30, type = 'vip' },
	[GetHashKey('bobbes2')] = { model = 'bobbes2', price = 1000000, banned = false, name = 'Harley D. Bobber S', trunk = 15, type = 'vip' },
	[GetHashKey('bobber')] = { model = 'bobber', price = 1000000, banned = false, name = 'Harley D. Bobber ', trunk = 15, type = 'vip' },
	[GetHashKey('911tbs')] = { model = '911tbs', price = 1000000, banned = false, name = 'Porsche 911S', trunk = 25, type = 'vip' },
	[GetHashKey('rc')] = { model = 'rc', price = 1000000, banned = false, name = 'KTM RC', trunk = 15, type = 'vip' },
	[GetHashKey('brutus')] = { model = 'brutus', price = 1835000, banned = false, name = 'Brutus', trunk = 2000, type = 'vip' },
	[GetHashKey('cargobob2')] = { model = 'cargobob2', price = 1000000, banned = false, name = 'Cargo Bob', trunk = 0, type = 'service' },
	[GetHashKey('cargobob')] = { model = 'cargobob', price = 1835000, banned = false, name = 'CargoBob', trunk = 50, type = 'vip' },
	[GetHashKey('zx10r')] = { model = 'zx10r', price = 1000000, banned = false, name = 'Kawasaki ZX10R', trunk = 20, type = 'vip' },
	[GetHashKey('fox600lt')] = { model = 'fox600lt', price = 1000000, banned = false, name = 'McLaren 600LT', trunk = 40, type = 'vip' },
	[GetHashKey('foxbent1')] = { model = 'foxbent1', price = 1000000, banned = false, name = 'Bentley Liter 1931', trunk = 40, type = 'vip' },
	[GetHashKey('jeepg')] = { model = 'jeepg', price = 1000000, banned = false, name = 'Jeep Gladiator', trunk = 90, type = 'vip' },
	[GetHashKey('foxharley1')] = { model = 'foxharley1', price = 1000000, banned = false, name = 'Harley-Davidson Softail F.B.', trunk = 20, type = 'vip' },
	[GetHashKey('foxharley2')] = { model = 'foxharley2', price = 1000000, banned = false, name = '2016 Harley-Davidson Road Glide', trunk = 20, type = 'vip' },
	[GetHashKey('foxleggera')] = { model = 'foxleggera', price = 1000000, banned = false, name = 'Aston Martin Leggera', trunk = 50, type = 'vip' },
	[GetHashKey('foxrossa')] = { model = 'foxrossa', price = 1000000, banned = false, name = 'Ferrari Rossa', trunk = 40, type = 'vip' },
	[GetHashKey('foxshelby')] = { model = 'foxshelby', price = 1000000, banned = false, name = 'Ford Shelby GT500', trunk = 40, type = 'vip' },
	[GetHashKey('foxsian')] = { model = 'foxsian', price = 1000000, banned = false, name = 'Lamborghini Sian', trunk = 40, type = 'vip' },
	[GetHashKey('foxsterrato')] = { model = 'foxsterrato', price = 1000000, banned = false, name = 'Lamborghini Sterrato', trunk = 40, type = 'vip' },
	[GetHashKey('foxsupra')] = { model = 'foxsupra', price = 1000000, banned = false, name = 'Toyota Supra', trunk = 50, type = 'vip' },
	[GetHashKey('m6x6')] = { model = 'm6x6', price = 1000000, banned = false, name = 'Mercedes Benz 6x6', trunk = 90, type = 'vip' },
	[GetHashKey('m6gt3')] = { model = 'm6gt3', price = 1000000, banned = false, name = 'BMW M6 GT3', trunk = 40, type = 'vip' },
	[GetHashKey('w900')] = { model = 'w900', price = 1000000, banned = false, name = 'Kenworth W900', trunk = 130, type = 'vip' },
	[GetHashKey('22g63')] = { model = '22g63', price = 1000000, banned = false, name = '22g63', trunk = 130, type = 'vip' },

	[GetHashKey('mclarensenna')] = { model = 'mclarensenna', price = 1000000, banned = false, name = 'McLaren Senna', trunk = 50, type = 'vip' },
	[GetHashKey('gt3marlboro')] = { model = 'gt3marlboro', price = 1000000, banned = false, name = 'GT3 Marlboro', trunk = 50, type = 'vip' },
	[GetHashKey('mclaren')] = { model = 'mclaren', price = 1000000, banned = false, name = 'McLaren MP4/4', trunk = 50, type = 'vip' },

	[GetHashKey('sugoi')] = { model = 'sugoi', price = 1000000, banned = false, name = 'Sugoi', trunk = 30, type = 'sedans' },
	[GetHashKey('fiatstilo')] = { model = 'fiatstilo', price = 1000000, banned = false, name = 'Fiat Stilo', trunk = 50, type = 'sedans' },

	[GetHashKey('fiat')] = { model = 'fiat', price = 1000000, banned = false, name = 'Fiat', trunk = 30, type = 'sedans' },
	[GetHashKey('palio2')] = { model = 'palio2', price = 1000000, banned = false, name = 'Palio2', trunk = 30, type = 'sedans' },
	[GetHashKey('wruno')] = { model = 'wruno', price = 1000000, banned = false, name = 'Wr Uno', trunk = 30, type = 'sedans' },
	[GetHashKey('silvia')] = { model = 'silvia', price = 1000000, banned = false, name = 'Silvia', trunk = 30, type = 'sedans' },

	[GetHashKey('xplaid24c')] = { model = 'xplaid24c', price = 1000000, banned = false, name = 'Tesla Model X', trunk = 30, type = 'vip' },
	[GetHashKey('amrevu23mg')] = { model = 'amrevu23mg', price = 1000000, banned = false, name = 'Lamborghini Revuelto', trunk = 30, type = 'vip' },

	[GetHashKey('wrbrickade')] = { model = 'wrbrickade', price = 1000000, banned = false, name = 'WR Brickade', trunk = 1000, type = 'vip' },
	[GetHashKey('adolescentem8gte')] = { model = 'adolescentem8gte', price = 1000000, banned = false, name = 'KID M8GTE', trunk = 30, type = 'vip' },

	[GetHashKey('wrlamborghinikid')] = { model = 'adolescentem8gte', price = 1000000, banned = false, name = 'Wr LamboKid', trunk = 30, type = 'vip' },
	[GetHashKey('wrminir34')] = { model = 'wrminir34', price = 1000000, banned = false, name = 'WR Minir34', trunk = 30, type = 'vip' },
	[GetHashKey('wrminie36')] = { model = 'wrminie36', price = 1000000, banned = false, name = 'WR Minie36', trunk = 30, type = 'vip' },
	[GetHashKey('wrspiderkid')] = { model = 'wrspiderkid', price = 1000000, banned = false, name = 'WR SPIDER', trunk = 30, type = 'vip' },
	[GetHashKey('wrminiporsche')] = { model = 'wrminiporsche', price = 1000000, banned = false, name = 'Wr MiniPorsche', trunk = 40, type = 'vip' },
	[GetHashKey('wrplasticcar')] = { model = 'wrplasticcar', price = 1000000, banned = false, name = 'WR Plastic', trunk = 30, type = 'vip' },
	[GetHashKey('minievoque')] = { model = 'minievoque', price = 1000000, banned = false, name = 'Mini Evoque', trunk = 30, type = 'vip' },
	[GetHashKey('wrrelampagomarquinhos')] = { model = 'wrrelampagomarquinhos', price = 1000000, banned = false, name = 'Wr Relampago', trunk = 30, type = 'vip' },
	[GetHashKey('babyr35')] = { model = 'babyr35', price = 1000000, banned = false, name = 'Babyr35', trunk = 30, type = 'vip' },
	[GetHashKey('nimbus16')] = { model = 'nimbus16', price = 1000000, banned = false, name = 'nimbus16', trunk = 30, type = 'vip' },
	[GetHashKey('wrarmoredct')] = { model = 'wrarmoredct', price = 1000000, banned = false, name = 'wrarmoredct', trunk = 30, type = 'vip' },
	[GetHashKey('wrarmoredgls600')] = { model = 'wrarmoredgls600', price = 1000000, banned = false, name = 'wrarmoredgls600', trunk = 30, type = 'vip' },
	

	[GetHashKey('burrito6')] = { model = 'burrito6', price = 10000000, banned = false, name = 'Burrito6', trunk = 600, type = 'outros' },
	[GetHashKey('burritonatal')] = { model = 'burritonatal', price = 10000000, banned = false, name = 'Burrito Natal', trunk = 600, type = 'outros' },

	[GetHashKey('wrrtracer900')] = { model = 'wrrtracer900', price = 1000000, banned = false, name = 'WR Rtracer900', trunk = 20, type = 'vip' },
	[GetHashKey('wrcayenne')] = { model = 'wrcayenne', price = 1000000, banned = false, name = 'WR Cayenne', trunk = 60, type = 'vip' },
	[GetHashKey('gtb22')] = { model = 'gtb22', price = 1000000, banned = false, name = 'GTB 22', trunk = 15, type = 'vip' },
	[GetHashKey('wreclipse')] = { model = 'wreclipse', price = 1000000, banned = false, name = 'WR Eclipse', trunk = 15, type = 'vip' },
	[GetHashKey('wrgolquadrado')] = { model = 'wrgolquadrado', price = 1000000, banned = false, name = 'WR Gol Quadrado', trunk = 15, type = 'vip' },
	[GetHashKey('1winskyline')] = { model = '1winskyline', price = 1000000, banned = false, name = '1WIN Skyline', trunk = 20, type = 'vip' },
	[GetHashKey('wrtracer900')] = { model = 'wrtracer900', price = 1000000, banned = false, name = 'WR Tracer900', trunk = 20, type = 'vip' },

	[GetHashKey('q6audi23')] = { model = 'q6audi23', price = 1000000, banned = false, name = 'AUDI Q6', trunk = 80, type = 'vip' },
	[GetHashKey('m8gte')] = { model = 'm8gte', price = 1000000, banned = false, name = 'M8 GTE', trunk = 50, type = 'vip' },
	[GetHashKey('mysterym')] = { model = 'mysterym', price = 1000000, banned = false, name = 'Van Scooby Doo', trunk = 50, type = 'vip' },

	[GetHashKey('ironmontanha')] = { model = 'ironmontanha', price = 1000000, banned = false, name = 'Iron Montanha', trunk = 50, type = 'vip' },
	[GetHashKey('monomontanha')] = { model = 'monomontanha', price = 1000000, banned = false, name = 'Mono Montanha', trunk = 50, type = 'vip' },
	[GetHashKey('113montanha')] = { model = '113montanha', price = 1000000, banned = false, name = '113 Montanha', trunk = 50, type = 'vip' },


	


	[GetHashKey('wrtiger1200fed')] = { model = 'wrtiger1200fed', price = 1000000, banned = false, name = 'Tiger 1200', trunk = 50, type = 'vip' },
	[GetHashKey('wrpolicebfed')] = { model = 'wrpolicebfed', price = 1000000, banned = false, name = 'wrpolicebfed', trunk = 50, type = 'vip' },
	[GetHashKey('wrer34nfed')] = { model = 'wrer34nfed', price = 1000000, banned = false, name = 'wrer34nfed', trunk = 50, type = 'vip' },




	[GetHashKey('sl63')] = { model = 'sl63', price = 1000000, banned = false, name = 'Mercedes SL63', trunk = 40, type = 'vip' },
	[GetHashKey('mersa45')] = { model = 'mersa45', price = 1000000, banned = false, name = 'A45 AMG', trunk = 40, type = 'vip' },
	[GetHashKey('gls600')] = { model = 'gls600', price = 1000000, banned = false, name = 'Maybach GLS600', trunk = 80, type = 'vip' },
	[GetHashKey('monster5')] = { model = 'monster5', price = 500000, banned = false, name = 'Monster5', trunk = 100, type = 'vip' },
	[GetHashKey('monster4')] = { model = 'monster4', price = 500000, banned = false, name = 'Monster4', trunk = 100, type = 'vip' },
	[GetHashKey('monster3')] = { model = 'monster3', price = 500000, banned = false, name = 'Monster3', trunk = 100, type = 'vip' },
	[GetHashKey('xmasirisrora')] = { model = 'xmasirisrora', price = 1000000, banned = false, name = 'Xmas Irisrora', trunk = 150, type = 'vip' },
	[GetHashKey('mvso')] = { model = 'mvso', price = 1000000, banned = false, name = 'MV Agusta Brutalle 1000', trunk = 30, type = 'vip' },
	[GetHashKey('720wb')] = { model = '720wb', price = 1000000, banned = false, name = 'McLaren 720S WB', trunk = 30, type = 'vip' },
	[GetHashKey('silvias15varietta')] = { model = 'silvias15varietta', price = 1000000, banned = false, name = 'SilviaS15', trunk = 30, type = 'vip' },
	[GetHashKey('23teslapf')] = { model = '23teslapf', price = 1000000, banned = false, name = '23 Tesla PF', trunk = 30, type = 'vip' },
	[GetHashKey('x6')] = { model = 'x6', price = 1000000, banned = false, name = 'BMW X6', trunk = 15, type = 'vip' },
	-- [GetHashKey('dune4')] = { model = 'dune4', price = 1000000, banned = false, name = 'Dune4', trunk = 15, type = 'outros' },
	[GetHashKey('vigilante')] = { model = 'vigilante', price = 1000000, banned = false, name = 'Vigilante', trunk = 15, type = 'outros' },
	[GetHashKey('speedobg')] = { model = 'speedobg', price = 1000000, banned = false, name = 'Speedobg', trunk = 30, type = 'vip' },
	[GetHashKey('polmavbg')] = { model = 'polmavbg', price = 1000000, banned = false, name = 'Polmavbg', trunk = 30, type = 'vip' },
	[GetHashKey('aventsvjr')] = { model = 'aventsvjr', price = 1000000, banned = false, name = 'Aventador SVJ', trunk = 35, type = 'vip' },
	[GetHashKey('haya24nbrt')] = { model = 'haya24nbrt', price = 1000000, banned = false, name = 'Hayabusa 2024', trunk = 15, type = 'vip' },
	[GetHashKey('gle')] = { model = 'gle', price = 1000000, banned = false, name = 'GLE 53', trunk = 35, type = 'vip' },
	[GetHashKey('zr3802')] = { model = 'zr3802', price = 1000000, banned = false, name = 'GLE 53', trunk = 15, type = 'vip' },
	[GetHashKey('minijcwgp20')] = { model = 'minijcwgp20', price = 1000000, banned = false, name = 'Mini JCGWP20', trunk = 15, type = 'vip' },
	[GetHashKey('wrarmoredpurosangue')] = { model = 'wrarmoredpurosangue', price = 1000000, banned = false, name = 'Ferrari Purosangue', trunk = 60, type = 'vip' },
	[GetHashKey('F40LBWK')] = { model = 'F40LBWK', price = 1000000, banned = false, name = 'Ferrari SF90', trunk = 60, type = 'vip' },
	[GetHashKey('sf90')] = { model = 'sf90', price = 1000000, banned = false, name = 'F40 Libery Walk', trunk = 60, type = 'vip' },
	[GetHashKey('pounderesc')] = { model = 'pounderesc', price = 1000000, banned = false, name = 'PounderEsc', trunk = 400, type = 'vip' },

	[GetHashKey('wrcorollaciv')] = { model = 'wrcorollaciv', price = 1000000, banned = false, name = 'Corolla', trunk = 30, type = 'vip' },
	[GetHashKey('evoquecabrio')] = { model = 'evoquecabrio', price = 1000000, banned = false, name = 'Evoque Cabrio', trunk = 30, type = 'vip' },
	[GetHashKey('R34WhiteDragon')] = { model = 'R34WhiteDragon', price = 1000000, banned = false, name = 'R34 White Dragon', trunk = 30, type = 'vip' },
}

garagesConfig.typeGarages = {	
	['garagemPrisao'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'blazer'}
        },
    },

	['garagemAeroporto'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'stryder'}
        },
    },

	['garagemHeliUnizk'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRas350samu'},
        },
    },
	

	['garagemHELIBOMBEIRO'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRas350cbm'},
        },
    },

	['garagemBombeiro'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRsprinter22cbm'},
			{vehicle = 'WR21hiluxcbm'},
			{vehicle = 'WRsw4cbm'},
			{vehicle = 'bigr1200'},
        },
    },

	['garagemHeliPolicia'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRpolmav'},
			{vehicle = 'WRbell407'},
        },
    },

	['garagemEXERCITO'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRranger23ebc'},
			{vehicle = 'WRranger23eb'},
			{vehicle = 'WR5ton'},
			{vehicle = 'wrr1200eb'},
        },
    },

	-- ['garagemCHOQUE'] = {
    --     type = "service", -- [ public / service ]

    --     blip = {
	-- 		showBlip = false, -- Exibir BLIP
    --         name = 'Garagem', -- Nome do BLIP
    --         blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
    --         blipColor = 0, -- Cor do BLIP
    --         blipScale = 0.5, -- Tamanho do Blip
    --     },  

    --     vehicles = {
	-- 		{vehicle = 'WRranger23', livery = 1},
	-- 		{vehicle = 'WRl200', livery = 1},
	-- 		{vehicle = 'WRtrailblazer22', livery = 1},
    --     },
    -- },

	['garagemDELPF'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'wrblindadoramfed'},
		},
    },


	['garagemPF'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = "wrer34nfed"},
			{vehicle = "wrblindadoramfed"},
			{vehicle = "wrcorollafed"},
			{vehicle = 'wrtrailfed'},
			{vehicle = 'wrl200fed'},
			{vehicle = 'wrcb500fed'},
			{vehicle = 'wrpolicebfed'},
			{vehicle = 'wrtrail1200fed'},
			{vehicle = 'wri8fed'},
			{vehicle = 'wrjeep'},
			{vehicle = 'wrtiger1200fed'},
			{vehicle = 'wrpurosanguefed'},
			{vehicle = 'wrgt3pol'},
			{vehicle = 'wrf850pol'},
		},
    },

	['garagemBLINDADOPF'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'wrblindadoramfed'},
		},
    },

	['garagemPMERJ'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'wrcorolla', livery = 3},
			{vehicle = 'wrranger23', livery = 3},
			{vehicle = 'wrl200', livery = 3},
			{vehicle = 'wrtrailblazer22', livery = 3},
			{vehicle = 'wrduster22'},
			{vehicle = 'wrr1200pm'},
            {vehicle = 'WRxt660'},
            {vehicle = 'wrjettapm'},
			{vehicle = 'wrtrailblazer22', livery = 5},
			{vehicle = 'wrranger23', livery = 5},
			{vehicle = 'wrl200', livery = 5},
			{vehicle = 'wrc7', livery = 25},
			{vehicle = 'WRtrailblazer22', livery = 7},

        },
    },
	 
	['garagemPMERJ2'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'wrtrailblazer22', livery = 5},
			{vehicle = 'wrranger23', livery = 5},
			{vehicle = 'wrl200', livery = 5},

        },
    },
	 
	['Taxista'] = {
        type = "service", -- [ public / service ]

        blip = {
            showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'taxi'}
        },
    },

	['ifood'] = {
        type = "service", -- [ public / service ]

        blip = {
            showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'wrcargo150'}
        },
    },

	['garagemHELIPRF'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRbell407prf'},
			{vehicle = 'WRas350prf'},
        },
    },

	['garagemHeliExercito'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'haitun'},
			{vehicle = 'uh1exercito'},
			 
        },
    },

	['garagemHeliCHOQUE'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRas350'},
        },
    },

	['garagemHELIPF'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'wras350fed'},
			--{vehicle = 'WRstorm', livery = 2},
        },
    },

	['garagemHELIPMERJ'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRas350', livery = 2},
			--{vehicle = 'WRstorm', livery = 2},
        },
    },

	['garagemHELICORE'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRas350', livery = 1},
        },
    },


	['garagemHELIBOPE'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRas350', livery = 2},
        },
    },
	
	['garagemCIVIL'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRCorolla', livery = 1},
			{vehicle = 'WRl200', livery = 4},
			{vehicle = 'WRpajero', livery = 2},
			{vehicle = 'WRranger23', livery = 4},
			{vehicle = 'WRstorm', livery = 1},
			{vehicle = 'coach', livery = 1},
			{vehicle = 'WRtrailblazer22', livery = 4},
			{vehicle = 'wrr1200pm', livery = 3},
        },
    },

	['garagemHELICIVIL'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRas350', livery = 1},
        },
    },

	['garagemCORE'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'WRCorolla', livery = 2},
			{vehicle = 'WRl200', livery = 2},
			{vehicle = 'WRpajero', livery = 1},
			{vehicle = 'WRranger23', livery = 2},
			{vehicle = 'WRtrailblazer22', livery = 2},
			{vehicle = 'WRstorm', livery = 1},
			{vehicle = 'wrr1200pm', livery = 2},
			{vehicle = 'wrc7', livery = 1},
        },
    },

	['garagemBOPE'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			--{vehicle = 'caveiraopmerj'},
            {vehicle = 'WRl200', livery = 8},
			{vehicle = 'WRranger23', livery = 8},
			{vehicle = 'WRtrailblazer22', livery = 8},
			{vehicle = 'caveiraopmerj'}

        },
    },

	['garagemCAVEIRAO'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'caveiraopmerj'},
        },
    },
	
	['garagemCOT'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'wrtiger1200mct'},
			{vehicle = 'wrlc500mct'},
			{vehicle = 'wrm3g80mct'},
			{vehicle = 'wrbmwg05mct'},
			{vehicle = 'wrtrxmct'},
			{vehicle = 'wrer34pol'},
        },
    },
	
	['garagemHELICOT'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'wrbell407mct'},
        },
    },
	
	['garagemCHOQUE'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'WRl200', livery = 1},
            {vehicle = 'WRranger23', livery = 1},
			{vehicle = 'WRtrailblazer22', livery = 1},
			{vehicle = 'wrr1200pm', livery = 1},
			{vehicle = 'wrm3chq'}
			--{vehicle = 'WRstorm', livery = 2},
        },
    },
	
	['garagemGOT'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'WRl200', livery = 6},
            {vehicle = 'WRranger23', livery = 6},
			{vehicle = 'WRtrailblazer22', livery = 6},
			--{vehicle = 'WRstorm', livery = 2},
        },
    },

	['garagemGOTTIGER'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'wrtiger1200got'}
        },
    },

	['garagemGOTWR'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRstorm', livery = 2},
        },
    },

	['garagemCreche'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'wrplasticcar'},
        },
    },

	['garagemCHOQUEWR'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'WRstorm', livery = 3},
        },
    },

	['garagemCOE'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'WRl200', livery = 5},
			{vehicle = 'WRranger23', livery = 5},
			{vehicle = 'WRtrailblazer22', livery = 5},
        },
    },

	['garagemCOMANDOPRF'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'WRjeep'},
        },
    },
	
	['garagemPRF'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'WRtrailblazerprf', livery = 1},
			{vehicle = 'WRL200PRF', livery = 1},
			{vehicle = 'WRcruzeprf', livery = 1},
			{vehicle = 'WRprfcamaro19', livery = 1},
			{vehicle = 'WRranger21', livery = 1},
			{vehicle = 'wrr1200prf', livery = 1},
			{vehicle = 'wrgtrprf', livery = 1},
        },
    },

	['garagemGRR'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'WRtrailblazerprf', livery = 1},
            {vehicle = 'WRl200prf', livery = 1},
        },
    },

	['garagemDESCARACTERIZADO'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'WRc7', livery = 1},
            {vehicle = 'WRl200', livery = 6},
			{vehicle = 'WRranger23', livery = 6},
            {vehicle = 'WRtrailblazer22', livery = 6},
			{vehicle = 'WRvelar', livery = 1},
            {vehicle = 'WRjeep'},
        },
    },

	['garagemHospital'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'WRxreparamedico'},
			{vehicle = 'WRsw4'},
			{vehicle = 'WRsprinter22'},
        },
    },

	['garagemJornal'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'speedobg'},
        },
    },
	
	['heliJornal'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'polmavbg'},
        },
    },
	
	['heliJudiciario'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'swift'},
        },
    },


    ['garagemMecanico'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'wrflatbedmotors'},
			{vehicle = 'wrtrxmecmotors'},
        },
    },

	['garagemRace'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'wrflatbedrace'},
            {vehicle = 'wrtrxmecrace'}
        },
    },

	['garagemMecanico2'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'wrflatbeddk'},
            {vehicle = 'wrtrxmecdeb'}
        },
    },
	
	['garagemJudiciario'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'fbi2'},
            {vehicle = 'wrvelarno'},
        },
    },

	['garagemJudiciarioWR'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'fbi2'},
			{vehicle = 'panamera17turbo'},
        },
    },

	['PublicaRecrutamento'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = '24humevof'},
            {vehicle = 'zx6r'},
            {vehicle = 'hiaceil'},
        },
    },

	['PublicaRecrutamentoDiamante'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = "24humevof"},
			{vehicle = "zx6r"},
            {vehicle = "hiaceil"},
            {vehicle = "tenere1200" },
            {vehicle = "x6"},
        },
    },

	['PublicaRecrutamentoEsmeralda'] = {

        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			
			{vehicle = "24humevof"},
			{vehicle = "zx6r"},
			{vehicle = "hiaceil"},
			{vehicle = "s1000rr"},
			{vehicle = "18velar"},
			
        },
    },

	['PublicaRecrutamentoEsmeraldaDiamante'] = {

        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			
			{vehicle = "24humevof"},
			{vehicle = "zx6r"},
			{vehicle = "hiaceil"},
			{vehicle = "s1000rr"},
			{vehicle = "18velar"},
			{vehicle = "tenere1200" },
            {vehicle = "x6"},
			
        },
    },

	
	['PublicaRecrutamentoEsmeraldaMafia'] = {

        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			
			{vehicle = "24humevof"},
			{vehicle = "zx6r"},
			{vehicle = "hiaceil"},
			{vehicle = "s1000rr"},
			{vehicle = "18velar"},
			{vehicle = "skylinemafia"},
			
        },
    },

	['PublicaRecrutamentoBahamas'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = '24humevof'},
            {vehicle = 'zx6r'},
            {vehicle = 'hiaceil'},
            {vehicle = 's1000rr'},
            {vehicle = 'rmodx6'},
        },
    },

	['PublicaRecrutamentoTcp'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = '24humevof'},
            {vehicle = 'zx6r'},
            {vehicle = 'hiaceil'},
            {vehicle = 'audiq8'},
            {vehicle = 'tiger'},
        },
    },

	['PublicaRecrutamentoRussia'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = '24humevof'},
            {vehicle = 'zx6r'},
            {vehicle = 'hiaceil'},
            {vehicle = 'audiq8'},
            {vehicle = 'tiger'},
            {vehicle = 'l200'},
        },
    },

	['VipFac1'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'nissantitan17'},
            {vehicle = 'terbyte'},
        },
    },

	['VipFac2'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'ram226x6'},
            {vehicle = 'rallytruck'},
        },
    },

	['VipFac1e2'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'ram226x6'},
            {vehicle = 'rallytruck'},
			{vehicle = 'nissantitan17'},
            {vehicle = 'terbyte'},
        },
    },

	['VipFac3'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'l200'},
            -- {vehicle = 'benson'},
        },
    },

	['VipFac4'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'benson'},
        },
    },

	['VipFac5'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
            {vehicle = 'benson'},
			{vehicle = 'l200'},
        },
    },

    ['Publica'] = {
        type = "public", -- [ public / service ]

        blip = {
			showBlip = true, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 3, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        listCars = {
            vehicle = true,
            heli = false,
            boat = false
        }
    },
	

	['PublicaSemBlip'] = {
        type = "public", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        listCars = {
            vehicle = true,
            heli = false,
            boat = false
        }
    },

	['PublicaInicial'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = "caddyin"},
        },
    },

	['PublicaHeli'] = {
        type = "public", -- [ public / service ]

        blip = {
			showBlip = true, -- Exibir BLIP
            name = 'Garagem Helicoptero', -- Nome do BLIP
            blipId = 43, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        listCars = {
            vehicle = false,
            heli = true,
            boat = false
        }
    },

	['PublicaHeliSemBlip'] = {
        type = "public", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem Helicoptero', -- Nome do BLIP
            blipId = 43, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        listCars = {
            vehicle = false,
            heli = true,
            boat = false
        }
    },

	['PublicaAviao'] = {
        type = "public", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem Avião', -- Nome do BLIP
            blipId = 43, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        listCars = {
            vehicle = false,
            heli = true,
            boat = false
        }
    },
	

	['PublicaBarcos'] = {
        type = "public", -- [ public / service ]

        blip = {
			showBlip = true, -- Exibir BLIP
            name = 'Garagem Barcos', -- Nome do BLIP
            blipId = 410, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        listCars = {
            vehicle = false,
            heli = false,
            boat = true
        }
    },

	['PublicaBarcosSemBlip'] = {
        type = "public", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem Barcos', -- Nome do BLIP
            blipId = 410, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        listCars = {
            vehicle = false,
            heli = false,
            boat = true
        }
    },

	['PublicaFac'] = {
        type = "public", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        listCars = {
            vehicle = true,
            heli = false,
            boat = false
        }
    },

	['Homes'] = {
        type = "public", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        listCars = {
            vehicle = true,
            heli = false,
            boat = false
        }
    },

	['garagemHospitalVip'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{ vehicle = "wrq6hosp" },
        },
    },
	['garagemBombeiroVip'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'wrbugbomb'},
        },
    },
	['garagemMecanicaVip'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'wrmachmec'},
        },
    },
	['garagemPoliciaVip'] = {
        type = "service", -- [ public / service ]

        blip = {
			showBlip = false, -- Exibir BLIP
            name = 'Garagem', -- Nome do BLIP
            blipId = 357, -- ID DO BLIP = https://docs.fivem.net/docs/game-references/blips/
            blipColor = 0, -- Cor do BLIP
            blipScale = 0.5, -- Tamanho do Blip
        },  

        vehicles = {
			{vehicle = 'wrmustpol'},
        },
    },
}

garagesConfig.garagesLocs = {

-- VIP FACs

-- PUBLICAS BARCOS
	{
		type = "PublicaBarcos",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-1799.48,-1224.76,1.58), 
		spawnCoords = {
			vector4(-1784.69,-1226.36,0.45,233.16)
		}
	},

---

-- PUBLICAS RECRUTAMENTO
	{
		type = "PublicaRecrutamentoTcp",
		blipDistance = 5.0,
		permiss = "perm.korea",

		coords = vec3(-188.25,308.88,97.04), 
		spawnCoords = {
			vector4(-198.77,302.59,96.92,0.31)
		}
	},

	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.vk",

		coords = vec3(-561.61,305.77,83.24), 
		spawnCoords = {
			vector4(-560.49,302.25,82.58,263.83)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.turquia",

		coords = vec3(-1038.0,320.13,66.88), 
		spawnCoords = {
			vector4(-1042.49,320.37,66.24,113.36)
		}
	},
	{
		type = "PublicaRecrutamentoEsmeralda",
		blipDistance = 5.0,
		permiss = "perm.hospicio",

		coords = vec3(1416.4,1115.17,114.83), 
		spawnCoords = {
			vector4(1410.27,1118.38,114.92,89.83)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.suecia",

		coords = vec3(1924.32,744.14,191.57), 
		spawnCoords = {
			vector4(1928.17,748.24,191.11,192.09)
		}
	},
	{
		type = "PublicaRecrutamentoRussia",
		blipDistance = 5.0,
		permiss = "perm.russia",

		coords = vec3(926.81,386.0,112.49), 
		spawnCoords = {
			vector4(927.31,382.07,112.32,135.98)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.hamas",

		coords = vec3(2076.76,2276.79,94.36), 
		spawnCoords = {
			vector4(2071.89,2275.13,94.0,246.57)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.escocia",

		coords = vec3(1430.84,-2546.18,49.93), 
		spawnCoords = {
			vector4(1429.67,-2543.34,49.37,96.02)
		}
	},

	{
		type = "PublicaRecrutamentoDiamante",
		blipDistance = 5.0,
		permiss = "perm.anonymous",

		coords = vec3(414.04,-1508.4,29.28), 
		spawnCoords = {
			vector4(412.73,-1517.47,28.7,28.95)
		}
	},

	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.galaxy",

		coords = vec3(-248.26,-319.37,29.99), 
		spawnCoords = {
			vector4(-247.95,-312.54,30.5,97.29)

		}
	},
	{
		type = "PublicaRecrutamentoEsmeralda",
		blipDistance = 5.0,
		permiss = "perm.anubis",

		coords = vec3(-428.84,-43.79,46.22), 
		spawnCoords = {
			vector4(-426.93,-34.64,46.29,356.92)

		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.cohab",

		coords = vec3(-1504.6,-432.19,35.59), 
		spawnCoords = {
			vector4(-1510.66,-431.78,34.85,86.17)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.familiatribo",

		coords = vec3(1284.82,-1727.34,52.87), 
		spawnCoords = {
			vector4(1281.22,-1732.54,52.57,114.99)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.cv",

		coords = vec3(3044.64,2988.66,84.25), 
		spawnCoords = {
			vector4(3050.01,2988.78,83.95,45.41)
		}
	},

	{
		type = "PublicaRecrutamentoEsmeralda",
		blipDistance = 5.0,
		permiss = "perm.franca",

		coords = vec3(1359.0,-743.55,67.18), 
		spawnCoords = {
			vector4(1345.89,-736.78,66.99,74.91)
		}
	},
	
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.roxos",

		coords = vec3(116.52,-1952.41,20.741), 
		spawnCoords = {
			vector4(110.1,-1943.52,20.83,48.45) 

		}
	},
	{
		type = "PublicaRecrutamentoEsmeralda",
		blipDistance = 5.0,
		permiss = "perm.milicia",

		coords = vec3(-3083.73,1732.16,36.11), 
		spawnCoords = {
			vector4(-3087.09,1731.09,36.38,27.67)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.hellsangels",

		coords = vec3(1018.94,-2509.88,28.48), 
		spawnCoords = {
			vector4(1007.81,-2510.17,27.87,42.75)
		}
	},

	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.yakuza",

		coords = vec3(-960.42,-1472.03,5.17), 
		spawnCoords = {
			vector4(-970.2,-1471.26,4.5,109.98)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.mexico",

		coords = vec3(727.42,-291.45,58.08), 
		spawnCoords = {
			vector4(720.04,-291.19,57.64,187.19)

		}
	},
	{
		type = "PublicaRecrutamentoEsmeralda",
		blipDistance = 5.0,
		permiss = "perm.vaticano",

		coords = vec3(-1554.02,874.03,181.73), 
		spawnCoords = {
			vector4(-1544.69,885.1,181.35,197.27)
		}
	},

	
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.argentina",

		coords = vec3(1077.78,623.25,138.02), 
		spawnCoords = {
			vector4(1088.84,633.37,139.6,148.63)
		}
	},


	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.espanha",

		coords = vec3(1358.41,1902.77,94.93), 
		spawnCoords = {
			vector4(1353.66,1903.4,94.07,42.77)
		}
	},

	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.bennys",

		coords = vec3(-210.02,-1294.35,31.29), 
		spawnCoords = {
			vector4(-207.83,-1281.59,31.91,177.74)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.pedreira",

		coords = vec3(1521.83,-2053.14,77.29), 
		spawnCoords = {
			vector4(1523.02,-2051.36,77.27,23.42)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.lacoste",

		coords = vec3(721.1,-1084.47,22.22), 
		spawnCoords = {
			vector4(713.37,-1083.63,22.34,358.42)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.medusa",

		coords = vec3(765.18,-561.58,32.15), 
		spawnCoords = {
			vector4(767.21,-569.15,30.95,179.92)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.cassino",

		coords = vec3(919.61,41.08,81.1), 
		spawnCoords = {
			vector4(911.16,38.88,80.46,149.32)
		}
	},
	
	{
		type = "PublicaRecrutamentoEsmeralda",
		blipDistance = 5.0,
		permiss = "perm.lux",

		coords = vec3(-335.74,212.93,87.91), 
		spawnCoords = {
			vector4(-332.25,218.52,87.06,8.47)
		}
	},
	{
		type = "PublicaRecrutamentoBahamas",
		blipDistance = 5.0,
		permiss = "perm.baubahamas",

		coords = vec3(-1416.55,-610.06,30.87), 
		spawnCoords = {
			vector4(-1423.5,-619.42,30.31,123.84)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.tequila",

		coords = vec3(-1044.22,-222.36,37.91), 
		spawnCoords = {
			vector4(-1048.45,-220.64,37.42,27.29)
		}
	},
	-- {
	-- 	type = "PublicaRecrutamento",
	-- 	blipDistance = 5.0,
	-- 	permiss = "perm.vanilla",

	-- 	coords = vec3(118.87,-1309.39,29.23), 
	-- 	spawnCoords = {
	-- 		vector4(125.93,-1314.68,28.71,123.57)
	-- 	}
	-- },
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.belgica",

		coords = vec3(173.74,698.87,209.06), 
		spawnCoords = {
			vector4(167.61,698.88,208.15,0.51)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.lixao",

		coords = vec3(-616.24,-1646.32,25.81), 
		spawnCoords = {
			vector4(-620.36,-1649.96,25.54,60.02)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.italia",
	
		coords = vec3(708.39,-976.66,24.15), 
		spawnCoords = {
			vector4(710.15,-990.29,24.04,279.41)
		}
	},
	{
		type = "PublicaRecrutamentoTcp",
		blipDistance = 5.0,
		permiss = "perm.irlanda",
	
		coords = vec3(-2319.03,-255.45,48.02), 
		spawnCoords = {
			vector4(-2324.51,-251.2,47.52,296.35)
		}
	},
	{
		type = "PublicaRecrutamentoEsmeralda",
		blipDistance = 5.0,
		permiss = "perm.israel",
	
		coords = vec3(-1676.76,560.67,154.36), 
		spawnCoords = {
			vector4(-1684.56,558.62,154.34,317.01)
		}
	},
	{
		type = "PublicaRecrutamentoDiamante",
		blipDistance = 5.0,
		permiss = "perm.mercenarios",
	
		coords = vec3(-116.2, 997.22, 235.75), 
		spawnCoords = {
			vector4(-121.76, 993.42, 235.48, 120.36)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.china",
	
		coords = vec3(-819.89,-741.52,23.79), 
		spawnCoords = {
			vector4(-825.69,-757.12,22.7,90.02)
		}
	},
	{
		type = "PublicaRecrutamentoDiamante",
		blipDistance = 5.0,
		permiss = "perm.colombia",
	
		coords = vec3(-817.5, 188.46, 72.42), 
		spawnCoords = {
			vector4(-823.97, 181.23, 71.39, 144.43)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.vermelhos",
	
		coords = vec3(-1102.28,-1641.04,4.62),
		spawnCoords = {
			vector4(-1098.73,-1634.83,4.4,34.17)
		}
	},
	{
		type = "PublicaRecrutamentoEsmeralda",
		blipDistance = 5.0,
		permiss = "perm.elements",
	
		coords = vec3(-152.84, -1574.87, 34.76),
		spawnCoords = {
			vector4(-155.51, -1570.37, 34.64, 321.23)
		}
	},

	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.grecia",
	
		coords = vec3(-320.75,-1533.67,27.58),
		spawnCoords = {
			vector4(-316.83,-1534.52,27.68,352.68)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.noruega",
	
		coords = vec3(2209.86, 128.01, 228.21),
		spawnCoords = {
			vector4(2208.6, 132.9, 227.61, 315.84)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.ada",
	
		coords = vec3(1211.41, -1040.7, 47.47),
		spawnCoords = {
			vector4(1209.96, -1037.45, 46.91, 104.19)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.palestina",
	
		coords = vec3(-525.87,-1469.76,13.87),
		spawnCoords = {
			vector4(-530.01,-1473.61,13.26,166.45)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.cdd",
	
		coords = vec3(-1188.0,-1759.78,4.06),
		spawnCoords = {
			vector4(-1201.08,-1756.97,3.84,279.39)
		}
	},
	{
		type = "PublicaRecrutamentoEsmeralda",
		blipDistance = 5.0,
		permiss = "perm.grota",
	
		coords = vec3(1194.39,-254.12,69.29),
		spawnCoords = {
			vector4(1189.23,-263.48,69.07,48.95)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.sete",
	
		coords = vec3(-1101.48,354.41,68.49),
		spawnCoords = {
			vector4(-1102.48,360.77,67.94,359.56)
		}
	},
	{
		type = "PublicaRecrutamentoEsmeraldaMafia",
		blipDistance = 5.0,
		permiss = "perm.mafia",
	
		coords = vec3(376.26,4.87,82.97),
		spawnCoords = {
			vector4(370.45,3.18,82.99,125.5)
		}
	},
	{
		type = "PublicaRecrutamentoEsmeraldaDiamante",
		blipDistance = 5.0,
		permiss = "perm.magnatas",
	
		coords = vec3(-2972.16,74.46,11.53),
		spawnCoords = {
			vector4(-2972.98,76.91,10.88,149.13)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.inglaterra",
	
		coords = vec3(-1521.42,79.97,56.77),
		spawnCoords = {
			vector4(-1509.3,85.51,55.05,272.64)
		}
	},
	{
		type = "PublicaRecrutamento",
		blipDistance = 5.0,
		permiss = "perm.egito",
	
		coords = vec3(-1697.82,-285.74,51.88),
		spawnCoords = {
			vector4(-1707.36,-304.07,51.78,259.65)
		}
	},
	{
		type = "PublicaRecrutamentoDiamante",
		blipDistance = 5.0,
		permiss = "perm.motoclub",
	
		coords = vec3(956.18,-122.71,74.36),
		spawnCoords = {
			vector4(951.16,-122.69,74.43,224.88)
		}
	},
	{
		type = "PublicaRecrutamentoDiamante",
		blipDistance = 5.0,
		permiss = "perm.okayda",
	
		coords = vec3(-3207.94,835.71,8.93),
		spawnCoords = {
			vector4(-3212.86,838.69,8.85,119.25)
		}
	},

	{
		type = "VipFac1",
		blipDistance = 5.0,
		permiss = "perm.baubahamas",
	
		coords = vec3(-1431.0,-659.09,28.68),
		spawnCoords = {
			vector4(-1426.39,-658.06,28.8,35.37)
		}
	},
	-- {
	-- 	type = "VipFac1",
	-- 	blipDistance = 5.0,
	-- 	permiss = "perm.baubahamas",
	
	-- 	coords = vec3(-1397.61,-587.47,30.3),
	-- 	spawnCoords = {
	-- 		vector4(-1399.3,-585.29,30.33,301.82) 
	-- 	}
	-- },
	{
		type = "VipFac1",
		blipDistance = 5.0,
		permiss = "perm.gerentemotoclub",
	
		coords = vec3(950.43,-116.71,74.36),
		spawnCoords = {
			vector4(951.54,-122.59,74.43,219.53)
		}
	},
	{
		type = "VipFac1",
		blipDistance = 5.0,
		permiss = "perm.gerenteokayda",
	
		coords = vec3(-3189.37,826.48,8.93),
		spawnCoords = {
			vector4(-3194.41,818.31,8.93,129.86)
		}
	},
	{
		type = "VipFac1",
		blipDistance = 5.0,
		permiss = "perm.gerenteanonymous",
	
		coords = vec3(451.1,-1523.27,29.28),
		spawnCoords = {
			vector4(436.95,-1520.18,29.27,136.11)
		}
	},
	{
		type = "VipFac1",
		blipDistance = 5.0,
		permiss = "perm.gerentemercenarios",
	
		coords = vec3(-100.37,1001.64,235.76),
		spawnCoords = {
			vector4(-108.39,1004.59,235.76,108.21)
		}
	},
	{
		type = "VipFac1",
		blipDistance = 5.0,
		permiss = "perm.gerentecolombia",
	
		coords = vec3(-827.3,167.9,69.94),
		spawnCoords = {
			vector4(-831.27,168.88,69.78,155.63)
		}
	},
	{
		type = "VipFac2",
		blipDistance = 5.0,
		permiss = "perm.gerentemilicia",
	
		coords = vec3(-3081.6,1756.79,36.11),
		spawnCoords = {
			vector4(-3083.63,1760.63,36.11,335.93)
		}
	},
	{
		type = "VipFac2",
		blipDistance = 5.0,
		permiss = "perm.gerenteelements",
	
		coords = vec3(-176.96,-1583.05,35.0),
		spawnCoords = {
			vector4(-171.77,-1581.74,34.93,321.39)
		}
	},
	{
		type = "VipFac2",
		blipDistance = 5.0,
		permiss = "perm.recrutadorgrota",
	
		coords = vec3(1239.57,-126.47,75.28),
		spawnCoords = {
			vector4(1241.87,-128.51,75.27,142.0)
		}
	},
	{
		type = "VipFac2",
		blipDistance = 5.0,
		permiss = "perm.bauhospicio",
	
		coords = vec3(1429.52,1126.59,114.26),
		spawnCoords = {
			vector4(1431.74,1131.59,114.34,180.63)
		}
	},
	{
		type = "VipFac2",
		blipDistance = 5.0,
		permiss = "perm.baulux",
	
		coords = vec3(-343.42,212.11,87.5),
		spawnCoords = {
			vector4(-347.61,218.68,86.52,275.87)
		}
	},
	{
		type = "VipFac1e2",
		blipDistance = 5.0,
		permiss = "perm.gerentemagnatas",
	
		coords = vec3(-3027.49,130.19,11.68),
		spawnCoords = {
			vector4(-3033.45,135.61,11.61,113.89)
		}
	},
	{
		type = "VipFac2",
		blipDistance = 5.0,
		permiss = "perm.recrutadormafia",
	
		coords = vec3(347.06,-13.5,83.0),
		spawnCoords = {
			vector4(348.78,-20.67,83.36,307.18)
		}
	},
	{
		type = "VipFac2",
		blipDistance = 5.0,
		permiss = "perm.gerenteisrael",
	
		coords = vec3(-1670.05,552.36,154.16),
		spawnCoords = {
			vector4(-1663.05,566.35,154.16,137.28)
		}
	},
	{
		type = "VipFac2",
		blipDistance = 5.0,
		permiss = "perm.gerentevaticano",
	
		coords = vec3(-1492.14,868.4,181.96),
		spawnCoords = {
			vector4(-1478.38,859.32,182.67,14.46)
		}
	},
	{
		type = "VipFac2",
		blipDistance = 5.0,
		permiss = "perm.gerentefranca",
	
		coords = vec3(1358.29,-724.74,67.18),
		spawnCoords = {
			vector4(1350.23,-729.05,66.99,73.91)
		}
	},
	{
		type = "VipFac2",
		blipDistance = 5.0,
		permiss = "perm.gerenteanubis",
	
		coords = vec3(-422.69,-45.19,46.22),
		spawnCoords = {
			vector4(-419.9,-36.15,46.22,343.28)
		}
	},
	{
		type = "VipFac1",
		blipDistance = 5.0,
		permiss = "perm.gerentefranca",
	
		coords = vec3(1339.55,-745.85,67.25),
		spawnCoords = {
			vector4(1334.29,-748.36,67.26,342.78)
		}
	},
	{
		type = "VipFac5",
		blipDistance = 5.0,
		permiss = "perm.gerenterussia",
	
		coords = vec3(902.59,361.64,112.49),
		spawnCoords = {
			vector4(903.72,358.82,112.32,127.45)
		}
	},
	{
		type = "VipFac5",
		blipDistance = 5.0,
		permiss = "perm.gerentekorea",
	
		coords = vec3(-219.07,317.66,97.04),
		spawnCoords = {
			vector4(-213.03,304.4,96.94,359.79)
		}
	},
	{
		type = "VipFac5",
		blipDistance = 5.0,
		permiss = "perm.gerenteirlanda",
	
		coords = vec3(-2312.58,-269.78,48.0),
		spawnCoords = {
			vector4(-2301.08,-282.84,47.52,227.35)
		}
	},
---
-- PUBLICAS COM BLIPMARKER
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(317.2,2622.65,44.45),
		spawnCoords = {
			vector4(330.8,2621.27,44.48,15.85)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(119.77,6626.23,31.95),
		spawnCoords = {
			vector4(121.14,6599.53,32.05,270.6)
		}
	},
	
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(4435.14,-4484.12,4.3),
		spawnCoords = {
			vector4(4438.37,-4490.07,4.57,112.55)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(3608.04,3761.08,30.08),
		spawnCoords = {
			vector4(3608.62,3769.55,29.64,90.93)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-1491.49,-662.05,28.95),
		spawnCoords = {
			vector4(-1486.31,-663.82,28.68,214.63),
			vector4(-1483.27,-661.62,28.68,214.7)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(463.47,218.91,103.1),
		spawnCoords = {
			vector4(462.35,222.88,102.83,71.17),
			vector4(463.57,227.37,102.92,70.15)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(1894.33,3715.22,32.76),
		spawnCoords = {
			vector4(1883.58,3715.01,32.69,118.78)
		}
	},

	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(2834.4,2806.84,57.41),
		spawnCoords = {
			vector4(2827.68,2804.3,57.15,175.8)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(56.14, -876.34, 30.65),
		spawnCoords = {
			vector4(50.77, -872.99, 30.16, 159.95),
			vector4(47.37, -872.04, 30.18, 158.99)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(100.55, -1073.4, 29.37),
		spawnCoords = {
			vector4(104.47, -1078.41, 28.91, 340.31),
			vector4(108.3, -1078.93, 28.91, 341.49),
			vector4(111.49, -1081.01, 28.91, 340.54)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(213.62, -809.05, 31.0),
		spawnCoords = {
			vector4(221.87, -804.02, 30.41, 248.97),
			vector4(223.96, -801.98, 30.36, 248.18),
			vector4(223.88, -799.23, 30.38, 250.24)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-348.92, -874.72, 31.31),
		spawnCoords = {
			vector4(-343.67, -875.07, 30.8, 167.69),
			vector4(-340.31, -876.92, 30.8, 167.6),
			vector4(-336.42, -876.58, 30.8, 168.2)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-1597.27, -1040.69, 13.01),
		spawnCoords = {
			vector4(-1607.76, -1041.37, 12.84, 320.59)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-1698.84, -945.23, 7.67),
		spawnCoords = {
			vector4(-1694.34, -944.63, 7.4, 343.76),
			vector4(-1691.35, -945.49, 7.4, 344.44)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-427.27, 1198.28, 325.76),
		spawnCoords = {
			vector4(-422.05, 1198.49, 325.37, 229.46),
			vector4(-420.98, 1202.99, 325.37, 233.34)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(596.72, 91.38, 93.13),
		spawnCoords = {
			vector4(599.29, 98.13, 92.64, 249.92),
			vector4(600.55, 102.02, 92.64, 249.86)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(275.5, -345.15, 45.17),
		spawnCoords = {
			vector4(283.05, -342.11, 44.65, 249.3),
			vector4(285.13, -339.19, 44.65, 248.95)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-1184.55, -1509.65, 4.65),
		spawnCoords = {
			vector4(-1183.31, -1495.81, 4.11, 124.65),
			vector4(-1185.56, -1493.64, 4.11, 123.72)
		}
	},

	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-141.73, 6279.67, 31.49),
		spawnCoords = {
			vector4(-137.73, 6275.77, 31.07, 225.67),
			vector4(-135.96, 6278.91, 31.07, 224.21)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-340.74, 266.97, 85.68),
		spawnCoords = {
			vector4(-349.3, 272.6, 84.84, 269.88),
			vector4(-348.69, 275.81, 84.81, 272.49)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-769.01,5597.28,33.6),
		spawnCoords = {
			vector4(-772.52,5578.38,33.06,88.8)
		}
	},
	{
		type = "Publica",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-1028.37,-3452.57,13.93),
		spawnCoords = {
			vector4(-1033.14,-3445.51,13.36,57.91)
		}
	},
---
-- PUBLICAFAC

	-- {
	-- 	type = "PublicaFac",
	-- 	blipDistance = 5.0,
	-- 	permiss = nil,

	-- 	coords = vec3(977.08,-2503.83,28.44),
	-- 	spawnCoords = {
	-- 		vector4(980.21,-2498.9,28.64,266.03)
	-- 	}
	-- },
---
-- PUBLICA HELI SEM BLIP
	
	{
		type = "PublicaHeli",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-2976.1,602.25,20.39),
		spawnCoords = {
			vector4(-2983.42,602.23,20.24,191.92)
		}
	},
	{
		type = "PublicaHeli",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-996.64,-2949.67,13.95),
		spawnCoords = {
			vector4(-1024.8,-2951.24,14.54,59.11)
		}
	},


	{
		type = "garagemJudiciario",
		blipDistance = 5.0,
		permiss = "perm.judiciario",

		coords = vec3(-180.32,-632.13,32.42), 
		spawnCoords = {
			vector4(-183.87,-627.74,32.05,248.85)
		}
	},
	{
		type = "garagemJudiciario",
		blipDistance = 5.0,
		permiss = "perm.judiciario",

		coords = vec3(-105.82,-600.76,36.26), 
		spawnCoords = {
			vector4(-106.2,-607.2,35.69,161.52)
		}
	},

	{
		type = "garagemJudiciarioWR",
		blipDistance = 5.0,
		permiss = "perm.judiciario",

		coords = vec3(-517.41,-231.52,35.87), 
		spawnCoords = {
			vector4(-506.95,-230.09,36.46,210.26)
		}
	},
	{
		type = "garagemHeliExercito", 
		blipDistance = 5.0,
		permiss = "perm.exercito",

		coords = vec3(-2246.49,3236.96,32.81), 
		spawnCoords = {
			vector4(-2226.02,3227.19,33.16,241.34)
		}
	},

	{
        type = "garagemPrisao",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1851.84,2586.04,45.68), 
        spawnCoords = {
            vector4(1854.64,2578.71,45.25, 267.56)
        }
    },
	{
        type = "garagemPrisao",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(2496.27,1591.76,32.72), 
        spawnCoords = {
			vector4(2501.44,1589.32,32.01,277.46)
        }
    },

	{
        type = "garagemHELIBOMBEIRO",
        blipDistance = 5.0,
        permiss = "perm.bombeiro",

        coords = vec3(202.41,-1659.03,41.79), 
        spawnCoords = {
			vector4(206.02,-1651.59,42.48,46.8)
        }
    },

	{
        type = "garagemHELIBOMBEIRO",
        blipDistance = 5.0,
        permiss = "perm.bombeiro",

        coords = vec3(1208.83,-1521.4,34.9), 
        spawnCoords = {
			vector4(1218.45,-1513.54,34.69,357.46)
        }
    },

	{
        type = "garagemBombeiro",
        blipDistance = 5.0,
        permiss = "perm.bombeiro",

        coords = vec3(1180.29,-1458.13,34.88), 
        spawnCoords = {
			vector4(1184.83,-1455.75,34.93,0.83)
        }
    },

	{
        type = "garagemHeliUnizk",
        blipDistance = 5.0,
        permiss = "perm.unizk",

        coords = vec3(1206.32,-1481.51,44.01), 
        spawnCoords = {
			vector4(1200.56,-1472.17,46.4,357.91)
        }
    },
	
	{
        type = "garagemHeliUnizk",
        blipDistance = 5.0,
        permiss = "perm.unizk",

        coords = vec3(-439.71,-318.19,78.17), 
        spawnCoords = {
			vector4(-447.13,-312.23,78.94,24.92)
        }
    },
	
	
	{
		type = "garagemAeroporto",
		blipDistance = 5.0,
		permiss = nil,

		coords = vec3(-793.84,-110.07,37.52), 
		spawnCoords = {
			vector4(-797.98,-115.51,36.93,242.16)
		}
	},

	{
        type = "garagemAeroporto",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1673.47,-907.49,8.29), 
        spawnCoords = {
			vector4(-1675.62,-903.29,7.8,321.15),
			vector4(-1677.83,-900.92,7.82,320.03),
			vector4(-1680.22,-898.94,8.34,316.2)
        }
    },

	{
        type = "garagemAeroporto",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(320.64,-1375.49,31.91), 
        spawnCoords = {
			vector4(314.39,-1370.5,31.31,326.08)
        }
    },

	{
        type = "garagemAeroporto",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1616.11,-1015.4,13.15), 
        spawnCoords = {
            vector4(-1609.86,-1014.98,13.07, 229.14)
        }
    },

	{
        type = "garagemAeroporto",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1608.29,-884.76,9.49), 
        spawnCoords = {
			vector4(-1615.19,-882.26,9.44,132.71),
			vector4(-1621.14,-879.11,9.42,137.84),
			vector4(-1625.06,-874.6,9.44,137.68)
        }
    },

	{
        type = "garagemAeroporto",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-448.31,-332.43,34.49), 
        spawnCoords = {
			vector4(-456.98,-332.45,33.85,82.76)
        }
    },

	{
        type = "garagemAeroporto",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1598.0,-1051.01,13.01), 
        spawnCoords = {
			vector4(-1595.97,-1048.21,13.01,320.59),
			vector4(-1592.83,-1050.14,13.01,321.57),
			vector4(-1590.21,-1052.37,13.01,322.44),
			vector4(-1587.45,-1054.23,13.01,320.72)
        }
    },


	{
        type = "garagemHospital",
        blipDistance = 5.0,
        permiss = "perm.unizk",

        coords = vec3(1128.76,-1501.83,34.69), 
        spawnCoords = {
			vector4(1124.83,-1498.45,34.42,92.33)
        }
    },
	
	{
		type = "garagemHeliCHOQUE",
		blipDistance = 5.0,
		permiss = "perm.choque",
	
		coords = vec3(454.36,-985.8,43.69), 
		spawnCoords = {
			vector4(449.91,-981.11,44.35,92.37)
		}
	},

	{
		type = "garagemCHOQUE",
		blipDistance = 5.0,
		permiss = "perm.choque",
	
		coords = vec3(433.94,-981.63,25.73), 
		spawnCoords = {
			vector4(436.84,-978.13,25.46,182.18)
		}
	},
	{
		type = "garagemCOT",
		blipDistance = 5.0,
		permiss = "perm.cot",
	
		coords = vec3(378.33,-1621.38,29.28), 
		spawnCoords = {
			vector4(388.9,-1612.9,29.02,232.41)

		}
	},
	{
		type = "garagemHELICOT",
		blipDistance = 5.0,
		permiss = "perm.cot",
	
		coords = vec3(369.04,-1602.3,38.79), 
		spawnCoords = {
			vector4(364.34,-1596.05,38.64,54.31)
		}
	},
	{
		type = "garagemGOTWR",
		blipDistance = 5.0,
		permiss = "perm.got",
	
		coords = vec3(368.5,-1623.65,29.28), 
		spawnCoords = {
			vector4(374.33,-1621.41,29.02,319.78)
		}
	},

	{
		type = "garagemCreche",
		blipDistance = 5.0,
		permiss = "perm.creche",
	
		coords = vec3(-447.61,6092.76,31.73), 
		spawnCoords = {
			vector4(-448.16,6094.15,30.9,318.23)
		}
	},
	{
		type = "garagemCreche",
		blipDistance = 5.0,
		permiss = "perm.creche",
	
		coords = vec3(788.38,-726.48,27.9), 
		spawnCoords = {
			vector4(784.2,-729.83,27.01,316.55)
		}
	},
	--[[{
		type = "garagemCHOQUE",
		blipDistance = 5.0,
		permiss = "perm.got",
	
		coords = vec3(386.46,-1628.08,29.28), 
		spawnCoords = {
			vector4(386.31,-1632.69,29.02,318.22)
		}
	},--]]
	
	{
		type = "garagemHELICORE",
		blipDistance = 5.0,
		permiss = "perm.core",

		coords = vec3(-2047.33,-444.6,19.39), 
		spawnCoords = {
			vector4(-2052.36,-458.41,19.75,320.23)
		}
	},
	{
		type = "garagemHELIPMERJ",
		blipDistance = 5.0,
		permiss = "perm.militar",

		coords = vec3(-1701.62,211.53,62.39),
		spawnCoords = {	
			vector4(-1705.6,219.8,62.75,24.35)
		}
	},


	{
		type = "garagemPMERJ",
		blipDistance = 5.0,
		permiss = "perm.militar",
	
		coords = vec3(-1666.53,227.53,62.39), 
		spawnCoords = {
			vector4(-1668.05,231.16,62.07,24.66)
		}
	},

	{
		type = "garagemPMERJ2",
		blipDistance = 5.0,
		permiss = "perm.militar",
	
		coords = vec3(-1678.31,222.02,62.39), 
		spawnCoords = {
			vector4(-1679.84,225.64,62.07,25.1)
		}
	},
	
	{
		type = "garagemCIVIL",
		blipDistance = 5.0,
		permiss = "perm.policiacivil",
	
		coords = vec3(-414.05,1171.55,325.82), 
		spawnCoords = {
			vector4(-411.69,1175.9,325.37,64.71)
		}
	},
	
	{
		type = "garagemHELICIVIL",
		blipDistance = 5.0,
		permiss = "perm.policiacivil",
	
		coords = vec3(-438.56,1103.98,335.11), 
		spawnCoords = {
			vector4(-432.34,1101.79,335.48,255.21)
		}
	},

	{
		type = "garagemCORE",
		blipDistance = 5.0,
		permiss = "perm.core",
	
		coords = vec3(-2042.12,-469.67,12.32), 
		spawnCoords = {
			vector4(-2036.51,-472.08,11.91,320.23)
		}
	},

	{
		type = "garagemHELIPRF",
		blipDistance = 5.0,
		permiss = "perm.prf",
	
		coords = vec3(2612.27,5365.5,48.14), 
		spawnCoords = {
			vector4(2613.3,5372.39,48.68,285.68)
		}
	},

	{
		type = "garagemHELIPRF",
		blipDistance = 5.0,
		permiss = "perm.prf",
	
		coords = vec3(-2610.21,2601.51,18.33), 
		spawnCoords = {
			vector4(-2614.95,2595.02,18.91,261.56),
			vector4(-2611.8,2609.0,18.92,83.94),
		}
	},
	
	{
		type = "garagemBOPE",
		blipDistance = 5.0,
		permiss = "perm.bope",
	
		coords = vec3(-1065.38,-850.25,5.04), 
		spawnCoords = {
			vector4(-1061.89,-853.43,4.62,216.37)
		}
	},
	{
		type = "garagemPRF",
		blipDistance = 5.0,
		permiss = "perm.prf",
	
		coords = vec3(2611.05,5352.77,47.38), 
		spawnCoords = {
			vector4(2605.27,5355.59,47.42,106.74)
		}
	},

	{
		type = "garagemPRF",
		blipDistance = 5.0,
		permiss = "perm.prf",
	
		coords = vec3(-2627.28,2595.38,17.27), 
		spawnCoords = {
			vector4(-2636.17,2594.27,16.97,82.28)
		}
	},
	
	{
		type = "garagemPF",
		blipDistance = 5.0,
		permiss = "perm.pf",
	
		coords = vec3(-781.71,-1295.6,5.24), 
		spawnCoords = {
			vector4(-795.77,-1297.17,4.43,348.99)
		}
	},

	{
		type = "garagemHELIPF",
		blipDistance = 5.0,
		permiss = "perm.pf",
	
		coords = vec3(-762.65,-1453.51,5.0), 
		spawnCoords = {
			vector4(-745.47,-1468.5,5.46,321.52)
		}
	},
	
	{
		type = "garagemHELIBOPE",
		blipDistance = 5.0,
		permiss = "perm.bope",
	
		coords = vec3(-1092.79,-837.03,37.69), 
		spawnCoords = {
			vector4(-1095.37,-831.19,37.81,308.56)
		}
	},
	
	{
		type = "garagemHELICOT",
		blipDistance = 5.0,
		permiss = "perm.cot",
	
		coords = vec3(-1690.39,-748.52,17.88), 
		spawnCoords = {
			vector4(-1690.48,-766.72,18.18,145.61)
		}
	},

	{
        type = "Taxista",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(899.83,-171.75,74.07), 
        spawnCoords = {
            vector4(907.47,-176.05,74.14,233.42)
        }
    },

	{
        type = "garagemEXERCITO",
        blipDistance = 5.0,
        permiss = "perm.exercito",

        coords = vec3(-2232.0,3260.09,32.81), 
        spawnCoords = {
			vector4(-2231.82,3270.14,32.5,238.3)
        }
    },

	
	{
        type = "garagemRace",
        blipDistance = 5.0,
        permiss = "perm.race",

        coords = vec3(56.11,115.27,79.08), 
        spawnCoords = {
			vector4(58.2,104.92,79.09,160.36)
        }
    },

	{
        type = "garagemMecanico2",
        blipDistance = 5.0,
        permiss = "perm.altacustoms",

        coords = vec3(-359.86,-148.78,38.25), 
        spawnCoords = {
			vector4(-368.78,-137.92,38.77,26.91)
        }
    },


	{
        type = "garagemMecanico",
        blipDistance = 5.0,
        permiss = "perm.mecanica",

        coords = vec3(-2200.82,-381.34,13.67), 
        spawnCoords = {
			vector4(-2200.65,-369.58,13.18,37.37)
        }
    },

	{
		type = "garagemJornal", -- GARAGEM JORNAL
		blipDistance = 5.0,
		permiss = "perm.jornal",

		coords = vec3(-558.88,-924.64,23.88), 
		spawnCoords = {
			vector4(-555.62,-929.53,23.64,269.33)
		}
	},

	{
		type = "heliJornal", -- GARAGEM JORNAL
		blipDistance = 5.0,
		permiss = "perm.jornal",

		coords = vec3(-577.12,-927.92,36.83), 
		spawnCoords = {
			vector4(-583.2,-930.48,37.22,91.53)
		}
	},

	{
		type = "heliJudiciario", -- GARAGEM JORNAL
		blipDistance = 5.0,
		permiss = "perm.judiciario",

		coords = vec3(-553.91,-254.95,36.58), 
		spawnCoords = {
			vector4(-545.16,-255.33,35.94,251.2)
		}
	},


	{
        type = "garagemHospital",
        blipDistance = 5.0,
        permiss = "perm.unizk",

        coords = vec3(-496.28,-329.98,34.51), 
        spawnCoords = {
            vector4(-490.58,-331.62,34.37, 265.45)
        }
    },

	{
        type = "ifood",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1178.71,-891.62,13.73), 
        spawnCoords = {
            vector4(-1173.28,-893.84,13.85,302.1)
        }
    },

	{
        type = "PublicaInicial",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(545.93,-225.23,51.04), 
        spawnCoords = {
            vector4(537.26,-224.45,50.67,123.72),
            vector4(537.01,-231.0,50.13,126.27),
            vector4(535.88,-238.83,49.54,127.43),
        }
    },
	
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(967.18,-145.84,74.34), 
        spawnCoords = {
            vector4(968.15,-154.0,73.5,238.15)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-396.58,-117.29,38.64), 
        spawnCoords = {
            vector4(-388.23,-114.69,38.7,37.82)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(70.42,96.24,79.06), 
        spawnCoords = {
            vector4(79.48,97.13,78.91,70.48)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1654.18,233.31,62.39), 
        spawnCoords = {
            vector4(-1659.13,243.3,62.11,28.3)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(2579.81,5353.96,44.69), 
        spawnCoords = {
            vector4(2575.89,5354.85,44.3,17.28)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(444.36,-1011.61,28.54), 
        spawnCoords = {
            vector4(442.45,-1019.73,28.64,93.25)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1649.76,-813.24,10.75), 
        spawnCoords = {
            vector4(-1649.85,-805.35,10.75,52.96)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1218.61,-1459.13,34.79), 
        spawnCoords = {
            vector4(1216.48,-1445.22,34.98,84.21)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-135.78,897.24,235.64), 
        spawnCoords = {
            vector4(-132.67,903.04,235.8,253.16)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2178.47,-399.58,13.41), 
        spawnCoords = {
            vector4(-2182.95,-373.2,13.21,168.35)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-808.25,-741.59,23.79), 
        spawnCoords = {
            vector4(-809.68,-753.73,22.65,91.43)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1092.14,354.2,68.49), 
        spawnCoords = {
            vector4(-1097.92,362.54,68.6,358.97)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-171.82,-1598.65,34.22), 
        spawnCoords = {
            vector4(-174.27,-1596.22,34.22,324.2)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-135.78,897.24,235.64), 
        spawnCoords = {
            vector4(-132.67,903.04,235.8,253.16)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-3220.89,828.35,8.93), 
        spawnCoords = {
            vector4(-3220.91,832.87,9.0,303.58)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1668.72,-301.89,51.73), 
        spawnCoords = {
            vector4(-1677.75,-308.53,51.41,233.81)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-422.62,-344.09,24.23), 
        spawnCoords = {
            vector4(-428.32,-334.04,23.93,198.65)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1517.84,66.97,56.99), 
        spawnCoords = {
            vector4(-1512.38,64.77,56.46,283.51)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1220.06,-1041.52,47.11), 
        spawnCoords = {
            vector4(1220.51,-1036.65,46.83,96.74)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(3041.79,3002.39,84.16), 
        spawnCoords = {
            vector4(3037.69,3003.06,83.84,18.65)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(357.91,-29.4,82.99), 
        spawnCoords = {
            vector4(355.79,-25.3,83.07,308.2)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-174.98,-1257.01,32.59), 
        spawnCoords = {
			vector4(-188.82,-1267.26,31.32,180.15)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(895.86,343.31,112.3), 
        spawnCoords = {
            vector4(895.55,336.9,112.07,38.9)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1203.76,-218.8,70.45), 
        spawnCoords = {
            vector4(1207.5,-216.15,70.48,168.94)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-810.29,158.18,71.49), 
        spawnCoords = {
            vector4(-818.78,158.17,70.62,106.46)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-219.28,289.22,92.96), 
        spawnCoords = {
            vector4(-212.22,284.95,92.81,269.34)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-234.98,-326.74,30.09), 
        spawnCoords = {
            vector4(-238.33,-323.96,30.04,7.37)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-124.53,-1548.22,34.12), 
        spawnCoords = {
            vector4(-119.72,-1546.39,33.95,228.91)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1235.14,838.38,193.37), 
        spawnCoords = {
            vector4(-1239.15,835.31,193.45,65.64)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1989.49,-227.65,34.91), 
        spawnCoords = {
            vector4(-1987.56,-220.87,34.64,326.15)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-3122.04,1369.64,22.6), 
        spawnCoords = {
            vector4(-3118.56,1363.89,22.61,234.12)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-3022.97,89.2,11.61), 
        spawnCoords = {
            vector4(-3027.38,99.54,11.61,318.71)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2182.24,-264.89,36.4), 
        spawnCoords = {
            vector4(-2185.04,-263.48,35.44,337.66)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1467.77,-29.64,54.68), 
        spawnCoords = {
            vector4(-1463.92,-26.46,54.61,234.19)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(3442.33,4887.74,35.99), 
        spawnCoords = {
            vector4(3431.82,4900.63,35.97,133.67)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1485.79,-1477.37,2.68), 
        spawnCoords = {
            vector4(-1480.29,-1473.25,2.29,283.5)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1001.79,-2529.33,28.46), 
        spawnCoords = {
            vector4(1001.77,-2521.67,28.37,354.89)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-131.56,997.89,235.76), 
        spawnCoords = {
            vector4(-124.32,998.97,235.73,193.82)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1373.23,1139.28,113.92), 
        spawnCoords = {
            vector4(1361.61,1139.07,113.84,93.31)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1682.08,555.45,154.36), 
        spawnCoords = {
            vector4(-1676.76,554.66,153.72,138.63)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1418.1,1108.82,114.41), 
        spawnCoords = {
            vector4(1431.78,1107.92,114.31,1.58)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1357.85,1161.51,113.7), 
        spawnCoords = {
            vector4(1361.6,1167.91,113.4,178.4)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2612.03,2681.5,17.27), 
        spawnCoords = {
            vector4(-2617.33,2686.91,17.0,83.91)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1167.32,-1761.05,3.96), 
        spawnCoords = {
            vector4(-1164.5,-1766.42,3.99,304.74)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1034.45,-854.08,5.05), 
        spawnCoords = {
            vector4(-1042.64,-858.14,4.62,57.03)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1521.28,-412.45,35.44), 
        spawnCoords = {
            vector4(-1520.99,-419.81,35.44,230.64)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1524.42,891.41,182.18), 
        spawnCoords = {
            vector4(-1533.59,886.58,181.76,197.75)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(430.84,-1548.98,29.23), 
        spawnCoords = {
            vector4(419.4,-1554.21,28.96,137.75)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-299.01,224.11,87.94), 
        spawnCoords = {
            vector4(-294.92,234.68,88.46,10.32)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(331.69,26.88,87.05), 
        spawnCoords = {
            vector4(322.94,15.28,84.05,341.45)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1588.41,114.39,60.07), 
        spawnCoords = {
            vector4(-1599.77,121.35,60.34,276.28)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1110.76,789.95,164.37), 
        spawnCoords = {
            vector4(-1114.18,781.28,162.79,282.64)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1110.76,789.95,164.37), 
        spawnCoords = {
            vector4(-1114.18,781.28,162.79,282.64)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1625.66,-2617.04,53.28), 
        spawnCoords = {
            vector4(1618.58,-2606.08,53.53,72.77)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1457.35,755.19,190.6), 
        spawnCoords = {
            vector4(-1457.39,746.63,190.57,179.19)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1062.8,609.33,139.87), 
        spawnCoords = {
            vector4(1075.22,614.22,138.12,323.77)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1399.45,-587.63,30.3), 
        spawnCoords = {
            vector4(-1403.35,-585.9,30.4,299.67)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1745.39,368.38,89.73), 
        spawnCoords = {
            vector4(-1753.67,364.4,89.54,116.51)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(928.44,55.09,81.1), 
        spawnCoords = {
            vector4(929.66,69.02,79.38,327.82)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-856.41,-1225.45,6.86), 
        spawnCoords = {
            vector4(-858.4,-1221.77,6.12,319.54)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-3002.22,108.39,13.93), 
        spawnCoords = {
            vector4(-2989.68,108.23,14.36,49.02)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1897.0,2044.63,140.91), 
        spawnCoords = {
            vector4(-1918.81,2048.21,140.73,256.94)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1095.4,-264.56,37.68), 
        spawnCoords = {
            vector4(-1100.86,-263.69,37.69,198.78)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-321.85,-1519.59,27.55), 
        spawnCoords = {
            vector4(-329.34,-1527.94,27.53,271.25)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2613.28,1682.17,141.86), 
        spawnCoords = {
            vector4(-2602.16,1675.77,141.94,110.67)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(173.86,703.9,209.06), 
        spawnCoords = {
            vector4(167.6,713.81,208.87,6.47)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1452.07,-2547.61,51.21), 
        spawnCoords = {
            vector4(1451.11,-2558.46,51.11,103.06)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-111.13,846.89,235.31), 
        spawnCoords = {
            vector4(-106.49,836.89,235.75,7.94)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-967.3,301.05,69.74), 
        spawnCoords = {
            vector4(-973.52,297.46,69.44,265.7)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-308.21,-724.86,28.02), 
        spawnCoords = {
            vector4(-313.89,-729.94,27.47,339.87)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(807.24,3431.15,57.86), 
        spawnCoords = {
			vector4(814.22,3435.9,57.93,182.34)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-761.93,375.02,87.87), 
        spawnCoords = {
			vector4(-758.51,370.4,87.96,180.32)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-955.59,-1483.97,5.16), 
        spawnCoords = {
			vector4(-965.24,-1485.24,5.0,110.0)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(696.11,-966.3,24.01), 
        spawnCoords = {
			vector4(688.91,-966.83,23.45,178.26)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(742.25,-542.84,26.93), 
        spawnCoords = {
			vector4(737.86,-535.31,26.93,154.29)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(392.06,-1635.52,29.28), 
        spawnCoords = {
			vector4(394.59,-1625.61,29.02,51.3)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-824.41,267.38,86.19), 
        spawnCoords = {
			vector4(-824.7,276.88,86.41,343.07)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1724.13,645.75,181.52), 
        spawnCoords = {
			vector4(-1720.2,635.28,181.52,222.82)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(722.37,-1093.04,22.22), 
        spawnCoords = {
			vector4(708.02,-1078.07,22.39,1.31)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2293.26,3321.72,32.82), 
        spawnCoords = {
			vector4(-2290.58,3310.87,32.91,150.64)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2603.61,1922.11,167.3), 
        spawnCoords = {
			vector4(-2596.77,1921.05,167.37,275.66)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-872.32,31.65,48.76), 
        spawnCoords = {
			vector4(-874.68,41.2,48.83,227.66)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(172.91,1694.38,227.39), 
        spawnCoords = {
			vector4(177.01,1686.72,228.48,196.22)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1075.67,687.26,156.05), 
        spawnCoords = {
			vector4(1076.26,691.52,156.32,242.1)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2543.32,3733.24,13.11), 
        spawnCoords = {
			vector4(-2529.85,3735.02,13.18,265.81)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1481.18,894.16,182.89), 
        spawnCoords = {
			vector4(-1487.76,888.31,182.58,249.0)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2669.06,1312.79,147.44), 
        spawnCoords = {
			vector4(-2663.69,1309.2,147.18,270.43)
        }
    },	
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1650.9,-239.4,54.98), 
        spawnCoords = {
			vector4(-1658.41,-234.9,54.96,69.89)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2022.85,-482.3,12.28), 
        spawnCoords = {
			vector4(-2025.42,-475.16,12.28,327.12)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1228.54,-1742.33,4.35), 
        spawnCoords = {
			vector4(-1227.34,-1746.52,4.57,237.69)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1258.28,-887.77,75.39), 
        spawnCoords = {
			vector4(1263.86,-878.98,75.39,334.11)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-3274.18,529.1,12.27), 
        spawnCoords = {
			vector4(-3295.27,519.49,12.33,121.21)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-148.18,593.4,203.87), 
        spawnCoords = {
			vector4(-147.38,602.3,203.33,85.25)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-540.71,-237.65,36.73), 
        spawnCoords = {
			vector4(-544.12,-246.63,36.4,206.93)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2540.8,-1802.45,3.96), 
        spawnCoords = {
			vector4(-2533.67,-1794.06,3.69,305.66)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2039.48,-133.75,27.48), 
        spawnCoords = {
			vector4(-2035.19,-139.0,27.87,192.41)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1383.59,-750.58,67.2), 
        spawnCoords = {
			vector4(1367.23,-746.16,67.2,54.06)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1371.62,-727.2,67.18), 
        spawnCoords = {
			vector4(1368.89,-731.19,67.21,102.35)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-3090.51,1753.92,36.11), 
        spawnCoords = {
			vector4(-3084.71,1759.03,36.11,337.06)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(5765.75,-7084.29,7.6), 
        spawnCoords = {
			vector4(5768.05,-7080.06,7.6,179.56)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1464.7,-795.37,113.25), 
        spawnCoords = {
			vector4(1460.13,-789.16,113.1,1.54)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-413.18,-33.56,46.47), 
        spawnCoords = {
			vector4(-417.24,-31.26,46.27,31.81)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-246.38,-1161.67,23.0), 
        spawnCoords = {
			vector4(-239.27,-1170.31,23.0,357.67)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(700.49,-254.1,62.5), 
        spawnCoords = {
			vector4(697.5,-260.25,61.96,127.51)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(709.31,-356.65,42.24), 
        spawnCoords = {
			vector4(707.65,-350.04,42.58,45.14)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1357.68,4376.91,44.33), 
        spawnCoords = {
			vector4(1358.8,4372.09,44.33,272.76)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1372.54,-2051.49,52.0), 
        spawnCoords = {
			vector4(1372.3,-2061.63,52.07,310.79)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1351.98,4377.99,44.33), 
        spawnCoords = {
			vector4(1354.0,4371.01,44.31,274.96)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-168.29,-1168.39,18.87), 
        spawnCoords = {
			vector4(-157.14,-1165.95,18.23,270.63)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(140.93,-1299.09,29.2), 
        spawnCoords = {
			vector4(140.48,-1303.64,29.1,119.34)
        }
    },

	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1580.36,-83.68,54.14), 
        spawnCoords = {
			vector4(-1572.76,-82.07,54.14,268.96)
        }
    },

	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1439.27,-664.97,26.79), 
        spawnCoords = {
            vector4(-1441.55,-677.36,26.44,112.89)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-217.46,-1625.6,44.28), 
        spawnCoords = {
			vector4(-225.05,-1623.83,44.01,268.68)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2239.91,-396.47,27.8), 
        spawnCoords = {
            vector4(-2233.0,-388.0,27.82,317.05)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(80.27,162.52,106.57), 
        spawnCoords = {
            vector4(85.22,169.11,106.52,341.72)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-340.81,-133.76,60.52), 
        spawnCoords = {
            vector4(-342.14,-142.56,60.61,120.83)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-3257.14,832.66,2.91), 
        spawnCoords = {
            vector4(-3259.06,840.0,3.37,125.18)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1023.12,-136.8,74.19), 
        spawnCoords = {
            vector4(1019.73,-148.81,74.19,146.44)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1202.99,-212.21,72.29), 
        spawnCoords = {
            vector4(1196.72,-208.36,72.94,39.03)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1965.11,-235.21,93.74), 
        spawnCoords = {
            vector4(-1975.63,-230.51,95.45,57.13)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(472.45,-1505.86,40.81), 
        spawnCoords = {
            vector4(470.52,-1493.89,43.54,287.53)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1441.75,1109.29,114.29), 
        spawnCoords = {
            vector4(1451.12,1110.94,114.95,85.66)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1673.78,549.01,154.04), 
        spawnCoords = {
            vector4(-1658.45,554.25,154.97,225.18)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1270.86,-1057.79,40.78), 
        spawnCoords = {
            vector4(1270.08,-1065.07,41.4,145.46)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(394.36,28.59,93.2), 
        spawnCoords = {
            vector4(388.66,33.84,93.85,26.02)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1594.73,105.12,60.66), 
        spawnCoords = {
            vector4(-1605.65,102.82,63.39,93.42)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1092.79,-837.03,37.69), 
        spawnCoords = {
            vector4(-1095.37,-831.19,37.81,308.56)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(475.59,-1501.96,43.24), 
        spawnCoords = {
            vector4(471.38,-1493.96,43.07,357.94)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2036.78,-130.87,27.84), 
        spawnCoords = {
            vector4(-2026.33,-138.6,28.14,205.94)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-334.85,150.35,87.1), 
        spawnCoords = {
            vector4(-330.39,161.27,87.57,184.3)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(2955.38,2935.53,89.91), 
        spawnCoords = {
            vector4(2946.08,2930.29,89.46,137.04)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1082.45,838.05,168.9), 
        spawnCoords = {
            vector4(-1086.05,849.63,171.18,95.01)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1310.38,-743.74,67.25), 
        spawnCoords = {
            vector4(1311.7,-757.49,67.25,151.28)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1490.91,686.35,192.0), 
        spawnCoords = {
            vector4(-1498.33,688.59,191.89,88.6)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-779.57,775.19,213.2), 
        spawnCoords = {
            vector4(-770.14,769.97,213.86,198.8)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-3050.8,111.18,12.35), 
        spawnCoords = {
            vector4(-3049.85,138.14,11.58,356.98)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1281.7,757.38,190.82), 
        spawnCoords = {
            vector4(-1288.15,756.53,190.42,205.3)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-59.88,839.13,241.09), 
        spawnCoords = {
            vector4(-59.03,833.06,240.8,134.02)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-283.25,-730.08,130.52), 
        spawnCoords = {
			vector4(-278.79,-725.97,130.86,294.19)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(693.0,3438.68,57.74), 
        spawnCoords = {
			vector4(686.67,3438.07,57.46,1.47)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1718.75,-302.03,52.79), 
        spawnCoords = {
			vector4(-1722.09,-311.76,53.45,141.84)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-759.4,332.15,243.61), 
        spawnCoords = {
			vector4(-755.82,340.58,244.05,270.92)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-781.99,153.45,67.47), 
        spawnCoords = {
			vector4(-772.47,145.67,67.47,179.13)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-229.72,-1333.16,48.41), 
        spawnCoords = {
			vector4(-236.25,-1327.08,48.41,91.85)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(718.55,-542.21,28.34), 
        spawnCoords = {
			vector4(712.5,-546.55,28.27,141.83)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1796.18,452.79,128.31), 
        spawnCoords = {
			vector4(-1805.56,457.46,128.28,91.72)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-508.94,5006.05,153.55), 
        spawnCoords = {
			vector4(-503.3,5010.08,154.23,236.43)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-190.49,652.41,200.7), 
        spawnCoords = {
			vector4(-187.99,659.08,200.39,117.56)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2581.66,1877.56,167.32), 
        spawnCoords = {
			vector4(-2576.7,1870.71,167.07,128.73)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-920.78,65.49,51.24), 
        spawnCoords = {
			vector4(-928.87,64.84,50.57,49.23)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(182.46,1709.79,234.94), 
        spawnCoords = {
			vector4(174.85,1711.48,236.57,0.44)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-944.53,317.42,73.13), 
        spawnCoords = {
			vector4(-947.93,323.56,73.79,14.18)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-53.19,951.99,232.17), 
        spawnCoords = {
			vector4(-49.49,942.69,232.17,262.58)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1007.02,-1457.89,7.08), 
        spawnCoords = {
			vector4(-1013.72,-1463.44,7.36,117.15)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1486.49,823.14,183.49), 
        spawnCoords = {
			vector4(-1478.18,824.79,183.93,205.43)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1924.32,2051.13,140.83), 
        spawnCoords = {
			vector4(-1915.21,2045.61,140.44,342.98)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1706.98,-185.57,58.3), 
        spawnCoords = {
			vector4(-1700.05,-179.8,58.1,293.15)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-358.77,-1541.14,36.33), 
        spawnCoords = {
			vector4(-346.81,-1541.6,36.75,269.7)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1286.92,-851.67,78.45), 
        spawnCoords = {
			vector4(1284.73,-842.66,78.45,76.91)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-3422.22,539.82,12.42), 
        spawnCoords = {
			vector4(-3429.42,541.89,13.08,55.44)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-2526.4,-1717.58,7.85), 
        spawnCoords = {
			vector4(-2518.7,-1709.12,8.51,333.5)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(712.98,-1032.39,21.9), 
        spawnCoords = {
			vector4(703.67,-1035.44,22.75,261.84)
        }
    },

	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(5820.06,-7027.37,5.95), 
        spawnCoords = {
			vector4(5811.62,-7024.56,5.83,87.33)
        }
    },

	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-418.97,-41.86,46.22), 
        spawnCoords = {
			vector4(-454.11,-32.22,54.71,354.74)
        }
    },

	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1313.12,-770.75,67.25), 
        spawnCoords = {
			vector4(1312.13,-757.71,67.7,154.7)
        }
    },

	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1530.63,-448.4,35.59), 
        spawnCoords = {
			vector4(-1526.55,-437.82,35.91,214.54)
        }
    },

	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-3073.56,1657.32,30.67), 
        spawnCoords = {
			vector4(-3074.33,1645.8,31.32,210.25)
        }
    },

	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-159.4,-1171.04,36.02), 
        spawnCoords = {
			vector4(-150.61,-1169.01,35.57,269.69)
        }
    },

	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(712.0,-299.03,59.24), 
        spawnCoords = {
			vector4(702.2,-294.4,59.83,101.43)
        }
    },

	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1425.41,-2530.62,55.45), 
        spawnCoords = {
			vector4(1420.5,-2527.33,55.99,9.96)
        }
    },

	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(-1102.04,348.03,74.14), 
        spawnCoords = {
			vector4(-1097.06,347.97,74.8,236.37)
        }
    },

	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(1057.56,712.17,164.96), 
        spawnCoords = {
			vector4(1055.13,709.72,168.84,225.01)
        }
    },
	{
        type = "PublicaHeliSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(2570.66,5307.54,44.62), 
        spawnCoords = {
			vector4(2577.33,5288.3,44.64,195.76)
        }
    },

	{
        type = "garagemPoliciaVip",
        blipDistance = 5.0,
        permiss = 'perm.vippolicia',
		checkService = true,

        coords = vec3(-1635.23,205.67,60.73), 
        spawnCoords = {
            vector4(-1626.89,201.63,60.37,207.01)
        }
    },
	{
        type = "garagemPoliciaVip",
        blipDistance = 5.0,
        permiss = 'perm.vippolicia',
		checkService = true,

        coords = vec3(-2035.35,-488.08,12.32), 
        spawnCoords = {
            vector4(-2033.92,-485.4,12.03,320.09)
        }
    },
	{
        type = "garagemPoliciaVip",
        blipDistance = 5.0,
        permiss = 'perm.vippolicia',
		checkService = true,

        coords = vec3(-386.7,1187.11,325.76), 
        spawnCoords = {
			vector4(-389.86,1189.88,325.5,96.24)
        }
    },
	{
        type = "garagemPoliciaVip",
        blipDistance = 5.0,
        permiss = 'perm.vippolicia',
		checkService = true,

        coords = vec3(-1665.75,-785.76,10.75), 
        spawnCoords = {
			vector4(-1663.6,-783.41,10.62,320.96)
        }
    },
	{
        type = "garagemPoliciaVip",
        blipDistance = 5.0,
        permiss = 'perm.vippolicia',
		checkService = true,

        coords = vec3(-772.07,-1277.85,5.14), 
        spawnCoords = {
			vector4(-772.89,-1281.63,4.87,171.39)
        }
    },
	{
        type = "garagemPoliciaVip",
        blipDistance = 5.0,
        permiss = 'perm.vippolicia',
		checkService = true,

        coords = vec3(-2598.36,2687.19,17.27), 
        spawnCoords = {
			vector4(-2602.23,2684.13,17.15,81.9)
        }
    },
	{
        type = "garagemPoliciaVip",
        blipDistance = 5.0,
        permiss = 'perm.vippolicia',
		checkService = true,

        coords = vec3(2622.85,5309.7,47.53), 
        spawnCoords = {
			vector4(2619.17,5309.07,47.28,105.77)
        }
    },
	{
        type = "garagemPoliciaVip",
        blipDistance = 5.0,
        permiss = 'perm.vippolicia',
		checkService = true,

        coords = vec3(-2182.15,3189.38,32.65), 
        spawnCoords = {
			vector4(-2178.4,3192.55,32.67,329.89)
        }
    },
	{
        type = "garagemPoliciaVip",
        blipDistance = 5.0,
        permiss = 'perm.vippolicia',
		checkService = true,

        coords = vec3(449.79,-1027.38,28.58), 
        spawnCoords = {
			vector4(446.27,-1025.74,28.51,5.11)
        }
    },
	{
        type = "garagemPoliciaVip",
        blipDistance = 5.0,
        permiss = 'perm.vippolicia',
		checkService = true,

        coords = vec3(-1051.49,-843.27,4.87), 
        spawnCoords = {
			vector4(-1052.55,-846.4,4.73,215.07)
        }
    },
	{
        type = "garagemMecanicaVip",
        blipDistance = 5.0,
        permiss = 'perm.vipmecanico',
		checkService = true,

        coords = vec3(68.63,106.22,79.19), 
        spawnCoords = {
			vector4(64.54,104.77,78.89,161.33)
        }
    },
	{
        type = "garagemMecanicaVip",
        blipDistance = 5.0,
        permiss = 'perm.vipmecanico',
		checkService = true,

        coords = vec3(-359.16,-130.57,38.69), 
        spawnCoords = {
			vector4(-360.02,-127.52,38.47,71.62)
        }
    },
	{
        type = "garagemMecanicaVip",
        blipDistance = 5.0,
        permiss = 'perm.vipmecanico',
		checkService = true,

        coords = vec3(-2174.87,-366.79,13.16), 
        spawnCoords = {
			vector4(-2175.57,-370.73,12.86,168.55)
        }
    },
	{
        type = "garagemHospitalVip",
        blipDistance = 5.0,
        permiss = 'perm.vipmedico',
		checkService = true,

        coords = vec3(-450.39,-347.86,34.49), 
        spawnCoords = {
			vector4(-456.09,-347.22,34.24,80.93)
        }
    },
	{
        type = "garagemBombeiroVip",
        blipDistance = 5.0,
        permiss = 'perm.vipbombeiro',
		checkService = true,

        coords = vec3(1178.59,-1461.37,34.88 ), 
        spawnCoords = {
			vector4(1182.8,-1461.75,34.56,1.41)
        }
    },
	{
        type = "PublicaBarcosSemBlip",
        blipDistance = 5.0,
        permiss = nil,
		checkService = true,

        coords = vec3(-3376.65,591.78,3.67), 
        spawnCoords = {
			vector4(-3390.11,609.95,0.52,29.47)
        }
    },
	{
        type = "PublicaBarcosSemBlip",
        blipDistance = 5.0,
        permiss = nil,
		checkService = true,

        coords = vec3(-2585.06,-1757.3,6.44), 
        spawnCoords = {
			vector4(-2617.16,-1810.57,0.45,136.7)
        }
    },

	{
        type = "PublicaBarcosSemBlip",
        blipDistance = 5.0,
        permiss = nil,
		checkService = true,

        coords = vec3(5852.92,-7100.86,1.36), 
        spawnCoords = {
			vector4(5892.64,-7090.21,-0.62,244.18)
        }
    },
	{
        type = "PublicaBarcosSemBlip",
        blipDistance = 5.0,
        permiss = nil,
		checkService = true,

        coords = vec3(-3207.4,1697.36,4.95), 
        spawnCoords = {
			vector4(-3210.75,1701.72,0.17,105.19)
        }
    },
	{
        type = "PublicaBarcosSemBlip",
        blipDistance = 5.0,
        permiss = nil,
		checkService = true,

        coords = vec3(-3078.75,31.52,1.8), 
        spawnCoords = {
			vector4(-3111.28,-2.01,0.59,137.43)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(855.54,-2095.76,30.53), 
        spawnCoords = {
            vector4(867.35,-2108.25,30.41,282.64)
        }
    },
	{
        type = "PublicaSemBlip",
        blipDistance = 5.0,
        permiss = nil,

        coords = vec3(935.35,-1498.86,30.25), 
        spawnCoords = {
            vector4(941.97,-1498.77,30.16,265.960)
        }
    },
	
}