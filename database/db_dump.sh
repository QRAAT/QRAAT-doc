#!/bin/bash

T_START=$(date --date="20140202 1725" +%s)
T_END=$(date --date="20140202 1900" +%s)

#echo $(mysql -u reader -B -e "SELECT count(*) FROM qraat.est WHERE timestamp >= $T_START AND timestamp <= $T_END")
#mysql -u reader -B -e "SELECT * FROM qraat.est WHERE timestamp >= $T_START AND timestamp <= $T_END" > est.txt
mysql -u reader -B -e "SELECT * FROM qraat.sitelist" > sitelist.txt
mysql -u reader -B -e "SELECT * FROM qraat.txlist" > txlist.txt
mysql -u reader -B -e "SELECT * FROM qraat.tx_ID" > tx_ID.txt
mysql -u reader -B -e "SELECT * FROM qraat.tx_info" > tx_info.txt
mysql -u reader -B -e "SELECT * FROM qraat.tx_type" > tx_type.txt
mysql -u reader -B -e "SELECT * FROM qraat.tx_pulse" > tx_pulse.txt
mysql -u reader -B -e "SELECT * FROM qraat.tx_alias" > tx_alias.txt
mysql -u reader -B -e "SELECT * FROM qraat.tx_deployment" > tx_deployment.txt
mysql -u reader -B -e "SELECT * FROM qraat.Calibration_Information" > Calibration_Information.txt
mysql -u reader -B -e "SELECT * FROM qraat.GPS_Calibration_Data" > GPS_Calibration_Data.txt
mysql -u reader -B -e "SELECT * FROM qraat.True_Position" > True_Position.txt
mysql -u reader -B -e "SELECT * FROM qraat.Steering_Vectors" > Steering_Vectors.txt



