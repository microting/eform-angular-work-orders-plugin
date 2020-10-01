-- MariaDB dump 10.17  Distrib 10.5.5-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: 420_SDK
-- ------------------------------------------------------
-- Server version	10.5.5-MariaDB-1:10.5.5+maria~focal

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
-- Table structure for table `LanguageQuestionSetVersions`
--

DROP TABLE IF EXISTS `LanguageQuestionSetVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LanguageQuestionSetVersions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `LanguageId` int(11) NOT NULL,
  `QuestionSetId` int(11) NOT NULL,
  `LanguageQuestionSetId` int(11) NOT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_LanguageQuestionSetVersions_LanguageQuestionSetId` (`LanguageQuestionSetId`),
  CONSTRAINT `FK_LanguageQuestionSetVersions_LanguageQuestionSets_LanguageQues` FOREIGN KEY (`LanguageQuestionSetId`) REFERENCES `LanguageQuestionSets` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LanguageQuestionSetVersions`
--

LOCK TABLES `LanguageQuestionSetVersions` WRITE;
/*!40000 ALTER TABLE `LanguageQuestionSetVersions` DISABLE KEYS */;
/*!40000 ALTER TABLE `LanguageQuestionSetVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LanguageQuestionSets`
--

DROP TABLE IF EXISTS `LanguageQuestionSets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LanguageQuestionSets` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `LanguageId` int(11) NOT NULL,
  `QuestionSetId` int(11) NOT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_LanguageQuestionSets_LanguageId` (`LanguageId`),
  KEY `IX_LanguageQuestionSets_QuestionSetId` (`QuestionSetId`),
  CONSTRAINT `FK_LanguageQuestionSets_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_LanguageQuestionSets_question_sets_QuestionSetId` FOREIGN KEY (`QuestionSetId`) REFERENCES `question_sets` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LanguageQuestionSets`
--

LOCK TABLES `LanguageQuestionSets` WRITE;
/*!40000 ALTER TABLE `LanguageQuestionSets` DISABLE KEYS */;
/*!40000 ALTER TABLE `LanguageQuestionSets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OptionTranslationVersions`
--

DROP TABLE IF EXISTS `OptionTranslationVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OptionTranslationVersions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `OptionId` int(11) NOT NULL,
  `LanguageId` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `OptionTranslationId` int(11) NOT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OptionTranslationVersions`
--

LOCK TABLES `OptionTranslationVersions` WRITE;
/*!40000 ALTER TABLE `OptionTranslationVersions` DISABLE KEYS */;
/*!40000 ALTER TABLE `OptionTranslationVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OptionTranslations`
--

DROP TABLE IF EXISTS `OptionTranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OptionTranslations` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `OptionId` int(11) NOT NULL,
  `LanguageId` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_OptionTranslations_LanguageId` (`LanguageId`),
  KEY `IX_OptionTranslations_OptionId` (`OptionId`),
  CONSTRAINT `FK_OptionTranslations_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_OptionTranslations_options_OptionId` FOREIGN KEY (`OptionId`) REFERENCES `options` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OptionTranslations`
--

LOCK TABLES `OptionTranslations` WRITE;
/*!40000 ALTER TABLE `OptionTranslations` DISABLE KEYS */;
/*!40000 ALTER TABLE `OptionTranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionTranslationVersions`
--

DROP TABLE IF EXISTS `QuestionTranslationVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionTranslationVersions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `QuestionId` int(11) NOT NULL,
  `LanguageId` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `QuestionTranslationId` int(11) NOT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_QuestionTranslationVersions_QuestionTranslationId` (`QuestionTranslationId`),
  CONSTRAINT `FK_QuestionTranslationVersions_QuestionTranslations_QuestionTran` FOREIGN KEY (`QuestionTranslationId`) REFERENCES `QuestionTranslations` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionTranslationVersions`
--

