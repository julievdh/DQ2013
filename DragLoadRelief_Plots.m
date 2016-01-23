% Load and plot drag build/relief data from video analysis

% Kolohe
load('Kolohe_DradLoadRelief');

figure(1); clf
subplot(223); hold on;
title('Kolohe - Drag Loading')
plot(trainers(:,1),trainers(:,2),'k*')
plot(load0(:,2),load0(:,3),'k','LineWidth',1.5)
plot(loadA(:,2),loadA(:,3),'Color',[55/255 126/255 184/255],'LineWidth',1.5)
plot(loadA1(:,2),loadA1(:,3),'Color',[255/255 127/255 0/255],'LineWidth',1.5)
plot(loadA2(:,2),loadA2(:,3),'Color',[77/255 175/255 74/255],'LineWidth',1.5)
plot(loadA3(:,2),loadA3(:,3),'Color',[152/255 78/255 163/255],'LineWidth',1.5)
plot(loadA4(:,2),loadA4(:,3),'Color',[228/255 26/255 28/255],'LineWidth',1.5)

subplot(224); hold on;
title('Kolohe - Drag Relief')
plot(trainers(:,1),trainers(:,2),'k*')
plot(remove0(:,2),remove0(:,3),'ko','MarkerFaceColor','k')
plot(removeA(:,2),removeA(:,3),'^','MarkerFaceColor',[55/255 126/255 184/255],'MarkerEdgeColor',[55/255 126/255 184/255])
plot(removeA1(:,2),removeA1(:,3),'o','MarkerFaceColor',[255/255 127/255 0/255],'MarkerEdgeColor',[255/255 127/255 0/255])
plot(removeA2(:,2),removeA2(:,3),'d','MarkerFaceColor',[77/255 175/255 74/255],'MarkerEdgeColor',[77/255 175/255 74/255])
plot(removeA3(:,2),removeA3(:,3),'o','MarkerFaceColor',[152/255 78/255 163/255],'MarkerEdgeColor',[152/255 78/255 163/255])
plot(removeA4(:,2),removeA4(:,3),'s','MarkerFaceColor',[228/255 26/255 28/255],'MarkerEdgeColor',[228/255 26/255 28/255])


% Lono
clear all
load('Lono_DradLoadRelief');

subplot(221); hold on;
title('Lono - Drag Loading')
plot(trainers(:,1),trainers(:,2),'k*')
plot(load0(:,2),load0(:,3),'k','LineWidth',1.5)
plot(loadA(:,2),loadA(:,3),'Color',[55/255 126/255 184/255],'LineWidth',1.5)
plot(loadA1(:,2),loadA1(:,3),'Color',[255/255 127/255 0/255],'LineWidth',1.5)
plot(loadA2(:,2),loadA2(:,3),'Color',[77/255 175/255 74/255],'LineWidth',1.5)
plot(loadA3(:,2),loadA3(:,3),'Color',[152/255 78/255 163/255],'LineWidth',1.5)
plot(loadA4(:,2),loadA4(:,3),'Color',[228/255 26/255 28/255],'LineWidth',1.5)
adjustfigurefont
% legend('Trainers','0','A','A1','A2','A3','A4','location','NW')
% legend('boxoff')


subplot(222); hold on;
title('Lono - Drag Relief')
plot(trainers(:,1),trainers(:,2),'k*')
plot(remove0(:,2),remove0(:,3),'ko','MarkerFaceColor','k')
plot(removeA(:,2),removeA(:,3),'^','MarkerFaceColor',[55/255 126/255 184/255],'MarkerEdgeColor',[55/255 126/255 184/255])
plot(removeA1(:,2),removeA1(:,3),'o','MarkerFaceColor',[255/255 127/255 0/255],'MarkerEdgeColor',[255/255 127/255 0/255])
plot(removeA2(:,2),removeA2(:,3),'d','MarkerFaceColor',[77/255 175/255 74/255],'MarkerEdgeColor',[77/255 175/255 74/255])
plot(removeA3(:,2),removeA3(:,3),'o','MarkerFaceColor',[152/255 78/255 163/255],'MarkerEdgeColor',[152/255 78/255 163/255])
plot(removeA4(:,2),removeA4(:,3),'s','MarkerFaceColor',[228/255 26/255 28/255],'MarkerEdgeColor',[228/255 26/255 28/255])


