% Acceptable tag sizes
% 20 July 2016

bodylength = [3.64
NaN
4.74
3.75
2.61
1.18
1.42
1.47
2.22
2.5
3.79
4.64
6.14
NaN
14.8];

Wa = [5.85
NaN
11.98
5.12
2.7
0.58
0.78
0.92
1.7
1.51
4.71
6.72
13.9
64
64];

% frontal area 
Fa = [2.0734494
NaN
3.0787582
1.8221222
1.6022109
0.79
0.83
1
1.2
1.21
2.42
2.28
3.54
NaN
7.76];

tagWa3 = Wa*0.03;
tagWa1 = Wa*0.01;

tagFa2 = Fa*0.02;
tagFa10 = Fa*0.1;


%%
%# Some initial computations:
axesPosition = [110 40 200 200];  %# Axes position, in pixels
yWidth = 30;                      %# y axes spacing, in pixels

%# Create the figure and axes:
figure(1); clf; hold on
set(gca,'Position',axesPosition)
h1 = axes('Color','w','XColor','k','YColor',[123/255 50/255 148/255],...
          'YLim',[0 100],'Xlim',[0.005 2],'xscale','log','yscale','log',...
          'NextPlot','add');
h2 = axes('Color','none','XColor','k','YColor',[221/255 90/255 13/255],...
          'YLim',[0 20],'Xlim',[0.005 2],'xscale','log','yscale','log',...
          'XTick',[],'XTickLabel',[],...
          'Ytick',[0 2 5 10 15 20],...
          'Yaxislocation','right','NextPlot','add');

xlabel(h1,'Tag Wetted Area (m^2)');
ylabel(h2,'Body Length (m)');
ylabel(h1,'Wetted Surface Area (m^2)');

plot(h1,tagWa3,Wa,'o','markerfacecolor',[123/255 50/255 148/255],'markeredgecolor','k')
plot(h1,tagWa1,Wa,'o','markeredgecolor',[123/255 50/255 148/255])

plot(h2,tagWa3,bodylength,'o','markerfacecolor',[221/255 90/255 13/255],'markeredgecolor','k')
plot(h2,tagWa1,bodylength,'o','markeredgecolor',[221/255 90/255 13/255])

%% Add DTAG3+ on market
% wetted area 
TAG3 = [0.0243; 0.066; 0.108];
plot(h1,TAG3(1),2.29,'^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',8) % 2.29 = average wetted area of Hoku and Liho
plot(h1,TAG3(2),2.29,'d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',8) % 2.29 = average wetted area of Hoku and Liho
plot(h1,TAG3(3),2.29,'s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerFaceColor',[228/255 26/255 28/255],'MarkerSize',8) % 2.29 = average wetted area of Hoku and Liho

tag268 = 0.01785; 
tag333 = 0.00739;
plot(h1,[tag268 tag268],[0.58 100],'k:')
plot(h1,[tag333 tag333],[0.58 100],'k:')

% save
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Glide_AcceptableTagSize','-dsvg','-r300')

%% add second figure with FA
figure(2); clf; hold on
set(gca,'Position',axesPosition)
h1 = axes('Color','w','XColor','k','YColor',[123/255 50/255 148/255],...
          'YLim',[0 10],'Xlim',[0.005 2],'xscale','log','yscale','log',...
          'NextPlot','add');
h2 = axes('Color','none','XColor','k','YColor',[221/255 90/255 13/255],...
          'YLim',[0 20],'Xlim',[0.005 2],'xscale','log','yscale','log',...
          'XTick',[],'XTickLabel',[],...
          'Ytick',[0 2 5 10 15 20],...
          'Yaxislocation','right','NextPlot','add');

xlabel(h1,'Tag Frontal Area (m^2)');
ylabel(h2,'Body Length (m)');
ylabel(h1,'Frontal Area (m^2)');

plot(h1,tagFa10,Fa,'o','markerfacecolor',[123/255 50/255 148/255],'markeredgecolor','k')
plot(h1,tagFa2,Fa,'o','markeredgecolor',[123/255 50/255 148/255])

plot(h2,tagFa10,bodylength,'o','markerfacecolor',[221/255 90/255 13/255],'markeredgecolor','k')
plot(h2,tagFa2,bodylength,'o','markeredgecolor',[221/255 90/255 13/255])


%% add tags on market




%% Figure S2 - wetted area increase vs Cd increase
% increase in wetted area from DTAG3
DtagWAInc = [0.024/2.39 0.024/2.19 0.045/2.39 0.045/2.19 0.066/2.39 0.066/2.19 0.108/2.39 0.108/2.19];
DtagWAInc = DtagWAInc*100; % make it a percent
% Percent increase in Cd from CFD
CFDInc = [5.4 5.4 34.7 34.7 67.3 67.3 NaN NaN];
% percent increase in Cd from glide
GlideTVInc = [26.2 26.2 NaN NaN 75.6 75.6 185.8 185.8];
% percent increase in Cd from glide 
GlideVFInc = [7.9 7.9 NaN NaN 126.4 126.4 192.5 192.5];

figure(3); clf; hold on
plot([mean(DtagWAInc(1:2))  mean(DtagWAInc(3:4)) mean(DtagWAInc(5:6))],[CFDInc(1) CFDInc(3) CFDInc(5)],'k-')
plot(DtagWAInc(1:2),CFDInc(1:2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',8); % tag
plot(DtagWAInc(3:4),CFDInc(3:4),'ko','markerfacecolor',[255/255 127/255 0/255],'markersize',8); % tag+2
plot(DtagWAInc(5:6),CFDInc(5:6),'kd','markerfacecolor',[77/255 175/255 74/255],'markersize',8); % tag+4

plot([mean(DtagWAInc(1:2)) mean(DtagWAInc(5:6)) mean(DtagWAInc(7:8))],[GlideTVInc(1) GlideTVInc(5) GlideTVInc(7)],'k--')
plot(DtagWAInc(1:2),GlideTVInc(1:2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',8) % tag
plot(DtagWAInc(5:6),GlideTVInc(5:6),'kd','markerfacecolor',[77/255 175/255 74/255],'markersize',8) % tag+4
plot(DtagWAInc(7:8),GlideTVInc(7:8),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',8) % tag+8

plot([mean(DtagWAInc(1:2)) mean(DtagWAInc(5:6)) mean(DtagWAInc(7:8))],[GlideVFInc(1) GlideVFInc(5) GlideVFInc(7)],'k:')
plot(DtagWAInc(1:2),GlideVFInc(1:2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',8) % tag
plot(DtagWAInc(5:6),GlideVFInc(5:6),'kd','markerfacecolor',[77/255 175/255 74/255],'markersize',8) % tag+4
plot(DtagWAInc(7:8),GlideVFInc(7:8),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',8) % tag+8
plot(DtagWAInc,GlideVFInc,'k:')

xlabel('Tag Wetted Area Contribution (%)')
ylabel('Increase in Drag Coefficient (%)')
adjustfigurefont
xlim([0 5])

print('Glide_SupplementWaCd','-dpng','-r300')