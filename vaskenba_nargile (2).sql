-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 20, 2019 at 02:10 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vaskenba_nargile`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `active` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `first_name`, `last_name`, `mobile_number`, `email`, `role`, `password`, `active`, `logo`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'Super', 'Admin', '000000000000', 'superadmin@gmail.com', 'superAdmin', '5ebcb2d1d6ad03d09e4cef68244c5aea169d5d18339190de68b168acdb0d0d8aa54af67facdea0c00945a7b9483334dc75d91f2023ba531f83034c6aea33fc8a', '1', 'User_default.png', '2019-08-28 19:58:54', '2019-08-28 19:58:54'),
(32, 'brokkoli', 'David', 'Kocharyan', NULL, 'admisdasdan@gmail.com', 'admin', '62670d1e1eea06b6c975e12bc8a16131b278f6d7bcbe017b65f854c58476baba86c2082b259fd0c1310935b365dc40f609971b6810b065e528b0b60119e69f61', '1', 'User_default.png', '2019-10-23 21:26:55', '2019-10-23 21:26:55');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE `area` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
  `status` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`id`, `name`, `country_id`, `status`) VALUES
(23, 'Beirut ', 18, 1),
(24, 'Baabda', 18, 1),
(25, 'Saida', 18, 1),
(26, 'Tyre', 18, 1),
(27, 'Zahle ', 18, 1),
(28, 'Metn', 18, 1),
(29, 'Kesserwein', 18, 1),
(30, 'Aley', 18, 1),
(31, 'Jbeil', 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

CREATE TABLE `badges` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `badges`
--

INSERT INTO `badges` (`id`, `image`, `count`, `type`, `info`, `status`) VALUES
(5, 'Badge_1569926957_1202764049.png', 8, 'famous', 'The famos', 1),
(6, 'Badge_1569929903_446640652.png', 10, 'explorer', 'Explorer', 1),
(7, 'Badge_1569929934_1127864567.png', 20, 'accurate', 'The accurate', 1),
(8, 'Badge_1569929955_457938109.png', 30, 'explorer', 'Explorer', 1);

-- --------------------------------------------------------

--
-- Table structure for table `claimed_offers`
--

CREATE TABLE `claimed_offers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coin_offer_id` int(11) NOT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `claim_your_business`
--

CREATE TABLE `claim_your_business` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `owner_first` varchar(255) DEFAULT NULL,
  `owner_last` varchar(255) DEFAULT NULL,
  `owner_mobile` varchar(255) DEFAULT NULL,
  `owner_email` varchar(255) DEFAULT NULL,
  `via_mobile` int(2) DEFAULT NULL,
  `via_whatsapp` int(2) DEFAULT NULL,
  `via_email` int(2) DEFAULT NULL,
  `report` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coin_offers`
--

CREATE TABLE `coin_offers` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `valid_date` int(11) DEFAULT '0',
  `description` varchar(255) DEFAULT '',
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coin_offers`
--

INSERT INTO `coin_offers` (`id`, `restaurant_id`, `price`, `valid_date`, `description`, `status`) VALUES
(11, 9, 500, 1576105200, 'Keif is offering 2 freenargile in Achrafieh branch.', 1),
(12, 9, 700, 1576105200, 'Keif is offering 1 freenargile in Achrafieh branch.', 1),
(13, 9, 800, 1576105200, 'Keif is offering 1 freenargile in Achrafieh branch.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `status`) VALUES
(18, 'Lebanon', 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `restaurant_id`, `status`) VALUES
(21, 54, 17, 0),
(22, 54, 1, 0),
(23, 31, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `featured_offers`
--

CREATE TABLE `featured_offers` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `from_id`, `to_id`, `status`) VALUES
(1, 30, 31, 1),
(3, 54, 31, 1),
(4, 34, 31, 1),
(5, 35, 31, 1),
(6, 30, 47, 1),
(7, 37, 31, 1),
(8, 51, 31, 1),
(9, 37, 54, 1),
(10, 35, 54, 1),
(11, 40, 31, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hour_offers`
--

