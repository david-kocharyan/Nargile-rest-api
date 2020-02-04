-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2020 at 01:58 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nargile`
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
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `first_name`, `last_name`, `mobile_number`, `email`, `role`, `password`, `active`, `logo`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'Super', 'Admin', '000000000000', 'superadmin@gmail.com', 'superAdmin', '5ebcb2d1d6ad03d09e4cef68244c5aea169d5d18339190de68b168acdb0d0d8aa54af67facdea0c00945a7b9483334dc75d91f2023ba531f83034c6aea33fc8a', '1', 'User_default.png', '2019-08-28 19:58:54', '2019-08-28 19:58:54'),
(32, 'admin1994', 'David', 'Kocharyan', '+37499099248', 'admisdasdan@gmail.com', 'admin', 'c9cc24ffa63b25bb52b9d5fa288c2921a5190acd2ad461e2ece7b7d74af0fa53c86b783a066fc1ad3694313345702e69f57d70a597f7fbbf78dfc957d3bcdea9', '1', 'User_default.png', '2019-10-23 21:26:55', '2019-10-23 21:26:55');

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
  `status` int(11) DEFAULT 1
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
  `status` int(1) DEFAULT 1
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
(268, 91, 66, 1575293397, 1);

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
  `status` int(2) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `coin_offers`
--

CREATE TABLE `coin_offers` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `valid_date` int(11) DEFAULT 0,
  `description` varchar(255) DEFAULT '',
  `count` int(11) NOT NULL DEFAULT 1,
  `status` int(11) DEFAULT 1
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
(67, 4, 70, 1577253600, 'Keif is offering 1 freenargile in Achrafieh branch.', 1, 1);

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
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `restaurant_id`, `status`) VALUES
(21, 30, 17, 1),
(22, 54, 1, 1),
(23, 31, 17, 0),
(24, 52, 1, 0),
(25, 31, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `featured_offers`
--

CREATE TABLE `featured_offers` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
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
  `status` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `from_id`, `to_id`, `status`) VALUES
(1, 30, 31, 2),
(3, 54, 31, 1),
(4, 34, 31, 1),
(5, 35, 31, 1),
(6, 30, 47, 1),
(7, 37, 31, 1),
(8, 51, 31, 1),
(9, 37, 54, 1),
(10, 91, 54, 1),
(11, 91, 31, 1),
(12, 91, 33, 1),
(13, 91, 34, 1),
(14, 91, 35, 1),
(15, 91, 40, 0),
(16, 30, 38, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hour_offers`
--

CREATE TABLE `hour_offers` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
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
  `status` int(1) NOT NULL DEFAULT 1
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
  `status` int(11) DEFAULT 1
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
  `status` int(2) DEFAULT 1
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
  `body` varchar(255) CHARACTER SET utf8 NOT NULL,
  `click_action` varchar(255) CHARACTER SET utf8 NOT NULL,
  `coins` int(255) DEFAULT NULL,
  `action_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `user_id`, `body`, `click_action`, `coins`, `action_id`, `status`, `created_at`) VALUES
(13, 34, 'test test Sent You 15 Coins', 'coin_request', 15, 91, 1, '2020-01-24 15:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `offers_click`
--

CREATE TABLE `offers_click` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offers_click`
--

