-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: casestudy1
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `aircraft`
--

DROP TABLE IF EXISTS `aircraft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aircraft` (
  `Aircraft_id` int NOT NULL,
  `Registration_Num` varchar(20) DEFAULT NULL,
  `Aircraft_model` varchar(20) DEFAULT NULL,
  `Total_Seat_Capacity` int DEFAULT NULL,
  PRIMARY KEY (`Aircraft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircraft`
--

LOCK TABLES `aircraft` WRITE;
/*!40000 ALTER TABLE `aircraft` DISABLE KEYS */;
INSERT INTO `aircraft` VALUES (1010,'VT-ABC','Airindia A320',180);
/*!40000 ALTER TABLE `aircraft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `Booking_id` int NOT NULL,
  `Passenger_id` int DEFAULT NULL,
  `Itinerary_id` int DEFAULT NULL,
  `Booking_Date` date DEFAULT NULL,
  `Booking_status` varchar(20) DEFAULT NULL,
  `seat_num` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Booking_id`),
  KEY `Passenger_id` (`Passenger_id`),
  KEY `Itinerary_id` (`Itinerary_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Passenger_id`) REFERENCES `passenger` (`passenger_id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Itinerary_id`) REFERENCES `itinerary` (`Itinerary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (401,1,301,'2025-12-01','Confirmed','01A');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fare`
--

DROP TABLE IF EXISTS `fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fare` (
  `Fare_id` int NOT NULL,
  `Flight_id` int DEFAULT NULL,
  `Fare_class` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`Fare_id`),
  KEY `Flight_id` (`Flight_id`),
  CONSTRAINT `fare_ibfk_1` FOREIGN KEY (`Flight_id`) REFERENCES `flight` (`Flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fare`
--

LOCK TABLES `fare` WRITE;
/*!40000 ALTER TABLE `fare` DISABLE KEYS */;
INSERT INTO `fare` VALUES (601,201,'Economy',65000);
/*!40000 ALTER TABLE `fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight` (
  `Flight_id` int NOT NULL,
  `Flight_num` varchar(20) DEFAULT NULL,
  `Origin_Location` varchar(20) DEFAULT NULL,
  `Destination_Loc` varchar(20) DEFAULT NULL,
  `Departure_Time` time DEFAULT NULL,
  `Arrival_Time` time DEFAULT NULL,
  `Aircraft_ID` int DEFAULT NULL,
  PRIMARY KEY (`Flight_id`),
  KEY `Aircraft_ID` (`Aircraft_ID`),
  CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`Aircraft_ID`) REFERENCES `aircraft` (`Aircraft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (201,'FL101','Pune','Delhi','06:10:00','07:10:30',1010);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_crew`
--

DROP TABLE IF EXISTS `flight_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_crew` (
  `Crew_id` int NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Role` varchar(20) DEFAULT NULL,
  `Contact_num` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Crew_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_crew`
--

LOCK TABLES `flight_crew` WRITE;
/*!40000 ALTER TABLE `flight_crew` DISABLE KEYS */;
INSERT INTO `flight_crew` VALUES (701,'Amit Patil','Co-Pilot','9865328754'),(702,'Aniket Pansare','pilot','7845128956'),(703,'Amruta Jadhav','Cabin crew','7856124578');
/*!40000 ALTER TABLE `flight_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_crew_assignment`
--

DROP TABLE IF EXISTS `flight_crew_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_crew_assignment` (
  `Assignment_id` int NOT NULL,
  `Duty_Date_Time` datetime DEFAULT NULL,
  `crew_id` int DEFAULT NULL,
  `Flight_id` int DEFAULT NULL,
  PRIMARY KEY (`Assignment_id`),
  KEY `crew_id` (`crew_id`),
  KEY `Flight_id` (`Flight_id`),
  CONSTRAINT `flight_crew_assignment_ibfk_1` FOREIGN KEY (`crew_id`) REFERENCES `flight_crew` (`Crew_id`),
  CONSTRAINT `flight_crew_assignment_ibfk_2` FOREIGN KEY (`Flight_id`) REFERENCES `flight` (`Flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_crew_assignment`
--

LOCK TABLES `flight_crew_assignment` WRITE;
/*!40000 ALTER TABLE `flight_crew_assignment` DISABLE KEYS */;
INSERT INTO `flight_crew_assignment` VALUES (801,'2025-12-01 05:30:30',701,201);
/*!40000 ALTER TABLE `flight_crew_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itinerary`
--

DROP TABLE IF EXISTS `itinerary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itinerary` (
  `Itinerary_id` int NOT NULL,
  `passenger_id` int DEFAULT NULL,
  `Start_date` date DEFAULT NULL,
  `End_date` date DEFAULT NULL,
  `Origin_loc` varchar(20) DEFAULT NULL,
  `Destination_loc` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Itinerary_id`),
  KEY `passenger_id` (`passenger_id`),
  CONSTRAINT `itinerary_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerary`
--

LOCK TABLES `itinerary` WRITE;
/*!40000 ALTER TABLE `itinerary` DISABLE KEYS */;
INSERT INTO `itinerary` VALUES (301,1,'2025-12-12','2025-12-13','Pune','Mumbai'),(302,2,'2026-02-01','2025-12-12','Pune','Delhi');
/*!40000 ALTER TABLE `itinerary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itinerary_flight`
--

DROP TABLE IF EXISTS `itinerary_flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itinerary_flight` (
  `Itinerary_id` int NOT NULL,
  `Flight_id` int NOT NULL,
  `Sequence_Number` int DEFAULT NULL,
  PRIMARY KEY (`Itinerary_id`,`Flight_id`),
  KEY `Flight_id` (`Flight_id`),
  CONSTRAINT `itinerary_flight_ibfk_1` FOREIGN KEY (`Itinerary_id`) REFERENCES `itinerary` (`Itinerary_id`),
  CONSTRAINT `itinerary_flight_ibfk_2` FOREIGN KEY (`Flight_id`) REFERENCES `flight` (`Flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerary_flight`
--

LOCK TABLES `itinerary_flight` WRITE;
/*!40000 ALTER TABLE `itinerary_flight` DISABLE KEYS */;
INSERT INTO `itinerary_flight` VALUES (301,201,1);
/*!40000 ALTER TABLE `itinerary_flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `passenger_id` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `M_num` varchar(20) DEFAULT NULL,
  `Seat_preference` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (1,'Swayam Jadhav','Swayam123@gmail.com','9080706050','Window'),(2,'Pratham Patil','Pratham@gmail.com','9878098776','Aisle'),(3,'Sanket Devkar','Samket@gmail.com','8978897889','Middle');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL,
  `Booking_id` int DEFAULT NULL,
  `Payment_method` varchar(20) DEFAULT NULL,
  `Payment_status` varchar(20) DEFAULT NULL,
  `Amount` double(7,2) DEFAULT NULL,
  `Payment_date` date DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `Booking_id` (`Booking_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Booking_id`) REFERENCES `booking` (`Booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (501,401,'UPI','Success',4500.00,'2025-12-01');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-18 14:06:11
