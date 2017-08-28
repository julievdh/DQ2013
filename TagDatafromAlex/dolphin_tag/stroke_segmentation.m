% Author: Lauro Ojeda, 2014-2015
function [stepData, FF] = stroke_segmentation(inertial_info,PERIOD,FILTER,GOOD_SECTION_SECONDS)
	if(~exist('FILTER','var') | isempty(FILTER))
		FILTER = 0;
	end;

	N = length(inertial_info.euler);
	if(~exist('GOOD_SECTION_SECONDS','var') | isempty(GOOD_SECTION_SECONDS))
		OUTLIER_SECTION_SAMPLES= [];
	else
		GOOD_SECTION_SAMPLES =  (floor(GOOD_SECTION_SECONDS(1)/PERIOD):floor(GOOD_SECTION_SECONDS(2)/PERIOD));
		OUTLIER_SECTION_SAMPLES = (1 : N);
		OUTLIER_SECTION_SAMPLES(GOOD_SECTION_SAMPLES) = [];
	end;

	stepData = get_strokes(inertial_info, PERIOD, FILTER, OUTLIER_SECTION_SAMPLES); 

