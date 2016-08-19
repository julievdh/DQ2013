clear all; close all

% Take things from VO2 table and plot

% mac path
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/

% pc path
% cd C:\Users\Julie\Documents\MATLAB\DQ2013\DQ2013\RespData
load('VO2_table')
headers = {'Filename';'Condition';'Rest all';'Rest last 2 min';...
    'Recov all';'Recov min 1';'Recov 0-2 min';'Recov min 2';...
    'Recov 5 min';'Recov 3-5 min'};

% resting VO2 last two minute
figure(1); clf
subplot(211); hold on
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

%% plot recovery first minute
subplot(212); hold on
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o');
    else if strfind(VO2_table{i,2},'A4')
            h = errorbar(2,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'s');
        else
            h = errorbar(1,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'^');
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
            h = errorbar(2,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'s');
            Cond(i) = 5;
        else
            h = errorbar(1,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'^');
            Cond(i) = 1;
        end
    end
    set(h,'color','r')
    
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
    else if strfind(VO2_table{i,2},'A4')
            h = errorbar(2,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'s');
        else
            h = errorbar(1,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'^');
        end
    end
    set(h,'color','k')
end

adjustfigurefont

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('SelfSelect_RestRecov','-depsc','-r300')

%%
figure(5); clf
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,1},'Lono')
        subplot(221); title('Lono'); hold on; xlim([-0.5 1.5])
        ylabel('VO_2 L/min')
        Ind(i) = 1;
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot(222); title('Kolohe'); hold on; xlim([-0.5 1.5])
        Ind(i) = 2;
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot(223); title('Liko'); hold on; xlim([-0.5 1.5])
        xlabel('Condition'); ylabel('VO_2 L/min')
        Ind(i) = 3;
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot(224); title('Nainoa'); hold on; xlim([-0.5 1.5])
        xlabel('Condition')
        Ind(i) = 4;
    end
    
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'ko');
        h = errorbar(1,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'ko');
        plot([0 1],[VO2_table{i,4}(1) VO2_table{i,6}(1)],'k')
        
    else if strfind(VO2_table{i,2},'A4')
            h = errorbar(0,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'k^');
            h = errorbar(1,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'k^');
            plot([0 1],[VO2_table{i,4}(1) VO2_table{i,6}(1)],'k--')
            
        else
            h = errorbar(0,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'ks');
            h = errorbar(1,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'ks');
            plot([0 1],[VO2_table{i,4}(1) VO2_table{i,6}(1)],'k:')
        end
    end
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
            h = plot(2,PAR(i),'s');
        else
            h = plot(1,PAR(i),'^');
        end
    end
    set(h,'color','k')
    set(gca,'xtick',[0 1 2],'ylim',[0 25])
end

adjustfigurefont
print('SelfSelect_PAR','-depsc','-r300')


fname = 'SelectSpeedPAR';
print(fname,'-dtiff','-r300')

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
        for j = 3:9
            VO2kg_table{i,j} = VO2_table{i,j}/199.77;
        end
    end
    if strfind(VO2_table{i,1},'Liko')
        for j = 3:9
            VO2kg_table{i,j} = VO2_table{i,j}/166.62;
        end
    end
    if strfind(VO2_table{i,1},'Nainoa')
        for j = 3:9
            VO2kg_table{i,j} = VO2_table{i,j}/171.0;
            for j = 3:9
                VO2kg_table{i,j} = VO2_table{i,j}/199.77;
            end
        end
        if strfind(VO2_table{i,1},'Liko')
            for j = 3:9
                VO2kg_table{i,j} = VO2_table{i,j}/166.62;
            end
        end
        if strfind(VO2_table{i,1},'Nainoa')
            for j = 3:9
                VO2kg_table{i,j} = VO2_table{i,j}/171.0;
            end
        end
    end
end

