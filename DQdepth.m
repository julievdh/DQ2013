% DQdepth: do dolphins swim deeper with higher drag?

% load tags
cd /Volumes/DQ-2013-2/tt13/DQdepthPRH
d = dir('*.mat');
for i = 1:length(d);
    tag = load(d(i).name);

%%
name1 = regexprep(d(i).name,'prh.mat',''); % scrub prh.mat from filename
name2 = regexprep(name1,'13_',''); % scrub 13_ from filename
tag.(name2).p; % now have structure reference



%% NEW DEPTH
% plot
figure(1); clf
subplot(121); hold on 
histogram(tag.(name2).p(tag.(name2).start:tag.(name2).stop))
subplot(122); hold on
plot(tag.(name2).p(tag.(name2).start:tag.(name2).stop),'b') % plot depth during trial
plot([0 14000],[0 0],'k') % plot zero depth

% find top 1%
Y = quantile(tag.(name2).p(tag.(name2).start:tag.(name2).stop),0.01);
plot([0 14000],[Y Y],'r') % plot 0.01 quantile
plot(tag.(name2).p(tag.(name2).start:tag.(name2).stop)-Y,'g') % plot corrected depth
axis ij

% make top 1% = surface
tag.(name2).pCORR = tag.(name2).p-Y;

%% save
fname = sprintf(d(i).name); % make filename to save
v = genvarname(name2); % generate variable name for saving
eval([v '= tag.(name2);']);

save(fname,v)

end

