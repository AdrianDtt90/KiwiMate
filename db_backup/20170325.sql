-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 26, 2017 at 02:50 AM
-- Server version: 10.1.20-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id889704_kiwimate`
--
DROP DATABASE IF EXISTS `id889704_kiwimate`;
CREATE DATABASE IF NOT EXISTS `id889704_kiwimate` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id889704_kiwimate`;

-- --------------------------------------------------------

--
-- Table structure for table `buysells`
--

DROP TABLE IF EXISTS `buysells`;
CREATE TABLE `buysells` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `buysells`
--

INSERT INTO `buysells` (`id`, `title`, `date`, `content`, `contact`, `price`, `likes`, `comments`, `image`, `user_id`) VALUES
(1, 'Product1', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10154898164369884),
(3, 'Product3', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(4, 'Product4', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(5, 'Product5', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(11, 'lololo', '2017-03-25', 'Lolo', 'ol', 66, NULL, NULL, 'http://kiwimate.000webhostapp.com/uploads-post/1490462589529.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `user_id_1` bigint(20) DEFAULT NULL,
  `user_id_2` bigint(20) DEFAULT NULL,
  `user_id_sender` bigint(20) DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user_id_1`, `user_id_2`, `user_id_sender`, `text`, `image`, `time`) VALUES
(1, 10154898164369884, 10211296532584708, 10154898164369884, 'Hola como andas? =D', '', '2017-03-14'),
(2, 10211296532584708, 10154898164369884, 10211296532584708, 'Muy bueno vos amigo kiwi?? =D', '', '2017-03-14'),
(3, 10211296532584708, 10154898164369884, 10211296532584708, 'lalaaa', '', '2017-03-14'),
(4, 10211296532584708, 10154898164369884, 10211296532584708, 'lero lero!', '', '2017-03-14'),
(5, 10211296532584708, 10154898164369884, 10211296532584708, 'listoo', '', '2017-03-24'),
(6, 10211296532584708, 10154898164369884, 10211296532584708, 'notificacino! =D', '', '2017-03-21'),
(7, 10211296532584708, 10154898164369884, 10211296532584708, 'Otro mas! =D', '', '2017-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `region`) VALUES
(1, 'Alexandra', 'Otago'),
(2, 'Arrowtown', 'Otago'),
(3, 'Ashburton', 'Canterbury'),
(4, 'Auckland', 'Auckland'),
(5, 'Balclutha', 'Otago'),
(6, 'Blenheim', 'Marlborough'),
(7, 'Carterton', 'Wellington'),
(8, 'Christchurch', 'Canterbury'),
(9, 'Cromwell', 'Otago'),
(10, 'Dannevirke', 'Manawatu-Wanganui'),
(11, 'Darfield', 'Canterbury'),
(12, 'Dargaville', 'Northland'),
(13, 'Dunedin', 'Otago'),
(14, 'Eltham', 'Taranaki'),
(15, 'Featherston', 'Wellington'),
(16, 'Feilding', 'Manawatu-Wanganui'),
(17, 'Foxton Community', 'Manawatu-Wanganui'),
(18, 'Geraldine', 'Canterbury'),
(19, 'Gisborne', 'Gisborne'),
(20, 'Gore', 'Southland'),
(21, 'Greymouth', 'West Coast'),
(22, 'Greytown', 'Wellington'),
(23, 'Hamilton', 'Waikato'),
(24, 'Hawera', 'Taranaki'),
(25, 'Helensville', 'Auckland'),
(26, 'Hokitika', 'West Coast'),
(27, 'Huntly', 'Waikato'),
(28, 'Inglewood', 'Taranaki'),
(29, 'Invercargill', 'Southland'),
(30, 'Kaikohe', 'Northland'),
(31, 'Kaikoura', 'Canterbury'),
(32, 'Kaitaia', 'Northland'),
(33, 'Kapiti', 'Wellington'),
(34, 'Katikati Community', 'Bay of Plenty'),
(35, 'Kawerau', 'Bay of Plenty'),
(36, 'Kerikeri', 'Northland'),
(37, 'Levin', 'Manawatu-Wanganui'),
(38, 'Lincoln', 'Canterbury'),
(39, 'Mapua', 'Tasman'),
(40, 'Marton', 'Manawatu-Wanganui'),
(41, 'Masterton', 'Wellington'),
(42, 'Matamata', 'Waikato'),
(43, 'Morrinsville', 'Waikato'),
(44, 'Motueka', 'Tasman'),
(45, 'Napier-Hastings', 'Hawke`s Bay'),
(46, 'Nelson', 'Nelson'),
(47, 'New Plymouth', 'Taranaki'),
(48, 'Oamaru', 'Otago'),
(49, 'Opotiki', 'Bay of Plenty'),
(50, 'Otaki', 'Wellington'),
(51, 'Otorohanga', 'Waikato'),
(52, 'Oxford', 'Canterbury'),
(53, 'Paeroa', 'Waikato'),
(54, 'Pahiatua', 'Manawatu-Wanganui'),
(55, 'Palmerston North', 'Manawatu-Wanganui'),
(56, 'Picton', 'Marlborough'),
(57, 'Pukekohe', 'Auckland'),
(58, 'Putaruru', 'Waikato'),
(59, 'Queenstown', 'Otago'),
(60, 'Raglan', 'Waikato'),
(61, 'Rangiora', 'Canterbury'),
(62, 'Rolleston', 'Canterbury'),
(63, 'Rotorua', 'Bay of Plenty'),
(64, 'Snells Beach', 'Auckland'),
(65, 'Stratford', 'Taranaki'),
(66, 'Taumarunui', 'Manawatu-Wanganui'),
(67, 'Taupo', 'Waikato'),
(68, 'Tauranga', 'Bay of Plenty'),
(69, 'Te Anau', 'Southland'),
(70, 'Te Aroha', 'Waikato'),
(71, 'Te Kuiti', 'Waikato'),
(72, 'Te Puke Community', 'Bay of Plenty'),
(73, 'Temuka', 'Canterbury'),
(74, 'Thames', 'Waikato'),
(75, 'Timaru', 'Canterbury'),
(76, 'Tokoroa', 'Waikato'),
(77, 'Turangi', 'Waikato'),
(78, 'Waiheke Island', 'Auckland'),
(79, 'Waihi', 'Waikato'),
(80, 'Waihi Beach', 'Bay of Plenty'),
(81, 'Waimate', 'Canterbury'),
(82, 'Waipawa', 'Hawkes Bay'),
(83, 'Waipukurau', 'Hawkes Bay'),
(84, 'Wairoa', 'Hawkes Bay'),
(85, 'Waitara', 'Taranaki'),
(86, 'Waiuku', 'Auckland'),
(87, 'Wakefield', 'Tasman'),
(88, 'Wanaka', 'Otago'),
(89, 'Warkworth', 'Auckland'),
(90, 'Wellington', 'Wellington'),
(91, 'Westport', 'West Coast'),
(92, 'Whakatane', 'Bay of Plenty'),
(93, 'Whangamata', 'Waikato'),
(94, 'Whanganui', 'Manawatu-Wanganui'),
(95, 'Whangarei', 'Northland'),
(96, 'Whitianga', 'Waikato'),
(97, 'Winton', 'Southland'),
(98, 'Woodend', 'Canterbury'),
(99, '.Argentina', 'Pais'),
(100, '.Chile', 'Pais'),
(101, '.Uruguay', 'Pais');

-- --------------------------------------------------------

--
-- Table structure for table `comment_x_post`
--

DROP TABLE IF EXISTS `comment_x_post`;
CREATE TABLE `comment_x_post` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment_x_post`
--

INSERT INTO `comment_x_post` (`id`, `user_id`, `post_id`, `comment`, `image`, `date`) VALUES
(1, 10211296532584708, 23150, 'Que linda foto chicos! =D', '', '2017-03-15'),
(3, 10211296532584708, 23150, 'fachaaa =D', '', '2017-03-15'),
(4, 10211296532584708, 23149, 'weee =D', '', '2017-03-15'),
(5, 10211296532584708, 23148, 'JAjaja! =D', '', '2017-03-21'),
(6, 10154898164369884, 23148, 'Lalala!', '', '2017-03-21'),
(9, 10211296532584708, 23148, 'Que odna!', '', '2017-03-21'),
(10, 10211296532584708, 23152, 'Lalarelo', '', '2017-03-22'),
(11, 10211296532584708, 23148, 'Probando!', '', '2017-03-22'),
(12, 10211296532584708, 23148, 'otra!', '', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `content`, `contact`, `address`, `date`, `image`, `user_id`) VALUES
(1, 'Event1', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(2, 'Event2', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(3, 'Event3', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(4, 'Event4', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10154898164369884),
(10, 'lopo', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490466953555.jpg', 10211296532584708),
(11, 'lkmkl', 'ñl,', 'ñl,|ñl,|ñl,|', NULL, '2017-03-25', '', 10211296532584708),
(12, 'jjjj', NULL, NULL, NULL, '2017-03-25', '', 10211296532584708),
(13, 'kskKs', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490467528411.jpg', 10211296532584708),
(14, 'jjjjjj', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490467799324.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `user_id_1` bigint(20) DEFAULT NULL,
  `user_id_2` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `user_id_1`, `user_id_2`) VALUES
(14, 10211296532584708, 10154898164369884),
(15, 10154898164369884, 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
CREATE TABLE `hosts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `imagesProduct` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hosts`
--

INSERT INTO `hosts` (`id`, `title`, `place`, `content`, `contact`, `price`, `likes`, `comments`, `imagesProduct`, `user_id`) VALUES
(1, 'Host1', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(2, 'Host2', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(3, 'Host3', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(4, 'Host4', 'contenido 11', '3512056271', 'Tauranga', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(5, 'Host5', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `image_x_post`
--

DROP TABLE IF EXISTS `image_x_post`;
CREATE TABLE `image_x_post` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `image_x_post`
--

INSERT INTO `image_x_post` (`id`, `post_id`, `image`) VALUES
(12, 23135, 'http://kiwimate.000webhostapp.com/uploads-post/1489022865278.jpg'),
(13, 23136, 'http://kiwimate.000webhostapp.com/uploads-post/1489027068751.jpg'),
(14, 23137, 'http://kiwimate.000webhostapp.com/uploads-post/1489027356991.jpg'),
(15, 23138, 'http://kiwimate.000webhostapp.com/uploads-post/1489027484310.jpg'),
(16, 23139, 'http://kiwimate.000webhostapp.com/uploads-post/null'),
(24, 23147, ''),
(25, 23148, 'http://kiwimate.000webhostapp.com/uploads-post/1489029951449.jpg'),
(26, 23149, 'http://kiwimate.000webhostapp.com/uploads-post/1489059243799.jpg'),
(27, 23150, 'http://kiwimate.000webhostapp.com/uploads-post/1489150971912.jpg'),
(28, 23151, ''),
(29, 23152, '');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `type`, `date`, `content`, `contact`, `image`, `user_id`) VALUES
(1, 'Job1', 'Developer1', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(2, 'Job2', 'Developer2', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(3, 'Job3', 'Developer3', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(4, 'Job4', 'Developer4', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(5, 'Job5', 'Developer5', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(6, 'netbel sa', 'developer', '2017-03-24', 'Esese lalala', '35138283', 'http://kiwimate.000webhostapp.com/uploads-post/1490397229747.jpg', 10211296532584708),
(8, 'netbel sa', 'developer', '2017-03-24', '', '35138283', '', 10211296532584708),
(9, 'hoy apruebi', 'develop', '2017-03-24', 'Lalala lele fff', '27272', 'http://kiwimate.000webhostapp.com/uploads-post/1490397466828.jpg', 10211296532584708),
(22, 'porque porque', 'porque porque', '2017-03-25', 'porque porque', 'porque porque', '', 10211296532584708),
(23, 'jjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjj', '2017-03-25', 'jjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjj', '', 10211296532584708),
(24, 'olvidala de todo olvidala =D jaja', 'olvidala de todo olvidala =D jaja', '2017-03-25', 'olvidala de todo olvidala =D jaja', 'olvidala de todo olvidala =D jaja', '', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `kiwi_x_entity`
--

DROP TABLE IF EXISTS `kiwi_x_entity`;
CREATE TABLE `kiwi_x_entity` (
  `entity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kiwi_x_entity`
--

INSERT INTO `kiwi_x_entity` (`entity`, `entity_id`, `user_id`) VALUES
('post', 23149, 10211296532584708),
('post', 23139, 10211296532584708),
('post', 23147, 10211296532584708),
('post', 23150, 10211296532584708),
('post', 23148, 10211296532584708),
('post', 23151, 10211296532584708),
('post', 23135, 10211296532584708),
('post', 23138, 10211296532584708),
('post', 23152, 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_id_action` bigint(20) DEFAULT NULL,
  `viewed` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `action`, `entity`, `entity_id`, `user_id`, `user_id_action`, `viewed`, `date`) VALUES
(23, 'comment_to_owner', 'post', 23148, 10211296532584708, 10154898164369884, 'Y', '2017-03-19'),
(24, 'comment_notice', 'post', 23148, 10154898164369884, 10211296532584708, 'N', '2017-03-21'),
(25, 'new', 'post', 23152, 10154898164369884, 10211296532584708, 'N', '2017-03-21'),
(32, 'message', 'chat', 10154898164369884, 10211296532584708, 10154898164369884, 'Y', '2017-03-21'),
(33, 'like', 'post', 23151, 10211296532584708, 10154898164369884, 'N', '2017-03-21'),
(40, 'comment_notice', 'post', 23148, 10154898164369884, 10211296532584708, 'N', '2017-03-22'),
(41, 'like', 'post', 23135, 10211296532584708, 10211296532584708, 'N', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `rate` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `letter` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `thumb`, `type`, `address`, `content`, `rate`, `x`, `y`, `letter`, `user_id`) VALUES
(1, 'Sumo BBQ', 'img/thumb/r1_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho', 8, -37, 175, 'E', 10211296532584708),
(2, 'Hanoi hotel', 'img/thumb/r2_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 9, -37, 174, 'C', 10211296532584708),
(3, 'Chipa Chipa B', 'img/thumb/r3_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708),
(4, 'Sumo BBQ', 'img/thumb/r4_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708),
(5, 'Sumo BBQ', 'img/thumb/r5_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -37, 174, 'A', 10211296532584708),
(6, 'Sumo BBQ', 'img/thumb/r6_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 174, 'A', 10211296532584708),
(7, 'Sumo BBQ', 'img/thumb/r7_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `date`, `content`) VALUES
(23135, 10211296532584708, '2017-03-08', 'primer post kiwii'),
(23136, 10211296532584708, '2017-03-08', 'weee'),
(23137, 10211296532584708, '2017-03-08', NULL),
(23138, 10211296532584708, '2017-03-08', 'chicos'),
(23139, 10211296532584708, '2017-03-08', 'jajaja'),
(23147, 10211296532584708, '2017-03-09', 'andaaaa'),
(23148, 10211296532584708, '2017-03-09', 'kiwimate'),
(23149, 10211296532584708, '2017-03-09', 'foto kiwiii'),
(23150, 10211296532584708, '2017-03-10', 'weeee!! =D'),
(23151, 10211296532584708, '2017-03-20', 'Probando notificaciones del postt!!'),
(23152, 10211296532584708, '2017-03-20', 'Otro mas! =D');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `image`, `about`, `contact`, `city_id`) VALUES
(10154898164369884, 'Sergio Romero', 'Sergio Romero', 'https://scontent-gru2-2.xx.fbcdn.net/v/t1.0-9/15338709_10154898164369883_8739030542171846816_n.jpg?oh=525aa7102afea2b265fceb1ae28391ba&oe=596DBCCC', 'Hola Soy Sergio Romero ;)', '351228282', 2),
(10211296532584708, 'Adrian Dotta', 'Adrian Dotta', 'http://graph.facebook.com/10211296532584708/picture?type=large', 'Hola Soy adrian, y vengo de Argentina! =D', '3512222', 99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buysells`
--
ALTER TABLE `buysells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_tranf` (`user_id_1`),
  ADD KEY `user_id_resep` (`user_id_2`),
  ADD KEY `user_id_sender` (`user_id_sender`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_1` (`user_id_1`),
  ADD KEY `user_id_2` (`user_id_2`);

--
-- Indexes for table `hosts`
--
ALTER TABLE `hosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `image_x_post`
--
ALTER TABLE `image_x_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_action` (`user_id_action`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buysells`
--
ALTER TABLE `buysells`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `hosts`
--
ALTER TABLE `hosts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `image_x_post`
--
ALTER TABLE `image_x_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23153;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10211296532584709;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `buysells`
--
ALTER TABLE `buysells`
  ADD CONSTRAINT `buysells_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_3` FOREIGN KEY (`user_id_sender`) REFERENCES `users` (`id`);

--
-- Constraints for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  ADD CONSTRAINT `comment_x_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comment_x_post_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`);

--
-- Constraints for table `hosts`
--
ALTER TABLE `hosts`
  ADD CONSTRAINT `hosts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image_x_post`
--
ALTER TABLE `image_x_post`
  ADD CONSTRAINT `image_x_post_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_id_action`) REFERENCES `users` (`id`);

--
-- Constraints for table `places`
--
ALTER TABLE `places`
  ADD CONSTRAINT `places_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);
--
-- Database: `id889704_kiwimate`
--
DROP DATABASE IF EXISTS `id889704_kiwimate`;
CREATE DATABASE IF NOT EXISTS `id889704_kiwimate` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id889704_kiwimate`;

-- --------------------------------------------------------

--
-- Table structure for table `buysells`
--

DROP TABLE IF EXISTS `buysells`;
CREATE TABLE `buysells` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `buysells`
--

INSERT INTO `buysells` (`id`, `title`, `date`, `content`, `contact`, `price`, `likes`, `comments`, `image`, `user_id`) VALUES
(1, 'Product1', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10154898164369884),
(3, 'Product3', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(4, 'Product4', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(5, 'Product5', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(11, 'lololo', '2017-03-25', 'Lolo', 'ol', 66, NULL, NULL, 'http://kiwimate.000webhostapp.com/uploads-post/1490462589529.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `user_id_1` bigint(20) DEFAULT NULL,
  `user_id_2` bigint(20) DEFAULT NULL,
  `user_id_sender` bigint(20) DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user_id_1`, `user_id_2`, `user_id_sender`, `text`, `image`, `time`) VALUES
(1, 10154898164369884, 10211296532584708, 10154898164369884, 'Hola como andas? =D', '', '2017-03-14'),
(2, 10211296532584708, 10154898164369884, 10211296532584708, 'Muy bueno vos amigo kiwi?? =D', '', '2017-03-14'),
(3, 10211296532584708, 10154898164369884, 10211296532584708, 'lalaaa', '', '2017-03-14'),
(4, 10211296532584708, 10154898164369884, 10211296532584708, 'lero lero!', '', '2017-03-14'),
(5, 10211296532584708, 10154898164369884, 10211296532584708, 'listoo', '', '2017-03-24'),
(6, 10211296532584708, 10154898164369884, 10211296532584708, 'notificacino! =D', '', '2017-03-21'),
(7, 10211296532584708, 10154898164369884, 10211296532584708, 'Otro mas! =D', '', '2017-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `region`) VALUES
(1, 'Alexandra', 'Otago'),
(2, 'Arrowtown', 'Otago'),
(3, 'Ashburton', 'Canterbury'),
(4, 'Auckland', 'Auckland'),
(5, 'Balclutha', 'Otago'),
(6, 'Blenheim', 'Marlborough'),
(7, 'Carterton', 'Wellington'),
(8, 'Christchurch', 'Canterbury'),
(9, 'Cromwell', 'Otago'),
(10, 'Dannevirke', 'Manawatu-Wanganui'),
(11, 'Darfield', 'Canterbury'),
(12, 'Dargaville', 'Northland'),
(13, 'Dunedin', 'Otago'),
(14, 'Eltham', 'Taranaki'),
(15, 'Featherston', 'Wellington'),
(16, 'Feilding', 'Manawatu-Wanganui'),
(17, 'Foxton Community', 'Manawatu-Wanganui'),
(18, 'Geraldine', 'Canterbury'),
(19, 'Gisborne', 'Gisborne'),
(20, 'Gore', 'Southland'),
(21, 'Greymouth', 'West Coast'),
(22, 'Greytown', 'Wellington'),
(23, 'Hamilton', 'Waikato'),
(24, 'Hawera', 'Taranaki'),
(25, 'Helensville', 'Auckland'),
(26, 'Hokitika', 'West Coast'),
(27, 'Huntly', 'Waikato'),
(28, 'Inglewood', 'Taranaki'),
(29, 'Invercargill', 'Southland'),
(30, 'Kaikohe', 'Northland'),
(31, 'Kaikoura', 'Canterbury'),
(32, 'Kaitaia', 'Northland'),
(33, 'Kapiti', 'Wellington'),
(34, 'Katikati Community', 'Bay of Plenty'),
(35, 'Kawerau', 'Bay of Plenty'),
(36, 'Kerikeri', 'Northland'),
(37, 'Levin', 'Manawatu-Wanganui'),
(38, 'Lincoln', 'Canterbury'),
(39, 'Mapua', 'Tasman'),
(40, 'Marton', 'Manawatu-Wanganui'),
(41, 'Masterton', 'Wellington'),
(42, 'Matamata', 'Waikato'),
(43, 'Morrinsville', 'Waikato'),
(44, 'Motueka', 'Tasman'),
(45, 'Napier-Hastings', 'Hawke`s Bay'),
(46, 'Nelson', 'Nelson'),
(47, 'New Plymouth', 'Taranaki'),
(48, 'Oamaru', 'Otago'),
(49, 'Opotiki', 'Bay of Plenty'),
(50, 'Otaki', 'Wellington'),
(51, 'Otorohanga', 'Waikato'),
(52, 'Oxford', 'Canterbury'),
(53, 'Paeroa', 'Waikato'),
(54, 'Pahiatua', 'Manawatu-Wanganui'),
(55, 'Palmerston North', 'Manawatu-Wanganui'),
(56, 'Picton', 'Marlborough'),
(57, 'Pukekohe', 'Auckland'),
(58, 'Putaruru', 'Waikato'),
(59, 'Queenstown', 'Otago'),
(60, 'Raglan', 'Waikato'),
(61, 'Rangiora', 'Canterbury'),
(62, 'Rolleston', 'Canterbury'),
(63, 'Rotorua', 'Bay of Plenty'),
(64, 'Snells Beach', 'Auckland'),
(65, 'Stratford', 'Taranaki'),
(66, 'Taumarunui', 'Manawatu-Wanganui'),
(67, 'Taupo', 'Waikato'),
(68, 'Tauranga', 'Bay of Plenty'),
(69, 'Te Anau', 'Southland'),
(70, 'Te Aroha', 'Waikato'),
(71, 'Te Kuiti', 'Waikato'),
(72, 'Te Puke Community', 'Bay of Plenty'),
(73, 'Temuka', 'Canterbury'),
(74, 'Thames', 'Waikato'),
(75, 'Timaru', 'Canterbury'),
(76, 'Tokoroa', 'Waikato'),
(77, 'Turangi', 'Waikato'),
(78, 'Waiheke Island', 'Auckland'),
(79, 'Waihi', 'Waikato'),
(80, 'Waihi Beach', 'Bay of Plenty'),
(81, 'Waimate', 'Canterbury'),
(82, 'Waipawa', 'Hawkes Bay'),
(83, 'Waipukurau', 'Hawkes Bay'),
(84, 'Wairoa', 'Hawkes Bay'),
(85, 'Waitara', 'Taranaki'),
(86, 'Waiuku', 'Auckland'),
(87, 'Wakefield', 'Tasman'),
(88, 'Wanaka', 'Otago'),
(89, 'Warkworth', 'Auckland'),
(90, 'Wellington', 'Wellington'),
(91, 'Westport', 'West Coast'),
(92, 'Whakatane', 'Bay of Plenty'),
(93, 'Whangamata', 'Waikato'),
(94, 'Whanganui', 'Manawatu-Wanganui'),
(95, 'Whangarei', 'Northland'),
(96, 'Whitianga', 'Waikato'),
(97, 'Winton', 'Southland'),
(98, 'Woodend', 'Canterbury'),
(99, '.Argentina', 'Pais'),
(100, '.Chile', 'Pais'),
(101, '.Uruguay', 'Pais');

-- --------------------------------------------------------

--
-- Table structure for table `comment_x_post`
--

DROP TABLE IF EXISTS `comment_x_post`;
CREATE TABLE `comment_x_post` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment_x_post`
--

INSERT INTO `comment_x_post` (`id`, `user_id`, `post_id`, `comment`, `image`, `date`) VALUES
(1, 10211296532584708, 23150, 'Que linda foto chicos! =D', '', '2017-03-15'),
(3, 10211296532584708, 23150, 'fachaaa =D', '', '2017-03-15'),
(4, 10211296532584708, 23149, 'weee =D', '', '2017-03-15'),
(5, 10211296532584708, 23148, 'JAjaja! =D', '', '2017-03-21'),
(6, 10154898164369884, 23148, 'Lalala!', '', '2017-03-21'),
(9, 10211296532584708, 23148, 'Que odna!', '', '2017-03-21'),
(10, 10211296532584708, 23152, 'Lalarelo', '', '2017-03-22'),
(11, 10211296532584708, 23148, 'Probando!', '', '2017-03-22'),
(12, 10211296532584708, 23148, 'otra!', '', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `content`, `contact`, `address`, `date`, `image`, `user_id`) VALUES
(1, 'Event1', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(2, 'Event2', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(3, 'Event3', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(4, 'Event4', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10154898164369884),
(10, 'lopo', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490466953555.jpg', 10211296532584708),
(11, 'lkmkl', 'ñl,', 'ñl,|ñl,|ñl,|', NULL, '2017-03-25', '', 10211296532584708),
(12, 'jjjj', NULL, NULL, NULL, '2017-03-25', '', 10211296532584708),
(13, 'kskKs', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490467528411.jpg', 10211296532584708),
(14, 'jjjjjj', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490467799324.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `user_id_1` bigint(20) DEFAULT NULL,
  `user_id_2` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `user_id_1`, `user_id_2`) VALUES
(14, 10211296532584708, 10154898164369884),
(15, 10154898164369884, 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
CREATE TABLE `hosts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `imagesProduct` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hosts`
--

INSERT INTO `hosts` (`id`, `title`, `place`, `content`, `contact`, `price`, `likes`, `comments`, `imagesProduct`, `user_id`) VALUES
(1, 'Host1', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(2, 'Host2', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(3, 'Host3', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(4, 'Host4', 'contenido 11', '3512056271', 'Tauranga', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(5, 'Host5', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `image_x_post`
--

DROP TABLE IF EXISTS `image_x_post`;
CREATE TABLE `image_x_post` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `image_x_post`
--

INSERT INTO `image_x_post` (`id`, `post_id`, `image`) VALUES
(12, 23135, 'http://kiwimate.000webhostapp.com/uploads-post/1489022865278.jpg'),
(13, 23136, 'http://kiwimate.000webhostapp.com/uploads-post/1489027068751.jpg'),
(14, 23137, 'http://kiwimate.000webhostapp.com/uploads-post/1489027356991.jpg'),
(15, 23138, 'http://kiwimate.000webhostapp.com/uploads-post/1489027484310.jpg'),
(16, 23139, 'http://kiwimate.000webhostapp.com/uploads-post/null'),
(24, 23147, ''),
(25, 23148, 'http://kiwimate.000webhostapp.com/uploads-post/1489029951449.jpg'),
(26, 23149, 'http://kiwimate.000webhostapp.com/uploads-post/1489059243799.jpg'),
(27, 23150, 'http://kiwimate.000webhostapp.com/uploads-post/1489150971912.jpg'),
(28, 23151, ''),
(29, 23152, '');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `type`, `date`, `content`, `contact`, `image`, `user_id`) VALUES
(1, 'Job1', 'Developer1', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(2, 'Job2', 'Developer2', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(3, 'Job3', 'Developer3', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(4, 'Job4', 'Developer4', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(5, 'Job5', 'Developer5', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(6, 'netbel sa', 'developer', '2017-03-24', 'Esese lalala', '35138283', 'http://kiwimate.000webhostapp.com/uploads-post/1490397229747.jpg', 10211296532584708),
(8, 'netbel sa', 'developer', '2017-03-24', '', '35138283', '', 10211296532584708),
(9, 'hoy apruebi', 'develop', '2017-03-24', 'Lalala lele fff', '27272', 'http://kiwimate.000webhostapp.com/uploads-post/1490397466828.jpg', 10211296532584708),
(22, 'porque porque', 'porque porque', '2017-03-25', 'porque porque', 'porque porque', '', 10211296532584708),
(23, 'jjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjj', '2017-03-25', 'jjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjj', '', 10211296532584708),
(24, 'olvidala de todo olvidala =D jaja', 'olvidala de todo olvidala =D jaja', '2017-03-25', 'olvidala de todo olvidala =D jaja', 'olvidala de todo olvidala =D jaja', '', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `kiwi_x_entity`
--

DROP TABLE IF EXISTS `kiwi_x_entity`;
CREATE TABLE `kiwi_x_entity` (
  `entity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kiwi_x_entity`
--

INSERT INTO `kiwi_x_entity` (`entity`, `entity_id`, `user_id`) VALUES
('post', 23149, 10211296532584708),
('post', 23139, 10211296532584708),
('post', 23147, 10211296532584708),
('post', 23150, 10211296532584708),
('post', 23148, 10211296532584708),
('post', 23151, 10211296532584708),
('post', 23135, 10211296532584708),
('post', 23138, 10211296532584708),
('post', 23152, 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_id_action` bigint(20) DEFAULT NULL,
  `viewed` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `action`, `entity`, `entity_id`, `user_id`, `user_id_action`, `viewed`, `date`) VALUES
(23, 'comment_to_owner', 'post', 23148, 10211296532584708, 10154898164369884, 'Y', '2017-03-19'),
(24, 'comment_notice', 'post', 23148, 10154898164369884, 10211296532584708, 'N', '2017-03-21'),
(25, 'new', 'post', 23152, 10154898164369884, 10211296532584708, 'N', '2017-03-21'),
(32, 'message', 'chat', 10154898164369884, 10211296532584708, 10154898164369884, 'Y', '2017-03-21'),
(33, 'like', 'post', 23151, 10211296532584708, 10154898164369884, 'N', '2017-03-21'),
(40, 'comment_notice', 'post', 23148, 10154898164369884, 10211296532584708, 'N', '2017-03-22'),
(41, 'like', 'post', 23135, 10211296532584708, 10211296532584708, 'N', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `rate` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `letter` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `thumb`, `type`, `address`, `content`, `rate`, `x`, `y`, `letter`, `user_id`) VALUES
(1, 'Sumo BBQ', 'img/thumb/r1_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho', 8, -37, 175, 'E', 10211296532584708),
(2, 'Hanoi hotel', 'img/thumb/r2_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 9, -37, 174, 'C', 10211296532584708),
(3, 'Chipa Chipa B', 'img/thumb/r3_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708),
(4, 'Sumo BBQ', 'img/thumb/r4_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708),
(5, 'Sumo BBQ', 'img/thumb/r5_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -37, 174, 'A', 10211296532584708),
(6, 'Sumo BBQ', 'img/thumb/r6_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 174, 'A', 10211296532584708),
(7, 'Sumo BBQ', 'img/thumb/r7_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `date`, `content`) VALUES
(23135, 10211296532584708, '2017-03-08', 'primer post kiwii'),
(23136, 10211296532584708, '2017-03-08', 'weee'),
(23137, 10211296532584708, '2017-03-08', NULL),
(23138, 10211296532584708, '2017-03-08', 'chicos'),
(23139, 10211296532584708, '2017-03-08', 'jajaja'),
(23147, 10211296532584708, '2017-03-09', 'andaaaa'),
(23148, 10211296532584708, '2017-03-09', 'kiwimate'),
(23149, 10211296532584708, '2017-03-09', 'foto kiwiii'),
(23150, 10211296532584708, '2017-03-10', 'weeee!! =D'),
(23151, 10211296532584708, '2017-03-20', 'Probando notificaciones del postt!!'),
(23152, 10211296532584708, '2017-03-20', 'Otro mas! =D');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `image`, `about`, `contact`, `city_id`) VALUES
(10154898164369884, 'Sergio Romero', 'Sergio Romero', 'https://scontent-gru2-2.xx.fbcdn.net/v/t1.0-9/15338709_10154898164369883_8739030542171846816_n.jpg?oh=525aa7102afea2b265fceb1ae28391ba&oe=596DBCCC', 'Hola Soy Sergio Romero ;)', '351228282', 2),
(10211296532584708, 'Adrian Dotta', 'Adrian Dotta', 'http://graph.facebook.com/10211296532584708/picture?type=large', 'Hola Soy adrian, y vengo de Argentina! =D', '3512222', 99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buysells`
--
ALTER TABLE `buysells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_tranf` (`user_id_1`),
  ADD KEY `user_id_resep` (`user_id_2`),
  ADD KEY `user_id_sender` (`user_id_sender`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_1` (`user_id_1`),
  ADD KEY `user_id_2` (`user_id_2`);

--
-- Indexes for table `hosts`
--
ALTER TABLE `hosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `image_x_post`
--
ALTER TABLE `image_x_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_action` (`user_id_action`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buysells`
--
ALTER TABLE `buysells`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `hosts`
--
ALTER TABLE `hosts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `image_x_post`
--
ALTER TABLE `image_x_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23153;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10211296532584709;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `buysells`
--
ALTER TABLE `buysells`
  ADD CONSTRAINT `buysells_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_3` FOREIGN KEY (`user_id_sender`) REFERENCES `users` (`id`);

--
-- Constraints for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  ADD CONSTRAINT `comment_x_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comment_x_post_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`);

--
-- Constraints for table `hosts`
--
ALTER TABLE `hosts`
  ADD CONSTRAINT `hosts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image_x_post`
--
ALTER TABLE `image_x_post`
  ADD CONSTRAINT `image_x_post_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_id_action`) REFERENCES `users` (`id`);

--
-- Constraints for table `places`
--
ALTER TABLE `places`
  ADD CONSTRAINT `places_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);
--
-- Database: `id889704_kiwimate`
--
DROP DATABASE IF EXISTS `id889704_kiwimate`;
CREATE DATABASE IF NOT EXISTS `id889704_kiwimate` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id889704_kiwimate`;

-- --------------------------------------------------------

--
-- Table structure for table `buysells`
--

DROP TABLE IF EXISTS `buysells`;
CREATE TABLE `buysells` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `buysells`
--

INSERT INTO `buysells` (`id`, `title`, `date`, `content`, `contact`, `price`, `likes`, `comments`, `image`, `user_id`) VALUES
(1, 'Product1', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10154898164369884),
(3, 'Product3', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(4, 'Product4', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(5, 'Product5', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(11, 'lololo', '2017-03-25', 'Lolo', 'ol', 66, NULL, NULL, 'http://kiwimate.000webhostapp.com/uploads-post/1490462589529.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `user_id_1` bigint(20) DEFAULT NULL,
  `user_id_2` bigint(20) DEFAULT NULL,
  `user_id_sender` bigint(20) DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user_id_1`, `user_id_2`, `user_id_sender`, `text`, `image`, `time`) VALUES
(1, 10154898164369884, 10211296532584708, 10154898164369884, 'Hola como andas? =D', '', '2017-03-14'),
(2, 10211296532584708, 10154898164369884, 10211296532584708, 'Muy bueno vos amigo kiwi?? =D', '', '2017-03-14'),
(3, 10211296532584708, 10154898164369884, 10211296532584708, 'lalaaa', '', '2017-03-14'),
(4, 10211296532584708, 10154898164369884, 10211296532584708, 'lero lero!', '', '2017-03-14'),
(5, 10211296532584708, 10154898164369884, 10211296532584708, 'listoo', '', '2017-03-24'),
(6, 10211296532584708, 10154898164369884, 10211296532584708, 'notificacino! =D', '', '2017-03-21'),
(7, 10211296532584708, 10154898164369884, 10211296532584708, 'Otro mas! =D', '', '2017-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `region`) VALUES
(1, 'Alexandra', 'Otago'),
(2, 'Arrowtown', 'Otago'),
(3, 'Ashburton', 'Canterbury'),
(4, 'Auckland', 'Auckland'),
(5, 'Balclutha', 'Otago'),
(6, 'Blenheim', 'Marlborough'),
(7, 'Carterton', 'Wellington'),
(8, 'Christchurch', 'Canterbury'),
(9, 'Cromwell', 'Otago'),
(10, 'Dannevirke', 'Manawatu-Wanganui'),
(11, 'Darfield', 'Canterbury'),
(12, 'Dargaville', 'Northland'),
(13, 'Dunedin', 'Otago'),
(14, 'Eltham', 'Taranaki'),
(15, 'Featherston', 'Wellington'),
(16, 'Feilding', 'Manawatu-Wanganui'),
(17, 'Foxton Community', 'Manawatu-Wanganui'),
(18, 'Geraldine', 'Canterbury'),
(19, 'Gisborne', 'Gisborne'),
(20, 'Gore', 'Southland'),
(21, 'Greymouth', 'West Coast'),
(22, 'Greytown', 'Wellington'),
(23, 'Hamilton', 'Waikato'),
(24, 'Hawera', 'Taranaki'),
(25, 'Helensville', 'Auckland'),
(26, 'Hokitika', 'West Coast'),
(27, 'Huntly', 'Waikato'),
(28, 'Inglewood', 'Taranaki'),
(29, 'Invercargill', 'Southland'),
(30, 'Kaikohe', 'Northland'),
(31, 'Kaikoura', 'Canterbury'),
(32, 'Kaitaia', 'Northland'),
(33, 'Kapiti', 'Wellington'),
(34, 'Katikati Community', 'Bay of Plenty'),
(35, 'Kawerau', 'Bay of Plenty'),
(36, 'Kerikeri', 'Northland'),
(37, 'Levin', 'Manawatu-Wanganui'),
(38, 'Lincoln', 'Canterbury'),
(39, 'Mapua', 'Tasman'),
(40, 'Marton', 'Manawatu-Wanganui'),
(41, 'Masterton', 'Wellington'),
(42, 'Matamata', 'Waikato'),
(43, 'Morrinsville', 'Waikato'),
(44, 'Motueka', 'Tasman'),
(45, 'Napier-Hastings', 'Hawke`s Bay'),
(46, 'Nelson', 'Nelson'),
(47, 'New Plymouth', 'Taranaki'),
(48, 'Oamaru', 'Otago'),
(49, 'Opotiki', 'Bay of Plenty'),
(50, 'Otaki', 'Wellington'),
(51, 'Otorohanga', 'Waikato'),
(52, 'Oxford', 'Canterbury'),
(53, 'Paeroa', 'Waikato'),
(54, 'Pahiatua', 'Manawatu-Wanganui'),
(55, 'Palmerston North', 'Manawatu-Wanganui'),
(56, 'Picton', 'Marlborough'),
(57, 'Pukekohe', 'Auckland'),
(58, 'Putaruru', 'Waikato'),
(59, 'Queenstown', 'Otago'),
(60, 'Raglan', 'Waikato'),
(61, 'Rangiora', 'Canterbury'),
(62, 'Rolleston', 'Canterbury'),
(63, 'Rotorua', 'Bay of Plenty'),
(64, 'Snells Beach', 'Auckland'),
(65, 'Stratford', 'Taranaki'),
(66, 'Taumarunui', 'Manawatu-Wanganui'),
(67, 'Taupo', 'Waikato'),
(68, 'Tauranga', 'Bay of Plenty'),
(69, 'Te Anau', 'Southland'),
(70, 'Te Aroha', 'Waikato'),
(71, 'Te Kuiti', 'Waikato'),
(72, 'Te Puke Community', 'Bay of Plenty'),
(73, 'Temuka', 'Canterbury'),
(74, 'Thames', 'Waikato'),
(75, 'Timaru', 'Canterbury'),
(76, 'Tokoroa', 'Waikato'),
(77, 'Turangi', 'Waikato'),
(78, 'Waiheke Island', 'Auckland'),
(79, 'Waihi', 'Waikato'),
(80, 'Waihi Beach', 'Bay of Plenty'),
(81, 'Waimate', 'Canterbury'),
(82, 'Waipawa', 'Hawkes Bay'),
(83, 'Waipukurau', 'Hawkes Bay'),
(84, 'Wairoa', 'Hawkes Bay'),
(85, 'Waitara', 'Taranaki'),
(86, 'Waiuku', 'Auckland'),
(87, 'Wakefield', 'Tasman'),
(88, 'Wanaka', 'Otago'),
(89, 'Warkworth', 'Auckland'),
(90, 'Wellington', 'Wellington'),
(91, 'Westport', 'West Coast'),
(92, 'Whakatane', 'Bay of Plenty'),
(93, 'Whangamata', 'Waikato'),
(94, 'Whanganui', 'Manawatu-Wanganui'),
(95, 'Whangarei', 'Northland'),
(96, 'Whitianga', 'Waikato'),
(97, 'Winton', 'Southland'),
(98, 'Woodend', 'Canterbury'),
(99, '.Argentina', 'Pais'),
(100, '.Chile', 'Pais'),
(101, '.Uruguay', 'Pais');

-- --------------------------------------------------------

--
-- Table structure for table `comment_x_post`
--

DROP TABLE IF EXISTS `comment_x_post`;
CREATE TABLE `comment_x_post` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment_x_post`
--

INSERT INTO `comment_x_post` (`id`, `user_id`, `post_id`, `comment`, `image`, `date`) VALUES
(1, 10211296532584708, 23150, 'Que linda foto chicos! =D', '', '2017-03-15'),
(3, 10211296532584708, 23150, 'fachaaa =D', '', '2017-03-15'),
(4, 10211296532584708, 23149, 'weee =D', '', '2017-03-15'),
(5, 10211296532584708, 23148, 'JAjaja! =D', '', '2017-03-21'),
(6, 10154898164369884, 23148, 'Lalala!', '', '2017-03-21'),
(9, 10211296532584708, 23148, 'Que odna!', '', '2017-03-21'),
(10, 10211296532584708, 23152, 'Lalarelo', '', '2017-03-22'),
(11, 10211296532584708, 23148, 'Probando!', '', '2017-03-22'),
(12, 10211296532584708, 23148, 'otra!', '', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `content`, `contact`, `address`, `date`, `image`, `user_id`) VALUES
(1, 'Event1', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(2, 'Event2', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(3, 'Event3', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(4, 'Event4', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10154898164369884),
(10, 'lopo', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490466953555.jpg', 10211296532584708),
(11, 'lkmkl', 'ñl,', 'ñl,|ñl,|ñl,|', NULL, '2017-03-25', '', 10211296532584708),
(12, 'jjjj', NULL, NULL, NULL, '2017-03-25', '', 10211296532584708),
(13, 'kskKs', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490467528411.jpg', 10211296532584708),
(14, 'jjjjjj', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490467799324.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `user_id_1` bigint(20) DEFAULT NULL,
  `user_id_2` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `user_id_1`, `user_id_2`) VALUES
(14, 10211296532584708, 10154898164369884),
(15, 10154898164369884, 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
CREATE TABLE `hosts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `imagesProduct` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hosts`
--

INSERT INTO `hosts` (`id`, `title`, `place`, `content`, `contact`, `price`, `likes`, `comments`, `imagesProduct`, `user_id`) VALUES
(1, 'Host1', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(2, 'Host2', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(3, 'Host3', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(4, 'Host4', 'contenido 11', '3512056271', 'Tauranga', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(5, 'Host5', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `image_x_post`
--

DROP TABLE IF EXISTS `image_x_post`;
CREATE TABLE `image_x_post` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `image_x_post`
--

INSERT INTO `image_x_post` (`id`, `post_id`, `image`) VALUES
(12, 23135, 'http://kiwimate.000webhostapp.com/uploads-post/1489022865278.jpg'),
(13, 23136, 'http://kiwimate.000webhostapp.com/uploads-post/1489027068751.jpg'),
(14, 23137, 'http://kiwimate.000webhostapp.com/uploads-post/1489027356991.jpg'),
(15, 23138, 'http://kiwimate.000webhostapp.com/uploads-post/1489027484310.jpg'),
(16, 23139, 'http://kiwimate.000webhostapp.com/uploads-post/null'),
(24, 23147, ''),
(25, 23148, 'http://kiwimate.000webhostapp.com/uploads-post/1489029951449.jpg'),
(26, 23149, 'http://kiwimate.000webhostapp.com/uploads-post/1489059243799.jpg'),
(27, 23150, 'http://kiwimate.000webhostapp.com/uploads-post/1489150971912.jpg'),
(28, 23151, ''),
(29, 23152, '');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `type`, `date`, `content`, `contact`, `image`, `user_id`) VALUES
(1, 'Job1', 'Developer1', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(2, 'Job2', 'Developer2', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(3, 'Job3', 'Developer3', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(4, 'Job4', 'Developer4', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(5, 'Job5', 'Developer5', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(6, 'netbel sa', 'developer', '2017-03-24', 'Esese lalala', '35138283', 'http://kiwimate.000webhostapp.com/uploads-post/1490397229747.jpg', 10211296532584708),
(8, 'netbel sa', 'developer', '2017-03-24', '', '35138283', '', 10211296532584708),
(9, 'hoy apruebi', 'develop', '2017-03-24', 'Lalala lele fff', '27272', 'http://kiwimate.000webhostapp.com/uploads-post/1490397466828.jpg', 10211296532584708),
(22, 'porque porque', 'porque porque', '2017-03-25', 'porque porque', 'porque porque', '', 10211296532584708),
(23, 'jjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjj', '2017-03-25', 'jjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjj', '', 10211296532584708),
(24, 'olvidala de todo olvidala =D jaja', 'olvidala de todo olvidala =D jaja', '2017-03-25', 'olvidala de todo olvidala =D jaja', 'olvidala de todo olvidala =D jaja', '', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `kiwi_x_entity`
--

DROP TABLE IF EXISTS `kiwi_x_entity`;
CREATE TABLE `kiwi_x_entity` (
  `entity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kiwi_x_entity`
--

INSERT INTO `kiwi_x_entity` (`entity`, `entity_id`, `user_id`) VALUES
('post', 23149, 10211296532584708),
('post', 23139, 10211296532584708),
('post', 23147, 10211296532584708),
('post', 23150, 10211296532584708),
('post', 23148, 10211296532584708),
('post', 23151, 10211296532584708),
('post', 23135, 10211296532584708),
('post', 23138, 10211296532584708),
('post', 23152, 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_id_action` bigint(20) DEFAULT NULL,
  `viewed` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `action`, `entity`, `entity_id`, `user_id`, `user_id_action`, `viewed`, `date`) VALUES
(23, 'comment_to_owner', 'post', 23148, 10211296532584708, 10154898164369884, 'Y', '2017-03-19'),
(24, 'comment_notice', 'post', 23148, 10154898164369884, 10211296532584708, 'N', '2017-03-21'),
(25, 'new', 'post', 23152, 10154898164369884, 10211296532584708, 'N', '2017-03-21'),
(32, 'message', 'chat', 10154898164369884, 10211296532584708, 10154898164369884, 'Y', '2017-03-21'),
(33, 'like', 'post', 23151, 10211296532584708, 10154898164369884, 'N', '2017-03-21'),
(40, 'comment_notice', 'post', 23148, 10154898164369884, 10211296532584708, 'N', '2017-03-22'),
(41, 'like', 'post', 23135, 10211296532584708, 10211296532584708, 'N', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `rate` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `letter` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `thumb`, `type`, `address`, `content`, `rate`, `x`, `y`, `letter`, `user_id`) VALUES
(1, 'Sumo BBQ', 'img/thumb/r1_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho', 8, -37, 175, 'E', 10211296532584708),
(2, 'Hanoi hotel', 'img/thumb/r2_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 9, -37, 174, 'C', 10211296532584708),
(3, 'Chipa Chipa B', 'img/thumb/r3_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708),
(4, 'Sumo BBQ', 'img/thumb/r4_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708),
(5, 'Sumo BBQ', 'img/thumb/r5_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -37, 174, 'A', 10211296532584708),
(6, 'Sumo BBQ', 'img/thumb/r6_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 174, 'A', 10211296532584708),
(7, 'Sumo BBQ', 'img/thumb/r7_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `date`, `content`) VALUES
(23135, 10211296532584708, '2017-03-08', 'primer post kiwii'),
(23136, 10211296532584708, '2017-03-08', 'weee'),
(23137, 10211296532584708, '2017-03-08', NULL),
(23138, 10211296532584708, '2017-03-08', 'chicos'),
(23139, 10211296532584708, '2017-03-08', 'jajaja'),
(23147, 10211296532584708, '2017-03-09', 'andaaaa'),
(23148, 10211296532584708, '2017-03-09', 'kiwimate'),
(23149, 10211296532584708, '2017-03-09', 'foto kiwiii'),
(23150, 10211296532584708, '2017-03-10', 'weeee!! =D'),
(23151, 10211296532584708, '2017-03-20', 'Probando notificaciones del postt!!'),
(23152, 10211296532584708, '2017-03-20', 'Otro mas! =D');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `image`, `about`, `contact`, `city_id`) VALUES
(10154898164369884, 'Sergio Romero', 'Sergio Romero', 'https://scontent-gru2-2.xx.fbcdn.net/v/t1.0-9/15338709_10154898164369883_8739030542171846816_n.jpg?oh=525aa7102afea2b265fceb1ae28391ba&oe=596DBCCC', 'Hola Soy Sergio Romero ;)', '351228282', 2),
(10211296532584708, 'Adrian Dotta', 'Adrian Dotta', 'http://graph.facebook.com/10211296532584708/picture?type=large', 'Hola Soy adrian, y vengo de Argentina! =D', '3512222', 99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buysells`
--
ALTER TABLE `buysells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_tranf` (`user_id_1`),
  ADD KEY `user_id_resep` (`user_id_2`),
  ADD KEY `user_id_sender` (`user_id_sender`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_1` (`user_id_1`),
  ADD KEY `user_id_2` (`user_id_2`);

--
-- Indexes for table `hosts`
--
ALTER TABLE `hosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `image_x_post`
--
ALTER TABLE `image_x_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_action` (`user_id_action`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buysells`
--
ALTER TABLE `buysells`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `hosts`
--
ALTER TABLE `hosts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `image_x_post`
--
ALTER TABLE `image_x_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23153;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10211296532584709;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `buysells`
--
ALTER TABLE `buysells`
  ADD CONSTRAINT `buysells_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_3` FOREIGN KEY (`user_id_sender`) REFERENCES `users` (`id`);

--
-- Constraints for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  ADD CONSTRAINT `comment_x_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comment_x_post_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`);

--
-- Constraints for table `hosts`
--
ALTER TABLE `hosts`
  ADD CONSTRAINT `hosts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image_x_post`
--
ALTER TABLE `image_x_post`
  ADD CONSTRAINT `image_x_post_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_id_action`) REFERENCES `users` (`id`);

--
-- Constraints for table `places`
--
ALTER TABLE `places`
  ADD CONSTRAINT `places_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);
--
-- Database: `id889704_kiwimate`
--
DROP DATABASE IF EXISTS `id889704_kiwimate`;
CREATE DATABASE IF NOT EXISTS `id889704_kiwimate` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id889704_kiwimate`;

-- --------------------------------------------------------

--
-- Table structure for table `buysells`
--

DROP TABLE IF EXISTS `buysells`;
CREATE TABLE `buysells` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `buysells`
--

INSERT INTO `buysells` (`id`, `title`, `date`, `content`, `contact`, `price`, `likes`, `comments`, `image`, `user_id`) VALUES
(1, 'Product1', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10154898164369884),
(3, 'Product3', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(4, 'Product4', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(5, 'Product5', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(11, 'lololo', '2017-03-25', 'Lolo', 'ol', 66, NULL, NULL, 'http://kiwimate.000webhostapp.com/uploads-post/1490462589529.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `user_id_1` bigint(20) DEFAULT NULL,
  `user_id_2` bigint(20) DEFAULT NULL,
  `user_id_sender` bigint(20) DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user_id_1`, `user_id_2`, `user_id_sender`, `text`, `image`, `time`) VALUES
(1, 10154898164369884, 10211296532584708, 10154898164369884, 'Hola como andas? =D', '', '2017-03-14'),
(2, 10211296532584708, 10154898164369884, 10211296532584708, 'Muy bueno vos amigo kiwi?? =D', '', '2017-03-14'),
(3, 10211296532584708, 10154898164369884, 10211296532584708, 'lalaaa', '', '2017-03-14'),
(4, 10211296532584708, 10154898164369884, 10211296532584708, 'lero lero!', '', '2017-03-14'),
(5, 10211296532584708, 10154898164369884, 10211296532584708, 'listoo', '', '2017-03-24'),
(6, 10211296532584708, 10154898164369884, 10211296532584708, 'notificacino! =D', '', '2017-03-21'),
(7, 10211296532584708, 10154898164369884, 10211296532584708, 'Otro mas! =D', '', '2017-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `region`) VALUES
(1, 'Alexandra', 'Otago'),
(2, 'Arrowtown', 'Otago'),
(3, 'Ashburton', 'Canterbury'),
(4, 'Auckland', 'Auckland'),
(5, 'Balclutha', 'Otago'),
(6, 'Blenheim', 'Marlborough'),
(7, 'Carterton', 'Wellington'),
(8, 'Christchurch', 'Canterbury'),
(9, 'Cromwell', 'Otago'),
(10, 'Dannevirke', 'Manawatu-Wanganui'),
(11, 'Darfield', 'Canterbury'),
(12, 'Dargaville', 'Northland'),
(13, 'Dunedin', 'Otago'),
(14, 'Eltham', 'Taranaki'),
(15, 'Featherston', 'Wellington'),
(16, 'Feilding', 'Manawatu-Wanganui'),
(17, 'Foxton Community', 'Manawatu-Wanganui'),
(18, 'Geraldine', 'Canterbury'),
(19, 'Gisborne', 'Gisborne'),
(20, 'Gore', 'Southland'),
(21, 'Greymouth', 'West Coast'),
(22, 'Greytown', 'Wellington'),
(23, 'Hamilton', 'Waikato'),
(24, 'Hawera', 'Taranaki'),
(25, 'Helensville', 'Auckland'),
(26, 'Hokitika', 'West Coast'),
(27, 'Huntly', 'Waikato'),
(28, 'Inglewood', 'Taranaki'),
(29, 'Invercargill', 'Southland'),
(30, 'Kaikohe', 'Northland'),
(31, 'Kaikoura', 'Canterbury'),
(32, 'Kaitaia', 'Northland'),
(33, 'Kapiti', 'Wellington'),
(34, 'Katikati Community', 'Bay of Plenty'),
(35, 'Kawerau', 'Bay of Plenty'),
(36, 'Kerikeri', 'Northland'),
(37, 'Levin', 'Manawatu-Wanganui'),
(38, 'Lincoln', 'Canterbury'),
(39, 'Mapua', 'Tasman'),
(40, 'Marton', 'Manawatu-Wanganui'),
(41, 'Masterton', 'Wellington'),
(42, 'Matamata', 'Waikato'),
(43, 'Morrinsville', 'Waikato'),
(44, 'Motueka', 'Tasman'),
(45, 'Napier-Hastings', 'Hawke`s Bay'),
(46, 'Nelson', 'Nelson'),
(47, 'New Plymouth', 'Taranaki'),
(48, 'Oamaru', 'Otago'),
(49, 'Opotiki', 'Bay of Plenty'),
(50, 'Otaki', 'Wellington'),
(51, 'Otorohanga', 'Waikato'),
(52, 'Oxford', 'Canterbury'),
(53, 'Paeroa', 'Waikato'),
(54, 'Pahiatua', 'Manawatu-Wanganui'),
(55, 'Palmerston North', 'Manawatu-Wanganui'),
(56, 'Picton', 'Marlborough'),
(57, 'Pukekohe', 'Auckland'),
(58, 'Putaruru', 'Waikato'),
(59, 'Queenstown', 'Otago'),
(60, 'Raglan', 'Waikato'),
(61, 'Rangiora', 'Canterbury'),
(62, 'Rolleston', 'Canterbury'),
(63, 'Rotorua', 'Bay of Plenty'),
(64, 'Snells Beach', 'Auckland'),
(65, 'Stratford', 'Taranaki'),
(66, 'Taumarunui', 'Manawatu-Wanganui'),
(67, 'Taupo', 'Waikato'),
(68, 'Tauranga', 'Bay of Plenty'),
(69, 'Te Anau', 'Southland'),
(70, 'Te Aroha', 'Waikato'),
(71, 'Te Kuiti', 'Waikato'),
(72, 'Te Puke Community', 'Bay of Plenty'),
(73, 'Temuka', 'Canterbury'),
(74, 'Thames', 'Waikato'),
(75, 'Timaru', 'Canterbury'),
(76, 'Tokoroa', 'Waikato'),
(77, 'Turangi', 'Waikato'),
(78, 'Waiheke Island', 'Auckland'),
(79, 'Waihi', 'Waikato'),
(80, 'Waihi Beach', 'Bay of Plenty'),
(81, 'Waimate', 'Canterbury'),
(82, 'Waipawa', 'Hawkes Bay'),
(83, 'Waipukurau', 'Hawkes Bay'),
(84, 'Wairoa', 'Hawkes Bay'),
(85, 'Waitara', 'Taranaki'),
(86, 'Waiuku', 'Auckland'),
(87, 'Wakefield', 'Tasman'),
(88, 'Wanaka', 'Otago'),
(89, 'Warkworth', 'Auckland'),
(90, 'Wellington', 'Wellington'),
(91, 'Westport', 'West Coast'),
(92, 'Whakatane', 'Bay of Plenty'),
(93, 'Whangamata', 'Waikato'),
(94, 'Whanganui', 'Manawatu-Wanganui'),
(95, 'Whangarei', 'Northland'),
(96, 'Whitianga', 'Waikato'),
(97, 'Winton', 'Southland'),
(98, 'Woodend', 'Canterbury'),
(99, '.Argentina', 'Pais'),
(100, '.Chile', 'Pais'),
(101, '.Uruguay', 'Pais');

-- --------------------------------------------------------

--
-- Table structure for table `comment_x_post`
--

DROP TABLE IF EXISTS `comment_x_post`;
CREATE TABLE `comment_x_post` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment_x_post`
--

INSERT INTO `comment_x_post` (`id`, `user_id`, `post_id`, `comment`, `image`, `date`) VALUES
(1, 10211296532584708, 23150, 'Que linda foto chicos! =D', '', '2017-03-15'),
(3, 10211296532584708, 23150, 'fachaaa =D', '', '2017-03-15'),
(4, 10211296532584708, 23149, 'weee =D', '', '2017-03-15'),
(5, 10211296532584708, 23148, 'JAjaja! =D', '', '2017-03-21'),
(6, 10154898164369884, 23148, 'Lalala!', '', '2017-03-21'),
(9, 10211296532584708, 23148, 'Que odna!', '', '2017-03-21'),
(10, 10211296532584708, 23152, 'Lalarelo', '', '2017-03-22'),
(11, 10211296532584708, 23148, 'Probando!', '', '2017-03-22'),
(12, 10211296532584708, 23148, 'otra!', '', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `content`, `contact`, `address`, `date`, `image`, `user_id`) VALUES
(1, 'Event1', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(2, 'Event2', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(3, 'Event3', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(4, 'Event4', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10154898164369884),
(10, 'lopo', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490466953555.jpg', 10211296532584708),
(11, 'lkmkl', 'ñl,', 'ñl,|ñl,|ñl,|', NULL, '2017-03-25', '', 10211296532584708),
(12, 'jjjj', NULL, NULL, NULL, '2017-03-25', '', 10211296532584708),
(13, 'kskKs', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490467528411.jpg', 10211296532584708),
(14, 'jjjjjj', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490467799324.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `user_id_1` bigint(20) DEFAULT NULL,
  `user_id_2` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `user_id_1`, `user_id_2`) VALUES
(14, 10211296532584708, 10154898164369884),
(15, 10154898164369884, 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
CREATE TABLE `hosts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `imagesProduct` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hosts`
--

INSERT INTO `hosts` (`id`, `title`, `place`, `content`, `contact`, `price`, `likes`, `comments`, `imagesProduct`, `user_id`) VALUES
(1, 'Host1', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(2, 'Host2', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(3, 'Host3', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(4, 'Host4', 'contenido 11', '3512056271', 'Tauranga', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(5, 'Host5', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `image_x_post`
--

DROP TABLE IF EXISTS `image_x_post`;
CREATE TABLE `image_x_post` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `image_x_post`
--

INSERT INTO `image_x_post` (`id`, `post_id`, `image`) VALUES
(12, 23135, 'http://kiwimate.000webhostapp.com/uploads-post/1489022865278.jpg'),
(13, 23136, 'http://kiwimate.000webhostapp.com/uploads-post/1489027068751.jpg'),
(14, 23137, 'http://kiwimate.000webhostapp.com/uploads-post/1489027356991.jpg'),
(15, 23138, 'http://kiwimate.000webhostapp.com/uploads-post/1489027484310.jpg'),
(16, 23139, 'http://kiwimate.000webhostapp.com/uploads-post/null'),
(24, 23147, ''),
(25, 23148, 'http://kiwimate.000webhostapp.com/uploads-post/1489029951449.jpg'),
(26, 23149, 'http://kiwimate.000webhostapp.com/uploads-post/1489059243799.jpg'),
(27, 23150, 'http://kiwimate.000webhostapp.com/uploads-post/1489150971912.jpg'),
(28, 23151, ''),
(29, 23152, '');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `type`, `date`, `content`, `contact`, `image`, `user_id`) VALUES
(1, 'Job1', 'Developer1', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(2, 'Job2', 'Developer2', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(3, 'Job3', 'Developer3', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(4, 'Job4', 'Developer4', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(5, 'Job5', 'Developer5', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(6, 'netbel sa', 'developer', '2017-03-24', 'Esese lalala', '35138283', 'http://kiwimate.000webhostapp.com/uploads-post/1490397229747.jpg', 10211296532584708),
(8, 'netbel sa', 'developer', '2017-03-24', '', '35138283', '', 10211296532584708),
(9, 'hoy apruebi', 'develop', '2017-03-24', 'Lalala lele fff', '27272', 'http://kiwimate.000webhostapp.com/uploads-post/1490397466828.jpg', 10211296532584708),
(22, 'porque porque', 'porque porque', '2017-03-25', 'porque porque', 'porque porque', '', 10211296532584708),
(23, 'jjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjj', '2017-03-25', 'jjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjj', '', 10211296532584708),
(24, 'olvidala de todo olvidala =D jaja', 'olvidala de todo olvidala =D jaja', '2017-03-25', 'olvidala de todo olvidala =D jaja', 'olvidala de todo olvidala =D jaja', '', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `kiwi_x_entity`
--

DROP TABLE IF EXISTS `kiwi_x_entity`;
CREATE TABLE `kiwi_x_entity` (
  `entity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kiwi_x_entity`
--

INSERT INTO `kiwi_x_entity` (`entity`, `entity_id`, `user_id`) VALUES
('post', 23149, 10211296532584708),
('post', 23139, 10211296532584708),
('post', 23147, 10211296532584708),
('post', 23150, 10211296532584708),
('post', 23148, 10211296532584708),
('post', 23151, 10211296532584708),
('post', 23135, 10211296532584708),
('post', 23138, 10211296532584708),
('post', 23152, 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_id_action` bigint(20) DEFAULT NULL,
  `viewed` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `action`, `entity`, `entity_id`, `user_id`, `user_id_action`, `viewed`, `date`) VALUES
(23, 'comment_to_owner', 'post', 23148, 10211296532584708, 10154898164369884, 'Y', '2017-03-19'),
(24, 'comment_notice', 'post', 23148, 10154898164369884, 10211296532584708, 'N', '2017-03-21'),
(25, 'new', 'post', 23152, 10154898164369884, 10211296532584708, 'N', '2017-03-21'),
(32, 'message', 'chat', 10154898164369884, 10211296532584708, 10154898164369884, 'Y', '2017-03-21'),
(33, 'like', 'post', 23151, 10211296532584708, 10154898164369884, 'N', '2017-03-21'),
(40, 'comment_notice', 'post', 23148, 10154898164369884, 10211296532584708, 'N', '2017-03-22'),
(41, 'like', 'post', 23135, 10211296532584708, 10211296532584708, 'N', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `rate` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `letter` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `thumb`, `type`, `address`, `content`, `rate`, `x`, `y`, `letter`, `user_id`) VALUES
(1, 'Sumo BBQ', 'img/thumb/r1_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho', 8, -37, 175, 'E', 10211296532584708),
(2, 'Hanoi hotel', 'img/thumb/r2_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 9, -37, 174, 'C', 10211296532584708),
(3, 'Chipa Chipa B', 'img/thumb/r3_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708),
(4, 'Sumo BBQ', 'img/thumb/r4_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708),
(5, 'Sumo BBQ', 'img/thumb/r5_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -37, 174, 'A', 10211296532584708),
(6, 'Sumo BBQ', 'img/thumb/r6_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 174, 'A', 10211296532584708),
(7, 'Sumo BBQ', 'img/thumb/r7_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `date`, `content`) VALUES
(23135, 10211296532584708, '2017-03-08', 'primer post kiwii'),
(23136, 10211296532584708, '2017-03-08', 'weee'),
(23137, 10211296532584708, '2017-03-08', NULL),
(23138, 10211296532584708, '2017-03-08', 'chicos'),
(23139, 10211296532584708, '2017-03-08', 'jajaja'),
(23147, 10211296532584708, '2017-03-09', 'andaaaa'),
(23148, 10211296532584708, '2017-03-09', 'kiwimate'),
(23149, 10211296532584708, '2017-03-09', 'foto kiwiii'),
(23150, 10211296532584708, '2017-03-10', 'weeee!! =D'),
(23151, 10211296532584708, '2017-03-20', 'Probando notificaciones del postt!!'),
(23152, 10211296532584708, '2017-03-20', 'Otro mas! =D');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `image`, `about`, `contact`, `city_id`) VALUES
(10154898164369884, 'Sergio Romero', 'Sergio Romero', 'https://scontent-gru2-2.xx.fbcdn.net/v/t1.0-9/15338709_10154898164369883_8739030542171846816_n.jpg?oh=525aa7102afea2b265fceb1ae28391ba&oe=596DBCCC', 'Hola Soy Sergio Romero ;)', '351228282', 2),
(10211296532584708, 'Adrian Dotta', 'Adrian Dotta', 'http://graph.facebook.com/10211296532584708/picture?type=large', 'Hola Soy adrian, y vengo de Argentina! =D', '3512222', 99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buysells`
--
ALTER TABLE `buysells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_tranf` (`user_id_1`),
  ADD KEY `user_id_resep` (`user_id_2`),
  ADD KEY `user_id_sender` (`user_id_sender`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_1` (`user_id_1`),
  ADD KEY `user_id_2` (`user_id_2`);

--
-- Indexes for table `hosts`
--
ALTER TABLE `hosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `image_x_post`
--
ALTER TABLE `image_x_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_action` (`user_id_action`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buysells`
--
ALTER TABLE `buysells`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `hosts`
--
ALTER TABLE `hosts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `image_x_post`
--
ALTER TABLE `image_x_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23153;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10211296532584709;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `buysells`
--
ALTER TABLE `buysells`
  ADD CONSTRAINT `buysells_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_3` FOREIGN KEY (`user_id_sender`) REFERENCES `users` (`id`);

--
-- Constraints for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  ADD CONSTRAINT `comment_x_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comment_x_post_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`);

--
-- Constraints for table `hosts`
--
ALTER TABLE `hosts`
  ADD CONSTRAINT `hosts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image_x_post`
--
ALTER TABLE `image_x_post`
  ADD CONSTRAINT `image_x_post_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_id_action`) REFERENCES `users` (`id`);

--
-- Constraints for table `places`
--
ALTER TABLE `places`
  ADD CONSTRAINT `places_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);
--
-- Database: `id889704_kiwimate`
--
DROP DATABASE IF EXISTS `id889704_kiwimate`;
CREATE DATABASE IF NOT EXISTS `id889704_kiwimate` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id889704_kiwimate`;

-- --------------------------------------------------------

--
-- Table structure for table `buysells`
--

DROP TABLE IF EXISTS `buysells`;
CREATE TABLE `buysells` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `buysells`
--

INSERT INTO `buysells` (`id`, `title`, `date`, `content`, `contact`, `price`, `likes`, `comments`, `image`, `user_id`) VALUES
(1, 'Product1', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10154898164369884),
(3, 'Product3', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(4, 'Product4', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(5, 'Product5', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(11, 'lololo', '2017-03-25', 'Lolo', 'ol', 66, NULL, NULL, 'http://kiwimate.000webhostapp.com/uploads-post/1490462589529.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `user_id_1` bigint(20) DEFAULT NULL,
  `user_id_2` bigint(20) DEFAULT NULL,
  `user_id_sender` bigint(20) DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user_id_1`, `user_id_2`, `user_id_sender`, `text`, `image`, `time`) VALUES
(1, 10154898164369884, 10211296532584708, 10154898164369884, 'Hola como andas? =D', '', '2017-03-14'),
(2, 10211296532584708, 10154898164369884, 10211296532584708, 'Muy bueno vos amigo kiwi?? =D', '', '2017-03-14'),
(3, 10211296532584708, 10154898164369884, 10211296532584708, 'lalaaa', '', '2017-03-14'),
(4, 10211296532584708, 10154898164369884, 10211296532584708, 'lero lero!', '', '2017-03-14'),
(5, 10211296532584708, 10154898164369884, 10211296532584708, 'listoo', '', '2017-03-24'),
(6, 10211296532584708, 10154898164369884, 10211296532584708, 'notificacino! =D', '', '2017-03-21'),
(7, 10211296532584708, 10154898164369884, 10211296532584708, 'Otro mas! =D', '', '2017-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `region`) VALUES
(1, 'Alexandra', 'Otago'),
(2, 'Arrowtown', 'Otago'),
(3, 'Ashburton', 'Canterbury'),
(4, 'Auckland', 'Auckland'),
(5, 'Balclutha', 'Otago'),
(6, 'Blenheim', 'Marlborough'),
(7, 'Carterton', 'Wellington'),
(8, 'Christchurch', 'Canterbury'),
(9, 'Cromwell', 'Otago'),
(10, 'Dannevirke', 'Manawatu-Wanganui'),
(11, 'Darfield', 'Canterbury'),
(12, 'Dargaville', 'Northland'),
(13, 'Dunedin', 'Otago'),
(14, 'Eltham', 'Taranaki'),
(15, 'Featherston', 'Wellington'),
(16, 'Feilding', 'Manawatu-Wanganui'),
(17, 'Foxton Community', 'Manawatu-Wanganui'),
(18, 'Geraldine', 'Canterbury'),
(19, 'Gisborne', 'Gisborne'),
(20, 'Gore', 'Southland'),
(21, 'Greymouth', 'West Coast'),
(22, 'Greytown', 'Wellington'),
(23, 'Hamilton', 'Waikato'),
(24, 'Hawera', 'Taranaki'),
(25, 'Helensville', 'Auckland'),
(26, 'Hokitika', 'West Coast'),
(27, 'Huntly', 'Waikato'),
(28, 'Inglewood', 'Taranaki'),
(29, 'Invercargill', 'Southland'),
(30, 'Kaikohe', 'Northland'),
(31, 'Kaikoura', 'Canterbury'),
(32, 'Kaitaia', 'Northland'),
(33, 'Kapiti', 'Wellington'),
(34, 'Katikati Community', 'Bay of Plenty'),
(35, 'Kawerau', 'Bay of Plenty'),
(36, 'Kerikeri', 'Northland'),
(37, 'Levin', 'Manawatu-Wanganui'),
(38, 'Lincoln', 'Canterbury'),
(39, 'Mapua', 'Tasman'),
(40, 'Marton', 'Manawatu-Wanganui'),
(41, 'Masterton', 'Wellington'),
(42, 'Matamata', 'Waikato'),
(43, 'Morrinsville', 'Waikato'),
(44, 'Motueka', 'Tasman'),
(45, 'Napier-Hastings', 'Hawke`s Bay'),
(46, 'Nelson', 'Nelson'),
(47, 'New Plymouth', 'Taranaki'),
(48, 'Oamaru', 'Otago'),
(49, 'Opotiki', 'Bay of Plenty'),
(50, 'Otaki', 'Wellington'),
(51, 'Otorohanga', 'Waikato'),
(52, 'Oxford', 'Canterbury'),
(53, 'Paeroa', 'Waikato'),
(54, 'Pahiatua', 'Manawatu-Wanganui'),
(55, 'Palmerston North', 'Manawatu-Wanganui'),
(56, 'Picton', 'Marlborough'),
(57, 'Pukekohe', 'Auckland'),
(58, 'Putaruru', 'Waikato'),
(59, 'Queenstown', 'Otago'),
(60, 'Raglan', 'Waikato'),
(61, 'Rangiora', 'Canterbury'),
(62, 'Rolleston', 'Canterbury'),
(63, 'Rotorua', 'Bay of Plenty'),
(64, 'Snells Beach', 'Auckland'),
(65, 'Stratford', 'Taranaki'),
(66, 'Taumarunui', 'Manawatu-Wanganui'),
(67, 'Taupo', 'Waikato'),
(68, 'Tauranga', 'Bay of Plenty'),
(69, 'Te Anau', 'Southland'),
(70, 'Te Aroha', 'Waikato'),
(71, 'Te Kuiti', 'Waikato'),
(72, 'Te Puke Community', 'Bay of Plenty'),
(73, 'Temuka', 'Canterbury'),
(74, 'Thames', 'Waikato'),
(75, 'Timaru', 'Canterbury'),
(76, 'Tokoroa', 'Waikato'),
(77, 'Turangi', 'Waikato'),
(78, 'Waiheke Island', 'Auckland'),
(79, 'Waihi', 'Waikato'),
(80, 'Waihi Beach', 'Bay of Plenty'),
(81, 'Waimate', 'Canterbury'),
(82, 'Waipawa', 'Hawkes Bay'),
(83, 'Waipukurau', 'Hawkes Bay'),
(84, 'Wairoa', 'Hawkes Bay'),
(85, 'Waitara', 'Taranaki'),
(86, 'Waiuku', 'Auckland'),
(87, 'Wakefield', 'Tasman'),
(88, 'Wanaka', 'Otago'),
(89, 'Warkworth', 'Auckland'),
(90, 'Wellington', 'Wellington'),
(91, 'Westport', 'West Coast'),
(92, 'Whakatane', 'Bay of Plenty'),
(93, 'Whangamata', 'Waikato'),
(94, 'Whanganui', 'Manawatu-Wanganui'),
(95, 'Whangarei', 'Northland'),
(96, 'Whitianga', 'Waikato'),
(97, 'Winton', 'Southland'),
(98, 'Woodend', 'Canterbury'),
(99, '.Argentina', 'Pais'),
(100, '.Chile', 'Pais'),
(101, '.Uruguay', 'Pais');

-- --------------------------------------------------------

--
-- Table structure for table `comment_x_post`
--

DROP TABLE IF EXISTS `comment_x_post`;
CREATE TABLE `comment_x_post` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment_x_post`
--

INSERT INTO `comment_x_post` (`id`, `user_id`, `post_id`, `comment`, `image`, `date`) VALUES
(1, 10211296532584708, 23150, 'Que linda foto chicos! =D', '', '2017-03-15'),
(3, 10211296532584708, 23150, 'fachaaa =D', '', '2017-03-15'),
(4, 10211296532584708, 23149, 'weee =D', '', '2017-03-15'),
(5, 10211296532584708, 23148, 'JAjaja! =D', '', '2017-03-21'),
(6, 10154898164369884, 23148, 'Lalala!', '', '2017-03-21'),
(9, 10211296532584708, 23148, 'Que odna!', '', '2017-03-21'),
(10, 10211296532584708, 23152, 'Lalarelo', '', '2017-03-22'),
(11, 10211296532584708, 23148, 'Probando!', '', '2017-03-22'),
(12, 10211296532584708, 23148, 'otra!', '', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `content`, `contact`, `address`, `date`, `image`, `user_id`) VALUES
(1, 'Event1', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(2, 'Event2', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(3, 'Event3', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(4, 'Event4', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10154898164369884),
(10, 'lopo', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490466953555.jpg', 10211296532584708),
(11, 'lkmkl', 'ñl,', 'ñl,|ñl,|ñl,|', NULL, '2017-03-25', '', 10211296532584708),
(12, 'jjjj', NULL, NULL, NULL, '2017-03-25', '', 10211296532584708),
(13, 'kskKs', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490467528411.jpg', 10211296532584708),
(14, 'jjjjjj', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490467799324.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `user_id_1` bigint(20) DEFAULT NULL,
  `user_id_2` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `user_id_1`, `user_id_2`) VALUES
(14, 10211296532584708, 10154898164369884),
(15, 10154898164369884, 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
CREATE TABLE `hosts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `imagesProduct` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hosts`
--

INSERT INTO `hosts` (`id`, `title`, `place`, `content`, `contact`, `price`, `likes`, `comments`, `imagesProduct`, `user_id`) VALUES
(1, 'Host1', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(2, 'Host2', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(3, 'Host3', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(4, 'Host4', 'contenido 11', '3512056271', 'Tauranga', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(5, 'Host5', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `image_x_post`
--

DROP TABLE IF EXISTS `image_x_post`;
CREATE TABLE `image_x_post` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `image_x_post`
--

INSERT INTO `image_x_post` (`id`, `post_id`, `image`) VALUES
(12, 23135, 'http://kiwimate.000webhostapp.com/uploads-post/1489022865278.jpg'),
(13, 23136, 'http://kiwimate.000webhostapp.com/uploads-post/1489027068751.jpg'),
(14, 23137, 'http://kiwimate.000webhostapp.com/uploads-post/1489027356991.jpg'),
(15, 23138, 'http://kiwimate.000webhostapp.com/uploads-post/1489027484310.jpg'),
(16, 23139, 'http://kiwimate.000webhostapp.com/uploads-post/null'),
(24, 23147, ''),
(25, 23148, 'http://kiwimate.000webhostapp.com/uploads-post/1489029951449.jpg'),
(26, 23149, 'http://kiwimate.000webhostapp.com/uploads-post/1489059243799.jpg'),
(27, 23150, 'http://kiwimate.000webhostapp.com/uploads-post/1489150971912.jpg'),
(28, 23151, ''),
(29, 23152, '');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `type`, `date`, `content`, `contact`, `image`, `user_id`) VALUES
(1, 'Job1', 'Developer1', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(2, 'Job2', 'Developer2', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(3, 'Job3', 'Developer3', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(4, 'Job4', 'Developer4', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(5, 'Job5', 'Developer5', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(6, 'netbel sa', 'developer', '2017-03-24', 'Esese lalala', '35138283', 'http://kiwimate.000webhostapp.com/uploads-post/1490397229747.jpg', 10211296532584708),
(8, 'netbel sa', 'developer', '2017-03-24', '', '35138283', '', 10211296532584708),
(9, 'hoy apruebi', 'develop', '2017-03-24', 'Lalala lele fff', '27272', 'http://kiwimate.000webhostapp.com/uploads-post/1490397466828.jpg', 10211296532584708),
(22, 'porque porque', 'porque porque', '2017-03-25', 'porque porque', 'porque porque', '', 10211296532584708),
(23, 'jjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjj', '2017-03-25', 'jjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjj', '', 10211296532584708),
(24, 'olvidala de todo olvidala =D jaja', 'olvidala de todo olvidala =D jaja', '2017-03-25', 'olvidala de todo olvidala =D jaja', 'olvidala de todo olvidala =D jaja', '', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `kiwi_x_entity`
--

DROP TABLE IF EXISTS `kiwi_x_entity`;
CREATE TABLE `kiwi_x_entity` (
  `entity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kiwi_x_entity`
--

INSERT INTO `kiwi_x_entity` (`entity`, `entity_id`, `user_id`) VALUES
('post', 23149, 10211296532584708),
('post', 23139, 10211296532584708),
('post', 23147, 10211296532584708),
('post', 23150, 10211296532584708),
('post', 23148, 10211296532584708),
('post', 23151, 10211296532584708),
('post', 23135, 10211296532584708),
('post', 23138, 10211296532584708),
('post', 23152, 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_id_action` bigint(20) DEFAULT NULL,
  `viewed` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `action`, `entity`, `entity_id`, `user_id`, `user_id_action`, `viewed`, `date`) VALUES
(23, 'comment_to_owner', 'post', 23148, 10211296532584708, 10154898164369884, 'Y', '2017-03-19'),
(24, 'comment_notice', 'post', 23148, 10154898164369884, 10211296532584708, 'N', '2017-03-21'),
(25, 'new', 'post', 23152, 10154898164369884, 10211296532584708, 'N', '2017-03-21'),
(32, 'message', 'chat', 10154898164369884, 10211296532584708, 10154898164369884, 'Y', '2017-03-21'),
(33, 'like', 'post', 23151, 10211296532584708, 10154898164369884, 'N', '2017-03-21'),
(40, 'comment_notice', 'post', 23148, 10154898164369884, 10211296532584708, 'N', '2017-03-22'),
(41, 'like', 'post', 23135, 10211296532584708, 10211296532584708, 'N', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `rate` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `letter` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `thumb`, `type`, `address`, `content`, `rate`, `x`, `y`, `letter`, `user_id`) VALUES
(1, 'Sumo BBQ', 'img/thumb/r1_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho', 8, -37, 175, 'E', 10211296532584708),
(2, 'Hanoi hotel', 'img/thumb/r2_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 9, -37, 174, 'C', 10211296532584708),
(3, 'Chipa Chipa B', 'img/thumb/r3_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708),
(4, 'Sumo BBQ', 'img/thumb/r4_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708),
(5, 'Sumo BBQ', 'img/thumb/r5_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -37, 174, 'A', 10211296532584708),
(6, 'Sumo BBQ', 'img/thumb/r6_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 174, 'A', 10211296532584708),
(7, 'Sumo BBQ', 'img/thumb/r7_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `date`, `content`) VALUES
(23135, 10211296532584708, '2017-03-08', 'primer post kiwii'),
(23136, 10211296532584708, '2017-03-08', 'weee'),
(23137, 10211296532584708, '2017-03-08', NULL),
(23138, 10211296532584708, '2017-03-08', 'chicos'),
(23139, 10211296532584708, '2017-03-08', 'jajaja'),
(23147, 10211296532584708, '2017-03-09', 'andaaaa'),
(23148, 10211296532584708, '2017-03-09', 'kiwimate'),
(23149, 10211296532584708, '2017-03-09', 'foto kiwiii'),
(23150, 10211296532584708, '2017-03-10', 'weeee!! =D'),
(23151, 10211296532584708, '2017-03-20', 'Probando notificaciones del postt!!'),
(23152, 10211296532584708, '2017-03-20', 'Otro mas! =D');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `image`, `about`, `contact`, `city_id`) VALUES
(10154898164369884, 'Sergio Romero', 'Sergio Romero', 'https://scontent-gru2-2.xx.fbcdn.net/v/t1.0-9/15338709_10154898164369883_8739030542171846816_n.jpg?oh=525aa7102afea2b265fceb1ae28391ba&oe=596DBCCC', 'Hola Soy Sergio Romero ;)', '351228282', 2),
(10211296532584708, 'Adrian Dotta', 'Adrian Dotta', 'http://graph.facebook.com/10211296532584708/picture?type=large', 'Hola Soy adrian, y vengo de Argentina! =D', '3512222', 99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buysells`
--
ALTER TABLE `buysells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_tranf` (`user_id_1`),
  ADD KEY `user_id_resep` (`user_id_2`),
  ADD KEY `user_id_sender` (`user_id_sender`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_1` (`user_id_1`),
  ADD KEY `user_id_2` (`user_id_2`);

--
-- Indexes for table `hosts`
--
ALTER TABLE `hosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `image_x_post`
--
ALTER TABLE `image_x_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_action` (`user_id_action`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buysells`
--
ALTER TABLE `buysells`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `hosts`
--
ALTER TABLE `hosts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `image_x_post`
--
ALTER TABLE `image_x_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23153;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10211296532584709;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `buysells`
--
ALTER TABLE `buysells`
  ADD CONSTRAINT `buysells_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_3` FOREIGN KEY (`user_id_sender`) REFERENCES `users` (`id`);

--
-- Constraints for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  ADD CONSTRAINT `comment_x_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comment_x_post_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`);

--
-- Constraints for table `hosts`
--
ALTER TABLE `hosts`
  ADD CONSTRAINT `hosts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image_x_post`
--
ALTER TABLE `image_x_post`
  ADD CONSTRAINT `image_x_post_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_id_action`) REFERENCES `users` (`id`);

--
-- Constraints for table `places`
--
ALTER TABLE `places`
  ADD CONSTRAINT `places_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);
--
-- Database: `id889704_kiwimate`
--
DROP DATABASE IF EXISTS `id889704_kiwimate`;
CREATE DATABASE IF NOT EXISTS `id889704_kiwimate` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id889704_kiwimate`;

-- --------------------------------------------------------

--
-- Table structure for table `buysells`
--

DROP TABLE IF EXISTS `buysells`;
CREATE TABLE `buysells` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `buysells`
--

INSERT INTO `buysells` (`id`, `title`, `date`, `content`, `contact`, `price`, `likes`, `comments`, `image`, `user_id`) VALUES
(1, 'Product1', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10154898164369884),
(3, 'Product3', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(4, 'Product4', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(5, 'Product5', '0000-00-00', 'contenido 11', '3512056271', 300, 55, 3, 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(11, 'lololo', '2017-03-25', 'Lolo', 'ol', 66, NULL, NULL, 'http://kiwimate.000webhostapp.com/uploads-post/1490462589529.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE `chats` (
  `id` int(11) NOT NULL,
  `user_id_1` bigint(20) DEFAULT NULL,
  `user_id_2` bigint(20) DEFAULT NULL,
  `user_id_sender` bigint(20) DEFAULT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `time` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user_id_1`, `user_id_2`, `user_id_sender`, `text`, `image`, `time`) VALUES
(1, 10154898164369884, 10211296532584708, 10154898164369884, 'Hola como andas? =D', '', '2017-03-14'),
(2, 10211296532584708, 10154898164369884, 10211296532584708, 'Muy bueno vos amigo kiwi?? =D', '', '2017-03-14'),
(3, 10211296532584708, 10154898164369884, 10211296532584708, 'lalaaa', '', '2017-03-14'),
(4, 10211296532584708, 10154898164369884, 10211296532584708, 'lero lero!', '', '2017-03-14'),
(5, 10211296532584708, 10154898164369884, 10211296532584708, 'listoo', '', '2017-03-24'),
(6, 10211296532584708, 10154898164369884, 10211296532584708, 'notificacino! =D', '', '2017-03-21'),
(7, 10211296532584708, 10154898164369884, 10211296532584708, 'Otro mas! =D', '', '2017-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `region`) VALUES
(1, 'Alexandra', 'Otago'),
(2, 'Arrowtown', 'Otago'),
(3, 'Ashburton', 'Canterbury'),
(4, 'Auckland', 'Auckland'),
(5, 'Balclutha', 'Otago'),
(6, 'Blenheim', 'Marlborough'),
(7, 'Carterton', 'Wellington'),
(8, 'Christchurch', 'Canterbury'),
(9, 'Cromwell', 'Otago'),
(10, 'Dannevirke', 'Manawatu-Wanganui'),
(11, 'Darfield', 'Canterbury'),
(12, 'Dargaville', 'Northland'),
(13, 'Dunedin', 'Otago'),
(14, 'Eltham', 'Taranaki'),
(15, 'Featherston', 'Wellington'),
(16, 'Feilding', 'Manawatu-Wanganui'),
(17, 'Foxton Community', 'Manawatu-Wanganui'),
(18, 'Geraldine', 'Canterbury'),
(19, 'Gisborne', 'Gisborne'),
(20, 'Gore', 'Southland'),
(21, 'Greymouth', 'West Coast'),
(22, 'Greytown', 'Wellington'),
(23, 'Hamilton', 'Waikato'),
(24, 'Hawera', 'Taranaki'),
(25, 'Helensville', 'Auckland'),
(26, 'Hokitika', 'West Coast'),
(27, 'Huntly', 'Waikato'),
(28, 'Inglewood', 'Taranaki'),
(29, 'Invercargill', 'Southland'),
(30, 'Kaikohe', 'Northland'),
(31, 'Kaikoura', 'Canterbury'),
(32, 'Kaitaia', 'Northland'),
(33, 'Kapiti', 'Wellington'),
(34, 'Katikati Community', 'Bay of Plenty'),
(35, 'Kawerau', 'Bay of Plenty'),
(36, 'Kerikeri', 'Northland'),
(37, 'Levin', 'Manawatu-Wanganui'),
(38, 'Lincoln', 'Canterbury'),
(39, 'Mapua', 'Tasman'),
(40, 'Marton', 'Manawatu-Wanganui'),
(41, 'Masterton', 'Wellington'),
(42, 'Matamata', 'Waikato'),
(43, 'Morrinsville', 'Waikato'),
(44, 'Motueka', 'Tasman'),
(45, 'Napier-Hastings', 'Hawke`s Bay'),
(46, 'Nelson', 'Nelson'),
(47, 'New Plymouth', 'Taranaki'),
(48, 'Oamaru', 'Otago'),
(49, 'Opotiki', 'Bay of Plenty'),
(50, 'Otaki', 'Wellington'),
(51, 'Otorohanga', 'Waikato'),
(52, 'Oxford', 'Canterbury'),
(53, 'Paeroa', 'Waikato'),
(54, 'Pahiatua', 'Manawatu-Wanganui'),
(55, 'Palmerston North', 'Manawatu-Wanganui'),
(56, 'Picton', 'Marlborough'),
(57, 'Pukekohe', 'Auckland'),
(58, 'Putaruru', 'Waikato'),
(59, 'Queenstown', 'Otago'),
(60, 'Raglan', 'Waikato'),
(61, 'Rangiora', 'Canterbury'),
(62, 'Rolleston', 'Canterbury'),
(63, 'Rotorua', 'Bay of Plenty'),
(64, 'Snells Beach', 'Auckland'),
(65, 'Stratford', 'Taranaki'),
(66, 'Taumarunui', 'Manawatu-Wanganui'),
(67, 'Taupo', 'Waikato'),
(68, 'Tauranga', 'Bay of Plenty'),
(69, 'Te Anau', 'Southland'),
(70, 'Te Aroha', 'Waikato'),
(71, 'Te Kuiti', 'Waikato'),
(72, 'Te Puke Community', 'Bay of Plenty'),
(73, 'Temuka', 'Canterbury'),
(74, 'Thames', 'Waikato'),
(75, 'Timaru', 'Canterbury'),
(76, 'Tokoroa', 'Waikato'),
(77, 'Turangi', 'Waikato'),
(78, 'Waiheke Island', 'Auckland'),
(79, 'Waihi', 'Waikato'),
(80, 'Waihi Beach', 'Bay of Plenty'),
(81, 'Waimate', 'Canterbury'),
(82, 'Waipawa', 'Hawkes Bay'),
(83, 'Waipukurau', 'Hawkes Bay'),
(84, 'Wairoa', 'Hawkes Bay'),
(85, 'Waitara', 'Taranaki'),
(86, 'Waiuku', 'Auckland'),
(87, 'Wakefield', 'Tasman'),
(88, 'Wanaka', 'Otago'),
(89, 'Warkworth', 'Auckland'),
(90, 'Wellington', 'Wellington'),
(91, 'Westport', 'West Coast'),
(92, 'Whakatane', 'Bay of Plenty'),
(93, 'Whangamata', 'Waikato'),
(94, 'Whanganui', 'Manawatu-Wanganui'),
(95, 'Whangarei', 'Northland'),
(96, 'Whitianga', 'Waikato'),
(97, 'Winton', 'Southland'),
(98, 'Woodend', 'Canterbury'),
(99, '.Argentina', 'Pais'),
(100, '.Chile', 'Pais'),
(101, '.Uruguay', 'Pais');

-- --------------------------------------------------------

--
-- Table structure for table `comment_x_post`
--

DROP TABLE IF EXISTS `comment_x_post`;
CREATE TABLE `comment_x_post` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `comment` mediumtext COLLATE utf8_unicode_ci,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `comment_x_post`
--

INSERT INTO `comment_x_post` (`id`, `user_id`, `post_id`, `comment`, `image`, `date`) VALUES
(1, 10211296532584708, 23150, 'Que linda foto chicos! =D', '', '2017-03-15'),
(3, 10211296532584708, 23150, 'fachaaa =D', '', '2017-03-15'),
(4, 10211296532584708, 23149, 'weee =D', '', '2017-03-15'),
(5, 10211296532584708, 23148, 'JAjaja! =D', '', '2017-03-21'),
(6, 10154898164369884, 23148, 'Lalala!', '', '2017-03-21'),
(9, 10211296532584708, 23148, 'Que odna!', '', '2017-03-21'),
(10, 10211296532584708, 23152, 'Lalarelo', '', '2017-03-22'),
(11, 10211296532584708, 23148, 'Probando!', '', '2017-03-22'),
(12, 10211296532584708, 23148, 'otra!', '', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `content`, `contact`, `address`, `date`, `image`, `user_id`) VALUES
(1, 'Event1', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(2, 'Event2', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(3, 'Event3', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10211296532584708),
(4, 'Event4', 'contenido 11', '3512056271', 'No 2,oseby', '0000-00-00', 'http://s.vida20.com/wp-content/uploads/2010/01/avatarManga.jpg', 10154898164369884),
(10, 'lopo', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490466953555.jpg', 10211296532584708),
(11, 'lkmkl', 'ñl,', 'ñl,|ñl,|ñl,|', NULL, '2017-03-25', '', 10211296532584708),
(12, 'jjjj', NULL, NULL, NULL, '2017-03-25', '', 10211296532584708),
(13, 'kskKs', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490467528411.jpg', 10211296532584708),
(14, 'jjjjjj', NULL, NULL, NULL, '2017-03-25', 'http://kiwimate.000webhostapp.com/uploads-post/1490467799324.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL,
  `user_id_1` bigint(20) DEFAULT NULL,
  `user_id_2` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `follow`
--

INSERT INTO `follow` (`id`, `user_id_1`, `user_id_2`) VALUES
(14, 10211296532584708, 10154898164369884),
(15, 10154898164369884, 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
CREATE TABLE `hosts` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `comments` int(11) DEFAULT NULL,
  `imagesProduct` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hosts`
--

INSERT INTO `hosts` (`id`, `title`, `place`, `content`, `contact`, `price`, `likes`, `comments`, `imagesProduct`, `user_id`) VALUES
(1, 'Host1', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(2, 'Host2', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(3, 'Host3', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(4, 'Host4', 'contenido 11', '3512056271', 'Tauranga', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708),
(5, 'Host5', 'contenido 11', '3512056271', 'Auckland', 300, 55, 3, 'http://www.sweethome3d.com/images/gallery2015/MaxHan.jpg', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `image_x_post`
--

DROP TABLE IF EXISTS `image_x_post`;
CREATE TABLE `image_x_post` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `image_x_post`
--

INSERT INTO `image_x_post` (`id`, `post_id`, `image`) VALUES
(12, 23135, 'http://kiwimate.000webhostapp.com/uploads-post/1489022865278.jpg'),
(13, 23136, 'http://kiwimate.000webhostapp.com/uploads-post/1489027068751.jpg'),
(14, 23137, 'http://kiwimate.000webhostapp.com/uploads-post/1489027356991.jpg'),
(15, 23138, 'http://kiwimate.000webhostapp.com/uploads-post/1489027484310.jpg'),
(16, 23139, 'http://kiwimate.000webhostapp.com/uploads-post/null'),
(24, 23147, ''),
(25, 23148, 'http://kiwimate.000webhostapp.com/uploads-post/1489029951449.jpg'),
(26, 23149, 'http://kiwimate.000webhostapp.com/uploads-post/1489059243799.jpg'),
(27, 23150, 'http://kiwimate.000webhostapp.com/uploads-post/1489150971912.jpg'),
(28, 23151, ''),
(29, 23152, '');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `type`, `date`, `content`, `contact`, `image`, `user_id`) VALUES
(1, 'Job1', 'Developer1', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(2, 'Job2', 'Developer2', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(3, 'Job3', 'Developer3', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(4, 'Job4', 'Developer4', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(5, 'Job5', 'Developer5', '0000-00-00', 'contenido 11', '3512056172', 'http://jsequeiros.com/sites/default/files/imagen-cachorro-comprimir.jpg', 10211296532584708),
(6, 'netbel sa', 'developer', '2017-03-24', 'Esese lalala', '35138283', 'http://kiwimate.000webhostapp.com/uploads-post/1490397229747.jpg', 10211296532584708),
(8, 'netbel sa', 'developer', '2017-03-24', '', '35138283', '', 10211296532584708),
(9, 'hoy apruebi', 'develop', '2017-03-24', 'Lalala lele fff', '27272', 'http://kiwimate.000webhostapp.com/uploads-post/1490397466828.jpg', 10211296532584708),
(22, 'porque porque', 'porque porque', '2017-03-25', 'porque porque', 'porque porque', '', 10211296532584708),
(23, 'jjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjj', '2017-03-25', 'jjjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjjjjjj', '', 10211296532584708),
(24, 'olvidala de todo olvidala =D jaja', 'olvidala de todo olvidala =D jaja', '2017-03-25', 'olvidala de todo olvidala =D jaja', 'olvidala de todo olvidala =D jaja', '', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `kiwi_x_entity`
--

DROP TABLE IF EXISTS `kiwi_x_entity`;
CREATE TABLE `kiwi_x_entity` (
  `entity` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `kiwi_x_entity`
--

INSERT INTO `kiwi_x_entity` (`entity`, `entity_id`, `user_id`) VALUES
('post', 23149, 10211296532584708),
('post', 23139, 10211296532584708),
('post', 23147, 10211296532584708),
('post', 23150, 10211296532584708),
('post', 23148, 10211296532584708),
('post', 23151, 10211296532584708),
('post', 23135, 10211296532584708),
('post', 23138, 10211296532584708),
('post', 23152, 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entity_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `user_id_action` bigint(20) DEFAULT NULL,
  `viewed` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `action`, `entity`, `entity_id`, `user_id`, `user_id_action`, `viewed`, `date`) VALUES
(23, 'comment_to_owner', 'post', 23148, 10211296532584708, 10154898164369884, 'Y', '2017-03-19'),
(24, 'comment_notice', 'post', 23148, 10154898164369884, 10211296532584708, 'N', '2017-03-21'),
(25, 'new', 'post', 23152, 10154898164369884, 10211296532584708, 'N', '2017-03-21'),
(32, 'message', 'chat', 10154898164369884, 10211296532584708, 10154898164369884, 'Y', '2017-03-21'),
(33, 'like', 'post', 23151, 10211296532584708, 10154898164369884, 'N', '2017-03-21'),
(40, 'comment_notice', 'post', 23148, 10154898164369884, 10211296532584708, 'N', '2017-03-22'),
(41, 'like', 'post', 23135, 10211296532584708, 10211296532584708, 'N', '2017-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `rate` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `letter` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `places`
--

INSERT INTO `places` (`id`, `name`, `thumb`, `type`, `address`, `content`, `rate`, `x`, `y`, `letter`, `user_id`) VALUES
(1, 'Sumo BBQ', 'img/thumb/r1_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho', 8, -37, 175, 'E', 10211296532584708),
(2, 'Hanoi hotel', 'img/thumb/r2_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 9, -37, 174, 'C', 10211296532584708),
(3, 'Chipa Chipa B', 'img/thumb/r3_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708),
(4, 'Sumo BBQ', 'img/thumb/r4_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708),
(5, 'Sumo BBQ', 'img/thumb/r5_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -37, 174, 'A', 10211296532584708),
(6, 'Sumo BBQ', 'img/thumb/r6_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 174, 'A', 10211296532584708),
(7, 'Sumo BBQ', 'img/thumb/r7_thumb.jpg', 'Restaurant', 'No 2, Loseby', 'texto mucho texto texto mucho texto texto mucho textotexto mucho textotextotexto mucho texto texto mucho texto', 8, -36, 175, 'A', 10211296532584708);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `date`, `content`) VALUES
(23135, 10211296532584708, '2017-03-08', 'primer post kiwii'),
(23136, 10211296532584708, '2017-03-08', 'weee'),
(23137, 10211296532584708, '2017-03-08', NULL),
(23138, 10211296532584708, '2017-03-08', 'chicos'),
(23139, 10211296532584708, '2017-03-08', 'jajaja'),
(23147, 10211296532584708, '2017-03-09', 'andaaaa'),
(23148, 10211296532584708, '2017-03-09', 'kiwimate'),
(23149, 10211296532584708, '2017-03-09', 'foto kiwiii'),
(23150, 10211296532584708, '2017-03-10', 'weeee!! =D'),
(23151, 10211296532584708, '2017-03-20', 'Probando notificaciones del postt!!'),
(23152, 10211296532584708, '2017-03-20', 'Otro mas! =D');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` mediumtext COLLATE utf8_unicode_ci,
  `contact` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `image`, `about`, `contact`, `city_id`) VALUES
(10154898164369884, 'Sergio Romero', 'Sergio Romero', 'https://scontent-gru2-2.xx.fbcdn.net/v/t1.0-9/15338709_10154898164369883_8739030542171846816_n.jpg?oh=525aa7102afea2b265fceb1ae28391ba&oe=596DBCCC', 'Hola Soy Sergio Romero ;)', '351228282', 2),
(10211296532584708, 'Adrian Dotta', 'Adrian Dotta', 'http://graph.facebook.com/10211296532584708/picture?type=large', 'Hola Soy adrian, y vengo de Argentina! =D', '3512222', 99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buysells`
--
ALTER TABLE `buysells`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `chats`
--
ALTER TABLE `chats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_tranf` (`user_id_1`),
  ADD KEY `user_id_resep` (`user_id_2`),
  ADD KEY `user_id_sender` (`user_id_sender`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `follow`
--
ALTER TABLE `follow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_1` (`user_id_1`),
  ADD KEY `user_id_2` (`user_id_2`);

--
-- Indexes for table `hosts`
--
ALTER TABLE `hosts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `image_x_post`
--
ALTER TABLE `image_x_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_action` (`user_id_action`);

--
-- Indexes for table `places`
--
ALTER TABLE `places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buysells`
--
ALTER TABLE `buysells`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `chats`
--
ALTER TABLE `chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;
--
-- AUTO_INCREMENT for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `follow`
--
ALTER TABLE `follow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `hosts`
--
ALTER TABLE `hosts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `image_x_post`
--
ALTER TABLE `image_x_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `places`
--
ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23153;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10211296532584709;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `buysells`
--
ALTER TABLE `buysells`
  ADD CONSTRAINT `buysells_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `chats`
--
ALTER TABLE `chats`
  ADD CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chats_ibfk_3` FOREIGN KEY (`user_id_sender`) REFERENCES `users` (`id`);

--
-- Constraints for table `comment_x_post`
--
ALTER TABLE `comment_x_post`
  ADD CONSTRAINT `comment_x_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comment_x_post_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `follow`
--
ALTER TABLE `follow`
  ADD CONSTRAINT `follow_ibfk_1` FOREIGN KEY (`user_id_1`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `follow_ibfk_2` FOREIGN KEY (`user_id_2`) REFERENCES `users` (`id`);

--
-- Constraints for table `hosts`
--
ALTER TABLE `hosts`
  ADD CONSTRAINT `hosts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image_x_post`
--
ALTER TABLE `image_x_post`
  ADD CONSTRAINT `image_x_post_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_id_action`) REFERENCES `users` (`id`);

--
-- Constraints for table `places`
--
ALTER TABLE `places`
  ADD CONSTRAINT `places_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
