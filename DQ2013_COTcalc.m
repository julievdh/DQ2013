% DQ2013 COT
% calculate COT based on swim speed and metabolic rate
% 30 May 2018

%% load VO2 table and VO2_kg 
SelectSpeedVO2plot

%% load speed data from Alex 
load('all_vel_vec.mat')

%% these are the matching video and metabolic files: 
%280	C	Lono - 19
%269	C	Kolohe - 3
%282	C	Nainoa --- not a good metabolic trial
%273	C	Liko - 12
%tt13_269b	A	Lono - 15
%tt13_271b	A	Kolohe - 4
%tt13_279a	A	Nainoa -- not a good metabolic trial
%tt13_279b	A	Liko - 13
%tt13_276a	A4	Lono - 18
%tt13_288a	A4	Kolohe - 9 
%tt13_277b	A4	Nainoa -- not a good metabolic trial
%tt13_277a	A4	Liko -- not a good metabolic trial

%% put the VO2 data in the same structure
% animal, day, condition, mean speed, VO2kg rest, VO2kg recov0-2
% see indices and filenames above from "Trainer Files.xlsx"
idx = [19 3 12 15 4 13 18 9]; % need other files 
for i = 1:length(idx)
all{i,1} = VO2_table{idx(i),1}; % filename
all{i,2} = VO2_table{idx(i),2}; % condition
all{i,3} = VO2kg_table{idx(i),4}; % rest last minute
all{i,4} = VO2kg_table{idx(i),7}; % rest first 2 min of recovery
end
% add speeds
all{1,5} = mean(Lono_C); % mean speed from Alex
all{2,5} = mean(Kolohe_C); 
all{3,5} = mean(Liko_C); 
all{4,5} = mean(Lono_A); 
all{5,5} = mean(Kolohe_A); 
all{6,5} = mean(Liko_A); 
all{7,5} = mean(Lono_A4); % -- these are the same
all{8,5} = mean(Kolohe_A4); % -- these are the same

%% calculate COT: recovery VO2/speed 
%Mass-specific cost of transport (COT; J m?1 kg?1) describes the energetic
%cost of covering a unit distance per unit mass (Schmidt-Nielsen, 1972) and
%was calculated as the average mass-specific metabolic rate during the swim
%and two-minute recovery phases combined (ml O2 kg?1 min?1; the exercise
%metabolic rate) divided by average swimming speeds (m s?1). The average
%energy conversion for lipid, protein and carbohydrate sources of
%20.1 J ml?1 O2 was used (Schmidt-Nielsen, 1997).
%Both maintenance costs and locomotor costs (LC) contribute to cost of
%transport. The net cost of transport (COTnet; J m?1 kg?1) can be calculated to
%provide a measure of locomotor cost normalized for both body mass and
%swimming speed (Williams, 1989; Rosen and Trites, 2002):
%The contribution of LC to COT is then COTnet divided by COT. It is
%hypothesized that COT and COTnet would be greater and that LC would
%have larger contributions to COT in tagged trials.

% COT = VO2 [mL O2/min/kg]*(20.1 J/mL O2)/(swim speed [m/s] * 60 [s/min]) 
% COT = [J/min/kg]
COT_tot_swim = (VO2_swim_kg*20.1)./(speed'*60);

mnCOTtot_swim = (VO2_swim_indv*20.1)./(speed_indv*60);
mnCOTtot_swimr02 = (VO2_swimr02_indv*20.1)./(speed_indv*60);
mnCOTnet_swim = ((VO2_swim_indv-VO2_rest_indv)*20.1)./(speed_indv*60);
mnCOTnet_swimr02 = ((VO2_swimr02_indv-VO2_rest_indv)*20.1)./(speed_indv*60);
mnLC_swim = mnCOTnet_swim./mnCOTtot_swim;
mnLC_swimr02 = mnCOTnet_swimr02./mnCOTtot_swimr02;