%% Duration of loading/unloading laps
% calculate durations of loadings
dur_load0 = load0(end,1)-load0(1,1);
dur_loadA = loadA(end,1)-loadA(1,1);
dur_loadA1 = loadA1(end,1)-loadA1(1,1);
dur_loadA2 = loadA2(end,1)-loadA2(1,1);
dur_loadA3 = loadA3(end,1)-loadA3(1,1);
dur_loadA4 = loadA4(end,1)-loadA4(1,1);
dur_load = [dur_load0 dur_loadA dur_loadA1 dur_loadA2 dur_loadA3 dur_loadA4]; % make a single vector in order

% of removals
dur_remove0 = remove0(end,1)-remove0(1,1);
dur_removeA = removeA(end,1)-removeA(1,1);
dur_removeA1 = removeA1(end,1)-removeA1(1,1);
dur_removeA2 = removeA2(end,1)-removeA2(1,1);
dur_removeA3 = removeA3(end,1)-removeA3(1,1);
dur_removeA4 = removeA4(end,1)-removeA4(1,1);

figure(2); clf; hold on
plot(0,dur_load0,'ko','MarkerFaceColor','k','MarkerSize',10)
plot(1,dur_loadA,'k^','MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',10)
plot(2,dur_loadA1,'ko','MarkerFaceColor',[255/255 127/255 0/255],'MarkerSize',10)
plot(3,dur_loadA2,'kd','MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',10)
plot(4,dur_loadA3,'ko','MarkerFaceColor',[152/255 78/255 163/255],'MarkerSize',10)
plot(5,dur_loadA4,'ks','MarkerFaceColor',[228/255 26/255 28/255],'MarkerSize',10)

plot(11,dur_remove0,'ko','MarkerFaceColor','k','MarkerSize',10)
plot(10,dur_removeA,'k^','MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',10)
plot(9,dur_removeA1,'ko','MarkerFaceColor',[255/255 127/255 0/255],'MarkerSize',10)
plot(8,dur_removeA2,'kd','MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',10)
plot(7,dur_removeA3,'ko','MarkerFaceColor',[152/255 78/255 163/255],'MarkerSize',10)
plot(6,dur_removeA4,'ks','MarkerFaceColor',[228/255 26/255 28/255],'MarkerSize',10)
%% percent change between tag condition and CONTROL
p0A = (dur_loadA-dur_load0)/dur_load0;
p0A1= (dur_loadA1-dur_load0)/dur_load0;
p0A2 = (dur_loadA2-dur_load0)/dur_load0;
p0A3 = (dur_loadA3-dur_load0)/dur_load0;
p0A4 = (dur_loadA4-dur_load0)/dur_load0;

% and backwards:
pA40 = (dur_removeA4-dur_remove0)/dur_remove0;
pA30 = (dur_removeA3-dur_remove0)/dur_remove0;
pA20 = (dur_removeA2-dur_remove0)/dur_remove0;
pA10 = (dur_removeA1-dur_remove0)/dur_remove0;
pA0 = (dur_removeA-dur_remove0)/dur_remove0;

% plot
plot(1:5,[p0A p0A1 p0A2 p0A3 p0A4],'k')
plot(6:10,[pA40 pA30 pA20 pA10 pA0],'k')

%% Kolohe
clear all; load('Kolohe_DradLoadRelief');

% calculate durations of loadings
dur_load0 = load0(end,1)-load0(1,1);
dur_loadA = loadA(end,1)-loadA(1,1);
dur_loadA1 = loadA1(end,1)-loadA1(1,1);
dur_loadA2 = loadA2(end,1)-loadA2(1,1);
dur_loadA3 = loadA3(end,1)-loadA3(1,1);
dur_loadA4 = loadA4(end,1)-loadA4(1,1);
dur_load = [dur_load0 dur_loadA dur_loadA1 dur_loadA2 dur_loadA3 dur_loadA4]; % make a single vector in order

