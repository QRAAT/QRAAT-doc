-- WARNING!! When altering the DB schema, don't run this script directly. 
-- There are some stuff at the bottom which will smash the automated data
-- flow. 

CREATE TABLE IF NOT EXISTS qraat.sitelist ( 
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(11,6) DEFAULT NULL,
  `easting` decimal(9,2) unsigned DEFAULT '0.00',
  `northing` decimal(10,2) unsigned DEFAULT '0.00',
  `utm_zone_number` tinyint(3) unsigned DEFAULT '10',
  `utm_zone_letter` char(1) DEFAULT 'S',
  `elevation` decimal(7,2) DEFAULT '0.00',
  `rx` BOOLEAN DEFAULT True, -- temporary way of identifying a location as a receiver site. 
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM ;

-- TODO deprecate this table. 
CREATE TABLE IF NOT EXISTS qraat.txlist ( 
  ID int(11) NOT NULL AUTO_INCREMENT, 
  `use` varchar(6) DEFAULT NULL, 
  name varchar(20) DEFAULT NULL, 
  frequency decimal(6,3) DEFAULT NULL, 
  type varchar(20) DEFAULT NULL, 
  pulse_width decimal(3,1) DEFAULT NULL, 
  rise_trigger decimal(4,2) DEFAULT NULL, 
  fall_trigger decimal(4,2) DEFAULT NULL, 
  filter_alpha decimal(5,3) DEFAULT NULL, 
  hertz int(11) DEFAULT NULL, 
  model varchar(20) DEFAULT NULL, 
  serial varchar(20) DEFAULT NULL, 
  alias varchar(20) DEFAULT NULL, 
  start datetime DEFAULT NULL, 
  stop datetime DEFAULT NULL, 
  programid int(11) DEFAULT NULL, 
  thresh_band3 smallint(6) DEFAULT NULL COMMENT ' ', 
  thresh_band10 smallint(6) DEFAULT NULL COMMENT '10dB Bandwidth', 
  PRIMARY KEY (ID) 
) ENGINE=MyISAM ; 


CREATE TABLE IF NOT EXISTS qraat.tx_ID (
  ID int unsigned NOT NULL AUTO_INCREMENT,
  tx_info_ID int unsigned NOT NULL COMMENT 'ID from tx_info table',
  active BOOLEAN DEFAULT FALSE COMMENT 'Flag for whether sites should look for this tag',
  PRIMARY KEY (ID)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.tx_info (
  ID int unsigned NOT NULL AUTO_INCREMENT,
  tx_type_ID int unsigned NOT NULL COMMENT 'ID from tx_type table',
  manufacturer varchar(50) DEFAULT NULL,
  model varchar(50) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.tx_type (
  ID int unsigned NOT NULL AUTO_INCREMENT,
  RMG_type varchar(20) DEFAULT NULL COMMENT 'String that RMG software uses to determine the type of demodulator to use, e.g. pulse',
  tx_table_name varchar(30) DEFAULT NULL COMMENT 'Table that contains parameters for this type, e.g. pulse_tx',
  PRIMARY KEY (ID)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.tx_pulse (
  tx_ID int unsigned NOT NULL COMMENT 'ID from tx_ID table',
  frequency float unsigned DEFAULT NULL COMMENT 'Frequency in MHz',
  pulse_width float unsigned DEFAULT NULL COMMENT 'Pulse Width in milliseconds (ms)', 
  pulse_rate float unsigned DEFAULT NULL COMMENT 'Pulse Rate in pulses per minute (ppm)',
  band3 smallint unsigned DEFAULT NULL COMMENT 'Nominal 3dB Bandwidth in Hertz (Hz), used in parameter filtering',
  band10 smallint unsigned DEFAULT NULL COMMENT 'Nomianl 10dB Bandwidth in Hertz (Hz), used in parameter filtering',
  PRIMARY KEY (tx_ID)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.tx_alias (
  ID int unsigned NOT NULL AUTO_INCREMENT,
  tx_ID int unsigned DEFAULT NULL COMMENT 'ID from tx_ID table',
  alias varchar(50) DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.tx_deployment (
  ID int unsigned NOT NULL AUTO_INCREMENT,
  tx_ID int unsigned DEFAULT NULL COMMENT 'ID from tx_ID table',
  start_time bigint DEFAULT NULL COMMENT 'Unix Timestamp in seconds (s) since Epoch',
  stop_time bigint  DEFAULT NULL COMMENT 'Unix Timestamp in seconds (s) since Epoch',
  PRIMARY KEY (ID)
) ENGINE=MyISAM ;


CREATE TABLE IF NOT EXISTS qraat.est ( 
  ID bigint(20) NOT NULL AUTO_INCREMENT, 
  siteid int(11) DEFAULT NULL, 
  datetime datetime DEFAULT NULL COMMENT 'Date/Time (UTC)', 
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
  timezone varchar(6) DEFAULT NULL, 
  txid bigint(20) DEFAULT NULL, 
  PRIMARY KEY (ID), 
  KEY datetime (datetime),
  KEY timestamp (timestamp),
  KEY txid (txid),
  KEY frequency (frequency)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.estscore (
  `estid` bigint(20) NOT NULL,
  `absscore` tinyint(4) NOT NULL,
  `relscore` double NOT NULL,
  PRIMARY KEY (`estid`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.telemetry ( 
  ID bigint(20) NOT NULL AUTO_INCREMENT, 
  siteid bigint(20) NOT NULL, 
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
  siteid bigint(20) NOT NULL, 
  datetime datetime DEFAULT NULL, 
  timezone varchar(6) DEFAULT NULL, 
  time_offset decimal(10,3) DEFAULT NULL, 
  PRIMARY KEY (ID) 
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.Calibration_Information (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Start_Timestamp` decimal(16,6) DEFAULT NULL,
  `Stop_Timestamp` decimal(16,6) DEFAULT NULL,
  `Description` varchar(1000) DEFAULT NULL,
  `TxID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.GPS_Calibration_Data (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Cal_InfoID` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(11,6) DEFAULT NULL,
  `elevation` decimal(7,2) DEFAULT NULL,
  `easting` decimal(9,2) DEFAULT NULL,
  `northing` decimal(10,2) DEFAULT NULL,
  `zone` char(3) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.True_Position (
  `estID` bigint(20) NOT NULL,
  `Cal_InfoID` int(11) DEFAULT NULL,
  `easting` decimal(9,2) DEFAULT NULL,
  `northing` decimal(10,2) DEFAULT NULL,
  `bearing` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`estID`)
) ENGINE=MyISAM ; 

CREATE TABLE IF NOT EXISTS qraat.Steering_Vectors (
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
) ENGINE=MyISAM ;


CREATE TABLE IF NOT EXISTS qraat.Bearing (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `depID` bigint(20) NOT NULL,
  `siteID` bigint(20) NOT NULL,
  `timestamp` decimal(16,6) NOT NULL,
  `bearing` double NOT NULL COMMENT "Most likely bearing.",
  `likelihood` double NOT NULL COMMENT "Maximum Likelihood over bearing distribution.",
  `activity` double DEFAULT NULL COMMENT "Normalized activity metric.",
  PRIMARY KEY (`ID`),
  KEY (`timestamp`),
  KEY (`depID`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.Position (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `depID` bigint(20) NOT NULL,
  `timestamp` decimal(16,6) NOT NULL,
  `easting` decimal(9,2) NOT NULL COMMENT "Most likely position (UTM east).",
  `northing` decimal(10,2) NOT NULL COMMENT "Most likely position (UTM north).",
  `utm_zone_number` tinyint(3) DEFAULT 10 COMMENT "Most likely position (UTM zone).",
  `utm_zone_letter` varchar(1) DEFAULT "S" COMMENT "Most likely position (UTM zone letter).",
  `likelihood` double NOT NULL COMMENT "Maximum likelihood value over search space.",
  `activity` double DEFAULT NULL COMMENT "Averaged over bearing data from all sites.",
  PRIMARY KEY (`ID`),
  KEY (`timestamp`),
  KEY (`depID`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.track_pos (
  `posID` bigint(20) NOT NULL,
  `trackID` bigint(20) NOT NULL,
  `timestamp` decimal(16,6) NOT NULL, 
  PRIMARY KEY (`TrackID`, `timestamp`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.track (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT, 
  `depID` bigint(20) NOT NULL, 
  `max_speed_family` ENUM('exp', 'linear', 'const'), 
  `speed_burst` double DEFAULT NULL, 
  `speed_sustained` double DEFAULT NULL, 
  `speed_limit` double NOT NULL, 
  PRIMARY KEY (`ID`),
  KEY (`depID`)
) ENGINE=MyISAM ; 

CREATE TABLE IF NOT EXISTS qraat.provenance (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `obj_table` varchar(30) NOT NULL,
  `obj_id` bigint(20) NOT NULL,
  `dep_table` varchar(30) NOT NULL,
  `dep_id` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.`cursor` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `value` bigint(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM ;

CREATE TABLE IF NOT EXISTS qraat.`interval_cache` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `txid` bigint(20) NOT NULL, -- TODO change this `depID`
  `siteid` int(11) NOT NULL,
  `start` decimal(16,6) NOT NULL COMMENT 'UNIX timestamp where this estimated signal interval becomes applicable',
  `valid_duration` double NOT NULL COMMENT 'Number of seconds after start that this estimated interval is valid for.',
  `period` double NOT NULL COMMENT 'Interval value in seconds',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;