CREATE TABLE `hour_offers` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `restaurant_id`, `name`, `price`, `status`) VALUES
(43, 1, 'Moussal ', 18000, 1),
(44, 1, 'Ajami', 16000, 1),
(45, 1, ' Special Nargile', 14000, 1),
(46, 1, 'Zaghloul', 20000, 1),
(47, 1, ' Babli ', 10, 1),
(48, 2, 'Moussal ', 18000, 1),
(49, 2, 'Ajami', 16000, 1),
(50, 2, ' Special Nargile', 14000, 1),
(51, 2, 'Zaghloul', 30000, 1),
(52, 2, ' Babli ', 10, 1),
(53, 3, 'Moussal ', 18000, 1),
(54, 3, 'Ajami', 16000, 1),
(55, 3, ' Special Nargile', 14000, 1),
(56, 3, 'Zaghloul', 20000, 1),
(57, 3, ' Babli ', 12000, 1),
(58, 4, 'Moussal ', 18000, 1),
(59, 4, 'Ajami', 16000, 1),
(60, 4, ' Special Nargile', 14000, 1),
(61, 4, 'Zaghloul', 20000, 1),
(62, 4, ' Babli ', 11000, 1),
(63, 5, 'Moussal ', 18000, 1),
(64, 5, 'Ajami', 16000, 1),
(65, 5, ' Special Nargile', 14000, 1),
(66, 5, 'Zaghloul', 20000, 1),
(67, 5, ' Babli ', 11000, 1),
(68, 6, 'Moussal ', 18000, 1),
(69, 6, 'Ajami', 16000, 1),
(70, 6, ' Special Nargile', 14000, 1),
(71, 6, 'Zaghloul', 20000, 1),
(72, 6, ' Babli ', 11000, 1),
(73, 7, 'Moussal ', 18000, 1),
(74, 7, 'Ajami', 16000, 1),
(75, 7, ' Special Nargile', 14000, 1),
(76, 7, 'Zaghloul', 20000, 1),
(77, 7, ' Babli ', 11000, 1),
(78, 8, 'Moussal ', 18000, 1),
(79, 8, 'Ajami', 16000, 1),
(80, 8, ' Special Nargile', 14000, 1),
(81, 8, 'Zaghloul', 20000, 1),
(82, 8, ' Babli ', 11000, 1),
(83, 9, 'Moussal ', 18000, 1),
(84, 9, 'Ajami', 16000, 1),
(85, 9, ' Special Nargile', 14000, 1),
(86, 9, 'Zaghloul', 20000, 1),
(87, 9, ' Babli ', 11000, 1),
(88, 10, 'Moussal ', 18000, 1),
(89, 10, 'Ajami', 16000, 1),
(90, 10, ' Special Nargile', 14000, 1),
(91, 10, 'Zaghloul', 20000, 1),
(92, 10, ' Babli ', 11000, 1),
(93, 11, 'Moussal ', 18000, 1),
(94, 11, 'Ajami', 16000, 1),
(95, 11, ' Special Nargile', 14000, 1),
(96, 11, 'Zaghloul', 20000, 1),
(97, 11, ' Babli ', 11000, 1),
(98, 12, 'Moussal ', 18000, 1),
(99, 12, 'Ajami', 16000, 1),
(100, 12, ' Special Nargile', 14000, 1),
(101, 12, 'Zaghloul', 20000, 1),
(102, 12, ' Babli ', 11000, 1),
(103, 13, 'Moussal ', 18000, 1),
(104, 13, 'Ajami', 16000, 1),
(105, 13, ' Special Nargile', 14000, 1),
(106, 13, 'Zaghloul', 20000, 1),
(107, 13, ' Babli ', 11000, 1),
(108, 14, 'Moussal ', 18000, 1),
(109, 14, 'Ajami', 16000, 1),
(110, 14, ' Special Nargile', 14000, 1),
(111, 14, 'Zaghloul', 20000, 1),
(112, 14, ' Babli ', 11000, 1),
(113, 15, 'Moussal ', 18000, 1),
(114, 15, 'Ajami', 16000, 1),
(115, 15, ' Special Nargile', 14000, 1),
(116, 15, 'Zaghloul', 20000, 1),
(117, 15, ' Babli ', 11000, 1),
(118, 16, 'Moussal ', 18000, 1),
(119, 16, 'Ajami', 16000, 1),
(120, 16, ' Special Nargile', 14000, 1),
(121, 16, 'Zaghloul', 20000, 1),
(122, 16, ' Babli ', 11000, 1),
(123, 17, 'Moussal ', 18000, 1),
(124, 17, 'Ajami', 16000, 1),
(125, 17, ' Special Nargile', 14000, 1),
(126, 17, 'Zaghloul', 20000, 1),
(127, 17, ' Babli ', 11000, 1),
(128, 18, 'Moussal ', 18000, 1),
(129, 18, 'Ajami', 16000, 1),
(130, 18, ' Special Nargile', 14000, 1),
(131, 18, 'Zaghloul', 20000, 1),
(132, 18, ' Babli ', 11000, 1),
(133, 19, 'Moussal ', 18000, 1),
(134, 19, 'Ajami', 16000, 1),
(135, 19, ' Special Nargile', 14000, 1),
(136, 19, 'Zaghloul', 20000, 1),
(137, 19, ' Babli ', 11000, 1),
(138, 20, 'Moussal ', 18000, 1),
(139, 20, 'Ajami', 16000, 1),
(140, 20, ' Special Nargile', 14000, 1),
(141, 20, 'Zaghloul', 20000, 1),
(142, 20, ' Babli ', 11000, 1),
(143, 21, 'Moussal ', 18000, 1),
(144, 21, 'Ajami', 16000, 1),
(145, 21, ' Special Nargile', 14000, 1),
(146, 21, 'Zaghloul', 20000, 1),
(147, 21, ' Babli ', 11000, 1),
(148, 22, 'Moussal ', 18000, 1),
(149, 22, 'Ajami', 16000, 1),
(150, 22, ' Special Nargile', 14000, 1),
(151, 22, 'Zaghloul', 20000, 1),
(152, 22, ' Babli ', 11000, 1),
(153, 23, 'Moussal ', 18000, 1),
(154, 23, 'Ajami', 16000, 1),
(155, 23, ' Special Nargile', 14000, 1),
(156, 23, 'Zaghloul', 20000, 1),
(157, 23, ' Babli ', 11000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_images`
--

CREATE TABLE `menu_images` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(114) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(2) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `more_infos`
--

CREATE TABLE `more_infos` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `more_infos`
--

INSERT INTO `more_infos` (`id`, `restaurant_id`, `name`, `status`) VALUES
(43, 1, 'Indoor seating', '1'),
(44, 1, 'Outdoor seating', '1'),
(45, 1, 'Valet parking', '1'),
(46, 1, 'Live shows', '1'),
(47, 1, 'Table reservation recommended', '1'),
(48, 1, 'Plastic Hose', '1'),
(49, 1, 'WIFI', '1'),
(50, 2, 'Indoor seating', '1'),
(51, 2, 'Outdoor seating', '1'),
(52, 2, 'Valet parking', '1'),
(53, 2, 'Live shows', '1'),
(54, 2, 'Table reservation recommended', '1'),
(55, 2, 'Plastic Hose', '1'),
(56, 2, 'WIFI', '1'),
(57, 3, 'Indoor seating', '1'),
(58, 3, 'Outdoor seating', '1'),
(59, 3, 'Valet parking', '1'),
(60, 3, 'Live shows', '1'),
(61, 3, 'Table reservation recommended', '1'),
(62, 3, 'Plastic Hose', '1'),
(63, 3, 'WIFI', '1'),
(64, 4, 'Indoor seating', '1'),
(65, 4, 'Outdoor seating', '1'),
(66, 4, 'Valet parking', '1'),
(67, 4, 'Live shows', '1'),
(68, 4, 'Table reservation recommended', '1'),
(69, 4, 'Plastic Hose', '1'),
(70, 4, 'WIFI', '1'),
(71, 5, 'Indoor seating', '1'),
(72, 5, 'Outdoor seating', '1'),
(73, 5, 'Valet parking', '1'),
(74, 5, 'Live shows', '1'),
(75, 5, 'Table reservation recommended', '1'),
(76, 5, 'Plastic Hose', '1'),
(77, 5, 'WIFI', '1'),
(78, 6, 'Indoor seating', '1'),
(79, 6, 'Outdoor seating', '1'),
(80, 6, 'Valet parking', '1'),
(81, 6, 'Live shows', '1'),
(82, 6, 'Table reservation recommended', '1'),
(83, 6, 'Plastic Hose', '1'),
(84, 6, 'WIFI', '1'),
(85, 7, 'Indoor seating', '1'),
(86, 7, 'Outdoor seating', '1'),
(87, 7, 'Valet parking', '1'),
(88, 7, 'Live shows', '1'),
(89, 7, 'Table reservation recommended', '1'),
(90, 7, 'Plastic Hose', '1'),
(91, 7, 'WIFI', '1'),
(92, 8, 'Indoor seating', '1'),
(93, 8, 'Outdoor seating', '1'),
(94, 8, 'Valet parking', '1'),
(95, 8, 'Live shows', '1'),
(96, 8, 'Table reservation recommended', '1'),
(97, 8, 'Plastic Hose', '1'),
(98, 8, 'WIFI', '1'),
(99, 9, 'Indoor seating', '1'),
(100, 9, 'Outdoor seating', '1'),
(101, 9, 'Valet parking', '1'),
(102, 9, 'Live shows', '1'),
(103, 9, 'Table reservation recommended', '1'),
(104, 9, 'Plastic Hose', '1'),
(105, 9, 'WIFI', '1'),
(106, 10, 'Indoor seating', '1'),
(107, 10, 'Outdoor seating', '1'),
(108, 10, 'Valet parking', '1'),
(109, 10, 'Live shows', '1'),
(110, 10, 'Table reservation recommended', '1'),
(111, 10, 'Plastic Hose', '1'),
(112, 10, 'WIFI', '1'),
(113, 11, 'Indoor seating', '1'),
(114, 11, 'Outdoor seating', '1'),
(115, 11, 'Valet parking', '1'),
(116, 11, 'Live shows', '1'),
(117, 11, 'Table reservation recommended', '1'),
(118, 11, 'Plastic Hose', '1'),
(119, 11, 'WIFI', '1'),
(120, 12, 'Indoor seating', '1'),
(121, 12, 'Outdoor seating', '1'),
(122, 12, 'Valet parking', '1'),
(123, 12, 'Live shows', '1'),
(124, 12, 'Table reservation recommended', '1'),
(125, 12, 'Plastic Hose', '1'),
(126, 12, 'WIFI', '1'),
(127, 13, 'Indoor seating', '1'),
(128, 13, 'Outdoor seating', '1'),
(129, 13, 'Valet parking', '1'),
(130, 13, 'Live shows', '1'),
(131, 13, 'Table reservation recommended', '1'),
(132, 13, 'Plastic Hose', '1'),
(133, 13, 'WIFI', '1'),
(134, 14, 'Indoor seating', '1'),
(135, 14, 'Outdoor seating', '1'),
(136, 14, 'Valet parking', '1'),
(137, 14, 'Live shows', '1'),
(138, 14, 'Table reservation recommended', '1'),
(139, 14, 'Plastic Hose', '1'),
(140, 14, 'WIFI', '1'),
(141, 15, 'Indoor seating', '1'),
(142, 15, 'Outdoor seating', '1'),
(143, 15, 'Valet parking', '1'),
(144, 15, 'Live shows', '1'),
(145, 15, 'Table reservation recommended', '1'),
(146, 15, 'Plastic Hose', '1'),
(147, 4, 'WIFI', '1'),
(148, 16, 'Indoor seating', '1'),
(149, 16, 'Outdoor seating', '1'),
(150, 16, 'Valet parking', '1'),
(151, 16, 'Live shows', '1'),
(152, 16, 'Table reservation recommended', '1'),
(153, 16, 'Plastic Hose', '1'),
(154, 17, 'WIFI', '1'),
(155, 17, 'Indoor seating', '1'),
(156, 17, 'Outdoor seating', '1'),
(157, 17, 'Valet parking', '1'),
(158, 17, 'Live shows', '1'),
(159, 17, 'Table reservation recommended', '1'),
(160, 17, 'Plastic Hose', '1'),
(161, 18, 'WIFI', '1'),
(162, 18, 'Indoor seating', '1'),
(163, 18, 'Outdoor seating', '1'),
(164, 18, 'Valet parking', '1'),
(165, 18, 'Live shows', '1'),
(166, 18, 'Table reservation recommended', '1'),
(167, 18, 'Plastic Hose', '1'),
(168, 19, 'WIFI', '1'),
(169, 19, 'Indoor seating', '1'),
(170, 19, 'Outdoor seating', '1'),
(171, 19, 'Valet parking', '1'),
(172, 19, 'Live shows', '1'),
(173, 19, 'Table reservation recommended', '1'),
(174, 19, 'Plastic Hose', '1'),
(175, 20, 'WIFI', '1'),
(176, 20, 'Indoor seating', '1'),
(177, 20, 'Outdoor seating', '1'),
(178, 20, 'Valet parking', '1'),
(179, 20, 'Live shows', '1'),
(180, 20, 'Table reservation recommended', '1'),
(181, 20, 'Plastic Hose', '1'),
(182, 21, 'WIFI', '1'),
(183, 21, 'Indoor seating', '1'),
(184, 21, 'Outdoor seating', '1'),
(185, 21, 'Valet parking', '1'),
(186, 21, 'Live shows', '1'),
(187, 21, 'Table reservation recommended', '1'),
(188, 21, 'Plastic Hose', '1'),
(189, 22, 'WIFI', '1'),
(190, 22, 'Indoor seating', '1'),
(191, 22, 'Outdoor seating', '1'),
(192, 22, 'Valet parking', '1'),
(193, 22, 'Live shows', '1'),
(194, 22, 'Table reservation recommended', '1'),
(195, 22, 'Plastic Hose', '1'),
(196, 23, 'WIFI', '1'),
(197, 23, 'Indoor seating', '1'),
(198, 23, 'Outdoor seating', '1'),
(199, 23, 'Valet parking', '1'),
(200, 23, 'Live shows', '1'),
(201, 23, 'Table reservation recommended', '1'),
(202, 23, 'Plastic Hose', '1');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `overall` int(11) DEFAULT NULL,
  `taste` int(11) DEFAULT NULL,
  `charcoal` int(11) DEFAULT NULL,
  `cleanliness` int(11) DEFAULT NULL,
  `staff` int(11) DEFAULT NULL,
  `value_for_money` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `user_id`, `restaurant_id`, `overall`, `taste`, `charcoal`, `cleanliness`, `staff`, `value_for_money`) VALUES
(24, 30, 8, 3, 3, 3, 3, 3, 3),
(25, 30, 2, 3, 3, 3, 3, 3, 3),
(26, 30, 8, 3, 3, 3, 3, 3, 3),
(27, 30, 7, 3, 3, 3, 3, 3, 3),
(28, 30, 6, 3, 3, 3, 3, 3, 3),
(29, 54, 4, 3, 3, 3, 3, 3, 3),
(30, 54, 10, 3, 3, 3, 3, 3, 3),
(31, 54, 4, 3, 3, 3, 3, 3, 3),
(32, 54, 10, 3, 3, 3, 3, 3, 3),
(33, 54, 4, 3, 3, 3, 3, 3, 3),
(34, 54, 10, 3, 3, 3, 3, 3, 3),
(35, 54, 10, 3, 3, 3, 3, 3, 3),
(36, 54, 4, 3, 3, 3, 3, 3, 3),
(37, 54, 10, 3, 3, 3, 3, 3, 3),
(38, 54, 10, 3, 3, 3, 3, 3, 3),
(39, 54, 10, 3, 3, 3, 3, 3, 3),
(40, 54, 4, 3, 3, 3, 3, 3, 3),
(41, 54, 10, 3, 3, 3, 3, 3, 3),
(42, 46, 17, 3, 2, 4, 4, 3, 3),
(43, 46, 17, 2, 1, 2, 4, 3, 3),
(44, 46, 17, 4, 4, 4, 4, 5, 5),
(45, 46, 17, 4, 5, 5, 5, 3, 3),
(46, 54, 17, 1, 1, 1, 1, 1, 1),
(47, 31, 1, 5, 5, 5, 5, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `area_id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL DEFAULT '',
  `phone_number` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8 DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `lat` varchar(255) NOT NULL DEFAULT '',
  `lng` varchar(255) NOT NULL DEFAULT '',
  `status` int(10) DEFAULT '1',
  `rate` varchar(255) DEFAULT '0',
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `area_id`, `logo`, `phone_number`, `type`, `address`, `lat`, `lng`, `status`, `rate`, `admin_id`) VALUES
(1, 'Cafe Em Nazih', 23, 'Logo_1569932559_1320868044.jpg', '9611745442', 'Cafe', 'Saifi Urban Gardens, Pasteur Street', '33.896025', '35.516406', 1, '5', NULL),
(2, 'Abo Waseem', 23, 'Logo_1569932569_1241077901.jpg', '9611745442', 'Resto-Cafe', 'Main Street, Hamra', '33.896189', '35.477883', 1, '0', NULL),
(3, 'Toot Beirut', 23, 'Logo_1569932577_1638295637.jpg', '9611756166', 'Restaurant', 'Makdessi Street, Facing Liban Post', '33.896447', '35.482184', 1, '0', NULL),
(4, 'Barjees Cafe', 23, 'Logo_1569932588_1476692797.jpg', '9611745356', 'Cafe', 'Main Street, Hamra', '33.896320', '35.477650', 1, '0', NULL),
(5, 'Dar Al Sultani', 23, 'Logo_1569932610_1500670266.jpg', '9611741466', 'Restaurant', 'Sadat Street', '33.896430', '35.477017', 1, '0', NULL),
(6, 'Fawzi Burj Al Hamam ', 23, 'Logo_1569932623_526565905.jpg', '9611741910', 'Restaurant', 'Golden Tulip Seranada Hotel, Abdel Aziz Street', '33.896328', '35.483972', 1, '0', NULL),
(7, 'Bliss Hall', 23, 'Logo_1569932633_1178099924.jpg', '9611362232', 'Cafe', 'Bliss Street, Near Bank Audi', '33.898656', '35.477467', 1, '0', NULL),
(8, 'Work Lounge', 23, 'Logo_1569932644_1813063138.jpg', '9611742428', 'Resto-Cafe', 'Badr Plaza, Leon Street, Next to the Lebanese American University', '33.894041', '35.478446', 1, '0', NULL),
(9, 'Abu Naim', 23, 'Logo_1569932651_345754676.jpg', '9611750480', 'Restaurant', 'Picadelly Street', '33.895294', '35.483217', 1, '0', NULL),
(10, 'Duke Eatery & Cafe', 24, 'Logo_1569932668_1705152190.jpg', '9611745442747', 'Cafe', 'Main Street', '33.895419', '35.484382', 1, '0', NULL),
(11, 'Al Nard', 24, 'Logo_1569932713_1126625444.jpg', '9611746067', 'Cafe', 'Gems Aparthotel, Makdessi Street', '33.896832', '35.478723', 1, '0', NULL),
(12, 'Good 2 Go', 24, 'Logo_1569932727_1817381857.jpg', '9611355883', 'Cafe', 'Makdessi Street, Next to GS', '33.896021', '35.485053', 1, '0', NULL),
(13, 'Afandina', 24, 'Logo_1569932735_451691935.jpg', '9611351510', 'Restaurant', 'Makdesi Street, Liban Post Building', '33.881608', '35.496292', 1, '0', NULL),
(14, 'Kaza Meza', 23, 'Logo_1569932748_590022535.jpg', '9611348016', 'Resto-Caf', 'Mahatma Ghandi Street', '33.898285', '35.478734', 1, '0', NULL),
(15, 'Wimpy', 23, 'Logo_1569932755_2011446988.jpg', '9611345641', 'cafe', 'Picadelly Street', '33.895280', '35.483274', 1, '0', NULL),
(16, 'Lavender Cafe', 23, 'Logo_1569932763_250838888.jpg', '9611751251', 'Cafe', 'Baalbak Street', '33.895122', '35.480656', 1, '0', NULL),
(17, 'Hashtag Resto Cafe', 23, 'Logo_1569932776_1470398627.jpg', '9611745442', 'Resto-Cafe', 'Yamout Street', '33.897402', '35.478095', 1, '2.8', NULL),
(18, 'El Denye Hek', 31, 'Logo_1569932793_236142029.jpg', '9611567191', 'Restaurant', 'Armenia Street', '33.896925', '35.525611', 1, '0', NULL),
(19, 'El Brimo', 31, 'Logo_1569932802_473601840.jpg', '9611444199', 'cafe', 'Geitawi', '33.894107', '35.529946', 1, '0', NULL),
(20, 'Caf Badaro', 31, 'Logo_1569932813_208496841.jpg', '9611380693', 'Cafe', 'Main Street, Near Bank Audi', '33.872769', '35.515837', 1, '0', NULL),
(21, 'Alturki', 23, 'Logo_1569932833_1460047395.jpg', '9611302702', 'Restaurant', 'Main Street, Facing Abdel Naser Mosque', '33.878730', '35.499654', 1, '0', NULL),
(22, 'Alturki', 30, 'Logo_1569932841_749480922.jpg', '9611558532', 'Restaurant', 'Sayid Hadi Highway, Msharrafiyeh', '33.858113', '35.512272', 1, '0', NULL),
(23, 'Alturki', 30, 'Logo_1569932856_665822247.jpg', '9617730693', 'Restaurant', 'Highway, Near Bank Audi, Saida', '33.560220', '35.379585', 1, '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurants_images`
--

CREATE TABLE `restaurants_images` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_weeks`
--

CREATE TABLE `restaurant_weeks` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `day` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `open` varchar(255) DEFAULT NULL,
  `close` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_weeks`
--

INSERT INTO `restaurant_weeks` (`id`, `restaurant_id`, `day`, `type`, `open`, `close`, `status`) VALUES
(43, 1, 1, 1, '8:00am', '12:00pm', 1),
(44, 1, 2, 1, '8:00am', '12:00pm', 1),
(45, 1, 3, 1, '8:00am', '12:00pm', 1),
(46, 1, 4, 1, '8:00am', '12:00pm', 1),
(47, 1, 5, 1, '8:00am', '12:00pm', 1),
(48, 1, 6, 1, '8:00am', '12:00pm', 1),
(49, 1, 7, 0, '', '', 1),
(50, 2, 1, 1, '8:00am', '12:00pm', 1),
(51, 2, 2, 1, '8:00am', '12:00pm', 1),
(52, 2, 3, 1, '8:00am', '12:00pm', 1),
(53, 2, 4, 1, '8:00am', '12:00pm', 1),
(54, 2, 5, 1, '8:00am', '12:00pm', 1),
(55, 2, 6, 1, '8:00am', '12:00pm', 1),
(56, 2, 7, 0, '', '', 1),
(57, 3, 1, 1, '8:00am', '12:00pm', 1),
(58, 3, 2, 1, '8:00am', '12:00pm', 1),
(59, 3, 3, 1, '8:00am', '12:00pm', 1),
(60, 3, 4, 1, '8:00am', '12:00pm', 1),
(61, 3, 5, 1, '8:00am', '12:00pm', 1),
(62, 3, 6, 1, '8:00am', '12:00pm', 1),
(63, 3, 7, 0, '', '', 1),
(64, 4, 1, 1, '8:00am', '12:00pm', 1),
(65, 4, 2, 1, '8:00am', '12:00pm', 1),
(66, 4, 3, 1, '8:00am', '12:00pm', 1),
(67, 4, 4, 1, '8:00am', '12:00pm', 1),
(68, 4, 5, 1, '8:00am', '12:00pm', 1),
(69, 4, 6, 1, '8:00am', '12:00pm', 1),
(70, 4, 7, 0, '', '', 1),
(71, 5, 1, 1, '8:00am', '12:00pm', 1),
(72, 5, 2, 1, '8:00am', '12:00pm', 1),
(73, 5, 3, 1, '8:00am', '12:00pm', 1),
(74, 5, 4, 1, '8:00am', '12:00pm', 1),
(75, 5, 5, 1, '8:00am', '12:00pm', 1),
(76, 5, 6, 1, '8:00am', '12:00pm', 1),
(77, 5, 7, 0, '', '', 1),
(78, 6, 1, 1, '8:00am', '12:00pm', 1),
(79, 6, 2, 1, '8:00am', '12:00pm', 1),
(80, 6, 3, 1, '8:00am', '12:00pm', 1),
(81, 6, 4, 1, '8:00am', '12:00pm', 1),
(82, 6, 5, 1, '8:00am', '12:00pm', 1),
(83, 6, 6, 1, '8:00am', '12:00pm', 1),
(84, 6, 7, 0, '', '', 1),
(85, 7, 1, 1, '8:00am', '12:00pm', 1),
(86, 7, 2, 1, '8:00am', '12:00pm', 1),
(87, 7, 3, 1, '8:00am', '12:00pm', 1),
(88, 7, 4, 1, '8:00am', '12:00pm', 1),
(89, 7, 5, 1, '8:00am', '12:00pm', 1),
(90, 7, 6, 1, '8:00am', '12:00pm', 1),
(91, 7, 7, 0, '', '', 1),
(92, 8, 1, 1, '8:00am', '12:00pm', 1),
(93, 8, 2, 1, '8:00am', '12:00pm', 1),
(94, 8, 3, 1, '8:00am', '12:00pm', 1),
(95, 8, 4, 1, '8:00am', '12:00pm', 1),
(96, 8, 5, 1, '8:00am', '12:00pm', 1),
(97, 8, 6, 1, '8:00am', '12:00pm', 1),
(98, 8, 7, 0, '', '', 1),
(99, 9, 1, 1, '8:00am', '12:00pm', 1),
(100, 9, 2, 1, '8:00am', '12:00pm', 1),
(101, 9, 3, 1, '8:00am', '12:00pm', 1),
(102, 9, 4, 1, '8:00am', '12:00pm', 1),
(103, 9, 5, 1, '8:00am', '12:00pm', 1),
(104, 9, 6, 1, '8:00am', '12:00pm', 1),
(105, 9, 7, 0, '', '', 1),
(106, 10, 1, 1, '8:00am', '12:00pm', 1),
(107, 10, 2, 1, '8:00am', '12:00pm', 1),
(108, 10, 3, 1, '8:00am', '12:00pm', 1),
(109, 10, 4, 1, '8:00am', '12:00pm', 1),
(110, 10, 5, 1, '8:00am', '12:00pm', 1),
(111, 10, 6, 1, '8:00am', '12:00pm', 1),
(112, 10, 7, 0, '', '', 1),
(113, 11, 1, 1, '8:00am', '12:00pm', 1),
(114, 11, 2, 1, '8:00am', '12:00pm', 1),
(115, 11, 3, 1, '8:00am', '12:00pm', 1),
(116, 11, 4, 1, '8:00am', '12:00pm', 1),
(117, 11, 5, 1, '8:00am', '12:00pm', 1),
(118, 11, 6, 1, '8:00am', '12:00pm', 1),
(119, 11, 7, 0, '', '', 1),
(120, 12, 1, 1, '8:00am', '12:00pm', 1),
(121, 12, 2, 1, '8:00am', '12:00pm', 1),
(122, 12, 3, 1, '8:00am', '12:00pm', 1),
(123, 12, 4, 1, '8:00am', '12:00pm', 1),
(124, 12, 5, 1, '8:00am', '12:00pm', 1),
(125, 12, 6, 1, '8:00am', '12:00pm', 1),
(126, 12, 7, 0, '', '', 1),
(127, 13, 1, 1, '8:00am', '12:00pm', 1),
(128, 13, 2, 1, '8:00am', '12:00pm', 1),
(129, 13, 3, 1, '8:00am', '12:00pm', 1),
(130, 13, 4, 1, '8:00am', '12:00pm', 1),
(131, 13, 5, 1, '8:00am', '12:00pm', 1),
(132, 13, 6, 1, '8:00am', '12:00pm', 1),
(133, 13, 7, 0, '', '', 1),
(134, 14, 1, 1, '8:00am', '12:00pm', 1),
(135, 14, 2, 1, '8:00am', '12:00pm', 1),
(136, 14, 3, 1, '8:00am', '12:00pm', 1),
(137, 14, 4, 1, '8:00am', '12:00pm', 1),
(138, 14, 5, 1, '8:00am', '12:00pm', 1),
(139, 14, 6, 1, '8:00am', '12:00pm', 1),
(140, 14, 7, 0, '', '', 1),
(141, 1, 1, 1, '8:00am', '12:00pm', 1),
(142, 15, 2, 1, '8:00am', '12:00pm', 1),
(143, 15, 3, 1, '8:00am', '12:00pm', 1),
(144, 15, 4, 1, '8:00am', '12:00pm', 1),
(145, 15, 5, 1, '8:00am', '12:00pm', 1),
(146, 15, 6, 1, '8:00am', '12:00pm', 1),
(147, 15, 7, 0, '', '', 1),
(148, 16, 1, 1, '8:00am', '12:00pm', 1),
(149, 16, 2, 1, '8:00am', '12:00pm', 1),
(150, 16, 3, 1, '8:00am', '12:00pm', 1),
(151, 16, 4, 1, '8:00am', '12:00pm', 1),
(152, 16, 5, 1, '8:00am', '12:00pm', 1),
(153, 16, 6, 1, '8:00am', '12:00pm', 1),
(154, 16, 7, 0, '', '', 1),
(155, 17, 1, 1, '8:00am', '12:00pm', 1),
(156, 17, 2, 1, '8:00am', '12:00pm', 1),
(157, 17, 3, 1, '8:00am', '12:00pm', 1),
(158, 17, 4, 1, '8:00am', '12:00pm', 1),
(159, 17, 5, 1, '8:00am', '12:00pm', 1),
(160, 17, 6, 1, '8:00am', '12:00pm', 1),
(161, 17, 7, 0, '', '', 1),
(162, 18, 1, 1, '8:00am', '12:00pm', 1),
(163, 18, 2, 1, '8:00am', '12:00pm', 1),
(164, 18, 3, 1, '8:00am', '12:00pm', 1),
(165, 18, 4, 1, '8:00am', '12:00pm', 1),
(166, 18, 5, 1, '8:00am', '12:00pm', 1),
(167, 18, 6, 1, '8:00am', '12:00pm', 1),
(168, 18, 7, 0, '', '', 1),
(169, 19, 1, 1, '8:00am', '12:00pm', 1),
(170, 19, 2, 1, '8:00am', '12:00pm', 1),
(171, 19, 3, 1, '8:00am', '12:00pm', 1),
(172, 19, 4, 1, '8:00am', '12:00pm', 1),
(173, 19, 5, 1, '8:00am', '12:00pm', 1),
(174, 19, 6, 1, '8:00am', '12:00pm', 1),
(175, 19, 7, 0, '', '', 1),
(176, 20, 1, 1, '8:00am', '12:00pm', 1),
(177, 20, 2, 1, '8:00am', '12:00pm', 1),
(178, 20, 3, 1, '8:00am', '12:00pm', 1),
(179, 20, 4, 1, '8:00am', '12:00pm', 1),
(180, 20, 5, 1, '8:00am', '12:00pm', 1),
(181, 20, 6, 1, '8:00am', '12:00pm', 1),
(182, 20, 7, 0, '', '', 1),
(183, 21, 1, 1, '8:00am', '12:00pm', 1),
(184, 21, 2, 1, '8:00am', '12:00pm', 1),
(185, 21, 3, 1, '8:00am', '12:00pm', 1),
(186, 21, 4, 1, '8:00am', '12:00pm', 1),
(187, 21, 5, 1, '8:00am', '12:00pm', 1),
(188, 21, 6, 1, '8:00am', '12:00pm', 1),
(189, 21, 7, 0, '', '', 1),
(190, 22, 1, 1, '8:00am', '12:00pm', 1),
(191, 22, 2, 1, '8:00am', '12:00pm', 1),
(192, 22, 3, 1, '8:00am', '12:00pm', 1),
(193, 22, 4, 1, '8:00am', '12:00pm', 1),
(194, 22, 5, 1, '8:00am', '12:00pm', 1),
(195, 22, 6, 1, '8:00am', '12:00pm', 1),
(196, 22, 7, 0, '', '', 1),
(197, 23, 1, 1, '8:00am', '12:00pm', 1),
(198, 23, 2, 1, '8:00am', '12:00pm', 1),
(199, 23, 3, 1, '8:00am', '12:00pm', 1),
(200, 23, 4, 1, '8:00am', '12:00pm', 1),
(201, 23, 5, 1, '8:00am', '12:00pm', 1),
(202, 23, 6, 1, '8:00am', '12:00pm', 1),
(203, 23, 7, 0, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `review` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `restaurant_id`, `review`) VALUES
(18, 30, 6, 'aasdasdasdasdasd'),
(19, 30, 8, 'asdasd'),
(20, 30, 8, 'asdasdasd'),
(22, 30, 5, '85858587848748dscas'),
(23, 30, 5, 'asdasdasdas'),
(24, 30, 8, 'asdasdasdasdasd'),
(25, 46, 17, 'U'),
(26, 46, 17, 'Vsbsj'),
(27, 31, 1, 'xesdrgtu');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `lat` float DEFAULT NULL,
  `lng` float DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `address`, `mobile_number`, `email`, `lat`, `lng`, `status`) VALUES
