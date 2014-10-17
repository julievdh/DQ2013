% Import UWC glide .csv 
cd /Users/julievanderhoop/Documents/P6_NOPPTagDrag/DolphinQuest2013/Glides
UWC_A = importdata('UWC_Liho_290_2a.csv',',',2);

Cfluke = UWC_A.data(:,21:25);
CZO1 = UWC_A.data(:,26:30);
CZO2 = UWC_A.data(:,31:35);

% set cutoff point for fluke
ii = find(Cfluke(:,5) < 785); % frame from visual
Cfluke = Cfluke(ii,:);

% calculate distance between ZO1 and ZO2 points
% from first shared to last shared points

for i = max([CZO1(1,5) CZO2(1,5)]):min([max(CZO1(~isnan(CZO1(:,5)),5)) max(CZO2(~isnan(CZO1(:,5)),5))])
    % CALCULATE DISTANCE
    
    