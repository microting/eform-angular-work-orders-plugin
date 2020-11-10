-- MariaDB dump 10.18  Distrib 10.5.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: 420_eform-angular-work-orders-plugin
-- ------------------------------------------------------
-- Server version	10.5.7-MariaDB-1:10.5.7+maria~focal-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AssignedSiteVersions`
--

DROP TABLE IF EXISTS `AssignedSiteVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AssignedSiteVersions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `SiteId` int(11) NOT NULL,
  `CaseId` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `IX_AssignedSiteVersions_SiteId` (`SiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssignedSiteVersions`
--

LOCK TABLES `AssignedSiteVersions` WRITE;
/*!40000 ALTER TABLE `AssignedSiteVersions` DISABLE KEYS */;
/*!40000 ALTER TABLE `AssignedSiteVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AssignedSites`
--

DROP TABLE IF EXISTS `AssignedSites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AssignedSites` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `SiteId` int(11) NOT NULL,
  `CaseId` int(11) DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `IX_AssignedSites_SiteId` (`SiteId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AssignedSites`
--

LOCK TABLES `AssignedSites` WRITE;
/*!40000 ALTER TABLE `AssignedSites` DISABLE KEYS */;
/*!40000 ALTER TABLE `AssignedSites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PicturesOfTaskDone`
--

DROP TABLE IF EXISTS `PicturesOfTaskDone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PicturesOfTaskDone` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `WorkOrderId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_PicturesOfTaskDone_FileName` (`FileName`),
  KEY `IX_PicturesOfTaskDone_WorkOrderId` (`WorkOrderId`),
  CONSTRAINT `FK_PicturesOfTaskDone_WorkOrders_WorkOrderId` FOREIGN KEY (`WorkOrderId`) REFERENCES `WorkOrders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PicturesOfTasks` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `WorkOrderId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_PicturesOfTasks_FileName` (`FileName`),
  KEY `IX_PicturesOfTasks_WorkOrderId` (`WorkOrderId`),
  CONSTRAINT `FK_PicturesOfTasks_WorkOrders_WorkOrderId` FOREIGN KEY (`WorkOrderId`) REFERENCES `WorkOrders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PicturesOfTasks`
--

LOCK TABLES `PicturesOfTasks` WRITE;
/*!40000 ALTER TABLE `PicturesOfTasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `PicturesOfTasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PluginConfigurationValueVersions`
--

DROP TABLE IF EXISTS `PluginConfigurationValueVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PluginConfigurationValueVersions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `Value` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PluginConfigurationValueVersions`
--

LOCK TABLES `PluginConfigurationValueVersions` WRITE;
/*!40000 ALTER TABLE `PluginConfigurationValueVersions` DISABLE KEYS */;
INSERT INTO `PluginConfigurationValueVersions` VALUES (1,'2020-11-10 11:06:07.471212','2020-11-10 11:06:07.471213','created',1,1,1,'WorkOrdersBaseSettings:NewTaskId','0'),(2,'2020-11-10 11:06:07.716889','2020-11-10 11:06:07.716889','created',1,1,1,'WorkOrdersBaseSettings:TaskListId','0');
/*!40000 ALTER TABLE `PluginConfigurationValueVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PluginConfigurationValues`
--

DROP TABLE IF EXISTS `PluginConfigurationValues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PluginConfigurationValues` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `Value` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PluginConfigurationValues`
--

LOCK TABLES `PluginConfigurationValues` WRITE;
/*!40000 ALTER TABLE `PluginConfigurationValues` DISABLE KEYS */;
INSERT INTO `PluginConfigurationValues` VALUES (1,'2020-11-10 11:05:55.833755','2020-11-10 11:06:07.484036','created',1,1,2,'WorkOrdersBaseSettings:NewTaskId','1'),(2,'2020-11-10 11:05:55.936162','2020-11-10 11:06:07.717071','created',1,1,2,'WorkOrdersBaseSettings:TaskListId','3'),(3,'2020-11-10 11:05:55.942984','2020-11-10 11:05:55.942984','created',1,0,1,'WorkOrdersBaseSettings:MaxParallelism','1'),(4,'2020-11-10 11:05:55.946177','2020-11-10 11:05:55.946178','created',1,0,1,'WorkOrdersBaseSettings:NumberOfWorkers','1'),(5,'2020-11-10 11:05:55.949414','2020-11-10 11:05:55.949414','created',1,0,1,'WorkOrdersBaseSettings:FolderId','0'),(6,'2020-11-10 11:05:55.952371','2020-11-10 11:05:55.952371','created',1,0,1,'WorkOrdersBaseSettings:FolderTasksId','0');
/*!40000 ALTER TABLE `PluginConfigurationValues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PluginGroupPermissionVersions`
--

DROP TABLE IF EXISTS `PluginGroupPermissionVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PluginGroupPermissionVersions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `GroupId` int(11) NOT NULL,
  `PermissionId` int(11) NOT NULL,
  `IsEnabled` tinyint(1) NOT NULL,
  `PluginGroupPermissionId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PluginGroupPermissionVersions`
--

LOCK TABLES `PluginGroupPermissionVersions` WRITE;
/*!40000 ALTER TABLE `PluginGroupPermissionVersions` DISABLE KEYS */;
INSERT INTO `PluginGroupPermissionVersions` VALUES (1,'2020-11-10 11:05:56.086868','2020-11-10 11:05:56.086868','created',0,0,1,1,1,1,1);
/*!40000 ALTER TABLE `PluginGroupPermissionVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PluginGroupPermissions`
--

DROP TABLE IF EXISTS `PluginGroupPermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PluginGroupPermissions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `GroupId` int(11) NOT NULL,
  `PermissionId` int(11) NOT NULL,
  `IsEnabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_PluginGroupPermissions_PermissionId` (`PermissionId`),
  CONSTRAINT `FK_PluginGroupPermissions_PluginPermissions_PermissionId` FOREIGN KEY (`PermissionId`) REFERENCES `PluginPermissions` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PluginGroupPermissions`
--

LOCK TABLES `PluginGroupPermissions` WRITE;
/*!40000 ALTER TABLE `PluginGroupPermissions` DISABLE KEYS */;
INSERT INTO `PluginGroupPermissions` VALUES (1,'2020-11-10 11:05:56.086868','2020-11-10 11:05:56.086868','created',0,0,1,1,1,1);
/*!40000 ALTER TABLE `PluginGroupPermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PluginPermissions`
--

DROP TABLE IF EXISTS `PluginPermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PluginPermissions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `PermissionName` longtext DEFAULT NULL,
  `ClaimName` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PluginPermissions`
--

LOCK TABLES `PluginPermissions` WRITE;
/*!40000 ALTER TABLE `PluginPermissions` DISABLE KEYS */;
INSERT INTO `PluginPermissions` VALUES (1,'2020-11-10 11:05:55.960987',NULL,'created',1,0,1,'Access WorkOrder Plugin','work_orders_plugin_access');
/*!40000 ALTER TABLE `PluginPermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkOrderVersions`
--

DROP TABLE IF EXISTS `WorkOrderVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkOrderVersions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `Description` longtext DEFAULT NULL,
  `CorrectedAtLatest` datetime(6) NOT NULL,
  `DoneAt` datetime(6) DEFAULT NULL,
  `DoneBySiteId` int(11) NOT NULL,
  `DescriptionOfTaskDone` longtext DEFAULT NULL,
  `WorkOrderId` int(11) NOT NULL,
  `CheckId` int(11) NOT NULL DEFAULT 0,
  `CheckUId` int(11) NOT NULL DEFAULT 0,
  `MicrotingId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkOrderVersions`
--

LOCK TABLES `WorkOrderVersions` WRITE;
/*!40000 ALTER TABLE `WorkOrderVersions` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkOrderVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkOrders`
--

DROP TABLE IF EXISTS `WorkOrders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkOrders` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `Description` longtext DEFAULT NULL,
  `CorrectedAtLatest` datetime(6) NOT NULL,
  `DoneAt` datetime(6) DEFAULT NULL,
  `DoneBySiteId` int(11) NOT NULL,
  `DescriptionOfTaskDone` longtext DEFAULT NULL,
  `CheckId` int(11) NOT NULL DEFAULT 0,
  `CheckUId` int(11) NOT NULL DEFAULT 0,
  `MicrotingId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkOrders`
--

LOCK TABLES `WorkOrders` WRITE;
/*!40000 ALTER TABLE `WorkOrders` DISABLE KEYS */;
INSERT INTO `WorkOrders` VALUES (1,'2020-09-21 10:16:16.172400','2020-09-21 10:16:16.172400','created',13238,13238,1,'sas','2020-09-22 13:24:16.000000','2020-09-23 13:24:23.000000',13220,'hhhhh', 1,2,3),(2,'2020-09-22 10:16:16.172408','2020-09-22 10:16:16.172408','created',13220,13220,1,'zzzzzz','2020-09-24 10:16:16.172408','2020-09-24 10:16:16.172408',13238,'asddas', 1,2,3);
/*!40000 ALTER TABLE `WorkOrders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkOrdersTemplateCaseVersions`
--

DROP TABLE IF EXISTS `WorkOrdersTemplateCaseVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkOrdersTemplateCaseVersions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `CaseId` int(11) NOT NULL,
  `CaseUId` int(11) NOT NULL,
  `CheckId` int(11) NOT NULL,
  `CheckUId` int(11) NOT NULL,
  `WorkOrderId` int(11) NOT NULL,
  `SdkSiteId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkOrdersTemplateCaseVersions`
--

LOCK TABLES `WorkOrdersTemplateCaseVersions` WRITE;
/*!40000 ALTER TABLE `WorkOrdersTemplateCaseVersions` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkOrdersTemplateCaseVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkOrdersTemplateCases`
--

DROP TABLE IF EXISTS `WorkOrdersTemplateCases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkOrdersTemplateCases` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedByUserId` int(11) NOT NULL,
  `UpdatedByUserId` int(11) NOT NULL,
  `Version` int(11) NOT NULL,
  `CaseId` int(11) NOT NULL,
  `CaseUId` int(11) NOT NULL,
  `CheckId` int(11) NOT NULL,
  `CheckUId` int(11) NOT NULL,
  `WorkOrderId` int(11) NOT NULL,
  `SdkSiteId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `IX_WorkOrdersTemplateCases_WorkOrderId` (`WorkOrderId`),
  CONSTRAINT `FK_WorkOrdersTemplateCases_WorkOrders_WorkOrderId` FOREIGN KEY (`WorkOrderId`) REFERENCES `WorkOrders` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkOrdersTemplateCases`
--

LOCK TABLES `WorkOrdersTemplateCases` WRITE;
/*!40000 ALTER TABLE `WorkOrdersTemplateCases` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkOrdersTemplateCases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `__EFMigrationsHistory`
--

DROP TABLE IF EXISTS `__EFMigrationsHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `__EFMigrationsHistory` (
  `MigrationId` varchar(95) NOT NULL,
  `ProductVersion` varchar(32) NOT NULL,
  PRIMARY KEY (`MigrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `__EFMigrationsHistory`
--

LOCK TABLES `__EFMigrationsHistory` WRITE;
/*!40000 ALTER TABLE `__EFMigrationsHistory` DISABLE KEYS */;
INSERT INTO `__EFMigrationsHistory` VALUES ('20200916141603_Init','3.1.8'),('20200921180012_MakingDoneAtNullable','3.1.8'),('20200923191200_AddingCaseIdToAssignedSite','3.1.8'),('20201021172700_AddingAttributesToWorkOrders','3.1.8'),('20201022082742_AddingSdkSiteIdToWorkOrderTemplateCase','3.1.8');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-10 11:06:20
