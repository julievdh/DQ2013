% Import data

cd /Users/julievanderhoop/Documents/P6_NOPPTagDrag/DolphinQuest2013/Glides
UWC_A = importdata('UWC_Liho_290_2a.csv',',',2);

Cfluke = UWC_A.data(:,21:25);
CZO1 = UWC_A.data(:,26:30);
CZO2 = UWC_A.data(:,31:35);

%% Calculate breakpoints using Shape Language Model

% find breakpoints for three body parts - Canon
SLM_CZO2 = slmengine(CZO2(:,1),CZO2(:,4),'degree','linear','knots',3,'plot','off','interiorknots','free');
SLM_CZO1 = slmengine(CZO1(:,1),CZO1(:,4),'degree','linear','knots',3,'plot','off','interiorknots','free');
SLM_Cfluke = slmengine(Cfluke(:,1),Cfluke(:,4),'degree','linear','knots',3,'plot','off','interiorknots','free');

% find derivatives for break points
dCZO1 = slmeval(SLM_CZO1.knots,SLM_CZO1,1);
dCZO2 = slmeval(SLM_CZO2.knots,SLM_CZO2,1);
dCfluke = slmeval(SLM_Cfluke.knots,SLM_Cfluke,1);

% % find breakpoints for three body parts - GoPro
% SLM_GPZO2 = slmengine(GPZO2(:,1),GPZO2(:,4),'degree','linear','knots',3,'plot','on','interiorknots','free');
% SLM_GPZO1 = slmengine(GPZO1(:,1),GPZO1(:,4),'degree','linear','knots',3,'plot','on','interiorknots','free');
% SLM_GPfluke = slmengine(GPfluke(:,1),GPfluke(:,4),'degree','linear','knots',3,'plot','on','interiorknots','free');
% 
% % find derivatives for break points
% dGPZO1 = slmeval(SLM_GPZO1.knots,SLM_GPZO1,1);
% dGPZO2 = slmeval(SLM_GPZO2.knots,SLM_GPZO2,1);
% dGPfluke = slmeval(SLM_GPfluke.knots,SLM_GPfluke,1);

%% do linear fit

[CZO2_s, CZO2_i, CZO2_STAT] = myregr(CZO2(:,1), CZO2(:,4),0);
CZO2_fit = CZO2_s.value*CZO2(:,1) + CZO2_i.value;


%% 
% plot without slmplot
CZO2_xev = linspace(min(CZO2(:,1)),max(CZO2(:,1)),100);
CZO2_yhat = slmeval(CZO2_xev,SLM_CZO2,0);

CZO1_xev = linspace(min(CZO1(:,1)),max(CZO1(:,1)),100);
CZO1_yhat = slmeval(CZO1_xev,SLM_CZO1,0);

Cfluke_xev = linspace(min(Cfluke(:,1)),max(Cfluke(:,1)),100);
Cfluke_yhat = slmeval(Cfluke_xev,SLM_Cfluke,0);

figure(1); 
subplot(312); hold on
plot(CZO2(:,1),CZO2(:,4),'ro',CZO2_xev,CZO2_yhat,'b-')
xlim([22.5 27])
subplot(311); hold on
plot(CZO1(:,1),CZO1(:,4),'ro',CZO1_xev,CZO1_yhat,'b-')
xlim([22.5 27])
subplot(313); hold on
plot(Cfluke(:,1),Cfluke(:,4),'ro',Cfluke_xev,Cfluke_yhat,'b-')
xlim([22.5 27])


% plot(CZO2(:,1),CZO2(:,4),'b',CZO2(:,1),CZO2_fit,'k') % to compare



