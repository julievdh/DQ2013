% Plots VO2 in resting and recovery for boat trials
% Pulls data from VO2 table, created by VO2estBoat and VO2est

close all

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/Boat
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
set(gca,'xticklabels',{'Control','A','A+4'})
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
set(gca,'xtick',[0 1 2],'xticklabels',{'C','A','A+2'}); xlim([-1 3])
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
set(gca,'xtick',[0 1 2],'xticklabels',{'C','A','A+2'}); xlim([-1 3])
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
set(gca,'xtick',[0 1 2],'xticklabels',{'C','A','A+2'}); xlim([-1 3])
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
set(gca,'xtick',[0 1 2],'xticklabels',{'C','A','A+2'}); xlim([-1 3])
title(headers{8}); xlabel('Condition')


subplot(155); hold on
for i = 1:6
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,10}(1),VO2_table{i,10}(1)-VO2_table{i,10}(2),'o');
    else if strfind(VO2_table{i,2},'A2')
            h = errorbar(2,VO2_table{i,10}(1),VO2_table{i,10}(1)-VO2_table{i,10}(2),'o');
        else
            h = errorbar(1,VO2_table{i,10}(1),VO2_table{i,10}(1)-VO2_table{i,10}(2),'o');
        end
    end
    if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','k')
        end
    end
end
set(gca,'xtick',[0 1 2],'xticklabels',{'C','A','A+2'}); xlim([-1 3])
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

figure(5);
subplot(221); hold on

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

set(gca,'xtick',[0 1],'xticklabels',{'Before','After'}); xlim([-0.5 1.5])
ylabel('VO_2 L/min')
title('Lono')

subplot(223); hold on
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

set(gca,'xtick',[0 1],'xticklabels',{'Before','After'}); xlim([-0.5 1.5]); ylim([0 5])
ylabel('VO_2 L/min')
title('Nainoa')



%% PAR: Calculated based on first minute post, and last 2 min pre.

% plot Lono
subplot(222); hold on
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

set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag + 2'}); xlim([-1 3])
xlabel('Condition'); ylabel('Physical Activity Ratio')
title('Lono')


subplot(224); hold on
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

set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag + 2'}); xlim([-1 3]); ylim([2 6])
xlabel('Condition'); ylabel('Physical Activity Ratio')
title('Nainoa')

adjustfigurefont

print -depsc BoatVO2.eps