-- Create admin account, put UUID of user for '99999'. 
DELETE FROM `site`; 
DELETE FROM `location`; 
DELETE FROM `project`; 
DELETE FROM `track`;

INSERT INTO `site` (ID, name, location, latitude, longitude, easting, northing, utm_zone_number, utm_zone_letter, elevation) VALUES 
   (1,'site1','Field Station',38.483052,-122.149580,574172.77,4259755.45,10,'S',394.02),
   (2,'site2','DFG Hill Tower',38.499708,-122.148620,574239.47,4261604.51,10,'S',363.50),
   (3,'site10','Dan\'s Repeater',38.499326,-122.139744,575013.86,4261569.32,10,'S',376.96),
   (4,'site13','Blue Oak Tower',38.491643,-122.152812,573882.15,4260706.17,10,'S',273.14),
   (5,'site20','QRWC Tower',38.491915,-122.136299,575321.92,4260749.75,10,'S',424.54),
   (6,'site21','Weaver Tower',38.492924,-122.142340,574794.06,4260856.82,10,'S',293.57),
   (8,'site39','SiteK',38.495187,-122.151417,574000.17,4261100.56,10,'S',199.29); 
ALTER TABLE `site` AUTO_INCREMENT = 9;
  
INSERT INTO `project` (ID, ownerID, name, description, is_public, is_hidden) VALUES 
   (1, 99999, 'QRAAT (dev)', 'Contains all transmitters and data up to July 2014.', False, False); 
ALTER TABLE `project` AUTO_INCREMENT = 2;

INSERT INTO `location` (ID, projectID, name, description, location, latitude, longitude, easting, northing, 
                            utm_zone_number, utm_zone_letter, elevation, is_hidden) VALUES 
   (7, 1, 'server', NULL, 'Field Station',38.483052,-122.149580,574172.77,4259755.45,10,'S',394.02,0),
   (9, 1, 'site34', NULL, 'Decker Canyon, Beacon TX',38.493453,-122.148040,574296.45,4260910.87,10,'S',174.19,0),
   (10, 1, 'center', NULL, 'Center for position estimation',0.000000,0.000000,574500.00,4260500.00,10,'S',0.00,0);
ALTER TABLE `location` AUTO_INCREMENT = 11;

INSERT INTO `track` (ID, deploymentID, projectID, max_speed_family, speed_burst, speed_sustained, speed_limit, is_hidden) VALUES 
   (0,1,51,'const',2.5,NULL,NULL,0),
   (1,1,63,'exp',2,0.25,0.05,0),
   (2,1,64,'exp',2,0.25,0.05,0),
   (3,1,68,'exp',2,0.25,0.05,0),
   (4,1,69,'exp',1,0.1,0.05,0),
   (5,1,70,'exp',1,0.1,0.05,0),
   (6,1,73,'exp',1,0.1,0.05,0),
   (7,1,74,'exp',1,0.1,0.05,0),
   (8,1,75,'exp',1,0.1,0.05,0),
   (9,1,77,'exp',1,0.1,0.05,0);
ALTER TABLE `track` AUTO_INCREMENT = 10;


-- INSERT INTO `qraat.tx_make` VALUES 
--    (); -- TODO 
-- 
-- INSERT INTO `qraat.tx_make_parameters` VALUES 
--    (); -- TODO 
-- 
-- INSERT INTO `qraat.target` VALUES
--    (); -- TODO 
-- 
-- INSERT INTO `qraat.tx` VALUES
--    (); -- TODO 
-- 
-- INSERT INTO `qraat.tx_parameters` VALUES
--    (); -- TODO  
-- 
-- INSERT INTO `qraat.deployment` VALUES
--    (); -- TODO 

-- TODO set AUTO_INCREMENT to one more than the max serial ID for each table. 


COMMIT; 
