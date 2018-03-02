-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: cine4
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `ComID` int(255) NOT NULL,
  `MID` int(10) NOT NULL,
  `Content` varchar(500) DEFAULT NULL,
  `UID` int(10) DEFAULT NULL,
  `Createtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ComID`,`MID`),
  KEY `Movies_MID_idx` (`MID`),
  KEY `Users_UID_idx` (`UID`),
  CONSTRAINT `Comments_Movies_MID` FOREIGN KEY (`MID`) REFERENCES `movies` (`MID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Comments_Users_UID` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1212,198663,'dsfsdfsdf',82682,'2018-03-02 03:18:58'),(11790,198663,'dfg',92533,'2018-03-02 03:42:31'),(12853,343668,'one',92533,'2018-03-02 15:45:35'),(18734,354912,'test comment 2',92533,'2018-03-02 15:33:02'),(19062,198663,'the32',92533,'2018-03-02 03:35:37'),(28290,198663,'sdf',92533,'2018-03-02 03:35:41'),(37662,198663,'the32',92533,'2018-03-02 03:35:31'),(39118,354912,'test comment',92533,'2018-03-02 15:32:42'),(40294,198663,'dg',92533,'2018-03-02 03:43:43'),(43310,198663,'sdf',92533,'2018-03-02 03:44:01'),(51953,269149,'sdf',92533,'2018-03-02 03:26:56'),(58840,198663,'sdfgdgf',92533,'2018-03-02 03:46:49'),(58944,198663,'sdfggf',92533,'2018-03-02 03:47:18'),(59706,198663,'the',92533,'2018-03-02 03:33:31'),(64463,198663,'the3',92533,'2018-03-02 03:34:06'),(66922,198663,'the32',92533,'2018-03-02 03:34:51'),(67842,198663,'sdsdf',92533,'2018-03-02 03:40:59'),(70494,281338,'\n-get all of a moviesâ€™ comments, return comment date ** ADD FIRST/LAST\nSELECT	C.Content, C.CreateTime\nFROM		Comments as C\nINNER JOIN	Movies as M ON M.MID = C.MID\nWHERE	M.MID = 424688',92533,'2018-03-02 16:14:37'),(72593,198663,'sdfdsf',92533,'2018-03-02 03:48:43'),(74205,198663,'sdgfdgfdsgf',92533,'2018-03-02 03:47:46'),(74238,198663,'dfg',92533,'2018-03-02 03:41:54'),(78270,354912,'3\n',92533,'2018-03-02 15:33:29'),(80508,198663,'sdf',92533,'2018-03-02 03:42:48'),(85139,269149,'sdfsdf',92533,'2018-03-02 03:27:33'),(97825,198663,'sdf',92533,'2018-03-02 03:46:19');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `GID` int(10) NOT NULL,
  `GName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`GID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (12,'Adventure'),(14,'Fantasy'),(16,'Animation'),(18,'Drama'),(27,'Horror'),(28,'Action'),(35,'Comedy'),(36,'History'),(37,'Western'),(53,'Thriller'),(80,'Crime'),(99,'Documentary'),(878,'Science Fiction'),(9648,'Mystery'),(10402,'Music'),(10749,'Romance'),(10751,'Family'),(10752,'War'),(10770,'TV Movie');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movies` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'2','3','2012-01-01','5','6','7','8'),(198663,'The Maze Runner','Set in a post-apocalyptic world, young Thomas is deposited in a community of boys after his memory is erased, soon learning they\'re all trapped in a maze that will require him to join forces with fellow â€œrunnersâ€ for a shot at escape.','2014-09-10','/coss7RgL0NH6g4fC2s5atvf3dFO.jpg','/lkOZcsXcOLZYeJ2YxJd3vSldvU4.jpg','tt1790864','tt1790864'),(214756,'Ted 2','Newlywed couple Ted and Tami-Lynn want to have a baby, but in order to qualify to be a parent, Ted will have to prove he\'s a person in a court of law.','2015-06-25','/A7HtCxFe7Ms8H7e7o2zawppbuDT.jpg','/nkwoiSVJLeK0NI8kTqioBna61bm.jpg','tt2637276','tt2637276'),(269149,'Zootopia','Determined to prove herself, Officer Judy Hopps, the first bunny on Zootopia\'s police force, jumps at the chance to crack her first case - even if it means partnering with scam-artist fox Nick Wilde to solve the mystery.','2016-02-11','/sM33SANp9z6rXW8Itn7NnG1GOEs.jpg','/mhdeE1yShHTaDbJVdWyTlzFvNkr.jpg','tt2948356','tt2948356'),(281338,'War for the Planet of the Apes','Caesar and his apes are forced into a deadly conflict with an army of humans led by a ruthless Colonel. After the apes suffer unimaginable losses, Caesar wrestles with his darker instincts and begins his own mythic quest to avenge his kind. As the journey finally brings them face to face, Caesar and the Colonel are pitted against each other in an epic battle that will determine the fate of both their species and the future of the planet.','2017-07-11','/3vYhLLxrTtZLysXtIWktmd57Snv.jpg','/ulMscezy9YX0bhknvJbZoUgQxO5.jpg','tt3450958','tt3450958'),(337167,'Fifty Shades Freed','Believing they have left behind shadowy figures from their past, newlyweds Christian and Ana fully embrace an inextricable connection and shared life of luxury. But just as she steps into her role as Mrs. Grey and he relaxes into an unfamiliar stability, new threats could jeopardize their happy ending before it even begins.','2018-02-07','/jjPJ4s3DWZZvI4vw8Xfi4Vqa1Q8.jpg','/9ywA15OAiwjSTvg3cBs9B7kOCBF.jpg','tt4477536','tt4477536'),(343668,'Kingsman: The Golden Circle','When an attack on the Kingsman headquarters takes place and a new villain rises, Eggsy and Merlin are forced to work together with the American agency known as the Statesman to save the world.','2017-09-20','/34xBL6BXNYFqtHO9zhcgoakS4aP.jpg','/uExPmkOHJySrbJyJDJylHDqaT58.jpg','tt4649466','tt4649466'),(354912,'Coco','Despite his familyâ€™s baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel\'s family history.','2017-10-27','/eKi8dIrr8voobbaGzDpe8w0PVbC.jpg','/askg3SMvhqEl4OL52YuvdtY40Yb.jpg','tt2380307','tt2380307'),(374720,'Dunkirk','The story of the miraculous evacuation of Allied soldiers from Belgium, Britain, Canada and France, who were cut off and surrounded by the German army from the beaches and harbour of Dunkirk between May 26th and June 4th 1940 during World War II.','2017-07-19','/ebSnODDg9lbsMIaWg2uAbjn7TO5.jpg','/4yjJNAgXBmzxpS6sogj4ftwd270.jpg','tt5013056','tt5013056'),(424689,'The Godfather','gf overview','2018-02-14','poster2','backdrop2','dvd2','ticket2');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movieshasgenre`
