#!/bin/bash
#dumps map data for given time range and deployment to file
#dumps from tables site, position, and track_pos
#generated sql doesn't drop tables or overwrite any data (uses insert ignore)

echo "Enter Starting Timestamp to dump"
read starttime

echo "Enter Ending Timestamp to dump"
read endtime

echo "Enter deployments to dump, comma seperated"
read deployments

echo "Enter path/filename to save to"
read filename

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat site > $filename

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat position track_pos --where="timestamp > $starttime and timestamp < $endtime and deploymentID in ($deployments)" >> $filename

sed -i 's/CREATE TABLE/CREATE TABLE IF NOT EXISTS/' $filename

