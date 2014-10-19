%% Convert the kml file to a gpx file http://kml2gpx.com/
%% Read the data in+++++++++++++++++++++++++++++++++++++++++
% Convert the kml file to a text file using the following webpage: http://www.gpsvisualizer.com/

fs = 1; %Hz

data = importdata('RCBoatData_273.txt');
lat_all = data.data(:,1);
lon_all = data.data(:,2);

%% Identify the sections of boat data on the record

plot(lat_all,'k','LineWidth',2)
Section = [153:361];
time = (1:length(Section))'/fs;

%% Section and filter the data

lat = lat_all(Section,:);
lon = lon_all(Section,:);

[B,A] = butter(4,.3);

LatF = filtfilt(B,A,lat);
LonF = filtfilt(B,A,lon);

plot(LatF,LonF);

%% Compute dist between adjacent points
n=length(LatF);

[x,y,utmzone] = deg2utm(LatF,LonF); % A function posted on the matlab community page

dX=x(2:n)-x(1:n-1);   
dY=y(2:n)-y(1:n-1);

d=sqrt(dX.^2+dY.^2);
Distance = sum(d);
Speed = d/fs; 
        
%% Plot the data as a check

figure
subplot(311)
plot(time,x,'k')
ylabel('x (m)')
subplot(312)
plot(time,y,'k')
ylabel('y (m)')
subplot(313)
plot(Speed,'k')
xlabel('time (s)')
ylabel('speed (m/s)')

figure
plot(x,y,'k')
xlabel('X (m)')
ylabel('Y (m)')

      
%% Identify event timing from the video
events = [1;160;209];
BE = [41 68; 
      77 100;
      120 134;
      147 157];
  
Start = [x(1,1)-x(1,1)  y(1,1)-y(1,1)];
Last = [x(209,1)-x(1,1) y(209,1)-y(1,1)];
TEnd = [x(160,1)-x(1,1) y(160,1)-y(1,1)];

%% Plot the data (blue square: boat start; green circle: boat stop; red circle: boat out of the water)
figure('Color',[1 1 1])
plot(x-x(1,1),y-y(1,1),'MarkerFaceColor',[0 0 0],'MarkerEdgeColor',[0 0 0],...
    'MarkerSize',15,...
    'Marker','.',...
    'LineWidth',2,...
    'Color',[0.941176474094391 0.941176474094391 0.941176474094391]);
hold on
plot(Start(1,1),Start(1,2),'s','MarkerEdgeColor','k',...
                       'MarkerFaceColor','b',...
                       'MarkerSize',8)
                   
plot(TEnd(1,1),TEnd(1,2),'o','MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',8)                   
                   
plot(Last(1,1),Last(1,2),'o','MarkerEdgeColor','k',...
                       'MarkerFaceColor','r',...
                       'MarkerSize',8)
                   
xlabel('X (m)','FontSize',12)
ylabel('Y (m)','FontSize',12)
title('RC Boat Track (273)','FontWeight','demi','FontSize',12);

axis([0 40 -15 25])



figure('Color',[1 1 1])
subplot(311)
plot(time,x-x(1,1),'MarkerFaceColor',[0 0 0],'MarkerEdgeColor',[0 0 0],...
    'MarkerSize',10,...
    'Marker','.',...
    'LineWidth',3,...
    'Color',[0.941176474094391 0.941176474094391 0.941176474094391]);
hold on

plot(time(events(1,1)),x(events(1,1))-x(1,1),'s','MarkerEdgeColor','k',...
                       'MarkerFaceColor','b',...
                       'MarkerSize',8)
                   
plot(time(events(2,1)),x(events(2,1))-x(1,1),'o','MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',8)                   
                   
plot(time(events(3,1)),x(events(3,1))-x(1,1),'o','MarkerEdgeColor','k',...
                       'MarkerFaceColor','r',...
                       'MarkerSize',8)
xlabel('time (s)')
ylabel('X (m)')
title('RC Boat Track (273)')
axis([1 209 0 40])


subplot(312)
plot(time,y-y(1,1),'MarkerFaceColor',[0 0 0],'MarkerEdgeColor',[0 0 0],...
    'MarkerSize',10,...
    'Marker','.',...
    'LineWidth',3,...
    'Color',[0.941176474094391 0.941176474094391 0.941176474094391]);
hold on

plot(time(events(1,1)),y(events(1,1))-y(1,1),'s','MarkerEdgeColor','k',...
                       'MarkerFaceColor','b',...
                       'MarkerSize',8)
                   
plot(time(events(2,1)),y(events(2,1))-y(1,1),'o','MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',8)                   
                   
plot(time(events(3,1)),y(events(3,1))-y(1,1),'o','MarkerEdgeColor','k',...
                       'MarkerFaceColor','r',...
                       'MarkerSize',8)
xlabel('time (s)')
ylabel('Y (m)')
axis([1 209 -20 20])


Subplot(313)
plot(time(1:length(time)-1,1),Speed,'k','LineWidth',3)

hold on

plot(time(events(1,1)),Speed(events(1,1)),'s','MarkerEdgeColor','k',...
                       'MarkerFaceColor','b',...
                       'MarkerSize',8)
                   
plot(time(events(2,1)),Speed(events(2,1)),'o','MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',8)                   
                   
plot(time(events(3,1)),Speed(events(3,1)-1),'o','MarkerEdgeColor','k',...
                       'MarkerFaceColor','r',...
                       'MarkerSize',8)
