% kolohe loading and unloading
clear all

% load unloading data
U = load('tt13_287_U_vel');

% plot
figure(10); clf; 
subplot(121); hold on
plot(U.track_itp(:,2),U.track_itp(:,3)); hold on
title('Track'); xlabel('x (m)'); ylabel('y (m)')
subplot(122); hold on
plot(U.track_itp(:,1),U.speed)
title('Speed'); xlabel('Time (sample)'); ylabel('Speed (m/s)')

%% separate into conditions and laps
% start and stop points of laps
Ulaps = [0 63; 180 207; 308 329; 390 411; 513 534; 571 587];
% 1 = Tag+8; 2 = Tag+6; 3 = Tag+4; 4 = Tag+2; 5 = Tag; 6 = Control;  

ii = find(iswithin(U.track_itp(:,1),Ulaps(1,:)) == 1);
T8.Utrack = U.track_itp(ii,:);
T8.Uspeed = U.speed(ii);
ii = find(iswithin(U.track_itp(:,1),Ulaps(2,:)) == 1);
T6.Utrack = U.track_itp(ii,:);
T6.Uspeed = U.speed(ii);
ii = find(iswithin(U.track_itp(:,1),Ulaps(3,:)) == 1);
T4.Utrack = U.track_itp(ii,:);
T4.Uspeed = U.speed(ii);
ii = find(iswithin(U.track_itp(:,1),Ulaps(4,:)) == 1);
T2.Utrack = U.track_itp(ii,:);
T2.Uspeed = U.speed(ii);
ii = find(iswithin(U.track_itp(:,1),Ulaps(5,:)) == 1);
T.Utrack = U.track_itp(ii,:);
T.Uspeed = U.speed(ii);
ii = find(iswithin(U.track_itp(:,1),Ulaps(6,:)) == 1);
C.Utrack = U.track_itp(ii,:);
C.Uspeed = U.speed(ii);

% plot to check
plot(T8.Utrack(:,1),T8.Uspeed); plot(C.Utrack(:,1),C.Uspeed); 

%% load loading data
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
Llaps = [0 19.3; 58 80.6; 171.4 196; 401.4 425; 691.6 716.8; 727 753.2];
ii = find(iswithin(L_track_itp(:,1),Llaps(1,:)) == 1);
C.Ltrack = L_track_itp(ii,:);
C.Lspeed = L_speed(ii);
ii = find(iswithin(L_track_itp(:,1),Llaps(2,:)) == 1);
T.Ltrack = L_track_itp(ii,:);
T.Lspeed = L_speed(ii);
ii = find(iswithin(L_track_itp(:,1),Llaps(3,:)) == 1);
T2.Ltrack = L_track_itp(ii,:);
T2.Lspeed = L_speed(ii);
ii = find(iswithin(L_track_itp(:,1),Llaps(4,:)) == 1);
T4.Ltrack = L_track_itp(ii,:);
T4.Lspeed = L_speed(ii);
ii = find(iswithin(L_track_itp(:,1),Llaps(5,:)) == 1);
T6.Ltrack = L_track_itp(ii,:);
T6.Lspeed = L_speed(ii);
ii = find(iswithin(L_track_itp(:,1),Llaps(6,:)) == 1);
T8.Ltrack = L_track_itp(ii,:);
T8.Lspeed = L_speed(ii);

% plot
plot(C.Ltrack(:,2),C.Ltrack(:,3)); plot(T.Ltrack(:,2),T.Ltrack(:,3)); 
plot(T8.Ltrack(:,2),T8.Ltrack(:,3))

figure(2); clf; hold on
plot(L_track_itp(:,1),L_track_itp(:,2))
plot(C.Ltrack(:,1),C.Ltrack(:,2))
plot(T.Ltrack(:,1),T.Ltrack(:,2))
plot(T2.Ltrack(:,1),T2.Ltrack(:,2))
plot(T4.Ltrack(:,1),T4.Ltrack(:,2))
plot(T6.Ltrack(:,1),T6.Ltrack(:,2))
plot(T8.Ltrack(:,1),T8.Ltrack(:,2))

figure(3); clf; hold on
plot(L_track_itp(:,1),L_speed); 
plot(C.Ltrack(:,1),C.Lspeed);
plot(T.Ltrack(:,1),T.Lspeed);
plot(T2.Ltrack(:,1),T2.Lspeed);
plot(T4.Ltrack(:,1),T4.Lspeed);
plot(T6.Ltrack(:,1),T6.Lspeed);
plot(T8.Ltrack(:,1),T8.Lspeed);



%% plot speed 
figure(4); clf; hold on

errorbar(-8,mean(T8.Uspeed),std(T8.Uspeed),'o')


errorbar(0,mean(C.Lspeed),std(C.Lspeed),'o')
errorbar(1,mean(T.Lspeed),std(T.Lspeed),'o')
errorbar(2,mean(T2.Lspeed),std(T2.Lspeed),'o')
errorbar(4,mean(T4.Lspeed),std(T4.Lspeed),'o')
errorbar(6,mean(T6.Lspeed),std(T6.Lspeed),'o')
errorbar(8,mean(T8.Lspeed),std(T8.Lspeed),'o')
