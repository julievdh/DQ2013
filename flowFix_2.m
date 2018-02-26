close all; clear all;

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/ForAndreas
filename = 'Nainoa13_276_C-pre.csv';
data = load(filename);


% plot each channel
% figure(1)
% subplot(511)
% plot(data(:,1),data(:,2))
% subplot(512)
% plot(data(:,1),data(:,3))
% subplot(513)
% plot(data(:,1),data(:,4))
% subplot(514)
% plot(data(:,1),data(:,5))
% subplot(515)
% plot(data(:,1),data(:,6))

%% fix channel 2 (column 3)
% set values to channel mean between breaths (remove all noise)

% find data in mid-range (around mean value)
ii = find(data(:,3) < 5 & data(:,3) > -5);
figure(1)
plot(data(:,1),data(:,3))
hold on
plot(data(ii,1),data(ii,3),'k.','MarkerSize',20)

% find where these values are not monotonically increasing (i.e. a breath)
diff = ii(2:end) - ii(1:end-1);
ind = find(diff ~= 1);

% eliminate any indices inside breath 
for i = 1:length(ind)
ii(ind(i)-20:ind(i)+20) = NaN;
end
ii(isnan(ii)) = [];

plot(data(ii,1),data(ii,3),'r.','MarkerSize',20)

% set to mean value
data(ii,3) = mean(data(:,3));

% subtract mean to zero entire data series
data(:,3) = data(:,3) - mean(data(:,3));

% plot final, corrected data
plot(data(:,1),data(:,3),'k')


%% fix channel 3 (column 4)

% find data in mid-range (around mean value)
ii = find(data(:,4) < 5 & data(:,4) > -5);
plot(data(:,1),data(:,4))
hold on
plot(data(ii,1),data(ii,4),'k.')

diff = ii(2:end) - ii(1:end-1);
ind = find(diff ~= 1);

for i = 1:length(ind)
ii(ind(i)-20:ind(i)+20) = NaN;
end

ii(isnan(ii)) = [];

plot(data(ii,1),data(ii,4),'r.')

% set to mean value
data(ii,4) = mean(data(:,4));

% subtract mean to zero entire data series
data(:,4) = data(:,4) - mean(data(:,4));

% plot final, corrected data
plot(data(:,1),data(:,4),'k')

%%
% plot cleaned data only

figure(2)
plot(data(:,1),data(:,3),data(:,1),data(:,4))


%% save file
% save
savename = strcat(regexprep(filename,'.csv',''),'_FIXED');
csvwrite(savename,data)

