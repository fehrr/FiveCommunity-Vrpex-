-- --------------------------------------------------------
-- Anfitrião:                    127.0.0.1
-- Versão do servidor:           11.1.2-MariaDB - mariadb.org binary distribution
-- SO do servidor:               Win64
-- HeidiSQL Versão:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- A despejar estrutura da base de dados para cidade_alta
CREATE DATABASE IF NOT EXISTS `cidade_alta` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `cidade_alta`;

-- A despejar estrutura para tabela cidade_alta.bm_chamados
CREATE TABLE IF NOT EXISTS `bm_chamados` (
  `user_id` int(11) NOT NULL,
  `qtd` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.bm_daily
CREATE TABLE IF NOT EXISTS `bm_daily` (
  `user_id` int(11) NOT NULL DEFAULT 0,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.bm_dealership
CREATE TABLE IF NOT EXISTS `bm_dealership` (
  `vehicle` varchar(50) NOT NULL,
  `stock` int(11) DEFAULT 0,
  PRIMARY KEY (`vehicle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.bm_orgs
CREATE TABLE IF NOT EXISTS `bm_orgs` (
  `org` varchar(50) DEFAULT NULL,
  `bank` int(11) DEFAULT 0,
  `bank_transactions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bank_transactions`)),
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `config_goals` longtext DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `pix` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados não seleccionada.



-- A despejar estrutura para tabela cidade_alta.bm_orgs_farms
CREATE TABLE IF NOT EXISTS `bm_orgs_farms` (
  `org` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `item` varchar(50) DEFAULT NULL,
  `amount` varchar(50) DEFAULT NULL,
  `day` varchar(50) DEFAULT NULL,
  `month` varchar(50) DEFAULT NULL,
  `reward` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.bm_promoveh
CREATE TABLE IF NOT EXISTS `bm_promoveh` (
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.bm_registration
CREATE TABLE IF NOT EXISTS `bm_registration` (
  `user_id` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `nascimento` varchar(50) DEFAULT NULL,
  `sexo` varchar(50) DEFAULT NULL,
  `social` varchar(50) DEFAULT NULL,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.clothes
CREATE TABLE IF NOT EXISTS `clothes` (
  `name` varchar(50) DEFAULT NULL,
  `permiss` varchar(50) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `custom` text DEFAULT NULL,
  `sexo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.dm_ranks
CREATE TABLE IF NOT EXISTS `dm_ranks` (
  `wins` int(11) DEFAULT NULL,
  `orgType` varchar(50) DEFAULT NULL,
  `org` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.leads_new
CREATE TABLE IF NOT EXISTS `leads_new` (
  `user_id` int(11) DEFAULT NULL,
  `created_at` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.lotus_loot
CREATE TABLE IF NOT EXISTS `lotus_loot` (
  `user_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.mirtin_bans
CREATE TABLE IF NOT EXISTS `mirtin_bans` (
  `user_id` int(11) NOT NULL,
  `motivo` text NOT NULL,
  `banimento` tinytext NOT NULL,
  `desbanimento` tinytext NOT NULL,
  `time` int(11) NOT NULL,
  `hwid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.mirtin_bans_hwid
CREATE TABLE IF NOT EXISTS `mirtin_bans_hwid` (
  `token` varchar(120) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`token`),
  KEY `user_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.mirtin_chamados
CREATE TABLE IF NOT EXISTS `mirtin_chamados` (
  `user_id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `historico` text NOT NULL DEFAULT '{}',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.mirtin_homes
CREATE TABLE IF NOT EXISTS `mirtin_homes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(15) NOT NULL,
  `price` int(11) NOT NULL,
  `coords` varchar(50) NOT NULL,
  `garagem` text DEFAULT '{}',
  `chaves` int(11) DEFAULT NULL,
  `minBau` int(11) NOT NULL,
  `maxMoradores` int(11) DEFAULT 3,
  `permissao` varchar(50) NOT NULL,
  `interior` int(11) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.mirtin_orgs
CREATE TABLE IF NOT EXISTS `mirtin_orgs` (
  `org` varchar(50) NOT NULL,
  `membros` text NOT NULL DEFAULT '{}',
  `maxMembros` int(11) NOT NULL DEFAULT 0,
  `anotacao` text DEFAULT NULL,
  `banco` int(11) DEFAULT 0,
  `bancoHistorico` text DEFAULT NULL,
  PRIMARY KEY (`org`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.mirtin_orgs_rewards
CREATE TABLE IF NOT EXISTS `mirtin_orgs_rewards` (
  `user_id` int(11) DEFAULT NULL,
  `org` varchar(50) DEFAULT NULL,
  `invite_userid` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.mirtin_users_homes
CREATE TABLE IF NOT EXISTS `mirtin_users_homes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  `houseID` int(11) NOT NULL,
  `proprietario` int(11) NOT NULL,
  `moradores` text DEFAULT '{}',
  `bau` text DEFAULT '{}',
  `armario` text DEFAULT '{}',
  `interior` int(11) NOT NULL,
  `iptu` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.vrp_srv_data
CREATE TABLE IF NOT EXISTS `vrp_srv_data` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.vrp_users
CREATE TABLE IF NOT EXISTS `vrp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ultimo_login` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `whitelist` int(11) DEFAULT NULL,
  `paypal` int(11) DEFAULT 0,
  `Motivo_BAN` varchar(255) DEFAULT NULL,
  `Motivo_UNBAN` varchar(255) DEFAULT NULL,
  `discord` varchar(255) DEFAULT NULL,
  `userDiscord` int(2) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.vrp_users_infos
CREATE TABLE IF NOT EXISTS `vrp_users_infos` (
  `user_id` int(11) NOT NULL,
  `controller` int(11) DEFAULT 0,
  `rosto` text DEFAULT '{}',
  `roupas` text DEFAULT '{}',
  `tattos` text DEFAULT '{}',
  `garagem` int(11) DEFAULT 3,
  `vip` text DEFAULT '{}',
  `bonus` text DEFAULT '{}',
  `coins` int(11) DEFAULT 3,
  `tempo_jogado` int(11) DEFAULT 0,
  `prioridade` int(11) DEFAULT 0,
  `license` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.vrp_user_data
CREATE TABLE IF NOT EXISTS `vrp_user_data` (
  `user_id` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL,
  PRIMARY KEY (`user_id`,`dkey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.vrp_user_identities
CREATE TABLE IF NOT EXISTS `vrp_user_identities` (
  `user_id` int(11) NOT NULL,
  `registro` varchar(50) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `sobrenome` varchar(50) DEFAULT NULL,
  `idade` int(11) DEFAULT NULL,
  `banco` int(11) DEFAULT 25000,
  `multas` int(11) DEFAULT 0,
  `criminal` text DEFAULT '{}',
  `signo` varchar(50) DEFAULT 'Nenhum',
  `data_nascimento` varchar(50) DEFAULT '17/03/2001',
  `relacionamento` varchar(255) DEFAULT '{}',
  `total_hour` int(11) DEFAULT 0,
  `chavePix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `registro` (`registro`),
  KEY `telefone` (`telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.vrp_user_ids
CREATE TABLE IF NOT EXISTS `vrp_user_ids` (
  `identifier` varchar(150) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.vrp_user_veiculos
CREATE TABLE IF NOT EXISTS `vrp_user_veiculos` (
  `user_id` int(11) NOT NULL,
  `veiculo` varchar(50) NOT NULL,
  `placa` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT 0,
  `motor` int(11) DEFAULT 1000,
  `lataria` int(11) DEFAULT 1000,
  `gasolina` int(11) DEFAULT 15,
  `ipva` int(11) DEFAULT 7,
  `portamalas` text DEFAULT '{}',
  `tunagem` text DEFAULT '{}',
  `favorite` int(11) DEFAULT 0,
  `alugado` tinyint(4) NOT NULL DEFAULT 0,
  `data_alugado` text DEFAULT NULL,
  `expired` text DEFAULT NULL,
  PRIMARY KEY (`user_id`,`veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Exportação de dados não seleccionada.

-- A despejar estrutura para tabela cidade_alta.zo_attachs
CREATE TABLE IF NOT EXISTS `zo_attachs` (
  `user_id` int(11) NOT NULL,
  `attachs` text DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `eg_bank` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `para` int(11) DEFAULT NULL,
  `valor` bigint(20) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `store` varchar(50) DEFAULT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


-- Exportação de dados não seleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
