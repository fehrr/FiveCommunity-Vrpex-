config = {}
config.adminPerms = {
    'developer.permissao',
    'admin.permissao'
}
config.webhooks = {
    ['arrest'] = 'https://discord.com/api/webhooks/1092800025702182962/-k3t3O9cuFwIlBlbSwviNzM81I8vMz9c-WQi7fadiztl8Z8YEJhccI9sAxLi6yhYSE48',
    ['demitir'] = 'https://discord.com/api/webhooks/1152382329990426624/Gip63PuIT7b2r0jRBKaluIWXFQ6SbO4Fr8ZZzPCLrfqVyVfirP9EFdmvhi98RRzxhfv8',
    ['contratar/promover'] = 'https://discord.com/api/webhooks/1152382529526042795/TP3TYRmuPfdkqZmBXWxDTnHzP4zocA20YfgdALkWh8VKOQ1m5juN-zkfxkCW8JfbUJk8',
}
config.hireReward = 50000
config.prisonCoords = vec3(1673.77, 2511.58, 47.42)
config.arrestCoords = {
    {coord = vec3(-412.87,1084.33,323.85), range = 80.0},
    {coord = vec3(-955.08,-2050.74,9.4), range = 80.0},
    {coord = vec3(-1091.41,-823.99,5.48), range = 80.0},
    {coord = vec3(2622.84,5271.62,45.48), range = 80.0},
    {coord = vec3(-2049.42,-456.93,8.58), range = 80.0},
    {coord = vec3(604.77,-7.63,82.78), range = 80.0},
}
config.cargos = {
    ['PoliciaMilitar'] = {
        -- done
        ['CoronelPM'] = {
            tier = 23,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['TenenteCoronelPM'] = {
            tier = 22,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['MajorPM'] = {
            tier = 21,
            permissions = {
                hire = true,
                demote = true
            }
        },

        ['ComandoChoquePM'] = {
            tier = 20,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['ChoquePM'] = {
            tier = 19,
            permissions = {
                hire = false,
                demote = false
            }
        },
        
        ['ComandoGatePM'] = {
            tier = 18,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['GatePM'] = {
            tier = 17,
            permissions = {
                hire = false,
                demote = false
            }
        },

        ['ComandoSpeedPM'] = {
            tier = 16,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['SpeedPM'] = {
            tier = 15,
            permissions = {
                hire = false,
                demote = false
            }
        },
        
        ['ComandoRocamPM'] = {
            tier = 14,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['RocamPM'] = {
            tier = 13,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['ComandoGrpaePM'] = {
            tier = 12,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['GrpaePM'] = {
            tier = 11,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['CapitaoPM'] = {
            tier = 10,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['PrimeiroTenentePM'] = {
            tier = 9,
            permissions = {
                hire = true,
                demote = false
            }
        },
        ['SegundoTenentePM'] = {
            tier = 8,
            permissions = {
                hire = true,
                demote = false
            }
        },
        ['SubTenentePM'] = {
            tier = 7,
            permissions = {
                hire = true,
                demote = false
            }
        },
        ['PrimeiroSargentoPM'] = {
            tier = 6,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SegundoSargentoPM'] = {
            tier = 5,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['TerceiroSargentoPM'] = {
            tier = 4,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['CaboPM'] = {
            tier = 3,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SoldadoPM'] = {
            tier = 2,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['AlunoPM'] = {
            tier = 1,
            permissions = {
                hire = false,
                demote = false
            }
        }
    },
    ['Bope'] = {
        ['ComandanteGeralBOPE'] = {
            tier = 15,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['SubComandanteBOPE'] = {
            tier = 14,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['CoronelBope'] = {
            tier = 13,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['TenenteCoronelBope'] = {
            tier = 12,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['MajorBope'] = {
            tier = 11,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['CapitaoBope'] = {
            tier = 10,
            permissions = {
                hire = true,
                demote = false
            }
        },
        ['PrimeiroTenenteBope'] = {
            tier = 9,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SegundoTenenteBope'] = {
            tier = 8,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SubTenenteBope'] = {
            tier = 7,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['PrimeiroSargentoBope'] = {
            tier = 6,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SegundoSargentoBope'] = {
            tier = 5,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['TerceiroSargenteBope'] = {
            tier = 4,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['CaboBope'] = {
            tier = 3,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['EstagiarioBope'] = {
            tier = 2,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SoldadoBope'] = {
            tier = 1,
            permissions = {
                hire = false,
                demote = false
            }
        },
    },
    ['PoliciaCivil'] = {
        ['ComandoGeralCivil'] = {
            tier = 14,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['DelegadoGeral'] = {
            tier = 13,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['Delegado'] = {
            tier = 12,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['ComandoInvestigativa'] = {
            tier = 11,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['SubComandoInvestigativa'] = {
            tier = 10,
            permissions = {
                hire = true,
                demote = false
            }
        },
        ['Perito'] = {
            tier = 9,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['Investigador'] = {
            tier = 8,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['Escrivao'] = {
            tier = 7,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['Agente'] = {
            tier = 6,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['Recruta'] = {
            tier = 5,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['ComandoDraco'] = {
            tier = 4,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['SubComandoDraco'] = {
            tier = 3,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['AgenteDraco'] = {
            tier = 2,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['EstagiarioDraco'] = {
            tier = 1,
            permissions = {
                hire = false,
                demote = false
            }
        }
    },
    ['PoliciaFederal'] = {
        ['ComandanteGeralPF'] = {
            tier = 9,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['DelegadoGeralPF'] = {
            tier = 8,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['DelegadoPF'] = {
            tier = 7,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['DelegadoAdjuntoPF'] = {
            tier = 6,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['ComandoGTF'] = {
            tier = 5,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['GTF'] = {
            tier = 4,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['PeritoPF'] = {
            tier = 3,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['EscrivaoPF'] = {
            tier = 2,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['AgentePF'] = {
            tier = 1,
            permissions = {
                hire = false,
                demote = false
            }
        }
    },

    ['Choque'] = {
        -- done
        ['ComandanteGeralCHOQUE'] = {
            tier = 14,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['SubComandanteCHOQUE'] = {
            tier = 13,
            permissions = {
                hire = true,
                demote = false
            }
        },
        ['CoronelCHOQUE'] = {
            tier = 12,
            permissions = {
                hire = true,
                demote = false
            }
        },
        ['TenenteCoronelCHOQUE'] = {
            tier = 11,
            permissions = {
                hire = true,
                demote = false
            }
        },
        ['MajorCHOQUE'] = {
            tier = 10,
            permissions = {
                hire = true,
                demote = false
            }
        },
        ['PrimeiroTenenteCHOQUE'] = {
            tier = 9,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SegundoTenenteCHOQUE'] = {
            tier = 8,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SubTenenteCHOQUE'] = {
            tier = 7,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['PrimeiroSargentoCHOQUE'] = {
            tier = 6,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SegundoSargentoCHOQUE'] = {
            tier = 5,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['TerceiroSargenteCHOQUE'] = {
            tier = 4,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['CaboCHOQUE'] = {
            tier = 3,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SoldadoCHOQUE'] = {
            tier = 2,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['EstagiarioCHOQUE'] = {
            tier = 1,
            permissions = {
                hire = false,
                demote = false
            }
        },
    },
    ['Core'] = {
        -- done
        ['ComandoGeralCORE'] = {
            tier = 6,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['SubComandoCORE'] = {
            tier = 5,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['EliteCORE'] = {
            tier = 4,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['OficialCORE'] = {
            tier = 3,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SargentoCORE'] = {
            tier = 2,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['RecrutaCORE'] = {
            tier = 1,
            permissions = {
                hire = false,
                demote = false
            }
        },
    },
    ['PRF'] = {
        -- done
        ['CoronelPRF'] = {
            tier = 13,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['SubComandoPRF'] = {
            tier = 12,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['SupervisorGeralPRF'] = {
            tier = 11,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['SupervisorPRF'] = {
            tier = 10,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['RecrutadorPRF'] = {
            tier = 9,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['InspetorPRF'] = {
            tier = 8,
            permissions = {
                hire = true,
                demote = false
            }
        },
        ['ComandoGRRPRF'] = {
            tier = 7,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['GRRPRF'] = {
            tier = 6,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['AgenteEspecialPRF'] = {
            tier = 5,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['AgentePRF'] = {
            tier = 4,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['Agente2PRF'] = {
            tier = 3,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['Agente3PRF'] = {
            tier = 2,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['EstagiarioPRF'] = {
            tier = 1,
            permissions = {
                hire = false,
                demote = false
            }
        }
    },
    ['Exercito'] = {
        -- done
        ['MarechalEXERCITO'] = {
            tier = 11,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['GeneralEXERCITO'] = {
            tier = 10,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['CoronelEXERCITO'] = {
            tier = 9,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['TenenteCoronelEXERCITO'] = {
            tier = 8,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['MajorEXERCITO'] = {
            tier = 7,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['CapitaoEXERCITO'] = {
            tier = 6,
            permissions = {
                hire = true,
                demote = true
            }
        },
        ['TenenteEXERCITO'] = {
            tier = 5,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SubtenenteEXERCITO'] = {
            tier = 4,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SargentoEXERCITO'] = {
            tier = 3,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['CaboEXERCITO'] = {
            tier = 2,
            permissions = {
                hire = false,
                demote = false
            }
        },
        ['SoldadoEXERCITO'] = {
            tier = 1,
            permissions = {
                hire = false,
                demote = false
            }
        },
    },
}
