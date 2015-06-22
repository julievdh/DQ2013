% plot PAR vs. mean lap speed to determine whether there are patterns
% between speed and exertion

% load data
[AllTrials,txt] = xlsread('DQ13_MetabSwimSpeeds');

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/Boat
load('VO2_table_boat')
headers = {'Filename';'Condition';'Rest all';'Rest last 2 min';...
    'Recov all';'Recov min 1';'Recov 0-2 min';'Recov min 2';...
    'Recov 5 min';'Recov 3-5 min'};

% make speed list with same indices as VO2 table
speed = [nanmean(AllTrials(:,25)) % 285 A = 25
nanmean(AllTrials(:,28)) % 287 A2 = 28
nanmean(AllTrials(:,26)) % 288 C = 26
nanmean(AllTrials(:,23)) % 284 A = 23
nanmean(AllTrials(:,24)) % 285 C = 24
nanmean(AllTrials(:,27))]; % 287 A2 = 27

speed(:,2) = [nanstd(AllTrials(:,25)) % 285 A = 25
nanstd(AllTrials(:,28)) % 287 A2 = 28
nanstd(AllTrials(:,26)) % 288 C = 26
nanstd(AllTrials(:,23)) % 284 A = 23
nanstd(AllTrials(:,24)) % 285 C = 24
nanstd(AllTrials(:,27))]; % 287 A2 = 27

% plot
figure(10); clf; hold on
for i = 1:length(speed)
    if strfind(VO2_table{i,2},'A2') == 1
        errorbar(VO2_table{i,6}(1)/VO2_table{i,4}(1),speed(i,1),speed(i,2),'rs')
    else if strfind(VO2_table{i,2},'C')
            errorbar(VO2_table{i,6}(1)/VO2_table{i,4}(1),speed(i,1),speed(i,2),'ko')
        else
            errorbar(VO2_table{i,6}(1)/VO2_table{i,4}(1),speed(i,1),speed(i,2),'b^')
        end
    end
end
ylabel('Mean lap Duration (s)'); xlabel('PAR')

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print -dtiff PARvsMeanLapSpeed_boat


%% make VO2 figure with PAR and Swim Speed
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/Boat
load('VO2_table_boat')
headers = {'Filename';'Condition';'Rest all';'Rest last 2 min';...
    'Recov all';'Recov min 1';'Recov 0-2 min';'Recov min 2';...
    'Recov 5 min';'Recov 3-5 min'};

warning off

%% Rest (last 2 min) and Recovery (first min) for each condition 

figure(5); clf
subplot('position',[0.1 0.57 0.38 0.4]); hold on

% control
h = errorbar(0,VO2_table{3,4}(1),VO2_table{3,4}(1)-VO2_table{3,4}(2),'ko');
h = errorbar(1,VO2_table{3,6}(1),VO2_table{3,6}(1)-VO2_table{3,6}(2),'ko');
plot([0 1],[VO2_table{3,4}(1) VO2_table{3,6}(1)],'k')

% Tag
h = errorbar(0,VO2_table{1,4}(1),VO2_table{1,4}(1)-VO2_table{1,4}(2),'k^');
h = errorbar(1,VO2_table{1,6}(1),VO2_table{1,6}(1)-VO2_table{1,6}(2),'k^');
plot([0 1],[VO2_table{1,4}(1) VO2_table{1,6}(1)],'k--')

% Tag +2
h = errorbar(0,VO2_table{2,4}(1),VO2_table{2,4}(1)-VO2_table{2,4}(2),'ks');
h = errorbar(1,VO2_table{2,6}(1),VO2_table{2,6}(1)-VO2_table{2,6}(2),'ks');
plot([0 1],[VO2_table{2,4}(1) VO2_table{2,6}(1)],'k:')

set(gca,'xtick',[0 1],'xticklabels',{'Before','After'},...
    'ytick',[0:0.5:3],'yticklabels',{'0','0.5','1.0','1.5','2.0','2.5','3.0'})
xlim([-0.5 1.5])
ylabel('VO_2 L/min')
text(-0.37,2.75,'A: Lono','FontSize',14,'FontWeight','bold')

