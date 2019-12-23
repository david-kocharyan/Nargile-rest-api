-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 23, 2019 at 07:24 AM
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
(32, 'admin2000', 'David', 'Kocharyan', '+37499000000000', 'admisdasdan@gmail.com', 'admin', '0bf15c7902099e7430d74e16fdb6d3647ddb602574605fa014a4887da61df4bf04b865977d52367a75f85962966b3bb1f6d3c4fc9d1f5c8d5acf4f4ed3ec239d', '1', 'User_default.png', '2019-10-23 21:26:55', '2019-10-23 21:26:55');

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
(249, 0, 0, 1574856982, 0),
(250, 54, 61, 1574856984, 1),
(251, 0, 0, 1574856985, 0),
(252, 54, 63, 1574856987, 1),
(253, 0, 0, 1574856989, 0),
(254, 54, 65, 1574856990, 1),
(255, 0, 0, 1574856997, 0),
(256, 0, 0, 1574929977, 0),
(257, 0, 0, 1574942746, 0),
(258, 0, 0, 1575289569, 0),
(259, 0, 0, 1575290238, 0),
(260, 0, 0, 1575290490, 0),
(261, 0, 0, 1575291387, 0),
(262, 0, 0, 1575291460, 0),
(263, 0, 0, 1575291703, 0),
(264, 0, 0, 1575291773, 0),
(265, 0, 0, 1575292266, 0),
(266, 0, 0, 1575292489, 0),
(267, 0, 0, 1575292522, 0),
(268, 0, 0, 1575293397, 0),
(269, 0, 0, 1575579318, 0),
(270, 0, 0, 1575579977, 0),
(271, 0, 0, 1575619278, 0),
(272, 0, 0, 1576233238, 0),
(273, 0, 0, 1576242104, 0),
(274, 0, 0, 1576413658, 0),
(275, 0, 0, 1576413661, 0),
(276, 54, 66, 1576413705, 1),
(277, 142, 66, 1576830722, 1);

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
(66, 4, 60, 1577253600, 'Keif is offering 1 freenargile in Achrafieh branch.', 0, 1),
(67, 4, 70, 1577253600, 'Keif is offering 1 freenargile in Achrafieh branch.', 0, 1);

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
(29, 140, 1, 1),
(30, 140, 2, 1),
(31, 140, 7, 1),
(32, 142, 2, 0),
(33, 142, 1, 1),
(34, 147, 2, 1);

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

--
-- Dumping data for table `featured_offers`
--

