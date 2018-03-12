-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 12, 2018 at 05:30 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
CREATE TABLE IF NOT EXISTS `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `name`, `date`) VALUES
(15, 'Διαφορα', '2018-02-02 21:55:36'),
(16, 'QREQEWF', '2018-02-04 13:07:24');

-- --------------------------------------------------------

--
-- Table structure for table `champion`
--

DROP TABLE IF EXISTS `champion`;
CREATE TABLE IF NOT EXISTS `champion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `champion`
--

INSERT INTO `champion` (`id`, `name`, `enddate`, `startdate`, `enabled`) VALUES
(16, 'Gillette Unileague 6x6', NULL, NULL, b'1'),
(17, 'The F Challenge 7x7', NULL, NULL, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobilenumber` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phonenumber` varchar(255) DEFAULT NULL,
  `position_id` int(11) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `imagepath` varchar(150) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `soccerposition` varchar(255) DEFAULT NULL,
  `adminteamid` int(11) DEFAULT NULL,
  `thumbpath` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adminteamid` (`adminteamid`),
  UNIQUE KEY `username` (`username`),
  KEY `FKqnposetujkibeu5161uk60hj7` (`position_id`),
  KEY `FKnyl1bqcm77w34tl615uoosjo8` (`adminteamid`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `address`, `age`, `email`, `mobilenumber`, `name`, `phonenumber`, `position_id`, `enabled`, `password`, `username`, `imagepath`, `number`, `soccerposition`, `adminteamid`, `thumbpath`) VALUES
(1, 'Zografou', 0, 'idim@intracom-telecom.com', '', 'Ilias Dimogerontas', '7926', NULL, b'1', '$2a$10$NZ0s/78owi0SSVkNdDcEQ.EPW4u5r.HDSqjXZbOOzYUBc1JrzGbHC', 'idim', NULL, NULL, NULL, NULL, NULL),
(2, 'Xolargos', 0, 'ansk@intracom-telecom.com', '  306932528945', 'Andreas Skapetis1', '7902', 2, b'1', '$2a$10$NZ0s/78owi0SSVkNdDcEQ.EPW4u5r.HDSqjXZbOOzYUBc1JrzGbHC', 'malm32', '/customimages/playerimage_2.jpg', '2', 'Goalkeeper', NULL, NULL),
(3, '', 0, 'geal@intracom-telecom.com', ' ', 'George Alexopoulos', '3551', NULL, b'1', '$2a$10$NZ0s/78owi0SSVkNdDcEQ.EPW4u5r.HDSqjXZbOOzYUBc1JrzGbHC', 'geal', NULL, NULL, NULL, NULL, NULL),
(5, '', 0, 'kgia@intracom-telecom.com', ' ', 'Konstantinos  Giannoulis', '3526', 1, b'1', '$2a$10$NZ0s/78owi0SSVkNdDcEQ.EPW4u5r.HDSqjXZbOOzYUBc1JrzGbHC', 'kgia', NULL, NULL, NULL, NULL, NULL),
(8, NULL, 0, NULL, NULL, 'vavasdva', NULL, NULL, b'0', NULL, NULL, NULL, '33', 'Goalkeeper', NULL, NULL),
(9, NULL, 0, NULL, NULL, 'thanassis', NULL, NULL, b'0', NULL, NULL, NULL, '33', 'Defender', NULL, NULL),
(10, NULL, 0, NULL, NULL, 'Spiros1', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_10.png', '22', 'Defender', NULL, NULL),
(11, NULL, 0, NULL, NULL, 'Metallica', NULL, NULL, b'0', NULL, NULL, NULL, '22', 'Defender', NULL, NULL),
(12, NULL, 0, NULL, NULL, 'xaxa', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_12.png', '33', 'Defender', NULL, NULL),
(13, NULL, 0, NULL, NULL, 'Thanasis giorgos', NULL, NULL, b'0', NULL, NULL, NULL, '33', 'Defender', NULL, NULL),
(14, NULL, 0, NULL, NULL, 'xristos', NULL, NULL, b'0', NULL, NULL, NULL, '13', 'Defender', NULL, NULL),
(15, NULL, 0, NULL, NULL, 'ANDREAS', NULL, NULL, b'0', NULL, NULL, NULL, '33333', 'Defender', NULL, NULL),
(16, NULL, 0, NULL, NULL, '1111', NULL, NULL, b'0', NULL, NULL, NULL, '22', 'Defender', NULL, NULL),
(17, NULL, 0, NULL, NULL, 'DDSDSAD', NULL, NULL, b'0', NULL, NULL, NULL, '333', 'Defender', NULL, NULL),
(18, NULL, 0, NULL, NULL, 'andreas', NULL, NULL, b'0', NULL, NULL, NULL, '33', 'Defender', NULL, NULL),
(19, NULL, 0, NULL, NULL, 'ewrqwef', NULL, NULL, b'0', NULL, NULL, NULL, '333', 'Defender', NULL, NULL),
(20, NULL, 0, NULL, NULL, '1111', NULL, NULL, b'0', NULL, NULL, NULL, '222', 'Goalkeeper', NULL, NULL),
(21, NULL, 0, NULL, NULL, '1asdfdsd', NULL, NULL, b'0', NULL, NULL, NULL, '33', 'Defender', NULL, NULL),
(22, NULL, 0, NULL, NULL, 'sfsd', NULL, NULL, b'0', NULL, NULL, NULL, '333', NULL, NULL, NULL),
(23, NULL, 0, NULL, NULL, '1111', NULL, NULL, b'0', NULL, NULL, NULL, '33', 'Goalkeeper', NULL, NULL),
(24, NULL, 0, NULL, NULL, 'andreas skapetis', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_24.jpg', '3', 'Goalkeeper', NULL, NULL),
(25, NULL, 0, NULL, NULL, 'Stavropoulos', NULL, NULL, b'0', NULL, NULL, '/defaultimages/playerdefaultimage.png', '4', '', NULL, NULL),
(26, NULL, 0, NULL, NULL, NULL, NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, NULL, 0, NULL, NULL, 'dgfasdgfsdgasdgasd', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, NULL, 0, NULL, NULL, 'metallica', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_28.jpg', NULL, NULL, NULL, NULL),
(29, NULL, 0, NULL, NULL, 'google', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, NULL, 0, NULL, NULL, 'metallica', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, NULL, 0, NULL, NULL, 'Dimitris Stavropoulos', NULL, NULL, b'0', NULL, NULL, '/defaultimages/playerdefaultimage.png', '', 'Defender', NULL, NULL),
(32, NULL, 0, NULL, NULL, 'Andreas Skapetis', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, NULL, 0, NULL, NULL, 'xristos', NULL, NULL, b'0', NULL, NULL, '/defaultimages/playerdefaultimage.png', '4', NULL, NULL, NULL),
(34, NULL, 0, NULL, NULL, 'dsfasdfasdferwes', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, NULL, 0, NULL, NULL, 'spiridonas', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, NULL, 0, NULL, NULL, 'dsfasdfasdfas', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, NULL, 0, NULL, NULL, 'xristofors', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, NULL, 0, NULL, NULL, 'xristofors', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, NULL, 0, NULL, NULL, 'xristofors', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, NULL, 0, NULL, NULL, 'xristofors', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, NULL, 0, NULL, NULL, 'xristofors', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, NULL, 0, NULL, NULL, 'xristofors', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, NULL, 0, NULL, NULL, 'xristofors', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, NULL, 0, NULL, NULL, 'xristofors1', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, NULL, 0, NULL, NULL, 'xristofors1', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, NULL, 0, NULL, NULL, 'xristoforos1', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, NULL, 0, NULL, NULL, 'xristoforos1', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, NULL, 0, NULL, NULL, 'dsdfsdf', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, NULL, 0, NULL, NULL, 'sdfsdfsadf', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, NULL, 0, NULL, NULL, 'amdreas', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, NULL, 0, NULL, NULL, 'amdreas', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, NULL, 0, NULL, NULL, 'amdreas', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, NULL, 0, NULL, NULL, 'stavropoulos', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, NULL, 0, NULL, NULL, 'Rossoneri MFC', NULL, NULL, b'1', '$2a$10$NZ0s/78owi0SSVkNdDcEQ.EPW4u5r.HDSqjXZbOOzYUBc1JrzGbHC', 'admin', NULL, NULL, NULL, NULL, NULL),
(55, NULL, 0, NULL, NULL, 'axaxax', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_8809_55.png', '3', 'Defender', NULL, '/customimages/playerthumb_8809_55.png'),
(56, NULL, 0, NULL, NULL, 'alekos', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_5655_56.jpg', '', 'Defender', NULL, '/customimages/playerthumb_5655_56.jpg'),
(57, NULL, 0, NULL, NULL, 'dimitris', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_8019_57.jpg', '', 'Goalkeeper', NULL, '/customimages/playerthumb_8019_57.jpg'),
(64, NULL, NULL, NULL, NULL, 'Î”Î·Î¼Î·Ï„ÏÎ·Ï‚ Î‘ÏÎ³Ï…ÏÎ·Ï‚', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_64.jpg', '3', 'Defender', NULL, NULL),
(65, NULL, NULL, NULL, NULL, 'ÎšÏ‰ÏƒÏ„Î±Ï‚ Î¡Î·Î³Î±Î»Î¿Ï‚', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_65.jpg', '4', 'Defender', NULL, NULL),
(66, NULL, NULL, NULL, NULL, 'DIMITRIS', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_66.jpg', '6', 'Defender', NULL, NULL),
(67, NULL, NULL, NULL, NULL, 'DIMITRIS', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, NULL, NULL, NULL, NULL, 'Gwegv', NULL, NULL, b'0', NULL, NULL, NULL, '6', 'Goalkeeper', NULL, NULL),
(98, NULL, NULL, NULL, NULL, 'sdfasdf', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_5915_98.jpg', '34', 'Defender', NULL, '/customimages/playerthumb_5915_98.jpg'),
(99, NULL, NULL, NULL, NULL, 'sdfas', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_5347_99.jpg', '34', 'Goalkeeper', NULL, '/customimages/playerthumb_5347_99.jpg'),
(105, NULL, NULL, NULL, NULL, 'dsfsdaf', NULL, NULL, b'0', NULL, NULL, NULL, '1212', 'Defender', NULL, NULL),
(106, NULL, NULL, NULL, NULL, 'Î±Î½Î´ÏÎµÎ±Ïƒ Î£ÎºÎ±Ï€ÎµÏ„Î·Ï‚1', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_5801_106.jpg', '2', 'Î¤ÎµÏÎ¼Î±Ï„Î¿Ï†Ï…Î»Î±ÎºÎ±Ï‚', NULL, '/customimages/playerthumb_5801_106.jpg'),
(107, NULL, NULL, NULL, NULL, 'Î£Ï„Î±Ï…ÏÎ¿Ï€Î¿Ï…Î»Î¿Ï‚', NULL, NULL, b'0', NULL, NULL, '/defaultimages/playerdefaultimage.png', '6', 'ÎœÎµÏƒÎ¿Ï‚', NULL, '/defaultimages/playerdefaultthumb.png'),
(108, NULL, NULL, NULL, NULL, 'sdfasdf', NULL, NULL, b'0', NULL, NULL, NULL, '34534', 'Î‘Î¼Ï…Î½Ï„Î¹ÎºÎ¿Ï‚', NULL, NULL),
(109, NULL, NULL, NULL, NULL, 'qergfad', NULL, NULL, b'0', NULL, NULL, NULL, '4', 'Î‘Î¼Ï…Î½Ï„Î¹ÎºÎ¿Ï‚', NULL, NULL),
(110, NULL, NULL, NULL, NULL, 'Ανδρεας Σκαπετης', NULL, NULL, b'1', '$2a$10$GroTJ0vJ4IW0ImStMTQw..g8k9tCKYXfU2/V0RNXBi.NtaJQ8k7XW', 'user', NULL, NULL, NULL, 82, NULL),
(111, NULL, NULL, NULL, NULL, 'Ανδρεας Σκαπετης', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_8084_111.jpg', '45', 'Αμυντικος', NULL, '/customimages/playerthumb_8084_111.jpg'),
(112, NULL, NULL, NULL, NULL, 'Χριστοπουλος', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, NULL, NULL, NULL, NULL, 'Σαραντοπουλος', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, NULL, NULL, NULL, NULL, 'ythegfhfr', NULL, NULL, b'0', NULL, NULL, NULL, NULL, 'Αμυντικος', NULL, NULL),
(116, NULL, NULL, NULL, NULL, 'Θανασης', NULL, NULL, b'1', '$2a$10$AneJYrhetYdKBUb9WISRo.9OwiamrBSK8ANkupx5o7Ql9EECC7bW6', 'user25', NULL, NULL, NULL, 97, NULL),
(118, NULL, NULL, NULL, NULL, 'Σκαπετης', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `adminid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adminid` (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id`, `name`, `description`, `date`, `adminid`) VALUES
(1, 'new years eve', 'new years descr', '2017-12-12 00:00:00', 1),
(2, 'salsa party', 'salsa party descr', '2017-11-30 00:00:00', 2),
(3, 'sdfawseta243wt', 'wegawergsdrfvasd', '2017-12-12 00:00:00', 1),
(4, '1132rqwefd', 'sadfsadfa', '2017-12-12 00:00:00', 2),
(5, 'sadfsdf02330wef', 'sdfasdfasd0fasdfsajdl', '2017-12-12 00:00:00', 2),
(6, 'AWrfasd', 'sdfsdafsd', NULL, 2),
(7, 'segfasd', 'ertq4w3ertga', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `eventplayerxref`
--

DROP TABLE IF EXISTS `eventplayerxref`;
CREATE TABLE IF NOT EXISTS `eventplayerxref` (
  `eventid` int(11) NOT NULL,
  `playerid` int(11) NOT NULL,
  PRIMARY KEY (`playerid`,`eventid`),
  KEY `eventid` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventplayerxref`
--

INSERT INTO `eventplayerxref` (`eventid`, `playerid`) VALUES
(1, 1),
(1, 5),
(2, 1),
(2, 3),
(2, 5);

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE IF NOT EXISTS `game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid1` int(11) DEFAULT NULL,
  `teamid2` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `matchdayid` int(11) DEFAULT NULL,
  `score1` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `score2` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phase` int(11) DEFAULT NULL,
  `championid` int(11) DEFAULT NULL,
  `playoffid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7pthcs6mnb7ejk2bqvb1557cn` (`matchdayid`),
  KEY `FKauvt3aa0uq47l6gtumtwfnt2n` (`teamid1`),
  KEY `FKo63pplnj6o7x500io9lippcuc` (`teamid2`),
  KEY `FKls9diasf8reb66lvy9i5iq034` (`championid`),
  KEY `FK6sqest9c9us6q7w9eki1asu0t` (`playoffid`)
) ENGINE=InnoDB AUTO_INCREMENT=2084 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `teamid1`, `teamid2`, `date`, `matchdayid`, `score1`, `score2`, `phase`, `championid`, `playoffid`) VALUES
(1976, 83, 82, '2018-02-15 21:00:00', 464, '2', '3', NULL, NULL, NULL),
(1977, 84, 96, '2018-01-18 21:00:00', 464, '3', '4', NULL, NULL, NULL),
(1978, 85, 94, '2018-01-01 23:00:00', 464, '1', '4', NULL, NULL, NULL),
(1979, 86, 93, NULL, 464, NULL, NULL, NULL, NULL, NULL),
(1980, 87, 92, NULL, 464, '1', '2', NULL, NULL, NULL),
(1981, 88, 91, NULL, 464, NULL, NULL, NULL, NULL, NULL),
(1982, 89, 90, NULL, 464, '2', '4', NULL, NULL, NULL),
(1983, 84, 82, '2018-02-21 21:00:00', 465, NULL, '0', NULL, NULL, NULL),
(1984, 85, 83, NULL, 465, NULL, NULL, NULL, NULL, NULL),
(1985, 86, 96, '2018-02-06 20:00:00', 465, NULL, NULL, NULL, NULL, NULL),
(1986, 87, 94, '2018-02-08 20:00:00', 465, NULL, NULL, NULL, NULL, NULL),
(1987, 88, 93, '2018-02-07 21:00:00', 465, NULL, NULL, NULL, NULL, NULL),
(1988, 89, 92, '2018-02-06 22:00:00', 465, NULL, NULL, NULL, NULL, NULL),
(1989, 90, 91, NULL, 476, NULL, NULL, NULL, NULL, NULL),
(1990, 85, 82, '2018-02-06 00:00:00', 466, NULL, NULL, NULL, NULL, NULL),
(1991, 86, 84, NULL, 466, NULL, NULL, NULL, NULL, NULL),
(1992, 87, 83, NULL, 466, NULL, NULL, NULL, NULL, NULL),
(1993, 88, 96, NULL, 466, NULL, NULL, NULL, NULL, NULL),
(1994, 89, 94, NULL, 466, NULL, NULL, NULL, NULL, NULL),
(1995, 90, 93, NULL, 466, NULL, NULL, NULL, NULL, NULL),
(1996, 91, 92, NULL, 466, NULL, NULL, NULL, NULL, NULL),
(1997, 86, 82, '2018-02-06 19:00:00', 467, NULL, NULL, NULL, NULL, NULL),
(1998, 87, 85, NULL, 467, NULL, NULL, NULL, NULL, NULL),
(1999, 88, 84, NULL, 467, NULL, NULL, NULL, NULL, NULL),
(2000, 89, 83, NULL, 467, NULL, NULL, NULL, NULL, NULL),
(2001, 90, 96, NULL, 467, NULL, NULL, NULL, NULL, NULL),
(2002, 91, 94, NULL, 467, NULL, NULL, NULL, NULL, NULL),
(2003, 92, 93, NULL, 467, NULL, NULL, NULL, NULL, NULL),
(2004, 87, 82, '2018-02-03 23:00:00', 468, NULL, NULL, NULL, NULL, NULL),
(2005, 88, 86, NULL, 468, NULL, NULL, NULL, NULL, NULL),
(2006, 89, 85, NULL, 468, NULL, NULL, NULL, NULL, NULL),
(2007, 90, 84, NULL, 468, NULL, NULL, NULL, NULL, NULL),
(2008, 91, 83, NULL, 468, NULL, NULL, NULL, NULL, NULL),
(2009, 92, 96, NULL, 468, NULL, NULL, NULL, NULL, NULL),
(2010, 93, 94, NULL, 468, NULL, NULL, NULL, NULL, NULL),
(2011, 88, 82, NULL, 469, NULL, NULL, NULL, NULL, NULL),
(2012, 89, 87, NULL, 469, NULL, NULL, NULL, NULL, NULL),
(2013, 90, 86, NULL, 469, NULL, NULL, NULL, NULL, NULL),
(2014, 91, 85, NULL, 469, NULL, NULL, NULL, NULL, NULL),
(2015, 92, 84, NULL, 469, NULL, NULL, NULL, NULL, NULL),
(2016, 93, 83, NULL, 469, NULL, NULL, NULL, NULL, NULL),
(2017, 94, 96, NULL, 469, NULL, NULL, NULL, NULL, NULL),
(2018, 89, 82, NULL, 470, NULL, NULL, NULL, NULL, NULL),
(2019, 90, 88, NULL, 470, NULL, NULL, NULL, NULL, NULL),
(2020, 91, 87, NULL, 470, NULL, NULL, NULL, NULL, NULL),
(2021, 92, 86, NULL, 470, NULL, NULL, NULL, NULL, NULL),
(2022, 93, 85, NULL, 470, NULL, NULL, NULL, NULL, NULL),
(2023, 94, 84, NULL, 470, NULL, NULL, NULL, NULL, NULL),
(2024, 96, 83, NULL, 470, NULL, NULL, NULL, NULL, NULL),
(2025, 90, 82, NULL, 471, NULL, NULL, NULL, NULL, NULL),
(2026, 91, 89, NULL, 471, NULL, NULL, NULL, NULL, NULL),
(2027, 92, 88, NULL, 471, NULL, NULL, NULL, NULL, NULL),
(2028, 93, 87, NULL, 471, NULL, NULL, NULL, NULL, NULL),
(2029, 94, 86, NULL, 471, NULL, NULL, NULL, NULL, NULL),
(2030, 96, 85, NULL, 471, NULL, NULL, NULL, NULL, NULL),
(2031, 83, 84, NULL, 471, NULL, NULL, NULL, NULL, NULL),
(2032, 91, 82, NULL, 472, NULL, NULL, NULL, NULL, NULL),
(2033, 92, 90, NULL, 472, NULL, NULL, NULL, NULL, NULL),
(2034, 93, 89, NULL, 472, NULL, NULL, NULL, NULL, NULL),
(2035, 94, 88, NULL, 472, NULL, NULL, NULL, NULL, NULL),
(2036, 96, 87, NULL, 472, NULL, NULL, NULL, NULL, NULL),
(2037, 83, 86, NULL, 472, NULL, NULL, NULL, NULL, NULL),
(2038, 84, 85, NULL, 472, NULL, NULL, NULL, NULL, NULL),
(2039, 92, 82, NULL, 473, NULL, NULL, NULL, NULL, NULL),
(2040, 93, 91, NULL, 473, NULL, NULL, NULL, NULL, NULL),
(2041, 94, 90, NULL, 473, NULL, NULL, NULL, NULL, NULL),
(2042, 96, 89, NULL, 473, NULL, NULL, NULL, NULL, NULL),
(2043, 83, 88, NULL, 473, NULL, NULL, NULL, NULL, NULL),
(2044, 84, 87, NULL, 473, NULL, NULL, NULL, NULL, NULL),
(2045, 85, 86, NULL, 473, NULL, NULL, NULL, NULL, NULL),
(2046, 93, 82, NULL, 474, NULL, NULL, NULL, NULL, NULL),
(2047, 94, 92, NULL, 474, NULL, NULL, NULL, NULL, NULL),
(2048, 96, 91, NULL, 474, NULL, NULL, NULL, NULL, NULL),
(2049, 83, 90, NULL, 474, NULL, NULL, NULL, NULL, NULL),
(2050, 84, 89, NULL, 474, NULL, NULL, NULL, NULL, NULL),
(2051, 85, 88, NULL, 474, NULL, NULL, NULL, NULL, NULL),
(2052, 86, 87, NULL, 474, NULL, NULL, NULL, NULL, NULL),
(2053, 94, 82, NULL, 475, NULL, NULL, NULL, NULL, NULL),
(2054, 96, 93, NULL, 475, NULL, NULL, NULL, NULL, NULL),
(2055, 83, 92, NULL, 475, NULL, NULL, NULL, NULL, NULL),
(2056, 84, 91, NULL, 475, NULL, NULL, NULL, NULL, NULL),
(2057, 85, 90, NULL, 475, NULL, NULL, NULL, NULL, NULL),
(2058, 86, 89, NULL, 475, NULL, NULL, NULL, NULL, NULL),
(2059, 87, 88, NULL, 475, NULL, NULL, NULL, NULL, NULL),
(2060, 96, 82, NULL, 476, NULL, NULL, NULL, NULL, NULL),
(2061, 83, 94, NULL, 476, NULL, NULL, NULL, NULL, NULL),
(2062, 84, 93, NULL, 476, NULL, NULL, NULL, NULL, NULL),
(2063, 85, 92, NULL, 476, NULL, NULL, NULL, NULL, NULL),
(2064, 86, 91, NULL, 476, NULL, NULL, NULL, NULL, NULL),
(2065, 87, 90, NULL, 476, NULL, NULL, NULL, NULL, NULL),
(2066, 88, 89, NULL, 476, NULL, NULL, NULL, NULL, NULL),
(2067, 98, 97, NULL, 478, NULL, NULL, NULL, NULL, NULL),
(2068, 100, 91, '2018-02-05 20:00:00', 477, '3', '2', NULL, NULL, NULL),
(2069, 99, 97, NULL, 478, NULL, NULL, NULL, NULL, NULL),
(2070, 100, 98, NULL, 477, NULL, NULL, NULL, NULL, NULL),
(2071, 100, 97, NULL, 479, NULL, NULL, NULL, NULL, NULL),
(2072, 91, 99, NULL, 479, NULL, NULL, NULL, NULL, NULL),
(2073, 91, 97, NULL, 480, NULL, NULL, NULL, NULL, NULL),
(2074, 98, 99, NULL, 480, NULL, NULL, NULL, NULL, NULL),
(2075, 98, 91, NULL, 481, NULL, NULL, NULL, NULL, NULL),
(2076, 99, 100, NULL, 481, NULL, NULL, NULL, NULL, NULL),
(2078, 87, 90, NULL, 483, NULL, NULL, NULL, NULL, NULL),
(2079, 91, 84, NULL, 483, NULL, NULL, NULL, NULL, NULL),
(2080, 91, 90, NULL, 484, NULL, NULL, NULL, NULL, NULL),
(2081, 84, 87, NULL, 484, NULL, NULL, NULL, NULL, NULL),
(2082, 84, 90, NULL, 485, NULL, NULL, NULL, NULL, NULL),
(2083, 87, 91, NULL, 485, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `albumid` int(11) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `thumburl` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqidoqxsfnm9tnd92ge9hwuesy` (`albumid`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `albumid`, `url`, `thumburl`) VALUES
(138, 15, '/customimages/albumimage_album15_image138.jpg', '/customimages/albumimage_thumb_album15_image138.jpg'),
(139, 15, '/customimages/albumimage_album15_image139.jpg', '/customimages/albumimage_thumb_album15_image139.jpg'),
(140, 15, '/customimages/albumimage_album15_image140.jpg', '/customimages/albumimage_thumb_album15_image140.jpg'),
(141, 15, '/customimages/albumimage_album15_image141.jpg', '/customimages/albumimage_thumb_album15_image141.jpg'),
(142, 16, '/customimages/albumimage_album16_image142.png', '/customimages/albumimage_thumb_album16_image142.png'),
(143, 16, '/customimages/albumimage_album16_image143.png', '/customimages/albumimage_thumb_album16_image143.png'),
(144, 16, '/customimages/albumimage_album16_image144.png', '/customimages/albumimage_thumb_album16_image144.png'),
(145, 16, '/customimages/albumimage_album16_image145.png', '/customimages/albumimage_thumb_album16_image145.png'),
(146, 16, '/customimages/albumimage_album16_image146.png', '/customimages/albumimage_thumb_album16_image146.png');

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
CREATE TABLE IF NOT EXISTS `information` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `message` longtext,
  `teamid` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `gameid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8hh0pu4w8l5aesa1k0b0veuno` (`teamid`),
  KEY `FK2i5mk9b9kjbtd31l85sy5rp3r` (`gameid`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `information`
--

INSERT INTO `information` (`id`, `date`, `message`, `teamid`, `title`, `gameid`) VALUES
(93, '2018-02-04 19:57:08', 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ - INTER ΕΚΠΛΗΞΗ (Thu Feb 15 21:00:00 EET 2018)', 83, 'Νέος Αγώνας!', NULL),
(94, '2018-02-04 19:57:08', 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ - INTER ΕΚΠΛΗΞΗ (Thu Feb 15 21:00:00 EET 2018)', 82, 'Νέος Αγώνας!', NULL),
(95, '2018-02-04 19:58:58', 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ - INTER ΕΚΠΛΗΞΗ (Thu Feb 15 21:00:00 EET 2018)', 83, 'Νέος Αγώνας!', NULL),
(96, '2018-02-04 19:58:58', 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ - INTER ΕΚΠΛΗΞΗ (Thu Feb 15 21:00:00 EET 2018)', 82, 'Νέος Αγώνας!', NULL),
(97, '2018-02-04 20:00:14', 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ - INTER ΕΚΠΛΗΞΗ (Thu Feb 15 21:00:00 EET 2018)', 83, 'Νέος Αγώνας!', NULL),
(98, '2018-02-04 20:00:14', 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ - INTER ΕΚΠΛΗΞΗ (Thu Feb 15 21:00:00 EET 2018)', 82, 'Νέος Αγώνας!', NULL),
(99, '2018-02-04 20:01:03', 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ - INTER ΕΚΠΛΗΞΗ (Thu Feb 15 21:00:00 EET 2018)', 83, 'Νέος Αγώνας!', NULL),
(100, '2018-02-04 20:01:03', 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ - INTER ΕΚΠΛΗΞΗ (Thu Feb 15 21:00:00 EET 2018)', 82, 'Νέος Αγώνας!', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `matchday`
--

DROP TABLE IF EXISTS `matchday`;
CREATE TABLE IF NOT EXISTS `matchday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `teamgroupid` int(11) DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK26my16jbkyp7csl62ce9vv8yi` (`teamgroupid`)
) ENGINE=InnoDB AUTO_INCREMENT=486 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matchday`
--

INSERT INTO `matchday` (`id`, `name`, `teamgroupid`, `enddate`, `startdate`) VALUES
(464, 'ΑΓΩΝΙΣΤΙΚΗ 01', 31, NULL, NULL),
(465, 'ΑΓΩΝΙΣΤΙΚΗ 02', 31, NULL, NULL),
(466, 'ΑΓΩΝΙΣΤΙΚΗ 03', 31, NULL, NULL),
(467, 'ΑΓΩΝΙΣΤΙΚΗ 04', 31, NULL, NULL),
(468, 'ΑΓΩΝΙΣΤΙΚΗ 05', 31, NULL, NULL),
(469, 'ΑΓΩΝΙΣΤΙΚΗ 06', 31, NULL, NULL),
(470, 'ΑΓΩΝΙΣΤΙΚΗ 07', 31, NULL, NULL),
(471, 'ΑΓΩΝΙΣΤΙΚΗ 08', 31, NULL, NULL),
(472, 'ΑΓΩΝΙΣΤΙΚΗ 09', 31, NULL, NULL),
(473, 'ΑΓΩΝΙΣΤΙΚΗ 10', 31, NULL, NULL),
(474, 'ΑΓΩΝΙΣΤΙΚΗ 11', 31, NULL, NULL),
(475, 'ΑΓΩΝΙΣΤΙΚΗ 12', 31, NULL, NULL),
(476, 'ΑΓΩΝΙΣΤΙΚΗ 13', 31, NULL, NULL),
(477, 'ΑΓΩΝΙΣΤΙΚΗ 01', 32, NULL, NULL),
(478, 'ΑΓΩΝΙΣΤΙΚΗ 02', 32, NULL, NULL),
(479, 'ΑΓΩΝΙΣΤΙΚΗ 03', 32, NULL, NULL),
(480, 'ΑΓΩΝΙΣΤΙΚΗ 04', 32, NULL, NULL),
(481, 'ΑΓΩΝΙΣΤΙΚΗ 05', 32, NULL, NULL),
(482, '344444', 32, NULL, NULL),
(483, 'ΑΓΩΝΙΣΤΙΚΗ 01', 33, NULL, NULL),
(484, 'ΑΓΩΝΙΣΤΙΚΗ 02', 33, NULL, NULL),
(485, 'ΑΓΩΝΙΣΤΙΚΗ 03', 33, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext CHARACTER SET utf8,
  `eventid` int(11) DEFAULT NULL,
  `contactid` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `delivered` bit(1) DEFAULT NULL,
  `seen` bit(1) DEFAULT NULL,
  `receiverid` int(11) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7ssjguyeuyrbhvdremfxlvrad` (`eventid`),
  KEY `FKcmklxor1li66peguma7qlqfyb` (`contactid`),
  KEY `FKfvngx0qbrcwk4n9rg6ynq7m5i` (`receiverid`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `message`, `eventid`, `contactid`, `date`, `delivered`, `seen`, `receiverid`, `status`) VALUES
(34, 'ηι', NULL, 54, '2018-02-03 19:22:48', b'0', b'0', 110, 'Seen'),
(35, 'jjj', NULL, 54, '2018-02-04 13:28:47', b'0', b'0', 110, 'Seen');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE IF NOT EXISTS `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext,
  `date` datetime DEFAULT NULL,
  `imageurl` longtext,
  `title` longtext,
  `thumburl` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `content`, `date`, `imageurl`, `title`, `thumburl`) VALUES
(2, 'Η Χετάφε ανακοίνωσε ότι απέκτησε ως ελεύθερο τον πρώην μέσο των Αρσεναλ, Μίλαν, Μαρσέιγ, Ματιέ Φλαμινί.', '2018-02-02 22:01:55', '/customimages/noticeimage_3028_2.jpg', 'Πηρε Φλαμινι η Χεταφε', '/customimages/noticethumb_3028_2.jpg'),
(3, 'Ο Άντονι Γκιλ με καλάθι του στην τελευταία φάση του ματς με την Μάλαγα, χάρισε τη νίκη στην Χίμκι με 68-66.', '2018-02-02 22:01:45', '/customimages/noticeimage_7019_3.jpg', 'To νικητηριο καλαθι του Γκιλ που «σκοτωσε» τη Μαλαγα! (vid)', '/customimages/noticethumb_7019_3.jpg'),
(4, 'Ο Πανιώνιος μετρά απουσίες για το αυριανό ματς της Λάρισας', '2018-02-02 22:01:31', '/customimages/noticeimage_7226_4.jpg', 'Χωρις Σιωπη, Ντουρμισαι', '/customimages/noticethumb_7226_4.jpg'),
(5, 'Το gazzetta.gr με το τελος και της χειμερινης μεταγραφικης περιοδου συγκέντρωσε τα σημαντικότερα ποσά γύρω από το ρόστερ του ΠΑΟΚ και το ασπρόμαυρο...', '2018-02-02 22:01:05', '/customimages/noticeimage_6814_5.jpg', 'Ροστερ αξιας 31 εκατ. ευρω!', '/customimages/noticethumb_6814_5.jpg'),
(6, 'ERGDF', '2018-02-04 13:06:49', '/customimages/noticeimage_9188_6.png', 'DFGDF', '/customimages/noticethumb_9188_6.png');

-- --------------------------------------------------------

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE IF NOT EXISTS `persistent_logins` (
  `username` varchar(100) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL,
  PRIMARY KEY (`series`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `persistent_logins`
--

INSERT INTO `persistent_logins` (`username`, `series`, `token`, `last_used`) VALUES
('theo', 'S/c8Lbx1A4UoJLIvcv5u6Q==', 'oY2Z3PMpmonn3s43yfea+Q==', '2018-01-28 13:27:04'),
('costasd', '9g2k+8QkUxROTvpAaFXROA==', '2oTDtop4C6w6HC0hzs7R8Q==', '2018-01-30 15:28:13'),
('user', '5MFG3rHQjK+8vqMPUD0o6A==', 'Fv3GO+YDEBUtRcbwATLRgw==', '2018-02-04 11:26:54');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
CREATE TABLE IF NOT EXISTS `person` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `country` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
CREATE TABLE IF NOT EXISTS `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`id`, `name`) VALUES
(1, 'andreas'),
(2, 'xristos'),
(3, 'thanassis'),
(4, 'nikolas'),
(5, 'xristoforos');

-- --------------------------------------------------------

--
-- Table structure for table `playoff`
--

DROP TABLE IF EXISTS `playoff`;
CREATE TABLE IF NOT EXISTS `playoff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phase` int(11) DEFAULT NULL,
  `championid` int(11) DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdi3x38a5lwt79lm1123mxie56` (`championid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playoff`
--

INSERT INTO `playoff` (`id`, `phase`, `championid`, `name`) VALUES
(16, NULL, NULL, '????????? - ????? ?');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
CREATE TABLE IF NOT EXISTS `position` (
  `position_id` int(11) NOT NULL AUTO_INCREMENT,
  `position` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`position_id`, `position`) VALUES
(1, 'Employee'),
(2, 'Director');

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
CREATE TABLE IF NOT EXISTS `salary` (
  `salary_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `salary` double NOT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`salary_id`),
  KEY `FKajmf4optcvdbvfy1tv7xu87us` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`salary_id`, `date`, `salary`, `id`) VALUES
(1, '2015-10-11 00:00:00', 1020, 1),
(2, '2015-10-11 00:00:00', 1020, 2),
(3, '2015-10-11 00:00:00', 1020, 2),
(4, '2015-10-11 00:00:00', 1020, 1),
(5, '2017-10-11 00:00:00', 1065, 2),
(9, '2017-10-07 00:00:00', 1230, 3),
(10, '2017-12-07 00:00:00', 1230, 3),
(11, '2017-12-11 00:00:00', 1230, 3),
(12, '2017-12-02 00:00:00', 1230, 3);

-- --------------------------------------------------------

--
-- Table structure for table `scorer`
--

DROP TABLE IF EXISTS `scorer`;
CREATE TABLE IF NOT EXISTS `scorer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `gameid` int(11) DEFAULT NULL,
  `teamgroupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contactid` (`contactid`,`gameid`),
  KEY `FKiji4rftl3ofxndxrhvujf3xna` (`contactid`),
  KEY `FK8gbmemjt8mtalxjwcvtnwwhy2` (`gameid`),
  KEY `FKebxirlx7h7vhsg1a0gxlp3nux` (`teamgroupid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scorer`
--

INSERT INTO `scorer` (`id`, `contactid`, `number`, `gameid`, `teamgroupid`) VALUES
(1, 111, 4, 1976, 31),
(2, 112, 3, 1976, 31),
(3, 113, 2, 1976, 31),
(4, 118, 4, 2068, 32);

-- --------------------------------------------------------

--
-- Table structure for table `standing`
--

DROP TABLE IF EXISTS `standing`;
CREATE TABLE IF NOT EXISTS `standing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teamid` int(11) DEFAULT NULL,
  `teamgroupid` int(11) DEFAULT NULL,
  `defeat` int(11) DEFAULT '0',
  `draw` int(11) DEFAULT '0',
  `game` int(11) DEFAULT '0',
  `goal` int(11) DEFAULT '0',
  `goalminus` int(11) DEFAULT '0',
  `goalplus` int(11) DEFAULT '0',
  `grade` int(11) NOT NULL DEFAULT '0',
  `win` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_team` (`teamid`,`teamgroupid`),
  KEY `FKn7fmrb4wi0atwwfvem2cc9cj8` (`teamgroupid`)
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standing`
--

INSERT INTO `standing` (`id`, `teamid`, `teamgroupid`, `defeat`, `draw`, `game`, `goal`, `goalminus`, `goalplus`, `grade`, `win`) VALUES
(122, 82, 31, 0, 0, 1, 1, 2, 3, 3, 1),
(123, 83, 31, 1, 0, 1, -1, 3, 2, 0, 0),
(124, 84, 31, 1, 0, 1, -1, 4, 3, 0, 0),
(125, 85, 31, 1, 0, 1, -3, 4, 1, 0, 0),
(126, 86, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(127, 87, 31, 1, 0, 1, -1, 2, 1, 0, 0),
(128, 88, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(129, 89, 31, 1, 0, 1, -2, 4, 2, 0, 0),
(130, 90, 31, 0, 0, 1, 2, 2, 4, 3, 1),
(131, 91, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(132, 92, 31, 0, 0, 1, 1, 1, 2, 3, 1),
(133, 93, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(134, 94, 31, 0, 0, 1, 3, 1, 4, 3, 1),
(135, 96, 31, 0, 0, 1, 1, 3, 4, 3, 1),
(136, 97, 32, 0, 0, 0, 0, 0, 0, 0, 0),
(137, 98, 32, 0, 0, 0, 0, 0, 0, 0, 0),
(138, 99, 32, 0, 0, 0, 0, 0, 0, 0, 0),
(139, 100, 32, 0, 0, 0, 0, 0, 0, 0, 0),
(140, 91, 32, 0, 0, 0, 0, 0, 0, 0, 0),
(142, 90, 33, 0, 0, 0, 0, 0, 0, 0, 0),
(143, 87, 33, 0, 0, 0, 0, 0, 0, 0, 0),
(144, 91, 33, 0, 0, 0, 0, 0, 0, 0, 0),
(145, 84, 33, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
CREATE TABLE IF NOT EXISTS `team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `description` longtext,
  `coverpath` varchar(200) DEFAULT NULL,
  `logopath` varchar(200) DEFAULT NULL,
  `logothumbpath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `description`, `coverpath`, `logopath`, `logothumbpath`) VALUES
(82, 'INTER ΕΚΠΛΗΞΗ', NULL, NULL, '/customimages/logo_8875_82.png', '/customimages/logo_thumb_8875_82.png'),
(83, 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ', NULL, NULL, '/customimages/logo_5818_83.png', '/customimages/logo_thumb_5818_83.png'),
(84, 'PATRIS SAIN GERMAIN', NULL, NULL, '/customimages/logo_3974_84.png', '/customimages/logo_thumb_3974_84.png'),
(85, 'PATRA UNITED', NULL, NULL, '/customimages/logo_8606_85.png', '/customimages/logo_thumb_8606_85.png'),
(86, 'SHADOWS', NULL, NULL, '/customimages/logo_6784_86.png', '/customimages/logo_thumb_6784_86.png'),
(87, 'ΗΕΙΝΕΚΕΝ', NULL, NULL, '/customimages/logo_7622_87.png', '/customimages/logo_thumb_7622_87.png'),
(88, 'ΤΑ ΛΙΩΜΑΤΑ', NULL, NULL, NULL, NULL),
(89, 'ΑΝΑΓΕΝΝΗΣΗ ΤΕΚΙΛΑΣ', NULL, NULL, '/customimages/logo_9353_89.png', '/customimages/logo_thumb_9353_89.png'),
(90, 'JENG CY', NULL, NULL, '/customimages/logo_2504_90.png', '/customimages/logo_thumb_2504_90.png'),
(91, 'ΔΥΤΙΚΑ ΖΑΜΠΟΝ', NULL, NULL, '/customimages/logo_768_91.png', '/customimages/logo_thumb_768_91.png'),
(92, 'LA COCA JUNIORS 2', NULL, NULL, '/customimages/logo_2412_92.png', '/customimages/logo_thumb_2412_92.png'),
(93, 'WHITE BULLS', NULL, NULL, NULL, NULL),
(94, 'ΣΠΑΡΤΑ ΞΑΠΛΑΣ', NULL, NULL, '/customimages/logo_92_94.png', '/customimages/logo_thumb_92_94.png'),
(96, 'ΚΑΝΟΝΙΕΡΗΔΕΣ', NULL, NULL, '/customimages/logo_4108_96.png', '/customimages/logo_thumb_4108_96.png'),
(97, 'ΠΑΟ', NULL, NULL, NULL, NULL),
(98, 'ΠΕΙΡΑΜΑΤΙΚΟΙ', NULL, NULL, NULL, NULL),
(99, 'BAROUTSAKI', NULL, NULL, '/customimages/logo_9397_99.png', '/customimages/logo_thumb_9397_99.png'),
(100, 'BOCA JUNIORS', NULL, NULL, '/customimages/logo_3583_100.png', '/customimages/logo_thumb_3583_100.png'),
(101, '42tg3rt', NULL, NULL, NULL, NULL),
(102, '345342', 'EETERT', NULL, '/customimages/logo_1475_102.png', '/customimages/logo_thumb_1475_102.png');

-- --------------------------------------------------------

--
-- Table structure for table `teamgroup`
--

DROP TABLE IF EXISTS `teamgroup`;
CREATE TABLE IF NOT EXISTS `teamgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `championid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdc37xp85pps73tixub9cl90s0` (`championid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teamgroup`
--

INSERT INTO `teamgroup` (`id`, `name`, `championid`) VALUES
(31, 'A Group', 16),
(32, 'Elite', 17),
(33, 'advanced', 17);

-- --------------------------------------------------------

--
-- Table structure for table `teamplayerxref`
--

DROP TABLE IF EXISTS `teamplayerxref`;
CREATE TABLE IF NOT EXISTS `teamplayerxref` (
  `teamid` int(11) NOT NULL,
  `playerid` int(11) NOT NULL,
  UNIQUE KEY `constr` (`teamid`,`playerid`),
  KEY `FKq52ioi5c7tsonx8fsyy9wbm2p` (`playerid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teamplayerxref`
--

INSERT INTO `teamplayerxref` (`teamid`, `playerid`) VALUES
(82, 111),
(82, 112),
(83, 113),
(82, 114),
(100, 118);

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
CREATE TABLE IF NOT EXISTS `userrole` (
  `role` varchar(255) CHARACTER SET utf8 NOT NULL,
  `contactid` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKtnobapdvh7iuy1gofj4x7in3e` (`role`,`contactid`),
  KEY `FKjd8ky3k85epi6ytugifbrs95q` (`contactid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`role`, `contactid`, `id`) VALUES
('ROLE_ADMIN', 2, 1),
('ROLE_ADMIN', 54, 3),
('ROLE_TEAM', 110, 4),
('ROLE_TEAM', 116, 5);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FKnyl1bqcm77w34tl615uoosjo8` FOREIGN KEY (`adminteamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKqnposetujkibeu5161uk60hj7` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `FKpowbjq6i5sc1ku02fu56x1gwn` FOREIGN KEY (`adminid`) REFERENCES `contact` (`id`),
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`adminid`) REFERENCES `player` (`id`);

--
-- Constraints for table `eventplayerxref`
--
ALTER TABLE `eventplayerxref`
  ADD CONSTRAINT `FKa9rn4rhkmh236qe6wxexopwmq` FOREIGN KEY (`playerid`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eventplayerxref_ibfk_1` FOREIGN KEY (`playerid`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eventplayerxref_ibfk_2` FOREIGN KEY (`eventid`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `FK6sqest9c9us6q7w9eki1asu0t` FOREIGN KEY (`playoffid`) REFERENCES `playoff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK7pthcs6mnb7ejk2bqvb1557cn` FOREIGN KEY (`matchdayid`) REFERENCES `matchday` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKauvt3aa0uq47l6gtumtwfnt2n` FOREIGN KEY (`teamid1`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKls9diasf8reb66lvy9i5iq034` FOREIGN KEY (`championid`) REFERENCES `champion` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `FKo63pplnj6o7x500io9lippcuc` FOREIGN KEY (`teamid2`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FKqidoqxsfnm9tnd92ge9hwuesy` FOREIGN KEY (`albumid`) REFERENCES `album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `information`
--
ALTER TABLE `information`
  ADD CONSTRAINT `FK2i5mk9b9kjbtd31l85sy5rp3r` FOREIGN KEY (`gameid`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK8hh0pu4w8l5aesa1k0b0veuno` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `matchday`
--
ALTER TABLE `matchday`
  ADD CONSTRAINT `FK26my16jbkyp7csl62ce9vv8yi` FOREIGN KEY (`teamgroupid`) REFERENCES `teamgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK7ssjguyeuyrbhvdremfxlvrad` FOREIGN KEY (`eventid`) REFERENCES `event` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKcmklxor1li66peguma7qlqfyb` FOREIGN KEY (`contactid`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKfvngx0qbrcwk4n9rg6ynq7m5i` FOREIGN KEY (`receiverid`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `playoff`
--
ALTER TABLE `playoff`
  ADD CONSTRAINT `FKdi3x38a5lwt79lm1123mxie56` FOREIGN KEY (`championid`) REFERENCES `champion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salary`
--
ALTER TABLE `salary`
  ADD CONSTRAINT `FKajmf4optcvdbvfy1tv7xu87us` FOREIGN KEY (`id`) REFERENCES `contact` (`id`);

--
-- Constraints for table `scorer`
--
ALTER TABLE `scorer`
  ADD CONSTRAINT `FK8gbmemjt8mtalxjwcvtnwwhy2` FOREIGN KEY (`gameid`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKebxirlx7h7vhsg1a0gxlp3nux` FOREIGN KEY (`teamgroupid`) REFERENCES `teamgroup` (`id`),
  ADD CONSTRAINT `FKiji4rftl3ofxndxrhvujf3xna` FOREIGN KEY (`contactid`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `standing`
--
ALTER TABLE `standing`
  ADD CONSTRAINT `FKn7fmrb4wi0atwwfvem2cc9cj8` FOREIGN KEY (`teamgroupid`) REFERENCES `teamgroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKoas79bvh1hwcsm01ay63ne76c` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teamgroup`
--
ALTER TABLE `teamgroup`
  ADD CONSTRAINT `FKdc37xp85pps73tixub9cl90s0` FOREIGN KEY (`championid`) REFERENCES `champion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teamplayerxref`
--
ALTER TABLE `teamplayerxref`
  ADD CONSTRAINT `FKof2xxqxj5yc919g0wx1ydsljt` FOREIGN KEY (`teamid`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKq52ioi5c7tsonx8fsyy9wbm2p` FOREIGN KEY (`playerid`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `userrole`
--
ALTER TABLE `userrole`
  ADD CONSTRAINT `FKjd8ky3k85epi6ytugifbrs95q` FOREIGN KEY (`contactid`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
