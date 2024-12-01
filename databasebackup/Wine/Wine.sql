-- MySQL dump 10.13  Distrib 8.0.39, for macos14 (arm64)
--
-- Host: localhost    Database: Wine
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Country` (
  `country_id` int NOT NULL,
  `country_name` varchar(50) NOT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES (1,'France'),(2,'Spain'),(3,'U.S.A');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Portfolio`
--

DROP TABLE IF EXISTS `Portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Portfolio` (
  `winery_id` int DEFAULT NULL,
  `wine_type_id` int DEFAULT NULL,
  `in_season_flag` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Portfolio`
--

LOCK TABLES `Portfolio` WRITE;
/*!40000 ALTER TABLE `Portfolio` DISABLE KEYS */;
INSERT INTO `Portfolio` VALUES (1,1,1),(1,2,1),(1,3,0),(2,1,1),(2,2,1),(2,3,1),(3,1,1),(3,2,1),(3,3,1);
/*!40000 ALTER TABLE `Portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Region`
--

DROP TABLE IF EXISTS `Region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Region` (
  `region_id` int NOT NULL,
  `region_name` varchar(50) NOT NULL,
  `country_id` int DEFAULT NULL,
  PRIMARY KEY (`region_id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `region_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `Country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Region`
--

LOCK TABLES `Region` WRITE;
/*!40000 ALTER TABLE `Region` DISABLE KEYS */;
INSERT INTO `Region` VALUES (1,'Napa Valley',3),(2,'Walla Walla Valley',3),(3,'Texas Hill',3);
/*!40000 ALTER TABLE `Region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Viticultural_area`
--

DROP TABLE IF EXISTS `Viticultural_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Viticultural_area` (
  `viticultural_area_id` int NOT NULL,
  `viticultural_area_name` varchar(50) NOT NULL,
  `region_id` int DEFAULT NULL,
  PRIMARY KEY (`viticultural_area_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `viticultural_area_ibfk_1` FOREIGN KEY (`region_id`) REFERENCES `Region` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Viticultural_area`
--

LOCK TABLES `Viticultural_area` WRITE;
/*!40000 ALTER TABLE `Viticultural_area` DISABLE KEYS */;
INSERT INTO `Viticultural_area` VALUES (1,'Atlas Peak',1),(2,'Calistoga',1),(3,'Wild Horse Valley',1);
/*!40000 ALTER TABLE `Viticultural_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wine_type`
--

DROP TABLE IF EXISTS `Wine_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Wine_type` (
  `wine_type_id` int NOT NULL,
  `wine_type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`wine_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wine_type`
--

LOCK TABLES `Wine_type` WRITE;
/*!40000 ALTER TABLE `Wine_type` DISABLE KEYS */;
INSERT INTO `Wine_type` VALUES (1,'Chardonnay'),(2,'Cabernet Sauvignon'),(3,'Merlot');
/*!40000 ALTER TABLE `Wine_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Winery`
--

DROP TABLE IF EXISTS `Winery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Winery` (
  `winery_id` int NOT NULL,
  `winery_name` varchar(50) NOT NULL,
  `viticultural_area_id` int DEFAULT NULL,
  `Offering_tours_flag` int NOT NULL,
  PRIMARY KEY (`winery_id`),
  KEY `viticultural_area_id` (`viticultural_area_id`),
  CONSTRAINT `winery_ibfk_1` FOREIGN KEY (`viticultural_area_id`) REFERENCES `Viticultural_area` (`viticultural_area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Winery`
--

LOCK TABLES `Winery` WRITE;
/*!40000 ALTER TABLE `Winery` DISABLE KEYS */;
INSERT INTO `Winery` VALUES (1,'Silva vineyards',1,0),(2,'Chateau Traileur Parc',2,1),(3,'Winosaur Estate',3,1);
/*!40000 ALTER TABLE `Winery` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-18 11:25:15
