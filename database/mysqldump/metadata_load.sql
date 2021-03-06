-- e.g. ``mysql -u root -p --local-infile <metadata_load.sql``
load data local infile 'site.txt' into table qraat.site ignore 1 lines;
load data local infile 'project.txt' into table qraat.project ignore 1 lines;
load data local infile 'auth_project_viewer.txt' into table qraat.auth_project_viewer ignore 1 lines;
load data local infile 'auth_project_collaborator.txt' into table qraat.auth_project_collaborator ignore 1 lines;
load data local infile 'tx.txt' into table qraat.tx ignore 1 lines;
load data local infile 'tx_make.txt' into table qraat.tx_make ignore 1 lines;
load data local infile 'tx_parameters.txt' into table qraat.tx_parameters ignore 1 lines;
load data local infile 'tx_make_parameters.txt' into table qraat.tx_make_parameters ignore 1 lines;
load data local infile 'afsk.txt' into table qraat.afsk ignore 1 lines;
load data local infile 'target.txt' into table qraat.target ignore 1 lines;
load data local infile 'location.txt' into table qraat.location ignore 1 lines;
load data local infile 'deployment.txt' into table qraat.deployment ignore 1 lines;
load data local infile 'calibration_information.txt' into table qraat.calibration_information ignore 1 lines;
load data local infile 'gps_data.txt' into table qraat.gps_data ignore 1 lines;
load data local infile 'true_position.txt' into table qraat.true_position ignore 1 lines;
load data local infile 'steering_vectors.txt' into table qraat.steering_vectors ignore 1 lines;
load data local infile 'site.txt' into table qraat.site ignore 1 lines;
