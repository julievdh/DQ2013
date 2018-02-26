function [tms]=getTimes(AllTrial)

% get second, middle, and second last lap times from AllTrials
% 19 Nov 2015

% get actual length
lnth = length(AllTrial(~isnan(AllTrial)));

tms = [AllTrial(2) AllTrial(round(lnth/2)) AllTrial(lnth-1)];
end


