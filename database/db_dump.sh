#!/bin/bash

T_START=$(date --date="20140202 1725" +%s)
T_END=$(date --date="20140202 1900" +%s)

#echo $(mysql -u reader -B -e "SELECT count(*) FROM qraat.est WHERE timestamp >= $T_START AND timestamp <= $T_END")
#mysql -u reader -B -e "SELECT * FROM qraat.est WHERE timestamp >= $T_START AND timestamp <= $T_END" > est.txt
#mysql -u reader -B -e "SELECT * FROM qraat.sitelist" > sitelist.txt
#mysql -u reader -B -e "SELECT * FROM qraat.txlist" > txlist.txt
#mysql -u reader -B -e "SELECT * FROM qraat.tx_ID" > tx_ID.txt
#mysql -u reader -B -e "SELECT * FROM qraat.tx_info" > tx_info.txt
#mysql -u reader -B -e "SELECT * FROM qraat.tx_type" > tx_type.txt
#mysql -u reader -B -e "SELECT * FROM qraat.tx_pulse" > tx_pulse.txt
#mysql -u reader -B -e "SELECT * FROM qraat.tx_alias" > tx_alias.txt
#mysql -u reader -B -e "SELECT * FROM qraat.tx_deployment" > tx_deployment.txt
mysql -u reader -B -e "SELECT * FROM qraat.Calibration_Information" > Calibration_Information.txt
mysql -u reader -B -e "SELECT * FROM qraat.GPS_Calibration_Data" > GPS_Calibration_Data.txt
mysql -u reader -B -e "SELECT * FROM qraat.True_Position" > True_Position.txt
mysql -u reader -B -e "SELECT * FROM qraat.steering_vectors" > steering_vectors.txt
mysql -u reader -B -e "SELECT * FROM qraat.site" > site.txt
mysql -u reader -B -e "SELECT * FROM qraat.project" > project.txt
mysql -u reader -B -e "SELECT * FROM qraat.auth_project_viewer" > auth_project_viewer.txt
mysql -u reader -B -e "SELECT * FROM qraat.auth_project_collaborator" > auth_project_collaborator.txt
mysql -u reader -B -e "SELECT * FROM qraat.tx" > tx.txt
mysql -u reader -B -e "SELECT * FROM qraat.tx_make" > tx_make.txt
mysql -u reader -B -e "SELECT * FROM qraat.tx_make_parameters" > tx_make_parameters.txt
mysql -u reader -B -e "SELECT * FROM qraat.tx_parameters" > tx_parameters.txt
mysql -u reader -B -e "SELECT * FROM qraat.target" > target.txt
mysql -u reader -B -e "SELECT * FROM qraat.deployment" > deployment.txt
mysql -u reader -B -e "SELECT * FROM qraat.track" > track.txt
mysql -u reader -B -e "SELECT * FROM qraat.location" > location.txt




