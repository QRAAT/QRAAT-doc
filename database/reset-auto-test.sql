-- Reset database for testing of automated processing. 
use qraat; 
delete from position;
delete from bearing;
delete from covariance;
delete from provenance;
delete from track_pos; 
delete from estinterval;
delete from estscore; 
delete from processing_cursor; 
insert into qraat.processing_cursor (name, value) value ('estscore', (select min(id) from qraat.est));
insert into qraat.processing_cursor (name, value) value ('position', (select min(id) from qraat.est));
