% kolohe loading and unloading
clear all; close all; warning off

% load unloading data
U = load('tt13_288_U_vel');

% plot
figure(10); clf; 
subplot(121); hold on
plot(U.track_itp(:,2),U.track_itp(:,3)); hold on
title('Track'); xlabel('x (m)'); ylabel('y (m)')
subplot(122); hold on
plot(U.track_itp(:,1),U.speed,'k')
title('Speed'); xlabel('Time (sample)'); ylabel('Speed (m/s)')

%% separate into conditions and laps
% start and stop points of laps
Ulaps = [52 78; 142 170; 290 313; 428 450; 545 564; 599 615];
% 1 = Tag+8; 2 = Tag+6; 3 = Tag+4; 4 = Tag+2; 5 = Tag; 6 = Control;  

ii = find(iswithin(U.track_itp(:,1),Ulaps(1,:)) == 1);
T8.Utrack = U.track_itp(ii,:);
T8.Uspeed = U.speed(ii); T8.Uspeed(T8.Uspeed <= 0) = NaN;
ii = find(iswithin(U.surf_arr(:,1),Ulaps(1,:)) == 1); % get surfacing positions within that lap
% plot(U.surf_arr(ii,2),U.surf_arr(ii,3)) 
T8.Usurf_arr = U.surf_arr(ii,:);

ii = find(iswithin(U.track_itp(:,1),Ulaps(2,:)) == 1);
T6.Utrack = U.track_itp(ii,:);
T6.Uspeed = U.speed(ii); T6.Uspeed(T6.Uspeed <= 0) = NaN;
ii = find(iswithin(U.surf_arr(:,1),Ulaps(2,:)) == 1); % get surfacing positions within that lap
% plot(U.surf_arr(ii,2),U.surf_arr(ii,3)) 
T6.Usurf_arr = U.surf_arr(ii,:);

ii = find(iswithin(U.track_itp(:,1),Ulaps(3,:)) == 1);
T4.Utrack = U.track_itp(ii,:);
T4.Uspeed = U.speed(ii); T4.Uspeed(T4.Uspeed <= 0) = NaN;
ii = find(iswithin(U.surf_arr(:,1),Ulaps(3,:)) == 1); % get surfacing positions within that lap
% plot(U.surf_arr(ii,2),U.surf_arr(ii,3)) 
T4.Usurf_arr = U.surf_arr(ii,:);

ii = find(iswithin(U.track_itp(:,1),Ulaps(4,:)) == 1);
T2.Utrack = U.track_itp(ii,:);
T2.Uspeed = U.speed(ii); T2.Uspeed(T2.Uspeed <= 0) = NaN;
ii = find(iswithin(U.surf_arr(:,1),Ulaps(4,:)) == 1); % get surfacing positions within that lap
% plot(U.surf_arr(ii,2),U.surf_arr(ii,3)) 
T2.Usurf_arr = U.surf_arr(ii,:);

ii = find(iswithin(U.track_itp(:,1),Ulaps(5,:)) == 1);
T.Utrack = U.track_itp(ii,:);
T.Uspeed = U.speed(ii); T.Uspeed(T.Uspeed <= 0) = NaN;
ii = find(iswithin(U.surf_arr(:,1),Ulaps(5,:)) == 1); % get surfacing positions within that lap
% plot(U.surf_arr(ii,2),U.surf_arr(ii,3)) 
T.Usurf_arr = U.surf_arr(ii,:);

ii = find(iswithin(U.track_itp(:,1),Ulaps(6,:)) == 1);
C.Utrack = U.track_itp(ii,:);
C.Uspeed = U.speed(ii); C.Uspeed(C.Uspeed <= 0) = NaN;
ii = find(iswithin(U.surf_arr(:,1),Ulaps(6,:)) == 1); % get surfacing positions within that lap
% plot(U.surf_arr(ii,2),U.surf_arr(ii,3)) 
C.Usurf_arr = U.surf_arr(ii,:);

% plot to check
plot(T8.Utrack(:,1),T8.Uspeed,'Color',[228/255 26/255 28/255])
plot(T6.Utrack(:,1),T6.Uspeed,'Color',[152/255 78/255 163/255])
plot(T4.Utrack(:,1),T4.Uspeed,'Color',[77/255 175/255 74/255])
plot(T2.Utrack(:,1),T2.Uspeed,'Color',[255/255 127/255 0/255])
plot(T.Utrack(:,1),T.Uspeed,'Color',[55/255 126/255 184/255])
plot(C.Utrack(:,1),C.Uspeed,'k'); 

