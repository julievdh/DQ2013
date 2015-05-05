clear all; close all

% Take things from VO2 table and plot

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/
load('VO2_table')
headers = {'Filename';'Condition';'Rest all';'Rest last 2 min';...
    'Recov all';'Recov min 1';'Recov 0-2 min';'Recov min 2';...
    'Recov 5 min';'Recov 3-5 min'};

% resting VO2 two methods
figure(1); clf
subplot(211); hold on
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,3}(1),VO2_table{i,3}(1)-VO2_table{i,3}(2),'o');
    else if strfind(VO2_table{i,2},'A4')
            h = errorbar(2,VO2_table{i,3}(1),VO2_table{i,3}(1)-VO2_table{i,3}(2),'o');
        else
            h = errorbar(1,VO2_table{i,3}(1),VO2_table{i,3}(1)-VO2_table{i,3}(2),'o');
        end
    end
    if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','auto')
        else if strfind(VO2_table{i,1},'Kolohe')
                set(h,'color','b','MarkerFaceColor','auto')
            else
                set(h,'color','r','MarkerFaceColor','auto')
            end
        end
    end
end
set(gca,'xtick',[0 1 2]); xlim([-1 3])
title(headers{3}); ylabel('VO_2 L/min')
%%
subplot(212); hold on
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o-');
    else if strfind(VO2_table{i,2},'A4')
           h = errorbar(2,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o-');
        else
            h =errorbar(1,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o-');
        end
    end
    if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','auto')
        else if strfind(VO2_table{i,1},'Kolohe')
                set(h,'color','b','MarkerFaceColor','auto')
            else
                set(h,'color','r','MarkerFaceColor','auto')
            end
        end
    end
end
set(gca,'xtick',[0 1 2]); xlim([-1 3])
xlabel('Condition'); ylabel('VO_2 L/min')
title(headers{4})

%% plot recovery 3 methods
figure(2); clf
subplot(131); hold on
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,5}(1),VO2_table{i,5}(1)-VO2_table{i,5}(2),'o');
    else if strfind(VO2_table{i,2},'A4')
           h = errorbar(2,VO2_table{i,5}(1),VO2_table{i,5}(1)-VO2_table{i,5}(2),'o');
        else
           h = errorbar(1,VO2_table{i,5}(1),VO2_table{i,5}(1)-VO2_table{i,5}(2),'o');
        end
    end
        if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','auto')
        else if strfind(VO2_table{i,1},'Kolohe')
                set(h,'color','b','MarkerFaceColor','auto')
            else
                set(h,'color','r','MarkerFaceColor','auto')
            end
        end
    end
end
set(gca,'xtick',[0 1 2]); xlim([-1 3])
title(headers{5}); ylabel('VO_2 L/min')

subplot(132); hold on
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
    else if strfind(VO2_table{i,2},'A4')
            h = errorbar(2,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
        else
            h = errorbar(1,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
        end
    end
        if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','auto')
        else if strfind(VO2_table{i,1},'Kolohe')
                set(h,'color','b','MarkerFaceColor','auto')
            else
                set(h,'color','r','MarkerFaceColor','auto')
            end
        end
    end
end
set(gca,'xtick',[0 1 2]); xlim([-1 3])
title(headers{6}); ylabel('VO_2 L/min')

subplot(133); hold on
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,7}(1),VO2_table{i,7}(1)-VO2_table{i,7}(2),'o');
    else if strfind(VO2_table{i,2},'A4')
           h = errorbar(2,VO2_table{i,7}(1),VO2_table{i,7}(1)-VO2_table{i,7}(2),'o');
        else
           h = errorbar(1,VO2_table{i,7}(1),VO2_table{i,7}(1)-VO2_table{i,7}(2),'o');
        end
    end
        if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','auto')
        else if strfind(VO2_table{i,1},'Kolohe')
                set(h,'color','b','MarkerFaceColor','auto')
            else
                set(h,'color','r','MarkerFaceColor','auto')
            end
        end
    end
end
set(gca,'xtick',[0 1 2]); xlim([-1 3])
xlabel('Condition')
title(headers{7}); ylabel('VO_2 L/min')


%%
% plot all animals VO2 rest and recovery
figure(3);

