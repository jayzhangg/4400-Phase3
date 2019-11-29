CREATE DATABASE  IF NOT EXISTS `Team54` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Team54`;
-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: localhost    Database: Team54
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_name` varchar(45) NOT NULL,
  PRIMARY KEY (`admin_name`),
  CONSTRAINT `admin_name` FOREIGN KEY (`admin_name`) REFERENCES `user` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('cool_class4400');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `companyName` varchar(45) NOT NULL,
  PRIMARY KEY (`companyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('4400 Theater Company'),('AI Theater Company'),('Awesome Theater Company'),('EZ Theater Company');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcard` (
  `creditcard_num` char(16) NOT NULL,
  `creditcard_owner` varchar(45) NOT NULL,
  PRIMARY KEY (`creditcard_num`),
  KEY `creditcard_owner_idx` (`creditcard_owner`),
  CONSTRAINT `creditcard_owner` FOREIGN KEY (`creditcard_owner`) REFERENCES `customer` (`customer_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
INSERT INTO `creditcard` VALUES ('1111111111000000','calcultron'),('1111111100000000','calcultron2'),('1111111110000000','calcultron2'),('1111111111100000','calcwizard'),('2222222222000000','cool_class4400'),('2220000000000000','DNAhelix'),('2222222200000000','does2Much'),('2222222222222200','eeqmcsquare'),('2222222222200000','entropyRox'),('2222222222220000','entropyRox'),('1100000000000000','fullMetal'),('1111111111110000','georgep'),('1111111111111000','georgep'),('1111111111111100','georgep'),('1111111111111110','georgep'),('1111111111111111','georgep'),('2222222222222220','ilikemoney$$'),('2222222222222222','ilikemoney$$'),('9000000000000000','ilikemoney$$'),('1111110000000000','imready'),('1110000000000000','isthisthekrustykrab'),('1111000000000000','isthisthekrustykrab'),('1111100000000000','isthisthekrustykrab'),('1000000000000000','notFullMetal'),('2222222000000000','programerAAL'),('3333333333333300','RitzLover28'),('2222222220000000','thePiGuy3.14'),('2222222222222000','theScienceGuy');
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcardUsage`
--

DROP TABLE IF EXISTS `creditcardUsage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcardUsage` (
  `used_creditcard_num` char(16) NOT NULL,
  `used_owning_company_name` varchar(45) NOT NULL,
  `used_theater_name` varchar(45) NOT NULL,
  `used_movie_name` varchar(45) NOT NULL,
  `used_release_date` date NOT NULL,
  `used_play_date` date NOT NULL,
  PRIMARY KEY (`used_creditcard_num`,`used_owning_company_name`,`used_theater_name`,`used_movie_name`,`used_release_date`,`used_play_date`),
  KEY `used_owning_company_name_idx` (`used_owning_company_name`),
  KEY `used_theater_name_idx` (`used_theater_name`),
  KEY `used_movie_name_idx` (`used_movie_name`),
  KEY `used_release_date_idx` (`used_release_date`),
  KEY `used_play_date_idx` (`used_play_date`),
  CONSTRAINT `used_creditcard_num` FOREIGN KEY (`used_creditcard_num`) REFERENCES `creditcard` (`creditcard_num`),
  CONSTRAINT `used_movie_name` FOREIGN KEY (`used_movie_name`) REFERENCES `movieplay` (`play_movie_name`),
  CONSTRAINT `used_owning_company_name` FOREIGN KEY (`used_owning_company_name`) REFERENCES `movieplay` (`play_owning_company_name`),
  CONSTRAINT `used_play_date` FOREIGN KEY (`used_play_date`) REFERENCES `movieplay` (`play_date`),
  CONSTRAINT `used_release_date` FOREIGN KEY (`used_release_date`) REFERENCES `movieplay` (`play_release_date`),
  CONSTRAINT `used_theater_name` FOREIGN KEY (`used_theater_name`) REFERENCES `movieplay` (`play_theater_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcardUsage`
--

LOCK TABLES `creditcardUsage` WRITE;
/*!40000 ALTER TABLE `creditcardUsage` DISABLE KEYS */;
INSERT INTO `creditcardUsage` VALUES ('1111111111111100','EZ Theater Company','Star Movies','How to Train Your Dragon','2010-03-21','2010-03-25'),('1111111111111111','4400 Theater Company','Cinema Star','How to Train Your Dragon','2010-03-21','2010-04-02'),('1111111111111111','EZ Theater Company','Main Movies','How to Train Your Dragon','2010-03-21','2010-03-22'),('1111111111111111','EZ Theater Company','Main Movies','How to Train Your Dragon','2010-03-21','2010-03-23');
/*!40000 ALTER TABLE `creditcardUsage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_name` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_name`),
  CONSTRAINT `customer_name` FOREIGN KEY (`customer_name`) REFERENCES `user` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('calcultron'),('calcultron2'),('calcwizard'),('clarinetbeast'),('cool_class4400'),('DNAhelix'),('does2Much'),('eeqmcsquare'),('entropyRox'),('fullMetal'),('georgep'),('ilikemoney$$'),('imready'),('isthisthekrustykrab'),('notFullMetal'),('programerAAL'),('RitzLover28'),('thePiGuy3.14'),('theScienceGuy');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `manager_name` varchar(45) NOT NULL,
  `manager_street` varchar(45) DEFAULT NULL,
  `manager_city` varchar(45) DEFAULT NULL,
  `manager_zipcode` char(5) DEFAULT NULL,
  `manager_state` enum('AK','AL','AR','AS','AZ','CA','CO','CT','DC','DE','FL','GA','GU','HI','IA','ID','IL','IN','KS','KY','LA','MA','MD','ME','MI','MN','MO','MP','MS','MT','NC','ND','NE','NH','NJ','NM','NV','NY','OH','OK','OR','PA','PR','RI','SC','SD','TN','TX','UM','UT','VA','VI','VT','WA','WI','WV','WY') DEFAULT 'WA',
  `manager_works_in` varchar(45) NOT NULL,
  PRIMARY KEY (`manager_name`),
  UNIQUE KEY `manager_address_UNIQUE` (`manager_street`,`manager_city`,`manager_zipcode`,`manager_state`),
  KEY `manager_works_in` (`manager_works_in`),
  CONSTRAINT `manager_name` FOREIGN KEY (`manager_name`) REFERENCES `user` (`user_name`),
  CONSTRAINT `manager_works_in` FOREIGN KEY (`manager_works_in`) REFERENCES `company` (`companyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('calcultron','123 Peachtree St','Atlanta','30308','GA','EZ Theater Company'),('entropyRox','200 Cool Place','San Francisco ','94016','CA','4400 Theater Company'),('fatherAI','456 Main St','New York','10001','NY','EZ Theater Company'),('georgep','10 Pearl Dr','Seattle','98105','WA','4400 Theater Company'),('ghcghc','100 Pi St','Pallet Town','31415','KS','AI Theater Company'),('imbatman','800 Color Dr','Austin','78653','TX','Awesome Theater Company'),('manager1','123 Ferst Drive','Atlanta','30332','GA','4400 Theater Company'),('manager2','456 Ferst Drive','Atlanta','30332','GA','AI Theater Company'),('manager3','789 Ferst Drive','Atlanta','30332','GA','4400 Theater Company'),('manager4','000 Ferst Drive','Atlanta','30332','GA','4400 Theater Company'),('radioactivePoRa','100 Blu St','Sunnyvale','94088','CA','4400 Theater Company');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movie_name` varchar(45) NOT NULL,
  `movie_release_date` date NOT NULL,
  `movie_duration` int(11) DEFAULT NULL,
  PRIMARY KEY (`movie_name`,`movie_release_date`),
  UNIQUE KEY `movie_name_release_date_UNIQUE` (`movie_name`,`movie_release_date`),
  KEY `movie_release_date_idx` (`movie_release_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES ('4400 The Movie','2019-08-12',130),('Avengers: Endgame','2019-04-26',181),('Calculus Returns: A ML Story','2019-09-19',314),('George P Burdell\'s Life Story','1927-08-12',100),('Georgia Tech The Movie','1985-08-13',100),('How to Train Your Dragon','2010-03-21',98),('Spaceballs','1987-06-24',96),('Spider-Man: Into the Spider-Verse','2018-12-01',117),('The First Pokemon Movie','1998-07-19',75),('The King\'s Speech','2010-11-26',119);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movieplay`
--

DROP TABLE IF EXISTS `movieplay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movieplay` (
  `play_theater_name` varchar(45) NOT NULL,
  `play_movie_name` varchar(45) NOT NULL,
  `play_release_date` date NOT NULL,
  `play_date` date NOT NULL,
  `play_owning_company_name` varchar(45) NOT NULL,
  PRIMARY KEY (`play_theater_name`,`play_movie_name`,`play_release_date`,`play_date`,`play_owning_company_name`),
  UNIQUE KEY `play_tn_mn_rd_pd_ocn_UNIQUE` (`play_theater_name`,`play_movie_name`,`play_release_date`,`play_date`,`play_owning_company_name`),
  KEY `play_date_idx` (`play_date`),
  KEY `play_movie_name_idx` (`play_movie_name`),
  KEY `play_release_date_idx` (`play_release_date`),
  KEY `play_theater_name_idx` (`play_theater_name`,`play_owning_company_name`),
  KEY `play_owning_company_name_idx` (`play_owning_company_name`),
  CONSTRAINT `play_movie_name` FOREIGN KEY (`play_movie_name`) REFERENCES `movie` (`movie_name`),
  CONSTRAINT `play_owning_company_name` FOREIGN KEY (`play_owning_company_name`) REFERENCES `theater` (`theater_owned_by`),
  CONSTRAINT `play_release_date` FOREIGN KEY (`play_release_date`) REFERENCES `movie` (`movie_release_date`),
  CONSTRAINT `play_theater_name` FOREIGN KEY (`play_theater_name`) REFERENCES `theater` (`theater_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movieplay`
--

LOCK TABLES `movieplay` WRITE;
/*!40000 ALTER TABLE `movieplay` DISABLE KEYS */;
INSERT INTO `movieplay` VALUES ('ABC Theater','Georgia Tech The Movie','1985-08-13','1985-08-13','Awesome Theater Company'),('Main Movies','Spaceballs','1987-06-24','1999-06-24','EZ Theater Company'),('Cinema Star','Spaceballs','1987-06-24','2000-02-02','4400 Theater Company'),('Main Movies','How to Train Your Dragon','2010-03-21','2010-03-22','EZ Theater Company'),('Main Movies','How to Train Your Dragon','2010-03-21','2010-03-23','EZ Theater Company'),('Star Movies','How to Train Your Dragon','2010-03-21','2010-03-25','EZ Theater Company'),('Cinema Star','How to Train Your Dragon','2010-03-21','2010-04-02','4400 Theater Company'),('ML Movies','Spaceballs','1987-06-24','2010-04-02','AI Theater Company'),('Cinema Star','George P Burdell\'s Life Story','1927-08-12','2010-05-20','4400 Theater Company'),('ABC Theater','The First Pokemon Movie','1998-07-19','2018-07-19','Awesome Theater Company'),('Main Movies','George P Burdell\'s Life Story','1927-08-12','2019-07-14','EZ Theater Company'),('Star Movies','4400 The Movie','2019-08-12','2019-08-12','EZ Theater Company'),('Cinema Star','4400 The Movie','2019-08-12','2019-09-12','4400 Theater Company'),('Cinema Star','Georgia Tech The Movie','1985-08-13','2019-09-30','4400 Theater Company'),('ML Movies','Spider-Man: Into the Spider-Verse','2018-12-01','2019-09-30','AI Theater Company'),('ML Movies','Calculus Returns: A ML Story','2019-09-19','2019-10-10','AI Theater Company'),('ABC Theater','4400 The Movie','2019-08-12','2019-10-12','Awesome Theater Company'),('Main Movies','George P Burdell\'s Life Story','1927-08-12','2019-10-22','EZ Theater Company'),('Cinema Star','The King\'s Speech','2010-11-26','2019-12-20','4400 Theater Company'),('Main Movies','The King\'s Speech','2010-11-26','2019-12-20','EZ Theater Company'),('ML Movies','Calculus Returns: A ML Story','2019-09-19','2019-12-30','AI Theater Company'),('ML Movies','Spaceballs','1987-06-24','2023-01-23','AI Theater Company');
/*!40000 ALTER TABLE `movieplay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `theater_owned_by` varchar(45) NOT NULL,
  `theater_name` varchar(45) NOT NULL,
  `theater_street` varchar(45) DEFAULT NULL,
  `theater_city` varchar(45) DEFAULT NULL,
  `theater_state` enum('AK','AL','AR','AS','AZ','CA','CO','CT','DC','DE','FL','GA','GU','HI','IA','ID','IL','IN','KS','KY','LA','MA','MD','ME','MI','MN','MO','MP','MS','MT','NC','ND','NE','NH','NJ','NM','NV','NY','OH','OK','OR','PA','PR','RI','SC','SD','TN','TX','UM','UT','VA','VI','VT','WA','WI','WV','WY') DEFAULT 'WA',
  `theater_zipcode` char(5) DEFAULT NULL,
  `theater_capacity` int(11) DEFAULT NULL,
  `theater_managed_by` varchar(45) NOT NULL,
  PRIMARY KEY (`theater_owned_by`,`theater_name`),
  UNIQUE KEY `theater_name_owned_by_UNIQUE` (`theater_name`,`theater_owned_by`),
  KEY `theater_name_idx` (`theater_name`),
  KEY `theater_managed_by_idx` (`theater_managed_by`),
  CONSTRAINT `theater_managed_by` FOREIGN KEY (`theater_managed_by`) REFERENCES `manager` (`manager_name`),
  CONSTRAINT `theater_owned_by` FOREIGN KEY (`theater_owned_by`) REFERENCES `company` (`companyName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES ('4400 Theater Company','Cinema Star','100 Cool Place','San Francisco ','CA','94016',4,'entropyRox'),('4400 Theater Company','Jonathan\'s Movies','67 Pearl Dr','Seattle','WA','98101',2,'georgep'),('4400 Theater Company','Star Movies','4400 Rocks Ave','Boulder','CA','80301',5,'radioactivePoRa'),('AI Theater Company','ML Movies','314 Pi St','Pallet Town','KS','31415',3,'ghcghc'),('Awesome Theater Company','ABC Theater','880 Color Dr','Austin','TX','73301',5,'imbatman'),('EZ Theater Company','Main Movies','123 Main St','New York','NY','10001',3,'fatherAI'),('EZ Theater Company','Star Movies','745 GT St','Atlanta','GA','30332',2,'calcultron');
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_name` varchar(45) NOT NULL,
  `user_status` enum('ALL','Pending','Declined','Approved') DEFAULT NULL,
  `user_password` varchar(45) DEFAULT NULL,
  `user_firstname` varchar(45) DEFAULT NULL,
  `user_lastname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('calcultron','Approved','333333333','Dwight','Schrute'),('calcultron2','Approved','444444444','Jim','Halpert'),('calcwizard','Approved','222222222','Issac','Newton'),('clarinetbeast','Declined','999999999','Squidward','Tentacles'),('cool_class4400','Approved','333333333','A. TA','Washere'),('DNAhelix','Approved','777777777','Rosalind','Franklin'),('does2Much','Approved','1212121212','Carl','Gauss'),('eeqmcsquare','Approved','111111110','Albert','Einstein'),('entropyRox','Approved','999999999','Claude','Shannon'),('fatherAI','Approved','222222222','Alan','Turing'),('fullMetal','Approved','111111100','Edward','Elric'),('gdanger','Declined','555555555','Gary','Danger'),('georgep','Approved','111111111','George P.','Burdell'),('ghcghc','Approved','666666666','Grace','Hopper'),('ilikemoney$$','Approved','111111110','Eugene','Krabs'),('imbatman','Approved','666666666','Bruce','Wayne'),('imready','Approved','777777777','Spongebob','Squarepants'),('isthisthekrustykrab','Approved','888888888','Patrick','Star'),('manager1','Approved','1122112211','Manager','One'),('manager2','Approved','3131313131','Manager','Two'),('manager3','Approved','8787878787','Three','Three'),('manager4','Approved','5755555555','Four','Four'),('notFullMetal','Approved','111111100','Alphonse','Elric'),('programerAAL','Approved','3131313131','Ada','Lovelace'),('radioactivePoRa','Approved','1313131313','Marie','Curie'),('RitzLover28','Approved','444444444','Abby','Normal'),('smith_j','Pending','333333333','John','Smith'),('texasStarKarate','Declined','111111110','Sandy','Cheeks'),('thePiGuy3.14','Approved','1111111111','Archimedes','Syracuse'),('theScienceGuy','Approved','999999999','Bill','Nye');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT,
  `visit_date` date DEFAULT NULL,
  `visit_company` varchar(45) NOT NULL,
  `visit_theater` varchar(45) NOT NULL,
  `visit_username` varchar(45) NOT NULL,
  PRIMARY KEY (`visit_id`),
  KEY `visit_username_idx` (`visit_username`),
  KEY `visit_theater_idx` (`visit_theater`),
  KEY `visit_company_idx` (`visit_company`),
  CONSTRAINT `visit_company` FOREIGN KEY (`visit_company`) REFERENCES `theater` (`theater_owned_by`),
  CONSTRAINT `visit_theater` FOREIGN KEY (`visit_theater`) REFERENCES `theater` (`theater_name`),
  CONSTRAINT `visit_username` FOREIGN KEY (`visit_username`) REFERENCES `user` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
INSERT INTO `visit` VALUES (1,'2010-03-22','EZ Theater Company','Main Movies','georgep'),(2,'2010-03-22','EZ Theater Company','Main Movies','calcwizard'),(3,'2010-03-25','EZ Theater Company','Star Movies','calcwizard'),(4,'2010-03-25','EZ Theater Company','Star Movies','imready'),(5,'2010-03-20','AI Theater Company','ML Movies','calcwizard');
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Team54'
--
/*!50003 DROP PROCEDURE IF EXISTS `admin_approve_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_approve_user`(IN i_username VARCHAR(50))
BEGIN
	IF (i_username IN (SELECT user_name FROM user))
	THEN 
	UPDATE user
	SET user_status = "Approved"
    	WHERE user_name = i_username;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_create_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_create_mov`(IN i_movName VARCHAR(50), IN i_movDuration INT,
IN i_movReleaseDate DATE)
BEGIN  
    	INSERT INTO movie (movie_name, movie_release_date, movie_duration)
VALUES (i_movName, i_movReleaseDate, i_movDuration);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_create_theater` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_create_theater`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50), IN i_thStreet VARCHAR(50), IN i_thCity VARCHAR(50), IN i_thState CHAR(2), IN i_thZipcode CHAR(5), IN i_capacity INT, IN i_managerUsername VARCHAR(50))
BEGIN
    	INSERT INTO theater(theater_name, theater_owned_by, theater_street, theater_city,
theater_state, theater_zipcode, theater_capacity, theater_managed_by  )
VALUES (i_thName, i_comName, i_thStreet, i_thCity, i_thState, i_thZipCode, i_capacity,
i_managerUsername);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_decline_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_decline_user`(IN i_username VARCHAR(50))
BEGIN
	IF (i_username IN (SELECT user_name FROM user))
	THEN 
	UPDATE user	
	SET user_status = "Declined"
WHERE user_name = i_username;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_filter_company` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_filter_company`(IN i_comName VARCHAR(50), IN i_minCity INT,
IN i_maxCity INT, IN i_minTheater INT, IN i_maxTheater INT, IN i_minEmployee INT, IN i_maxEmployee INT, IN i_sortBy ENUM("comName", "numCityCover", "numTheater", "numEmployee",""), IN i_sortDirection ENUM("ASC", "DESC",""))
BEGIN
    	DROP TABLE IF EXISTS AdFilterCom;
    	CREATE TABLE AdFilterCom
			SELECT companyName as comName, numCityCovered as numCityCover, numTheaters as numTheater, numEmployees as numEmployee FROM
				(SELECT *,
				(SELECT count(DISTINCT theater_city, theater_state) FROM theater WHERE theater_owned_by = companyName) as numCityCovered,
				(SELECT count(theater_name) FROM theater WHERE theater_owned_by = companyName) as numTheaters,
				(SELECT count(manager_name) FROM manager WHERE manager_works_in = companyName) as numEmployees
				FROM company) as uf
				WHERE (((uf.numCityCovered BETWEEN i_minCity AND i_maxCity) or (i_minCity is null or i_minCity='' or i_maxCity is null or i_maxCity='' )) AND ((uf.numTheaters BETWEEN i_minTheater AND i_maxTheater) or (i_minTheater is null or i_minTheater='' or i_maxTheater is null or i_maxTheater='' ) ) AND ((uf.numEmployees BETWEEN i_minEmployee AND i_maxEmployee ) or (i_minEmployee is null or i_minEmployee='' or i_maxEmployee is null or i_maxEmployee='' )) and (i_comName = companyName or i_comName is null or  i_comName='')) or (i_comName= 'ALL') ;
END ;;

DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_filter_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_filter_user`(IN i_username VARCHAR(50), IN i_status
VARCHAR(50), IN i_sortBy ENUM("username", "creditCardCount", "userType", "status", ""), IN i_sortDirection ENUM("DESC", "ASC",""))
BEGIN
DROP TABLE IF EXISTS AdFilterUser;
CREATE TABLE AdFilterUser
SELECT user_name as username, (SELECT count(creditcard_num) FROM creditcard WHERE creditcard_owner=user_name) as creditCardCount, user_status as status
FROM user
where (user_name=i_username or i_username= 'ALL' or i_username='') and (user_status = i_status or i_status= 'ALL' or i_status='');

ALTER TABLE AdFilterUser
ADD userType ENUM('User','Customer', 'Admin', 'Manager', 'CustomerManager',
'CustomerAdmin') NOT NULL DEFAULT 'User';

SET SQL_SAFE_UPDATES = 0;
UPDATE AdFilterUser
SET userType = 
	CASE WHEN username in (SELECT admin_name FROM admin) AND username in (SELECT customer_name FROM customer) THEN 'CustomerAdmin' 
	WHEN username in (SELECT manager_name FROM manager) AND username in (SELECT customer_name FROM customer) THEN 'CustomerManager'
	WHEN username in (SELECT customer_name FROM customer) THEN 'Customer'
    WHEN username in (SELECT manager_name FROM manager) THEN 'Manager'
    WHEN username in (SELECT admin_name FROM admin) THEN 'Admin'
	ELSE 'User' 
END;


SELECT username, userType, status,creditCardCount
FROM AdFilterUser
WHERE (username = i_username)
AND (status = i_status)
ORDER BY
    	CASE
    	WHEN i_sortBy = "username" AND i_sortDirection = "ASC"
    	THEN username END ASC,
    	CASE
    	WHEN i_sortBy = "username" AND i_sortDirection = "DESC"
    	THEN username END DESC,
     	CASE
    	WHEN i_sortBy = "username" AND i_sortDirection IS NULL
    	THEN username END DESC,
    	CASE
    	WHEN i_sortBy = "creditCardCount" AND i_sortDirection = "ASC"
THEN creditCardCount END ASC,
CASE
    	WHEN i_sortBy = "creditCardCount" AND i_sortDirection = "DESC"
    	THEN creditCardCount END DESC,
CASE
     	WHEN i_sortBy = "creditCardCount" AND i_sortDirection IS NULL
    	THEN creditCardCount END DESC,
     	CASE
    	WHEN i_sortBy = "userType" AND i_sortDirection = "ASC"
    	THEN userType END ASC,
CASE
    	WHEN i_sortBy = "userType" AND i_sortDirection = "DESC"
THEN userType END DESC,
CASE
    	WHEN i_sortBy = "userType" AND i_sortDirection IS NULL
     	THEN userType END DESC,
    	CASE
    	WHEN i_sortBy = "status" AND i_sortDirection = "ASC"
    	THEN status END ASC,
     	CASE
    	WHEN i_sortBy = "status" AND i_sortDirection = "DESC"
    	THEN status END DESC,
     	CASE
     	WHEN i_sortBy = "status" AND i_sortDirection IS NULL
    	THEN status END DESC,
     	CASE
     	WHEN i_sortBy IS NULL AND i_sortDirection IS NULL
    	THEN username END DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_view_comDetail_emp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_view_comDetail_emp`(IN i_comName VARCHAR(50))
BEGIN

DROP TABLE IF EXISTS emp_first_last_name;
CREATE TABLE emp_first_last_name
SELECT manager_name, user_firstname, user_lastname, manager_works_in, user_name
FROM `user`
NATURAL JOIN manager 
WHERE user_name = manager_name;

DROP TABLE IF EXISTS AdComDetailEmp;
CREATE TABLE AdComDetailEmp
SELECT DISTINCT user_firstname as empFirstname,
user_lastname as empLastname
FROM emp_first_last_name 
NATURAL JOIN company
WHERE manager_works_in = companyName
AND manager_works_in = i_comName
AND companyName = i_comName;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `admin_view_comDetail_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `admin_view_comDetail_th`(IN i_comName VARCHAR(50))
BEGIN
DROP TABLE IF EXISTS theater_manager;
CREATE TABLE theater_manager
SELECT manager_name, manager_works_in, theater_name, theater_managed_by, theater_city, theater_state,theater_capacity
FROM theater
NATURAL JOIN manager 
WHERE manager_name = theater_managed_by;


DROP TABLE IF EXISTS AdComDetailTh;
CREATE TABLE AdComDetailTh
SELECT DISTINCT theater_name as thName, theater_managed_by as thManagerUsername, theater_city as thCity, theater_state as thState, theater_capacity as thCapacity
from theater_manager
where manager_works_in=i_comName;

 /*
   	DROP VIEW IF EXISTS AdComDetailTh;
    	CREATE VIEW AdComDetailTh
    	AS SELECT manager_name as thManagerUsername, theater_name as thName, theater_city as thCity, theater_state as thState, theater_capacity as thCapacity,
theater_managed_by, theater_owned_by
FROM manager
INNER JOIN theater ON manager_name = theater_managed_by;

    	SELECT thName, thManagerUsername, thCity,  thState, thCapacity
    	FROM AdComDetailTh
    	WHERE theater_owned_by = i_comName;
*/
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_add_creditcard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_add_creditcard`(IN i_username VARCHAR(50), IN i_creditCardNum CHAR(16))
BEGIN
    	INSERT INTO CreditCard(creditcard_owner, creditcard_num)
VALUES (i_username, i_creditCardNum);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_filter_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_filter_mov`(IN i_movName VARCHAR(50), IN i_comName
VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(50), IN i_minMovPlayDate DATE,  
IN i_maxMovPlayDate DATE)
BEGIN
DROP TABLE IF EXISTS CosFilterMovie;
    	CREATE TABLE CosFilterMovie
     	SELECT play_movie_name as movName,theater_name as thName,  
        theater_street as thStreet, theater_city as thCity, theater_state as thState,
        theater_zipcode as thZipcode, play_owning_company_name as comName,
        play_date as movPlayDate, play_release_date as movReleaseDate, theater_owned_by
    	FROM movieplay
		NATURAL JOIN theater
		WHERE play_owning_company_name = theater_name 
        AND play_theater_name = theater_owned_by
		AND (play_movie_name = i_movName OR i_movName = "ALL'")
		AND (play_owning_company_name = i_comName OR i_comName = "ALL")
		AND (theater_city = i_city OR i_city = " ")
		AND (theater_state = i_state OR i_state = " ")
		AND (i_minMovPlayDate IS NULL OR play_date >= i_minMovPlayDate) 
        AND (i_maxMovPlayDate IS NULL OR play_date <= i_maxMovPlayDate);
        
        ALTER TABLE CosFilterMovie
        DROP COLUMN theater_owned_by;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_only_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_only_register`(IN i_username VARCHAR(50), IN i_password
VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
INSERT INTO user(user_name, user_password, user_firstname, user_lastname,
user_status)
VALUES (i_username, MD5(i_password), i_firstname, i_lastname, "Pending");

INSERT INTO customer(customer_name)
VALUES (i_username);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_history`(IN i_cusUsername VARCHAR(50))
BEGIN
	DROP TABLE IF EXISTS CosViewHistory;
	CREATE TABLE CosViewHistory
	SELECT used_movie_name as movName, used_theater_name as thName, 
    used_owning_company_name as comName, used_creditcard_num as creditCardNum, 
    used_play_date as movPlayDate
	FROM creditcard
    INNER JOIN creditcardUsage on used_creditcard_num = creditcard_num
    WHERE creditcard_owner =  i_cusUsername;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `customer_view_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_view_mov`(IN i_creditCardNum CHAR(16), IN i_movName
VARCHAR(50), IN i_movReleaseDate DATE, IN i_thName VARCHAR(50), i_comName VARCHAR(50), IN i_movPlayDate DATE)
BEGIN

SET @card= (SELECT creditcard_num from creditcard WHERE creditcard_num= i_creditCardNum);
SET @movi= (SELECT play_movie_name from movieplay 
WHERE (play_movie_name= i_movName) AND (play_theater_name=i_thName) AND (play_release_date= i_movReleaseDate) AND (play_date=i_movPlayDate) AND (play_owning_company_name=i_comName)   );


IF (@card IS NOT NULL and @movi is not null)
THEN
INSERT INTO creditcardUsage (used_creditcard_num,
used_movie_name, used_release_date, used_theater_name, used_owning_company_name, used_play_date)
VALUES (i_creditCardNum, i_movName, i_movReleaseDate, i_thName, i_comName,
i_movPlayDate);
END IF ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `magic44_check_step` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `magic44_check_step`(step_number CHAR(10), step_table CHAR(254), hash_format VARCHAR(2000))
BEGIN
SET @sql_text = concat("insert into magic44_scoring \n",
"(select ",step_number,", 'missing', concat(",hash_format,") \n",
"from magic44_table",step_number," \n",
"where concat(",hash_format,") not in (select concat(",hash_format,") \n",
"from ",step_table,")) \n",
"union (select ",step_number,", 'extra', concat(",hash_format,") \n",
"from ",step_table," \n",
"where concat(",hash_format,") not in \n",
"(select concat(",hash_format,") from magic44_table",step_number,"))");
select @sql_text;
PREPARE statement from @sql_text;
EXECUTE statement;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_customer_add_creditcard` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_customer_add_creditcard`(IN i_username VARCHAR(50), IN
i_creditCardNum CHAR(16))
BEGIN
    	INSERT INTO CreditCard(creditcard_owner, creditcard_num)
VALUES (i_username, i_creditCardNum);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_customer_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_customer_register`(IN i_username VARCHAR(50), IN i_password 
VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName 
VARCHAR(50), IN i_empStreet VARCHAR(50), IN i_empCity VARCHAR(50), IN i_empState CHAR(2), IN i_empZipcode CHAR(5))
BEGIN
SET @man_address  = (SELECT COUNT(*) FROM manager 
WHERE (i_empStreet = manager_street)
AND (i_empCity = manager_city)
AND (i_empState = manager_State));

IF @man_address = 0
THEN
		INSERT INTO user(user_name, user_password, user_firstname, user_lastname, 
user_status) 
		VALUES ( 
		i_username, MD5(i_password), i_firstname, i_lastname, "Pending");

		INSERT INTO manager(manager_name, manager_street, manager_city, 
manager_state, manager_zipcode, manager_works_in) 
	VALUES (i_username, i_empStreet, i_empCity, i_empState, i_empZipcode, 
i_comName);
		INSERT INTO customer(customer_name) 
		VALUES (i_username);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_filter_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_filter_th`(IN i_manUsername VARCHAR(50), IN i_movName
VARCHAR(50), IN i_minMovDuration INT, IN i_maxMovDuration INT, IN i_minMovieReleaseDate DATE, IN i_maxMovieReleaseDate DATE, IN i_minMovPlayDate DATE, IN i_maxMovPlayDate DATE,
IN i_includeNotPlay BOOLEAN)
BEGIN
	IF (i_includeNotPlay IS NULL OR (i_includeNotPlay IS FALSE))
	THEN
		DROP TABLE IF EXISTS ManFilterTh;
		CREATE TABLE ManFilterTh
		SELECT theater_name, theater_managed_by, play_owning_company_name,
		play_theater_name, play_movie_name AS movName, play_release_date AS movReleaseDate, play_date AS movPlayDate, movie_name, movie_release_date, movie_duration AS movDuration
		FROM movie natural join movieplay natural join theater
        
		WHERE (theater_managed_by = i_manUsername
		AND (i_minMovDuration IS NULL OR movie_duration >= i_minMovDuration)
		AND (i_maxMovDuration IS NULL OR movie_duration <= i_maxMovDuration)
		AND (i_minMovieReleaseDate IS NULL OR movie_release_date >= i_minMovieReleaseDate)
		AND (i_maxMovieReleaseDate IS NULL OR movie_release_date <= i_maxMovieReleaseDate)); 
        
	ELSE
		DROP TABLE IF EXISTS ManFilterTh;
		CREATE TABLE ManFilterTh
		SELECT theater_name, theater_managed_by, play_owning_company_name,
		play_theater_name, play_movie_name AS movName, play_release_date AS movReleaseDate, play_date AS movPlayDate, movie_name, movie_release_date, movie_duration AS movDuration
		FROM movie natural join movieplay natural join theater
		
        WHERE (theater_managed_by = i_manUsername
		AND  (movie_release_date = play_release_date)
		AND (i_minMovDuration IS NULL OR movie_duration >= i_minMovDuration)
		AND (i_maxMovDuration IS NULL OR movie_duration <= i_maxMovDuration)
		AND (i_minMovieReleaseDate IS NULL OR movie_release_date >= i_minMovieReleaseDate)
		AND (i_maxMovieReleaseDate IS NULL OR movie_release_date <= i_maxMovieReleaseDate));
        
	END IF;
ALTER TABLE ManFilterTh 
DROP COLUMN theater_name,
DROP COLUMN theater_managed_by, 
DROP COLUMN play_owning_company_name, 
DROP COLUMN play_theater_name, 
DROP COLUMN movie_name, 
DROP COLUMN movie_release_date ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_only_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_only_register`(IN i_username VARCHAR(50), IN i_password
VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50), IN i_comName VARCHAR(50), IN i_empStreet VARCHAR(50), IN i_empCity VARCHAR(50), IN i_empState CHAR(2), IN i_empZipcode CHAR(5))
BEGIN
    	INSERT INTO user(user_name, user_password, user_firstname, user_lastname,
user_status)
VALUES (i_username, MD5(i_password), i_firstname, i_lastname, "Pending");

    	INSERT INTO manager(manager_name, manager_street, manager_city, manager_state,
manager_zipcode, manager_works_in)
VALUES (i_username, i_empStreet, i_empCity, i_empState, i_empZipcode, i_comName);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `manager_schedule_mov` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `manager_schedule_mov`(IN i_manUsername VARCHAR(50), IN 
i_movName VARCHAR(50), IN i_movReleaseDate DATE, IN i_movPlayDate DATE )
BEGIN

SET @theaterName = 
(SELECT theater_name FROM theater 
WHERE (theater_managed_by = i_manUsername)) ;

SET @comp = 
(SELECT manager_works_in FROM manager 
WHERE (manager_name = i_manUsername));
SET @movie = 
(SELECT movie_name FROM movie 
WHERE (movie_name = i_movName) AND (movie_release_date = i_movReleaseDate));

IF (@theaterName IS NOT NULL and @comp IS NOT NULL and @movie IS NOT NULL)
THEN
INSERT INTO moviePlay (play_owning_company_name, play_movie_name, play_release_date, play_date, play_theater_name) 
VALUES (@comp, i_movName, i_movReleaseDate, i_movPlayDate, @theaterName);
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_filter_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_filter_th`(IN i_thName VARCHAR(50), IN i_comName
VARCHAR(50), IN i_city VARCHAR(50), IN i_state VARCHAR(3))
BEGIN
	DROP TABLE IF EXISTS UserFilterTh;
	CREATE TABLE UserFilterTh
	SELECT theater_name as thName, theater_street as thStreet, theater_city as thCity, theater_state as thState, theater_zipcode as thZipcode,
theater_owned_by as comName
	FROM theater
	WHERE (theater_name = i_thName OR i_thName = "ALL") AND
    	(theater_owned_by = i_comName OR i_comName = "ALL") AND
    	(theater_city = i_city OR i_city = "") AND
    	(theater_state = i_state OR i_state = "ALL");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_filter_visitHistory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_filter_visitHistory`(IN i_username VARCHAR(50), IN
i_minVisitDate DATE, IN i_maxVisitDate DATE)
BEGIN
	DROP TABLE IF EXISTS UserVisitHistory;
	CREATE TABLE UserVisitHistory
	SELECT theater_name as thName, theater_street as thStreet, theater_city as thCity, theater_state as thState, theater_zipcode as thZipcode,
theater_owned_by as comName, visit_date as visitDate
	FROM visit
	NATURAL JOIN theater
	WHERE(visit_username = i_username) AND
    	(i_minVisitDate IS NULL OR visit_date >= i_minVisitDate) AND
    	(i_maxVisitDate IS NULL OR visit_date <= i_maxVisitDate);
	END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_login`(IN i_username VARCHAR(50), IN i_password VARCHAR(50))
BEGIN
DROP TABLE IF EXISTS UserLogin;
CREATE TABLE UserLogin
SELECT user_name as username, user_status as status, user_password
FROM user WHERE ((user_name = i_username AND user_status= ("APPROVED") AND user_password = i_password ) OR
(user_name = i_username AND user_status <> ("APPROVED")));

ALTER TABLE UserLogin ADD isCustomer ENUM('1','0') NOT NULL;
ALTER TABLE UserLogin ADD isManager ENUM('1','0') NOT NULL;
ALTER TABLE UserLogin ADD isAdmin ENUM('1','0') NOT NULL;

SET SQL_SAFE_UPDATES = 0;

IF (i_username IN (SELECT customer_name FROM customer) 
AND i_username IN( SELECT admin_name FROM admin)) then
UPDATE UserLogin SET isCustomer = '1', isAdmin= '1', isManager = '0';

ELSEIF (i_username IN (SELECT customer_name FROM customer) 
AND i_username IN( SELECT manager_name FROM manager)) THEN
UPDATE UserLogin SET isCustomer = '1', isManager = '1', isAdmin = '0';

ELSEIF (i_username) IN (SELECT customer_name FROM customer) THEN
UPDATE UserLogin SET isCustomer = '1', isManager = '0', isAdmin = '0';

ELSEIF (i_username) IN (SELECT manager_name  FROM manager) THEN
UPDATE UserLogin SET isCustomer = '0', isManager = '1', isAdmin = '0';

ELSEIF (i_username) IN (SELECT admin_name  FROM admin) THEN
UPDATE UserLogin SET isCustomer = '0', isManager = '0', isAdmin = '1';

ELSE
UPDATE UserLogin SET isCustomer = '0', isManager = '0', isAdmin = '0';

END IF;

ALTER TABLE UserLogin
DROP COLUMN user_password;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_register`(IN i_username VARCHAR(50), IN i_password
VARCHAR(50), IN i_firstname VARCHAR(50), IN i_lastname VARCHAR(50))
BEGIN
INSERT INTO user (user_name, user_password, user_firstname, user_lastname,
user_status)
VALUES (i_username, MD5(i_password), i_firstname, i_lastname, "Pending");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_visit_th` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_visit_th`(IN i_thName VARCHAR(50), IN i_comName VARCHAR(50),
IN i_visitDate DATE, IN i_username VARCHAR(50))
BEGIN
	INSERT INTO visit (visit_theater, visit_company, visit_date, visit_username)
	VALUES (i_thName, i_comName, i_visitDate, i_username);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-28  4:23:02
