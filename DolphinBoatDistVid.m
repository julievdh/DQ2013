% Load in video data, determine distance between boat and dolphin
close all; clear all; warning off

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

% plot distance between boat and dolphin 
figure(1); clf; hold on
hC = histogram(dC,[0:13],'FaceColor',[0 108/255 193/255]);
hA = histogram(dA,[0:13],'FaceColor',[221/255 60/255 0]);
hA2 = histogram(dA2,[0:13],'FaceColor',[97/255 180/255 5/255]);

figure(12)
bar(vertcat(hC.Values, hA.Values, hA2.Values)',1.1)
% set own colours
myC= [0 108/255 193/255
    221/255 60/255 0
    97/255 180/255 5/255];
colormap(myC) % force colormap
xlabel('Relative Distance from Boat'); ylabel('Number of Laps')
legend('Control','Tag','Tag+4')
adjustfigurefont

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Lono_AllDist.eps','-depsc','-r300')

figure(11);
bar(horzcat(dC,dA(2:end),dA2),'stacked')
colormap(myC) % force colourmap 
adjustfigurefont
xlabel('Lap Number'); ; ylabel('Relative Distance fom Boat')
legend('Control','Tag','Tag+4')
print('Lono_LapDist.eps','-depsc','-r300')

%% Nainoa
clear all

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013
C = load('Nainoa_285_C_Track');
A = load('Nainoa_284_A_Track');
A2 = load('Nainoa_287_A2_Track');

dC = boatDist(C.dolphin,C.boat);
dA = boatDist(A.dolphin,A.boat);
dA2 = boatDist(A2.dolphin,A2.boat);

% distances are absolute values
dC = abs(dC); dA = abs(dA); dA2 = abs(dA2);

% plot distance between boat and dolphin 
figure(2); clf; hold on
hC = histogram(dC,[0:13]);
hA = histogram(dA,[0:13]);
hA2 = histogram(dA2,[0:13]);

figure(22)
bar(vertcat(hC.Values, hA.Values, hA2.Values)',1.1)
% set own colours
myC= [0 108/255 193/255
    221/255 60/255 0
    97/255 180/255 5/255];
colormap(myC) % force colormap
xlabel('Relative Distance from Boat'); ylabel('Number of Laps')
legend('Control','Tag','Tag+4')
adjustfigurefont

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Nainoa_AllDist.eps','-depsc','-r300')

figure(21);
bar(horzcat(dC,dA(2:end),dA2),'stacked')
colormap(myC)
xlabel('Lap Number'); ylabel('Relative Distance fom Boat')
legend('Control','Tag','Tag+4')
print('Nainoa_LapDist.eps','-depsc','-r300')