INSERT INTO `offers_click` (`id`, `user_id`, `restaurant_id`, `type`) VALUES
(1, 91, 1, 0),
(2, 91, 1, 1),
(3, 91, 1, 0),
(4, 91, 1, 1),
(5, 91, 1, 1),
(6, 91, 1, 1),
(7, 91, 1, 1),
(8, 91, 1, 0),
(9, 91, 1, 0),
(10, 91, 1, 1),
(11, 91, 1, 0),
(12, 91, 1, 1),
(13, 91, 1, 1),
(14, 91, 1, 1),
(15, 91, 1, 1),
(16, 91, 1, 0),
(17, 91, 2, 0),
(18, 91, 1, 0),
(19, 91, 1, 0),
(20, 91, 1, 0),
(21, 91, 1, 0);

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
(50, 91, 12, 3, 3, 3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`, `status`) VALUES
(1, 'Dist_1', 1),
(2, 'Dist_2', 1),
(3, 'Dist_3', 1);

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

--
-- Dumping data for table `regions_coordinates`
--

INSERT INTO `regions_coordinates` (`id`, `region_id`, `lat`, `lng`) VALUES
(1, 1, '33.90139811340439', '35.48845011136473'),
(2, 1, '33.90322438165048', '35.48017469293211'),
(3, 1, '33.90001867246711', '35.469954613647474'),
(4, 1, '33.898962999478414', '35.47907361647344'),
(5, 2, '33.8816269', '35.52505689999998'),
(6, 2, '33.88894', '35.50536599999998'),
(7, 2, '33.88710532557189', '35.49465550793457'),
(8, 2, '33.883133', '35.48446000000001'),
(9, 2, '33.880384783154085', '35.505015942065484'),
(10, 3, '33.88412081911569', '35.50111013791502'),
(11, 3, '33.89143370533573', '35.48141923791502'),
(12, 3, '33.892449005525734', '35.46916379345703'),
(13, 3, '33.885626875092', '35.46051323791505');

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
  `status` int(10) DEFAULT 1,
  `rate` varchar(255) DEFAULT '0',
  `admin_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `area_id`, `logo`, `phone_number`, `type`, `address`, `lat`, `lng`, `status`, `rate`, `admin_id`) VALUES
