CREATE DATABASE  IF NOT EXISTS `safar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `safar`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: safar
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package` (
  `packageid` int NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `description` text,
  `source` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `tourist_allowed` int NOT NULL,
  `person_per_package` float NOT NULL,
  `image_desc` varchar(255) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `tourist_alllwed` int DEFAULT NULL,
  PRIMARY KEY (`packageid`),
  KEY `FCompany_ID_idx` (`company_id`),
  CONSTRAINT `FCompany_ID` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,1,'Rajasthan, known as the \"Land of Kings,\" is a vibrant state located in the northwestern part of India. This culturally rich and historically significant region is famous for its majestic palaces.','Pune','Jaipur',30,5000,'\'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Fjaipur&psig=AOvVaw1nsdvs1nCDI-Sobwl8PKBJ&ust=1735302449740000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCNiW88W3xYoDFQAAAAAdAAAAABAE\'','Rajasthan Trip',NULL),(2,2,'A trip to Kerala, often referred to as \"God\'s Own Country,\" promises a perfect blend of natural beauty, rich culture, and serene experiences. ','Mumbai','Kerela',40,6000,'\'https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fkerala&psig=AOvVaw3TfnTlIgffKbm9-v_Sh3Nn&ust=1735302824737000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCLjvr_W4xYoDFQAAAAAdAAAAABAE\'','Kerala Trip',NULL),(3,4,'Odisha (Orissa) is a state located on the eastern coast of India, known for its rich cultural heritage, ancient temples, beautiful beaches, and diverse wildlife.','Pune','Puri',50,20000,'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Fodisha&psig=AOvVaw3QqezYuZws9xh5Hr89ARdW&ust=1735412120302000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMiCsorQyIoDFQAAAAAdAAAAABAE','Odisha Trip',NULL);
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-03 15:48:54
