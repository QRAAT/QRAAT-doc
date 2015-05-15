#!/bin/bash
#dumps system metadata to system_metadata.sql

echo "Enter Starting Timestamp to dump"
read starttime

echo "Enter Ending Timestamp to dump"
read endtime

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat archive_config archive_config_backup processing_cursor site > system_metadata.sql

echo "MySQL root password needed"
mysqldump -u root -p --insert-ignore --compact qraat archive_log detcount estcount processing_statistics procount telemetry timecheck --where="timestamp > $starttime and timestamp < $endtime" >> system_metadata.sql

