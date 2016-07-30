% how much to slow down based on 2013 CFD? 

% load CFD data: across velocities (vel) 1-6 m/s, drag forces only on
% dolphin (first column) and tag (second column) for tag, tag+2, tag+4
% conditions
load('DolphinTagSims_24Feb16')

% plot drag vs speed for all conditions
figure(1); clf; hold on
plot(vel,notag,'k','LineWidth',2)
plot(vel,tag(:,1)+tag(:,2),'color',[55/255 126/255 184/255],'linewidth',2)
plot(vel,tag2(:,1)+tag2(:,2),'color',[255/255 127/255 0/255],'linewidth',2)
plot(vel,tag4(:,1)+tag4(:,2),'color',[77/255 175/255 74/255],'linewidth',2)
xlabel('Velocity (m/s)'); ylabel('Drag Force (N)')
xlim([1 4])
adjustfigurefont

%% calculate new speed to maintain drag force at 3 m/s: 
% assume that control lap speed = 3 m/s based on boat trial lap time
% comparison

% fit curves to CFD data
[c_notag(1), c_notag(2)] = curve_fit(vel',notag);
[c_tag(1), c_tag(2)] = curve_fit(vel',tag(:,1)+tag(:,2));
[c_tag2(1), c_tag2(2)] = curve_fit(vel',tag2(:,1)+tag2(:,2));
[c_tag4(1), c_tag4(2)] = curve_fit(vel',tag4(:,1)+tag4(:,2));
% plot to check
% plot(vel,c_tag4(1)*vel.^c_tag4(2),'r')

% Find reduced speeds
Ured_tag = (notag(3)/c_tag(1)).^(1/c_tag(2));
Ured_tag2 = (notag(3)/c_tag2(1)).^(1/c_tag2(2));
Ured_tag4 = (notag(3)/c_tag4(1)).^(1/c_tag4(2));

% plot to check
plot(Ured_tag4,c_tag4(1)*Ured_tag4.^c_tag4(2),'kd','markerfacecolor',[77/255 175/255 74/255],'markersize',10)
plot(Ured_tag2,c_tag2(1)*Ured_tag2.^c_tag2(2),'ko','markerfacecolor',[255/255 127/255 0/255],'markersize',10)
plot(Ured_tag,c_tag(1)*Ured_tag.^c_tag(2),'k^','markerfacecolor',[55/255 126/255 184/255],'markersize',10)
plot(vel(3),notag(3),'ko','markerfacecolor','k','markersize',10)
box on

print('CFDresults','-dsvg','-r300')

% calculate percent decrease
p0t = (abs(Ured_tag-3)/3);
p0t2 = (abs(Ured_tag2-3)/3);
p0t4 = (abs(Ured_tag4-3)/3);
