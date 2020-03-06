-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 06, 2020 at 09:40 AM
-- Server version: 10.1.44-MariaDB-cll-lve
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
-- Database: `aimtrhnu_nargile`
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
(32, 'admin2000', 'David', 'Kocharyan', '+37499099248', 'admisdasdan@gmail.com', 'admin', '0bf15c7902099e7430d74e16fdb6d3647ddb602574605fa014a4887da61df4bf04b865977d52367a75f85962966b3bb1f6d3c4fc9d1f5c8d5acf4f4ed3ec239d', '1', 'User_default.png', '2019-10-23 21:26:55', '2019-10-23 21:26:55');

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
  `time` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `claimed_offers`
--

INSERT INTO `claimed_offers` (`id`, `user_id`, `coin_offer_id`, `time`, `status`) VALUES
(41, 0, 0, 1574255210, 0),
(42, 0, 0, 1574255315, 0),
(43, 0, 0, 1574255319, 0),
(44, 0, 0, 1574255352, 0),
(45, 0, 0, 1574255475, 0),
(46, 0, 0, 1574255480, 0),
(47, 0, 0, 1574255593, 0),
(48, 0, 0, 1574255619, 0),
(49, 0, 0, 1574255644, 0),
(50, 0, 0, 1574255822, 0),
(51, 0, 0, 1574255918, 0),
(52, 0, 0, 1574255970, 0),
(53, 0, 0, 1574256841, 0),
(54, 0, 0, 1574257130, 0),
(55, 0, 0, 1574257297, 0),
(56, 0, 0, 1574259802, 0),
(57, 0, 0, 1574260106, 0),
(58, 0, 0, 1574260149, 0),
(59, 0, 0, 1574260155, 0),
(60, 0, 0, 1574260342, 0),
(61, 0, 0, 1574260390, 0),
(62, 0, 0, 1574260393, 0),
(63, 0, 0, 1574260395, 0),
(64, 0, 0, 1574260427, 0),
(65, 0, 0, 1574260430, 0),
(66, 0, 0, 1574260432, 0),
(67, 0, 0, 1574318293, 0),
(68, 0, 0, 1574318543, 0),
(69, 0, 0, 1574318594, 0),
(70, 0, 0, 1574318653, 0),
(71, 0, 0, 1574318655, 0),
(72, 0, 0, 1574318657, 0),
(73, 0, 0, 1574318870, 0),
(74, 0, 0, 1574318873, 0),
(75, 0, 0, 1574318875, 0),
(76, 0, 0, 1574318923, 0),
(77, 0, 0, 1574318925, 0),
(78, 0, 0, 1574319220, 0),
(79, 0, 0, 1574319667, 0),
(80, 0, 0, 1574319677, 0),
(81, 0, 0, 1574319960, 0),
(82, 0, 0, 1574320087, 0),
(83, 0, 0, 1574320117, 0),
(84, 0, 0, 1574320129, 0),
(85, 0, 0, 1574320131, 0),
(86, 0, 0, 1574320472, 0),
(87, 0, 0, 1574320475, 0),
(88, 0, 0, 1574320734, 0),
(89, 0, 0, 1574320741, 0),
(90, 0, 0, 1574321633, 0),
(91, 0, 0, 1574321635, 0),
(92, 0, 0, 1574321649, 0),
(93, 0, 0, 1574321759, 0),
(94, 0, 0, 1574322284, 0),
(95, 0, 0, 1574322291, 0),
(96, 0, 0, 1574322300, 0),
(97, 0, 0, 1574322599, 0),
(98, 0, 0, 1574322607, 0),
(99, 0, 0, 1574322614, 0),
(100, 0, 0, 1574322622, 0),
(101, 0, 0, 1574323079, 0),
(102, 0, 0, 1574323119, 0),
(103, 0, 0, 1574323121, 0),
(104, 0, 0, 1574323124, 0),
(105, 0, 0, 1574323309, 0),
(106, 0, 0, 1574327690, 0),
(107, 0, 0, 1574327697, 0),
(108, 0, 0, 1574327779, 0),
(109, 0, 0, 1574327785, 0),
(110, 0, 0, 1574327875, 0),
(111, 0, 0, 1574327883, 0),
(112, 0, 0, 1574327890, 0),
(113, 0, 0, 1574328494, 0),
(114, 0, 0, 1574328505, 0),
(115, 0, 0, 1574328507, 0),
(116, 0, 0, 1574329233, 0),
(117, 0, 0, 1574329235, 0),
(118, 0, 0, 1574329238, 0),
(119, 0, 0, 1574329284, 0),
(120, 0, 0, 1574329286, 0),
(121, 0, 0, 1574330532, 0),
(122, 0, 0, 1574330728, 0),
(123, 0, 0, 1574330731, 0),
(124, 0, 0, 1574330738, 0),
(125, 0, 0, 1574330871, 0),
(126, 0, 0, 1574330874, 0),
(127, 0, 0, 1574330885, 0),
(128, 0, 0, 1574332624, 0),
(129, 0, 0, 1574332626, 0),
(130, 0, 0, 1574333358, 0),
(131, 0, 0, 1574333368, 0),
(132, 0, 0, 1574333976, 0),
(133, 0, 0, 1574333979, 0),
(134, 0, 0, 1574333993, 0),
(135, 0, 0, 1574333997, 0),
(136, 0, 0, 1574333999, 0),
(137, 0, 0, 1574334032, 0),
(138, 0, 0, 1574334035, 0),
(139, 0, 0, 1574334097, 0),
(140, 0, 0, 1574334099, 0),
(141, 0, 0, 1574334117, 0),
(142, 0, 0, 1574334119, 0),
(143, 0, 0, 1574334270, 0),
(144, 0, 0, 1574334375, 0),
(145, 0, 0, 1574334378, 0),
(146, 0, 0, 1574334382, 0),
(147, 0, 0, 1574334675, 0),
(148, 0, 0, 1574334681, 0),
(149, 0, 0, 1574334687, 0),
(150, 0, 0, 1574335451, 0),
(151, 0, 0, 1574335458, 0),
(152, 0, 0, 1574335466, 0),
(153, 0, 0, 1574335601, 0),
(154, 0, 0, 1574335606, 0),
(155, 0, 0, 1574335617, 0),
(156, 0, 0, 1574335775, 0),
(157, 0, 0, 1574336163, 0),
(158, 0, 0, 1574336266, 0),
(159, 0, 0, 1574336275, 0),
(160, 0, 0, 1574336283, 0),
(161, 0, 0, 1574336733, 0),
(162, 0, 0, 1574336742, 0),
(163, 0, 0, 1574337527, 0),
(164, 0, 0, 1574337530, 0),
(165, 0, 0, 1574337532, 0),
(166, 0, 0, 1574337635, 0),
(167, 0, 0, 1574337637, 0),
(168, 0, 0, 1574337652, 0),
(169, 0, 0, 1574337655, 0),
(170, 0, 0, 1574337657, 0),
(171, 0, 0, 1574337774, 0),
(172, 0, 0, 1574337839, 0),
(173, 0, 0, 1574337848, 0),
(174, 0, 0, 1574338001, 0),
(175, 0, 0, 1574338009, 0),
(176, 0, 0, 1574338187, 0),
(177, 0, 0, 1574338431, 0),
(178, 0, 0, 1574340008, 0),
(179, 0, 0, 1574340124, 0),
(180, 0, 0, 1574340266, 0),
(181, 0, 0, 1574340396, 0),
(182, 0, 0, 1574340579, 0),
(183, 0, 0, 1574341852, 0),
(184, 0, 0, 1574341949, 0),
(185, 0, 0, 1574342027, 0),
(186, 0, 0, 1574342243, 0),
(187, 0, 0, 1574342353, 0),
(188, 0, 0, 1574342483, 0),
(189, 0, 0, 1574342630, 0),
(190, 0, 0, 1574342948, 0),
(191, 0, 0, 1574343049, 0),
(192, 0, 0, 1574343119, 0),
(193, 0, 0, 1574343176, 0),
(194, 0, 0, 1574343188, 0),
(195, 0, 0, 1574343254, 0),
(196, 0, 0, 1574343257, 0),
(197, 0, 0, 1574343332, 0),
(198, 0, 0, 1574343550, 0),
(199, 0, 0, 1574343556, 0),
(200, 0, 0, 1574343566, 0),
(201, 0, 0, 1574343761, 0),
(202, 0, 0, 1574343763, 0),
(203, 0, 0, 1574344017, 0),
(204, 0, 0, 1574344059, 0),
(205, 0, 0, 1574344069, 0),
(206, 0, 0, 1574344072, 0),
(207, 0, 0, 1574344074, 0),
(208, 0, 0, 1574344263, 0),
(209, 0, 0, 1574346822, 0),
(210, 0, 0, 1574346981, 0),
(211, 0, 0, 1574347981, 0),
(212, 0, 0, 1574347992, 0),
(213, 0, 0, 1574347995, 0),
(214, 0, 0, 1574348065, 0),
(215, 0, 0, 1574348067, 0),
(216, 0, 0, 1574348071, 0),
(217, 0, 0, 1574348073, 0),
(218, 0, 0, 1574348075, 0),
(219, 0, 0, 1574348076, 0),
(220, 0, 0, 1574348080, 0),
(221, 0, 0, 1574348081, 0),
(222, 0, 0, 1574348083, 0),
(223, 0, 0, 1574348085, 0),
(224, 0, 0, 1574348091, 0),
(225, 0, 0, 1574348109, 0),
(226, 0, 0, 1574348114, 0),
(227, 0, 0, 1574360640, 0),
(228, 0, 0, 1574419830, 0),
(229, 0, 0, 1574775779, 0),
(230, 54, 13, 1574775789, 1),
(231, 54, 56, 1574775839, 1),
(232, 0, 0, 1574854360, 0),
(233, 54, 57, 1574854570, 1),
(234, 54, 58, 1574854577, 1),
(235, 0, 0, 1574854582, 0),
(236, 0, 0, 1574854587, 0),
(237, 0, 0, 1574854621, 0),
(238, 0, 0, 1574854668, 0),
(239, 0, 0, 1574854675, 0),
(240, 0, 0, 1574854677, 0),
(241, 0, 0, 1574854680, 0),
(242, 0, 0, 1574854682, 0),
(243, 0, 0, 1574855573, 0),
(244, 0, 0, 1574856656, 0),
(245, 0, 0, 1574856680, 0),
(246, 54, 11, 1574856974, 1),
(247, 54, 12, 1574856976, 1),
(248, 54, 59, 1574856980, 1),
(249, 54, 60, 1574856982, 1),
(250, 54, 61, 1574856984, 1),
(251, 0, 0, 1574856985, 0),
(252, 54, 63, 1574856987, 1),
(253, 54, 64, 1574856989, 1),
(254, 54, 65, 1574856990, 1),
(255, 54, 66, 1574856997, 1),
(256, 0, 0, 1574929977, 0),
(257, 0, 0, 1574942746, 0),
(258, 0, 0, 1575289569, 0),
(259, 31, 58, 1575290238, 1),
(260, 31, 65, 1575290490, 1),
(261, 0, 0, 1575291387, 0),
(262, 0, 0, 1575291460, 0),
(263, 0, 0, 1575291703, 0),
(264, 0, 0, 1575291773, 0),
(265, 0, 0, 1575292266, 0),
(266, 0, 0, 1575292489, 0),
(267, 0, 0, 1575292522, 0),
(268, 91, 66, 1575293397, 1),
(269, 0, 0, 1581337173, 0),
(270, 0, 0, 1581345878, 0),
(271, 0, 0, 1581345894, 0),
(272, 0, 0, 1581346031, 0),
(273, 0, 0, 1581346102, 0),
(274, 0, 0, 1581346242, 0),
(275, 0, 0, 1581346330, 0),
(276, 0, 0, 1581346334, 0),
(277, 0, 0, 1582372717, 0),
(278, 0, 0, 1582539380, 0),
(279, 0, 0, 1582637174, 0),
(280, 0, 0, 1582637458, 0),
(281, 0, 0, 1582637514, 0),
(282, 0, 0, 1582637589, 0),
(283, 0, 0, 1582637625, 0),
(284, 0, 0, 1582637631, 0),
(285, 0, 0, 1582637636, 0),
(286, 0, 0, 1582637641, 0),
(287, 0, 0, 1582637794, 0),
(288, 54, 71, 1582739886, 1);

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

--
-- Dumping data for table `claim_your_business`
--

INSERT INTO `claim_your_business` (`id`, `restaurant_id`, `first_name`, `last_name`, `mobile_number`, `email`, `position`, `owner_first`, `owner_last`, `owner_mobile`, `owner_email`, `via_mobile`, `via_whatsapp`, `via_email`, `report`, `status`, `created_at`) VALUES
(1, 12, 'aa', 'as', 'ss', 'ss@mail.ru', 'eeee', '', '', NULL, '', 0, 0, 0, '', 1, '2020-02-26 11:50:59'),
(2, 12, 'aaa', 'aaa', 'ssss', 'qqq@mail.ry', 'eeeee', '', '', NULL, '', 0, 0, 0, '', 1, '2020-02-26 11:52:58'),
(3, 12, 'wwww', 'eeeee', '747747447', 'sad asas', 'ssssss', '', '', NULL, '', 0, 1, 1, '', 1, '2020-02-26 11:56:16');

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
  `count` int(11) NOT NULL DEFAULT '1',
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coin_offers`
--

INSERT INTO `coin_offers` (`id`, `restaurant_id`, `price`, `valid_date`, `description`, `count`, `status`) VALUES
(11, 9, 500, 1576105200, 'Keif is offering 2 freenargile in Achrafieh branch.', 1, 1),
(12, 9, 700, 1576105200, 'Keif is offering 1 freenargile in Achrafieh branch.', 1, 1),
(13, 9, 800, 1576105200, 'Keif is offering 1 freenargile in Achrafieh branch.', 1, 1),
(56, 3, 10, 1575180000, 'Keif is offering 1 freenargile in Achrafieh branch.', 0, 1),
(57, 3, 20, 1575266400, 'Keif is offering 1 freenargile in Achrafieh branch.', 0, 1),
(58, 3, 30, 1575525600, 'Keif is offering 1 freenargile in Achrafieh branch.', 0, 1),
(59, 3, 40, 1575612000, 'Keif is offering 1 freenargile in Achrafieh branch.', 0, 1),
(60, 3, 60, 1576908000, 'Keif is offering 1 freenargile in Achrafieh branch.', 0, 1),
(61, 4, 10, 1575525600, 'Keif is offering 1 freenargile in Achrafieh branch.', 0, 1),
(62, 4, 20, 1575525600, 'Keif is offering 1 freenargile in Achrafieh branch.', 0, 1),
(63, 4, 30, 1575352800, 'Keif is offering 1 freenargile in Achrafieh branch.', 0, 1),
(64, 4, 40, 1575612000, 'Keif is offering 1 freenargile in Achrafieh branch.', 0, 1),
(65, 4, 50, 1575871200, 'Keif is offering 1 freenargile in Achrafieh branch.', 0, 1),
(66, 4, 60, 1577253600, 'Keif is offering 1 freenargile in Achrafieh branch.', 8, 1),
(67, 4, 70, 1577253600, 'Keif is offering 1 freenargile in Achrafieh branch.', 1, 1),
(68, 1, 1500, 1607749200, 'Narguile Serbetli Cinnamon', 8, 1),
(69, 1, 1500, 1607749200, 'Narguile Serbetli Pomelo', 8, 1),
(70, 1, 1500, 1765515600, 'Narguile Serbetli Banana', 9, 1),
(71, 1, 50, 1607749200, 'Narguile Serbetli Coca-cola', 5, 1),
(72, 1, 10, 1607749200, 'Narguile Serbetli Teramisu', 0, 1);

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
(21, 30, 17, 1),
(22, 54, 1, 0),
(23, 31, 17, 0),
(24, 52, 1, 0),
(25, 31, 1, 1),
(26, 54, 12, 1),
(27, 37, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `featured_offers`
--

CREATE TABLE `featured_offers` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `featured_offers`
--

INSERT INTO `featured_offers` (`id`, `restaurant_id`, `text`, `status`, `created_at`) VALUES
(1, 1, 'Nargile for 3000 LBP Tuesdays - Wednesdays Thurdays Ladies ONLY', '1', '2019-12-19 07:16:20'),
(2, 1, 'Free Nargile From 13:00 PM Till 16:00PM Mon-Fri', '1', '2019-12-19 07:16:20');

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `from_id`, `to_id`, `status`) VALUES
(1, 30, 31, 0),
(3, 54, 31, 0),
(4, 34, 31, 0),
(5, 35, 31, 0),
(6, 30, 47, 1),
(7, 37, 31, 0),
(8, 51, 31, 0),
(9, 37, 54, 0),
(10, 91, 54, 0),
(11, 91, 31, 0),
(12, 91, 33, 0),
(13, 91, 34, 0),
(14, 91, 35, 0),
(15, 91, 40, 0),
(16, 30, 38, 2),
(27, NULL, NULL, NULL),
(28, 54, 96, 0),
(30, NULL, NULL, NULL),
(31, NULL, NULL, NULL),
(32, 97, 35, 2),
(33, NULL, NULL, NULL),
(34, NULL, NULL, NULL),
(35, 54, 96, 0),
(36, 97, 96, 1),
(37, 97, 54, 0),
(38, 97, 54, 0),
(40, 97, 98, 0),
(41, 96, 30, 2),
(42, 96, 34, 2),
(43, 96, 31, 0),
(44, 96, 39, 2),
(45, 96, 33, 2),
(46, 98, 96, 0),
(47, NULL, NULL, NULL),
(48, 97, 34, 2),
(49, 97, 33, 2),
(50, 97, 41, 2),
(51, 96, 35, 2),
(52, 96, 40, 2),
(53, 96, 41, 2),
(54, 54, 98, 0),
(55, NULL, NULL, NULL),
(59, 96, 36, 2),
(60, NULL, NULL, NULL),
(61, 99, 35, 2),
(62, 99, 36, 2),
(63, 99, 54, 0),
(64, 100, 54, 0),
(65, 101, 31, 0),
(67, 54, 34, 2),
(68, 54, 30, 2),
(69, 91, 100, 2),
(70, 91, 54, 0),
(71, 98, 91, 0),
(72, 96, 91, 0),
(73, 96, 54, 0),
(74, 103, 91, 1),
(75, 54, 46, 2),
(76, 54, 91, 2),
(77, 54, 35, 2),
(78, NULL, NULL, NULL),
(79, 31, 37, 1),
(80, 91, 35, 2),
(81, 91, 36, 2),
(82, 96, 54, 0),
(83, 96, 54, 1),
(84, NULL, NULL, NULL),
(85, NULL, NULL, NULL),
(86, NULL, NULL, NULL),
(87, 31, 33, 2),
(88, 31, 30, 2);

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

--
-- Dumping data for table `hour_offers`
--

INSERT INTO `hour_offers` (`id`, `restaurant_id`, `text`, `status`) VALUES
(1, 2, 'Nargile for 3000 LBP Tuesdays - Wednesdays Thurdays Ladies ONLY', 1),
(2, 2, 'Free Nargile From 13:00 PM Till 16:00PM Mon-Fri', 1);

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_card`
--

