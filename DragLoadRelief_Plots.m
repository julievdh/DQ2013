% Load and plot drag build/relief data from video analysis
warning off
clear all

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013

%% from Alex
load 287_Kolohe_Loading
laps = [0 19.5; 58 80.6; 171.4 196; 401.4 425; 691.6 716.8; 727 753.2];
% 1 = Control; 2 = Tag; 3 = Tag+2; 4 = Tag+4; 5 = Tag+6; 6 = Tag+8

% find range indices + pull entire range (not just == because will not == NaN pads)
ii = find(surf_arr_pad >= laps(1,1)); st = ii(1);
ii = find(surf_arr_pad(:,1) <= laps(1,2)); nd = ii(end);
C = surf_arr_pad(st:nd,:); 

ii = find(surf_arr_pad >= laps(2,1)); st = ii(1);
ii = find(surf_arr_pad(:,1) <= laps(2,2)); nd = ii(end);
T = surf_arr_pad(st:nd,:); 

ii = find(surf_arr_pad >= laps(3,1)); st = ii(1);
ii = find(surf_arr_pad(:,1) <= laps(3,2)); nd = ii(end);
T2 = surf_arr_pad(st:nd,:); 

ii = find(surf_arr_pad >= laps(4,1)); st = ii(1);
ii = find(surf_arr_pad(:,1) <= laps(4,2)); nd = ii(end);
T4 = surf_arr_pad(st:nd,:); 

ii = find(surf_arr_pad >= laps(5,1)); st = ii(1);
ii = find(surf_arr_pad(:,1) <= laps(5,2)); nd = ii(end);
T6 = surf_arr_pad(st:nd,:); 

ii = find(surf_arr_pad >= laps(6,1)); st = ii(1);
ii = find(surf_arr_pad(:,1) <= laps(6,2)); nd = ii(end);
T8 = surf_arr_pad(st:nd,:); 

figure(2); clf;
subplot('position',[0.55 0.1 0.4 0.4]); hold on;
text(-19,32,'D','FontWeight','Bold','FontSize',18)

plot(C(:,2),C(:,3),'k','Linewidth',2)
plot(T(:,2),T(:,3),'Color',[55/255 126/255 184/255],'Linewidth',2)
plot(T2(:,2),T2(:,3),'Color',[255/255 127/255 0/255],'Linewidth',2)
plot(T4(:,2),T4(:,3),'Color',[77/255 175/255 74/255],'Linewidth',2)
plot(T6(:,2),T6(:,3),'Color',[152/255 78/255 163/255],'Linewidth',2)
plot(T8(:,2),T8(:,3),'Color',[228/255 26/255 28/255],'Linewidth',2)
axis equal; ylim([0 35])

%%
load KoloheUnloading_287
% added NaNs to pad Alex's data
% laps = [1 120 240 332 432 522 593]';
laps = [0 63; 180 207; 308 329; 390 411; 513 534; 571 587];
% 1 = Tag+8; 2 = Tag+6; 3 = Tag+4; 4 = Tag+2; 5 = Tag; 6 = Control;  

% find range indices + pull entire range (not just == because will not == NaN pads)
ii = find(surf_arr_pad >= laps(1,1)); st = ii(1);
ii = find(surf_arr_pad(:,1) <= laps(1,2)); nd = ii(end);
T8 = surf_arr_pad(st:nd,:); 

ii = find(surf_arr_pad >= laps(2,1)); st = ii(1);
ii = find(surf_arr_pad(:,1) <= laps(2,2)); nd = ii(end);
T6 = surf_arr_pad(st:nd,:); 

ii = find(surf_arr_pad >= laps(3,1)); st = ii(1);
ii = find(surf_arr_pad(:,1) <= laps(3,2)); nd = ii(end);
T4 = surf_arr_pad(st:nd,:); 

ii = find(surf_arr_pad >= laps(4,1)); st = ii(1);
ii = find(surf_arr_pad(:,1) <= laps(4,2)); nd = ii(end);
T2 = surf_arr_pad(st:nd,:); 

ii = find(surf_arr_pad >= laps(5,1)); st = ii(1);
ii = find(surf_arr_pad(:,1) <= laps(5,2)); nd = ii(end);
T = surf_arr_pad(st:nd,:); 

