-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: qraat
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `afsk`
--

DROP TABLE IF EXISTS `afsk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afsk` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `deploymentID` int(10) unsigned DEFAULT NULL,
  `siteID` int(10) unsigned DEFAULT NULL,
  `start_timestamp` decimal(16,6) DEFAULT NULL COMMENT 'Unix Timestamp (s.us)',
  `stop_timestamp` decimal(16,6) DEFAULT NULL COMMENT 'Unix Timestamp (s.us)',
  `message` varchar(50) DEFAULT NULL,
  `binary_data` varbinary(63) DEFAULT NULL,
  `error` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afsk`
--

LOCK TABLES `afsk` WRITE;
/*!40000 ALTER TABLE `afsk` DISABLE KEYS */;
/*!40000 ALTER TABLE `afsk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_config`
--

DROP TABLE IF EXISTS `archive_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive_config` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tablename` varchar(100) DEFAULT NULL COMMENT 'The name of the table to be archived',
  `archive` tinyint(1) DEFAULT '0' COMMENT 'Set to 1 to archive this table, 0 to ignore this table',
  `lastid` bigint(20) unsigned DEFAULT NULL COMMENT 'Set to the ID of the last archived record',
  `chunk` int(11) DEFAULT NULL COMMENT 'Maximum size of a chunk, in records, 0 to disable chunking',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_config`
--

LOCK TABLES `archive_config` WRITE;
/*!40000 ALTER TABLE `archive_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive_log`
--

DROP TABLE IF EXISTS `archive_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive_log` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` decimal(16,6) NOT NULL COMMENT 'Time at which the table (chunk) was archived',
  `filename` varchar(100) NOT NULL COMMENT 'Filename for the table (chunk)',
  `tablename` varchar(30) NOT NULL COMMENT 'Name of the archived table',
  `startid` bigint(20) unsigned NOT NULL COMMENT 'First ID of the records written to the file',
  `finishid` bigint(20) unsigned NOT NULL COMMENT 'Last ID of the records written to the file',
  `mindt` datetime DEFAULT NULL COMMENT 'Earliest datetime of all records in chunk, if datetime exists',
  `maxdt` datetime DEFAULT NULL COMMENT 'Latest datetime of all records in chunk, if datetime exists',
  `mints` decimal(16,6) DEFAULT NULL COMMENT 'Earliest timestamp of all records in chunk, if timestamp exists',
  `maxts` decimal(16,6) DEFAULT NULL COMMENT 'Latest timestamp of all records in chunk, if timestamp exists',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_log`
--

LOCK TABLES `archive_log` WRITE;
/*!40000 ALTER TABLE `archive_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_project_collaborator`
--

DROP TABLE IF EXISTS `auth_project_collaborator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_project_collaborator` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(10) unsigned NOT NULL COMMENT 'References GUID in web frontend, i.e. `django.auth_group.id`.',
  `projectID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `groupID` (`groupID`,`projectID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `auth_project_collaborator_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_project_collaborator`
--

LOCK TABLES `auth_project_collaborator` WRITE;
/*!40000 ALTER TABLE `auth_project_collaborator` DISABLE KEYS */;
INSERT INTO `auth_project_collaborator` VALUES (9,2,1),(10,4,2),(13,10,5);
/*!40000 ALTER TABLE `auth_project_collaborator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_project_viewer`
--

DROP TABLE IF EXISTS `auth_project_viewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_project_viewer` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(10) unsigned NOT NULL COMMENT 'References GUID in web frontend, i.e. `django.auth_group.id`.',
  `projectID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `groupID` (`groupID`,`projectID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `auth_project_viewer_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_project_viewer`
--

LOCK TABLES `auth_project_viewer` WRITE;
/*!40000 ALTER TABLE `auth_project_viewer` DISABLE KEYS */;
INSERT INTO `auth_project_viewer` VALUES (8,1,1),(9,3,2),(12,9,5);
/*!40000 ALTER TABLE `auth_project_viewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bearing`
--

DROP TABLE IF EXISTS `bearing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bearing` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deploymentID` int(10) unsigned DEFAULT NULL,
  `siteID` int(10) unsigned NOT NULL,
  `timestamp` decimal(16,6) NOT NULL,
  `bearing` double NOT NULL COMMENT 'Most likely bearing, not interpolated. [0,360) degrees',
  `likelihood` double NOT NULL COMMENT 'Normalized likelihood of most likely bearing. [0,1]',
  `activity` double DEFAULT NULL COMMENT 'Normalized activity metric. [0,1]',
  `number_est_used` int(10) unsigned DEFAULT NULL COMMENT 'Number of contributing est records.',
  PRIMARY KEY (`ID`),
  KEY `timestamp` (`timestamp`),
  KEY `deploymentID` (`deploymentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bearing`
--

LOCK TABLES `bearing` WRITE;
/*!40000 ALTER TABLE `bearing` DISABLE KEYS */;
/*!40000 ALTER TABLE `bearing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calibration_information`
--

DROP TABLE IF EXISTS `calibration_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calibration_information` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` text,
  `deploymentID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calibration_information`
--

LOCK TABLES `calibration_information` WRITE;
/*!40000 ALTER TABLE `calibration_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `calibration_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deployment`
--

DROP TABLE IF EXISTS `deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deployment` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `time_start` decimal(16,6) DEFAULT NULL COMMENT 'Unix Timestamp (s.us)',
  `time_end` decimal(16,6) DEFAULT NULL COMMENT 'Unix Timestamp (s.us)',
  `txID` int(10) unsigned NOT NULL,
  `targetID` int(10) unsigned NOT NULL,
  `projectID` int(10) unsigned NOT NULL COMMENT 'Project to which deployment is associated.',
  `is_active` tinyint(1) DEFAULT '0',
  `is_hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `txID` (`txID`),
  KEY `targetID` (`targetID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `deployment_ibfk_1` FOREIGN KEY (`txID`) REFERENCES `tx` (`ID`),
  CONSTRAINT `deployment_ibfk_2` FOREIGN KEY (`targetID`) REFERENCES `target` (`ID`),
  CONSTRAINT `deployment_ibfk_3` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deployment`
--

LOCK TABLES `deployment` WRITE;
/*!40000 ALTER TABLE `deployment` DISABLE KEYS */;
INSERT INTO `deployment` VALUES (51,'','Initial calibration run with test transmitter in gator with Garmin GPS',1376420400.000000,1376442000.000000,51,1,2,0,0),(60,'','Beacon transmitter at site 34',1383012000.000000,1384527600.000000,60,1,1,0,0),(61,'','Walking test with woodrat transmitter and garmin GPS',1391241600.000000,1396767600.000000,61,16,1,0,0),(62,'','Walking test with woodrat transmitter and garmin GPS',1391241600.000000,1396767600.000000,62,17,1,0,0),(63,'',NULL,1400331600.000000,NULL,63,28,5,1,0),(64,'',NULL,1400331600.000000,NULL,64,29,5,1,0),(68,'',NULL,1400418000.000000,NULL,68,30,5,1,0);
/*!40000 ALTER TABLE `deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detcount`
--

DROP TABLE IF EXISTS `detcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detcount` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `siteID` int(10) unsigned NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `timezone` varchar(6) DEFAULT NULL,
  `server` int(11) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `timestamp` decimal(16,6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detcount`
--

LOCK TABLES `detcount` WRITE;
/*!40000 ALTER TABLE `detcount` DISABLE KEYS */;
/*!40000 ALTER TABLE `detcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `est`
--

DROP TABLE IF EXISTS `est`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `est` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `siteID` int(10) unsigned DEFAULT NULL,
  `timestamp` decimal(16,6) DEFAULT NULL COMMENT 'Unix Timestamp (s.us)',
  `frequency` int(11) DEFAULT NULL COMMENT 'Tag Frequency (Hz)',
  `center` int(11) DEFAULT NULL COMMENT 'Band Center Frequency (Hz)',
  `fdsp` double DEFAULT NULL COMMENT 'Fourier Decomposition Signal Power',
  `fd1r` double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 1 - real part',
  `fd1i` double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 1 - imaginary part',
  `fd2r` double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 2 - real part',
  `fd2i` double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 2 - imaginary part',
  `fd3r` double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 3 - real part',
  `fd3i` double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 3 - imaginary part',
  `fd4r` double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 4 - real part',
  `fd4i` double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 4 - imaginary part',
  `band3` smallint(6) DEFAULT NULL COMMENT ' ',
  `band10` smallint(6) DEFAULT NULL COMMENT '10dB Bandwidth',
  `edsp` double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal Power',
  `ed1r` double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 1 - real part',
  `ed1i` double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 1 - imaginary part',
  `ed2r` double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 2 - real part',
  `ed2i` double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 2 - imaginary part',
  `ed3r` double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 3 - real part',
  `ed3i` double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 3 - imaginary part',
  `ed4r` double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 4 - real part',
  `ed4i` double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 4 - imaginary part',
  `ec` double DEFAULT NULL COMMENT 'Eigenvalue Confidence',
  `tnp` double DEFAULT NULL COMMENT 'Total Noise Power',
  `nc11r` double DEFAULT NULL COMMENT 'Noise Covariance 11 - real part',
  `nc11i` double DEFAULT NULL COMMENT 'Noise Covariance 11 - imaginary part',
  `nc12r` double DEFAULT NULL COMMENT 'Noise Covariance 12 - real part',
  `nc12i` double DEFAULT NULL COMMENT 'Noise Covariance 12 - imaginary part',
  `nc13r` double DEFAULT NULL COMMENT 'Noise Covariance 13 - real part',
  `nc13i` double DEFAULT NULL COMMENT 'Noise Covariance 13 - imaginary part',
  `nc14r` double DEFAULT NULL COMMENT 'Noise Covariance 14 - real part',
  `nc14i` double DEFAULT NULL COMMENT 'Noise Covariance 14 - imaginary part',
  `nc21r` double DEFAULT NULL COMMENT 'Noise Covariance 21 - real part',
  `nc21i` double DEFAULT NULL COMMENT 'Noise Covariance 21 - imaginary part',
  `nc22r` double DEFAULT NULL COMMENT 'Noise Covariance 22 - real part',
  `nc22i` double DEFAULT NULL COMMENT 'Noise Covariance 22 - imaginary part',
  `nc23r` double DEFAULT NULL COMMENT 'Noise Covariance 23 - real part',
  `nc23i` double DEFAULT NULL COMMENT 'Noise Covariance 23 - imaginary part',
  `nc24r` double DEFAULT NULL COMMENT 'Noise Covariance 24 - real part',
  `nc24i` double DEFAULT NULL COMMENT 'Noise Covariance 24 - imaginary part',
  `nc31r` double DEFAULT NULL COMMENT 'Noise Covariance 31 - real part',
  `nc31i` double DEFAULT NULL COMMENT 'Noise Covariance 31 - imaginary part',
  `nc32r` double DEFAULT NULL COMMENT 'Noise Covariance 32 - real part',
  `nc32i` double DEFAULT NULL COMMENT 'Noise Covariance 32 - imaginary part',
  `nc33r` double DEFAULT NULL COMMENT 'Noise Covariance 33 - real part',
  `nc33i` double DEFAULT NULL COMMENT 'Noise Covariance 33 - imaginary part',
  `nc34r` double DEFAULT NULL COMMENT 'Noise Covariance 34 - real part',
  `nc34i` double DEFAULT NULL COMMENT 'Noise Covariance 34 - imaginary part',
  `nc41r` double DEFAULT NULL COMMENT 'Noise Covariance 41 - real part',
  `nc41i` double DEFAULT NULL COMMENT 'Noise Covariance 41 - imaginary part',
  `nc42r` double DEFAULT NULL COMMENT 'Noise Covariance 42 - real part',
  `nc42i` double DEFAULT NULL COMMENT 'Noise Covariance 42 - imaginary part',
  `nc43r` double DEFAULT NULL COMMENT 'Noise Covariance 43 - real part',
  `nc43i` double DEFAULT NULL COMMENT 'Noise Covariance 43 - imaginary part',
  `nc44r` double DEFAULT NULL COMMENT 'Noise Covariance 44 - real part',
  `nc44i` double DEFAULT NULL COMMENT 'Noise Covariance 44 - imaginary part',
  `fdsnr` double DEFAULT NULL COMMENT 'Fourier Decomposition SNR (dB)',
  `edsnr` double DEFAULT NULL COMMENT 'Eigenvalue Decomposition SNR (dB)',
  `deploymentID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `timestamp` (`timestamp`),
  KEY `siteid` (`siteID`),
  KEY `deploymentID` (`deploymentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `est`
--

LOCK TABLES `est` WRITE;
/*!40000 ALTER TABLE `est` DISABLE KEYS */;
/*!40000 ALTER TABLE `est` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estcount`
--

DROP TABLE IF EXISTS `estcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estcount` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `siteID` int(10) unsigned NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `timezone` varchar(6) DEFAULT NULL,
  `server` int(11) DEFAULT NULL,
  `site` int(11) DEFAULT NULL,
  `timestamp` decimal(16,6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estcount`
--

LOCK TABLES `estcount` WRITE;
/*!40000 ALTER TABLE `estcount` DISABLE KEYS */;
/*!40000 ALTER TABLE `estcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estinterval`
--

DROP TABLE IF EXISTS `estinterval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estinterval` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deploymentID` int(10) unsigned NOT NULL,
  `siteID` int(10) unsigned NOT NULL,
  `timestamp` decimal(16,6) NOT NULL COMMENT 'Start of interval.',
  `duration` double NOT NULL COMMENT 'Duration of the interval in seconds.',
  `pulse_interval` double DEFAULT NULL COMMENT 'Estimated pulse rate of the transmitter in seconds (mode).',
  `pulse_variation` double DEFAULT NULL COMMENT 'Measurement of varition of the pulse rate (second moment).',
  PRIMARY KEY (`ID`),
  KEY `deploymentID` (`deploymentID`,`siteID`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estinterval`
--

LOCK TABLES `estinterval` WRITE;
/*!40000 ALTER TABLE `estinterval` DISABLE KEYS */;
/*!40000 ALTER TABLE `estinterval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estscore`
--

DROP TABLE IF EXISTS `estscore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estscore` (
  `estID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `score` int(11) NOT NULL COMMENT 'Number of coroborating pulses or flagged as bad (negative).',
  `max_score` int(11) NOT NULL COMMENT 'Maximum score over pulse score neighborhood.',
  `theoretical_score` int(11) NOT NULL COMMENT 'Optimal score over score interval.',
  PRIMARY KEY (`estID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estscore`
--

LOCK TABLES `estscore` WRITE;
/*!40000 ALTER TABLE `estscore` DISABLE KEYS */;
/*!40000 ALTER TABLE `estscore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gps_data`
--

DROP TABLE IF EXISTS `gps_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gps_data` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deploymentID` int(10) unsigned DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(11,6) DEFAULT NULL,
  `elevation` decimal(7,2) DEFAULT NULL,
  `easting` decimal(9,2) DEFAULT NULL,
  `northing` decimal(10,2) DEFAULT NULL,
  `utm_zone_number` tinyint(3) unsigned DEFAULT '10',
  `utm_zone_letter` char(1) DEFAULT 'S',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gps_data`
--

LOCK TABLES `gps_data` WRITE;
/*!40000 ALTER TABLE `gps_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `gps_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `projectID` int(10) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `location` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(11,6) DEFAULT NULL,
  `easting` decimal(9,2) unsigned DEFAULT '0.00',
  `northing` decimal(10,2) unsigned DEFAULT '0.00',
  `utm_zone_number` tinyint(3) unsigned DEFAULT '10',
  `utm_zone_letter` char(1) DEFAULT 'S',
  `elevation` decimal(7,2) DEFAULT '0.00',
  `is_hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (7,1,'server',NULL,'Field Station',38.483052,-122.149580,574172.77,4259755.45,10,'S',394.02,0),(9,1,'site34',NULL,'Decker Canyon, Beacon TX',38.493453,-122.148040,574296.45,4260910.87,10,'S',174.19,0),(10,1,'center',NULL,'Center for position estimation',0.000000,0.000000,574500.00,4260500.00,10,'S',0.00,0);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `position` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `deploymentID` int(10) unsigned DEFAULT NULL,
  `timestamp` decimal(16,6) NOT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(11,6) DEFAULT NULL,
  `easting` decimal(9,2) NOT NULL COMMENT 'Most likely position (UTM east).',
  `northing` decimal(10,2) NOT NULL COMMENT 'Most likely position (UTM north).',
  `utm_zone_number` tinyint(3) unsigned DEFAULT '10' COMMENT 'Most likely position (UTM zone).',
  `utm_zone_letter` varchar(1) DEFAULT 'S' COMMENT 'Most likely position (UTM zone letter).',
  `likelihood` double NOT NULL COMMENT 'Normalized likelihood value at most likely position. [0,1]',
  `activity` double DEFAULT NULL COMMENT 'Averaged over bearing data from all sites. [0,1]',
  `number_est_used` int(10) unsigned DEFAULT NULL COMMENT 'Number of contributing est records.',
  PRIMARY KEY (`ID`),
  KEY `timestamp` (`timestamp`),
  KEY `deploymentID` (`deploymentID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processing_cursor`
--

DROP TABLE IF EXISTS `processing_cursor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processing_cursor` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` bigint(20) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processing_cursor`
--

LOCK TABLES `processing_cursor` WRITE;
/*!40000 ALTER TABLE `processing_cursor` DISABLE KEYS */;
/*!40000 ALTER TABLE `processing_cursor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processing_statistics`
--

DROP TABLE IF EXISTS `processing_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processing_statistics` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `duration` double unsigned DEFAULT NULL,
  `process` varchar(100) NOT NULL,
  `beginning_timestamp` decimal(16,6) DEFAULT NULL,
  `ending_timestamp` decimal(16,6) DEFAULT NULL,
  `beginning_index` bigint(20) unsigned DEFAULT NULL,
  `ending_index` bigint(20) unsigned DEFAULT NULL,
  `number_records_input` int(10) unsigned DEFAULT NULL,
  `number_records_output` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processing_statistics`
--

LOCK TABLES `processing_statistics` WRITE;
/*!40000 ALTER TABLE `processing_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `processing_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procount`
--

DROP TABLE IF EXISTS `procount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procount` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `siteID` int(10) unsigned NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `timezone` varchar(6) DEFAULT NULL,
  `estserver` int(11) DEFAULT NULL,
  `festserver` int(11) DEFAULT NULL,
  `timestamp` decimal(16,6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procount`
--

LOCK TABLES `procount` WRITE;
/*!40000 ALTER TABLE `procount` DISABLE KEYS */;
/*!40000 ALTER TABLE `procount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownerID` int(10) unsigned NOT NULL COMMENT 'References UUID in web frontend, i.e. `django.auth_user.id`.',
  `name` varchar(50) NOT NULL,
  `description` text,
  `is_public` tinyint(1) NOT NULL,
  `is_hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,12,'QRAAT','Project for general system use',0,0),(2,12,'QRAAT Calibration','Project for deployments involved with calibration.',0,0),(5,12,'Foxes','Foxes tagged May 2014',0,0);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provenance`
--

DROP TABLE IF EXISTS `provenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provenance` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `obj_table` varchar(30) NOT NULL,
  `obj_id` bigint(20) unsigned NOT NULL,
  `dep_table` varchar(30) NOT NULL,
  `dep_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provenance`
--

LOCK TABLES `provenance` WRITE;
/*!40000 ALTER TABLE `provenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `provenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site`
--

DROP TABLE IF EXISTS `site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(11,6) DEFAULT NULL,
  `easting` decimal(9,2) unsigned DEFAULT '0.00',
  `northing` decimal(10,2) unsigned DEFAULT '0.00',
  `utm_zone_number` tinyint(3) unsigned DEFAULT '10',
  `utm_zone_letter` char(1) DEFAULT 'S',
  `elevation` decimal(7,2) DEFAULT '0.00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site`
--

LOCK TABLES `site` WRITE;
/*!40000 ALTER TABLE `site` DISABLE KEYS */;
INSERT INTO `site` VALUES (1,'site1','Field Station',38.483052,-122.149580,574172.77,4259755.45,10,'S',394.02),(2,'site2','DFG Hill Tower',38.499708,-122.148620,574239.47,4261604.51,10,'S',363.50),(3,'site10','Dan\'s Repeater',38.499326,-122.139744,575013.86,4261569.32,10,'S',376.96),(4,'site13','Blue Oak Tower',38.491643,-122.152812,573882.15,4260706.17,10,'S',273.14),(5,'site20','QRWC Tower',38.491915,-122.136299,575321.92,4260749.75,10,'S',424.54),(6,'site21','Weaver Tower',38.492924,-122.142340,574794.06,4260856.82,10,'S',293.57),(8,'site39','SiteK',38.495187,-122.151417,574000.17,4261100.56,10,'S',199.29);
/*!40000 ALTER TABLE `site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `steering_vectors`
--

DROP TABLE IF EXISTS `steering_vectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `steering_vectors` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `cal_infoID` int(10) unsigned DEFAULT NULL,
  `siteID` int(10) unsigned DEFAULT NULL,
  `bearing` decimal(5,2) DEFAULT NULL,
  `sv1r` double DEFAULT NULL,
  `sv1i` double DEFAULT NULL,
  `sv2r` double DEFAULT NULL,
  `sv2i` double DEFAULT NULL,
  `sv3r` double DEFAULT NULL,
  `sv3i` double DEFAULT NULL,
  `sv4r` double DEFAULT NULL,
  `sv4i` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `steering_vectors`
--

LOCK TABLES `steering_vectors` WRITE;
/*!40000 ALTER TABLE `steering_vectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `steering_vectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `target`
--

DROP TABLE IF EXISTS `target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `target` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `projectID` int(10) unsigned NOT NULL COMMENT 'Project for which target was originally created.',
  `is_hidden` tinyint(1) DEFAULT '0',
  `max_speed_family` enum('exp','linear','const') DEFAULT NULL,
  `speed_burst` double DEFAULT NULL,
  `speed_sustained` double DEFAULT NULL,
  `speed_limit` double NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `target_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `target`
--

LOCK TABLES `target` WRITE;
/*!40000 ALTER TABLE `target` DISABLE KEYS */;
INSERT INTO `target` VALUES (1,'Gator','Early calibration runs were done with a 4x4 on the reserve trails.',1,0,NULL,NULL,2.5,0),(16,'woodrat1','Human walking test. (\"Woodrat\" is a misnomer.)',1,0,'linear',0.5,0.1,0),(17,'woodrat2','Human walking test. (\"Woodrat\" is a misnomer.)',1,0,'linear',0.5,0.1,0),(28,'QR9','Male Fox',5,0,'linear',0.25,0.05,0),(29,'QR10','Female Fox',5,0,'linear',0.25,0.05,0),(30,'QR1','Male Fox, priviously caught',5,0,'linear',0.25,0.05,0);
/*!40000 ALTER TABLE `target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telemetry`
--

DROP TABLE IF EXISTS `telemetry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telemetry` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `siteID` int(10) unsigned NOT NULL,
  `timestamp` decimal(16,6) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `timezone` varchar(6) DEFAULT NULL,
  `intemp` decimal(4,2) DEFAULT NULL,
  `extemp` decimal(4,2) DEFAULT NULL,
  `voltage` decimal(4,2) DEFAULT NULL,
  `ping_power` int(11) DEFAULT NULL,
  `ping_computer` int(11) DEFAULT NULL,
  `site_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telemetry`
--

LOCK TABLES `telemetry` WRITE;
/*!40000 ALTER TABLE `telemetry` DISABLE KEYS */;
/*!40000 ALTER TABLE `telemetry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timecheck`
--

DROP TABLE IF EXISTS `timecheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timecheck` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `siteID` bigint(10) unsigned NOT NULL,
  `timestamp` decimal(16,6) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `timezone` varchar(6) DEFAULT NULL,
  `time_offset` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timecheck`
--

LOCK TABLES `timecheck` WRITE;
/*!40000 ALTER TABLE `timecheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `timecheck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `track_pos`
--

DROP TABLE IF EXISTS `track_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `track_pos` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `positionID` bigint(20) unsigned DEFAULT NULL,
  `deploymentID` int(10) unsigned NOT NULL DEFAULT '0',
  `timestamp` decimal(16,6) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `deploymentID` (`deploymentID`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `track_pos`
--

LOCK TABLES `track_pos` WRITE;
/*!40000 ALTER TABLE `track_pos` DISABLE KEYS */;
/*!40000 ALTER TABLE `track_pos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `true_position`
--

DROP TABLE IF EXISTS `true_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `true_position` (
  `estID` bigint(20) unsigned NOT NULL,
  `easting` decimal(9,2) DEFAULT NULL,
  `northing` decimal(10,2) DEFAULT NULL,
  `bearing` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`estID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `true_position`
--

LOCK TABLES `true_position` WRITE;
/*!40000 ALTER TABLE `true_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `true_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx`
--

DROP TABLE IF EXISTS `tx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `serial_no` varchar(50) NOT NULL,
  `tx_makeID` int(10) unsigned NOT NULL,
  `projectID` int(10) unsigned NOT NULL COMMENT 'Project for which transmitter was originally created.',
  `frequency` double NOT NULL,
  `is_hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `tx_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx`
--

LOCK TABLES `tx` WRITE;
/*!40000 ALTER TABLE `tx` DISABLE KEYS */;
INSERT INTO `tx` VALUES (51,'tuneable_tx','',1,2,164.5,0),(60,'Beacon','',1,1,164,0),(61,'woodrat1','',2,1,164.092,0),(62,'woodrat2','',2,1,164.103,0),(63,'','190785',4,5,163.847,0),(64,'','190786',4,5,163.874,0),(65,'','190787',4,5,163.908,0),(66,'','190788',4,5,163.921,0),(67,'','190789',4,5,163.974,0),(68,'','190790',4,5,163.997,0);
/*!40000 ALTER TABLE `tx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_make`
--

DROP TABLE IF EXISTS `tx_make`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_make` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `demod_type` enum('pulse','cont','afsk') DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_make`
--

LOCK TABLES `tx_make` WRITE;
/*!40000 ALTER TABLE `tx_make` DISABLE KEYS */;
INSERT INTO `tx_make` VALUES (1,'Ben Kamen','Tuneable transmitter','pulse'),(2,'ATS','M1520','pulse'),(3,'ATS','M1450','pulse'),(4,'Holohil','MI-2M(12)','pulse');
/*!40000 ALTER TABLE `tx_make` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_make_parameters`
--

DROP TABLE IF EXISTS `tx_make_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_make_parameters` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tx_makeID` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `tx_makeID` (`tx_makeID`),
  KEY `name` (`name`),
  CONSTRAINT `tx_make_parameters_ibfk_1` FOREIGN KEY (`tx_makeID`) REFERENCES `tx_make` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_make_parameters`
--

LOCK TABLES `tx_make_parameters` WRITE;
/*!40000 ALTER TABLE `tx_make_parameters` DISABLE KEYS */;
INSERT INTO `tx_make_parameters` VALUES (49,1,'pulse_width','20'),(50,1,'pulse_rate','60'),(51,1,'band3',''),(52,1,'band10',''),(53,2,'pulse_width','15'),(54,2,'pulse_rate','25'),(55,2,'band3','150'),(56,2,'band10','900'),(57,3,'pulse_width','15'),(58,3,'pulse_rate','23'),(59,3,'band3','150'),(60,3,'band10','900'),(61,4,'pulse_width','30'),(62,4,'pulse_rate','40'),(63,4,'band3','150'),(64,4,'band10','900');
/*!40000 ALTER TABLE `tx_make_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tx_parameters`
--

DROP TABLE IF EXISTS `tx_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tx_parameters` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `txID` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `txID` (`txID`),
  KEY `name` (`name`),
  CONSTRAINT `tx_parameters_ibfk_1` FOREIGN KEY (`txID`) REFERENCES `tx` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2261 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tx_parameters`
--

LOCK TABLES `tx_parameters` WRITE;
/*!40000 ALTER TABLE `tx_parameters` DISABLE KEYS */;
INSERT INTO `tx_parameters` VALUES (2009,51,'pulse_width','20'),(2010,51,'pulse_rate','60'),(2011,51,'band3',''),(2012,51,'band10',''),(2045,60,'pulse_width','20'),(2046,60,'pulse_rate','60'),(2047,60,'band3',''),(2048,60,'band10',''),(2049,61,'pulse_width','19'),(2050,61,'pulse_rate','23'),(2051,61,'band3','150'),(2052,61,'band10','900'),(2053,62,'pulse_width','19'),(2054,62,'pulse_rate','23'),(2055,62,'band3','150'),(2056,62,'band10','900'),(2057,63,'pulse_width','30'),(2058,63,'pulse_rate','39.6'),(2059,63,'band3','150'),(2060,63,'band10','900'),(2061,64,'pulse_width','30'),(2062,64,'pulse_rate','39.6'),(2063,64,'band3','150'),(2064,64,'band10','900'),(2065,65,'pulse_width','30'),(2066,65,'pulse_rate','39'),(2067,65,'band3','150'),(2068,65,'band10','900'),(2069,66,'pulse_width','30'),(2070,66,'pulse_rate','39.6'),(2071,66,'band3','150'),(2072,66,'band10','900'),(2073,67,'pulse_width','30'),(2074,67,'pulse_rate','40.2'),(2075,67,'band3','150'),(2076,67,'band10','900'),(2077,68,'pulse_width','30'),(2078,68,'pulse_rate','39.6'),(2079,68,'band3','150'),(2080,68,'band10','900');
/*!40000 ALTER TABLE `tx_parameters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-13 10:35:17
