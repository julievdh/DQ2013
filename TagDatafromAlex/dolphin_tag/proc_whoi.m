% Author: Lauro Ojeda, 2014-2015
path(path, './mark_algorithms/d3matlab')
path(path, './mark_algorithms/XML4MATv2')
PROC_TYPE = 'REPORT';
FILTER = 1;

TESTS = {'tt13_284a01',  'tt13_287c01', 'tt13_285d01', 'tt13_287b01'}; NAMES = {'Nainoa A',  'Nainoa A+2', 'Lono A', 'Lono A+2'};
%TESTS = {'Reference101'};% 
%TESTS = {'tt13_287b01'}; NAMES = {'Lono A+2'};

%TESTS = {'tt13_285d01', 'tt13_287b01'};  NAMES = {'Lono A', 'Lono A+2'};


DIR = 'data/WHOIS_tag/raw_data/';
index = 1;
for(sample_file = TESTS)
	disp(sample_file{1});
	DIR_NAME = sprintf('%s%s', DIR, sample_file{1});
	FILENAME  = sprintf('%s/%s.mat', DIR_NAME, sample_file{1});
	ATT_FILE  = sprintf('%s/%s_inertial.mat', DIR_NAME, sample_file{1});
	BOAT_FILE  = sprintf('%s/%s_boat.mat', DIR_NAME, sample_file{1});
	section_data;
	switch(PROC_TYPE)
	case 'LOAD_SAVE_DATA'
		[W, A, PERIOD] = getdata_dtag3(DIR_NAME, sample_file{1});
		getdata(W, A, PERIOD);
		save(FILENAME, 'W', 'A', 'PERIOD');
	case 'SHOW_DATA'
		load(FILENAME);
		getdata(W, A, PERIOD, SECTION);
	case 'PROC_IMU'
		load(FILENAME);
		[W, A] = getdata(W, A, PERIOD, SECTION);
		inertial_results = compute_att(W, A, PERIOD, 1);
		inertial_results = detect_fluking_sections(inertial_results);
		inertial_results = integrate_boat_info_frwd(inertial_results, PERIOD, BOAT_FILE, GPS_SHIFT);
		strokes = stroke_segmentation(inertial_results, PERIOD, FILTER);
		save(ATT_FILE, 'inertial_results', 'PERIOD', 'strokes');
	case 'FIND_FLUKES'
		load(ATT_FILE);
			% Find flucking cycles
		inertial_results = detect_fluking_sections(inertial_results);
		save(ATT_FILE, 'inertial_results', 'PERIOD', 'strokes');
	case 'PROC_BOAT_DATA'
		load(ATT_FILE);
		inertial_results = integrate_boat_info_frwd(inertial_results, PERIOD, BOAT_FILE, GPS_SHIFT);
		save(ATT_FILE, 'inertial_results', 'PERIOD', 'strokes');
	case 'STROKE_ANALYSIS'
		load(ATT_FILE);
		strokes = stroke_segmentation(inertial_results, PERIOD, FILTER);
		save(ATT_FILE, 'inertial_results', 'PERIOD', 'strokes');
	case 'PLOT_RESULTS'
		DIRECTION = 'FRWD';
		load(ATT_FILE);
		%plt_acc_org(strokes);
		%plt_time(strokes, PERIOD);
		plt_freq(strokes, PERIOD); AXIS_FREQ= [0 2.5]; ylim(AXIS_FREQ);
		%plt_total_acc(strokes);
		%plt_acc(strokes, DIRECTION);
		%plt_vel(strokes, DIRECTION);
		%plt_pitch(strokes);
		plt_power_work_details(strokes, PERIOD);
	case 'SAVE_RESULTS'
		load(ATT_FILE);
		ATT_FILE  = sprintf('./%s_inertial.mat', sample_file{1});
		save(ATT_FILE, 'inertial_results', 'PERIOD', 'strokes');
	case 'REPORT'
		AXIS_ACC = [-11 11];
		AXIS_VEL = [-2.5 6.5];
		AXIS_GPS = [0 7];
		AXIS_PITCH = [-15 15];
		AXIS_TIME= [0 1.1];
		AXIS_FREQ= [0 2.5];
		AXIS_WORK = [-200 200];
		AXIS_POWER = [-40 40];
		load(ATT_FILE);
		plt_pitch(strokes);
		ylim(AXIS_PITCH);
		save_results(sample_file{1}, 'Pitch');
		DIRECTION = 'FRWD';
		plt_acc(strokes, DIRECTION);
		ylim(AXIS_ACC);
		save_results(sample_file{1}, 'AccFrwd');
		plt_vel(strokes, DIRECTION);
		ylim(AXIS_VEL);
		save_results(sample_file{1}, 'VelFrwd');
		DIRECTION = 'LTRL';
		plt_acc(strokes, DIRECTION);
		ylim(AXIS_ACC);
		save_results(sample_file{1}, 'Acctrl');
		plt_vel(strokes, DIRECTION);
		ylim(AXIS_VEL);
		save_results(sample_file{1}, 'VelLtrl');
		plt_gps(inertial_results, PERIOD, GPS_SHIFT);
		ylim(AXIS_GPS);
		save_results(sample_file{1}, 'VelGps');
		plt_time(strokes, PERIOD);
		ylim(AXIS_TIME);
		save_results(sample_file{1}, 'Time');
		plt_freq(strokes, PERIOD);
		ylim(AXIS_FREQ);
		save_results(sample_file{1}, 'Freq');
		power = plt_power_details(strokes);
		ylim(AXIS_POWER);
		save_results(sample_file{1}, 'Power');
		[result(index).trust result(index).drag] = plt_work_details(strokes, power, PERIOD);
		ylim(AXIS_WORK);
		save_results(sample_file{1}, 'Work');
	end;
	title(NAMES{index});
	index = index + 1;
end;

% Compute statistics
if(strcmp(PROC_TYPE, 'REPORT') & length(TESTS) == 4)
	disp('T-Test results')
	LONO = 3;
	LONO_2 = 4;
	N = min([length(result(LONO).trust), length(result(LONO_2).trust)]);
	control = [result(LONO).trust(1 : N); -result(LONO).drag(1 : N)];
	loaded = [result(LONO_2).trust(1 : N); -result(LONO_2).drag(1 : N)];
	[h_lono, p_lono] = ttest(control, loaded);
	disp('Lono');
	disp(sprintf('H = %f, P = %f',[h_lono, p_lono]));
	NAINOA = 1;
	NAINOA_2 = 2;
	N = min([length(result(NAINOA).trust), length(result(NAINOA_2).trust)]);
	control = [result(NAINOA).trust(1 : N); -result(NAINOA).drag(1 : N)];
	loaded = [result(NAINOA_2).trust(1 : N); -result(NAINOA_2).drag(1 : N)];
	[h_nainoa, p_nainoa] = ttest(control, loaded);
	disp('Nainoa');
	disp(sprintf('H = %f, P = %f',[h_nainoa, p_nainoa]));
end;

