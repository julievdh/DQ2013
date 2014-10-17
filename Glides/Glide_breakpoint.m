% Calculates breakpoint in deceleration, where movement likely/where
% deceleration stops. 
% Jan 24 2014
% UPDATED 1 OCT 2014

clear all; close all; clc

% IMPORT DATA

% Import glide .csv 
cd /Users/julievanderhoop/Documents/P6_NOPPTagDrag/DolphinQuest2013/Glides
filename = 'UWC_Liho_287_c.csv';
A = importdata(filename,',',2);
ZO1 = A.data(:,1:5);
ZO2 = A.data(:,6:10);
fluke = A.data(:,11:15);

% % set cutoff point
% cutoff = 2537;
% ii = find(fluke(:,5) < cutoff); % frame from visual
% fluke = fluke(ii,:);
% ii = find(ZO1(:,5) < cutoff); 
% ZO1 = ZO1(ii,:);
% ii = find(ZO2(:,5) < cutoff);
% ZO2 = ZO2(ii,:);


%% CALCULATE BREAK POINTS

% find glide breakpoint for ZO1
[s.ZO1,i.ZO1,STAT.ZO1,fit1.ZO1,fit2.ZO1,brk.ZO1] = breakslope(ZO1);

%% find glide breakpoint for ZO2
[s.ZO2,i.ZO2,STAT.ZO2,fit1.ZO2,fit2.ZO2,brk.ZO2] = breakslope(ZO2);

%% find glide breakpoint for fluke
[s.fluke,i.fluke,STAT.fluke,fit1.fluke,fit2.fluke,brk.fluke] = breakslope(fluke);

%% CALCULATE CD FROM DECELERATION

% c = slope of deceleration
% Cd = c(2*(Mb+Ma)/(SAw * rho)

% Mb = body mass (kg)
    % Liho = 339.7 lbs = 154 kg
    % Hoku = 388 lbs = 176 kg
Mb = 154*1.06;
% Ma = entrained water mass (kg) = Mb * 1.06
% SAw = reference area (m^2) % estimated wetted surface area
SAw = 0.08*Mb.^0.65;
% rho = water density (kg m^3) - for 24C water, salinity 31 from Oct 16, 17
% as measured at DQO (see water quality for glide.jrl.o13014.xlsx)
rho = 1021;

% calculate Cd and lower and upper estimates based on regression slope
% estimate for ZO1
Cd.ZO1(1) = (s.ZO1(1).value*(2*Mb))/(SAw*rho);
Cd.ZO1(2) = (s.ZO1(1).lv*(2*Mb))/(SAw*rho);
Cd.ZO1(3) = (s.ZO1(1).uv*(2*Mb))/(SAw*rho);

% for ZO2
Cd.ZO2(1) = (s.ZO2(1).value*(2*Mb))/(SAw*rho);
Cd.ZO2(2) = (s.ZO2(1).lv*(2*Mb))/(SAw*rho);
Cd.ZO2(3) = (s.ZO2(1).uv*(2*Mb))/(SAw*rho);


% for fluke
Cd.fluke(1) = (s.fluke(1).value*(2*Mb))/(SAw*rho);
Cd.fluke(2) = (s.fluke(1).lv*(2*Mb))/(SAw*rho);
Cd.fluke(3) = (s.fluke(1).uv*(2*Mb))/(SAw*rho);

CDALL = [Cd.ZO1(1) Cd.ZO2(1) Cd.fluke(1)];
STATALL = [STAT.ZO1(1).rsq STAT.ZO2(1).rsq STAT.fluke(1).rsq];