CREATE TABLE `loyalty_card` (
  `id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `valid_date` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `qr` varchar(255) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `loyalty_card`
--

INSERT INTO `loyalty_card` (`id`, `res_id`, `desc`, `valid_date`, `percent`, `qr`, `status`) VALUES
(10, 1, 'You have 20% discount  at Cafe Em Nazih', 1576130400, 20, 'ZX48-KX4_1575285651.png', 1),
(11, 1, 'You have 50% discount at Cafe Em Nazih	', 1576130400, 50, 'DG45-DR45A_1575285691.png', 1);

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

--
-- Dumping data for table `menu_images`
--

INSERT INTO `menu_images` (`id`, `restaurant_id`, `image`, `status`) VALUES
(1, 25, 'Menu_image_1582642942_5e5536fe2c284.jpg', 1),
(2, 25, 'Menu_image_1582642942_5e5536fec1a6a.jpg', 1),
(3, 25, 'Menu_image_1582642943_5e5536ff76f39.jpg', 1),
(4, 25, 'Menu_image_1582642943_5e5536ff88177.jpg', 1),
(5, 25, 'Menu_image_1582642961_5e553711b7a84.jpg', 1),
(6, 25, 'Menu_image_1582643000_5e553738a43ae.jpg', 1),
(7, 25, 'Menu_image_1582643001_5e5537391313b.jpg', 1);

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
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `body` varchar(255) CHARACTER SET utf8 NOT NULL,
  `click_action` varchar(255) CHARACTER SET utf8 NOT NULL,
  `coins` int(255) DEFAULT NULL,
  `action_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `user_id`, `body`, `click_action`, `coins`, `action_id`, `status`, `created_at`) VALUES
