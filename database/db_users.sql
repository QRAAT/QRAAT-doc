-- MySQL users required for qraat backend server

-- 'reader' used for read-only processes
DROP USER 'reader'@'localhost';
CREATE USER 'reader'@'localhost' IDENTIFIED BY 'password'; 
GRANT SELECT ON qraat.* TO 'reader'@'localhost';
-- To enable mysql client to run without entering a 
-- password, add the following to /etc/mysql/my.cnf after 
-- the `[mysql]` line: 
--  user=reader
--  password=password

-- 'writer' used for processes that need to modify qraat tables
DROP USER 'writer'@'localhost'; 
CREATE USER 'writer'@'localhost' IDENTIFIED BY 'password'; 
GRANT SELECT ON qraat.* TO 'writer'@'localhost'; 
GRANT INSERT, UPDATE, DELETE ON qraat.* TO 'writer'@'localhost'; 

-- 'replicator' used for the replication processes running on frontend server, connecting via tunnel
DROP USER 'replicator'@'localhost'; 
CREATE USER 'replicator'@'localhost' IDENTIFIED BY 'password'; 
GRANT REPLICATION CLIENT ON *.* TO 'replicator'@'localhost' IDENTIFIED BY PASSWORD '*B361CE0EB6280F4ABD5D5CE9DE1228B2FD736F42' |
GRANT SELECT, INSERT, UPDATE ON `qraat`.* TO 'replicator'@'localhost'                                                          |
