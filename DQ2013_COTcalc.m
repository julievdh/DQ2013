% DQ2013 COT
% calculate COT based on swim speed and metabolic rate

%% load speed data from Alex 
load('all_vel_vec.mat')

%% load VO2 table
load('VO2_table')
headers = {'Filename';'Condition';'Rest all';'Rest last 2 min';...
    'Recov all';'Recov min 1';'Recov 0-2 min';'Recov min 2';...
    'Recov 5 min';'Recov 3-5 min'};


%% these are the matching video and metabolic files: 
%280	C	Lono
%269	C	Kolohe
%282	C	Nainoa
%273	C	Liko
%tt13_269b	A	Lono
%tt13_271b	A	Kolohe
%tt13_279a	A	Nainoa
%tt13_279b	A	Liko
%tt13_276a	A4	Lono
%tt13_288a	A4	Kolohe
%tt13_277b	A4	Nainoa
%tt13_277a	A4	Liko

%% put the VO2 data in the same structure

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
