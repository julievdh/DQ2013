% Author: Lauro Ojeda, 2014-2015
function [strokes] = get_strokes(inertial_info, PERIOD, FILTER, OUTLIER_SECTION)
	PLOT_DETAILS = 0;
	NORM = 100;
	fluke_start = inertial_info.start_fluke(:);
	fluke_end = inertial_info.finish_fluke(:);

	number_of_steps = length(fluke_start);
	longest_step = max(fluke_end - fluke_start) + 1;

	Vm_kf = inertial_info.Vm_kf;
	euler = inertial_info.euler;
	fluking_angle_full = inertial_info.fluking_angle;
	PSI = inertial_info.euler(:,3);

	Am_org = ((sum(inertial_info.A'.^2)).^.5)';
	%Am_org = ((sum(inertial_info.An'.^2)).^.5)';
	A_frwd_org = inertial_info.A_kf(:,1);
	A_ltrl_org = inertial_info.A_kf(:,2);

	V_frwd_org = inertial_info.V_kf(:,1);
	V_ltrl_org = inertial_info.V_kf(:,2);

	% Create matrices to store strokess
	Am = zeros(number_of_steps, NORM);
	A_frwd = zeros(number_of_steps, NORM);
	A_ltrl = zeros(number_of_steps, NORM);
	V_frwd = zeros(number_of_steps, NORM);
	V_ltrl = zeros(number_of_steps, NORM);
	pitch = zeros(number_of_steps, longest_step);
	pitch_norm= zeros(number_of_steps, NORM);
	fluking_angle = zeros(number_of_steps, longest_step);
	fluking_angle_norm= zeros(number_of_steps, NORM);
	roll_norm = zeros(number_of_steps, NORM);
	samples = zeros(number_of_steps, 1);
	time_start = zeros(number_of_steps, 1);
	time_finish = zeros(number_of_steps, 1);

	index_norm = (1 : NORM);
	% This loop goes backwards to avoid issues with indexes
	for(ii = number_of_steps:-1:1)
		index = (fluke_start(ii) : fluke_end(ii));
		N = length(index);
		index_org  = (1 : N)/ N * NORM; 
		
		time_start(ii) = fluke_start(ii);
		time_finish(ii) = fluke_end(ii);
		samples(ii) = length(index);
		% Acceleration	
		Am(ii, :) = spline(index_org, Am_org(index), index_norm);
		% Acceleration	
		A_frwd(ii, :) = spline(index_org, A_frwd_org(index), index_norm);
		A_ltrl(ii, :) = spline(index_org, A_ltrl_org(index), index_norm);
		% Speed
		V_frwd(ii, :) = spline(index_org, V_frwd_org(index), index_norm);
		V_ltrl(ii, :) = spline(index_org, V_ltrl_org(index), index_norm);
		% Pitch angle
		pitch_section = euler(index, 2);
		pitch(ii, 1 : N) = pitch_section;
		pitch(ii, N + 1 : end) = pitch_section(end);
		pitch_norm(ii, :) =  spline(index_org, pitch_section, index_norm);
		% Offseted pitch	
		fluking_angle_section = fluking_angle_full(fluke_start(ii):fluke_end(ii));
		fluking_angle(ii, 1: N) = fluking_angle_section;
		fluking_angle_norm(ii, :) =  spline(index_org, fluking_angle_section, index_norm);
		% Roll
		roll_section = euler(index, 1);
		roll_norm(ii, :) =  spline(index_org, roll_section, index_norm);
	end;
	% Compute first order statistics and assemble strokes structure
	strokes.Am = Am'; 
	strokes.A_frwd = A_frwd'; 
	strokes.A_ltrl = A_ltrl'; 
	strokes.V_frwd = V_frwd'; 
	strokes.V_ltrl = V_ltrl'; 
	strokes.pitch = pitch';
	strokes.pitch_norm = pitch_norm';
	strokes.fluking_angle = fluking_angle'; 
	strokes.fluking_angle_norm = fluking_angle_norm'; 
	strokes.roll_norm = roll_norm';
	strokes.samples = samples'; 
	strokes.time_start = time_start';
	strokes.time_finish = time_finish';

	if(FILTER)
		[strokes] = filter_strokes(inertial_info, strokes);
	end;
	
	% Eliminate oulier sections, in most cases this should be done after the filter
	flukes = length(strokes.time_start);
	for(ii = flukes :-1:1)
		if(sum(time_start(ii) == OUTLIER_SECTION) | sum( time_finish(ii) == OUTLIER_SECTION))
		try
			strokes.Am(:,ii) = [];
			strokes.A_frwd(:,ii) = [];
			strokes.A_ltrl(:,ii) = [];
			strokes.V_frwd(:,ii) = [];
			strokes.V_ltrl(:,ii) = [];
			strokes.pitch(:,ii) = [];
			strokes.pitch_norm(:,ii) = [];
			strokes.fluking_angle(:,ii) = [];
			strokes.fluking_angle_norm(:,ii) = [];
			strokes.roll_norm(:,ii) = [];
			strokes.samples(ii) = [];
			strokes.time_start(ii) = [];
			strokes.time_finish(ii) = [];
		catch
			keyboard;
		end;
		end;
	end;

	disp(sprintf('Eliminated %d out of %d because they were labeled as ouliers',  flukes- length(strokes.time_start), flukes));

	if(PLOT_DETAILS)
		figure, 
		plot(euler(:, 2) * 180 / pi);
		hold on;
		plot(fluke_start, euler(fluke_start, 2) * 180 / pi, 'og');
		plot(fluke_end, euler(fluke_end, 2) * 180 / pi, '*r');
		legend('Pitch Angle', 'Start Fluke', 'End Fluke');
		hold off;
	end;
