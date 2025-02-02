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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(255) NOT NULL DEFAULT 'Company',
  `lastname` varchar(255) NOT NULL DEFAULT 'Company',
  `contactno` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL DEFAULT 'Company',
  `account_status` int DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `Username_UNIQUE` (`username`),
  UNIQUE KEY `Contact_NO_UNIQUE` (`contactno`),
  KEY `FRole_ID_idx` (`role_id`),
  CONSTRAINT `FRole_ID` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'ATejas@18','Tejas@18','Tejas','Thorat','9834274562','Tejas@18','Pune',1),(2,1,'AMayuri@20','Mayuri@20','Mayuri','Puri','8473536248','Mayuri@20','Latur',1),(3,2,'TNeha@29','Neha@29','Neha','Jadhav','5647382910','Neha@29','Pune',1),(4,3,'CPratik@01','Pratik@01','Pratik','Jagtap','4637829109','Pratik@01','Solapur',1),(5,3,'CRohan@10','Rohan@10','Company','Company','9876543201','Rohan@10','Nanded',1),(6,3,'CSakshi@13','Sakshi@13','Company','Company','6785986755','Sakshi@13','Vadgaon',0),(31,2,'Tanmay@01','Tanmay@01','Tanmay','Raut','9834763121','Tanmay18@gmail.com','Delhi',1),(32,2,'Tanvi@20','Tanvi@20','Tanvi','Mankar','7896543210','Tanvi20@gmail.com','Nagpur',1),(33,3,'Chetan','Chetan@07','Company','Company','8978986756','Chetan@07','Bhosari',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
