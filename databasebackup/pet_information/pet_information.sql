CREATE DATABASE  IF NOT EXISTS `pet_information` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pet_information`;
-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: pet_information
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `breed`
--

DROP TABLE IF EXISTS `breed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breed` (
  `breed_id` int NOT NULL,
  `breed_name` varchar(20) DEFAULT 'not_sure',
  `temperament` varchar(50) DEFAULT 'not_sure',
  PRIMARY KEY (`breed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breed`
--

LOCK TABLES `breed` WRITE;
/*!40000 ALTER TABLE `breed` DISABLE KEYS */;
INSERT INTO `breed` VALUES (1,'Labrador','friendly'),(2,'German','smart'),(3,'Golden Retriever','not_sure'),(4,'not_sure','calm'),(5,'Beagle','not_sure'),(6,'Poodle','not_sure');
/*!40000 ALTER TABLE `breed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dog`
--

DROP TABLE IF EXISTS `dog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dog` (
  `dog_id` int NOT NULL,
  `dog_name` varchar(20) NOT NULL,
  `owner_id` int DEFAULT NULL,
  `breed_id` int DEFAULT NULL,
  `veterinarian_id` int DEFAULT NULL,
  PRIMARY KEY (`dog_id`),
  UNIQUE KEY `owner_id` (`owner_id`),
  UNIQUE KEY `breed_id` (`breed_id`),
  UNIQUE KEY `veterinarian_id` (`veterinarian_id`),
  CONSTRAINT `dog_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`),
  CONSTRAINT `dog_ibfk_2` FOREIGN KEY (`breed_id`) REFERENCES `breed` (`breed_id`),
  CONSTRAINT `dog_ibfk_3` FOREIGN KEY (`veterinarian_id`) REFERENCES `veterinarian` (`veterinarian_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dog`
--

LOCK TABLES `dog` WRITE;
/*!40000 ALTER TABLE `dog` DISABLE KEYS */;
INSERT INTO `dog` VALUES (1,'Lucy',5,4,4),(2,'Max',2,6,2),(3,'Bella',6,1,3),(4,'Charlie',4,3,6),(5,'Buddy',1,5,5),(6,'Molly',3,2,1);
/*!40000 ALTER TABLE `dog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `owner_id` int NOT NULL,
  `owner_name` varchar(20) NOT NULL,
  `owner_address` varchar(50) NOT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'John','123 Maple St'),(2,'Jane','456 Oak St'),(3,'Michael','789 Pine Ave'),(4,'Emily','321 Cedar Dr'),(5,'William','654 Birch Ln'),(6,'Sophia','987 Walnut St');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinarian`
--

DROP TABLE IF EXISTS `veterinarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinarian` (
  `veterinarian_id` int NOT NULL,
  `veterinarian_name` varchar(20) DEFAULT NULL,
  `veterinarian_address` varchar(50) DEFAULT NULL,
  `veterinarian_phone` int DEFAULT NULL,
  PRIMARY KEY (`veterinarian_id`),
  UNIQUE KEY `veterinarian_phone` (`veterinarian_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinarian`
--

LOCK TABLES `veterinarian` WRITE;
/*!40000 ALTER TABLE `veterinarian` DISABLE KEYS */;
INSERT INTO `veterinarian` VALUES (1,'Dr. Emily','123 Forest Ave',1234567),(2,'Dr. John','456 Oak St',2345678),(3,'Dr. Olivia','789 Pine Rd',3456789),(4,'Dr. James','321 Cedar Dr',4567890),(5,'Dr. Sophia','654 Birch Ln',5678901),(6,'Dr. Michael','987 Walnut St',6789012);
/*!40000 ALTER TABLE `veterinarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pet_information'
--

--
-- Dumping routines for database 'pet_information'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-23 22:24:55