(13, 34, 'test test Sent You 15 Coins', 'coin_request', 15, 91, 1, '2020-01-24 15:53:44'),
(14, 96, 'You have canceled the pq ', 'friend_request', NULL, 97, 0, '2020-02-05 02:28:20'),
(15, 96, 'test  is now your friend', 'friend_request', NULL, 54, 0, '2020-02-05 02:42:27'),
(17, 96, 'You have canceled the test ', 'friend_request', NULL, 54, 0, '2020-02-05 02:49:04'),
(18, 96, 'You have canceled the test ', 'friend_request', NULL, 54, 0, '2020-02-05 02:49:51'),
(19, 35, 'pq agh Sent You Friend Request', 'friend_request', NULL, 97, 1, '2020-02-05 02:51:26'),
(20, 96, 'You have canceled the test ', 'friend_request', NULL, 54, 0, '2020-02-05 02:52:22'),
(21, 96, 'You have canceled the test ', 'friend_request', NULL, 54, 0, '2020-02-05 02:53:11'),
(22, 96, 'test  is now your friend', 'friend_request', NULL, 54, 0, '2020-02-05 02:56:57'),
(23, 96, 'pq  is now your friend', 'friend_request', NULL, 97, 0, '2020-02-05 03:00:32'),
(24, 54, 'pq  is now your friend', 'friend_request', NULL, 97, 0, '2020-02-05 03:01:10'),
(25, 54, 'pq  is now your friend', 'coin_request', 10, 97, 0, '2020-02-05 03:04:13'),
(26, 54, 'You have confirmed receipt of 10 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 03:05:39'),
(27, 54, 'pq  is now your friend', 'friend_request', NULL, 97, 0, '2020-02-05 03:12:51'),
(28, 54, 'You have confirmed receipt of 5 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 03:13:34'),
(29, 54, 'You have canceled the pq ', 'coin_request', 1, 97, 0, '2020-02-05 03:14:02'),
(30, 97, 'test test Sent You 10 Coins', 'coin_request', 10, 54, 1, '2020-02-05 03:14:33'),
(31, 54, 'You have canceled the receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 03:16:25'),
(32, 54, 'You have confirmed receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 03:16:45'),
(33, 54, 'You have canceled the pq ', 'coin_request', 1, 97, 0, '2020-02-05 03:16:54'),
(34, 54, 'You have canceled the receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 03:24:01'),
(35, 54, 'You have canceled the receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 03:24:09'),
(36, 54, 'You have canceled the receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 03:25:15'),
(37, 54, 'You have confirmed receipt of 20 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 03:28:15'),
(38, 54, 'pq  is now your friend', 'coin_request', 25, 97, 0, '2020-02-05 03:28:28'),
(39, 54, 'pq  is now your friend', 'coin_request', 30, 97, 0, '2020-02-05 03:28:38'),
(40, 54, 'pq  is now your friend', 'coin_request', 10, 97, 0, '2020-02-05 03:28:47'),
(41, 54, 'You have confirmed receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 03:40:13'),
(43, 98, 'pq  is now your friend', 'friend_request', NULL, 97, 0, '2020-02-05 03:47:28'),
(44, 98, 'You have canceled the receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 03:48:42'),
(45, 98, 'You have canceled the receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 03:59:33'),
(46, 98, 'You have canceled the receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 03:59:47'),
(47, 98, 'You have canceled the receipt of 2 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 04:00:00'),
(48, 98, 'You have canceled the receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 04:03:37'),
(49, 98, 'You have confirmed receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 04:05:29'),
(50, 98, 'You have canceled the receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 04:05:30'),
(51, 98, 'You have confirmed receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 04:05:42'),
(52, 98, 'You have canceled the receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 04:05:53'),
(53, 98, 'You have canceled the receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 04:06:23'),
(54, 98, 'You have confirmed receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 04:06:25'),
(55, 98, 'You have confirmed receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 04:06:26'),
(56, 98, 'You have canceled the receipt of 1 coins from the pq ', 'coin_request', 0, 97, 0, '2020-02-05 04:06:31'),
(57, 30, 'David Kocharyan Sent You Friend Request', 'friend_request', NULL, 96, 1, '2020-02-05 06:30:50'),
(58, 34, 'David Kocharyan Sent You Friend Request', 'friend_request', NULL, 96, 1, '2020-02-05 06:31:11'),
(59, 31, 'David  is now your friend', 'friend_request', NULL, 96, 0, '2020-02-05 06:46:58'),
(60, 39, 'David Kocharyan Sent You Friend Request', 'friend_request', NULL, 96, 1, '2020-02-05 07:06:22'),
(61, 33, 'David Kocharyan Sent You Friend Request', 'friend_request', NULL, 96, 1, '2020-02-05 07:11:17'),
(62, 96, 'new  is now your friend', 'friend_request', NULL, 98, 0, '2020-02-05 07:40:39'),
(63, 96, 'You have confirmed receipt of 1 coins from the new ', 'coin_request', 0, 98, 0, '2020-02-05 07:41:09'),
(64, 96, 'You have canceled the receipt of 1 coins from the new ', 'coin_request', 0, 98, 0, '2020-02-05 07:41:18'),
(65, 96, 'You have canceled the receipt of 1 coins from the new ', 'coin_request', 0, 98, 0, '2020-02-05 07:41:25'),
(66, 96, 'You have canceled the receipt of 1 coins from the new ', 'coin_request', 0, 98, 0, '2020-02-05 07:41:34'),
(67, 37, 'You have canceled the new ', 'friend_request', NULL, 98, 0, '2020-02-05 07:43:17'),
(68, 34, 'pq agh Sent You Friend Request', 'friend_request', NULL, 97, 1, '2020-02-05 07:48:00'),
(69, 33, 'pq agh Sent You Friend Request', 'friend_request', NULL, 97, 1, '2020-02-05 07:48:20'),
(70, 41, 'pq agh Sent You Friend Request', 'friend_request', NULL, 97, 1, '2020-02-05 07:50:11'),
(71, 35, 'David Kocharyan Sent You Friend Request', 'friend_request', NULL, 96, 1, '2020-02-05 07:53:18'),
(72, 40, 'David Kocharyan Sent You Friend Request', 'friend_request', NULL, 96, 1, '2020-02-05 07:58:49'),
(73, 41, 'David Kocharyan Sent You Friend Request', 'friend_request', NULL, 96, 1, '2020-02-05 07:59:29'),
(74, 98, 'test  is now your friend', 'friend_request', NULL, 54, 0, '2020-02-05 08:10:47'),
(75, 98, 'You have canceled the Արմենուհի ', 'friend_request', NULL, 95, 0, '2020-02-05 08:12:27'),
(76, 98, 'Արմենուհի  is now your friend', 'friend_request', NULL, 95, 0, '2020-02-05 08:15:05'),
(77, 30, 'Արմենուհի Մկրտչյան Sent You Friend Request', 'friend_request', NULL, 95, 1, '2020-02-05 08:16:06'),
(78, 34, 'Արմենուհի Մկրտչյան Sent You Friend Request', 'friend_request', NULL, 95, 1, '2020-02-05 08:18:47'),
(79, 36, 'David Kocharyan Sent You Friend Request', 'friend_request', NULL, 96, 1, '2020-02-05 08:57:41'),
(80, 91, 'You have canceled the David ', 'friend_request', NULL, 96, 0, '2020-02-05 08:57:49'),
(81, 35, 'user2 user2 Sent You Friend Request', 'friend_request', NULL, 99, 1, '2020-02-05 09:03:01'),
(82, 36, 'user2 user2 Sent You Friend Request', 'friend_request', NULL, 99, 1, '2020-02-05 09:03:08'),
(83, 54, 'user2  is now your friend', 'friend_request', NULL, 99, 0, '2020-02-05 09:03:13'),
(84, 54, 'dummy  is now your friend', 'friend_request', NULL, 100, 0, '2020-02-05 09:05:30'),
(85, 100, 'test test SHARED Cafe Em Nazih RESTAURANT!', 'share_request', NULL, 1, 1, '2020-02-05 09:07:51'),
(86, 31, 'hdnd  is now your friend', 'friend_request', NULL, 101, 0, '2020-02-06 05:45:17'),
(87, 31, 'You have confirmed receipt of 1 coins from the hdnd ', 'coin_request', 0, 101, 0, '2020-02-06 05:46:45'),
(88, 31, 'You have confirmed receipt of 1 coins from the hdnd ', 'coin_request', 0, 101, 0, '2020-02-06 06:19:16'),
(89, 31, 'You have canceled the receipt of 1 coins from the hdnd ', 'coin_request', 0, 101, 0, '2020-02-06 06:19:23'),
(90, 31, 'hdnd  is now your friend', 'friend_request', NULL, 101, 0, '2020-02-06 06:29:47'),
(91, 31, 'You have confirmed receipt of 1 coins from the hdnd ', 'coin_request', 0, 101, 0, '2020-02-06 06:30:20'),
(92, 31, 'You have confirmed receipt of 1 coins from the hdnd ', 'coin_request', 0, 101, 0, '2020-02-06 06:30:37'),
(93, 34, 'test test Sent You Friend Request', 'friend_request', NULL, 54, 1, '2020-02-07 03:03:10'),
(94, 30, 'test test Sent You Friend Request', 'friend_request', NULL, 54, 1, '2020-02-10 07:17:21'),
(95, 100, 'test test Sent You Friend Request', 'friend_request', NULL, 91, 1, '2020-02-10 09:22:32'),
(96, 54, 'test  is now your friend', 'friend_request', NULL, 91, 0, '2020-02-10 09:36:20'),
(97, 91, 'new  is now your friend', 'friend_request', NULL, 98, 0, '2020-02-10 09:39:41'),
(98, 31, 'You have confirmed receipt of 1 coins from the David ', 'coin_request', 0, 96, 0, '2020-02-10 09:41:15'),
(99, 91, 'David  is now your friend', 'friend_request', NULL, 96, 0, '2020-02-10 09:53:16'),
(100, 54, 'David  is now your friend', 'friend_request', NULL, 96, 0, '2020-02-10 09:57:03'),
(101, 91, 'Արմենուհի  is now your friend', 'friend_request', NULL, 103, 0, '2020-02-10 09:58:01'),
(102, 46, 'test test Sent You Friend Request', 'friend_request', NULL, 54, 1, '2020-02-20 09:28:22'),
(103, 96, 'test test SHARED Cafe Em Nazih RESTAURANT!', 'share_request', NULL, 1, 1, '2020-02-20 09:29:31'),
(104, 91, 'test test Sent You Friend Request', 'friend_request', NULL, 54, 1, '2020-02-24 05:19:01'),
(105, 96, 'test test SHARED Abo Waseem RESTAURANT!', 'share_request', NULL, 2, 1, '2020-02-24 05:22:24'),
(106, 35, 'test test Sent You Friend Request', 'friend_request', NULL, 54, 1, '2020-02-24 05:22:46'),
(107, 31, 'You have canceled the test ', 'friend_request', NULL, 54, 0, '2020-02-25 05:19:14'),
(108, 37, 'zara tunyan Sent You Friend Request', 'friend_request', NULL, 31, 1, '2020-02-28 08:22:59'),
(109, 35, 'test test Sent You Friend Request', 'friend_request', NULL, 91, 1, '2020-02-28 08:30:30'),
(110, 36, 'test test Sent You Friend Request', 'friend_request', NULL, 91, 1, '2020-02-28 08:30:32'),
(111, 54, 'David  is now your friend', 'friend_request', NULL, 96, 0, '2020-02-28 08:32:05'),
(112, 96, 'test test Sent You 5 Coins', 'coin_request', 5, 54, 1, '2020-02-28 08:32:50'),
(113, 54, 'David  is now your friend', 'friend_request', NULL, 96, 0, '2020-02-28 09:02:14'),
(114, 31, 'You have canceled the receipt of  coins from the  ', 'admin_request', 0, 0, 0, '2020-02-28 10:00:36'),
(115, 31, 'You have canceled the receipt of  coins from the  ', 'admin_request', 0, 0, 0, '2020-02-28 10:01:27'),
(116, 31, 'You have canceled the test ', 'friend_request', NULL, 54, 0, '2020-02-28 10:03:09'),
(117, 31, 'You have canceled the test ', 'friend_request', NULL, 54, 0, '2020-02-28 10:04:49'),
(118, 31, 'LALALALALALALALA', 'admin_request', NULL, 0, 1, '2020-02-28 10:08:49'),
(119, 31, 'You have canceled the test ', 'friend_request', NULL, 54, 0, '2020-02-28 10:09:28'),
(120, 31, 'Lorem ipsum dolor set a met', 'admin_request', NULL, 0, 1, '2020-02-28 10:10:08'),
(121, 33, 'zara tunyan Sent You Friend Request', 'friend_request', NULL, 31, 1, '2020-02-29 12:52:17'),
(122, 30, 'zara tunyan Sent You Friend Request', 'friend_request', NULL, 31, 1, '2020-02-29 12:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `offers_click`
--

CREATE TABLE `offers_click` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `offer_id` int(255) DEFAULT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offers_click`
--

INSERT INTO `offers_click` (`id`, `user_id`, `restaurant_id`, `offer_id`, `type`) VALUES
(1, 91, 1, NULL, 0),
(2, 91, 1, NULL, 1),
(3, 91, 1, NULL, 0),
(4, 91, 1, NULL, 1),
(5, 91, 1, NULL, 1),
(6, 91, 1, NULL, 1),
(7, 91, 1, NULL, 1),
(8, 91, 1, NULL, 0),
(9, 91, 1, NULL, 0),
(10, 91, 1, NULL, 1),
(11, 91, 1, NULL, 0),
(12, 91, 1, NULL, 1),
(13, 91, 1, NULL, 1),
(14, 91, 1, NULL, 1),
(15, 91, 1, NULL, 1),
(16, 91, 1, NULL, 0),
(17, 91, 2, NULL, 0),
(18, 91, 1, NULL, 0),
(19, 91, 1, NULL, 0),
(20, 91, 1, NULL, 0),
(21, 91, 1, NULL, 0),
(22, 54, 1, NULL, 0),
(23, 101, 1, NULL, 0),
(24, 101, 1, NULL, 0),
(25, 101, 1, NULL, 0),
(26, 101, 1, NULL, 0),
(27, 31, 1, NULL, 0),
(28, 31, 1, NULL, 0),
(29, 31, 1, NULL, 0),
(30, 31, 1, NULL, 0),
(31, 31, 1, NULL, 0),
(38, 31, 1, NULL, 0),
(39, 31, 2, NULL, 1),
(40, 31, 1, NULL, 0),
(41, 54, 2, NULL, 1),
(42, 31, 1, NULL, 0),
(43, 31, 1, NULL, 0),
(44, 54, 2, NULL, 1),
(45, 31, 1, NULL, 0),
(46, 91, 1, NULL, 0),
(47, 31, 1, NULL, 0),
(48, 54, 1, NULL, 0),
(49, 31, 1, NULL, 0),
(50, 54, 1, NULL, 0),
(51, 54, 1, NULL, 0),
(52, 31, 1, NULL, 0),
(53, 31, 1, NULL, 0),
(54, 31, 1, NULL, 0),
(55, 31, 1, NULL, 0),
(56, 31, 1, NULL, 0),
(57, 31, 1, NULL, 0),
(58, 31, 1, NULL, 0),
(59, 31, 1, NULL, 0),
(60, 31, 1, NULL, 0),
(61, 31, 1, NULL, 0),
(62, 31, 1, NULL, 0),
(63, 31, 1, NULL, 0),
(64, 54, 1, NULL, 0),
(65, 31, 1, NULL, 0),
(66, 31, 1, NULL, 0),
(67, 31, 1, NULL, 0),
(68, 31, 1, NULL, 0),
(69, 31, 1, NULL, 0),
(70, 31, 1, NULL, 0),
(71, 31, 1, NULL, 0),
(72, 31, 2, NULL, 0),
(73, 31, 2, NULL, 0),
(74, 31, 1, NULL, 0),
(75, 31, 1, NULL, 0),
(76, 31, 1, NULL, 0),
(77, 96, 2, NULL, 1),
(78, 57, 2, NULL, 0),
(79, 91, 1, NULL, 0),
(80, 91, 2, NULL, 1),
(81, 91, 1, NULL, 0),
(82, 54, 1, NULL, 0),
(83, 96, 1, NULL, 0),
(84, 96, 2, NULL, 1),
(85, 54, 1, NULL, 0),
(86, 54, 1, NULL, 0),
(87, 31, 1, NULL, 0),
(88, 31, 1, NULL, 0),
(89, 31, 1, NULL, 0),
(90, 31, 1, NULL, 0),
(91, 31, 2, NULL, 1),
(92, 31, 1, NULL, 3),
(93, 31, 1, NULL, 0),
(94, 31, 2, NULL, 1),
(95, 31, 1, NULL, 3),
(96, 31, 1, NULL, 0),
(97, 54, 1, NULL, 0),
(98, 31, 1, NULL, 0),
(99, 54, 1, NULL, 0),
(100, 31, 1, NULL, 0),
(101, 31, 1, NULL, 0),
(102, 31, 1, NULL, 0),
(103, 31, 9, NULL, 0),
(104, 31, 1, NULL, 0),
(105, 31, 2, NULL, 1),
(106, 31, 12, NULL, 3),
(107, 31, 1, NULL, 3),
(108, 31, 1, NULL, 0),
(109, 31, 1, NULL, 3),
(110, 31, 1, NULL, 3),
(111, 31, 1, NULL, 3),
(112, 31, 1, NULL, 3),
(113, 54, 1, NULL, 0),
(114, 54, 1, NULL, 3),
(115, 31, 2, NULL, 1),
(116, 31, 1, NULL, 0),
(117, 31, 12, NULL, 0),
(118, 31, 14, NULL, 0),
(119, 31, 12, NULL, 3),
(120, 54, 1, NULL, 0),
(121, 54, 2, NULL, 1),
(122, 54, 12, NULL, 3),
(123, 54, 1, NULL, 3),
(124, 54, 2, NULL, 1),
(125, 54, 1, NULL, 0),
(126, 54, 1, NULL, 0),
(127, 54, 2, NULL, 1),
(128, 54, 2, NULL, 1),
(129, 54, 1, NULL, 0),
(130, 54, 1, NULL, 0),
(131, 54, 1, NULL, 0),
(132, 54, 2, NULL, 1),
(133, 54, 2, NULL, 1),
(134, 31, 1, NULL, 0),
(135, 31, 1, NULL, 0),
(136, 54, 1, NULL, 0),
(137, 54, 1, NULL, 3),
(138, 54, 12, NULL, 3),
(139, 54, 12, NULL, 3),
(140, 54, 1, NULL, 0),
(141, 54, 1, NULL, 0),
(142, 37, 2, NULL, 1),
(143, 37, 2, NULL, 1),
(144, 37, 2, NULL, 1),
(145, 37, 1, NULL, 3),
(146, 37, 2, NULL, 1),
(147, 37, 1, NULL, 0),
(148, 37, 1, NULL, 3),
(149, 37, 1, NULL, 3),
(150, 37, 12, NULL, 3),
(151, 37, 12, NULL, 3),
(152, 37, 2, NULL, 1),
(153, 54, 1, NULL, 0),
(154, 37, 1, NULL, 0),
(155, 54, 1, NULL, 0),
(156, 54, 2, NULL, 3),
(157, 54, 2, NULL, 3),
(158, 54, 1, NULL, 0),
(159, 54, 1, NULL, 0),
(160, 54, 1, NULL, 3),
(161, 31, 1, NULL, 0),
(162, 54, 1, NULL, 0),
(163, 54, 1, NULL, 0),
(164, 54, 1, NULL, 0),
(165, 54, 2, NULL, 1),
(166, 54, 1, NULL, 0),
(167, 31, 1, NULL, 0),
(168, 54, 2, NULL, 3),
(169, 54, 2, NULL, 3),
(170, 54, 1, NULL, 0),
(171, 31, 1, NULL, 0),
(172, 54, 1, NULL, 0),
(173, 31, 1, NULL, 0),
(174, 31, 1, NULL, 0),
(175, 31, 1, NULL, 0),
(176, 31, 1, NULL, 0),
(177, 31, 1, NULL, 0),
(178, 31, 1, NULL, 0),
(179, 31, 1, NULL, 0),
(180, 31, 1, NULL, 0),
(181, 31, 1, NULL, 0),
(182, 31, 1, NULL, 0),
(183, 91, 1, NULL, 0),
(184, 54, 1, NULL, 3),
(185, 57, 1, NULL, 0),
(186, 54, 1, NULL, 0),
(187, 54, 1, NULL, 0),
(188, 54, 1, NULL, 0),
(189, 54, 2, NULL, 1),
(190, 91, 1, NULL, 0),
(191, 91, 1, NULL, 0),
(192, 91, 1, NULL, 0),
(193, 91, 1, NULL, 0),
(194, 91, 2, NULL, 1),
(195, 91, 1, NULL, 0),
(196, 91, 1, NULL, 0),
(197, 91, 1, NULL, 0),
(198, 91, 1, NULL, 0),
(199, 91, 1, NULL, 0),
(200, 91, 1, NULL, 0),
(201, 54, 1, NULL, 0),
(202, 54, 1, NULL, 3),
(203, 54, 1, NULL, 3),
(204, 54, 12, NULL, 3),
(205, 54, 1, NULL, 0),
(206, 54, 12, NULL, 3),
(207, 54, 1, NULL, 0),
(208, 54, 1, NULL, 0),
(209, 54, 12, NULL, 3),
(210, 54, 12, NULL, 3),
(211, 54, 12, NULL, 3),
(212, 31, 2, NULL, 0),
(213, 31, 1, NULL, 0),
(214, 91, 12, NULL, 3),
(215, 91, 12, NULL, 3),
(216, 91, 1, NULL, 0),
(217, 31, 1, NULL, 0),
(218, 31, 1, NULL, 0),
(219, 31, 1, 2, 0),
(220, 31, 1, 0, 0),
(221, 91, 1, NULL, 0),
(222, 91, 1, 2, 0),
(223, 91, 1, 1, 0),
(224, 91, 1, 2, 0),
(225, 91, 2, 1, 1),
(226, 91, 2, 1, 1),
(227, 91, 2, 2, 1),
(228, 91, 1, 1, 0),
(229, 91, 2, 2, 1),
(230, 91, 1, 2, 0),
(231, 91, 1, 2, 0),
(232, 91, 2, 1, 1),
(233, 91, 1, 1, 0),
(234, 91, 1, 1, 0),
(235, 91, 2, 1, 1),
(236, 91, 2, 1, 1),
(237, 91, 2, 2, 1),
(238, 91, 2, 1, 1),
(239, 54, 2, NULL, 1),
(240, 54, 12, NULL, 3),
(241, 91, 2, 1, 1),
(242, 91, 1, 1, 0),
(243, 91, 1, 1, 0),
(244, 91, 1, 1, 0),
(245, 54, 1, 1, 0),
(246, 54, 2, 1, 1),
(247, 54, 1, 2, 0),
(248, 54, 1, 1, 0),
(249, 91, 1, 2, 0),
(250, 54, 1, 2, 0),
(251, 54, 1, 1, 0),
(252, 91, 1, 2, 0),
(253, 54, 1, 2, 0),
(254, 54, 2, 2, 1),
(255, 54, 1, 2, 0),
(256, 54, 1, 2, 0),
(257, 54, 2, 1, 1),
(258, 54, 1, 2, 0),
(259, 54, 1, 1, 0),
(260, 54, 1, 1, 0),
(261, 54, 2, 1, 1),
(262, 54, 1, 2, 0),
(263, 54, 2, 1, 1),
(264, 54, 1, 1, 0),
(265, 54, 2, 1, 1),
(266, 54, 2, 1, 1),
(267, 54, 1, 1, 0),
(268, 54, 1, 1, 0),
(269, 54, 2, 1, 1),
(270, 54, 2, 1, 1),
(271, 54, 1, 2, 0),
(272, 54, 2, 1, 1),
(273, 54, 1, 1, 0),
(274, 54, 1, 1, 0),
(275, 54, 2, 2, 1),
(276, 54, 1, 1, 0),
(277, 31, 1, NULL, 0),
(278, 31, 1, NULL, 0),
(279, 31, 1, NULL, 0),
(280, 31, 1, NULL, 0),
(281, 31, 1, NULL, 0),
(282, 54, 1, 2, 0),
(283, 54, 1, 1, 0),
(284, 54, 1, 2, 0),
(285, 54, 1, 2, 0),
(286, 54, 1, 2, 0),
(289, 54, 1, 2, 0),
(290, 31, 1, NULL, 0),
(291, 54, 1, 2, 0),
(292, 54, 1, 2, 0),
(293, 54, 1, 2, 0),
(294, 54, 1, 2, 0),
(295, 54, 1, 2, 0),
(296, 54, 1, 2, 0),
(297, 54, 2, 2, 1),
(298, 54, 1, 2, 0),
(299, 54, 1, 2, 0),
(300, 54, 1, 2, 0),
(301, 54, 1, 2, 0),
(302, 54, 1, 2, 0),
(303, 54, 1, 2, 0),
(304, 54, 1, 2, 0),
(305, 54, 2, 1, 1),
(306, 54, 2, 2, 1),
(307, 54, 2, 2, 1),
(308, 54, 1, 1, 0),
(309, 54, 1, 2, 0),
(310, 54, 2, 2, 1),
(311, 54, 2, 1, 1),
(312, 54, 1, 2, 0),
(313, 54, 1, 2, 0),
(314, 54, 2, 2, 1),
(315, 54, 2, 2, 1),
(316, 54, 1, 2, 0),
(317, 54, 2, 2, 1),
(318, 54, 2, 2, 1),
(319, 54, 1, 2, 0),
(320, 54, 2, 1, 1),
(321, 54, 2, 2, 1),
(322, 54, 2, 2, 1),
(323, 54, 2, 2, 1),
(324, 54, 2, 1, 1),
(325, 54, 2, 1, 1),
(326, 54, 2, 2, 1),
(327, 54, 1, 2, 0),
(328, 54, 2, 2, 1),
(329, 54, 1, 2, 0),
(330, 54, 1, 1, 0),
(331, 54, 2, 1, 1),
(332, 54, 2, 2, 1),
(333, 54, 1, 2, 0),
(334, 54, 2, 1, 1),
(335, 54, 2, 2, 1),
(336, 54, 1, 2, 0),
(337, 54, 1, 2, 0),
(338, 54, 1, 1, 0),
(339, 54, 1, 2, 0),
(340, 54, 1, 2, 0),
(341, 54, 1, 1, 0),
(342, 54, 2, 2, 1),
(343, 54, 1, 1, 0),
(344, 54, 2, 1, 1),
(345, 54, 1, 1, 0),
(346, 54, 2, 2, 1),
(347, 54, 2, 2, 1),
(348, 103, 1, 2, 0),
(351, 31, 2, NULL, 0),
(352, 103, 1, 1, 0),
(353, 103, 2, 1, 1),
(354, 103, 1, 2, 0),
(355, 103, 2, 2, 1),
(356, 37, 1, 2, 0),
(357, 37, 2, 2, 1),
(358, 37, 1, 2, 0),
(359, 103, 2, 2, 1),
(360, 103, 1, 2, 0),
(361, 103, 1, 1, 0),
(362, 103, 2, 1, 1),
(363, 103, 1, 2, 0),
(364, 103, 2, 1, 1),
(365, 103, 1, 2, 0),
(366, 103, 2, 2, 1),
(367, 54, 1, 2, 0),
(368, 54, 1, 2, 0),
(369, 54, 1, 2, 0),
(370, 54, 2, 1, 1),
(371, 54, 1, 1, 0),
(372, 54, 2, 1, 1),
(373, 54, 1, 2, 0),
(374, 54, 1, 1, 0),
(375, 54, 2, 1, 1),
(376, 54, 1, 1, 0),
(377, 54, 1, 1, 0),
(378, 54, 1, 2, 0),
(379, 54, 1, 2, 0),
(380, 54, 1, 2, 0),
(381, 54, 2, 1, 1),
(382, 54, 1, 1, 0),
(383, 54, 2, 1, 1),
(384, 54, 2, 1, 1),
(385, 91, 1, 1, 0),
(386, 91, 1, 1, 0),
(387, 54, 1, 1, 0),
(388, 91, 1, 2, 0),
(389, 91, 1, 2, 0),
(390, 91, 1, 1, 0),
(391, 91, 1, 2, 0),
(392, 91, 1, 2, 0),
(393, 91, 1, 2, 0),
(394, 91, 1, 2, 0),
(395, 91, 1, 2, 0),
(396, 91, 1, 2, 0),
(397, 91, 1, 1, 0),
(398, 91, 1, 2, 0),
(399, 91, 1, 1, 0),
(400, 91, 1, 2, 0),
(401, 96, 1, 2, 0),
(402, 91, 1, 1, 0),
(403, 54, 1, 2, 0),
(404, 91, 1, 2, 0),
(405, 91, 1, 2, 0),
(406, 91, 1, 2, 0),
(407, 91, 1, 1, 0),
(408, 91, 1, 2, 0),
(409, 91, 1, 1, 0),
(410, 91, 1, 2, 0),
(411, 91, 1, 2, 0),
(412, 91, 2, 1, 1),
(413, 91, 1, 2, 0),
(414, 54, 2, 1, 1),
(415, 54, 2, 1, 1),
(416, 54, 2, 1, 1),
(417, 54, 1, 1, 0),
(418, 54, 2, 1, 1),
(419, 54, 2, 1, 1),
(420, 54, 1, 1, 0),
(421, 57, 1, NULL, 0),
(422, 57, 1, NULL, 0),
(423, 57, 1, NULL, 0),
(424, 54, 1, 2, 0),
(425, 54, 2, 2, 1),
(426, 54, 1, 2, 0),
(427, 54, 1, 1, 0),
(428, 54, 2, 1, 1),
(429, 54, 2, 1, 1),
(430, 54, 2, 1, 1),
(431, 91, 1, 1, 0),
(432, 91, 1, 2, 0),
(433, 31, 2, 0, 0),
(434, 31, 2, 0, 0),
(435, 54, 1, 2, 0),
(436, 54, 1, 1, 0);

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
(24, 30, 1, 3, 3, 3, 3, 3, 3),
(25, 30, 2, 3, 3, 3, 3, 3, 3),
(26, 30, 8, 3, 3, 3, 3, 3, 3),
(27, 30, 7, 3, 3, 3, 3, 3, 3),
(28, 30, 6, 3, 3, 3, 3, 3, 3),
(29, 31, 4, 3, 3, 3, 3, 3, 3),
(30, 31, 8, 3, 3, 3, 3, 3, 3),
(31, 31, 4, 3, 3, 3, 3, 3, 3),
(32, 33, 8, 3, 3, 3, 3, 3, 3),
(33, 33, 4, 3, 3, 3, 3, 3, 3),
(34, 33, 1, 3, 3, 3, 3, 3, 3),
(35, 33, 10, 3, 3, 3, 3, 3, 3),
(36, 33, 4, 3, 3, 3, 3, 3, 3),
(37, 33, 10, 3, 3, 3, 3, 3, 3),
(38, 33, 10, 3, 3, 3, 3, 3, 3),
(39, 33, 10, 3, 3, 3, 3, 3, 3),
(40, 54, 4, 3, 3, 3, 3, 3, 3),
(41, 54, 10, 3, 3, 3, 3, 3, 3),
(42, 46, 17, 3, 2, 4, 4, 3, 3),
(43, 46, 17, 2, 1, 2, 4, 3, 3),
(44, 46, 17, 4, 4, 4, 4, 5, 5),
(45, 46, 17, 4, 5, 5, 5, 3, 3),
(46, 54, 17, 1, 1, 1, 1, 1, 1),
(47, 31, 1, 5, 5, 5, 5, 5, 5),
(48, 91, 1, 4, 4, 4, 5, 5, 3),
(49, 91, 17, 3, 3, 3, 3, 3, 3),
(50, 91, 12, 3, 3, 3, 3, 3, 3),
(51, 101, 1, 5, 5, 5, 5, 5, 5),
(52, 37, 2, 5, 5, 5, 5, 5, 5),
(53, 37, 1, 4, 5, 4, 2, 5, 2),
(54, 37, 12, 4, 4, 2, 5, 4, 3),
(55, 54, 2, 3, 4, 4, 2, 4, 3),
(56, 57, 1, 1, 1, 1, 1, 1, 1),
(57, 54, 2, 4, 4, 2, 4, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`, `status`) VALUES
(1, 'Dist_123', 1),
(2, 'Dist_2', 1),
(3, 'Dist_3', 1);

