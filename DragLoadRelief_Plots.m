% Load and plot drag build/relief data from video analysis
warning off
clear all

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013
% Kolohe
load('Kolohe_DradLoadRelief');

% pad all with NaN for better plotting
padAll

figure(1); clf
subplot('position',[0.55 0.1 0.4 0.4]); hold on;
% title('Kolohe - Drag Loading')
text(-18,13,'D','FontWeight','Bold','FontSize',18)
plot(trainers(:,1),trainers(:,2),'k*','Markersize',8)
plot(load0(:,2),load0(:,3),'k','LineWidth',2)
plot(loadA(:,2),loadA(:,3),'Color',[55/255 126/255 184/255],'LineWidth',2)
plot(loadA1(:,2),loadA1(:,3),'Color',[255/255 127/255 0/255],'LineWidth',2)
plot(loadA2(:,2),loadA2(:,3),'Color',[77/255 175/255 74/255],'LineWidth',2)
plot(loadA3(:,2),loadA3(:,3),'Color',[152/255 78/255 163/255],'LineWidth',2)
plot(loadA4(:,2),loadA4(:,3),'Color',[228/255 26/255 28/255],'LineWidth',2)
adjustfigurefont

subplot('position',[0.1 0.1 0.4 0.4]); hold on;
% title('Kolohe - Drag Relief')
text(-18,13,'C','FontWeight','Bold','FontSize',18)
plot(trainers(:,1),trainers(:,2),'k*','Markersize',8)
plot(remove0(:,2),remove0(:,3),'k','LineWidth',2)
plot(removeA(:,2),removeA(:,3),'Color',[55/255 126/255 184/255],'LineWidth',2)
plot(removeA1(:,2),removeA1(:,3),'Color',[255/255 127/255 0/255],'LineWidth',2)
plot(removeA2(:,2),removeA2(:,3),'Color',[77/255 175/255 74/255],'LineWidth',2)
plot(removeA3(:,2),removeA3(:,3),'Color',[152/255 78/255 163/255],'LineWidth',2)
plot(removeA4(:,2),removeA4(:,3),'Color',[228/255 26/255 28/255],'LineWidth',2)
adjustfigurefont

%% from Alex
load 287_Kolohe_Loading
laps = [1 74 137 185 247 303]';  
% 1 = Control; 2 = Tag; 3 = Tag+2; 4 = Tag+4; 5 = Tag+6; 6 = Tag+8
indx_lap_1 = idx_match_L1(1,1);

figure(2); subplot('position',[0.55 0.1 0.4 0.4]); hold on;
text(-19,32,'D','FontWeight','Bold','FontSize',18)
plot(surf_arr_L1(laps(1,1):laps(2,1),2),surf_arr_L1(laps(1,1):laps(2,1),3),'ok') % control
plot(surf_arr_L1(laps(2,1):laps(3,1),2),surf_arr_L1(laps(2,1):laps(3,1),3),'ok') % tag
plot(surf_arr_L1(laps(3,1):laps(4,1),2),surf_arr_L1(laps(3,1):laps(4,1),3),'ok') % tag+2
plot(surf_arr_L1(laps(4,1):laps(5,1),2),surf_arr_L1(laps(4,1):laps(5,1),3),'ok') % tag+4
plot(surf_arr_L1(laps(5,1):laps(6,1),2),surf_arr_L1(laps(5,1):laps(6,1),3),'ok') % tag+6
plot(surf_arr_L2(:,2),surf_arr_L2(:,3),'ok') % tag+8

load KoloheUnloading_287
laps = [1 120 240 332 432 522 593]';  

