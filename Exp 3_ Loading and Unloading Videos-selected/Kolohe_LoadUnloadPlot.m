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
C = L_track_itp(ii,:);
ii = find(iswithin(L_track_itp(:,1),laps(2,:)) == 1);
T = L_track_itp(ii,:);
ii = find(iswithin(L_track_itp(:,1),laps(3,:)) == 1);
T2 = L_track_itp(ii,:);
ii = find(iswithin(L_track_itp(:,1),laps(4,:)) == 1);
T4 = L_track_itp(ii,:);
ii = find(iswithin(L_track_itp(:,1),laps(5,:)) == 1);
T6 = L_track_itp(ii,:);
ii = find(iswithin(L_track_itp(:,1),laps(6,:)) == 1);
T8 = L_track_itp(ii,:);

% plot
plot(C(:,2),C(:,3)); plot(T(:,2),T(:,3)); plot(T8(:,2),T8(:,3))

figure(2); clf; hold on
plot(L_track_itp(:,1),L_track_itp(:,2))
plot(C(:,1),C(:,2))
plot(T(:,1),T(:,2))
plot(T2(:,1),T2(:,2))
plot(T4(:,1),T4(:,2))
plot(T6(:,1),T6(:,2))
plot(T8(:,1),T8(:,2))