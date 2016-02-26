% After reprocessing to find new depth (DQdepth)

% for each file
cd /Volumes/DQ-2013-2/tt13/DQdepthPRH
d = dir('*.mat');
Cond = [4; 4; 1; 1; 1; 4; 4; 1; 4; 1; 1; 1; 4; 1; 1; 4]; % 4 = Tag + 8, 1 = Tag only
for i = 1:length(d);
    tag = load(d(i).name);
    name1 = regexprep(d(i).name,'prh.mat',''); % scrub prh.mat from filename
    name2 = regexprep(name1,'13_',''); % scrub 13_ from filename
    % find time in certain depth bins
    % establish depth bins based on largest diameter = 47 cm
    edges = [0 0.5*0.47 1.5*0.47 3*0.47 5*0.47]; %  bin edges
    [n(i,:),edges] = histcounts(tag.(name2).p,edges,'normalization','probability'); % n proportion of time spent in that depth bin
    figure(1); hold on
    h = histogram(tag.(name2).p,edges,'normalization','probability','displaystyle','stairs');
    if Cond(i) == 1
        set(h,'EdgeColor','b')
    else set(h,'EdgeColor','r')
    end
end


%% plot time spent in different depth bins
figure(2); hold on
for i = 1:length(n)
    h = plot(n(i,:),'');
    % but make these different colours and symbols for different conditions
    if Cond(i) == 1
        set(h,'marker','^','markerfacecolor','b','markeredgecolor','k')
    else set(h,'marker','s','markerfacecolor','r','markeredgecolor','k')
    end
end

%% plot bar
figure(3)
% sort by condition?
[Y,I] = sort(Cond);
bar3(n(I,:))
set(gca,'ytick',1:16,'Yticklabels',Y)

