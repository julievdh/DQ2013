% Plot fomarting constants
AXIS_ACC = [-11 11];
AXIS_VEL = [-2.5 6.5];
AXIS_GPS = [0 7];
AXIS_PITCH = [-15 15];
AXIS_WORK = [-525 525];
AXIS_POWER = [-40 40];

% File and subject names
NAMES = {'Nainoa A',  'Nainoa A+2', 'Lono A', 'Lono A+2'};
TESTS = {'tt13_284a01',  'tt13_287c01','tt13_285d01', 'tt13_287b01'};

% Show results
for(index= 1:length(TESTS))
	sample_file = TESTS{index};
	disp([NAMES{index},': ',sample_file]);
	ATT_FILE  = sprintf('./%s_inertial.mat', sample_file);
	load(ATT_FILE);
	plt_pitch(strokes);
	title(NAMES{index});
	ylim(AXIS_PITCH);
	DIRECTION = 'FRWD';
	plt_acc(strokes, DIRECTION);
	title(NAMES{index});
	ylim(AXIS_ACC);
	plt_vel(strokes, DIRECTION);
	title(NAMES{index});
	ylim(AXIS_VEL);
	DIRECTION = 'LTRL';
	plt_acc(strokes, DIRECTION);
	title(NAMES{index});
	ylim(AXIS_ACC);
	plt_vel(strokes, DIRECTION);
	title(NAMES{index});
	ylim(AXIS_VEL);
	plt_gps(inertial_results, PERIOD, inertial_results.GPS_SHIFT);
	title(NAMES{index});
	ylim(AXIS_GPS);
	power = plt_power_details(strokes);
	title(NAMES{index});
	ylim(AXIS_POWER);
	[result(index).trust result(index).drag] = plt_work_details(power);
	title(NAMES{index});
	ylim(AXIS_WORK);
	title(NAMES{index});
	index = index + 1;
end;

% Compare results
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


