% Author: Lauro Ojeda, 2014-2015
function [strokes] = filter_strokes(inertial_info, strokes)
	PLOT_DETAILS = 1;
	% Filter out steps that are not within known specifications
	MAX_VAR = 3; % ELiminates outliers based on the variance from the mean value
	MAX_VAR_TIME = 3; % ELiminates TIME outliers based on the variance from the median value

	outlier = [];
	flukes = length(strokes.samples);

	% Check abnormal times
	fluke_duration=  strokes.time_finish - strokes.time_start;
	mean_fluke_duration = mean(fluke_duration);
	std_fluke_duration = std(fluke_duration);
	outlier_time = find(abs(fluke_duration - mean_fluke_duration) > std_fluke_duration * MAX_VAR_TIME);
	disp(sprintf('Eliminated %d out of %d because they had outlier time',  length(outlier_time), flukes));
	outlier = union(outlier, outlier_time);

	% The condition is that the maximun fluck angle has to be larger than the difference in the pitch (start - finish)
	max_oscillation = max(strokes.fluking_angle_norm) - mean([strokes.fluking_angle_norm(1, :) ; strokes.fluking_angle_norm(end , :)]);
	start_finish_diff = abs(inertial_info.euler(strokes.time_start, 2) - inertial_info.euler(strokes.time_finish, 2))';
	outlier_fluke_shape = find(max_oscillation < start_finish_diff);
	disp(sprintf('Eliminated %d out of %d because they had abnormal shape',  length(outlier_fluke_shape), length(max_oscillation)));
	outlier = union(outlier, outlier_fluke_shape);
	
	% Eliminate flucking that occurs while changing pitch angle
	mean_max_oscillation = mean(max_oscillation);
	std_max_oscillation = std(max_oscillation);
	outlier_pitch = find(abs(max_oscillation - mean_max_oscillation) > std_max_oscillation* MAX_VAR);
	disp(sprintf('Eliminated %d out of %d because they had outlier pitch angle',  length(outlier_pitch), flukes));
	outlier = union(outlier, outlier_pitch);

	max_vel = max(strokes.V_frwd);
	mean_vel = mean(max_vel);
	std_vel = std(max_vel);
	outlier_vel = find(abs(max_vel - mean_vel) > std_vel* MAX_VAR);
	disp(sprintf('Eliminated %d out of %d because they had outlier forward velocity',  length(outlier_vel), flukes));
	outlier = union(outlier, outlier_vel);

	max_vel_ltrl = max(strokes.V_ltrl);
	mean_vel_ltrl = mean(max_vel_ltrl);
	std_vel_ltrl = std(max_vel_ltrl);
	outlier_vel_ltrl = find(abs(max_vel_ltrl - mean_vel_ltrl) > std_vel_ltrl* MAX_VAR);
	disp(sprintf('Eliminated %d out of %d because they had outlier lateral velocity',  length(outlier_vel_ltrl), flukes));
	outlier = union(outlier, outlier_vel_ltrl);

	max_accel = max(strokes.A_frwd);
	mean_accel = mean(max_accel);
	std_accel = std(max_accel);
	outlier_accel = find(abs(max_accel - mean_accel) > std_accel* MAX_VAR);
	disp(sprintf('Eliminated %d out of %d because they had oulier forward acc',  length(outlier_accel), flukes));
	outlier = union(outlier, outlier_accel);

	max_accel_ltrl = max(strokes.A_ltrl);
	mean_accel_ltrl = mean(max_accel_ltrl);
	std_accel_ltrl = std(max_accel_ltrl);
	outlier_accel_ltrl = find(abs(max_accel_ltrl - mean_accel_ltrl) > std_accel_ltrl* MAX_VAR);
	disp(sprintf('Eliminated %d out of %d because they had oulier lateral acc',  length(outlier_accel_ltrl), flukes));
	outlier = union(outlier, outlier_accel_ltrl);

	time = strokes.time_start; % save it for plotting purposes
	if(~isempty(outlier))
		strokes.Am(:,outlier) = [];
		strokes.A_frwd(:,outlier) = [];
		strokes.A_ltrl(:,outlier) = [];
		strokes.V_frwd(:,outlier) = [];
		strokes.V_ltrl(:,outlier) = [];
		strokes.pitch(:,outlier) = [];
		strokes.pitch_norm(:,outlier) = [];
		strokes.fluking_angle(:,outlier) = [];
		strokes.fluking_angle_norm(:,outlier) = [];
		strokes.roll_norm(:, outlier) = [];
		strokes.samples(outlier) = [];
		strokes.time_start(outlier) = [];
		strokes.time_finish(outlier) = [];
		disp(sprintf('Total eliminated by filtering %d out of %d', length(outlier), flukes));
	end;

	if(PLOT_DETAILS)
		pitch = inertial_info.fluking_angle * 180 / pi;
		figure;
		hold on;
		plot(inertial_info.euler(:, 2)  * 180 / pi);
		plot(pitch, 'k');
		plot(time, pitch(time),'o', 'MarkerEdgeColor','g', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
		plot(time(outlier_fluke_shape), pitch(time(outlier_fluke_shape)),'o', 'MarkerEdgeColor','r', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
		plot(time(outlier_pitch), pitch(time(outlier_pitch)),'o', 'MarkerEdgeColor','m', 'MarkerFaceColor', 'm', 'MarkerSize', 7);
		plot(time(outlier_time), pitch(time(outlier_time)),'o', 'MarkerEdgeColor','y', 'MarkerFaceColor', 'y', 'MarkerSize', 4);
		grid on;ylabel('Pitch (deg/s)');xlabel('Sample #');
		legend('Pitch angle', 'Fluking', 'Fluking cycles', 'Invalid shape', 'Oulier pitch', 'Oulier time'); 
		
		vel = inertial_info.V_kf(:,1);
		figure;
		hold on;
		plot(vel);
		plot(time, vel(time),'o', 'MarkerEdgeColor','g', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
		plot(time(outlier_vel), vel(time(outlier_vel)),'o', 'MarkerEdgeColor','r', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
		grid on;ylabel('Velocity Forward (m/s)');xlabel('Sample #');
		legend('Forward Velocity', 'Oulier velocity', 'Eliminated' ); 

		vel = inertial_info.V_kf(:,2);
		figure;
		hold on;
		plot(vel);
		plot(time, vel(time),'o', 'MarkerEdgeColor','g', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
		plot(time(outlier_vel_ltrl), vel(time(outlier_vel_ltrl)),'o', 'MarkerEdgeColor','r', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
		grid on;ylabel('Velocity Lateral (m/s)');xlabel('Sample #');
		legend('Lateral Velocity', 'Oulier velocity', 'Eliminated' );
		
		accel = inertial_info.A_kf(:,1);
		figure;
		hold on;
		plot(accel);
		plot(time, accel(time),'o', 'MarkerEdgeColor','g', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
		plot(time(outlier_accel), accel(time(outlier_accel)),'o', 'MarkerEdgeColor','r', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
		grid on;ylabel('Accel Forward (m/s)');xlabel('Sample #');
		legend('Accel', 'Oulier accel', 'Eliminated' ); 

			
		accel = inertial_info.A_kf(:,2);
		figure;
		hold on;
		plot(accel);
		plot(time, accel(time),'o', 'MarkerEdgeColor','g', 'MarkerFaceColor', 'g', 'MarkerSize', 10);
		plot(time(outlier_accel_ltrl), accel(time(outlier_accel_ltrl)),'o', 'MarkerEdgeColor','r', 'MarkerFaceColor', 'r', 'MarkerSize', 7);
		grid on;ylabel('Accel Lateral (m/s)');xlabel('Sample #');
		legend('Accel', 'Oulier accel', 'Eliminated' );
	end;
