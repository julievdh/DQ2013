% Imports corrected raw respirometry file, calculates VO2 and number of
% breaths over entire sample and subset of data

% Julie van der Hoop jvanderhoop@whoi.edu
% 14 Jan 2013

%%

% Import, plot resp data
% set directory
cd('/Volumes/moorelab/NOPP_CUP_STUDY/DQ2013/Fahlman Analyses/DQ-Sept-2013/Analyzed data/results/Corrected raw data')
clear all;

filename = 'Kolohe13_269_C-post-RAW_DATA.txt';

% import data
import_CORRECTEDRAW(filename)

% create column headers from string
str = textdata{2,1};
delim = regexp(str,', ','split');
titlesplit = regexp(filename,'-','split');
titlesplit(1) = regexprep(titlesplit(1),'_','-');

% plot O2 %, cumulative O2 (L) with time
figure(1); set(gca,'FontSize',14)
plot(data(:,1),data(:,8),'r')
hold on
plot(data(:,1),data(:,6))
xlabel('Time (s)','FontSize',14)
ylabel('O_2 % (blue); Cumulative L O_2 (red)','FontSize',14)
title(titlesplit(1),'FontSize',14)
ylim([0 22]); xlim([data(1,1) data(end,1)])

%% Calculate VO2 and number of breaths over entire duration of file
% for entire sample:
% what is VO2?
VO2 = (data(end,8) - data(1,8))/((data(end,1) - data(1,1))*(1/60)); % L/min

% how many breaths?
[maxtab,mintab] = peakdet(data(:,6),0.75);

%% Calculate VO2 and n breaths in subsets of file

% for subsamples:
% first min
VO2_min1 = (data(12000,8) - data(1,8))/((data(12000,1) - data(1,1))*(1/60)); % L/min
[maxtab_min1,mintab_min1] = peakdet(data(1:12000,6),0.75);

% second min
VO2_min2 = (data(24000,8) - data(12001,8))/((data(24000,1) - data(12001,1))*(1/60)); % L/min
[maxtab_min2,mintab_min2] = peakdet(data(12001:24000,6),0.75);


% etc etc



% OR
% calculate VO2 and n breaths over moving 3-minute (180 sec, 36000 sample) 
% window during 5-minute 'pre-' or 'post-' period
% window moves ahead by 30s to give 5 subsamples

% 0.0 - 3.0 (0 - 36000)
VO2_1 = (data(36000,8) - data(1,8))/((data(36000,1) - data(1,1))*(1/60)); % L/min
[maxtab_1,mintab_1] = peakdet(data(1:36000,6),0.75);

% 0.5 - 3.5 (6000 - 42000)
VO2_2 = (data(42000,8) - data(6000,8))/((data(42000,1) - data(6000,1))*(1/60)); % L/min
[maxtab_2,mintab_2] = peakdet(data(6000:42000,6),0.75);

% 1.0 - 4.0 (12000 - 48000)
VO2_3 = (data(48000,8) - data(12000,8))/((data(48000,1) - data(12000,1))*(1/60)); % L/min
[maxtab_3,mintab_3] = peakdet(data(12000:48000,6),0.75);

% 1.5 - 4.5 (18000 - 54000)
VO2_4 = (data(54000,8) - data(18000,8))/((data(54000,1) - data(18000,1))*(1/60)); % L/min
[maxtab_4,mintab_4] = peakdet(data(18000:54000,6),0.75);

% 2.0 - 5.0 (24000 - 60000)
VO2_5 = (data(60000,8) - data(24000,8))/((data(60000,1) - data(24000,1))*(1/60)); % L/min
[maxtab_5,mintab_5] = peakdet(data(24000:60000,6),0.75);

% plot n breaths vs. VO2 in 3-min subsamples of 5-minute period
figure(5)
plot(size(mintab_1,1),VO2_1,'.')
hold on
plot(size(mintab_2,1),VO2_2,'.')
plot(size(mintab_3,1),VO2_3,'.')
plot(size(mintab_4,1),VO2_4,'.')
plot(size(mintab_5,1),VO2_5,'.')
xlabel('n breaths'); ylabel('3-minute VO_2, L/min')


