#!/bin/bash

T_START=$(date --date="20140202 1725" +%s)
T_END=$(date --date="20140202 1900" +%s)

#echo $(mysql -u reader -B -e "SELECT count(*) FROM qraat.est WHERE timestamp >= $T_START AND timestamp <= $T_END")
mysql -u reader -B -e "SELECT * FROM qraat.est WHERE timestamp >= $T_START AND timestamp <= $T_END" > est.txt
mysql -u reader -B -e "SELECT * FROM qraat.sitelist" > sitelist.txt
mysql -u reader -B -e "SELECT * FROM qraat.txlist" > txlist.txt
mysql -u reader -B -e "SELECT * FROM qraat.Calibration_Information" > Calibration_Information.txt
mysql -u reader -B -e "SELECT * FROM qraat.GPS_Calibration_Data" > GPS_Calibration_Data.txt
mysql -u reader -B -e "SELECT * FROM qraat.True_Position" > True_Position.txt
mysql -u reader -B -e "SELECT * FROM qraat.Steering_Vectors" > Steering_Vectors.txt