xlabel('Time (s)')
ylabel('Speed (m/s)')
axis([1 209 0 5])

%% Plot the data when the animal is following the boat
x1 = x-x(1,1);
y1 = y-y(1,1);

BE = [41 68; 
      77 100;
      120 134;
      147 157];
  
Start = [x(1,1)-x(1,1)  y(1,1)-y(1,1)]
Last = [x(209,1)-x(1,1) y(209,1)-y(1,1)]
TEnd = [x(160,1)-x(1,1) y(160,1)-y(1,1)]

figure('Color',[1 1 1])
plot(x1(BE(1,1):BE(4,2)),y1(BE(1,1):BE(4,2)),'MarkerFaceColor',[0 0 0],'MarkerEdgeColor',[0 0 0],...
    'MarkerSize',15,...
    'Marker','.',...
    'LineWidth',2,...
    'Color',[0.941176474094391 0.941176474094391 0.941176474094391]);
hold on
plot(x1(BE(1,1):BE(1,2)),y1(BE(1,1):BE(1,2)),'LineWidth',3,'Color','r')
plot(x1(BE(2,1):BE(2,2)),y1(BE(2,1):BE(2,2)),'LineWidth',3,'Color','r')
plot(x1(BE(3,1):BE(3,2)),y1(BE(3,1):BE(3,2)),'LineWidth',3,'Color','r')
plot(x1(BE(4,1):BE(4,2)),y1(BE(4,1):BE(4,2)),'LineWidth',3,'Color','r')
plot(x1(BE(1,1):BE(4,2)),y1(BE(1,1):BE(4,2)),'.k','MarkerSize',15);
                   
xlabel('X (m)','FontSize',12)
ylabel('Y (m)','FontSize',12)
title('RC Boat Track (273)','FontWeight','demi','FontSize',12);

axis([0 40 -15 25])

%% Plot the data when the animal is following the boat

figure('Color',[1 1 1])
subplot(311)
plot(time(BE(1,1):BE(4,2)),x1(BE(1,1):BE(4,2)),'MarkerFaceColor',[0 0 0],'MarkerEdgeColor',[0 0 0],...
    'MarkerSize',10,...
    'Marker','.',...
    'LineWidth',3,...
    'Color',[0.941176474094391 0.941176474094391 0.941176474094391]);
hold on

plot(time(BE(1,1):BE(1,2)),x1(BE(1,1):BE(1,2)),'r','LineWidth',3)
plot(time(BE(2,1):BE(2,2)),x1(BE(2,1):BE(2,2)),'r','LineWidth',3)
plot(time(BE(3,1):BE(3,2)),x1(BE(3,1):BE(3,2)),'r','LineWidth',3)
plot(time(BE(4,1):BE(4,2)),x1(BE(4,1):BE(4,2)),'r','LineWidth',3)

plot(time(BE(1,1):BE(4,2)),x1(BE(1,1):BE(4,2)),'.k','MarkerSize',10);
                   

xlabel('time (s)')
ylabel('X (m)')
title('RC Boat Track (273)')
axis([41 157 0 40])


subplot(312)
plot(time(BE(1,1):BE(4,2)),y1(BE(1,1):BE(4,2)),'MarkerFaceColor',[0 0 0],'MarkerEdgeColor',[0 0 0],...
    'MarkerSize',10,...
    'Marker','.',...
    'LineWidth',3,...
    'Color',[0.941176474094391 0.941176474094391 0.941176474094391]);
hold on

plot(time(BE(1,1):BE(1,2)),y1(BE(1,1):BE(1,2)),'r','LineWidth',3)
plot(time(BE(2,1):BE(2,2)),y1(BE(2,1):BE(2,2)),'r','LineWidth',3)
plot(time(BE(3,1):BE(3,2)),y1(BE(3,1):BE(3,2)),'r','LineWidth',3)
plot(time(BE(4,1):BE(4,2)),y1(BE(4,1):BE(4,2)),'r','LineWidth',3)

plot(time(BE(1,1):BE(4,2)),y1(BE(1,1):BE(4,2)),'.k','MarkerSize',10);
xlabel('time (s)')
ylabel('Y (m)')
axis([41 157 -20 20])


Subplot(313)
plot(time(1:length(time)-1,1),Speed,'k','LineWidth',3)

hold on

plot(time(BE(1,1):BE(1,2)),Speed(BE(1,1):BE(1,2)),'r','LineWidth',3)
plot(time(BE(2,1):BE(2,2)),Speed(BE(2,1):BE(2,2)),'r','LineWidth',3)
plot(time(BE(3,1):BE(3,2)),Speed(BE(3,1):BE(3,2)),'r','LineWidth',3)
plot(time(BE(4,1):BE(4,2)),Speed(BE(4,1):BE(4,2)),'r','LineWidth',3)

xlabel('Time (s)')
ylabel('Speed (m/s)')
axis([41 157 0 5])


%% Shift the data to make the data look better on bing maps

SHIFT_LON = 0;
SHIFT_LAT = (2.07373271621236e-005)*2;

for(ii = 41:157)
    disp(sprintf('<gx:coord> %0.5f %0.5f 0 </gx:coord>', LonF(ii) - SHIFT_LON , LatF(ii) - SHIFT_LAT));
end;

plot(LatF(41:157,1),LonF(41:157,1));

