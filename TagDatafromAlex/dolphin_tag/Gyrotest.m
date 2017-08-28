% path(path, './mark_algorithms/d3matlab')
% path(path, './mark_algorithms/XML4MATv2')

FILTER = 1;
sample_file = {'gyrotest012'};

DIR = 'data/WHOIS_tag/raw_data/';
DIR_NAME = sprintf('%s%s', DIR, sample_file{1});
BOAT_FILE  = sprintf('%s/%s_boat.mat', DIR_NAME, sample_file{1});

SECTION  = [];
% SECTION  = [];
GPS_SHIFT = 0;

[W, A, PERIOD] = getdata_dtag3(DIR_NAME, sample_file{1});
[W, A] = getdata(W, A, PERIOD, SECTION);
% Compute attitude angles
inertial_results = compute_att(W, A, PERIOD, 1);
% Detect fluking cycle
inertial_results = detect_fluking_sections(inertial_results);
% Integrate boat information
inertial_results = integrate_boat_info_frwd(inertial_results, PERIOD, BOAT_FILE, GPS_SHIFT);
