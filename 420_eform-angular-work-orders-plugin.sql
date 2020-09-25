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
-- Table structure for table `__EFMigrationsHistory`
--

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__EFMigrationsHistory`
--

LOCK TABLES `__EFMigrationsHistory` WRITE;
/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory` VALUES ('20200916141603_Init','3.1.8');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssignedSites`
--

DROP TABLE IF EXISTS `AssignedSites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AssignedSites` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `SiteId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AssignedSites_SiteId` (`SiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssignedSites`
--

LOCK TABLES `AssignedSites` WRITE;
/*!40000 ALTER TABLE `AssignedSites` DISABLE KEYS */;
/*!40000 ALTER TABLE `AssignedSites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssignedSiteVersions`
--

DROP TABLE IF EXISTS `AssignedSiteVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AssignedSiteVersions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `SiteId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_AssignedSiteVersions_SiteId` (`SiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssignedSiteVersions`
--

LOCK TABLES `AssignedSiteVersions` WRITE;
/*!40000 ALTER TABLE `AssignedSiteVersions` DISABLE KEYS */;
/*!40000 ALTER TABLE `AssignedSiteVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PicturesOfTaskDone`
--

DROP TABLE IF EXISTS `PicturesOfTaskDone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PicturesOfTaskDone` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `FileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WorkOrderId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_PicturesOfTaskDone_FileName` (`FileName`),
  KEY `IX_PicturesOfTaskDone_WorkOrderId` (`WorkOrderId`),
  CONSTRAINT `FK_PicturesOfTaskDone_WorkOrders_WorkOrderId` FOREIGN KEY (`WorkOrderId`) REFERENCES `WorkOrders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PicturesOfTaskDone`
--

LOCK TABLES `PicturesOfTaskDone` WRITE;
/*!40000 ALTER TABLE `PicturesOfTaskDone` DISABLE KEYS */;
/*!40000 ALTER TABLE `PicturesOfTaskDone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PicturesOfTasks`
--

DROP TABLE IF EXISTS `PicturesOfTasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PicturesOfTasks` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `FileName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `WorkOrderId` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_PicturesOfTasks_FileName` (`FileName`),
  KEY `IX_PicturesOfTasks_WorkOrderId` (`WorkOrderId`),
  CONSTRAINT `FK_PicturesOfTasks_WorkOrders_WorkOrderId` FOREIGN KEY (`WorkOrderId`) REFERENCES `WorkOrders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PicturesOfTasks`
--

LOCK TABLES `PicturesOfTasks` WRITE;
/*!40000 ALTER TABLE `PicturesOfTasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `PicturesOfTasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PluginConfigurationValues`
--

DROP TABLE IF EXISTS `PluginConfigurationValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PluginConfigurationValues` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PluginConfigurationValues`
--

LOCK TABLES `PluginConfigurationValues` WRITE;
/*!40000 ALTER TABLE `PluginConfigurationValues` DISABLE KEYS */;
INSERT INTO `PluginConfigurationValues` VALUES (1,'2020-09-23 09:31:15.933797','2020-09-23 09:31:15.933893','created',1,0,1,'WorkOrdersBaseSettings:LogLevel','4'),(2,'2020-09-23 09:31:15.947254','2020-09-23 09:31:16.421590','created',1,1,2,'WorkOrdersBaseSettings:NewTaskId','0'),(3,'2020-09-23 09:31:15.951586','2020-09-23 09:31:16.983321','created',1,1,2,'WorkOrdersBaseSettings:TaskListId','0'),(4,'2020-09-23 09:31:15.956650','2020-09-23 09:31:15.956650','created',1,0,1,'WorkOrdersBaseSettings:LogLimit','25000'),(5,'2020-09-23 09:31:15.960782','2020-09-23 09:31:15.960782','created',1,0,1,'WorkOrdersBaseSettings:SdkConnectionString','...'),(6,'2020-09-23 09:31:15.965009','2020-09-23 09:31:15.965009','created',1,0,1,'WorkOrdersBaseSettings:MaxParallelism','1'),(7,'2020-09-23 09:31:15.968796','2020-09-23 09:31:15.968796','created',1,0,1,'WorkOrdersBaseSettings:NumberOfWorkers','1'),(8,'2020-09-23 09:31:15.972383','2020-09-23 09:31:15.972383','created',1,0,1,'WorkOrdersBaseSettings:FolderId','0');
/*!40000 ALTER TABLE `PluginConfigurationValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PluginConfigurationValueVersions`
--

DROP TABLE IF EXISTS `PluginConfigurationValueVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PluginConfigurationValueVersions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `Name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `Value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PluginConfigurationValueVersions`
--

LOCK TABLES `PluginConfigurationValueVersions` WRITE;
/*!40000 ALTER TABLE `PluginConfigurationValueVersions` DISABLE KEYS */;
INSERT INTO `PluginConfigurationValueVersions` VALUES (1,'2020-09-23 09:31:16.411177','2020-09-23 09:31:16.411177','created',1,1,1,'WorkOrdersBaseSettings:NewTaskId','0'),(2,'2020-09-23 09:31:16.983225','2020-09-23 09:31:16.983225','created',1,1,1,'WorkOrdersBaseSettings:TaskListId','0');
/*!40000 ALTER TABLE `PluginConfigurationValueVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PluginGroupPermissions`
--

DROP TABLE IF EXISTS `PluginGroupPermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PluginGroupPermissions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `GroupId` int NOT NULL,
  `PermissionId` int NOT NULL,
  `IsEnabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_PluginGroupPermissions_PermissionId` (`PermissionId`),
  CONSTRAINT `FK_PluginGroupPermissions_PluginPermissions_PermissionId` FOREIGN KEY (`PermissionId`) REFERENCES `PluginPermissions` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PluginGroupPermissions`
--

LOCK TABLES `PluginGroupPermissions` WRITE;
/*!40000 ALTER TABLE `PluginGroupPermissions` DISABLE KEYS */;
INSERT INTO `PluginGroupPermissions` VALUES (1,'2020-09-23 09:31:16.015310','2020-09-23 09:31:16.015311','created',0,0,1,1,1,1);
/*!40000 ALTER TABLE `PluginGroupPermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PluginGroupPermissionVersions`
--

DROP TABLE IF EXISTS `PluginGroupPermissionVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PluginGroupPermissionVersions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `GroupId` int NOT NULL,
  `PermissionId` int NOT NULL,
  `IsEnabled` tinyint(1) NOT NULL,
  `PluginGroupPermissionId` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PluginGroupPermissionVersions`
--

LOCK TABLES `PluginGroupPermissionVersions` WRITE;
/*!40000 ALTER TABLE `PluginGroupPermissionVersions` DISABLE KEYS */;
INSERT INTO `PluginGroupPermissionVersions` VALUES (1,'2020-09-23 09:31:16.015310','2020-09-23 09:31:16.015311','created',0,0,1,1,1,1,1);
/*!40000 ALTER TABLE `PluginGroupPermissionVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PluginPermissions`
--

DROP TABLE IF EXISTS `PluginPermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PluginPermissions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `PermissionName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ClaimName` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PluginPermissions`
--

LOCK TABLES `PluginPermissions` WRITE;
/*!40000 ALTER TABLE `PluginPermissions` DISABLE KEYS */;
INSERT INTO `PluginPermissions` VALUES (1,'2020-09-23 09:31:15.981114',NULL,'created',1,0,1,'Access WorkOrder Plugin','work_orders_plugin_access');
/*!40000 ALTER TABLE `PluginPermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkOrders`
--

DROP TABLE IF EXISTS `WorkOrders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkOrders` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CorrectedAtLatest` datetime(6) NOT NULL,
  `DoneAt` datetime(6) NOT NULL,
  `DoneBySiteId` int NOT NULL,
  `DescriptionOfTaskDone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkOrders`
--

LOCK TABLES `WorkOrders` WRITE;
/*!40000 ALTER TABLE `WorkOrders` DISABLE KEYS */;
INSERT INTO `WorkOrders` VALUES (1,'2020-09-21 10:16:16.172400','2020-09-21 10:16:16.172400','created',13238,13238,1,'sas','2020-09-22 13:24:16.000000','2020-09-23 13:24:23.000000',13220,'hhhhh'),(2,'2020-09-22 10:16:16.172408','2020-09-22 10:16:16.172408','created',13220,13220,1,'zzzzzz','2020-09-24 10:16:16.172408','2020-09-24 10:16:16.172408',13238,'asddas');
/*!40000 ALTER TABLE `WorkOrders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkOrdersTemplateCases`
--

DROP TABLE IF EXISTS `WorkOrdersTemplateCases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkOrdersTemplateCases` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  CONSTRAINT `FK_WorkOrdersTemplateCases_WorkOrders_WorkOrderId` FOREIGN KEY (`WorkOrderId`) REFERENCES `WorkOrders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkOrdersTemplateCases`
--

LOCK TABLES `WorkOrdersTemplateCases` WRITE;
/*!40000 ALTER TABLE `WorkOrdersTemplateCases` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkOrdersTemplateCases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkOrderVersions`
--

DROP TABLE IF EXISTS `WorkOrderVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WorkOrderVersions` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CreatedByUserId` int NOT NULL,
  `UpdatedByUserId` int NOT NULL,
  `Version` int NOT NULL,
  `Description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CorrectedAtLatest` datetime(6) NOT NULL,
  `DoneAt` datetime(6) NOT NULL,
  `DoneBySiteId` int NOT NULL,
  `DescriptionOfTaskDone` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `WorkOrderId` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkOrderVersions`
--

LOCK TABLES `WorkOrderVersions` WRITE;
/*!40000 ALTER TABLE `WorkOrderVersions` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkOrderVersions` ENABLE KEYS */;
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
