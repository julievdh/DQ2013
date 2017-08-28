% Author: Lauro Ojeda, 2014-2015
function inertial_info = integrate_boat_info_frwd(inertial_info, PERIOD, BOAT_FILE, GPS_SHIFT)
	PLOT_DETAILS = 1;
	FILL_GPS_DATA = 1;
	load(BOAT_FILE);
	KM_SEC_2_M_SEC = 0.277778;
	GPS_Speed = GPS_Speed * KM_SEC_2_M_SEC;
	GPS_PERIOD = 1/fs;

	PSI = inertial_info.euler(:,3);
	An = inertial_info.An;
	Am = sum(An(:,1:2)'.^2).^.5';
	N = length(An);

	t_gps = (1:length(GPS_Speed)) / fs + GPS_SHIFT;
	t_imu = (1:N) * PERIOD;

	Ax= An(:,1);
	Ay= An(:,2);
	A_frwd = Ax.* cos(-PSI) - Ay.* sin(-PSI);
	A_ltrl = Ax.* sin(-PSI) + Ay.* cos(-PSI);

	% Create process imput variables
	u = [A_frwd, zeros(N,1), A_ltrl, zeros(N,1)]';

	% Create measurment array cointaning the GPS data
	z = NaN(1, N);
	z(1 : floor(t_gps(1)/PERIOD)) = 0;
	z(floor(t_gps/PERIOD)) = GPS_Speed;
	z(floor(t_gps(end)/PERIOD) : end) = 0;
	z = [z ; zeros(1, N)];

	if(FILL_GPS_DATA) % Interpolate to provide more GPS measurments
		t_meas = [1 : floor(t_gps(1)/PERIOD) - 1, floor(t_gps/PERIOD), floor(t_gps(end)/PERIOD) + 1 : length(z)] ;
		z(1, :) = spline(t_meas, z(1, t_meas), (1: length(z)));
	end;

	x_hat = kf_frwd_vel(u, z, PERIOD);

	V_frwd = x_hat(1,:)';
	V_ltrl = x_hat(3,:)';
	Vm_kf = (V_frwd.^2 + V_ltrl.^2).^.5;

	A_frwd = [0; diff(V_frwd)] / PERIOD;
	A_ltrl = [0; diff(V_ltrl)] / PERIOD;
	Am_kf = [0; diff(Vm_kf)] / PERIOD;

	inertial_info.A_kf = [A_frwd, A_ltrl];
	inertial_info.V_kf = [V_frwd, V_ltrl];
	inertial_info.Am_kf = Am_kf;
	inertial_info.Vm_kf = Vm_kf;
	inertial_info.GPS_Speed = GPS_Speed;
	inertial_info.VALID_SAMPLE_SECTIONS = BE * GPS_PERIOD + GPS_SHIFT;
	inertial_info.GPS_SHIFT = GPS_SHIFT;

	if(PLOT_DETAILS)
		figure,
		plot(t_imu, Am, 'g');
		hold on;
		plot(t_gps, GPS_Speed);
		ylabel('Speed (m/sec)');
		xlabel('Time (sec)');
		
		plot(t_gps(BE(:,1)), GPS_Speed(BE(:,1)), '*k')
		plot(t_gps(BE(:,2)), GPS_Speed(BE(:,2)), '*r')

		figure,
		subplot(2,1,1);plot(t_imu, [A_frwd, An(:,1)]) 
		title('KF estiamted accel');
		ylabel('Ax (m/s^2)');
		subplot(2,1,2);plot(t_imu, [A_ltrl, An(:,2)])
		ylabel('Ay (m/s^2)');
		xlabel('Time (sec)');
		linkaxes(get(gcf,'Children'),'x');

		figure,
		plot(t_gps, GPS_Speed);
		title('KF estiamted velocity');
		hold on;
		plot(t_imu, Vm_kf, 'g');
		legend('GPS', 'KF');
		ylabel('Speed (m/sec)');
		xlabel('Time (sec)');

		figure,
		plot(t_imu, [Am, abs(Am_kf)]);
		title('KF estiamted accel magnitutde');
		legend('Org', 'KF');
		grid on;
		ylabel('A (m/s^2)');
		xlabel('Time (sec)');
	end;
