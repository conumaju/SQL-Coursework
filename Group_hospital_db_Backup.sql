CREATE DATABASE  IF NOT EXISTS `hospital_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hospital_db`;
-- MySQL dump 10.13  Distrib 8.0.14, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_db
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in_time` datetime NOT NULL,
  `check_out_time` datetime NOT NULL,
  `reason` varchar(150) NOT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `fk_appointments_patients1_idx` (`patient_id`),
  KEY `fk_appointments_doctors1_idx` (`doctor_id`),
  KEY `fk_appointments_rooms1_idx` (`room_id`),
  CONSTRAINT `fk_appointments_doctors1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`),
  CONSTRAINT `fk_appointments_patients1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `fk_appointments_rooms1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,5,11,8,'2019-05-01 12:21:07','2019-05-01 13:21:07','Patient felt high anxiety.'),(2,29,1,12,'2019-05-01 12:03:07','2019-05-01 15:03:07','Infection found in left lung.'),(3,8,15,3,'2019-05-06 03:42:56','2019-05-06 08:42:56','Pateint had not eaten successfully in three days.'),(4,27,4,14,'2019-05-03 15:10:10','2019-05-03 19:10:10','Pateint had difficulty breathing.'),(5,24,9,2,'2019-05-04 20:12:39','2019-05-05 02:12:39','Infection located.'),(6,1,1,6,'2019-05-07 23:50:50','2019-05-08 02:50:50','Possible pneumonia.'),(7,12,2,5,'2019-05-02 18:12:23','2019-05-03 01:12:23','Left arm broken.'),(8,25,2,13,'2019-05-01 09:26:01','2019-05-02 12:26:01','Right ankle broken.'),(9,26,11,1,'2019-05-05 11:01:56','2019-05-05 16:01:56','Patient experiencing extreme anxiety.'),(10,6,5,11,'2019-05-05 11:16:23','2019-05-05 14:16:23','Asthmatic episode.'),(11,23,7,20,'2019-05-06 10:21:23','2019-05-06 13:21:23','Patient had simple flu.'),(12,14,6,9,'2019-05-07 01:24:10','2019-05-07 07:24:10','Heart valves not pumping enough blood.'),(13,13,12,10,'2019-05-02 13:32:23','2019-05-02 18:32:23','Patient experienced irregular heart beats.'),(14,7,6,16,'2019-05-01 17:45:50','2019-05-01 23:45:50','Patient had cycles of strange heart beats.'),(15,20,10,15,'2019-05-03 13:13:12','2019-05-03 20:13:12','Patient did not eat enough sugar that day (is a diabetic).'),(16,10,9,11,'2019-05-07 08:51:50','2019-05-07 12:51:50','Possible infection in both of patient\'s lungs.'),(17,22,13,17,'2019-05-03 06:04:19','2019-05-03 14:04:19','Patient diagnosed with Type II Diabetes.'),(18,16,1,18,'2019-05-04 12:45:23','2019-05-04 17:45:23','HIV has been discovered within patient.'),(19,21,8,7,'2019-05-05 20:21:45','2019-05-06 03:21:45','Patient diagnosed with Breast Cancer.'),(20,4,4,4,'2019-05-07 05:16:20','2019-05-07 07:16:20','Insulin supplied to patient.'),(21,17,3,10,'2019-05-07 07:23:12','2019-05-07 12:34:02','Emergency surgery given to car accident victim with internal injuries.'),(22,2,9,16,'2019-05-01 12:34:42','2019-05-01 18:23:58','Patient had E. Coli.'),(23,18,1,11,'2019-05-05 05:53:32','2019-05-05 12:23:32','Bacterial infection discovered in patient\'s stomach.'),(24,9,9,18,'2019-05-04 13:43:21','2019-05-04 21:21:43','Patient diagnosed with E. Coli, medicine supplied.'),(25,30,1,19,'2019-05-06 17:12:21','2019-05-08 20:21:12','Patient had dangerous case of UTI.'),(26,19,9,2,'2019-05-05 10:12:21','2019-05-05 18:21:45','Mild case of Urinary Tract Infection.'),(27,3,2,9,'2019-05-04 08:21:43','2019-05-04 15:31:21','Patient had broken his left arm.'),(28,28,15,11,'2019-05-02 03:12:32','2019-05-07 11:21:32','Patient experiencing extreme anoxeria - hasn\'t eaten in a week.'),(29,15,14,6,'2019-05-01 12:21:32','2019-05-03 14:23:32','Planned heart transplant given to patient.'),(30,11,7,12,'2019-05-03 08:21:32','2019-05-03 14:21:21','Simple flu - medicine given to patient.');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnoses`
