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
print('Lapspeed_wboat','-dpng','-r300')

%% Second figure with no time series

figure(3); clf; hold on
% plot mean values
plot(zeros(1,length(C)),nanmean(AllTrials(:,C)),'ko','MarkerFaceColor','k','MarkerSize',8)
plot(zeros(1,length(A))+1,nanmean(AllTrials(:,A)),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(zeros(1,length(A4))+2,nanmean(AllTrials(:,A4)),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor','k','MarkerSize',8)
plot(zeros(1,length(C_BOAT))+3,nanmean(AllTrials(:,C_BOAT)),'o','MarkerFaceColor',[255/255 127/255 0],'MarkerEdgeColor','k','MarkerSize',8)
plot(zeros(1,length(A_BOAT))+3,nanmean(AllTrials(:,A_BOAT)),'^','MarkerFaceColor',[255/255 127/255 0],'MarkerEdgeColor','k','MarkerSize',8)
plot(zeros(1,length(A2_BOAT))+3,nanmean(AllTrials(:,A2_BOAT)),'d','MarkerFaceColor',[255/255 127/255 0],'MarkerEdgeColor','k','MarkerSize',8)

xlim([-0.5 3.5])
set(gca,'xtick',0:3,'xticklabel',{'C','T','T+8','All Boat'},'FontSize',18)
xlabel('Condition'); ylabel('Lap Duration (sec)')

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Lapspeed_averages_withboat.eps','-depsc','-r300')

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

plot(zeros(1,length(C_BOAT))+4,nanmean(AllTrials(:,C_BOAT)),'ko','MarkerFaceColor','k','MarkerSize',8)
plot(zeros(1,length(A_BOAT))+5,nanmean(AllTrials(:,A_BOAT)),'k^','MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',8)
plot(zeros(1,length(A2_BOAT))+6,nanmean(AllTrials(:,A2_BOAT)),'kd','MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',8)

xlim([-0.5 6.5]); ylim([17 43])
set(gca,'xtick',[0:2 4:6],'xticklabel',{'Control','Tag','Tag+8','Control','Tag','Tag+4'})
xlabel({'';'Drag Loading Condition'}); ylabel('Lap Duration (sec)')
adjustfigurefont

text(4.15,20,'Boat Speed = 3 m/s','FontSize',12)
text(0.7,20,'No Boat','FontSize',12); text(0.62,18.5,'Chapter 9','FontSize',12)

print('C10_Fig4_NoBoatBoatLaps','-dpng','-r300')