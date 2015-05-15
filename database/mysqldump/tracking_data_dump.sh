#!/bin/bash
#dumps tracking data to tracking_data.sql

echo "Enter Starting Timestamp to dump"
read starttime

echo "Enter Ending Timestamp to dump"
read endtime

echo "Enter deployments to dump, comma seperated"
read deployments

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat site > tracking_data.sql

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat bearing est estinterval position track_pos --where="timestamp > $starttime and timestamp < $endtime and deploymentID in ($deployments)" >> tracking_data.sql

#estscore

#provenance from position?
