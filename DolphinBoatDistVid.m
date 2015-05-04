% Load in video data, determine distance between boat and dolphin
close all; warning off

% load data
 C = load('Lono_288_C_Track');
 A = load('Lono_285_A_Track');
 A2 = load('Lono_287_A2_Track');
%C = load('Nainoa_285_C_Track');
%A = load('Nainoa_284_A_Track');
%A2 = load('Nainoa_287_A2_Track');

%%

dC = boatDist(C.dolphin,C.boat);
dA = boatDist(A.dolphin,A.boat);
dA2 = boatDist(A2.dolphin,A2.boat);

