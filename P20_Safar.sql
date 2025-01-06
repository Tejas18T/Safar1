-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: p20_safar
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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `Booking_ID` int NOT NULL AUTO_INCREMENT,
  `Tour_ID` int DEFAULT NULL,
  `Tourist_ID` int DEFAULT NULL,
  `No_of_Counts` int NOT NULL,
  `Payment_Status` varchar(45) NOT NULL,
  PRIMARY KEY (`Booking_ID`),
  KEY `FTour_ID_idx` (`Tour_ID`),
  KEY `FTourist_ID_idx` (`Tourist_ID`),
  CONSTRAINT `FTour_ID` FOREIGN KEY (`Tour_ID`) REFERENCES `trips` (`trip_id`),
  CONSTRAINT `FTourist_ID` FOREIGN KEY (`Tourist_ID`) REFERENCES `tourist` (`tourist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,1,2,'Incomplete'),(2,1,2,3,'Complete'),(3,2,3,1,'Complete'),(4,2,4,1,'Incomplete');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_reg_no` varchar(255) NOT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `Company_Reg_No_UNIQUE` (`company_reg_no`),
  KEY `FUser_Id_idx` (`user_id`),
  CONSTRAINT `FUser_Id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,5,'Anand Tours and Travels','Ana78965nd342'),(2,6,'Khushi Tours and Travels','Khu908564shi434'),(3,7,'Moment','87845nyhh5454'),(4,4,'FlyWithUs Travels','fl24325345us325'),(5,8,'Journey','dghs654651325'),(6,9,'World Wide','vb4544487878'),(7,10,'Vishwa','vish784512151'),(8,11,'Dream','dres124452222'),(16,33,'Purple Travels','Pur12323432ple'),(17,35,'TripsweMe','wdkwif'),(18,37,'Tejas','newcot');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `tourist_id` int DEFAULT NULL,
  `packageid` int DEFAULT NULL,
  `feedback_desc` int DEFAULT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `FFTourist_ID_idx` (`tourist_id`),
  KEY `FFPackage_ID_idx` (`packageid`),
  CONSTRAINT `FFPackage_ID` FOREIGN KEY (`packageid`) REFERENCES `package` (`packageid`),
  CONSTRAINT `FFTourist_ID` FOREIGN KEY (`tourist_id`) REFERENCES `tourist` (`tourist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

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
  `person_per_package` float NOT NULL,
  `image_desc` text,
  `package_name` varchar(255) NOT NULL,
  PRIMARY KEY (`packageid`),
  KEY `FCompany_ID_idx` (`company_id`),
  CONSTRAINT `FCompany_ID` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,1,'Rajasthan, known as the \"Land of Kings,\" is a vibrant state located in the northwestern part of India. This culturally rich and historically significant region is famous for its majestic palaces.','Pune','Jaipur',5000,'https://www.indiantempletour.com/wp-content/uploads/2022/08/Rajasthan-Tour-Packages-from-Kolkata-scaled.webp','Rajasthan Trip'),(2,2,'A trip to Kerala, often referred to as \"God\'s Own Country,\" promises a perfect blend of natural beauty, rich culture, and serene experiences. ','Mumbai','Kerela',6000,'https://keralatourpackagesguide.com/wp-content/uploads/2017/02/alappey_house.jpg','Kerala Trip'),(3,4,'Odisha (Orissa) is a state located on the eastern coast of India, known for its rich cultural heritage, ancient temples, beautiful beaches, and diverse wildlife.','Pune','Puri',20000,'https://www.bharatbooking.com/admin/webroot/img/uploads/holiday-package-gallery/1610017639_376995-orissa.jpg','Odisha Trip'),(4,3,'Nestled in the lap of the Himalayas, Manali is a picturesque hill station in Himachal Pradesh, India, known for its breathtaking landscapes, adventure activities, and serene ambiance. ','Mumabi','Manali',25000,'https://www.tripsavvy.com/thmb/vVG53bOHSHze8Z3NUvcx8fDwq7A=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-930881934-5ae56fe48023b90036464e72.jpg','Manali Trip'),(5,3,'The Bharat Darshan Trip is often used to describe a comprehensive journey across India, offering a rich experience of the country\'s diverse culture, heritage, and natural beauty.','Nagpur','Mumbai',50000,'https://bharatdarshanyatra.in/wp-content/uploads/2024/11/1.jpg','Bharat Darshan Trip'),(6,5,'Goa, India\'s smallest state, is a paradise for beach lovers, party enthusiasts, and culture seekers alike. ','Nashik','Goa',32450,'https://backpackersunited.in/_next/image?url=https%3A%2F%2Fbpu-images-v1.s3.eu-north-1.amazonaws.com%2Fuploads%2Fgoa%202_11zon.webp&w=750&q=75','Goa Trip'),(7,5,'Punjab is known for its rich culture, delicious food, and historical significance. ','Latur','Amritsar',15000,'https://www.holidaymonk.com/wp-content/uploads/2022/06/Golden-Temple-Amritsar-Punjab.webp','Panjab trip'),(8,8,'Whether you’re looking for relaxation, adventure, or spiritual exploration, Kerala provides an experience that rejuvenates both the body and the mind.','Nanded','Kerala',28000,'https://traveldudes.com/wp-content/uploads/2020/09/Kerala_Main.jpg','Kerala Trip'),(9,8,'Maharashtra, a state that blends historical grandeur with modern vibrancy, offers a diverse experience for travelers. ','Delhi','Pune',40000,'https://www.atlastravel.in/blog/wp-content/uploads/2021/12/Matheran.jpg','Maharashtra Trip'),(10,7,'Rajasthan, the land of kings, is known for its magnificent palaces, imposing forts, vibrant culture, and desert landscapes.  ','Amravati','Jaipur',17000,'https://www.google.com/url?sa=i&url=https%3A%2F%2Frajasthanyatra.in%2Fblog%2Frajasthan-tour-packages-from-mumbaihttps://rajasthanyatra.in/blog/wp-content/uploads/2024/09/rajasthan-tour-packages-from-mumbai.webp','Rajasthan Trip'),(11,7,'The Konkan region offers a captivating blend of sun-kissed beaches, historic forts, picturesque villages, and sacred temples. ','Solapur','Kokan',9000,'https://www.aluxurytravelblog.com/wp-content/uploads/2021/02/29.jpg','Kokan Trip'),(12,6,'Goa, the vibrant beach destination on India’s western coast, is a perfect getaway for all kinds of travelers.','Nashik','Goa',19000,'https://www.indiantempletour.com/wp-content/uploads/2023/04/Goa-Trip-Package.jpg','Goa Trip'),(13,6,'Manali, a charming hill station in the Kullu Valley of Himachal Pradesh, is a dream destination for travelers seeking a blend of natural beauty, adventure, and cultural experiences. ','Ratnagiri','Manali',21000,'https://www.oyorooms.com/travel-guide/wp-content/uploads/2022/03/Budget-Friendly-ways-to-travel-and-stay-in-Manali.jpg','Manali Trip');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `Payment_ID` int NOT NULL AUTO_INCREMENT,
  `Tourist_ID` int DEFAULT NULL,
  `Booking_ID` int DEFAULT NULL,
  `Payment_Status` varchar(45) NOT NULL,
  `Amount` bigint NOT NULL,
  `Transaction_Date` date NOT NULL,
  `Transaction_ID` int NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  UNIQUE KEY `Transaction_ID_UNIQUE` (`Transaction_ID`),
  KEY `FPTourist_ID_idx` (`Tourist_ID`),
  KEY `FPBooking_ID_idx` (`Booking_ID`),
  CONSTRAINT `FPBooking_ID` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`),
  CONSTRAINT `FPTourist_ID` FOREIGN KEY (`Tourist_ID`) REFERENCES `tourist` (`tourist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,'Incomplete',2000,'2024-12-23',12345),(2,2,2,'Complete',24000,'2024-12-19',67890);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `Role_name_UNIQUE` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin','Has full access to all features and data.'),(2,'Tourist','Has Tourist Operations'),(3,'Company','Has Company Trips operations');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tourist`
