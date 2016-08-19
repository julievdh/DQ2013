% Plots VO2 in resting and recovery for boat trials
% Pulls data from VO2 table, created by VO2estBoat and VO2est

close all

% mac path
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/Boat

% % pc path
% cd C:\Users\Julie\Documents\MATLAB\DQ2013\DQ2013\RespData\Boat

load('VO2_table_boat')
headers = {'Filename';'Condition';'Rest all';'Rest last 2 min';...
    'Recov all';'Recov min 1';'Recov 0-2 min';'Recov min 2';...
    'Recov 5 min';'Recov 3-5 min'};

warning off

% resting VO2 two methods
figure(1); clf; hold on
for i = 1:6
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,3}(1),VO2_table{i,3}(1)-VO2_table{i,3}(2),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = errorbar(2,VO2_table{i,3}(1),VO2_table{i,3}(1)-VO2_table{i,3}(2),'o');
        else
            h = errorbar(1,VO2_table{i,3}(1),VO2_table{i,3}(1)-VO2_table{i,3}(2),'o');
        end
    end
    if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255])
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k')
        end
    end
end
set(gca,'xtick',[0 1 2]); xlim([-1 3])

for i = 1:6
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0+rand(1)/5,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = errorbar(2+rand(1)/5,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
        else
            h = errorbar(1+rand(1)/5,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
        end
    end
    if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','k')
        end
    end
end
set(gca,'xtick',[0 1 2]); xlim([-1 3])
xlabel('Condition'); ylabel('VO_2 (L/min)')
title('Rest')
box on
set(gca,'xticklabels',{'Control','Tag','Tag+4'})
adjustfigurefont


%% plot recovery 5 methods
figure(2); clf
subplot(151); hold on
for i = 1:6
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,5}(1),VO2_table{i,5}(1)-VO2_table{i,5}(2),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = errorbar(2,VO2_table{i,5}(1),VO2_table{i,5}(1)-VO2_table{i,5}(2),'o');
        else
            h = errorbar(1,VO2_table{i,5}(1),VO2_table{i,5}(1)-VO2_table{i,5}(2),'o');
        end
    end
    if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','k')
        end
    end
end
set(gca,'xtick',[0 1 2],'xticklabels',{'C','Tag','Tag+4'}); xlim([-1 3])
title(headers{5}); ylabel('VO_2 (L/min)'); xlabel('Condition')

subplot(152); hold on
for i = 1:6
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = errorbar(2,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
        else
            h = errorbar(1,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
        end
    end
    if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','k')
        end
    end
end
set(gca,'xtick',[0 1 2],'xticklabels',{'C','Tag','Tag+4'}); xlim([-1 3])
title(headers{6}); xlabel('Condition')

subplot(153); hold on
for i = 1:6
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,7}(1),VO2_table{i,7}(1)-VO2_table{i,7}(2),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = errorbar(2,VO2_table{i,7}(1),VO2_table{i,7}(1)-VO2_table{i,7}(2),'o');
        else
            h = errorbar(1,VO2_table{i,7}(1),VO2_table{i,7}(1)-VO2_table{i,7}(2),'o');
        end
    end
    if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','k')
        end
    end
end
set(gca,'xtick',[0 1 2],'xticklabels',{'C','Tag','Tag+4'}); xlim([-1 3])
title(headers{7}); xlabel('Condition')

subplot(154); hold on
for i = 1:6
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,8}(1),VO2_table{i,8}(1)-VO2_table{i,8}(2),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = errorbar(2,VO2_table{i,8}(1),VO2_table{i,8}(1)-VO2_table{i,8}(2),'o');
        else
            h = errorbar(1,VO2_table{i,8}(1),VO2_table{i,8}(1)-VO2_table{i,8}(2),'o');
        end
    end
    if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','k')
        end
    end
end
set(gca,'xtick',[0 1 2],'xticklabels',{'C','Tag','Tag+4'}); xlim([-1 3])
title(headers{8}); xlabel('Condition')

set(gca,'xtick',[0 1 2],'xticklabels',{'C','Tag','Tag+4'}); xlim([-1 3])
xlabel('Condition')
title(headers{10})
adjustfigurefont

%%

% plot Lono
figure(3);
subplot(211); hold on
for i = 1:3
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = errorbar(2,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
        else
            h = errorbar(1,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
        end
    end
    set(h,'color','r')
end
for i = 1:3
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = errorbar(2,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
        else
            h = errorbar(1,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
        end
    end
    set(h,'color','k')
end

set(gca,'xtick',[0 1 2]); xlim([-1 3])
xlabel('Condition'); ylabel('VO_2 L/min')
title('Lono')


subplot(212); hold on
for i = 4:6
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = errorbar(2,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
        else
            h = errorbar(1,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
        end
    end
    set(h,'color','r')
end
for i = 4:6
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = errorbar(2,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
        else
            h = errorbar(1,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
        end
    end
    set(h,'color','k')
end

set(gca,'xtick',[0 1 2]); xlim([-1 3])
xlabel('Condition'); ylabel('VO_2 L/min')
title('Nainoa')

%% Rest (last 2 min) and Recovery (first min) for each condition 

figure(5); clf
subplot('position',[0.1 0.55 0.4 0.4]); hold on

% control
h = errorbar(0,VO2_table{3,4}(1),VO2_table{3,4}(1)-VO2_table{3,4}(2),'ko','MarkerFaceColor','k');
h = errorbar(1,VO2_table{3,6}(1),VO2_table{3,6}(1)-VO2_table{3,6}(2),'ko','MarkerFaceColor','k');
plot([0 1],[VO2_table{3,4}(1) VO2_table{3,6}(1)],'k')

% Tag
h = errorbar(0,VO2_table{1,4}(1),VO2_table{1,4}(1)-VO2_table{1,4}(2),'^','color',[5/255 113/255 222/255],'MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor',[5/255 113/255 222/255]);
h = errorbar(1,VO2_table{1,6}(1),VO2_table{1,6}(1)-VO2_table{1,6}(2),'^','color',[5/255 113/255 222/255],'MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor',[5/255 113/255 222/255]);
plot([0 1],[VO2_table{1,4}(1) VO2_table{1,6}(1)],'--','color',[5/255 113/255 222/255])

% Tag + 4
h = errorbar(0,VO2_table{2,4}(1),VO2_table{2,4}(1)-VO2_table{2,4}(2),'d','color',[26/255 150/255 65/255],'MarkerEdgecolor',[26/255 150/255 65/255],'MarkerFaceColor',[26/255 150/255 65/255]);
h = errorbar(1,VO2_table{2,6}(1),VO2_table{2,6}(1)-VO2_table{2,6}(2),'d','color',[26/255 150/255 65/255],'MarkerEdgecolor',[26/255 150/255 65/255],'MarkerFaceColor',[26/255 150/255 65/255]);
plot([0 1],[VO2_table{2,4}(1) VO2_table{2,6}(1)],':','color',[26/255 150/255 65/255])

set(gca,'xtick',[0 1],'xticklabels',{'Before','After'}); xlim([-0.5 1.5])
set(gca,'ytick',[0:0.5:3],'yticklabels',{'0','0.5','1.0','1.5','2.0','2.5','3.0'})
ylabel('VO_2 (L/min)')
text(-0.4,2.7,'9FL3','FontSize',18,'FontWeight','Bold')

subplot('position',[0.1 0.075 0.4 0.4]); hold on
% control
h = errorbar(0,VO2_table{5,4}(1),VO2_table{5,4}(1)-VO2_table{5,4}(2),'ko','MarkerFaceColor','k');
h = errorbar(1,VO2_table{5,6}(1),VO2_table{5,6}(1)-VO2_table{5,6}(2),'ko','MarkerFaceColor','k');
plot([0 1],[VO2_table{5,4}(1) VO2_table{5,6}(1)],'k')

% Tag
h = errorbar(0,VO2_table{4,4}(1),VO2_table{4,4}(1)-VO2_table{4,4}(2),'^','color',[5/255 113/255 222/255],'MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor',[5/255 113/255 222/255]);
h = errorbar(1,VO2_table{4,6}(1),VO2_table{4,6}(1)-VO2_table{4,6}(2),'^','color',[5/255 113/255 222/255],'MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor',[5/255 113/255 222/255]);
plot([0 1],[VO2_table{4,4}(1) VO2_table{4,6}(1)],'--','color',[5/255 113/255 222/255])

% Tag + 4
h = errorbar(0,VO2_table{6,4}(1),VO2_table{6,4}(1)-VO2_table{6,4}(2),'d','color',[26/255 150/255 65/255],'MarkerEdgecolor',[26/255 150/255 65/255],'MarkerFaceColor',[26/255 150/255 65/255]);
h = errorbar(1,VO2_table{6,6}(1),VO2_table{6,6}(1)-VO2_table{6,6}(2),'d','color',[26/255 150/255 65/255],'MarkerEdgecolor',[26/255 150/255 65/255],'MarkerFaceColor',[26/255 150/255 65/255]);
plot([0 1],[VO2_table{6,4}(1) VO2_table{6,6}(1)],':','color',[26/255 150/255 65/255])

set(gca,'xtick',[0 1],'xticklabels',{'Before','After'}); xlim([-0.5 1.5]); ylim([0 3])
set(gca,'ytick',[0:0.5:3],'yticklabels',{'0','0.5','1.0','1.5','2.0','2.5','3.0'})
ylabel('VO_2 (L/min)')
text(-0.4,2.7,'9ON6','FontSize',18,'FontWeight','Bold')

%% percent increase in VO2
% tag after VO2 compared to control after VO2
% (VO2_table{1,6}(1)-VO2_table{3,6}(1))/VO2_table{3,6}(1) % Lono
% (VO2_table{4,6}(1)- VO2_table{5,6}(1))/VO2_table{5,6}(1) % Nainoa

%% PAR: Calculated based on first minute post, and last 2 min pre.

% plot Lono
subplot('position',[0.6 0.55 0.4 0.4]); hold on
for i = 1:3
    if strfind(VO2_table{i,2},'C')
        h = plot(0,VO2_table{i,6}(1)/VO2_table{i,4}(1),'ko','MarkerFaceColor','k');
    else if strfind(VO2_table{i,2},'A2')
            h = plot(2,VO2_table{i,6}(1)/VO2_table{i,4}(1),'d','MarkerEdgecolor',[26/255 150/255 65/255],'MarkerFaceColor',[26/255 150/255 65/255]);
        else
            h = plot(1,VO2_table{i,6}(1)/VO2_table{i,4}(1),'^','MarkerEdgeColor',[5/255 113/255 222/255],'MarkerFaceColor',[5/255 113/255 222/255]);
        end
    end
end

set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag + 4'}); xlim([-1 3])
set(gca,'ytick',[0:0.5:4],'yticklabels',{'0','0.5','1.0','1.5','2.0','2.5','3.0','3.5','4.0'})
xlabel('Condition'); ylabel('Physical Activity Ratio')
text(-0.75,3.65,'9FL3','FontSize',18,'FontWeight','Bold')


subplot('position',[0.6 0.075 0.4 0.4]); hold on
for i = 4:6
    if strfind(VO2_table{i,2},'C')
        h = plot(0,VO2_table{i,6}(1)/VO2_table{i,4}(1),'ko','MarkerFaceColor','k');
    else if strfind(VO2_table{i,2},'A2')
            h = plot(2,VO2_table{i,6}(1)/VO2_table{i,4}(1),'d','MarkerEdgecolor',[26/255 150/255 65/255],'MarkerFaceColor',[26/255 150/255 65/255]);
        else
            h = plot(1,VO2_table{i,6}(1)/VO2_table{i,4}(1),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor',[5/255 113/255 222/255]);
        end
    end
    set(h,'color','k')
end

set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag + 4'}); xlim([-1 3]);  ylim([1 2])
set(gca,'ytick',[1 1.2 1.4 1.6 1.8 2],'yticklabels',{'1.0','1.2','1.4','1.6','1.8','2.0'})
xlabel('Condition'); ylabel('Physical Activity Ratio')
text(-0.75,1.9,'9ON6','FontSize',18,'FontWeight','Bold')

adjustfigurefont

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print -depsc BoatVO2.eps
print -dtiff BoatVO2

LonoPARTag = VO2_table{1,6}(1)/VO2_table{1,4}(1);
LonoPARC = VO2_table{3,6}(1)/VO2_table{3,4}(1);
LonoPARTag4 = VO2_table{2,6}(1)/VO2_table{2,4}(1);

NainoaPARTag = VO2_table{4,6}(1)/VO2_table{4,4}(1);
NainoaPARC = VO2_table{5,6}(1)/VO2_table{5,4}(1);
NainoaPARTag4 = VO2_table{6,6}(1)/VO2_table{6,4}(1);