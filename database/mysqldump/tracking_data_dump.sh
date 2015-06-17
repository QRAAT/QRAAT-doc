#!/bin/bash
#dumps tracking data from given time range and deployments to file
#dumps from tables site, bearing, est, estinterval, position, track_pos,
#        estscore, and provenance

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
mysqldump -u root -p --insert-ignore --compact qraat bearing est estinterval position track_pos --where="timestamp > $starttime and timestamp < $endtime and deploymentID in ($deployments)" >> $filename

#estscore
mysqldump -u root -p --insert-ignore --compact qraat estscore --where="estID in (select ID from est where timestamp > $starttime and timestamp < $endtime and deploymentID in ($deployments))" >> $filename


#provenance from position?
mysqldump -u root -p --insert-ignore --compact qraat provenance --where="obj_table='position' and obj_id in (select ID from position where timestamp > $starttime and timestamp < $endtime and deploymentID in ($deployments))" >> $filename

sed -i 's/CREATE TABLE/CREATE TABLE IF NOT EXISTS/' $filename

