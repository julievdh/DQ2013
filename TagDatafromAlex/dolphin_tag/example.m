% Author: Lauro Ojeda, 2014-2015
path(path, './mark_algorithms/d3matlab')
path(path, './mark_algorithms/XML4MATv2')

FILTER = 1;
sample_file = {'tt13_285d01'};

DIR = 'data/WHOIS_tag/raw_data/';
DIR_NAME = sprintf('%s%s', DIR, sample_file{1});
BOAT_FILE  = sprintf('%s/%s_boat.mat', DIR_NAME, sample_file{1});
SECTION  = [400, 1200];
GPS_SHIFT = 264;

[W, A, PERIOD] = getdata_dtag3(DIR_NAME, sample_file{1});
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
DIRECTION = 'FRWD';
plt_acc(strokes, DIRECTION);
plt_vel(strokes, DIRECTION);
DIRECTION = 'LTRL';
plt_acc(strokes, DIRECTION);
plt_vel(strokes, DIRECTION);

plt_gps(inertial_results, PERIOD, GPS_SHIFT);
power = plt_power_details(strokes);
plt_work_details(power);
