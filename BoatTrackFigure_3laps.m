% import boat track data
% plot each animal's path 
% plot each animal's consistency with boat

clear all; close all; clc

% load saved boat tracks (from BoatTrackShift.m files)
load('NainoaBoatTrack')
load('LonoBoatTrack')

%% figure 1: Nainoa
figure(1); clf; set(gcf,'position',[2 70 1278 603])
% subplot of dolphin track 2D
subplot('position',[0.03 0.1 0.25 0.4]); hold on
% plot SECOND LAP of entire trial
plot(Nainoa.C.dolphin(49:80,2), Nainoa.C.dolphin(49:80,3),'o',...
    'MarkerSize',5,'markerfacecolor',[0 108/255 193/255],'markeredgecolor',[0 108/255 193/255])
plot(Nainoa.C.boat(89:165,2),Nainoa.C.boat(89:165,3),'color',[0 108/255 193/255])

plot(Nainoa.A.dolphin(55:88,2),Nainoa.shift_A.dolphin(55:88,3),'^',...
    'MarkerSize',5,'markerfacecolor',[221/255 60/255 0],'markeredgecolor',[221/255 60/255 0])
plot(Nainoa.A.boat(135:208,2),Nainoa.shift_A.boat(135:208,3),'color',[221/255 60/255 0])

plot(Nainoa.A2.dolphin(43:94,2),Nainoa.shift_A2.dolphin(43:94,3),'s',...
    'MarkerSize',5,'markerfacecolor',[97/255 180/255 5/255],'markeredgecolor',[97/255 180/255 5/255])
plot(Nainoa.A2.boat(79:165,2),Nainoa.shift_A2.boat(79:165,3),'color',[97/255 180/255 5/255])

%%

subplot('position',[0.33 0.1 0.25 0.4]); hold on
% plot MIDDLE lap of entire trial
plot(Nainoa.C.dolphin(238:278,2), Nainoa.C.dolphin(238:278,3),'o',...
    'MarkerSize',5,'markerfacecolor',[0 108/255 193/255],'markeredgecolor',[0 108/255 193/255])
plot(Nainoa.C.boat(392:469,2),Nainoa.C.boat(392:469,3),'color',[0 108/255 193/255])

plot(Nainoa.A.dolphin(235:284,2),Nainoa.shift_A.dolphin(235:284,3),'^',...
    'MarkerSize',5,'markerfacecolor',[221/255 60/255 0],'markeredgecolor',[221/255 60/255 0])
plot(Nainoa.A.boat(511:587,2),Nainoa.shift_A.boat(511:587,3),'color',[221/255 60/255 0])

plot(Nainoa.A2.dolphin(314:355,2),Nainoa.shift_A2.dolphin(314:355,3),'s',...
    'MarkerSize',5,'markerfacecolor',[97/255 180/255 5/255],'markeredgecolor',[97/255 180/255 5/255])
plot(Nainoa.A2.boat(410:493,2),Nainoa.shift_A2.boat(410:493,3),'color',[97/255 180/255 5/255])


subplot('position',[0.66 0.1 0.25 0.4]); hold on
% plot SECOND LAST lap of entire trial
plot(Nainoa.C.dolphin(386:431,2), Nainoa.C.dolphin(386:431,3),'o',...
    'MarkerSize',5,'markerfacecolor',[0 108/255 193/255],'markeredgecolor',[0 108/255 193/255])
plot(Nainoa.C.boat(707:789,2),Nainoa.C.boat(707:789,3),'color',[0 108/255 193/255])

plot(Nainoa.A.dolphin(425:465,2),Nainoa.shift_A.dolphin(425:465,3),'^',...
    'MarkerSize',5,'markerfacecolor',[221/255 60/255 0],'markeredgecolor',[221/255 60/255 0])
plot(Nainoa.A.boat(819:895,2),Nainoa.shift_A.boat(819:895,3),'color',[221/255 60/255 0])

plot(Nainoa.A2.dolphin(470:525,2),Nainoa.shift_A2.dolphin(470:525,3),'s',...
    'MarkerSize',5,'markerfacecolor',[97/255 180/255 5/255],'markeredgecolor',[97/255 180/255 5/255])
plot(Nainoa.A2.boat(748:840,2),Nainoa.shift_A2.boat(748:840,3),'color',[97/255 180/255 5/255])


%% figure 2: Lono
%figure(2); clf; set(gcf,'position',[2 240 1278 380])
% subplot of dolphin track 2D

subplot('position',[0.03 0.55 0.25 0.4]); hold on
% plot SECOND LAP of entire trial
title('Second Lap')
% Order of plotting is different than all others, to make legend (dolphins first, then boat)
plot(Lono.C.dolphin(59:124,2), Lono.shift_C.dolphin(59:124,3),'o',...
    'MarkerSize',5,'markerfacecolor',[0 108/255 193/255],'markeredgecolor',[0 108/255 193/255])
plot(Lono.A.dolphin(116:225,2), Lono.A.dolphin(116:225,3),'^',...
    'MarkerSize',5,'markerfacecolor',[221/255 60/255 0],'markeredgecolor',[221/255 60/255 0])
plot(Lono.A2.dolphin(82:170,2), Lono.shift_A2.dolphin(82:170,3),'s',...
    'MarkerSize',5,'markerfacecolor',[97/255 180/255 5/255],'markeredgecolor',[97/255 180/255 5/255])

