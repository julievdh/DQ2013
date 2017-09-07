% plots for talk 
warning off 

% load data: prh file from DQ
load('tt13_281aprh.mat')

% set time vector
t = ((1:length(p))/fs)/60;

% plot depth
figure(1); clf
set(gcf,'position',[311 351 1014 281],'paperpositionmode','auto')
plot(t,-p)
xlim([4 20]); set(gca,'xtick',5:20)
xlabel('Minutes'); ylabel('Depth (m)')
adjustfigurefont

% save
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print -dpng tt13_281depth

% plot A
figure(2); clf
set(gcf,'position',[311 351 1014 281],'paperpositionmode','auto')
plot(t,A)
xlim([4 20]); set(gca,'xtick',5:20)
xlabel('Minutes'); ylabel('Acceleration (g)')
adjustfigurefont

% save
print -dpng tt13_281A


% plot spectrogram

