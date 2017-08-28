% Author: Lauro Ojeda, 2014-2015
switch(sample_file{1})
	case 'Reference101' % Basic flips for figuring the axis orientation
		SECTION  = [30, 90];
	case 'Reference101_b' % Basic flips for figuring the axis orientation
		SECTION  = [40, 120];
	case 'tt13_273c' % Has Yost and DTAG3 data at the same time
		SECTION = [1120, 1300];
	case 'tt13_284a01'
		SECTION  = [800, 1600];
		GPS_SHIFT = 250;
		create_gps_tt13_284a01;
	case 'tt13_285d01'
		SECTION  = [400, 1200];
		GPS_SHIFT = 264;
	case 'tt13_287b01'
		SECTION  = [400, 1200];
		GPS_SHIFT = 198;
	case 'tt13_287c01'
		SECTION  = [600, 1400];
		GPS_SHIFT = 195.5;
	case 'tt13_285b01'
		SECTION = [150, 580];
	case 'tt13_281a01'
		SECTION = [200, 1200];
end;