subplot('position',[0.1 0.1 0.4 0.4]); hold on;
text(-19,32,'C','FontWeight','Bold','FontSize',18)
plot(surf_arr(laps(1,1):laps(2,1),2),surf_arr(laps(1,1):laps(2,1),3),'ok') % tag+8
plot(surf_arr(laps(2,1):laps(3,1),2),surf_arr(laps(2,1):laps(3,1),3),'ok') % tag+6
plot(surf_arr(laps(3,1):laps(4,1),2),surf_arr(laps(3,1):laps(4,1),3),'ok') % tag+4
plot(surf_arr(laps(4,1):laps(5,1),2),surf_arr(laps(4,1):laps(5,1),3),'ok') % tag+2
plot(surf_arr(laps(5,1):laps(6,1),2),surf_arr(laps(5,1):laps(6,1),3),'ok') % tag
plot(surf_arr(laps(6,1):laps(7,1),2),surf_arr(laps(6,1):laps(7,1),3),'ok') % control


%% Lono
clear all
load('Lono_DradLoadRelief');
padAll

subplot('position',[0.55 0.58 0.4 0.4]); hold on;
% title('Lono - Drag Loading')
text(-18,12,'B','FontWeight','Bold','FontSize',18)
plot(trainers(:,1),trainers(:,2),'k*','Markersize',8)
plot(load0(:,2),load0(:,3),'k','LineWidth',2)
plot(loadA(:,2),loadA(:,3),'Color',[55/255 126/255 184/255],'LineWidth',2)
plot(loadA1(:,2),loadA1(:,3),'Color',[255/255 127/255 0/255],'LineWidth',2)
plot(loadA2(:,2),loadA2(:,3),'Color',[77/255 175/255 74/255],'LineWidth',2)
plot(loadA3(:,2),loadA3(:,3),'Color',[152/255 78/255 163/255],'LineWidth',2)
plot(loadA4(:,2),loadA4(:,3),'Color',[228/255 26/255 28/255],'LineWidth',2)
adjustfigurefont
% legend('Trainers','0','A','A1','A2','A3','A4','location','NW')
% legend('boxoff')


subplot('position',[0.1 0.58 0.4 0.4]); hold on;
% title('Lono - Drag Relief')
text(-18,12,'A','FontWeight','Bold','FontSize',18)
plot(trainers(:,1),trainers(:,2),'k*','Markersize',8)
plot(remove0(:,2),remove0(:,3),'k','LineWidth',2)
plot(removeA(:,2),removeA(:,3),'Color',[55/255 126/255 184/255],'LineWidth',2)
plot(removeA1(:,2),removeA1(:,3),'Color',[255/255 127/255 0/255],'LineWidth',2)
plot(removeA2(:,2),removeA2(:,3),'Color',[77/255 175/255 74/255],'LineWidth',2)
plot(removeA3(:,2),removeA3(:,3),'Color',[152/255 78/255 163/255],'LineWidth',2)
plot(removeA4(:,2),removeA4(:,3),'Color',[228/255 26/255 28/255],'LineWidth',2)
adjustfigurefont

[ax1,h1]=suplabel('X video coordinate');
[ax2,h2]=suplabel('Y video coordinate','y');
set(h2,'position',[-0.01 0.5 0],'FontSize',16)
set(h1,'position',[0.5 -0.02 0],'FontSize',16)

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print -dsvg LoadReliefLaps

%% Duration of loading/unloading laps
% calculate durations of loadings
dur_load0 = load0(end,1)-load0(1,1);
dur_loadA = loadA(end,1)-loadA(1,1);
dur_loadA1 = loadA1(end,1)-loadA1(1,1);
dur_loadA2 = loadA2(end,1)-loadA2(1,1);
dur_loadA3 = loadA3(end,1)-loadA3(1,1);
dur_loadA4 = loadA4(end,1)-loadA4(1,1);
dur_load = [dur_load0 dur_loadA dur_loadA1 dur_loadA2 dur_loadA3 dur_loadA4]; % make a single vector in order

% of removals
dur_remove0 = remove0(end,1)-remove0(1,1);
dur_removeA = removeA(end,1)-removeA(1,1);
dur_removeA1 = removeA1(end,1)-removeA1(1,1);
dur_removeA2 = removeA2(end,1)-removeA2(1,1);
dur_removeA3 = removeA3(end,1)-removeA3(1,1);
dur_removeA4 = removeA4(end,1)-removeA4(1,1);

