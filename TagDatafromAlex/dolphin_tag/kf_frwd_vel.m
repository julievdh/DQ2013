% Author: Lauro Ojeda, 2014-2015
function [x_hat] = kf_frwd_vel(u, z, PERIOD)
% see /home/lojeda/Software/ns/navsol/study/kalman/acc_bias/acc_bias_xy_vel.m
% Lauro Ojeda
% Direct KF for accelerometer bias estimation, two axis.
% The measurment is the position
ENABLE_KALMAN=1;
T = PERIOD;
AX_NOISE=.01; % Acceleration error
AeX_NOISE=.001; % Drift error
AY_NOISE=.01; 
AeY_NOISE=.001;
MEAS_FRWD_NOISE= .01; % 0.1 GPS error
MEAS_LTRL_NOISE= .005; % Deviation from zero

Rp= diag([MEAS_FRWD_NOISE^2, MEAS_LTRL_NOISE^2]);

% STATE VARIABLES 
% x1 = Vx 
% x2 = Aex
% x3 = Vy
% x4 = Aey 

PHI=[1,T,0,0; 0,1,0,0; 0,0,1,T; 0,0,0,1];
GAMMA=[T,T^2/2,0,0; 0,T,0,0; 0,0,T,T^2/2; 0,0,0,T];
H = [1,0,0,0;
		 0,0,1,0];

%Q=[AX_NOISE^2,0,0,0;0,AeX_NOISE^2,0,0;0,0,AY_NOISE^2,0;0,0,0,AeY_NOISE^2];
Q=diag([AX_NOISE^2,AeX_NOISE^2,AY_NOISE^2,AeY_NOISE^2]);
Qd=GAMMA*Q*GAMMA';

% x(k+1) = PHI x(k) + GAMMA u(k) + w(k)
% y(k+1) = H x(k) (System Output)
% z(k+1) = y(k+1) + v(k) (Measurement Output)
% z(k+1) = H x(k) + v(k) (Measurement Output)

N=size(PHI,1); %State order
n=length(u);
x_hat=zeros(N,n);
Pn=zeros(N,n);

P=diag(diag(Qd));
I=eye(N);

for(i=2:n)
	% Ground truth
	x_hat(:,i)=PHI*x_hat(:,i-1)+GAMMA*u(:,i);

	P = PHI*P*PHI'+Qd;
	if(ENABLE_KALMAN & ~isnan(z(:,i)))
		x1=x_hat(1,i); x3=x_hat(3,i);
		%Compute Kalman gain
		K=P*H'/(H*P*H'+Rp);
		% Make the optimal estimate
		x_hat(:,i)=x_hat(:,i)+K*(z(:,i)-H*x_hat(:,i));
		%xm(:,i)=x_hat(:,i);
		%Compute the covariance for the new state estimate
		P = (I-K*H)*P*(I-K*H)' + K*Rp*K';	
	end;
	Pn(:,i)=diag(P);
end;

t = (1:n)*T;

% Make plots
figure,
subplot(2,1,1);plot(t,[x_hat(1,:)]);
grid on; ylabel('Velocity [m/sec]'); 
legend('X-axis');
subplot(2,1,2);plot(t,[x_hat(2,:)]);
grid on; ylabel('Accel Error [m/sec^2]'); 
xlabel('time [sec]');

figure,
subplot(2,1,1);plot(t,[x_hat(3,:)]);
grid on; ylabel('Velocity [m/sec]'); 
legend('Y-axis');
subplot(2,1,2);plot(t,[x_hat(4,:)]);
grid on; ylabel('Accel Error [m/sec^2]'); 
xlabel('time [sec]');

figure,
plot(t,(x_hat(1,:).^2 + x_hat(3,:).^2).^.5);
grid on; ylabel('Velocity [m/sec]'); hold on;
plot(t, z, 'g');
legend('KF', 'Measurenment');

return;
figure;
var=Pn(1,:).^.5; plot(t,[-var;var],'--r');
legend('Expected error');
grid on; ylabel('Velocity [m/sec]'); hold on;
var=Pn(3,:).^.5; plot(t,[-var;var],'--k');
xlabel('time [sec]');


