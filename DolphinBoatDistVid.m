% Load in video data, determine distance between boat and dolphin
clear all; warning off

% load data
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013
C = load('Lono_288_C_Track');
A = load('Lono_285_A_Track');
A2 = load('Lono_287_A2_Track');

dC = boatDist(C.dolphin,C.boat);
dA = boatDist(A.dolphin,A.boat);
dA2 = boatDist(A2.dolphin,A2.boat);

% distances are absolute values
dC = abs(dC); dA = abs(dA); dA2 = abs(dA2);

figure(2)
subplot('position',[0.58 0.08 0.4 0.35])
bar(abs(horzcat(dC,dA(2:end),dA2)),'stacked')
myC= [0 0 0
    5/255 113/255 222/255
    26/255 150/255 65/255];
colormap(myC) % force colourmap 
xlabel('Lap Number'); box off
xlim([0 12])

%% Nainoa
keep myC

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
subplot('position',[0.1 0.08 0.4 0.35])
colormap(myC) % force colormap
bar(horzcat(dC,dA(2:end),dA2),'stacked')
xlabel('Lap Number'); ylabel('Relative Distance fom Boat')
xlim([0 12]); ylim([0 14]); box off
legend('No Tag','Tag','Tag+4','Location','NW')
