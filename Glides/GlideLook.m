% Glide Data Look

% load data
% Individual: 1 = Hoku; 2 = Liko
% Condition: 0 = no tag; 1 = tag; 3 = tag + 2; 5 = tag + 4
% Data: [Cd ZO1, Cd ZO2, Cd Fluke, R2 ZO1, R2 ZO2, R2 Fluke, Cd ZO1 Noren, 
%       Cd ZO2 Noren]
load('GlideData')

% plot data

% Figure 1: boxplot of drag coefficients by condition
% Method 1
figure(1)
subplot(221)
boxplot(-data(individual == 1,1),condition(individual == 1))
ylabel('C_d'); title('ZO1')

subplot(222)
boxplot(-data(individual == 1,2),condition(individual == 1))
title('ZO2')

subplot(223)
boxplot(-data(individual == 2,1),condition(individual == 2))
xlabel('Condition'); ylabel('C_d')

subplot(224)
boxplot(-data(individual == 2,2),condition(individual == 2))
xlabel('Condition')

[ax4,h3]=suplabel('Method 1: Bilo & Nachtigal'  ,'t');

%% Method 2: moving average (Noren)
figure(3)
subplot(221)
boxplot(data(individual == 1,7),condition(individual == 1))
text(1,0,num2str(sum(~isnan(data(individual == 1 & condition == 0,7))))) 
text(2,0,num2str(sum(~isnan(data(individual == 1 & condition == 1,7)))))
text(3,0,num2str(sum(~isnan(data(individual == 1 & condition == 3,7)))))
ylabel('C_d'); title('ZO1')

subplot(222)
boxplot(data(individual == 1,8),condition(individual == 1))
text(1,0,num2str(sum(~isnan(data(individual == 1 & condition == 0,8))))) 
text(2,0,num2str(sum(~isnan(data(individual == 1 & condition == 1,8)))))
text(3,0,num2str(sum(~isnan(data(individual == 1 & condition == 3,8)))))
title('ZO2')

subplot(223)
boxplot(data(individual == 2,7),condition(individual == 2))
text(1,0,num2str(sum(~isnan(data(individual == 2 & condition == 0,7))))) 
text(2,0,num2str(sum(~isnan(data(individual == 2 & condition == 1,7)))))
text(3,0,num2str(sum(~isnan(data(individual == 2 & condition == 3,7)))))
text(4,0,num2str(sum(~isnan(data(individual == 2 & condition == 5,7)))))
ylim([-0.02 0.07])
xlabel('Condition'); ylabel('C_d')

subplot(224)
boxplot(data(individual == 2,8),condition(individual == 2))
text(1,0,num2str(sum(~isnan(data(individual == 2 & condition == 0,8))))) 
text(2,0,num2str(sum(~isnan(data(individual == 2 & condition == 1,8)))))
text(3,0,num2str(sum(~isnan(data(individual == 2 & condition == 3,8)))))
text(4,0,num2str(sum(~isnan(data(individual == 2 & condition == 5,8)))))
ylim([-0.02 0.07])
xlabel('Condition')

[ax4,h3]=suplabel('Method 2: 30s Moving Average'  ,'t');

%% Average both ZO points using methods 1 and 2
data(:,9) = nanmean(data(:,1:2)');
data(:,10) = nanmean(data(:,7:8)');


figure(4)


subplot(221)
boxplot(-data(individual == 1,9),condition(individual == 1))
text(1,-0.01,num2str(sum(~isnan(data(individual == 1 & condition == 0,9))))) 
text(2,-0.01,num2str(sum(~isnan(data(individual == 1 & condition == 1,9)))))
text(3,-0.01,num2str(sum(~isnan(data(individual == 1 & condition == 3,9)))))
ylim([-0.02 0.14])
title('Unfiltered'); ylabel('C_d')

subplot(223)
boxplot(-data(individual == 2,9),condition(individual == 2))
text(1,-0.01,num2str(sum(~isnan(data(individual == 2 & condition == 0,9))))) 
text(2,-0.01,num2str(sum(~isnan(data(individual == 2 & condition == 1,9)))))
text(3,-0.01,num2str(sum(~isnan(data(individual == 2 & condition == 3,9)))))
text(4,-0.01,num2str(sum(~isnan(data(individual == 2 & condition == 5,9)))))
ylim([-0.02 0.07])
xlabel('Condition'); ylabel('C_d')

subplot(222)
boxplot(data(individual == 1,10),condition(individual == 1))
text(1,-0.01,num2str(sum(~isnan(data(individual == 1 & condition == 0,10))))) 
text(2,-0.01,num2str(sum(~isnan(data(individual == 1 & condition == 1,10)))))
text(3,-0.01,num2str(sum(~isnan(data(individual == 1 & condition == 3,10)))))
ylim([-0.02 0.14])
title('30s MAV')

subplot(224)
boxplot(data(individual == 2,10),condition(individual == 2))
text(1,-0.01,num2str(sum(~isnan(data(individual == 2 & condition == 0,10))))) 
text(2,-0.01,num2str(sum(~isnan(data(individual == 2 & condition == 1,10)))))
text(3,-0.01,num2str(sum(~isnan(data(individual == 2 & condition == 3,10)))))
text(4,-0.01,num2str(sum(~isnan(data(individual == 2 & condition == 5,10)))))
ylim([-0.02 0.07])
xlabel('Condition')

[ax4,h3]=suplabel('Average of ZO1 and ZO2'  ,'t');
