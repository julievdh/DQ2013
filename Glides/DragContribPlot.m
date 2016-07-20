% Acceptable Tag Sizes
% 20 July 2016

% load data
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/Glides
load('DolphinTagSims_24Feb16')
load('GlideStructure')

% make data structure for plotting
data = [];
data(1) = notag(1); data(5) = tag(1); data(9) = tag4(1); % dolphin estimates at 1 m/s
data(2,5) = tag(1,2); % tag effect
data(2,9) = tag4(1,2); % tag+4 effect


% calculate drag forces from Cd estimates from other methods
Cd_mn = [0.033 0.042 0.057 0.103]; % drag coefficients of each condition
CDAS = [0.025 0.030 0.052 0.095]; % drag coefficients of each condition
Aw = [2.29 2.314 2.356 2.398]; % wetted areas for each condition: 2.29 m^s is average animal Aw
F_Cd_mn = 0.5*1021.*Aw.*Cd_mn*(1^2);
F_CDAS = 0.5*1021.*Aw.*CDAS*(1^2);

% add these values to the data table
data(1,2) = F_Cd_mn(1); data(1,3) = F_CDAS(1);
data(1,6) = F_Cd_mn(1); data(2,6) = F_Cd_mn(2)-F_Cd_mn(1);
data(1,7) = F_CDAS(1); data(2,7) = F_CDAS(2)-F_CDAS(1);
data(1,10) = F_Cd_mn(1); data(2,10) = F_Cd_mn(3)-F_Cd_mn(1);
data(1,11) = F_CDAS(1); data(2,11) = F_CDAS(3)-F_CDAS(1);
data(1,14) = F_Cd_mn(1); data(2,14) = F_Cd_mn(4)-F_Cd_mn(1);
data(1,15) = F_CDAS(1); data(2,15) = F_CDAS(4)-F_CDAS(1);

bar(data','stacked')
ylabel('Drag Force (N) at 1 m/s')

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('TagDragContrib','-dsvg','-r300')

%% calculate increase in contribution
contrib = data(2,:)./data(1,:);
