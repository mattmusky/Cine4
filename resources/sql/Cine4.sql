-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 05, 2018 at 04:41 PM
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
-- Database: `cine4`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `ComID` int(255) NOT NULL,
  `MID` int(10) NOT NULL,
  `Content` varchar(500) DEFAULT NULL,
  `UID` int(10) DEFAULT NULL,
  `Createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ComID`,`MID`),
  KEY `Movies_MID_idx` (`MID`),
  KEY `Users_UID_idx` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`ComID`, `MID`, `Content`, `UID`, `Createtime`) VALUES
(1212, 198663, 'dsfsdfsdf', 82682, '2018-03-02 03:18:58'),
(11790, 198663, 'dfg', 92533, '2018-03-02 03:42:31'),
(12853, 343668, 'one', 92533, '2018-03-02 15:45:35'),
(18734, 354912, 'test comment 2', 92533, '2018-03-02 15:33:02'),
(19062, 198663, 'the32', 92533, '2018-03-02 03:35:37'),
(28290, 198663, 'sdf', 92533, '2018-03-02 03:35:41'),
(37662, 198663, 'the32', 92533, '2018-03-02 03:35:31'),
(39118, 354912, 'test comment', 92533, '2018-03-02 15:32:42'),
(40294, 198663, 'dg', 92533, '2018-03-02 03:43:43'),
(43310, 198663, 'sdf', 92533, '2018-03-02 03:44:01'),
(51953, 269149, 'sdf', 92533, '2018-03-02 03:26:56'),
(58840, 198663, 'sdfgdgf', 92533, '2018-03-02 03:46:49'),
(58944, 198663, 'sdfggf', 92533, '2018-03-02 03:47:18'),
(59706, 198663, 'the', 92533, '2018-03-02 03:33:31'),
(64463, 198663, 'the3', 92533, '2018-03-02 03:34:06'),
(66922, 198663, 'the32', 92533, '2018-03-02 03:34:51'),
(67842, 198663, 'sdsdf', 92533, '2018-03-02 03:40:59'),
(70494, 281338, '\n-get all of a moviesâ€™ comments, return comment date ** ADD FIRST/LAST\nSELECT	C.Content, C.CreateTime\nFROM		Comments as C\nINNER JOIN	Movies as M ON M.MID = C.MID\nWHERE	M.MID = 424688', 92533, '2018-03-02 16:14:37'),
(72593, 198663, 'sdfdsf', 92533, '2018-03-02 03:48:43'),
(74205, 198663, 'sdgfdgfdsgf', 92533, '2018-03-02 03:47:46'),
(74238, 198663, 'dfg', 92533, '2018-03-02 03:41:54'),
(78270, 354912, '3\n', 92533, '2018-03-02 15:33:29'),
(80508, 198663, 'sdf', 92533, '2018-03-02 03:42:48'),
(85139, 269149, 'sdfsdf', 92533, '2018-03-02 03:27:33'),
(97825, 198663, 'sdf', 92533, '2018-03-02 03:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `GID` int(10) NOT NULL,
  `GName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`GID`, `GName`) VALUES
(12, 'Adventure'),
(14, 'Fantasy'),
(16, 'Animation'),
(18, 'Drama'),
(27, 'Horror'),
(28, 'Action'),
(35, 'Comedy'),
(36, 'History'),
(37, 'Western'),
(53, 'Thriller'),
(80, 'Crime'),
(99, 'Documentary'),
(878, 'Science Fiction'),
(9648, 'Mystery'),
(10402, 'Music'),
(10749, 'Romance'),
(10751, 'Family'),
(10752, 'War'),
(10770, 'TV Movie');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `MID` int(10) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Overview` varchar(500) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Poster` varchar(100) DEFAULT NULL,
  `Backdrop` varchar(100) DEFAULT NULL,
  `DVDLink` varchar(100) DEFAULT NULL,
  `TicketLink` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`MID`, `Title`, `Overview`, `Date`, `Poster`, `Backdrop`, `DVDLink`, `TicketLink`) VALUES
(1, '2', '3', '2012-01-01', '5', '6', '7', '8'),
(198663, 'The Maze Runner', 'Set in a post-apocalyptic world, young Thomas is deposited in a community of boys after his memory is erased, soon learning they\'re all trapped in a maze that will require him to join forces with fellow â€œrunnersâ€ for a shot at escape.', '2014-09-10', '/coss7RgL0NH6g4fC2s5atvf3dFO.jpg', '/lkOZcsXcOLZYeJ2YxJd3vSldvU4.jpg', 'tt1790864', 'tt1790864'),
(214756, 'Ted 2', 'Newlywed couple Ted and Tami-Lynn want to have a baby, but in order to qualify to be a parent, Ted will have to prove he\'s a person in a court of law.', '2015-06-25', '/A7HtCxFe7Ms8H7e7o2zawppbuDT.jpg', '/nkwoiSVJLeK0NI8kTqioBna61bm.jpg', 'tt2637276', 'tt2637276'),
(269149, 'Zootopia', 'Determined to prove herself, Officer Judy Hopps, the first bunny on Zootopia\'s police force, jumps at the chance to crack her first case - even if it means partnering with scam-artist fox Nick Wilde to solve the mystery.', '2016-02-11', '/sM33SANp9z6rXW8Itn7NnG1GOEs.jpg', '/mhdeE1yShHTaDbJVdWyTlzFvNkr.jpg', 'tt2948356', 'tt2948356'),
(281338, 'War for the Planet of the Apes', 'Caesar and his apes are forced into a deadly conflict with an army of humans led by a ruthless Colonel. After the apes suffer unimaginable losses, Caesar wrestles with his darker instincts and begins his own mythic quest to avenge his kind. As the journey finally brings them face to face, Caesar and the Colonel are pitted against each other in an epic battle that will determine the fate of both their species and the future of the planet.', '2017-07-11', '/3vYhLLxrTtZLysXtIWktmd57Snv.jpg', '/ulMscezy9YX0bhknvJbZoUgQxO5.jpg', 'tt3450958', 'tt3450958'),
(337167, 'Fifty Shades Freed', 'Believing they have left behind shadowy figures from their past, newlyweds Christian and Ana fully embrace an inextricable connection and shared life of luxury. But just as she steps into her role as Mrs. Grey and he relaxes into an unfamiliar stability, new threats could jeopardize their happy ending before it even begins.', '2018-02-07', '/jjPJ4s3DWZZvI4vw8Xfi4Vqa1Q8.jpg', '/9ywA15OAiwjSTvg3cBs9B7kOCBF.jpg', 'tt4477536', 'tt4477536'),
(343668, 'Kingsman: The Golden Circle', 'When an attack on the Kingsman headquarters takes place and a new villain rises, Eggsy and Merlin are forced to work together with the American agency known as the Statesman to save the world.', '2017-09-20', '/34xBL6BXNYFqtHO9zhcgoakS4aP.jpg', '/uExPmkOHJySrbJyJDJylHDqaT58.jpg', 'tt4649466', 'tt4649466'),
(354912, 'Coco', 'Despite his familyâ€™s baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel\'s family history.', '2017-10-27', '/eKi8dIrr8voobbaGzDpe8w0PVbC.jpg', '/askg3SMvhqEl4OL52YuvdtY40Yb.jpg', 'tt2380307', 'tt2380307'),
(374720, 'Dunkirk', 'The story of the miraculous evacuation of Allied soldiers from Belgium, Britain, Canada and France, who were cut off and surrounded by the German army from the beaches and harbour of Dunkirk between May 26th and June 4th 1940 during World War II.', '2017-07-19', '/ebSnODDg9lbsMIaWg2uAbjn7TO5.jpg', '/4yjJNAgXBmzxpS6sogj4ftwd270.jpg', 'tt5013056', 'tt5013056'),
(424689, 'The Godfather', 'gf overview', '2018-02-14', 'poster2', 'backdrop2', 'dvd2', 'ticket2');

-- --------------------------------------------------------

--
-- Table structure for table `movieshasgenre`
--

DROP TABLE IF EXISTS `movieshasgenre`;
CREATE TABLE IF NOT EXISTS `movieshasgenre` (
  `MID` int(10) NOT NULL,
  `GID` int(10) NOT NULL,
  PRIMARY KEY (`MID`,`GID`),
  KEY `Genre_GID` (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movieshasgenre`
--

INSERT INTO `movieshasgenre` (`MID`, `GID`) VALUES
(269149, 12),
(343668, 12),
(354912, 12),
(269149, 16),
(354912, 16),
(281338, 18),
(337167, 18),
(374720, 18),
(198663, 28),
(343668, 28),
(374720, 28),
(214756, 35),
(269149, 35),
(343668, 35),
(354912, 35),
(374720, 36),
(198663, 53),
(374720, 53),
(198663, 878),
(281338, 878),
(198663, 9648),
(337167, 10749),
(269149, 10751),
(354912, 10751),
(281338, 10752),
(374720, 10752);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `UID` int(10) NOT NULL,
  `First` varchar(100) DEFAULT NULL,
  `Last` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `User` varchar(100) NOT NULL,
  `Pass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `First`, `Last`, `Email`, `User`, `Pass`) VALUES
(55555, 'George', 'Hodges', 'candy@yahoo.com', 'test', '12345'),
(66666, 'Kelvin', 'Smith', 'mailer@gmail.com', 'catcher', '9876'),
(82682, 'two', 'two', 'two', 'two', 'do3U3rqZ8L1rM'),
(84915, 'three', 'three', 'three', 'three', 'dotH8X0W9SC6U'),
(92533, 'one', 'one', 'one', 'one', 'doex5EjTfzeQY');

-- --------------------------------------------------------

--
-- Table structure for table `usersfavormovies`
--

DROP TABLE IF EXISTS `usersfavormovies`;
CREATE TABLE IF NOT EXISTS `usersfavormovies` (
  `UID` int(10) NOT NULL,
  `MID` int(10) NOT NULL,
  PRIMARY KEY (`UID`,`MID`),
  KEY `Movies_MID_idx` (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usersfavormovies`
--

INSERT INTO `usersfavormovies` (`UID`, `MID`) VALUES
(92533, 1),
(82682, 214756),
(92533, 214756),
(82682, 281338),
(84915, 281338),
(92533, 281338),
(82682, 337167),
(84915, 337167),
(92533, 343668),
(82682, 374720),
(92533, 374720),
(84915, 424689);

-- --------------------------------------------------------

--
-- Table structure for table `usersfriendusers`
--

DROP TABLE IF EXISTS `usersfriendusers`;
CREATE TABLE IF NOT EXISTS `usersfriendusers` (
  `UserUID` int(10) NOT NULL,
  `FriendUID` int(10) NOT NULL,
  PRIMARY KEY (`UserUID`,`FriendUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usersfriendusers`
--

INSERT INTO `usersfriendusers` (`UserUID`, `FriendUID`) VALUES
(82682, 84915),
(82682, 92533),
(92533, 55555),
(92533, 82682),
(92533, 84915);

-- --------------------------------------------------------

--
-- Table structure for table `usersviewmovies`
--

DROP TABLE IF EXISTS `usersviewmovies`;
CREATE TABLE IF NOT EXISTS `usersviewmovies` (
  `UID` int(10) NOT NULL,
  `MID` int(10) NOT NULL,
  PRIMARY KEY (`UID`,`MID`),
  KEY `Movies_MID_idx` (`MID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usersviewmovies`
--

INSERT INTO `usersviewmovies` (`UID`, `MID`) VALUES
(92533, 281338),
(82682, 343668),
(92533, 343668);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `Comments_Movies_MID` FOREIGN KEY (`MID`) REFERENCES `movies` (`MID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Comments_Users_UID` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movieshasgenre`
--
ALTER TABLE `movieshasgenre`
  ADD CONSTRAINT `Genre_GID` FOREIGN KEY (`GID`) REFERENCES `genre` (`GID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Movies_MID` FOREIGN KEY (`MID`) REFERENCES `movies` (`MID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usersfavormovies`
--
ALTER TABLE `usersfavormovies`
  ADD CONSTRAINT `Favor_Movies_MID` FOREIGN KEY (`MID`) REFERENCES `movies` (`MID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Favor_Users_UID` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `usersviewmovies`
--
ALTER TABLE `usersviewmovies`
  ADD CONSTRAINT `View_Movies_MID` FOREIGN KEY (`MID`) REFERENCES `movies` (`MID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `View_Users_UID` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
