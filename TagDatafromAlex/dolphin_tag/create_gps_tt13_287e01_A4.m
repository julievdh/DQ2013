% Author: Lauro Ojeda, 2015
%Use this to create fake data for Kalohes loading file (tt13_287e01)
BOAT_FILE = 'Kolohe_A4';
Lap_Dist = 95; % m
Lap_Time = 27; % s
GPS_SHIFT = 27.29; %Time to animal swimming start

KM_SEC_2_M_SEC = 0.277778;
MEAN_SPEED = Lap_Dist/Lap_Time; % m/s
GPS_SIZE = Lap_Time+GPS_SHIFT; % in seconds
fs = 10;
N = floor((GPS_SIZE - GPS_SHIFT) * fs);
GPS_Speed = ones(N, 1) * MEAN_SPEED / KM_SEC_2_M_SEC; % This speed is average from other experiments
BE = [1, N];
% EVENT_TIMES = [];
% BE = (EVENT_TIMES - EVENT_TIMES(1) + .1)*fs;

save(BOAT_FILE, 'GPS_Speed', 'fs', 'BE');