figure(20); clf; hold on
axesPosition = [110 40 200 200];  %# Axes position, in pixels
set(gca,'Position',axesPosition);
h1 = axes('Color','w','XColor','k','YColor','k',...
          'YLim',[10 30],'Xlim',[-0.5 11.5],...
          'XTick',0:11,'XTickLabel',{'T+8','T+6','T+4','T+2','T','C','C','T','T+2','T+4','T+6','T+8'},...
          'NextPlot','add');
% h2 = axes('Color','none','XColor','k','YColor','k',...
%           'YLim',[0 1],'Xlim',[-0.5 11.5],...
%           'Ytick',[0 .25 .5 1],...
%           'Yticklabels',{'0','25','50','100'},...
%           'Yaxislocation','right','NextPlot','add');
% 

plot(h1,6,dur_load0,'ko','MarkerFaceColor','k','MarkerSize',10)
plot(h1,7,dur_loadA,'ko','MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',10)
plot(h1,8,dur_loadA1,'ko','MarkerFaceColor',[255/255 127/255 0/255],'MarkerSize',10)
plot(h1,9,dur_loadA2,'ko','MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',10)
plot(h1,10,dur_loadA3,'ko','MarkerFaceColor',[152/255 78/255 163/255],'MarkerSize',10)
plot(h1,11,dur_loadA4,'ko','MarkerFaceColor',[228/255 26/255 28/255],'MarkerSize',10)

plot(h1,5,dur_remove0,'ko','MarkerFaceColor','k','MarkerSize',10)
plot(h1,4,dur_removeA,'ko','MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',10)
plot(h1,3,dur_removeA1,'ko','MarkerFaceColor',[255/255 127/255 0/255],'MarkerSize',10)
plot(h1,2,dur_removeA2,'ko','MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',10)
plot(h1,1,dur_removeA3,'ko','MarkerFaceColor',[152/255 78/255 163/255],'MarkerSize',10)
plot(h1,0,dur_removeA4,'ko','MarkerFaceColor',[228/255 26/255 28/255],'MarkerSize',10)

ylabel(h1,'Lap Duration (s)')

set(gcf,'paperpositionmode','auto')
adjustfigurefont
print -dpng -r300 LoadReliefSpeed_Pres

%% add predicted speed change
SlowDown_dolphins2013

figure(20)
plot(h2,7:11,[p0t p0t2 p0t4 p0t6 p0t8],'color',[0.75 0.75 0.75],'LineWidth',2)
plot(h2,0:4,[p0t8 p0t6 p0t4 p0t2 p0t],'color',[0.75 0.75 0.75],'LineWidth',2)
%% percent change between tag condition and CONTROL
p0A = (dur_loadA-dur_load0)/dur_load0;
p0A1= (dur_loadA1-dur_load0)/dur_load0;
p0A2 = (dur_loadA2-dur_load0)/dur_load0;
p0A3 = (dur_loadA3-dur_load0)/dur_load0;
p0A4 = (dur_loadA4-dur_load0)/dur_load0;

% and backwards:
pA40 = (dur_removeA4-dur_remove0)/dur_remove0;
pA30 = (dur_removeA3-dur_remove0)/dur_remove0;
pA20 = (dur_removeA2-dur_remove0)/dur_remove0;
pA10 = (dur_removeA1-dur_remove0)/dur_remove0;
pA0 = (dur_removeA-dur_remove0)/dur_remove0;

% plot
plot(h2,7:11,[p0A p0A1 p0A2 p0A3 p0A4],'k')
plot(h2,0:4,[pA40 pA30 pA20 pA10 pA0],'k')

%% figure(3): Plot increasing and decreasing on same axis (bifurcation?)
figure(3); clf; hold on
axesPosition = [110 40 200 200];  %# Axes position, in pixels
set(gca,'Position',axesPosition);
h3 = axes('Color','w','XColor','k','YColor','k',...
          'YLim',[10 50],'Xlim',[-0.5 5.5],...
          'XTick',[],'XTickLabel',[],...
          'NextPlot','add');
