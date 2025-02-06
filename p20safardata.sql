CREATE DATABASE  IF NOT EXISTS `p20_safar1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `p20_safar1`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: p20_safar1
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
-- Table structure for table `addtocart`
--

DROP TABLE IF EXISTS `addtocart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addtocart` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `trip_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addtocart`
--

LOCK TABLES `addtocart` WRITE;
/*!40000 ALTER TABLE `addtocart` DISABLE KEYS */;
INSERT INTO `addtocart` VALUES (1,1,3),(2,1,3),(3,1,3),(4,2,3);
/*!40000 ALTER TABLE `addtocart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `addtowishlist`
--

DROP TABLE IF EXISTS `addtowishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addtowishlist` (
  `wish_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `trip_id` int DEFAULT NULL,
  PRIMARY KEY (`wish_id`),
  KEY `wishuser_idx` (`user_id`),
  KEY `wishtripid_idx` (`trip_id`),
  CONSTRAINT `wishtripid` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`),
  CONSTRAINT `wishuser` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addtowishlist`
--

LOCK TABLES `addtowishlist` WRITE;
/*!40000 ALTER TABLE `addtowishlist` DISABLE KEYS */;
INSERT INTO `addtowishlist` VALUES (10,3,1);
/*!40000 ALTER TABLE `addtowishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `Booking_ID` int NOT NULL AUTO_INCREMENT,
  `trip_id` int DEFAULT NULL,
  `Tourist_ID` int DEFAULT NULL,
  `Payment_Status` varchar(45) NOT NULL,
  PRIMARY KEY (`Booking_ID`),
  KEY `FTour_ID_idx` (`trip_id`),
  KEY `FTourist_ID_idx` (`Tourist_ID`),
  CONSTRAINT `FTour_ID` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`),
  CONSTRAINT `FTourist_ID` FOREIGN KEY (`Tourist_ID`) REFERENCES `tourist` (`tourist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,5,'Anand Tours and Travels','Ana78965nd342'),(2,6,'Khushi Tours and Travels','Khu908564shi434'),(3,4,'FlyWithUs Travels','fl24325345us325'),(4,7,'Shivkrupa Tours and Travels','ksh156748dfd457'),(5,8,'Narmada Tours and Travels','nds789441dff256');
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
  `feedback_desc` varchar(255) DEFAULT NULL,
  `packageid` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `tourist_id` int DEFAULT NULL,
  PRIMARY KEY (`feedback_id`)
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
  `package_status` int DEFAULT NULL,
  PRIMARY KEY (`packageid`),
  KEY `FCompany_ID_idx` (`company_id`),
  CONSTRAINT `FCompany_ID` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `package`
--