for i = 1:length(VO2_table)
    if strfind(VO2_table{i,1},'Lono')
        subplot(221); title('Lono'); hold on; xlim([-0.5 2.5])
        ylabel('VO_2 L/min')
        Ind(i) = 1;
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot(222); title('Kolohe'); hold on; xlim([-0.5 2.5])
        Ind(i) = 2;
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot(223); title('Liko'); hold on; xlim([-0.5 2.5])
        xlabel('Condition'); ylabel('VO_2 L/min')
        Ind(i) = 3;
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot(224); title('Nainoa'); hold on; xlim([-0.5 2.5])
        xlabel('Condition')
        Ind(i) = 4;
    end
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o-');
        Cond(i) = 0;
    else if strfind(VO2_table{i,2},'A4')
            h = errorbar(2,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
            Cond(i) = 5;
        else
            h = errorbar(1,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
            Cond(i) = 1;
        end
    end
    set(h,'color','r')
    
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
    else if strfind(VO2_table{i,2},'A4')
            h = errorbar(2,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
        else
            h = errorbar(1,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
        end
    end
    set(h,'color','k')
end

%%  Calculate PAR
for i = 1:length(VO2_table)
    PAR(i) = VO2_table{i,6}(1)/VO2_table{i,4}(1);
end
%% Plot PAR
figure(4); clf; hold on

for i = 1:length(VO2_table)
    if strfind(VO2_table{i,1},'Lono')
        subplot(221); title('Lono'); hold on; xlim([-0.5 2.5])
        ylabel('PAR')
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot(222); title('Kolohe'); hold on; xlim([-0.5 2.5])
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot(223); title('Liko'); hold on; xlim([-0.5 2.5])
        xlabel('Condition'); ylabel('PAR')
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot(224); title('Nainoa'); hold on; xlim([-0.5 2.5])
        xlabel('Condition')
    end
    if strfind(VO2_table{i,2},'C')
        h = plot(0,PAR(i),'o');
    else if strfind(VO2_table{i,2},'A4')
            h = plot(2,PAR(i),'o');
        else
            h = plot(1,PAR(i),'o');
        end
    end
    set(h,'color','k')
    
end


%% VO2/Kg

% create table with mass-specific metabolic rate
% weights from DQDolphinMorphs_September 2013.xls
% Lono = 240.25 kg, Kolohe = 197.77 kg, Liko = 166.62 kg, Nainoa = 171.0 kg

for i = 1:length(VO2_table)
    if strfind(VO2_table{i,1},'Lono')
        for j = 3:9
        VO2kg_table{i,j} = VO2_table{i,j}/240.25;
        end
    end
    if strfind(VO2_table{i,1},'Kolohe')
                for j = 3:10
        VO2kg_table{i,j} = VO2_table{i,j}/199.77;
        end
    end
    if strfind(VO2_table{i,1},'Liko')
              for j = 3:10
        VO2kg_table{i,j} = VO2_table{i,j}/166.62;
        end
    end
    if strfind(VO2_table{i,1},'Nainoa')
              for j = 3:10
        VO2kg_table{i,j} = VO2_table{i,j}/171.0;
        end
    end
end

figure; hold on
for i = 1:length(VO2kg_table)
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2kg_table{i,7}(1),VO2kg_table{i,7}(1)-VO2kg_table{i,7}(2),'o');
    else if strfind(VO2_table{i,2},'A4')
           h = errorbar(2,VO2kg_table{i,7}(1),VO2kg_table{i,7}(1)-VO2kg_table{i,7}(2),'o');
        else
           h = errorbar(1,VO2kg_table{i,7}(1),VO2kg_table{i,7}(1)-VO2kg_table{i,7}(2),'o');
        end
    end
        if strfind(VO2_table{i,1},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','auto')
        else if strfind(VO2_table{i,1},'Kolohe')
                set(h,'color','b','MarkerFaceColor','auto')
            else
                set(h,'color','r','MarkerFaceColor','auto')
            end
        end
    end
end


set(gca,'xtick',[0 1 2]); xlim([-1 3])
xlabel('Condition')
title(headers{7}); ylabel('VO_2 L/kg/min')


return

%% set up ANOVA
for i = 1:length(VO2_table)
    VO2_2min_rest(:,i) = VO2_table{i,4}(1);
    VO2_min1_recov(:,i) = VO2_table{i,6}(1);
    VO2_min2_recov(:,i) = VO2_table{i,8}(1);
    VO2_2min_recov(:,i) = VO2_table{i,7}(1);
    VO2_2min_recovkg(:,i) = VO2kg_table{i,7}(1);
    VO2_min1_recovkg(:,i) = VO2kg_table{i,6}(1);
    VO2_2min_restkg(:,i) = VO2kg_table{i,4}(1);
end

[p,t,stats] = anovan(VO2_2min_recovkg,{Ind,Cond});

