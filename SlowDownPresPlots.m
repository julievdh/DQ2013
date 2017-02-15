%% Plot actual dolphin speeds from Alex's Analysis
% FOR PRESENTATIONS
load('all_vel_vec.mat')

% plot on figure
figure(1); clf; hold on
plot(velHD,c_notag(1)*velHD.^c_notag(2),'k','LineWidth',2); box on
plot(velHD,c_tag(1)*velHD.^c_tag(2),'color',[55/255 126/255 184/255],'linewidth',2)
plot(velHD,c_tag8(1)*velHD.^c_tag8(2),'color',[228/255 26/255 28/255],'linewidth',2)

xlabel('Velocity (m/s)'); xlim([1 5.5])
ylabel('Drag (N')
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

%% 