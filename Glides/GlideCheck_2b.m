% Import glide .csv 
cd /Users/julievanderhoop/Documents/P6_NOPPTagDrag/DolphinQuest2013/Glides/Old
A = importdata('UWC_Liho_290_2b.csv',',',2);
rostrum = A.data(:,1:5);
pfint = A.data(:,6:10);
dfini = A.data(:,11:15);
ZO1 = A.data(:,16:20);
fluke = A.data(:,21:25);
ZO2 = A.data(:,26:30);

% set cutoff point for fluke
ii = find(fluke(:,5) < 2474); % frame from visual
fluke = fluke(ii,:);

%% 
% plot velocity from different body points
figure(1)
set(gcf,'Position',[1325 130 1000 520])
subplot(611); box on; hold on
plot(rostrum(:,1),rostrum(:,4),'b')
legend('Rostrum','Location','SW')
legend boxoff
xlim([min(rostrum(:,1)),max(fluke(:,1))])

subplot(612); box on; hold on
plot(pfint(:,1),pfint(:,4),'r')
xlim([min(rostrum(:,1)),max(fluke(:,1))])
legend('Pec Fin Insertion','Location','SW')
legend boxoff

subplot(613); box on; hold on
plot(dfini(:,1),dfini(:,4),'k')
xlim([min(rostrum(:,1)),max(fluke(:,1))])
legend('Dorsal Fin Insertion','Location','SW')
legend boxoff

subplot(615); box on; hold on
plot(ZO1(:,1),ZO1(:,4),'m')
xlim([min(rostrum(:,1)),max(fluke(:,1))])
legend('Zinc Oxide 1','Location','SW')
legend boxoff

subplot(614); box on; hold on
plot(fluke(:,1),fluke(:,4),'g')
xlim([min(rostrum(:,1)),max(fluke(:,1))])
xlabel(' ')
legend('Fluke Tip','Location','SW')
legend boxoff

subplot(616); box on; hold on
plot(ZO2(:,1),ZO2(:,4),'m')
xlim([min(rostrum(:,1)),max(fluke(:,1))])
legend('Zinc Oxide 2','Location','SW')
legend boxoff
xlabel('Time (s)')

%%
% linear fit
[rostrum_s, rostrum_i, rostrum_STAT] = myregr(rostrum(:,1), rostrum(:,4),0);
rostrum_fit = rostrum_s.value*rostrum(:,1) + rostrum_i.value;

[pfint_s, pfint_i, pfint_STAT] = myregr(pfint(:,1), pfint(:,4),0);
pfint_fit = pfint_s.value*pfint(:,1) + pfint_i.value;

[dfini_s, dfini_i, dfini_STAT] = myregr(dfini(:,1), dfini(:,4),0);
dfini_fit = dfini_s.value*dfini(:,1) + dfini_i.value;

[ZO1_s, ZO1_i, ZO1_STAT] = myregr(ZO1(:,1), ZO1(:,4),0);
ZO1_fit = ZO1_s.value*ZO1(:,1) + ZO1_i.value;

[fluke_s, fluke_i, fluke_STAT] = myregr(fluke(:,1), fluke(:,4),0);
fluke_fit = fluke_s.value*fluke(:,1) + fluke_i.value;

[ZO2_s, ZO2_i, ZO2_STAT] = myregr(ZO2(:,1), ZO2(:,4),0);
ZO2_fit = ZO2_s.value*ZO2(:,1) + ZO2_i.value;

%%
% plot fits
subplot(611)
plot(rostrum(:,1),rostrum_fit,'k')
subplot(612)
plot(pfint(:,1),pfint_fit,'k')
subplot(613)
plot(dfini(:,1),dfini_fit,'k')
subplot(615)
plot(ZO1(:,1),ZO1_fit,'k')
subplot(614)
plot(fluke(:,1),fluke_fit,'k')
subplot(616)
plot(ZO2(:,1),ZO2_fit,'k')


% [ax2,h2]=suplabel('Velocity (m/s)','y');
% set(h2,'FontSize',14)

% label with RSE
text(82.55,11.8,['RSE = ',num2str(rostrum_STAT.rse)])
text(82.55,9.57,['RSE = ',num2str(pfint_STAT.rse)])
text(82.55,7.54,['RSE = ',num2str(dfini_STAT.rse)])
text(82.55,5.50,['RSE = ',num2str(fluke_STAT.rse)])
text(82.55,3.55,['RSE = ',num2str(ZO1_STAT.rse)])
text(82.55,1.25,['RSE = ',num2str(ZO2_STAT.rse)])

