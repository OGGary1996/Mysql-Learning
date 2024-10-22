-- MySQL dump 10.13  Distrib 8.0.39, for macos14 (arm64)
--
-- Host: localhost    Database: SaskPolyDB
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
-- Table structure for table `Courses`
--

DROP TABLE IF EXISTS `Courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Courses` (
  `course_id` int NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `instructor` varchar(50) NOT NULL,
  `credits` decimal(10,0) DEFAULT '3',
  `department` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Courses`
--

LOCK TABLES `Courses` WRITE;
/*!40000 ALTER TABLE `Courses` DISABLE KEYS */;
INSERT INTO `Courses` VALUES (1,'Discrete Mathematics','Theresa Binney',3,'Mathematics','2024-09-02','2025-01-25'),(2,'Linear Algebra','Keriann Alloisi',1,'Mathematics','2024-09-02','2025-01-25'),(3,'Organic Chemistry','Elladine Rising',3,'Chemistry','2024-09-02','2025-01-25'),(4,'Physical Chemistry','Kass Hefferan',1,'Chemistry','2024-09-02','2025-01-25'),(5,'Classical Mechanics','Virge Janowski',3,'Physics','2024-09-02','2025-01-25'),(6,'Electromagnetism','Sayer Matterson',1,'Physics','2024-08-28','2024-10-15'),(7,'Molecular Biology','Darcy Nortunen',3,'Biology','2024-08-30','2024-12-20'),(8,'Ecology','Sayer Matterson',1,'Biology','2024-08-30','2025-01-25'),(9,'World History','Mildrid Sokale',3,'History',NULL,NULL),(10,'History of the Modern World','Ivy Fearey',1,'History',NULL,NULL),(11,'Discrete Mathematics','Cole Kesterton',3,'Mathematics','2024-09-02','2025-01-25'),(12,'Linear Algebra','Estrellita Daleman',3,'Mathematics','2024-09-02','2025-01-25'),(13,'Discrete Mathematics','Hettinger LLC',3,' Education','2024-09-02','2025-01-25'),(14,'Linear Algebra','Schinner Predovic',1,' Education','2024-09-02','2025-01-25'),(15,'Electrical','Waters Mayert',3,'Engineering','2024-09-02','2025-01-25'),(16,'Civil','Mayert Prohaskaing',1,'Engineering','2024-09-02','2025-01-25');
/*!40000 ALTER TABLE `Courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Students`
--

DROP TABLE IF EXISTS `Students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Students` (
  `student_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `enrollment_date` datetime DEFAULT NULL,
  `gpa` decimal(3,2) DEFAULT '0.00',
  `major` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Students`
--

LOCK TABLES `Students` WRITE;
/*!40000 ALTER TABLE `Students` DISABLE KEYS */;
INSERT INTO `Students` VALUES (1,'Babara','MacCaffrey','Babara123@gmail.com','1996-03-28','2021-08-30 08:05:12',3.21,NULL),(2,'Ines','Brushfield','Brushfield123@gmail.com','1994-06-12','2021-08-30 08:13:30',3.68,NULL),(3,'Tom','Freddi','Freddi.T@gmail.com','1995-03-01','2022-08-29 08:13:30',3.98,'Mathematics'),(4,'Ambur','Roseburgh','Roseburgh.amber@gmail.com','1994-06-05','2022-08-29 08:28:30',3.00,'Chemistry'),(5,'Clemmie','Betchley','Betchley123@gmail.com','1994-07-15','2022-08-29 14:18:30',3.66,'Physics'),(6,'Elka','Twiddell','Elka786@gmail.com','1996-03-12','2022-08-29 14:32:48',3.87,'Biology'),(7,'Ilene','Dowson','Dowson.i@gmail.com','1995-10-21','2023-09-01 15:13:24',0.00,'History'),(8,'Thacher','Naseby','Naseby.T@gmail.com','1995-08-14','2023-09-01 15:35:54',0.00,'History'),(9,'Romola','Rumgay','Rumgay.R@gmail.com','1998-09-26','2024-08-29 09:48:23',0.00,'Computer Science'),(10,'Levy','Mynett','Mynett.L@gmail.com','1997-08-13','2024-08-29 09:48:23',0.00,'Computer Science');
/*!40000 ALTER TABLE `Students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-21 17:54:59