LOCK TABLES `package` WRITE;
/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` VALUES (1,1,'Rajasthan, known as the \"Land of Kings,\" is a vibrant state located in the northwestern part of India. This culturally rich and historically significant region is famous for its majestic palaces.','Pune','Jaipur',9000,'https://www.indiantempletour.com/wp-content/uploads/2022/08/Rajasthan-Tour-Packages-from-Kolkata-scaled.webp','Rajasthan Trip',0),(2,1,'A trip to Kerala, often referred to as \"God\'s Own Country,\" promises a perfect blend of natural beauty, rich culture, and serene experiences. ','Mumbai','Kerela',10000,'https://keralatourpackagesguide.com/wp-content/uploads/2017/02/alappey_house.jpg','Kerala Trip',1),(3,1,'Odisha (Orissa) is a state located on the eastern coast of India, known for its rich cultural heritage, ancient temples, beautiful beaches, and diverse wildlife.','Pune','Puri',20000,'https://www.bharatbooking.com/admin/webroot/img/uploads/holiday-package-gallery/1610017639_376995-orissa.jpg','Odisha Trip',0),(4,1,'Nestled in the lap of the Himalayas, Manali is a picturesque hill station in Himachal Pradesh, India, known for its breathtaking landscapes, adventure activities, and serene ambiance. ','Mumabi','Manali',25000,'https://www.tripsavvy.com/thmb/vVG53bOHSHze8Z3NUvcx8fDwq7A=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/GettyImages-930881934-5ae56fe48023b90036464e72.jpg','Manali Trip',1),(5,1,'The Bharat Darshan Trip is often used to describe a comprehensive journey across India, offering a rich experience of the country\'s diverse culture, heritage, and natural beauty.','Nagpur','Mumbai',50000,'https://bharatdarshanyatra.in/wp-content/uploads/2024/11/1.jpg','Bharat Darshan Trip',0),(6,2,'Goa, India\'s smallest state, is a paradise for beach lovers, party enthusiasts, and culture seekers alike. ','Nashik','Goa',12000,'https://backpackersunited.in/_next/image?url=https%3A%2F%2Fbpu-images-v1.s3.eu-north-1.amazonaws.com%2Fuploads%2Fgoa%202_11zon.webp&w=750&q=75','Goa Trip',1),(7,2,'Punjab is known for its rich culture, delicious food, and historical significance. ','Latur','Amritsar',15000,'https://www.holidaymonk.com/wp-content/uploads/2022/06/Golden-Temple-Amritsar-Punjab.webp','Panjab trip',1),(8,2,'Whether you’re looking for relaxation, adventure, or spiritual exploration, Kerala provides an experience that rejuvenates both the body and the mind.','Nanded','Kerala',28000,'https://traveldudes.com/wp-content/uploads/2020/09/Kerala_Main.jpg','Kerala Trip',1),(9,2,'Maharashtra, a state that blends historical grandeur with modern vibrancy, offers a diverse experience for travelers. ','Delhi','Pune',40000,'https://www.atlastravel.in/blog/wp-content/uploads/2021/12/Matheran.jpg','Maharashtra Trip',1),(10,2,'Rajasthan, the land of kings, is known for its magnificent palaces, imposing forts, vibrant culture, and desert landscapes.  ','Amravati','Jaipur',17000,'https://www.google.com/url?sa=i&url=https%3A%2F%2Frajasthanyatra.in%2Fblog%2Frajasthan-tour-packages-from-mumbaihttps://rajasthanyatra.in/blog/wp-content/uploads/2024/09/rajasthan-tour-packages-from-mumbai.webp','Rajasthan Trip',1),(11,3,'The Konkan region offers a captivating blend of sun-kissed beaches, historic forts, picturesque villages, and sacred temples. ','Solapur','Kokan',8000,'https://www.aluxurytravelblog.com/wp-content/uploads/2021/02/29.jpg','Maharashtra Trip',1),(12,3,'Goa, the vibrant beach destination on India’s western coast, is a perfect getaway for all kinds of travelers.','Nashik','Goa',19000,'https://www.indiantempletour.com/wp-content/uploads/2023/04/Goa-Trip-Package.jpg','Goa Trip',1),(13,3,'Manali, a charming hill station in the Kullu Valley of Himachal Pradesh, is a dream destination for travelers seeking a blend of natural beauty, adventure, and cultural experiences. ','Ratnagiri','Manali',21000,'https://www.oyorooms.com/travel-guide/wp-content/uploads/2022/03/Budget-Friendly-ways-to-travel-and-stay-in-Manali.jpg','Manali Trip',1),(14,3,'Experience the grandeur of Rajasthan with this royal retreat. Explore the majestic forts of Jaipur, the blue streets of Jodhpur, and the romantic lakes of Udaipur. Enjoy traditional Rajasthani cuisine and cultural performances.','Aurangabad','Udaipur',10000,'https://www.tourmyindia.com/blog//wp-content/uploads/2018/07/How-to-Plan-Family-Friendly-Hioliday-Trip-to-Rajasthan.jpg','Rajasthan Trip',1),(15,3,'A refreshing escape to Kerala\'s lush greenery and serene backwaters. Cruise through the tranquil backwaters of Alleppey, explore tea plantations in Munnar, and witness Kathakali performances in Kochi.','Nashik','Kochi',13000,'https://www.keralaholidays.com/uploads/tourpackages-gallery/thumb/Kerala-Natures-Extravaganza_(1)1.jpg','Kerala Trip',1),(16,4,'A perfect getaway to the snow-capped mountains of Himachal. Visit Shimla’s colonial charm, enjoy adventure activities in Manali, and experience Tibetan culture in Dharamshala.','Ratnagiri','Shimla',18000,'https://www.honeymoonpackagesmanali.in/wp-content/uploads/2024/04/SUMMER-HILL.jpg','Shimla Trip',1),(17,4,'Explore Gujarat’s spiritual sites, stunning landscapes, and rich wildlife. This tour takes you from the world’s tallest Statue of Unity to historic temples, beautiful beaches, and the famous Gir National Park, home to Asiatic lions.','Amravati','Ahmedabad',15500,'https://www.gujaratpackage.com/wp-content/uploads/2022/07/BANNER-GUJ-1.jpg','Gujarat Trip ',1),(18,4,'Discover the diverse beauty of Maharashtra, from misty hill stations and historic caves to sun-kissed beaches and thrilling wildlife safaris. This tour offers a perfect mix of nature, adventure, and heritage.','Dhule','Mahabaleshwar',6000,'https://www.justahotels.com/wp-content/uploads/2023/09/Maharashtra-scaled.jpg','Maharashtra Trip',1),(19,4,'Experience the royal heritage, spiritual essence, and vibrant culture of Punjab. This tour takes you through historic forts, lively cities, and sacred Sikh shrines, offering a perfect blend of tradition and modernity.','Solapur','Bhatinda',20000,'https://www.revv.co.in/blogs/wp-content/uploads/2020/06/best-places-to-visit-in-Punjab.jpg','Panjab Trip',1),(20,4,'Nestled in the lap of the Himalayas, Uttarakhand is a perfect blend of spirituality, adventure, and natural beauty. Known for its ancient temples, serene hill stations, adventure activities, and breathtaking landscapes, Uttarakhand is a must-visit destination for every traveler.','Latur','Nainital',25000,'https://onlinetourandtravel.com/wp-content/uploads/2019/11/Delightful-Uttarakhand-Tour-812x406.png','Uttarakhand Trip',1),(21,5,'A perfect mix of nature and history. Explore Bangalore’s modern charm, experience Coorg’s lush coffee plantations, and step back in time at the UNESCO-listed ruins of Hampi.\n','Nanded','Bangalore',8000,'https://www.thestatesman.com/wp-content/uploads/2018/01/Karnataka.jpg','Karnataka Trip',1),(22,5,'Discover the rich heritage and wildlife of Madhya Pradesh. Explore the ancient temples of Khajuraho, go on a thrilling jungle safari in Bandhavgarh National Park, and visit the historic sites of Bhopal.','Nagpur','Bhopal',12500,'https://www.kanhanationalparkonline.in/uploads/madhya-pradesh-beauty.JPG','Madhya Pradesh Trip',1),(23,5,'Embark on an adventure-packed trip with river rafting in Rishikesh, scenic views in Nainital, and trekking in Mussoorie. This package is ideal for nature lovers and thrill-seekers.','Navi Mumbai',' Rishikesh',24500,'https://travelogyindia.b-cdn.net/storage/app/itinerary/482/chauli-ki-jali-uttarakhand.jpg','Uttarakhand Trip',1),(24,5,'Explore Gujarat’s vibrant culture and wildlife. Visit the historic Sabarmati Ashram in Ahmedabad, go on a thrilling lion safari in Gir National Park, and experience spiritual bliss at the sacred Dwarkadhish Temple.','Pune','Dwarka',17000,'https://www.gujaratpackage.com/wp-content/uploads/2022/03/gujarat-tour-packages.jpg','Gujarat Trip',1),(25,5,'Experience the vibrant culture, history, and spirituality of Punjab. Visit the iconic Golden Temple in Amritsar, witness the patriotic Wagah Border ceremony, explore the planned city of Chandigarh, and immerse yourself in the rich heritage of Ludhiana.','Tuljapur','Amritsar',19000,'https://www.tourmyindia.com/states/punjab/images/tour-banner.jpg','Panjab Trip',1);
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
  `gender` varchar(255) DEFAULT NULL,
  `adhar_no` varchar(255) DEFAULT NULL,
  `trip_id` int DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tourist_id`),
  UNIQUE KEY `Adhar_NO_UNIQUE` (`adhar_no`),
  KEY `FTUser_ID_idx` (`user_id`),
  KEY `Trip_id_idx` (`trip_id`),
  CONSTRAINT `FTUser_ID` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `Trip_id` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`trip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tourist`
