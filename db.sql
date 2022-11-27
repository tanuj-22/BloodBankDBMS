-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (arm64)
--
-- Host: localhost    Database: bloodbankdbver1
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminID` int NOT NULL,
  `userID` varchar(30) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  PRIMARY KEY (`adminID`),
  KEY `userID` (`userID`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (123,'pqr','jkk','uuhj');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_donate`
--

DROP TABLE IF EXISTS `blood_donate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_donate` (
  `donationID` int NOT NULL AUTO_INCREMENT,
  `donorID` int NOT NULL,
  `unit` int DEFAULT NULL,
  `date_of_donation` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`donationID`),
  KEY `donorID` (`donorID`),
  CONSTRAINT `blood_donate_ibfk_1` FOREIGN KEY (`donorID`) REFERENCES `donor` (`donorID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_donate`
--

LOCK TABLES `blood_donate` WRITE;
/*!40000 ALTER TABLE `blood_donate` DISABLE KEYS */;
INSERT INTO `blood_donate` VALUES (1,10,5,'2021-09-09','approved'),(2,10,5,'2021-09-09','approved'),(3,10,9,'2021-09-09','rejected'),(4,10,3,'2021-09-24','approved'),(5,10,5,'2021-09-24','approved'),(10,12,20,'2021-11-12','approved'),(11,12,62,'2021-11-12','approved'),(12,12,5,'2021-11-12','approved'),(13,12,52,'2021-11-12','pending'),(14,13,25,'2021-11-23','approved'),(15,14,34,'2022-04-29','approved');
/*!40000 ALTER TABLE `blood_donate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloodrequest`
--

DROP TABLE IF EXISTS `bloodrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloodrequest` (
  `requestID` int NOT NULL AUTO_INCREMENT,
  `patientID` int NOT NULL,
  `unit` int NOT NULL,
  `reason` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL,
  `doctor` varchar(30) DEFAULT NULL,
  `date_of_request` date NOT NULL,
  PRIMARY KEY (`requestID`),
  KEY `patientID` (`patientID`),
  CONSTRAINT `bloodrequest_ibfk_1` FOREIGN KEY (`patientID`) REFERENCES `patient` (`patientID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloodrequest`
--

LOCK TABLES `bloodrequest` WRITE;
/*!40000 ALTER TABLE `bloodrequest` DISABLE KEYS */;
INSERT INTO `bloodrequest` VALUES (1,1,8,'reas','approved','doc','2021-03-21'),(2,2,8,'reas','rejected','do1','2021-03-21'),(5,7,8,'reas','rejected','doc4','2021-03-21'),(6,7,5,'fever','approved','dr.','2021-09-24'),(7,2,10,'test','approved','HC Verma','2021-11-12'),(8,2,110,'test2','approved','safas','2021-11-12'),(9,8,10,'accident','rejected','abc','2021-11-23');
/*!40000 ALTER TABLE `bloodrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `donorID` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(30) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `mobile_no` varchar(14) DEFAULT NULL,
  `blood_group` varchar(3) DEFAULT NULL,
  `Aadhar_no` varchar(13) DEFAULT NULL,
  `disease` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`donorID`),
  KEY `userID` (`userID`),
  CONSTRAINT `donor_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (10,'zty11','utlmn','hhbc','F',25,'fghytnji','123456678','O+','4567899123','NA'),(11,'111zty','utlmn','hhbc','F',25,'fghytnji','123456678','O+','4567899123','NA'),(12,'tj','test','test','M',22,'asdsada','548648946','O+','566388576153','sdadasd'),(13,'tanujpdonor@gmail.com','pancholi','tanuj','M',25,'Plot no.9 opposi','85556565656','AB+','566388576153','NA'),(14,'danish20','Kaneria','Danish','M',24,'abc','2312123431','AB+','639827461837',''),(15,'tj229','pancholi','tanuj','M',22,'tfjy','327648732','AB-','123456789023','');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patientID` int NOT NULL AUTO_INCREMENT,
  `userID` varchar(30) NOT NULL,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `mobile_no` varchar(14) DEFAULT NULL,
  `blood_group` varchar(3) DEFAULT NULL,
  `Aadhar_no` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`patientID`),
  KEY `userID` (`userID`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `usertable` (`userID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'abc','fh','fh','F',25,'fghytnji','123456678','O+','45674459123'),(2,'tjp','Pancholi','Tanuj','M',22,'Plot no.9 opposi','8855922769','O+','566388576153'),(6,'zty','utlmn','hhbc','F',25,'fghytnji','123456678','O+','4567899123'),(7,'zxsdaty','utlmn','hhbc','F',25,'fghytnji','123456678','AB+','4567899123'),(8,'aryanp@gmail.com','patil','aryan','M',20,'xyz','2331231','B-','566388576153');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `blood_group` varchar(3) NOT NULL,
  `blood_unit` int DEFAULT NULL,
  PRIMARY KEY (`blood_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
INSERT INTO `stock` VALUES ('A-',100),('A+',1),('AB-',2),('AB+',64),('B-',5),('B+',10),('O-',6),('O+',87);
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertable`
--

DROP TABLE IF EXISTS `usertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertable` (
  `userID` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role_of_user` varchar(20) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertable`
--

LOCK TABLES `usertable` WRITE;
/*!40000 ALTER TABLE `usertable` DISABLE KEYS */;
INSERT INTO `usertable` VALUES ('111zty','123','donor'),('abc','145632','patient'),('aryanp@gmail.com','Test1234','patient'),('danish20','Test1234','donor'),('pqr','145556','admin'),('tanujpdonor@gmail.com','Test1234','donor'),('tj','Test1234','donor'),('tj229','Test1234','donor'),('tjp','Test1234','patient'),('zty','123','patient'),('zty11','123','donor'),('zxsdaty','123','patient');
/*!40000 ALTER TABLE `usertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bloodbankdbver1'
--
/*!50003 DROP PROCEDURE IF EXISTS `approveDonation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `approveDonation`(IN `donor_id` INT, IN `unitVal` INT, IN `donation_id` INT)
BEGIN
DECLARE currentStockVal int;
SELECT blood_unit into currentStockVal from stock where blood_group = (SELECT blood_group from donor where donorID = donor_id);
UPDATE blood_donate set status = "approved" WHERE donationID = donation_id;
UPDATE stock set blood_unit = (currentStockVal + unitVal) where blood_group = (SELECT blood_group from donor where donorID = donor_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `approveRequest` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `approveRequest`(IN `patient_id` INT, IN `unitVal` INT, IN `request_ID` INT)
BEGIN
DECLARE currentStockVal int;
DECLARE statusmsg int;
SELECT blood_unit into currentStockVal from stock where blood_group = (SELECT blood_group from patient where patientID = patient_id);
if currentStockVal >= unitVal THEN
	UPDATE bloodrequest set status = "approved" WHERE requestID = request_ID;
	UPDATE stock set blood_unit = (currentStockVal - unitVal) where blood_group = (SELECT blood_group from patient where patientID = patient_id);
    set statusmsg = 201;
else 
	set statusmsg = 409;
end if;
	SELECT statusmsg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `check_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `check_user`(IN `user_ID` VARCHAR(30), IN `password_input` VARCHAR(20), OUT `status_code` INT)
BEGIN
DECLARE useridvar varchar(30);
DECLARE pwrdvar varchar(20);
	SELECT userID,password into useridvar,pwrdvar from usertable WHERE userID = user_ID;
     if useridvar IS NULL then
    set status_code = 404;
    elseif pwrdvar != password_input THEN
    set status_code = 401;
    ELSE
    set status_code = 201;
   	end if;
   SELECT status_code; 
   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDonorStats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getDonorStats`(IN `donor_id` INT)
begin 
DECLARE pendingReqCount int;
DECLARE reqCount int;
DECLARE approvedReqCount int;
DECLARE rejectedReqCount int;
SELECT count(donationID) into reqCount from blood_donate where donorID = donor_id;
SELECT count(donationID) into pendingReqCount from blood_donate where donorID = donor_id and status = 'pending';
SELECT count(donationID) into approvedReqCount from blood_donate where donorID = donor_id and status = 'approved';
SELECT count(donationID) into rejectedReqCount from blood_donate where donorID = donor_id and status = 'rejected';
SELECT reqCount,pendingReqCount,approvedReqCount,rejectedReqCount;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPatientStats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPatientStats`(IN `patient_id` INT)
begin 
DECLARE pendingReqCount int;
DECLARE reqCount int;
DECLARE approvedReqCount int;
DECLARE rejectedReqCount int;
SELECT count(requestID) into reqCount from bloodrequest where patientID = patient_id;
SELECT count(requestID) into pendingReqCount from bloodrequest where patientID = patient_id and status = 'pending';
SELECT count(requestID) into approvedReqCount from bloodrequest where patientID = patient_id and status = 'approved';
SELECT count(requestID) into rejectedReqCount from bloodrequest where patientID = patient_id and status = 'rejected';
SELECT reqCount,pendingReqCount,approvedReqCount,rejectedReqCount;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getStats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getStats`()
BEGIN
DECLARE donorCount int;
DECLARE requestCount int;
DECLARE approvedReq int;
DECLARE totalUnit int;
SELECT COUNT(donorID) into donorCount from donor;
SELECT COUNT(date_of_request) into requestCount from bloodrequest;
SELECT COUNT(date_of_request)into approvedReq from bloodrequest WHERE status='Approved';
SELECT SUM(blood_unit)into totalUnit from stock;

SELECT donorCount,requestCount,approvedReq,totalUnit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_patientrequest_history` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_patientrequest_history`()
begin
    select br.patientID,p.fname,p.lname,p.age,p.blood_group,br.unit,br.reason,br.doctor,date_of_request,br.status
	from patient as p
    inner join bloodrequest as br
    using (patientID)
    where status !='pending';
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user`(IN `user_ID` VARCHAR(30), OUT `role` VARCHAR(20), OUT `ID` INT)
BEGIN
     declare role_id int;
     select role_of_user into role from usertable where userID=user_ID ;     
     if role ='admin' then 
		select adminID into ID from Admin where userID=user_ID;
	 elseif role='donor' then 
		select donorID into ID from donor where userID=user_ID;
	 elseif role='patient' then 
		select patientID into ID from patient where userID=user_ID;
    end if;
    SELECT role,ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_into_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_into_table`(IN `userid` VARCHAR(30), IN `firstname` VARCHAR(20), IN `lastname` VARCHAR(20), IN `phone` VARCHAR(14), IN `password1` VARCHAR(20), IN `age1` INT, IN `gender1` VARCHAR(2), IN `primaryAddress` VARCHAR(40), IN `blood_group` VARCHAR(3), IN `Aadhar_no1` VARCHAR(13), IN `disease1` VARCHAR(25), IN `role` VARCHAR(20))
begin
 insert into usertable values(userid,password1,role);
 if role ='donor' then 
	insert into donor (userID,lname,fname,gender,age,address,mobile_no,blood_group,Aadhar_no,disease )values(userid,firstname,lastname,gender1,age1,primaryAddress,phone,blood_group,Aadhar_no1,disease1);
 elseif role ='patient' then 
 	insert into patient (userID,lname,fname,gender,age,address,mobile_no,blood_group,Aadhar_no)values(userid,firstname,lastname,gender1,age1,primaryAddress,phone,blood_group,Aadhar_no1);
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `request_for_blood` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `request_for_blood`(`patientid` INT, `unit1` INT, `reason1` VARCHAR(30), `doctor1` VARCHAR(30))
begin
    insert into bloodrequest (patientID,unit,reason,status,doctor,date_of_request) values (patientid,unit1,reason1,'pending',doctor1,curdate());
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `request_for_donation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `request_for_donation`(`donorid` INT, `unit1` INT)
begin
    insert into blood_donate (donorID,unit,date_of_donation,status) values (donorid,unit1,curdate(),'pending');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-27 11:35:47
