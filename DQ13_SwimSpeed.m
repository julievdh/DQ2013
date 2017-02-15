warning off
close all; clear all; clc

% load data
[AllTrials,txt] = xlsread('DQ13_MetabSwimSpeeds');

% find all Control
C = strcmp('C',txt(2,:));
C = find(C == 1);

% find all A
A = strcmp('A',txt(2,:));
A = find(A == 1);

% find all A+4
A4 = strcmp('A+4',txt(2,:));
A4 = find(A4 == 1);

% find all BOAT
C_BOAT = strcmp('C_BOAT',txt(2,:));
C_BOAT = find(C_BOAT == 1);
A_BOAT = strcmp('A_BOAT',txt(2,:));
A_BOAT = find(A_BOAT == 1);
A2_BOAT = strcmp('A2_BOAT',txt(2,:));
A2_BOAT = find(A2_BOAT == 1);


%% plot
figure(2); clf; hold on
plot(nanmean(AllTrials(:,A4)'),'color',[202/255 0 32/255],'LineWidth',2)
plot(nanmean(AllTrials(:,A)'),'color',[5/255 113/255 222/255],'LineWidth',2)
plot(nanmean(AllTrials(:,C)'),'k','LineWidth',2)
%plot(nanmean(AllTrials(:,horzcat(A_BOAT,A2_BOAT,C_BOAT))'),'color',[255/255 127/255 0],'LineWidth',2)
%legend('A+4','A','C')

hA4Lines = plot(AllTrials(:,A4),'color',[244/255 165/255 130/255]);hold on
hALines = plot(AllTrials(:,A),'color',[146/255 197/255 222/255]);
hCLines = plot(AllTrials(:,C),'color',[0.75 0.75 0.75]);
%hCBLines = plot(AllTrials(:,C_BOAT),'color',[252/255 191/255 48/255]);
%hABLines = plot(AllTrials(:,A_BOAT),'color',[252/255 191/255 48/255]);
%hA2BLines = plot(AllTrials(:,A2_BOAT),'color',[252/255 191/255 48/255]);

hA4Group = hggroup; hAGroup = hggroup; hCGroup = hggroup;
%hCBGroup = hggroup; hABGroup = hggroup; hA2BGroup = hggroup;
set(hA4Lines,'Parent',hA4Group)
set(hALines,'Parent',hAGroup)
set(hCLines,'Parent',hCGroup)
%set(hCBLines,'Parent',hCBGroup)
%set(hABLines,'Parent',hABGroup)
%set(hA2BLines,'Parent',hA2BGroup)
set(get(get(hA4Group,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on'); 
set(get(get(hAGroup,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on'); 
set(get(get(hCGroup,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on'); 
% set(get(get(hCBGroup,'Annotation'),'LegendInformation'),...
%     'IconDisplayStyle','on');
% set(get(get(hABGroup,'Annotation'),'LegendInformation'),...
%     'IconDisplayStyle','on');
% set(get(get(hA2BGroup,'Annotation'),'LegendInformation'),...
%     'IconDisplayStyle','on');

plot(nanmean(AllTrials(:,A4)'),'color',[202/255 0 32/255],'LineWidth',2)
plot(nanmean(AllTrials(:,A)'),'color',[5/255 113/255 222/255],'LineWidth',2)
plot(nanmean(AllTrials(:,C)'),'k','LineWidth',2)
plot(nanmean(AllTrials(:,horzcat(A_BOAT,A2_BOAT,C_BOAT))'),'color',[255/255 127/255 0],'LineWidth',2)

% plot mean values
plot(zeros(1,length(C))-2.5,nanmean(AllTrials(:,C)),'ko','MarkerFaceColor','k','MarkerSize',8)
plot(zeros(1,length(A))-1.25,nanmean(AllTrials(:,A)),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(zeros(1,length(A4)),nanmean(AllTrials(:,A4)),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(zeros(1,length(C_BOAT))-3.75,nanmean(AllTrials(:,C_BOAT)),'o','MarkerFaceColor',[255/255 127/255 0],'MarkerEdgeColor','k','MarkerSize',8)
plot(zeros(1,length(A_BOAT))-3.75,nanmean(AllTrials(:,A_BOAT)),'^','MarkerFaceColor',[255/255 127/255 0],'MarkerEdgeColor','k','MarkerSize',8)
plot(zeros(1,length(A2_BOAT))-3.75,nanmean(AllTrials(:,A2_BOAT)),'d','MarkerFaceColor',[255/255 127/255 0],'MarkerEdgeColor','k','MarkerSize',8)

xlim([-4.5 30])
set(gca,'xtick',[-3.75 -2.5 -1.25 0 1 10 25],...
    'xticklabel',{'','','','','1','10','25'},...
    'position',[0.100 0.1500 0.85 0.80])
text(-3.75,7.5,'Boat','rotation',90,'FontSize',14)
text(-2.5,7.5,'Control','rotation',90,'FontSize',14)
text(-1.25,7.5,'Tag','rotation',90,'FontSize',14)
text(0,7.5,'Tag+8','rotation',90,'FontSize',14)
xlabel('Lap Number'); ylabel('Lap Duration (sec)')
adjustfigurefont

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
% print('Lapspeed_wboat','-dpng','-r300')


%% load speed data from Alex 
load('all_vel_vec.mat')

figure(3); clf; hold on
plot((1:length(Kolohe_A4))/200,Kolohe_A4,'color',[202/255 0 32/255 0.5],'LineWidth',2)
plot((1:length(Kolohe_A))/200,Kolohe_A,'color',[5/255 113/255 222/255 0.5],'LineWidth',2)
plot((1:length(Kolohe_C))/200,Kolohe_C,'color',[0 0 0 0.5],'LineWidth',2)

plot((1:length(Lono_A4))/200,Lono_A4,'color',[202/255 0 32/255 0.5],'LineWidth',2)
plot((1:length(Lono_A))/200,Lono_A,'color',[5/255 113/255 222/255 0.5],'LineWidth',2)
plot((1:length(Lono_C))/200,Lono_C,'color',[0 0 0 0.5],'LineWidth',2)

plot((1:length(Liko_A4))/200,Liko_A4,'color',[202/255 0 32/255 0.5],'LineWidth',2)
plot((1:length(Liko_A))/200,Liko_A,'color',[5/255 113/255 222/255 0.5],'LineWidth',2)
plot((1:length(Liko_C))/200,Liko_C,'color',[0 0 0 0.5],'LineWidth',2)

plot((1:length(Nainoa_A4))/200,Nainoa_A4,'color',[202/255 0 32/255 0.5],'LineWidth',2)
plot((1:length(Nainoa_A))/200,Nainoa_A,'color',[5/255 113/255 222/255 0.5],'LineWidth',2)
plot((1:length(Nainoa_C))/200,Nainoa_C,'color',[0 0 0 0.5],'LineWidth',2)

xlabel('Time (sec)'); ylabel('Speed (m/s)')

% plot mean values
plot(-70,nanmean(Kolohe_C),'ko','MarkerFaceColor','k','MarkerSize',8)
plot(-70,nanmean(Liko_C),'ko','MarkerFaceColor','k','MarkerSize',8)
plot(-70,nanmean(Lono_C),'ko','MarkerFaceColor','k','MarkerSize',8)
plot(-70,nanmean(Nainoa_C),'ko','MarkerFaceColor','k','MarkerSize',8)

plot(-50,nanmean(Kolohe_A),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(-50,nanmean(Liko_A),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(-50,nanmean(Lono_A),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(-50,nanmean(Nainoa_A),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor','k','MarkerSize',8)

plot(-30,nanmean(Kolohe_A4),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(-30,nanmean(Liko_A4),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(-30,nanmean(Lono_A4),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(-30,nanmean(Nainoa_A4),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor','k','MarkerSize',8)

xlim([-100 650])
% text(-2.5,7.5,'Control','rotation',90,'FontSize',14)
% text(-1.25,7.5,'Tag','rotation',90,'FontSize',14)
% text(0,7.5,'Tag+8','rotation',90,'FontSize',14)

adjustfigurefont

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('LapSpeed_PerspFilt','-dpng','-r300')

%% do it without time series
figure(5); clf; hold on
set(gcf,'position',[427   250   346   380],'paperpositionmode','auto')

ylabel('Speed (m/s)','Fontsize',18)

% plot mean values
plot(0,nanmean(Kolohe_C),'ko','MarkerFaceColor','k','MarkerSize',8)
plot(0,nanmean(Liko_C),'ko','MarkerFaceColor','k','MarkerSize',8)
plot(0,nanmean(Lono_C),'ko','MarkerFaceColor','k','MarkerSize',8)
plot(0,nanmean(Nainoa_C),'ko','MarkerFaceColor','k','MarkerSize',8)

plot(1,nanmean(Kolohe_A),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(1,nanmean(Liko_A),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(1,nanmean(Lono_A),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(1,nanmean(Nainoa_A),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor','k','MarkerSize',8)

plot(2,nanmean(Kolohe_A4),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(2,nanmean(Liko_A4),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(2,nanmean(Lono_A4),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(2,nanmean(Nainoa_A4),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor','k','MarkerSize',8)

xlim([-1 3]); ylim([2 4.5])
set(gca,'xtick',0:2,'xticklabels',{'','',''},...
    'ytick',2:0.5:4.5,'fontsize',16)

print('LapSpeed_PerspFilt_Mean','-dpng','-r300')

return

%% plot but divide distance by time
% total distance between trainers in 1 lap = 97.34 from Alex Shorter ppt
figure(9); clf; hold on
plot(nanmean(97.34./AllTrials(:,A4)'),'color',[202/255 0 32/255],'LineWidth',2)
plot(nanmean(97.34./AllTrials(:,A)'),'color',[5/255 113/255 222/255],'LineWidth',2)
plot(nanmean(97.34./AllTrials(:,C)'),'k','LineWidth',2)
%plot(nanmean(AllTrials(:,horzcat(A_BOAT,A2_BOAT,C_BOAT))'),'color',[255/255 127/255 0],'LineWidth',2)
%legend('A+4','A','C')

hA4Lines = plot(97.34./AllTrials(:,A4),'color',[244/255 165/255 130/255]);hold on
hALines = plot(97.34./AllTrials(:,A),'color',[146/255 197/255 222/255]);
hCLines = plot(97.34./AllTrials(:,C),'color',[0.75 0.75 0.75]);
%hCBLines = plot(AllTrials(:,C_BOAT),'color',[252/255 191/255 48/255]);
%hABLines = plot(AllTrials(:,A_BOAT),'color',[252/255 191/255 48/255]);
%hA2BLines = plot(AllTrials(:,A2_BOAT),'color',[252/255 191/255 48/255]);

hA4Group = hggroup; hAGroup = hggroup; hCGroup = hggroup;
%hCBGroup = hggroup; hABGroup = hggroup; hA2BGroup = hggroup;
set(hA4Lines,'Parent',hA4Group)
set(hALines,'Parent',hAGroup)
set(hCLines,'Parent',hCGroup)
%set(hCBLines,'Parent',hCBGroup)
%set(hABLines,'Parent',hABGroup)
%set(hA2BLines,'Parent',hA2BGroup)
set(get(get(hA4Group,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on'); 
set(get(get(hAGroup,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on'); 
set(get(get(hCGroup,'Annotation'),'LegendInformation'),...
    'IconDisplayStyle','on'); 
% set(get(get(hCBGroup,'Annotation'),'LegendInformation'),...
%     'IconDisplayStyle','on');
% set(get(get(hABGroup,'Annotation'),'LegendInformation'),...
%     'IconDisplayStyle','on');
% set(get(get(hA2BGroup,'Annotation'),'LegendInformation'),...
%     'IconDisplayStyle','on');

plot(nanmean(97.34./AllTrials(:,A4)'),'color',[202/255 0 32/255],'LineWidth',2)
plot(nanmean(97.34./AllTrials(:,A)'),'color',[5/255 113/255 222/255],'LineWidth',2)
plot(nanmean(97.34./AllTrials(:,C)'),'k','LineWidth',2)
plot(nanmean(97.34./AllTrials(:,horzcat(A_BOAT,A2_BOAT,C_BOAT))'),'color',[255/255 127/255 0],'LineWidth',2)

% plot mean values
plot(zeros(1,length(C))-2.5,nanmean(97.34./AllTrials(:,C)),'ko','MarkerFaceColor','k','MarkerSize',8)
plot(zeros(1,length(A))-1.25,nanmean(97.34./AllTrials(:,A)),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(zeros(1,length(A4)),nanmean(97.34./AllTrials(:,A4)),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(zeros(1,length(C_BOAT))-3.75,nanmean(97.34./AllTrials(:,C_BOAT)),'o','MarkerFaceColor',[255/255 127/255 0],'MarkerEdgeColor','k','MarkerSize',8)
plot(zeros(1,length(A_BOAT))-3.75,nanmean(97.34./AllTrials(:,A_BOAT)),'^','MarkerFaceColor',[255/255 127/255 0],'MarkerEdgeColor','k','MarkerSize',8)
plot(zeros(1,length(A2_BOAT))-3.75,nanmean(97.34./AllTrials(:,A2_BOAT)),'d','MarkerFaceColor',[255/255 127/255 0],'MarkerEdgeColor','k','MarkerSize',8)

xlim([-4.5 30])
set(gca,'xtick',[-3.75 -2.5 -1.25 0 1 10 25],...
    'xticklabel',{'','','','','1','10','25'},...
    'position',[0.100 0.1500 0.85 0.80])
text(-3.75,7.5,'Boat','rotation',90,'FontSize',14)
text(-2.5,7.5,'Control','rotation',90,'FontSize',14)
text(-1.25,7.5,'Tag','rotation',90,'FontSize',14)
text(0,7.5,'Tag+8','rotation',90,'FontSize',14)
xlabel('Lap Number'); ylabel('Speed (m/s)')
adjustfigurefont

%% Second figure with no time series

figure(3); clf; hold on
% plot mean values
plot(zeros(1,length(C)),nanmean(AllTrials(:,C)),'ko','MarkerFaceColor','k','MarkerSize',10)
plot(zeros(1,length(A))+1,nanmean(AllTrials(:,A)),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor','k','MarkerSize',10)
plot(zeros(1,length(A4))+2,nanmean(AllTrials(:,A4)),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor','k','MarkerSize',10)
plot(zeros(1,length(C_BOAT))+3,nanmean(AllTrials(:,C_BOAT)),'o','MarkerFaceColor',[255/255 127/255 0],'MarkerEdgeColor','k','MarkerSize',10)
plot(zeros(1,length(A_BOAT))+3,nanmean(AllTrials(:,A_BOAT)),'^','MarkerFaceColor',[255/255 127/255 0],'MarkerEdgeColor','k','MarkerSize',10)
plot(zeros(1,length(A2_BOAT))+3,nanmean(AllTrials(:,A2_BOAT)),'d','MarkerFaceColor',[255/255 127/255 0],'MarkerEdgeColor','k','MarkerSize',10)

xlim([-0.5 3.5])
set(gca,'xtick',0:3,'xticklabel',{'C','T','T+8','All Boat'},'FontSize',18)
xlabel('Condition'); ylabel('Lap Duration (sec)')

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Lapspeed_averages_withboat','-dpng','-r300')

%% boxplot
figure(4); clf
% plot mean values
% reorder data: each column of y is one variable/group
meanlap(:,1) = nanmean(AllTrials(:,C));
meanlap(:,2) = nanmean(AllTrials(:,A));
meanlap(1:length(A4),3) = nanmean(AllTrials(:,A4));
meanlap(meanlap == 0) = NaN; % replace NaNs
x = [0 1 2]; %  x-location of boxes 

h = notBoxPlot(meanlap,x); hold on
d = [h.data];
% set marker differences
set(d, 'markersize',8);
set(d(1), 'markerfacecolor','k', 'color','k'); 
set(d(2), 'markerfacecolor',[55/255 126/255 184/255],'color','k','marker','^'); 
set(d(3), 'markerfacecolor',[228/255 26/255 28/255],'color','k','marker','s'); 

% set patch colors
for i = 1:3
set(h(i).sdPtch,'facecolor',[1 1 1],'edgecolor','k')
set(h(i).semPtch,'facecolor',[0.75 0.75 0.75],'edgecolor','k')
end
% set mean colors
l = [h.mu];
set(l(1),'color','k')
set(l(2),'color',[55/255 126/255 184/255])
set(l(3),'color',[228/255 26/255 28/255])

plot(4,nanmean(AllTrials(:,C_BOAT(1))),'ko','MarkerFaceColor','k','MarkerSize',8)
plot(4,nanmean(AllTrials(:,C_BOAT(2))),'ko','MarkerSize',8)
plot(5,nanmean(AllTrials(:,A_BOAT(1))),'k^','MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',8)
plot(5,nanmean(AllTrials(:,A_BOAT(2))),'^','Color',[55/255 126/255 184/255],'MarkerSize',8)
plot(6,nanmean(AllTrials(:,A2_BOAT(1))),'kd','MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',8)
plot(6,nanmean(AllTrials(:,A2_BOAT(2))),'d','Color',[77/255 175/255 74/255],'MarkerSize',8)

xlim([-0.5 6.5]); ylim([17 43])
set(gca,'xtick',[0:2 4:6],'xticklabel',{'Control','Tag','Tag+8','Control','Tag','Tag+4'})
xlabel({'';'Drag Loading Condition'}); ylabel('Lap Duration (sec)')
adjustfigurefont

text(4.15,20,'Boat Speed = 3 m/s','FontSize',12)
text(0.7,20,'No Boat','FontSize',12); text(0.62,18.5,'Chapter 9','FontSize',12)

print('C10_2_NoBoatBoatLaps','-dpng','-r300')