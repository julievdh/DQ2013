close all; clear all; clc

% Import glide .csv 
cd /Users/julievanderhoop/Documents/NOPPTagDrag/DolphinQuest2013/Glides/CUT
A = importdata('UWC_Liho_288_1a.csv',',',2);
ZO1 = A.data(:,1:5);
ZO2 = A.data(:,6:10);

ZO1 = ZO1(~isnan(ZO1(:,1)),:);
ZO2 = ZO2(~isnan(ZO2(:,1)),:);

%% 
% plot velocity from different body points
figure(1); hold on
set(gcf,'Position',[290 120 1000 520])
% plot(fluke(:,1),fluke(:,4))
plot(ZO1(:,1),ZO1(:,4))
plot(ZO2(:,1),ZO2(:,4))
xlim([min(ZO1(:,1)),max(ZO2(:,1))])

xlabel('Time (s)'); ylabel('Velocity (m/s)'); adjustfigurefont; box on

legend('Fluke','Zinc Oxide 1','Zinc Oxide 2','Location','SW')
legend boxoff

%% SET RULES
ZO1dur = abs(ZO1(end,1) - ZO1(1,1));
ZO2dur = abs(ZO2(end,1) - ZO2(1,1));
if ZO1dur < 1
    error('ZO1 NOT LONG ENOUGH')
end
if ZO2dur < 1
    error('ZO2 NOT LONG ENOUCH')
end

%% Calculate Linear Fit

%[fluke_s, fluke_i, fluke_STAT] = myregr(fluke(:,1), fluke(:,4),0);
%fluke_fit = fluke_s.value*fluke(:,1) + fluke_i.value;

[ZO1_s, ZO1_i, ZO1_STAT] = myregr(ZO1(:,1), ZO1(:,4),0);
ZO1_fit = ZO1_s.value*ZO1(:,1) + ZO1_i.value;

[ZO2_s, ZO2_i, ZO2_STAT] = myregr(ZO2(:,1), ZO2(:,4),0);
ZO2_fit = ZO2_s.value*ZO2(:,1) + ZO2_i.value;

%plot(fluke(:,1),fluke_fit,'k')
plot(ZO1(:,1),ZO1_fit,'k')
plot(ZO2(:,1),ZO2_fit,'k')

% % Rules
% if ZO1_STAT.rsq < 0.2
%     error('R^2 too low; do not use ZO1')
% end
% if ZO2_STAT.rsq < 0.2
%     error('R^2 too low; do not use ZO2')
% end


%% REGRESSION METHOD:
% c = slope of deceleration
% Cd = c(2*(Mb+Ma)/(SAw * rho)

% Mb = body mass (kg)
    % Liho = 339.7 lbs = 154 kg
    % Hoku = 388 lbs = 176 kg
Mb = 176*1.06;
% Ma = entrained water mass (kg)
% SAw = reference area (m^2) % estimated wetted surface area
SAw = 0.08*Mb.^0.65;
% rho = water density (kg m^3) - for 24C water, salinity 31 from Oct 16, 17
% as measured at DQO (see water quality for glide.jrl.o13014.xlsx)
rho = 1021;

% Calculate drag coefficient Cd for three points 
Cd_ZO1_reg = (ZO1_s.value*(2*Mb))/(SAw*rho);
%Cd_fluke = (fluke_s.value*(2*Mb))/(SAw*rho);
Cd_ZO2_reg = (ZO2_s.value*(2*Mb))/(SAw*rho);

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
Cd_ZO1_mn = nanmean(Cd_ZO1);
Cd_ZO2 = (2*abs(Mb.*ZO2_filt_ax))./(rho*SAw*ZO2_filt(2:end,4).^2);
Cd_ZO2_mn = nanmean(Cd_ZO2);

%% BREAKSLOPE 
% find glide breakpoint for ZO1 and ZO2
[s.ZO1,i.ZO1,STAT.ZO1,fit1.ZO1,fit2.ZO1,brk.ZO1] = breakslope(ZO1);
[s.ZO2,i.ZO2,STAT.ZO2,fit1.ZO2,fit2.ZO2,brk.ZO2] = breakslope(ZO2);

% calculate Cd 
Cd.ZO1(1) = (s.ZO1(1).value*(2*Mb))/(SAw*rho);
Cd.ZO2(1) = (s.ZO2(1).value*(2*Mb))/(SAw*rho);

% to export: Cd by regression and Rsqs; Cd by MAV; Glide duration
CDreg = abs([Cd_ZO1_reg Cd_ZO2_reg ZO1_STAT.rsq ZO2_STAT.rsq Cd.ZO1(1) Cd.ZO2(1) brk.ZO1 brk.ZO2]);

% find breakpoint on filtered data
[s.ZO1,i.ZO1,STAT.ZO1,fit1.ZO1,fit2.ZO1,brk.ZO1] = breakslope(ZO1_filt);
[s.ZO2,i.ZO2,STAT.ZO2,fit1.ZO2,fit2.ZO2,brk.ZO2] = breakslope(ZO2_filt);

% calculate Cd 
Cd.ZO1(2) = (s.ZO1(1).value*(2*Mb))/(SAw*rho);
Cd.ZO2(2) = (s.ZO2(1).value*(2*Mb))/(SAw*rho);

% to export
CDmav = abs([Cd_ZO1_mn Cd_ZO2_mn Cd.ZO1(2) Cd.ZO2(2) brk.ZO1 brk.ZO2]);