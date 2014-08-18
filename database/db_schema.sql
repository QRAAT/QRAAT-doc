-- WARNING!! When altering the DB schema, don't run this script directly. 
-- There are some stuff at the bottom which will smash the automated data
-- flow. 

SET GLOBAL innodb_file_per_table=1;

--Site
CREATE TABLE IF NOT EXISTS qraat.`site` (
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
) ENGINE=InnoDB;

--Project
CREATE TABLE IF NOT EXISTS qraat.`project` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownerID` int(10) unsigned NOT NULL COMMENT 'References UUID in web frontend, i.e. `django.auth_user.id`.',
  `name` varchar(50) NOT NULL,
  `description` text,
  `is_public` tinyint(1) NOT NULL,
  `is_hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS qraat.`auth_project_viewer` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(10) unsigned NOT NULL COMMENT 'References GUID in web frontend, i.e. `django.auth_group.id`.',
  `projectID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `auth_project_viewer_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS qraat.`auth_project_collaborator` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int(10) unsigned NOT NULL COMMENT 'References GUID in web frontend, i.e. `django.auth_group.id`.',
  `projectID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `auth_project_collaborator_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB;

--Transmitter
CREATE TABLE IF NOT EXISTS qraat.`tx` (
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
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS qraat.`tx_make` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `demod_type` enum('pulse','cont','afsk') DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS qraat.`tx_parameters` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `txID` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` varchar(64) NOT NULL,
  `units` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `txID` (`txID`),
  KEY `name` (`name`),
  CONSTRAINT `tx_parameters_ibfk_1` FOREIGN KEY (`txID`) REFERENCES `tx` (`ID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS qraat.`tx_make_parameters` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tx_makeID` int(10) unsigned NOT NULL,
  `name` varchar(32) NOT NULL,
  `value` varchar(64) NOT NULL,
  `units` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `tx_makeID` (`tx_makeID`),
  KEY `name` (`name`),
  CONSTRAINT `tx_make_parameters_ibfk_1` FOREIGN KEY (`tx_makeID`) REFERENCES `tx_make` (`ID`)
) ENGINE=InnoDB;

--Target
CREATE TABLE IF NOT EXISTS qraat.`target` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `projectID` int(10) unsigned NOT NULL COMMENT 'Project for which target was originally created.',
  `is_hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `target_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB;

--Project Locations
CREATE TABLE IF NOT EXISTS qraat.`location` (
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
) ENGINE=InnoDB;

--Deployment
CREATE TABLE IF NOT EXISTS qraat.`deployment` (
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
) ENGINE=InnoDB;

--EST
CREATE TABLE IF NOT EXISTS qraat.`est` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) DEFAULT NULL,
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
  `deploymentID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `timestamp` (`timestamp`),
  KEY `txid` (`deploymentID`),
  KEY `frequency` (`frequency`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS qraat.`estscore` (
  `estID` bigint(20) NOT NULL,
  `score` int(11) NOT NULL COMMENT 'Number of coroborating pulses or flagged as bad (negative).',
  `max_score` int(11) NOT NULL COMMENT 'Maximum score over pulse score neighborhood.',
  `theoretical_score` int(11) NOT NULL COMMENT 'Optimal score over score interval.',
  PRIMARY KEY (`estID`)
) ENGINE=MyISAM;

--Telemetry
CREATE TABLE IF NOT EXISTS qraat.`telemetry` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` bigint(20) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `timezone` varchar(6) DEFAULT NULL,
  `intemp` decimal(4,2) DEFAULT NULL,
  `extemp` decimal(4,2) DEFAULT NULL,
  `voltage` decimal(4,2) DEFAULT NULL,
  `ping_power` int(11) DEFAULT NULL,
  `ping_computer` int(11) DEFAULT NULL,
  `site_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS qraat.`timecheck` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `siteid` bigint(20) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `timezone` varchar(6) DEFAULT NULL,
  `time_offset` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM;



--Calibration
CREATE TABLE IF NOT EXISTS qraat.`calibration_information` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `deploymentID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS qraat.`gps_data` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `deploymentID` bigint(20) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(11,6) DEFAULT NULL,
  `elevation` decimal(7,2) DEFAULT NULL,
  `easting` decimal(9,2) DEFAULT NULL,
  `northing` decimal(10,2) DEFAULT NULL,
  `utm_zone_number` tinyint(3) unsigned DEFAULT NULL,
  `utm_zone_letter` char(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS qraat.`true_position` (
  `estID` bigint(20) NOT NULL,
  `easting` decimal(9,2) DEFAULT NULL,
  `northing` decimal(10,2) DEFAULT NULL,
  `bearing` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`estID`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS qraat.`steering_vectors` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Cal_InfoID` int(11) DEFAULT NULL,
  `SiteID` int(11) DEFAULT NULL,
  `Bearing` decimal(5,2) DEFAULT NULL,
  `sv1r` double DEFAULT NULL,
  `sv1i` double DEFAULT NULL,
  `sv2r` double DEFAULT NULL,
  `sv2i` double DEFAULT NULL,
  `sv3r` double DEFAULT NULL,
  `sv3i` double DEFAULT NULL,
  `sv4r` double DEFAULT NULL,
  `sv4i` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM;

--Position
CREATE TABLE IF NOT EXISTS qraat.`bearing` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `deploymentID` bigint(20) DEFAULT NULL,
  `siteID` bigint(20) NOT NULL,
  `timestamp` decimal(16,6) NOT NULL,
  `bearing` double NOT NULL COMMENT 'Most likely bearing.',
  `likelihood` double NOT NULL COMMENT 'Maximum Likelihood over bearing distribution.',
  `activity` double DEFAULT NULL COMMENT 'Normalized activity metric.',
  PRIMARY KEY (`ID`),
  KEY `timestamp` (`timestamp`),
  KEY `txID` (`deploymentID`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS qraat.`position` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `deploymentID` bigint(20) DEFAULT NULL,
  `timestamp` decimal(16,6) NOT NULL,
  `easting` decimal(9,2) NOT NULL COMMENT 'Most likely position (UTM east).',
  `northing` decimal(10,2) NOT NULL COMMENT 'Most likely position (UTM north).',
  `utm_zone_number` tinyint(3) DEFAULT NULL,
  `utm_zone_letter` varchar(1) DEFAULT 'S' COMMENT 'Most likely position (UTM zone letter).',
  `likelihood` double NOT NULL COMMENT 'Maximum likelihood value over search space.',
  `activity` double DEFAULT NULL COMMENT 'Averaged over bearing data from all sites.',
  PRIMARY KEY (`ID`),
  KEY `timestamp` (`timestamp`),
  KEY `txID` (`deploymentID`)
) ENGINE=MyISAM;

--Tracks
CREATE TABLE IF NOT EXISTS qraat.`track_pos` (
  `positionID` bigint(20) DEFAULT NULL,
  `trackID` bigint(20) NOT NULL,
  `timestamp` decimal(16,6) NOT NULL,
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `trackID` (`trackID`,`timestamp`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS qraat.`track` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `deploymentID` int(10) unsigned NOT NULL,
  `projectID` int(10) unsigned NOT NULL COMMENT 'Project to which track is associated.',
  `max_speed_family` enum('exp','linear','const') DEFAULT NULL,
  `speed_burst` double DEFAULT NULL,
  `speed_sustained` double DEFAULT NULL,
  `speed_limit` double NOT NULL,
  `is_hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `deploymentID` (`deploymentID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `track_ibfk_1` FOREIGN KEY (`deploymentID`) REFERENCES `deployment` (`ID`),
  CONSTRAINT `track_ibfk_2` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS qraat.`provenance` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `obj_table` varchar(30) NOT NULL,
  `obj_id` bigint(20) NOT NULL,
  `dep_table` varchar(30) NOT NULL,
  `dep_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM;

--Processing
CREATE TABLE IF NOT EXISTS qraat.`cursor` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM;


--Archiving
CREATE TABLE IF NOT EXISTS qraat.`Archive_Log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `tablename` varchar(30) DEFAULT NULL,
  `startid` bigint(20) DEFAULT NULL,
  `finishid` bigint(20) DEFAULT NULL,
  `mindt` datetime DEFAULT NULL,
  `maxdt` datetime DEFAULT NULL,
  `mints` decimal(16,6) DEFAULT NULL,
  `maxts` decimal(16,6) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM;

CREATE TABLE IF NOT EXISTS qraat.`Archive_Config` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(100) DEFAULT NULL,
  `archive` tinyint(1) DEFAULT '0',
  `lastid` bigint(20) DEFAULT NULL,
  `chunk` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM;