INSERT INTO `featured_offers` (`id`, `restaurant_id`, `text`, `status`, `created_at`) VALUES
(1, 1, 'Nargile for 3000 LBP Tuesdays - Wednesdays Thurdays Ladies ONLY', '1', NULL),
(2, 1, 'Free Nargile From 13:00 PM Till 16:00PM Mon-Fri', '1', NULL);

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
(103, 142, 141, 1),
(104, 142, 140, 1),
(110, 146, 140, 1),
(111, 146, 124, 2),
(112, 146, 30, 2),
(113, 146, 142, 1),
(114, 140, 124, 1),
(115, 140, 141, 1),
(116, 140, 143, 1),
(117, 140, 144, 1),
(118, 140, 145, 1),
(119, 148, 147, 1),
(120, 149, 140, 1);

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
  `body` varchar(255) NOT NULL,
  `click_action` varchar(255) NOT NULL,
  `action_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `user_id`, `body`, `click_action`, `action_id`, `status`, `created_at`) VALUES
(23, 30, 'Super22 Admin22 Became Your Friend', 'friend_request', 48, 1, '2019-12-06 04:44:32'),
(26, 30, 'test test Became Your Friend', 'friend_request', 54, 0, '2019-12-06 04:57:55'),
(38, 30, 'hshsj bsjsjs Became Your Friend', 'friend_request', 104, 1, '2019-12-09 08:41:05'),
(44, 30, 'cszzzzz cdsvdsv2 Became Your Friend', 'friend_request', 108, 1, '2019-12-10 05:31:47'),
(46, 30, 'test test Became Your Friend', 'friend_request', 54, 1, '2019-12-10 05:40:24'),
(50, 30, 'Zara Tunyan Became Your Friend', 'friend_request', 103, 1, '2019-12-11 03:57:26'),
(56, 30, 'test test Became Your Friend', 'friend_request', 91, 1, '2019-12-13 06:41:55'),
(57, 124, 'Marat Mkrtchyan Became Your Friend', 'friend_request', 136, 1, '2019-12-16 06:18:33'),
(68, 30, 'zara tunyabn Sent You Friend Request', 'friend_request', 140, 1, '2019-12-17 04:49:20'),
(75, 141, 'Armen Mkrtchyan  Sent You Friend Request', 'friend_request', 142, 0, '2019-12-17 05:07:28'),
(76, 142, 'user user Sent You Friend Request', 'friend_request', 141, 0, '2019-12-17 05:09:55'),
(77, 142, 'user user Sent You Friend Request', 'friend_request', 141, 0, '2019-12-17 05:46:15'),
(78, 141, 'Armen Mkrtchyan  Sent You Friend Request', 'friend_request', 142, 0, '2019-12-17 05:47:40'),
(79, 141, 'Armen Mkrtchyan  Sent You Friend Request', 'friend_request', 142, 0, '2019-12-17 05:48:18'),
(80, 142, 'user user Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 0, '2019-12-17 05:49:27'),
(81, 140, 'Armen Mkrtchyan  Sent You Friend Request', 'friend_request', 142, 0, '2019-12-17 07:59:31'),
(82, 142, 'Dav key Sent You Friend Request', 'friend_request', 146, 0, '2019-12-17 08:18:52'),
(83, 145, 'Dav key Sent You Friend Request', 'friend_request', 146, 1, '2019-12-17 08:19:01'),
(84, 144, 'Dav key Sent You Friend Request', 'friend_request', 146, 1, '2019-12-17 08:19:03'),
(85, 143, 'Dav key Sent You Friend Request', 'friend_request', 146, 1, '2019-12-17 08:19:03'),
(86, 141, 'Dav key Sent You Friend Request', 'friend_request', 146, 0, '2019-12-17 08:19:05'),
(87, 140, 'Dav key Sent You Friend Request', 'friend_request', 146, 0, '2019-12-17 08:19:06'),
(88, 124, 'Dav key Sent You Friend Request', 'friend_request', 146, 1, '2019-12-17 08:19:10'),
(89, 30, 'Dav key Sent You Friend Request', 'friend_request', 146, 1, '2019-12-17 08:19:10'),
(90, 142, 'Dav key Sent You Friend Request', 'friend_request', 146, 0, '2019-12-17 08:20:09'),
(91, 124, 'zara tati Sent You Friend Request', 'friend_request', 140, 1, '2019-12-17 08:23:11'),
(92, 141, 'zara tati Sent You Friend Request', 'friend_request', 140, 1, '2019-12-17 08:23:13'),
(93, 143, 'zara tati Sent You Friend Request', 'friend_request', 140, 1, '2019-12-17 08:23:14'),
(94, 144, 'zara tati Sent You Friend Request', 'friend_request', 140, 1, '2019-12-17 08:23:15'),
(95, 145, 'zara tati Sent You Friend Request', 'friend_request', 140, 1, '2019-12-17 08:23:16'),
(96, 142, 'zara tati Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 0, '2019-12-17 11:12:47'),
(97, 142, 'zara tati Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 0, '2019-12-17 11:13:42'),
(98, 145, 'zara tati Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-17 11:21:36'),
(99, 144, 'zara tati Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-17 11:21:38'),
(100, 144, 'zara tati Will Share A Bliss Hall  Restaurant With You!', 'share_request', 7, 1, '2019-12-18 10:05:49'),
(101, 147, 'lichaa tarabay Sent You Friend Request', 'friend_request', 148, 0, '2019-12-19 07:30:05'),
(102, 140, 'bdbd jdjdn Sent You Friend Request', 'friend_request', 149, 0, '2019-12-19 07:48:44'),
(103, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 07:51:39'),
(104, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:23:17'),
(105, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:23:30'),
(106, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:23:42'),
(107, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:25:44'),
(108, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:26:23'),
(109, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:26:41'),
(110, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:28:25'),
(111, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:28:41'),
(112, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:30:15'),
(113, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:33:38'),
(114, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:33:59'),
(115, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:34:14'),
(116, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:35:30'),
(117, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:36:42'),
(118, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:38:14'),
(119, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:38:33'),
(120, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:38:50'),
(121, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:39:05'),
(122, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:39:18'),
(123, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:39:52'),
(124, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:40:02'),
(125, 140, 'bdbd jdjdn Will Share A Cafe Em Nazih  Restaurant With You!', 'share_request', 1, 1, '2019-12-19 08:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `overall` float DEFAULT NULL,
  `taste` float DEFAULT NULL,
  `charcoal` float DEFAULT NULL,
  `cleanliness` float DEFAULT NULL,
  `staff` float DEFAULT NULL,
  `value_for_money` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `user_id`, `restaurant_id`, `overall`, `taste`, `charcoal`, `cleanliness`, `staff`, `value_for_money`) VALUES
(24, 30, 8, 3, 3, 3, 3, 3, 3),
(25, 30, 1, 3, 3, 3, 3, 3, 3),
(26, 30, 1, 3, 3, 3, 3, 3, 3),
(27, 30, 5, 3, 3, 3, 3, 3, 3),
(28, 30, 6, 3, 3, 3, 3, 3, 3),
(97, 140, 1, 2.6, 2, 2, 2, 5, 2),
(98, 140, 1, 4, 4, 4, 4, 4, 4),
(99, 142, 1, 3, 3, 3, 3, 3, 3),
(100, 142, 1, 3.2, 4, 3, 2, 3, 4),
(101, 142, 1, 3.4, 4, 4, 4, 3, 2),
(102, 142, 1, 3.2, 4, 4, 2, 3, 3),
(103, 146, 2, 3.4, 5, 4, 2, 2, 4),
(104, 142, 1, 4, 5, 4, 5, 3, 3),
(105, 140, 2, 4.2, 4, 4, 5, 4, 4),
(106, 140, 2, 4, 4, 4, 4, 4, 4),
(107, 142, 1, 3, 3, 4, 2, 4, 2),
(108, 142, 7, 3, 3, 3, 3, 3, 3),
(109, 142, 2, 3.4, 4, 4, 3, 3, 3),
(110, 142, 2, 3, 3, 3, 3, 3, 3),
(111, 142, 2, 3.4, 3, 3, 4, 3, 4),
(112, 142, 7, 3, 3, 3, 3, 3, 3),
(113, 142, 7, 3, 3, 3, 3, 4, 2),
(114, 142, 7, 2.4, 2, 2, 2, 3, 3),
(115, 142, 7, 3, 1, 3, 5, 3, 3),
(116, 142, 2, 3.2, 3, 5, 2, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `regions_coordinates`
--

CREATE TABLE `regions_coordinates` (
  `id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `lat` varchar(255) CHARACTER SET latin1 NOT NULL,
  `lng` varchar(255) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(1, 'Cafe Em Nazih', 23, 'Logo_1569932559_1320868044.jpg', '9611745442', 'Cafe', 'Saifi Urban Gardens, Pasteur Street', '33.896025', '35.516406', 1, '3.24', 32),
