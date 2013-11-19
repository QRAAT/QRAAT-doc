-- DROP USER 'reader'@'localhost';
-- DROP USER 'writer'@'localhost'; 

CREATE USER 'reader'@'localhost' IDENTIFIED BY 'fella'; 
CREATE USER 'writer'@'localhost' IDENTIFIED BY 'guy'; 

GRANT SELECT ON qraat.* TO 'reader', 'writer'; 
GRANT INSERT, UPDATE, DELETE ON qraat.* TO 'writer'; 

-- To enable `mysql -u reader` to run without entering a 
-- password, add the following to /etc/mysql/my.cnf after 
-- the `[mysql]` line: 
--  user=reader
--  password=fella