LOCK TABLES `QuestionTranslationVersions` WRITE;
/*!40000 ALTER TABLE `QuestionTranslationVersions` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionTranslationVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionTranslations`
--

DROP TABLE IF EXISTS `QuestionTranslations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionTranslations` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `QuestionId` int(11) NOT NULL,
  `LanguageId` int(11) NOT NULL,
  `Name` longtext DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_QuestionTranslations_LanguageId` (`LanguageId`),
  KEY `IX_QuestionTranslations_QuestionId` (`QuestionId`),
  CONSTRAINT `FK_QuestionTranslations_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_QuestionTranslations_questions_QuestionId` FOREIGN KEY (`QuestionId`) REFERENCES `questions` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionTranslations`
--

LOCK TABLES `QuestionTranslations` WRITE;
/*!40000 ALTER TABLE `QuestionTranslations` DISABLE KEYS */;
/*!40000 ALTER TABLE `QuestionTranslations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTagVersions`
--

DROP TABLE IF EXISTS `SiteTagVersions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteTagVersions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `TagId` int(11) DEFAULT NULL,
  `SiteId` int(11) DEFAULT NULL,
  `SiteTagId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteTagVersions`
--

LOCK TABLES `SiteTagVersions` WRITE;
/*!40000 ALTER TABLE `SiteTagVersions` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteTagVersions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteTags`
--

DROP TABLE IF EXISTS `SiteTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteTags` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `TagId` int(11) DEFAULT NULL,
  `SiteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_SiteTags_SiteId` (`SiteId`),
  KEY `IX_SiteTags_TagId` (`TagId`),
  CONSTRAINT `FK_SiteTags_sites_SiteId` FOREIGN KEY (`SiteId`) REFERENCES `sites` (`Id`),
  CONSTRAINT `FK_SiteTags_tags_TagId` FOREIGN KEY (`TagId`) REFERENCES `tags` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteTags`
--

LOCK TABLES `SiteTags` WRITE;
/*!40000 ALTER TABLE `SiteTags` DISABLE KEYS */;
/*!40000 ALTER TABLE `SiteTags` ENABLE KEYS */;
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
INSERT INTO `__EFMigrationsHistory` VALUES ('20180810124416_InitialCreate','3.1.8'),('20190116110009_AddingOriginalId','3.1.8'),('20190315092242_AddingModelseForInsight','3.1.8'),('20190318122928_FixingNamingOfSurveyConfigurationSites','3.1.8'),('20190319130214_AddingMissingForeignKeys','3.1.8'),('20190408081151_AddingFolders','3.1.8'),('20190408084408_AddingMissingParentId','3.1.8'),('20190509074123_RefactoringidtoId','3.1.8'),('20190514053645_RefactoringAttributeNames','3.1.8'),('20190515064952_FixingNamingForFieldValues','3.1.8'),('20190531092007_AddingMissingAIonLogs','3.1.8'),('20190711053344_AddingJasperDocxEnabledAttributesToCheckList','3.1.8'),('20190828054730_AddingNewVersionClasses','3.1.8'),('20190828074017_AddingMissingClasses','3.1.8'),('20190923100451_ChangeStringToInt','3.1.8'),('20190924172326_AddingNewIndexOnCases','3.1.8'),('20200116074236_AddingSiteTaggins','3.1.8'),('20200120093951_CleanupInSight','3.1.8'),('20200120164857_AddingTranslationsToInSight','3.1.8'),('20200120171433_AddingMicrotingUidToInSight','3.1.8'),('20200122103229_ChangingValueToBeStringForAnswerValue','3.1.8'),('20200222140656_AddinDisplayIndexToOptions','3.1.8'),('20200224084023_AddingAttributesToUnits','3.1.8'),('20200224092512_AddingMoreAttributesToUnits','3.1.8'),('20200226182616_MakingNextQuestionIdNullable','3.1.8'),('20200318150742_MakingUnitIdNullableForAnswers','3.1.8'),('20200427095029_AdjustTimeToUTC','3.1.8'),('20200513142551_AddingFolderIdToCasesAndCheckListSites','3.1.8'),('20200617160004_ChangingOptionsIndexToOptionIndex','3.1.8'),('20200620171527_AddingExcelExportEnabledToCheckList','3.1.8'),('20200701101500_LettingSurveyConfigurationIdBeNullable','3.1.8');
/*!40000 ALTER TABLE `__EFMigrationsHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_value_versions`
--

DROP TABLE IF EXISTS `answer_value_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_value_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `AnswerId` int(11) NOT NULL DEFAULT 0,
  `QuestionId` int(11) NOT NULL DEFAULT 0,
  `OptionId` int(11) NOT NULL DEFAULT 0,
  `Value` longtext DEFAULT NULL,
  `AnswerValueId` int(11) NOT NULL DEFAULT 0,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_answer_value_versions_answerValueId` (`AnswerValueId`),
  CONSTRAINT `FK_answer_value_versions_answer_values_AnswerValueId` FOREIGN KEY (`AnswerValueId`) REFERENCES `answer_values` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_value_versions`
--

LOCK TABLES `answer_value_versions` WRITE;
/*!40000 ALTER TABLE `answer_value_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_value_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_values`
--

DROP TABLE IF EXISTS `answer_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_values` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `AnswerId` int(11) NOT NULL DEFAULT 0,
  `QuestionId` int(11) NOT NULL DEFAULT 0,
  `OptionId` int(11) NOT NULL DEFAULT 0,
  `Value` longtext DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_answer_values_answerId` (`AnswerId`),
  KEY `IX_answer_values_optionsId` (`OptionId`),
  KEY `IX_answer_values_questionId` (`QuestionId`),
  CONSTRAINT `FK_answer_values_answers_AnswerId` FOREIGN KEY (`AnswerId`) REFERENCES `answers` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_answer_values_options_OptionId` FOREIGN KEY (`OptionId`) REFERENCES `options` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_answer_values_questions_QuestionId` FOREIGN KEY (`QuestionId`) REFERENCES `questions` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_values`
--

LOCK TABLES `answer_values` WRITE;
/*!40000 ALTER TABLE `answer_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer_versions`
--

DROP TABLE IF EXISTS `answer_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `UnitId` int(11) DEFAULT NULL,
  `SiteId` int(11) NOT NULL DEFAULT 0,
  `AnswerDuration` int(11) NOT NULL DEFAULT 0,
  `LanguageId` int(11) NOT NULL DEFAULT 0,
  `SurveyConfigurationId` int(11) DEFAULT NULL,
  `FinishedAt` datetime(6) NOT NULL,
  `QuestionSetId` int(11) NOT NULL DEFAULT 0,
  `UtcAdjusted` tinyint(1) NOT NULL DEFAULT 0,
  `TimeZone` longtext DEFAULT NULL,
  `AnswerId` int(11) NOT NULL DEFAULT 0,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer_versions`
--

LOCK TABLES `answer_versions` WRITE;
/*!40000 ALTER TABLE `answer_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `UnitId` int(11) DEFAULT NULL,
  `SiteId` int(11) NOT NULL DEFAULT 0,
  `AnswerDuration` int(11) NOT NULL DEFAULT 0,
  `LanguageId` int(11) NOT NULL DEFAULT 0,
  `SurveyConfigurationId` int(11) DEFAULT NULL,
  `FinishedAt` datetime(6) NOT NULL,
  `QuestionSetId` int(11) NOT NULL DEFAULT 0,
  `UtcAdjusted` tinyint(1) NOT NULL DEFAULT 0,
  `TimeZone` longtext DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_answers_languageId` (`LanguageId`),
  KEY `IX_answers_questionSetId` (`QuestionSetId`),
  KEY `IX_answers_siteId` (`SiteId`),
  KEY `IX_answers_surveyConfigurationId` (`SurveyConfigurationId`),
  KEY `IX_answers_unitId` (`UnitId`),
  CONSTRAINT `FK_answers_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_answers_question_sets_QuestionSetId` FOREIGN KEY (`QuestionSetId`) REFERENCES `question_sets` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_answers_sites_SiteId` FOREIGN KEY (`SiteId`) REFERENCES `sites` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_answers_survey_configurations_SurveyConfigurationId` FOREIGN KEY (`SurveyConfigurationId`) REFERENCES `survey_configurations` (`Id`),
  CONSTRAINT `FK_answers_units_UnitId` FOREIGN KEY (`UnitId`) REFERENCES `units` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `case_versions`
--

DROP TABLE IF EXISTS `case_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `case_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CaseId` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `DoneAt` datetime(6) DEFAULT NULL,
  `SiteId` int(11) DEFAULT NULL,
  `UnitId` int(11) DEFAULT NULL,
  `WorkerId` int(11) DEFAULT NULL,
  `CheckListId` int(11) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  `MicrotingCheckUid` int(11) DEFAULT NULL,
  `CaseUid` varchar(255) DEFAULT NULL,
  `Custom` longtext DEFAULT NULL,
  `FieldValue1` longtext DEFAULT NULL,
  `FieldValue2` longtext DEFAULT NULL,
  `FieldValue3` longtext DEFAULT NULL,
  `FieldValue4` longtext DEFAULT NULL,
  `FieldValue5` longtext DEFAULT NULL,
  `FieldValue6` longtext DEFAULT NULL,
  `FieldValue7` longtext DEFAULT NULL,
  `FieldValue8` longtext DEFAULT NULL,
  `FieldValue9` longtext DEFAULT NULL,
  `FieldValue10` longtext DEFAULT NULL,
  `FolderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `case_versions`
--

LOCK TABLES `case_versions` WRITE;
/*!40000 ALTER TABLE `case_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `case_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cases`
--

DROP TABLE IF EXISTS `cases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cases` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `DoneAt` datetime(6) DEFAULT NULL,
  `SiteId` int(11) DEFAULT NULL,
  `UnitId` int(11) DEFAULT NULL,
  `WorkerId` int(11) DEFAULT NULL,
  `CheckListId` int(11) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  `MicrotingCheckUid` int(11) DEFAULT NULL,
  `CaseUid` varchar(255) DEFAULT NULL,
  `Custom` longtext DEFAULT NULL,
  `FieldValue1` longtext DEFAULT NULL,
  `FieldValue2` longtext DEFAULT NULL,
  `FieldValue3` longtext DEFAULT NULL,
  `FieldValue4` longtext DEFAULT NULL,
  `FieldValue5` longtext DEFAULT NULL,
  `FieldValue6` longtext DEFAULT NULL,
  `FieldValue7` longtext DEFAULT NULL,
  `FieldValue8` longtext DEFAULT NULL,
  `FieldValue9` longtext DEFAULT NULL,
  `FieldValue10` longtext DEFAULT NULL,
  `FolderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_cases_check_list_id` (`CheckListId`),
  KEY `IX_cases_done_by_user_id` (`WorkerId`),
  KEY `IX_cases_site_id` (`SiteId`),
  KEY `IX_cases_unit_id` (`UnitId`),
  KEY `IX_cases_CheckListId` (`CheckListId`),
  KEY `IX_cases_MicrotingUid_MicrotingCheckUid` (`MicrotingUid`,`MicrotingCheckUid`),
  KEY `IX_cases_FolderId` (`FolderId`),
  CONSTRAINT `FK_cases_check_lists_CheckListId` FOREIGN KEY (`CheckListId`) REFERENCES `check_lists` (`Id`),
  CONSTRAINT `FK_cases_folders_FolderId` FOREIGN KEY (`FolderId`) REFERENCES `folders` (`Id`),
  CONSTRAINT `FK_cases_sites_SiteId` FOREIGN KEY (`SiteId`) REFERENCES `sites` (`Id`),
  CONSTRAINT `FK_cases_units_UnitId` FOREIGN KEY (`UnitId`) REFERENCES `units` (`Id`),
  CONSTRAINT `FK_cases_workers_WorkerId` FOREIGN KEY (`WorkerId`) REFERENCES `workers` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cases`
--

LOCK TABLES `cases` WRITE;
/*!40000 ALTER TABLE `cases` DISABLE KEYS */;
/*!40000 ALTER TABLE `cases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_list_site_versions`
--

DROP TABLE IF EXISTS `check_list_site_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_list_site_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CheckListSiteId` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `SiteId` int(11) DEFAULT NULL,
  `CheckListId` int(11) DEFAULT NULL,
  `MicrotingUid` int(11) NOT NULL,
  `LastCheckId` int(11) NOT NULL,
  `FolderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_list_site_versions`
--

LOCK TABLES `check_list_site_versions` WRITE;
/*!40000 ALTER TABLE `check_list_site_versions` DISABLE KEYS */;
INSERT INTO `check_list_site_versions` VALUES (1,1,'created',1,'2020-09-25 09:25:57.742365','2020-09-25 09:25:57.742368',1,1,76445,0,1),(2,1,'removed',2,'2020-09-25 09:25:57.742365','2020-09-25 09:26:10.152027',1,1,76445,0,1);
/*!40000 ALTER TABLE `check_list_site_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_list_sites`
--

DROP TABLE IF EXISTS `check_list_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_list_sites` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `SiteId` int(11) DEFAULT NULL,
  `CheckListId` int(11) DEFAULT NULL,
  `MicrotingUid` int(11) NOT NULL,
  `LastCheckId` int(11) NOT NULL,
  `FolderId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_check_list_sites_check_list_id` (`CheckListId`),
  KEY `IX_check_list_sites_site_id` (`SiteId`),
  KEY `IX_check_list_sites_FolderId` (`FolderId`),
  CONSTRAINT `FK_check_list_sites_check_lists_CheckListId` FOREIGN KEY (`CheckListId`) REFERENCES `check_lists` (`Id`),
  CONSTRAINT `FK_check_list_sites_folders_FolderId` FOREIGN KEY (`FolderId`) REFERENCES `folders` (`Id`),
  CONSTRAINT `FK_check_list_sites_sites_SiteId` FOREIGN KEY (`SiteId`) REFERENCES `sites` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_list_sites`
--

LOCK TABLES `check_list_sites` WRITE;
/*!40000 ALTER TABLE `check_list_sites` DISABLE KEYS */;
INSERT INTO `check_list_sites` VALUES (1,'removed',2,'2020-09-25 09:25:57.742365','2020-09-25 09:26:10.152027',1,1,76445,0,1);
/*!40000 ALTER TABLE `check_list_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_list_value_versions`
--

DROP TABLE IF EXISTS `check_list_value_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_list_value_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CheckListValueId` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `CaseId` int(11) DEFAULT NULL,
  `CheckListId` int(11) DEFAULT NULL,
  `CheckListDuplicateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_list_value_versions`
--

LOCK TABLES `check_list_value_versions` WRITE;
/*!40000 ALTER TABLE `check_list_value_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_list_value_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_list_values`
--

DROP TABLE IF EXISTS `check_list_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_list_values` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL,
  `CaseId` int(11) DEFAULT NULL,
  `CheckListId` int(11) DEFAULT NULL,
  `CheckListDuplicateId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_list_values`
--

LOCK TABLES `check_list_values` WRITE;
/*!40000 ALTER TABLE `check_list_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `check_list_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_list_versions`
--

DROP TABLE IF EXISTS `check_list_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_list_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CheckListId` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Label` longtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Custom` longtext DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `Repeated` int(11) DEFAULT NULL,
  `DisplayIndex` int(11) DEFAULT NULL,
  `CaseType` varchar(255) DEFAULT NULL,
  `FolderName` varchar(255) DEFAULT NULL,
  `ReviewEnabled` smallint(6) DEFAULT NULL,
  `ManualSync` smallint(6) DEFAULT NULL,
  `ExtraFieldsEnabled` smallint(6) DEFAULT NULL,
  `DoneButtonEnabled` smallint(6) DEFAULT NULL,
  `ApprovalEnabled` smallint(6) DEFAULT NULL,
  `MultiApproval` smallint(6) DEFAULT NULL,
  `FastNavigation` smallint(6) DEFAULT NULL,
  `DownloadEntities` smallint(6) DEFAULT NULL,
  `Field1` int(11) DEFAULT NULL,
  `Field2` int(11) DEFAULT NULL,
  `Field3` int(11) DEFAULT NULL,
  `Field4` int(11) DEFAULT NULL,
  `Field5` int(11) DEFAULT NULL,
  `Field6` int(11) DEFAULT NULL,
  `Field7` int(11) DEFAULT NULL,
  `Field8` int(11) DEFAULT NULL,
  `Field9` int(11) DEFAULT NULL,
  `Field10` int(11) DEFAULT NULL,
  `QuickSyncEnabled` smallint(6) DEFAULT NULL,
  `OriginalId` longtext DEFAULT NULL,
  `Color` longtext DEFAULT NULL,
  `DocxExportEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `JasperExportEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `ExcelExportEnabled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_list_versions`
--

LOCK TABLES `check_list_versions` WRITE;
/*!40000 ALTER TABLE `check_list_versions` DISABLE KEYS */;
INSERT INTO `check_list_versions` VALUES (1,1,'created',1,'2020-09-25 09:23:28.600755','2020-09-25 09:23:28.600755','eform-angular-work-orders-plugin-newtask',NULL,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'142108',NULL,0,0,0),(2,2,'created',1,'2020-09-25 09:23:28.730725','2020-09-25 09:23:28.730725','Ny opgave','',NULL,1,NULL,0,NULL,NULL,0,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'142108',NULL,0,0,0),(3,3,'created',1,'2020-09-25 09:23:29.436760','2020-09-25 09:23:29.436760','eform-angular-work-orders-plugin-tasklist',NULL,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'142109',NULL,0,0,0),(4,4,'created',1,'2020-09-25 09:23:29.445383','2020-09-25 09:23:29.445383','Opgave registreret','',NULL,3,NULL,0,NULL,NULL,0,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'142109',NULL,0,0,0);
/*!40000 ALTER TABLE `check_list_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `check_lists`
--

DROP TABLE IF EXISTS `check_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `check_lists` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Label` longtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Custom` longtext DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  `Repeated` int(11) DEFAULT NULL,
  `DisplayIndex` int(11) DEFAULT NULL,
  `CaseType` varchar(255) DEFAULT NULL,
  `FolderName` varchar(255) DEFAULT NULL,
  `ReviewEnabled` smallint(6) DEFAULT NULL,
  `ManualSync` smallint(6) DEFAULT NULL,
  `ExtraFieldsEnabled` smallint(6) DEFAULT NULL,
  `DoneButtonEnabled` smallint(6) DEFAULT NULL,
  `ApprovalEnabled` smallint(6) DEFAULT NULL,
  `MultiApproval` smallint(6) DEFAULT NULL,
  `FastNavigation` smallint(6) DEFAULT NULL,
  `DownloadEntities` smallint(6) DEFAULT NULL,
  `Field1` int(11) DEFAULT NULL,
  `Field2` int(11) DEFAULT NULL,
  `Field3` int(11) DEFAULT NULL,
  `Field4` int(11) DEFAULT NULL,
  `Field5` int(11) DEFAULT NULL,
  `Field6` int(11) DEFAULT NULL,
  `Field7` int(11) DEFAULT NULL,
  `Field8` int(11) DEFAULT NULL,
  `Field9` int(11) DEFAULT NULL,
  `Field10` int(11) DEFAULT NULL,
  `QuickSyncEnabled` smallint(6) DEFAULT NULL,
  `OriginalId` longtext DEFAULT NULL,
  `Color` longtext DEFAULT NULL,
  `DocxExportEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `JasperExportEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `ExcelExportEnabled` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `check_lists`
--

LOCK TABLES `check_lists` WRITE;
/*!40000 ALTER TABLE `check_lists` DISABLE KEYS */;
INSERT INTO `check_lists` VALUES (1,'created',1,'2020-09-25 09:23:28.600755','2020-09-25 09:23:28.600755','eform-angular-work-orders-plugin-newtask',NULL,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'142108',NULL,0,0,0),(2,'created',1,'2020-09-25 09:23:28.730725','2020-09-25 09:23:28.730725','Ny opgave','',NULL,1,NULL,0,NULL,NULL,0,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'142108',NULL,0,0,0),(3,'created',1,'2020-09-25 09:23:29.436760','2020-09-25 09:23:29.436760','eform-angular-work-orders-plugin-tasklist',NULL,NULL,NULL,0,0,NULL,NULL,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'142109',NULL,0,0,0),(4,'created',1,'2020-09-25 09:23:29.445383','2020-09-25 09:23:29.445383','Opgave registreret','',NULL,3,NULL,0,NULL,NULL,0,NULL,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'142109',NULL,0,0,0);
/*!40000 ALTER TABLE `check_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_group_versions`
--

DROP TABLE IF EXISTS `entity_group_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_group_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `EntityGroupId` int(11) NOT NULL DEFAULT 0,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `MicrotingUid` longtext DEFAULT NULL,
  `Name` longtext DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_group_versions`
--

LOCK TABLES `entity_group_versions` WRITE;
/*!40000 ALTER TABLE `entity_group_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_group_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_groups`
--

DROP TABLE IF EXISTS `entity_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_groups` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `MicrotingUid` longtext DEFAULT NULL,
  `Name` longtext DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_groups`
--

LOCK TABLES `entity_groups` WRITE;
/*!40000 ALTER TABLE `entity_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_item_versions`
--

DROP TABLE IF EXISTS `entity_item_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_item_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `EntityItemsId` int(11) NOT NULL DEFAULT 0,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `EntityGroupId` int(11) DEFAULT NULL,
  `EntityItemUid` varchar(50) DEFAULT NULL,
  `MicrotingUid` longtext DEFAULT NULL,
  `Name` longtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Synced` smallint(6) DEFAULT NULL,
  `DisplayIndex` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_item_versions`
--

LOCK TABLES `entity_item_versions` WRITE;
/*!40000 ALTER TABLE `entity_item_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_item_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entity_items`
--

DROP TABLE IF EXISTS `entity_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entity_items` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `EntityGroupId` int(11) NOT NULL DEFAULT 0,
  `EntityItemUid` varchar(50) DEFAULT NULL,
  `MicrotingUid` longtext DEFAULT NULL,
  `Name` longtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Synced` smallint(6) DEFAULT NULL,
  `DisplayIndex` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entity_items`
--

LOCK TABLES `entity_items` WRITE;
/*!40000 ALTER TABLE `entity_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `entity_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_types`
--

DROP TABLE IF EXISTS `field_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_types` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FieldType` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_types`
--

LOCK TABLES `field_types` WRITE;
/*!40000 ALTER TABLE `field_types` DISABLE KEYS */;
INSERT INTO `field_types` VALUES (1,'Text','Simple text field'),(2,'Number','Simple number field'),(3,'None','Simple text to be displayed'),(4,'CheckBox','Simple check box field'),(5,'Picture','Simple picture field'),(6,'Audio','Simple audio field'),(7,'Movie','Simple movie field'),(8,'SingleSelect','Single selection list'),(9,'Comment','Simple comment field'),(10,'MultiSelect','Simple multi select list'),(11,'Date','Date selection'),(12,'Signature','Simple signature field'),(13,'Timer','Simple timer field'),(14,'EntitySearch','Autofilled searchable items field'),(15,'EntitySelect','Autofilled single selection list'),(16,'ShowPdf','Show PDF'),(17,'FieldGroup','Field group'),(18,'SaveButton','Save eForm'),(19,'NumberStepper','Number stepper field');
/*!40000 ALTER TABLE `field_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_value_versions`
--

DROP TABLE IF EXISTS `field_value_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_value_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FieldValueId` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `DoneAt` datetime(6) DEFAULT NULL,
  `Date` datetime(6) DEFAULT NULL,
  `WorkerId` int(11) DEFAULT NULL,
  `CaseId` int(11) DEFAULT NULL,
  `FieldId` int(11) DEFAULT NULL,
  `CheckListId` int(11) DEFAULT NULL,
  `CheckListDuplicateId` int(11) DEFAULT NULL,
  `UploadedDataId` int(11) DEFAULT NULL,
  `Value` longtext DEFAULT NULL,
  `Latitude` varchar(255) DEFAULT NULL,
  `Longitude` varchar(255) DEFAULT NULL,
  `Altitude` varchar(255) DEFAULT NULL,
  `Heading` varchar(255) DEFAULT NULL,
  `Accuracy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_value_versions`
--

LOCK TABLES `field_value_versions` WRITE;
/*!40000 ALTER TABLE `field_value_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_value_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_values`
--

DROP TABLE IF EXISTS `field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_values` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `DoneAt` datetime(6) DEFAULT NULL,
  `Date` datetime(6) DEFAULT NULL,
  `WorkerId` int(11) DEFAULT NULL,
  `CaseId` int(11) DEFAULT NULL,
  `FieldId` int(11) DEFAULT NULL,
  `CheckListId` int(11) DEFAULT NULL,
  `CheckListDuplicateId` int(11) DEFAULT NULL,
  `UploadedDataId` int(11) DEFAULT NULL,
  `Value` longtext DEFAULT NULL,
  `Latitude` varchar(255) DEFAULT NULL,
  `Longitude` varchar(255) DEFAULT NULL,
  `Altitude` varchar(255) DEFAULT NULL,
  `Heading` varchar(255) DEFAULT NULL,
  `Accuracy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_field_values_check_list_id` (`CheckListId`),
  KEY `IX_field_values_field_id` (`FieldId`),
  KEY `IX_field_values_uploaded_data_id` (`UploadedDataId`),
  KEY `IX_field_values_user_id` (`WorkerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_values`
--

LOCK TABLES `field_values` WRITE;
/*!40000 ALTER TABLE `field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_versions`
--

DROP TABLE IF EXISTS `field_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FieldId` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `ParentFieldId` int(11) DEFAULT NULL,
  `CheckListId` int(11) DEFAULT NULL,
  `FieldTypeId` int(11) DEFAULT NULL,
  `Mandatory` smallint(6) DEFAULT NULL,
  `ReadOnly` smallint(6) DEFAULT NULL,
  `Label` longtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `DisplayIndex` int(11) DEFAULT NULL,
  `Dummy` smallint(6) DEFAULT NULL,
  `DefaultValue` longtext DEFAULT NULL,
  `UnitName` varchar(255) DEFAULT NULL,
  `MinValue` varchar(255) DEFAULT NULL,
  `MaxValue` varchar(255) DEFAULT NULL,
  `MaxLength` int(11) DEFAULT NULL,
  `DecimalCount` int(11) DEFAULT NULL,
  `Multi` int(11) DEFAULT NULL,
  `Optional` smallint(6) DEFAULT NULL,
  `Selected` smallint(6) DEFAULT NULL,
  `SplitScreen` smallint(6) DEFAULT NULL,
  `GeolocationEnabled` smallint(6) DEFAULT NULL,
  `GeolocationForced` smallint(6) DEFAULT NULL,
  `GeolocationHidden` smallint(6) DEFAULT NULL,
  `StopOnSave` smallint(6) DEFAULT NULL,
  `IsNum` smallint(6) DEFAULT NULL,
  `BarcodeEnabled` smallint(6) DEFAULT NULL,
  `BarcodeType` varchar(255) DEFAULT NULL,
  `QueryType` varchar(255) DEFAULT NULL,
  `KeyValuePairList` longtext DEFAULT NULL,
  `Custom` longtext DEFAULT NULL,
  `EntityGroupId` int(11) DEFAULT NULL,
  `OriginalId` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_versions`
--

LOCK TABLES `field_versions` WRITE;
/*!40000 ALTER TABLE `field_versions` DISABLE KEYS */;
INSERT INTO `field_versions` VALUES (1,1,'created',1,'2020-09-25 09:23:28.762552','2020-09-25 09:23:28.762553',NULL,2,5,0,0,'Billede af opgaven','<br>','e8eaf6',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371263'),(2,2,'created',1,'2020-09-25 09:23:28.889938','2020-09-25 09:23:28.889938',NULL,2,1,0,0,'Beskrivelse af opgaven','','e8eaf6',1,0,'',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL,'371264'),(3,3,'created',1,'2020-09-25 09:23:28.905033','2020-09-25 09:23:28.905033',NULL,2,11,0,0,'Senest udbedret d.','','e8eaf6',2,0,'',NULL,'0001-01-01','0001-01-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371265'),(4,4,'created',1,'2020-09-25 09:23:28.913560','2020-09-25 09:23:28.913561',NULL,2,18,0,0,'GEM & SEND','','e8eaf6',2,0,'GEM & SEND',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371266'),(5,5,'created',1,'2020-09-25 09:23:29.452552','2020-09-25 09:23:29.452552',NULL,4,3,0,0,'Beskrivelse af opgaven','','e8eaf6',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371267'),(6,6,'created',1,'2020-09-25 09:23:29.461818','2020-09-25 09:23:29.461819',NULL,4,16,0,0,'Se billeder af opgaven','','e8eaf6',1,0,'9fae9a0b11bda418201523437984027c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371268'),(7,7,'created',1,'2020-09-25 09:23:29.472026','2020-09-25 09:23:29.472026',NULL,4,4,1,0,'Opgaven er udført','','e8eaf6',2,0,'False',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371269'),(8,8,'created',1,'2020-09-25 09:23:29.480940','2020-09-25 09:23:29.480941',NULL,4,5,0,0,'Evt. billede af den udførte opgave','<br>','e8eaf6',3,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371270'),(9,9,'created',1,'2020-09-25 09:23:29.490074','2020-09-25 09:23:29.490074',NULL,4,1,0,0,'Beskriv evt. den udførte opgave','','e8eaf6',4,0,'',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL,'371271'),(10,10,'created',1,'2020-09-25 09:23:29.497641','2020-09-25 09:23:29.497641',NULL,4,18,0,0,'GEM & SEND','','e8eaf6',5,0,'GEM & SEND',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371272');
/*!40000 ALTER TABLE `field_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `ParentFieldId` int(11) DEFAULT NULL,
  `CheckListId` int(11) DEFAULT NULL,
  `FieldTypeId` int(11) DEFAULT NULL,
  `Mandatory` smallint(6) DEFAULT NULL,
  `ReadOnly` smallint(6) DEFAULT NULL,
  `Label` longtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Color` varchar(255) DEFAULT NULL,
  `DisplayIndex` int(11) DEFAULT NULL,
  `Dummy` smallint(6) DEFAULT NULL,
  `DefaultValue` longtext DEFAULT NULL,
  `UnitName` varchar(255) DEFAULT NULL,
  `MinValue` varchar(255) DEFAULT NULL,
  `MaxValue` varchar(255) DEFAULT NULL,
  `MaxLength` int(11) DEFAULT NULL,
  `DecimalCount` int(11) DEFAULT NULL,
  `Multi` int(11) DEFAULT NULL,
  `Optional` smallint(6) DEFAULT NULL,
  `Selected` smallint(6) DEFAULT NULL,
  `SplitScreen` smallint(6) DEFAULT NULL,
  `GeolocationEnabled` smallint(6) DEFAULT NULL,
  `GeolocationForced` smallint(6) DEFAULT NULL,
  `GeolocationHidden` smallint(6) DEFAULT NULL,
  `StopOnSave` smallint(6) DEFAULT NULL,
  `IsNum` smallint(6) DEFAULT NULL,
  `BarcodeEnabled` smallint(6) DEFAULT NULL,
  `BarcodeType` varchar(255) DEFAULT NULL,
  `QueryType` varchar(255) DEFAULT NULL,
  `KeyValuePairList` longtext DEFAULT NULL,
  `Custom` longtext DEFAULT NULL,
  `EntityGroupId` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `OriginalId` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_fields_check_list_id` (`CheckListId`),
  KEY `IX_fields_field_type_id` (`FieldTypeId`),
  KEY `IX_fields_parentid` (`parentid`),
  KEY `FK_fields_fields_ParentFieldId` (`ParentFieldId`),
  CONSTRAINT `FK_fields_check_lists_CheckListId` FOREIGN KEY (`CheckListId`) REFERENCES `check_lists` (`Id`),
  CONSTRAINT `FK_fields_field_types_FieldTypeId` FOREIGN KEY (`FieldTypeId`) REFERENCES `field_types` (`Id`),
  CONSTRAINT `FK_fields_fields_ParentFieldId` FOREIGN KEY (`ParentFieldId`) REFERENCES `fields` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (1,'created',1,'2020-09-25 09:23:28.762552','2020-09-25 09:23:28.762553',NULL,2,5,0,0,'Billede af opgaven','<br>','e8eaf6',0,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371263'),(2,'created',1,'2020-09-25 09:23:28.889938','2020-09-25 09:23:28.889938',NULL,2,1,0,0,'Beskrivelse af opgaven','','e8eaf6',1,0,'',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL,NULL,'371264'),(3,'created',1,'2020-09-25 09:23:28.905033','2020-09-25 09:23:28.905033',NULL,2,11,0,0,'Senest udbedret d.','','e8eaf6',2,0,'',NULL,'0001-01-01','0001-01-01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371265'),(4,'created',1,'2020-09-25 09:23:28.913560','2020-09-25 09:23:28.913561',NULL,2,18,0,0,'GEM & SEND','','e8eaf6',2,0,'GEM & SEND',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371266'),(5,'created',1,'2020-09-25 09:23:29.452552','2020-09-25 09:23:29.452552',NULL,4,3,0,0,'Beskrivelse af opgaven','','e8eaf6',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371267'),(6,'created',1,'2020-09-25 09:23:29.461818','2020-09-25 09:23:29.461819',NULL,4,16,0,0,'Se billeder af opgaven','','e8eaf6',1,0,'9fae9a0b11bda418201523437984027c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371268'),(7,'created',1,'2020-09-25 09:23:29.472026','2020-09-25 09:23:29.472026',NULL,4,4,1,0,'Opgaven er udført','','e8eaf6',2,0,'False',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371269'),(8,'created',1,'2020-09-25 09:23:29.480940','2020-09-25 09:23:29.480941',NULL,4,5,0,0,'Evt. billede af den udførte opgave','<br>','e8eaf6',3,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371270'),(9,'created',1,'2020-09-25 09:23:29.490074','2020-09-25 09:23:29.490074',NULL,4,1,0,0,'Beskriv evt. den udførte opgave','','e8eaf6',4,0,'',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0,'',NULL,NULL,NULL,NULL,NULL,'371271'),(10,'created',1,'2020-09-25 09:23:29.497641','2020-09-25 09:23:29.497641',NULL,4,18,0,0,'GEM & SEND','','e8eaf6',5,0,'GEM & SEND',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371272');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folder_versions`
--

DROP TABLE IF EXISTS `folder_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folder_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `FolderId` int(11) DEFAULT NULL,
  `Name` longtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folder_versions`
--

LOCK TABLES `folder_versions` WRITE;
/*!40000 ALTER TABLE `folder_versions` DISABLE KEYS */;
INSERT INTO `folder_versions` VALUES (1,1,'created','2020-09-25 09:25:18.368546','2020-09-25 09:25:18.368550',1,'a56e01a2-b465-61c4-0330-3b2e06c3feaf','cfd9f517-15f4-7107-ca7e-04e5f06d70b0',174971,NULL),(2,1,'created','2020-09-25 09:25:20.218523','2020-09-25 09:25:20.218528',2,'e72439e7-9101-c4ad-b6dd-616ee20ac2aa','a213dcc3-4339-15d8-3171-0b251dbb76f9',262266,NULL),(3,2,'removed','2020-09-25 09:25:20.218523','2020-09-25 09:27:15.722640',2,'e72439e7-9101-c4ad-b6dd-616ee20ac2aa','a213dcc3-4339-15d8-3171-0b251dbb76f9',262266,NULL),(4,2,'removed','2020-09-25 09:25:18.368546','2020-09-25 09:27:20.013480',1,'a56e01a2-b465-61c4-0330-3b2e06c3feaf','cfd9f517-15f4-7107-ca7e-04e5f06d70b0',174971,NULL);
/*!40000 ALTER TABLE `folder_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `folders`
--

DROP TABLE IF EXISTS `folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `folders` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Name` longtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_folders_parentid` (`ParentId`),
  CONSTRAINT `FK_folders_folders_ParentId` FOREIGN KEY (`ParentId`) REFERENCES `folders` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `folders`
--

LOCK TABLES `folders` WRITE;
/*!40000 ALTER TABLE `folders` DISABLE KEYS */;
INSERT INTO `folders` VALUES (1,2,'removed','2020-09-25 09:25:18.368546','2020-09-25 09:27:20.013480','a56e01a2-b465-61c4-0330-3b2e06c3feaf','cfd9f517-15f4-7107-ca7e-04e5f06d70b0',174971,NULL),(2,2,'removed','2020-09-25 09:25:20.218523','2020-09-25 09:27:15.722640','e72439e7-9101-c4ad-b6dd-616ee20ac2aa','a213dcc3-4339-15d8-3171-0b251dbb76f9',262266,NULL);
/*!40000 ALTER TABLE `folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_versions`
--

DROP TABLE IF EXISTS `language_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Name` longtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `LanguageId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `IX_language_versions_languageId` (`LanguageId`),
  CONSTRAINT `FK_language_versions_languages_LanguageId` FOREIGN KEY (`LanguageId`) REFERENCES `languages` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_versions`
--

LOCK TABLES `language_versions` WRITE;
/*!40000 ALTER TABLE `language_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `language_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Name` longtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_exceptions`
--

DROP TABLE IF EXISTS `log_exceptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_exceptions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000',
  `Level` int(11) NOT NULL DEFAULT 0,
  `Type` longtext DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_exceptions`
--

LOCK TABLES `log_exceptions` WRITE;
/*!40000 ALTER TABLE `log_exceptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_exceptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000',
  `Level` int(11) NOT NULL DEFAULT 0,
  `Type` longtext DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_versions`
--

DROP TABLE IF EXISTS `notification_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  `Transmission` longtext DEFAULT NULL,
  `NotificationUid` varchar(255) DEFAULT NULL,
  `Activity` longtext DEFAULT NULL,
  `Exception` longtext DEFAULT NULL,
  `Stacktrace` longtext DEFAULT NULL,
  `Version` int(11) NOT NULL,
  `NotificationId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_versions`
--

LOCK TABLES `notification_versions` WRITE;
/*!40000 ALTER TABLE `notification_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  `Transmission` longtext DEFAULT NULL,
  `NotificationUid` varchar(255) DEFAULT NULL,
  `Activity` longtext DEFAULT NULL,
  `Exception` longtext DEFAULT NULL,
  `Stacktrace` longtext DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `option_versions`
--

DROP TABLE IF EXISTS `option_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `option_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `NextQuestionId` int(11) DEFAULT NULL,
  `Weight` int(11) NOT NULL DEFAULT 0,
  `WeightValue` int(11) NOT NULL DEFAULT 0,
  `ContinuousOptionId` int(11) NOT NULL DEFAULT 0,
  `QuestionId` int(11) NOT NULL DEFAULT 0,
  `OptionIndex` int(11) NOT NULL DEFAULT 0,
  `OptionId` int(11) NOT NULL DEFAULT 0,
  `MicrotingUid` int(11) DEFAULT NULL,
  `DisplayIndex` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `IX_option_versions_optionId` (`OptionId`),
  CONSTRAINT `FK_option_versions_options_OptionId` FOREIGN KEY (`OptionId`) REFERENCES `options` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `option_versions`
--

LOCK TABLES `option_versions` WRITE;
/*!40000 ALTER TABLE `option_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `option_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `options` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `NextQuestionId` int(11) DEFAULT NULL,
  `Weight` int(11) NOT NULL DEFAULT 0,
  `WeightValue` int(11) NOT NULL DEFAULT 0,
  `ContinuousOptionId` int(11) NOT NULL DEFAULT 0,
  `QuestionId` int(11) NOT NULL DEFAULT 0,
  `OptionIndex` int(11) NOT NULL DEFAULT 0,
  `MicrotingUid` int(11) DEFAULT NULL,
  `DisplayIndex` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `IX_options_questionId` (`QuestionId`),
  CONSTRAINT `FK_options_questions_QuestionId` FOREIGN KEY (`QuestionId`) REFERENCES `questions` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_set_versions`
--

DROP TABLE IF EXISTS `question_set_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_set_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Name` longtext DEFAULT NULL,
  `HasChild` tinyint(1) NOT NULL DEFAULT 0,
  `PossiblyDeployed` tinyint(1) NOT NULL DEFAULT 0,
  `ParentId` int(11) NOT NULL DEFAULT 0,
  `Share` tinyint(1) NOT NULL DEFAULT 0,
  `QuestionSetId` int(11) NOT NULL DEFAULT 0,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_question_set_versions_questionSetId` (`QuestionSetId`),
  CONSTRAINT `FK_question_set_versions_question_sets_QuestionSetId` FOREIGN KEY (`QuestionSetId`) REFERENCES `question_sets` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_set_versions`
--

LOCK TABLES `question_set_versions` WRITE;
/*!40000 ALTER TABLE `question_set_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_set_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_sets`
--

DROP TABLE IF EXISTS `question_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_sets` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Name` longtext DEFAULT NULL,
  `HasChild` tinyint(1) NOT NULL DEFAULT 0,
  `PosiblyDeployed` tinyint(1) NOT NULL DEFAULT 0,
  `ParentId` int(11) NOT NULL DEFAULT 0,
  `Share` tinyint(1) NOT NULL DEFAULT 0,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_sets`
--

LOCK TABLES `question_sets` WRITE;
/*!40000 ALTER TABLE `question_sets` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_versions`
--

DROP TABLE IF EXISTS `question_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `QuestionSetId` int(11) NOT NULL DEFAULT 0,
  `QuestionType` longtext DEFAULT NULL,
  `Minimum` int(11) NOT NULL DEFAULT 0,
  `Maximum` int(11) NOT NULL DEFAULT 0,
  `Type` longtext DEFAULT NULL,
  `RefId` int(11) NOT NULL DEFAULT 0,
  `QuestionIndex` int(11) NOT NULL DEFAULT 0,
  `Image` tinyint(1) NOT NULL DEFAULT 0,
  `ContinuousQuestionId` int(11) NOT NULL DEFAULT 0,
  `ImagePosition` longtext DEFAULT NULL,
  `Prioritised` tinyint(1) NOT NULL DEFAULT 0,
  `BackButtonEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `FontSize` longtext DEFAULT NULL,
  `MinDuration` int(11) NOT NULL DEFAULT 0,
  `MaxDuration` int(11) NOT NULL DEFAULT 0,
  `ValidDisplay` tinyint(1) NOT NULL DEFAULT 0,
  `QuestionId` int(11) NOT NULL DEFAULT 0,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_question_versions_questionId` (`QuestionId`),
  CONSTRAINT `FK_question_versions_questions_QuestionId` FOREIGN KEY (`QuestionId`) REFERENCES `questions` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_versions`
--

LOCK TABLES `question_versions` WRITE;
/*!40000 ALTER TABLE `question_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `question_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `QuestionSetId` int(11) NOT NULL DEFAULT 0,
  `QuestionType` longtext DEFAULT NULL,
  `Minimum` int(11) NOT NULL DEFAULT 0,
  `Maximum` int(11) NOT NULL DEFAULT 0,
  `Type` longtext DEFAULT NULL,
  `RefId` int(11) NOT NULL DEFAULT 0,
  `QuestionIndex` int(11) NOT NULL DEFAULT 0,
  `Image` tinyint(1) NOT NULL DEFAULT 0,
  `ContinuousQuestionId` int(11) NOT NULL DEFAULT 0,
  `ImagePosition` longtext DEFAULT NULL,
  `Prioritised` tinyint(1) NOT NULL DEFAULT 0,
  `BackButtonEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `FontSize` longtext DEFAULT NULL,
  `MinDuration` int(11) NOT NULL DEFAULT 0,
  `MaxDuration` int(11) NOT NULL DEFAULT 0,
  `ValidDisplay` tinyint(1) NOT NULL DEFAULT 0,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_questions_questionSetId` (`QuestionSetId`),
  CONSTRAINT `FK_questions_question_sets_QuestionSetId` FOREIGN KEY (`QuestionSetId`) REFERENCES `question_sets` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_versions`
--

DROP TABLE IF EXISTS `setting_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_versions` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Value` longtext DEFAULT NULL,
  `ChangedByName` longtext DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Version` int(11) NOT NULL,
  `SettingId` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_versions`
--

LOCK TABLES `setting_versions` WRITE;
/*!40000 ALTER TABLE `setting_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `Id` int(11) NOT NULL DEFAULT 0,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Value` longtext DEFAULT NULL,
  `ChangedByName` longtext DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Version` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'firstRunDone','true',NULL,NULL,NULL,0),(2,'logLevel','4',NULL,NULL,NULL,0),(3,'logLimit','25000',NULL,NULL,NULL,0),(4,'knownSitesDone','true',NULL,NULL,NULL,0),(5,'fileLocationPicture','/var/www/microting/eform-angular-frontend/eFormAPI/eFormAPI.Web/out/output/datafolder/picture/',NULL,NULL,NULL,0),(6,'fileLocationPdf','/var/www/microting/eform-angular-frontend/eFormAPI/eFormAPI.Web/out/output/datafolder/pdf/',NULL,NULL,NULL,0),(7,'fileLocationJasper','/var/www/microting/eform-angular-frontend/eFormAPI/eFormAPI.Web/out/output/datafolder/reports/',NULL,NULL,NULL,0),(8,'token','abc1234567890abc1234567890abcdef',NULL,NULL,NULL,0),(9,'comAddressBasic','https://basic.microting.com',NULL,NULL,NULL,0),(10,'comAddressApi','http://srv05.microting.com',NULL,NULL,NULL,0),(11,'comAddressPdfUpload','https://srv16.microting.com',NULL,NULL,NULL,0),(12,'comOrganizationId','64856189',NULL,NULL,NULL,0),(13,'awsAccessKeyId','3T98EGIO4Y9H8W2',NULL,NULL,NULL,0),(14,'awsSecretAccessKey','098u34098uergijt3098w',NULL,NULL,NULL,0),(15,'awsEndPoint','https://sqs.eu-central-1.amazonaws.com/564456879978/',NULL,NULL,NULL,0),(16,'unitLicenseNumber','55',NULL,NULL,NULL,0),(17,'httpServerAddress','http://localhost:3000',NULL,NULL,NULL,0),(18,'maxParallelism','1',NULL,NULL,NULL,0),(19,'numberOfWorkers','1',NULL,NULL,NULL,0),(20,'comSpeechToText','https://srv16.microting.com',NULL,NULL,NULL,0),(21,'swiftEnabled','false',NULL,NULL,NULL,0),(22,'swiftUserName','eformsdk',NULL,NULL,NULL,0),(23,'swiftPassword','eformsdktosecretpassword',NULL,NULL,NULL,0),(24,'swiftEndPoint','http://172.16.4.4:8080/swift/v1',NULL,NULL,NULL,0),(25,'keystoneEndPoint','http://172.16.4.4:5000/v2.0',NULL,NULL,NULL,0),(26,'customerNo','420',NULL,NULL,NULL,0),(27,'s3Enabled','false',NULL,NULL,NULL,0),(28,'s3AccessKeyId','XXX',NULL,NULL,NULL,0),(29,'s3SecrectAccessKey','XXX',NULL,NULL,NULL,0),(30,'s3Endpoint','https://s3.eu-central-1.amazonaws.com',NULL,NULL,NULL,0),(31,'s3BucketName','microting-uploaded-data',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_survey_configuration_versions`
--

DROP TABLE IF EXISTS `site_survey_configuration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_survey_configuration_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `SiteId` int(11) NOT NULL DEFAULT 0,
  `SurveyConfigurationId` int(11) NOT NULL DEFAULT 0,
  `SiteSurveyConfigurationId` int(11) NOT NULL DEFAULT 0,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_site_survey_configuration_versions_siteSurveyConfigurationId` (`SiteSurveyConfigurationId`),
  CONSTRAINT `FK_site_survey_configuration_versions_site_survey_configurations` FOREIGN KEY (`SiteSurveyConfigurationId`) REFERENCES `site_survey_configurations` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_survey_configuration_versions`
--

LOCK TABLES `site_survey_configuration_versions` WRITE;
/*!40000 ALTER TABLE `site_survey_configuration_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_survey_configuration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_survey_configurations`
--

DROP TABLE IF EXISTS `site_survey_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_survey_configurations` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `SiteId` int(11) NOT NULL DEFAULT 0,
  `SurveyConfigurationId` int(11) NOT NULL DEFAULT 0,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_site_survey_configurations_siteId` (`SiteId`),
  KEY `IX_site_survey_configurations_surveyConfigurationId` (`SurveyConfigurationId`),
  CONSTRAINT `FK_site_survey_configurations_sites_SiteId` FOREIGN KEY (`SiteId`) REFERENCES `sites` (`Id`) ON DELETE CASCADE,
  CONSTRAINT `FK_site_survey_configurations_survey_configurations_SurveyConfig` FOREIGN KEY (`SurveyConfigurationId`) REFERENCES `survey_configurations` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_survey_configurations`
--

LOCK TABLES `site_survey_configurations` WRITE;
/*!40000 ALTER TABLE `site_survey_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_survey_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_versions`
--

DROP TABLE IF EXISTS `site_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `SiteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_versions`
--

LOCK TABLES `site_versions` WRITE;
/*!40000 ALTER TABLE `site_versions` DISABLE KEYS */;
INSERT INTO `site_versions` VALUES (1,'2020-09-25 09:25:42.723205','2020-09-25 09:25:42.723207','ffebdb4a-5f86-8b8f-7aa0-547cb3603b29 5ecfa25e-f6c7-2a9f-1c07-24be849c24c0',129956,1,'created',1),(2,'2020-09-25 09:25:42.723205','2020-09-25 09:27:08.443207','ffebdb4a-5f86-8b8f-7aa0-547cb3603b29 5ecfa25e-f6c7-2a9f-1c07-24be849c24c0',129956,2,'removed',1);
/*!40000 ALTER TABLE `site_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_worker_versions`
--

DROP TABLE IF EXISTS `site_worker_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_worker_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SiteId` int(11) DEFAULT NULL,
  `WorkerId` int(11) DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `SiteWorkerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_worker_versions`
--

LOCK TABLES `site_worker_versions` WRITE;
/*!40000 ALTER TABLE `site_worker_versions` DISABLE KEYS */;
INSERT INTO `site_worker_versions` VALUES (1,1,1,166995,1,'created','2020-09-25 09:25:42.996741','2020-09-25 09:25:42.996741',1),(2,1,1,166995,2,'removed','2020-09-25 09:25:42.996741','2020-09-25 09:27:08.494310',1);
/*!40000 ALTER TABLE `site_worker_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_workers`
--

DROP TABLE IF EXISTS `site_workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_workers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `SiteId` int(11) DEFAULT NULL,
  `WorkerId` int(11) DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_site_workers_site_id` (`SiteId`),
  KEY `IX_site_workers_worker_id` (`WorkerId`),
  CONSTRAINT `FK_site_workers_sites_SiteId` FOREIGN KEY (`SiteId`) REFERENCES `sites` (`Id`),
  CONSTRAINT `FK_site_workers_workers_WorkerId` FOREIGN KEY (`WorkerId`) REFERENCES `workers` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_workers`
--

LOCK TABLES `site_workers` WRITE;
/*!40000 ALTER TABLE `site_workers` DISABLE KEYS */;
INSERT INTO `site_workers` VALUES (1,1,1,166995,2,'removed','2020-09-25 09:25:42.996741','2020-09-25 09:27:08.494310');
/*!40000 ALTER TABLE `site_workers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `MicrotingUid` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,'2020-09-25 09:25:42.723205','2020-09-25 09:27:08.443207','ffebdb4a-5f86-8b8f-7aa0-547cb3603b29 5ecfa25e-f6c7-2a9f-1c07-24be849c24c0',129956,2,'removed');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_configuration_versions`
--

DROP TABLE IF EXISTS `survey_configuration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_configuration_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Start` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000',
  `Stop` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000',
  `TimeToLive` int(11) NOT NULL DEFAULT 0,
  `Name` longtext DEFAULT NULL,
  `TimeOut` int(11) NOT NULL DEFAULT 0,
  `SurveyConfigurationId` int(11) NOT NULL DEFAULT 0,
  `QuestionSetId` int(11) NOT NULL DEFAULT 0,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_survey_configuration_versions_surveyConfigurationId` (`SurveyConfigurationId`),
  CONSTRAINT `FK_survey_configuration_versions_survey_configurations_SurveyCon` FOREIGN KEY (`SurveyConfigurationId`) REFERENCES `survey_configurations` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_configuration_versions`
--

LOCK TABLES `survey_configuration_versions` WRITE;
/*!40000 ALTER TABLE `survey_configuration_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_configuration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `survey_configurations`
--

DROP TABLE IF EXISTS `survey_configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `survey_configurations` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Start` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000',
  `Stop` datetime(6) NOT NULL DEFAULT '0001-01-01 00:00:00.000000',
  `TimeToLive` int(11) NOT NULL DEFAULT 0,
  `Name` longtext DEFAULT NULL,
  `TimeOut` int(11) NOT NULL DEFAULT 0,
  `QuestionSetId` int(11) NOT NULL DEFAULT 0,
  `MicrotingUid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_survey_configurations_QuestionSetId` (`QuestionSetId`),
  CONSTRAINT `FK_survey_configurations_question_sets_QuestionSetId` FOREIGN KEY (`QuestionSetId`) REFERENCES `question_sets` (`Id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `survey_configurations`
--

LOCK TABLES `survey_configurations` WRITE;
/*!40000 ALTER TABLE `survey_configurations` DISABLE KEYS */;
/*!40000 ALTER TABLE `survey_configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_versions`
--

DROP TABLE IF EXISTS `tag_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `TaggingsCount` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `TagId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_versions`
--

LOCK TABLES `tag_versions` WRITE;
/*!40000 ALTER TABLE `tag_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagging_versions`
--

DROP TABLE IF EXISTS `tagging_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tagging_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TagId` int(11) DEFAULT NULL,
  `CheckListId` int(11) DEFAULT NULL,
  `TaggerId` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `TaggingId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagging_versions`
--

LOCK TABLES `tagging_versions` WRITE;
/*!40000 ALTER TABLE `tagging_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `tagging_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggings` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TagId` int(11) DEFAULT NULL,
  `CheckListId` int(11) DEFAULT NULL,
  `TaggerId` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `IX_taggings_check_list_id` (`CheckListId`),
  KEY `IX_taggings_tag_id` (`TagId`),
  CONSTRAINT `FK_taggings_check_lists_CheckListId` FOREIGN KEY (`CheckListId`) REFERENCES `check_lists` (`Id`),
  CONSTRAINT `FK_taggings_tags_TagId` FOREIGN KEY (`TagId`) REFERENCES `tags` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `TaggingsCount` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unit_versions`
--

DROP TABLE IF EXISTS `unit_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MicrotingUid` int(11) DEFAULT NULL,
  `OtpCode` int(11) DEFAULT NULL,
  `CustomerNo` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `UnitId` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `SiteId` int(11) DEFAULT NULL,
  `Manufacturer` longtext DEFAULT NULL,
  `Model` longtext DEFAULT NULL,
  `Note` longtext DEFAULT NULL,
  `OsVersion` longtext DEFAULT NULL,
  `eFormVersion` longtext DEFAULT NULL,
  `InSightVersion` longtext DEFAULT NULL,
  `Os` longtext DEFAULT NULL,
  `LastIp` longtext DEFAULT NULL,
  `LeftMenuEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `PushEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `SeparateFetchSend` tinyint(1) NOT NULL DEFAULT 0,
  `SerialNumber` longtext DEFAULT NULL,
  `SyncDefaultDelay` int(11) NOT NULL DEFAULT 0,
  `SyncDelayEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `SyncDelayPrCheckList` int(11) NOT NULL DEFAULT 0,
  `SyncDialog` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_versions`
--

LOCK TABLES `unit_versions` WRITE;
/*!40000 ALTER TABLE `unit_versions` DISABLE KEYS */;
INSERT INTO `unit_versions` VALUES (1,141083,280852,342345,1,'created',1,'2020-09-25 09:25:42.810159','2020-09-25 09:25:42.810160',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,0,0,0,0);
/*!40000 ALTER TABLE `unit_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `MicrotingUid` int(11) DEFAULT NULL,
  `OtpCode` int(11) DEFAULT NULL,
  `CustomerNo` int(11) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `SiteId` int(11) DEFAULT NULL,
  `Manufacturer` longtext DEFAULT NULL,
  `Model` longtext DEFAULT NULL,
  `Note` longtext DEFAULT NULL,
  `OsVersion` longtext DEFAULT NULL,
  `eFormVersion` longtext DEFAULT NULL,
  `InSightVersion` longtext DEFAULT NULL,
  `Os` longtext DEFAULT NULL,
  `LastIp` longtext DEFAULT NULL,
  `LeftMenuEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `PushEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `SeparateFetchSend` tinyint(1) NOT NULL DEFAULT 0,
  `SerialNumber` longtext DEFAULT NULL,
  `SyncDefaultDelay` int(11) NOT NULL DEFAULT 0,
  `SyncDelayEnabled` tinyint(1) NOT NULL DEFAULT 0,
  `SyncDelayPrCheckList` int(11) NOT NULL DEFAULT 0,
  `SyncDialog` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `IX_units_site_id` (`SiteId`),
  CONSTRAINT `FK_units_sites_SiteId` FOREIGN KEY (`SiteId`) REFERENCES `sites` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,141083,280852,342345,1,'created','2020-09-25 09:25:42.810159','2020-09-25 09:25:42.810160',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,0,0,0,0);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploaded_data`
--

DROP TABLE IF EXISTS `uploaded_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploaded_data` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `UploaderId` int(11) DEFAULT NULL,
  `Checksum` varchar(255) DEFAULT NULL,
  `Extension` varchar(255) DEFAULT NULL,
  `CurrentFile` varchar(255) DEFAULT NULL,
  `UploaderType` varchar(255) DEFAULT NULL,
  `FileLocation` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `ExpirationDate` datetime(6) DEFAULT NULL,
  `Local` smallint(6) DEFAULT NULL,
  `TranscriptionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploaded_data`
--

LOCK TABLES `uploaded_data` WRITE;
/*!40000 ALTER TABLE `uploaded_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploaded_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploaded_data_versions`
--

DROP TABLE IF EXISTS `uploaded_data_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploaded_data_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `DataUploadedId` int(11) DEFAULT NULL,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `UploaderId` int(11) DEFAULT NULL,
  `Checksum` varchar(255) DEFAULT NULL,
  `Extension` varchar(255) DEFAULT NULL,
  `CurrentFile` varchar(255) DEFAULT NULL,
  `UploaderType` varchar(255) DEFAULT NULL,
  `FileLocation` varchar(255) DEFAULT NULL,
  `FileName` varchar(255) DEFAULT NULL,
  `ExpirationDate` datetime(6) DEFAULT NULL,
  `Local` smallint(6) DEFAULT NULL,
  `TranscriptionId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploaded_data_versions`
--

LOCK TABLES `uploaded_data_versions` WRITE;
/*!40000 ALTER TABLE `uploaded_data_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploaded_data_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `worker_versions`
--

DROP TABLE IF EXISTS `worker_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `worker_versions` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `MicrotingUid` int(11) NOT NULL DEFAULT 0,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `WorkerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker_versions`
--

LOCK TABLES `worker_versions` WRITE;
/*!40000 ALTER TABLE `worker_versions` DISABLE KEYS */;
INSERT INTO `worker_versions` VALUES (1,'2020-09-25 09:25:42.912260','2020-09-25 09:25:42.912260',164078,'created',1,'ffebdb4a-5f86-8b8f-7aa0-547cb3603b29','5ecfa25e-f6c7-2a9f-1c07-24be849c24c0','129956.342345@invalid.invalid',1),(2,'2020-09-25 09:25:42.912260','2020-09-25 09:27:08.531489',164078,'removed',2,'ffebdb4a-5f86-8b8f-7aa0-547cb3603b29','5ecfa25e-f6c7-2a9f-1c07-24be849c24c0','129956.342345@invalid.invalid',1);
/*!40000 ALTER TABLE `worker_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers`
--

DROP TABLE IF EXISTS `workers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workers` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CreatedAt` datetime(6) DEFAULT NULL,
  `UpdatedAt` datetime(6) DEFAULT NULL,
  `MicrotingUid` int(11) NOT NULL DEFAULT 0,
  `WorkflowState` varchar(255) DEFAULT NULL,
  `Version` int(11) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers`
--

LOCK TABLES `workers` WRITE;
/*!40000 ALTER TABLE `workers` DISABLE KEYS */;
INSERT INTO `workers` VALUES (1,'2020-09-25 09:25:42.912260','2020-09-25 09:27:08.531489',164078,'removed',2,'ffebdb4a-5f86-8b8f-7aa0-547cb3603b29','5ecfa25e-f6c7-2a9f-1c07-24be849c24c0','129956.342345@invalid.invalid');
/*!40000 ALTER TABLE `workers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-25  9:27:29
