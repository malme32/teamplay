-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 27, 2018 at 07:50 PM
-- Server version: 5.7.21
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `album` (
  `id` int(11) NOT NULL,
  `name` longtext,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id`, `name`, `date`) VALUES
(17, 'ΔΙΑΦΟΡΑ', '2018-03-21 20:22:56');

-- --------------------------------------------------------

--
-- Table structure for table `champion`
--

CREATE TABLE `champion` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
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
  `thumbpath` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(110, 'sdfsad', NULL, 'andreas.skapetis@gmail.com', NULL, 'Ανδρεας Σκαπετης', '34345r3', NULL, b'1', '$2a$10$fPVNImF/K4TGN8IVAsYOs.DJKNHSxr36d7IcuD6OVLHgRnKzSiQKe', 'user', NULL, NULL, NULL, 82, NULL),
(112, NULL, NULL, NULL, NULL, 'Χριστοπουλος', NULL, NULL, b'0', NULL, NULL, '/defaultimages/playerdefaultimage.png', '', 'Defender', NULL, '/defaultimages/playerdefaultthumb.png'),
(113, NULL, NULL, NULL, NULL, 'Σαραντοπουλος', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, NULL, NULL, NULL, NULL, 'Athanasiadis', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_4412_114.jpg', '3', 'Τερματοφυλακας', NULL, '/customimages/playerthumb_4412_114.jpg'),
(116, NULL, NULL, NULL, NULL, 'Θανασης', NULL, NULL, b'1', '$2a$10$AneJYrhetYdKBUb9WISRo.9OwiamrBSK8ANkupx5o7Ql9EECC7bW6', 'user25', NULL, NULL, NULL, 97, NULL),
(119, NULL, NULL, NULL, NULL, 'Spaliaras', NULL, NULL, b'0', NULL, NULL, '/customimages/playerimage_633_119.jpg', '6', 'Defender', NULL, '/customimages/playerthumb_633_119.jpg'),
(121, NULL, NULL, NULL, NULL, 'φδγδφσγ', NULL, NULL, b'0', NULL, NULL, NULL, '4', 'Αμυντικος', NULL, NULL),
(122, NULL, NULL, NULL, NULL, 'zfsdfdsf', NULL, NULL, b'0', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, NULL, NULL, 'andreas.skapetis@gmail.com', NULL, 'efsd', NULL, NULL, b'1', '$2a$10$C7CcWkjEzmDkVRqZxGCMkuzdkCOz0DqXZh4GhCU3FsuQLzQEeujHm', 'sdfsdf', NULL, NULL, NULL, 83, NULL),
(124, NULL, NULL, 'andreas.skapetis@gmail.com', NULL, 'cvzxcv', NULL, NULL, b'1', '$2a$10$AC/SAuduX0r4sIAX.tzBAuCTHpd8xtmzM5psl1MB6D8b5GggaJ81y', 'eeerere', NULL, NULL, NULL, 98, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custompage`
--

CREATE TABLE `custompage` (
  `id` int(11) NOT NULL,
  `content` longtext,
  `title` varchar(100) DEFAULT NULL,
  `link` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `custompage`
--

INSERT INTO `custompage` (`id`, `content`, `title`, `link`) VALUES
(4, 'Πρότυπο Εθνικό Δίκτυο Ακαδημιών Ποδοσφαίρου\n \nΣτο Δικτυο συμμετεχουν Προτυπες Ακαδημιες Ποδοσφαιρου απο ολη την Ελλαδα και το εξωτερικο που διαθετουν αθλητες 5-16 ετων και πληρουν τις απαραιτητες προυποθεσεις.Μεσα απο την λειτουργια του Δικτυου θα εφαρμοστει ενα Εθνικο Αναπτυξιακο Προγραμμα που σκοπο εχει α.την αναβαθμιση του επιπεδου του ποδοσφαιρου στις μικρες ηλικιες β.την Εθνικη αξιολογηση των αθλητων γ.Την χρηση αυτης της αξιολογησης προς οφελος των ακαδημιων.\n\nhttp://www.rossonerimfc.gr/index.php', 'ΑΚΑΔΗΜΙΕΣ', NULL),
(5, 'Νίκος Παπαγιαννόπουλος\n\nΤεχνικός Διευθυντής Ακαδημίας. Αρχηγός και στέλεχος της Παναχαϊκής επι 14 χρόνια. 312 συμμετοχές\nμε την Παναχαϊκή. 219 συμμετοχές στο πρωτάθλημα της \'Α Εθνικής. Το 193 ίδρυσε την ομάδα "ΔΑΒΟΥΡΛΗΣ Κ. \'92".\n\nΤάκης Κυριακόπουλος\n\n9 χρόνια επαγγελματίας ποδοσφαιριστής της Παναχαϊκής με 203 συμμετοχές. 1992-1998 στο προπονητικό team της\nΠΑΕ Παναχαϊκής (βοηθός προπονητή). 1999-2000 προπονητή στην ΠΑΕ Παναχαϊκή στην Β\' εθνική με την οποία ανέβηκε\nστην \'Α. Από το 2005 ενωσιακός προπονητής. Προπονητής UEFA B. Στην ομάδα μας από το 2007.\nΑνδρέας Σπυρόπουλος\n\n9 χρόνια επαγγελματίας ποδοσφαιριστής της ΠΑΕ Παναχαϊκής , ΠΑΕ ΟΦΗ, Πάτραι, ΠΑΕ Πανηλιακός.\n1989-1992 στο προπονητικό team της ΠΑΕ Παναχαϊκής (βοηθός προπονητή). 1993-2004 Προπονητής\nσε ομάδες Δ Εθνικής (Ζάκυνθος,Ζαβλάνι, Α.Ο. Πάρος, Πάμισσος). Προπονητής UEFA B. Στην ομάδα μας\nαπό το 2007.\n\nΕρρίκος Μαράτος\n\nΑπόφοιτος ΤΕΦΑΑ με ειδικότητα στο ποδόσφαιρο. Προπονητής UEFA B. Στην ομάδα μας από το 2000.\nΔημήτρης Ράπτη\n\nhttp://www.rossonerimfc.gr/index.php', 'ΠΡΟΠΟΝΗΤΙΚΟ TEAM', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `adminid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `eventplayerxref` (
  `eventid` int(11) NOT NULL,
  `playerid` int(11) NOT NULL
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

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `teamid1` int(11) DEFAULT NULL,
  `teamid2` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `matchdayid` int(11) DEFAULT NULL,
  `score1` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `score2` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phase` int(11) DEFAULT NULL,
  `championid` int(11) DEFAULT NULL,
  `playoffid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `teamid1`, `teamid2`, `date`, `matchdayid`, `score1`, `score2`, `phase`, `championid`, `playoffid`) VALUES
(2248, 98, 97, NULL, 583, NULL, NULL, NULL, 17, NULL),
(2249, 97, 98, NULL, 584, NULL, NULL, NULL, 17, NULL),
(2250, 100, 91, NULL, 583, NULL, NULL, NULL, 17, NULL),
(2251, 91, 100, NULL, 584, NULL, NULL, NULL, 17, NULL),
(2252, 99, 97, '2018-03-31 00:00:00', 585, NULL, NULL, NULL, 17, NULL),
(2253, 97, 99, NULL, 586, NULL, NULL, NULL, 17, NULL),
(2254, 100, 98, NULL, 587, NULL, NULL, NULL, 17, NULL),
(2255, 98, 100, NULL, 586, NULL, NULL, NULL, 17, NULL),
(2256, 100, 97, NULL, 587, NULL, NULL, NULL, 17, NULL),
(2257, 97, 100, NULL, 588, NULL, NULL, NULL, 17, NULL),
(2258, 91, 99, NULL, 587, NULL, NULL, NULL, 17, NULL),
(2259, 99, 91, NULL, 588, NULL, NULL, NULL, 17, NULL),
(2260, 91, 97, NULL, 589, NULL, NULL, NULL, 17, NULL),
(2261, 97, 91, NULL, 590, NULL, NULL, NULL, 17, NULL),
(2262, 98, 99, '2018-03-31 00:00:00', 589, NULL, NULL, NULL, 17, NULL),
(2263, 99, 98, NULL, 590, NULL, NULL, NULL, 17, NULL),
(2264, 98, 91, NULL, 591, '2', '3', NULL, 17, NULL),
(2265, 91, 98, NULL, 592, NULL, NULL, NULL, 17, NULL),
(2266, 99, 100, NULL, 591, '3', '0', NULL, 17, NULL),
(2267, 100, 99, NULL, 592, NULL, NULL, NULL, 17, NULL),
(2268, 83, 82, '2018-04-04 22:00:00', 593, NULL, NULL, NULL, 16, NULL),
(2269, 84, 96, NULL, 593, NULL, NULL, NULL, 16, NULL),
(2270, 85, 94, NULL, 593, NULL, NULL, NULL, 16, NULL),
(2271, 86, 93, NULL, 593, NULL, NULL, NULL, 16, NULL),
(2272, 87, 92, NULL, 593, NULL, NULL, NULL, 16, NULL),
(2273, 88, 91, NULL, 593, NULL, NULL, NULL, 16, NULL),
(2274, 89, 90, NULL, 593, NULL, NULL, NULL, 16, NULL),
(2275, 84, 82, '2018-03-31 00:00:00', 594, '3', '1', NULL, 16, NULL),
(2276, 85, 83, NULL, 594, NULL, NULL, NULL, 16, NULL),
(2277, 86, 96, NULL, 594, NULL, NULL, NULL, 16, NULL),
(2278, 87, 94, NULL, 594, NULL, NULL, NULL, 16, NULL),
(2279, 88, 93, NULL, 594, NULL, NULL, NULL, 16, NULL),
(2280, 89, 92, NULL, 594, NULL, NULL, NULL, 16, NULL),
(2281, 90, 91, NULL, 594, NULL, NULL, NULL, 16, NULL),
(2282, 85, 82, NULL, 595, NULL, NULL, NULL, 16, NULL),
(2283, 86, 84, NULL, 595, NULL, NULL, NULL, 16, NULL),
(2284, 87, 83, NULL, 595, NULL, NULL, NULL, 16, NULL),
(2285, 88, 96, NULL, 595, NULL, NULL, NULL, 16, NULL),
(2286, 89, 94, NULL, 595, NULL, NULL, NULL, 16, NULL),
(2287, 90, 93, NULL, 595, NULL, NULL, NULL, 16, NULL),
(2288, 91, 92, NULL, 595, NULL, NULL, NULL, 16, NULL),
(2289, 86, 82, NULL, 596, NULL, NULL, NULL, 16, NULL),
(2290, 87, 85, NULL, 596, NULL, NULL, NULL, 16, NULL),
(2291, 88, 84, NULL, 596, NULL, NULL, NULL, 16, NULL),
(2292, 89, 83, NULL, 596, NULL, NULL, NULL, 16, NULL),
(2293, 90, 96, NULL, 596, NULL, NULL, NULL, 16, NULL),
(2294, 91, 94, NULL, 596, NULL, NULL, NULL, 16, NULL),
(2295, 92, 93, NULL, 596, NULL, NULL, NULL, 16, NULL),
(2296, 87, 82, NULL, 597, NULL, NULL, NULL, 16, NULL),
(2297, 88, 86, NULL, 597, NULL, NULL, NULL, 16, NULL),
(2298, 89, 85, NULL, 597, NULL, NULL, NULL, 16, NULL),
(2299, 90, 84, NULL, 597, NULL, NULL, NULL, 16, NULL),
(2300, 91, 83, NULL, 597, NULL, NULL, NULL, 16, NULL),
(2301, 92, 96, NULL, 597, NULL, NULL, NULL, 16, NULL),
(2302, 93, 94, NULL, 597, NULL, NULL, NULL, 16, NULL),
(2303, 88, 82, NULL, 598, NULL, NULL, NULL, 16, NULL),
(2304, 89, 87, NULL, 598, NULL, NULL, NULL, 16, NULL),
(2305, 90, 86, NULL, 598, NULL, NULL, NULL, 16, NULL),
(2306, 91, 85, NULL, 598, NULL, NULL, NULL, 16, NULL),
(2307, 92, 84, NULL, 598, NULL, NULL, NULL, 16, NULL),
(2308, 93, 83, NULL, 598, NULL, NULL, NULL, 16, NULL),
(2309, 94, 96, NULL, 598, NULL, NULL, NULL, 16, NULL),
(2310, 89, 82, NULL, 599, NULL, NULL, NULL, 16, NULL),
(2311, 90, 88, NULL, 599, NULL, NULL, NULL, 16, NULL),
(2312, 91, 87, NULL, 599, NULL, NULL, NULL, 16, NULL),
(2313, 92, 86, NULL, 599, NULL, NULL, NULL, 16, NULL),
(2314, 93, 85, NULL, 599, NULL, NULL, NULL, 16, NULL),
(2315, 94, 84, NULL, 599, NULL, NULL, NULL, 16, NULL),
(2316, 96, 83, NULL, 599, NULL, NULL, NULL, 16, NULL),
(2317, 90, 82, NULL, 600, NULL, NULL, NULL, 16, NULL),
(2318, 91, 89, NULL, 600, NULL, NULL, NULL, 16, NULL),
(2319, 92, 88, NULL, 600, NULL, NULL, NULL, 16, NULL),
(2320, 93, 87, NULL, 600, NULL, NULL, NULL, 16, NULL),
(2321, 94, 86, NULL, 600, NULL, NULL, NULL, 16, NULL),
(2322, 96, 85, NULL, 600, NULL, NULL, NULL, 16, NULL),
(2323, 83, 84, NULL, 600, NULL, NULL, NULL, 16, NULL),
(2324, 91, 82, NULL, 601, NULL, NULL, NULL, 16, NULL),
(2325, 92, 90, NULL, 601, NULL, NULL, NULL, 16, NULL),
(2326, 93, 89, NULL, 601, NULL, NULL, NULL, 16, NULL),
(2327, 94, 88, NULL, 601, NULL, NULL, NULL, 16, NULL),
(2328, 96, 87, NULL, 601, NULL, NULL, NULL, 16, NULL),
(2329, 83, 86, NULL, 601, NULL, NULL, NULL, 16, NULL),
(2330, 84, 85, NULL, 601, NULL, NULL, NULL, 16, NULL),
(2331, 92, 82, NULL, 602, NULL, NULL, NULL, 16, NULL),
(2332, 93, 91, NULL, 602, NULL, NULL, NULL, 16, NULL),
(2333, 94, 90, NULL, 602, NULL, NULL, NULL, 16, NULL),
(2334, 96, 89, NULL, 602, NULL, NULL, NULL, 16, NULL),
(2335, 83, 88, NULL, 602, NULL, NULL, NULL, 16, NULL),
(2336, 84, 87, NULL, 602, NULL, NULL, NULL, 16, NULL),
(2337, 85, 86, NULL, 602, NULL, NULL, NULL, 16, NULL),
(2338, 93, 82, NULL, 603, NULL, NULL, NULL, 16, NULL),
(2339, 94, 92, NULL, 603, NULL, NULL, NULL, 16, NULL),
(2340, 96, 91, NULL, 603, NULL, NULL, NULL, 16, NULL),
(2341, 83, 90, NULL, 603, NULL, NULL, NULL, 16, NULL),
(2342, 84, 89, NULL, 603, NULL, NULL, NULL, 16, NULL),
(2343, 85, 88, NULL, 603, NULL, NULL, NULL, 16, NULL),
(2344, 86, 87, NULL, 603, NULL, NULL, NULL, 16, NULL),
(2345, 94, 82, NULL, 604, NULL, NULL, NULL, 16, NULL),
(2346, 96, 93, NULL, 604, NULL, NULL, NULL, 16, NULL),
(2347, 83, 92, NULL, 604, NULL, NULL, NULL, 16, NULL),
(2348, 84, 91, NULL, 604, NULL, NULL, NULL, 16, NULL),
(2349, 85, 90, NULL, 604, NULL, NULL, NULL, 16, NULL),
(2350, 86, 89, NULL, 604, NULL, NULL, NULL, 16, NULL),
(2351, 87, 88, NULL, 604, NULL, NULL, NULL, 16, NULL),
(2352, 96, 82, NULL, 605, NULL, NULL, NULL, 16, NULL),
(2353, 83, 94, NULL, 605, NULL, NULL, NULL, 16, NULL),
(2354, 84, 93, NULL, 605, NULL, NULL, NULL, 16, NULL),
(2355, 85, 92, NULL, 605, NULL, NULL, NULL, 16, NULL),
(2356, 86, 91, NULL, 605, NULL, NULL, NULL, 16, NULL),
(2357, 87, 90, NULL, 605, NULL, NULL, NULL, 16, NULL),
(2358, 88, 89, NULL, 605, NULL, NULL, NULL, 16, NULL),
(2359, 83, 88, NULL, 593, NULL, NULL, NULL, 16, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `albumid` int(11) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `thumburl` varchar(250) DEFAULT NULL,
  `custompageid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `albumid`, `url`, `thumburl`, `custompageid`) VALUES
(160, NULL, '/customimages/custompageimage_custompage5_image160.jpg', '/customimages/custompageimage_thumb_custompage5_image160.jpg', NULL),
(161, NULL, '/customimages/custompageimage_custompage5_image161.jpg', '/customimages/custompageimage_thumb_custompage5_image161.jpg', NULL),
(162, NULL, '/customimages/custompageimage_custompage5_image162.jpg', '/customimages/custompageimage_thumb_custompage5_image162.jpg', NULL),
(163, NULL, '/customimages/custompageimage_custompage4_image163.jpg', '/customimages/custompageimage_thumb_custompage4_image163.jpg', NULL),
(164, NULL, '/customimages/custompageimage_custompage4_image164.jpg', '/customimages/custompageimage_thumb_custompage4_image164.jpg', NULL),
(165, NULL, '/customimages/custompageimage_custompage4_image165.jpg', '/customimages/custompageimage_thumb_custompage4_image165.jpg', NULL),
(166, NULL, '/customimages/custompageimage_custompage5_image166.jpeg', '/customimages/custompageimage_thumb_custompage5_image166.jpeg', NULL),
(167, NULL, '/customimages/custompageimage_custompage5_image167.jpg', '/customimages/custompageimage_thumb_custompage5_image167.jpg', NULL),
(168, NULL, '/customimages/custompageimage_custompage5_image168.jpg', '/customimages/custompageimage_thumb_custompage5_image168.jpg', NULL),
(169, 17, '/customimages/albumimage_album17_image169.jpg', '/customimages/albumimage_thumb_album17_image169.jpg', NULL),
(170, 17, '/customimages/albumimage_album17_image170.jpg', '/customimages/albumimage_thumb_album17_image170.jpg', NULL),
(171, 17, '/customimages/albumimage_album17_image171.jpg', '/customimages/albumimage_thumb_album17_image171.jpg', NULL),
(172, 17, '/customimages/albumimage_album17_image172.jpg', '/customimages/albumimage_thumb_album17_image172.jpg', NULL),
(173, 17, '/customimages/albumimage_album17_image173.jpg', '/customimages/albumimage_thumb_album17_image173.jpg', NULL),
(174, 17, '/customimages/albumimage_album17_image174.jpeg', '/customimages/albumimage_thumb_album17_image174.jpeg', NULL),
(175, 17, '/customimages/albumimage_album17_image175.jpg', '/customimages/albumimage_thumb_album17_image175.jpg', NULL),
(176, 17, '/customimages/albumimage_album17_image176.jpg', '/customimages/albumimage_thumb_album17_image176.jpg', NULL),
(177, 17, '/customimages/albumimage_album17_image177.jpeg', '/customimages/albumimage_thumb_album17_image177.jpeg', NULL),
(178, 17, '/customimages/albumimage_album17_image178.jpeg', '/customimages/albumimage_thumb_album17_image178.jpeg', NULL),
(179, 17, '/customimages/albumimage_album17_image179.png', '/customimages/albumimage_thumb_album17_image179.png', NULL),
(180, NULL, '/customimages/custompageimage_custompage5_image180.png', '/customimages/custompageimage_thumb_custompage5_image180.png', NULL),
(181, NULL, '/customimages/custompageimage_custompage5_image181.jpeg', '/customimages/custompageimage_thumb_custompage5_image181.jpeg', 5),
(182, NULL, '/customimages/custompageimage_custompage5_image182.jpeg', '/customimages/custompageimage_thumb_custompage5_image182.jpeg', 5),
(183, NULL, '/customimages/custompageimage_custompage5_image183.png', '/customimages/custompageimage_thumb_custompage5_image183.png', 5),
(184, NULL, '/customimages/custompageimage_custompage4_image184.jpeg', '/customimages/custompageimage_thumb_custompage4_image184.jpeg', 4),
(185, NULL, '/customimages/custompageimage_custompage4_image185.jpeg', '/customimages/custompageimage_thumb_custompage4_image185.jpeg', 4),
(186, NULL, '/customimages/custompageimage_custompage4_image186.png', '/customimages/custompageimage_thumb_custompage4_image186.png', 4),
(187, NULL, '/customimages/custompageimage_custompage4_image187.jpg', '/customimages/custompageimage_thumb_custompage4_image187.jpg', 4),
(188, NULL, '/customimages/custompageimage_custompage4_image188.jpg', '/customimages/custompageimage_thumb_custompage4_image188.jpg', 4),
(189, NULL, '/customimages/custompageimage_custompage4_image189.jpg', '/customimages/custompageimage_thumb_custompage4_image189.jpg', 4);

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE `information` (
  `id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `message` longtext,
  `teamid` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `gameid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `information`
--

INSERT INTO `information` (`id`, `date`, `message`, `teamid`, `title`, `gameid`) VALUES
(187, '2018-03-26 20:05:01', 'BAROUTSAKI - ΠΑΟ (Sat Mar 31 00:00:00 EEST 2018)', 99, 'Νέος Αγώνας!', 2252),
(188, '2018-03-26 20:05:01', 'BAROUTSAKI - ΠΑΟ (Sat Mar 31 00:00:00 EEST 2018)', 97, 'Νέος Αγώνας!', 2252),
(189, '2018-03-26 20:05:05', 'ΠΕΙΡΑΜΑΤΙΚΟΙ - BAROUTSAKI (Sat Mar 31 00:00:00 EEST 2018)', 98, 'Νέος Αγώνας!', 2262),
(190, '2018-03-26 20:05:05', 'ΠΕΙΡΑΜΑΤΙΚΟΙ - BAROUTSAKI (Sat Mar 31 00:00:00 EEST 2018)', 99, 'Νέος Αγώνας!', 2262),
(191, '2018-03-26 20:30:03', 'PATRIS SAIN GERMAIN - INTER ΕΚΠΛΗΞΗ (Fri Mar 30 00:00:00 EEST 2018)', 84, 'Νέος Αγώνας!', 2275),
(192, '2018-03-26 20:30:03', 'PATRIS SAIN GERMAIN - INTER ΕΚΠΛΗΞΗ (Fri Mar 30 00:00:00 EEST 2018)', 82, 'Νέος Αγώνας!', 2275),
(193, '2018-03-27 18:30:02', 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ - INTER ΕΚΠΛΗΞΗ (Sat Mar 31 22:00:00 EEST 2018)', 83, 'Νέος Αγώνας!', 2268),
(194, '2018-03-27 18:30:02', 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ - INTER ΕΚΠΛΗΞΗ (Sat Mar 31 22:00:00 EEST 2018)', 82, 'Νέος Αγώνας!', 2268),
(195, '2018-03-27 18:33:24', 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ - INTER ΕΚΠΛΗΞΗ (Wed Apr 04 22:00:00 EEST 2018)', 83, 'Νέος Αγώνας!', 2268),
(196, '2018-03-27 18:33:24', 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ - INTER ΕΚΠΛΗΞΗ (Wed Apr 04 22:00:00 EEST 2018)', 82, 'Νέος Αγώνας!', 2268),
(197, '2018-03-27 18:34:18', 'PATRIS SAIN GERMAIN - INTER ΕΚΠΛΗΞΗ (Sat Mar 31 00:00:00 EEST 2018)', 84, 'Νέος Αγώνας!', 2275),
(198, '2018-03-27 18:34:18', 'PATRIS SAIN GERMAIN - INTER ΕΚΠΛΗΞΗ (Sat Mar 31 00:00:00 EEST 2018)', 82, 'Νέος Αγώνας!', 2275),
(199, '2018-03-27 18:35:00', 'PATRIS SAIN GERMAIN - INTER ΕΚΠΛΗΞΗ (Sat Mar 31 00:00:00 EEST 2018)', 84, 'Νέος Αγώνας!', 2275),
(200, '2018-03-27 18:35:00', 'PATRIS SAIN GERMAIN - INTER ΕΚΠΛΗΞΗ (Sat Mar 31 00:00:00 EEST 2018)', 82, 'Νέος Αγώνας!', 2275),
(201, '2018-03-27 18:35:21', 'PATRIS SAIN GERMAIN - INTER ΕΚΠΛΗΞΗ (Sat Mar 31 00:00:00 EEST 2018)', 84, 'Νέος Αγώνας!', 2275),
(202, '2018-03-27 18:35:21', 'PATRIS SAIN GERMAIN - INTER ΕΚΠΛΗΞΗ (Sat Mar 31 00:00:00 EEST 2018)', 82, 'Νέος Αγώνας!', 2275);

-- --------------------------------------------------------

--
-- Table structure for table `matchday`
--

CREATE TABLE `matchday` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `teamgroupid` int(11) DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `startdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `matchday`
--

INSERT INTO `matchday` (`id`, `name`, `teamgroupid`, `enddate`, `startdate`) VALUES
(583, 'ΑΓΩΝΙΣΤΙΚΗ 01', 32, NULL, NULL),
(584, 'ΑΓΩΝΙΣΤΙΚΗ 06', 32, NULL, NULL),
(585, 'ΑΓΩΝΙΣΤΙΚΗ 02', 32, NULL, NULL),
(586, 'ΑΓΩΝΙΣΤΙΚΗ 07', 32, NULL, NULL),
(587, 'ΑΓΩΝΙΣΤΙΚΗ 03', 32, NULL, NULL),
(588, 'ΑΓΩΝΙΣΤΙΚΗ 08', 32, NULL, NULL),
(589, 'ΑΓΩΝΙΣΤΙΚΗ 04', 32, NULL, NULL),
(590, 'ΑΓΩΝΙΣΤΙΚΗ 09', 32, NULL, NULL),
(591, 'ΑΓΩΝΙΣΤΙΚΗ 05', 32, NULL, NULL),
(592, 'ΑΓΩΝΙΣΤΙΚΗ 10', 32, NULL, NULL),
(593, 'ΑΓΩΝΙΣΤΙΚΗ 01', 31, NULL, NULL),
(594, 'ΑΓΩΝΙΣΤΙΚΗ 02', 31, NULL, NULL),
(595, 'ΑΓΩΝΙΣΤΙΚΗ 03', 31, NULL, NULL),
(596, 'ΑΓΩΝΙΣΤΙΚΗ 04', 31, NULL, NULL),
(597, 'ΑΓΩΝΙΣΤΙΚΗ 05', 31, NULL, NULL),
(598, 'ΑΓΩΝΙΣΤΙΚΗ 06', 31, NULL, NULL),
(599, 'ΑΓΩΝΙΣΤΙΚΗ 07', 31, NULL, NULL),
(600, 'ΑΓΩΝΙΣΤΙΚΗ 08', 31, NULL, NULL),
(601, 'ΑΓΩΝΙΣΤΙΚΗ 09', 31, NULL, NULL),
(602, 'ΑΓΩΝΙΣΤΙΚΗ 10', 31, NULL, NULL),
(603, 'ΑΓΩΝΙΣΤΙΚΗ 11', 31, NULL, NULL),
(604, 'ΑΓΩΝΙΣΤΙΚΗ 12', 31, NULL, NULL),
(605, 'ΑΓΩΝΙΣΤΙΚΗ 13', 31, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `message` longtext CHARACTER SET utf8,
  `eventid` int(11) DEFAULT NULL,
  `contactid` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `delivered` bit(1) DEFAULT NULL,
  `seen` bit(1) DEFAULT NULL,
  `receiverid` int(11) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `message`, `eventid`, `contactid`, `date`, `delivered`, `seen`, `receiverid`, `status`) VALUES
(34, 'ηι', NULL, 54, '2018-02-03 19:22:48', b'0', b'0', 110, 'Seen'),
(35, 'jjj', NULL, 54, '2018-02-04 13:28:47', b'0', b'0', 110, 'Seen'),
(36, 'asdfsdf', NULL, 54, '2018-03-21 20:51:51', b'0', b'0', 110, 'Seen'),
(37, 'dsfasdfsdf', NULL, 110, '2018-03-21 20:53:01', b'0', b'0', 54, 'Seen'),
(38, 'dfdfdfddd3333', NULL, 110, '2018-03-21 20:53:08', b'0', b'0', 54, 'Seen'),
(39, 'ffff', NULL, 110, '2018-03-21 20:53:32', b'0', b'0', 54, 'Seen'),
(40, 'Hi', NULL, 54, '2018-03-27 17:54:22', b'0', b'0', 110, 'Seen'),
(41, 'Hey', NULL, 110, '2018-03-27 17:56:19', b'0', b'0', 54, 'Seen'),
(42, 'No', NULL, 110, '2018-03-27 17:56:43', b'0', b'0', 54, 'Seen'),
(43, 'why?', NULL, 54, '2018-03-27 17:57:12', b'0', b'0', 110, 'Seen'),
(44, 'no', NULL, 54, '2018-03-27 17:57:42', b'0', b'0', 110, 'Seen'),
(45, 'metallica', NULL, 54, '2018-03-27 17:58:09', b'0', b'0', 110, 'Seen'),
(46, 'hey', NULL, 54, '2018-03-27 17:58:54', b'0', b'0', 110, 'Seen'),
(47, 'hi', NULL, 54, '2018-03-27 17:59:11', b'0', b'0', 110, 'Seen'),
(48, 'no', NULL, 54, '2018-03-27 17:59:36', b'0', b'0', 110, 'Seen'),
(49, 'you', NULL, 54, '2018-03-27 17:59:59', b'0', b'0', 110, 'Seen'),
(50, 'bkjbkjb', NULL, 54, '2018-03-27 18:17:10', b'0', b'0', 110, 'Seen'),
(51, 'jjjj', NULL, 54, '2018-03-27 18:17:55', b'0', b'0', 110, 'Seen'),
(52, 'vhvjh', NULL, 54, '2018-03-27 18:18:18', b'0', b'0', 110, 'Seen'),
(53, 'vhhjfhyf', NULL, 54, '2018-03-27 18:18:46', b'0', b'0', 110, 'Seen'),
(54, 'nbhmhj', NULL, 54, '2018-03-27 18:18:54', b'0', b'0', 110, 'Seen'),
(55, 'bkkj', NULL, 54, '2018-03-27 18:21:11', b'0', b'0', 110, 'Seen'),
(56, 'mnmnm', NULL, 54, '2018-03-27 18:21:30', b'0', b'0', 110, 'Seen'),
(57, 'nnmmn', NULL, 54, '2018-03-27 18:21:39', b'0', b'0', 110, 'Seen'),
(58, 'kk', NULL, 54, '2018-03-27 18:25:42', b'0', b'0', 110, 'Seen'),
(59, 'jhfjhjk', NULL, 54, '2018-03-27 18:25:56', b'0', b'0', 110, 'Seen'),
(60, 'gigj', NULL, 54, '2018-03-27 18:26:29', b'0', b'0', 110, 'Seen'),
(61, 'jjj', NULL, 54, '2018-03-27 18:28:42', b'0', b'0', 110, 'Seen');

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `content` longtext,
  `date` datetime DEFAULT NULL,
  `imageurl` longtext,
  `title` longtext,
  `thumburl` longtext,
  `important` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`id`, `content`, `date`, `imageurl`, `title`, `thumburl`, `important`) VALUES
(4, 'Ο Πανιώνιος μετρά απουσίες για το αυριανό ματς της Λάρισας', '2018-02-02 22:01:31', '/customimages/noticeimage_6603_4.jpg', 'Χωρις Σιωπη, Ντουρμισαι', '/customimages/noticethumb_6603_4.jpg', NULL),
(5, 'Το gazzetta.gr με το τελος και της χειμερινης μεταγραφικης περιοδου συγκέντρωσε τα σημαντικότερα ποσά γύρω από το ρόστερ του ΠΑΟΚ και το ασπρόμαυρο...', '2018-03-24 16:16:43', '/customimages/noticeimage_5852_5.jpg', 'Ροστερ αξιας 31 εκατ. ευρω!', '/customimages/noticethumb_5852_5.jpg', b'1'),
(6, 'Η κατάσταση του Βέλγου θα εκτιμηθεί ξανά το πρωί της Πέμπτης.\n Ο Ένγκελς προπονήθηκε σε σαφώς ανεβασμένους ρυθμούς την Τετάρτη ωστόσο δεν είναι σίγουρο ότι θα μπορέσει να αγωνιστεί στο οικογενιακό δίτερμα της πρώτης ομάδας με την Κ-20. Πάντως όπως έχουμε αναφέρει ξανά είθισται σε τέτοια διτέρματα παίκτες των Νέων να παίζουν και στην πρώτη ομάδα.\nhttp://www.google.com', '2018-03-24 13:12:18', '/customimages/noticeimage_4434_6.jpg', 'Ανεβασε στροφες ο Ενγκελς αλλα δεν ειναι σιγουρος για το ματς με Κ-20', '/customimages/noticethumb_4434_6.jpg', b'1'),
(7, 'Στα τέλη Σεπτεμβρίου ο Λουσιάνο υπέστη σοβαρό τραυματισμό στο γόνατο, πέρασε έναν Γολγοθά και αύριο θα πατήσει και πάλι χορτάρι, επιστρέφοντας στην ενεργό δράση. Ο Βραζιλιάνος επιθετικός του «τριφυλλιού» είναι στην αποστολή του Μαρίνου Ουζουνίδη για το φιλικό με την Σπάρτη που θα γίνει κεκλεισμένων των θυρών στην Λεωφόρο και θα πάρει χρόνο συμμετοχής. Ο Έλληνας τεχνικός συμπεριέλαβε στην αποστολή όλους τους διαθέσιμους παίκτες με εξαίρεση τον Σωκράτη Διούδη που ταλαιπωρείται από ίωση.', '2018-03-21 20:56:46', '/customimages/noticeimage_9682_7.jpg', '«Μαχιμος» ο Λουσιανο!', '/customimages/noticethumb_9682_7.jpg', NULL),
(8, 'Το ΠΑΟΚ – ΑΕΚ και το τι έγινε: «Τι να πω πραγματικά; Αυτό που συνέβη ανάμεσα στον ΠΑΟΚ και την ΑΕΚ είναι αρρωστημένο. Είδα τι έγινε σε αυτό το παιχνίδι. Είναι αρρωστημένο αυτό που έγινε στην Τούμπα! Στην προηγούμενη αγωνιστική ματαιώθηκε το δικό μας ματς και πλέον δεν υπάρχουν αγώνες λόγω του περιστατικού. Είναι βαρετό και κουραστικό, αλλά ελπίζω μετά τη διακοπή των Εθνικών το πρωτάθλημα να αρχίσει ξανά, Ανυπομονώ να δω τι θα γίνει με τον ΠΑΟΚ. Θα έχει ενδιαφέρον το τι θα συμβεί (σ.σ. εννοεί με τις ποινές)> Είναι τελείως αρρωστημένο αυτό που συνέβη. Άγριες καταστάσεις και όλα έγιναν τόσο γρήγορα. Είναι αρρωστημένο».', '2018-03-21 20:56:36', '/customimages/noticeimage_4668_8.jpg', 'Ομαρ: «Αρρωστημενο αυτό που εγινε στην Τουμπα»!', '/customimages/noticethumb_4668_8.jpg', NULL),
(9, 'Σε δύο μέρη ήταν χωρισμένη η προπόνηση της Τετάρτης (21/3) για τους ποδοσφαιριστές του ΠΑΟΚ, με τον Ραζβάν Λουτσέσκου να ζητάει συγκεκριμένα πράγματα στη διάρκεια της.', '2018-03-24 14:38:15', '/customimages/noticeimage_9585_9.jpg', 'Οι φωνες και οι οδηγιες Λουτσεσκου', '/customimages/noticethumb_9585_9.jpg', b'1');

-- --------------------------------------------------------

--
-- Table structure for table `persistent_logins`
--

CREATE TABLE `persistent_logins` (
  `username` varchar(100) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `persistent_logins`
--

INSERT INTO `persistent_logins` (`username`, `series`, `token`, `last_used`) VALUES
('theo', 'S/c8Lbx1A4UoJLIvcv5u6Q==', 'oY2Z3PMpmonn3s43yfea+Q==', '2018-01-28 13:27:04'),
('costasd', '9g2k+8QkUxROTvpAaFXROA==', '2oTDtop4C6w6HC0hzs7R8Q==', '2018-01-30 15:28:13'),
('admin', 'nsEoyV7g+gZj1YvTTMonBQ==', 'haA+OtDvW0VnWZSg1mQzmw==', '2018-03-27 14:35:37'),
('admin', 'OlL11GgXHTCTQoMCmRLH5Q==', 'DR31aoVpgY00LqkWMmVvWg==', '2018-03-24 16:56:01'),
('user', 'AyhTrgOTJwQK3+mKg/d6yw==', 'x402OhcGwroXPcN1m500rA==', '2018-03-27 15:28:13');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '',
  `country` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `playoff` (
  `id` int(11) NOT NULL,
  `phase` int(11) DEFAULT NULL,
  `championid` int(11) DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playoff`
--

INSERT INTO `playoff` (`id`, `phase`, `championid`, `name`) VALUES
(16, NULL, NULL, '????????? - ????? ?');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `position_id` int(11) NOT NULL,
  `position` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `salary` (
  `salary_id` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `salary` double NOT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `scorer` (
  `id` int(11) NOT NULL,
  `contactid` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `gameid` int(11) DEFAULT NULL,
  `teamgroupid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `standing`
--

CREATE TABLE `standing` (
  `id` int(11) NOT NULL,
  `teamid` int(11) DEFAULT NULL,
  `teamgroupid` int(11) DEFAULT NULL,
  `defeat` int(11) DEFAULT '0',
  `draw` int(11) DEFAULT '0',
  `game` int(11) DEFAULT '0',
  `goal` int(11) DEFAULT '0',
  `goalminus` int(11) DEFAULT '0',
  `goalplus` int(11) DEFAULT '0',
  `grade` int(11) NOT NULL DEFAULT '0',
  `win` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standing`
--

INSERT INTO `standing` (`id`, `teamid`, `teamgroupid`, `defeat`, `draw`, `game`, `goal`, `goalminus`, `goalplus`, `grade`, `win`) VALUES
(122, 82, 31, 1, 0, 1, -2, 3, 1, 0, 0),
(123, 83, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(124, 84, 31, 0, 0, 1, 2, 1, 3, 3, 1),
(125, 85, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(126, 86, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(127, 87, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(128, 88, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(129, 89, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(130, 90, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(131, 91, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(132, 92, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(133, 93, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(134, 94, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(135, 96, 31, 0, 0, 0, 0, 0, 0, 0, 0),
(136, 97, 32, 0, 0, 0, 0, 0, 0, 0, 0),
(137, 98, 32, 1, 0, 1, -1, 3, 2, 0, 0),
(138, 99, 32, 0, 0, 0, 0, 0, 0, 0, 0),
(139, 100, 32, 0, 0, 0, 0, 0, 0, 0, 0),
(140, 91, 32, 0, 0, 1, 1, 2, 3, 3, 1),
(142, 90, 33, 0, 0, 0, 0, 0, 0, 0, 0),
(143, 87, 33, 0, 0, 0, 0, 0, 0, 0, 0),
(144, 91, 33, 0, 0, 0, 0, 0, 0, 0, 0),
(145, 84, 33, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` longtext,
  `coverpath` varchar(200) DEFAULT NULL,
  `logopath` varchar(200) DEFAULT NULL,
  `logothumbpath` varchar(200) DEFAULT NULL,
  `locked` bit(1) DEFAULT NULL,
  `coverthumbpath` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `name`, `description`, `coverpath`, `logopath`, `logothumbpath`, `locked`, `coverthumbpath`) VALUES
(82, 'INTER ΕΚΠΛΗΞΗ', 'Η ΠΑΕ Ολυμπιακός Σ.Φ.Π.[1][2][3][4][5] με το διακριτικό τίτλο «ΠΑΕ Ολυμπιακός»,[6][7] ή απλά «Ολυμπιακός», είναι ένα ελληνικό ποδοσφαιρικό σωματείο. Ιδρύθηκε το 1925 στον Πειραιά, και αποτέλεσε το πρώτο τμήμα του αθλητικού συλλόγου «Ολυμπιακός Σύνδεσμος Φιλάθλων Πειραιώς».\n\nΑποτελεί την πλέον επιτυχημένη ομάδα στην ιστορία του ελληνικού ποδοσφαίρου,[8][9] έχοντας κατακτήσει 44 πρωταθλήματα Ελλάδας, 27 κύπελλα Ελλάδας και 17 νταμπλ τίτλων, περισσότερα από κάθε άλλη ελληνική ομάδα, ενώ χαρακτηριστικό είναι πως όλες οι υπόλοιπες έχουν συνολικά κατακτήσει 37 πρωταθλήματα. Ο Ολυμπιακός είναι επίσης μία από τις τρεις ομάδες που δεν έχουν υποβιβαστεί ποτέ από την Α΄ Εθνική κατηγορία.[10] Σε ευρωπαϊκό επίπεδο, έχει προκριθεί δύο φορές σε προημιτελικά διασυλλογικής διοργάνωσης, στο Τσάμπιονς Λιγκ την περίοδο 1998–99 [11] και στο κύπελλο Κυπελλούχων την περίοδο 1992–93, ενώ είναι από τα ιδρυτικά μέλη της Ομοσπονδίας Ευρωπαϊκών Συλλόγων (European Club Association - ECA).[12]', '/customimages/cover_1896_82.jpg', '/customimages/logo_6997_82.png', '/customimages/logo_thumb_6997_82.png', b'1', '/customimages/cover_thumb_1896_82.jpg'),
(83, 'ΣΥΝΤΕΤΡΙΜΕΝΟΙ', NULL, NULL, '/customimages/logo_6312_83.png', '/customimages/logo_thumb_6312_83.png', NULL, NULL),
(84, 'PATRIS SAIN GERMAIN', NULL, NULL, '/customimages/logo_6576_84.png', '/customimages/logo_thumb_6576_84.png', NULL, NULL),
(85, 'PATRA UNITED', NULL, NULL, '/customimages/logo_6444_85.png', '/customimages/logo_thumb_6444_85.png', b'1', NULL),
(86, 'SHADOWS', NULL, NULL, '/customimages/logo_4383_86.png', '/customimages/logo_thumb_4383_86.png', NULL, NULL),
(87, 'ΗΕΙΝΕΚΕΝ', NULL, NULL, '/customimages/logo_6054_87.png', '/customimages/logo_thumb_6054_87.png', NULL, NULL),
(88, 'ΤΑ ΛΙΩΜΑΤΑ', NULL, NULL, NULL, NULL, NULL, NULL),
(89, 'ΑΝΑΓΕΝΝΗΣΗ ΤΕΚΙΛΑΣ', NULL, NULL, '/customimages/logo_4387_89.png', '/customimages/logo_thumb_4387_89.png', NULL, NULL),
(90, 'JENG CY', NULL, NULL, '/customimages/logo_2898_90.png', '/customimages/logo_thumb_2898_90.png', NULL, NULL),
(91, 'ΔΥΤΙΚΑ ΖΑΜΠΟΝ', NULL, NULL, '/customimages/logo_9040_91.png', '/customimages/logo_thumb_9040_91.png', b'1', NULL),
(92, 'LA COCA JUNIORS 2', NULL, NULL, '/customimages/logo_241_92.png', '/customimages/logo_thumb_241_92.png', NULL, NULL),
(93, 'WHITE BULLS', NULL, NULL, '/customimages/logo_5422_93.png', '/customimages/logo_thumb_5422_93.png', NULL, NULL),
(94, 'ΣΠΑΡΤΑ ΞΑΠΛΑΣ', NULL, '/customimages/cover_94.jpg', '/customimages/logo_2809_94.jpeg', '/customimages/logo_thumb_2809_94.jpeg', NULL, NULL),
(96, 'ΚΑΝΟΝΙΕΡΗΔΕΣ', NULL, NULL, '/customimages/logo_9982_96.jpg', '/customimages/logo_thumb_9982_96.jpg', NULL, NULL),
(97, 'ΠΑΟ', NULL, NULL, NULL, NULL, b'1', NULL),
(98, 'ΠΕΙΡΑΜΑΤΙΚΟΙ', NULL, NULL, NULL, NULL, NULL, NULL),
(99, 'BAROUTSAKI', NULL, '/customimages/cover_3387_99.jpg', '/customimages/logo_4308_99.jpeg', '/customimages/logo_thumb_4308_99.jpeg', NULL, '/customimages/cover_thumb_3387_99.jpg'),
(100, 'BOCA JUNIORS', NULL, NULL, '/customimages/logo_2605_100.png', '/customimages/logo_thumb_2605_100.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teamgroup`
--

CREATE TABLE `teamgroup` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `championid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `teamplayerxref` (
  `teamid` int(11) NOT NULL,
  `playerid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teamplayerxref`
--

INSERT INTO `teamplayerxref` (`teamid`, `playerid`) VALUES
(82, 112),
(83, 113),
(82, 114),
(91, 119),
(82, 121),
(86, 122);

-- --------------------------------------------------------

--
-- Table structure for table `userrole`
--

CREATE TABLE `userrole` (
  `role` varchar(255) CHARACTER SET utf8 NOT NULL,
  `contactid` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userrole`
--

INSERT INTO `userrole` (`role`, `contactid`, `id`) VALUES
('ROLE_ADMIN', 2, 1),
('ROLE_ADMIN', 54, 3),
('ROLE_TEAM', 110, 4),
('ROLE_TEAM', 116, 5),
('ROLE_TEAM', 123, 6),
('ROLE_TEAM', 124, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `champion`
--
ALTER TABLE `champion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `adminteamid` (`adminteamid`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `FKqnposetujkibeu5161uk60hj7` (`position_id`),
  ADD KEY `FKnyl1bqcm77w34tl615uoosjo8` (`adminteamid`);

--
-- Indexes for table `custompage`
--
ALTER TABLE `custompage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `adminid` (`adminid`);

--
-- Indexes for table `eventplayerxref`
--
ALTER TABLE `eventplayerxref`
  ADD PRIMARY KEY (`playerid`,`eventid`),
  ADD KEY `eventid` (`eventid`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7pthcs6mnb7ejk2bqvb1557cn` (`matchdayid`),
  ADD KEY `FKauvt3aa0uq47l6gtumtwfnt2n` (`teamid1`),
  ADD KEY `FKo63pplnj6o7x500io9lippcuc` (`teamid2`),
  ADD KEY `FKls9diasf8reb66lvy9i5iq034` (`championid`),
  ADD KEY `FK6sqest9c9us6q7w9eki1asu0t` (`playoffid`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqidoqxsfnm9tnd92ge9hwuesy` (`albumid`),
  ADD KEY `FKl3qvvsvww1j9fipkiour1swuw` (`custompageid`);

--
-- Indexes for table `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2i5mk9b9kjbtd31l85sy5rp3r` (`gameid`),
  ADD KEY `teamid` (`teamid`);

--
-- Indexes for table `matchday`
--
ALTER TABLE `matchday`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK26my16jbkyp7csl62ce9vv8yi` (`teamgroupid`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7ssjguyeuyrbhvdremfxlvrad` (`eventid`),
  ADD KEY `FKcmklxor1li66peguma7qlqfyb` (`contactid`),
  ADD KEY `FKfvngx0qbrcwk4n9rg6ynq7m5i` (`receiverid`),
  ADD KEY `contactid` (`contactid`),
  ADD KEY `receiverid` (`receiverid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persistent_logins`
--
ALTER TABLE `persistent_logins`
  ADD PRIMARY KEY (`series`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `playoff`
--
ALTER TABLE `playoff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdi3x38a5lwt79lm1123mxie56` (`championid`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`position_id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`salary_id`),
  ADD KEY `FKajmf4optcvdbvfy1tv7xu87us` (`id`);

--
-- Indexes for table `scorer`
--
ALTER TABLE `scorer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contactid` (`contactid`,`gameid`),
  ADD KEY `FKiji4rftl3ofxndxrhvujf3xna` (`contactid`),
  ADD KEY `FK8gbmemjt8mtalxjwcvtnwwhy2` (`gameid`),
  ADD KEY `FKebxirlx7h7vhsg1a0gxlp3nux` (`teamgroupid`);

--
-- Indexes for table `standing`
--
ALTER TABLE `standing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_team` (`teamid`,`teamgroupid`),
  ADD KEY `FKn7fmrb4wi0atwwfvem2cc9cj8` (`teamgroupid`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `teamgroup`
--
ALTER TABLE `teamgroup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdc37xp85pps73tixub9cl90s0` (`championid`);

--
-- Indexes for table `teamplayerxref`
--
ALTER TABLE `teamplayerxref`
  ADD UNIQUE KEY `constr` (`teamid`,`playerid`),
  ADD KEY `FKq52ioi5c7tsonx8fsyy9wbm2p` (`playerid`);

--
-- Indexes for table `userrole`
--
ALTER TABLE `userrole`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKtnobapdvh7iuy1gofj4x7in3e` (`role`,`contactid`),
  ADD UNIQUE KEY `UKjpxoimo8qsrdmsjyq3e0nnv72` (`role`,`contactid`),
  ADD KEY `FKjd8ky3k85epi6ytugifbrs95q` (`contactid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `champion`
--
ALTER TABLE `champion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `custompage`
--
ALTER TABLE `custompage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2360;
--
-- AUTO_INCREMENT for table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=190;
--
-- AUTO_INCREMENT for table `information`
--
ALTER TABLE `information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;
--
-- AUTO_INCREMENT for table `matchday`
--
ALTER TABLE `matchday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=606;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `playoff`
--
ALTER TABLE `playoff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `position_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `salary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `scorer`
--
ALTER TABLE `scorer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `standing`
--
ALTER TABLE `standing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT for table `teamgroup`
--
ALTER TABLE `teamgroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `userrole`
--
ALTER TABLE `userrole`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
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
  ADD CONSTRAINT `FKls9diasf8reb66lvy9i5iq034` FOREIGN KEY (`championid`) REFERENCES `champion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FKo63pplnj6o7x500io9lippcuc` FOREIGN KEY (`teamid2`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FKl3qvvsvww1j9fipkiour1swuw` FOREIGN KEY (`custompageid`) REFERENCES `custompage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
