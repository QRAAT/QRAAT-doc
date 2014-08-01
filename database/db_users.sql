-- DROP USER 'reader'@'localhost';
-- DROP USER 'writer'@'localhost'; 

CREATE USER 'reader'@'localhost' IDENTIFIED BY 'fella'; 
CREATE USER 'writer'@'localhost' IDENTIFIED BY 'guy'; 

GRANT SELECT ON qraat.* TO 'reader'@'localhost', 'writer'@'localhost'; 
GRANT INSERT, UPDATE, DELETE ON qraat.* TO 'writer'@'localhost'; 

-- To enable `mysql -u reader` to run without entering a 
-- password, add the following to /etc/mysql/my.cnf after 
-- the `[mysql]` line: 
--  user=reader
--  password=fella


--front-end database users
CREATE DATABASE IF NOT EXISTS django;
CREATE USER admin@'localhost' IDENTIFIED BY 'somesecurepassword';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER ON django.* TO admin@'localhost';

CREATE USER web_reader@'localhost' IDENTIFIED BY 'somesecurepassword';
GRANT SELECT ON django.* TO web_reader@'localhost';
GRANT SELECT ON qraat.* TO web_reader@'localhost';

CREATE USER web_writer@'localhost' IDENTIFIED BY 'somesecurepassword';
GRANT SELECT, INSERT, UPDATE ON django.* TO web_writer@'localhost';
GRANT SELECT ON qraat.* TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.auth_project_collaborator TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.auth_project_viewer TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.deployment TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.location TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.project TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.target TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.track TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.tx TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.tx_make TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.tx_make_parameters TO web_writer@'localhost';
GRANT SELECT, INSERT, UPDATE ON qraat.tx_parameters TO web_writer@'localhost';