h4 = axes('Color','none','XColor','k','YColor','k',...
          'YLim',[0 2],'Xlim',[-0.5 5.5],...
          'Ytick',[0 .25 .5 1.25],...
          'Yticklabels',{'0','25','50','125'},...
          'Yaxislocation','right','NextPlot','add');

plot(h3,0,dur_load0,'ko','MarkerFaceColor','k','MarkerSize',10)
plot(h3,1,dur_loadA,'k^','MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',10)
plot(h3,2,dur_loadA1,'ko','MarkerFaceColor',[255/255 127/255 0/255],'MarkerSize',10)
plot(h3,3,dur_loadA2,'kd','MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',10)
plot(h3,4,dur_loadA3,'ko','MarkerFaceColor',[152/255 78/255 163/255],'MarkerSize',10)
plot(h3,5,dur_loadA4,'ks','MarkerFaceColor',[228/255 26/255 28/255],'MarkerSize',10)

plot(h3,0,dur_remove0,'o','MarkerEdgeColor','k','MarkerSize',10,'LineWidth',2)
plot(h3,1,dur_removeA,'^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerSize',10,'LineWidth',2)
plot(h3,2,dur_removeA1,'o','MarkerEdgeColor',[255/255 127/255 0/255],'MarkerSize',10,'LineWidth',2)
plot(h3,3,dur_removeA2,'d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerSize',10,'LineWidth',2)
plot(h3,4,dur_removeA3,'o','MarkerEdgeColor',[152/255 78/255 163/255],'MarkerSize',10,'LineWidth',2)
plot(h3,5,dur_removeA4,'s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerSize',10,'LineWidth',2)

plot(h4,1:5,[p0A p0A1 p0A2 p0A3 p0A4],'k')
plot(h4,5:-1:1,[pA40 pA30 pA20 pA10 pA0],'k')

pload(1,:) = [p0A p0A1 p0A2 p0A3 p0A4]; 
punload(1,:) = [pA40 pA30 pA20 pA10 pA0];
return 
%% Kolohe
keep h1 h2 h3 h4 p0t p0t2 p0t4 pload punload; 
load('Kolohe_DradLoadRelief');

% calculate durations of loadings
dur_load0 = load0(end,1)-load0(1,1);
dur_loadA = loadA(end,1)-loadA(1,1);
dur_loadA1 = loadA1(end,1)-loadA1(1,1);
dur_loadA2 = loadA2(end,1)-loadA2(1,1);
dur_loadA3 = loadA3(end,1)-loadA3(1,1);
dur_loadA4 = loadA4(end,1)-loadA4(1,1);
dur_load = [dur_load0 dur_loadA dur_loadA1 dur_loadA2 dur_loadA3 dur_loadA4]; % make a single vector in order

% of removals
dur_remove0 = remove0(end,1)-remove0(1,1);
dur_removeA = removeA(end,1)-removeA(1,1);
dur_removeA1 = removeA1(end,1)-removeA1(1,1);
dur_removeA2 = removeA2(end,1)-removeA2(1,1);
dur_removeA3 = removeA3(end,1)-removeA3(1,1);
dur_removeA4 = removeA4(end,1)-removeA4(1,1);

figure(20); 
plot(h1,6,dur_load0,'ko','MarkerFaceColor','k','MarkerSize',10)
plot(h1,7,dur_loadA,'k^','MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',10)
plot(h1,8,dur_loadA1,'ko','MarkerFaceColor',[255/255 127/255 0/255],'MarkerSize',10)
plot(h1,9,dur_loadA2,'kd','MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',10)
plot(h1,10,dur_loadA3,'ko','MarkerFaceColor',[152/255 78/255 163/255],'MarkerSize',10)
plot(h1,11,dur_loadA4,'ks','MarkerFaceColor',[228/255 26/255 28/255],'MarkerSize',10)

