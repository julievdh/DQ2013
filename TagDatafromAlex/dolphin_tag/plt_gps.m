% Author: Lauro Ojeda, 2002-2015
function plt_gps(inertial_info, PERIOD, GPS_SHIFT)
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
	MEAN_WIDTH = 4;
	PLOT_DETAILS = 0;
	PERIOD_GPS = 1/10;
% 	EXTRA_TIME = 100;
    EXTRA_TIME = 10;
	LABEL_NAMES_SIZE = 12;

	V_gps = 	inertial_info.GPS_Speed;
	N_gps = length(V_gps);
	t_gps = (1:N_gps) * PERIOD_GPS + EXTRA_TIME;

	start_plot  = GPS_SHIFT - EXTRA_TIME;
	end_plot = GPS_SHIFT + length(V_gps) * PERIOD_GPS + EXTRA_TIME;
	V_imu = 	inertial_info.Vm_kf(floor(start_plot / PERIOD) : floor(end_plot / PERIOD));
	N_imu = length(V_imu);
	t_imu = (1:N_imu) * PERIOD;

	figure;
	plot(t_imu, V_imu, 'Color',SIGNAL_COLOR)
	hold on;
	plot(t_gps, V_gps,'--k', 'Color','k', 'LineWidth', MEAN_WIDTH/2)
	xlim([0 t_imu(end)]);
	
	ylabel('Speed (m/sec)' ,  'FontName' ,'Helvetica','FontSize', LABEL_NAMES_SIZE);
	xlabel('Time (sec)',  'FontName' ,'Helvetica','FontSize', LABEL_NAMES_SIZE);
	legend('IMU + KF', 'GPS');