--

DROP TABLE IF EXISTS `tourist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tourist` (
  `tourist_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `age` int NOT NULL,
  `gender` varchar(45) NOT NULL,
  `adhar_no` varchar(45) NOT NULL,
  `reg_date` date NOT NULL,
  PRIMARY KEY (`tourist_id`),
  UNIQUE KEY `Adhar_NO_UNIQUE` (`adhar_no`),
  KEY `FTUser_ID_idx` (`user_id`),
  CONSTRAINT `FTUser_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourist`
--

LOCK TABLES `tourist` WRITE;
/*!40000 ALTER TABLE `tourist` DISABLE KEYS */;
INSERT INTO `tourist` VALUES (1,3,25,'Male','123456789012','2031-12-24'),(2,3,30,'Female','987654321098','2029-12-24'),(3,3,27,'Male','897654321210','2029-12-24'),(4,3,31,'Female','21213456789098','2030-12-24');
/*!40000 ALTER TABLE `tourist` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `trip_id` int NOT NULL AUTO_INCREMENT,
  `packageid` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `tourist_allowed` int DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `FPackage_ID_idx` (`packageid`),
  CONSTRAINT `FKqbpx34j378orw1sv98f0hfw7j` FOREIGN KEY (`packageid`) REFERENCES `package` (`packageid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,1,'2024-12-31','2025-01-10',30),(2,2,'2024-12-21','2024-12-31',30),(3,2,'2025-01-21','2025-01-30',20),(4,4,'2025-02-15','2025-02-20',40),(5,5,'2025-02-05','2025-03-05',70),(6,5,'2025-03-10','2025-04-02',70),(7,6,'2025-02-09','2025-02-13',35),(8,6,'2025-02-20','2025-02-24',40),(9,7,'2025-03-01','2025-03-09',50),(10,8,'2025-02-17','2025-02-25',30),(11,9,'2025-02-07','2025-02-17',60),(12,9,'2025-03-05','2025-03-15',60),(13,10,'2025-02-06','2025-02-16',50),(14,11,'2025-02-25','2025-02-28',20),(15,10,'2025-03-15','2025-03-25',60),(16,12,'2025-02-19','2025-02-25',35),(17,13,'2025-03-03','2025-03-16',45),(18,13,'2025-03-23','2025-04-02',50);
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'ATejas@18','Tejas@18','Tejas','Thorat','9834274562','Tejas@18','Pune',1),(2,1,'AMayuri@20','Mayuri@20','Mayuri','Puri','8473536248','Mayuri@20','Latur',1),(3,2,'TNeha@29','Neha@29','Neha','Jadhav','5647382910','Neha@29','Pune',1),(4,3,'CPratik@01','Pratik@01','Pratik','Jagtap','4637829109','Pratik@01','Solapur',1),(5,3,'CRohan@10','Rohan@10','Company','Company','9876543201','Rohan@10','Nanded',1),(6,3,'CSakshi@13','Sakshi@13','Company','Company','6785986755','Sakshi@13','Vadgaon',0),(7,3,'CMoment@06','Moment@06','Company','Company','9874587458','moment06@gmail.com','Hyderabad',1),(8,3,'CJourney@3','Journey@3','Company','Company','9547218632','journey23@gmaiil.com','Mumbai',1),(9,3,'CWorld@08','World@08','Company','Company','7458963214','world08@gmail.com','Nashik',1),(10,3,'CVishwa@67','Vishwa@67','Company','Company','8877559421','vishwa67@gmail.com','Udgir',1),(11,3,'CDream@11','Dream@11','Company','Company','7984857968','dream11@gmail.com','Thane',1),(31,2,'Tanmay@01','Tanmay@01','Tanmay','Raut','9834763121','Tanmay18@gmail.com','Delhi',1),(32,2,'Tanvi@20','Tanvi@20','Tanvi','Mankar','7896543210','Tanvi20@gmail.com','Nagpur',1),(33,3,'Chetan','Chetan@07','Company','Company','8978986756','Chetan@07','Bhosari',0),(35,3,'Com1','Virat@18','Company','Company','9405202988','tejas18@gmail.com','Pune',0),(36,2,'newuser123','password123','John','Doe','1234567890','john.doe@example.com','123 Main St, Anytown, USA',1),(37,3,'newuse1','password123','Company','Company','186486486','john.doe@example.com','123 Main St, Anytown, USA',0),(38,1,'Admin@123','password12','John','Doe','637457475','john.doe@example.com','123 Main St, Anytown, USA',1);
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

-- Dump completed on 2025-01-06 13:53:48
