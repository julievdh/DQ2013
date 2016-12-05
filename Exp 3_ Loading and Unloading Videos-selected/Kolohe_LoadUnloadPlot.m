% kolohe loading and unloading
% load loading data
L1 = load('tt13_287_L1_vel');
L2 = load('tt13_287_L2_vel');

% append L2 to L1
L2.track_itp(:,1) = L2.track_itp(:,1)+L1.track_itp(end,1);

% concatenate all:
L_track_itp = vertcat(L1.track_itp,L2.track_itp);
L_speed = vertcat(L1.speed,L2.speed);

% plot as test
figure(1); clf; 
subplot(122); 
plot(L_speed)
title('Speed'); xlabel('Time (sample)'); ylabel('Speed (m/s)')
subplot(121); hold on
plot(L_track_itp(:,2),L_track_itp(:,3)); hold on
title('Track'); xlabel('x (m)'); ylabel('y (m)')

%% separate into conditions and laps
% start and stop points of laps
laps = [0 19.3; 58 80.6; 171.4 196; 401.4 425; 691.6 716.8; 727 753.2];
ii = find(iswithin(L_track_itp(:,1),laps(1,:)) == 1);
C.track = L_track_itp(ii,:);
C.speed = L_speed(ii);
ii = find(iswithin(L_track_itp(:,1),laps(2,:)) == 1);
T.track = L_track_itp(ii,:);
T.speed = L_speed(ii);
ii = find(iswithin(L_track_itp(:,1),laps(3,:)) == 1);
T2.track = L_track_itp(ii,:);
T2.speed = L_speed(ii);
ii = find(iswithin(L_track_itp(:,1),laps(4,:)) == 1);
T4.track = L_track_itp(ii,:);
T4.speed = L_speed(ii);
ii = find(iswithin(L_track_itp(:,1),laps(5,:)) == 1);
T6.track = L_track_itp(ii,:);
T6.speed = L_speed(ii);
ii = find(iswithin(L_track_itp(:,1),laps(6,:)) == 1);
T8.track = L_track_itp(ii,:);
T8.speed = L_speed(ii);

% plot
plot(C.track(:,2),C.track(:,3)); plot(T.track(:,2),T.track(:,3)); 
plot(T8.track(:,2),T8.track(:,3))

figure(2); clf; hold on
plot(L_track_itp(:,1),L_track_itp(:,2))
plot(C.track(:,1),C.track(:,2))
plot(T.track(:,1),T.track(:,2))
plot(T2.track(:,1),T2.track(:,2))
plot(T4.track(:,1),T4.track(:,2))
plot(T6.track(:,1),T6.track(:,2))
plot(T8.track(:,1),T8.track(:,2))

figure(3); clf; hold on
plot(L_track_itp(:,1),L_speed); 
plot(C.track(:,1),C.speed);
plot(T.track(:,1),T.speed);
plot(T2.track(:,1),T2.speed);
plot(T4.track(:,1),T4.speed);
plot(T6.track(:,1),T6.speed);
plot(T8.track(:,1),T8.speed);