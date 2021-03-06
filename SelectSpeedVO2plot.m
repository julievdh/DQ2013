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
figure(1); clf, hold on
% subplot(211); hold on
% for i = 1:length(VO2_table)
%     if strfind(VO2_table{i,2},'C')
%         h = errorbar(0,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o-');
%     else if strfind(VO2_table{i,2},'A4')
%             h = errorbar(2,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o-');
%         else
%             h =errorbar(1,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o-');
%         end
%     end
%     if strfind(VO2_table{i,1},'Nainoa')
%         set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor','auto')
%     else if strfind(VO2_table{i,1},'Lono')
%             set(h,'color','k','MarkerFaceColor','auto')
%         else if strfind(VO2_table{i,1},'Kolohe')
%                 set(h,'color','b','MarkerFaceColor','auto')
%             else
%                 set(h,'color','r','MarkerFaceColor','auto')
%             end
%         end
%     end
% end
% set(gca,'xtick',[0 1 2]); xlim([-1 3])
% xlabel('Condition'); ylabel('VO_2 L/min')
% title(headers{4})


% plot recovery first minute

for i = 1:length(VO2_table)
    jit = -.2 + (.2--.2).*rand;
    if strfind(VO2_table{i,2},'C')
        h = plot(0+jit,VO2_table{i,6}(1),'ko');
    else if strfind(VO2_table{i,2},'A4')
            h = plot(2+jit,VO2_table{i,6}(1),'ks');
        else
            h = plot(1+jit,VO2_table{i,6}(1),'k^');
        end
    end
    if strfind(VO2_table{i,1},'Nainoa')
        set(h,'MarkerFaceColor',[26/255 150/255 65/255],'MarkerSize',8)
    else if strfind(VO2_table{i,1},'Lono')
            set(h,'color','k','MarkerFaceColor','k','MarkerSize',8)
        else if strfind(VO2_table{i,1},'Kolohe')
                set(h,'MarkerFaceColor','b','MarkerSize',8)
            else
                set(h,'MarkerFaceColor','r','MarkerSize',8)
            end
        end
    end
end
set(gca,'xtick',[0 1 2]); xlim([-1 3]); box on
% title(headers{6}); 
ylabel('Post-exercise VO_2 (L min^{-1})')

set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag+8'})
ylim([0 4])
adjustfigurefont('Helvetica',14)
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('SelfSelect_AllRecov','-dpng','-r300')


%%
% plot all animals VO2 rest and recovery
figure(3); clf

for i = 1:length(VO2_table)
    if strfind(VO2_table{i,1},'Lono')
        subplot(221); hold on; xlim([-0.5 2.5]); ylim([0 6]) % title('Lono')
        ylabel('VO_2 L min^{-1}'); box on
        Ind(i) = 1; set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag+8'})
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot(222); hold on; xlim([-0.5 2.5]); ylim([0 6]); box on % title('Kolohe'); 
        Ind(i) = 2; set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag+8'})
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot(223); hold on; xlim([-0.5 2.5]); ylim([0 6]) % title('Liko'); 
        xlabel('Condition'); ylabel('VO_2 L min^{-1}'); box on
        Ind(i) = 3; set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag+8'})
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot(224); hold on; xlim([-0.5 2.5]); ylim([0 6]) % title('Nainoa'); 
        xlabel('Condition'); box on
        Ind(i) = 4; set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag+8'})
    end
    jit = rand(1)/5;
    if strfind(VO2_table{i,2},'C')
        h1 = errorbar(0+jit,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'o-');
        Cond(i) = 0;
    else if strfind(VO2_table{i,2},'A4')
            h1 = errorbar(2+jit,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'s');
            Cond(i) = 5;
        else
            h1 = errorbar(1+jit,VO2_table{i,6}(1),VO2_table{i,6}(1)-VO2_table{i,6}(2),'^');
            Cond(i) = 1;
        end
    end
    set(h1,'color','r')
    
    if strfind(VO2_table{i,2},'C')
        h2 = errorbar(0+jit,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'o');
    else if strfind(VO2_table{i,2},'A4')
            h2 = errorbar(2+jit,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'s');
        else
            h2 = errorbar(1+jit,VO2_table{i,4}(1),VO2_table{i,4}(1)-VO2_table{i,4}(2),'^');
        end
    end
    set(h2,'color','k')
end

subplot(221);
text(-0.4,5.5,'9FL3','Fontsize',14,'fontweight','bold');
subplot(222);
text(-0.4,5.5,'6JK5','Fontsize',14,'fontweight','bold');
subplot(223);
text(-0.4,5.5,'99L7','Fontsize',14,'fontweight','bold');
subplot(224); 
text(-0.4,5.5,'9ON6','Fontsize',14,'fontweight','bold');


adjustfigurefont

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('SelfSelect_RestRecov','-dpng','-r300')

%%
figure(5); clf
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,1},'Lono')
        subplot(221); title('Lono'); hold on; xlim([-0.5 1.5])
        ylabel('VO_2 L min^{-1}')
        Ind(i) = 1;
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot(222); title('Kolohe'); hold on; xlim([-0.5 1.5])
        Ind(i) = 2;
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot(223); title('Liko'); hold on; xlim([-0.5 1.5])
        xlabel('Before / After'); ylabel('VO_2 L/min')
        Ind(i) = 3;
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot(224); title('Nainoa'); hold on; xlim([-0.5 1.5])
        xlabel('Before / After')
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
        subplot('position',[0.1 0.55 0.4 0.4]);
        hold on; xlim([-0.5 2.5]); box on
        ylabel('PAR')
        set(gca,'xtick',[0 1 2],'ylim',[0 16],'xticklabels',{'','',''})
        set(gca,'ytick',[0 5 10 15])
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot('position',[0.55 0.55 0.4 0.4]);
        hold on; xlim([-0.5 2.5]); box on
        set(gca,'xtick',[0 1 2],'ylim',[0 16],'xticklabels',{'','',''})
        set(gca,'ytick',[0 5 10 15])
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot('position',[0.1 0.1 0.4 0.4]); 
        hold on; xlim([-0.5 2.5]); box on
        xlabel('Condition'); ylabel('PAR')
        set(gca,'ytick',[0 5 10 15])
        set(gca,'xtick',[0 1 2],'ylim',[0 16],'xticklabels',{'Control','Tag','Tag+8'})
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot('position',[0.55 0.1 0.4 0.4]); 
        hold on; xlim([-0.5 2.5]); box on
        set(gca,'xtick',[0 1 2],'ylim',[0 16],'xticklabels',{'Control','Tag','Tag+8'})
        set(gca,'ytick',[0 5 10 15])
        xlabel('Condition')
    end
    if strfind(VO2_table{i,2},'C')
        h = plot(0,PAR(i),'ko','MarkerFacecolor','k','markersize',8);
    else if strfind(VO2_table{i,2},'A4')
            h = plot(2,PAR(i),'s','markerfacecolor',[202/255 0 32/255],'markeredgecolor','k','MarkerSIze',8);
        else
            h = plot(1,PAR(i),'^','markerfacecolor',[5/255 113/255 222/255],'markeredgecolor','k','MarkerSIze',8);
        end
    end
    set(h,'color','k')
end

% add labels
subplot('position',[0.1 0.55 0.4 0.4]);
text(-0.4,14.5,'9FL3','Fontsize',14,'fontweight','bold');
subplot('position',[0.55 0.55 0.4 0.4]);
text(-0.4,14.5,'6JK5','Fontsize',14,'fontweight','bold');
subplot('position',[0.1 0.1 0.4 0.4]);
text(-0.4,14.5,'99L7','Fontsize',14,'fontweight','bold');
subplot('position',[0.55 0.1 0.4 0.4]); 
text(-0.4,14.5,'9ON6','Fontsize',14,'fontweight','bold');

adjustfigurefont
print('SelfSelect_PAR','-dsvg','-r300')


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
%% calculate resting rates 
rest = [VO2_table{:,4}];
rest = rest(1:2:end);
restkg = [VO2kg_table{:,4}];
restkg = restkg(1:2:end);

% calculate for individuals
[mean(rest(Ind == 1)) std(rest(Ind ==1))] % Lono
[mean(rest(Ind == 2)) std(rest(Ind ==2))] % Kolohe
[mean(rest(Ind == 3)) std(rest(Ind ==3))] % Liko
[mean(rest(Ind == 4)) std(rest(Ind ==4))] % Nainoa


%%
figure(5); clf; hold on
for i = 1:length(VO2kg_table)
    if ~isempty(strfind(VO2_table{i,2},'C'))
        h = errorbar(0+rand/10,VO2kg_table{i,6}(1),VO2kg_table{i,6}(1)-VO2kg_table{i,6}(2),'o');
    else if ~isempty(strfind(VO2_table{i,2},'A4'))
            h = errorbar(2+rand/10,VO2kg_table{i,6}(1),VO2kg_table{i,6}(1)-VO2kg_table{i,6}(2),'s');
        else
            h = errorbar(1+rand/10,VO2kg_table{i,6}(1),VO2kg_table{i,6}(1)-VO2kg_table{i,6}(2),'^');
            % h = errorbar(2,VO2kg_table{i,6}(1),VO2kg_table{i,6}(1)-VO2kg_table{i,6}(2),'^');
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


set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag+8'}); xlim([-0.5 2.5])
xlabel('Condition')
title(headers{6}); ylabel('VO_2 L kg^{-1} min^{-1}')

adjustfigurefont
set(gca,'fontsize',16)
set(gcf,'position',[118   366   746   272],'paperpositionmode','auto')
print('SelfSelect_VO2kg1min','-dpng','-r300')


% %% set up ANOVA
for i = 1:length(VO2_table)
    VO2_2min_rest(:,i) = VO2_table{i,4}(1);
    VO2_min1_recov(:,i) = VO2_table{i,6}(1);
    VO2_min2_recov(:,i) = VO2_table{i,8}(1);
    VO2_2min_recov(:,i) = VO2_table{i,7}(1);
    VO2_2min_recovkg(:,i) = VO2kg_table{i,7}(1);
    VO2_min1_recovkg(:,i) = VO2kg_table{i,6}(1);
    VO2_2min_restkg(:,i) = VO2kg_table{i,4}(1);
end
% 
% 
% [p,t,stats] = anovan(VO2_min1_recovkg,{Ind,Cond},'varnames',{'Individual','Condition'});
% % c = multcompare(stats,'Dim',2,'ctype','hsd')
% [p,t,stats] = anovan(VO2_min1_recov,{Ind,Cond},'varnames',{'Individual','Condition'});
% [p,t,stats] = anovan(PAR,{Ind,Cond},'varnames',{'Individual','Condition'});
% [mean(PAR) std(PAR)]; % values for paper


%% figure: VO2 and VO2/kg 
warning off
figure(6); clf; hold on
set(gcf,'position',[1 241 500 384],'paperpositionmode','auto')
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,1},'Lono')
        subplot('position',[0.1 0.55 0.35 0.4]);hold on; xlim([-0.5 2.5]);
        text(-0.4,15,'Lono')
        ylabel('VO_2 (L min^{-1})')
        ylim([0.5 3.75]); box on
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'},...
            'ytick',[1 2 3],'yticklabels',{'1.0','2.0','3.0'})
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot('position',[0.6 0.55 0.35 0.4]);
        text(-0.4,15,'Kolohe'); box on
        hold on; xlim([-0.5 2.5]); ylim([0.5 3.75])
        % ylabel('VO_2 (L min^{-1})')
       set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'},...
            'ytick',[1 2 3],'yticklabels',{'1.0','2.0','3.0'})
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot('position',[0.1 0.1 0.35 0.4]); 
        text(-0.4,15,'Liko'); box on
        hold on; xlim([-0.5 2.5]); ylim([0.5 3.75])
        xlabel('Condition'); ylabel('VO_2 (L min^{-1})')
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'},...
            'ytick',[1 2 3],'yticklabels',{'1.0','2.0','3.0'})
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot('position',[0.6 0.1 0.35 0.4]); 
        text(-0.4,15,'Nainoa'); box on
        hold on; xlim([-0.5 2.5]); ylim([0.5 3.75])
        xlabel('Condition'); % ylabel('VO_2 (L/min)')
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'},...
            'ytick',[1 2 3],'yticklabels',{'1.0','2.0','3.0'})
    end
    if strfind(VO2_table{i,2},'C')
        h = plot(0,VO2_table{i,6}(1),'ko','markerfacecolor','k','MarkerSIze',8);
    else if strfind(VO2_table{i,2},'A4')
            h = plot(2,VO2_table{i,6}(1),'s','markerfacecolor',[202/255 0 32/255],'markeredgecolor','k','MarkerSIze',8);
        else
            h = plot(1,VO2_table{i,6}(1),'^','markerfacecolor',[5/255 113/255 222/255],'markeredgecolor','k','MarkerSIze',8);
        end
    end
