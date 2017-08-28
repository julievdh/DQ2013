% Author: Lauro Ojeda, 2014-2015
function inertial_info = detect_fluking_sections(inertial_info, MIN_FLUKING_RATE)
	PLT_DETAILS = 1;
	START_FLUKE_PERCENTAGE  =  0.90; % Determines the first and last foot fall
	MAX_STD_TIME_DEVIATION = 2; % Maximun time standar deviation allowed
	if(~exist('MIN_FLUKING_RATE','var'))
		MIN_FLUKING_RATE = 5 * pi / 180; % minimun foot velocity while walking
	end;

	% Determine stroke cycle using the pitch (pitch) angle
	pitch = inertial_info.euler(:,2);
	% Capture the signal variations only
	[b, a] = butter(5, .01);
	pitch_filt = filtfilt(b, a, pitch);
	fluking_angle = pitch - pitch_filt;
	% Low pass filter the resultant signal, to provide some inmunity to the noise
	[b, a] = butter(5, .1);
	fluking_angle_filt = filtfilt(b, a, fluking_angle);
	[~, peaks_idx] = findpeaks(-fluking_angle_filt, 'MINPEAKDISTANCE', 60, 'MINPEAKHEIGHT',0);
	
	% All fluking cycles
	FF = peaks_idx;
	
	% Determine the most likely walking portion based on the MIN_FLUKING_RATE value 
	[aux, peaks_idx]=findpeaks(fluking_angle,'minpeakheight',MIN_FLUKING_RATE);
	FF_max_speed = zeros(size(fluking_angle))';
	FF_max_speed(peaks_idx) = 1;
	FF_max_speed = (FF_max_speed == 1);

	median_vel = median(fluking_angle(peaks_idx));
	likely_walk_sections = find(fluking_angle>median_vel*START_FLUKE_PERCENTAGE);
	footfall_index = find(FF>likely_walk_sections(1) & FF<likely_walk_sections(end));
	FF_fluking = zeros(size(fluking_angle));
	FF_fluking(FF(footfall_index(1):footfall_index(end))) = 1;
	FF_fluking = find(FF_fluking == 1);

	% Save data
	inertial_info.start_fluke = FF_fluking(1 : end - 1);
	inertial_info.finish_fluke = FF_fluking(2 : end);
	inertial_info.fluking_angle = fluking_angle;

	if(PLT_DETAILS)
		figure;
		plot(pitch * 180 / pi);
		hold on;
		plot(pitch_filt * 180 / pi,'r');
		plot(fluking_angle * 180 / pi, 'm');
		plot(fluking_angle_filt * 180 / pi, 'g');
		plot(FF, fluking_angle_filt(FF) * 180 / pi,'ok', 'MarkerEdgeColor','k', 'MarkerFaceColor', 'k', 'MarkerSize',6);
		plot(FF_fluking, fluking_angle_filt(FF_fluking) * 180 / pi,  'o', 'MarkerEdgeColor','y', 'MarkerFaceColor', 'y', 'MarkerSize', 4);
		legend('Original pitch', 'Envelope', 'Fluking only', 'Filtered fluking', 'All cycles', 'Only fluking');
	end;