(1, 'Cafe Em Nazih', 23, 'Logo_1569932559_1320868044.jpg', '9611745442', 'Cafe', 'Saifi Urban Gardens, Pasteur Street', '33.896025', '35.516406', 1, '4.5', 32),
(2, 'Abo Waseem', 23, 'Logo_1569932569_1241077901.jpg', '9611745442', 'Resto-Cafe', 'Main Street, Hamra', '33.896189', '35.477883', 1, '0', 32),
(3, 'Toot Beirut', 23, 'Logo_1569932577_1638295637.jpg', '9611756166', 'Restaurant', 'Makdessi Street, Facing Liban Post', '33.896447', '35.482184', 1, '0', NULL),
(4, 'Barjees Cafe', 23, 'Logo_1569932588_1476692797.jpg', '9611745356', 'Cafe', 'Main Street, Hamra', '33.896320', '35.477650', 1, '0', NULL),
(5, 'Dar Al Sultani', 23, 'Logo_1569932610_1500670266.jpg', '9611741466', 'Restaurant', 'Sadat Street', '33.896430', '35.477017', 1, '0', 32),
(6, 'Fawzi Burj Al Hamam ', 23, 'Logo_1569932623_526565905.jpg', '9611741910', 'Restaurant', 'Golden Tulip Seranada Hotel, Abdel Aziz Street', '33.896328', '35.483972', 1, '0', NULL),
(7, 'Bliss Hall', 23, 'Logo_1569932633_1178099924.jpg', '9611362232', 'Cafe', 'Bliss Street, Near Bank Audi', '33.898656', '35.477467', 1, '0', NULL),
(8, 'Work Lounge', 23, 'Logo_1569932644_1813063138.jpg', '9611742428', 'Resto-Cafe', 'Badr Plaza, Leon Street, Next to the Lebanese American University', '33.894041', '35.478446', 1, '0', NULL),
(9, 'Abu Naim', 23, 'Logo_1569932651_345754676.jpg', '9611750480', 'Restaurant', 'Picadelly Street', '33.895294', '35.483217', 1, '0', NULL),
(10, 'Duke Eatery & Cafe', 24, 'Logo_1569932668_1705152190.jpg', '9611745442747', 'Cafe', 'Main Street', '33.895419', '35.484382', 1, '0', NULL),
(11, 'Al Nard', 24, 'Logo_1569932713_1126625444.jpg', '9611746067', 'Cafe', 'Gems Aparthotel, Makdessi Street', '33.896832', '35.478723', 1, '0', NULL),
(12, 'Good 2 Go', 24, 'Logo_1569932727_1817381857.jpg', '9611355883', 'Cafe', 'Makdessi Street, Next to GS', '33.896021', '35.485053', 1, '3', NULL),
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
(23, 'Alturki', 30, 'Logo_1569932856_665822247.jpg', '9617730693', 'Restaurant', 'Highway, Near Bank Audi, Saida', '33.560220', '35.379585', 1, '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `restaurants_images`
--

CREATE TABLE `restaurants_images` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 1
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
  `status` int(11) DEFAULT 1
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
  `review` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
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
(36, 38, 12, '25', '2020-02-04 10:19:20');

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
  `status` int(11) DEFAULT 1
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
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `region_id`, `image`, `link`, `start`, `end`, `status`) VALUES
(66, 1, 'Slider_1576670963_756685785.jpg', NULL, '2019-12-16 20:00:00', '2019-12-24 20:00:00', 1),
(67, 1, 'Slider_1576670988_616823962.jpg', 'aimtech.am', '2019-12-16 20:00:00', '2019-12-23 20:00:00', 1),
(68, NULL, 'Slider_1576671090_1545236810.jpg', 'aimtech.am', NULL, NULL, 1);

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
(162, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk5ODM1NTA3NWIi.BsTlAw-f8IO_JxWU41oHoip0cnuiIgnyThOJFMz6OcU', '1572530613', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk5ODM1NTA3ZDIi.VLSfX9xZ3WSyuhBo8xn01E1_9bdbPZ0UO50lWY212fI', NULL, NULL),
(163, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk5YWE4MTgzOWUi.0IX1LA2HQzzHkMl8Em_9fwPNvIDWgjGGL9c7Em4ihiw', '1572531240', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYjk5YWE4MTg0MWQi.Au99Npt4DqFIy-89WKhO9MeZx4C8Z7D5TBHTeAJTBa0', NULL, NULL),
(164, '', '', 55, '', NULL, NULL),
(167, '', '', 54, '', NULL, NULL),
(169, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzAxNWRjNGY3M2Yi.qcomZLeZ-W90iDft_t2uaVHeTbQh-1RKsxQ0gwWE064', '1572955996', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzAxNWRjNGY3ZDci.VByr3w8jeCmE0IvO5HMbBm6zrH5wl7umuaEJLOepgIY', NULL, NULL),
(170, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmJlNmI4YTUwMWUi.V7vewZxLPYjVL15EI02SurXKS3oFypvQ7FnICRXOQQo', '1572681784', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmJlNmI4YTUwYTUi.NhbzSyDLmDxl6S429r9ESTXrd37lTsjfWmGNdFzuB0o', NULL, NULL),
(171, '', '', 31, '', NULL, NULL),
(172, '', '', 31, '', NULL, NULL),
(173, '', '', 31, '', NULL, NULL),
(174, '', '', 31, '', NULL, NULL),
(175, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmM4ZDY0ZDM4Mzgi.tGTOsipLdVCPFjngKRqc5PJKAR6RjmYoRmLlkahWbuc', '1572724452', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYmM4ZDY0ZDM5NTIi.FOypiAvNn9UnarxDx5dOhlpqHlSPLfCAFJO545sEPTE', NULL, NULL),
(176, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDNiMmU4MWQzYWUi.uyRql_ynXlz1KezTvGZnrPX6UM-iIhatAdSjT62XNJg', '1574241384', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDNiMmU4MWQ0Mjki._JwOhC2tFaJ5ItjE2pqoOGjEKfzx-0uyIjVEpQTFlt4', NULL, NULL),
(177, '', '', 54, '', NULL, NULL),
(178, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzAyNjJjNDgzOGUi.XKlP1o2biCy752UR-XyOczjKqBIGRPHt5qsKtDBxCGo', '1572960172', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzAyNjJjNDg0MTYi.Piks7845wo4m6-5kMpS0qOXlkclo0_gUgdstpuqUodg', NULL, NULL),
(179, '', '', 55, '', NULL, NULL),
(180, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZGVjNzFkMmI4NGYi.U76bIx-LK6Hzspilfdsu-kCJv5p7Y7xngwa_HZAmfyM', '1574967453', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZGVjNzFkMmI4ZDQi.TK0Eh8VTiiXfFMALB5-hV8RvQqxg_wynJdo4GyNHqcY', NULL, NULL),
(181, '', '', 54, '', NULL, NULL),
(182, '', '', 54, '', NULL, NULL),
(183, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzgzMzk0MTAzMjQi.5oKCYX1FODgY4NIPktUma2RRqQaElVwZP5gegk9GHeE', '1573487892', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkYzgzMzk0MTA0NGEi.AFkFUV0g5ZwhVigI__XFJBqXEAV6Y4wLWfQVUPXytgU', NULL, NULL),
(184, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZGQ1MzQ4OTI3MTki.dtcjFFeCqZZGHJagic5pRdLX-DIjW0NnkbmlQnl6upc', '1574872264', 57, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZGQ1MzQ4OTI3OWMi.eIicjpXqUwGcLFTisKQO-c1LQ44y4W9PqiHbA1RyZ_g', NULL, NULL),
(185, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2E2MjY5ODkyYmEi.WtJg4alsF4wWZKC2cdes2GiSevhc_0USuE6bg0L3HlM', '1573630953', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2E2MjY5ODkzM2Mi.BPto1wpLzy0PX-TE2Xpr6-ECnC9MDXg4KhQj36YxkHk', NULL, NULL),
(186, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZTUwYzlhMTMi.EdzvHIj0YLqw6fqMVcPBihJH0TA_Kp8DFVSORBSvqws', '1573744592', 30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZTUwYzlhODci.tP1ka1uBKz5Yt6FM9hQ6TD5ltG2kCfP_FlEg0q00Uik', NULL, NULL),
(187, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZTcwNjk3ZmEi.0aZIiQyAY6zwT2vpTvkmx9hLWL7L3pkMDBhSAWZghlM', '1573744624', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZTcwNjk4NzYi.SlH1n2ep_NWf5sBtIu_Ok_ybHQB_pVME9D79fi2RZW4', NULL, NULL),
(188, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZmY0MzNlZmIi.hET90cy4OJ6tRZEP1Hfv_QiYua_SYWAEw2W5y4mzeDs', '1573745012', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkY2MxZmY0MzNmNmIi.5AME2hJdiRcfmlE05-a21HgnP-PpeY2xNVOcrWjFsd4', NULL, NULL),
(189, '', '', 54, '', NULL, NULL),
(190, '', '', 54, '', NULL, NULL),
(191, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDI2N2U3OTcwMTci.dkH9dsUf7JoeK6QiP9oEOBtaS_HAzSW6tau7ni9fvTM', '1574156647', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDI2N2U3OTcwOGMi.72-PZiNZ6LpvbOjnuQytOhS9e3kE4536QAiOCgfcXsw', NULL, NULL),
(192, '', '', 54, '', NULL, NULL),
(193, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDUzOWRjOTQwYjEi.BFgH6eTZQCuSgHYYzxrqntuHEeDkYhx-uBIg_FStCC4', '1574341468', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDUzOWRjOTQxYmIi.m73q0dGTVnsVKBxOIsnN26iJvarT3FdWB6DlILP619c', NULL, NULL),
(194, '', '', 54, '', NULL, NULL),
(195, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDQ0NTg1MWIyNmMi.ryu6G5Xc0EEaZHt-nfIoZwnaSaJJG-cCYHcG2wW53SE', '1574278917', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDQ0NTg1MWIyZDIi.FhyN9kPSLOrxp-JHRgzjmeO85fUD8hPWyGW9GpJtEAA', NULL, NULL),
(196, '', '', 54, '', NULL, NULL),
(198, '', '', 54, '', NULL, NULL),
(199, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDRlNTBjMGRkZDUi.nYEazbm0AergPELUJy7_6dGZOVqlfsUjdpQOthvmclo', '1574319756', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDRlNTBjMGRlNDgi.ni3Xfei8QKGt4myAR1Pk-sqvgercvFlZ5inHNsDMx8w', NULL, NULL),
(201, '', '', 54, '', NULL, NULL),
(202, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDUwNzYwOWUzNDMi.4uoFDmR5RTnPf27gIs7VyTJp-KCAejfNVtUZdE06PUM', '1574328544', 52, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDUwNzYwOWUzYzci.tdT0AgRRjRl6upuwYL8AHAjgFt8FPlExorOzRcQPBJc', NULL, NULL),
(203, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDUyM2VjNWE1ODIi.abNkqZ6_0MPCD-MW3fWd3NXs42a4XiojbysYkl0CQOM', '1574335852', 52, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDUyM2VjNWE1ZjYi.yeip0RWoaKzcuWdTh14jY2RIIru_P97hh-oGW6eyOv0', NULL, NULL),
(204, '', '', 54, '', NULL, NULL),
(205, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDUzZTFhMzZjZTki.FEd0aXmaIGBsb5XtyUR-6mCeHiPHg1qSygOnK_WPFWY', '1574342554', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDUzZTFhMzZkNjki.nvHQsg5LcVhMyPnjvQ8KZHPDqreqBXyvw7tqO69oEUg', NULL, NULL),
(206, '', '', 58, '', NULL, NULL),
(207, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDU0NzM1MmZjZDAi.SRCdKM94Pxl08KrHZwQnXgv-YzTIuhgJDJl7qa4WtRs', '1574344885', 58, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDU0NzM1MmZkNTQi.PJhP_wzmYvFr-tdnEr3UCMs_iTfP3NGnp2EEOEkCpUs', NULL, NULL),
(210, '', '', 54, '', NULL, NULL),
(211, '', '', 54, '', NULL, NULL),
(213, '', '', 54, '', NULL, NULL),
(214, '', '', 54, '', NULL, NULL),
(215, '', '', 54, '', NULL, NULL),
(223, '', '', 54, '', NULL, NULL),
(224, '', '', 54, '', NULL, NULL),
(225, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDZmODY5N2Y3ZDAi.HfeYccOxlaqOmjNYHqePqTBUz3-g96YooJURyYBcQZA', '1574455785', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZDZmODY5N2Y4NWIi.Vve88Ju0OCCS71zse0Sfo5oWGvHYRcSLrK2RXTQ6JXU', NULL, NULL),
(233, '', '', 54, '', NULL, NULL),
(241, '', '', 54, '', NULL, NULL),
(245, '', '', 54, '', NULL, NULL),
(246, '', '', 54, '', NULL, NULL),
(247, '', '', 31, '', NULL, NULL),
(248, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZGU4MDE2MWQwZjUi.44dHfqhODVqZpbvHyxTm4PaTTzRN41rB6B3hmVZdL8w', '1574949270', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZGU4MDE2MWQxNzEi.5pLi4RZY5J7PtSxiZfmWR1phK9ePs_Ltuf6AbDKrdPU', NULL, NULL),
(249, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZGUxODZmYjk4MWIi.kif4H57rmCvGdeIS93n7FVqX384qE422SnWZyDrza9M', '1574922735', 54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZGUxODZmYjk4OTYi.Ktn3NDdW_HdfJVhc1_4ZVuwGjSWve27UKi_va-HwMyA', NULL, NULL),
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
(264, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTRhZWFkMjhkNTIi.EWiuKnLJx30duN7Of4FWz4EIAjgoUtnS_ZCIeRcRZRo', '1575354413', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTRhZWFkMjhkYzIi.YziqaCztYAEeRkWh3BdWWHkquCTQjRxc3St38yx3Ww0', NULL, NULL),
(265, '', '', 91, '', NULL, NULL),
(266, '', '', 91, '', NULL, NULL),
(267, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTUxMTJhNTRlYWIi.pRhb6S6Yf4Bi7Hk9zmtqApDFmr55ly510d4Rh8bmdwY', '1575379626', 31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVkZTUxMTJhNTRmNDki.Xeda_ayAcz0mSNinM8i6ca9eUtxZnLwdlgRWRC3fiC0', NULL, NULL),
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
(293, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlMmFjOTIxY2I1NzIi.5PDahzL2YUbdd4i8iYH935zAkOGgXjHsh0CKEL1zVwA', '1579948705', 95, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlMmFjOTIxY2I1OTQi.L7JXE6TtUkjrN_kA6P1yOSs4j3LhvOWe2Hr0lkYFaGc', NULL, NULL),
(294, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlMmFjYzEwZWY4MjUi.UjxBBGza58B9TPCyb00hlAF05l7z25f6yLBAwbNPpZg', '1579949456', 95, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlMmFjYzEwZWY4NTMi.LG2DDZazVRdcgvHCjkHezmYbCoqPZagq2ctTmv40AYM', NULL, NULL),
(295, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlMmFkYTY5OWMyZDci.r7dhHJjj2_BVxrzIgT0LHIk1EgDpbuCXE-bBb3n1YhQ', '1579953129', 91, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.IjVlMmFkYTY5OWMyZmMi.NHrl6giLKCEpj9fN6zcB3pCB7Y1hJ6MPW9felWA7_QA', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `used_offers`
--

CREATE TABLE `used_offers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coin_offer_id` int(11) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT 1
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
(229, 91, 66, 1575292533, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` int(11) NOT NULL DEFAULT 1,
  `date_of_birth` bigint(20) DEFAULT NULL,
  `mobile_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uuid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coins` int(11) DEFAULT 0,
  `is_used_reference` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `verify_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verify` int(1) NOT NULL DEFAULT 0,
  `logged_via_fb` int(1) NOT NULL DEFAULT 0,
  `notification_status` int(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `gender`, `date_of_birth`, `mobile_number`, `email`, `password`, `uuid`, `image`, `coins`, `is_used_reference`, `created_at`, `updated_at`, `verify_code`, `verify`, `logged_via_fb`, `notification_status`) VALUES
(30, 'super22', 'Super22', 'Admin22', 1, -1105875963, '+656565651466622', 'kakaka@gmail.com12222', 'c9cc24ffa63b25bb52b9d5fa288c2921a5190acd2ad461e2ece7b7d74af0fa53c86b783a066fc1ad3694313345702e69f57d70a597f7fbbf78dfc957d3bcdea9', '', 'Logo_1576056444_1328044660.jpg', 135, 0, '2019-10-01 03:14:51', '2019-10-01 03:14:51', '', 1, 0, 0),
(31, 'zara', 'zara', 'tunyan', 0, 282322481, '695', 'zara.tunyan@gmail.com', '62670d1e1eea06b6c975e12bc8a16131b278f6d7bcbe017b65f854c58476baba86c2082b259fd0c1310935b365dc40f609971b6810b065e528b0b60119e69f61', '', 'Logo_1573999226_344756808.jpg', 209, 0, '2019-10-01 18:08:45', '2019-10-01 18:08:45', '', 1, 0, 1),
(33, 'adminSuper', 'Su', 'A', 1, -1105930800, '+656565651466622s', 'kakaka@gmail.com12222s', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '', 'User_default.png', 115, 0, '2019-10-02 14:31:04', '2019-10-02 14:31:04', '', 1, 0, 1),
(34, 'user', 'developer', 'develop', 0, 1574233377, '876767', 'test@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 531, 0, '2019-10-02 16:06:48', '2019-10-02 16:06:48', '', 1, 0, 1),
(35, 'testuser', 'test', 'test', 1, 1574233377, '846464', 'testuser@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, 0, '2019-10-02 16:14:45', '2019-10-02 16:14:45', '', 1, 0, 1),
(36, 'usertest', 'test', 'test', 1, -1105930800, '9467646', 'testtest@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, 0, '2019-10-02 16:38:14', '2019-10-02 16:38:14', '', 1, 0, 1),
(37, 'MiledAoun15700188621825521286', 'Miled', 'Aoun', 1, 787233800, '', 'miled.ha21@gmail.com', '1570018862?1518581949', '', 'User_default.png', 0, 0, '2019-10-02 17:21:02', '2019-10-02 17:21:02', '', 1, 0, 1),
(38, 'miles', 'miled', 'sounds', 1, 787233800, '111111', 'aaa@aaa.aaaa', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '', 'User_default.png', 0, 0, '2019-10-02 17:22:21', '2019-10-02 17:22:21', '', 1, 0, 1),
(39, 'ttt', 'ttt', 'ttt', 1, 787233800, '45345345', 'tttt@mail.ryu', '99f97d455d5d62b24f3a942a1abc3fa8863fc0ce2037f52f09bd785b22b800d4f2e7b2b614cb600ffc2a4fe24679845b24886d69bb776fcfa46e54d188889c6f', '', 'User_default.png', 0, 0, '2019-10-04 15:08:08', '2019-10-04 15:08:08', '', 1, 0, 1),
(40, 'ggg', 'gggg', 'gggg', 1, 787233800, '656565', 'tatadav94@gmail.com', '2ee7a30c404a385efd5c8bda07cd1899d8cbb32fa50250dae83d3a0564ea650af4d7a29018e84276ad815b27be8a0c2b518a8b79544364c981fe514dcf49b4a0', '', 'User_default.png', 14, 0, '2019-10-04 15:36:00', '2019-10-04 15:36:00', '', 1, 0, 1),
(41, 'cggg', 'cfff', 'cggg', 1, 787233800, '22888', 'yyy@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 4, 0, '2019-10-04 15:52:13', '2019-10-04 15:52:13', '', 1, 0, 1),
(46, 'dev', 'ddd', 'ddd', 1, 787233800, '7577557', 'test1111@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, 0, '2019-10-30 11:13:59', '2019-10-30 11:13:59', '', 1, 0, 1),
(47, 'devv', 'ddd', 'ddd', 1, 787233800, '444444', 'ttt@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, 0, '2019-10-30 11:20:02', '2019-10-30 11:20:02', '', 1, 0, 1),
(48, 'developer', 'ddd', 'ddd', 1, 787233800, '453453', 'rrr@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, 0, '2019-10-30 11:21:25', '2019-10-30 11:21:25', '', 0, 0, 1),
(49, 'adminSuperas', 'Super22as', 'Admin22asd', 1, 787233800, '+656565651466622sas', 'kakaka@gmail.com12222sas', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '', 'User_default.png', 0, 0, '2019-10-30 11:23:00', '2019-10-30 11:23:00', '', 0, 0, 1),
(50, 'adminSuperasas', 'Super22asas', 'Admin22asd', 1, 54545455422, '+656565651466622sasas', 'kakaka@gmail.com12222sasas', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '', 'User_default.png', 0, 0, '2019-10-30 11:24:10', '2019-10-30 11:24:10', '', 0, 0, 1),
(51, 'test data', 'test', 'test', 1, 1572852258, '745638745683', 'rrriiiii@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 8, 0, '2019-10-30 11:30:19', '2019-10-30 11:30:19', '', 0, 0, 1),
(52, 'miled', 'miled', 'aoun', 1, 1572436003576, '111111999999', 'miled@miled.miled', 'ba3253876aed6bc22d4a6ff53d8406c6ad864195ed144ab5c87621b6c233b548baeae6956df346ec8c17f5ea10f35ee3cbc514797ed7ddd3145464e2a0bab413', '', 'User_default.png', 0, 0, '2019-10-30 11:47:14', '2019-10-30 11:47:14', '', 0, 0, 1),
(53, 'testt', 'ttttt', 'fffff', 1, 1572292800, '2222', 'ffffff@mail.ru', 'ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff', '', 'User_default.png', 0, 0, '2019-10-30 12:09:52', '2019-10-30 12:09:52', '', 0, 0, 1),
(54, 'test1', 'test', 'test', 1, 282322481, '21212124', 'testtt@mail.ru', '125d6d03b32c84d492747f79cf0bf6e179d287f341384eb5d6d3197525ad6be8e6df0116032935698f99a09e265073d1d6c32c274591bf1d0a20ad67cba921bc', '', 'Logo_1574233402_631642950.jpeg', 90480, 0, '2019-10-30 12:16:38', '2019-10-30 12:16:38', '', 0, 1, 1),
(55, 'aaa', 'aaa', 'aaa', 1, 1572450967305, '000', 'ckymarra@gmail.com', 'd6f644b19812e97b5d871658d6d3400ecd4787faeb9b8990c1e7608288664be77257104a58d033bcf1a0e0945ff06468ebe53e2dff36e248424c7273117dac09', '', 'User_default.png', 0, 0, '2019-10-30 15:56:20', '2019-10-30 15:56:20', '', 0, 0, 1),
(57, 'VaskenBakkalian15733258621951140152', 'Vasken', 'Bakkalian', 1, 0, '', 'engerochvasken@hotmail.com', '1573325862?1717654752', '', 'User_default.png', 0, 0, '2019-11-09 18:57:42', '2019-11-09 18:57:42', '', 0, 0, 1),
(58, 'AliMansour15742581181230913061', 'Ali', 'Mansour', 1, 0, '', 'suprenoo@hotmail.com', '1574258118?1299941546', '', 'User_default.png', 0, 0, '2019-11-20 13:55:18', '2019-11-20 13:55:18', '', 0, 0, 1),
(91, 'test2', 'test', 'test', 1, 1480190400, '+37495616200', 'gggg@mail.ru', '125d6d03b32c84d492747f79cf0bf6e179d287f341384eb5d6d3197525ad6be8e6df0116032935698f99a09e265073d1d6c32c274591bf1d0a20ad67cba921bc', '16ead1-2f0de6', 'Logo_1575291073_1795403588.jpeg', 94, 0, '2019-11-27 13:35:30', '2019-11-27 13:35:30', '0', 1, 0, 1),
(92, 'davidd', 'd', 'a', 1, 587898, '+37499099248', 'Jindx@gmail.com', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '16f0e8-5a7759', 'User_default.png', 0, 0, '2019-12-16 09:58:52', '2019-12-16 09:58:52', '300544', 0, 0, 1),
(93, 'davidd', 'd', 'a', 1, 587898, '+37499099248', 'Jindx@gmail.com', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '16f0e8-409261', 'User_default.png', 0, 0, '2019-12-16 11:42:11', '2019-12-16 11:42:11', '148511', 0, 0, 1),
(94, 'davidd', 'd', 'a', 1, 587898, '+37499099248', 'Jindx@gmail.com', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', '16f0e8-4edd9c', 'User_default.png', 0, 0, '2019-12-16 11:43:10', '2019-12-16 11:43:10', '880529', 0, 0, 1),
(95, 'ԱրմենուհիՄկրտչյան5596', 'Արմենուհի', 'Մկրտչյան', 0, 0, '', 'mkrtchyanarmenuhi89@gmail.com', '1579862305?1984116375', '16fd72-1ac211', 'User_default.png', 0, 0, '2020-01-24 10:38:25', '2020-01-24 10:38:25', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_loyalty_card`
--

CREATE TABLE `user_loyalty_card` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user_loyalty_card`
--

INSERT INTO `user_loyalty_card` (`id`, `user_id`, `card_id`, `status`) VALUES
(4, 91, 11, 1),
(5, 91, 10, 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `featured_offers`
--
ALTER TABLE `featured_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `offers_click`
--
ALTER TABLE `offers_click`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=296;

--
-- AUTO_INCREMENT for table `used_offers`
--
ALTER TABLE `used_offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

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
