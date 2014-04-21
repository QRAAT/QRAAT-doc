-- Run like this: mysql -u writer -p --local-infile <db_load.sql.
-- Make sure the text files containing the rows are in the current
-- directory.

LOAD DATA LOCAL INFILE 'sitelist.txt' INTO TABLE qraat.sitelist ignore 1 lines; 
LOAD DATA LOCAL INFILE 'txlist.txt' INTO TABLE qraat.txlist ignore 1 lines; 
LOAD DATA LOCAL INFILE 'Calibration_Information.txt' INTO TABLE qraat.Calibration_Information ignore 1 lines; 
LOAD DATA LOCAL INFILE 'GPS_Calibration_Data.txt' INTO TABLE qraat.GPS_Calibration_Data ignore 1 lines; 
LOAD DATA LOCAL INFILE 'True_Position.txt' INTO TABLE qraat.True_Position ignore 1 lines;
LOAD DATA LOCAL INFILE 'Steering_Vectors.txt' INTO TABLE qraat.Steering_Vectors ignore 1 lines;
LOAD DATA LOCAL INFILE 'est.txt' INTO TABLE qraat.est ignore 1 lines; 

