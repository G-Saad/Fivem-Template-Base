-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 13 déc. 2021 à 18:48
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `template`
--

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

DROP TABLE IF EXISTS `addon_account`;
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('property_black_money', 'Argent Sale Propriété', 0);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(9, 'property_black_money', 0, 'steam:11000013bcd2a0d'),
(10, 'property_black_money', 0, 'steam:11000013bc5fc93'),
(11, 'property_black_money', 0, 'steam:1100001371234d5');

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

DROP TABLE IF EXISTS `addon_inventory_items`;
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `characters`
--

DROP TABLE IF EXISTS `characters`;
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `dateofbirth` varchar(255) NOT NULL,
  `sex` varchar(1) NOT NULL DEFAULT 'M',
  `height` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `characters`
--

INSERT INTO `characters` (`id`, `identifier`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`) VALUES


-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

DROP TABLE IF EXISTS `datastore`;
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 0);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(7, 'property', 'steam:11000013bcd2a0d', '{}'),
(8, 'property', 'steam:11000013bc5fc93', '{}'),
(9, 'property', 'steam:1100001371234d5', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `fine_types`
--

DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Usage abusif du klaxon', 30, 0),
(2, 'Franchir une ligne continue', 40, 0),
(3, 'Circulation à contresens', 250, 0),
(4, 'Demi-tour non autorisé', 250, 0),
(5, 'Circulation hors-route', 170, 0),
(6, 'Non-respect des distances de sécurité', 30, 0),
(7, 'Arrêt dangereux / interdit', 150, 0),
(8, 'Stationnement gênant / interdit', 70, 0),
(9, 'Non respect  de la priorité à droite', 70, 0),
(10, 'Non-respect à un véhicule prioritaire', 90, 0),
(11, 'Non-respect d\'un stop', 105, 0),
(12, 'Non-respect d\'un feu rouge', 130, 0),
(13, 'Dépassement dangereux', 100, 0),
(14, 'Véhicule non en état', 100, 0),
(15, 'Conduite sans permis', 1500, 0),
(16, 'Délit de fuite', 800, 0),
(17, 'Excès de vitesse < 5 kmh', 90, 0),
(18, 'Excès de vitesse 5-15 kmh', 120, 0),
(19, 'Excès de vitesse 15-30 kmh', 180, 0),
(20, 'Excès de vitesse > 30 kmh', 300, 0),
(21, 'Entrave de la circulation', 110, 1),
(22, 'Dégradation de la voie publique', 90, 1),
(23, 'Trouble à l\'ordre publique', 90, 1),
(24, 'Entrave opération de police', 130, 1),
(25, 'Insulte envers / entre civils', 75, 1),
(26, 'Outrage à agent de police', 110, 1),
(27, 'Menace verbale ou intimidation envers civil', 90, 1),
(28, 'Menace verbale ou intimidation envers policier', 150, 1),
(29, 'Manifestation illégale', 250, 1),
(30, 'Tentative de corruption', 1500, 1),
(31, 'Arme blanche sortie en ville', 120, 2),
(32, 'Arme léthale sortie en ville', 300, 2),
(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
(34, 'Port d\'arme illégal', 700, 2),
(35, 'Pris en flag lockpick', 300, 2),
(36, 'Vol de voiture', 1800, 2),
(37, 'Vente de drogue', 1500, 2),
(38, 'Fabriquation de drogue', 1500, 2),
(39, 'Possession de drogue', 650, 2),
(40, 'Prise d\'ôtage civil', 1500, 2),
(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
(42, 'Braquage particulier', 650, 2),
(43, 'Braquage magasin', 650, 2),
(44, 'Braquage de banque', 1500, 2),
(45, 'Tir sur civil', 2000, 3),
(46, 'Tir sur agent de l\'état', 2500, 3),
(47, 'Tentative de meurtre sur civil', 3000, 3),
(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
(49, 'Meurtre sur civil', 10000, 3),
(50, 'Meurte sur agent de l\'état', 30000, 3),
(51, 'Meurtre involontaire', 1800, 3),
(52, 'Escroquerie à l\'entreprise', 2000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `limit` int(11) NOT NULL DEFAULT '-1',
  `rare` int(11) NOT NULL DEFAULT '0',
  `can_remove` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('bandage', 'Bandage', 20, 0, 1),
('bread', 'Pain', 10, 0, 1),
('coffe', 'Café', 10, 0, 1),
('cupcake', 'Petit Gateau', 10, 0, 1),
('hamburger', 'Burger', 10, 0, 1),
('icetea', 'IceTea', 10, 0, 1),
('medikit', 'Medikit', 5, 0, 1),
('milk', 'Lait', 10, 0, 1),
('phone', 'Smarthphone', 1, 0, 1),
('sandwich', 'Sandwich', 10, 0, 1),
('water', 'Eau', 10, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `SecondaryJob` tinyint(1) NOT NULL DEFAULT '0',
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`, `SecondaryJob`, `whitelisted`) VALUES
('unemployed', 'Unemployed', 0, 0),
('unemployed2', 'Sans emplois', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(2, 'unemployed2', 0, 'rsa', 'Secondaire', 50, '{}', '{}'),
(26, 'unemployed', 0, 'rsa', 'Secondaire', 50, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

DROP TABLE IF EXISTS `society_moneywash`;
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `license` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `skin` longtext COLLATE utf8mb4_bin,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `job2` varchar(255) COLLATE utf8mb4_bin DEFAULT 'unemployed2',
  `job2_grade` int(11) DEFAULT '0',
  `loadout` longtext COLLATE utf8mb4_bin,
  `position` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `lastname` varchar(50) COLLATE utf8mb4_bin DEFAULT '',
  `dateofbirth` varchar(25) COLLATE utf8mb4_bin DEFAULT '',
  `sex` varchar(10) COLLATE utf8mb4_bin DEFAULT '',
  `height` varchar(5) COLLATE utf8mb4_bin DEFAULT '',
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `status` longtext COLLATE utf8mb4_bin,
  `isDead` bit(1) DEFAULT b'0',
  `tattoos` longtext COLLATE utf8mb4_bin,
  `coin` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`identifier`, `license`, `money`, `name`, `skin`, `job`, `job_grade`, `job2`, `job2_grade`, `loadout`, `position`, `bank`, `permission_level`, `group`, `last_property`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `phone_number`, `status`, `isDead`, `tattoos`, `coin`) VALUES
('steam:1100001371234d5', 'license:2359ad49f2d75402f68dc69f446ea294bc4689a0', 15255, '[Dev] S\'aad', '{\"pants_1\":0,\"chain_2\":0,\"watches_1\":-1,\"bodyb_2\":0,\"watches_2\":0,\"eyebrows_2\":0,\"blemishes_2\":0,\"ears_1\":-1,\"bracelets_2\":0,\"shoes_2\":0,\"tshirt_1\":0,\"eyebrows_3\":0,\"eye_color\":0,\"beard_1\":0,\"hair_color_2\":0,\"mask_2\":0,\"glasses_1\":0,\"moles_1\":0,\"chain_1\":0,\"complexion_1\":0,\"helmet_1\":-1,\"glasses_2\":0,\"beard_4\":0,\"lipstick_1\":0,\"blush_1\":0,\"bodyb_1\":0,\"decals_2\":0,\"blush_2\":0,\"torso_1\":0,\"bproof_2\":0,\"eyebrows_4\":0,\"beard_2\":0,\"beard_3\":0,\"moles_2\":0,\"chest_1\":0,\"bproof_1\":0,\"decals_1\":0,\"skin\":3,\"makeup_3\":0,\"sun_2\":0,\"blemishes_1\":0,\"lipstick_4\":0,\"blush_3\":0,\"bags_2\":0,\"torso_2\":0,\"helmet_2\":0,\"lipstick_3\":0,\"hair_color_1\":0,\"face\":1,\"age_1\":0,\"bracelets_1\":-1,\"hair_2\":3,\"arms\":0,\"makeup_2\":0,\"eyebrows_1\":0,\"pants_2\":0,\"chest_2\":0,\"arms_2\":0,\"chest_3\":0,\"makeup_4\":0,\"sun_1\":0,\"shoes_1\":0,\"sex\":0,\"complexion_2\":0,\"bags_1\":0,\"age_2\":0,\"makeup_1\":0,\"mask_1\":0,\"lipstick_2\":0,\"hair_1\":3,\"tshirt_2\":0,\"ears_2\":0}', 'unemployed', 0, 'unemployed2', 0, '[]', '{\"x\":9.1,\"z\":70.8,\"y\":30.6}', 0, 4, 'superadmin', NULL, 'Saad', 'Dev', '02011888', 'h', '155', NULL, '[{\"name\":\"hunger\",\"val\":176400,\"percent\":17.64},{\"name\":\"thirst\",\"val\":176400,\"percent\":17.64},{\"name\":\"drunk\",\"val\":0,\"percent\":0.0}]', b'0', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_accounts`
--

DROP TABLE IF EXISTS `user_accounts`;
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `name` varchar(50) NOT NULL,
  `money` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_accounts`
--

INSERT INTO `user_accounts` (`id`, `identifier`, `name`, `money`) VALUES
(3, 'steam:11000013bcd2a0d', 'black_money', 0),
(4, 'steam:11000013bc5fc93', 'black_money', 0),
(5, 'steam:1100001371234d5', 'black_money', 0),
(6, 'steam:1100001371234d5', 'black_money', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_inventory`
--

DROP TABLE IF EXISTS `user_inventory`;
CREATE TABLE IF NOT EXISTS `user_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(22) NOT NULL,
  `item` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `user_inventory`
--

INSERT INTO `user_inventory` (`id`, `identifier`, `item`, `count`) VALUES
(23, 'steam:11000013bcd2a0d', 'coffe', 0),
(24, 'steam:11000013bcd2a0d', 'bread', 0),
(25, 'steam:11000013bcd2a0d', 'hamburger', 0),
(26, 'steam:11000013bcd2a0d', 'icetea', 0),
(27, 'steam:11000013bcd2a0d', 'water', 0),
(28, 'steam:11000013bcd2a0d', 'cupcake', 0),
(29, 'steam:11000013bcd2a0d', 'phone', 0),
(30, 'steam:11000013bcd2a0d', 'bandage', 0),
(31, 'steam:11000013bcd2a0d', 'medikit', 0),
(32, 'steam:11000013bcd2a0d', 'milk', 0),
(33, 'steam:11000013bcd2a0d', 'sandwich', 0),
(34, 'steam:11000013bc5fc93', 'phone', 0),
(35, 'steam:11000013bc5fc93', 'milk', 0),
(36, 'steam:11000013bc5fc93', 'bread', 1),
(37, 'steam:11000013bc5fc93', 'hamburger', 0),
(38, 'steam:11000013bc5fc93', 'bandage', 0),
(39, 'steam:11000013bc5fc93', 'water', 0),
(40, 'steam:11000013bc5fc93', 'cupcake', 0),
(41, 'steam:11000013bc5fc93', 'sandwich', 0),
(42, 'steam:11000013bc5fc93', 'coffe', 0),
(43, 'steam:11000013bc5fc93', 'medikit', 0),
(44, 'steam:11000013bc5fc93', 'icetea', 0),
(45, 'steam:1100001371234d5', 'hamburger', 0),
(46, 'steam:1100001371234d5', 'water', 0),
(47, 'steam:1100001371234d5', 'coffe', 0),
(48, 'steam:1100001371234d5', 'water', 0),
(49, 'steam:1100001371234d5', 'coffe', 0),
(50, 'steam:1100001371234d5', 'sandwich', 0),
(51, 'steam:1100001371234d5', 'phone', 0),
(52, 'steam:1100001371234d5', 'hamburger', 0),
(53, 'steam:1100001371234d5', 'phone', 0),
(54, 'steam:1100001371234d5', 'sandwich', 0),
(55, 'steam:1100001371234d5', 'milk', 0),
(56, 'steam:1100001371234d5', 'medikit', 0),
(57, 'steam:1100001371234d5', 'icetea', 0),
(58, 'steam:1100001371234d5', 'bandage', 0),
(59, 'steam:1100001371234d5', 'milk', 0),
(60, 'steam:1100001371234d5', 'medikit', 0),
(61, 'steam:1100001371234d5', 'icetea', 0),
(62, 'steam:1100001371234d5', 'cupcake', 0),
(63, 'steam:1100001371234d5', 'bandage', 0),
(64, 'steam:1100001371234d5', 'cupcake', 0),
(65, 'steam:1100001371234d5', 'bread', 0),
(66, 'steam:1100001371234d5', 'bread', 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
