#!/bin/bash
#dumps map data to map_data.sql

echo "Enter Starting Timestamp to dump"
read starttime

echo "Enter Ending Timestamp to dump"
read endtime

echo "Enter deployments to dump, comma seperated"
read deployments

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat site > map_data.sql

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat position track_pos --where="timestamp > $starttime and timestamp < $endtime and deploymentID in ($deployments)" >> map_data.sql

