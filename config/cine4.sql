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

-- -----------------------------------------------------
-- Table `cine4`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cine4`.`comments` (
  `ComID` INT(255) NOT NULL,
  `MID` INT(10) NOT NULL,
  `Content` VARCHAR(500) NULL DEFAULT NULL,
  `UID` INT(10) NULL DEFAULT NULL,
  `Createtime` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Amount` INT(10) NULL DEFAULT 0,
  PRIMARY KEY (`ComID`, `MID`),
  CONSTRAINT `Comments_Movies_MID`
    FOREIGN KEY (`MID`)
    REFERENCES `cine4`.`movies` (`MID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Comments_Users_UID`
    FOREIGN KEY (`UID`)
    REFERENCES `cine4`.`users` (`UID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE INDEX `Movies_MID_idx` ON `cine4`.`comments` (`MID` ASC);

CREATE INDEX `Users_UID_idx` ON `cine4`.`comments` (`UID` ASC);

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (10579,335777,'We should all go see it',14894,'2018-03-05 20:28:57',default),(18951,284054,'New favorite movie',61629,'2018-03-05 20:09:44',default),(23175,284054,'Great movie!',89711,'2018-03-05 20:06:28',default),(24189,335777,'This looks good!',49608,'2018-03-05 20:28:37',default),(31682,354912,'Funny',14894,'2018-03-05 20:27:24',default),(40804,343668,'Would see again!',89711,'2018-03-05 20:06:38',default),(42633,374720,'Didn\'t like',89711,'2018-03-05 20:07:10',default),(47230,335777,'I\'d go again though',89711,'2018-03-05 20:37:09',default),(51656,291805,'Another good one',14894,'2018-03-05 20:29:28',default),(58545,343668,'I agree',14894,'2018-03-05 20:10:03',default),(64424,354912,'New favorite animated movie!',89711,'2018-03-05 20:06:58',default),(71967,335777,'I agree',61629,'2018-03-05 20:28:47',default),(79252,198663,'Can\'t wait to see this',89711,'2018-03-05 20:29:58',default),(80843,284054,'I\'d see it in theatres again',49608,'2018-03-05 20:11:33',default),(89076,446354,'Great movie!',89711,'2018-03-05 20:26:52',default),(91189,335777,'I already saw it, really good!',89711,'2018-03-05 20:32:09',default);
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
  `Overview` varchar(1000) DEFAULT NULL,
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
INSERT INTO `movies` VALUES (198663,'The Maze Runner','Set in a post-apocalyptic world, young Thomas is deposited in a community of boys after his memory is erased, soon learning they\'re all trapped in a maze that will require him to join forces with fellow â€œrunnersâ€ for a shot at escape.','2014-09-10','/coss7RgL0NH6g4fC2s5atvf3dFO.jpg','/lkOZcsXcOLZYeJ2YxJd3vSldvU4.jpg','The+Maze+Runner','tt1790864'),(214756,'Ted 2','Newlywed couple Ted and Tami-Lynn want to have a baby, but in order to qualify to be a parent, Ted will have to prove he\'s a person in a court of law.','2015-06-25','/A7HtCxFe7Ms8H7e7o2zawppbuDT.jpg','/nkwoiSVJLeK0NI8kTqioBna61bm.jpg','Ted+2','tt2637276'),(258489,'The Legend of Tarzan','Tarzan, having acclimated to life in London, is called back to his former home in the jungle to investigate the activities at a mining encampment.','2016-06-29','/6FxOPJ9Ysilpq0IgkrMJ7PubFhq.jpg','/pWNBPN8ghaKtGLcQBMwNyM32Wbm.jpg','The+Legend+of+Tarzan','tt0918940'),(269149,'Zootopia','Determined to prove herself, Officer Judy Hopps, the first bunny on Zootopia\'s police force, jumps at the chance to crack her first case - even if it means partnering with scam-artist fox Nick Wilde to solve the mystery.','2016-02-11','/sM33SANp9z6rXW8Itn7NnG1GOEs.jpg','/mhdeE1yShHTaDbJVdWyTlzFvNkr.jpg','Zootopia','tt2948356'),(284054,'Black Panther','After the events of Captain America: Civil War, King T\'Challa returns home to the reclusive, technologically advanced African nation of Wakanda to serve as his country\'s new leader. However, T\'Challa soon finds that he is challenged for the throne from factions within his own country. When two foes conspire to destroy Wakanda, the hero known as Black Panther must team up with C.I.A. agent Everett K. Ross and members of the Dora Milaje, Wakandan special forces, to prevent Wakanda from being dragged into a world war.','2018-02-13','/uxzzxijgPIY7slzFvMotPv8wjKA.jpg','/b6ZJZHUdMEFECvGiDpJjlfUWela.jpg','Black+Panther','tt1825683'),(291805,'Now You See Me 2','One year after outwitting the FBI and winning the publicâ€™s adulation with their mind-bending spectacles, the Four Horsemen resurface only to find themselves face to face with a new enemy who enlists them to pull off their most dangerous heist yet.','2016-06-02','/hU0E130tsGdsYa4K9lc3Xrn5Wyt.jpg','/zrAO2OOa6s6dQMQ7zsUbDyIBrAP.jpg','Now+You+See+Me+2','tt3110958'),(324786,'Hacksaw Ridge','WWII American Army Medic Desmond T. Doss, who served during the Battle of Okinawa, refuses to kill people and becomes the first Conscientious Objector in American history to receive the Congressional Medal of Honor.','2016-10-07','/bndiUFfJxNd2fYx8XO610L9a07m.jpg','/zBK4QZONMQXhcgaJv1YYTdCW7q9.jpg','Hacksaw+Ridge','tt2119532'),(335777,'The Nut Job 2: Nutty by Nature','When the evil mayor of Oakton decides to bulldoze Liberty Park and build a dangerous amusement park in its place, Surly Squirrel and his ragtag group of animal friends need to band together to save their home, defeat the mayor, and take back the park.','2017-08-11','/xOfdQHNF9TlrdujyAjiKfUhxSXy.jpg','/bd1X5nNrrAHVGG0MxsAeCOPPh1w.jpg','The+Nut+Job+2:+Nutty+by+Nature','tt3486626'),(339403,'Baby Driver','After being coerced into working for a crime boss, a young getaway driver finds himself taking part in a heist doomed to fail.','2017-06-28','/dN9LbVNNZFITwfaRjl4tmwGWkRg.jpg','/goCvLSUFz0p7k8R10Hv4CVh3EQv.jpg','Baby+Driver','tt3890160'),(343668,'Kingsman: The Golden Circle','When an attack on the Kingsman headquarters takes place and a new villain rises, Eggsy and Merlin are forced to work together with the American agency known as the Statesman to save the world.','2017-09-20','/34xBL6BXNYFqtHO9zhcgoakS4aP.jpg','/uExPmkOHJySrbJyJDJylHDqaT58.jpg','Kingsman:+The+Golden+Circle','tt4649466'),(347882,'Sleight','A young street magician is left to take care of his little sister after his mother\'s passing and turns to drug dealing in the Los Angeles party scene to keep a roof over their heads. When he gets into trouble with his supplier, his sister is kidnapped and he is forced to rely on both his sleight of hand and brilliant mind to save her.','2017-04-28','/wridRvGxDqGldhzAIh3IcZhHT5F.jpg','/2SEgJ0mHJ7TSdVDbkGU061tR33K.jpg','Sleight','tt4573516'),(354912,'Coco','Despite his familyâ€™s baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel\'s family history.','2017-10-27','/eKi8dIrr8voobbaGzDpe8w0PVbC.jpg','/askg3SMvhqEl4OL52YuvdtY40Yb.jpg','Coco','tt2380307'),(374720,'Dunkirk','The story of the miraculous evacuation of Allied soldiers from Belgium, Britain, Canada and France, who were cut off and surrounded by the German army from the beaches and harbour of Dunkirk between May 26th and June 4th 1940 during World War II.','2017-07-19','/ebSnODDg9lbsMIaWg2uAbjn7TO5.jpg','/4yjJNAgXBmzxpS6sogj4ftwd270.jpg','Dunkirk','tt5013056'),(390043,'The Hitman\'s Bodyguard','The world\'s top bodyguard gets a new client, a hit man who must testify at the International Court of Justice. They must put their differences aside and work together to make it to the trial on time.','2017-08-16','/5CGjlz2vyBhW5xHW4eNOZIdgzYq.jpg','/7KsqfXDECZMryX1Rv4RKsT7SIjQ.jpg','The+Hitman\'s+Bodyguard','tt1959563'),(393345,'Cult of Chucky','Confined to an asylum for the criminally insane for the past four years, Nica Pierce is erroneously convinced that she, not Chucky, murdered her entire family. But when her psychiatrist introduces a new therapeutic â€œtoolâ€ to facilitate his patientsâ€™ group sessions â€” an all-too-familiar â€œGood Guyâ€ doll with an innocently smiling face â€” a string of grisly deaths begins to plague the asylum, and Nica starts to wonder if maybe she isnâ€™t crazy after all. Meanwhile, Andy Barclay, Chuckyâ€™s now all-grown-up nemesis from the first three Childâ€™s Plays, races to Nicaâ€™s aid. But to save her heâ€™ll have to get past Tiffany, Chuckyâ€™s long-ago bride, who will do anything, no matter how deadly or depraved, to help her beloved evil devilish doll.','2017-09-23','/r5JUiMYfatwYeDkxkLWYUx5GIjY.jpg','/lle3uwidvcWxBV6JDhb1NlVGxdE.jpg','Cult+of+Chucky','tt3280262'),(396422,'Annabelle: Creation','Several years after the tragic death of their little girl, a dollmaker and his wife welcome a nun and several girls from a shuttered orphanage into their home, soon becoming the target of the dollmaker\'s possessed creation, Annabelle.','2017-08-03','/tb86j8jVCVsdZnzf8I6cIi65IeM.jpg','/3L5gfIKt2RK9vnCiLgWTAzkhQWC.jpg','Annabelle:+Creation','tt5140878'),(399055,'The Shape of Water','An other-worldly story, set against the backdrop of Cold War era America circa 1962, where a mute janitor working at a lab falls in love with an amphibious man being held captive there and devises a plan to help him escape.','2017-12-01','/k4FwHlMhuRR5BISY2Gm2QZHlH5Q.jpg','/bAISaVhsaoyyQMZ55cpTwCdzek4.jpg','The+Shape+of+Water','tt5580390'),(399404,'Darkest Hour','A thrilling and inspiring true story begins on the eve of World War II as, within days of becoming Prime Minister of Great Britain, Winston Churchill must face one of his most turbulent and defining trials: exploring a negotiated peace treaty with Nazi Germany, or standing firm to fight for the ideals, liberty and freedom of a nation. As the unstoppable Nazi forces roll across Western Europe and the threat of invasion is imminent, and with an unprepared public, a skeptical King, and his own party plotting against him, Churchill must withstand his darkest hour, rally a nation, and attempt to change the course of world history.','2017-11-22','/xa6G3aKlysQeVg9wOb0dRcIGlWu.jpg','/zXwFJMwvQcJFitP9GcHZvHAHGe8.jpg','Darkest+Hour','tt4555426'),(446354,'The Post','A cover-up that spanned four U.S. Presidents pushed the country\'s first female newspaper publisher and a hard-driving editor to join an unprecedented battle between journalist and government. Inspired by true events.','2017-12-22','/qyRwj5VvuTRdJ76o2grP93grNxt.jpg','/2LR3XKthtguN7vOz99Q91IeEl1i.jpg','The+Post','tt6294822');
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
INSERT INTO `movieshasgenre` VALUES (258489,12),(269149,12),(284054,12),(291805,12),(335777,12),(343668,12),(354912,12),(284054,14),(399055,14),(269149,16),(335777,16),(354912,16),(324786,18),(347882,18),(374720,18),(399055,18),(399404,18),(446354,18),(393345,27),(396422,27),(198663,28),(258489,28),(284054,28),(291805,28),(339403,28),(343668,28),(347882,28),(374720,28),(390043,28),(214756,35),(269149,35),(291805,35),(335777,35),(343668,35),(354912,35),(390043,35),(324786,36),(374720,36),(399404,36),(446354,36),(198663,53),(291805,53),(347882,53),(374720,53),(393345,53),(396422,53),(291805,80),(339403,80),(198663,878),(284054,878),(347882,878),(198663,9648),(291805,9648),(396422,9648),(399055,10749),(269149,10751),(335777,10751),(354912,10751),(324786,10752),(374720,10752);
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
INSERT INTO `users` VALUES (14894,'Jimmy','She','js@njit.edu','jimmy','dojO0Q0b01yMA',14894),(49608,'Muz','Khan','mk@njit.edu','mkhan','dojO0Q0b01yMA',49608),(61629,'Vishal','Panchal','vp@njit.edu','vishal','dojO0Q0b01yMA',61629),(89711,'Matt','Muscarella','mm@njit.edu','mattm','dojO0Q0b01yMA',89711);
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
INSERT INTO `usersfavormovies` VALUES (14894,198663),(49608,198663),(61629,198663),(89711,198663),(61629,214756),(61629,269149),(89711,269149),(14894,291805),(49608,291805),(61629,291805),(89711,291805),(14894,335777),(49608,335777),(61629,335777),(89711,339403);
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
INSERT INTO `usersfriendusers` VALUES (14894,61629),(14894,89711),(49608,14894),(49608,61629),(61629,49608),(61629,89711),(89711,14894),(89711,49608),(89711,61629);
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
INSERT INTO `usersviewmovies` VALUES (61629,258489),(14894,284054),(49608,284054),(61629,284054),(89711,284054),(49608,324786),(89711,335777),(14894,343668),(89711,343668),(89711,354912),(89711,374720),(49608,399404),(61629,399404),(89711,399404),(14894,446354),(49608,446354),(61629,446354),(89711,446354);
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

-- Dump completed on 2018-03-05 16:35:02
