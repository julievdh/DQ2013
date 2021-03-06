% % how much to slow down based on 2013 CFD? -- Updated for 2017
% Simulations
% 
% % load CFD data: across velocities (vel) 1-6 m/s, drag forces only on
% % dolphin (first column) and tag (second column) for tag, tag+2, tag+4
% % conditions
% load('DolphinTagSims_24Feb16')
% % Not using tag+8 from Victor (July 19) because only tag+8 and tag+8 and
% % would need to interpolate tag+6 anyway. Let's keep CFD in the other
% % paper. 
% 
% %% calculate what tag+6 and tag+8 would be
% % figure(3); hold on
% % % plot difference in drag between conditions
% % plot(sum(tag')'-notag,'color',[55/255 126/255 184/255])
% % plot(sum(tag2')'-notag,'color',[255/255 127/255 0/255])
% % plot(sum(tag4')'-notag,'color',[77/255 175/255 74/255])
% % xlabel('Speed'); ylabel('Difference in Drag')
% 
% % calculate difference between tag2 and tag to determine
% % amount of drag from elements only
% diff20 = sum(tag2')'-sum(tag')';
% 
% % plot(diff42,'k:','linewidth',2) % AMOUNT OF DRAG ADDED BY TWO ELEMENTS
% % plot(diff20,'k:','linewidth',2) % 
% 
% % adjustfigurefont
% 
% % tag+4
% tag4 = sum(tag')+2*diff20';
% % tag+6
% tag6 = sum(tag')+(3*diff20');
% % tag+8 
% tag8 = sum(tag')+(4*diff20');

DataCFDResults_DragElements_V2

%% calculate new speed to maintain drag force at 3 m/s: 
% assume that control lap speed = 3 m/s based on boat trial lap time
% comparison

% fit curves to CFD data
[c_notag(1), c_notag(2)] = curve_fit(V_A,fd_sim);
[c_tag(1), c_tag(2)] = curve_fit(V_A,fd_sim+A_drag);
[c_tag2(1), c_tag2(2)] = curve_fit(V_A,fd_sim+A2_drag);
[c_tag4(1), c_tag4(2)] = curve_fit(V_A,fd_sim+A4_drag);
[c_tag6(1), c_tag6(2)] = curve_fit(V_A,fd_sim+A6_drag);
[c_tag8(1), c_tag8(2)] = curve_fit(V_A,fd_sim+A8_drag);
% plot to the actual curves instead of the interpolated
velHD = 0:0.1:6;
% plot drag vs speed for all conditions
figure(1); clf; hold on %set(gcf,'position',[23   290   850   380])
%subplot('position',[0.1 0.1 0.4 0.8]); hold on
plot(velHD,c_notag(1)*velHD.^c_notag(2),'k','LineWidth',2)
plot(velHD,c_tag(1)*velHD.^c_tag(2),'color',[55/255 126/255 184/255],'linewidth',2)
plot(velHD,c_tag2(1)*velHD.^c_tag2(2),'color',[255/255 127/255 0/255],'linewidth',2)
plot(velHD,c_tag4(1)*velHD.^c_tag4(2),'color',[77/255 175/255 74/255],'linewidth',2)
plot(velHD,c_tag6(1)*velHD.^c_tag6(2),'color',[152/255 78/255 163/255],'linewidth',2)
plot(velHD,c_tag8(1)*velHD.^c_tag8(2),'color',[228/255 26/255 28/255],'linewidth',2)

xlabel('Velocity (m/s)'); ylabel('Drag Force (N)')
xlim([1 6])
adjustfigurefont


% Find reduced speeds
% INSTEAD OF NOTAG3, DO MEAN CONTROL SPEED = 
% MN = mean([mean(Kolohe_C),mean(Liko_C),mean(Lono_C),mean(Nainoa_C)]); = almost 4 m/s. 
Ured_tag = (fd_sim(4)/c_tag(1)).^(1/c_tag(2));
Ured_tag2 = (fd_sim(4)/c_tag2(1)).^(1/c_tag2(2));
Ured_tag4 = (fd_sim(4)/c_tag4(1)).^(1/c_tag4(2));
Ured_tag6 = (fd_sim(4)/c_tag6(1)).^(1/c_tag6(2));
Ured_tag8 = (fd_sim(4)/c_tag8(1)).^(1/c_tag8(2));

% plot to check
plot(Ured_tag8,c_tag8(1)*Ured_tag8.^c_tag8(2),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',10)
plot(Ured_tag6,c_tag6(1)*Ured_tag6.^c_tag6(2),'ko','markerfacecolor',[152/255 78/255 163/255],'markersize',10)
plot(Ured_tag4,c_tag4(1)*Ured_tag4.^c_tag4(2),'kd','markerfacecolor',[77/255 175/255 74/255],'markersize',10)
plot(Ured_tag2,c_tag2(1)*Ured_tag2.^c_tag2(2),'ko','markerfacecolor',[255/255 127/255 0/255],'markersize',10)
plot(Ured_tag,c_tag(1)*Ured_tag.^c_tag(2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(V_A(4),fd_sim(4),'ko','markerfacecolor','k','markersize',10)
box on

% calculate percent decrease
p0t = (abs(Ured_tag-4)/4);
p0t2 = (abs(Ured_tag2-4)/4);
p0t4 = (abs(Ured_tag4-4)/4);
p0t6 = (abs(Ured_tag6-4)/4);
p0t8 = (abs(Ured_tag8-4)/4);

% calculate percent increase if maintain speed
p0t8_U4 = (A8_drag(4))/fd_sim(4);
p0t6_U4 = (A6_drag(4))/fd_sim(4);
p0t4_U4 = (A4_drag(4))/fd_sim(4);
p0t2_U4 = (A2_drag(4))/fd_sim(4);
p0t_U4 = (A_drag(4))/fd_sim(4);

%% plot alternative - that they can maintain speed but increase drag
plot(4,A8_drag(4)+fd_sim(4),'s','markeredgecolor',[228/255 26/255 28/255],'markersize',10,'linewidth',2)
plot(4,A6_drag(4)+fd_sim(4),'o','markeredgecolor',[152/255 78/255 163/255],'markersize',10,'linewidth',2)
plot(4,A4_drag(4)+fd_sim(4),'d','markeredgecolor',[77/255 175/255 74/255],'markersize',10,'linewidth',2)
plot(4,A2_drag(4)+fd_sim(4),'o','markeredgecolor',[255/255 127/255 0/255],'markersize',10,'linewidth',2)
plot(4,A_drag(4)+fd_sim(4),'^','markeredgecolor',[55/255 126/255 184/255],'markersize',10,'linewidth',2)
% 
ylim([0 600])
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
adjustfigurefont
print('CFDresults','-dsvg','-r300')

%% for Introduction
% figure(2); hold on
% plot(velHD,c_notag(1)*velHD.^c_notag(2),'k','LineWidth',2)
% plot(velHD,c_tag8(1)*velHD.^c_tag8(2),'color',[228/255 26/255 28/255],'linewidth',2)
% 
% plot(Ured_tag8,c_tag8(1)*Ured_tag8.^c_tag8(2),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',10)
% plot(vel(3),notag(3),'ko','markerfacecolor','k','markersize',10)
% plot(3,tag8(3),'s','markeredgecolor',[228/255 26/255 28/255],'markersize',10,'linewidth',2)
% 
% box on
% 
% xlabel('Velocity (m/s)'); ylabel('Drag Force (N)')
% xlim([1 5.5])
% adjustfigurefont
% 
% cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
% print('DragTradeoff','-dsvg','-r300')

%% Plot actual dolphin speeds from Alex's Analysis
% load('all_vel_vec.mat')

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/Trainer_linsm/
Nainoa_A = newTrainerFiles('tt13_273b_vel.mat'); %
Nainoa_C = newTrainerFiles('tt13_276_NaC_vel.mat'); % 
Lono_A4_2 = newTrainerFiles('tt13_281a_vel.mat'); %

Lono_A4 = newTrainerFiles('tt13_276a01_vel.mat'); %
Lono_A = newTrainerFiles('tt13_269b01_vel.mat');%
Lono_C = newTrainerFiles('tt13_280_C_vel.mat');%

Kolohe_A4 = newTrainerFiles('tt13_288a01_vel.mat');%
Kolohe_A = newTrainerFiles('tt13_271b01_vel.mat');%
Kolohe_C = newTrainerFiles('tt13_269_C_vel.mat'); %

Liko_A = newTrainerFiles('tt13_279b01_vel.mat'); %
Liko_C = newTrainerFiles('tt13_273_C_vel.mat');%

Liko_A4 = newTrainerFiles('tt13_277a01_vel.mat');
Nainoa_A4 = newTrainerFiles('tt13_277b01_vel.mat');


cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/
%% 
% plot on figure
figure(10); clf; hold on %set(gcf,'position',[23   290   850   380])
%subplot('position',[0.1 0.1 0.4 0.8]); hold on
plot(velHD,c_notag(1)*velHD.^c_notag(2),'k','LineWidth',2)
plot(velHD,c_tag(1)*velHD.^c_tag(2),'color',[55/255 126/255 184/255],'linewidth',2)
plot(velHD,c_tag8(1)*velHD.^c_tag8(2),'color',[228/255 26/255 28/255],'linewidth',2)

xlabel('Velocity (m/s)'); ylabel('Drag Force (N)')
xlim([1 6])
adjustfigurefont

plot(velHD,c_notag(1)*velHD.^c_notag(2),'k','LineWidth',2); box on
plot(velHD,c_tag(1)*velHD.^c_tag(2),'color',[55/255 126/255 184/255],'linewidth',2)
plot(velHD,c_tag8(1)*velHD.^c_tag8(2),'color',[228/255 26/255 28/255],'linewidth',2)


plot(mean(Lono_C),c_notag(1)*mean(Lono_C).^c_notag(2),'ko','markerfacecolor','k','markersize',10)
plot(mean(Lono_A),c_tag(1)*mean(Lono_A).^c_tag(2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(mean(Lono_A4),c_tag8(1)*mean(Lono_A4).^c_tag8(2),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',10)

plot(mean(Kolohe_C),c_notag(1)*mean(Kolohe_C).^c_notag(2),'ko','markerfacecolor','k','markersize',10)
plot(mean(Kolohe_A),c_tag(1)*mean(Kolohe_A).^c_tag(2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(mean(Kolohe_A4),c_tag8(1)*mean(Kolohe_A4).^c_tag8(2),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',10)

plot(mean(Liko_C),c_notag(1)*mean(Liko_C).^c_notag(2),'ko','markerfacecolor','k','markersize',10)
plot(mean(Liko_A),c_tag(1)*mean(Liko_A).^c_tag(2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(mean(Liko_A4),c_tag8(1)*mean(Liko_A4).^c_tag8(2),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',10)

plot(mean(Nainoa_C),c_notag(1)*mean(Nainoa_C).^c_notag(2),'ko','markerfacecolor','k','markersize',10)
plot(mean(Nainoa_A),c_tag(1)*mean(Nainoa_A).^c_tag(2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(mean(Nainoa_A4),c_tag8(1)*mean(Nainoa_A4).^c_tag8(2),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',10)
ylim([0 600]), adjustfigurefont
% save
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print -dsvg SpeedPerspFilt

% comparison of drag in different experimental conditions
mean([c_notag(1)*mean(Kolohe_C).^c_notag(2); c_notag(1)*mean(Lono_C).^c_notag(2); c_notag(1)*mean(Nainoa_C).^c_notag(2); c_notag(1)*mean(Liko_C).^c_notag(2)])
mean([c_tag8(1)*mean(Kolohe_A4).^c_tag8(2); c_tag8(1)*mean(Lono_A4).^c_tag8(2); c_tag8(1)*mean(Nainoa_A4).^c_tag8(2); c_tag8(1)*mean(Liko_A4).^c_tag8(2)])
mean([c_tag(1)*mean(Kolohe_A).^c_tag(2); c_tag(1)*mean(Lono_A).^c_tag(2); c_tag(1)*mean(Nainoa_A).^c_tag(2); c_tag(1)*mean(Liko_A).^c_tag(2)])


%% add velocities from loading/unloading trials
% plot on figure
figure(2); clf; set(gcf,'position',[23   290   850   380])
subplot('position',[0.58 0.1 0.4 0.8]); hold on 
plot(velHD,c_notag(1)*velHD.^c_notag(2),'k','LineWidth',2); box on
plot(velHD,c_tag(1)*velHD.^c_tag(2),'color',[55/255 126/255 184/255],'linewidth',2)
plot(velHD,c_tag2(1)*velHD.^c_tag2(2),'color',[255/255 127/255 0/255],'linewidth',2)
plot(velHD,c_tag4(1)*velHD.^c_tag4(2),'color',[77/255 175/255 74/255],'linewidth',2)
plot(velHD,c_tag6(1)*velHD.^c_tag6(2),'color',[152/255 78/255 163/255],'linewidth',2)
plot(velHD,c_tag8(1)*velHD.^c_tag8(2),'color',[228/255 26/255 28/255],'linewidth',2)
xlim([1 6]), ylim([0 600])


load('KoloheLoadUnloadSpeed') 
%% unloading
plot(mean(C.Uspeed),c_notag(1)*mean(C.Uspeed).^c_notag(2),'ko','markersize',10)
plot(nanmean(T.Uspeed),c_tag(1)*nanmean(T.Uspeed).^c_tag(2),'ko','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(nanmean(T2.Uspeed),c_tag2(1)*nanmean(T2.Uspeed).^c_tag2(2),'ko','markerfacecolor',[255/255 127/255 0/255],'markersize',10)
plot(nanmean(T4.Uspeed),c_tag4(1)*nanmean(T4.Uspeed).^c_tag4(2),'ko','markerfacecolor',[77/255 175/255 74/255],'markersize',10)
plot(nanmean(T6.Uspeed),c_tag6(1)*nanmean(T6.Uspeed).^c_tag6(2),'ko','markerfacecolor',[152/255 78/255 163/255],'markersize',10)
plot(nanmean(T8.Uspeed),c_tag8(1)*nanmean(T8.Uspeed).^c_tag8(2),'ko','markerfacecolor',[228/255 26/255 28/255],'markersize',10)
%% lines in between
% t8 - t6 - t4 - t2 - t - c
Upath(:,1) = [nanmean(T8.Uspeed) nanmean(T6.Uspeed) nanmean(T4.Uspeed) nanmean(T2.Uspeed) nanmean(T.Uspeed) mean(C.Uspeed)];
Upath(:,2) = [c_tag8(1)*nanmean(T8.Uspeed).^c_tag8(2), c_tag6(1)*nanmean(T6.Uspeed).^c_tag6(2),... 
    c_tag4(1)*nanmean(T4.Uspeed).^c_tag4(2), c_tag2(1)*nanmean(T2.Uspeed).^c_tag2(2), ...
    c_tag(1)*nanmean(T.Uspeed).^c_tag(2), c_notag(1)*mean(C.Uspeed).^c_notag(2)];
plot(Upath(:,1),Upath(:,2),'k--')
%% loading
plot(mean(C.Lspeed),c_notag(1)*mean(C.Lspeed).^c_notag(2),'ko','markersize',10)
plot(nanmean(T.Lspeed),c_tag(1)*nanmean(T.Lspeed).^c_tag(2),'ko','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(nanmean(T2.Lspeed),c_tag2(1)*nanmean(T2.Lspeed).^c_tag2(2),'ko','markerfacecolor',[255/255 127/255 0/255],'markersize',10)
plot(nanmean(T4.Lspeed),c_tag4(1)*nanmean(T4.Lspeed).^c_tag4(2),'ko','markerfacecolor',[77/255 175/255 74/255],'markersize',10)
plot(nanmean(T6.Lspeed),c_tag6(1)*nanmean(T6.Lspeed).^c_tag6(2),'ko','markerfacecolor',[152/255 78/255 163/255],'markersize',10)
plot(nanmean(T8.Lspeed),c_tag8(1)*nanmean(T8.Lspeed).^c_tag8(2),'ko','markerfacecolor',[228/255 26/255 28/255],'markersize',10)

%% lines in between
% c - t - t2 - t4 - t6 - t8 % i guess the direction of plotting doesn't
% actually matter
Lpath(:,1) = [nanmean(T8.Lspeed) nanmean(T6.Lspeed) nanmean(T4.Lspeed) nanmean(T2.Lspeed) nanmean(T.Lspeed) mean(C.Lspeed)];
Lpath(:,2) = [c_tag8(1)*nanmean(T8.Lspeed).^c_tag8(2), c_tag6(1)*nanmean(T6.Lspeed).^c_tag6(2),... 
    c_tag4(1)*nanmean(T4.Lspeed).^c_tag4(2), c_tag2(1)*nanmean(T2.Lspeed).^c_tag2(2), ...
    c_tag(1)*nanmean(T.Lspeed).^c_tag(2), c_notag(1)*mean(C.Lspeed).^c_notag(2)];
plot(Lpath(:,1),Lpath(:,2),'k-')

text(1.15,925,'B','fontsize',18,'fontweight','bold'), ylim([0 600])
xlabel('Velocity (m/s)'); ylabel('Drag Force (N)')

%% Store Average change in velocity
slowKU(1) = (nanmean(T.Uspeed)-mean(C.Uspeed))/mean(C.Uspeed);
slowKU(2) = (nanmean(T2.Uspeed)-mean(C.Uspeed))/mean(C.Uspeed);
slowKU(3) = (nanmean(T4.Uspeed)-mean(C.Uspeed))/mean(C.Uspeed);
slowKU(4) = (nanmean(T6.Uspeed)-mean(C.Uspeed))/mean(C.Uspeed);
slowKU(5) = (nanmean(T8.Uspeed)-mean(C.Uspeed))/mean(C.Uspeed);

slowKL(1) = (nanmean(T.Lspeed)-mean(C.Lspeed))/mean(C.Lspeed);
slowKL(2) = (nanmean(T2.Lspeed)-mean(C.Lspeed))/mean(C.Lspeed);
slowKL(3) = (nanmean(T4.Lspeed)-mean(C.Lspeed))/mean(C.Lspeed);
slowKL(4) = (nanmean(T6.Lspeed)-mean(C.Lspeed))/mean(C.Lspeed);
slowKL(5) = (nanmean(T8.Lspeed)-mean(C.Lspeed))/mean(C.Lspeed);

Kmean(1) = mean([mean(C.Lspeed) mean(C.Uspeed)]);
Kmean(2) = mean([nanmean(T.Lspeed) nanmean(T.Uspeed)]);
Kmean(3) = mean([nanmean(T2.Lspeed) nanmean(T2.Uspeed)]);
Kmean(4) = mean([mean(T4.Lspeed) mean(T4.Uspeed)]);
Kmean(5) = mean([nanmean(T6.Lspeed) nanmean(T6.Uspeed)]);
Kmean(6) = mean([nanmean(T8.Lspeed) nanmean(T8.Uspeed)]);

%% add velocities from loading/unloading trials
% plot on figure % Lono first, then Kolohe 
figure(2); subplot('position',[0.1 0.1 0.4 0.8]); hold on
plot(velHD,c_notag(1)*velHD.^c_notag(2),'k','LineWidth',2); box on
plot(velHD,c_tag(1)*velHD.^c_tag(2),'color',[55/255 126/255 184/255],'linewidth',2)
plot(velHD,c_tag2(1)*velHD.^c_tag2(2),'color',[255/255 127/255 0/255],'linewidth',2)
plot(velHD,c_tag4(1)*velHD.^c_tag4(2),'color',[77/255 175/255 74/255],'linewidth',2)
plot(velHD,c_tag6(1)*velHD.^c_tag6(2),'color',[152/255 78/255 163/255],'linewidth',2)
plot(velHD,c_tag8(1)*velHD.^c_tag8(2),'color',[228/255 26/255 28/255],'linewidth',2)
xlim([1 6])



load('LonoLoadUnloadSpeed') 
%% unloading
plot(mean(C.Uspeed),c_notag(1)*mean(C.Uspeed).^c_notag(2),'ko','markersize',10)
plot(nanmean(T.Uspeed),c_tag(1)*nanmean(T.Uspeed).^c_tag(2),'ko','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(nanmean(T2.Uspeed),c_tag2(1)*nanmean(T2.Uspeed).^c_tag2(2),'ko','markerfacecolor',[255/255 127/255 0/255],'markersize',10)
plot(nanmean(T4.Uspeed),c_tag4(1)*nanmean(T4.Uspeed).^c_tag4(2),'ko','markerfacecolor',[77/255 175/255 74/255],'markersize',10)
plot(nanmean(T6.Uspeed),c_tag6(1)*nanmean(T6.Uspeed).^c_tag6(2),'ko','markerfacecolor',[152/255 78/255 163/255],'markersize',10)
plot(nanmean(T8.Uspeed),c_tag8(1)*nanmean(T8.Uspeed).^c_tag8(2),'ko','markerfacecolor',[228/255 26/255 28/255],'markersize',10)
%% lines in between
% t8 - t6 - t4 - t2 - t - c
Upath(:,1) = [nanmean(T8.Uspeed) nanmean(T6.Uspeed) nanmean(T4.Uspeed) nanmean(T2.Uspeed) nanmean(T.Uspeed) mean(C.Uspeed)];
Upath(:,2) = [c_tag8(1)*nanmean(T8.Uspeed).^c_tag8(2), c_tag6(1)*nanmean(T6.Uspeed).^c_tag6(2),... 
    c_tag4(1)*nanmean(T4.Uspeed).^c_tag4(2), c_tag2(1)*nanmean(T2.Uspeed).^c_tag2(2), ...
    c_tag(1)*nanmean(T.Uspeed).^c_tag(2), c_notag(1)*mean(C.Uspeed).^c_notag(2)];
plot(Upath(:,1),Upath(:,2),'k--')
%% loading
plot(mean(C.Lspeed),c_notag(1)*mean(C.Lspeed).^c_notag(2),'ko','markersize',10)
plot(nanmean(T.Lspeed),c_tag(1)*nanmean(T.Lspeed).^c_tag(2),'ko','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(nanmean(T2.Lspeed),c_tag2(1)*nanmean(T2.Lspeed).^c_tag2(2),'ko','markerfacecolor',[255/255 127/255 0/255],'markersize',10)
plot(nanmean(T4.Lspeed),c_tag4(1)*nanmean(T4.Lspeed).^c_tag4(2),'ko','markerfacecolor',[77/255 175/255 74/255],'markersize',10)
plot(nanmean(T6.Lspeed),c_tag6(1)*nanmean(T6.Lspeed).^c_tag6(2),'ko','markerfacecolor',[152/255 78/255 163/255],'markersize',10)
plot(nanmean(T8.Lspeed),c_tag8(1)*nanmean(T8.Lspeed).^c_tag8(2),'ko','markerfacecolor',[228/255 26/255 28/255],'markersize',10)

%% calculate change in speed

slowLU(1) = (nanmean(T.Uspeed)-mean(C.Uspeed))/mean(C.Uspeed);
slowLU(2) = (nanmean(T2.Uspeed)-mean(C.Uspeed))/mean(C.Uspeed);
slowLU(3) = (nanmean(T4.Uspeed)-mean(C.Uspeed))/mean(C.Uspeed);
slowLU(4) = (nanmean(T6.Uspeed)-mean(C.Uspeed))/mean(C.Uspeed);
slowLU(5) = (nanmean(T8.Uspeed)-mean(C.Uspeed))/mean(C.Uspeed);

slowLL(1) = (nanmean(T.Lspeed)-mean(C.Lspeed))/mean(C.Lspeed);
slowLL(2) = (nanmean(T2.Lspeed)-mean(C.Lspeed))/mean(C.Lspeed);
slowLL(3) = (nanmean(T4.Lspeed)-mean(C.Lspeed))/mean(C.Lspeed);
slowLL(4) = (nanmean(T6.Lspeed)-mean(C.Lspeed))/mean(C.Lspeed);
slowLL(5) = (nanmean(T8.Lspeed)-mean(C.Lspeed))/mean(C.Lspeed);

Lmean(1) = mean([mean(C.Lspeed) mean(C.Uspeed)]);
Lmean(2) = mean([nanmean(T.Lspeed) nanmean(T.Uspeed)]);
Lmean(3) = mean([mean(T2.Lspeed) mean(T2.Uspeed)]);
Lmean(4) = mean([nanmean(T4.Lspeed) nanmean(T4.Uspeed)]);
Lmean(5) = mean([nanmean(T6.Lspeed) nanmean(T6.Uspeed)]);
Lmean(6) = mean([nanmean(T8.Lspeed) nanmean(T8.Uspeed)]);

% mean speed 
mean([Kmean; Lmean])
std([Kmean; Lmean])

% mean slow down with loading
mean([slowKL; slowKU; slowLU; slowLL])
std([slowKL; slowKU; slowLU; slowLL])



%% lines in between
% c - t - t2 - t4 - t6 - t8 % i guess the direction of plotting doesn't
% actually matter
Lpath(:,1) = [nanmean(T8.Lspeed) nanmean(T6.Lspeed) nanmean(T4.Lspeed) nanmean(T2.Lspeed) nanmean(T.Lspeed) mean(C.Lspeed)];
Lpath(:,2) = [c_tag8(1)*nanmean(T8.Lspeed).^c_tag8(2), c_tag6(1)*nanmean(T6.Lspeed).^c_tag6(2),... 
    c_tag4(1)*nanmean(T4.Lspeed).^c_tag4(2), c_tag2(1)*nanmean(T2.Lspeed).^c_tag2(2), ...
    c_tag(1)*nanmean(T.Lspeed).^c_tag(2), c_notag(1)*mean(C.Lspeed).^c_notag(2)];
plot(Lpath(:,1),Lpath(:,2),'k-')

text(1.15,925,'A','fontsize',18,'fontweight','bold')
xlabel('Velocity (m/s)'); ylabel('Drag Force (N)')
adjustfigurefont

set(gcf,'paperpositionmode','auto'), ylim([0 600])
print -dsvg SpeedPersp_UnloadLoadBoth


