%% Plot actual dolphin speeds from Alex's Analysis
% FOR PRESENTATIONS
load('all_vel_vec.mat')

% plot on figure
figure(1); clf; hold on
plot(velHD,c_notag(1)*velHD.^c_notag(2),'k','LineWidth',2); box on
plot(velHD,c_tag(1)*velHD.^c_tag(2),'color',[55/255 126/255 184/255],'linewidth',2)
plot(velHD,c_tag8(1)*velHD.^c_tag8(2),'color',[228/255 26/255 28/255],'linewidth',2)

xlabel('Velocity (m/s)'); xlim([1 5.5])
ylabel('Drag (N)')
set(gca,'xtick',[1 2.5 4 5.5])
adjustfigurefont('Helvetica',16)

plot(mean(Lono_C),c_notag(1)*mean(Lono_C).^c_notag(2),'ko','markerfacecolor','k','markersize',10)
plot(mean(Lono_A),c_tag(1)*mean(Lono_A).^c_tag(2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(mean(Lono_A4),c_tag8(1)*mean(Lono_A4).^c_tag8(2),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',10)

plot(mean(Kolohe_C),c_notag(1)*mean(Kolohe_C).^c_notag(2),'ko','markerfacecolor','k','markersize',10)
plot(mean(Kolohe_A),c_tag(1)*mean(Kolohe_A).^c_tag(2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(mean(Kolohe_A4),c_tag8(1)*mean(Kolohe_A4).^c_tag8(2),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',10)

plot(mean(Liko_C),c_notag(1)*mean(Liko_C).^c_notag(2),'ko','markerfacecolor','k','markersize',10)
plot(mean(Liko_A),c_tag(1)*mean(Liko_A).^c_tag(2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(mean(Liko_A4),c_tag8(1)*mean(Liko_A4).^c_tag8(2),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',10)

plot(mean(Nainoa_C),c_notag(1)*mean(Nainoa_C).^c_notag(2),'ko','markerfacecolor','k','markersize',10)
plot(mean(Nainoa_A),c_tag(1)*mean(Nainoa_A).^c_tag(2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(mean(Nainoa_A4),c_tag8(1)*mean(Nainoa_A4).^c_tag8(2),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',10)

% save
box off
print -dpng MetabolicSpeed_DragCurve

%% add velocities from loading/unloading trials
% plot on figure
figure(2); clf; hold on
plot(velHD,c_notag(1)*velHD.^c_notag(2),'k','LineWidth',2); box on
plot(velHD,c_tag(1)*velHD.^c_tag(2),'color',[55/255 126/255 184/255],'linewidth',2)
plot(velHD,c_tag2(1)*velHD.^c_tag2(2),'color',[255/255 127/255 0/255],'linewidth',2)
plot(velHD,c_tag4(1)*velHD.^c_tag4(2),'color',[77/255 175/255 74/255],'linewidth',2)
plot(velHD,c_tag6(1)*velHD.^c_tag6(2),'color',[152/255 78/255 163/255],'linewidth',2)
plot(velHD,c_tag8(1)*velHD.^c_tag8(2),'color',[228/255 26/255 28/255],'linewidth',2)
xlim([1 5.5])

%% add patch in between (and make it so patches don't go over ticks)
patch([1.1 5.5 5.5 1.1 1.1],[10 10 800 800 10],'w','facealpha',0.75,'edgealpha',0)
patch([1 1.1 1.1 1 1],[0 0 50 50 0],'w','facealpha',0.75,'edgealpha',0)

%% load data
load('KoloheLoadUnloadSpeed') 
%% unloading
plot(mean(C.Uspeed),c_notag(1)*mean(C.Uspeed).^c_notag(2),'ko','markerfacecolor','k','markersize',10)
plot(nanmean(T.Uspeed),c_tag(1)*nanmean(T.Uspeed).^c_tag(2),'ko','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(nanmean(T2.Uspeed),c_tag2(1)*nanmean(T2.Uspeed).^c_tag2(2),'ko','markerfacecolor',[255/255 127/255 0/255],'markersize',10)
plot(nanmean(T4.Uspeed),c_tag4(1)*nanmean(T4.Uspeed).^c_tag4(2),'ko','markerfacecolor',[77/255 175/255 74/255],'markersize',10)
plot(nanmean(T6.Uspeed),c_tag6(1)*nanmean(T6.Uspeed).^c_tag6(2),'ko','markerfacecolor',[152/255 78/255 163/255],'markersize',10)
plot(nanmean(T8.Uspeed),c_tag8(1)*nanmean(T8.Uspeed).^c_tag8(2),'ko','markerfacecolor',[228/255 26/255 28/255],'markersize',10)
%% lines in between
% t8 - t6 - t4 - t2 - t - c
Upath(:,1) = [nanmean(T8.Uspeed) nanmean(T6.Uspeed) nanmean(T4.Uspeed) nanmean(T2.Uspeed) nanmean(T.Uspeed) mean(C.Uspeed)];
Upath(:,2) = [c_tag8(1)*nanmean(T8.Uspeed).^c_tag8(2), c_tag6(1)*nanmean(T6.Uspeed).^c_tag6(2),... 
    c_tag4(1)*nanmean(T4.Uspeed).^c_tag4(2), c_tag2(1)*nanmean(T2.Uspeed).^c_tag2(2), ...
    c_tag(1)*nanmean(T.Uspeed).^c_tag(2), c_notag(1)*mean(C.Uspeed).^c_notag(2)];
plot(Upath(:,1),Upath(:,2),'k--')

xlabel('Velocity (m/s)'); xlim([1 5.5])
ylabel('Drag (N)')
set(gca,'xtick',[1 2.5 4 5.5])
adjustfigurefont('Helvetica',16)

% save
box off
print -dpng LoadReliefK_DragCurve_unloadonly

%% loading
plot(mean(C.Lspeed),c_notag(1)*mean(C.Lspeed).^c_notag(2),'ko','markerfacecolor','k','markersize',10)
plot(nanmean(T.Lspeed),c_tag(1)*nanmean(T.Lspeed).^c_tag(2),'ko','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(nanmean(T2.Lspeed),c_tag2(1)*nanmean(T2.Lspeed).^c_tag2(2),'ko','markerfacecolor',[255/255 127/255 0/255],'markersize',10)
plot(nanmean(T4.Lspeed),c_tag4(1)*nanmean(T4.Lspeed).^c_tag4(2),'ko','markerfacecolor',[77/255 175/255 74/255],'markersize',10)
plot(nanmean(T6.Lspeed),c_tag6(1)*nanmean(T6.Lspeed).^c_tag6(2),'ko','markerfacecolor',[152/255 78/255 163/255],'markersize',10)
plot(nanmean(T8.Lspeed),c_tag8(1)*nanmean(T8.Lspeed).^c_tag8(2),'ko','markerfacecolor',[228/255 26/255 28/255],'markersize',10)

%% lines in between
% c - t - t2 - t4 - t6 - t8 % i guess the direction of plotting doesn't
% actually matter
Lpath(:,1) = [nanmean(T8.Lspeed) nanmean(T6.Lspeed) nanmean(T4.Lspeed) nanmean(T2.Lspeed) nanmean(T.Lspeed) mean(C.Lspeed)];
Lpath(:,2) = [c_tag8(1)*nanmean(T8.Lspeed).^c_tag8(2), c_tag6(1)*nanmean(T6.Lspeed).^c_tag6(2),... 
    c_tag4(1)*nanmean(T4.Lspeed).^c_tag4(2), c_tag2(1)*nanmean(T2.Lspeed).^c_tag2(2), ...
    c_tag(1)*nanmean(T.Lspeed).^c_tag(2), c_notag(1)*mean(C.Lspeed).^c_notag(2)];
plot(Lpath(:,1),Lpath(:,2),'k-')

% save
box off
print -dpng LoadReliefK_DragCurve