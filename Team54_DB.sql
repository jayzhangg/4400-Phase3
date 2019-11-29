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