-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 29, 2018 at 08:06 PM
-- Server version: 5.7.21-0ubuntu0.16.04.1
-- PHP Version: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CineDeploy`
--

-- --------------------------------------------------------

--
-- Table structure for table `Version`
--

CREATE TABLE `Version` (
  `VersionID` int(10) NOT NULL,
  `VersionNum` varchar(45) DEFAULT NULL,
  `Createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Deprecate` enum('Y','N') DEFAULT 'N',
  `PackageName` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Version`
--

INSERT INTO `Version` (`VersionID`, `VersionNum`, `Createtime`, `Deprecate`, `PackageName`) VALUES
(13, '1', '2018-04-29 17:18:53', 'N', 'feweb'),
(14, '1', '2018-04-29 17:18:58', 'N', 'fephp'),
(15, '1', '2018-04-29 17:19:01', 'N', 'db'),
(16, '1', '2018-04-29 17:19:05', 'N', 'bephp'),
(17, '1', '2018-04-30 00:05:09', 'N', 'apiphp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Version`
--
ALTER TABLE `Version`
  ADD PRIMARY KEY (`VersionID`,`PackageName`),
  ADD KEY `Version_Package_PackageName_idx` (`PackageName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Version`
--
ALTER TABLE `Version`
  MODIFY `VersionID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Version`
--
ALTER TABLE `Version`
  ADD CONSTRAINT `Version_Package_PackageName` FOREIGN KEY (`PackageName`) REFERENCES `Package` (`PackageName`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