% of removals
dur_remove0 = remove0(end,1)-remove0(1,1);
dur_removeA = removeA(end,1)-removeA(1,1);
dur_removeA1 = removeA1(end,1)-removeA1(1,1);
dur_removeA2 = removeA2(end,1)-removeA2(1,1);
dur_removeA3 = removeA3(end,1)-removeA3(1,1);
dur_removeA4 = removeA4(end,1)-removeA4(1,1);

figure(2); 
plot(0,dur_load0,'ko','MarkerFaceColor','k','MarkerSize',10)
plot(1,dur_loadA,'k^','MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',10)
plot(2,dur_loadA1,'ko','MarkerFaceColor',[255/255 127/255 0/255],'MarkerSize',10)
plot(3,dur_loadA2,'kd','MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',10)
plot(4,dur_loadA3,'ko','MarkerFaceColor',[152/255 78/255 163/255],'MarkerSize',10)
plot(5,dur_loadA4,'ks','MarkerFaceColor',[228/255 26/255 28/255],'MarkerSize',10)

plot(11,dur_remove0,'ko','MarkerFaceColor','k','MarkerSize',10)
plot(10,dur_removeA,'k^','MarkerFaceColor',[55/255 126/255 184/255],'MarkerSize',10)
plot(9,dur_removeA1,'ko','MarkerFaceColor',[255/255 127/255 0/255],'MarkerSize',10)
plot(8,dur_removeA2,'kd','MarkerFaceColor',[77/255 175/255 74/255],'MarkerSize',10)
plot(7,dur_removeA3,'ko','MarkerFaceColor',[152/255 78/255 163/255],'MarkerSize',10)
plot(6,dur_removeA4,'ks','MarkerFaceColor',[228/255 26/255 28/255],'MarkerSize',10)
%% percent change between tag condition and CONTROL
p0A = (dur_loadA-dur_load0)/dur_load0;
p0A1= (dur_loadA1-dur_load0)/dur_load0;
p0A2 = (dur_loadA2-dur_load0)/dur_load0;
p0A3 = (dur_loadA3-dur_load0)/dur_load0;
p0A4 = (dur_loadA4-dur_load0)/dur_load0;

% and backwards:
pA40 = (dur_removeA4-dur_remove0)/dur_remove0;
pA30 = (dur_removeA3-dur_remove0)/dur_remove0;
pA20 = (dur_removeA2-dur_remove0)/dur_remove0;
pA10 = (dur_removeA1-dur_remove0)/dur_remove0;
pA0 = (dur_removeA-dur_remove0)/dur_remove0;

% plot
plot(1:5,[p0A p0A1 p0A2 p0A3 p0A4],'k')
plot(6:10,[pA40 pA30 pA20 pA10 pA0],'k')

return 

%% figure(2): Lono Only
figure(2); set(gcf,'position',[130 241 1150 385]); clf
subplot(121); hold on;
title('Lono - Drag Loading')
plot(trainers(:,1),trainers(:,2),'k^','MarkerFaceColor','k')
plot(load0(:,2),load0(:,3),'.','MarkerSize',10)
plot(loadA(:,2),loadA(:,3),'.','MarkerSize',10)
plot(loadA1(:,2),loadA1(:,3),'.','MarkerSize',10)
plot(loadA2(:,2),loadA2(:,3),'.','MarkerSize',10)
plot(loadA3(:,2),loadA3(:,3),'.','MarkerSize',10)
plot(loadA4(:,2),loadA4(:,3),'.','MarkerSize',10)
legend('Trainers','C','T','T+2','T+4','T+6','T+8','location','NW')
legend('boxoff')


subplot(122); hold on;
title('Lono - Drag Relief')
plot(trainers(:,1),trainers(:,2),'k^','MarkerFaceColor','k')
plot(remove0(:,2),remove0(:,3),'.','MarkerSize',10)
plot(removeA(:,2),removeA(:,3),'.','MarkerSize',10)
plot(removeA1(:,2),removeA1(:,3),'.','MarkerSize',10)
plot(removeA2(:,2),removeA2(:,3),'.','MarkerSize',10)
plot(removeA3(:,2),removeA3(:,3),'.','MarkerSize',10)
plot(removeA4(:,2),removeA4(:,3),'.','MarkerSize',10)

adjustfigurefont
print('Lono_DragLoadRelief.tiff','-dtiff','-r300')
