% Import glide .csv 
cd /Users/julievanderhoop/Documents/P6_NOPPTagDrag/DolphinQuest2013/Glides
A = importdata('UWC_Liho_290_2.csv',',',2);
rostrum = A.data(:,1:5);
pfint = A.data(:,6:10);
dfini = A.data(:,11:15);
dfint = A.data(:,16:20);
fluke = A.data(:,21:25);

% set cutoff point for fluke
ii = find(fluke(:,5) < 785); % frame 785 from visual
fluke = fluke(ii,:);

%% 
% plot velocity from different body points
figure(1)
set(gcf,'Position',[1325 130 1000 520])
subplot(511); hold on
plot(rostrum(:,1),rostrum(:,4),'b')
legend('Rostrum','Location','SW')
legend boxoff
xlim([min(rostrum(:,1)),max(fluke(:,1))])

subplot(512); hold on
plot(pfint(:,1),pfint(:,4),'r')
xlim([min(rostrum(:,1)),max(fluke(:,1))])
legend('Pec Fin Insertion','Location','SW')
legend boxoff

subplot(513); hold on
plot(dfini(:,1),dfini(:,4),'k')
xlim([min(rostrum(:,1)),max(fluke(:,1))])
legend('Dorsal Fin Insertion','Location','SW')
legend boxoff

subplot(514); hold on
plot(dfint(:,1),dfint(:,4),'m')
xlim([min(rostrum(:,1)),max(fluke(:,1))])
legend('Dorsal Fin Tip','Location','SW')
legend boxoff

subplot(515); hold on
plot(fluke(:,1),fluke(:,4),'g')
xlim([min(rostrum(:,1)),max(fluke(:,1))])
xlabel('Time (s)')
legend('Fluke Tip','Location','SW')
legend boxoff


%%
% linear fit
[rostrum_s, rostrum_i, rostrum_STAT] = myregr(rostrum(:,1), rostrum(:,4),0);
rostrum_fit = rostrum_s.value*rostrum(:,1) + rostrum_i.value;

[pfint_s, pfint_i, pfint_STAT] = myregr(pfint(:,1), pfint(:,4),0);
pfint_fit = pfint_s.value*pfint(:,1) + pfint_i.value;

[dfini_s, dfini_i, dfini_STAT] = myregr(dfini(:,1), dfini(:,4),0);
dfini_fit = dfini_s.value*dfini(:,1) + dfini_i.value;

[dfint_s, dfint_i, dfint_STAT] = myregr(dfint(:,1), dfint(:,4),0);
dfint_fit = dfint_s.value*dfint(:,1) + dfint_i.value;

[fluke_s, fluke_i, fluke_STAT] = myregr(fluke(:,1), fluke(:,4),0);
fluke_fit = fluke_s.value*fluke(:,1) + fluke_i.value;

%%
% plot fits
subplot(511)
plot(rostrum(:,1),rostrum_fit,'k')
subplot(512)
plot(pfint(:,1),pfint_fit,'k')
subplot(513)
plot(dfini(:,1),dfini_fit,'k')
subplot(514)
plot(dfint(:,1),dfint_fit,'k')
subplot(515)
plot(fluke(:,1),fluke_fit,'k')

% [ax2,h2]=suplabel('Velocity (m/s)','y');
% set(h2,'FontSize',14)

% label with RSE
text(26.22,8.5694,['RSE = ',num2str(rostrum_STAT.rse)])
text(26.22,6.7143,['RSE = ',num2str(pfint_STAT.rse)])
text(26.22,4.8571,['RSE = ',num2str(dfini_STAT.rse)])
text(26.22,3.0816,['RSE = ',num2str(dfint_STAT.rse)])
text(26.22,1.2653,['RSE = ',num2str(fluke_STAT.rse)])

% label with R-square
text(26.22,8.2694,['R^2 = ',num2str(rostrum_STAT.rsq)])
text(26.22,6.4143,['R^2 = ',num2str(pfint_STAT.rsq)])
text(26.22,4.5571,['R^2 = ',num2str(dfini_STAT.rsq)])
text(26.22,2.7816,['R^2 = ',num2str(dfint_STAT.rsq)])
text(26.22,0.9653,['R^2 = ',num2str(fluke_STAT.rsq)])

% label with slope
text(26.22,7.9694,['m = ',num2str(rostrum_s.value)])
text(26.22,6.1143,['m = ',num2str(pfint_s.value)])
text(26.22,4.2571,['m = ',num2str(dfini_s.value)])
text(26.22,2.4816,['m = ',num2str(dfint_s.value)])
text(26.22,0.6653,['m = ',num2str(fluke_s.value)])


% calculate variability from linear fit -- which are good vs. bad estimators? 



%% 
% c = slope of deceleration
% Cd = c(2*(Mb+Ma)/(SAw * rho)

% Mb = body mass (kg)
    % Liho = 339.7 lbs = 154 kg
    % Hoku = 388 lbs = 176 kg
Mb = 154;
% Ma = entrained water mass (kg)
% SAw = reference area (m^2) % estimated wetted surface area
SAw = 0.08*Mb.^0.65;
% rho = water density (kg m^3) - for 80F water, salinity 36
rho = 1023.61;
% GET TEMP/SAL NUMBERS FROM JULIE, GET REF WITH TABLE

Cd_rostrum = (rostrum_s.value*(2*Mb))/(SAw*rho)
Cd_pfint = (pfint_s.value*(2*Mb))/(SAw*rho)
Cd_dfini = (dfini_s.value*(2*Mb))/(SAw*rho)
Cd_dfint = (dfint_s.value*(2*Mb))/(SAw*rho)
Cd_fluke = (fluke_s.value*(2*Mb))/(SAw*rho)