%% load loading data
L1 = load('tt13_288_L1_vel');
L2 = load('tt13_288_L2_vel');

% append L2 to L1
L2.track_itp(:,1) = L2.track_itp(:,1)+L1.track_itp(end,1);
L2.surf_arr(:,1) = L2.surf_arr(:,1)+L1.surf_arr(end,1);

% concatenate all:
L_track_itp = vertcat(L1.track_itp,L2.track_itp);
L_speed = vertcat(L1.speed,L2.speed);
L_surf_arr = vertcat(L1.surf_arr,L2.surf_arr); 

% plot as test
figure(1); clf; 
subplot(122); 
plot(L_track_itp(:,1),L_speed)
title('Speed'); xlabel('Time (sample)'); ylabel('Speed (m/s)')
subplot(121); hold on
plot(L_track_itp(:,2),L_track_itp(:,3)); hold on
title('Track'); xlabel('x (m)'); ylabel('y (m)')

%% separate into conditions and laps
% start and stop points of laps
Llaps = [3 23; 94 117; 246 269; 269.5 294; 559 584; 835 866];
ii = find(iswithin(L_track_itp(:,1),Llaps(1,:)) == 1);
C.Ltrack = L_track_itp(ii,:);
C.Lspeed = L_speed(ii); C.Lspeed(C.Lspeed <= 0) = NaN;
ii = find(iswithin(L_surf_arr(:,1),Llaps(1,:)) == 1); % get surfacing positions within that lap
% plot(L_surf_arr(ii,2),L_surf_arr(ii,3)) 
C.Lsurf_arr = L_surf_arr(ii,:);


ii = find(iswithin(L_track_itp(:,1),Llaps(2,:)) == 1);
T.Ltrack = L_track_itp(ii,:);
T.Lspeed = L_speed(ii);  T.Lspeed(T.Lspeed <= 0) = NaN;
ii = find(iswithin(L_surf_arr(:,1),Llaps(2,:)) == 1); % get surfacing positions within that lap
% plot(L_surf_arr(ii,2),L_surf_arr(ii,3)) 
T.Lsurf_arr = L_surf_arr(ii,:);

ii = find(iswithin(L_track_itp(:,1),Llaps(3,:)) == 1);
T2.Ltrack = L_track_itp(ii,:);
T2.Lspeed = L_speed(ii); T2.Lspeed(T2.Lspeed <= 0) = NaN;
ii = find(iswithin(L_surf_arr(:,1),Llaps(3,:)) == 1); % get surfacing positions within that lap
% plot(L_surf_arr(ii,2),L_surf_arr(ii,3)) 
T2.Lsurf_arr = L_surf_arr(ii,:);

ii = find(iswithin(L_track_itp(:,1),Llaps(4,:)) == 1);
T4.Ltrack = L_track_itp(ii,:);
T4.Lspeed = L_speed(ii); T4.Lspeed(T4.Lspeed <= 0) = NaN;
ii = find(iswithin(L_surf_arr(:,1),Llaps(4,:)) == 1); % get surfacing positions within that lap
% plot(L_surf_arr(ii,2),L_surf_arr(ii,3)) 
T4.Lsurf_arr = L_surf_arr(ii,:);

ii = find(iswithin(L_track_itp(:,1),Llaps(5,:)) == 1);
T6.Ltrack = L_track_itp(ii,:);
T6.Lspeed = L_speed(ii); T6.Lspeed(T6.Lspeed <= 0) = NaN;
ii = find(iswithin(L_surf_arr(:,1),Llaps(5,:)) == 1); % get surfacing positions within that lap
% plot(L_surf_arr(ii,2),L_surf_arr(ii,3)) 
T6.Lsurf_arr = L_surf_arr(ii,:);

ii = find(iswithin(L_track_itp(:,1),Llaps(6,:)) == 1);
T8.Ltrack = L_track_itp(ii,:);
T8.Lspeed = L_speed(ii); T8.Lspeed(T8.Lspeed <= 0) = NaN;
ii = find(iswithin(L_surf_arr(:,1),Llaps(6,:)) == 1); % get surfacing positions within that lap
% plot(L_surf_arr(ii,2),L_surf_arr(ii,3)) 
T8.Lsurf_arr = L_surf_arr(ii,:);

% plot
plot(C.Ltrack(:,2),C.Ltrack(:,3),'k'); 
plot(T.Ltrack(:,2),T.Ltrack(:,3),'Color',[55/255 126/255 184/255]); 
plot(T8.Ltrack(:,2),T8.Ltrack(:,3),'Color',[228/255 26/255 28/255])

