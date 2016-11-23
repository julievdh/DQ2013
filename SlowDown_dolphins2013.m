% how much to slow down based on 2013 CFD? 

% load CFD data: across velocities (vel) 1-6 m/s, drag forces only on
% dolphin (first column) and tag (second column) for tag, tag+2, tag+4
% conditions
load('DolphinTagSims_24Feb16')

%% calculate what tag+6 and tag+8 would be
% figure(3); hold on
% % plot difference in drag between conditions
% plot(sum(tag')'-notag,'color',[55/255 126/255 184/255])
% plot(sum(tag2')'-notag,'color',[255/255 127/255 0/255])
% plot(sum(tag4')'-notag,'color',[77/255 175/255 74/255])
% xlabel('Speed'); ylabel('Difference in Drag')

% calculate difference between tag4 and tag2, tag2 and tag to determine
% amount of drag from elements only
diff42 = sum(tag4')'-sum(tag2')';
diff20 = sum(tag2')'-sum(tag')';
mndiff = mean([diff42,diff20]'); 

% plot(diff42,'k:','linewidth',2) % AMOUNT OF DRAG ADDED BY TWO ELEMENTS
% plot(diff20,'k:','linewidth',2) % 

% adjustfigurefont

% tag+6
tag6 = sum(tag4')+mndiff;
% tag+8 
tag8 = sum(tag4')+(2*mndiff);

%% calculate new speed to maintain drag force at 3 m/s: 
% assume that control lap speed = 3 m/s based on boat trial lap time
% comparison

% fit curves to CFD data
[c_notag(1), c_notag(2)] = curve_fit(vel',notag);
[c_tag(1), c_tag(2)] = curve_fit(vel',tag(:,1)+tag(:,2));
[c_tag2(1), c_tag2(2)] = curve_fit(vel',tag2(:,1)+tag2(:,2));
[c_tag4(1), c_tag4(2)] = curve_fit(vel',tag4(:,1)+tag4(:,2));
[c_tag6(1), c_tag6(2)] = curve_fit(vel,tag6);
[c_tag8(1), c_tag8(2)] = curve_fit(vel,tag8);
% plot to the actual curves instead of the interpolated
velHD = 0:0.1:6;
% plot drag vs speed for all conditions
figure(1); clf; set(gcf,'position',[23   290   850   380])
subplot('position',[0.1 0.1 0.4 0.8]); hold on
plot(velHD,c_notag(1)*velHD.^c_notag(2),'k','LineWidth',2)
plot(velHD,c_tag(1)*velHD.^c_tag(2),'color',[55/255 126/255 184/255],'linewidth',2)
plot(velHD,c_tag2(1)*velHD.^c_tag2(2),'color',[255/255 127/255 0/255],'linewidth',2)
plot(velHD,c_tag4(1)*velHD.^c_tag4(2),'color',[77/255 175/255 74/255],'linewidth',2)
plot(velHD,c_tag6(1)*velHD.^c_tag6(2),':','color',[152/255 78/255 163/255],'linewidth',2)
plot(velHD,c_tag8(1)*velHD.^c_tag8(2),':','color',[228/255 26/255 28/255],'linewidth',2)

xlabel('Velocity (m/s)'); ylabel('Drag Force (N)')
xlim([1 4.5])
adjustfigurefont


% Find reduced speeds
Ured_tag = (notag(3)/c_tag(1)).^(1/c_tag(2));
Ured_tag2 = (notag(3)/c_tag2(1)).^(1/c_tag2(2));
Ured_tag4 = (notag(3)/c_tag4(1)).^(1/c_tag4(2));
Ured_tag6 = (notag(3)/c_tag6(1)).^(1/c_tag6(2));
Ured_tag8 = (notag(3)/c_tag8(1)).^(1/c_tag8(2));

% plot to check
plot(Ured_tag8,c_tag8(1)*Ured_tag8.^c_tag8(2),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',10)
plot(Ured_tag6,c_tag6(1)*Ured_tag6.^c_tag6(2),'ko','markerfacecolor',[152/255 78/255 163/255],'markersize',10)
plot(Ured_tag4,c_tag4(1)*Ured_tag4.^c_tag4(2),'kd','markerfacecolor',[77/255 175/255 74/255],'markersize',10)
plot(Ured_tag2,c_tag2(1)*Ured_tag2.^c_tag2(2),'ko','markerfacecolor',[255/255 127/255 0/255],'markersize',10)
plot(Ured_tag,c_tag(1)*Ured_tag.^c_tag(2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(vel(3),notag(3),'ko','markerfacecolor','k','markersize',10)
box on

% calculate percent decrease
p0t = (abs(Ured_tag-3)/3);
p0t2 = (abs(Ured_tag2-3)/3);
p0t4 = (abs(Ured_tag4-3)/3);
p0t6 = (abs(Ured_tag6-3)/3);
p0t8 = (abs(Ured_tag8-3)/3);

% calculate percent increase if maintain speed
p0t8_U3 = (tag8(3)-notag(3))/notag(3);
p0t6_U3 = (tag6(3)-notag(3))/notag(3);
p0t4_U3 = (sum(tag4(3,:))-notag(3))/notag(3);
p0t2_U3 = (sum(tag2(3,:))-notag(3))/notag(3);
p0t_U3 = (sum(tag(3,:))-notag(3))/notag(3);

%% plot alternative - that they can maintain speed but increase drag
plot(3,tag8(3),'s','markeredgecolor',[228/255 26/255 28/255],'markersize',10,'linewidth',2)
plot(3,tag6(3),'o','markeredgecolor',[152/255 78/255 163/255],'markersize',10,'linewidth',2)
plot(3,sum(tag4(3,:)),'d','markeredgecolor',[77/255 175/255 74/255],'markersize',10,'linewidth',2)
plot(3,sum(tag2(3,:)),'o','markeredgecolor',[255/255 127/255 0/255],'markersize',10,'linewidth',2)
plot(3,sum(tag(3,:)),'^','markeredgecolor',[55/255 126/255 184/255],'markersize',10,'linewidth',2)

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('CFDresults','-dsvg','-r300')

%% for Introduction
% figure(2); hold on
% plot(velHD,c_notag(1)*velHD.^c_notag(2),'k','LineWidth',2)
% plot(velHD,c_tag8(1)*velHD.^c_tag8(2),'color',[228/255 26/255 28/255],'linewidth',2)
% 
% plot(Ured_tag8,c_tag8(1)*Ured_tag8.^c_tag8(2),'ks','markerfacecolor',[228/255 26/255 28/255],'markersize',10)
% plot(vel(3),notag(3),'ko','markerfacecolor','k','markersize',10)
% plot(3,tag8(3),'s','markeredgecolor',[228/255 26/255 28/255],'markersize',10,'linewidth',2)
% 
% box on
% 
% xlabel('Velocity (m/s)'); ylabel('Drag Force (N)')
% xlim([1 4])
% adjustfigurefont
% 
% cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
% print('DragTradeoff','-dsvg','-r300')

%% Plot actual dolphin speeds from Alex's Analysis
load('all_vel_vec.mat')

% plot on figure
figure(1); subplot('position',[0.58 0.1 0.4 0.8]); hold on
plot(velHD,c_notag(1)*velHD.^c_notag(2),'k','LineWidth',2); box on
plot(velHD,c_tag(1)*velHD.^c_tag(2),'color',[55/255 126/255 184/255],'linewidth',2)
plot(velHD,c_tag2(1)*velHD.^c_tag2(2),'color',[255/255 127/255 0/255],'linewidth',2)
plot(velHD,c_tag4(1)*velHD.^c_tag4(2),'color',[77/255 175/255 74/255],'linewidth',2)
plot(velHD,c_tag6(1)*velHD.^c_tag6(2),':','color',[152/255 78/255 163/255],'linewidth',2)
plot(velHD,c_tag8(1)*velHD.^c_tag8(2),':','color',[228/255 26/255 28/255],'linewidth',2)

xlabel('Velocity (m/s)'); xlim([1 4.5])
adjustfigurefont

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