plot(Lono.C.boat(77:180,2),Lono.shift_C.boat(77:180,3),'color',[0 108/255 193/255])
plot(Lono.A.boat(154:305,2),Lono.A.boat(154:305,3),'color',[221/255 60/255 0])
plot(Lono.A2.boat(109:200,2),Lono.shift_A2.boat(109:200,3),'color',[97/255 180/255 5/255])

legend('C','T','T+4','Location','NW')

subplot('position',[0.33 0.55 0.25 0.4]); hold on
% plot MIDDLE lap of entire trial
title('Middle Lap')
plot(Lono.C.dolphin(301:359,2), Lono.shift_C.dolphin(301:359,3),'o',...
    'MarkerSize',5,'markerfacecolor',[0 108/255 193/255],'markeredgecolor',[0 108/255 193/255])
plot(Lono.C.boat(433:518,2),Lono.shift_C.boat(433:518,3),'color',[0 108/255 193/255])
plot(Lono.A.dolphin(519:608,2), Lono.A.dolphin(519:608,3),'^',...
    'MarkerSize',5,'markerfacecolor',[221/255 60/255 0],'markeredgecolor',[221/255 60/255 0])
plot(Lono.A.boat(891:1048,2),Lono.A.boat(891:1048,3),'color',[221/255 60/255 0])
plot(Lono.A2.dolphin(365:442,2), Lono.shift_A2.dolphin(365:442,3),'s',...
     'MarkerSize',5,'markerfacecolor',[97/255 180/255 5/255],'markeredgecolor',[97/255 180/255 5/255])
plot(Lono.A2.boat(526:607,2),Lono.shift_A2.boat(526:607,3),'color',[97/255 180/255 5/255])


subplot('position',[0.66 0.55 0.25 0.4]); hold on
% plot SECOND LAST lap of entire trial
title('Second Last Lap')
plot(Lono.C.dolphin(511:568,2), Lono.shift_C.dolphin(511:568,3),'o',...
    'MarkerSize',5,'markerfacecolor',[0 108/255 193/255],'markeredgecolor',[0 108/255 193/255])
plot(Lono.C.boat(776:867,2),Lono.shift_C.boat(776:867,3),'color',[0 108/255 193/255])
plot(Lono.A.dolphin(928:1013,2), Lono.A.dolphin(928:1013,3),'^',...
    'MarkerSize',5,'markerfacecolor',[221/255 60/255 0],'markeredgecolor',[221/255 60/255 0])
plot(Lono.A.boat(1527:1684,2),Lono.A.boat(1527:1684,3),'color',[221/255 60/255 0])
plot(Lono.A2.dolphin(365:442,2),Lono.shift_A2.dolphin(365:442,3),'s',...
     'MarkerSize',5,'markerfacecolor',[97/255 180/255 5/255],'markeredgecolor',[97/255 180/255 5/255])
plot(Lono.A2.boat(768:849,2),Lono.shift_A2.boat(768:849,3),'color',[97/255 180/255 5/255])

adjustfigurefont

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('BoatTrackFig_3laps.eps','-depsc','-r300')

return 

% subplot of dolphin and boat tracks 1D in X
subplot('position',[0.32 0.68 0.3 0.22]); hold on; xlim([0 360]) % ylim([-6 15])
plot(Lono.C.dolphin(:,1),Lono.C.dolphin(:,2),'k.','MarkerSize',10)
plot(Lono.C.boat(:,1),Lono.C.boat(:,2),'k-','MarkerSize',10)

subplot('position',[0.32 0.39 0.3 0.22]); hold on; xlim([0 360]) % ylim([-6 15])
plot(Lono.A.dolphin(:,1)-abs(60.74-28.99),Lono.A.dolphin(:,2),'k.','MarkerSize',10)
plot(Lono.A.boat(:,1)-abs(60.74-28.99),Lono.A.boat(:,2),'k-','MarkerSize',10)

subplot('position',[0.32 0.1 0.3 0.22]); hold on; xlim([0 360]) % ylim([-6 15])
plot(Lono.A2.dolphin(:,1)-abs(72.17-28.99),Lono.A2.dolphin(:,2),'k.','MarkerSize',10)
plot(Lono.A2.boat(:,1)-abs(72.17-28.99),Lono.A2.boat(:,2),'k-','MarkerSize',10)

% subplot of dolphin and boat tracks 1D in Y
subplot('position',[0.65 0.68 0.3 0.22]); hold on; xlim([0 330]) % ylim([-6 15])
plot(Lono.C.dolphin(:,1),Lono.C.dolphin(:,3),'k.','MarkerSize',10)
plot(Lono.C.boat(:,1),Lono.C.boat(:,3),'k-','MarkerSize',10)

subplot('position',[0.65 0.39 0.3 0.22]); hold on; xlim([0 330]) % ylim([-6 15])
plot(Lono.A.dolphin(:,1)-abs(102.65-78.09),Lono.A.dolphin(:,3),'k.','MarkerSize',10)
plot(Lono.A.boat(:,1)-abs(102.65-78.09),Lono.A.boat(:,3),'k-','MarkerSize',10)

subplot('position',[0.65 0.1 0.3 0.22]); hold on; xlim([0 330]) % ylim([-6 15])
plot(Lono.A2.dolphin(:,1)-abs(120.42-78.09),Lono.A2.dolphin(:,3),'k.','MarkerSize',10)
plot(Lono.A2.boat(:,1)-abs(120.42-78.09),Lono.A2.boat(:,3),'k-','MarkerSize',10)