(2, 'Abo Waseem', 23, 'Logo_1569932569_1241077901.jpg', '9611745442', 'Resto-Cafe', 'Main Street, Hamra', '33.896189', '35.477883', 1, '3.5142857142857', 32),
(3, 'Toot Beirut', 23, 'Logo_1569932577_1638295637.jpg', '9611756166', 'Restaurant', 'Makdessi Street, Facing Liban Post', '33.896447', '35.482184', 1, '0', NULL),
(4, 'Barjees Cafe', 23, 'Logo_1569932588_1476692797.jpg', '9611745356', 'Cafe', 'Main Street, Hamra', '33.896320', '35.477650', 1, '0', NULL),
(5, 'Dar Al Sultani', 23, 'Logo_1569932610_1500670266.jpg', '9611741466', 'Restaurant', 'Sadat Street', '33.896430', '35.477017', 1, '0', 32),
(6, 'Fawzi Burj Al Hamam ', 23, 'Logo_1569932623_526565905.jpg', '9611741910', 'Restaurant', 'Golden Tulip Seranada Hotel, Abdel Aziz Street', '33.896328', '35.483972', 1, '0', NULL),
(7, 'Bliss Hall', 23, 'Logo_1569932633_1178099924.jpg', '9611362232', 'Cafe', 'Bliss Street, Near Bank Audi', '33.898656', '35.477467', 1, '2.88', NULL),
(8, 'Work Lounge', 23, 'Logo_1569932644_1813063138.jpg', '9611742428', 'Resto-Cafe', 'Badr Plaza, Leon Street, Next to the Lebanese American University', '33.894041', '35.478446', 1, '0', NULL),
(9, 'Abu Naim', 23, 'Logo_1569932651_345754676.jpg', '9611750480', 'Restaurant', 'Picadelly Street', '40.7929026', '43.8464971', 1, '0', NULL),
(10, 'Duke Eatery & Cafe', 24, 'Logo_1569932668_1705152190.jpg', '9611745442747', 'Cafe', 'Main Street', '33.895419', '35.484382', 1, '0', NULL),
(11, 'Al Nard', 24, 'Logo_1569932713_1126625444.jpg', '9611746067', 'Cafe', 'Gems Aparthotel, Makdessi Street', '33.896832', '35.478723', 1, '0', NULL),
(12, 'Good 2 Go', 24, 'Logo_1569932727_1817381857.jpg', '9611355883', 'Cafe', 'Makdessi Street, Next to GS', '33.896021', '35.485053', 1, '3.24', NULL),
(13, 'Afandina', 24, 'Logo_1569932735_451691935.jpg', '9611351510', 'Restaurant', 'Makdesi Street, Liban Post Building', '33.881608', '35.496292', 1, '2.04', NULL),
(14, 'Kaza Meza', 23, 'Logo_1569932748_590022535.jpg', '9611348016', 'Resto-Caf', 'Mahatma Ghandi Street', '33.898285', '35.478734', 1, '0', NULL),
(15, 'Wimpy', 23, 'Logo_1569932755_2011446988.jpg', '9611345641', 'cafe', 'Picadelly Street', '33.895280', '35.483274', 1, '0', NULL),
(16, 'Lavender Cafe', 23, 'Logo_1569932763_250838888.jpg', '9611751251', 'Cafe', 'Baalbak Street', '33.895122', '35.480656', 1, '0', NULL),
(17, 'Hashtag Resto Cafe', 23, 'Logo_1569932776_1470398627.jpg', '9611745442', 'Resto-Cafe', 'Yamout Street', '33.897402', '35.478095', 1, '2.8333333333333', NULL),
(18, 'El Denye Hek', 31, 'Logo_1569932793_236142029.jpg', '9611567191', 'Restaurant', 'Armenia Street', '33.896925', '35.525611', 1, '0', NULL),
(19, 'El Brimo', 31, 'Logo_1569932802_473601840.jpg', '9611444199', 'cafe', 'Geitawi', '33.894107', '35.529946', 1, '2.8', NULL),
(20, 'Caf Badaro', 31, 'Logo_1569932813_208496841.jpg', '9611380693', 'Cafe', 'Main Street, Near Bank Audi', '33.872769', '35.515837', 1, '0', NULL),
(21, 'Alturki', 23, 'Logo_1569932833_1460047395.jpg', '9611302702', 'Restaurant', 'Main Street, Facing Abdel Naser Mosque', '33.878730', '35.499654', 1, '0', NULL),
(22, 'Alturki', 30, 'Logo_1569932841_749480922.jpg', '9611558532', 'Restaurant', 'Sayid Hadi Highway, Msharrafiyeh', '33.858113', '35.512272', 1, '0', NULL),
(23, 'Alturki', 30, 'Logo_1569932856_665822247.jpg', '9617730693', 'Restaurant', 'Highway, Near Bank Audi, Saida', '33.560220', '35.379585', 1, '2.8', NULL);

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
(22, 140, 1, 'test'),
(23, 142, 1, 'review1\n'),
(24, 142, 1, 'reviw2'),
(25, 142, 1, 'review3'),
(26, 142, 1, 'review4'),
(27, 146, 2, 'True'),
(28, 142, 1, 'Good'),
(29, 140, 2, 'test review'),
(30, 140, 2, 'one more test'),
(31, 142, 1, 'ft'),
(32, 142, 7, 'Gg'),
(33, 142, 2, 'Hi ff'),
(34, 142, 2, 'Ha2'),
(35, 142, 7, 'Hhh'),
(36, 142, 7, 'Gj'),
(37, 142, 7, 'Hj'),
(38, 142, 7, 'Iuy'),
(39, 142, 2, 'Hhg');

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
  `region_id` int(11) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `start` timestamp NULL DEFAULT NULL,
  `end` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `region_id`, `image`, `link`, `start`, `end`, `status`) VALUES
