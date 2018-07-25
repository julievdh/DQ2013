% DQ2013 COT
% calculate COT based on swim speed and metabolic rate
% 30 May 2018

%% load VO2 table and VO2_kg 
SelectSpeedVO2plot

%% load speed data from Alex 
% load('all_vel_vec.mat')

%% these are the matching video and metabolic files: * new from Joaquin
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

% new videos from Joaquin 
% tt13_273b_NainoaA -- 23
% tt13_276_C Nainoa -- 24
% tt13_281a_LonoA4 -- 26 

%% load new files from Joaquin 
% cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/TrainertoTrainer_velocity/
% new_Nainoa_A_2 = newTrainerFiles('tt13_273b_NainoaA_vel.mat');
% new_Nainoa_C_2 = newTrainerFiles('tt13_276_C_Nainoa_vel.mat');
% new_Lono_A4_2 = newTrainerFiles('tt13_281a_LonoA4_vel.mat');
% 
% new_Lono_A4 = newTrainerFiles('tt13_276a01_LonoA4_vel.mat');
% new_Lono_A = newTrainerFiles('tt13_269b01_LonoA_vel.mat');
% new_Lono_C = newTrainerFiles('tt13_280_C_Lono_vel.mat');
% 
% new_Kolohe_A4 = newTrainerFiles('tt13_288a01_KoloheA4_vel.mat');
% new_Kolohe_A = newTrainerFiles('tt13_271b01_KoloheA_vel.mat');
% new_Kolohe_C = newTrainerFiles('tt13_269_C_Kolohe_vel.mat');
% 
% new_Liko_A = newTrainerFiles('tt13_279b01_LikoA_vel.mat'); 
% new_Liko_C = newTrainerFiles('tt13_273_C_Liko_vel.mat');
% 
% cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/

%% load new files from Joaquin 
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/Trainer_linsm/
new_Nainoa_A_2 = newTrainerFiles('tt13_273b_vel.mat'); %
new_Nainoa_C_2 = newTrainerFiles('tt13_276_NaC_vel.mat'); % 
new_Lono_A4_2 = newTrainerFiles('tt13_281a_vel.mat'); %

new_Lono_A4 = newTrainerFiles('tt13_276a01_vel.mat'); %
new_Lono_A = newTrainerFiles('tt13_269b01_vel.mat');%
new_Lono_C = newTrainerFiles('tt13_280_C_vel.mat');%

new_Kolohe_A4 = newTrainerFiles('tt13_288a01_vel.mat');%
new_Kolohe_A = newTrainerFiles('tt13_271b01_vel.mat');%
new_Kolohe_C = newTrainerFiles('tt13_269_C_vel.mat'); %

new_Liko_A = newTrainerFiles('tt13_279b01_vel.mat'); %
new_Liko_C = newTrainerFiles('tt13_273_C_vel.mat');%
new_Liko_A4 = newTrainerFiles('tt13_277a01_vel.mat');

new_Nainoa_A4 = newTrainerFiles('tt13_277b01_vel.mat');

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/
%% plot these and see what's different - old and new files 
% figure(8), clf, hold on 
% scatter(1,nanmean(Lono_C),'o'), scatter(1,nanmean(new_Lono_C),'o','filled')
% scatter(2,nanmean(Kolohe_C),'o'), scatter(2,nanmean(new_Kolohe_C),'o','filled')
% scatter(3,nanmean(Liko_C),'o'), scatter(3,nanmean(new_Liko_C),'o','filled')
% 
% scatter(4,nanmean(Lono_A),'o'), scatter(4,nanmean(new_Lono_A),'o','filled')
% scatter(5,nanmean(Kolohe_A),'o'), scatter(5,nanmean(new_Kolohe_A),'o','filled')
% scatter(6,nanmean(Liko_A),'o'), scatter(6,nanmean(new_Liko_A),'o','filled')
% 
% scatter(7,nanmean(Lono_A4),'o'), scatter(7,nanmean(new_Lono_A4),'o','filled')
% scatter(8,nanmean(Kolohe_A4),'o'), scatter(8,nanmean(new_Kolohe_A4),'o','filled')
%% put the VO2 data in the same structure
% animal, day, condition, mean speed, VO2kg rest, VO2kg recov0-2
% see indices and filenames above from "Trainer Files.xlsx"
idx = [19 3 12 15 4 13 18 9 23 24 26]; % need other files 

for i = 1:length(idx)
all{i,1} = VO2_table{idx(i),1}; % filename
all{i,2} = VO2_table{idx(i),2}; % condition
all{i,3} = VO2kg_table{idx(i),4}(1)*1000; % rest last minute (convert to mL)
all{i,4} = VO2kg_table{idx(i),7}(1)*1000; % rest first 2 min of recovery (convert to mL)
end
% add speeds
all{1,5} = mean(new_Lono_C); % mean speed from Alex
all{2,5} = mean(new_Kolohe_C); 
all{3,5} = mean(new_Liko_C); 
all{4,5} = mean(new_Lono_A); 
all{5,5} = mean(new_Kolohe_A); 
all{6,5} = mean(new_Liko_A); 
all{7,5} = mean(new_Lono_A4); % same mean and median but different files
all{8,5} = mean(new_Kolohe_A4); % same mean and median but different files
all{9,5} = nanmean(new_Nainoa_A_2); 
all{10,5} = nanmean(new_Nainoa_C_2);
all{11,5} = nanmean(new_Lono_A4_2); 


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
% COT = [J/m/kg]

COT_tot = ([all{:,4}]*20.1)./([all{:,5}]*60);
COT_net = (([all{:,4}]-[all{:,3}])*20.1)./([all{:,5}]*60);

figure(99), clf, hold on
for i = 1:length(all)
h = plot([all{i,5}],COT_tot(i),'kd','markerfacecolor','b','markersize',8); 
if strfind(all{i,2},'C')
    set(h,'color','k','marker','o','markerfacecolor','k');
else if strfind(all{i,2},'A4')
        set(h,'color','k','marker','s','markerfacecolor','r');
end
end
end
xlabel('Speed (m/s)'), ylabel('COT (J/m/kg)')
xlim([1.5 4.0])
adjustfigurefont
print('DQ2013_TrainerToTrainer_COT','-dpng','-r300')

% locomotor costs
LC = COT_net./COT_tot;
figure(99), clf, hold on
for i = 1:length(all)
h = plot([all{i,5}],LC(i),'bd'); 
if strfind(all{i,2},'C')
    set(h,'color','k','marker','o');
else if strfind(all{i,2},'A4')
        set(h,'color','r','marker','s');
end
end
end
xlabel('Speed (m/s)'), ylabel('Locomotor Cost (%)')
xlim([1.5 4.0])
adjustfigurefont
print('DQ2013_TrainerToTrainer_LC','-dpng','-r300')

