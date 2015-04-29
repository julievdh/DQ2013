% import boat track data
% plot each animal's path 
% plot each animal's consistency with boat

clear all; close all; clc

% load saved boat tracks (from BoatTrackShift.m files)
load('NainoaBoatTrack')
load('LonoBoatTrack')

%% figure 1: Nainoa
figure(1); set(gcf,'position',[2 240 1278 380])
% subplot of dolphin track 2D
subplot('position',[0.03 0.1 0.25 0.8]); hold on
plot(Nainoa.C.dolphin(:,2), Nainoa.C.dolphin(:,3),'.','MarkerSize',10)
plot(Nainoa.A.dolphin(:,2), Nainoa.shift_A.dolphin(:,3),'.','MarkerSize',10)
plot(Nainoa.A2.dolphin(:,2), Nainoa.shift_A2.dolphin(:,3),'.','MarkerSize',10)
legend('C dolphin','A dolphin','A2 dolphin'); axis equal
title('Nainoa')

% subplot of dolphin and boat tracks 1D in X
subplot('position',[0.32 0.68 0.3 0.22]); hold on; xlim([0 330]) % ylim([-6 15])
plot(Nainoa.C.dolphin(:,1),Nainoa.C.dolphin(:,2),'k.','MarkerSize',10)
plot(Nainoa.C.boat(:,1),Nainoa.C.boat(:,2),'k-','MarkerSize',10)

subplot('position',[0.32 0.39 0.3 0.22]); hold on; xlim([0 330]) % ylim([-6 15])
plot(Nainoa.A.dolphin(:,1)-abs(25.18-70.9),Nainoa.A.dolphin(:,2),'k.','MarkerSize',10)
plot(Nainoa.A.boat(:,1)-abs(25.18-70.9),Nainoa.A.boat(:,2),'k-','MarkerSize',10)

subplot('position',[0.32 0.1 0.3 0.22]); hold on; xlim([0 330]) % ylim([-6 15])
plot(Nainoa.A2.dolphin(:,1)+abs(11.64-25.18),Nainoa.A2.dolphin(:,2),'k.','MarkerSize',10)
plot(Nainoa.A2.boat(:,1)+abs(11.64-25.18),Nainoa.A2.boat(:,2),'k-','MarkerSize',10)

% subplot of dolphin and boat tracks 1D in Y
subplot('position',[0.65 0.68 0.3 0.22]); hold on; xlim([0 330]) % ylim([-6 15])
plot(Nainoa.C.dolphin(:,1),Nainoa.C.dolphin(:,3),'k.','MarkerSize',10)
plot(Nainoa.C.boat(:,1),Nainoa.C.boat(:,3),'k-','MarkerSize',10)

subplot('position',[0.65 0.39 0.3 0.22]); hold on; xlim([0 330]) % ylim([-6 15])
plot(Nainoa.A.dolphin(:,1)-abs(65.4-20.53),Nainoa.shift_A.dolphin(:,3),'k.','MarkerSize',10)
plot(Nainoa.A.boat(:,1)-abs(65.4-20.53),Nainoa.A.boat(:,3),'k-','MarkerSize',10)

subplot('position',[0.65 0.1 0.3 0.22]); hold on; xlim([0 330]) % ylim([-6 15])
plot(Nainoa.A2.dolphin(:,1)+abs(20.53-8.25),Nainoa.shift_A2.dolphin(:,3),'k.','MarkerSize',10)
plot(Nainoa.A2.boat(:,1)+abs(20.53-8.25),Nainoa.A2.boat(:,3),'k-','MarkerSize',10)

%% figure 2: Lono
figure(2); clf; set(gcf,'position',[2 240 1278 380])
% subplot of dolphin track 2D
subplot('position',[0.03 0.1 0.25 0.8]); hold on
plot(Lono.C.dolphin(:,2), Lono.shift_C.dolphin(:,3),'.','MarkerSize',10)
plot(Lono.A.dolphin(:,2), Lono.A.dolphin(:,3),'.','MarkerSize',10)
plot(Lono.A2.dolphin(:,2), Lono.shift_A2.dolphin(:,3),'.','MarkerSize',10)
legend('C dolphin','A dolphin','A2 dolphin'); axis equal
title('Lono')

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
