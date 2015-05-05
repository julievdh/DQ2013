% Load in video data, determine distance between boat and dolphin
close all; clear all; warning off

% load data
 C = load('Lono_288_C_Track');
 A = load('Lono_285_A_Track');
 A2 = load('Lono_287_A2_Track');

dC = boatDist(C.dolphin,C.boat);
dA = boatDist(A.dolphin,A.boat);
dA2 = boatDist(A2.dolphin,A2.boat);

figure(1); clf; hold on
histogram(dC,[-2:16])
histogram(dA,[-2:16])
histogram(dA2,[-2:16])

figure(11); 
bar(horzcat(dC,dA(2:end),dA2),'stacked')

%% Nainoa
clear all

C = load('Nainoa_285_C_Track');
A = load('Nainoa_284_A_Track');
A2 = load('Nainoa_287_A2_Track');

dC = boatDist(C.dolphin,C.boat);
dA = boatDist(A.dolphin,A.boat);
dA2 = boatDist(A2.dolphin,A2.boat);

figure(2); clf; hold on
histogram(dC,[-2:16])
histogram(dA,[-2:16])
histogram(dA2,[-2:16])

figure(21); 
bar(horzcat(dC,dA(2:end),dA2),'stacked')
