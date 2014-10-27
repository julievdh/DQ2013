% Glide Data Look

% load data
% Individual: 1 = Hoku; 2 = Liko
% Condition: 0 = no tag; 1 = tag; 3 = tag + 2; 5 = tag + 4
% Data: [Cd ZO1, Cd ZO2, Cd Fluke, R2 ZO1, R2 ZO2, R2 Fluke, Cd ZO1 Noren, 
%       Cd ZO2 Noren]
load('GlideData')

%% plot data

% Figure 1: boxplot of drag coefficients by condition
% Method 1
figure(1)
subplot(221)
boxplot(-data(individual == 1,1),condition(individual == 1))
text(1,-0.01,num2str(sum(~isnan(data(individual == 1 & condition == 0,1))))) 
text(2,-0.01,num2str(sum(~isnan(data(individual == 1 & condition == 1,1)))))
text(3,-0.01,num2str(sum(~isnan(data(individual == 1 & condition == 3,1)))))
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

[ax4,h3]=suplabel('Method 2: 1 s Moving Average'  ,'t');

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
title('1 s MAV')

subplot(224)
boxplot(data(individual == 2,10),condition(individual == 2))
text(1,-0.01,num2str(sum(~isnan(data(individual == 2 & condition == 0,10))))) 
text(2,-0.01,num2str(sum(~isnan(data(individual == 2 & condition == 1,10)))))
text(3,-0.01,num2str(sum(~isnan(data(individual == 2 & condition == 3,10)))))
text(4,-0.01,num2str(sum(~isnan(data(individual == 2 & condition == 5,10)))))
ylim([-0.02 0.07])
xlabel('Condition')

[ax4,h3]=suplabel('Average of ZO1 and ZO2'  ,'t');


%% Pairwise comparison for ZOs? 
% (Ho = no significant difference between Cd estimated from ZO1 and ZO2)

% find where have pairs
matched = ~isnan(data(:,7)) & ~isnan(data(:,8));

% create subsets of data
matchdata = data(matched,:);
matchindividual = individual(matched);
matchcondition = condition(matched);

% paired t test, bonferroni correction
% for hoku, condition 0
[h.hoku0,p.hoku0,ci,stats.hoku0] = ttest(matchdata(matchindividual == 1 & matchcondition == 0,7),matchdata(matchindividual == 1 & matchcondition == 0,8),'alpha',0.05/3);
[h.hoku1,p.hoku1,ci,stats.hoku1] = ttest(matchdata(matchindividual == 1 & matchcondition == 1,7),matchdata(matchindividual == 1 & matchcondition == 1,8),'alpha',0.05/3);
[h.hoku3,p.hoku3,ci,stats.hoku3] = ttest(matchdata(matchindividual == 1 & matchcondition == 3,7),matchdata(matchindividual == 1 & matchcondition == 3,8),'alpha',0.05/3);

[h.liko0,p.liko0,ci,stats.liko0] = ttest(matchdata(matchindividual == 2 & matchcondition == 0,7),matchdata(matchindividual == 2 & matchcondition == 0,8),'alpha',0.05/4);
[h.liko1,p.liko1,ci,stats.liko1] = ttest(matchdata(matchindividual == 2 & matchcondition == 1,7),matchdata(matchindividual == 2 & matchcondition == 1,8),'alpha',0.05/4);
[h.liko3,p.liko3,ci,stats.liko3] = ttest(matchdata(matchindividual == 2 & matchcondition == 3,7),matchdata(matchindividual == 2 & matchcondition == 3,8),'alpha',0.05/4);
[h.liko5,p.liko5,ci,stats.liko5] = ttest(matchdata(matchindividual == 2 & matchcondition == 5,7),matchdata(matchindividual == 2 & matchcondition == 5,8),'alpha',0.05/4);