end

% add labels
subplot('position',[0.1 0.55 0.35 0.4]);
text(-0.4,3.5,'9FL3','Fontsize',14,'fontweight','bold');
subplot('position',[0.6 0.55 0.35 0.4]);
text(-0.4,3.5,'6JK5','Fontsize',14,'fontweight','bold');
subplot('position',[0.1 0.1 0.35 0.4]);
text(-0.4,3.5,'99L7','Fontsize',14,'fontweight','bold');
subplot('position',[0.6 0.1 0.35 0.4]); 
text(-0.4,3.5,'9ON6','Fontsize',14,'fontweight','bold');

adjustfigurefont
print('SelfSelect_VO2_only','-dsvg','-r300')



%% plot breathing frequency

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/
load('breathfreq')

figure(9), clf, hold on
for i = 1:length(breathfreq)
    jit = -.2 + (.2--.2).*rand;
    if strfind(breathfreq{i,4},'C')
    h = plot(0+jit,breathfreq{i,1},'o');
    else if strfind(breathfreq{i,4},'A4')
            h = plot(2+jit,breathfreq{i,1},'s');
        else
            h = plot(1+jit,breathfreq{i,1},'^');
        end
    end
    if strfind(breathfreq{i,2},'Nainoa')
        set(h,'color',[26/255 150/255 65/255],'MarkerFaceColor',[26/255 150/255 65/255])
        breathfreq{i,5} = 1;
    else if strfind(breathfreq{i,2},'Lono')
            set(h,'color','k','MarkerFaceColor','k')
            breathfreq{i,5} = 2;
        else if strfind(breathfreq{i,2},'Kolohe')
                set(h,'color','b','MarkerFaceColor','b')
                breathfreq{i,5} = 3;
            else
                set(h,'color','r','MarkerFaceColor','r')
                breathfreq{i,5} = 4;
            end
        end
    end
