#!/bin/bash
#dumps tracking data for testing data processing for est records
#   for given time range and deployments
#dumps from tables site, calibration_information, steering_vectors, and est
#generated sql doesn't drop tables or overwrite any data (uses insert ignore)

echo "Enter Starting Timestamp for EST records to dump"
read starttime

echo "Enter Ending Timestamp for EST records to dump"
read endtime

echo "Enter deployments for EST records to dump, comma seperated"
read deployments

echo "Enter path/filename to save to"
read filename

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat site calibration_information > $filename

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat steering_vectors --where="cal_infoID in (3, 6)" >> $filename
#TODO check cal_infoIDs

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat est --where="timestamp > $starttime and timestamp < $endtime and deploymentID in ($deployments)" >> $filename

sed -i 's/CREATE TABLE/CREATE TABLE IF NOT EXISTS/' $filename


