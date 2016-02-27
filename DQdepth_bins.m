% After reprocessing to find new depth (DQdepth)
warning off

% for each file
cd /Volumes/DQ-2013-2/tt13/DQdepthPRH
d = dir('*.mat');
Cond = [4; 4; 1; 1; 1; 4; 4; 1; 4; 1; 1; 1; 4; 1; 1; 4]; % 4 = Tag + 8, 1 = Tag only
Ind = [4; 1; 2; 3; 1; 1; 3; 4; 3; 1; 3; 2; 3; 1; 3; 1]; % 1 = Kolohe, 2 = Liko, 3 = Lono, 4 = NaiNoa;
diam = [0.45 0.39 0.47 0.41]; % diameters for each dolphin based on Ind
for i = 1:length(d);
    tag = load(d(i).name);
    name1 = regexprep(d(i).name,'prh.mat',''); % scrub prh.mat from filename
    name2 = regexprep(name1,'13_',''); % scrub 13_ from filename
    % find time in certain depth bins
    % establish depth bins based on individual body diameter
    edges = [0 0.5*diam(Ind(i)) 1.5*diam(Ind(i)) 3*diam(Ind(i)) 5*diam(Ind(i))]; %  bin edges
    [n(i,:),edges] = histcounts(tag.(name2).pCORR(tag.(name2).start:tag.(name2).stop),edges,'normalization','probability'); % n proportion of time spent in that depth bin
    figure(1); hold on
    h = histogram(tag.(name2).pCORR(tag.(name2).start:tag.(name2).stop),edges,'normalization','probability','displaystyle','stairs');
    if Cond(i) == 1
        set(h,'EdgeColor','b')
    else set(h,'EdgeColor','r')
    end
    figure(4);hold on
    plot(-tag.(name2).pCORR(tag.(name2).start:tag.(name2).stop))
    % pause
end
plot([0 1.4E4],[0 0],'k') % plot surface
for i = 1:4; % plot diameters
plot([0 1.4E4],-[0.5*diam(i) 0.5*diam(i)],'k');
plot([0 1.4E4],-[1.5*diam(i) 1.5*diam(i)],'k');
plot([0 1.4E4],-[3*diam(i) 3*diam(i)],'k');
end



%% plot time spent in different depth bins
figure(2); hold on
for i = 1:length(n)
    h = plot(n(i,:),'-.');
    % but make these different colours and symbols for different conditions
    if Cond(i) == 1
        set(h,'color','b','marker','^','markerfacecolor','b','markeredgecolor','k')
    else set(h,'color','r','marker','s','markerfacecolor','r','markeredgecolor','k')
    end
end

%% plot bar
figure(3); clf
axesPosition = [0.13 0.11 0.775 0.815];
xLimit = [0 5];
h1 = axes('Position',axesPosition,'Xlim',xLimit,...
    'CameraPosition',[68.8136   75.6310    4.7439],...
    'NextPlot','add','ylim',[0 17]);
% h2 = axes('Position',axesPosition+yWidth.*[-1 0 1 0]),...
%           'Color','none','XColor','k','YColor','m',...
%           'XLim',xLimit+[xOffset 0],'YLim',[0 10],...
%           'XTick',[],'XTickLabel',[],'NextPlot','add');
% sort by condition?
[Y,I] = sort(Ind);
% [Y,CI] = sort(Cond(I));
bar3(h1,n(I,:))
view(46,24)
set(h1,'ytick',1:16,'Yticklabels',Cond(I),'xtick',1:4,...
    'xticklabels',{'<0.5xBL';'0.5-1.5xBL';'1.5-3xBL';'>3xBL'});

%% plot all <0.5 BL in each condition, 0.5-1.5 in each condition
figure(5); clf; hold on
plot(zeros(length(find(Cond == 1))),n(Cond == 1,1),'^')
plot(zeros(length(find(Cond == 4)))+0.5,n(Cond == 4,1),'s')
plot(ones(length(find(Cond == 1))),n(Cond == 1,2),'^')
plot(ones(length(find(Cond == 4)))+0.5,n(Cond == 4,2),'s')


