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
hC = histogram(dC,[0:13],'FaceColor','k');
hA = histogram(dA,[0:13],'FaceColor',[5/255 113/255 222/255]);
hA2 = histogram(dA2,[0:13],'FaceColor',[26/255 150/255 65/255]);

figure(12)
bar(vertcat(hC.Values, hA.Values, hA2.Values)',1.1)
% set own colours
myC= [0 0 0
    5/255 113/255 222/255
    26/255 150/255 65/255];
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
xlabel('Lap Number'); ylabel('Relative Distance fom Boat')
legend('Control','Tag','Tag+4')
print('Lono_LapDist.eps','-depsc','-r300')

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
myC= [0 0 0
    5/255 113/255 222/255
    26/255 150/255 65/255];
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
