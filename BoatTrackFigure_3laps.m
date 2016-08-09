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
plot(Nainoa.C.dolphin(49:80,2), Nainoa.C.dolphin(49:80,3),'ko',...
    'MarkerSize',5,'markerfacecolor','k')
plot(Nainoa.C.boat(89:165,2),Nainoa.C.boat(89:165,3),'k')

plot(Nainoa.A.dolphin(55:88,2),Nainoa.shift_A.dolphin(55:88,3),'^',...
    'MarkerSize',5,'markerfacecolor',[5/255 113/255 222/255],'markeredgecolor',[5/255 113/255 222/255])
plot(Nainoa.A.boat(135:208,2),Nainoa.shift_A.boat(135:208,3),'color',[5/255 113/255 222/255])

plot(Nainoa.A2.dolphin(43:94,2),Nainoa.shift_A2.dolphin(43:94,3),'d',...
    'MarkerSize',5,'markerfacecolor',[26/255 150/255 65/255],'markeredgecolor',[26/255 150/255 65/255])
plot(Nainoa.A2.boat(79:165,2),Nainoa.shift_A2.boat(79:165,3),'color',[26/255 150/255 65/255])

%%

subplot('position',[0.33 0.1 0.25 0.4]); hold on
% plot MIDDLE lap of entire trial
plot(Nainoa.C.dolphin(238:278,2), Nainoa.C.dolphin(238:278,3),'ko',...
    'MarkerSize',5,'markerfacecolor','k')
plot(Nainoa.C.boat(392:469,2),Nainoa.C.boat(392:469,3),'k')

plot(Nainoa.A.dolphin(235:284,2),Nainoa.shift_A.dolphin(235:284,3),'^',...
    'MarkerSize',5,'markerfacecolor',[5/255 113/255 222/255],'markeredgecolor',[5/255 113/255 222/255])
plot(Nainoa.A.boat(511:587,2),Nainoa.shift_A.boat(511:587,3),'color',[5/255 113/255 222/255])

plot(Nainoa.A2.dolphin(314:355,2),Nainoa.shift_A2.dolphin(314:355,3),'d',...
    'MarkerSize',5,'markerfacecolor',[26/255 150/255 65/255],'markeredgecolor',[26/255 150/255 65/255])
plot(Nainoa.A2.boat(410:493,2),Nainoa.shift_A2.boat(410:493,3),'color',[26/255 150/255 65/255])


subplot('position',[0.66 0.1 0.25 0.4]); hold on
% plot SECOND LAST lap of entire trial
plot(Nainoa.C.dolphin(386:431,2), Nainoa.C.dolphin(386:431,3),'ko',...
    'MarkerSize',5,'markerfacecolor','k')
plot(Nainoa.C.boat(707:789,2),Nainoa.C.boat(707:789,3),'k')

plot(Nainoa.A.dolphin(425:465,2),Nainoa.shift_A.dolphin(425:465,3),'^',...
    'MarkerSize',5,'markerfacecolor',[5/255 113/255 222/255],'markeredgecolor',[5/255 113/255 222/255])
plot(Nainoa.A.boat(819:895,2),Nainoa.shift_A.boat(819:895,3),'color',[5/255 113/255 222/255])

plot(Nainoa.A2.dolphin(470:525,2),Nainoa.shift_A2.dolphin(470:525,3),'d',...
    'MarkerSize',5,'markerfacecolor',[26/255 150/255 65/255],'markeredgecolor',[26/255 150/255 65/255])
plot(Nainoa.A2.boat(748:840,2),Nainoa.shift_A2.boat(748:840,3),'color',[26/255 150/255 65/255])


%% figure 2: Lono
%figure(2); clf; set(gcf,'position',[2 240 1278 380])
% subplot of dolphin track 2D

subplot('position',[0.03 0.55 0.25 0.4]); hold on
% plot SECOND LAP of entire trial
title('Second Lap')
% Order of plotting is different than all others, to make legend (dolphins first, then boat)
plot(Lono.C.dolphin(59:124,2), Lono.shift_C.dolphin(59:124,3),'ko',...
    'MarkerSize',5,'markerfacecolor','k')
plot(Lono.A.dolphin(116:225,2), Lono.A.dolphin(116:225,3),'^',...
    'MarkerSize',5,'markerfacecolor',[5/255 113/255 222/255],'markeredgecolor',[5/255 113/255 222/255])
plot(Lono.A2.dolphin(82:170,2), Lono.shift_A2.dolphin(82:170,3),'d',...
    'MarkerSize',5,'markerfacecolor',[26/255 150/255 65/255],'markeredgecolor',[26/255 150/255 65/255])

plot(Lono.C.boat(77:180,2),Lono.shift_C.boat(77:180,3),'k')
plot(Lono.A.boat(154:305,2),Lono.A.boat(154:305,3),'color',[5/255 113/255 222/255])
plot(Lono.A2.boat(109:200,2),Lono.shift_A2.boat(109:200,3),'color',[26/255 150/255 65/255])

