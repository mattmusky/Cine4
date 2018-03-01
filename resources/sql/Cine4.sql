-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 28, 2018 at 11:33 PM
-- Server version: 5.7.21-log
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
(1, 424688, 'MX comment1', 101, '2018-02-28 23:29:51'),
(2, 424689, 'GF comment2', 102, '2018-02-28 23:30:02'),
(6, 424688, 'MX Comment2', 102, '2018-02-28 23:30:22');

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
(1, 'Comedy'),
(2, 'Mystery');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `MID` int(10) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Overview` varchar(500) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
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
(424688, 'The Matrix', 'MX overview', '2018-02-09 00:00:00', 'poster1', 'backdrop1', 'dvdlink1', 'ticketlink1'),
(424689, 'The Godfather', 'gf overview', '2018-02-14 00:00:00', 'poster2', 'backdrop2', 'dvd2', 'ticket2');

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
  `Pass` varchar(100) DEFAULT NULL,
  `FriendID` int(10) NOT NULL,
  PRIMARY KEY (`UID`,`FriendID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UID`, `First`, `Last`, `Email`, `Pass`, `FriendID`) VALUES
(101, 'Jimmy', 'She', 'test@yahoo.com', 'smasher', 9),
(102, 'Matt', 'Musky', 'test@gmail.com', 'dasher', 45);

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
