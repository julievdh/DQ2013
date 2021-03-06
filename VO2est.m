clear all; close all

% for a file
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData
filename = 'Lono_281_A4';
load(filename);
%%
% plot corrected instantaneous VO2 for entire rest period
corrinstVO2 = pre(:,20).*pre(:,34);
corrinstVCO2 = pre(:,21).*pre(:,34);
corravVO2 = pre(:,22).*pre(:,34);
corravVCO2 = pre(:,23).*pre(:,34);

figure(1); clf; hold on; ylim([0 4])
plot(pre(:,12)/12000,corrinstVO2)
plot(pre(:,12)/12000,corravVO2)
legend('Instantaneous VO2','Running average VO2')
xlabel('Time (min)'); ylabel('Corrected VO_2 (L/min)')

% calculate VO2 averaged over entire rest period
VO2_pre = corravVO2(end); % time averaged instantaneous VO2 over entire pre- period
VO2_pre(2) = nanstd(corrinstVO2);

%% calculate VO2 for for last 2 min of rest period
% find last 2 min
pre_2min(2) = pre(end,12);
pre_2min(1) = pre_2min(2) - 2*12000;
% find between last 2 min
pre_ind = find(pre(:,12) > pre_2min(1));
% plot
plot([pre_2min(1)/12000 pre_2min(1)/12000],[0 4])
plot([pre(pre_ind(1),12)/12000 pre(pre_ind(1),12)/12000],[0 4])
%%
VO2_2min_pre(1) = mean(corrinstVO2(pre_ind));
VO2_2min_pre(2) = std(corrinstVO2(pre_ind));

h = errorbar(4,VO2_2min_pre(1),VO2_2min_pre(2),VO2_2min_pre(2),'^');
set(h,'color','k','MarkerFaceColor','auto')
h = errorbar(4.02,VO2_pre(1),VO2_pre(2),VO2_pre(2),'o');
set(h,'color','b','MarkerFaceColor','auto')
ylim([0 2.5]); box on; 
% text(0.3,2.25,regexprep(filename,'_',' '),'FontSize',14)

%% plot corrected VO2 for entire recovery period
clear corrinstVO2 corrinstVCO2 corravVO2 corravVCO2

corrinstVO2 = post(:,20).*post(:,34);
corrinstVCO2 = post(:,21).*post(:,34);
corravVO2 = post(:,22).*post(:,34);
corravVCO2 = post(:,23).*post(:,34);

figure(1); hold on; ylim([0 6])
plot(post(:,12)/12000,corrinstVO2,'.-')
plot(post(:,12)/12000,corravVO2)
xlabel('Time (min)'); ylabel('Corrected VO_2 (L/min)')

%% calculate VO2 for entire recovery period
VO2_post = corravVO2(end); % time averaged instantaneous VO2 for entire post period
VO2_post(2) = nanstd(corrinstVO2);

% calculate VO2 for first 2 min of recovery period
% find in first min
post_ind = find(post(:,12) <= 12000);
% plot
plot([1 1],[0 4],'--')
plot([post(post_ind(end),12)/12000 post(post_ind(end),12)/12000],[0 4])

%%
VO2_1min_post = mean(corrinstVO2(post_ind));
VO2_1min_post(2) = std(corrinstVO2(post_ind));

h = errorbar(0.5,VO2_1min_post(1),VO2_1min_post(2),VO2_1min_post(2),'^');
set(h,'color','k')

% find first 2 min
clear post_ind
post_ind = find(post(:,12) <= 2*12000);
% plot
plot([2 2],[0 4],'--')
plot([post(post_ind(end),12)/12000 post(post_ind(end),12)/12000],[0 4])

VO2_2min_post = mean(corrinstVO2(post_ind));
VO2_2min_post(2) = std(corrinstVO2(post_ind));

h = errorbar(1.5,VO2_2min_post(1),VO2_2min_post(2),VO2_2min_post(2),'o');
set(h,'color','b')

% calculate VO2 for second minute only
post_ind = find(post(:,12) <= 24000 & post(:,12) >= 12000);

VO2_min2_post = mean(corrinstVO2(post_ind));
VO2_min2_post(2) = std(corrinstVO2(post_ind));

h = errorbar(1.5,VO2_min2_post(1),VO2_min2_post(2),VO2_min2_post(2),'^');
set(h,'color','k')

% calculate VO2 for first 5 min of recovery period
% find first 5 min
post_5min(1) = post(1,12);
post_5min(2) = post_5min(1) + 5*12000;
% find between last 2 min
post_5ind = find(post(:,12) <= post_5min(2));
% plot
plot([post_5min(2)/12000 post_5min(2)/12000],[0 4],'--')
plot([post(post_5ind(end),12)/12000 post(post_5ind(end),12)/12000],[0 4],'--')

VO2_5min_post = mean(corrinstVO2(post_ind));
VO2_5min_post(2) = std(corrinstVO2(post_ind));

h = errorbar(5,VO2_5min_post(1),VO2_5min_post(2),VO2_5min_post(2),'o');
set(h,'color','b')

% % calculate VO2 for minutes 3-5 only
% post_ind = find(post(:,12) <= 60000 & post(:,12) >= 36000);
% 
% VO2_min35_post = mean(post(post_ind,20));
% VO2_min35_post(2) = std(post(post_ind,20));
% 
% h = errorbar(5,VO2_min35_post(1),VO2_min35_post(2),VO2_min35_post(2),'^');
% set(h,'color','k')


%% put into larger structure
% load VO2_table
load('VO2_table')
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,1},filename) == 1
        VO2_table{i,3} = VO2_pre;
        VO2_table{i,4} = VO2_2min_pre;
        VO2_table{i,5} = VO2_post;
        VO2_table{i,6} = VO2_1min_post;
        VO2_table{i,7} = VO2_2min_post;
        VO2_table{i,8} = VO2_min2_post;
        VO2_table{i,9} = VO2_5min_post;
%        VO2_table{i,10} = VO2_min35_post;
    end
end
%%

save('VO2_table','VO2_table')