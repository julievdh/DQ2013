% Tag Percent Drag Difference
% First following Jones 2013
%% Percent Change in Drag - following Jones et al. 2013
Cd_animal_vid = [nanmean(avmav_mtrx(:,1)) nanmean(avmav_mtrx(:,2))];
Cd_tag_vid = [nanmean(avmav_mtrx(:,3)) nanmean(avmav_mtrx(:,4))];
Cd_tag4_vid = [nanmean(avmav_mtrx(:,5)) nanmean(avmav_mtrx(:,6))];
Cd_tag8_vid = [nanmean(avmav_mtrx(:,7)) nanmean(avmav_mtrx(:,8))];

Cd_animal_vidAS = [nanmean(AS_mtrx(:,1)) nanmean(AS_mtrx(:,2))];
Cd_tag_vidAS = [nanmean(AS_mtrx(:,3)) nanmean(AS_mtrx(:,4))];
Cd_tag4_vidAS = [nanmean(AS_mtrx(:,5)) nanmean(AS_mtrx(:,6))];
Cd_tag8_vidAS = [nanmean(AS_mtrx(:,7)) nanmean(AS_mtrx(:,8))];

Cd_animal_CFD = 0.00759;
Cd_tag_CFD = 0.008;
Cd_tag4_CFD = 0.0127;

% Surface areas
SA = [2.39 2.19];
SAt = [0.024 0.024];
SAt4 = [0.0660 0.0660];
SAt8 = [0.1080 0.1080];

% Frontal areas
FA = [1.23 1.21];
FAt = [0.0022 0.0022];
FAt4 = FAt*5;
FAt8 = FAt*9;

%% by Jones
perc_tag_vid = (((Cd_tag_vid.*SAt)./SA)./Cd_animal_vid)*100
perc_tag4_vid = (((Cd_tag4_vid.*SAt4)./SA)./Cd_animal_vid)*100
perc_tag8_vid = (((Cd_tag8_vid.*SAt8)./SA)./Cd_animal_vid)*100

perc_tag_CFD = (((Cd_tag_CFD.*SAt)./SA)./Cd_animal_CFD)*100
perc_tag4_CFD = (((Cd_tag4_CFD.*SAt4)./SA)./Cd_animal_CFD)*100

%% not by Jones:
perc_tag_vid_2 = ((Cd_tag_vid - Cd_animal_vid)./Cd_animal_vid)*100
perc_tag4_vid_2 = ((Cd_tag4_vid - Cd_animal_vid)./Cd_animal_vid)*100
perc_tag8_vid_2 = ((Cd_tag8_vid - Cd_animal_vid)./Cd_animal_vid)*100

perc_tag_vidAS = ((Cd_tag_vidAS - Cd_animal_vidAS)./Cd_animal_vidAS)*100
perc_tag4_vidAS = ((Cd_tag4_vidAS - Cd_animal_vidAS)./Cd_animal_vidAS)*100
perc_tag8_vidAS = ((Cd_tag8_vidAS - Cd_animal_vidAS)./Cd_animal_vidAS)*100


perc_tag_CFD_2 = ((Cd_tag_CFD- Cd_animal_CFD)./Cd_animal_CFD)*100
perc_tag4_CFD_2 = ((Cd_tag4_CFD - Cd_animal_CFD)./Cd_animal_CFD)*100

%% Other CFD Results for Paper
[min(CFD_Cd_notag) max(CFD_Cd_notag)];
[min(notag) max(notag)];
[min(sum(tag')'-notag) max(sum(tag')'-notag)];
[mean(CFD_Cd_tag) std(CFD_Cd_tag)];
[min(sum(tag4')) max(sum(tag4'))];
[mean(CFD_Cd_tag2) std(CFD_Cd_tag2)];
[min(sum(tag4')'-notag) max(sum(tag4')'-notag)];
[mean(CFD_Cd_tag4) std(CFD_Cd_tag4)];

%% two way anova speed-condition for CFD 
allCFDCd = vertcat(CFD_Cd_notag',CFD_Cd_tag',CFD_Cd_tag4');
condition = [repmat(0,6), repmat(1,6), repmat(3,6)];
condition = condition(1,:)';
speed = repmat(vel,3); speed = speed(1,:)';
[p,t,stats] = anovan(allCFDCd,{condition speed},'varnames',{'Condition';'Speed'});

