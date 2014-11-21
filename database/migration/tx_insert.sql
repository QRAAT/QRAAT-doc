/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `site` (
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
INSERT INTO `site` VALUES (1,'site1','Field Station',38.483052,-122.149580,574172.77,4259755.45,10,'S',394.02),(2,'site2','DFG Hill Tower',38.499708,-122.148620,574239.47,4261604.51,10,'S',363.50),(3,'site10','Dan\'s Repeater',38.499326,-122.139744,575013.86,4261569.32,10,'S',376.96),(4,'site13','Blue Oak Tower',38.491643,-122.152812,573882.15,4260706.17,10,'S',273.14),(5,'site20','QRWC Tower',38.491915,-122.136299,575321.92,4260749.75,10,'S',424.54),(6,'site21','Weaver Tower',38.492924,-122.142340,574794.06,4260856.82,10,'S',293.57),(8,'site39','SiteK',38.495187,-122.151417,574000.17,4261100.56,10,'S',199.29);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `project` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ownerID` int(10) unsigned NOT NULL COMMENT 'References UUID in web frontend, i.e. `django.auth_user.id`.',
  `name` varchar(50) NOT NULL,
  `description` text,
  `is_public` tinyint(1) NOT NULL,
  `is_hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `project` VALUES (1,2,'QRAAT','Project for general system use',0,0),(2,2,'QRAAT Calibration','Project for deployments involved with calibration.',0,0),(3,4,'Mice 2013','Mice on trapping grid, summer 2013',0,0),(4,5,'Woodrats Fall 2013','Woodrats tagged under site 2 from fall 2013 to spring 2014',0,0),(5,5,'Foxes','Foxes tagged May 2014',0,0),(6,4,'Mice 2014','Mice on trapping grid, summer 2014.',0,0),(7,5,'Woodrats Summer 2014','Woodrats on trapping grid, summer 2014.',0,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `tx_make` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manufacturer` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `demod_type` enum('pulse','cont','afsk') DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `tx_make` VALUES (1,'Ben Kamen','Tuneable transmitter','pulse'),(2,'ATS','M1520','pulse'),(3,'ATS','M1450','pulse'),(4,'Holohil','MI-2M(12)','pulse');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `tx_make_parameters` (
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
INSERT INTO `tx_make_parameters` VALUES (49,1,'pulse_width','20'),(50,1,'pulse_rate','60'),(51,1,'band3',''),(52,1,'band10',''),(53,2,'pulse_width','15'),(54,2,'pulse_rate','25'),(55,2,'band3','150'),(56,2,'band10','900'),(57,3,'pulse_width','15'),(58,3,'pulse_rate','23'),(59,3,'band3','150'),(60,3,'band10','900'),(61,4,'pulse_width','30'),(62,4,'pulse_rate','40'),(63,4,'band3','150'),(64,4,'band10','900');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `tx` (
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
INSERT INTO `tx` VALUES (1,'M164010','',3,3,164.01,0),(2,'M164017','',3,3,164.017,0),(3,'M164024','',3,3,164.024,0),(4,'M164033','',3,3,164.033,0),(5,'M164041','',3,3,164.041,0),(6,'M164048','',3,3,164.048,0),(7,'M164056','',3,3,164.056,0),(8,'M164065','',3,3,164.065,0),(9,'M164073','',3,3,164.073,0),(10,'M164081','',3,3,164.081,0),(11,'M164089','',3,3,164.089,0),(12,'M164097','',3,3,164.097,0),(13,'M164105','',3,3,164.105,0),(14,'M164113','',3,3,164.113,0),(15,'M164121','',3,3,164.121,0),(16,'M164130','',3,3,164.13,0),(17,'M164138','',3,3,164.138,0),(18,'M164145','',3,3,164.145,0),(19,'M164153','',3,3,164.153,0),(20,'M164162','',3,3,164.162,0),(21,'M164170','',3,3,164.17,0),(22,'M164177','',3,3,164.177,0),(23,'M164185','',3,3,164.185,0),(24,'M164194','',3,3,164.194,0),(25,'M164201','',3,3,164.201,0),(26,'M164210','',3,3,164.21,0),(27,'M164217','',3,3,164.217,0),(28,'M164225','',3,3,164.225,0),(29,'M164233','',3,3,164.233,0),(30,'M164241','',3,3,164.241,0),(31,'M164248','',3,3,164.248,0),(32,'M164256','',3,3,164.256,0),(33,'M164265','',3,3,164.265,0),(34,'M164273','',3,3,164.273,0),(35,'M164280','',3,3,164.28,0),(36,'M164289','',3,3,164.289,0),(37,'M164297','',3,3,164.297,0),(38,'M164305','',3,3,164.305,0),(39,'M164313','',3,3,164.313,0),(40,'M164321','',3,3,164.321,0),(41,'M164328','',3,3,164.328,0),(42,'M164336','',3,3,164.336,0),(43,'M164344','',3,3,164.344,0),(44,'M164352','',3,3,164.352,0),(45,'M164361','',3,3,164.361,0),(46,'M164369','',3,3,164.369,0),(47,'M164377','',3,3,164.377,0),(48,'M164384','',3,3,164.384,0),(49,'M164393','',3,3,164.393,0),(50,'M164400','',3,3,164.4,0),(51,'tuneable_tx','',1,2,164.5,0),(52,'F6394','',2,4,164.013,0),(53,'F6389','',2,4,164.023,0),(54,'F5792','',2,4,164.033,0),(55,'M6364','',2,4,164.042,0),(56,'M6322','',2,4,164.053,0),(57,'F6375','',2,4,164.061,0),(58,'F5210','',2,4,164.071,0),(59,'M5754','',2,4,164.083,0),(60,'Beacon','',1,1,164,0),(61,'woodrat1','',2,1,164.092,0),(62,'woodrat2','',2,1,164.103,0),(63,'','190785',4,5,163.847,0),(64,'','190786',4,5,163.874,0),(65,'','190787',4,5,163.908,0),(66,'','190788',4,5,163.921,0),(67,'','190789',4,5,163.974,0),(68,'','190790',4,5,163.997,0),(69,'M164407','',3,6,164.407,0),(70,'M164416','',3,6,164.416,0),(71,'M164432','',3,6,164.432,0),(72,'M164440','',3,6,164.44,0),(73,'M164448','',3,6,164.448,0),(74,'M164456','',3,6,164.456,0),(75,'M164464','',3,6,164.464,0),(76,'M164472','',3,6,164.472,0),(77,'M164480','',3,6,164.48,0),(78,'M164488','',3,6,164.488,0),(79,'M164496','',3,6,164.496,0),(80,'M164504','',3,6,164.504,0),(81,'M164512','',3,6,164.512,0),(82,'M164520','',3,6,164.52,0),(83,'M164528','',3,6,164.528,0),(84,'M164545','',3,6,164.545,0),(85,'M164553','',3,6,164.553,0),(86,'M164560','',3,6,164.56,0),(87,'M164568','',3,6,164.568,0),(88,'M164576','',3,6,164.576,0),(89,'M164584','',3,6,164.584,0),(90,'M164593','',3,6,164.593,0),(91,'M164601','',3,6,164.601,0),(92,'M164807','',3,6,164.807,0),(93,'M164816','',3,6,164.816,0),(94,'','',2,7,164.008,0),(95,'','',2,7,164.016,0),(96,'','',2,7,164.024,0),(97,'JF6379','',2,7,164.032,0),(98,'','',2,7,164.04,0),(99,'JF6381','',2,7,164.048,0),(100,'AF6377','',2,7,164.056,0),(101,'','',2,7,164.072,0),(102,'AF6382','',2,7,164.08,0),(103,'AM6384','',2,7,164.088,0),(104,'','',2,7,164.12,0),(105,'JM6378','',2,7,164.128,0),(106,'AF6376','',2,7,164.136,0),(107,'AM6380','',2,7,164.144,0),(108,'','',2,7,164.152,0),(109,'AM6383','',2,7,164.16,0),(110,'','',2,7,164.168,0),(111,'','',2,7,164.176,0),(112,'','',2,7,164.184,0),(113,'','',2,7,164.192,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `tx_parameters` (
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
INSERT INTO `tx_parameters` VALUES (1809,1,'pulse_width','15'),(1810,1,'pulse_rate','23'),(1811,1,'band3','150'),(1812,1,'band10','900'),(1813,2,'pulse_width','15'),(1814,2,'pulse_rate','23'),(1815,2,'band3','150'),(1816,2,'band10','900'),(1817,3,'pulse_width','15'),(1818,3,'pulse_rate','23'),(1819,3,'band3','150'),(1820,3,'band10','900'),(1821,4,'pulse_width','15'),(1822,4,'pulse_rate','23'),(1823,4,'band3','150'),(1824,4,'band10','900'),(1825,5,'pulse_width','15'),(1826,5,'pulse_rate','23'),(1827,5,'band3','150'),(1828,5,'band10','900'),(1829,6,'pulse_width','15'),(1830,6,'pulse_rate','23'),(1831,6,'band3','150'),(1832,6,'band10','900'),(1833,7,'pulse_width','15'),(1834,7,'pulse_rate','23'),(1835,7,'band3','150'),(1836,7,'band10','900'),(1837,8,'pulse_width','15'),(1838,8,'pulse_rate','23'),(1839,8,'band3','150'),(1840,8,'band10','900'),(1841,9,'pulse_width','15'),(1842,9,'pulse_rate','23'),(1843,9,'band3','150'),(1844,9,'band10','900'),(1845,10,'pulse_width','15'),(1846,10,'pulse_rate','23'),(1847,10,'band3','150'),(1848,10,'band10','900'),(1849,11,'pulse_width','15'),(1850,11,'pulse_rate','23'),(1851,11,'band3','150'),(1852,11,'band10','900'),(1853,12,'pulse_width','15'),(1854,12,'pulse_rate','23'),(1855,12,'band3','150'),(1856,12,'band10','900'),(1857,13,'pulse_width','15'),(1858,13,'pulse_rate','23'),(1859,13,'band3','150'),(1860,13,'band10','900'),(1861,14,'pulse_width','15'),(1862,14,'pulse_rate','23'),(1863,14,'band3','150'),(1864,14,'band10','900'),(1865,15,'pulse_width','15'),(1866,15,'pulse_rate','23'),(1867,15,'band3','150'),(1868,15,'band10','900'),(1869,16,'pulse_width','15'),(1870,16,'pulse_rate','23'),(1871,16,'band3','150'),(1872,16,'band10','900'),(1873,17,'pulse_width','15'),(1874,17,'pulse_rate','23'),(1875,17,'band3','150'),(1876,17,'band10','900'),(1877,18,'pulse_width','15'),(1878,18,'pulse_rate','23'),(1879,18,'band3','150'),(1880,18,'band10','900'),(1881,19,'pulse_width','15'),(1882,19,'pulse_rate','23'),(1883,19,'band3','150'),(1884,19,'band10','900'),(1885,20,'pulse_width','15'),(1886,20,'pulse_rate','23'),(1887,20,'band3','150'),(1888,20,'band10','900'),(1889,21,'pulse_width','15'),(1890,21,'pulse_rate','23'),(1891,21,'band3','150'),(1892,21,'band10','900'),(1893,22,'pulse_width','15'),(1894,22,'pulse_rate','23'),(1895,22,'band3','150'),(1896,22,'band10','900'),(1897,23,'pulse_width','15'),(1898,23,'pulse_rate','23'),(1899,23,'band3','150'),(1900,23,'band10','900'),(1901,24,'pulse_width','15'),(1902,24,'pulse_rate','23'),(1903,24,'band3','150'),(1904,24,'band10','900'),(1905,25,'pulse_width','15'),(1906,25,'pulse_rate','23'),(1907,25,'band3','150'),(1908,25,'band10','900'),(1909,26,'pulse_width','15'),(1910,26,'pulse_rate','23'),(1911,26,'band3','150'),(1912,26,'band10','900'),(1913,27,'pulse_width','15'),(1914,27,'pulse_rate','23'),(1915,27,'band3','150'),(1916,27,'band10','900'),(1917,28,'pulse_width','15'),(1918,28,'pulse_rate','23'),(1919,28,'band3','150'),(1920,28,'band10','900'),(1921,29,'pulse_width','15'),(1922,29,'pulse_rate','23'),(1923,29,'band3','150'),(1924,29,'band10','900'),(1925,30,'pulse_width','15'),(1926,30,'pulse_rate','23'),(1927,30,'band3','150'),(1928,30,'band10','900'),(1929,31,'pulse_width','15'),(1930,31,'pulse_rate','23'),(1931,31,'band3','150'),(1932,31,'band10','900'),(1933,32,'pulse_width','15'),(1934,32,'pulse_rate','23'),(1935,32,'band3','150'),(1936,32,'band10','900'),(1937,33,'pulse_width','15'),(1938,33,'pulse_rate','23'),(1939,33,'band3','150'),(1940,33,'band10','900'),(1941,34,'pulse_width','15'),(1942,34,'pulse_rate','23'),(1943,34,'band3','150'),(1944,34,'band10','900'),(1945,35,'pulse_width','15'),(1946,35,'pulse_rate','23'),(1947,35,'band3','150'),(1948,35,'band10','900'),(1949,36,'pulse_width','15'),(1950,36,'pulse_rate','23'),(1951,36,'band3','150'),(1952,36,'band10','900'),(1953,37,'pulse_width','15'),(1954,37,'pulse_rate','23'),(1955,37,'band3','150'),(1956,37,'band10','900'),(1957,38,'pulse_width','15'),(1958,38,'pulse_rate','23'),(1959,38,'band3','150'),(1960,38,'band10','900'),(1961,39,'pulse_width','15'),(1962,39,'pulse_rate','23'),(1963,39,'band3','150'),(1964,39,'band10','900'),(1965,40,'pulse_width','15'),(1966,40,'pulse_rate','23'),(1967,40,'band3','150'),(1968,40,'band10','900'),(1969,41,'pulse_width','15'),(1970,41,'pulse_rate','23'),(1971,41,'band3','150'),(1972,41,'band10','900'),(1973,42,'pulse_width','15'),(1974,42,'pulse_rate','23'),(1975,42,'band3','150'),(1976,42,'band10','900'),(1977,43,'pulse_width','15'),(1978,43,'pulse_rate','23'),(1979,43,'band3','150'),(1980,43,'band10','900'),(1981,44,'pulse_width','15'),(1982,44,'pulse_rate','23'),(1983,44,'band3','150'),(1984,44,'band10','900'),(1985,45,'pulse_width','15'),(1986,45,'pulse_rate','23'),(1987,45,'band3','150'),(1988,45,'band10','900'),(1989,46,'pulse_width','15'),(1990,46,'pulse_rate','23'),(1991,46,'band3','150'),(1992,46,'band10','900'),(1993,47,'pulse_width','15'),(1994,47,'pulse_rate','23'),(1995,47,'band3','150'),(1996,47,'band10','900'),(1997,48,'pulse_width','15'),(1998,48,'pulse_rate','23'),(1999,48,'band3','150'),(2000,48,'band10','900'),(2001,49,'pulse_width','15'),(2002,49,'pulse_rate','23'),(2003,49,'band3','150'),(2004,49,'band10','900'),(2005,50,'pulse_width','15'),(2006,50,'pulse_rate','23'),(2007,50,'band3','150'),(2008,50,'band10','900'),(2009,51,'pulse_width','20'),(2010,51,'pulse_rate','60'),(2011,51,'band3',''),(2012,51,'band10',''),(2013,52,'pulse_width','19'),(2014,52,'pulse_rate','23'),(2015,52,'band3','150'),(2016,52,'band10','900'),(2017,53,'pulse_width','19'),(2018,53,'pulse_rate','23'),(2019,53,'band3','150'),(2020,53,'band10','900'),(2021,54,'pulse_width','19'),(2022,54,'pulse_rate','23'),(2023,54,'band3','150'),(2024,54,'band10','900'),(2025,55,'pulse_width','19'),(2026,55,'pulse_rate','23'),(2027,55,'band3','150'),(2028,55,'band10','900'),(2029,56,'pulse_width','19'),(2030,56,'pulse_rate','23'),(2031,56,'band3','150'),(2032,56,'band10','900'),(2033,57,'pulse_width','19'),(2034,57,'pulse_rate','23'),(2035,57,'band3','150'),(2036,57,'band10','900'),(2037,58,'pulse_width','19'),(2038,58,'pulse_rate','23'),(2039,58,'band3','150'),(2040,58,'band10','900'),(2041,59,'pulse_width','19'),(2042,59,'pulse_rate','23'),(2043,59,'band3','150'),(2044,59,'band10','900'),(2045,60,'pulse_width','20'),(2046,60,'pulse_rate','60'),(2047,60,'band3',''),(2048,60,'band10',''),(2049,61,'pulse_width','19'),(2050,61,'pulse_rate','23'),(2051,61,'band3','150'),(2052,61,'band10','900'),(2053,62,'pulse_width','19'),(2054,62,'pulse_rate','23'),(2055,62,'band3','150'),(2056,62,'band10','900'),(2057,63,'pulse_width','30'),(2058,63,'pulse_rate','39.6'),(2059,63,'band3','150'),(2060,63,'band10','900'),(2061,64,'pulse_width','30'),(2062,64,'pulse_rate','39.6'),(2063,64,'band3','150'),(2064,64,'band10','900'),(2065,65,'pulse_width','30'),(2066,65,'pulse_rate','39'),(2067,65,'band3','150'),(2068,65,'band10','900'),(2069,66,'pulse_width','30'),(2070,66,'pulse_rate','39.6'),(2071,66,'band3','150'),(2072,66,'band10','900'),(2073,67,'pulse_width','30'),(2074,67,'pulse_rate','40.2'),(2075,67,'band3','150'),(2076,67,'band10','900'),(2077,68,'pulse_width','30'),(2078,68,'pulse_rate','39.6'),(2079,68,'band3','150'),(2080,68,'band10','900'),(2081,69,'pulse_width','17'),(2082,69,'pulse_rate','17'),(2083,69,'band3','150'),(2084,69,'band10','900'),(2085,70,'pulse_width','17'),(2086,70,'pulse_rate','17'),(2087,70,'band3','150'),(2088,70,'band10','900'),(2089,71,'pulse_width','17'),(2090,71,'pulse_rate','17'),(2091,71,'band3','150'),(2092,71,'band10','900'),(2093,72,'pulse_width','17'),(2094,72,'pulse_rate','17'),(2095,72,'band3','150'),(2096,72,'band10','900'),(2097,73,'pulse_width','17'),(2098,73,'pulse_rate','17'),(2099,73,'band3','150'),(2100,73,'band10','900'),(2101,74,'pulse_width','17'),(2102,74,'pulse_rate','17'),(2103,74,'band3','150'),(2104,74,'band10','900'),(2105,75,'pulse_width','17'),(2106,75,'pulse_rate','17'),(2107,75,'band3','150'),(2108,75,'band10','900'),(2109,76,'pulse_width','17'),(2110,76,'pulse_rate','17'),(2111,76,'band3','150'),(2112,76,'band10','900'),(2113,77,'pulse_width','17'),(2114,77,'pulse_rate','17'),(2115,77,'band3','150'),(2116,77,'band10','900'),(2117,78,'pulse_width','17'),(2118,78,'pulse_rate','17'),(2119,78,'band3','150'),(2120,78,'band10','900'),(2121,79,'pulse_width','17'),(2122,79,'pulse_rate','17'),(2123,79,'band3','150'),(2124,79,'band10','900'),(2125,80,'pulse_width','17'),(2126,80,'pulse_rate','17'),(2127,80,'band3','150'),(2128,80,'band10','900'),(2129,81,'pulse_width','17'),(2130,81,'pulse_rate','17'),(2131,81,'band3','150'),(2132,81,'band10','900'),(2133,82,'pulse_width','17'),(2134,82,'pulse_rate','17'),(2135,82,'band3','150'),(2136,82,'band10','900'),(2137,83,'pulse_width','17'),(2138,83,'pulse_rate','17'),(2139,83,'band3','150'),(2140,83,'band10','900'),(2141,84,'pulse_width','17'),(2142,84,'pulse_rate','17'),(2143,84,'band3','150'),(2144,84,'band10','900'),(2145,85,'pulse_width','17'),(2146,85,'pulse_rate','17'),(2147,85,'band3','150'),(2148,85,'band10','900'),(2149,86,'pulse_width','17'),(2150,86,'pulse_rate','17'),(2151,86,'band3','150'),(2152,86,'band10','900'),(2153,87,'pulse_width','17'),(2154,87,'pulse_rate','17'),(2155,87,'band3','150'),(2156,87,'band10','900'),(2157,88,'pulse_width','17'),(2158,88,'pulse_rate','17'),(2159,88,'band3','150'),(2160,88,'band10','900'),(2161,89,'pulse_width','17'),(2162,89,'pulse_rate','17'),(2163,89,'band3','150'),(2164,89,'band10','900'),(2165,90,'pulse_width','17'),(2166,90,'pulse_rate','17'),(2167,90,'band3','150'),(2168,90,'band10','900'),(2169,91,'pulse_width','17'),(2170,91,'pulse_rate','17'),(2171,91,'band3','150'),(2172,91,'band10','900'),(2173,92,'pulse_width','17'),(2174,92,'pulse_rate','17'),(2175,92,'band3','150'),(2176,92,'band10','900'),(2177,93,'pulse_width','17'),(2178,93,'pulse_rate','17'),(2179,93,'band3','150'),(2180,93,'band10','900'),(2181,94,'pulse_width','15'),(2182,94,'pulse_rate','25'),(2183,94,'band3','150'),(2184,94,'band10','900'),(2185,95,'pulse_width','15'),(2186,95,'pulse_rate','25'),(2187,95,'band3','150'),(2188,95,'band10','900'),(2189,96,'pulse_width','15'),(2190,96,'pulse_rate','25'),(2191,96,'band3','150'),(2192,96,'band10','900'),(2193,97,'pulse_width','15'),(2194,97,'pulse_rate','25'),(2195,97,'band3','150'),(2196,97,'band10','900'),(2197,98,'pulse_width','15'),(2198,98,'pulse_rate','25'),(2199,98,'band3','150'),(2200,98,'band10','900'),(2201,99,'pulse_width','15'),(2202,99,'pulse_rate','25'),(2203,99,'band3','150'),(2204,99,'band10','900'),(2205,100,'pulse_width','15'),(2206,100,'pulse_rate','25'),(2207,100,'band3','150'),(2208,100,'band10','900'),(2209,101,'pulse_width','15'),(2210,101,'pulse_rate','25'),(2211,101,'band3','150'),(2212,101,'band10','900'),(2213,102,'pulse_width','15'),(2214,102,'pulse_rate','25'),(2215,102,'band3','150'),(2216,102,'band10','900'),(2217,103,'pulse_width','15'),(2218,103,'pulse_rate','25'),(2219,103,'band3','150'),(2220,103,'band10','900'),(2221,104,'pulse_width','15'),(2222,104,'pulse_rate','25'),(2223,104,'band3','150'),(2224,104,'band10','900'),(2225,105,'pulse_width','15'),(2226,105,'pulse_rate','25'),(2227,105,'band3','150'),(2228,105,'band10','900'),(2229,106,'pulse_width','15'),(2230,106,'pulse_rate','25'),(2231,106,'band3','150'),(2232,106,'band10','900'),(2233,107,'pulse_width','15'),(2234,107,'pulse_rate','25'),(2235,107,'band3','150'),(2236,107,'band10','900'),(2237,108,'pulse_width','15'),(2238,108,'pulse_rate','25'),(2239,108,'band3','150'),(2240,108,'band10','900'),(2241,109,'pulse_width','15'),(2242,109,'pulse_rate','25'),(2243,109,'band3','150'),(2244,109,'band10','900'),(2245,110,'pulse_width','15'),(2246,110,'pulse_rate','25'),(2247,110,'band3','150'),(2248,110,'band10','900'),(2249,111,'pulse_width','15'),(2250,111,'pulse_rate','25'),(2251,111,'band3','150'),(2252,111,'band10','900'),(2253,112,'pulse_width','15'),(2254,112,'pulse_rate','25'),(2255,112,'band3','150'),(2256,112,'band10','900'),(2257,113,'pulse_width','15'),(2258,113,'pulse_rate','25'),(2259,113,'band3','150'),(2260,113,'band10','900');
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `target` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `projectID` int(10) unsigned NOT NULL COMMENT 'Project for which target was originally created.',
  `max_speed_family` enum('exp','linear','const') DEFAULT NULL,
  `speed_burst` double DEFAULT NULL,
  `speed_sustained` double DEFAULT NULL,
  `speed_limit` double NOT NULL,
  `is_hidden` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `projectID` (`projectID`),
  CONSTRAINT `target_ibfk_1` FOREIGN KEY (`projectID`) REFERENCES `project` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
INSERT INTO `target` VALUES (1,'Gator','Early calibration runs were done with a 4x4 on the reserve trails.',1,'const',NULL,NULL,2.5,0),(2,'A','Martin, Mouse',3,'exp',0.25,0.1,0,0),(3,'B','Mouse',3,'exp',0.25,0.1,0,0),(4,'C','Mouse',3,'exp',0.25,0.1,0,0),(5,'D','Mouse',3,'exp',0.25,0.1,0,0),(6,'E','Mouse',3,'exp',0.25,0.1,0,0),(7,'F','Mouse',3,'exp',0.25,0.1,0,0),(8,'F6394','Female Woodrat',4,'exp',0.25,0.1,0,0),(9,'F6389','Female Woodrat',4,'exp',0.25,0.1,0,0),(10,'F5792','Female Woodrat',4,'exp',0.25,0.1,0,0),(11,'M6364','Male Woodrat',4,'exp',0.25,0.1,0,0),(13,'M6322','Male Woodrat',4,'exp',0.25,0.1,0,0),(14,'F5210','Female Woodrat',4,'exp',0.25,0.1,0,0),(15,'M5754','Male Woodrat',4,'exp',0.25,0.1,0,0),(16,'woodrat1','Human walking test. (\"Woodrat\" is a misnomer.)',1,'linear',2,0.5,0.1,0),(17,'woodrat2','Human walking test. (\"Woodrat\" is a misnomer.)',1,'linear',2,0.5,0.1,0),(21,'M164407','Mouse',6,'exp',0.25,0.1,0,0),(22,'M164416','Mouse',6,'exp',0.25,0.1,0,0),(23,'M164448','Mouse',6,'exp',0.25,0.1,0,0),(24,'M164456','Mouse',6,'exp',0.25,0.1,0,0),(25,'M164464','Mouse',6,'exp',0.25,0.1,0,0),(26,'M164472','Mouse',6,'exp',0.25,0.1,0,0),(27,'M164480','Mouse',6,'exp',0.25,0.1,0,0),(28,'QR9','Male Fox',5,'exp',2,0.25,0.05,0),(29,'QR10','Female Fox',5,'exp',2,0.25,0.05,0),(30,'QR1','Male Fox, priviously caught',5,'exp',2,0.25,0.05,0),(31,'JF6379','Juvenile Female Woodrat',7,'exp',0.25,0.1,0,0),(32,'JF6381','Juvenile Female Woodrat',7,'exp',0.25,0.1,0,0),(33,'AF6377','Adult Female Woodrat',7,'exp',0.25,0.1,0,0),(34,'AF6382 (dep102)','Adult Female Woodrat',7,'exp',0.25,0.1,0,0),(35,'AM6384','Adult Male Woodrat',7,'exp',0.25,0.1,0,0),(36,'JM6378','Juvenile Male Woodrat',7,'exp',0.25,0.1,0,0),(37,'AF6376','Adult Female Woodrat',7,'exp',0.25,0.1,0,0),(38,'AM6380','Adult Male Woodrat',7,'exp',0.25,0.1,0,0),(39,'AM6383','Adult Male Woodrat',7,'exp',0.25,0.1,0,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `deployment` (
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
INSERT INTO `deployment` VALUES (1,'',NULL,1372489200.000000,NULL,1,2,3,0,0),(2,'',NULL,1372575600.000000,NULL,2,3,3,0,0),(3,'',NULL,1372489200.000000,NULL,3,4,3,0,0),(4,'','Recaptured without collar, Re-collared',NULL,NULL,4,2,3,0,0),(5,'','Recaptured without collar, Re-collared',NULL,NULL,5,3,3,0,0),(6,'',NULL,1373266800.000000,1375686000.000000,6,5,3,0,0),(8,'','Recaptured without collar again, Re-collared',NULL,NULL,8,2,3,0,0),(9,'',NULL,1373612400.000000,1375772400.000000,9,6,3,0,0),(12,'',NULL,1374044400.000000,1375513200.000000,12,7,3,0,0),(51,'','Initial calibration run with test transmitter in gator with Garmin GPS',1376420400.000000,1376442000.000000,51,1,2,0,0),(52,'',NULL,1380697200.000000,NULL,52,8,4,0,0),(53,'',NULL,1380697200.000000,NULL,53,9,4,0,0),(54,'',NULL,1380697200.000000,1399842000.000000,54,10,4,0,0),(55,'',NULL,1380697200.000000,1397372400.000000,55,11,4,0,0),(56,'',NULL,1380697200.000000,1397372400.000000,56,13,4,0,0),(58,'',NULL,1380697200.000000,NULL,58,14,4,0,0),(59,'',NULL,1380697200.000000,NULL,59,15,4,0,0),(60,'','Beacon transmitter at site 34',1383012000.000000,1384527600.000000,60,1,1,0,0),(61,'','Walking test with woodrat transmitter and garmin GPS',1391241600.000000,1396767600.000000,61,16,1,0,0),(62,'','Walking test with woodrat transmitter and garmin GPS',1391241600.000000,1396767600.000000,62,17,1,0,0),(63,'',NULL,1400331600.000000,NULL,63,28,5,1,0),(64,'',NULL,1400331600.000000,NULL,64,29,5,1,0),(68,'',NULL,1400418000.000000,NULL,68,30,5,1,0),(69,'',NULL,1401433200.000000,1403895600.000000,69,21,6,0,0),(70,'',NULL,1401433200.000000,1403545200.000000,70,22,6,0,0),(73,'',NULL,1401433200.000000,1403031600.000000,73,23,6,0,0),(74,'',NULL,1401433200.000000,1402945200.000000,74,24,6,0,0),(75,'',NULL,1401692400.000000,1403118000.000000,75,25,6,0,0),(76,'',NULL,1403893800.000000,NULL,76,26,6,0,0),(77,'',NULL,1401433200.000000,1403895600.000000,77,27,6,0,0),(97,'',NULL,1403960400.000000,NULL,97,31,7,1,0),(99,'',NULL,1403960400.000000,NULL,99,32,7,0,0),(100,'',NULL,1403960400.000000,NULL,100,33,7,1,0),(102,'',NULL,1403960400.000000,NULL,102,34,7,1,0),(103,'',NULL,1403960400.000000,NULL,103,35,7,1,0),(105,'',NULL,1403960400.000000,NULL,105,36,7,1,0),(106,'',NULL,1403960400.000000,NULL,106,37,7,1,0),(107,'',NULL,1403960400.000000,NULL,107,38,7,1,0),(109,'',NULL,1403960400.000000,NULL,109,39,7,1,0);
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE IF NOT EXISTS `location` (
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
INSERT INTO `location` VALUES (7,1,'server',NULL,'Field Station',38.483052,-122.149580,574172.77,4259755.45,10,'S',394.02,0),(9,1,'site34',NULL,'Decker Canyon, Beacon TX',38.493453,-122.148040,574296.45,4260910.87,10,'S',174.19,0),(10,1,'center',NULL,'Center for position estimation',0.000000,0.000000,574500.00,4260500.00,10,'S',0.00,0);
