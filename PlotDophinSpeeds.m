
% run all that code to get speeds and CFD
DQ13_SwimSpeed
SlowDown_dolphins2013

%% 97.34 = distance between trainers
% get speeds and calculate drag at those speeds
Cspeeds = nanmean(97.34./AllTrials(:,C));
Cdrag = c_notag(1).*Cspeeds.^c_notag(2);

Tspeeds = nanmean(97.34./AllTrials(:,A));
Tdrag = c_tag(1).*Tspeeds.^c_tag(2);

T8speeds = nanmean(97.34./AllTrials(:,A4));
T8drag = c_tag8(1).*T8speeds.^c_tag8(2);

%%
figure(1); 
plot(Cspeeds,Cdrag,'ko')
plot(Tspeeds,Tdrag,'b^')
plot(T8speeds,T8drag,'rs')

