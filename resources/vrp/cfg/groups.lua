local cfg = {}

cfg.groups = {
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ADMINISTRAÇÃO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["paulinho"] = { _config = { gtype = "staff", salario = 0 }, "paulinho.permissao", "dv.permissao", "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao", "perm.ptr.staff","player.som", "perm.algemar" },

	["TOP1"] = { _config = { gtype = "staff", salario = 0 }, "perm.top1", "perm.mochilastaff",  "perm.spec", "perm.chatstaff", "perm.instagrammod", "perm.setroupas", "perm.abrirmalas", "admin.permissao", "dv.permissao", "ticket.permissao", "developer.permissao","player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao", "perm.ptr.staff","player.som", "perm.algemar" },

	["developerlotusgroup@445"] = { _config = { gtype = "staff", salario = 0 }, "perm.propmanager", "perm.mochilastaff", "perm.respilegal", "diretor.permissao", "perm.instagrammod", "perm.setroupas", "perm.abrirmalas", "admin.permissao", "dv.permissao", "ticket.permissao", "developer.permissao","player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao", "perm.ptr.staff","player.som", "perm.algemar" },
	["developerofflotusgroup@445"] = { _config = { gtype = "staff", salario = 0 }, "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec","perm.mochilastaff", "perm.user", "staffoff.permissao", "perm.ptr.staff", "perm.algemar" },
	["adminlotusgroup@445"] = { _config = { gtype = "staff", salario = 20000 }, "perm.propmanager", "admin.permissao", "dv.permissao", "ticket.permissao", "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao", "perm.ptr.staff", "perm.algemar" },
	["adminofflotusgroup@445"] = { _config = { gtype = "staff", salario = 0 }, "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec","perm.user", "staffoff.permissao", "perm.ptr.staff", "perm.algemar" },
	["moderadorlotusgroup@445"] = { _config = { gtype = "staff", salario = 15000 }, "perm.propmanager", "moderador.permissao", "dv.permissao", "ticket.permissao", "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao", "perm.ptr.staff", "perm.algemar" },
	["moderadorofflotusgroup@445"] = { _config = { gtype = "staff", salario = 0 }, "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec","perm.user", "staffoff.permissao", "perm.ptr.staff", "perm.algemar" },
	["suportelotusgroup@445"] = { _config = { gtype = "staff", salario = 10000 }, "suporte.permissao", "dv.permissao", "ticket.permissao", "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao", "perm.ptr.staff", "perm.algemar" },
	["suporteofflotusgroup@445"] = { _config = { gtype = "staff", salario = 0 }, "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec","perm.user", "staffoff.permissao", "perm.ptr.staff", "perm.algemar" },
	["user"] = { "perm.user"},
	["investidoranjo"] = { _config = { gtype = "staff" }, "investidoranjo.permissao" },
	["streamer"] = { _config = { salario = nil, ptr = nil }, "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "streamer.permissao"}, 

	-- ["diretorlotusgroup@445"] = { _config = { gtype = "staff", salario = 20000 }, "perm.propmanager", "perm.mochilastaff", "perm.setroupas", "perm.instagrammod", "player.som", "diretor.permissao", "admin.permissao", "dv.permissao", "ticket.permissao", "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao", "perm.ptr.staff", "perm.algemar" },
	-- ["diretorofflotusgroup@445"] = { _config = { gtype = "staff", salario = 0 }, "perm.mochilastaff", "perm.user", "staffoff.permissao", "perm.ptr.staff", "perm.algemar" },

	["respilegallotusgroup@445"] = { _config = { gtype = "staff", salario = 20000 }, "perm.propmanager", "perm.mochilastaff", "perm.instagrammod", "perm.setroupas", "perm.respilegal", "admin.permissao", "dv.permissao", "ticket.permissao", "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao", "perm.ptr.staff", "perm.algemar" },
	["respilegalofflotusgroup@445"] = { _config = { gtype = "staff", salario = 0 }, "perm.mochilastaff", "perm.user", "staffoff.permissao", "perm.ptr.staff", "perm.algemar" },
	
	["resppolicialotusgroup@445"] = { _config = { gtype = "staff", salario = 20000 }, "perm.propmanager", "perm.instagrammod", "perm.setroupas", "perm.resppolicia", "admin.permissao", "dv.permissao", "ticket.permissao", "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall","spec.permissao", "mqcu.permissao", "perm.ptr.staff", "perm.algemar" },
	["resppoliciaofflotusgroup@445"] = { _config = { gtype = "staff", salario = 0 }, "perm.mochilastaff", "perm.user", "staffoff.permissao", "perm.ptr.staff", "perm.algemar" },
	
	["cc"] = { _config = { gtype = "cc", salario = 30000 }, "perm.cc", "player.blips", "player.noclip", "player.teleport", "player.secret", "player.spec", "player.wall", "spec.permissao" },
	
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	-- VIPS
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["Inicial"] = { _config = { gtype = "inicial", salario = 3000, ptr = nil }, "perm.vips", "perm.inicial" },
	["Bronze"] = { _config = { gtype = "bronze", salario = 4000, ptr = nil }, "perm.vips", "perm.bronze","perm.booster" },
	["Prata"] = { _config = { gtype = "prata", salario = 6000, ptr = nil }, "perm.vips", "perm.prata", "perm.booster" },
	["Ouro"] = { _config = { gtype = "ouro", salario = 8000, ptr = nil }, "perm.vips", "perm.attachs", "perm.ouro", "perm.booster","perm.roupas" },
	["Platina"] = { _config = { gtype = "platina", salario = 10000, ptr = nil }, "perm.vips", "perm.attachs", "perm.platina", "perm.booster","perm.roupas" },
	["Diamante"] = { _config = { gtype = "diamante", salario = 15000, ptr = nil }, "perm.vips", "perm.attachs", "perm.diamante", "perm.booster","perm.roupas","perm.mochila"},
	["Esmeralda"] = { _config = { gtype = "esmeralda", salario = 20000, ptr = nil }, "perm.vips", "perm.attachs", "perm.esmeralda", "perm.booster", "perm.roupas", "perm.mochila","player.som" },
	["Safira"] = { _config = { gtype = "safira", salario = 30000, ptr = nil }, "perm.vips", "perm.attachs", "perm.safira", "perm.booster", "perm.roupas", "perm.mochila","player.som" },
	["Rubi"] = { _config = { gtype = "rubi", salario = 40000, ptr = nil }, "perm.vips", "perm.attachs", "perm.rubi", "perm.booster", "perm.roupas", "perm.mochila","player.som"},
	["Altarj"] = { _config = { gtype = "altarj", salario = 60000, ptr = nil }, "perm.vips", "perm.attachs", "perm.altarj", "perm.booster", "perm.roupas", "perm.mochila","player.som" },
	["Supremorj"] = { _config = { gtype = "supremorj", salario = 80000, ptr = nil }, "perm.vips", "perm.attachs", "perm.supremorj", "perm.booster", "perm.roupas", "perm.mochila","player.som" },

	["VipPolicia"] = { _config = { gtype = "vippolicia", salario = 20000, ptr = nil }, "perm.attachs", "perm.mochila", "perm.deathtime","perm.roupas" },
	--["VipSaoJoao"] = { _config = { gtype = "vipsaojoao", salario = 30000, ptr = nil }, "perm.vips", "perm.attachs", "player.som", "perm.verificado", "perm.vipsaojoao", "perm.booster", "perm.roupas", "perm.mochila", "player.som" },
	["VipCrianca"] = { _config = { gtype = "vipcrianca", salario = 25000, ptr = nil }, "perm.vipcrianca", "perm.attachs", "perm.mochila", "player.som", "perm.verificado", "perm.roupas", 'perm.fixvip' },
	["VipSetembro"] = { _config = { gtype = "vipsetembro", salario = 30000, ptr = nil }, "perm.vipsetembro", "perm.roupas", "perm.mochila",  "perm.attachs", "player.som", "perm.fixvip", "perm.verificado" },
	["VipHalloween"] = { _config = { gtype = "viphalloween", salario = 25000, ptr = nil }, "perm.viphalloween", "perm.carreta", "perm.attachs", "perm.mochila", "player.som", "perm.verificado", "perm.roupas", "perm.fixvip"},
	
	["Plastica"] = { _config = { salario = nil, ptr = nil }, "perm.plastica" },

	["SalarioGerente"] = { _config = { salario = 6000, ptr = nil }, "perm.salariogerente" },
	["SalarioPatrao"] = { _config = { salario = 9000, ptr = nil }, "perm.salariopatrao" },
	["SalarioVelhodalancha"] = { _config = { salario = 12000, ptr = nil }, "perm.salariovelhodalancha" },
	["SalarioCelebridade"] = { _config = { salario = 15000, ptr = nil }, "perm.salariocelebridade" },
	["SalarioMilionario"] = { _config = { salario = 25000, ptr = nil }, "perm.salariomilionario" },
	["SalarioDosDeuses"] = { _config = { salario = 40000, ptr = nil }, "perm.salariodosdeuses" },
	["SalarioDoMakakako"] = { _config = { salario = 100000, ptr = nil }, "perm.salariodomakakero" },


	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Bennys
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
["Lider [Mecanica]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Mecanica" }, "perm.chamadomec", "dv.permissao", "perm.arrastarmecanica", "perm.avisomc", "perm.gerentemecanica", "dv.permissao", "perm.mecanica", "perm.lidermecanica", "perm.tunar", "perm.snovato", "perm.gerente", "perm.baumecanica"},
["Sub-Lider [Mecanica]"] = { _config = { gtype = "org", salario = 4000, ptr = nil, orgName = "Mecanica" }, "perm.chamadomec", "dv.permissao", "perm.arrastarmecanica", "perm.avisomc", "perm.gerentemecanica", "perm.mecanica", "perm.tunar", "perm.lidermecanica", "perm.snovato", "perm.gerente", "perm.baumecanica"},
["Gerente [Mecanica]"] = { _config = { gtype = "org", salario = 3500, ptr = nil, orgName = "Mecanica" }, "perm.chamadomec", "dv.permissao", "perm.arrastarmecanica", "perm.avisomc", "perm.gerentemecanica", "perm.mecanica", "perm.tunar", "perm.snovato", "perm.gerente", "perm.baumecanica"},
["Membro [Mecanica]"] = { _config = { gtype = "org", salario = 3000, ptr = nil, orgName = "Mecanica" }, "perm.chamadomec", "perm.mecanica", "perm.tunar", "perm.snovato", "perm.baumecanica"},
["Novato [Mecanica]"] = { _config = { gtype = "org", salario = 2500, ptr = nil, orgName = "Mecanica" }, "perm.chamadomec", "perm.mecanica", "perm.tunar"},
["Recrutador [Mecanica]"] = { _config = { gtype = "org", salario = 2000, ptr = nil, orgName = "Mecanica" }, "perm.chamadomec", "perm.recrutador", "perm.mecanica", "perm.tunar"},



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- BENEFICIOS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["Estagiario"] = { _config = { gtype = "jobdois", salario = 5000, ptr = nil }, "perm.estagiario"},
	["Funcionario"] = { _config = { gtype = "jobtres", salario = 4000, ptr = nil }, "perm.funcionario"},
	["Gerente"] = { _config = { gtype = "jobquatro", salario = 6000, ptr = nil }, "perm.gerente"},
	["Patrao"] = { _config = { gtype = "jobcinco", salario = 8000, ptr = nil }, "perm.patrao"},
	["CasaDoFranklin"] = { _config = { gtype = "jobseis", salario = 0, ptr = nil }, "perm.franklin"},
	["spotify"] = { _config = { gtype = "spotify", salario = 0, ptr = nil },"player.som"},
	["Booster"] = { _config = { salario = nil, ptr = nil }, "perm.booster" },
	["Verificado"] = { _config = { salario = nil, ptr = nil }, "perm.verificado"},

	["cam"] = { _config = { salario = nil, ptr = nil }, "perm.cam"},
	["skin"] = { _config = { salario = nil, ptr = nil }, "perm.skin"},
	["ego"] = { _config = { salario = nil, ptr = nil }, "perm.ego"},
	["tracker"] = { _config = { salario = nil, ptr = nil }, "perm.tracker"},
	
	["valecasa"] = { _config = { salario = nil, ptr = nil }, "valecasa.permissao"}, 
	["valegaragem"] = { _config = { salario = nil, ptr = nil }, "valegaragem.permissao"}, 
	
	["zeroum"] = { _config = { salario = nil, ptr = nil }, "perm.zeroum"}, 
	["zerodois"] = { _config = { salario = nil, ptr = nil }, "perm.zerodois"}, 

	["valecasa5kk"] = { _config = { salario = nil, ptr = nil }, "valecasa5kk.permissao"}, 
	["valecasa7kk"] = { _config = { salario = nil, ptr = nil }, "valecasa7kk.permissao"}, 
	["valecasa10kk"] = { _config = { salario = nil, ptr = nil }, "valecasa10kk.permissao"}, 
	["valecasa100kk"] = { _config = { salario = nil, ptr = nil }, "valecasa100kk.permissao"}, 

	["malibu"] = { _config = { salario = nil, ptr = nil }, "perm.malibu"}, 
	["snakehouse"] = { _config = { salario = nil, ptr = nil }, "perm.snakehouse"}, 

	["delacruzhouse"] = { _config = { salario = nil, ptr = nil }, "perm.delacruzhouse"}, 
	["mansaoshelby"] = { _config = { salario = nil, ptr = nil }, "perm.mansaoshelby"}, 
	["casadolado"] = { _config = { salario = nil, ptr = nil }, "perm.casadolago"}, 
	["waleshouse"] = { _config = { salario = nil, ptr = nil }, "perm.waleshouse"}, 
	["adahouse"] = { _config = { gtype = "org", salario = nil, ptr = nil, orgType = "fMunicao" }, "perm.adahouse"}, 
	["aphouse"] = { _config = { salario = nil, ptr = nil }, "perm.aphouse"}, 
	["casadapraia"] = { _config = { salario = nil, ptr = nil }, "perm.casadapraia"}, 
	["casagta"] = { _config = { salario = nil, ptr = nil }, "perm.casagta"}, 
	["pozehouse"] = { _config = { salario = nil, ptr = nil }, "perm.pozehouse"}, 
	
	["manobras"] = { _config = { salario = nil, ptr = nil }, "perm.manobras"}, 
	["homesimples"] = { _config = { salario = nil, ptr = nil }, "perm.homesimples"},
	["scotthouse"] = { _config = { salario = nil, ptr = nil }, "perm.scotthouse"}, 
	["iatehouse"] = { _config = { salario = nil, ptr = nil }, "perm.iatehouse"}, 
	["CoberturaTeletubis"] = { _config = { salario = nil, ptr = nil }, "perm.coberturateletubis"}, 
	["malta"] = { _config = { salario = nil, ptr = nil }, "perm.malta"}, 


	["Vagas"] = { _config = { salario = nil, ptr = nil }, "perm.vagastres"},
	["VagasQuarenta"] = { _config = { salario = nil, ptr = nil }, "perm.vagasquarenta"},
	["vagas32"] = { _config = { salario = nil, ptr = nil }, "perm.vagas32"},
	["vagas30"] = { _config = { salario = nil, ptr = nil }, "perm.vagas30"},
	["vagas11"] = { _config = { salario = nil, ptr = nil }, "perm.vagas11"},
	["vagas15"] = { _config = { salario = nil, ptr = nil }, "perm.vagas15"},
	["vagas19"] = { _config = { salario = nil, ptr = nil }, "perm.vagas19"},

	["mansaoteletubis"] = { _config = { salario = nil, ptr = nil }, "perm.mansaoteletubis"},
	["cabanadocoringa"] = { _config = { salario = nil, ptr = nil }, "perm.cabanadocoringa"},
	["andradehouse"] = { _config = { salario = nil, ptr = nil }, "perm.andradehouse"},

	["CriadorDeConteudo"] = { _config = { salario = 3000, ptr = nil }, "perm.criadordeconteudo", "perm.roupas", "perm.mochila", "player.som"},
	["InfluencerAlta"] = { _config = { salario = 5000, ptr = nil }, "perm.influenceralta", "perm.roupas", "perm.mochila", "player.som", "perm.cam" },


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- OUTROS
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["Porte de Armas"] = { _config = { salario = nil, ptr = nil }, "perm.portearmas" },
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["CoronelPM"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "PoliciaMilitar" }, "dv.permissao", "perm.liderpolicia", "perm.avisopm", "perm.militar", "perm.countpolicia", "perm.malas", "perm.policia", "perm.policia.padrao", "perm.snovato", "perm.baupolicialider", "player.blips","perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal" }, 
	["TenenteCoronelPM"] = { _config = { gtype = "org", salario = 18000, ptr = true, orgName = "PoliciaMilitar" }, "dv.permissao", "perm.liderpolicia", "perm.avisopm", "perm.militar", "perm.countpolicia", "perm.malas","perm.policia", "perm.policia.padrao", "perm.snovato", "perm.baupolicialider", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["MajorPM"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "PoliciaMilitar" }, "dv.permissao", "perm.avisopm",  "perm.militar", "perm.countpolicia", "perm.malas","perm.policia", "player.blips", "perm.policia.padrao", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["ComandoChoquePM"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "PoliciaMilitar" }, "perm.liderpolicia", "perm.militar","perm.choque", "perm.abrirmalas", "perm.malas", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia"  },
	["ChoquePM"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "PoliciaMilitar" }, "perm.choque", "perm.malas", "perm.militar", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia"  },
	["ComandoGatePM"] = { _config = { gtype = "org", salario = 22000, ptr = true, orgName = "PoliciaMilitar" }, "perm.militar", "dv.permissao", "perm.avisopm", "perm.lidergate", "perm.gate", "perm.abrirmalas", "perm.countpolicia", "perm.malas", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["GatePM"] = { _config = { gtype = "org", salario = 15000, ptr = true, orgName = "PoliciaMilitar" }, "perm.militar", "perm.gate", "perm.countpolicia", "perm.malas", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["ComandoSpeedPM"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "PoliciaMilitar" }, "perm.liderpolicia", "perm.militar","perm.speed", "perm.abrirmalas", "perm.countpolicia","perm.speed", "perm.malas", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["SpeedPM"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "PoliciaMilitar" }, "perm.speed", "perm.countpolicia", "perm.militar","perm.malas", "perm.speed", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },	
	["ComandoRocamPM"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "PoliciaMilitar" }, "perm.liderpolicia", "perm.militar","perm.rocam", "perm.abrirmalas", "perm.countpolicia", "perm.malas","perm.rocam",  "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["RocamPM"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "PoliciaMilitar" }, "perm.rocam", "perm.countpolicia", "perm.militar","perm.malas", "perm.rocam", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["ComandoGrpaePM"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "PoliciaMilitar" }, "perm.liderpolicia", "perm.militar", "perm.grpae", "perm.abrirmalas",  "perm.countpolicia", "perm.malas","perm.grpae",  "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal" },
	["GrpaePM"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "PoliciaMilitar" }, "perm.militar", "perm.grpae", "perm.countpolicia", "perm.malas", "perm.grpae", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["CapitaoPM"] = { _config = { gtype = "org", salario = 16000, ptr = true , orgName = "PoliciaMilitar"}, "perm.militar", "perm.countpolicia", "perm.malas", "perm.policia", "perm.policia.padrao", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["PrimeiroTenentePM"] = { _config = { gtype = "org", salario = 15000, ptr = true, orgName = "PoliciaMilitar" },  "perm.militar", "perm.countpolicia", "perm.malas", "perm.policia", "perm.policia.padrao", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["SegundoTenentePM"] = { _config = { gtype = "org", salario = 14000, ptr = true, orgName = "PoliciaMilitar" }, "perm.militar", "perm.countpolicia", "perm.malas", "perm.policia", "perm.policia.padrao", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["SubTenentePM"] = { _config = { gtype = "org", salario = 13000, ptr = true, orgName = "PoliciaMilitar" },  "perm.militar", "perm.countpolicia", "perm.malas", "perm.policia", "perm.policia.padrao", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["PrimeiroSargentoPM"] = { _config = { gtype = "org", salario = 12000, ptr = true, orgName = "PoliciaMilitar" },  "perm.militar", "perm.countpolicia", "perm.malas", "perm.policia", "perm.policia.padrao", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["SegundoSargentoPM"] = { _config = { gtype = "org", salario = 11000, ptr = true, orgName = "PoliciaMilitar" },  "perm.militar", "perm.countpolicia", "perm.malas", "perm.policia", "perm.policia.padrao", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["TerceiroSargentoPM"] = { _config = { gtype = "org", salario = 10000, ptr = true, orgName = "PoliciaMilitar" },  "perm.militar", "perm.countpolicia", "perm.malas", "perm.policia", "perm.policia.padrao", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["CaboPM"] = { _config = { gtype = "org", salario = 9000, ptr = true, orgName = "PoliciaMilitar" }, "perm.militar",  "perm.countpolicia", "perm.policia", "player.blips", "perm.policia.padrao", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["SoldadoPM"] = { _config = { gtype = "org", salario = 8000, ptr = true, orgName = "PoliciaMilitar" }, "perm.militar",  "perm.countpolicia", "perm.policia", "player.blips", "perm.policia.padrao", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },
	["AlunoPM"] = { _config = { gtype = "org", salario = 7000, ptr = true, orgName = "PoliciaMilitar" }, "perm.militar", "perm.countpolicia", "perm.policia", "player.blips", "perm.policia.padrao", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal"  },

	["ComandanteGeralBOPE"] = { _config = { gtype = "org", salario = 24000, ptr = true, orgName = "Bope" }, "dv.permissao", "perm.avisopm", "perm.liderbope",   "perm.baubope", "perm.abrirmalas", "perm.countpolicia", "perm.malas","perm.bope",  "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SubComandanteBOPE"] = { _config = { gtype = "org", salario = 22000, ptr = true, orgName = "Bope" }, "dv.permissao", "perm.avisopm", "perm.liderbope",   "perm.baubope", "perm.abrirmalas", "perm.countpolicia", "perm.malas","perm.bope",  "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["CoronelBope"] = { _config =  { gtype = "org", salario = 20000, ptr = true, orgName = "Bope" }, "perm.avisopm",   "perm.baubope", "perm.abrirmalas", "perm.countpolicia", "perm.malas","perm.bope",  "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["TenenteCoronelBope"] = { _config = { gtype = "org", salario = 18000, ptr = true, orgName = "Bope" }, "perm.avisopm",  "perm.baubope", "perm.countpolicia", "perm.malas", "perm.bope", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["MajorBope"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "Bope" }, "perm.avisopm", "perm.baubope", "perm.countpolicia", "perm.malas", "perm.bope", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["CapitaoBope"] = { _config = { gtype = "org", salario = 15000, ptr = true, orgName = "Bope" }, "perm.avisopm",  "perm.baubope", "perm.countpolicia", "perm.malas", "perm.bope", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["PrimeiroTenenteBope"] = { _config = { gtype = "org", salario = 14000, ptr = true, orgName = "Bope" }, "perm.avisopm",  "perm.baubope", "perm.countpolicia", "perm.malas", "perm.bope", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SegundoTenenteBope"] = { _config = { gtype = "org", salario = 13000, ptr = true, orgName = "Bope" }, "perm.avisopm",  "perm.baubope", "perm.countpolicia", "perm.malas", "perm.bope", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SubTenenteBope"] = { _config = { gtype = "org", salario = 13000, ptr = true, orgName = "Bope" }, "perm.avisopm",  "perm.baubope", "perm.countpolicia", "perm.malas", "perm.bope", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["PrimeiroSargentoBope"] = { _config = { gtype = "org", salario = 12000, ptr = true, orgName = "Bope" },  "perm.baubope", "perm.countpolicia", "perm.malas", "perm.bope", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SegundoSargentoBope"] = { _config = { gtype = "org", salario = 11000, ptr = true, orgName = "Bope" },  "perm.baubope", "perm.countpolicia", "perm.malas", "perm.bope", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["TerceiroSargenteBope"] = { _config = { gtype = "org", salario = 10000, ptr = true, orgName = "Bope" },  "perm.baubope", "perm.countpolicia", "perm.malas", "perm.bope", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["CaboBope"] = { _config = { gtype = "org", salario = 9000, ptr = true, orgName = "Bope" },  "perm.baubope", "perm.countpolicia", "perm.malas", "perm.bope", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SoldadoBope"] = { _config = { gtype = "org", salario = 8000, ptr = true, orgName = "Bope" },  "perm.baubope", "perm.countpolicia", "perm.malas", "perm.bope", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["EstagiarioBope"] = { _config = { gtype = "org", salario = 7000, ptr = true, orgName = "Bope" },  "perm.baubope", "perm.countpolicia", "perm.malas", "perm.bope", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },

	["ComandanteGeralCHOQUE"] = { _config = { gtype = "org", salario = 24000, ptr = true, orgName = "Choque" }, "dv.permissao", "perm.avisopm", "perm.liderchoque",   "perm.bauchoque", "perm.abrirmalas", "perm.countpolicia", "perm.malas","perm.choque",  "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SubComandanteCHOQUE"] = { _config = { gtype = "org", salario = 22000, ptr = true, orgName = "Choque" }, "dv.permissao", "perm.avisopm", "perm.liderchoque",   "perm.bauchoque", "perm.abrirmalas", "perm.countpolicia", "perm.malas","perm.choque",  "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["CoronelCHOQUE"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "Choque" }, "dv.permissao", "perm.avisopm", "perm.liderchoque",   "perm.bauchoque", "perm.abrirmalas", "perm.countpolicia", "perm.malas","perm.choque",  "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["TenenteCoronelCHOQUE"] = { _config = { gtype = "org", salario = 18000, ptr = true, orgName = "Choque" },  "dv.permissao", "perm.avisopm",  "perm.bauchoque", "perm.countpolicia", "perm.malas", "perm.choque", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["MajorCHOQUE"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "Choque" },  "dv.permissao", "perm.avisopm",  "perm.bauchoque", "perm.countpolicia", "perm.malas", "perm.choque", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["CapitaoCHOQUE"] = { _config = { gtype = "org", salario = 15000, ptr = true, orgName = "Choque" }, "dv.permissao", "perm.avisopm",  "perm.bauchoque", "perm.countpolicia", "perm.malas", "perm.choque", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["PrimeiroTenenteCHOQUE"] = { _config = { gtype = "org", salario = 14000, ptr = true, orgName = "Choque" }, "perm.avisopm",  "perm.bauchoque", "perm.countpolicia", "perm.malas", "perm.choque", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SegundoTenenteCHOQUE"] = { _config = { gtype = "org", salario = 13000, ptr = true, orgName = "Choque" }, "perm.avisopm",  "perm.bauchoque", "perm.countpolicia", "perm.malas", "perm.choque", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SubTenenteCHOQUE"] = { _config = { gtype = "org", salario = 13000, ptr = true, orgName = "Choque" }, "perm.avisopm",  "perm.bauchoque", "perm.countpolicia", "perm.malas", "perm.choque", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["PrimeiroSargentoCHOQUE"] = { _config = { gtype = "org", salario = 12000, ptr = true, orgName = "Choque" },  "perm.bauchoque", "perm.countpolicia", "perm.malas", "perm.choque", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SegundoSargentoCHOQUE"] = { _config = { gtype = "org", salario = 11000, ptr = true, orgName = "Choque" },  "perm.bauchoque", "perm.countpolicia", "perm.malas", "perm.choque", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["TerceiroSargenteCHOQUE"] = { _config = { gtype = "org", salario = 10000, ptr = true, orgName = "Choque" },  "perm.bauchoque", "perm.countpolicia", "perm.malas", "perm.choque", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["CaboCHOQUE"] = { _config = { gtype = "org", salario = 9000, ptr = true, orgName = "Choque" },  "perm.bauchoque", "perm.countpolicia", "perm.malas", "perm.choque", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SoldadoCHOQUE"] = { _config = { gtype = "org", salario = 8000, ptr = true, orgName = "Choque" },  "perm.bauchoque", "perm.countpolicia", "perm.malas", "perm.choque", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["EstagiarioCHOQUE"] = { _config = { gtype = "org", salario = 7000, ptr = true, orgName = "Choque" },  "perm.bauchoque", "perm.countpolicia", "perm.malas", "perm.choque", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },


	["MarechalEXERCITO"] = { _config = { gtype = "org", salario = 25000, ptr = true, orgName = "Exercito" }, "perm.bauliderexercito", "dv.permissao", "perm.avisopm", "perm.liderexercito",  "perm.bauexercito", "perm.abrirmalas", "perm.countpolicia", "perm.malas","perm.exercito",  "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["GeneralEXERCITO"] = { _config = { gtype = "org", salario = 22000, ptr = true, orgName = "Exercito" }, "perm.bauliderexercito", "dv.permissao", "perm.avisopm", "perm.liderexercito",   "perm.bauexercito", "perm.abrirmalas", "perm.countpolicia", "perm.malas","perm.exercito",  "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["CoronelEXERCITO"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "Exercito" },  "perm.bauliderexercito", "dv.permissao", "perm.avisopm",  "perm.bauexercito", "perm.countpolicia", "perm.malas", "perm.exercito", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["TenenteCoronelEXERCITO"] = { _config = { gtype = "org", salario = 19000, ptr = true, orgName = "Exercito" }, "perm.bauliderexercito", "perm.avisopm",  "perm.bauexercito", "perm.countpolicia", "perm.malas", "perm.exercito", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["MajorEXERCITO"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "Exercito" },  "perm.bauexercito", "perm.countpolicia", "perm.malas", "perm.exercito", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["CapitaoEXERCITO"] = { _config = { gtype = "org", salario = 15000, ptr = true, orgName = "Exercito" },  "perm.bauexercito", "perm.countpolicia", "perm.malas", "perm.exercito", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["TenenteEXERCITO"] = { _config = { gtype = "org", salario = 14000, ptr = true, orgName = "Exercito" },  "perm.bauexercito", "perm.countpolicia", "perm.malas", "perm.exercito", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SubtenenteEXERCITO"] = { _config = { gtype = "org", salario = 12000, ptr = true, orgName = "Exercito" },  "perm.bauexercito", "perm.countpolicia", "perm.malas", "perm.exercito", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SargentoEXERCITO"] = { _config = { gtype = "org", salario = 10000, ptr = true, orgName = "Exercito" },  "perm.bauexercito", "perm.countpolicia", "perm.malas", "perm.exercito", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["CaboEXERCITO"] = { _config = { gtype = "org", salario = 8000, ptr = true, orgName = "Exercito" },  "perm.bauexercito", "perm.countpolicia", "perm.malas", "perm.exercito", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
	["SoldadoEXERCITO"] = { _config = { gtype = "org", salario = 7000, ptr = true, orgName = "Exercito" },  "perm.bauexercito", "perm.countpolicia", "perm.malas", "perm.exercito", "perm.policia", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpoliciaNormal", "perm.pftt"  },
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA FEDERAL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["ComandanteGeralPF"] = { _config = { gtype = "org", salario = 25000, ptr = true, orgName = "PoliciaFederal" }, "perm.baupf","perm.garagemdelpf","perm.pf", "perm.multar", "perm.prisao", "perm.baudelegado", "perm.avisopm",  "perm.abrirmalas", "perm.countfederal", "perm.chamadoscivil", "perm.baupoliciafederal", "perm.malas", "perm.policiafederal", "perm.snovato", "perm.baupoliciafederallider", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["DelegadoGeralPF"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "PoliciaFederal" }, "perm.baupf","perm.garagemdelpf","perm.pf", "perm.multar", "perm.prisao", "perm.baudelegado", "perm.avisopm",  "perm.abrirmalas", "perm.countfederal", "perm.chamadoscivil", "perm.baupoliciafederal", "perm.malas", "perm.policiafederal", "perm.snovato", "perm.baupoliciafederallider", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["DelegadoPF"] = { _config = { gtype = "org", salario = 18000, ptr = true, orgName = "PoliciaFederal" }, "perm.baupf","perm.garagemdelpf","perm.pf", "perm.multar", "perm.prisao", "perm.baudelegado", "perm.avisopm",  "perm.abrirmalas", "perm.countfederal", "perm.chamadoscivil", "perm.baupoliciafederal", "perm.malas", "perm.policiafederal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["DelegadoAdjuntoPF"] = { _config = { gtype = "org", salario = 15000, ptr = true, orgName = "PoliciaFederal" }, "perm.garagemdelpf","perm.pf", "perm.multar", "perm.prisao", "perm.baudelegado", "perm.avisopm",  "perm.abrirmalas", "perm.countfederal", "perm.chamadoscivil", "perm.baupoliciafederal", "perm.malas", "perm.policiafederal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["ComandoGTF"] = { _config = { gtype = "org", salario = 15000, ptr = true, orgName = "PoliciaFederal" }, "perm.pf", "perm.multar", "perm.prisao", "perm.baudelegado", "perm.avisopm",  "perm.abrirmalas", "perm.countfederal", "perm.chamadoscivil", "perm.baupoliciafederal", "perm.malas", "perm.policiafederal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["GTF"] = { _config = { gtype = "org", salario = 12000, ptr = true, orgName = "PoliciaFederal" }, "perm.pf", "perm.multar", "perm.prisao", "perm.baudelegado", "perm.avisopm",  "perm.abrirmalas", "perm.countfederal", "perm.chamadoscivil", "perm.baupoliciafederal", "perm.malas", "perm.policiafederal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["PeritoPF"] = { _config = { gtype = "org", salario = 12000, ptr = true, orgName = "PoliciaFederal" }, "perm.pf", "perm.multar", "perm.prisao",  "perm.avisopm",  "perm.abrirmalas", "perm.countfederal", "perm.chamadoscivil", "perm.baupoliciafederal", "perm.malas","perm.policiafederal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["EscrivaoPF"] = { _config = { gtype = "org", salario = 10000, ptr = true, orgName = "PoliciaFederal" }, "perm.pf", "perm.multar", "perm.prisao", "perm.avisopm",  "perm.countfederal", "perm.chamadoscivil", "perm.baupoliciafederal", "perm.malas", "perm.policiafederal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["AgentePF"] = { _config = { gtype = "org", salario = 8000, ptr = true, orgName = "PoliciaFederal" }, "perm.pf", "perm.countfederal", "perm.chamadoscivil", "perm.policiafederal", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- POLICIA CIVIL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	["ComandoGeralCivil"] = { _config = { gtype = "org", salario = 28000, ptr = true, orgName = "PoliciaCivil" }, "dv.permissao", "perm.baudelegado", "perm.avisopm",  "perm.abrirmalas", "perm.countcivil", "perm.chamadoscivil", "perm.baupoliciacivil", "perm.malas", "perm.policiacivil", "perm.snovato", "perm.baupoliciacivillider", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["DelegadoGeral"] = { _config = { gtype = "org", salario = 25000, ptr = true, orgName = "PoliciaCivil" }, "dv.permissao", "perm.baudelegado", "perm.avisopm",  "perm.abrirmalas", "perm.countcivil", "perm.chamadoscivil", "perm.baupoliciacivil", "perm.malas", "perm.policiacivil", "perm.snovato", "perm.baupoliciacivillider", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["Delegado"] = { _config = { gtype = "org", salario = 15000, ptr = true, orgName = "PoliciaCivil" }, "dv.permissao", "perm.baudelegado", "perm.avisopm",  "perm.abrirmalas", "perm.countcivil", "perm.chamadoscivil", "perm.baupoliciacivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["Perito"] = { _config = { gtype = "org", salario = 12000, ptr = true, orgName = "PoliciaCivil" }, "perm.avisopm",  "perm.abrirmalas", "perm.countcivil", "perm.chamadoscivil", "perm.baupoliciacivil", "perm.malas","perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["Escrivao"] = { _config = { gtype = "org", salario = 10000, ptr = true, orgName = "PoliciaCivil" }, "perm.avisopm",  "perm.countcivil", "perm.chamadoscivil", "perm.baupoliciacivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["ComandoInvestigativa"] = { _config = { gtype = "org", salario = 12000, ptr = true, orgName = "PoliciaCivil" }, "perm.abrirmalas", "perm.countcivil", "perm.chamadoscivil", "perm.baupoliciacivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["SubComandoInvestigativa"] = { _config = { gtype = "org", salario = 10000, ptr = true, orgName = "PoliciaCivil" }, "perm.abrirmalas", "perm.countcivil", "perm.chamadoscivil", "perm.baupoliciacivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["Investigador"] = { _config = { gtype = "org", salario = 9000, ptr = true, orgName = "PoliciaCivil" }, "perm.abrirmalas",  "perm.countcivil", "perm.chamadoscivil", "perm.baupoliciacivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["Agente"] = { _config = { gtype = "org", salario = 8000, ptr = true, orgName = "PoliciaCivil" }, "perm.countcivil", "perm.chamadoscivil", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["Recruta"] = { _config = { gtype = "org", salario = 7000, ptr = true, orgName = "PoliciaCivil" }, "perm.countcivil",  "perm.chamadoscivil", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["EstagiarioDraco"] = { _config = { gtype = "org", salario = 7000, ptr = true, orgName = "PoliciaCivil" }, "perm.countcivil",  "perm.chamadoscivil", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["AgenteDraco"] = { _config = { gtype = "org", salario = 7000, ptr = true, orgName = "PoliciaCivil" }, "perm.countcivil",  "perm.chamadoscivil", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["SubComandoDraco"] = { _config = { gtype = "org", salario = 7000, ptr = true, orgName = "PoliciaCivil" }, "perm.countcivil",  "perm.chamadoscivil", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["ComandoDraco"] = { _config = { gtype = "org", salario = 7000, ptr = true, orgName = "PoliciaCivil" }, "perm.countcivil",  "perm.chamadoscivil", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },

	["ComandoGeralCORE"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "Core" }, "dv.permissao","perm.baucore", "perm.avisopm", "perm.core", "perm.abrirmalas", "perm.countcivil", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["SubComandoCORE"] = { _config = { gtype = "org", salario = 18000, ptr = true, orgName = "Core" }, "dv.permissao","perm.baucore", "perm.avisopm", "perm.core",  "perm.abrirmalas", "perm.countcivil", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["EliteCORE"] = { _config = { gtype = "org", salario = 15000, ptr = true, orgName = "Core" }, "perm.baucore", "perm.avisopm", "perm.core", "perm.countcivil", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["OficialCORE"] = { _config = { gtype = "org", salario = 12000, ptr = true, orgName = "Core" }, "perm.baucore", "perm.core", "perm.countcivil", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["SargentoCORE"] = { _config = { gtype = "org", salario = 10000, ptr = true, orgName = "Core" }, "perm.baucore", "perm.core",  "perm.countcivil", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["RecrutaCORE"] = { _config = { gtype = "org", salario = 8000, ptr = true, orgName = "Core" }, "perm.core",  "perm.countcivil", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },



	["CoronelPRF"] = { _config = { gtype = "org", salario = 25000, ptr = true, orgName = "PRF" }, "perm.bauliderprf", "perm.barreira", "dv.permissao", "perm.bauprf", "perm.avisopm", "perm.prf", "perm.abrirmalas", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["SubComandoPRF"] = { _config = { gtype = "org", salario = 24000, ptr = true, orgName = "PRF" }, "perm.bauliderprf", "perm.barreira", "dv.permissao", "perm.bauprf", "perm.avisopm", "perm.prf", "perm.abrirmalas", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["SupervisorGeralPRF"] = { _config = { gtype = "org", salario = 23000, ptr = true, orgName = "PRF" }, "perm.bauliderprf", "perm.barreira", "dv.permissao", "perm.bauprf", "perm.avisopm", "perm.prf", "perm.abrirmalas", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["SupervisorPRF"] = { _config = { gtype = "org", salario = 22000, ptr = true, orgName = "PRF" }, "perm.bauliderprf", "perm.barreira", "dv.permissao", "perm.bauprf", "perm.avisopm", "perm.prf", "perm.abrirmalas", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["RecrutadorPRF"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "PRF" }, "perm.barreira", "dv.permissao", "perm.bauprf", "perm.avisopm", "perm.prf", "perm.abrirmalas", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["InspetorPRF"] = { _config = { gtype = "org", salario = 18000, ptr = true, orgName = "PRF" }, "perm.barreira", "dv.permissao", "perm.avisopm", "perm.prf", "perm.abrirmalas", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["ComandoGRRPRF"] = { _config = { gtype = "org", salario = 15000, ptr = true, orgName = "PRF" }, "perm.bauliderprf", "perm.barreira", "dv.permissao", "perm.avisopm", "perm.prf", "perm.abrirmalas", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["GRRPRF"] = { _config = { gtype = "org", salario = 14000, ptr = true, orgName = "PRF" }, "perm.bauliderprf", "perm.barreira", "dv.permissao", "perm.avisopm", "perm.prf", "perm.abrirmalas", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["AgenteEspecialPRF"] = { _config = { gtype = "org", salario = 13000, ptr = true, orgName = "PRF" }, "perm.barreira", "dv.permissao", "perm.avisopm", "perm.prf", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["AgentePRF"] = { _config = { gtype = "org", salario = 12000, ptr = true, orgName = "PRF" }, "perm.barreira", "dv.permissao", "perm.prf", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["Agente2PRF"] = { _config = { gtype = "org", salario = 11000, ptr = true, orgName = "PRF" }, "perm.barreira", "dv.permissao", "perm.prf", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["Agente3PRF"] = { _config = { gtype = "org", salario = 10000, ptr = true, orgName = "PRF" }, "dv.permissao", "perm.prf", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },
	["EstagiarioPRF"] = { _config = { gtype = "org", salario = 8000, ptr = true, orgName = "PRF" }, "dv.permissao", "perm.prf", "perm.chamadoscivil", "perm.malas", "perm.policiacivil", "player.blips", "perm.disparo", "perm.portasolicia", "perm.algemar", "perm.countpolicia", "perm.radiopm"  },

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- HOSPITAL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["Diretor"] = { _config = { gtype = "org", salario = 27000, ptr = true, orgName = "Hospital" }, "perm.chamadoshp", "dv.permissao", "perm.avisohp",  "perm.unizk", "perm.algemar" },
	["ViceDiretor"] = { _config = { gtype = "org", salario = 22000, ptr = true, orgName = "Hospital"}, "perm.chamadoshp", "dv.permissao", "perm.avisohp",  "perm.unizk", "perm.algemar" },
	["Gestao"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "Hospital"}, "perm.chamadoshp", "dv.permissao", "perm.avisohp",  "perm.unizk", "perm.algemar" },
	["Psiquiatra"] = { _config = { gtype = "org", salario = 19000, ptr = true, orgName = "Hospital"}, "perm.chamadoshp", "perm.unizk", "perm.algemar" },
	["Medico"] = { _config = { gtype = "org", salario = 18000, ptr = true, orgName = "Hospital"}, "perm.chamadoshp", "perm.unizk", "perm.algemar" },
	["Enfermeiro"] = { _config = { gtype = "org", salario = 17000, ptr = true, orgName = "Hospital"}, "perm.chamadoshp", "perm.unizk" },
	["Socorrista"] = { _config = { gtype = "org", salario = 16000, ptr = true, orgName = "Hospital"}, "perm.chamadoshp", "perm.unizk" },

	["CoronelBombeiro"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "Bombeiro" }, "perm.baubombeiro", "perm.chamadoshp", "perm.avisobombeiro",  "perm.bombeiro", "perm.algemar" },
	["TenenteCoronelBombeiro"] = { _config = { gtype = "org", salario = 18000, ptr = true, orgName = "Bombeiro"}, "perm.baubombeiro", "perm.chamadoshp", "perm.avisobombeiro",  "perm.bombeiro", "perm.algemar" },
	["MajorBombeiro"] = { _config = { gtype = "org", salario = 15000, ptr = true, orgName = "Bombeiro"}, "perm.chamadoshp", "perm.avisobombeiro",  "perm.bombeiro", "perm.algemar" },
	["CapitaoBombeiro"] = { _config = { gtype = "org", salario = 12000, ptr = true, orgName = "Bombeiro"}, "perm.chamadoshp", "perm.bombeiro", "perm.algemar" },
	["TenenteBombeiro"] = { _config = { gtype = "org", salario = 10000, ptr = true, orgName = "Bombeiro"}, "perm.chamadoshp", "perm.bombeiro", "perm.algemar" },
	["AspiranteBombeiro"] = { _config = { gtype = "org", salario = 8000, ptr = true, orgName = "Bombeiro"}, "perm.chamadoshp", "perm.bombeiro" },
	["AlunoOficialBombeiro"] = { _config = { gtype = "org", salario = 7000, ptr = true, orgName = "Bombeiro"}, "perm.chamadoshp", "perm.bombeiro" },

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- JUDICIARIO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["Desembargador"] = { _config = { gtype = "org", salario = 30000, ptr = nil, orgName = "Judiciario"}, "perm.baujudiciario", "perm.trancaliderjudiciario","perm.trancasjudiciario","perm.algemar", "perm.arrastar", "perm.judiciario", "perm.liderjudiciario" },	
	["Juiz"] = { _config = { gtype = "org", salario = 25000, ptr = nil, orgName = "Judiciario"}, "perm.baujudiciario", "perm.trancaliderjudiciario","perm.trancasjudiciario","perm.algemar", "perm.arrastar", "perm.judiciario", "perm.liderjudiciario" },
	["Promotor"] = { _config = { gtype = "org", salario = 20000, ptr = nil, orgName = "Judiciario"}, "perm.baujudiciario", "perm.trancaliderjudiciario", "perm.trancasjudiciario","perm.judiciario" },
	["Supervisor"] = { _config = { gtype = "org", salario = 17000, ptr = nil, orgName = "Judiciario"}, "perm.baujudiciario", "perm.trancasjudiciario","perm.judiciario" },
	["Advogado"] = { _config = { gtype = "org", salario = 14000, ptr = nil, orgName = "Judiciario"}, "perm.baujudiciario", "perm.trancasjudiciario", "perm.judiciario" },
	["EstagiarioADV"] = { _config = { gtype = "org", salario = 10000, ptr = nil, orgName = "Judiciario"}, "perm.judiciario" },

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- JORNAL
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	["DiretorJornal"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "Jornal"}, "perm.baujornal", "perm.jornal" },
	["ProdutorJornal"] = { _config = { gtype = "org", salario = 18000, ptr = true, orgName = "Jornal"}, "perm.baujornal", "perm.jornal" },
	["Reporter"] = { _config = { gtype = "org", salario = 13000, ptr = true, orgName = "Jornal"}, "perm.jornal" },
	["EstagiarioJornal"] = { _config = { gtype = "org", salario = 10000, ptr = true, orgName = "Jornal"}, "perm.jornal" },


	["DiretorRJ"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "StaffAlta"}, "perm.ilegal", "perm.staffalta" },
	["AdministradorRJ"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "StaffAlta"}, "perm.ilegal", "perm.staffalta" },
	["ModeradorRJ"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "StaffAlta"}, "perm.ilegal", "perm.staffalta" },
	["SuporteRJ"] = { _config = { gtype = "org", salario = 20000, ptr = true, orgName = "StaffAlta"}, "perm.ilegal", "perm.staffalta" },

	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------  
-- ARMAS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--GROTA--
	["Lider [GROTA]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Grota", orgType = "fArmas"}, "perm.gerentearma", "perm.gerentegrota", "perm.grota", "perm.lidergrota", "perm.arma", "perm.ilegal", "perm.snovato", "perm.gerente",  "perm.baugrota"},
	["Sub-Lider [GROTA]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Grota", orgType = "fArmas" }, "perm.gerentearma", "perm.gerentegrota", "perm.lidergrota", "perm.grota", "perm.arma", "perm.ilegal", "perm.snovato", "perm.gerente",  "perm.baugrota"},
	["Gerente [GROTA]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Grota", orgType = "fArmas" }, "perm.gerentearma", "perm.gerentegrota", "perm.grota", "perm.arma", "perm.ilegal", "perm.snovato", "perm.gerente",  "perm.baugrota"},
	["Membro [GROTA]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Grota", orgType = "fArmas" }, "perm.grota", "perm.arma", "perm.ilegal", "perm.snovato", "perm.baugrota"},
	["Novato [GROTA]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Grota", orgType = "fArmas" }, "perm.grota", "perm.arma", "perm.ilegal"},
	["Recrutador [GROTA]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Grota", orgType = "fArmas" }, "perm.recrutador", "perm.grota", "perm.arma", "perm.ilegal"},

	--mafia--
	["Lider [MAFIA]"] = { _config = { gtype = "org", salario = 11000, ptr = nil, orgName = "Mafia", orgType = "fArmas"}, "perm.gerentearma", "perm.gerentemafia", "perm.mafia", "perm.lidermafia", "perm.arma", "perm.ilegal", "perm.snovato", "perm.gerente",  "perm.baumafia"},
	["Sub-Lider [MAFIA]"] = { _config = { gtype = "org", salario = 11000, ptr = nil, orgName = "Mafia", orgType = "fArmas"}, "perm.gerentearma", "perm.gerentemafia", "perm.lidermafia", "perm.mafia", "perm.arma", "perm.ilegal", "perm.snovato", "perm.gerente",  "perm.baumafia"},
	["Gerente [MAFIA]"] = { _config = { gtype = "org", salario = 11000, ptr = nil, orgName = "Mafia", orgType = "fArmas"}, "perm.gerentearma", "perm.gerentemafia", "perm.mafia", "perm.arma", "perm.ilegal", "perm.snovato", "perm.gerente",  "perm.baumafia"},
	["Membro [MAFIA]"] = { _config = { gtype = "org", salario = 11000, ptr = nil, orgName = "Mafia", orgType = "fArmas"}, "perm.mafia", "perm.arma", "perm.ilegal", "perm.snovato", "perm.baumafia"},
	["Novato [MAFIA]"] = { _config = { gtype = "org", salario = 11000, ptr = nil, orgName = "Mafia", orgType = "fArmas"}, "perm.mafia", "perm.arma", "perm.ilegal"},
	["Recrutador [MAFIA]"] = { _config = { gtype = "org", salario = 11000, ptr = nil, orgName = "Mafia", orgType = "fArmas"}, "perm.recrutador", "perm.baumafia", "perm.mafia", "perm.arma", "perm.ilegal"},

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- MUNIÇÃO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--yakuza--
	["Lider [YAKUZA]"] = { _config = { gtype = "org", salario = 15000, ptr = nil, orgName = "Yakuza", orgType = "fMunicao"}, "perm.craftmuni", "perm.gerenteyakuza", "perm.yakuza", "perm.lideryakuza", "perm.muni", "perm.ilegal", "perm.snovato", "perm.gerente",  "perm.bauyakuza"},
	["Sub-Lider [YAKUZA]"] = { _config = { gtype = "org", salario = 15000, ptr = nil, orgName = "Yakuza", orgType = "fMunicao"}, "perm.craftmuni", "perm.gerenteyakuza", "perm.lideryakuza", "perm.yakuza", "perm.muni", "perm.ilegal", "perm.snovato", "perm.gerente",  "perm.bauyakuza"},
	["Gerente [YAKUZA]"] = { _config = { gtype = "org", salario = 15000, ptr = nil, orgName = "Yakuza", orgType = "fMunicao"}, "perm.craftmuni", "perm.gerenteyakuza", "perm.yakuza", "perm.muni", "perm.ilegal", "perm.snovato", "perm.gerente",  "perm.bauyakuza"},
	["Membro [YAKUZA]"] = { _config = { gtype = "org", salario = 15000, ptr = nil, orgName = "Yakuza", orgType = "fMunicao"}, "perm.yakuza", "perm.muni", "perm.ilegal", "perm.snovato", "perm.bauyakuza"},
	["Novato [YAKUZA]"] = { _config = { gtype = "org", salario = 15000, ptr = nil, orgName = "Yakuza", orgType = "fMunicao"}, "perm.yakuza", "perm.muni", "perm.ilegal"},
	["Recrutador [YAKUZA]"] = { _config = { gtype = "org", salario = 15000, ptr = nil, orgName = "Yakuza", orgType = "fMunicao"}, "perm.recrutador", "perm.bauyakuza", "perm.yakuza", "perm.muni", "perm.ilegal"},
	
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DESMANCHE
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------	
	--motoclub--
	["Lider [MOTOCLUB]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "MotoClub", orgType = "fDesmanche"}, "perm.craftdesmanche", "perm.gerentemotoclub", "perm.lidermotoclub", "perm.motoclub", "perm.desmanche", "perm.ilegal", "perm.snovato", "perm.gerente",  "perm.baumotoclub", "perm.baulidermotoclub"},
	["Sub-Lider [MOTOCLUB]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "MotoClub", orgType = "fDesmanche"}, "perm.craftdesmanche", "perm.gerentemotoclub", "perm.lidermotoclub", "perm.motoclub", "perm.desmanche", "perm.ilegal", "perm.snovato", "perm.gerente",  "perm.baumotoclub", "perm.baulidermotoclub"},
	["Gerente [MOTOCLUB]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "MotoClub", orgType = "fDesmanche"}, "perm.craftdesmanche", "perm.gerentemotoclub", "perm.motoclub", "perm.desmanche", "perm.ilegal", "perm.baumotoclub", "perm.snovato", "perm.gerente",  "perm.baulidermotoclub"},
	["Membro [MOTOCLUB]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "MotoClub", orgType = "fDesmanche"}, "perm.motoclub", "perm.desmanche", "perm.ilegal", "perm.snovato", "perm.baumotoclub"},
	["Novato [MOTOCLUB]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "MotoClub", orgType = "fDesmanche"}, "perm.motoclub", "perm.ilegal"},
	["Recrutador [MOTOCLUB]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "MotoClub", orgType = "fDesmanche"}, "perm.recrutador", "perm.baumotoclub", "perm.motoclub", "perm.desmanche", "perm.ilegal"},

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LAVAGEM 
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	--VANILLA--
	["Lider [VANILLA]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Vanilla", orgType = "fLavagem"}, "perm.craftlavagem", "perm.gerentevanilla", "perm.gerentelidervanilla", "perm.lidervanilla", "perm.vanilla", "perm.lavagem", "perm.ilegal", "perm.snovato", "perm.gerente", "perm.bauvanilla"},
	["Sub-Lider [VANILLA]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Vanilla",orgType = "fLavagem"}, "perm.craftlavagem", "perm.gerentevanilla", "perm.gerentelidervanilla", "perm.lidervanilla", "perm.vanilla", "perm.lavagem", "perm.ilegal", "perm.snovato", "perm.gerente", "perm.bauvanilla"},	
	["Gerente [VANILLA]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Vanilla",orgType = "fLavagem"}, "perm.craftlavagem", "perm.gerentevanilla", "perm.gerentelidervanilla", "perm.vanilla", "perm.lavagem", "perm.ilegal", "perm.snovato", "perm.gerente", "perm.bauvanilla"},
	["Membro [VANILLA]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Vanilla",orgType = "fLavagem"}, "perm.vanilla", "perm.lavagem", "perm.ilegal", "perm.snovato", "perm.bauvanilla"},
	["Novato [VANILLA]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Vanilla",orgType = "fLavagem"}, "perm.vanilla", "perm.lavagem", "perm.ilegal"},
	["Recrutador [VANILLA]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Vanilla",orgType = "fLavagem"}, "perm.recrutador", "perm.bauvanilla", "perm.vanilla", "perm.lavagem", "perm.ilegal"},

	--BAHAMAS--
	["Lider [BAHAMAS]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Bahamas", orgType = "fLavagem"}, "perm.craftlavagem", "perm.gerentebahamas", "perm.liderbahamas", "perm.bahamas", "perm.lavagem", "perm.ilegal", "perm.snovato", "perm.gerente", "perm.baubahamas"},
	["Sub-Lider [BAHAMAS]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Bahamas", orgType = "fLavagem"}, "perm.craftlavagem", "perm.gerentebahamas", "perm.liderbahamas", "perm.bahamas", "perm.lavagem", "perm.ilegal", "perm.snovato", "perm.gerente", "perm.baubahamas"},
	["Gerente [BAHAMAS]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Bahamas", orgType = "fLavagem"}, "perm.craftlavagem", "perm.gerentebahamas", "perm.bahamas", "perm.lavagem", "perm.ilegal", "perm.snovato", "perm.gerente", "perm.baubahamas"},
	["Membro [BAHAMAS]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Bahamas", orgType = "fLavagem"}, "perm.bahamas", "perm.lavagem", "perm.ilegal", "perm.snovato", "perm.baubahamas"},
	["Novato [BAHAMAS]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Bahamas", orgType = "fLavagem"}, "perm.bahamas", "perm.lavagem", "perm.ilegal"},
	["Recrutador [BAHAMAS]"] = { _config = { gtype = "org", salario = 5000, ptr = nil, orgName = "Bahamas", orgType = "fLavagem"}, "perm.recrutador", "perm.baubahamas", "perm.bahamas", "perm.lavagem", "perm.ilegal"},
}

cfg.users = {
}

cfg.selectors = { }

return cfg