end
set(gca,'xtick',[0 1 2]); xlim([-1 3]); box on; ylim([1.25 5.75])
ylabel('Breaths per minute')

set(gca,'xtick',[0 1 2],'xticklabels',{'Control','Tag','Tag+8'})

adjustfigurefont
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('SelfSelect_Bfreq','-dpng','-r300')

% stat on breathing frequency
[p,t,stats] = anovan([breathfreq{:,1}],{[breathfreq{:,5}],[breathfreq{:,3}]},'varnames',{'Individual','Condition'});

bs = [breathfreq{:,1}]; 
c = [breathfreq{:,3}]; 
i = [breathfreq{:,5}]; 

mean(bs(c == 0)); % etc to get means of each condition for table 3

return

%% plot VO2kg
%% figure: VO2 and VO2/kg 
warning off
figure(7); clf; hold on
set(gcf,'position',[1 241 500 384],'paperpositionmode','auto')
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,1},'Lono')
        subplot('position',[0.1 0.55 0.35 0.4]);hold on; xlim([-0.5 2.5]);
        %text(-0.4,15,'Lono')
        ylabel('VO_2 (L min^{-1})'); box on
        %ylim([0.5 3.75])
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'})% ,...
            %'ytick',[1.5 2 2.5 3 3.5],'yticklabels',{'1.5','2.0','2.5','3.0','3.5'})
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot('position',[0.6 0.55 0.35 0.4]);
        %text(-0.4,15,'Kolohe'); box on
        hold on; xlim([-0.5 2.5]); %ylim([0.5 3.75])
        ylabel('VO_2 (L min^{-1})')
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'})%,...
            %'ytick',[1.5 2 2.5 3 3.5],'yticklabels',{'1.5','2.0','2.5','3.0','3.5'})
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot('position',[0.1 0.1 0.35 0.4]); 
        %text(-0.4,15,'Liko'); box on
        hold on; xlim([-0.5 2.5]); %ylim([0.5 3.75])
        xlabel('Condition'); ylabel('VO_2 (L min^{-1})')
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'})%,...
            %'ytick',[1.4 1.6 1.8 2.0],'yticklabels',{'1.4','1.6','1.8','2.0'})
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot('position',[0.6 0.1 0.35 0.4]); 
        %text(-0.4,15,'Nainoa'); box on
        hold on; xlim([-0.5 2.5]); %ylim([0.5 3.75])
        xlabel('Condition'); ylabel('VO_2 (L min^{-1})')
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'})%,...
            %'ytick',[0.6 0.8 1.0 1.2],'yticklabels',{'0.6','0.8','1.0','1.2'})
    end
    if strfind(VO2_table{i,2},'C')
        h = plot(0,VO2_2min_recovkg(i),'ko','markerfacecolor','k','MarkerSIze',8);
    else if strfind(VO2_table{i,2},'A4')
            h = plot(2,VO2_2min_recovkg(i)*1000,'s','markerfacecolor',[202/255 0 32/255],'markeredgecolor','k','MarkerSIze',8);
        else
            h = plot(1,VO2_2min_recovkg(i)*1000,'^','markerfacecolor',[5/255 113/255 222/255],'markeredgecolor','k','MarkerSIze',8);
        end
    end
