cd /Users/julievanderhoop/Documents/MATLAB/DQrespO2/DQ2013/ForAndreas
load('Nainoa13_273_A-post.csv')

data = Nainoa13_273_A_post;

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

% find min/max values (need quite a high threshold)
% [maxtab,mintab] = peakdet(data(:,3),10);

% find data in mid-range (around mean value)
ii = find(data(:,3) < 6 & data(:,3) > 0);
plot(data(:,1),data(:,3))
hold on
% plot(data(ii,1),data(ii,3),'k.')

% set to mean value
data(ii,3) = mean(data(:,3));

% plot
plot(data(:,1),data(:,3),'r')


%% fix channel 3 (column 4)

% find data in mid-range (around mean value)
ii = find(data(:,4) < 5 & data(:,3) > -5);
plot(data(:,1),data(:,4))
hold on
% plot(data(ii,1),data(ii,4),'k.')

% set to mean value
data(ii,4) = mean(data(:,4));

% plot
plot(data(:,1),data(:,4),'r')

%% save file
% save
% csvwrite('Nainoa13_273_A_post_FIXED',data)