legend('C','T','T+4','Location','NW')

subplot('position',[0.33 0.55 0.25 0.4]); hold on
% plot MIDDLE lap of entire trial
title('Middle Lap')
plot(Lono.C.dolphin(301:359,2), Lono.shift_C.dolphin(301:359,3),'ko',...
    'MarkerSize',5,'markerfacecolor','k')
plot(Lono.C.boat(433:518,2),Lono.shift_C.boat(433:518,3),'k')
plot(Lono.A.dolphin(519:608,2), Lono.A.dolphin(519:608,3),'^',...
    'MarkerSize',5,'markerfacecolor',[5/255 113/255 222/255],'markeredgecolor',[5/255 113/255 222/255])
plot(Lono.A.boat(891:1048,2),Lono.A.boat(891:1048,3),'color',[5/255 113/255 222/255])
plot(Lono.A2.dolphin(365:442,2), Lono.shift_A2.dolphin(365:442,3),'d',...
     'MarkerSize',5,'markerfacecolor',[26/255 150/255 65/255],'markeredgecolor',[26/255 150/255 65/255])
plot(Lono.A2.boat(526:607,2),Lono.shift_A2.boat(526:607,3),'color',[26/255 150/255 65/255])


subplot('position',[0.66 0.55 0.25 0.4]); hold on
% plot SECOND LAST lap of entire trial
title('Second Last Lap')
plot(Lono.C.dolphin(511:568,2), Lono.shift_C.dolphin(511:568,3),'ko',...
    'MarkerSize',5,'markerfacecolor','k')
plot(Lono.C.boat(776:867,2),Lono.shift_C.boat(776:867,3),'k')
plot(Lono.A.dolphin(928:1013,2), Lono.A.dolphin(928:1013,3),'^',...
    'MarkerSize',5,'markerfacecolor',[5/255 113/255 222/255],'markeredgecolor',[5/255 113/255 222/255])
plot(Lono.A.boat(1527:1684,2),Lono.A.boat(1527:1684,3),'color',[5/255 113/255 222/255])
plot(Lono.A2.dolphin(365:442,2),Lono.shift_A2.dolphin(365:442,3),'d',...
     'MarkerSize',5,'markerfacecolor',[26/255 150/255 65/255],'markeredgecolor',[26/255 150/255 65/255])
plot(Lono.A2.boat(768:849,2),Lono.shift_A2.boat(768:849,3),'color',[26/255 150/255 65/255])

adjustfigurefont

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('BoatTrackFig_3laps.eps','-depsc','-r300')

%% boat track fig 1 lap Nainoa
figure(2); clf
subplot('position',[0.1 0.5 0.4 0.48]); hold on
% plot SECOND LAST lap of entire trial
plot(Nainoa.C.dolphin(386:431,2), Nainoa.C.dolphin(386:431,3),'ko',...
    'MarkerSize',8,'markerfacecolor','k')
plot(Nainoa.C.boat(707:789,2),Nainoa.C.boat(707:789,3),'k','LineWidth',2)

plot(Nainoa.A.dolphin(425:465,2),Nainoa.shift_A.dolphin(425:465,3),'^',...
    'MarkerSize',8,'markerfacecolor',[5/255 113/255 222/255],'markeredgecolor','k')
plot(Nainoa.A.boat(819:895,2),Nainoa.shift_A.boat(819:895,3),'color',[5/255 113/255 222/255],'LineWidth',2)

plot(Nainoa.A2.dolphin(470:525,2),Nainoa.shift_A2.dolphin(470:525,3),'d',...
    'MarkerSize',8,'markerfacecolor',[26/255 150/255 65/255],'markeredgecolor','k')
plot(Nainoa.A2.boat(748:840,2),Nainoa.shift_A2.boat(748:840,3),'color',[26/255 150/255 65/255],'LineWidth',2)

set(gca,'xtick',[-10 0 10 20],'ytick',[-5 0 5 10 15])
xlabel('X Frame Coordinate'); ylabel('Y Frame Coordinate')

%% add distance from boat
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013
C = load('Nainoa_285_C_Track');
A = load('Nainoa_284_A_Track');
A2 = load('Nainoa_287_A2_Track');

dC = boatDist(C.dolphin,C.boat);
dA = boatDist(A.dolphin,A.boat);
dA2 = boatDist(A2.dolphin,A2.boat);

% distances are absolute values
dC = abs(dC); dA = abs(dA); dA2 = abs(dA2);

% plot
figure(2)
subplot('position',[0.1 0.09 0.4 0.3])
myC= [0 0 0
    5/255 113/255 222/255
    26/255 150/255 65/255];
colormap(myC) % force colormap
bar(horzcat(dC,dA(2:end),dA2),'stacked')
xlabel('Lap Number'); ylabel('Relative Distance fom Boat')
xlim([0 12]); box off

adjustfigurefont
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('BoatTrackFig_1lap_Nainoa.eps','-depsc','-r300')