(67, NULL, 'Slider_1576671582_1721931862.jpg', 'http://new.aimtech.am', '2019-12-17 06:00:00', '2019-12-31 06:00:00', 1),
(68, NULL, 'Slider_1576671090_1545236810.jpg', 'http://new.aimtech.am', NULL, NULL, 1);

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
(175, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmM4ZDY0ZDM4Mzgi.tGTOsipLdVCPFjngKRqc5PJKAR6RjmYoRmLlkahWbuc', '1572724452', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmM4ZDY0ZDM5NTIi.FOypiAvNn9UnarxDx5dOhlpqHlSPLfCAFJO545sEPTE', NULL, NULL),
(178, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzAyNjJjNDgzOGUi.XKlP1o2biCy752UR-XyOczjKqBIGRPHt5qsKtDBxCGo', '1572960172', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzAyNjJjNDg0MTYi.Piks7845wo4m6-5kMpS0qOXlkclo0_gUgdstpuqUodg', NULL, NULL),
(185, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2E2MjY5ODkyYmEi.WtJg4alsF4wWZKC2cdes2GiSevhc_0USuE6bg0L3HlM', '1573630953', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2E2MjY5ODkzM2Mi.BPto1wpLzy0PX-TE2Xpr6-ECnC9MDXg4KhQj36YxkHk', NULL, NULL),
(186, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZTUwYzlhMTMi.EdzvHIj0YLqw6fqMVcPBihJH0TA_Kp8DFVSORBSvqws', '1573744592', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZTUwYzlhODci.tP1ka1uBKz5Yt6FM9hQ6TD5ltG2kCfP_FlEg0q00Uik', NULL, NULL),
(272, '', '', 30, '', NULL, NULL),
(275, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTYxYjZjMjM0ZDMi.-_Ks937VkjrBkGEBJOvoLXAkVHR1ODe3EM2IVd21V34', '1575447788', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTYxYjZjMjM1NGQi.lVeNpGCsv06n8l3OMvdPd0ARklOEnoDjVUcti-k6QVY', 0, 'fJBeKYgCcCY:APA91bGSLw5WQ-mueJBG-hPH0k7XL2ffpIr3qgcu6G7lE8gnodb9RKWGHOKhYNZ6SCgPUGXaqPpxEo2poKRRkDdmfua8oPyStej97CN8Q5sLq9cUZ47iNCwa8KbFU2sEoFsO3wOxMPpD'),
(277, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTYzMWRlZGE3ODgi.DiNbjDEea3Bi-QKjtMgXEGyY-Kro2G_riaGky_-8LnA', '1575453534', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTYzMWRlZGE3Zjgi.KIPztZJD_Q9Ot2RjmyBok0p5ja2pGXmmASy5nYJ1bS8', 0, ''),
(279, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTYzOWVjM2M5YzUi.9UC2HhsfXZoMDlQcyV6F7gu7E0GT0nIADBaZjxMgMjs', '1575455596', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTYzOWVjM2NhMzIi.F8N1PrEOBb7xZ4GrOeN2E0pOMsxUl5t_vK3se4Kpn-w', NULL, NULL),
(284, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTc1YmMxMzNhMjki.xZkg5y3BJAUY_TBqtm_xnazbO3AWmiaI2yBztS2asAc', '1575529793', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTc1YmMxMzNhZjIi.6U9cHhly9MQMUiQGtzoip2ixfC4xa8GRceOcQ54S4H4', NULL, NULL),
(288, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTdhNDk3ZDQ5MWIi.NQMZK49jnVqqOxjh4b8Mnf9KESHqjU1NJ4RrubxfQOg', '1575548439', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTdhNDk3ZDQ5YjAi.zLZ6TUyl9zM21XpK4ZpF0ZYCIZFHl7rMKx4Xd6cgGBo', NULL, NULL),
(304, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZWEyYWVmZDExMDci.q1nuzh4OR_iDaCwba25tN0hm1jOVE3Hqyv7kECeNmE8', '1575713903', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZWEyYWVmZDExNzQi.qGvMYMs77z_IYJyp5EPkxIOlqik_nHBCTLoycVOEkSI', 0, 'dWp1NpQXu5c:APA91bGApvmcbTKKCC6PoaOKFwxl3sz2oyxWXhlW3tpgxvV307MF1EMx42L6L5dsw_ZzRPpEjiIBkt-THpp7_fjBnjYUjjngxtcWazqNXTHiol719JOmRad6TbXfOvm1pi0ojeDi3O-Q\r\n'),
(366, '', '', 124, '', NULL, NULL),
(394, '', '', 140, '', NULL, NULL),
(396, '', '', 141, '', NULL, NULL),
(397, '', '', 141, '', NULL, NULL),
(398, '', '', 142, '', NULL, NULL),
(399, '', '', 141, '', NULL, NULL),
(400, '', '', 142, '', NULL, NULL),
(401, '', '', 141, '', NULL, NULL),
(402, '', '', 141, '', NULL, NULL),
(403, '', '', 141, '', NULL, NULL),
(404, '', '', 140, '', NULL, NULL),
(405, '', '', 141, '', NULL, NULL),
(406, '', '', 141, '', NULL, NULL),
(407, '', '', 141, '', NULL, NULL),
(408, '', '', 142, '', NULL, NULL),
(409, '', '', 142, '', NULL, NULL),
(410, '', '', 140, '', NULL, NULL),
(411, '', '', 142, '', NULL, NULL),
(412, '', '', 141, '', NULL, NULL),
(413, '', '', 142, '', NULL, NULL),
(414, '', '', 142, '', NULL, NULL),
(415, '', '', 141, '', NULL, NULL),
(416, '', '', 142, '', NULL, NULL),
(417, '', '', 142, '', NULL, NULL),
(418, '', '', 142, '', NULL, NULL),
(419, '', '', 142, '', NULL, NULL),
(420, '', '', 142, '', NULL, NULL),
(421, '', '', 142, '', NULL, NULL),
(422, '', '', 143, '', NULL, NULL),
(423, '', '', 144, '', NULL, NULL),
(424, '', '', 145, '', NULL, NULL),
(425, '', '', 146, '', NULL, NULL),
(426, '', '', 142, '', NULL, NULL),
(427, '', '', 142, '', NULL, NULL),
(428, '', '', 142, '', NULL, NULL),
(429, '', '', 142, '', NULL, NULL),
(430, '', '', 142, '', NULL, NULL),
(431, '', '', 142, '', NULL, NULL),
(432, '', '', 140, '', NULL, NULL),
(433, '', '', 140, '', NULL, NULL),
(434, '', '', 140, '', NULL, NULL),
(435, '', '', 142, '', NULL, NULL),
(436, '', '', 142, '', NULL, NULL),
(437, '', '', 141, '', NULL, NULL),
(438, '', '', 142, '', NULL, NULL),
(439, '', '', 147, '', NULL, NULL),
(440, '', '', 142, '', NULL, NULL),
(441, '', '', 142, '', NULL, NULL),
(442, '', '', 142, '', NULL, NULL),
(443, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZmI3YWUxMGE0ODUi.xk6Wsg7zlpaGD4VRsykEnytN5jWQ6nYB4SLZFmIk4i0', '1576848481', 148, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZmI3YWUxMGE3MDMi.EXdtb9eU7uBu-rxmgXAdWytnbYfdB4BzSXqdkUxm9mM', 1, 'fB429ifaaDc:APA91bHDLW8fz9_dL3YPseQI5jgld-zMbj01-VN55X59kqo_dj5wForqcgDxbxMiHcS19cTfwskv9ka2btWn4GubqQQ39UMLVg_zMbkLrwxMNWzapJh9iHy_V1ztk5NM482t5Zx8x0eo'),
(444, '', '', 142, '', NULL, NULL),
(445, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZmI3ZmExMThiZWEi.ymwsXeqMSuBzUHX9tY63O7W3fRfipK0YHCE_N5vbWBk', '1576849697', 149, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZmI3ZmExMThjNzIi.08dz_JI9t2Pxy83aV0HsKRrQt-xE7ylqSMFwjBpvcm8', 1, 'fv29IhrZw88:APA91bFge-VyYkyIqGXEZj5n6ITovMd7UDpvZVo6MiF2rG0E97ftlNFa7rSPX5FmL-o-S0aYQ4LXBd4i-3uo7FDfEfFTuP-bxFSe43RFfhN3vPxHyjV-UrJ6FC6XVwCfG86ziwjWpL5i'),
(446, '', '', 142, '', NULL, NULL),
(447, '', '', 142, '', NULL, NULL),
(448, '', '', 142, '', NULL, NULL),
(449, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZmJhNjczNzllYzki.qgA4sTa15uWUMwGUnQNcHGcEz-5dB-G6IVUspy0Svb4', '1576859635', 140, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZmJhNjczNzlmMTIi.IkJRLcWELVtzm8SOFu6gfepvcBkw2LntNMN5F29ZpDI', 1, 'cE6golVTnF4:APA91bGs3bwujlU2PiSyfhydNHsFoFaQfY3H6wDSEy0Yq7Hra_Nc8-R3AIrmUPHpkPPqh0aFNU0_y3D4W-MozkvceO9KlJJsK8bqvVzuOkFsbk1XF4k5oikbEhY3GIQW7eRbAJNc3wFO'),
(450, '', '', 142, '', NULL, NULL),
(451, '', '', 142, '', NULL, NULL),
(452, '', '', 142, '', NULL, NULL),
(453, '', '', 142, '', NULL, NULL),
(454, '', '', 142, '', NULL, NULL),
(455, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZmUxMWY2NWFmMDki.7pt4wXM8Ccs_2LP2a_lJHrMSA5rKTlbMBeLbD9I8rE8', '1577018230', 141, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZmUxMWY2NWFmN2Ui.6xVHWW3HM0NzPyP0BkhiFQzQRt59nSI5wE2m96M0qDo', 0, 'fOekufyea3E:APA91bEnrV2nPaGL65THmDUDJNIzC5hstQvIRHEmWC0Wz2G3jnev4g3OHcx8PVM8k_tGRsmjNV4S4p7yuMDv-ZtGMhjoqm3Ie2fSaHAWf-VBuluqjU9pB1ysIlSmyeOgZIeVaZxMLdv6'),
(456, '', '', 142, '', NULL, NULL),
(457, '', '', 142, '', NULL, NULL),
(458, '', '', 147, '', NULL, NULL),
(459, '', '', 142, '', NULL, NULL),
(460, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZmUxMjA2NjU4Yjci.CNebkfaBcSC_zNFj4pI1ZXBi0-aGk1ZsgxjTGTXc3O0', '1577018246', 142, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZmUxMjA2NjU5Mzgi.vbmrV_a1FMOPVfQIq195C7hHKx8_EqvbTeNMr2vK2n4', 0, 'fOekufyea3E:APA91bEnrV2nPaGL65THmDUDJNIzC5hstQvIRHEmWC0Wz2G3jnev4g3OHcx8PVM8k_tGRsmjNV4S4p7yuMDv-ZtGMhjoqm3Ie2fSaHAWf-VBuluqjU9pB1ysIlSmyeOgZIeVaZxMLdv6'),
(461, '', '', 147, '', NULL, NULL),
(462, '', '', 147, '', NULL, NULL),
(463, '', '', 147, '', NULL, NULL),
(464, '', '', 147, '', NULL, NULL),
(465, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlMDBiYjIzNmRkNmQi.hkH91fNAaxIVfz4CgnJvpoWg2l8rIku1mCUm1FkSn2c', '1577192611', 147, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlMDBiYjIzNmRlNWIi.QAntfQRLwQefw-_uTk-R3kRZ-xdDtxlcSqw0X8qhvQQ', 0, 'cGmiPfiia5w:APA91bHWrepY3xk5B_nd8S-kEFLEk07bm-AniBQ03Ukk1uXHJHSj186bAiehhuATMzpJSRk1d_4L4XWazUOJhS99dhu37aYRuE8GBTk5_476D6h8Tr_7LuYv5-bKb8-XvKdt68y_roj7');

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
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coins` int(11) DEFAULT '0',
  `is_used_reference` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `verify_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verify` int(1) NOT NULL DEFAULT '0',
  `logged_via_fb` int(1) NOT NULL DEFAULT '0',
  `notification_status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `date_of_birth`, `mobile_number`, `email`, `password`, `uuid`, `image`, `coins`, `is_used_reference`, `created_at`, `updated_at`, `verify_code`, `verify`, `logged_via_fb`, `notification_status`) VALUES
