close all; clear all; clc

% Import glide .csv
cd /Users/julievanderhoop/Documents/NOPPTagDrag/DolphinQuest2013/Glides/CUT
A = importdata('UWC_Liho_289_2a.csv',',',2);
Cond = 1;
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

legend('Zinc Oxide 1','Zinc Oxide 2','Location','SW')
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

%% SET PARAMETERS

% Add condition-specific tag weights and surface areas
if Cond == 1
    Mt = 0.250; % tag weighs 250 g (weighed on necropsy scale 17 Mar 2016)
    SAt = 0.024; % tag surface area from CFD sims
else if Cond == 3
        Mt = 0.350+(0.01)*4; % GET ACTUAL WEIGHT OF ELEMENTS
        SAt = 0.024+(0.0105)*4; % tag and element surface area from CFD sims
    else if Cond == 5
            Mt = 0.350+(0.01)*8;
            SAt = 0.024+(0.0105)*4;
        else Mt = 0; SAt = 0;
        end
    end
end
% Mb = body mass (kg)
% Liho = 339.7 lbs = 154 kg
% Hoku = 388 lbs = 176 kg
% Ma = entrained water mass (kg) = 1.06
Mb = (154+Mt)*1.06;
% SAw = reference area (m^2) % estimated wetted surface area from Fish 1993
% Add SAt = surface area of tag from CFD
SAw = (0.08*Mb.^0.65)+SAt;
% rho = water density (kg m^3) - for 24C water, salinity 31 from Oct 16, 17
% as measured at DQO (see water quality for glide.jrl.o13014.xlsx)
rho = 1021;

%% NOREN METHOD
% Cd = (2*D)/(rho*Saw*V^2)
% D = Mb*acceleration

% filter ZO1 and ZO2 data
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

% to export: CD from ZO1, from ZO2, duration of glide
CDmav = abs([Cd_ZO1_mn Cd_ZO2_mn mean([sum(isnan(ZO2_filt(:,4))) sum(isnan(ZO1_filt(:,4)))])])