-- --------------------------------------------------------

--
-- Table structure for table `regions_coordinates`
--

CREATE TABLE `regions_coordinates` (
  `id` int(11) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `lat` varchar(255) CHARACTER SET latin1 NOT NULL,
  `lng` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `regions_coordinates`
--

INSERT INTO `regions_coordinates` (`id`, `region_id`, `lat`, `lng`) VALUES
(1, NULL, '', ''),
(2, NULL, '', ''),
(3, NULL, '', ''),
(4, NULL, '', ''),
(5, 2, '33.8816269', '35.52505689999998'),
(6, 2, '33.88894', '35.50536599999998'),
(7, 2, '33.88710532557189', '35.49465550793457'),
(8, 2, '33.883133', '35.48446000000001'),
(9, 2, '33.880384783154085', '35.505015942065484'),
(10, 3, '33.88412081911569', '35.50111013791502'),
(11, 3, '33.89143370533573', '35.48141923791502'),
(12, 3, '33.892449005525734', '35.46916379345703'),
(13, 3, '33.885626875092', '35.46051323791505'),
(14, NULL, '', ''),
(15, NULL, '', ''),
(16, NULL, '', ''),
(17, NULL, '', ''),
(18, NULL, '', ''),
(19, NULL, '', ''),
(20, NULL, '', ''),
(21, NULL, '', ''),
(22, NULL, '', ''),
(23, NULL, '', ''),
(24, 1, '33.90139811340439', '35.48845011136473'),
(25, 1, '33.90322438165048', '35.48017469293211'),
(26, 1, '33.90001867246711', '35.469954613647474'),
(27, 1, '33.89204583320958', '35.468763458932536'),
(28, 1, '33.885426060642146', '35.47649869581915'),
(29, 1, '33.89782960034951', '35.48522098562317');

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
(1, 'Cafe Em Nazih', 23, 'Logo_1569932559_1320868044.jpg', '9611745442', 'Cafe', 'Saifi Urban Gardens, Pasteur Street', '33.896025', '35.516406', 1, '3.5714285714286', 32),
(2, 'Abo Waseem', 23, 'Logo_1569932569_1241077901.jpg', '9611745442', 'Resto-Cafe', 'Main Street, Hamra', '33.896189', '35.477883', 1, '3.75', 32),
(3, 'Toot Beirut', 23, 'Logo_1569932577_1638295637.jpg', '9611756166', 'Restaurant', 'Makdessi Street, Facing Liban Post', '33.896447', '35.482184', 1, '0', NULL),
(4, 'Barjees Cafe', 23, 'Logo_1569932588_1476692797.jpg', '9611745356', 'Cafe', 'Main Street, Hamra', '33.896320', '35.477650', 1, '0', NULL),
(5, 'Dar Al Sultani', 23, 'Logo_1569932610_1500670266.jpg', '9611741466', 'Restaurant', 'Sadat Street', '33.896430', '35.477017', 1, '0', 32),
(6, 'Fawzi Burj Al Hamam ', 23, 'Logo_1569932623_526565905.jpg', '9611741910', 'Restaurant', 'Golden Tulip Seranada Hotel, Abdel Aziz Street', '33.896328', '35.483972', 1, '0', NULL),
(7, 'Bliss Hall', 23, 'Logo_1569932633_1178099924.jpg', '9611362232', 'Cafe', 'Bliss Street, Near Bank Audi', '33.898656', '35.477467', 1, '0', NULL),
(8, 'Work Lounge', 23, 'Logo_1569932644_1813063138.jpg', '9611742428', 'Resto-Cafe', 'Badr Plaza, Leon Street, Next to the Lebanese American University', '33.894041', '35.478446', 1, '0', NULL),
(9, 'Abu Naim', 23, 'Logo_1569932651_345754676.jpg', '9611750480', 'Restaurant', 'Picadelly Street', '33.895294', '35.483217', 1, '0', NULL),
(10, 'Duke Eatery & Cafe', 24, 'Logo_1569932668_1705152190.jpg', '9611745442747', 'Cafe', 'Main Street', '33.895419', '35.484382', 1, '0', NULL),
(11, 'Al Nard', 24, 'Logo_1569932713_1126625444.jpg', '9611746067', 'Cafe', 'Gems Aparthotel, Makdessi Street', '33.896832', '35.478723', 1, '0', NULL),
(12, 'Good 2 Go', 24, 'Logo_1569932727_1817381857.jpg', '9611355883', 'Cafe', 'Makdessi Street, Next to GS', '33.896021', '35.485053', 1, '3.5', NULL),
(13, 'Afandina', 24, 'Logo_1569932735_451691935.jpg', '9611351510', 'Restaurant', 'Makdesi Street, Liban Post Building', '33.881608', '35.496292', 1, '0', NULL),
(14, 'Kaza Meza', 23, 'Logo_1569932748_590022535.jpg', '9611348016', 'Resto-Caf', 'Mahatma Ghandi Street', '33.898285', '35.478734', 1, '0', NULL),
(15, 'Wimpy', 23, 'Logo_1569932755_2011446988.jpg', '9611345641', 'cafe', 'Picadelly Street', '33.895280', '35.483274', 1, '0', NULL),
(16, 'Lavender Cafe', 23, 'Logo_1569932763_250838888.jpg', '9611751251', 'Cafe', 'Baalbak Street', '33.895122', '35.480656', 1, '0', NULL),
(17, 'Hashtag Resto Cafe', 23, 'Logo_1569932776_1470398627.jpg', '9611745442', 'Resto-Cafe', 'Yamout Street', '33.897402', '35.478095', 1, '2.8333333333333', NULL),
(18, 'El Denye Hek', 31, 'Logo_1569932793_236142029.jpg', '9611567191', 'Restaurant', 'Armenia Street', '33.896925', '35.525611', 1, '0', NULL),
(19, 'El Brimo', 31, 'Logo_1569932802_473601840.jpg', '9611444199', 'cafe', 'Geitawi', '33.894107', '35.529946', 1, '0', NULL),
(20, 'Caf Badaro', 31, 'Logo_1569932813_208496841.jpg', '9611380693', 'Cafe', 'Main Street, Near Bank Audi', '33.872769', '35.515837', 1, '0', NULL),
(21, 'Alturki', 23, 'Logo_1569932833_1460047395.jpg', '9611302702', 'Restaurant', 'Main Street, Facing Abdel Naser Mosque', '33.878730', '35.499654', 1, '0', NULL),
(22, 'Alturki', 30, 'Logo_1569932841_749480922.jpg', '9611558532', 'Restaurant', 'Sayid Hadi Highway, Msharrafiyeh', '33.858113', '35.512272', 1, '0', NULL),
(23, 'Alturki', 30, 'Logo_1569932856_665822247.jpg', '9617730693', 'Restaurant', 'Highway, Near Bank Audi, Saida', '33.560220', '35.379585', 1, '0', NULL),
(24, 'Ator12', 23, 'Logo_1581090422_1255317095.jpg', '990999099', 'cafe', '5 Nikoghayos Adonts St, Yerevan 0014, Armenia', '40.1857118209043', '40.1857118209043', 1, '0', 32),
(25, 'Lebanon Shaurma', 23, 'Logo_1582642875_938556821.jpg', '990999099', 'cafe', '5 Nikoghayos Adonts St, Yerevan 0014, Armenia', '40.177711693025564', '40.1857118209043', 1, '0', 32);

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
-- Table structure for table `restaurant_click`
--

CREATE TABLE `restaurant_click` (
  `id` int(255) NOT NULL,
  `restaurant_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `type` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant_click`
--

INSERT INTO `restaurant_click` (`id`, `restaurant_id`, `user_id`, `type`) VALUES
(1, 1, 54, 0),
(2, 1, 54, 0),
(3, 1, 54, 0),
(4, 1, 54, 1),
(5, 1, 54, 1),
(6, 1, 54, 2),
(7, 1, 54, 2),
(8, 1, 54, 2),
(9, 1, 54, 3),
(10, 1, 54, 3),
(11, 1, 31, 0),
(12, 1, 31, 0),
(13, 1, 31, 1),
(14, 1, 31, 0),
(15, 1, 31, 1),
(16, 1, 31, 2),
(17, 1, 31, 3),
(18, 9, 31, 2),
(19, 9, 31, 2),
(20, 1, 31, 0),
(21, 1, 31, 0),
(22, 2, 31, 0),
(23, 12, 31, 0),
(24, 1, 31, 0),
(25, 1, 31, 0),
(26, 1, 31, 1),
(27, 1, 31, 2),
(28, 1, 31, 2),
(29, 1, 54, 3),
(30, 1, 54, 3),
(31, 1, 54, 0),
(32, 1, 31, 2),
(33, 14, 31, 1),
(34, 1, 54, 0),
(35, 1, 54, 1),
(36, 1, 54, 2),
(37, 1, 54, 1),
(38, 1, 54, 2),
(39, 12, 54, 2),
(40, 1, 54, 2),
(41, 1, 54, 1),
(42, 1, 54, 0),
(43, 1, 54, 2),
(44, 1, 54, 0),
(45, 1, 54, 3),
(46, 12, 54, 1),
(47, 12, 54, 1),
(48, 2, 37, 0),
(49, 2, 37, 1),
(50, 2, 37, 2),
(51, 2, 37, 3),
(52, 2, 37, 2),
(53, 1, 37, 0),
(54, 1, 37, 2),
(55, 1, 37, 1),
(56, 1, 37, 0),
(57, 1, 37, 2),
(58, 12, 54, 1),
(59, 2, 54, 3),
(60, 1, 31, 0),
(61, 1, 54, 2),
(62, 1, 54, 1),
(63, 1, 31, 1),
(64, 1, 54, 1),
(65, 1, 54, 1),
(66, 1, 31, 0),
(67, 1, 31, 1),
(68, 1, 31, 2),
(69, 1, 31, 1),
(70, 1, 31, 1),
(71, 1, 31, 1),
(72, 1, 31, 1),
(73, 1, 31, 1),
(74, 1, 31, 1),
(75, 1, 54, 2),
(76, 1, 54, 2),
(77, 1, 54, 1),
(78, 1, 54, 2),
(79, 1, 54, 2),
(80, 2, 54, 2),
(81, 12, 91, 2),
(82, 12, 54, 1),
(83, 12, 54, 2),
(84, 3, 37, 0),
(85, 3, 37, 1),
(86, 1, 37, 2),
(87, 2, 37, 2),
(88, 2, 37, 0),
(89, 1, 37, 1),
(90, 1, 37, 2),
(91, 1, 37, 0),
(92, 3, 103, 3),
(93, 1, 54, 3),
(94, 2, 54, 2),
(95, 1, 91, 3),
(96, 12, 91, 1),
(97, 12, 91, 2),
(98, 12, 91, 0),
(99, 1, 54, 3),
(100, 1, 96, 2),
(101, 1, 96, 0),
(102, 10, 54, 2),
(103, 10, 54, 1),
(104, 12, 54, 2),
(105, 1, 54, 2),
(106, 2, 54, 2);

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
-- Table structure for table `res_plans`
--

CREATE TABLE `res_plans` (
  `id` int(255) NOT NULL,
  `restaurant_id` int(255) NOT NULL,
  `plan` int(255) NOT NULL,
  `start_date` date NOT NULL,
  `finish_date` date DEFAULT NULL,
  `status` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `res_plans`
--

INSERT INTO `res_plans` (`id`, `restaurant_id`, `plan`, `start_date`, `finish_date`, `status`) VALUES
(1, 28, 2, '2020-02-09', '2020-07-31', 0),
(3, 28, 3, '2020-02-17', '2020-02-17', 0),
(6, 28, 4, '2020-02-18', '2020-02-29', 0),
(9, 28, 1, '2020-02-10', '2020-03-16', 1),
(10, 30, 1, '2020-02-06', '2020-02-06', 1),
(11, 1, 2, '2020-02-18', '2020-02-20', 0),
(12, 1, 4, '2020-02-17', '2020-03-18', 0),
(13, 31, 1, '2020-02-07', NULL, 1),
(14, 1, 3, '2020-02-17', '2020-03-27', 0),
(15, 1, 2, '2020-02-12', '2020-03-23', 0),
(18, 1, 2, '2020-03-11', '2020-03-28', 0),
(19, 1, 1, '2020-03-29', '2020-04-30', 0),
(20, 1, 1, '2020-05-03', NULL, 0),
(21, 1, 1, '2020-02-13', NULL, 0),
(22, 3, 2, '2020-02-14', '2020-03-10', 0),
(23, 3, 1, '2020-03-11', NULL, 1),
(24, 1, 1, '2020-02-08', NULL, 0),
(25, 1, 4, '2020-02-08', '2020-02-15', 0),
(26, 6, 2, '2020-02-08', '2020-02-15', 1),
(28, 1, 4, '2020-03-01', '2020-03-03', 0),
(29, 1, 1, '2020-03-04', NULL, 0),
(30, 1, 1, '2020-02-08', NULL, 0),
(31, 2, 3, '2020-02-09', '2020-02-15', 0),
(32, 2, 1, '2020-02-16', NULL, 1),
(33, 24, 3, '2020-02-08', '2020-03-20', 0),
(34, 24, 4, '2020-03-21', '2020-04-20', 1),
(35, 1, 3, '2020-02-15', '2020-02-29', 1),
(36, 25, 2, '2020-02-10', '2020-03-28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `review` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `restaurant_id`, `review`, `created_at`) VALUES
(18, 30, 6, 'aasdasdasdasdasd', '2020-02-04 10:19:20'),
(19, 30, 8, 'asdasd', '2020-02-04 10:19:20'),
(20, 30, 8, 'asdasdasd', '2020-02-04 10:19:20'),
(22, 30, 5, '85858587848748dscas', '2020-02-04 10:19:20'),
(23, 30, 5, 'asdasdasdas', '2020-02-04 10:19:20'),
(24, 30, 8, 'asdasdasdasdasd', '2020-02-04 10:19:20'),
(25, 46, 17, 'U', '2020-02-04 10:19:20'),
(26, 46, 17, 'Vsbsj', '2020-02-04 10:19:20'),
(27, 39, 1, 'xesdrgtu', '2020-02-04 10:19:20'),
(28, 39, 1, 'Thanks', '2020-02-04 10:19:20'),
(29, 91, 17, 'Hi', '2020-02-04 10:19:20'),
(30, 91, 1, 'Hello', '2020-02-04 10:19:20'),
(31, 39, 1, 'Thanks', '2020-02-04 10:19:20'),
(32, 38, 1, 'Thanks', '2020-02-04 10:19:20'),
(33, 38, 1, 'Thanks', '2020-02-04 10:19:20'),
(34, 38, 4, 'Thanks', '2020-02-04 10:19:20'),
(35, 38, 12, 'Thanks', '2020-02-04 10:19:20'),
(36, 38, 12, '25', '2020-02-04 10:19:20'),
(37, 101, 1, 'vdv', '2020-02-06 10:46:24'),
(38, 37, 2, 'Good service', '2020-02-22 11:51:30'),
(39, 37, 1, 'Avg', '2020-02-22 11:54:42'),
(40, 37, 12, 'Good', '2020-02-22 11:58:30'),
(41, 54, 2, 'Good ', '2020-02-24 10:21:56'),
(42, 57, 1, 'review11111', '2020-03-05 15:23:03'),
(43, 54, 2, 'New review', '2020-03-06 09:59:35');

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
  `restaurant_id` int(255) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `client_id` int(255) DEFAULT NULL,
  `area_id` int(255) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `restaurant_id`, `region_id`, `client_id`, `area_id`, `image`, `link`, `start`, `end`, `status`) VALUES
(66, 2, 1, 32, 24, 'Slider_1576670963_756685785.jpg', 'aimtech.am', '2020-02-10', '2020-02-25', 1),
(67, 3, NULL, 32, 23, 'Slider_1576670988_616823962.jpg', NULL, '2020-02-13', '2020-02-22', 1),
(68, NULL, NULL, 32, 27, 'Slider_1576671090_1545236810.jpg', 'http://aimtech.am', '2020-02-16', '2020-02-27', 1),
(69, 5, 1, 32, 23, 'Slider_1582210217_832769592.jpg', 'animevost.com', '2020-02-20', '2020-02-29', 1),
(70, 4, 1, 32, 24, 'Slider_1582213351_1714732382.jpg', 'animevost.com', '2020-12-12', '2020-12-20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `time` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `os` int(1) DEFAULT NULL,
  `fcm_token` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `time`, `user_id`, `refresh_token`, `os`, `fcm_token`) VALUES
(128, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOTcyODEzNjI5YzQi.v0OvU7S_vlRzVOCo93GlbYXeZpShmwMBiMl3A7loPM8', '1570273683', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOTcyODEzNjI5ZGMi.Ba8Nl0aZBs1I5VRmPtBEifmtWKiy8EMp0J2GLjaS_LI', NULL, NULL),
(129, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOWFkNzhkMjQxODki.2CC9SzEhCJuzlA-k7WA0T5-lT71xLCpI_eGymtdqbmM', '1570515213', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOWFkNzhkMjQ2NzMi.-_DFnJn6fy1_8-8Wm0_pR_oOi4L9uS-w2qrba7m77PI', NULL, NULL),
(130, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOWRhODY1MDFlODMi.ggIHthPkfiCmcUbZ-65eiGYJGSpkY48V1kv-YKrnxKk', '1570699749', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOWRhODY1MDIyZjQi.-MZfm5qewtvkScA5Ytq-t6XAiRyzxp7wypaFpnI1uEc', NULL, NULL),
(131, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOWVjYmU4MzI0OTEi.LtVv29C8A_pC9z2kRvdtRs5Rb9W6ly8Hw5YMtVZA9fU', '1570774376', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkOWVjYmU4MzI0YzEi._9P39163EdCh2ENW2wbl4DzBRUxAqBcNK-SEBjgW9uU', NULL, NULL),
(132, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYTk1ZmZmMzNjZGYi.33O-NKXEwKUjb7oMy2DPhacCbGvF9HN48u9UOplhJlA', '1571467647', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYTk1ZmZmMzNjZmYi.mRTpe5-GdNTJNu5oA-lEnU-x10vsC0firI3fYbHJJfg', NULL, NULL),
(133, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYWVmNDI0ZTc5NDci.SmuJDZqbV5bbEkurgqqHNvHT208H6iBajSf18BdjNR8', '1571833252', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYWVmNDI0ZTdkMDki.naPHmhVDJVqzvpLYyS0rnH_SAK18PildzrMIi3nnLFY', NULL, NULL),
(134, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYWYxMThjYjZhNzAi.AQ4DECMiSAtfRMmeHv-MbzuqTGRIZ5dpOPefNtJpdmA', '1571840780', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYWYxMThjYjZiYWUi._5NY4GYkwyxBykr9veRTds27FLTRZ5XldFXKs7vMnZA', NULL, NULL),
(135, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjA0ZWY5YWNhODgi.UHmrTdey-WjFeItruQTqrYsyXiWWGRYkKeO-xxPiKgQ', '1571922041', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjA0ZWY5YWQwZTUi.WT4AQfugAR8eqf_kshViIWGzHONoSIR5eugGzB32IzI', NULL, NULL),
(136, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjFiNTVlMGJkNGYi.tKVqBEy-mPrDi23kwn9E4x0lBFrnQMznQsJumsQ_EzE', '1572013790', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjFiNTVlMGJkZDUi.vUaeR3KC0i-pPRRfdrtFen7tUCin10JNiMrsl5OjYhY', NULL, NULL),
(137, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjFiNjJkMjI0OTQi.e-MUiVahINiYAEV6WDl_wJDEUwUaMcym51m2tQWrWmQ', '1572013997', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjFiNjJkMjI0YWUi.pBJH5DR0jtPZXVorFpGkJb2YEiNNG_SgmU1U9oDkvak', NULL, NULL),
(138, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjFiNmYyM2VhMDki.EJmm8HdmQOsmJICEfxkH2t8A9hNJd0ZfLfXgimBVNPY', '1572014194', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjFiNmYyM2VhMjEi.qMwsV-sJsu9J9PCoPIfb72BDsHumnDKjTms3rZA4pJE', NULL, NULL),
(139, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjJhZDlkMGI1Mzci.yhdXBchamvwOoauSQZXWmLWhZVyHb9tRjNYusr23bAE', '1572077341', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjJhZDlkMGI1NTki.stk3hGFuf2aWXpFirJ3nYbmJEOtrowhl-AMBUw6I4V4', NULL, NULL),
(140, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjJhZGIxMzNkY2Qi.HS9exxwo8MRog9W4BthnM7n_tzs0ZTONAYg8qIxzY2w', '1572077361', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjJhZGIxMzNkZTMi.qujcD8gswXXGHoRKo4Z0TN8SYJUpVwHuCICkzdEPt8g', NULL, NULL),
(141, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjJhZGJmNjM4ODgi.zX2cKD6uDHfeXt711TbD0FNZV_u-PloX3iOx2sbdBFQ', '1572077375', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjJhZGJmNjM4YTMi.CsgxGG17y_05RcFHOaMc4sFoCY7KJrAT9UlRGvDDsdk', NULL, NULL),
(142, '', '', 30, '', NULL, NULL),
(143, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjgyN2YxY2UyZDIi.iaBKVBRDJ6iC3DDLdmvPJEpZzmLTd8j8eldjpReVsP4', '1572436337', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjgyN2YxY2U2YmUi.kl_Kkt5RdgK-jbJSrq6ZmPpc5TpTEXyP1oXmwWN_Qy0', NULL, NULL),
(144, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjkzNmVmOTI1ZWUi.J4D-lg8zOIOuloeo3Um2_xLwwSetmNRKArhNa1DKOjY', '1572505711', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjkzNmVmOTJhZjIi.o9jtlvoVMojn1yx971mvTh3U3VEPQDcFpx9QXE7uTlA', NULL, NULL),
(145, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk2Y2E4MTlkNjQi.bGhEPoavGu1AMj9iOEwpQdvhxmnk9FnNzOTzq2mew3I', '1572519464', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk2Y2E4MTlkN2Ii.ilgKAo2WfvbGs4oq6y6r1xCMz7HS2XqLRB5X-1i-2V8', NULL, NULL),
(146, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3MDc3MTJiYzki.mk3EtIG79XpmZexbRuXjkPgTzRr3lkqMAofhqXNdSp0', '1572520439', 46, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3MDc3MTJjNWYi.QYDEm1uE5KYfj9mg9fI__5yVwpGQAXeY1t99fk_ycF4', NULL, NULL),
(147, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3MWUzMDliYjAi.gM2rJuS3HcuoG8J6LM2-20tKVHLPsXonmgSXkUOXyPM', '1572520803', 47, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3MWUzMDljNGEi.HEuKLG0OzAHfugqmQ-L5wG7G1ECb-ZMD6BsAj9paULo', NULL, NULL),
(148, '', '', 48, '', NULL, NULL),
(149, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3Mjk0ZWM2NWMi.qZIyPXbfobss11whs09dpZY356sEEIeMHQFK9nJrHRM', '1572520980', 49, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3Mjk0ZWM2Yzci.t9Dy7LMW18C7A_Ju85c4IlkXj27_a-sC9znAMMaoIL8', NULL, NULL),
(150, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3MmRhMTdmYTIi.WaP6FBn6TwF-W8PnmbZrICDPwecxq7BkWOBajSiuaSM', '1572521050', 50, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3MmRhMTgwMmMi.lZ9sUEuAVYFjYR-JNHINetgSOY2AtfkKWXcMzBWaJjk', NULL, NULL),
(151, '', '', 51, '', NULL, NULL),
(152, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3ODQyNTVlZmIi.3FaROodGKMn3Qi9xLXllpIq1LgB07htE6iK-bHEGDZ0', '1572522434', 52, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk3ODQyNTVmNzMi.Vf4av_TPQe9QRvSWoRtQdxmQ0LuXdW4FxKZpcCCLfNw', NULL, NULL),
(153, '', '', 53, '', NULL, NULL),
(154, '', '', 46, '', NULL, NULL),
(155, '', '', 46, '', NULL, NULL),
(156, '', '', 54, '', NULL, NULL),
(157, '', '', 54, '', NULL, NULL),
(158, '', '', 54, '', NULL, NULL),
(159, '', '', 54, '', NULL, NULL),
(160, '', '', 46, '', NULL, NULL),
(161, '', '', 46, '', NULL, NULL),
(162, '', '', 54, '', NULL, NULL),
(163, '', '', 54, '', NULL, NULL),
(164, '', '', 55, '', NULL, NULL),
(167, '', '', 54, '', NULL, NULL),
(169, '', '', 54, '', NULL, NULL),
(170, '', '', 31, '', NULL, NULL),
(171, '', '', 31, '', NULL, NULL),
(172, '', '', 31, '', NULL, NULL),
(173, '', '', 31, '', NULL, NULL),
(174, '', '', 31, '', NULL, NULL),
(175, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmM4ZDY0ZDM4Mzgi.tGTOsipLdVCPFjngKRqc5PJKAR6RjmYoRmLlkahWbuc', '1572724452', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmM4ZDY0ZDM5NTIi.FOypiAvNn9UnarxDx5dOhlpqHlSPLfCAFJO545sEPTE', NULL, NULL),
(176, '', '', 54, '', NULL, NULL),
(177, '', '', 54, '', NULL, NULL),
(178, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzAyNjJjNDgzOGUi.XKlP1o2biCy752UR-XyOczjKqBIGRPHt5qsKtDBxCGo', '1572960172', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzAyNjJjNDg0MTYi.Piks7845wo4m6-5kMpS0qOXlkclo0_gUgdstpuqUodg', NULL, NULL),
(179, '', '', 55, '', NULL, NULL),
(180, '', '', 31, '', NULL, NULL),
(181, '', '', 54, '', NULL, NULL),
(182, '', '', 54, '', NULL, NULL),
(183, '', '', 54, '', NULL, NULL),
(184, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZGQ1MzQ4OTI3MTki.dtcjFFeCqZZGHJagic5pRdLX-DIjW0NnkbmlQnl6upc', '1574872264', 57, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZGQ1MzQ4OTI3OWMi.eIicjpXqUwGcLFTisKQO-c1LQ44y4W9PqiHbA1RyZ_g', NULL, NULL),
(185, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2E2MjY5ODkyYmEi.WtJg4alsF4wWZKC2cdes2GiSevhc_0USuE6bg0L3HlM', '1573630953', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2E2MjY5ODkzM2Mi.BPto1wpLzy0PX-TE2Xpr6-ECnC9MDXg4KhQj36YxkHk', NULL, NULL),
(186, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZTUwYzlhMTMi.EdzvHIj0YLqw6fqMVcPBihJH0TA_Kp8DFVSORBSvqws', '1573744592', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZTUwYzlhODci.tP1ka1uBKz5Yt6FM9hQ6TD5ltG2kCfP_FlEg0q00Uik', NULL, NULL),
(187, '', '', 31, '', NULL, NULL),
(188, '', '', 31, '', NULL, NULL),
(189, '', '', 54, '', NULL, NULL),
(190, '', '', 54, '', NULL, NULL),
(191, '', '', 54, '', NULL, NULL),
(192, '', '', 54, '', NULL, NULL),
(193, '', '', 54, '', NULL, NULL),
(194, '', '', 54, '', NULL, NULL),
(195, '', '', 54, '', NULL, NULL),
(196, '', '', 54, '', NULL, NULL),
(198, '', '', 54, '', NULL, NULL),
(199, '', '', 54, '', NULL, NULL),
(201, '', '', 54, '', NULL, NULL),
(202, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDUwNzYwOWUzNDMi.4uoFDmR5RTnPf27gIs7VyTJp-KCAejfNVtUZdE06PUM', '1574328544', 52, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDUwNzYwOWUzYzci.tdT0AgRRjRl6upuwYL8AHAjgFt8FPlExorOzRcQPBJc', NULL, NULL),
(203, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDUyM2VjNWE1ODIi.abNkqZ6_0MPCD-MW3fWd3NXs42a4XiojbysYkl0CQOM', '1574335852', 52, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDUyM2VjNWE1ZjYi.yeip0RWoaKzcuWdTh14jY2RIIru_P97hh-oGW6eyOv0', NULL, NULL),
(204, '', '', 54, '', NULL, NULL),
(205, '', '', 54, '', NULL, NULL),
(206, '', '', 58, '', NULL, NULL),
(207, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDU0NzM1MmZjZDAi.SRCdKM94Pxl08KrHZwQnXgv-YzTIuhgJDJl7qa4WtRs', '1574344885', 58, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDU0NzM1MmZkNTQi.PJhP_wzmYvFr-tdnEr3UCMs_iTfP3NGnp2EEOEkCpUs', NULL, NULL),
(210, '', '', 54, '', NULL, NULL),
(211, '', '', 54, '', NULL, NULL),
(213, '', '', 54, '', NULL, NULL),
(214, '', '', 54, '', NULL, NULL),
(215, '', '', 54, '', NULL, NULL),
(223, '', '', 54, '', NULL, NULL),
(224, '', '', 54, '', NULL, NULL),
(225, '', '', 31, '', NULL, NULL),
(233, '', '', 54, '', NULL, NULL),
(241, '', '', 54, '', NULL, NULL),
(245, '', '', 54, '', NULL, NULL),
(246, '', '', 54, '', NULL, NULL),
(247, '', '', 31, '', NULL, NULL),
(248, '', '', 54, '', NULL, NULL),
(249, '', '', 54, '', NULL, NULL),
(250, '', '', 54, '', NULL, NULL),
(253, '', '', 91, '', NULL, NULL),
(254, '', '', 91, '', NULL, NULL),
(255, '', '', 91, '', NULL, NULL),
(256, '', '', 91, '', NULL, NULL),
(257, '', '', 91, '', NULL, NULL),
(258, '', '', 91, '', NULL, NULL),
(259, '', '', 91, '', NULL, NULL),
(260, '', '', 91, '', NULL, NULL),
(261, '', '', 91, '', NULL, NULL),
(262, '', '', 91, '', NULL, NULL),
(264, '', '', 31, '', NULL, NULL),
(265, '', '', 91, '', NULL, NULL),
(266, '', '', 91, '', NULL, NULL),
(267, '', '', 31, '', NULL, NULL),
(268, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTYzN2VhOTRkNGMi.L5-KIcqUBqJZjaclLkJnZxEY2MBfwN2sbvwBsYPred0', '1575455082', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTYzN2VhOTRmOTMi.94FmMTukDL0DIxKPLGxJHYYB4wB_XVR3lgshTQbGCf0', NULL, NULL),
(269, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTc1YmQzYjdjNWYi.VzYIOBL7hQ4J1xY65gt2iHb2Wr3fvEyjaG-EJz6wjvo', '1575529811', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTc1YmQzYjgwM2Qi.nohCuXLxaC8F4LtFWAf-LpUwIIA_3DAoRFADN5zVS-c', NULL, NULL),
(270, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTdhMmI4MzJlNGYi.r_540m9rBzH5uimWD9yBX_OuXQK10THvjHv_CKg6xhY', '1575547960', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTdhMmI4MzJlN2Ii.20X9iCAbdIJyp8jGJEQEYSYvjzXCW_tS8sPRrsI0Cvw', NULL, NULL),
(271, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZThjNzEwYWJhZmUi.Ih_hZiaee--7v-vaZm1Kk8ZRDtAKwNJiQDYm43x2GSc', '1575622800', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZThjNzEwYWJiNDQi.1YspfHHg6r5DtliasKfNaOThbnScXjGe9HFrGRxUyP8', NULL, NULL),
(272, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZThlOWVmMzRhZmQi.q90w3pCDmVa9m60a7Uq73Ce83DtFUWMJHbGEv2RDF0w', '1575631727', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZThlOWVmMzRiMjMi.zfgAXrtoFuDvdhwgyWe53OeJ7KM77UU5RDCCmwogd_k', NULL, NULL),
(273, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTkxM2Y4OTYwMWUi.giuaZe96_T0KzBruxayusEfYZshWRqMmhJkhGjGBb3g', '1575642488', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTkxM2Y4OTYwMzci.lXbMYfzalyNVpG8Sjph2IHGsYeDAUoRj_YmNyrWtFks', NULL, NULL),
(274, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZWEyOWE0YzIxM2Ui.sWhP2kGIdYxA2yh8IR_F7pqZsaJI8r4fpFREESeZsoM', '1575713572', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZWEyOWE0YzIxZDUi.nTrm57EYeD5VUCpdKh-mziRP72p0MPVarlqaSh7H5es', NULL, NULL),
(275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZWE1ZWM1NDZiZjUi.tQtD9OHI1YJrgCkOlcC_nskjsuqOCH0dFccASLAhiis', '1575727173', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZWE1ZWM1NDZjMmIi.mbEpem8eyphEj0ePDPIbjamQx2rnVl0gtsNJspByp6U', NULL, NULL),
(276, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZWUzMjQ0NDdmMWIi.9BSRLACyvV7btUgB7nmdiMSXtIj9EU1Krecy0gU5tW8', '1575977924', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZWUzMjQ0NDgwZDgi.n5QAu6m5CceAdtsXVy7anRJjtRzdLl4BY3LfCc5n-5w', NULL, NULL),
(277, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZjBiNjZkOTZlMzci.bFCzTQMQxflnb75twnT2fmG2yud7_aruQQbWp6Jl0Iw', '1576142829', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZjBiNjZkOTczYzQi.4Ct_VvVGlTbaXDlAMiTwScmipvxnka65PqztBFrpD-A', NULL, NULL),
(278, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZjM4YzkzZjQxYjYi.QeOU-LlIjvKuIDEpDqPXq5p9U5KZSQaCKiMhQnOd5Bs', '1576328724', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZjM4Yzk0MDAwZTIi.Lb_lbGbvC1vCiF8R9kEknJtz4BQwUDthmhsn8TP1RDI', NULL, NULL),
(279, '', '', 91, '', NULL, NULL),
(280, '', '', 91, '', NULL, NULL),
(281, '', '', 91, '', NULL, NULL),
(282, '', '', 91, '', NULL, NULL),
(283, '', '', 91, '', NULL, NULL),
(284, '', '', 91, '', NULL, NULL),
(285, '', '', 91, '', NULL, NULL),
(286, '', '', 91, '', NULL, NULL),
(287, '', '', 91, '', NULL, NULL),
(288, '', '', 91, '', NULL, NULL),
(289, '', '', 91, '', NULL, NULL),
(290, '', '', 91, '', NULL, NULL),
(291, '', '', 91, '', NULL, NULL),
(292, '', '', 91, '', NULL, NULL),
(295, '', '', 91, '', NULL, NULL),
(296, '', '', 96, '', NULL, NULL),
(297, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2E2ZTY5NjM4Y2Mi.HahZpxhZlfJ5dM0WzzYb6q4_wSWUmUD4NGE3s1u6DJ8', '1612423657', 97, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2E2ZTY5NjM5MjMi.lj3UwhoOfqfCk3kgAswsPosch37M5DnB1RQyFVBnkwU', 1, 'fv29IhrZw88:APA91bFge-VyYkyIqGXEZj5n6ITovMd7UDpvZVo6MiF2rG0E97ftlNFa7rSPX5FmL-o-S0aYQ4LXBd4i-3uo7FDfEfFTuP-bxFSe43RFfhN3vPxHyjV-UrJ6FC6XVwCfG86ziwjWpL5i'),
(298, '', '', 54, '', NULL, NULL),
(300, '', '', 98, '', NULL, NULL),
(301, '', '', 98, '', NULL, NULL),
(302, '', '', 98, '', NULL, NULL),
(303, '', '', 54, '', NULL, NULL),
(306, '', '', 54, '', NULL, NULL),
(307, '', '', 54, '', NULL, NULL),
(308, '', '', 54, '', NULL, NULL),
(309, '', '', 54, '', NULL, NULL),
(310, '', '', 54, '', NULL, NULL),
(311, '', '', 54, '', NULL, NULL),
(313, '', '', 54, '', NULL, NULL),
(315, '', '', 54, '', NULL, NULL),
(316, '', '', 96, '', NULL, NULL),
(317, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2FjYWZhMDdjOTQi.FV1zZyksdaDo-clWD0VFS69QHcvCo1IRG4f-uaIPeD4', '1612447354', 99, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2FjYWZhMDdjZTMi.MG49oQpmW9XSqVX0SAudgFQbV8BT7p34leqWsoQVGN4', 0, 'fidTfbPhJpI:APA91bESW_pQi-YBI7JuHaZP6yGs2DbOdYYqK-DZ55KJouRWMzECEMT4JmbFIl_Dj_NULQAePsBDowMza4x_5c_WqM7GhJ0yNNbcY6osOPJYhoyWT5uSnJ85LJKQF7uSEnNetIF1l41y'),
(318, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2FjYjlmZjFjOTki.gsfRWYG3wJTdXN-_7CnJwvxMjGYd-9dxF9l11p2Dwhs', '1612447519', 100, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2FjYjlmZjFjZWMi.cx_ep-TWT07hFRKGX0_HqlfZ-hluyoiBv7iPJ3HfZ8Q', 0, 'fidTfbPhJpI:APA91bESW_pQi-YBI7JuHaZP6yGs2DbOdYYqK-DZ55KJouRWMzECEMT4JmbFIl_Dj_NULQAePsBDowMza4x_5c_WqM7GhJ0yNNbcY6osOPJYhoyWT5uSnJ85LJKQF7uSEnNetIF1l41y'),
(320, '', '', 54, '', NULL, NULL),
(321, '', '', 31, '', NULL, NULL),
(322, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2JlZTJiN2QyNzYi.de1GBOZW84E5mBJf_20PMCgSu1CzwUGDwFnvBT6guvo', '1612521899', 101, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2JlZTJiN2QyYzUi.9vL5vFRTu63nYx5zW42EM3tFZgsnocwf-W2Z-SHwvdQ', 1, 'fv29IhrZw88:APA91bFge-VyYkyIqGXEZj5n6ITovMd7UDpvZVo6MiF2rG0E97ftlNFa7rSPX5FmL-o-S0aYQ4LXBd4i-3uo7FDfEfFTuP-bxFSe43RFfhN3vPxHyjV-UrJ6FC6XVwCfG86ziwjWpL5i'),
(323, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2M0ZGJmODFiZGYi.N9gVxKuvTaiDPz1rzl52YGb-3yAQMbd-TBvfZ-BR-p0', '1612546367', 57, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2M0ZGJmODFjMWEi.tG_GMRHintN8dHn7PH1CAhYIWpF65sy8iFLQAPcfUv8', NULL, NULL),
(324, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2M0ZjE5NjllMzgi.NhZOOf_Sc-Re2LvS670VjMpOQTJLR9TeLulDnpcHkFE', '1612546713', 57, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2M0ZjE5NjllN2Ui.36YoeLb1rt1fBnY2xQYmCYIvcuXydVTO2FET6GvF2JM', NULL, NULL),
(325, '', '', 31, '', NULL, NULL),
(326, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNDE4ZGU2OGYxZmIi.m48eEO1acwIentrykrWoB8hY2XcTYADt1vSbgXhU1c8', '1612890470', 57, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNDE4ZGU2OGYyNTIi.Y90HAudQkK3Zl4XFJnUSgWVz20eQIpi3izqgGbEUUWY', 1, 'dvXWuXJicVU:APA91bFhsKrY5q9Qv7RI7698vJUTVNoWTH24N22dfcFqCJL4_E7coLnBuuS0NVSj2xye7op5p2lUw6SquuHQgddTD_qUx_dI5WWKriIJJsRzbf3zMIB68w4iq8QtIJGfW0UjToXPSNlk'),
(327, '', '', 31, '', NULL, NULL),
(330, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2QxN2I0NzhlY2Mi.-tGhuGX5X4eJT1zWrURarpKUaUwDCGVQyuNj9E3dUs8', '1581148468', 103, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlM2QxN2I0NzhlZjMi.3d2Ex8v-W66dL_xQSG3QxX7OnIWw58LYwSoALo2o0Ro', 0, 'cEP_h8hdoS8:APA91bHCBbnO5KE13pAVxdBhoLMK06Y6s_Ctm82xRcYehT_6ZS7hbere6fs8nuh4yNsBwQsx0EWr-yk04h0NJeo86AsbcH5uaNt5FwGV60Zh7p-tme6LHrIMH5imW8si9FVTl9zy7Oyf'),
(331, '', '', 54, '', NULL, NULL),
(332, '', '', 31, '', NULL, NULL),
(333, '', '', 31, '', NULL, NULL),
(334, '', '', 31, '', NULL, NULL),
(335, '', '', 31, '', NULL, NULL),
(336, '', '', 31, '', NULL, NULL),
(337, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNDE0NzVmNWE1ZGYi.9w4nqO1T_xFHXAdrh57AJfAbieK1UuMuY5XL8YE3dCE', '1612872415', 102, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNDE0NzVmNWE2MjQi.Q5ZJDEqxiyzc6LZO3N_AEj2YXmSiJs_Gghz2bLv8zo0', 0, 'eHuPCmUyFKE:APA91bFiLzdZJzbCYlL5ByjhJpFIDgF1N8FBBezmA_Q08OL-oEhZVrLGr31JnwDA1dH8LKLATkz00w2rYo_N8aYhZg3qt9JUEqJTg98rzakHpkNcRhTHQPpAZly8W2P3wZl_v98LAxLb'),
(338, '', '', 31, '', NULL, NULL),
(339, '', '', 54, '', NULL, NULL),
(340, '', '', 54, '', NULL, NULL),
(341, '', '', 31, '', NULL, NULL),
(342, '', '', 91, '', NULL, NULL),
(343, '', '', 31, '', NULL, NULL),
(344, '', '', 54, '', NULL, NULL),
(345, '', '', 54, '', NULL, NULL),
(346, '', '', 54, '', NULL, NULL),
(347, '', '', 54, '', NULL, NULL),
(348, '', '', 54, '', NULL, NULL),
(349, '', '', 54, '', NULL, NULL),
(350, '', '', 54, '', NULL, NULL),
(351, '', '', 31, '', NULL, NULL),
(352, '', '', 54, '', NULL, NULL),
(353, '', '', 31, '', NULL, NULL),
(354, '', '', 54, '', NULL, NULL),
(355, '', '', 91, '', NULL, NULL),
(356, '', '', 91, '', NULL, NULL),
(357, '', '', 54, '', NULL, NULL),
(358, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNDE2YjIzYmIyYmQi.UH9K63SmgDrVo-qgOaRimBmXqM9oKPbwTAffzTN6NDs', '1612881571', 98, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNDE2YjIzYmIyZjUi.vgski136hVQ2d0HlESg3zcg7zcEFAkPaYO7kF2OwRvA', 0, 'et1FAiuHVUg:APA91bHYyJz7uYivcr_UsVrCFJrE4p8AS-gBkMiDx7Sy-M6NFhzfH5jCTnVlLcwun_YNU86ysTdjKDMXQJVtaa21T8fkZJARjSOiI1u71H_9xFQNhrVSd7LEHs56qLuYjrqmg3iZ3i2Y'),
(359, '', '', 96, '', NULL, NULL),
(360, '', '', 54, '', NULL, NULL),
(361, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNDE2ZjY1Mjg0MGQi.zqNrSaoYUgDN_xqLcwwsw9XeJuy7-oElbRM4L1svU70', '1581433061', 103, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNDE2ZjY1Mjg0Mzki.bx89dDtYAuoFg0F32ioB2qBHisrnilhIUXNKH7d7O2k', 0, 'eNolkb3HDPs:APA91bFUq6WU8DmJ5ASxNhhW_dNEbQle0qDUVUXfDfdmP3JpOazYG4vhPkmjYGyFMpNYs9xgPPqzBRy17FQ0l_TJYJ7c6_1LpTCffPezFUqdUkmmVtcPh7Ash4UT0VDHnTJ8WbfYjlG6'),
(362, '', '', 91, '', NULL, NULL),
(363, '', '', 54, '', NULL, NULL),
(364, '', '', 31, '', NULL, NULL),
(365, '', '', 31, '', NULL, NULL),
(366, '', '', 31, '', NULL, NULL),
(367, '', '', 31, '', NULL, NULL),
(368, '', '', 31, '', NULL, NULL),
(369, '', '', 31, '', NULL, NULL),
(370, '', '', 54, '', NULL, NULL),
(371, '', '', 54, '', NULL, NULL),
(372, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNTM5NTgwMzU5YjAi.odSvkVRZokEXy7RlIG3TQcnSFPC84S4t8DeR9qPNADc', '1614072064', 37, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNTM5NTgwMzU5ZmQi.XTvr7eGhXYGsRLdFmB07ALHZop3JBdKEFR8hwcgccOA', 0, 'cFaB0TS9nNE:APA91bHacRtnT9UKPHsCuuT2GRjmk287--4oUC9PpYg34OOAsWXkmF3Xj4jwaUtTIooYtmjAPArwweveip3Mg6O-Vx0_vM0SWWB13tpp8y3XXLwm5lvC-ktc6SguKSuJp8swMsdAAUmh'),
(373, '', '', 54, '', NULL, NULL),
(374, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNTM5NWVmNDM4MWYi.CxVFKqpCNsL9iaPhePssosBDv74GVQi1bfaesHuRNEo', '1582622575', 37, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNTM5NWVmNDM4NTgi.3YOZLn70EStRT-ySguEVkuwGSJvTNKmd32iQxF3batg', 0, 'cFaB0TS9nNE:APA91bHacRtnT9UKPHsCuuT2GRjmk287--4oUC9PpYg34OOAsWXkmF3Xj4jwaUtTIooYtmjAPArwweveip3Mg6O-Vx0_vM0SWWB13tpp8y3XXLwm5lvC-ktc6SguKSuJp8swMsdAAUmh'),
(375, '', '', 54, '', NULL, NULL),
(376, '', '', 54, '', NULL, NULL),
(377, '', '', 54, '', NULL, NULL),
(378, '', '', 54, '', NULL, NULL),
(379, '', '', 54, '', NULL, NULL),
(380, '', '', 31, '', NULL, NULL),
(381, '', '', 54, '', NULL, NULL),
(382, '', '', 31, '', NULL, NULL),
(383, '', '', 54, '', NULL, NULL),
(384, '', '', 54, '', NULL, NULL),
(385, '', '', 91, '', NULL, NULL),
(386, '', '', 31, '', NULL, NULL),
(387, '', '', 54, '', NULL, NULL),
(388, '', '', 54, '', NULL, NULL),
(389, '', '', 54, '', NULL, NULL),
(390, '', '', 54, '', NULL, NULL),
(391, '', '', 54, '', NULL, NULL),
(392, '', '', 54, '', NULL, NULL),
(393, '', '', 54, '', NULL, NULL),
(394, '', '', 54, '', NULL, NULL),
(395, '', '', 54, '', NULL, NULL),
(396, '', '', 54, '', NULL, NULL),
(397, '', '', 91, '', NULL, NULL),
(398, '', '', 31, '', NULL, NULL),
(399, '', '', 91, '', NULL, NULL),
(400, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNTkxNjNhZjI1MDEi.WjWVE2HB8dQcT1eh19vOdJe2yuYmkrKrCdFs3-9i520', '1614432698', 96, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNTkxNjNhZjI2NGIi.AuJ5glSrKykaelPlzBDa4t51asO_pjvV8c21tIQg_o4', 0, 'fvLoxkxTCW4:APA91bGT-FxYY_u6MCurjlIznWU8KoZVr40Tsdqo4v61bkDe3uqmiutd13Fb4tpQJqKOzcxf2vihzLb-EYkySZQBsEHo6BqrapEX1f07poxSQq4lGwA2wd4rBkOHVVVjqN-HPX9PTUtY'),
(401, '', '', 31, '', NULL, NULL),
(402, '', '', 31, '', NULL, NULL),
(403, '', '', 54, '', NULL, NULL),
(404, '', '', 54, '', NULL, NULL),
(405, '', '', 31, '', NULL, NULL),
(406, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNWQxNDAzNTIyNDUi.Tpyu7KJ5hQXta5CglADOh35Dorwc4ZfLAf3aj1TQ0AQ', '1583244675', 103, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNWQxNDAzNTIyNjci.vBUno01BtDLhmBnh_5CvhOyzjX2lxOrU5iPDbirDPlU', 0, 'e-RgjkcwrMs:APA91bH04cLPsXtQR-nhdtekPsvwT-77B-6DVOcG9wgcpDeuFJ_zHNBUxZW2NqS4uxX_zFfGLZPYHrXMb9x2vRQQla5XZBqxGMt8mLFQ8gh-OpNpF1554UwMjb-cUfZXSkCavVc24xmv'),
(407, '', '', 31, '', NULL, NULL),
(408, '', '', 31, '', NULL, NULL),
(409, '', '', 31, '', NULL, NULL),
(410, '', '', 31, '', NULL, NULL),
(411, '', '', 31, '', NULL, NULL),
(412, '', '', 31, '', NULL, NULL),
(413, '', '', 31, '', NULL, NULL),
(414, '', '', 31, '', NULL, NULL),
(415, '', '', 31, '', NULL, NULL),
(416, '', '', 31, '', NULL, NULL),
(417, '', '', 31, '', NULL, NULL),
(418, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNWY1OThjZGQ0OWIi.4iBYXUeYbWITWJiEvIqplBnjVnxeG_-CX4BK_33BZCg', '1614843148', 103, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNWY1OThjZGQ0ZGEi.Cl9-RvaG7zFuWaMPN0n7n6RoMGagnDhMvvznFf5ZmjU', 0, 'eMNiWfQtxP8:APA91bHMT9BF0sTXs4zzVxu2qnarPppKv8DimkFhJ4mKDhowvD52g00Kr7uH9ravlp10JP69YQmgKSLIDPcWe-8kjvTN3eniICha-XiOYFDnZpcmFVTtmtNtX77dO8mV7SnwrmGfroP6'),
(419, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNWU0YzA4ZjA4ODgi.ElbAafCyiQnuoi9YIiz8KHCsZQDUpbDLXXXQXmJg9tY', '1583324552', 37, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNWU0YzA4ZjA4YjAi.w-__1askgQnbxsmuuA9CUoLD-XP5UNrkV2KoOjtC2F8', 0, 'cFaB0TS9nNE:APA91bHacRtnT9UKPHsCuuT2GRjmk287--4oUC9PpYg34OOAsWXkmF3Xj4jwaUtTIooYtmjAPArwweveip3Mg6O-Vx0_vM0SWWB13tpp8y3XXLwm5lvC-ktc6SguKSuJp8swMsdAAUmh'),
(420, '', '', 54, '', NULL, NULL),
(421, '', '', 91, '', NULL, NULL),
(422, '', '', 31, '', NULL, NULL),
(423, '', '', 91, '', NULL, NULL),
(424, '', '', 91, '', NULL, NULL),
(425, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNjBhMWRiMDA4MDMi.Lx5blXaeaXAmuB4Gj8NCS-NIWPXSB5v76907oZ9Noo8', '1614927195', 91, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNjBhMWRiMDA4NDYi.Wy_KEzJmF4SGx7kZCJOvdQynEgy5cpOpdYONSo01uUA', 0, 'fgv2LEEWS_c:APA91bFBtqCONl8ySPv_PUN56Faz3yDGr5Lt-FNEg4qDN7wFe8-1DkbX-hA1nyySk8yCN5QT9_RC2EbS0-4OWE_r9enEpScytV_CqmwQNqWF4CtEjqt0OYVmyKr7OO1RfwFjs3QdYHsI'),
(426, '', '', 54, '', NULL, NULL),
(427, '', '', 54, '', NULL, NULL),
(428, '', '', 31, '', NULL, NULL),
(429, '', '', 54, '', NULL, NULL),
(430, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNjI0MDgzM2I3ZDYi.it21ki_qCSRywAdK2kBQxbCazQ05vM4a6RCpfYqnTTE', '1615033347', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNjI0MDgzM2I4MGEi.q4xcKz2XourSbandbrwSwSLLXY_bOC5PsKosEpx3CRg', 1, 'eGkIAlcaZhI:APA91bHOAQtzmKrg9JlmNVGJY2HVpYOpoh5o1Pf1qqIvGYyHHZIpgxp2zqOGGVTeoz3Q3iXyyAMW651pWjd9wIWnMgK2GdPEv2lizf3Qp2U7Vn9N1tPLIy14qzornSOOFprwnn1MPAeZ'),
(431, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNjI0M2MyZTY4Yjci.3iLQ_AwkPp_KQcWsutNPSJsDgc0it3RFGbFj-9c9-Js', '1615034178', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlNjI0M2MyZTY4ZmMi.cennaHkcJjD5CXf5zDZPL8vezxAht56LGUJW3jDidqY', 0, 'eMNiWfQtxP8:APA91bHMT9BF0sTXs4zzVxu2qnarPppKv8DimkFhJ4mKDhowvD52g00Kr7uH9ravlp10JP69YQmgKSLIDPcWe-8kjvTN3eniICha-XiOYFDnZpcmFVTtmtNtX77dO8mV7SnwrmGfroP6');

-- --------------------------------------------------------

--
-- Table structure for table `used_offers`
--

CREATE TABLE `used_offers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coin_offer_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `used_offers`
--

INSERT INTO `used_offers` (`id`, `user_id`, `coin_offer_id`, `time`, `status`) VALUES
(6, 54, 11, 1574255284, 1),
(7, 54, 12, 1574255361, 1),
(8, 54, 11, 1574255362, 1),
(9, 54, 13, 1574255451, 1),
(10, 54, 11, 1574255561, 1),
(11, 54, 12, 1574255562, 1),
(12, 54, 13, 1574255796, 1),
(13, 54, 12, 1574255797, 1),
(14, 54, 11, 1574255798, 1),
(15, 54, 13, 1574255943, 1),
(16, 54, 12, 1574255944, 1),
(17, 54, 12, 1574256017, 1),
(18, 54, 12, 1574257103, 1),
(19, 54, 12, 1574259121, 1),
(20, 54, 12, 1574259122, 1),
(21, 54, 13, 1574260125, 1),
(22, 54, 12, 1574260126, 1),
(23, 54, 11, 1574260127, 1),
(24, 54, 11, 1574260347, 1),
(25, 54, 12, 1574260349, 1),
(26, 54, 12, 1574260350, 1),
(27, 54, 13, 1574260371, 1),
(28, 54, 11, 1574260400, 1),
(29, 54, 11, 1574260402, 1),
(30, 54, 13, 1574260404, 1),
(31, 54, 12, 1574260405, 1),
(32, 54, 12, 1574260407, 1),
(33, 54, 12, 1574260437, 1),
(34, 54, 11, 1574260440, 1),
(35, 54, 13, 1574260442, 1),
(36, 54, 13, 1574260443, 1),
(37, 54, 11, 1574318606, 1),
(38, 54, 13, 1574318609, 1),
(39, 54, 12, 1574318610, 1),
(40, 54, 12, 1574318612, 1),
(41, 54, 11, 1574318839, 1),
(42, 54, 12, 1574318840, 1),
(43, 54, 12, 1574318842, 1),
(44, 54, 13, 1574318846, 1),
(45, 54, 13, 1574318881, 1),
(46, 54, 12, 1574318882, 1),
(47, 54, 11, 1574318883, 1),
(48, 54, 12, 1574319115, 1),
(49, 54, 12, 1574319150, 1),
(50, 54, 13, 1574319275, 1),
(51, 54, 11, 1574319394, 1),
(52, 54, 11, 1574319417, 1),
(53, 54, 11, 1574319698, 1),
(54, 54, 12, 1574320078, 1),
(55, 54, 13, 1574320082, 1),
(56, 54, 12, 1574320103, 1),
(57, 54, 13, 1574320460, 1),
(58, 54, 12, 1574320461, 1),
(59, 54, 12, 1574320645, 1),
(60, 54, 11, 1574320658, 1),
(61, 54, 13, 1574320727, 1),
(62, 54, 11, 1574321622, 1),
(63, 54, 13, 1574321625, 1),
(64, 54, 13, 1574321628, 1),
(65, 54, 12, 1574321696, 1),
(66, 54, 11, 1574322031, 1),
(67, 54, 12, 1574322247, 1),
(68, 54, 13, 1574322273, 1),
(69, 54, 12, 1574322429, 1),
(70, 54, 13, 1574322435, 1),
(71, 54, 11, 1574322439, 1),
(72, 54, 12, 1574322603, 1),
(73, 54, 12, 1574323068, 1),
(74, 54, 11, 1574323105, 1),
(75, 54, 12, 1574323107, 1),
(76, 54, 13, 1574323114, 1),
(77, 54, 12, 1574323292, 1),
(78, 54, 12, 1574323368, 1),
(79, 54, 11, 1574323372, 1),
(80, 54, 11, 1574327760, 1),
(81, 54, 12, 1574327762, 1),
(82, 54, 11, 1574327835, 1),
(83, 54, 12, 1574327838, 1),
(84, 54, 13, 1574327842, 1),
(85, 54, 11, 1574328149, 1),
(86, 54, 12, 1574328152, 1),
(87, 54, 13, 1574328153, 1),
(88, 54, 13, 1574328949, 1),
(89, 54, 11, 1574328951, 1),
(90, 54, 12, 1574328952, 1),
(91, 54, 13, 1574329256, 1),
(92, 54, 12, 1574329262, 1),
(93, 54, 11, 1574329264, 1),
(94, 54, 12, 1574330699, 1),
(95, 54, 11, 1574330700, 1),
(96, 54, 13, 1574330702, 1),
(97, 54, 12, 1574330863, 1),
(98, 54, 11, 1574330865, 1),
(99, 54, 13, 1574330866, 1),
(100, 54, 12, 1574330911, 1),
(101, 54, 11, 1574330912, 1),
(102, 54, 12, 1574332641, 1),
(103, 54, 11, 1574332643, 1),
(104, 54, 11, 1574333374, 1),
(105, 54, 12, 1574333376, 1),
(106, 54, 13, 1574333378, 1),
(107, 54, 12, 1574333982, 1),
(108, 54, 13, 1574333984, 1),
(109, 54, 11, 1574334024, 1),
(110, 54, 12, 1574334026, 1),
(111, 54, 12, 1574334087, 1),
(112, 54, 11, 1574334090, 1),
(113, 54, 13, 1574334091, 1),
(114, 54, 13, 1574334103, 1),
(115, 54, 12, 1574334265, 1),
(116, 54, 11, 1574334286, 1),
(117, 54, 12, 1574334288, 1),
(118, 54, 13, 1574334293, 1),
(119, 54, 12, 1574334391, 1),
(120, 54, 11, 1574334392, 1),
(121, 54, 13, 1574334394, 1),
(122, 54, 12, 1574334716, 1),
(123, 54, 11, 1574334717, 1),
(124, 54, 13, 1574334720, 1),
(125, 54, 11, 1574335563, 1),
(126, 54, 12, 1574335567, 1),
(127, 54, 13, 1574335569, 1),
(128, 54, 11, 1574335667, 1),
(129, 54, 12, 1574335802, 1),
(130, 54, 11, 1574336178, 1),
(131, 54, 12, 1574336181, 1),
(132, 54, 13, 1574336183, 1),
(133, 54, 12, 1574336302, 1),
(134, 54, 13, 1574336707, 1),
(135, 54, 11, 1574336761, 1),
(136, 54, 12, 1574336765, 1),
(137, 54, 13, 1574336767, 1),
(138, 54, 11, 1574337537, 1),
(139, 54, 12, 1574337539, 1),
(140, 54, 13, 1574337541, 1),
(141, 54, 11, 1574337644, 1),
(142, 54, 13, 1574337646, 1),
(143, 54, 13, 1574337667, 1),
(144, 54, 12, 1574337789, 1),
(145, 54, 11, 1574337791, 1),
(146, 54, 12, 1574337891, 1),
(147, 54, 13, 1574337980, 1),
(148, 54, 11, 1574338023, 1),
(149, 54, 13, 1574338210, 1),
(150, 54, 12, 1574338440, 1),
(151, 54, 12, 1574340035, 1),
(152, 54, 12, 1574340143, 1),
(153, 54, 12, 1574340303, 1),
(154, 54, 12, 1574340441, 1),
(155, 54, 12, 1574340582, 1),
(156, 54, 11, 1574341857, 1),
(157, 54, 12, 1574341971, 1),
(158, 54, 12, 1574342040, 1),
(159, 54, 12, 1574342249, 1),
(160, 54, 12, 1574342406, 1),
(161, 54, 12, 1574342507, 1),
(162, 54, 12, 1574342666, 1),
(163, 54, 11, 1574342954, 1),
(164, 54, 12, 1574343054, 1),
(165, 54, 12, 1574343124, 1),
(166, 54, 12, 1574343181, 1),
(167, 54, 12, 1574343200, 1),
(168, 54, 13, 1574343202, 1),
(169, 54, 12, 1574343267, 1),
(170, 54, 13, 1574343342, 1),
(171, 54, 11, 1574343345, 1),
(172, 54, 12, 1574343560, 1),
(173, 54, 12, 1574343699, 1),
(174, 54, 11, 1574343701, 1),
(175, 54, 12, 1574343771, 1),
(176, 54, 12, 1574344030, 1),
(177, 54, 11, 1574344036, 1),
(178, 54, 13, 1574344042, 1),
(179, 54, 11, 1574344063, 1),
(180, 54, 12, 1574344082, 1),
(181, 54, 12, 1574346468, 1),
(182, 54, 12, 1574346976, 1),
(183, 54, 13, 1574347962, 1),
(184, 54, 11, 1574347963, 1),
(185, 54, 12, 1574347965, 1),
(186, 54, 56, 1574348038, 1),
(187, 54, 12, 1574348318, 1),
(188, 54, 59, 1574348322, 1),
(189, 54, 57, 1574348330, 1),
(190, 54, 56, 1574348338, 1),
(191, 54, 11, 1574348339, 1),
(192, 54, 13, 1574348340, 1),
(193, 54, 65, 1574348341, 1),
(194, 54, 63, 1574348342, 1),
(195, 54, 62, 1574348344, 1),
(196, 54, 66, 1574348352, 1),
(197, 54, 60, 1574348353, 1),
(198, 54, 58, 1574348354, 1),
(199, 54, 64, 1574348363, 1),
(200, 54, 61, 1574348365, 1),
(201, 54, 66, 1574360659, 1),
(202, 54, 11, 1574775943, 1),
(203, 54, 64, 1574854731, 1),
(204, 54, 63, 1574854732, 1),
(205, 54, 63, 1574854733, 1),
(206, 54, 62, 1574854734, 1),
(207, 54, 62, 1574854735, 1),
(208, 54, 12, 1574855609, 1),
(209, 54, 62, 1574856041, 1),
(210, 54, 11, 1574856467, 1),
(211, 54, 61, 1574856669, 1),
(212, 54, 65, 1574856671, 1),
(213, 54, 60, 1574856672, 1),
(214, 54, 66, 1574856690, 1),
(215, 54, 63, 1574856692, 1),
(216, 54, 63, 1574856693, 1),
(217, 54, 59, 1574856694, 1),
(218, 54, 11, 1574856695, 1),
(219, 54, 62, 1574857008, 1),
(220, 91, 56, 1574942733, 1),
(221, 91, 63, 1574942758, 1),
(222, 91, 60, 1575290668, 1),
(223, 91, 61, 1575291401, 1),
(224, 91, 64, 1575291475, 1),
(225, 91, 62, 1575291712, 1),
(226, 91, 59, 1575291795, 1),
(227, 91, 57, 1575292287, 1),
(228, 91, 66, 1575292495, 1),
(229, 91, 66, 1575292533, 1),
(230, 54, 69, 1581337480, 1),
(231, 91, 72, 1581345934, 1),
(232, 91, 71, 1581345966, 1),
(233, 91, 72, 1581346037, 1),
(234, 91, 72, 1581346159, 1),
(235, 91, 72, 1581346255, 1),
(236, 54, 72, 1581346339, 1),
(237, 54, 71, 1581346354, 1),
(238, 37, 72, 1582372730, 1),
(239, 54, 72, 1582539394, 1),
(240, 54, 72, 1582637187, 1),
(241, 54, 72, 1582637461, 1),
(242, 54, 72, 1582637524, 1),
(243, 54, 71, 1582637598, 1),
(244, 54, 68, 1582637782, 1),
(245, 54, 71, 1582637821, 1),
(246, 54, 70, 1582637822, 1),
(247, 54, 68, 1582739890, 1),
(248, 54, 69, 1582896784, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL DEFAULT '1',
  `date_of_birth` bigint(20) DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coins` int(11) DEFAULT '0',
  `is_used_reference` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `verify_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verify` int(1) NOT NULL DEFAULT '0',
  `logged_via_fb` int(1) NOT NULL DEFAULT '0',
  `notification_status` int(1) DEFAULT '1',
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `gender`, `date_of_birth`, `mobile_number`, `email`, `password`, `uuid`, `image`, `coins`, `is_used_reference`, `created_at`, `updated_at`, `verify_code`, `verify`, `logged_via_fb`, `notification_status`, `lat`, `lng`, `country`, `region_id`) VALUES
(30, 'super22', 'Super22', 'Admin22', 1, 1581335495, '+656565651466622', 'kakaka@gmail.com12222', 'c9cc24ffa63b25bb52b9d5fa288c2921a5190acd2ad461e2ece7b7d74af0fa53c86b783a066fc1ad3694313345702e69f57d70a597f7fbbf78dfc957d3bcdea9', '', 'User_default.png', 135, 0, '2019-10-01 03:14:51', '2019-10-01 03:14:51', '', 1, 0, 0, 37.785834, -122.406417, 'United States', NULL),
(31, 'zara', 'zara', 'tunyan', 0, 1581335495, '695', 'zara.tunyan@gmail.com', '62670d1e1eea06b6c975e12bc8a16131b278f6d7bcbe017b65f854c58476baba86c2082b259fd0c1310935b365dc40f609971b6810b065e528b0b60119e69f61', '', 'User_default.png', 217, 0, '2019-10-01 18:08:45', '2019-10-01 18:08:45', '', 1, 0, 0, NULL, NULL, NULL, NULL),
(33, 'adminSuper', 'Su', 'A', 1, 1550490695, '+656565651466622s', 'kakaka@gmail.com12222s', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '', 'User_default.png', 115, 0, '2019-10-02 14:31:04', '2019-10-02 14:31:04', '', 1, 0, 1, NULL, NULL, NULL, NULL),
(34, 'user', 'developer', 'develop', 0, 1581335495, '876767', 'test@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 531, 0, '2019-10-02 16:06:48', '2019-10-02 16:06:48', '', 1, 0, 1, NULL, NULL, NULL, NULL),
(35, 'testuser', 'test', 'test', 1, 1550490695, '846464', 'testuser@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, 0, '2019-10-02 16:14:45', '2019-10-02 16:14:45', '', 1, 0, 1, NULL, NULL, NULL, NULL),
(36, 'usertest', 'test', 'test', 1, -1105930800, '9467646', 'testtest@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, 0, '2019-10-02 16:38:14', '2019-10-02 16:38:14', '', 1, 0, 1, NULL, NULL, NULL, NULL),
(37, 'MiledAoun15700188621825521286', 'Miled', 'Aoun', 1, 1581335495, '', 'miled.ha21@gmail.com', '1570018862?1518581949', '', 'Logo_1582372420_902699736.jpeg', 2, 0, '2019-10-02 17:21:02', '2019-10-02 17:21:02', '', 1, 0, 1, NULL, NULL, NULL, NULL),
(38, 'miles', 'miled', 'sounds', 1, 1581335495, '111111', 'aaa@aaa.aaaa', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '', 'User_default.png', 0, 0, '2019-10-02 17:22:21', '2019-10-02 17:22:21', '', 1, 0, 1, NULL, NULL, NULL, NULL),
(39, 'ttt', 'ttt', 'ttt', 1, 1581335495, '45345345', 'tttt@mail.ryu', '99f97d455d5d62b24f3a942a1abc3fa8863fc0ce2037f52f09bd785b22b800d4f2e7b2b614cb600ffc2a4fe24679845b24886d69bb776fcfa46e54d188889c6f', '', 'User_default.png', 0, 0, '2019-10-04 15:08:08', '2019-10-04 15:08:08', '', 1, 0, 1, NULL, NULL, NULL, NULL),
(40, 'ggg', 'gggg', 'gggg', 1, 1581508295, '656565', 'tatadav94@gmail.com', '2ee7a30c404a385efd5c8bda07cd1899d8cbb32fa50250dae83d3a0564ea650af4d7a29018e84276ad815b27be8a0c2b518a8b79544364c981fe514dcf49b4a0', '', 'User_default.png', 14, 0, '2019-10-04 15:36:00', '2019-10-04 15:36:00', '', 1, 0, 1, NULL, NULL, NULL, NULL),
(41, 'cggg', 'cfff', 'cggg', 1, 1550490695, '22888', 'yyy@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 4, 0, '2019-10-04 15:52:13', '2019-10-04 15:52:13', '', 1, 0, 1, NULL, NULL, NULL, NULL),
(46, 'dev', 'ddd', 'ddd', 1, 1581335495, '7577557', 'test1111@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, 0, '2019-10-30 11:13:59', '2019-10-30 11:13:59', '', 1, 0, 1, NULL, NULL, NULL, NULL),
(47, 'devv', 'ddd', 'ddd', 1, 1550490695, '444444', 'ttt@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, 0, '2019-10-30 11:20:02', '2019-10-30 11:20:02', '', 1, 0, 1, NULL, NULL, NULL, NULL),
(48, 'developer', 'ddd', 'ddd', 1, 1581335495, '453453', 'rrr@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, 0, '2019-10-30 11:21:25', '2019-10-30 11:21:25', '', 0, 0, 1, NULL, NULL, NULL, NULL),
(49, 'adminSuperas', 'Super22as', 'Admin22asd', 1, 1581508295, '+656565651466622sas', 'kakaka@gmail.com12222sas', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '', 'User_default.png', 0, 0, '2019-10-30 11:23:00', '2019-10-30 11:23:00', '', 0, 0, 1, NULL, NULL, NULL, NULL),
(50, 'adminSuperasas', 'Super22asas', 'Admin22asd', 1, 1550490695, '+656565651466622sasas', 'kakaka@gmail.com12222sasas', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '', 'User_default.png', 0, 0, '2019-10-30 11:24:10', '2019-10-30 11:24:10', '', 0, 0, 1, NULL, NULL, NULL, NULL),
(51, 'test data', 'test', 'test', 1, 1550490695, '745638745683', 'rrriiiii@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 8, 0, '2019-10-30 11:30:19', '2019-10-30 11:30:19', '', 0, 0, 1, NULL, NULL, NULL, NULL),
(52, 'miled', 'miled', 'aoun', 1, 1550490695, '111111999999', 'miled@miled.miled', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '', 'User_default.png', 0, 0, '2019-10-30 11:47:14', '2019-10-30 11:47:14', '', 0, 0, 1, NULL, NULL, NULL, NULL),
(53, 'testt', 'ttttt', 'fffff', 1, 1572292800, '2222', 'ffffff@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, 0, '2019-10-30 12:09:52', '2019-10-30 12:09:52', '', 0, 0, 1, NULL, NULL, NULL, NULL),
(54, 'test1', 'test', 'test', 1, 1581508295, '+35884848494', 'vsbsbsj@mail.ru', '125d6d03b32c84d492747f79cf0bf6e179d287f341384eb5d6d3197525ad6be8e6df0116032935698f99a09e265073d1d6c32c274591bf1d0a20ad67cba921bc', '170144-c190b2', 'User_default.png', 82791, 0, '2019-10-30 12:16:38', '2019-10-30 12:16:38', '0', 1, 1, 1, NULL, NULL, NULL, NULL),
(55, 'aaa', 'aaa', 'aaa', 1, 1581508295, '000', 'ckymarra@gmail.com', 'd6f644b19812e97b5d871658d6d3400ecd4787faeb9b8990c1e7608288664be77257104a58d033bcf1a0e0945ff06468ebe53e2dff36e248424c7273117dac09', '', 'User_default.png', 0, 0, '2019-10-30 15:56:20', '2019-10-30 15:56:20', '', 0, 0, 1, NULL, NULL, NULL, NULL),
(57, 'VaskenBakkalian15733258621951140152', 'Vasken', 'Bakkalian', 1, 1581508295, '', 'engerochvasken@hotmail.com', '1573325862?1717654752', '', 'User_default.png', 4, 0, '2019-11-09 18:57:42', '2019-11-09 18:57:42', '', 0, 0, 1, NULL, NULL, NULL, NULL),
(58, 'AliMansour15742581181230913061', 'Ali', 'Mansour', 1, 1581508295, '', 'suprenoo@hotmail.com', '1574258118?1299941546', '', 'User_default.png', 0, 0, '2019-11-20 13:55:18', '2019-11-20 13:55:18', '', 0, 0, 1, NULL, NULL, NULL, NULL),
(91, 'test2', 'test', 'test', 1, 1550490695, '+37495616200', 'gggg@mail.ru', '125d6d03b32c84d492747f79cf0bf6e179d287f341384eb5d6d3197525ad6be8e6df0116032935698f99a09e265073d1d6c32c274591bf1d0a20ad67cba921bc', '16ead1-2f0de6', 'User_default.png', 4, 0, '2019-11-27 13:35:30', '2019-11-27 13:35:30', '0', 1, 0, 1, NULL, NULL, NULL, NULL),
(92, 'davidd', 'd', 'a', 1, 1550490695, '+37499099248', 'Jindx@gmail.com', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '16f0e8-5a7759', 'User_default.png', 0, 0, '2019-12-16 09:58:52', '2019-12-16 09:58:52', '300544', 0, 0, 1, NULL, NULL, NULL, NULL),
(93, 'davidd', 'd', 'a', 1, 587898, '+37499099248', 'Jindx@gmail.com', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '16f0e8-409261', 'User_default.png', 0, 0, '2019-12-16 11:42:11', '2019-12-16 11:42:11', '148511', 0, 0, 1, NULL, NULL, NULL, NULL),
(94, 'davidd', 'd', 'a', 1, 587898, '+37499099248', 'Jindx@gmail.com', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '16f0e8-4edd9c', 'User_default.png', 0, 0, '2019-12-16 11:43:10', '2019-12-16 11:43:10', '880529', 0, 0, 1, NULL, NULL, NULL, NULL),
(96, 'David', 'David', 'Kocharyan', 1, 760395600, '+358erterterte', 'david@mail.ru', '125d6d03b32c84d492747f79cf0bf6e179d287f341384eb5d6d3197525ad6be8e6df0116032935698f99a09e265073d1d6c32c274591bf1d0a20ad67cba921bc', '170143-8a7546', 'User_default.png', 0, 0, '2020-02-05 07:20:22', '2020-02-05 07:20:22', '0', 1, 0, 1, NULL, NULL, NULL, NULL),
(97, 'pargev', 'pq', 'agh', 1, 1170660397079, '+3745252545', 'pq@gmail.com', 'b0412597dcea813655574dc54a5b74967cf85317f0332a2591be7953a016f8de56200eb37d5ba593b1e4aa27cea5ca27100f94dccd5b04bae5cadd4454dba67d', '170143-eea291', 'User_default.png', 75, 0, '2020-02-05 07:27:12', '2020-02-05 07:27:12', '0', 1, 0, 1, NULL, NULL, NULL, NULL),
(98, 'new', 'new', 'new', 1, 1391544000, '+358828505', 'bbbb@mail.ru', '125d6d03b32c84d492747f79cf0bf6e179d287f341384eb5d6d3197525ad6be8e6df0116032935698f99a09e265073d1d6c32c274591bf1d0a20ad67cba921bc', '170148-81eb53', 'User_default.png', 3, 0, '2020-02-05 08:47:10', '2020-02-05 08:47:10', '0', 1, 0, 1, NULL, NULL, NULL, NULL),
(99, 'user2', 'user2', 'user2', 1, 1075924800, '+126843423423', 'erwewrwrwr@mail.ru', '125d6d03b32c84d492747f79cf0bf6e179d287f341384eb5d6d3197525ad6be8e6df0116032935698f99a09e265073d1d6c32c274591bf1d0a20ad67cba921bc', '17015a-8d1cbe', 'User_default.png', 0, 0, '2020-02-05 14:02:30', '2020-02-05 14:02:30', '0', 1, 0, 1, NULL, NULL, NULL, NULL),
(100, 'dummy', 'dummy', 'dummy', 0, 918158400, '+358345345345', 'sdasdadas@mail.ru', '125d6d03b32c84d492747f79cf0bf6e179d287f341384eb5d6d3197525ad6be8e6df0116032935698f99a09e265073d1d6c32c274591bf1d0a20ad67cba921bc', '17015a-b57995', 'User_default.png', 0, 0, '2020-02-05 14:05:15', '2020-02-05 14:05:15', '0', 1, 0, 1, NULL, NULL, NULL, NULL),
(101, 'zzzzz', 'hdnd', 'hsnd', 0, 1580985851489, '+376899556', 'zzz@zzz.zz', 'b0412597dcea813655574dc54a5b74967cf85317f0332a2591be7953a016f8de56200eb37d5ba593b1e4aa27cea5ca27100f94dccd5b04bae5cadd4454dba67d', '1701a1-a3a808', 'User_default.png', 0, 0, '2020-02-06 10:44:51', '2020-02-06 10:44:51', '0', 1, 0, 1, NULL, NULL, NULL, NULL),
(102, 'Kay', 'Kau', 'Sirb', 1, 1580997062982, '+9613037672', 'hello@khalilsarabey.com', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '1701ac-5f180e', 'User_default.png', 0, 0, '2020-02-06 13:51:51', '2020-02-06 13:51:51', '0', 1, 0, 1, NULL, NULL, NULL, NULL),
(103, 'ԱրմենուհիՄկրտչյան8721', 'Արմենուհի', 'Մկրտչյան', 0, 0, '', 'mkrtchyanarmenuhi89@gmail.com', '1581062068?226222550', '1701ea-49903a', 'User_default.png', 0, 0, '2020-02-07 07:54:28', '2020-02-07 07:54:28', '', 1, 1, 1, NULL, NULL, NULL, NULL),
(104, 'zz', 'bdb', 'jdh', 1, 1581278400, '+12688784', 'hpro252@gmail.com', '4ce9792f2871988864761ef032ce09646333c81667d5d3360a82d7c47411c0b46846437ac5e304880fb5d7510d0af3d7af5a666a1f0459df1e04d1a8683bbe13', '1702ef-e90416', 'User_default.png', 0, 0, '2020-02-10 12:06:39', '2020-02-10 12:06:39', '2001', 0, 0, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_loyalty_card`
--

CREATE TABLE `user_loyalty_card` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user_loyalty_card`
--

INSERT INTO `user_loyalty_card` (`id`, `user_id`, `card_id`, `status`) VALUES
(4, 91, 11, 1),
(5, 91, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE `video` (
  `id` int(255) NOT NULL,
  `restaurant_id` int(255) NOT NULL,
  `region_id` int(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `valid_date` date NOT NULL,
  `show_count` int(255) NOT NULL,
  `link` varchar(150) CHARACTER SET utf8 DEFAULT NULL,
  `video` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` int(255) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `video`
--

INSERT INTO `video` (`id`, `restaurant_id`, `region_id`, `country`, `valid_date`, `show_count`, `link`, `video`, `type`, `status`) VALUES
(4, 1, 1, 'Lebanon', '2020-03-31', 1, 'http://aimtech.am', 'Video_1583414741_1715558195.mp4', 'video', 1),
(5, 2, 1, 'Lebanon', '2020-03-27', 1, '', 'Video_1583414759_929348691.jpg', 'image', 1);

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
-- Indexes for table `loyalty_card`
--
ALTER TABLE `loyalty_card`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `res_id` (`res_id`) USING BTREE;

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
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `offers_click`
--
ALTER TABLE `offers_click`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `user_id` (`user_id`);

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
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `regions_coordinates`
--
ALTER TABLE `regions_coordinates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`);

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
-- Indexes for table `restaurant_click`
--
ALTER TABLE `restaurant_click`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_weeks`
--
ALTER TABLE `restaurant_weeks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `res_plans`
--
ALTER TABLE `res_plans`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`);

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
  ADD KEY `user_id` (`user_id`),
  ADD KEY `coin_offer_id` (`coin_offer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user_loyalty_card`
--
ALTER TABLE `user_loyalty_card`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `card_id` (`card_id`) USING BTREE;

--
-- Indexes for table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=289;

--
-- AUTO_INCREMENT for table `claim_your_business`
--
ALTER TABLE `claim_your_business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coin_offers`
--
ALTER TABLE `coin_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `featured_offers`
--
ALTER TABLE `featured_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `hour_offers`
--
ALTER TABLE `hour_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `loyalty_card`
--
ALTER TABLE `loyalty_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `menu_images`
--
ALTER TABLE `menu_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `more_infos`
--
ALTER TABLE `more_infos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `offers_click`
--
ALTER TABLE `offers_click`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=437;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `regions_coordinates`
--
ALTER TABLE `regions_coordinates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `restaurants_images`
--
ALTER TABLE `restaurants_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_click`
--
ALTER TABLE `restaurant_click`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `restaurant_weeks`
--
ALTER TABLE `restaurant_weeks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `res_plans`
--
ALTER TABLE `res_plans`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=432;

--
-- AUTO_INCREMENT for table `used_offers`
--
ALTER TABLE `used_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `user_loyalty_card`
--
ALTER TABLE `user_loyalty_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `loyalty_card`
--
ALTER TABLE `loyalty_card`
  ADD CONSTRAINT `loyalty_card_ibfk_1` FOREIGN KEY (`res_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offers_click`
--
ALTER TABLE `offers_click`
  ADD CONSTRAINT `offers_click_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offers_click_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rates`
--
ALTER TABLE `rates`
  ADD CONSTRAINT `rates_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rates_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `regions_coordinates`
--
ALTER TABLE `regions_coordinates`
  ADD CONSTRAINT `regions_coordinates_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `sliders`
--
ALTER TABLE `sliders`
  ADD CONSTRAINT `sliders_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `used_offers`
--
ALTER TABLE `used_offers`
  ADD CONSTRAINT `used_offers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `used_offers_ibfk_2` FOREIGN KEY (`coin_offer_id`) REFERENCES `coin_offers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_loyalty_card`
--
ALTER TABLE `user_loyalty_card`
  ADD CONSTRAINT `user_loyalty_card_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_loyalty_card_ibfk_2` FOREIGN KEY (`card_id`) REFERENCES `loyalty_card` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