(30, 'super22', 'Super22', 'Admin22', -1105875963, '+37499099247', 'kakaka@gmail.com12222', 'c9cc24ffa63b25bb52b9d5fa288c2921a5190acd2ad461e2ece7b7d74af0fa53c86b783a066fc1ad3694313345702e69f57d70a597f7fbbf78dfc957d3bcdea9', '16f0e2-890d1t', 'Logo_1573544631_1428740283.png', 136, 0, '2019-10-01 03:14:51', '2019-10-01 03:14:51', '', 1, 0, 1),
(124, 'zuza', 'zax', 'csdvsed', -1105094429, '+37495777448', 'zara.tunyan@gmail.com43', 'b0412597dcea813655574dc54a5b74967cf85317f0332a2591be7953a016f8de56200eb37d5ba593b1e4aa27cea5ca27100f94dccd5b04bae5cadd4454dba67d', '16f0e3-6c9dde', 'User_default.png', 0, 0, '2019-12-16 10:17:49', '2019-12-16 10:17:49', '0', 1, 0, 1),
(140, 'zara', 'zara', 'tati', 1576579222686, '+37495777443', 'zara.tunyan@gmail.com', 'b0412597dcea813655574dc54a5b74967cf85317f0332a2591be7953a016f8de56200eb37d5ba593b1e4aa27cea5ca27100f94dccd5b04bae5cadd4454dba67d', '16f137-228762', 'User_default.png', 22, 0, '2019-12-17 10:40:46', '2019-12-17 10:40:46', '0', 1, 0, 1),
(141, 'testuser', 'user', 'user', 1008532800, '+37495616207', 'user@mail.ru', '125d6d03b32c84d492747f79cf0bf6e179d287f341384eb5d6d3197525ad6be8e6df0116032935698f99a09e265073d1d6c32c274591bf1d0a20ad67cba921bc', '16f138-07af3a', 'User_default.png', 6, 0, '2019-12-17 10:56:24', '2019-12-17 10:56:24', '0', 1, 0, 1),
(142, 'armen', 'Armen', 'Mkrtchyan ', 598305600, '+37495616200', 'armen@mail.ru', '2f078ff4f34a3c1d59a3dd1eac85e629c92800814bb442e81aa366849e59f0088b880af3ab2e1ff1dfc2e5c15217044bec27b61a15d259a7fcb413e5067aa5e8', '16f138-9b3995', 'Logo_1576830813_898417965.jpeg', 799940, 0, '2019-12-17 11:06:29', '2019-12-17 11:06:29', '0', 1, 0, 1),
(143, 'alligator', 'parsec', 'aghabekyan', 758754000, '+37499099249', 'fdfd@gmail.com', '7f3e318ee2905f855404a707bc0324d588e1515bae3b4475038c5b8e34d94731b1cf3ed1266244cd081237d547d5a149f1fdf28863d11b2ef68c37e0b5a4e0d0', '16f142-f92de3', 'User_default.png', 0, 0, '2019-12-17 14:07:39', '2019-12-17 14:07:39', '0', 1, 0, 1),
(144, 'popcorn', 'Vatche', 'Panosyan', 630705600, '+374990992465', 'datahs@gmail.com', '7f3e318ee2905f855404a707bc0324d588e1515bae3b4475038c5b8e34d94731b1cf3ed1266244cd081237d547d5a149f1fdf28863d11b2ef68c37e0b5a4e0d0', '16f143-1cd067', 'User_default.png', 0, 0, '2019-12-17 14:10:05', '2019-12-17 14:10:05', '0', 1, 0, 1),
(145, 'Pnduk', 'GeV', 'Mihrabyan', -347428800, '+37499099248', 'davkdg@gmail.com', 'a7e41d754033a511f81ca6cba343a7c60bc166ff3315894cc6387788eabd5dd7c18be1607cae7a90a1f4e8782b93819b15d950c98230602f394dfd9b16a9eaff', '16f143-367ec9', 'User_default.png', 0, 0, '2019-12-17 14:11:50', '2019-12-17 14:11:50', '0', 1, 0, 1),
(146, 'localhost', 'Dav', 'key', 503611200, '+374645386458', 'dfse@gmail.com', '756a1475d9e583cdb80920b6350f5c8e31c38d444e1b584f05640492933f6049de47172c577896f28c3e9ad17799eae5af52e5c505297eff55b8c205ddf38fcd', '16f143-8c034d', 'User_default.png', 4, 0, '2019-12-17 14:17:41', '2019-12-17 14:17:41', '0', 1, 0, 1),
(147, 'miledaoun', 'miled', 'aoun', 1261173600, '+96171576202', 'miled@nova4lb.com', '0dd3e512642c97ca3f747f9a76e374fbda73f9292823c0313be9d78add7cdd8f72235af0c553dd26797e78e1854edee0ae002f8aba074b066dfce1af114e32f8', '16f1e2-e484f5', 'Logo_1576759528_800525868.jpeg', 0, 0, '2019-12-19 12:42:27', '2019-12-19 12:42:27', '0', 1, 0, 0),
(148, 'lichaa', 'lichaa', 'tarabay', 1575379620983, '+96170455133', 'lichaa@nova4lb.com', '0dd3e512642c97ca3f747f9a76e374fbda73f9292823c0313be9d78add7cdd8f72235af0c553dd26797e78e1854edee0ae002f8aba074b066dfce1af114e32f8', '16f1e5-7c1430', 'User_default.png', 0, 0, '2019-12-19 13:27:45', '2019-12-19 13:27:45', '0', 1, 0, 1),
(149, 'fhfj', 'bdbd', 'jdjdn', 1576763267537, '+244989595', 'cbcbbf@nddn.hfb', 'b0412597dcea813655574dc54a5b74967cf85317f0332a2591be7953a016f8de56200eb37d5ba593b1e4aa27cea5ca27100f94dccd5b04bae5cadd4454dba67d', '16f1e6-a5d66e', 'User_default.png', 0, 0, '2019-12-19 13:48:04', '2019-12-19 13:48:04', '0', 1, 0, 1);

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
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=278;

--
-- AUTO_INCREMENT for table `claim_your_business`
--
ALTER TABLE `claim_your_business`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coin_offers`
--
ALTER TABLE `coin_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `featured_offers`
--
ALTER TABLE `featured_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `more_infos`
--
ALTER TABLE `more_infos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `regions_coordinates`
--
ALTER TABLE `regions_coordinates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=466;

--
-- AUTO_INCREMENT for table `used_offers`
--
ALTER TABLE `used_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `user_loyalty_card`
--
ALTER TABLE `user_loyalty_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