%%
figure(5); clf; hold on
for i = 1:length(VO2kg_table)
    if strfind(VO2_table{i,2},'C')
        h = errorbar(0+rand/10,VO2kg_table{i,7}(1),VO2kg_table{i,7}(1)-VO2kg_table{i,7}(2),'o');
    else if strfind(VO2_table{i,2},'A4')
            h = errorbar(2+rand/10,VO2kg_table{i,7}(1),VO2kg_table{i,7}(1)-VO2kg_table{i,7}(2),'o');
        else
            h = errorbar(1+rand/10,VO2kg_table{i,7}(1),VO2kg_table{i,7}(1)-VO2kg_table{i,7}(2),'o');
            h = errorbar(2,VO2kg_table{i,7}(1),VO2kg_table{i,7}(1)-VO2kg_table{i,7}(2),'o');
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

adjustfigurefont
print('SelfSelect_VO2kg.eps','-depsc','-r300')

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

[p,t,stats] = anovan(VO2_2min_recovkg,{Ind,Cond},'varnames',{'Individual','Condition'});
[p,t,stats] = anovan(VO2_2min_recov,{Ind,Cond},'varnames',{'Individual','Condition'});
[p,t,stats] = anovan(PAR,{Ind,Cond});


%% figure: VO2 L/min and VO2 L/kg/min 
warning off
figure(6); clf; hold on
set(gcf,'position',[427 289 500 384],'paperpositionmode','auto')
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,1},'Lono')
        a1 = axes('Color','w','XColor','k','YColor',[123/255 50/255 148/255],...
          'Ylim',[1.05 3.75],'Xlim',[-0.5 2.5],'NextPlot','add','position',[0.15 0.55 0.4 0.4]);
        a2 = axes('Color','none','XColor','k','YColor',[0/255 136/255 55/255],...
          'Xlim',[-0.5 2.5],...
          'XTick',[],'XTickLabel',[],...
          'Ylim',[0 16],...
          'Yaxislocation','right','NextPlot','add',...
          'position',[0.15 0.55 0.4 0.4]);
        text(-0.4,15,'Lono','FontSize',18)
        ylabel(a1,'VO_2 L/min','FontSize',12)
        ylabel(a2,'VO_2 L/kg/min','FontSize',12); % ylim([3 16])
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'},'ytick',[4,10,16],'FontSize',16)
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot('position',[0.6 0.55 0.4 0.4]); 
        text(-0.4,15,'Kolohe','FontSize',18)
        hold on; xlim([-0.5 2.5]); % ylim([3 16])
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'},'ytick',[4,10,16],'FontSize',16)
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot('position',[0.15 0.1 0.4 0.4]); 
        text(-0.4,15,'Liko','FontSize',18)
        hold on; xlim([-0.5 2.5]); % ylim([3 16])
        xlabel('Condition','FontSize',16); ylabel('VO_2 mL/kg/min','FontSize',16)
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'},'ytick',[4,10,16],'FontSize',16)
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot('position',[0.6 0.1 0.4 0.4]); 
        text(-0.4,15,'Nainoa','FontSize',18)
        hold on; xlim([-0.5 2.5]); % ylim([3 16])
        xlabel('Condition','FontSize',16)
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'},'ytick',[4,10,16],'FontSize',16)
    end
    if strfind(VO2_table{i,2},'C')
        h = plot(a1,0,VO2_2min_recov(i),'ko','markerfacecolor','k','MarkerSIze',8);
        h = plot(a2,0,VO2_2min_recovkg(i)*1000,'ko','markerfacecolor','k');
    else if strfind(VO2_table{i,2},'A4')
            h = plot(a1,2,VO2_2min_recov(i),'s','markerfacecolor',[202/255 0 32/255],'markeredgecolor','k','MarkerSIze',8);
        else
            h = plot(a1,1,VO2_2min_recov(i),'^','markerfacecolor',[5/255 113/255 222/255],'markeredgecolor','k','MarkerSIze',8);
        end
    end
end

% adjustfigurefont
% print('SelfSelect_VO2kg_2.eps','-depsc','-r300')


