CREATE TABLE IF NOT EXISTS qraat.sitelist ( 
  ID int(11) NOT NULL AUTO_INCREMENT, 
  name varchar(20) DEFAULT NULL, 
  location varchar(100) DEFAULT NULL, 
  latitude decimal(10,6) DEFAULT NULL, 
  longitude decimal(11,6) DEFAULT NULL, 
  easting decimal(9,2) unsigned DEFAULT '0.00', 
  northing decimal(10,2) unsigned DEFAULT '0.00', 
  zone char(3) DEFAULT NULL, 
  elevation decimal(7,2) DEFAULT '0.00', 
  PRIMARY KEY (ID) 
) ENGINE=MyISAM ;

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
  band3 smallint(6) DEFAULT NULL COMMENT ' ', 
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
  KEY datetime (datetime) 
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
  `longitutde` decimal(11,6) DEFAULT NULL,
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

CREATE TABLE IF NOT EXISTS qraat.Position (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `txID` bigint(20) DEFAULT NULL,
  `timestamp` decimal(16,6) DEFAULT NULL,
  `easting` decimal(9,2) DEFAULT NULL,
  `northing` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM ;
