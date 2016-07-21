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

%%
%# Some initial computations:
axesPosition = [110 40 200 200];  %# Axes position, in pixels
yWidth = 30;                      %# y axes spacing, in pixels

%# Create the figure and axes:
figure(2); clf; hold on
set(gca,'Position',axesPosition)
h1 = axes('Color','w','XColor','k','YColor',[123/255 50/255 148/255],...
          'YLim',[0 100],'Xlim',[0.01 2],'xscale','log','yscale','log',...
          'NextPlot','add');
h2 = axes('Color','none','XColor','k','YColor',[221/255 90/255 13/255],...
          'YLim',[0 20],'Xlim',[0.01 2],'xscale','log','yscale','log',...
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

TAG3 = [0.0243; 0.066; 0.108];
plot(h1,TAG3(1),2.29,'^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',8) % 2.29 = average wetted area of Hoku and Liho
plot(h1,TAG3(2),2.29,'d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',8) % 2.29 = average wetted area of Hoku and Liho
plot(h1,TAG3(3),2.29,'s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerFaceColor',[228/255 26/255 28/255],'MarkerSize',8) % 2.29 = average wetted area of Hoku and Liho


%%

% save
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Glide_AcceptableTagSize','-dsvg','-r300')