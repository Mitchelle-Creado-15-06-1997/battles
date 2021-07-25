-- MySQL dump 10.13  Distrib 8.0.22, for osx10.14 (x86_64)
--
-- Host: localhost    Database: battles
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_users`
--

DROP TABLE IF EXISTS `auth_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_users` (
  `user_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_users`
--

LOCK TABLES `auth_users` WRITE;
/*!40000 ALTER TABLE `auth_users` DISABLE KEYS */;
INSERT INTO `auth_users` VALUES ('creado','creadomitchelle@gamil.com');
/*!40000 ALTER TABLE `auth_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `battles`
--

DROP TABLE IF EXISTS `battles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `battles` (
  `name` varchar(100) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL,
  `battle_number` int(11) DEFAULT NULL,
  `attacker_king` varchar(100) DEFAULT NULL,
  `defender_king` varchar(100) DEFAULT NULL,
  `attacker_1` varchar(100) DEFAULT NULL,
  `attacker_2` varchar(100) DEFAULT NULL,
  `attacker_3` varchar(100) DEFAULT NULL,
  `attacker_4` varchar(100) DEFAULT NULL,
  `defender_1` varchar(100) DEFAULT NULL,
  `defender_2` varchar(100) DEFAULT NULL,
  `defender_3` varchar(100) DEFAULT NULL,
  `defender_4` varchar(100) DEFAULT NULL,
  `attacker_outcome` varchar(100) DEFAULT NULL,
  `battle_type` varchar(100) DEFAULT NULL,
  `major_death` int(11) DEFAULT NULL,
  `major_capture` int(11) DEFAULT NULL,
  `attacker_size` int(11) DEFAULT NULL,
  `defender_size` int(11) DEFAULT NULL,
  `attacker_commander` varchar(100) DEFAULT NULL,
  `defender_commander` varchar(100) DEFAULT NULL,
  `summer` tinyint(1) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `note` longtext,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `battle_number_UNIQUE` (`battle_number`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `battles`
--

LOCK TABLES `battles` WRITE;
/*!40000 ALTER TABLE `battles` DISABLE KEYS */;
INSERT INTO `battles` VALUES ('Battle of the Golden Tooth','298',1,'Joffrey/Tommen Baratheon','Robb Stark','Lannister','','','','Tully','','','','win','pitched battle',1,0,15000,4000,'Jaime Lannister','Clement Piper, Vance',1,'Golden Tooth','The Westerlands','',1),('Battle of Riverrun','298',3,'Joffrey/Tommen Baratheon','Robb Stark','Lannister','','','','Tully','','','','win','pitched battle',0,1,15000,10000,'Jaime Lannister, Andros Brax','Edmure Tully, Tytos Blackwood',1,'Riverrun','The Riverlands','',2),('Battle of the Green Fork','298',4,'Robb Stark','Joffrey/Tommen Baratheon','Stark','','','','Lannister','','','','loss','pitched battle',1,1,18000,20000,'Roose Bolton, Wylis Manderly, Medger Cerwyn, Harrion Karstark, Halys Hornwood','Tywin Lannister, Gregor Clegane, Kevan Lannister, Addam Marbrand',1,'Green Fork','The Riverlands','',3),('Battle of the Whispering Wood','298',5,'Robb Stark','Joffrey/Tommen Baratheon','Stark','Tully','','','Lannister','','','','win','ambush',1,1,1875,6000,'Robb Stark, Brynden Tully','Jaime Lannister',1,'Whispering Wood','The Riverlands','',4),('Battle of the Camps','298',6,'Robb Stark','Joffrey/Tommen Baratheon','Stark','Tully','','','Lannister','','','','win','ambush',0,0,6000,12625,'Robb Stark, Tytos Blackwood, Brynden Tully','Lord Andros Brax, Forley Prester',1,'Riverrun','The Riverlands','',5),('Battle of Torrhen\'s Square','299',11,'Robb Stark','Balon/Euron Greyjoy','Stark','','','','Greyjoy','','','','win','pitched battle',0,0,244,900,'Rodrik Cassel, Cley Cerwyn','Dagmer Cleftjaw',1,'Torrhen\'s Square','The North','Greyjoy\'s troop number comes from the 264 estimate to have arrived on the stony shore minus the 20 Theon takes to attack Winterfell. Thus 264-20=244',6),('Sack of Winterfell','299',14,'Joffrey/Tommen Baratheon','Robb Stark','Bolton','Greyjoy','','','Stark','','','','win','ambush',1,0,618,2000,'Ramsay Snow, Theon Greyjoy ','Rodrik Cassel, Cley Cerwyn, Leobald Tallhart',1,'Winterfell','The North','Since House Bolton betrays the Starks for House Lannister, we code this battle as between these two houses. Greyjoy men, numbering only 20, don\'t play a major part in the fighting and end up dying anyway.',7),('Battle of Oxcross','299',15,'Robb Stark','Joffrey/Tommen Baratheon','Stark','Tully','','','Lannister','','','','win','ambush',1,1,6000,10000,'Robb Stark, Brynden Tully','Stafford Lannister, Roland Crakehall, Antario Jast',1,'Oxcross','The Westerlands','',8),('Siege of Storm\'s End','299',16,'Stannis Baratheon','Renly Baratheon','Baratheon','','','','Baratheon','','','','win','siege',1,0,5000,20000,'Stannis Baratheon, Davos Seaworth','Renly Baratheon, Cortnay Penrose, Loras Tyrell, Randyll Tarly, Mathis Rowan',1,'Storm\'s End','The Stormlands','',9),('Battle of the Fords','299',17,'Joffrey/Tommen Baratheon','Robb Stark','Lannister','','','','Tully','','','','loss','pitched battle',0,0,20000,10000,'Tywin Lannister, Flement Brax, Gregor Clegane, Addam Marbrand, Lyle Crakehall, Leo Lefford','Edmure Tully, Jason Mallister, Karyl Vance',1,'Red Fork','The Riverlands','',10),('Sack of Harrenhal','299',18,'Robb Stark','Joffrey/Tommen Baratheon','Stark','','','','Lannister','','','','win','ambush',1,0,100,100,'Roose Bolton, Vargo Hoat, Robett Glover','Amory Lorch',1,'Harrenhal','The Riverlands','',11),('The Red Wedding','299',26,'Joffrey/Tommen Baratheon','Robb Stark','Frey','Bolton','','','Stark','','','','win','ambush',1,1,3500,3500,'Walder Frey, Roose Bolton, Walder Rivers','Robb Stark',1,'The Twins','The Riverlands','This observation refers to the battle against the Stark men, not the attack on the wedding',12),('Battle of Castle Black','300',28,'Stannis Baratheon','Mance Rayder','Free folk','Thenns','Giants','','Night\'s Watch','Baratheon','','','loss','siege',1,1,100000,1240,'Mance Rayder, Tormund Giantsbane, Harma Dogshead, Magnar Styr, Varamyr','Stannis Baratheon, Jon Snow, Donal Noye, Cotter Pyke',0,'Castle Black','Beyond the Wall','',13),('Retaking of Deepwood Motte','300',31,'Stannis Baratheon','Balon/Euron Greyjoy','Baratheon','Karstark','Mormont','Glover','Greyjoy','','','','win','pitched battle',0,0,4500,200,'Stannis Baratheon, Alysane Mormot','Asha Greyjoy',0,'Deepwood Motte','The North','',14),('Battle between 2 leaders','2020w',402,'Daniel','Chris','','','','','','','','','','',0,0,0,0,'','',0,'','','',19),('Battle between 2 politians','2021',40,'Rohan','Ankit','','','','','','','','','','',0,0,0,0,'','',0,'','','',20);
/*!40000 ALTER TABLE `battles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-26  1:36:55