ii = find(surf_arr_pad >= laps(6,1)); st = ii(1);
ii = find(surf_arr_pad(:,1) <= laps(6,2)); nd = ii(end);
C = surf_arr_pad(st:nd,:); 

% plot(surf_arr_pad(:,2),surf_arr_pad(:,3))
subplot('position',[0.1 0.1 0.4 0.4]); hold on;
text(-19,32,'C','FontWeight','Bold','FontSize',18)
plot(C(:,2),C(:,3),'k','Linewidth',2)
plot(T(:,2),T(:,3),'Color',[55/255 126/255 184/255],'Linewidth',2)
plot(T2(:,2),T2(:,3),'Color',[255/255 127/255 0/255],'Linewidth',2)
plot(T4(:,2),T4(:,3),'Color',[77/255 175/255 74/255],'Linewidth',2)
plot(T6(:,2),T6(:,3),'Color',[152/255 78/255 163/255],'Linewidth',2)
plot(T8(:,2),T8(:,3),'Color',[228/255 26/255 28/255],'Linewidth',2)
axis equal; ylim([0 35])
%% Lono
% Unloading
clear all
load('LonoLoadUnloadSpeed');
Ulaps = [53.5 82.4; 140 172; 286 316; 425 454; 544 566; 597 615];
% 1 = Tag+8; 2 = Tag+6; 3 = Tag+4; 4 = Tag+2; 5 = Tag; 6 = Control;  

% have to make something NaNs here?
%U.surf_arr_pad = U.surf_arr;
%ii = find(U.surf_arr_pad >= Ulaps(1,1)); st = ii(1);
%ii = find(U.surf_arr_pad(:,1) <= Ulaps(1,2)); nd = ii(end);
%C = U.surf_arr_pad(st:nd,:); 

subplot('position',[0.1 0.58 0.4 0.4]); hold on;
% title('Lono - Drag Relief')
text(-18,32,'A','FontWeight','Bold','FontSize',18)
plot(C.Utrack(:,2),C.Utrack(:,3),'k','LineWidth',2)
plot(T.Utrack(:,2),T.Utrack(:,3),'Color',[55/255 126/255 184/255],'LineWidth',2)
plot(T2.Utrack(:,2),T2.Utrack(:,3),'Color',[255/255 127/255 0/255],'LineWidth',2)
plot(T4.Utrack(:,2),T4.Utrack(:,3),'Color',[77/255 175/255 74/255],'LineWidth',2)
plot(T6.Utrack(:,2),T6.Utrack(:,3),'Color',[152/255 78/255 163/255],'LineWidth',2)
plot(T8.Utrack(:,2),T8.Utrack(:,3),'Color',[228/255 26/255 28/255],'LineWidth',2)
axis equal; ylim([0 35])

subplot('position',[0.55 0.58 0.4 0.4]); hold on;
% title('Lono - Drag Loading')
text(-22,32,'B','FontWeight','Bold','FontSize',18)
plot(C.Ltrack(:,2),C.Ltrack(:,3),'k','LineWidth',2)
plot(T.Ltrack(:,2),T.Ltrack(:,3),'Color',[55/255 126/255 184/255],'LineWidth',2)
plot(T2.Ltrack(:,2),T2.Ltrack(:,3),'Color',[255/255 127/255 0/255],'LineWidth',2)
plot(T4.Ltrack(:,2),T4.Ltrack(:,3),'Color',[77/255 175/255 74/255],'LineWidth',2)
plot(T6.Ltrack(:,2),T6.Ltrack(:,3),'Color',[152/255 78/255 163/255],'LineWidth',2)
plot(T8.Ltrack(:,2),T8.Ltrack(:,3),'Color',[228/255 26/255 28/255],'LineWidth',2)
adjustfigurefont
axis equal; ylim([0 35])

% legend('boxoff')



adjustfigurefont

[ax1,h1]=suplabel('X video coordinate');
[ax2,h2]=suplabel('Y video coordinate','y');
set(h2,'position',[-0.01 0.5 0],'FontSize',16)
set(h1,'position',[0.5 -0.02 0],'FontSize',16)

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print -dsvg LoadReliefLaps

return 

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