figure(2); clf; hold on
plot(L_track_itp(:,1),L_track_itp(:,2))
plot(C.Ltrack(:,1),C.Ltrack(:,2),'k')
plot(T.Ltrack(:,1),T.Ltrack(:,2),'Color',[55/255 126/255 184/255])
plot(T2.Ltrack(:,1),T2.Ltrack(:,2),'Color',[255/255 127/255 0/255])
plot(T4.Ltrack(:,1),T4.Ltrack(:,2),'Color',[77/255 175/255 74/255])
plot(T6.Ltrack(:,1),T6.Ltrack(:,2),'Color',[152/255 78/255 163/255])
plot(T8.Ltrack(:,1),T8.Ltrack(:,2),'Color',[228/255 26/255 28/255])

figure(3); clf; hold on
plot(L_track_itp(:,1),L_speed); 
plot(C.Ltrack(:,1),C.Lspeed,'k');
plot(T.Ltrack(:,1),T.Lspeed,'Color',[55/255 126/255 184/255]);
plot(T2.Ltrack(:,1),T2.Lspeed,'Color',[255/255 127/255 0/255]);
plot(T4.Ltrack(:,1),T4.Lspeed,'Color',[77/255 175/255 74/255]);
plot(T6.Ltrack(:,1),T6.Lspeed,'Color',[152/255 78/255 163/255]);
plot(T8.Ltrack(:,1),T8.Lspeed,'Color',[228/255 26/255 28/255]);

%% plot speed 
figure(4); clf; hold on

errorbar(-8,nanmean(T8.Uspeed),nanstd(T8.Uspeed),'o','Color',[228/255 26/255 28/255])
errorbar(-6,nanmean(T6.Uspeed),nanstd(T6.Uspeed),'o','Color',[152/255 78/255 163/255])
errorbar(-4,nanmean(T4.Uspeed),nanstd(T4.Uspeed),'o','Color',[77/255 175/255 74/255])
errorbar(-2,nanmean(T2.Uspeed),nanstd(T2.Uspeed),'o','Color',[255/255 127/255 0/255])
errorbar(-1,nanmean(T.Uspeed),nanstd(T.Uspeed),'o','Color',[55/255 126/255 184/255])
errorbar(-0.25,nanmean(C.Uspeed),nanstd(C.Uspeed),'o','color',[0 0 0])

errorbar(0.25,nanmean(C.Lspeed),nanstd(C.Lspeed),'o','color',[0 0 0])
errorbar(1,nanmean(T.Lspeed),nanstd(T.Lspeed),'o','Color',[55/255 126/255 184/255])
errorbar(2,nanmean(T2.Lspeed),nanstd(T2.Lspeed),'o','Color',[255/255 127/255 0/255])
errorbar(4,nanmean(T4.Lspeed),nanstd(T4.Lspeed),'o','Color',[77/255 175/255 74/255])
errorbar(6,nanmean(T6.Lspeed),nanstd(T6.Lspeed),'o','Color',[152/255 78/255 163/255])
errorbar(8,nanmean(T8.Lspeed),nanstd(T8.Lspeed),'o','Color',[228/255 26/255 28/255])

set(gca,'xtick',[-8 -6 -4 -2 -1 0 1 2 4 6 8],'xticklabels',{'Tag+8','Tag+6'...
    'Tag+4','Tag+2','Tag','Control','Tag','Tag+2','Tag+4','Tag+6','Tag+8'})
ylabel('Speed (m/s)')

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Kolohe_UnloadLoadSpeed','-dpng','-r300')

%% print speed by duration? 
figure(5); hold on
plot(C.Uspeed,'k')
plot(C.Lspeed,'k')
plot(T.Lspeed,'Color',[55/255 126/255 184/255]);
plot(T.Uspeed,'Color',[55/255 126/255 184/255]);
plot(T2.Lspeed,'Color',[255/255 127/255 0/255]);
plot(T2.Uspeed,'Color',[255/255 127/255 0/255]);
plot(T4.Lspeed,'Color',[77/255 175/255 74/255]);
plot(T4.Uspeed,'Color',[77/255 175/255 74/255]);
plot(T6.Lspeed,'Color',[152/255 78/255 163/255]);
plot(T6.Uspeed,'Color',[152/255 78/255 163/255]);
plot(T8.Lspeed,'Color',[228/255 26/255 28/255]);
plot(T8.Uspeed,'Color',[228/255 26/255 28/255]);

% save these parameters
save('LonoLoadUnloadSpeed','C','T','T2','T4','T6','T8')