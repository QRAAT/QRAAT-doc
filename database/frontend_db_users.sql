-- front-end database users
CREATE DATABASE IF NOT EXISTS django;

-- user django_admin is used by django framework
CREATE USER django_admin@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE, INDEX, CREATE, DROP, ALTER ON django.* TO django_admin@'localhost';
GRANT SELECT ON qraat.* TO django_admin@'localhost';

-- user web_reader is used by django webapps to read data from anywhere
CREATE USER web_reader@'localhost' IDENTIFIED BY 'password';
GRANT SELECT ON django.* TO web_reader@'localhost';
GRANT SELECT ON qraat.* TO web_reader@'localhost';

-- user web_writer is used by django webapps to modify any django tables and specific qraat tables
CREATE USER web_writer@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE ON django.* TO web_writer@'localhost';
GRANT SELECT ON qraat.* TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.auth_project_collaborator TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.auth_project_viewer TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.deployment TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.location TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.project TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.target TO web_writer@'localhost';
-- >>>FIXME Why is this commented out?
-- GRANT SELECT, INSERT, UPDATE ON qraat.track TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.tx TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.tx_make TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.tx_make_parameters TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.tx_parameters TO web_writer@'localhost';

-- user replicator is used by the replication process to update the qraat database
CREATE USER replicator@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON qraat.* TO replicator@'localhost';

#END
