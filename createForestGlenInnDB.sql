CREATE DATABASE  IF NOT EXISTS `ForestGlenInn_A4` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ForestGlenInn_A4`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: ForestGlenInn
-- ------------------------------------------------------
-- Server version	5.7.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cancellations`
--

DROP TABLE IF EXISTS `cancellations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancellations` (
  `cancellation_id` int(11) NOT NULL AUTO_INCREMENT,
  `guest_id` int(11) NOT NULL,
  `orig_check_in_date` datetime NOT NULL,
  `orig_check_out_date` datetime NOT NULL,
  `cancellation_date` datetime NOT NULL,
  `cancellation_fee` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`cancellation_id`),
  KEY `fk_cancellations_guests1_idx` (`guest_id`),
  CONSTRAINT `fk_cancellations_guests1` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guests` (
  `guest_id` int(11) NOT NULL AUTO_INCREMENT,
  `last_name` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `VIP_status` char(10) DEFAULT NULL,
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Inserting data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (1,'Potter','Harry',NULL),(2,'Granger','Hermoine',NULL),(3,'Weasley','Ron',NULL),(4,'Baggins','Frodo',NULL),(5,'Gamgee','Sam',NULL),(6,'Katniss','Everdeen',NULL);
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL AUTO_INCREMENT,
  `guest_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `check_in_date` datetime NOT NULL,
  `check_out_date` datetime NOT NULL,
  PRIMARY KEY (`reservation_id`),
  KEY `fk_guests_has_rooms_rooms1_idx` (`room_id`),
  KEY `fk_guests_has_rooms_guests1_idx` (`guest_id`),
  CONSTRAINT `fk_guests_has_rooms_guests1` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_guests_has_rooms_rooms1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Inserting data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
INSERT INTO `reservations` VALUES 
(1,1,5,'2019-05-01 00:00:00','2019-05-08 00:00:00'),
(2,1,4,'2019-05-10 00:00:00','2019-05-13 00:00:00'),
(3,2,3,'2019-05-20 00:00:00','2019-05-27 00:00:00'),
(4,3,3,'2019-06-01 00:00:00','2019-06-08 00:00:00'),
(5,4,1,'2019-04-18 00:00:00','2019-04-20 00:00:00'),
(6,5,2,'2019-04-20 00:00:00','2019-04-22 00:00:00'),
(7,6,3,'2019-04-26 00:00:00','2019-04-30 00:00:00');
/* These inserts were from Fall 2018 - reuse for future fall semesters but change year!
INSERT INTO `reservations` VALUES (1,1,5,'2018-11-21 00:00:00','2018-11-25 00:00:00'),(2,1,4,'2018-12-25 00:00:00','2018-12-31 00:00:00'),(3,2,3,'2018-11-15 00:00:00','2018-11-20 00:00:00'),(4,3,3,'2018-11-01 00:00:00','2018-11-17 00:00:00'),(5,4,1,'2018-11-02 00:00:00','2018-11-04 00:00:00'),(6,5,2,'2018-11-06 00:00:00','2018-11-08 00:00:00'),(7,6,3,'2018-11-10 00:00:00','2018-11-12 00:00:00');
*/
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_types`
--

DROP TABLE IF EXISTS `room_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `room_types` (
  `room_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_type_code` char(10) NOT NULL,
  `room_type_name` varchar(45) NOT NULL,
  `room_type_desc` varchar(200) DEFAULT NULL,
  `base_price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`room_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Inserting data for table `room_types`
--

LOCK TABLES `room_types` WRITE;
/*!40000 ALTER TABLE `room_types` DISABLE KEYS */;
INSERT INTO `room_types` VALUES (1,'single','Single bed','Tiny room with one twin bed',100.00),(2,'double','Double bed','Room with one double bed',125.00),(3,'queen','Two Queens','Decent room with two queen sized beds',150.00),(4,'king','King bed','Large room with a king sized bed',200.00),(5,'suite','Suite','One king bed plus sitting area with pull out couch and a mini-kitchen',250.00);
/*!40000 ALTER TABLE `room_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_number` varchar(45) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `fk_rooms_room_types_idx` (`room_type_id`),
  CONSTRAINT `fk_rooms_room_types` FOREIGN KEY (`room_type_id`) REFERENCES `room_types` (`room_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Inserting data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,'101',2),(2,'102',2),(3,'201',3),(4,'202',4),(5,'301',5);
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `viewcancellations`
--

DROP TABLE IF EXISTS `viewcancellations`;
/*!50001 DROP VIEW IF EXISTS `viewcancellations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `viewcancellations` AS SELECT 
 1 AS `last_name`,
 1 AS `first_name`,
 1 AS `cancellation_date`,
 1 AS `orig_check_in_date`,
 1 AS `orig_check_out_date`,
 1 AS `cancellation_fee`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `viewreservations`
--

DROP TABLE IF EXISTS `viewreservations`;
/*!50001 DROP VIEW IF EXISTS `viewreservations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `viewreservations` AS SELECT 
 1 AS `reservation_id`,
 1 AS `last_name`,
 1 AS `first_name`,
 1 AS `room_number`,
 1 AS `check_in_date`,
 1 AS `check_out_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Creating routines for database 'ForestGlenInn'
--
/*!50003 DROP FUNCTION IF EXISTS `CalcFee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalcFee`(
    check_in_date_param DATETIME
) RETURNS int(11)
BEGIN
  DECLARE num_days_before_check_in INT;
  DECLARE fee_var INT;
  
  SET fee_var = 0;
  
  SELECT DATEDIFF(check_in_date_param, sysdate())
  INTO num_days_before_check_in;
  
  IF num_days_before_check_in < 1 THEN
	SET fee_var = 50;
  ELSEIF num_days_before_check_in < 7 THEN
	SET fee_var = 25;
  ELSEIF num_days_before_check_in < 30 THEN
	SET fee_var = 10;
  END IF;
  
  RETURN(fee_var);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `viewcancellations`
--

/*!50001 DROP VIEW IF EXISTS `viewcancellations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewcancellations` AS select `guests`.`last_name` AS `last_name`,`guests`.`first_name` AS `first_name`,date_format(`cancellations`.`cancellation_date`,'%Y-%m-%d') AS `cancellation_date`,date_format(`cancellations`.`orig_check_in_date`,'%Y-%m-%d') AS `orig_check_in_date`,date_format(`cancellations`.`orig_check_out_date`,'%Y-%m-%d') AS `orig_check_out_date`,`cancellations`.`cancellation_fee` AS `cancellation_fee` from (`cancellations` join `guests` on((`cancellations`.`guest_id` = `guests`.`guest_id`))) order by date_format(`cancellations`.`cancellation_date`,'%Y-%m-%d') desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewreservations`
--

/*!50001 DROP VIEW IF EXISTS `viewreservations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewreservations` AS select `reservations`.`reservation_id` AS `reservation_id`,`guests`.`last_name` AS `last_name`,`guests`.`first_name` AS `first_name`,`rooms`.`room_number` AS `room_number`,date_format(`reservations`.`check_in_date`,'%Y-%m-%d') AS `check_in_date`,date_format(`reservations`.`check_out_date`,'%Y-%m-%d') AS `check_out_date` from ((`reservations` join `guests` on((`reservations`.`guest_id` = `guests`.`guest_id`))) join `rooms` on((`reservations`.`room_id` = `rooms`.`room_id`))) order by date_format(`reservations`.`check_in_date`,'%Y-%m-%d') */;
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

-- Dump completed on 2018-04-07  8:58:16
