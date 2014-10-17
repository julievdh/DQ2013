% compare Go Pro and Canon glide 

close all; clear all; clc

% Import UWC glide .csv 
cd /Users/julievanderhoop/Documents/P6_NOPPTagDrag/DolphinQuest2013/Glides
UWC_A = importdata('UWC_Liho_290_2a.csv',',',2);

Cfluke = UWC_A.data(:,21:25);
CZO1 = UWC_A.data(:,26:30);
CZO2 = UWC_A.data(:,31:35);

% set cutoff point for fluke
ii = find(Cfluke(:,5) < 785); % frame from visual
Cfluke = Cfluke(ii,:);

% Import UWGP glide .csv
UWGP_A = importdata('UWGP_Liho_290_2a.csv',',',2);

GPZO1 = UWGP_A.data(:,1:5);
GPZO2 = UWGP_A.data(:,6:10);
GPfluke = UWGP_A.data(:,11:15);

% set cutoff point for all body points
ii = find(GPZO1(:,5) < 1235); % frame from visual
GPZO1 = GPZO1(ii,:);
ii = find(GPZO2(:,5) < 1235); % frame from visual
GPZO2 = GPZO2(ii,:);
ii = find(GPfluke(:,5) < 1235); % frame from visual
GPfluke = GPfluke(ii,:);

% plot 
figure(1)
subplot(211); hold on
plot(CZO1(:,1),CZO1(:,4),CZO2(:,1),CZO2(:,4),Cfluke(:,1),Cfluke(:,4))
subplot(212); hold on
plot(GPZO1(:,1),GPZO1(:,4),GPZO2(:,1),GPZO2(:,4),GPfluke(:,1),GPfluke(:,4))

%% regress

% Canon
[Cfluke_s, Cfluke_i, Cfluke_STAT] = myregr(Cfluke(:,1), Cfluke(:,4),0);
Cfluke_fit = Cfluke_s.value*Cfluke(:,1) + Cfluke_i.value;

[CZO1_s, CZO1_i, CZO1_STAT] = myregr(CZO1(:,1), CZO1(:,4),0);
CZO1_fit = CZO1_s.value*CZO1(:,1) + CZO1_i.value;

[CZO2_s, CZO2_i, CZO2_STAT] = myregr(CZO2(:,1), CZO2(:,4),0);
CZO2_fit = CZO2_s.value*CZO2(:,1) + CZO2_i.value;

% GoPro

[GPfluke_s, GPfluke_i, GPfluke_STAT] = myregr(GPfluke(:,1), GPfluke(:,4),0);
GPfluke_fit = GPfluke_s.value*GPfluke(:,1) + GPfluke_i.value;

[GPZO1_s, GPZO1_i, GPZO1_STAT] = myregr(GPZO1(:,1), GPZO1(:,4),0);
GPZO1_fit = GPZO1_s.value*GPZO1(:,1) + GPZO1_i.value;

[GPZO2_s, GPZO2_i, GPZO2_STAT] = myregr(GPZO2(:,1), GPZO2(:,4),0);
GPZO2_fit = GPZO2_s.value*GPZO2(:,1) + GPZO2_i.value;

%% plot fits
figure(1)
subplot(211)
plot(Cfluke(:,1),Cfluke_fit,CZO1(:,1),CZO1_fit,CZO2(:,1),CZO2_fit,'color','k');
subplot(212)
plot(GPfluke(:,1),GPfluke_fit,GPZO1(:,1),GPZO1_fit,GPZO2(:,1),GPZO2_fit,'color','k');

%% print stats

disp('GP slopes')
disp([GPZO1_s.value GPZO2_s.value GPfluke_s.value])

disp('Canon slopes')
disp([CZO1_s.value CZO2_s.value Cfluke_s.value])

disp('GP R^2')
disp([GPZO1_STAT.rsq GPZO2_STAT.rsq GPfluke_STAT.rsq])

disp('Canon R^2')
disp([CZO1_STAT.rsq CZO2_STAT.rsq Cfluke_STAT.rsq])
