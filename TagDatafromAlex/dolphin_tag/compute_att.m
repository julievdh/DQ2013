% Author: Lauro Ojeda, 2005-2015
function [result] = compute_att(W,A,PERIOD,USE_KF,W_low_dynamics,A_low_dynamics)
% [result] = compute_att(W,A,PERIOD,USE_KF,W_low_dynamics,A_low_dynamics)
% 
% Computes IMU attitude
% 
% result: a structure containing results fields
% inputs: 
%   W: Angular Velocity, finite difference form (Angular Velocity (rad/sec) * PERIOD = finite integral of angular velocity over a single sample) 
%   A: Acceleration (m/s/s)
%   PERIOD: Sampling Period (seconds)
% Optional Inputs
%   W_low_dynamics: Upper Threshold for Angular Velocity (deg/sec) for detecting footfalls 
%   A_low_dynamics: Upper Threshold for (Acceleration minus Gravity) (m/s/s) for detecting footfalls 

	GRAVITY=9.80297286843;
	if(~exist('USE_KF','var') | isempty(USE_KF))
		USE_KF = 1;
	end;
	if(~exist('W_low_dynamics','var'))
		W_low_dynamics = [];
	end;
	if(~exist('A_low_dynamics','var'))
		A_low_dynamics = [];
	end;
	% Compute tilt based on accelerometer readings
	[accel_phi,accel_theta] = acc_tilt(A);
	% Determine FFs
	if(~exist('W_low_dynamics','var') | isempty(W_low_dynamics))
		W_low_dynamics = 20; % Threshold rate used to determine FFs
	end;
	if(~exist('A_low_dynamics','var') | isempty(A_low_dynamics))
		A_low_dynamics = 5; %Threshold acceleration used to determine FFs
	end;

	% Find low dynamic conditions
	Wm = (sum((W.^2)')).^.5 * 180 / pi / PERIOD;
	Am = (sum((A.^2)')).^.5 - GRAVITY;
	low_motion=find(Wm<W_low_dynamics & abs(Am)<A_low_dynamics);
	% stationary_periods is used by the tilt compensation KF 
	N = length(W);
	stationary_periods = zeros(N,1);
	stationary_periods(low_motion) = 1;

	% Initialize variables
	An = zeros(N,3);
	quaternion = zeros(N,4);
	% Initialize quaternions
	quaternion(1,:) = kf_tilt(PERIOD);
	for(i = 2:N)
		% Compute attitude using quaternion representation
		quaternion(i,:) = qua_est(W(i,:),quaternion(i-1,:));
		% Transform accelerations from body to navigation frame
		rotation_matrix = qua2rot(quaternion(i,:));
		An(i,:) = rotation_matrix*A(i,:)';
		if(USE_KF)
			% Apply KF compensation on tilt
			quaternion(i,:) = kf_tilt(PERIOD,quaternion(i,:),accel_theta(i),accel_phi(i),stationary_periods(i));
		end;
	end;

	result.A = A;
	result.An = An;
	result.quaternion = quaternion;
	result.accel_phi = accel_phi;
	result.accel_theta = accel_theta;
	
	% Plot attitude
	euler = qua2eul(quaternion);
	result.euler = euler;

	figure,
	t = (1:N)*PERIOD;
	plot(t,euler*180/pi);
	hold on;grid on;ylabel('Euler angles [deg]');xlabel('time [s]');
	legend('Roll','Pitch','Heading');
	%plot(t(FF),euler(FF,:)*180/pi,'*');
	hold off;

	figure,
	subplot(2,1,1);
	plot(t, euler(:,1)*180/pi);
	hold on;grid on;ylabel('Roll [deg]');xlabel('time [s]');
	plot(t, accel_phi*180/pi, 'g');
	hold off;
	subplot(2,1,2);
	plot(t, euler(:,2)*180/pi);
	hold on;grid on;ylabel('Pitch [deg]');xlabel('time [s]');
	plot(t, accel_theta*180/pi, 'g');
	hold off;
	linkaxes(get(gcf,'Children'),'x');
	legend('Gyro', 'Acc')