end

adjustfigurefont
print('SelfSelect_VO2kg.eps','-depsc','-r300')
%% add boat to this plot - make sure these numbers jive. 
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/Boat

load('VO2_table_boat')
headers = {'Filename';'Condition';'Rest all';'Rest last 2 min';...
    'Recov all';'Recov min 1';'Recov 0-2 min';'Recov min 2';...
    'Recov 5 min';'Recov 3-5 min'};
for i = 1:6
    if strfind(VO2_table{i,1},'Lono')
        subplot('position',[0.1 0.55 0.35 0.4]);hold on; xlim([-0.5 2.5]);
        text(-0.4,15,'Lono')
        ylabel('VO_2 (L min^{-1})')
        ylim([0.5 3.75]); box on
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'},...
            'ytick',[1.5 2 2.5 3 3.5],'yticklabels',{'1.5','2.0','2.5','3.0','3.5'})
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot('position',[0.6 0.1 0.35 0.4]); 
        text(-0.4,15,'Nainoa'); box on
        hold on; xlim([-0.5 2.5]); ylim([0.5 3.75])
        xlabel('Condition'); ylabel('VO_2 (L min^{-1})')
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'},...
            'ytick',[0.6 0.8 1.0 1.2],'yticklabels',{'0.6','0.8','1.0','1.2'})
    end
    if strfind(VO2_table{i,2},'C')
        h = plot(0,VO2_2min_recov(i),'ko','MarkerSize',8);
    else if strfind(VO2_table{i,2},'A2')
            h = plot(2,VO2_2min_recov(i),'d','markeredgecolor',[77/255 175/255 74/255],'MarkerSize',8);
        else
            h = plot(1,VO2_2min_recov(i),'^','markerfacecolor',[5/255 113/255 222/255],'MarkerSize',8);
        end
    end
end