% label with R-square
text(82.55,11.5,['R^2 = ',num2str(rostrum_STAT.rsq)])
text(82.55,9.27,['R^2 = ',num2str(pfint_STAT.rsq)])
text(82.55,7.24,['R^2 = ',num2str(dfini_STAT.rsq)])
text(82.55,5.20,['R^2 = ',num2str(fluke_STAT.rsq)])
text(82.55,3.25,['R^2 = ',num2str(ZO1_STAT.rsq)])
text(82.55,0.95,['R^2 = ',num2str(ZO2_STAT.rsq)])

% label with slope
text(82.55,11.2,['m = ',num2str(rostrum_s.value)])
text(82.55,8.97,['m = ',num2str(pfint_s.value)])
text(82.55,6.94,['m = ',num2str(dfini_s.value)])
text(82.55,4.90,['m = ',num2str(fluke_s.value)])
text(82.55,2.95,['m = ',num2str(ZO1_s.value)])
text(82.55,0.65,['m = ',num2str(ZO2_s.value)])

% calculate variability from linear fit -- which are good vs. bad estimators? 

%% plot all together
figure(2); hold on

plot(rostrum(:,1),rostrum(:,4),'b')
plot(pfint(:,1),pfint(:,4),'r')
plot(dfini(:,1),dfini(:,4),'k')
plot(fluke(:,1),fluke(:,4),'color',[0,0.5,0])
plot(ZO1(:,1),ZO1(:,4),'color',[1,0,1])
plot(ZO2(:,1),ZO2(:,4),'color',[0.349,0.2,0.32941])

xlim([min(rostrum(:,1)),max(fluke(:,1))])
xlabel('Time (s)')
ylabel('Velocity (m/s')


%% 
% c = slope of deceleration
% Cd = c(2*(Mb+Ma)/(SAw * rho * V^2)

% Mb = body mass (kg)
    % Liho = 339.7 lbs = 154 kg
    % Hoku = 388 lbs = 176 kg
Mb = 154*1.06; % 1.06 = factor for added water mass
% Ma = entrained water mass (kg)
% SAw = reference area (m^2) % estimated wetted surface area
SAw = 0.08*Mb.^0.65;
% rho = water density (kg m^3) - for 80F water, salinity 36
rho = 1023.61;
% GET TEMP/SAL NUMBERS FROM JULIE, GET REF WITH TABLE

Cd_rostrum = (abs(rostrum_s.value)*(2*Mb))/(SAw*rho*nanmean(rostrum(:,4).^2))
Cd_pfint = (abs(pfint_s.value)*(2*Mb))/(SAw*rho*nanmean(pfint(:,4).^2))
Cd_dfini = (abs(dfini_s.value)*(2*Mb))/(SAw*rho*nanmean(dfini(:,4).^2))
Cd_ZO1 = (abs(ZO1_s.value)*(2*Mb))/(SAw*rho*nanmean(ZO1(:,4).^2))
Cd_fluke = (abs(fluke_s.value)*(2*Mb))/(SAw*rho*nanmean(fluke(:,4).^2))
Cd_ZO2 = (abs(ZO2_s.value)*(2*Mb))/(SAw*rho*nanmean(ZO2(:,4).^2))

%% NOREN METHOD
% Cd = (2*D)/(rho*Saw*V^2)
% D = Mb*acceleration

% filter ZO1 data
windowSize = 30; % 30 frames = 1s
ZO1_filt = filter(ones(1,windowSize)/windowSize,1,ZO1);
ZO2_filt = filter(ones(1,windowSize)/windowSize,1,ZO2);

% compute acceleration from smoothed velocity
ZO1_filt_ax = (ZO1_filt(2:end,4) - ZO1_filt(1:end-1,4))/(1/29.97);
ZO2_filt_ax = (ZO2_filt(2:end,4) - ZO2_filt(1:end-1,4))/(1/29.97);

% Calculate Cd from drag (D = Mb*accel)
Cd_ZO1 = (2*abs(Mb.*ZO1_filt_ax))./(rho*SAw*ZO1_filt(2:end,4).^2);
Cd_ZO1_mn = nanmean(Cd_ZO1)
Cd_ZO2 = (2*abs(Mb.*ZO2_filt_ax))./(rho*SAw*ZO2_filt(2:end,4).^2);
Cd_ZO2_mn = nanmean(Cd_ZO2)



