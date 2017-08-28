% Author: Lauro Ojeda, 2015
%Use this to create fake data for this missing file for "NAINOA A" (tt13_284a01)
KM_SEC_2_M_SEC = 0.277778;
MEAN_SPEED = 3.2; % Speed of the boat 
GPS_SIZE = 551; % Total duration of the experiment that matches the IMU data
fs = 10;
N = floor((GPS_SIZE - GPS_SHIFT) * fs);
GPS_Speed = ones(N, 1) * MEAN_SPEED / KM_SEC_2_M_SEC; % This speed is average from other experiments
BE = [1, N];
EVENT_TIMES = [
			72 133
			143 159
			166 185
			194 210
			219 237
			241 288
			292 360 ];

BE = (EVENT_TIMES - EVENT_TIMES(1) + .1) * fs;

save(BOAT_FILE, 'GPS_Speed', 'fs', 'BE');

