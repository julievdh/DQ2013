% DQdepth: do dolphins swim deeper with higher drag?

% load tags
cd /Volumes/DQ-2013-2/tt13/DQdepthPRH
d = dir('*.mat');
% SOMEHOW LOAD THIS IN MORE NICELY
% FOR NOW CLUDGE AWAY
% for i = 1:length(d);
%     tag(i) = load(d(i).name);
% end
% put in structure
load('tt13_267bprh');
load('tt13_268cprh');
load('tt13_268dprh');
load('tt13_269bprh');
load('tt13_271bprh');
load('tt13_272aprh');
load('tt13_273aprh');
%load('tt13_278aprh');
%load('tt13_279bprh');
%load('tt13_281aprh');
%load('tt13_282bprh');
load('tt13_283aprh');
load('tt13_288aprh');
% %%
% tt283a = load('tt13_283aprh');
% figure(1); clf; 
% plot(-tt283a.p)
% ginput(2)
% %% 
% tt283a.start = round(ans(1,1));
% tt283a.stop = round(ans(2,1));
% plot(-tt283a.p(tt283a.start:tt283a.stop))

%% %% save
% save('tt13_288aprh','tt288a')

figure(1); clf; hold on
plot(-tt267b.p(tt267b.start:tt267b.stop),'r')
plot(-tt268c.p(tt268c.start:tt268c.stop),'r')
plot(-tt268d.p(tt268d.start:tt268d.stop),'b')
plot(-tt269b.p(tt269b.start:tt269b.stop),'b')
plot(-tt271b.p(tt271b.start:tt271b.stop),'b')
plot(-tt272a.p(tt272a.start:tt272a.stop),'r')
plot(-tt273a.p(tt273a.start:tt273a.stop),'b')

plot(-tt283a.p(tt283a.start:tt283a.stop),'b')
plot(-tt288a.p(tt288a.start:tt288a.stop),'r')

figure(2)
subplot(311); hold on
plot(-tt267b.p(tt267b.start:tt267b.stop),'r')
plot([0 14000],[0 0],'k')
subplot(312); hold on
plot(-tt268d.p(tt268d.start:tt268d.stop),'b')
plot([0 14000],[0 0],'k')
subplot(313); hold on
plot(-tt272a.p(tt272a.start:tt272a.stop),'r')
plot([0 14000],[0 0],'k')