--

DROP TABLE IF EXISTS `diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `diagnoses` (
  `diagnosis_id` int(11) NOT NULL AUTO_INCREMENT,
  `diagnosis_name` varchar(90) NOT NULL,
  `diagnosis_description` varchar(200) NOT NULL,
  PRIMARY KEY (`diagnosis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnoses`
--

LOCK TABLES `diagnoses` WRITE;
/*!40000 ALTER TABLE `diagnoses` DISABLE KEYS */;
INSERT INTO `diagnoses` VALUES (1,'Pneumonia ','Infection in one or both of the lungs'),(2,'Diabetes','High blood gluccose'),(3,'Cardiac Dysrhythmias','Abnormal or irregular heart beat'),(4,'Congestive Heart Failure','Heart is not pumping blood well'),(5,'Common Cold or Flu','Cold and flu symptoms'),(6,'Urinary Tract Infections','Infection of urinary system'),(7,'Asthma','Chronic disease of airways of lungs. Inflamed lung airways'),(8,'Infection','Bacterial infection, such as E.Coli and Streptococcus'),(9,'Cancer','Abnormal growth of cells in any part of the body'),(10,'Anorexia Nervosa','An eating disorder that causes extreme weight loss'),(11,'Anxiety Disorder','Mental disorder that affects one\'s daily activities'),(12,'Broken Bone','Bone is broken or fractured in body'),(13,'HIV','Virus that interferes with the body\'s ability to fight infections'),(14,'Surgery','Any surgical procedure on a patient');
/*!40000 ALTER TABLE `diagnoses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `doctors` (
  `doctor_id` int(11) NOT NULL,
  `doc_first_name` varchar(90) NOT NULL,
  `doc_last_name` varchar(90) NOT NULL,
  `specialization_id` int(11) NOT NULL,
  PRIMARY KEY (`doctor_id`),
  KEY `fk_doctors_specializations1_idx` (`specialization_id`),
  CONSTRAINT `fk_doctors_specializations1` FOREIGN KEY (`specialization_id`) REFERENCES `specializations` (`specialization_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES (1,'Colin','Wright',1),(2,'Lola','Hoffman',4),(3,'Henry','Copeland',3),(4,'Ray','Norris',5),(5,'Mark','McGuire',5),(6,'Brittany','Hale',7),(7,'Courtney','Love',5),(8,'Ronald','Allen',6),(9,'Anita','George',1),(10,'Andrea','McCarthy',5),(11,'Ella','Walker',2),(12,'Carole','Vasquez',7),(13,'Drew','Mills',5),(14,'Pat ','Vaughn',3),(15,'Wesley','Harris',2);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_company`
--

DROP TABLE IF EXISTS `insurance_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `insurance_company` (
  `insurance_company_id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_company_name` varchar(90) NOT NULL,
  PRIMARY KEY (`insurance_company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_company`
--

LOCK TABLES `insurance_company` WRITE;
/*!40000 ALTER TABLE `insurance_company` DISABLE KEYS */;
INSERT INTO `insurance_company` VALUES (1,'Aetna'),(2,'Blue Cross Blue Shield'),(3,'HCSC'),(4,'Humana'),(5,'Wellcare'),(6,'Anthem Health'),(7,'Cigna'),(8,'Highmark'),(9,'Kaiser Permanente'),(10,'United Healthcare');
/*!40000 ALTER TABLE `insurance_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_policy`
--

DROP TABLE IF EXISTS `insurance_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `insurance_policy` (
  `insurance_policy_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `insurance_company_id` int(11) NOT NULL,
  `policy_number` int(11) NOT NULL,
  `deductible` int(11) NOT NULL,
  `copay` int(11) NOT NULL,
  PRIMARY KEY (`insurance_policy_id`),
  KEY `fk_insurance_patients_idx` (`patient_id`),
  KEY `fk_insurance_policy_insurance_company1_idx` (`insurance_company_id`),
  CONSTRAINT `fk_insurance_patients` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`),
  CONSTRAINT `fk_insurance_policy_insurance_company1` FOREIGN KEY (`insurance_company_id`) REFERENCES `insurance_company` (`insurance_company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19873 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_policy`
--

LOCK TABLES `insurance_policy` WRITE;
/*!40000 ALTER TABLE `insurance_policy` DISABLE KEYS */;
INSERT INTO `insurance_policy` VALUES (10283,4,3,2014,100,30),(10923,15,9,3098,1500,40),(12987,19,7,1922,1400,50),(12988,8,6,9372,1000,20),(13554,14,3,1723,4000,35),(13941,17,3,1208,6000,25),(14421,16,1,5673,5000,45),(14643,13,4,2872,750,20),(14829,23,9,5283,1000,100),(15292,9,4,2863,1500,60),(15345,11,8,6623,900,20),(16203,2,5,6273,1000,15),(16781,30,4,4562,1000,100),(16783,28,7,1111,1000,20),(16926,20,4,3375,1500,75),(17324,12,2,1011,1000,100),(17372,22,2,1345,5000,75),(17398,27,5,9382,300,15),(17482,24,10,9037,3000,100),(17723,18,5,9933,1200,40),(18203,3,2,2083,5000,50),(18473,26,2,2976,400,25),(18482,6,7,3532,2000,75),(18728,7,9,2987,3000,100),(18734,29,2,1908,250,150),(18782,5,8,7832,1200,45),(19373,21,10,7893,500,50),(19473,25,10,3287,750,75),(19830,1,1,9302,500,25),(19872,10,2,9108,700,30);
/*!40000 ALTER TABLE `insurance_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `pat_first_name` varchar(90) NOT NULL,
  `pat_last_name` varchar(90) NOT NULL,
  `date_of_birth` date NOT NULL,
  `city_of_residence` varchar(45) NOT NULL,
  `diagnosis_id` int(11) NOT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `fk_patients_diagnoses1_idx` (`diagnosis_id`),
  CONSTRAINT `fk_patients_diagnoses1` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnoses` (`diagnosis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Gordon','Park','2001-11-25','Baltimore',1),(2,'Ralph','Mann','2001-09-06','Frederick',8),(3,'Joel','Lawson','1999-11-11','Bethesda',12),(4,'Adam','Huff','1999-01-02','Silver Spring',2),(5,'Cameron','Klein','1996-02-24','Hagerstown',11),(6,'Miles','Tran','1998-10-16','Rockville',7),(7,'Ivan','Mendez','1992-11-24','Gaithersburg',3),(8,'Stewart','Cobb','1991-10-23','Ocean City',10),(9,'John','Norton','1994-07-08','Gaithersburg',8),(10,'Nathaniel ','Frazier','1998-11-06','Laurel',1),(11,'Brittany','Burns','1992-11-10','Ocean City',5),(12,'Marion','Hernandez','2003-08-26','Annapolis',12),(13,'Adrienne','Wright','1994-08-18','Baltimore',3),(14,'Stacy','Turner','1992-03-15','Laurel',4),(15,'Rochelle','Mccormick ','1993-12-16','Bethesda',14),(16,'Constance','Graves','1996-04-17','Hagerstown',13),(17,'Annie','Massey','1990-11-12','Annapolis',14),(18,'Silvia','Medina','1998-07-12','Frederick',8),(19,'Ella','Stewart','1997-02-06','Rockville',6),(20,'Terri','Sandoval','1997-03-16','Silver Spring',2),(21,'Evan','Rogers','1985-05-13','Silver Spring',9),(22,'Dexter','Goodman','1996-04-15','Frederick',2),(23,'Wesley','Chambers','1997-04-03','Baltimore',5),(24,'Fernando','Nash','1998-12-09','Ocean City',8),(25,'Gabriel','Crawford','2000-07-14','Hagerstown',12),(26,'Mabel','Holland','2015-03-14','Laurel ',11),(27,'Billy','Harrington','2001-11-30','College Park',7),(28,'Lois','Lewis','2008-04-24','College Park',10),(29,'Clayton','Mills','2008-12-20','Silver Spring',1),(30,'Susan ','Flores','2013-07-28','Silver Spring',6);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `query_1`
--

DROP TABLE IF EXISTS `query_1`;
/*!50001 DROP VIEW IF EXISTS `query_1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `query_1` AS SELECT 
 1 AS `doctor_full_name`,
 1 AS `patient_full_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_2`
--

DROP TABLE IF EXISTS `query_2`;
/*!50001 DROP VIEW IF EXISTS `query_2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `query_2` AS SELECT 
 1 AS `insurance_company_id`,
 1 AS `insurance_company_name`,
 1 AS `deductible`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_3`
--

DROP TABLE IF EXISTS `query_3`;
/*!50001 DROP VIEW IF EXISTS `query_3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `query_3` AS SELECT 
 1 AS `patient_id`,
 1 AS `patient_name`,
 1 AS `check_in_day`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_4`
--

DROP TABLE IF EXISTS `query_4`;
/*!50001 DROP VIEW IF EXISTS `query_4`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `query_4` AS SELECT 
 1 AS `most_popular_company`,
 1 AS `least_popular_company`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_5`
--

DROP TABLE IF EXISTS `query_5`;
/*!50001 DROP VIEW IF EXISTS `query_5`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `query_5` AS SELECT 
 1 AS `doctor_id`,
 1 AS `doctor_name`,
 1 AS `patient_count`,
 1 AS `area_of_specialization`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_6`
--

DROP TABLE IF EXISTS `query_6`;
/*!50001 DROP VIEW IF EXISTS `query_6`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `query_6` AS SELECT 
 1 AS `patient_id`,
 1 AS `patient_Name`,
 1 AS `insurance_company_name`,
 1 AS `copay`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_7`
--

DROP TABLE IF EXISTS `query_7`;
/*!50001 DROP VIEW IF EXISTS `query_7`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `query_7` AS SELECT 
 1 AS `patient_full_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `query_8`
--

DROP TABLE IF EXISTS `query_8`;
/*!50001 DROP VIEW IF EXISTS `query_8`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `query_8` AS SELECT 
 1 AS `patient_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `floor_number` int(11) NOT NULL,
  `room_number` int(11) NOT NULL,
  `private_room_flag` varchar(1) NOT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,100,'N'),(2,1,101,'N'),(3,1,102,'N'),(4,1,103,'Y'),(5,1,104,'N'),(6,1,105,'N'),(7,1,106,'Y'),(8,1,107,'N'),(9,1,108,'N'),(10,1,109,'N'),(11,2,200,'Y'),(12,2,201,'Y'),(13,2,202,'N'),(14,2,203,'N'),(15,2,204,'N'),(16,2,205,'N'),(17,2,206,'Y'),(18,2,207,'N'),(19,2,208,'N'),(20,2,209,'N');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specializations`
--

DROP TABLE IF EXISTS `specializations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `specializations` (
  `specialization_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_of_specialization` varchar(60) NOT NULL,
  `department_head` varchar(60) NOT NULL,
  PRIMARY KEY (`specialization_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specializations`
--

LOCK TABLES `specializations` WRITE;
/*!40000 ALTER TABLE `specializations` DISABLE KEYS */;
INSERT INTO `specializations` VALUES (1,'Immunology','Josephus Penzak'),(2,'Psychiatry','Hildegard Hutson'),(3,'Surgery','Ozazias Smith'),(4,'Radiology','Baila Niles'),(5,'General','Rashawn Rivers'),(6,'Oncology','Gayle Simen'),(7,'Cardiology','Howie Fulton');
/*!40000 ALTER TABLE `specializations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hospital_db'
--

--
-- Final view structure for view `query_1`
--

/*!50001 DROP VIEW IF EXISTS `query_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_1` AS select concat(`doctors`.`doc_first_name`,' ',`doctors`.`doc_last_name`) AS `doctor_full_name`,concat(`patients`.`pat_first_name`,' ',`patients`.`pat_last_name`) AS `patient_full_name` from ((`appointments` join `doctors` on((`appointments`.`doctor_id` = `doctors`.`doctor_id`))) join `patients` on((`appointments`.`patient_id` = `patients`.`patient_id`))) where ((`doctors`.`doctor_id` = 4) or (`doctors`.`doctor_id` = 11)) order by `doctors`.`doc_last_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_2`
--

/*!50001 DROP VIEW IF EXISTS `query_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_2` AS select `insurance_policy`.`insurance_company_id` AS `insurance_company_id`,`insurance_company`.`insurance_company_name` AS `insurance_company_name`,`insurance_policy`.`deductible` AS `deductible` from (`insurance_policy` join `insurance_company` on((`insurance_policy`.`insurance_company_id` = `insurance_company`.`insurance_company_id`))) where (`insurance_policy`.`deductible` > 1000) group by `insurance_policy`.`insurance_company_id` order by `insurance_policy`.`deductible` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_3`
--

/*!50001 DROP VIEW IF EXISTS `query_3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_3` AS select `appointments`.`patient_id` AS `patient_id`,concat(`patients`.`pat_first_name`,' ',`patients`.`pat_last_name`) AS `patient_name`,date_format(`appointments`.`check_in_time`,'%W') AS `check_in_day` from (`appointments` join `patients` on((`appointments`.`patient_id` = `patients`.`patient_id`))) having `check_in_day` in (select `c`.`check_in_day` from (select `appointments`.`patient_id` AS `patient_id`,concat(`patients`.`pat_first_name`,' ',`patients`.`pat_last_name`) AS `patient_name`,date_format(`appointments`.`check_in_time`,'%W') AS `check_in_day`,count(date_format(`appointments`.`check_in_time`,'%W')) AS `day_count` from (`appointments` join `patients` on((`appointments`.`patient_id` = `patients`.`patient_id`))) group by `check_in_day` having (`day_count` > 4)) `c`) order by `check_in_day` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_4`
--

/*!50001 DROP VIEW IF EXISTS `query_4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_4` AS select (select `t`.`insurance_company_name` AS `most_popular` from (select `insurance_company`.`insurance_company_name` AS `insurance_company_name`,count(`insurance_company`.`insurance_company_name`) AS `company_count` from (`insurance_policy` join `insurance_company` on((`insurance_policy`.`insurance_company_id` = `insurance_company`.`insurance_company_id`))) group by `insurance_company`.`insurance_company_name` having (`company_count` = (select max(`s`.`company_count`) from (select `insurance_company`.`insurance_company_name` AS `insurance_company_name`,count(`insurance_company`.`insurance_company_name`) AS `company_count` from (`insurance_policy` join `insurance_company` on((`insurance_policy`.`insurance_company_id` = `insurance_company`.`insurance_company_id`))) group by `insurance_company`.`insurance_company_name`) `s`))) `t`) AS `most_popular_company`,(select `b`.`insurance_company_name` AS `least_popular` from (select `insurance_company`.`insurance_company_name` AS `insurance_company_name`,count(`insurance_company`.`insurance_company_name`) AS `company_count` from (`insurance_policy` join `insurance_company` on((`insurance_policy`.`insurance_company_id` = `insurance_company`.`insurance_company_id`))) group by `insurance_company`.`insurance_company_name` having (`company_count` = (select min(`a`.`company_count`) from (select `insurance_company`.`insurance_company_name` AS `insurance_company_name`,count(`insurance_company`.`insurance_company_name`) AS `company_count` from (`insurance_policy` join `insurance_company` on((`insurance_policy`.`insurance_company_id` = `insurance_company`.`insurance_company_id`))) group by `insurance_company`.`insurance_company_name`) `a`))) `b`) AS `least_popular_company` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_5`
--

/*!50001 DROP VIEW IF EXISTS `query_5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_5` AS select `appointments`.`doctor_id` AS `doctor_id`,concat(`doctors`.`doc_first_name`,' ',`doctors`.`doc_last_name`) AS `doctor_name`,count(concat(`doctors`.`doc_first_name`,' ',`doctors`.`doc_last_name`)) AS `patient_count`,`specializations`.`area_of_specialization` AS `area_of_specialization` from ((`appointments` join `doctors` on((`doctors`.`doctor_id` = `appointments`.`doctor_id`))) join `specializations` on((`doctors`.`specialization_id` = `specializations`.`specialization_id`))) group by `doctor_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_6`
--

/*!50001 DROP VIEW IF EXISTS `query_6`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_6` AS select `p`.`patient_id` AS `patient_id`,concat(`p`.`pat_first_name`,' ',`p`.`pat_last_name`) AS `patient_Name`,`ic`.`insurance_company_name` AS `insurance_company_name`,`ip`.`copay` AS `copay` from ((`patients` `p` join `insurance_policy` `ip` on((`p`.`patient_id` = `ip`.`patient_id`))) join `insurance_company` `ic` on((`ip`.`insurance_company_id` = `ic`.`insurance_company_id`))) where (`ip`.`copay` >= 100) order by `ip`.`copay` desc,concat(`p`.`pat_first_name`,' ',`p`.`pat_last_name`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_7`
--

/*!50001 DROP VIEW IF EXISTS `query_7`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_7` AS select concat(`patients`.`pat_first_name`,' ',`patients`.`pat_last_name`) AS `patient_full_name` from (`patients` join `insurance_policy` on((`patients`.`patient_id` = `insurance_policy`.`patient_id`))) where (`insurance_policy`.`copay` = '50') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `query_8`
--

/*!50001 DROP VIEW IF EXISTS `query_8`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `query_8` AS select concat(`patients`.`pat_first_name`,' ',`patients`.`pat_last_name`) AS `patient_name` from ((`patients` join `appointments` on((`patients`.`patient_id` = `appointments`.`patient_id`))) join `doctors` on((`appointments`.`doctor_id` = `doctors`.`doctor_id`))) where (`doctors`.`specialization_id` = 5) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-13 19:33:14
