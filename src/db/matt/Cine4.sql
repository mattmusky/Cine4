-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 28, 2018 at 12:36 PM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.25-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Cine4`
--

-- --------------------------------------------------------

--
-- Table structure for table `Comments`
--

CREATE TABLE `Comments` (
  `ComID` int(255) NOT NULL,
  `MID` int(10) DEFAULT NULL,
  `Content` varchar(500) DEFAULT NULL,
  `UID` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Comments`
--

INSERT INTO `Comments` (`ComID`, `MID`, `Content`, `UID`) VALUES
(1, 424688, 'Test Comment', 101);

-- --------------------------------------------------------

--
-- Table structure for table `Genre`
--

CREATE TABLE `Genre` (
  `GID` int(10) NOT NULL,
  `GName` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Genre`
--

INSERT INTO `Genre` (`GID`, `GName`) VALUES
(50, 'Action');

-- --------------------------------------------------------

--
-- Table structure for table `Movies`
--

CREATE TABLE `Movies` (
  `MID` int(10) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Overview` varchar(500) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Poster` varchar(100) DEFAULT NULL,
  `Backdrop` varchar(100) DEFAULT NULL,
  `DVDLink` varchar(100) DEFAULT NULL,
  `TicketLink` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Movies`
--

INSERT INTO `Movies` (`MID`, `Title`, `Overview`, `Date`, `Poster`, `Backdrop`, `DVDLink`, `TicketLink`) VALUES
(424688, 'Cars 2', 'A car salesman', '2009-01-26 00:00:00', '/4hw5PghU2nOWNAr4CskRVM9ehrA.jpg', '/4hw5PghU2nOWNAr4CskRVM9ehrA.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `MoviesHasGenre`
--

CREATE TABLE `MoviesHasGenre` (
  `MID` int(10) NOT NULL,
  `GID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MoviesHasGenre`
--

INSERT INTO `MoviesHasGenre` (`MID`, `GID`) VALUES
(424688, 50);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `UID` int(10) NOT NULL,
  `First` varchar(100) DEFAULT NULL,
  `Last` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Pass` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`UID`, `First`, `Last`, `Email`, `Pass`) VALUES
(101, 'Matt', 'Musky', 'mcm42@njit.edu', 'testpass'),
(102, 'Jimmy', 'test', 'test@yahoo', 'hello');

-- --------------------------------------------------------

--
-- Table structure for table `UsersFavorMovies`
--

CREATE TABLE `UsersFavorMovies` (
  `UID` int(10) NOT NULL,
  `MID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UsersFavorMovies`
--

INSERT INTO `UsersFavorMovies` (`UID`, `MID`) VALUES
(101, 424688);

-- --------------------------------------------------------

--
-- Table structure for table `UsersFriendUsers`
--

CREATE TABLE `UsersFriendUsers` (
  `AddingUID` int(10) NOT NULL,
  `AddedUID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UsersFriendUsers`
--

INSERT INTO `UsersFriendUsers` (`AddingUID`, `AddedUID`) VALUES
(101, 101),
(101, 102);

-- --------------------------------------------------------

--
-- Table structure for table `UsersViewMovies`
--

CREATE TABLE `UsersViewMovies` (
  `UID` int(10) NOT NULL,
  `MID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UsersViewMovies`
--

INSERT INTO `UsersViewMovies` (`UID`, `MID`) VALUES
(101, 424688);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Comments`
--
ALTER TABLE `Comments`
  ADD PRIMARY KEY (`ComID`),
  ADD KEY `Movies_MID_idx` (`MID`),
  ADD KEY `Users_UID_idx` (`UID`);

--
-- Indexes for table `Genre`
--
ALTER TABLE `Genre`
  ADD PRIMARY KEY (`GID`);

--
-- Indexes for table `Movies`
--
ALTER TABLE `Movies`
  ADD PRIMARY KEY (`MID`);

--
-- Indexes for table `MoviesHasGenre`
--
ALTER TABLE `MoviesHasGenre`
  ADD PRIMARY KEY (`MID`,`GID`),
  ADD KEY `Genre_GID_idx` (`GID`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`UID`);

--
-- Indexes for table `UsersFavorMovies`
--
ALTER TABLE `UsersFavorMovies`
  ADD PRIMARY KEY (`UID`,`MID`),
  ADD KEY `Movies_MID_idx` (`MID`);

--
-- Indexes for table `UsersFriendUsers`
--
ALTER TABLE `UsersFriendUsers`
  ADD PRIMARY KEY (`AddingUID`,`AddedUID`);

--
-- Indexes for table `UsersViewMovies`
--
ALTER TABLE `UsersViewMovies`
  ADD PRIMARY KEY (`UID`,`MID`),
  ADD KEY `Movies_MID_idx` (`MID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Comments`
--
ALTER TABLE `Comments`
  ADD CONSTRAINT `Comments_Movies_MID` FOREIGN KEY (`MID`) REFERENCES `Movies` (`MID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Comments_Users_UID` FOREIGN KEY (`UID`) REFERENCES `Users` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `MoviesHasGenre`
--
ALTER TABLE `MoviesHasGenre`
  ADD CONSTRAINT `Genre_GID` FOREIGN KEY (`GID`) REFERENCES `Genre` (`GID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Movies_MID` FOREIGN KEY (`MID`) REFERENCES `Movies` (`MID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `UsersFavorMovies`
--
ALTER TABLE `UsersFavorMovies`
  ADD CONSTRAINT `Favor_Movies_MID` FOREIGN KEY (`MID`) REFERENCES `Movies` (`MID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Favor_Users_UID` FOREIGN KEY (`UID`) REFERENCES `Users` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `UsersViewMovies`
--
ALTER TABLE `UsersViewMovies`
  ADD CONSTRAINT `View_Movies_MID` FOREIGN KEY (`MID`) REFERENCES `Movies` (`MID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `View_Users_UID` FOREIGN KEY (`UID`) REFERENCES `Users` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
