INSERT INTO tx_type (RMG_type, tx_table_name) VALUES ('pulse','tx_pulse') ;

INSERT INTO tx_info (tx_type_ID, manufacturer, model) VALUES ('1', 'Ben Kamen', 'Tune-able Transmitter') ;
INSERT INTO tx_info (tx_type_ID, manufacturer, model) VALUES ('1', 'ATS', 'M1520') ;
INSERT INTO tx_info (tx_type_ID, manufacturer, model) VALUES ('1', 'ATS', 'M1450') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (1, 164.010, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (1, 'M164010');
INSERT INTO tx_alias (tx_ID, alias) VALUES (1, 'A');
INSERT INTO tx_alias (tx_ID, alias) VALUES (1, 'Martin');
INSERT INTO tx_deployment (tx_ID, start_time) VALUES (1, 1372489200);

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (2, 164.017, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (2, 'M164017');
INSERT INTO tx_alias (tx_ID, alias) VALUES (2, 'B');
INSERT INTO tx_deployment (tx_ID, start_time) VALUES (2, 1372575600) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (3, 164.024, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (3, 'M164024');
INSERT INTO tx_alias (tx_ID, alias) VALUES (3, 'C');
INSERT INTO tx_deployment (tx_ID, start_time) VALUES (3, 1372489200) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (4, 164.033, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (4, 'M164033');
INSERT INTO tx_alias (tx_ID, alias) VALUES (4, 'A');
INSERT INTO tx_alias (tx_ID, alias) VALUES (4, 'Martin');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (5, 164.041, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (5, 'M164041');
INSERT INTO tx_alias (tx_ID, alias) VALUES (5, 'B');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (6, 164.048, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (6, 'M164048');
INSERT INTO tx_alias (tx_ID, alias) VALUES (6, 'D');
INSERT INTO tx_deployment (tx_ID, start_time, stop_time) VALUES (6, 1373266800, 1375686000) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (7, 164.056, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (7, 'M164056');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (8, 164.065, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (8, 'M164065');
INSERT INTO tx_alias (tx_ID, alias) VALUES (8, 'A');
INSERT INTO tx_alias (tx_ID, alias) VALUES (8, 'Martin');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (9, 164.073, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (9, 'M164073');
INSERT INTO tx_alias (tx_ID, alias) VALUES (9, 'E');
INSERT INTO tx_deployment (tx_ID, start_time, stop_time) VALUES (9, 1373612400, 1375772400);

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (10, 164.081, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (10, 'M164081');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (11, 164.089, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (11, 'M164089');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (12, 164.097, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (12, 'M164097');
INSERT INTO tx_alias (tx_ID, alias) VALUES (12, 'F');
INSERT INTO tx_deployment (tx_ID, start_time, stop_time) VALUES (12, 1374044400, 1375513200);

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (13, 164.105, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (13, 'M164105') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (14, 164.113, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (14, 'M164113') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (15, 164.121, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (15, 'M164121') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (16, 164.130, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (16, 'M164130') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (17, 164.138, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (17, 'M164138') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (18, 164.145, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (18, 'M164145') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (19, 164.153, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (19, 'M164153') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (20, 164.162, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (20, 'M164162') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (21, 164.170, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (21, 'M164170') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (22, 164.177, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (22, 'M164177') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (23, 164.185, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (23, 'M164185') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (24, 164.194, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (24, 'M164194') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (25, 164.201, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (25, 'M164201') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (26, 164.210, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (26, 'M164210') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (27, 164.217, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (27, 'M164217') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (28, 164.225, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (28, 'M164225') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (29, 164.233, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (29, 'M164233') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (30, 164.241, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (30, 'M164241') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (31, 164.248, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (31, 'M164248') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (32, 164.256, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (32, 'M164256') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (33, 164.265, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (33, 'M164265') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (34, 164.273, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (34, 'M164273') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (35, 164.280, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (35, 'M164280') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (36, 164.289, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (36, 'M164289') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (37, 164.297, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (37, 'M164297') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (38, 164.305, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (38, 'M164305') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (39, 164.313, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (39, 'M164313') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (40, 164.321, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (40, 'M164321') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (41, 164.328, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (41, 'M164328') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (42, 164.336, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (42, 'M164336') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (43, 164.344, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (43, 'M164344') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (44, 164.352, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (44, 'M164352') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (45, 164.361, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (45, 'M164361') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (46, 164.369, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (46, 'M164369') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (47, 164.377, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (47, 'M164377') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (48, 164.384, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (48, 'M164384') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (49, 164.393, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (49, 'M164393') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (50, 164.400, 15.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (50, 'M164400') ;



INSERT INTO tx_ID (tx_info_ID, active) VALUES ('1', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate) VALUES (51, 164.500, 20.0, 60.0) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (51, 'tuneable_tx') ;
INSERT INTO tx_deployment (tx_ID, start_time, stop_time) VALUES (51, 1376420400, 1376442000);



INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (52, 164.013, 19.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (52, 'F6394') ;
INSERT INTO tx_deployment (tx_ID, start_time) VALUES (52, 1380697200);

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (53, 164.023, 19.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (53, 'F6389') ;
INSERT INTO tx_deployment (tx_ID, start_time) VALUES (53, 1380697200);

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (54, 164.033, 19.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (54, 'F5792') ;
INSERT INTO tx_deployment (tx_ID, start_time) VALUES (54, 1380697200);
update tx_deployment set stop_time=1399842000 where tx_ID=54 ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (55, 164.042, 19.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (55, 'M6364') ;
INSERT INTO tx_deployment (tx_ID, start_time, stop_time) VALUES (55, 1380697200, 1397372400);

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (56, 164.053, 19.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (56, 'M6322') ;
INSERT INTO tx_deployment (tx_ID, start_time, stop_time) VALUES (56, 1380697200, 1397372400);

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (57, 164.061, 19.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (57, 'F6375') ;
INSERT INTO tx_deployment (tx_ID, start_time, stop_time) VALUES (55, 1380697200, 1385452800);

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (58, 164.071, 19.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (58, 'F5210') ;
INSERT INTO tx_deployment (tx_ID, start_time) VALUES (58, 1380697200);

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (59, 164.083, 19.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (59, 'M5754') ;
INSERT INTO tx_deployment (tx_ID, start_time) VALUES (59, 1380697200);



INSERT INTO tx_ID (tx_info_ID, active) VALUES ('1', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate) VALUES (60, 164.000, 20.0, 60.0) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (60, 'Beacon') ;
INSERT INTO tx_deployment (tx_ID, start_time, stop_time) VALUES (60, 1383012000, 1384527600);



INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (61, 164.092, 19.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (61, 'woodrat1') ;
INSERT INTO tx_deployment (tx_ID, start_time, stop_time) VALUES (61, 1391241600, 1391328000);
INSERT INTO tx_deployment (tx_ID, start_time, stop_time) VALUES (61, 1396681200, 1396767600);

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (62, 164.103, 19.0, 23.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (62, 'woodrat2') ;
INSERT INTO tx_deployment (tx_ID, start_time, stop_time) VALUES (62, 1391241600, 1391328000);
INSERT INTO tx_deployment (tx_ID, start_time, stop_time) VALUES (62, 1396681200, 1396767600);



INSERT INTO tx_info (tx_type_ID, manufacturer, model) VALUES ('1', 'Holohil', 'MI-2M(12)') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('4', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate) VALUES (63, 163.847, 30.0, 39.6) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (63, '190785') ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (63, 'QR9 male') ;
INSERT INTO tx_deployment (tx_ID, start_time) VALUES (63, 1400331600);

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('4', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate) VALUES (64, 163.874, 30.0, 39.6) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (64, '190786') ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (64, 'QR10 female') ;
INSERT INTO tx_deployment (tx_ID, start_time) VALUES (64, 1400331600);

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('4', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate) VALUES (65, 163.908, 30.0, 39.0) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (65, '190787') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('4', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate) VALUES (66, 163.921, 30.0, 39.6) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (66, '190788') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('4', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate) VALUES (67, 163.974, 30.0, 39.6) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (67, '190789') ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('4', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate) VALUES (68, 163.997, 30.0, 40.2) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (68, '190790') ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (68, 'QR1 male') ;
INSERT INTO tx_deployment (tx_ID, start_time) VALUES (68, 1400418000);



INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (69, 164.407, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (69, 'M164407');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (70, 164.416, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (70, 'M164416');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (71, 164.432, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (71, 'M164432');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (72, 164.440, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (72, 'M164440');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (73, 164.448, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (73, 'M164448');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (74, 164.456, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (74, 'M164456');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (75, 164.464, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (75, 'M164464');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (76, 164.472, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (76, 'M164472');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (77, 164.480, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (77, 'M164480');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (78, 164.488, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (78, 'M164488');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (79, 164.496, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (79, 'M164496');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (80, 164.504, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (80, 'M164504');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (81, 164.512, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (81, 'M164512');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (82, 164.520, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (82, 'M164520');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (83, 164.528, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (83, 'M164528');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (84, 164.545, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (84, 'M164545');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (85, 164.553, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (85, 'M164553');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (86, 164.560, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (86, 'M164560');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (87, 164.568, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (87, 'M164568');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (88, 164.576, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (88, 'M164576');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (89, 164.584, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (89, 'M164584');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (90, 164.593, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (90, 'M164593');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (91, 164.601, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (91, 'M164601');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (92, 164.807, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (92, 'M164807');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('3', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (93, 164.816, 17.0, 17.0, 150, 900) ;
INSERT INTO tx_alias (tx_ID, alias) VALUES (93, 'M164816');

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (94, 164.008, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (95, 164.016, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (96, 164.024, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (97, 164.032, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (98, 164.040, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (99, 164.048, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (100, 164.056, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (101, 164.072, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (102, 164.080, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (103, 164.088, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (104, 164.120, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (105, 164.128, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (106, 164.136, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (107, 164.144, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (108, 164.152, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (109, 164.160, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (110, 164.168, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (111, 164.176, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (112, 164.184, 15.0, 25.0, 150, 900) ;

INSERT INTO tx_ID (tx_info_ID, active) VALUES ('2', FALSE) ;
INSERT INTO tx_pulse (tx_ID, frequency, pulse_width, pulse_rate, band3, band10) VALUES (113, 164.192, 15.0, 25.0, 150, 900) ;

