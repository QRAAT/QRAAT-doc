#!/bin/bash
#dumps system metadata for given timerange to file
#dumps from tables archive_config, archive_config_backup, processing_cursor, 
#       site, archive_log, detcount, estcount, processing_statistics, procount,
#       telemetry, and timecheck
#generated sql doesn't drop tables or overwrite any data (uses insert ignore)

echo "Enter Starting Timestamp to dump"
read starttime

echo "Enter Ending Timestamp to dump"
read endtime

echo "Enter path/filename to save to"
read filename

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat archive_config archive_config_backup processing_cursor site > $filename

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat archive_log detcount estcount processing_statistics procount telemetry timecheck --where="timestamp > $starttime and timestamp < $endtime" >> $filename

sed -i 's/CREATE TABLE/CREATE TABLE IF NOT EXISTS/' $filename


