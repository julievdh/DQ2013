% Kalohe Drag Loading
path(path, './mark_algorithms/d3matlab')
path(path, './mark_algorithms/XML4MATv2')

FILTER = 1;
FILENAME = 'tt13_287e01';
DIR_NAME = 'data/WHOIS_tag/raw_data/tt13_287e01';
% BOAT_FILE  = sprintf('%s/%s_boat.mat', DIR_NAME, FILENAME);
SECTION  = round([165624, 176930]*PERIOD); % Just the tag (A)
GPS_SHIFT = 22;

[W, A, PERIOD] = getdata_dtag3(DIR_NAME, FILENAME);
[W, A] = getdata(W, A, PERIOD, SECTION);
% Compute attitude angles
inertial_results = compute_att(W, A, PERIOD, 1);
% Detect fluking cycle
inertial_results = detect_fluking_sections(inertial_results);
% Integrate boat information
inertial_results = integrate_boat_info_frwd(inertial_results, PERIOD, BOAT_FILE, GPS_SHIFT);
% Segment strokes
strokes = stroke_segmentation(inertial_results, PERIOD, FILTER);
% Plot results
plt_pitch(strokes);
DIRECTION = 'FRWD'
plt_acc(strokes, DIRECTION);
plt_vel(strokes, DIRECTION);
DIRECTION = 'LTRL'
plt_acc(strokes, DIRECTION);
plt_vel(strokes, DIRECTION);

plt_gps(inertial_results, PERIOD, GPS_SHIFT);
power = plt_power_details(strokes);
plt_work_details(power);
