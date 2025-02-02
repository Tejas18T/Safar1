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
-- Table structure for table `traveller`
--

DROP TABLE IF EXISTS `traveller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `traveller` (
  `Traveller_ID` int NOT NULL AUTO_INCREMENT,
  `Tourist_ID` int DEFAULT NULL,
  `Booking_ID` int DEFAULT NULL,
  `Name` varchar(255) NOT NULL,
  `Age` int NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Contact_No` varchar(45) NOT NULL,
  PRIMARY KEY (`Traveller_ID`),
  UNIQUE KEY `Contact_No_UNIQUE` (`Contact_No`),
  KEY `FBooking_ID_idx` (`Booking_ID`),
  KEY `FTTourist_ID_idx` (`Tourist_ID`),
  CONSTRAINT `FBooking_ID` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`),
  CONSTRAINT `FTTourist_ID` FOREIGN KEY (`Tourist_ID`) REFERENCES `tourist` (`tourist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traveller`
--

LOCK TABLES `traveller` WRITE;
/*!40000 ALTER TABLE `traveller` DISABLE KEYS */;
INSERT INTO `traveller` VALUES (1,1,1,'Sujal Raut',12,'Male','7890789078'),(2,1,1,'Prachi Raut',14,'Female','9878978900'),(3,2,2,'Kartik jaiswal',22,'Male','9876543210'),(4,2,2,'Soham jaiswal',19,'Male','8978965439'),(5,2,2,'Isha Jaiswal',20,'Female','7897896780');
/*!40000 ALTER TABLE `traveller` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-03 15:48:53
