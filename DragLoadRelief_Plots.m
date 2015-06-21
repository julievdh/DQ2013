% Load and plot drag build/relief data from video analysis

% Kolohe
load('Kolohe_DradLoadRelief');

figure(1); clf
subplot(223); hold on;
title('Kolohe - Drag Loading')
plot(trainers(:,1),trainers(:,2),'k^','MarkerFaceColor','k')
plot(load0(:,2),load0(:,3),'.','MarkerSize',10)
plot(loadA(:,2),loadA(:,3),'.','MarkerSize',10)
plot(loadA1(:,2),loadA1(:,3),'.','MarkerSize',10)
plot(loadA2(:,2),loadA2(:,3),'.','MarkerSize',10)
plot(loadA3(:,2),loadA3(:,3),'.','MarkerSize',10)
plot(loadA4(:,2),loadA4(:,3),'.','MarkerSize',10)

subplot(224); hold on;
title('Kolohe - Drag Relief')
plot(trainers(:,1),trainers(:,2),'k^','MarkerFaceColor','k')
plot(remove0(:,2),remove0(:,3),'.','MarkerSize',10)
plot(removeA(:,2),removeA(:,3),'.','MarkerSize',10)
plot(removeA1(:,2),removeA1(:,3),'.','MarkerSize',10)
plot(removeA2(:,2),removeA2(:,3),'.','MarkerSize',10)
plot(removeA3(:,2),removeA3(:,3),'.','MarkerSize',10)
plot(removeA4(:,2),removeA4(:,3),'.','MarkerSize',10)

% Lono
clear all
load('Lono_DradLoadRelief');

subplot(221); hold on;
title('Lono - Drag Loading')
plot(trainers(:,1),trainers(:,2),'k^','MarkerFaceColor','k')
plot(load0(:,2),load0(:,3),'.','MarkerSize',10)
plot(loadA(:,2),loadA(:,3),'.','MarkerSize',10)
plot(loadA1(:,2),loadA1(:,3),'.','MarkerSize',10)
plot(loadA2(:,2),loadA2(:,3),'.','MarkerSize',10)
plot(loadA3(:,2),loadA3(:,3),'.','MarkerSize',10)
plot(loadA4(:,2),loadA4(:,3),'.','MarkerSize',10)
adjustfigurefont
legend('Trainers','0','A','A1','A2','A3','A4','location','NW')
legend('boxoff')


subplot(222); hold on;
title('Lono - Drag Relief')
plot(trainers(:,1),trainers(:,2),'k^','MarkerFaceColor','k')
plot(remove0(:,2),remove0(:,3),'.','MarkerSize',10)
plot(removeA(:,2),removeA(:,3),'.','MarkerSize',10)
plot(removeA1(:,2),removeA1(:,3),'.','MarkerSize',10)
plot(removeA2(:,2),removeA2(:,3),'.','MarkerSize',10)
plot(removeA3(:,2),removeA3(:,3),'.','MarkerSize',10)
plot(removeA4(:,2),removeA4(:,3),'.','MarkerSize',10)



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
