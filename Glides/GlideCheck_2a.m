% Import glide .csv 
cd /Users/julievanderhoop/Documents/NOPPTagDrag/DolphinQuest2013/Glides
A = importdata('UWC_Liho_290_2a.csv',',',2);
ZO1 = A.data(:,1:5);
ZO2 = A.data(:,6:10);
fluke = A.data(:,11:15);

% set cutoff point for fluke
ii = find(fluke(:,5) < 785); % frame from visual
fluke = fluke(ii,:);

% %% TEST - go only where slows down the most, before re-accels
% ii = find(ZO1(:,1) < 24.4215);
% ZO1 = ZO1(ii,:);
% 
% ii = find(ZO2(:,1) < 24.4215);
% ZO2 = ZO2(ii,:);

%% 
% plot velocity from different body points
figure(1)
set(gcf,'Position',[1325 130 1000 520])

subplot(311); hold on
plot(fluke(:,1),fluke(:,4),'g')
xlim([min(ZO1(:,1)),max(fluke(:,1))])
xlabel(' ')
legend('Fluke Tip','Location','SW')
legend boxoff

subplot(312); hold on
plot(ZO1(:,1),ZO1(:,4),'m')
xlim([min(ZO1(:,1)),max(fluke(:,1))])
legend('Zinc Oxide 1','Location','SW')
legend boxoff

subplot(313); hold on
plot(ZO2(:,1),ZO2(:,4),'m')
xlim([min(ZO1(:,1)),max(fluke(:,1))])
legend('Zinc Oxide 2','Location','SW')
legend boxoff
xlabel('Time (s)')


%%
% linear fit
% [rostrum_s, rostrum_i, rostrum_STAT] = myregr(rostrum(:,1), rostrum(:,4),0);
% rostrum_fit = rostrum_s.value*rostrum(:,1) + rostrum_i.value;
% 
% [pfint_s, pfint_i, pfint_STAT] = myregr(pfint(:,1), pfint(:,4),0);
% pfint_fit = pfint_s.value*pfint(:,1) + pfint_i.value;
% 
% [dfini_s, dfini_i, dfini_STAT] = myregr(dfini(:,1), dfini(:,4),0);
% dfini_fit = dfini_s.value*dfini(:,1) + dfini_i.value;
% 
% [dfint_s, dfint_i, dfint_STAT] = myregr(dfint(:,1), dfint(:,4),0);
% dfint_fit = dfint_s.value*dfint(:,1) + dfint_i.value;

[fluke_s, fluke_i, fluke_STAT] = myregr(fluke(:,1), fluke(:,4),0);
fluke_fit = fluke_s.value*fluke(:,1) + fluke_i.value;

[ZO1_s, ZO1_i, ZO1_STAT] = myregr(ZO1(:,1), ZO1(:,4),0);
ZO1_fit = ZO1_s.value*ZO1(:,1) + ZO1_i.value;

[ZO2_s, ZO2_i, ZO2_STAT] = myregr(ZO2(:,1), ZO2(:,4),0);
ZO2_fit = ZO2_s.value*ZO2(:,1) + ZO2_i.value;

%%
% plot fits
% subplot(711)
% plot(rostrum(:,1),rostrum_fit,'k')
% subplot(712)
% plot(pfint(:,1),pfint_fit,'k')
% subplot(713)
% plot(dfini(:,1),dfini_fit,'k')
% subplot(714)
% plot(dfint(:,1),dfint_fit,'k')
subplot(311)
plot(fluke(:,1),fluke_fit,'k')
subplot(312)
plot(ZO1(:,1),ZO1_fit,'k')
subplot(313)
plot(ZO2(:,1),ZO2_fit,'k')


% [ax2,h2]=suplabel('Velocity (m/s)','y');
% set(h2,'FontSize',14)

% % label with RSE
% text(26.22,8.5694,['RSE = ',num2str(rostrum_STAT.rse)])
% text(26.22,6.7143,['RSE = ',num2str(pfint_STAT.rse)])
% text(26.22,4.8571,['RSE = ',num2str(dfini_STAT.rse)])
% text(26.22,3.0816,['RSE = ',num2str(dfint_STAT.rse)])
% text(26.22,1.2653,['RSE = ',num2str(fluke_STAT.rse)])
% 
% % label with R-square
% text(26.22,8.2694,['R^2 = ',num2str(rostrum_STAT.rsq)])
% text(26.22,6.4143,['R^2 = ',num2str(pfint_STAT.rsq)])
% text(26.22,4.5571,['R^2 = ',num2str(dfini_STAT.rsq)])
% text(26.22,2.7816,['R^2 = ',num2str(dfint_STAT.rsq)])
% text(26.22,0.9653,['R^2 = ',num2str(fluke_STAT.rsq)])
% 
% % label with slope
% text(26.22,7.9694,['m = ',num2str(rostrum_s.value)])
% text(26.22,6.1143,['m = ',num2str(pfint_s.value)])
% text(26.22,4.2571,['m = ',num2str(dfini_s.value)])
% text(26.22,2.4816,['m = ',num2str(dfint_s.value)])
% text(26.22,0.6653,['m = ',num2str(fluke_s.value)])


% calculate variability from linear fit -- which are good vs. bad estimators? 

%% plot all together
figure(2); hold on

% plot(rostrum(:,1),rostrum(:,4),'b')
% plot(pfint(:,1),pfint(:,4),'r')
% plot(dfini(:,1),dfini(:,4),'k')
% plot(dfint(:,1),dfint(:,4),'color',[0.043, 0.517, 0.78])
plot(fluke(:,1),fluke(:,4),'color',[0,0.5,0])
plot(ZO1(:,1),ZO1(:,4),'color',[1,0,1])
plot(ZO2(:,1),ZO2(:,4),'color',[0.349,0.2,0.32941])

xlim([min(rostrum(:,1)),max(fluke(:,1))])
xlabel('Time (s)')
ylabel('Velocity (m/s')

%% 
% c = slope of deceleration
% Cd = c(2*(Mb+Ma)/(SAw * rho)

% Mb = body mass (kg)
    % Liho = 339.7 lbs = 154 kg
    % Hoku = 388 lbs = 176 kg
Mb = 154*1.06;
% Ma = entrained water mass (kg)
% SAw = reference area (m^2) % estimated wetted surface area
SAw = 0.08*Mb.^0.65;
% rho = water density (kg m^3) - for 80F water, salinity 36
rho = 1023.61;
% GET TEMP/SAL NUMBERS FROM JULIE, GET REF WITH TABLE

Cd_rostrum = (rostrum_s.value*(2*Mb))/(SAw*rho)
Cd_pfint = (pfint_s.value*(2*Mb))/(SAw*rho)
Cd_dfini = (dfini_s.value*(2*Mb))/(SAw*rho)
Cd_ZO1 = (ZO1_s.value*(2*Mb))/(SAw*rho)
Cd_fluke = (fluke_s.value*(2*Mb))/(SAw*rho)
Cd_ZO2 = (ZO2_s.value*(2*Mb))/(SAw*rho)