(1, 'Section 7, Plot 4, Seaside main roadJbeil\r\nLebanon', '03039703', 'Gonargile@gmail.com', 34.1077, 35.6506, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `status`) VALUES
(58, 'Res_Image_1569932503_5d9344d7731d3.jpg', 1),
(59, 'Res_Image_1569932503_5d9344d79c8c0.jpg', 1),
(60, 'Res_Image_1569932503_5d9344d7af8f0.jpg', 1),
(61, 'Res_Image_1569932503_5d9344d7d911e.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `time` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `refresh_token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `time`, `user_id`, `refresh_token`) VALUES
(128, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOTcyODEzNjI5YzQi.v0OvU7S_vlRzVOCo93GlbYXeZpShmwMBiMl3A7loPM8', '1570273683', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOTcyODEzNjI5ZGMi.Ba8Nl0aZBs1I5VRmPtBEifmtWKiy8EMp0J2GLjaS_LI'),
(129, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOWFkNzhkMjQxODki.2CC9SzEhCJuzlA-k7WA0T5-lT71xLCpI_eGymtdqbmM', '1570515213', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOWFkNzhkMjQ2NzMi.-_DFnJn6fy1_8-8Wm0_pR_oOi4L9uS-w2qrba7m77PI'),
(130, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOWRhODY1MDFlODMi.ggIHthPkfiCmcUbZ-65eiGYJGSpkY48V1kv-YKrnxKk', '1570699749', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOWRhODY1MDIyZjQi.-MZfm5qewtvkScA5Ytq-t6XAiRyzxp7wypaFpnI1uEc'),
(131, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOWVjYmU4MzI0OTEi.LtVv29C8A_pC9z2kRvdtRs5Rb9W6ly8Hw5YMtVZA9fU', '1570774376', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOWVjYmU4MzI0YzEi._9P39163EdCh2ENW2wbl4DzBRUxAqBcNK-SEBjgW9uU'),
(132, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYTk1ZmZmMzNjZGYi.33O-NKXEwKUjb7oMy2DPhacCbGvF9HN48u9UOplhJlA', '1571467647', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYTk1ZmZmMzNjZmYi.mRTpe5-GdNTJNu5oA-lEnU-x10vsC0firI3fYbHJJfg'),
(133, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYWVmNDI0ZTc5NDci.SmuJDZqbV5bbEkurgqqHNvHT208H6iBajSf18BdjNR8', '1571833252', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYWVmNDI0ZTdkMDki.naPHmhVDJVqzvpLYyS0rnH_SAK18PildzrMIi3nnLFY'),
(134, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYWYxMThjYjZhNzAi.AQ4DECMiSAtfRMmeHv-MbzuqTGRIZ5dpOPefNtJpdmA', '1571840780', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYWYxMThjYjZiYWUi._5NY4GYkwyxBykr9veRTds27FLTRZ5XldFXKs7vMnZA'),
(135, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjA0ZWY5YWNhODgi.UHmrTdey-WjFeItruQTqrYsyXiWWGRYkKeO-xxPiKgQ', '1571922041', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjA0ZWY5YWQwZTUi.WT4AQfugAR8eqf_kshViIWGzHONoSIR5eugGzB32IzI'),
(136, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjFiNTVlMGJkNGYi.tKVqBEy-mPrDi23kwn9E4x0lBFrnQMznQsJumsQ_EzE', '1572013790', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjFiNTVlMGJkZDUi.vUaeR3KC0i-pPRRfdrtFen7tUCin10JNiMrsl5OjYhY'),
(137, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjFiNjJkMjI0OTQi.e-MUiVahINiYAEV6WDl_wJDEUwUaMcym51m2tQWrWmQ', '1572013997', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjFiNjJkMjI0YWUi.pBJH5DR0jtPZXVorFpGkJb2YEiNNG_SgmU1U9oDkvak'),
(138, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjFiNmYyM2VhMDki.EJmm8HdmQOsmJICEfxkH2t8A9hNJd0ZfLfXgimBVNPY', '1572014194', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjFiNmYyM2VhMjEi.qMwsV-sJsu9J9PCoPIfb72BDsHumnDKjTms3rZA4pJE'),
(139, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjJhZDlkMGI1Mzci.yhdXBchamvwOoauSQZXWmLWhZVyHb9tRjNYusr23bAE', '1572077341', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjJhZDlkMGI1NTki.stk3hGFuf2aWXpFirJ3nYbmJEOtrowhl-AMBUw6I4V4'),
(140, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjJhZGIxMzNkY2Qi.HS9exxwo8MRog9W4BthnM7n_tzs0ZTONAYg8qIxzY2w', '1572077361', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjJhZGIxMzNkZTMi.qujcD8gswXXGHoRKo4Z0TN8SYJUpVwHuCICkzdEPt8g'),
(141, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjJhZGJmNjM4ODgi.zX2cKD6uDHfeXt711TbD0FNZV_u-PloX3iOx2sbdBFQ', '1572077375', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjJhZGJmNjM4YTMi.CsgxGG17y_05RcFHOaMc4sFoCY7KJrAT9UlRGvDDsdk'),
(142, '', '', 30, ''),
(143, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjgyN2YxY2UyZDIi.iaBKVBRDJ6iC3DDLdmvPJEpZzmLTd8j8eldjpReVsP4', '1572436337', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjgyN2YxY2U2YmUi.kl_Kkt5RdgK-jbJSrq6ZmPpc5TpTEXyP1oXmwWN_Qy0'),
(144, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjkzNmVmOTI1ZWUi.J4D-lg8zOIOuloeo3Um2_xLwwSetmNRKArhNa1DKOjY', '1572505711', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjkzNmVmOTJhZjIi.o9jtlvoVMojn1yx971mvTh3U3VEPQDcFpx9QXE7uTlA'),
(145, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk2Y2E4MTlkNjQi.bGhEPoavGu1AMj9iOEwpQdvhxmnk9FnNzOTzq2mew3I', '1572519464', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk2Y2E4MTlkN2Ii.ilgKAo2WfvbGs4oq6y6r1xCMz7HS2XqLRB5X-1i-2V8'),
(146, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3MDc3MTJiYzki.mk3EtIG79XpmZexbRuXjkPgTzRr3lkqMAofhqXNdSp0', '1572520439', 46, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3MDc3MTJjNWYi.QYDEm1uE5KYfj9mg9fI__5yVwpGQAXeY1t99fk_ycF4'),
(147, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3MWUzMDliYjAi.gM2rJuS3HcuoG8J6LM2-20tKVHLPsXonmgSXkUOXyPM', '1572520803', 47, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3MWUzMDljNGEi.HEuKLG0OzAHfugqmQ-L5wG7G1ECb-ZMD6BsAj9paULo'),
(148, '', '', 48, ''),
(149, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3Mjk0ZWM2NWMi.qZIyPXbfobss11whs09dpZY356sEEIeMHQFK9nJrHRM', '1572520980', 49, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3Mjk0ZWM2Yzci.t9Dy7LMW18C7A_Ju85c4IlkXj27_a-sC9znAMMaoIL8'),
(150, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3MmRhMTdmYTIi.WaP6FBn6TwF-W8PnmbZrICDPwecxq7BkWOBajSiuaSM', '1572521050', 50, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3MmRhMTgwMmMi.lZ9sUEuAVYFjYR-JNHINetgSOY2AtfkKWXcMzBWaJjk'),
(151, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDI0ZTcxMjFjNDYi.nB-xCIb_1ja6P1wTwXOqmpjnphunTpqhqjbkVa7-kgQ', '1574150129', 51, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDI0ZTcxMjFjYmEi.e0BpuyX22fiFVPK9xqOGwVBgiJo-R2kUaGTobEOqx8g'),
(152, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3ODQyNTVlZmIi.3FaROodGKMn3Qi9xLXllpIq1LgB07htE6iK-bHEGDZ0', '1572522434', 52, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3ODQyNTVmNzMi.Vf4av_TPQe9QRvSWoRtQdxmQ0LuXdW4FxKZpcCCLfNw'),
(153, '', '', 53, ''),
(154, '', '', 46, ''),
(155, '', '', 46, ''),
(156, '', '', 54, ''),
(157, '', '', 54, ''),
(158, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzE0MDUxNTZiNzAi.B9XsLrBAXW19VTDScomNDRCOZt7y_Yy4479Oxm82W0c', '1573032401', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzE0MDUxNTZiZjAi.s15s6ma2FsWRVgyzUiXBr2gm2-9dIHbPj7h3j48Jg9A'),
(159, '', '', 54, ''),
(160, '', '', 46, ''),
(161, '', '', 46, ''),
(162, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk5ODM1NTA3NWIi.BsTlAw-f8IO_JxWU41oHoip0cnuiIgnyThOJFMz6OcU', '1572530613', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk5ODM1NTA3ZDIi.VLSfX9xZ3WSyuhBo8xn01E1_9bdbPZ0UO50lWY212fI'),
(163, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk5YWE4MTgzOWUi.0IX1LA2HQzzHkMl8Em_9fwPNvIDWgjGGL9c7Em4ihiw', '1572531240', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk5YWE4MTg0MWQi.Au99Npt4DqFIy-89WKhO9MeZx4C8Z7D5TBHTeAJTBa0'),
(164, '', '', 55, ''),
(165, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmE5MTNmODljNTci.4Io8nq6QK7BY6ArzNCDvyqrAj2R_CYVcAqmOymJs8UQ', '1572594367', 56, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmE5MTNmODljY2Qi.Kb4N3ZmKkoWIrWFNXwyIQyyUw5_x1CDu4Xhol_57z3g'),
(166, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmE5MTcyYmNkYzgi.2wjQ1C16DStXR812mYM7hDKVaoPMpoWEDGJNk0dY6Go', '1572594418', 56, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmE5MTcyYmNlNDQi.BJkjrVbY7SMaEkz3jq2s0NxsTWwVf1iNU3Zpkx5-ppU'),
(167, '', '', 54, ''),
(168, '', '', 56, ''),
(169, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzAxNWRjNGY3M2Yi.qcomZLeZ-W90iDft_t2uaVHeTbQh-1RKsxQ0gwWE064', '1572955996', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzAxNWRjNGY3ZDci.VByr3w8jeCmE0IvO5HMbBm6zrH5wl7umuaEJLOepgIY'),
(170, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmJlNmI4YTUwMWUi.V7vewZxLPYjVL15EI02SurXKS3oFypvQ7FnICRXOQQo', '1572681784', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmJlNmI4YTUwYTUi.NhbzSyDLmDxl6S429r9ESTXrd37lTsjfWmGNdFzuB0o'),
(171, '', '', 31, ''),
(172, '', '', 31, ''),
(173, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2VhMTJkZTE4YmEi.2mJsK6NhVZL_7SGKdy2qYQ_7UCwguA3KmdhRSuRiWv8', '1573909165', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2VhMTJkZTE5Mzci.KybADZsHKX56FmU8sscdK1EOxPjJNaJ8F3Fk0Q-YjAc'),
(174, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDRkZGQ0M2YyOGYi.G-MhGATGt2CJp9OR9G8qWyI_zv09UF_0V3v5t1XvnOQ', '1574317908', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDRkZGQ0M2YzMDMi.LjsEc32uuCHAxiYRewEHnzjJztkPqaBud-eNR8Gtxqo'),
(175, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmM4ZDY0ZDM4Mzgi.tGTOsipLdVCPFjngKRqc5PJKAR6RjmYoRmLlkahWbuc', '1572724452', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmM4ZDY0ZDM5NTIi.FOypiAvNn9UnarxDx5dOhlpqHlSPLfCAFJO545sEPTE'),
(176, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDNiMmU4MWQzYWUi.uyRql_ynXlz1KezTvGZnrPX6UM-iIhatAdSjT62XNJg', '1574241384', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDNiMmU4MWQ0Mjki._JwOhC2tFaJ5ItjE2pqoOGjEKfzx-0uyIjVEpQTFlt4'),
(177, '', '', 54, ''),
(178, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzAyNjJjNDgzOGUi.XKlP1o2biCy752UR-XyOczjKqBIGRPHt5qsKtDBxCGo', '1572960172', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzAyNjJjNDg0MTYi.Piks7845wo4m6-5kMpS0qOXlkclo0_gUgdstpuqUodg'),
(179, '', '', 55, ''),
(180, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDQzN2NmY2EzMmQi.X-SQAKydaiV8HZIWQSQoa3hgLQAKId47MRiFZmd7kUU', '1574275407', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDQzN2NmY2EzYTIi.9daUiGfJ6uvcMVuwEgbzPxLMaT87r6cStS6Dc9rSiLM'),
(181, '', '', 54, ''),
(182, '', '', 54, ''),
(183, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzgzMzk0MTAzMjQi.5oKCYX1FODgY4NIPktUma2RRqQaElVwZP5gegk9GHeE', '1573487892', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzgzMzk0MTA0NGEi.AFkFUV0g5ZwhVigI__XFJBqXEAV6Y4wLWfQVUPXytgU'),
(184, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzcwYzI2YTYxNDgi.RTPPGLgXIKKysn2jIHFUN3urPk3rMS5mSS4WbA5k5KU', '1573412262', 57, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzcwYzI2YTYxY2Yi.jHhsovCj0LJljE0F5O4TjydeZh2e1nWh9Cql6A0nclg'),
(185, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2E2MjY5ODkyYmEi.WtJg4alsF4wWZKC2cdes2GiSevhc_0USuE6bg0L3HlM', '1573630953', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2E2MjY5ODkzM2Mi.BPto1wpLzy0PX-TE2Xpr6-ECnC9MDXg4KhQj36YxkHk'),
(186, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZTUwYzlhMTMi.EdzvHIj0YLqw6fqMVcPBihJH0TA_Kp8DFVSORBSvqws', '1573744592', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZTUwYzlhODci.tP1ka1uBKz5Yt6FM9hQ6TD5ltG2kCfP_FlEg0q00Uik'),
(187, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZTcwNjk3ZmEi.0aZIiQyAY6zwT2vpTvkmx9hLWL7L3pkMDBhSAWZghlM', '1573744624', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZTcwNjk4NzYi.SlH1n2ep_NWf5sBtIu_Ok_ybHQB_pVME9D79fi2RZW4'),
(188, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZmY0MzNlZmIi.hET90cy4OJ6tRZEP1Hfv_QiYua_SYWAEw2W5y4mzeDs', '1573745012', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZmY0MzNmNmIi.5AME2hJdiRcfmlE05-a21HgnP-PpeY2xNVOcrWjFsd4'),
(189, '', '', 54, ''),
(190, '', '', 54, ''),
(191, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDI2N2U3OTcwMTci.dkH9dsUf7JoeK6QiP9oEOBtaS_HAzSW6tau7ni9fvTM', '1574156647', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDI2N2U3OTcwOGMi.72-PZiNZ6LpvbOjnuQytOhS9e3kE4536QAiOCgfcXsw'),
(192, '', '', 54, ''),
(193, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDNiMmZlNDhjZmYi.2h2kT_pTxz2SlMjiqob1TnWNJsbfwqZMd-cMfhxqlPg', '1574241406', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDNiMmZlNDhkOWQi.OHUYIrrVMUhcHhNdPDc4swYcMzs_HTRWQGR4-BiqLus'),
(194, '', '', 54, ''),
(195, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDQ0NTg1MWIyNmMi.ryu6G5Xc0EEaZHt-nfIoZwnaSaJJG-cCYHcG2wW53SE', '1574278917', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDQ0NTg1MWIyZDIi.FhyN9kPSLOrxp-JHRgzjmeO85fUD8hPWyGW9GpJtEAA'),
(196, '', '', 54, ''),
(197, '', '', 56, ''),
(198, '', '', 54, ''),
(199, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDRlNTBjMGRkZDUi.nYEazbm0AergPELUJy7_6dGZOVqlfsUjdpQOthvmclo', '1574319756', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDRlNTBjMGRlNDgi.ni3Xfei8QKGt4myAR1Pk-sqvgercvFlZ5inHNsDMx8w'),
(200, '', '', 56, ''),
(201, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDRlYWU4OTZjZmMi.MzuaDipwr4dLQTNZGvAb7vGwLTaMtjBP2jwXnY_FBfU', '1574321256', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDRlYWU4OTZkOTki.qwf_f8pjlzE0P9WraLKU0pm8J3Ds3qGF6Z2_VXY4mTk');

-- --------------------------------------------------------

--
-- Table structure for table `used_offers`
--

CREATE TABLE `used_offers` (
  `id` int(11) NOT NULL,
  `claimed_id` int(11) NOT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_of_birth` bigint(20) DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reference_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coins` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `date_of_birth`, `mobile_number`, `email`, `password`, `reference_code`, `image`, `coins`, `created_at`, `updated_at`) VALUES
(30, 'super22', 'Super22', 'Admin22', 54545455422, '+656565651466622', 'kakaka@gmail.com12222', 'c9cc24ffa63b25bb52b9d5fa288c2921a5190acd2ad461e2ece7b7d74af0fa53c86b783a066fc1ad3694313345702e69f57d70a597f7fbbf78dfc957d3bcdea9', '', 'Logo_1573544631_1428740283.png', 135, '2019-10-01 03:14:51', '2019-10-01 03:14:51'),
(31, 'zara', 'zara', 'tunyan', 1540166400, '695', 'zara.tunyan@gmail.com', '62670d1e1eea06b6c975e12bc8a16131b278f6d7bcbe017b65f854c58476baba86c2082b259fd0c1310935b365dc40f609971b6810b065e528b0b60119e69f61', NULL, 'Logo_1573999226_344756808.jpg', 289, '2019-10-01 18:08:45', '2019-10-01 18:08:45'),
(33, 'adminSuper', 'Su', 'A', 1574233377, '+656565651466622s', 'kakaka@gmail.com12222s', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '', 'User_default.png', 115, '2019-10-02 14:31:04', '2019-10-02 14:31:04'),
(34, 'user', 'developer', 'develop', 1574233377, '876767', 'test@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 530, '2019-10-02 16:06:48', '2019-10-02 16:06:48'),
(35, 'testuser', 'test', 'test', 1574233377, '846464', 'testuser@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, '2019-10-02 16:14:45', '2019-10-02 16:14:45'),
(36, 'usertest', 'test', 'test', 1574233377, '9467646', 'testtest@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, '2019-10-02 16:38:14', '2019-10-02 16:38:14'),
(37, 'MiledAoun15700188621825521286', 'Miled', 'Aoun', 1574233377, '', 'miled.ha21@gmail.com', '1570018862?1518581949', '', 'User_default.png', 0, '2019-10-02 17:21:02', '2019-10-02 17:21:02'),
(38, 'miles', 'miled', 'sounds', 1574233377, '111111', 'aaa@aaa.aaaa', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '', 'User_default.png', 0, '2019-10-02 17:22:21', '2019-10-02 17:22:21'),
(39, 'ttt', 'ttt', 'ttt', 1574233377, '45345345', 'tttt@mail.ryu', '99f97d455d5d62b24f3a942a1abc3fa8863fc0ce2037f52f09bd785b22b800d4f2e7b2b614cb600ffc2a4fe24679845b24886d69bb776fcfa46e54d188889c6f', '', 'User_default.png', 0, '2019-10-04 15:08:08', '2019-10-04 15:08:08'),
(40, 'ggg', 'gggg', 'gggg', 1574233377, '656565', 'tttt@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 14, '2019-10-04 15:36:00', '2019-10-04 15:36:00'),
(41, 'cggg', 'cfff', 'cggg', 1574233377, '22888', 'yyy@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 4, '2019-10-04 15:52:13', '2019-10-04 15:52:13'),
(46, 'dev', 'ddd', 'ddd', 1574233377, '7577557', 'test1111@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, '2019-10-30 11:13:59', '2019-10-30 11:13:59'),
(47, 'devv', 'ddd', 'ddd', 1574233377, '444444', 'ttt@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, '2019-10-30 11:20:02', '2019-10-30 11:20:02'),
(48, 'developer', 'ddd', 'ddd', 1574233377, '453453', 'rrr@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, '2019-10-30 11:21:25', '2019-10-30 11:21:25'),
(49, 'adminSuperas', 'Super22as', 'Admin22asd', 54545455422, '+656565651466622sas', 'kakaka@gmail.com12222sas', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '', 'User_default.png', 0, '2019-10-30 11:23:00', '2019-10-30 11:23:00'),
(50, 'adminSuperasas', 'Super22asas', 'Admin22asd', 54545455422, '+656565651466622sasas', 'kakaka@gmail.com12222sasas', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '', 'User_default.png', 0, '2019-10-30 11:24:10', '2019-10-30 11:24:10'),
(51, 'test data', 'test', 'test', 1572852258, '745638745683', 'rrriiiii@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 8, '2019-10-30 11:30:19', '2019-10-30 11:30:19'),
(52, 'miled', 'miled', 'aoun', 1572436003576, '111111999999', 'miled@miled.miled', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', NULL, 'User_default.png', 0, '2019-10-30 11:47:14', '2019-10-30 11:47:14'),
(53, 'testt', 'ttttt', 'fffff', 1572292800, '2222', 'ffffff@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, '2019-10-30 12:09:52', '2019-10-30 12:09:52'),
(54, 'test1', 'test', 'test', 1509307200, '21212124', 'testtt@mail.ru', '125d6d03b32c84d492747f79cf0bf6e179d287f341384eb5d6d3197525ad6be8e6df0116032935698f99a09e265073d1d6c32c274591bf1d0a20ad67cba921bc', '', 'Logo_1574233402_631642950.jpeg', 18315, '2019-10-30 12:16:38', '2019-10-30 12:16:38'),
(55, 'aaa', 'aaa', 'aaa', 1572450967305, '000', 'ckymarra@gmail.com', 'd6f644b19812e97b5d871658d6d3400ecd4787faeb9b8990c1e7608288664be77257104a58d033bcf1a0e0945ff06468ebe53e2dff36e248424c7273117dac09', NULL, 'User_default.png', 0, '2019-10-30 15:56:20', '2019-10-30 15:56:20'),
(56, 'ԱրմենուհիՄկրտչյան1572507967871163647', 'Արմենուհի', 'Մկրտչյան', 0, '', 'mkrtchyanarmenuhi89@gmail.com', '1572507967?698057233', '', 'User_default.png', 0, '2019-10-31 07:46:07', '2019-10-31 07:46:07'),
(57, 'VaskenBakkalian15733258621951140152', 'Vasken', 'Bakkalian', 0, '', 'engerochvasken@hotmail.com', '1573325862?1717654752', '', 'User_default.png', 0, '2019-11-09 18:57:42', '2019-11-09 18:57:42');

-- --------------------------------------------------------

--
-- Table structure for table `weeks`
--

CREATE TABLE `weeks` (
  `id` int(11) NOT NULL,
  `day_id` int(11) DEFAULT NULL,
  `day` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `weeks`
--

INSERT INTO `weeks` (`id`, `day_id`, `day`) VALUES
(8, 1, 'Monday'),
(9, 2, 'Tuesday'),
(10, 3, 'Wednesday'),
(11, 4, 'Thursday'),
(12, 5, 'Friday'),
(13, 6, 'Saturday'),
(14, 7, 'Sunday');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `claimed_offers`
--
ALTER TABLE `claimed_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `coin_offer_id` (`coin_offer_id`);

--
-- Indexes for table `claim_your_business`
--
ALTER TABLE `claim_your_business`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coin_offers`
--
ALTER TABLE `coin_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `featured_offers`
--
ALTER TABLE `featured_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `to_id` (`to_id`);

--
-- Indexes for table `hour_offers`
--
ALTER TABLE `hour_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `price` (`price`) USING BTREE;

--
-- Indexes for table `menu_images`
--
ALTER TABLE `menu_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `more_infos`
--
ALTER TABLE `more_infos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `overall` (`overall`) USING BTREE,
  ADD KEY `taste` (`taste`) USING BTREE,
  ADD KEY `charcoal` (`charcoal`) USING BTREE,
  ADD KEY `cleanliness` (`cleanliness`) USING BTREE,
  ADD KEY `staff` (`staff`) USING BTREE,
  ADD KEY `value_for_money` (`value_for_money`) USING BTREE,
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants_images`
--
ALTER TABLE `restaurants_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `restaurant_weeks`
--
ALTER TABLE `restaurant_weeks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `used_offers`
--
ALTER TABLE `used_offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `claimed_id` (`claimed_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `weeks`
--
ALTER TABLE `weeks`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `area`
--
ALTER TABLE `area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `badges`
--
ALTER TABLE `badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `claimed_offers`
--
ALTER TABLE `claimed_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `claim_your_business`
--
ALTER TABLE `claim_your_business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coin_offers`
--
ALTER TABLE `coin_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `featured_offers`
--
ALTER TABLE `featured_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hour_offers`
--
ALTER TABLE `hour_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `menu_images`
--
ALTER TABLE `menu_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `more_infos`
--
ALTER TABLE `more_infos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `restaurants_images`
--
ALTER TABLE `restaurants_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_weeks`
--
ALTER TABLE `restaurant_weeks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `used_offers`
--
ALTER TABLE `used_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `weeks`
--
ALTER TABLE `weeks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `area`
--
ALTER TABLE `area`
  ADD CONSTRAINT `area_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `claimed_offers`
--
ALTER TABLE `claimed_offers`
  ADD CONSTRAINT `claimed_offers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `claimed_offers_ibfk_2` FOREIGN KEY (`coin_offer_id`) REFERENCES `coin_offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `coin_offers`
--
ALTER TABLE `coin_offers`
  ADD CONSTRAINT `coin_offers_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `featured_offers`
--
ALTER TABLE `featured_offers`
  ADD CONSTRAINT `featured_offers_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `friends_ibfk_2` FOREIGN KEY (`to_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hour_offers`
--
ALTER TABLE `hour_offers`
  ADD CONSTRAINT `hour_offers_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_images`
--
ALTER TABLE `menu_images`
  ADD CONSTRAINT `menu_images_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `more_infos`
--
ALTER TABLE `more_infos`
  ADD CONSTRAINT `more_infos_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rates`
--
ALTER TABLE `rates`
  ADD CONSTRAINT `rates_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rates_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurants_images`
--
ALTER TABLE `restaurants_images`
  ADD CONSTRAINT `restaurants_images_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_weeks`
--
ALTER TABLE `restaurant_weeks`
  ADD CONSTRAINT `restaurant_weeks_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `used_offers`
--
ALTER TABLE `used_offers`
  ADD CONSTRAINT `used_offers_ibfk_1` FOREIGN KEY (`claimed_id`) REFERENCES `claimed_offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
