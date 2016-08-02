% Plot Kolohe13_269_C Oxygen for meethods example figure

% load data
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData
load('Kolohe13_269_C')

%% plot selected times
figure(1); clf; hold on
set(gcf,'position',[1631         390        1115         154]) 
plot(Interval(3720:79179),O2(3720:79179))
plot(Interval(170379:222379),O2(170379:222379))

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Kolohe13_269_C_raw','-dsvg','-r300')