#!/bin/bash

mysql -u reader -B -e "SELECT * FROM qraat.sitelist" > sitelist.txt
mysql -u reader -B -e "SELECT * FROM qraat.txlist" > txlist.txt
mysql -u reader -B -e "SELECT * FROM qraat.Calibration_Information" > Calibration_Information.txt
mysql -u reader -B -e "SELECT * FROM qraat.GPS_Calibration_Data" > GPS_Calibration_Data.txt
mysql -u reader -B -e "SELECT * FROM qraat.True_Position" > True_Position.txt
mysql -u reader -B -e "SELECT * FROM qraat.Steering_Vectors" > Steering_Vectors.txt
mysql -u reader -B -e "SELECT * FROM qraat.est WHERE timestamp >= 1376420800.0 AND timestamp <= 1376442000.0" > est_calrun.txt



