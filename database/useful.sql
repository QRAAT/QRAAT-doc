-- Initialize auto processing cursors
insert into qraat.processing_cursor (name, value) value ('estscore', (select min(id) from qraat.est));
insert into qraat.processing_cursor (name, value) value ('position', (select min(id) from qraat.est));
insert into qraat.processing_cursor (name, value) value ('track_pos', (select min(id) from qraat.position));
