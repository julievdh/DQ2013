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

% plot
figure(2); clf; hold on
plot(nanmean(AllTrials(:,A4)'),'color',[202/255 0 32/255],'LineWidth',2)
plot(nanmean(AllTrials(:,A)'),'color',[5/255 113/255 222/255],'LineWidth',2)
plot(nanmean(AllTrials(:,C)'),'k','LineWidth',2)
% plot(nanmean(AllTrials(:,horzcat(A_BOAT,A2_BOAT,C_BOAT))'),'color',[26/255 150/255 65/255],'LineWidth',2)
legend('A+4','A','C')

hA4Lines = plot(AllTrials(:,A4),'color',[244/255 165/255 130/255]);hold on
hALines = plot(AllTrials(:,A),'color',[146/255 197/255 222/255]);
hCLines = plot(AllTrials(:,C),'color',[0.75 0.75 0.75]);
% hCBLines = plot(AllTrials(:,C_BOAT),'color',[166/255 217/255 106/255]);
% hABLines = plot(AllTrials(:,A_BOAT),'color',[166/255 217/255 106/255]);
% hA2BLines = plot(AllTrials(:,A2_BOAT),'color',[166/255 217/255 106/255]);

hA4Group = hggroup; hAGroup = hggroup; hCGroup = hggroup;
hCBGroup = hggroup; hABGroup = hggroup; hA2BGroup = hggroup;
set(hA4Lines,'Parent',hA4Group)
set(hALines,'Parent',hAGroup)
set(hCLines,'Parent',hCGroup)
% set(hCBLines,'Parent',hCBGroup)
% set(hABLines,'Parent',hABGroup)
% set(hA2BLines,'Parent',hA2BGroup)
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
% plot(nanmean(AllTrials(:,horzcat(A_BOAT,A2_BOAT,C_BOAT))'),'color',[26/255 150/255 65/255],'LineWidth',2)

% plot mean values
plot(zeros(1,length(C))-1.5,nanmean(AllTrials(:,C)),'ko','MarkerFaceColor','k')
plot(zeros(1,length(A))-0.5,nanmean(AllTrials(:,A)),'^','MarkerFaceColor',[5/255 113/255 222/255],'MarkerEdgeColor',[5/255 113/255 222/255])
plot(zeros(1,length(A4))+0.5,nanmean(AllTrials(:,A4)),'s','MarkerFaceColor',[202/255 0 32/255],'MarkerEdgeColor',[202/255 0 32/255])
% plot(zeros(1,length(C_BOAT))-1.5,nanmean(AllTrials(:,C_BOAT)),'o','MarkerFaceColor',[26/255 150/255 65/255],'MarkerEdgeColor',[26/255 150/255 65/255])
% plot(zeros(1,length(A_BOAT))-1.5,nanmean(AllTrials(:,A_BOAT)),'o','MarkerFaceColor',[26/255 150/255 65/255],'MarkerEdgeColor',[26/255 150/255 65/255])
% plot(zeros(1,length(A2_BOAT))-1.5,nanmean(AllTrials(:,A2_BOAT)),'o','MarkerFaceColor',[26/255 150/255 65/255],'MarkerEdgeColor',[26/255 150/255 65/255])

xlim([-2 30])
set(gca,'xtick',[-1.5 -0.5 0.5 1 10 25],'xticklabel',{'','','','1','10','25'})
xlabel('Lap Number'); ylabel('Lap Duration (sec)')
adjustfigurefont

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Lapspeed.eps','-depsc','-r300')
