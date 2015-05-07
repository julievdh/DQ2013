% Load in video data, determine distance between boat and dolphin
close all; clear all; warning off

% load data
 C = load('Lono_288_C_Track');
 A = load('Lono_285_A_Track');
 A2 = load('Lono_287_A2_Track');

dC = boatDist(C.dolphin,C.boat);
dA = boatDist(A.dolphin,A.boat);
dA2 = boatDist(A2.dolphin,A2.boat);

% figure(1); clf; hold on
% histogram(dC,[-2:16])
% histogram(dA,[-2:16])
% histogram(dA2,[-2:16])

figure(11); 
subplot(211)
bar(abs(horzcat(dC,dA(2:end),dA2)),'stacked')
ylabel('Distance from Boat')

%% Nainoa
clear all

C = load('Nainoa_285_C_Track');
A = load('Nainoa_284_A_Track');
A2 = load('Nainoa_287_A2_Track');

dC = boatDist(C.dolphin,C.boat);
dA = boatDist(A.dolphin,A.boat);
dA2 = boatDist(A2.dolphin,A2.boat);

% figure(2); clf; hold on
% histogram(dC,[-2:16])
% histogram(dA,[-2:16])
% histogram(dA2,[-2:16])

figure(11)
subplot(212)
bar(abs(horzcat(dC,dA(2:end),dA2)),'stacked')
ylim([0 15])
ylabel('Distance from Boat'); xlabel('Lap Number')
adjustfigurefont

print -dtiff BoatLapDistance