subplot('position',[0.1 0.07 0.38 0.4]); hold on
% control
h = errorbar(0,VO2_table{5,4}(1),VO2_table{5,4}(1)-VO2_table{5,4}(2),'ko');
h = errorbar(1,VO2_table{5,6}(1),VO2_table{5,6}(1)-VO2_table{5,6}(2),'ko');
plot([0 1],[VO2_table{5,4}(1) VO2_table{5,6}(1)],'k')

% Tag
h = errorbar(0,VO2_table{4,4}(1),VO2_table{4,4}(1)-VO2_table{4,4}(2),'k^');
h = errorbar(1,VO2_table{4,6}(1),VO2_table{4,6}(1)-VO2_table{4,6}(2),'k^');
plot([0 1],[VO2_table{4,4}(1) VO2_table{4,6}(1)],'k--')

% Tag +2
h = errorbar(0,VO2_table{6,4}(1),VO2_table{6,4}(1)-VO2_table{6,4}(2),'ks');
h = errorbar(1,VO2_table{6,6}(1),VO2_table{6,6}(1)-VO2_table{6,6}(2),'ks');
plot([0 1],[VO2_table{6,4}(1) VO2_table{6,6}(1)],'k:')

set(gca,'xtick',[0 1],'xticklabels',{'Before','After'},'ytick',[0:0.5:2],...
    'yticklabels',{'0','0.5','1.0','1.5','2.0'})
xlim([-0.5 1.5]); ylim([0 2])
ylabel('VO_2 L/min')
text(-0.37,1.85,'D: Nainoa','FontSize',14,'FontWeight','bold')

%% PAR: Calculated based on first minute post, and last 2 min pre.

% plot Lono
subplot('position',[0.55 0.57 0.38 0.2]); hold on
for i = 1:3
    if strfind(VO2_table{i,2},'C')
        h = plot(0,VO2_table{i,6}(1)/VO2_table{i,4}(1),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = plot(2,VO2_table{i,6}(1)/VO2_table{i,4}(1),'s');
        else
            h = plot(1,VO2_table{i,6}(1)/VO2_table{i,4}(1),'^');
        end
    end
    set(h,'color','k')
end

set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag + 4'}); 
xlim([-1 3]); ylim([0 4.5])
xlabel('Condition'); ylabel('PAR')
text(-0.8,3.6,'C','FontSize',14,'FontWeight','bold')

subplot('position',[0.55 0.07 0.38 0.2]); hold on
for i = 4:6
    if strfind(VO2_table{i,2},'C')
        h = plot(0,VO2_table{i,6}(1)/VO2_table{i,4}(1),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = plot(2,VO2_table{i,6}(1)/VO2_table{i,4}(1),'s');
        else
            h = plot(1,VO2_table{i,6}(1)/VO2_table{i,4}(1),'^');
        end
    end
    set(h,'color','k')
end

set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag + 4'},'ytick',[0 1 2]); xlim([-1 3]);  ylim([0 2])
xlabel('Condition'); ylabel('PAR')
text(-0.8,1.7,'F','FontSize',14,'FontWeight','bold')

% Plot Lono Lap Speeds
subplot('position',[0.55 0.77 0.38 0.2]); hold on
errorbar(2,speed(2,1),speed(2,2),'ks')
errorbar(0,speed(3,1),speed(3,2),'ko')
errorbar(1,speed(1,1),speed(1,2),'k^')
set(gca,'xtick',[0 1 2],'xticklabels',{'','',''}); xlim([-1 3]);
% set axis on right
ax = gca; ax.YAxisLocation = 'right';
ylabel('Lap Speed (sec)');
text(-0.8,28.95,'B','FontSize',14,'FontWeight','bold')

% plot Lap Speeds
subplot('position',[0.55 0.27 0.38 0.2]); hold on
errorbar(1,speed(4,1),speed(4,2),'k^')
errorbar(0,speed(5,1),speed(5,2),'ko')
errorbar(2,speed(6,1),speed(6,2),'ks')
set(gca,'xtick',[0 1 2],'xticklabels',{'','',''}); xlim([-1 3]);
% set axis on right
ax = gca; ax.YAxisLocation = 'right';
ylabel('Lap Speed (sec)')
text(-0.8,28.9,'E','FontSize',14,'FontWeight','bold')

adjustfigurefont

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print -dtiff BoatVO2_speed