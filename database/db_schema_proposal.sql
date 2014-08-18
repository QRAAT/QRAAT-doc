SET GLOBAL innodb_file_per_table=1;

--
--  Administration 
--

-- Site data (public) -------------------------------------------------------------------

-- only sites with receivers, admins are the only ones with write access
CREATE TABLE IF NOT EXISTS qraat.site ( 
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB ;


-- Project data -------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS qraat.project (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ownerID` int unsigned NOT NULL COMMENT 'References UUID in web frontend, i.e. `django.auth_user.id`.', 
  `name` varchar(50) NOT NULL,
  `description` TEXT DEFAULT NULL, 
  `is_public` boolean NOT NULL,
  `is_hidden` BOOLEAN DEFAULT False, 
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB ;

-- Users authorized to view project and associated data, specified by a 
-- GUID in the web framework. I.e., `django.auth_group.id`.
CREATE TABLE IF NOT EXISTS qraat.auth_project_viewer (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int unsigned NOT NULL COMMENt 'References GUID in web frontend, i.e. `django.auth_group.id`.', 
  `projectID` int unsigned NOT NULL,
  UNIQUE (`groupID`, `projectID`), 
  FOREIGN KEY (`projectID`) REFERENCES qraat.project (`ID`), 
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB ;

-- Users authorized to edit project and view associated data.
CREATE TABLE IF NOT EXISTS qraat.auth_project_collaborator (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int unsigned NOT NULL COMMENt 'References GUID in web frontend, i.e. `django.auth_group.id`.', 
  `projectID` int unsigned NOT NULL,
  UNIQUE (`groupID`, `projectID`), 
  FOREIGN KEY (`projectID`) REFERENCES qraat.project (`ID`), 
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB ;


-- Transmitter data (public) ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS qraat.tx (
  `ID` int unsigned NOT NULL AUTO_INCREMENT, 
  `name` varchar(50) NOT NULL, -- NOTE For legacy data, the name of the transmitter is used as
                               -- the filename for archived est data. 
  `serial_no` varchar(50) NOT NULL, 
  `tx_makeID` int unsigned NOT NULL,
  `projectID` int unsigned NOT NULL COMMENT 'Project for which transmitter was originally created.',
  `frequency` double NOT NULL,
  `is_hidden` BOOLEAN DEFAULT False, 
  FOREIGN KEY (`projectID`) REFERENCES qraat.project (`ID`), 
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB; 

CREATE TABLE IF NOT EXISTS qraat.tx_make (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `demod_type` enum ('pulse', 'cont', 'afsk'),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB; 

-- NOTE In Python, use dictionary cursor type.
-- NOTE Type conversion in Python. 
CREATE TABLE IF NOT EXISTS qraat.tx_parameters (
  `ID` int unsigned NOT NULL AUTO_INCREMENT, 
  `txID` int unsigned NOT NULL,
  `name` varchar(32) NOT NULL, 
  `value` varchar(64) NOT NULL, 
  `units` varchar(32) DEFAULT NULL,
  FOREIGN KEY (`txID`) REFERENCES qraat.tx (`ID`),
  PRIMARY KEY (`ID`),
  KEY (`name`)
) ENGINE=InnoDB; 

-- Suggested defaults for `qraat.tx_parameters`
-- NOTE In Python, use dictionary cursor type.
-- NOTE Type conversion in Python. 
CREATE TABLE IF NOT EXISTS qraat.tx_make_parameters (
  `ID` int unsigned NOT NULL AUTO_INCREMENT, 
  `tx_makeID` int unsigned NOT NULL,
  `name` varchar(32) NOT NULL, 
  `value` varchar(64) NOT NULL, 
  `units` varchar(32) DEFAULT NULL,
  FOREIGN KEY (`tx_makeID`) REFERENCES qraat.tx_make (`ID`),
  PRIMARY KEY (`ID`),
  KEY (`name`)
) ENGINE=InnoDB; 


-- Target, site data (private) ----------------------------------------------------------

-- Target, i.e. animal.
-- TODO species, ID tag serial number/s, weight, length, location/time 
-- captured (multiple entries), notes, etc.
CREATE TABLE IF NOT EXISTS qraat.target (
  `ID` int unsigned NOT NULL AUTO_INCREMENT, 
  `name` varchar(50) NOT NULL,
  `description` TEXT DEFAULT NULL, 
  `projectID` int unsigned NOT NULL COMMENT 'Project for which target was originally created.',
  `is_hidden` BOOLEAN DEFAULT False, 
  FOREIGN KEY (`projectID`) REFERENCES qraat.project (`ID`), 
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB; 

-- Project specific sites, e.g. den locations, capture locations, 
-- beacon transmitters. (Private to project.) 
CREATE TABLE IF NOT EXISTS qraat.location (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `projectID` int unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` TEXT DEFAULT NULL, 
  `location` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(11,6) DEFAULT NULL,
  `easting` decimal(9,2) unsigned DEFAULT '0.00',
  `northing` decimal(10,2) unsigned DEFAULT '0.00',
  `utm_zone_number` tinyint(3) unsigned DEFAULT '10',
  `utm_zone_letter` char(1) DEFAULT 'S',
  `elevation` decimal(7,2) DEFAULT '0.00',
  `is_hidden` BOOLEAN DEFAULT False, 
  FOREIGN KEY (`projectID`) REFERENCES qraat.project (`ID`),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB ;


-- Deployment data (private) ------------------------------------------------------------

-- Pulse, bearing, position, and track data are ultimately associated with a deployment, 
-- and since the DB engine for these tables is not transactional (i.e. does not respect 
-- foreign constraints), a deploymentID should not be deleted if there exists associated data. 
-- (Private to project.) 
CREATE TABLE IF NOT EXISTS qraat.deployment (
  `ID` int unsigned NOT NULL AUTO_INCREMENT, 
  `name` varchar(50) NOT NULL,
  `description` TEXT DEFAULT NULL, 
  `time_start` decimal(16,6) DEFAULT NULL COMMENT 'Unix Timestamp (s.us)', 
  `time_end` decimal(16,6) DEFAULT NULL COMMENT 'Unix Timestamp (s.us)', 
  `txID`  int unsigned NOT NULL, 
  `targetID`  int unsigned NOT NULL, 
  `projectID` int unsigned NOT NULL COMMENT 'Project to which deployment is associated.',
  `is_active` BOOLEAN DEFAULT False, 
  `is_hidden` BOOLEAN DEFAULT False, 
  FOREIGN KEY (`txID`) REFERENCES qraat.tx (`ID`), 
  FOREIGN KEY (`targetID`) REFERENCES qraat.target (`ID`), 
  FOREIGN KEY (`projectID`) REFERENCES qraat.project (`ID`), 
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB ; 

-- Tracking parameters. (Private to project.) 
CREATE TABLE IF NOT EXISTS qraat.track (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT, 
  `deploymentID` int unsigned NOT NULL, 
  `projectID` int unsigned NOT NULL COMMENT 'Project to which track is associated.',
  `max_speed_family` ENUM('exp', 'linear', 'const'), 
  `speed_burst` double DEFAULT NULL, 
  `speed_sustained` double DEFAULT NULL, 
  `speed_limit` double NOT NULL, 
  `is_hidden` BOOLEAN DEFAULT False, 
  FOREIGN KEY (`deploymentID`) REFERENCES qraat.deployment (`ID`), 
  FOREIGN KEY (`projectID`) REFERENCES qraat.project (`ID`), 
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB ; 


--
-- Data (read only from users)
--

-- Pulse data ---------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS qraat.est ( 
  ID bigint(20) NOT NULL AUTO_INCREMENT, 
  siteID int(11) DEFAULT NULL, 
  timestamp decimal(16,6) DEFAULT NULL COMMENT 'Unix Timestamp (s.us)', 
  frequency int(11) DEFAULT NULL COMMENT 'Tag Frequency (Hz)', 
  center int(11) DEFAULT NULL COMMENT 'Band Center Frequency (Hz)', 
  fdsp double DEFAULT NULL COMMENT 'Fourier Decomposition Signal Power', 
  fd1r double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 1 - real part', 
  fd1i double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 1 - imaginary part', 
  fd2r double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 2 - real part', 
  fd2i double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 2 - imaginary part', 
  fd3r double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 3 - real part', 
  fd3i double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 3 - imaginary part', 
  fd4r double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 4 - real part', 
  fd4i double DEFAULT NULL COMMENT 'Fourier Decomposition Signal on Channel 4 - imaginary part', 
  band3 smallint(6) DEFAULT NULL COMMENT '3dB Bandwidth', 
  band10 smallint(6) DEFAULT NULL COMMENT '10dB Bandwidth', 
  edsp double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal Power', 
  ed1r double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 1 - real part', 
  ed1i double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 1 - imaginary part', 
  ed2r double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 2 - real part', 
  ed2i double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 2 - imaginary part', 
  ed3r double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 3 - real part', 
  ed3i double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 3 - imaginary part', 
  ed4r double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 4 - real part', 
  ed4i double DEFAULT NULL COMMENT 'Eigenvalue Decomposition Signal on Channel 4 - imaginary part', 
  ec double DEFAULT NULL COMMENT 'Eigenvalue Confidence', 
  tnp double DEFAULT NULL COMMENT 'Total Noise Power', 
  nc11r double DEFAULT NULL COMMENT 'Noise Covariance 11 - real part', 
  nc11i double DEFAULT NULL COMMENT 'Noise Covariance 11 - imaginary part', 
  nc12r double DEFAULT NULL COMMENT 'Noise Covariance 12 - real part', 
  nc12i double DEFAULT NULL COMMENT 'Noise Covariance 12 - imaginary part', 
  nc13r double DEFAULT NULL COMMENT 'Noise Covariance 13 - real part', 
  nc13i double DEFAULT NULL COMMENT 'Noise Covariance 13 - imaginary part', 
  nc14r double DEFAULT NULL COMMENT 'Noise Covariance 14 - real part', 
  nc14i double DEFAULT NULL COMMENT 'Noise Covariance 14 - imaginary part', 
  nc21r double DEFAULT NULL COMMENT 'Noise Covariance 21 - real part', 
  nc21i double DEFAULT NULL COMMENT 'Noise Covariance 21 - imaginary part', 
  nc22r double DEFAULT NULL COMMENT 'Noise Covariance 22 - real part', 
  nc22i double DEFAULT NULL COMMENT 'Noise Covariance 22 - imaginary part', 
  nc23r double DEFAULT NULL COMMENT 'Noise Covariance 23 - real part', 
  nc23i double DEFAULT NULL COMMENT 'Noise Covariance 23 - imaginary part', 
  nc24r double DEFAULT NULL COMMENT 'Noise Covariance 24 - real part', 
  nc24i double DEFAULT NULL COMMENT 'Noise Covariance 24 - imaginary part', 
  nc31r double DEFAULT NULL COMMENT 'Noise Covariance 31 - real part', 
  nc31i double DEFAULT NULL COMMENT 'Noise Covariance 31 - imaginary part', 
  nc32r double DEFAULT NULL COMMENT 'Noise Covariance 32 - real part', 
  nc32i double DEFAULT NULL COMMENT 'Noise Covariance 32 - imaginary part', 
  nc33r double DEFAULT NULL COMMENT 'Noise Covariance 33 - real part', 
  nc33i double DEFAULT NULL COMMENT 'Noise Covariance 33 - imaginary part', 
  nc34r double DEFAULT NULL COMMENT 'Noise Covariance 34 - real part', 
  nc34i double DEFAULT NULL COMMENT 'Noise Covariance 34 - imaginary part', 
  nc41r double DEFAULT NULL COMMENT 'Noise Covariance 41 - real part', 
  nc41i double DEFAULT NULL COMMENT 'Noise Covariance 41 - imaginary part', 
  nc42r double DEFAULT NULL COMMENT 'Noise Covariance 42 - real part', 
  nc42i double DEFAULT NULL COMMENT 'Noise Covariance 42 - imaginary part', 
  nc43r double DEFAULT NULL COMMENT 'Noise Covariance 43 - real part', 
  nc43i double DEFAULT NULL COMMENT 'Noise Covariance 43 - imaginary part', 
  nc44r double DEFAULT NULL COMMENT 'Noise Covariance 44 - real part', 
  nc44i double DEFAULT NULL COMMENT 'Noise Covariance 44 - imaginary part', 
  fdsnr double DEFAULT NULL COMMENT 'Fourier Decomposition SNR (dB)', 
  edsnr double DEFAULT NULL COMMENT 'Eigenvalue Decomposition SNR (dB)',  
  deploymentID bigint(20) DEFAULT NULL, 
  PRIMARY KEY (ID), 
  KEY timestamp (timestamp),
  KEY deploymentID (deploymentID),
  KEY frequency (frequency)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.estscore (
  `estID` bigint(20) NOT NULL,
  `score` INTEGER NOT NULL COMMENT 'Number of coroborating pulses or flagged as bad (negative).',
  `max_score` INTEGER NOT NULL COMMENT "Maximum score over pulse score neighborhood.",
  `theoretical_score` INTEGER NOT NULL COMMENT 'Optimal score over score interval.',
  PRIMARY KEY (`estID`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.afsk (
  ID bigint NOT NULL AUTO_INCREMENT,
  deploymentID bigint DEFAULT NULL,
  siteID int(11) DEFAULT NULL,
  start_timestamp decimal(16,6) DEFAULT NULL COMMENT 'Unix Timestamp (s.us)', 
  stop_timestamp decimal(16,6) DEFAULT NULL COMMENT 'Unix Timestamp (s.us)', 
  message varchar(50) DEFAULT NULL,
  binary_data varbinary(63) DEFAULT NULL,
  error BOOLEAN DEFAULT True,
  PRIMARY KEY (ID)
) ENGINE=MyISAM ; 

-- Telemetry ----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS qraat.telemetry ( 
  ID bigint(20) NOT NULL AUTO_INCREMENT, 
  siteID bigint(20) NOT NULL, 
  datetime datetime DEFAULT NULL, 
  timezone varchar(6) DEFAULT NULL, 
  intemp decimal(4,2) DEFAULT NULL, 
  extemp decimal(4,2) DEFAULT NULL, 
  voltage decimal(4,2) DEFAULT NULL, 
  ping_power int(11) DEFAULT NULL, 
  ping_computer int(11) DEFAULT NULL, 
  site_status int(11) DEFAULT NULL, 
  PRIMARY KEY (ID) 
) ENGINE=MyISAM ; 

CREATE TABLE IF NOT EXISTS qraat.timecheck ( 
  ID bigint(20) NOT NULL AUTO_INCREMENT, 
  siteID bigint(20) NOT NULL, 
  datetime datetime DEFAULT NULL, 
  timezone varchar(6) DEFAULT NULL, 
  time_offset decimal(10,3) DEFAULT NULL, 
  PRIMARY KEY (ID) 
) ENGINE=MyISAM ;


-- Calibration --------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS qraat.calibration_information (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `description` text,
  `deploymentID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.gps_data (
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
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.true_position (
  `estID` bigint(20) NOT NULL,
  `easting` decimal(9,2) DEFAULT NULL,
  `northing` decimal(10,2) DEFAULT NULL,
  `bearing` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`estID`)
) ENGINE=MyISAM ; 

CREATE TABLE IF NOT EXISTS qraat.steering_vectors (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `cal_infoID` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
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
) ENGINE=MyISAM ;


-- Data ---------------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS qraat.bearing (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `deploymentID` bigint(20) NOT NULL,
  `siteID` bigint(20) NOT NULL,
  `timestamp` decimal(16,6) NOT NULL,
  `bearing` double NOT NULL COMMENT "Most likely bearing.",
  `likelihood` double NOT NULL COMMENT "Maximum Likelihood over bearing distribution.",
  `activity` double DEFAULT NULL COMMENT "Normalized activity metric.",
  PRIMARY KEY (`ID`),
  KEY (`timestamp`),
  KEY (`deploymentID`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.position (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `deploymentID` bigint(20) NOT NULL,
  `timestamp` decimal(16,6) NOT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(11,6) DEFAULT NULL,
  `easting` decimal(9,2) NOT NULL COMMENT "Most likely position (UTM east).",
  `northing` decimal(10,2) NOT NULL COMMENT "Most likely position (UTM north).",
  `utm_zone_number` tinyint(3) DEFAULT 10 COMMENT "Most likely position (UTM zone).",
  `utm_zone_letter` varchar(1) DEFAULT "S" COMMENT "Most likely position (UTM zone letter).",
  `likelihood` double NOT NULL COMMENT "Maximum likelihood value over search space.",
  `activity` double DEFAULT NULL COMMENT "Averaged over bearing data from all sites.",
  PRIMARY KEY (`ID`),
  KEY (`timestamp`),
  KEY (`deploymentID`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.track_pos (
  `positionID` bigint(20) NOT NULL,
  `trackID` bigint(20) NOT NULL,
  `timestamp` decimal(16,6) NOT NULL, 
  PRIMARY KEY (`TrackID`, `timestamp`)
) ENGINE=MyISAM ;



-- Processing ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS qraat.provenance (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `obj_table` varchar(30) NOT NULL,
  `obj_id` bigint(20) NOT NULL,
  `dep_table` varchar(30) NOT NULL,
  `dep_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.`processing_cursor` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.`interval_cache` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `deploymentID` bigint(20) NOT NULL,
  `siteID` int(11) NOT NULL,
  `start` decimal(16,6) NOT NULL COMMENT 'UNIX timestamp where this estimated signal interval becomes applicable',
  `valid_duration` double NOT NULL COMMENT 'Number of seconds after start that this estimated interval is valid for.',
  `period` double NOT NULL COMMENT 'Pulse Interval value in seconds',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

-- Configuration information for database archive script
CREATE TABLE `archive_config` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `tablename` varchar(100) DEFAULT NULL COMMENT 'The name of the table to be archived',
  `archive` tinyint(1) DEFAULT '0' COMMENT 'Set to 1 to archive this table, 0 to ignore this table',
  `lastid` bigint(20) DEFAULT NULL COMMENT 'Set to the ID of the last archived record',
  `chunk` int(11) DEFAULT NULL COMMENT 'Maximum size of a chunk, in records, 0 to disable chunking',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

-- Log for database archiving script
CREATE TABLE `archive_log` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL COMMENT 'Time at which the table (chunk) was archived',
  `filename` varchar(100) DEFAULT NULL COMMENT 'Filename for the table (chunk)',
  `tablename` varchar(30) DEFAULT NULL COMMENT 'Name of the archived table',
  `startid` bigint(20) DEFAULT NULL COMMENT 'First ID of the records written to the file',
  `finishid` bigint(20) DEFAULT NULL COMMENT 'Last ID of the records written to the file',
  `mindt` datetime DEFAULT NULL COMMENT 'Earliest datetime of all records in chunk, if datetime exists',
  `maxdt` datetime DEFAULT NULL COMMENT 'Latest datetime of all records in chunk, if datetime exists',
  `mints` decimal(16,6) DEFAULT NULL COMMENT 'Earliest timestamp of all records in chunk, if timestamp exists',
  `maxts` decimal(16,6) DEFAULT NULL COMMENT 'Latest timestamp of all records in chunk, if timestamp exists',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;