--

DROP TABLE IF EXISTS `movieshasgenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movieshasgenre` (
  `MID` int(10) NOT NULL,
  `GID` int(10) NOT NULL,
  PRIMARY KEY (`MID`,`GID`),
  KEY `Genre_GID` (`GID`),
  CONSTRAINT `Genre_GID` FOREIGN KEY (`GID`) REFERENCES `genre` (`GID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Movies_MID` FOREIGN KEY (`MID`) REFERENCES `movies` (`MID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movieshasgenre`
--

LOCK TABLES `movieshasgenre` WRITE;
/*!40000 ALTER TABLE `movieshasgenre` DISABLE KEYS */;
INSERT INTO `movieshasgenre` VALUES (269149,12),(343668,12),(354912,12),(269149,16),(354912,16),(281338,18),(337167,18),(374720,18),(198663,28),(343668,28),(374720,28),(214756,35),(269149,35),(343668,35),(354912,35),(374720,36),(198663,53),(374720,53),(198663,878),(281338,878),(198663,9648),(337167,10749),(269149,10751),(354912,10751),(281338,10752),(374720,10752);
/*!40000 ALTER TABLE `movieshasgenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UID` int(10) NOT NULL,
  `First` varchar(100) DEFAULT NULL,
  `Last` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `User` varchar(100) NOT NULL,
  `Pass` varchar(100) DEFAULT NULL,
  `FriendID` int(10) NOT NULL,
  PRIMARY KEY (`UID`,`FriendID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (82682,'two','two','two','two','do3U3rqZ8L1rM',82682),(84915,'three','three','three','three','dotH8X0W9SC6U',84915),(92533,'one','one','one','one','doex5EjTfzeQY',92533);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersfavormovies`
--

DROP TABLE IF EXISTS `usersfavormovies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersfavormovies` (
  `UID` int(10) NOT NULL,
  `MID` int(10) NOT NULL,
  PRIMARY KEY (`UID`,`MID`),
  KEY `Movies_MID_idx` (`MID`),
  CONSTRAINT `Favor_Movies_MID` FOREIGN KEY (`MID`) REFERENCES `movies` (`MID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Favor_Users_UID` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersfavormovies`
--

LOCK TABLES `usersfavormovies` WRITE;
/*!40000 ALTER TABLE `usersfavormovies` DISABLE KEYS */;
INSERT INTO `usersfavormovies` VALUES (82682,281338),(92533,343668);
/*!40000 ALTER TABLE `usersfavormovies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersfriendusers`
--

DROP TABLE IF EXISTS `usersfriendusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersfriendusers` (
  `UserUID` int(10) NOT NULL,
  `FriendUID` int(10) NOT NULL,
  PRIMARY KEY (`UserUID`,`FriendUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersfriendusers`
--

LOCK TABLES `usersfriendusers` WRITE;
/*!40000 ALTER TABLE `usersfriendusers` DISABLE KEYS */;
INSERT INTO `usersfriendusers` VALUES (82682,92533),(92533,82682),(92533,84915);
/*!40000 ALTER TABLE `usersfriendusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersviewmovies`
--

DROP TABLE IF EXISTS `usersviewmovies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersviewmovies` (
  `UID` int(10) NOT NULL,
  `MID` int(10) NOT NULL,
  PRIMARY KEY (`UID`,`MID`),
  KEY `Movies_MID_idx` (`MID`),
  CONSTRAINT `View_Movies_MID` FOREIGN KEY (`MID`) REFERENCES `movies` (`MID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `View_Users_UID` FOREIGN KEY (`UID`) REFERENCES `users` (`UID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersviewmovies`
--

LOCK TABLES `usersviewmovies` WRITE;
/*!40000 ALTER TABLE `usersviewmovies` DISABLE KEYS */;
INSERT INTO `usersviewmovies` VALUES (92533,281338),(82682,343668),(92533,343668);
/*!40000 ALTER TABLE `usersviewmovies` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-02 11:30:39
