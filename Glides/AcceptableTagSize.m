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

tagWa = Wa*0.03;

%%
%# Some initial computations:
axesPosition = [110 40 200 200];  %# Axes position, in pixels
yWidth = 30;                      %# y axes spacing, in pixels

%# Create the figure and axes:
figure(2); clf; hold on
set(gca,'Position',axesPosition)
h1 = axes('Color','w','XColor','k','YColor',[123/255 50/255 148/255],...
          'YLim',[0 70],'Xlim',[0.01 2],'xscale','log','NextPlot','add');
h2 = axes('Color','none','XColor','k','YColor',[221/255 90/255 13/255],...
          'YLim',[0 20],'Xlim',[0.01 2],'xscale','log',...
          'XTick',[],'XTickLabel',[],...
          'Ytick',[0 2 5 10 15 20],...
          'Yaxislocation','right','NextPlot','add');

xlabel(h1,'Tag Wetted Area Contribution (%)');
ylabel(h2,'Body Length (m)');
ylabel(h1,'Wetted Surface Area (m^2)');

plot(h1,tagWa,Wa,'o','markerfacecolor',[123/255 50/255 148/255],'markeredgecolor','k')
plot(h2,tagWa,bodylength,'o','markerfacecolor',[221/255 90/255 13/255],'markeredgecolor','k')

% save
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Glide_AcceptableTagSize','-dsvg','-r300')