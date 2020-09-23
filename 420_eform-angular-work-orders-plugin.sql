-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: 420_eform-angular-work-orders-plugin
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `__efmigrationshistory`
--

DROP TABLE IF EXISTS `__efmigrationshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__efmigrationshistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__efmigrationshistory`
--

LOCK TABLES `__efmigrationshistory` WRITE;
/*!40000 ALTER TABLE `__efmigrationshistory` DISABLE KEYS */;
INSERT INTO `__efmigrationshistory` VALUES ('20200916141603_Init','3.1.8');
/*!40000 ALTER TABLE `__efmigrationshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignedsites`
--

DROP TABLE IF EXISTS `assignedsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignedsites` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `SiteId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AssignedSites_SiteId` (`SiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignedsites`
--

LOCK TABLES `assignedsites` WRITE;
/*!40000 ALTER TABLE `assignedsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignedsites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assignedsiteversions`
--

DROP TABLE IF EXISTS `assignedsiteversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignedsiteversions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `SiteId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AssignedSiteVersions_SiteId` (`SiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assignedsiteversions`
--

LOCK TABLES `assignedsiteversions` WRITE;
/*!40000 ALTER TABLE `assignedsiteversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assignedsiteversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picturesoftaskdone`
--

DROP TABLE IF EXISTS `picturesoftaskdone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `picturesoftaskdone` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `FileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `WorkOrderId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_PicturesOfTaskDone_FileName` (`FileName`),
  KEY `IX_PicturesOfTaskDone_WorkOrderId` (`WorkOrderId`),
  CONSTRAINT `FK_PicturesOfTaskDone_WorkOrders_WorkOrderId` FOREIGN KEY (`WorkOrderId`) REFERENCES `workorders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picturesoftaskdone`
--

LOCK TABLES `picturesoftaskdone` WRITE;
/*!40000 ALTER TABLE `picturesoftaskdone` DISABLE KEYS */;
/*!40000 ALTER TABLE `picturesoftaskdone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picturesoftasks`
--

DROP TABLE IF EXISTS `picturesoftasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `picturesoftasks` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `FileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `WorkOrderId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_PicturesOfTasks_FileName` (`FileName`),
  KEY `IX_PicturesOfTasks_WorkOrderId` (`WorkOrderId`),
  CONSTRAINT `FK_PicturesOfTasks_WorkOrders_WorkOrderId` FOREIGN KEY (`WorkOrderId`) REFERENCES `workorders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picturesoftasks`
--

LOCK TABLES `picturesoftasks` WRITE;
/*!40000 ALTER TABLE `picturesoftasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `picturesoftasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pluginconfigurationvalues`
--

DROP TABLE IF EXISTS `pluginconfigurationvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pluginconfigurationvalues` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pluginconfigurationvalues`
--

LOCK TABLES `pluginconfigurationvalues` WRITE;
/*!40000 ALTER TABLE `pluginconfigurationvalues` DISABLE KEYS */;
INSERT INTO `pluginconfigurationvalues` VALUES (1,'2020-09-23 09:31:15.933797','2020-09-23 09:31:15.933893','created',1,0,1,'WorkOrdersBaseSettings:LogLevel','4'),(2,'2020-09-23 09:31:15.947254','2020-09-23 09:31:16.421590','created',1,1,2,'WorkOrdersBaseSettings:NewTaskId','1'),(3,'2020-09-23 09:31:15.951586','2020-09-23 09:31:16.983321','created',1,1,2,'WorkOrdersBaseSettings:TaskListId','3'),(4,'2020-09-23 09:31:15.956650','2020-09-23 09:31:15.956650','created',1,0,1,'WorkOrdersBaseSettings:LogLimit','25000'),(5,'2020-09-23 09:31:15.960782','2020-09-23 09:31:15.960782','created',1,0,1,'WorkOrdersBaseSettings:SdkConnectionString','...'),(6,'2020-09-23 09:31:15.965009','2020-09-23 09:31:15.965009','created',1,0,1,'WorkOrdersBaseSettings:MaxParallelism','1'),(7,'2020-09-23 09:31:15.968796','2020-09-23 09:31:15.968796','created',1,0,1,'WorkOrdersBaseSettings:NumberOfWorkers','1'),(8,'2020-09-23 09:31:15.972383','2020-09-23 09:31:15.972383','created',1,0,1,'WorkOrdersBaseSettings:FolderId','0');
/*!40000 ALTER TABLE `pluginconfigurationvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pluginconfigurationvalueversions`
--

DROP TABLE IF EXISTS `pluginconfigurationvalueversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pluginconfigurationvalueversions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pluginconfigurationvalueversions`
--

LOCK TABLES `pluginconfigurationvalueversions` WRITE;
/*!40000 ALTER TABLE `pluginconfigurationvalueversions` DISABLE KEYS */;
INSERT INTO `pluginconfigurationvalueversions` VALUES (1,'2020-09-23 09:31:16.411177','2020-09-23 09:31:16.411177','created',1,1,1,'WorkOrdersBaseSettings:NewTaskId','0'),(2,'2020-09-23 09:31:16.983225','2020-09-23 09:31:16.983225','created',1,1,1,'WorkOrdersBaseSettings:TaskListId','0');
/*!40000 ALTER TABLE `pluginconfigurationvalueversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugingrouppermissions`
--

DROP TABLE IF EXISTS `plugingrouppermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugingrouppermissions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `GroupId` int NOT NULL,
  `PermissionId` int NOT NULL,
  `IsEnabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_PluginGroupPermissions_PermissionId` (`PermissionId`),
  CONSTRAINT `FK_PluginGroupPermissions_PluginPermissions_PermissionId` FOREIGN KEY (`PermissionId`) REFERENCES `pluginpermissions` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugingrouppermissions`
--

LOCK TABLES `plugingrouppermissions` WRITE;
/*!40000 ALTER TABLE `plugingrouppermissions` DISABLE KEYS */;
INSERT INTO `plugingrouppermissions` VALUES (1,'2020-09-23 09:31:16.015310','2020-09-23 09:31:16.015311','created',0,0,1,1,1,1);
/*!40000 ALTER TABLE `plugingrouppermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugingrouppermissionversions`
--

DROP TABLE IF EXISTS `plugingrouppermissionversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugingrouppermissionversions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `GroupId` int NOT NULL,
  `PermissionId` int NOT NULL,
  `IsEnabled` tinyint(1) NOT NULL,
  `PluginGroupPermissionId` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugingrouppermissionversions`
--

LOCK TABLES `plugingrouppermissionversions` WRITE;
/*!40000 ALTER TABLE `plugingrouppermissionversions` DISABLE KEYS */;
INSERT INTO `plugingrouppermissionversions` VALUES (1,'2020-09-23 09:31:16.015310','2020-09-23 09:31:16.015311','created',0,0,1,1,1,1,1);
/*!40000 ALTER TABLE `plugingrouppermissionversions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pluginpermissions`
--

DROP TABLE IF EXISTS `pluginpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pluginpermissions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `PermissionName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `ClaimName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pluginpermissions`
--

LOCK TABLES `pluginpermissions` WRITE;
/*!40000 ALTER TABLE `pluginpermissions` DISABLE KEYS */;
INSERT INTO `pluginpermissions` VALUES (1,'2020-09-23 09:31:15.981114',NULL,'created',1,0,1,'Access WorkOrder Plugin','work_orders_plugin_access');
/*!40000 ALTER TABLE `pluginpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workorders`
--

DROP TABLE IF EXISTS `workorders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workorders` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CorrectedAtLatest` datetime(6) NOT NULL,
  `DoneAt` datetime(6) NOT NULL,
  `DoneBySiteId` int NOT NULL,
  `DescriptionOfTaskDone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workorders`
--

LOCK TABLES `workorders` WRITE;
/*!40000 ALTER TABLE `workorders` DISABLE KEYS */;
INSERT INTO `workorders` VALUES (1,'2020-09-21 10:16:16.172400','2020-09-21 10:16:16.172400','created',13238,13238,1,'sas','2020-09-22 13:24:16.000000','2020-09-23 13:24:23.000000',13220,'hhhhh'),(2,'2020-09-22 10:16:16.172408','2020-09-22 10:16:16.172408','created',13220,13220,1,'zzzzzz','2020-09-24 10:16:16.172408','2020-09-24 10:16:16.172408',13238,'asddas');
/*!40000 ALTER TABLE `workorders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workorderstemplatecases`
--

DROP TABLE IF EXISTS `workorderstemplatecases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workorderstemplatecases` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `CaseId` int NOT NULL,
  `CaseUId` int NOT NULL,
  `CheckId` int NOT NULL,
  `CheckUId` int NOT NULL,
  `WorkOrderId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_WorkOrdersTemplateCases_WorkOrderId` (`WorkOrderId`),
  CONSTRAINT `FK_WorkOrdersTemplateCases_WorkOrders_WorkOrderId` FOREIGN KEY (`WorkOrderId`) REFERENCES `workorders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workorderstemplatecases`
--

LOCK TABLES `workorderstemplatecases` WRITE;
/*!40000 ALTER TABLE `workorderstemplatecases` DISABLE KEYS */;
/*!40000 ALTER TABLE `workorderstemplatecases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workorderversions`
--

DROP TABLE IF EXISTS `workorderversions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workorderversions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `CorrectedAtLatest` datetime(6) NOT NULL,
  `DoneAt` datetime(6) NOT NULL,
  `DoneBySiteId` int NOT NULL,
  `DescriptionOfTaskDone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `WorkOrderId` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workorderversions`
--

LOCK TABLES `workorderversions` WRITE;
/*!40000 ALTER TABLE `workorderversions` DISABLE KEYS */;
/*!40000 ALTER TABLE `workorderversions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-23 12:40:48