--

LOCK TABLES `tourist` WRITE;
/*!40000 ALTER TABLE `tourist` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `traveller`
--

LOCK TABLES `traveller` WRITE;
/*!40000 ALTER TABLE `traveller` DISABLE KEYS */;
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
  `tour_status` varchar(45) DEFAULT NULL,
  `trips_status` int DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `FPackage_ID_idx` (`packageid`),
  CONSTRAINT `FKqbpx34j378orw1sv98f0hfw7j` FOREIGN KEY (`packageid`) REFERENCES `package` (`packageid`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES (1,1,'2024-12-31','2025-01-06',30,'Completed',1),(2,2,'2025-01-31','2025-02-07',30,'Inprogress',1),(3,2,'2025-02-25','2025-03-05',25,'Upcoming',1),(4,1,'2025-02-07','2025-02-12',30,'Upcoming',1),(5,3,'2025-02-15','2025-02-22',20,'Upcoming',1),(6,3,'2025-03-02','2025-03-09',25,'Upcoming',1),(7,4,'2025-02-01','2025-02-05',35,'Inprogress',1),(8,4,'2025-03-07','2025-03-12',30,'Upcoming',1),(9,5,'2025-01-20','2025-02-27',60,'Completed',1),(10,5,'2025-03-07','2025-03-12',60,'Upcoming',1),(11,6,'2025-02-07','2025-02-12',25,'Upcoming',1),(12,6,'2025-01-29','2025-02-05',30,'Inprogress',1),(13,7,'2025-02-18','2025-02-22',35,'Upcoming',1),(14,7,'2025-03-06','2025-03-13',40,'Upcoming',1),(15,8,'2025-02-02','2025-02-08',30,'Inprogress',1),(16,8,'2025-03-07','2025-03-12',35,'Upcoming',1),(17,9,'2025-02-05','2025-02-08',40,'Upcoming',1),(18,9,'2025-03-05','2025-03-08',40,'Upcoming',1),(19,10,'2025-02-03','2025-02-12',32,'Inprogress',1),(20,10,'2025-03-15','2025-03-23',32,'Upcoming',0),(21,11,'2025-01-13','2025-01-17',45,'Completed',1),(22,11,'2025-03-10','2025-03-14',45,'Inprogress',1),(23,12,'2024-12-28','2025-01-03',50,'Completed',1),(24,12,'2025-02-07','2025-03-15',50,'Upcoming',1),(25,13,'2025-01-03','2025-01-07',30,'Completed',1),(26,13,'2025-03-15','2025-03-23',30,'Upcoming',1),(27,14,'2025-01-22','2025-01-27',35,'Completed',1),(28,14,'2025-03-13','2025-03-20',35,'Upcoming',1),(29,15,'2025-02-25','2025-03-03',40,'Upcoming',1),(30,15,'2025-04-10','2025-03-16',40,'Upcoming',1),(31,16,'2025-02-03','2025-02-12',25,'Inprogress',1),(32,16,'2025-03-31','2025-04-08',25,'Upcoming',1),(33,17,'2025-01-25','2025-02-04',40,'Inprogress',1),(34,17,'2025-03-18','2025-03-26',40,'Upcoming',1),(35,18,'2025-02-03','2025-02-08',40,'Inprogress',1),(36,18,'2025-03-25','2025-04-01',40,'Upcoming',1),(37,19,'2025-01-11','2025-01-16',30,'Completed',1),(38,19,'2025-03-14','2025-03-20',30,'Upcoming',1),(39,20,'2025-02-01','2025-02-08',40,'Inprogress',1),(40,20,'2025-04-08','2025-04-15',40,'Upcoming',1),(41,21,'2025-01-08','2025-01-12',30,'Completed',1),(42,21,'2025-02-12','2025-03-15',30,'Upcoming',1),(43,22,'2025-03-13','2025-03-18',32,'Upcoming',1),(44,22,'2025-04-18','2025-04-24',32,'Upcoming',1),(45,23,'2025-01-22','2025-01-26',30,'Completed',1),(46,23,'2025-03-12','2025-03-21',30,'Upcoming',1),(47,24,'2025-01-02','2025-01-06',40,'Completed',1),(48,24,'2025-03-04','2025-03-09',40,'Upcoming',1),(49,25,'2025-01-03','2025-01-12',30,'Completed',1),(50,25,'2025-03-15','2025-03-23',30,'Upcoming',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'ATejas@18','Tejas@18','Tejas','Thorat','9834274562','tejassthorat18@gmail.com','Pune',0),(2,1,'AMayuri@20','Mayuri@20','Mayuri','Puri','8473536248','Mayuri@20','Latur',1),(3,2,'TNeha@29','Neha@29','Neha','Jadhav','5647382910','Neha@29','Pune',1),(4,3,'CPratik@01','Pratik@01','Pratik','Jagtap','4637829109','Pratik@01','Solapur',1),(5,3,'CRohan@10','Rohan@10','Company','Company','9876543201','Rohan@10','Nanded',1),(6,3,'CSakshi@13','Sakshi@13','Company','Company','6785986755','Sakshi@13','Vadgaon',0),(7,3,'CShivkrupa@10','Shivkrupa@10','Company','Company','7896541258','shivkrupa10@gmail.com','Aurangabad',1),(8,3,'CNarmada@20','Narmada@@20','Company','Company','7894578754','narmada20@gmail.com','Nanded',1),(9,2,'TAjay@3','Ajay@3','Ajay','Kulkarni','9874568457','ajay3@gmail.com','Company',1),(10,2,'TSuhan@7','Suhan@7','Suhan','Pawar','8251478542','suhanp7@gmail.com','Company',1),(11,2,'TAakash@16','Aakash@16','Aakash','Gurav','7845120321','aakashg16@gmail.com','Company',1),(12,2,'TRuhi@25','Ruhi@25','Ruhi','Thorat','9547812450','ruhithorat@gmail.com','Company',1),(13,2,'TAjinkya@6','Ajinkya@6','Ajinkya','Mundhe','8654512121','ajinkya6@gmail.com','Company',1),(14,2,'TTanuja@13','Tanuja@13','Tanuja','Bharati','7458621154','tanuja13@gmail.com','Company',1),(15,2,'TAbhilasha@14','Abhilasha@14','Abhilasha','Raut','7847474785','abhilasha14@gmail.com','Company',1),(16,2,'TKunal@78','Kunal@78','Kunal','Rathod','9845212151','kunal78@gmail.com','Company',1),(17,2,'TManjusha@8','Manjusha@8','Manjusha','Joshi','8564545845','manjusha8@gmail.com','Company',1),(18,2,'TJay@90','Jay@90','Jay','Singh','9845121451','jaysingh90@gmail.com','Company',1),(31,2,'Tanmay@01','Tanmay@01','Tanmay','Raut','9834763121','Tanmay18@gmail.com','Delhi',1),(32,2,'Tanvi@20','Tanvi@20','Tanvi','Mankar','7896543210','Tanvi20@gmail.com','Nagpur',1),(33,3,'Chetan','Chetan@07','Company','Company','8978986756','Chetan@07','Bhosari',0),(35,3,'Com1','Virat@18','Company','Company','9405202988','tejas18@gmail.com','Pune',0),(36,2,'TKunal@07','Kunal@07','Kunal','Jaiswal','9876543212','Kunal07@gmail.com','pune',1);
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

-- Dump completed on 2025-02-06 21:37:06