plot(h1,5,dur_remove0,'ko','MarkerFaceColor','k','MarkerSize',10)
plot(h1,4,dur_removeA,'k^','MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',10)
plot(h1,3,dur_removeA1,'ko','MarkerFaceColor',[255/255 127/255 0/255],'MarkerSize',10)
plot(h1,2,dur_removeA2,'kd','MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',10)
plot(h1,1,dur_removeA3,'ko','MarkerFaceColor',[152/255 78/255 163/255],'MarkerSize',10)
plot(h1,0,dur_removeA4,'ks','MarkerFaceColor',[228/255 26/255 28/255],'MarkerSize',10)
%% percent change between tag condition and CONTROL
p0A = (dur_loadA-dur_load0)/dur_load0;
p0A1= (dur_loadA1-dur_load0)/dur_load0;
p0A2 = (dur_loadA2-dur_load0)/dur_load0;
p0A3 = (dur_loadA3-dur_load0)/dur_load0;
p0A4 = (dur_loadA4-dur_load0)/dur_load0;

% and backwards:
pA40 = (dur_removeA4-dur_remove0)/dur_remove0;
pA30 = (dur_removeA3-dur_remove0)/dur_remove0;
pA20 = (dur_removeA2-dur_remove0)/dur_remove0;
pA10 = (dur_removeA1-dur_remove0)/dur_remove0;
pA0 = (dur_removeA-dur_remove0)/dur_remove0;

% plot
plot(h2,7:11,[p0A p0A1 p0A2 p0A3 p0A4],'k')
plot(h2,0:4,[pA40 pA30 pA20 pA10 pA0],'k')

warning off
set(gca,'xtick',0:11,'xticklabels',{'T+8','T+6','T+4','T+2','T','C','C','T','T+2','T+4','T+6','T+8'})
ylabel('Percent increase over control')
box on
adjustfigurefont

print -dpng LoadReliefSpeed_Pres

pload(2,:) = [p0A p0A1 p0A2 p0A3 p0A4]; 
punload(2,:) = [pA40 pA30 pA20 pA10 pA0];

%% Figure 3
figure(3);
plot(h3,0,dur_load0,'ko','MarkerFaceColor','k','MarkerSize',10)
plot(h3,1,dur_loadA,'k^','MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',10)
plot(h3,2,dur_loadA1,'ko','MarkerFaceColor',[255/255 127/255 0/255],'MarkerSize',10)
plot(h3,3,dur_loadA2,'kd','MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',10)
plot(h3,4,dur_loadA3,'ko','MarkerFaceColor',[152/255 78/255 163/255],'MarkerSize',10)
plot(h3,5,dur_loadA4,'ks','MarkerFaceColor',[228/255 26/255 28/255],'MarkerSize',10)

plot(h3,0,dur_remove0,'o','MarkerEdgeColor','k','MarkerSize',10,'LineWidth',2)
plot(h3,1,dur_removeA,'^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerSize',10,'LineWidth',2)
plot(h3,2,dur_removeA1,'o','MarkerEdgeColor',[255/255 127/255 0/255],'MarkerSize',10,'LineWidth',2)
plot(h3,3,dur_removeA2,'d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerSize',10,'LineWidth',2)
plot(h3,4,dur_removeA3,'o','MarkerEdgeColor',[152/255 78/255 163/255],'MarkerSize',10,'LineWidth',2)
plot(h3,5,dur_removeA4,'s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerSize',10,'LineWidth',2)

plot(h4,1:5,[p0A p0A1 p0A2 p0A3 p0A4],'k')
plot(h4,5:-1:1,[pA40 pA30 pA20 pA10 pA0],'k')

plot(h4,1:3,[p0t p0t2 p0t4],'color',[0.75 0.75 0.75],'LineWidth',2)

set(gca,'xticklabels',{'C','T','T+2','T+4','T+6','T+8'})

print -dpng LoadReliefSpeed_2

%% total change with increasing drag
mean([pload; fliplr(punload)]);
std([pload; fliplr(punload)]);

% per animal
mean([pload(1,:); fliplr(punload(1,:))])
std([pload(1,:); fliplr(punload(1,:))])

mean([pload(2,:); fliplr(punload(2,:))])
std([pload(2,:); fliplr(punload(2,:))])

