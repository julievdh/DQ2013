% DQBreathFreq

% determine whether breathing frequency is different in different drag
% conditions

clear all

% load data
BFreqImport

% replace any bb with just b
bb = strcmp('bb',cue);
if sum(bb) > 0
cue{bb == 1} = 'b';
end

% find breaths
b = strcmp('b',cue);

% find between o and i
out = strcmp('o',cue); % find out
out = find(out == 1);
in = strcmp('i',cue); % find in
in = find(in == 1);
in = in(in > out(1)); % find first in after first out
in = in(1);

% plot all comments
figure(1); clf; hold on
plot(time(),comm,'o')
plot(time(out),comm(out),'ro')
plot(time(in),comm(in),'ko')

% count breaths between in and out
count = in-out(1);

% calculate time between in and out
dur = etime(datevec(time(in)),datevec(time(out(1)))); % in seconds

% calculate breathing frequency outside
freq = count/(dur/60); % in minutes

text(time(30),65,num2str(freq))