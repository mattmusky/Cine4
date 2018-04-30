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
  `Amount` int(10) DEFAULT NULL,
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
INSERT INTO `comments` VALUES (10579,335777,'We should all go see it',14894,'2018-04-27 05:26:31',1),(18951,284054,'New favorite movie',61629,'2018-04-27 05:27:07',1),(23175,284054,'Great movie!',89711,'2018-04-27 05:27:07',1),(24189,335777,'This looks good!',49608,'2018-04-29 00:18:23',4),(27444,181808,'not my luke skywalker',28733,'2018-04-29 23:17:15',1),(27952,198663,'Better than the sequel',58707,'2018-04-29 23:09:37',1),(30293,299536,'best avengers so far\n',10349,'2018-04-29 19:38:12',1),(31682,354912,'Funny',14894,'2018-04-27 05:27:07',1),(40804,343668,'Would see again!',89711,'2018-04-27 05:27:07',1),(42633,374720,'Didn\'t like',89711,'2018-04-27 05:27:07',1),(47230,335777,'I\'d go again though',89711,'2018-04-27 05:23:54',3),(51656,291805,'Another good one',14894,'2018-04-27 05:27:07',1),(54848,181808,'thats racist\n',49608,'2018-04-29 23:17:13',3),(55081,41154,'flop movie\n',28733,'2018-04-29 19:31:15',1),(56760,335777,'Dope film',89711,'2018-04-27 05:39:38',1),(58545,343668,'I agree',14894,'2018-04-27 05:27:07',1),(58639,335777,'Can I join?',89711,'2018-04-27 05:27:07',1),(58768,335777,'Tonight maybe?',89711,'2018-04-27 05:39:17',3),(64424,354912,'New favorite animated movie!',89711,'2018-04-29 20:01:18',2),(64454,181808,'the black guy and asian girl ruined this movie',34549,'2018-04-29 23:17:03',-3),(71967,335777,'I agree',61629,'2018-04-27 05:27:07',1),(72681,245891,'one of the best action movies ive seen',88020,'2018-04-29 19:23:11',1),(75665,118340,'yea i agree jordan ',58707,'2018-04-29 19:49:45',4),(77901,9469,'what an awesome movie',10349,'2018-04-29 23:07:29',1),(78605,118340,'best marvel movie',10349,'2018-04-29 19:49:45',3),(79252,198663,'Can\'t wait to see this',89711,'2018-04-27 05:27:07',1),(80843,284054,'I\'d see it in theatres again',49608,'2018-04-27 05:27:07',1),(87061,335777,'My friends want to see it too!',89711,'2018-04-29 00:18:36',1),(89076,446354,'Great movie!',89711,'2018-04-27 05:27:07',1),(90549,118340,'I seriously hate this movie',14894,'2018-04-29 19:49:28',-2),(91189,335777,'I already saw it, really good!',89711,'2018-04-27 05:27:07',1),(91747,447332,'instant classic',10349,'2018-04-29 19:39:23',1),(95613,354912,'I hate this movie\n',34549,'2018-04-29 20:01:15',1);
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
INSERT INTO `movies` VALUES (155,'The Dark Knight','Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.','2008-07-16','/1hRoyzDtpgMU7Dz4JF22RANzQO7.jpg','/hqkIcbrOHL86UncnHIsHVcVmzue.jpg','The+Dark+Knight','tt0468569'),(176,'Saw','Obsessed with teaching his victims the value of life, a deranged, sadistic serial killer abducts the morally wayward. Once captured, they must face impossible choices in a horrific game of survival. The victims must fight to win their lives back, or die trying...','2004-10-01','/dHYvIgsax8ZFgkz1OslE4V6Pnf5.jpg','/fLL6WfUXvdQee1fD4xuzNnWfVBk.jpg','Saw','tt0387564'),(679,'Aliens','When Ripley\'s lifepod is found by a salvage crew over 50 years later, she finds that terra-formers are on the very planet they found the alien species. When the company sends a family of colonists out to investigate her story, all contact is lost with the planet and colonists. They enlist Ripley and the colonial marines to return and search for answers.','1986-07-18','/nORMXEkYEbzkU5WkMWMgRDJwjSZ.jpg','/fYoe6SqpNpTjUIIZhLGHfHu1Nt8.jpg','Aliens','tt0090605'),(862,'Toy Story','Led by Woody, Andy\'s toys live happily in his room until Andy\'s birthday brings Buzz Lightyear onto the scene. Afraid of losing his place in Andy\'s heart, Woody plots against Buzz. But when circumstances separate Buzz and Woody from their owner, the duo eventually learns to put aside their differences.','1995-10-30','/rhIRbceoE9lR4veEXuwCC2wARtG.jpg','/dji4Fm0gCDVb9DQQMRvAI8YNnTz.jpg','Toy+Story','tt0114709'),(920,'Cars','Lightning McQueen, a hotshot rookie race car driven to succeed, discovers that life is about the journey, not the finish line, when he finds himself unexpectedly detoured in the sleepy Route 66 town of Radiator Springs. On route across the country to the big Piston Cup Championship in California to compete against two seasoned pros, McQueen gets to know the town\'s offbeat characters.','2006-06-08','/5damnMcRFKSjhCirgX3CMa88MBj.jpg','/a1MlbLBk5Sy6YvMbSuKfwGlDVlb.jpg','Cars','tt0317219'),(6114,'Dracula','When Dracula leaves the captive Jonathan Harker and Transylvania for London in search of Mina Harker -- the spitting image of Dracula\'s long-dead wife, Elisabeta -- obsessed vampire hunter Dr. Van Helsing sets out to end the madness.','1992-11-13','/ioHxm3D3JdSXR61LRhcVb8KdZOz.jpg','/x4RwLFKvVm5X6zkrKRLBUkDIwuq.jpg','Dracula','tt0103874'),(8077,'AlienÂ³','After escaping with Newt and Hicks from the alien planet, Ripley crash lands on Fiorina 161, a prison planet and host to a correctional facility. Unfortunately, although Newt and Hicks do not survive the crash, a more unwelcome visitor does. The prison does not allow weapons of any kind, and with aid being a long time away, the prisoners must simply survive in any way they can.','1992-05-22','/p7mUd9GpmCYV5qhkKGmiEerFK3i.jpg','/nDPuIjpJyGDOnNEby5ZgkRBxymS.jpg','AlienÂ³','tt0103644'),(9469,'He Got Game','A basketball player\'s father must try to convince him to go to a college so he can get a shorter sentence.','1998-05-01','/kd8hRaysUQOz7AvSorZDJHuihcJ.jpg','/1bm55fptJb2MusLsMoAr3hmQSyO.jpg','He+Got+Game','tt0124718'),(22970,'The Cabin in the Woods','Five college friends spend the weekend at a remote cabin in the woods, where they get more than they bargained for. Together, they must discover the truth behind the cabin in the woods.','2012-04-12','/utfJuX6DfR28Mv2FMfnPFAYOmTU.jpg','/214TKe8WBBbFXVrBRV9RECeE4oW.jpg','The+Cabin+in+the+Woods','tt1259521'),(24428,'The Avengers','When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!','2012-04-25','/cezWGskPY5x7GaglTTRN4Fugfb8.jpg','/hbn46fQaRmlpBuUrEiFqv0GDL6Y.jpg','The+Avengers','tt0848228'),(41154,'Men in Black 3','Agents J (Will Smith) and K (Tommy Lee Jones) are back...in time. J has seen some inexplicable things in his 15 years with the Men in Black, but nothing, not even aliens, perplexes him as much as his wry, reticent partner. But when K\'s life and the fate of the planet are put at stake, Agent J will have to travel back in time to put things right. J discovers that there are secrets to the universe that K never told him - secrets that will reveal themselves as he teams up with the young Agent K (Josh Brolin) to save his partner, the agency, and the future of humankind.','2012-05-23','/l9hrvXyGq19f6jPRZhSVRibTMwW.jpg','/7u3UyejCbhM3jXcZ86xzA9JJxge.jpg','Men+in+Black+3','tt1409024'),(49017,'Dracula Untold','Vlad Tepes is a great hero, but when he learns the Sultan is preparing for battle and needs to form an army of 1,000 boys, including Vlad\'s son, he vows to find a way to protect his family. Vlad turns to dark forces in order to get the power to destroy his enemies and agrees to go from hero to monster as he\'s turned into the mythological vampire Dracula.','2014-10-01','/4oy4e0DP6LRwRszfx8NY8EYBj8V.jpg','/6UPlIYKxZqUR6Xbpgu1JKG0J7UC.jpg','Dracula+Untold','tt0829150'),(118340,'Guardians of the Galaxy','Light years from Earth, 26 years after being abducted, Peter Quill finds himself the prime target of a manhunt after discovering an orb wanted by Ronan the Accuser.','2014-07-30','/y31QB9kn3XSudA15tV7UWQ9XLuW.jpg','/bHarw8xrmQeqf3t8HpuMY7zoK4x.jpg','Guardians+of+the+Galaxy','tt2015381'),(119450,'Dawn of the Planet of the Apes','A group of scientists in San Francisco struggle to stay alive in the aftermath of a plague that is wiping out humanity, while Caesar tries to maintain dominance over his community of intelligent apes.','2014-06-26','/2EUAUIu5lHFlkj5FRryohlH6CRO.jpg','/t7VSsAbIQS6kpO4ikuCNSiugsSy.jpg','Dawn+of+the+Planet+of+the+Apes','tt2103281'),(126889,'Alien: Covenant','Bound for a remote planet on the far side of the galaxy, the crew of the colony ship \'Covenant\' discovers what is thought to be an uncharted paradise, but is actually a dark, dangerous world â€“ which has its sole inhabitant the \'synthetic\', David, survivor of the doomed Prometheus expedition.','2017-05-09','/zecMELPbU5YMQpC81Z8ImaaXuf9.jpg','/kMU8trT43p5LFoJ4plIySMOsZ1T.jpg','Alien:+Covenant','tt2316204'),(149817,'Tour de France','','2007-01-30','/3CUX4b6iVavra6NA0oalsUa5w9Z.jpg','/oVdLRp1ONrPQb2wdQzGrh4zzY3M.jpg','Tour+de+France',''),(181808,'Star Wars: The Last Jedi','Rey develops her newly discovered abilities with the guidance of Luke Skywalker, who is unsettled by the strength of her powers. Meanwhile, the Resistance prepares to do battle with the First Order.','2017-12-13','/kOVEVeg59E0wsnXmF9nrh6OmWII.jpg','/c4Dw37VZjBmObmJw9bmt8IDwMZH.jpg','Star+Wars:+The+Last+Jedi','tt2527336'),(198663,'The Maze Runner','Set in a post-apocalyptic world, young Thomas is deposited in a community of boys after his memory is erased, soon learning they\'re all trapped in a maze that will require him to join forces with fellow â€œrunnersâ€ for a shot at escape.','2014-09-10','/coss7RgL0NH6g4fC2s5atvf3dFO.jpg','/lkOZcsXcOLZYeJ2YxJd3vSldvU4.jpg','The+Maze+Runner','tt1790864'),(211483,'1998 Tour de France','A wonderful victory for the Italian pirate Marco Pantani, who, in an incident packed Tour, becomes the first Italian winner since the great Felice Gimondi in 1965. Temperatures hit 40 degrees and the Pyrenees came into sight. Be enthralled by the Italian \"Pirate\" Marco Pantani\'s electrifying riding as he attacked Ullirch on the road to the Plateau de Beille. In one of the most exciting stage for years, he dug deep in the driving rain and mist to win at Les Deux-Alpes. He rides to a brilliant third place in the time-trial and then on to the Champs Elysees, where he becomes the first Italian Tour de France winner since Felice Gimondi in 1965 and equals the double of \"il campionissimo\" Fausto Coppi in 1952. Historic and unmissable.  Commentary by Phil Liggett and Paul Sherwen','1998-08-31','/ebeskU9quwWOySrkFo4EhGbIHQR.jpg','','1998+Tour+de+France',''),(214756,'Ted 2','Newlywed couple Ted and Tami-Lynn want to have a baby, but in order to qualify to be a parent, Ted will have to prove he\'s a person in a court of law.','2015-06-25','/A7HtCxFe7Ms8H7e7o2zawppbuDT.jpg','/nkwoiSVJLeK0NI8kTqioBna61bm.jpg','Ted+2','tt2637276'),(216015,'Fifty Shades of Grey','When college senior Anastasia Steele steps in for her sick roommate to interview prominent businessman Christian Grey for their campus paper, little does she realize the path her life will take. Christian, as enigmatic as he is rich and powerful, finds himself strangely drawn to Ana, and she to him. Though sexually inexperienced, Ana plunges headlong into an affair -- and learns that Christian\'s true sexual proclivities push the boundaries of pain and pleasure.','2015-02-11','/jV8wnk3Jgz6f7degmT3lHNGI2tK.jpg','/zAd0MjURkOvJynIsqmLMBcICxUt.jpg','Fifty+Shades+of+Grey','tt2322441'),(227148,'The Tour - The Legend of the Race','Jean-Christophe RosÃ© directs this documentary tracing the history of the world\'s most famous cycle race. Celebrating the event\'s centenary year, the film highlights the tour\'s enduring relationship with the public by looking back at the legendary riders whose names have become synonymous with the race, including Fausto Coppi, Louison Bobet, Jacques Anquetil, Raymond Poulidor, Eddy Merckx, Bernard Hinault, Miguel Indurain, Bradley Wiggins and Lance Armstrong.','2013-06-23','/521Aa04g1DqIDV2FnGu2IoMgyBF.jpg','','The+Tour+-+The+Legend+of+the+Race','tt3164758'),(244154,'Science of Steroids','It is one of the most controversial issues of our day, jeopardizing the health and smearing the reputations of Olympians, professional sports players and even high school athletes. The government has declared them illegal without a prescription, athletes call them unfair, and some doctors say they are potentially deadly. What are the real dangers of these drugs? We\'ve seen what\'s happening outside the body; now NGC reveals what\'s happening inside the body, in the Science of Steroids.','2008-02-21','/mUrhpHl7jF50lOEBt3wrQZWpLSF.jpg','','Science+of+Steroids','tt2058687'),(245891,'John Wick','Ex-hitman John Wick comes out of retirement to track down the gangsters that took everything from him.','2014-10-22','/5vHssUeVe25bMrof1HyaPyWgaP.jpg','/umC04Cozevu8nn3JTDJ1pc7PVTn.jpg','John+Wick','tt2911666'),(253295,'Manny','From abject poverty to becoming a ten-time boxing world champion, congressman, and international icon, Manny Pacquiao is the true definition of a Cinderella story. In the Philippines, he first entered the ring as a sixteen-year-old weighing ninety-eight pounds with the goal of earning money to feed his family. Now, almost twenty years later, when he fights, the country of 100 million people comes to a complete standstill to watch. Regarded for his ability to bring people together, Pacquiao entered the political arena in 2010. As historyâ€™s first boxing congressman, Pacquiao now fights for his people both inside and outside of the ring. Now at the height of his career, he is faced with maneuvering an unscrupulous sport while maintaining his political duties. The question now is, what bridge is too far for Manny Pacquiao to cross?','2014-12-31','/eG5Hq3GkDzZMmETB9soAz5UCI8Y.jpg','/8CQMlhukSKtGAHCg11iYN7T9gYn.jpg','Manny','tt1778931'),(258489,'The Legend of Tarzan','Tarzan, having acclimated to life in London, is called back to his former home in the jungle to investigate the activities at a mining encampment.','2016-06-29','/6FxOPJ9Ysilpq0IgkrMJ7PubFhq.jpg','/pWNBPN8ghaKtGLcQBMwNyM32Wbm.jpg','The+Legend+of+Tarzan','tt0918940'),(269149,'Zootopia','Determined to prove herself, Officer Judy Hopps, the first bunny on Zootopia\'s police force, jumps at the chance to crack her first case - even if it means partnering with scam-artist fox Nick Wilde to solve the mystery.','2016-02-11','/sM33SANp9z6rXW8Itn7NnG1GOEs.jpg','/mhdeE1yShHTaDbJVdWyTlzFvNkr.jpg','Zootopia','tt2948356'),(270303,'It Follows','For 19-year-old Jay, fall should be about school, boys and weekends out at the lake. But a seemingly innocent physical encounter turns sour and gives her the inescapable sense that someone, or something, is following her. Faced with this burden, Jay and her teenage friends must find a way to escape the horror that seems to be only a few steps behind.','2014-11-13','/4MrwJZr0R9LbyOgZqwLNmtzzxbu.jpg','/nwQgcgGVrKyjlxNzaDZud82pUly.jpg','It+Follows','tt3235888'),(274855,'Geostorm','After an unprecedented series of natural disasters threatened the planet, the world\'s leaders came together to create an intricate network of satellites to control the global climate and keep everyone safe. But now, something has gone wrong: the system built to protect Earth is attacking it, and it becomes a race against the clock to uncover the real threat before a worldwide geostorm wipes out everything and everyone along with it.','2017-10-13','/nrsx0jEaBgXq4PWo7SooSnYJTv.jpg','/79X8JkGxzc1tJMi0KxUSaPLooVg.jpg','Geostorm','tt1981128'),(284053,'Thor: Ragnarok','Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the prophecy of destruction to his homeworld and the end of Asgardian civilization, at the hands of an all-powerful new threat, the ruthless Hela.','2017-10-25','/rzRwTcFvttcN1ZpX2xv4j3tSdJu.jpg','/kaIfm5ryEOwYg8mLbq8HkPuM1Fo.jpg','Thor:+Ragnarok','tt3501632'),(284054,'Black Panther','After the events of Captain America: Civil War, King T\'Challa returns home to the reclusive, technologically advanced African nation of Wakanda to serve as his country\'s new leader. However, T\'Challa soon finds that he is challenged for the throne from factions within his own country. When two foes conspire to destroy Wakanda, the hero known as Black Panther must team up with C.I.A. agent Everett K. Ross and members of the Dora Milaje, Wakandan special forces, to prevent Wakanda from being dragged into a world war.','2018-02-13','/uxzzxijgPIY7slzFvMotPv8wjKA.jpg','/b6ZJZHUdMEFECvGiDpJjlfUWela.jpg','Black+Panther','tt1825683'),(291805,'Now You See Me 2','One year after outwitting the FBI and winning the publicâ€™s adulation with their mind-bending spectacles, the Four Horsemen resurface only to find themselves face to face with a new enemy who enlists them to pull off their most dangerous heist yet.','2016-06-02','/hU0E130tsGdsYa4K9lc3Xrn5Wyt.jpg','/zrAO2OOa6s6dQMQ7zsUbDyIBrAP.jpg','Now+You+See+Me+2','tt3110958'),(299536,'Avengers: Infinity War','As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.','2018-04-25','/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg','/bOGkgRGdhrBYJSLpXaxhXVstddV.jpg','Avengers:+Infinity+War','tt4154756'),(318549,'Dansker i Tour de France','','2000-01-01','/g1tCDKADUgdT2AAcwlGe26ispEC.jpg','','Dansker+i+Tour+de+France',''),(321612,'Beauty and the Beast','A live-action adaptation of Disney\'s version of the classic tale of a cursed prince and a beautiful young woman who helps him break the spell.','2017-03-16','/tWqifoYuwLETmmasnGHO7xBjEtt.jpg','/6aUWe0GSl69wMTSWWexsorMIvwU.jpg','Beauty+and+the+Beast','tt2771200'),(324786,'Hacksaw Ridge','WWII American Army Medic Desmond T. Doss, who served during the Battle of Okinawa, refuses to kill people and becomes the first Conscientious Objector in American history to receive the Congressional Medal of Honor.','2016-10-07','/bndiUFfJxNd2fYx8XO610L9a07m.jpg','/zBK4QZONMQXhcgaJv1YYTdCW7q9.jpg','Hacksaw+Ridge','tt2119532'),(333339,'Ready Player One','When the creator of a popular video game system dies, a virtual contest is created to compete for his fortune.','2018-03-28','/pU1ULUq8D3iRxl1fdX2lZIzdHuI.jpg','/q7fXcrDPJcf6t3rzutaNwTzuKP1.jpg','Ready+Player+One','tt1677720'),(335777,'The Nut Job 2: Nutty by Nature','When the evil mayor of Oakton decides to bulldoze Liberty Park and build a dangerous amusement park in its place, Surly Squirrel and his ragtag group of animal friends need to band together to save their home, defeat the mayor, and take back the park.','2017-08-11','/xOfdQHNF9TlrdujyAjiKfUhxSXy.jpg','/bd1X5nNrrAHVGG0MxsAeCOPPh1w.jpg','The+Nut+Job+2:+Nutty+by+Nature','tt3486626'),(337167,'Fifty Shades Freed','Believing they have left behind shadowy figures from their past, newlyweds Christian and Ana fully embrace an inextricable connection and shared life of luxury. But just as she steps into her role as Mrs. Grey and he relaxes into an unfamiliar stability, new threats could jeopardize their happy ending before it even begins.','2018-02-07','/jjPJ4s3DWZZvI4vw8Xfi4Vqa1Q8.jpg','/9ywA15OAiwjSTvg3cBs9B7kOCBF.jpg','Fifty+Shades+Freed','tt4477536'),(338970,'Tomb Raider','Lara Croft, the fiercely independent daughter of a missing adventurer, must push herself beyond her limits when she finds herself on the island where her father disappeared.','2018-03-08','/ePyN2nX9t8SOl70eRW47Q29zUFO.jpg','/bLJTjfbZ1c5zSNiAvGYs1Uc82ir.jpg','Tomb+Raider','tt1365519'),(339403,'Baby Driver','After being coerced into working for a crime boss, a young getaway driver finds himself taking part in a heist doomed to fail.','2017-06-28','/dN9LbVNNZFITwfaRjl4tmwGWkRg.jpg','/goCvLSUFz0p7k8R10Hv4CVh3EQv.jpg','Baby+Driver','tt3890160'),(343668,'Kingsman: The Golden Circle','When an attack on the Kingsman headquarters takes place and a new villain rises, Eggsy and Merlin are forced to work together with the American agency known as the Statesman to save the world.','2017-09-20','/34xBL6BXNYFqtHO9zhcgoakS4aP.jpg','/uExPmkOHJySrbJyJDJylHDqaT58.jpg','Kingsman:+The+Golden+Circle','tt4649466'),(347882,'Sleight','A young street magician is left to take care of his little sister after his mother\'s passing and turns to drug dealing in the Los Angeles party scene to keep a roof over their heads. When he gets into trouble with his supplier, his sister is kidnapped and he is forced to rely on both his sleight of hand and brilliant mind to save her.','2017-04-28','/wridRvGxDqGldhzAIh3IcZhHT5F.jpg','/2SEgJ0mHJ7TSdVDbkGU061tR33K.jpg','Sleight','tt4573516'),(353616,'Pitch Perfect 3','After the highs of winning the world championships, the Bellas find themselves split apart and discovering there aren\'t job prospects for making music with your mouth. But when they get the chance to reunite for an overseas USO tour, this group of awesome nerds will come together to make some music, and some questionable decisions, one last time.','2017-12-21','/fchHLsLjFvzAFSQykiMwdF1051.jpg','/1qIzlhLGPSm6TxlvXBWe0Q5er7O.jpg','Pitch+Perfect+3','tt4765284'),(354912,'Coco','Despite his familyâ€™s baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz. Desperate to prove his talent, Miguel finds himself in the stunning and colorful Land of the Dead following a mysterious chain of events. Along the way, he meets charming trickster Hector, and together, they set off on an extraordinary journey to unlock the real story behind Miguel\'s family history.','2017-10-27','/eKi8dIrr8voobbaGzDpe8w0PVbC.jpg','/askg3SMvhqEl4OL52YuvdtY40Yb.jpg','Coco','tt2380307'),(359940,'Three Billboards Outside Ebbing, Missouri','After seven months have passed without a culprit in her daughter\'s murder case, Mildred Hayes makes a bold move, painting three signs leading into her town with a controversial message directed at Bill Willoughby, the town\'s revered chief of police. When his second-in-command Officer Jason Dixon, an immature mother\'s boy with a penchant for violence, gets involved, the battle between Mildred and Ebbing\'s law enforcement is only exacerbated.','2017-11-10','/vgvw6w1CtcFkuXXn004S5wQsHRl.jpg','/bJLJAtGjBj836UjJZNOwgrfe5Ps.jpg','Three+Billboards+Outside+Ebbing,+Missouri','tt5027774'),(374720,'Dunkirk','The story of the miraculous evacuation of Allied soldiers from Belgium, Britain, Canada and France, who were cut off and surrounded by the German army from the beaches and harbour of Dunkirk between May 26th and June 4th 1940 during World War II.','2017-07-19','/ebSnODDg9lbsMIaWg2uAbjn7TO5.jpg','/4yjJNAgXBmzxpS6sogj4ftwd270.jpg','Dunkirk','tt5013056'),(381288,'Split','Though Kevin has evidenced 23 personalities to his trusted psychiatrist, Dr. Fletcher, there remains one still submerged who is set to materialize and dominate all the others. Compelled to abduct three teenage girls led by the willful, observant Casey, Kevin reaches a war for survival among all of those contained within him â€” as well as everyone around him â€” as the walls between his compartments shatter apart.','2017-01-19','/rXMWOZiCt6eMX22jWuTOSdQ98bY.jpg','/4G6FNNLSIVrwSRZyFs91hQ3lZtD.jpg','Split','tt4972582'),(390043,'The Hitman\'s Bodyguard','The world\'s top bodyguard gets a new client, a hit man who must testify at the International Court of Justice. They must put their differences aside and work together to make it to the trial on time.','2017-08-16','/5CGjlz2vyBhW5xHW4eNOZIdgzYq.jpg','/7KsqfXDECZMryX1Rv4RKsT7SIjQ.jpg','The+Hitman\'s+Bodyguard','tt1959563'),(393345,'Cult of Chucky','Confined to an asylum for the criminally insane for the past four years, Nica Pierce is erroneously convinced that she, not Chucky, murdered her entire family. But when her psychiatrist introduces a new therapeutic â€œtoolâ€ to facilitate his patientsâ€™ group sessions â€” an all-too-familiar â€œGood Guyâ€ doll with an innocently smiling face â€” a string of grisly deaths begins to plague the asylum, and Nica starts to wonder if maybe she isnâ€™t crazy after all. Meanwhile, Andy Barclay, Chuckyâ€™s now all-grown-up nemesis from the first three Childâ€™s Plays, races to Nicaâ€™s aid. But to save her heâ€™ll have to get past Tiffany, Chuckyâ€™s long-ago bride, who will do anything, no matter how deadly or depraved, to help her beloved evil devilish doll.','2017-09-23','/r5JUiMYfatwYeDkxkLWYUx5GIjY.jpg','/lle3uwidvcWxBV6JDhb1NlVGxdE.jpg','Cult+of+Chucky','tt3280262'),(396422,'Annabelle: Creation','Several years after the tragic death of their little girl, a dollmaker and his wife welcome a nun and several girls from a shuttered orphanage into their home, soon becoming the target of the dollmaker\'s possessed creation, Annabelle.','2017-08-03','/tb86j8jVCVsdZnzf8I6cIi65IeM.jpg','/3L5gfIKt2RK9vnCiLgWTAzkhQWC.jpg','Annabelle:+Creation','tt5140878'),(399055,'The Shape of Water','An other-worldly story, set against the backdrop of Cold War era America circa 1962, where a mute janitor working at a lab falls in love with an amphibious man being held captive there and devises a plan to help him escape.','2017-12-01','/k4FwHlMhuRR5BISY2Gm2QZHlH5Q.jpg','/bAISaVhsaoyyQMZ55cpTwCdzek4.jpg','The+Shape+of+Water','tt5580390'),(399404,'Darkest Hour','A thrilling and inspiring true story begins on the eve of World War II as, within days of becoming Prime Minister of Great Britain, Winston Churchill must face one of his most turbulent and defining trials: exploring a negotiated peace treaty with Nazi Germany, or standing firm to fight for the ideals, liberty and freedom of a nation. As the unstoppable Nazi forces roll across Western Europe and the threat of invasion is imminent, and with an unprepared public, a skeptical King, and his own party plotting against him, Churchill must withstand his darkest hour, rally a nation, and attempt to change the course of world history.','2017-11-22','/xa6G3aKlysQeVg9wOb0dRcIGlWu.jpg','/zXwFJMwvQcJFitP9GcHZvHAHGe8.jpg','Darkest+Hour','tt4555426'),(419430,'Get Out','Chris and his girlfriend Rose go upstate to visit her parents for the weekend. At first, Chris reads the family\'s overly accommodating behavior as nervous attempts to deal with their daughter\'s interracial relationship, but as the weekend progresses, a series of increasingly disturbing discoveries lead him to a truth that he never could have imagined.','2017-02-24','/1SwAVYpuLj8KsHxllTF8Dt9dSSX.jpg','/gHBdkHJQglK0pjX7L8NE8bp8TLj.jpg','Get+Out','tt5052448'),(427641,'Rampage','Primatologist Davis Okoye shares an unshakable bond with George, the extraordinarily intelligent, silverback gorilla who has been in his care since birth.  But a rogue genetic experiment gone awry mutates this gentle ape into a raging creature of enormous size.  To make matters worse, itâ€™s soon discovered there are other similarly altered animals.  As these newly created alpha predators tear across North America, destroying everything in their path, Okoye teams with a discredited genetic engineer to secure an antidote, fighting his way through an ever-changing battlefield, not only to halt a global catastrophe but to save the fearsome creature that was once his friend.','2018-04-12','/30oXQKwibh0uANGMs0Sytw3uN22.jpg','/wrqUiMXttHE4UBFMhLHlN601MZh.jpg','Rampage','tt2231461'),(446354,'The Post','A cover-up that spanned four U.S. Presidents pushed the country\'s first female newspaper publisher and a hard-driving editor to join an unprecedented battle between journalist and government. Inspired by true events.','2017-12-22','/qyRwj5VvuTRdJ76o2grP93grNxt.jpg','/2LR3XKthtguN7vOz99Q91IeEl1i.jpg','The+Post','tt6294822'),(447332,'A Quiet Place','A family is forced to live in silence while hiding from creatures that hunt by sound.','2018-04-05','/nAU74GmpUk7t5iklEp3bufwDq4n.jpg','/roYyPiQDQKmIKUEhO912693tSja.jpg','A+Quiet+Place','tt6644200'),(471546,'Tour de France','','1953-08-01','/zYJJN6qnKEwzpPEIvRmBzIA1BJJ.jpg','/vjTwKnXzxc4DkUCbGqgMpWBwzdN.jpg','Tour+de+France','tt4896988'),(483877,'15+ IQ Krachoot','A teenage comedy film about a young Yorkie. \"Rising\" opened the first movie on screen.  The story of fun gangs of teenage age 15+ hormones gurgling at the curiosity to try on their love and sex has spread out.','2017-08-03','/1RxnEJzXYv5GgPszbHNsWTXPC6M.jpg','/fp3Iiap1hblJfqHrBDziqgl9zzB.jpg','15++IQ+Krachoot','');
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
INSERT INTO `movieshasgenre` VALUES (920,12),(24428,12),(118340,12),(181808,12),(258489,12),(269149,12),(284053,12),(284054,12),(291805,12),(299536,12),(333339,12),(335777,12),(338970,12),(343668,12),(354912,12),(427641,12),(49017,14),(181808,14),(284053,14),(284054,14),(299536,14),(321612,14),(399055,14),(862,16),(920,16),(269149,16),(335777,16),(354912,16),(155,18),(9469,18),(49017,18),(119450,18),(216015,18),(253295,18),(324786,18),(337167,18),(347882,18),(359940,18),(374720,18),(399055,18),(399404,18),(446354,18),(447332,18),(176,27),(679,27),(6114,27),(8077,27),(22970,27),(49017,27),(126889,27),(270303,27),(381288,27),(393345,27),(396422,27),(419430,27),(447332,27),(155,28),(679,28),(8077,28),(24428,28),(41154,28),(49017,28),(118340,28),(119450,28),(181808,28),(198663,28),(245891,28),(258489,28),(274855,28),(284053,28),(284054,28),(291805,28),(299536,28),(333339,28),(338970,28),(339403,28),(343668,28),(347882,28),(374720,28),(390043,28),(427641,28),(862,35),(920,35),(22970,35),(41154,35),(149817,35),(214756,35),(269149,35),(291805,35),(335777,35),(343668,35),(353616,35),(354912,35),(390043,35),(483877,35),(324786,36),(374720,36),(399404,36),(446354,36),(155,53),(679,53),(22970,53),(119450,53),(126889,53),(198663,53),(216015,53),(245891,53),(270303,53),(274855,53),(291805,53),(347882,53),(374720,53),(381288,53),(393345,53),(396422,53),(419430,53),(447332,53),(155,80),(176,80),(291805,80),(339403,80),(359940,80),(227148,99),(244154,99),(253295,99),(679,878),(8077,878),(24428,878),(41154,878),(118340,878),(119450,878),(126889,878),(181808,878),(198663,878),(274855,878),(284054,878),(299536,878),(333339,878),(347882,878),(427641,878),(447332,878),(176,9648),(198663,9648),(291805,9648),(396422,9648),(419430,9648),(353616,10402),(6114,10749),(216015,10749),(321612,10749),(337167,10749),(399055,10749),(862,10751),(920,10751),(269149,10751),(321612,10751),(335777,10751),(354912,10751),(49017,10752),(324786,10752),(374720,10752);
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
INSERT INTO `users` VALUES (10349,'Michael','Jordan','mj23@gmail.com','mjordan','dojO0Q0b01yMA',10349),(14894,'Jimmy','She','js@njit.edu','jimmy','dojO0Q0b01yMA',14894),(28733,'Joe','Smith','jsmith@yahoo.com','jsmith','dojO0Q0b01yMA',28733),(34549,'Ben','Smith','bensmith@gmail.com','bsmith','dojO0Q0b01yMA',34549),(49608,'Muz','Khan','mk@njit.edu','mkhan','dojO0Q0b01yMA',49608),(58707,'Lance ','Armstrong','la@gmail.com','lance.a','dojO0Q0b01yMA',58707),(61629,'Vishal','Panchal','vp@njit.edu','vishal','dojO0Q0b01yMA',61629),(88020,'Afroze','Khan','akhan@gmail.com','akhan','dojO0Q0b01yMA',88020),(89711,'Matt','Muscarella','mm@njit.edu','mattm','dojO0Q0b01yMA',89711);
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
INSERT INTO `usersfavormovies` VALUES (34549,176),(89711,862),(34549,6114),(34549,8077),(34549,22970),(28733,24428),(88020,24428),(10349,118340),(28733,118340),(28733,119450),(88020,119450),(34549,126889),(58707,149817),(10349,181808),(10349,198663),(14894,198663),(49608,198663),(61629,198663),(58707,211483),(61629,214756),(89711,216015),(58707,227148),(58707,244154),(28733,245891),(88020,245891),(10349,269149),(14894,269149),(61629,269149),(88020,269149),(89711,269149),(28733,274855),(88020,274855),(28733,284053),(88020,284053),(14894,291805),(49608,291805),(61629,291805),(89711,291805),(10349,299536),(58707,318549),(10349,321612),(10349,333339),(28733,333339),(14894,335777),(49608,335777),(61629,335777),(10349,337167),(89711,339403),(28733,353616),(28733,399055),(88020,399055),(34549,419430),(28733,427641),(10349,447332),(28733,447332),(58707,471546),(28733,483877);
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
INSERT INTO `usersfriendusers` VALUES (10349,14894),(10349,28733),(10349,34549),(10349,49608),(10349,58707),(10349,61629),(10349,88020),(10349,89711),(14894,10349),(14894,28733),(14894,49608),(14894,61629),(28733,14894),(28733,49608),(28733,61629),(28733,88020),(28733,89711),(34549,58707),(49608,10349),(49608,14894),(49608,28733),(49608,34549),(49608,58707),(49608,61629),(58707,10349),(58707,14894),(58707,28733),(58707,34549),(58707,49608),(61629,49608),(61629,89711),(88020,14894),(89711,14894),(89711,49608),(89711,61629);
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
INSERT INTO `usersviewmovies` VALUES (34549,679),(89711,920),(10349,9469),(10349,24428),(34549,49017),(88020,118340),(61629,181808),(88020,181808),(88020,198663),(89711,198663),(10349,245891),(61629,258489),(14894,269149),(89711,269149),(34549,270303),(10349,274855),(14894,284054),(28733,284054),(49608,284054),(61629,284054),(89711,284054),(88020,321612),(49608,324786),(88020,333339),(89711,335777),(61629,338970),(14894,343668),(89711,343668),(89711,354912),(89711,374720),(34549,381288),(10349,399055),(89711,399055),(49608,399404),(61629,399404),(89711,399404),(14894,446354),(49608,446354),(61629,446354),(89711,446354),(88020,447332);
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

-- Dump completed on 2018-04-29 20:02:47
