#!/bin/bash
#dumps tracking data for testing position estimation to raw_data.sql

echo "Enter Starting Timestamp for EST records to dump"
read starttime

echo "Enter Ending Timestamp for EST records to dump"
read endtime

echo "Enter deployments for EST records to dump, comma seperated"
read deployments

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat site calibration_information > raw_data.sql

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat steering_vectors --where="cal_infoID in (3, 6)" >> raw_data.sql
#TODO check cal_infoIDs

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat est --where="timestamp > $starttime and timestamp < $endtime and deploymentID in ($deployments)" >> raw_data.sql

