% Glide Data Look

% load data
load('GlideData')

% plot data

% Figure 1: boxplot of drag coefficients by condition
figure(1)
subplot(221)
boxplot(-data(individual == 1,1),condition(individual == 1))


subplot(222)
boxplot(-data(individual == 1,2),condition(individual == 1))

subplot(223)
boxplot(-data(individual == 2,1),condition(individual == 2))
xlabel('Condition')

subplot(224)
boxplot(-data(individual == 2,2),condition(individual == 2))
xlabel('Condition')


% calculate average between two ZO points
av = nanmean(data(:,1:2)')';

figure(2)
subplot(121)
boxplot(-av(individual == 1),condition(individual == 1))

subplot(122)
boxplot(-av(individual == 2),condition(individual == 2))
xlabel('Condition')