% After reprocessing to find new depth (DQdepth)

% for each file
cd /Volumes/DQ-2013-2/tt13/DQdepthPRH
d = dir('*.mat');
for i = 1:length(d);
    tag = load(d(i).name);
    name1 = regexprep(d(i).name,'prh.mat',''); % scrub prh.mat from filename
    name2 = regexprep(name1,'13_',''); % scrub 13_ from filename
% find time in certain depth bins
% establish depth bins based on largest diameter = 47 cm
edges = [0 0.5*0.47 1.5*0.47 3*0.47 5*0.47]; %  bin edges
[n(i,:),edges] = histcounts(tag.(name2).p,edges,'normalization','probability'); % n proportion of time spent in that depth bin
figure(1); hold on
histogram(tag.(name2).p,edges,'normalization','probability')
end

Cond = [4; 4; 1; 1; 1; 4; 4; 1; 1; 4; 1; 1; 4];
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

