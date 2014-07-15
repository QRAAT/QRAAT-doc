-- Create admin account, put UUID of user for '99999'. 
INSERT INTO `qraat.project` VALUES 
   (0, 99999, 'QRAAT (dev)', 'Contains all transmitters and data up to July 2014.', False, False); 

INSERT INTO `qraat.rx_site` VALUES 
   (1,'site1','Field Station',38.483052,-122.149580,574172.77,4259755.45,10,'S',394.02,1),
   (2,'site2','DFG Hill Tower',38.499708,-122.148620,574239.47,4261604.51,10,'S',363.50,1),
   (3,'site10','Dan\'s Repeater',38.499326,-122.139744,575013.86,4261569.32,10,'S',376.96,1),
   (4,'site13','Blue Oak Tower',38.491643,-122.152812,573882.15,4260706.17,10,'S',273.14,1),
   (5,'site20','QRWC Tower',38.491915,-122.136299,575321.92,4260749.75,10,'S',424.54,1),
   (6,'site21','Weaver Tower',38.492924,-122.142340,574794.06,4260856.82,10,'S',293.57,1),
   (8,'site39','SiteK',38.495187,-122.151417,574000.17,4261100.56,10,'S',199.29,1); 
  
INSERT INTO `qraat.site` VALUES
   (7, 0, 'server','Field Station',38.483052,-122.149580,574172.77,4259755.45,10,'S',394.02,0),
   (9, 0, 'site34','Decker Canyon, Beacon TX',38.493453,-122.148040,574296.45,4260910.87,10,'S',174.19,0),
   (10, 0, 'center','Center for position estimation',0.000000,0.000000,574500.00,4260500.00,10,'S',0.00,0);

INSERT INTO `qraat.tx_make` VALUES 
   (); -- TODO 

INSERT INTO `qraat.tx_make_parameters` VALUES 
   (); -- TODO 

INSERT INTO `qraat.target` VALUES
   (); -- TODO 

INSERT INTO `qraat.tx` VALUES
   (); -- TODO 

INSERT INTO `qraat.tx_parameters` VALUES
   (); -- TODO  

INSERT INTO `qraat.deployment` VALUES
   (); -- TODO 

COMMIT; 
