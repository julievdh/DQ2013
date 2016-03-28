% Tag Percent Drag Difference
% First following Jones 2013
%% Percent Change in Drag - following Jones et al. 2013
Cd_animal_vid = [nanmean(avmav(mav(:,1) == 0 & mav(:,2) == 1)) nanmean(avmav(mav(:,1) == 0 & mav(:,2) == 2))];
Cd_tag_vid = [nanmean(avmav(mav(:,1) == 1 & mav(:,2) == 1)) nanmean(avmav(mav(:,1) == 1 & mav(:,2) == 2))];
Cd_tag4_vid = [nanmean(avmav(mav(:,1) == 3 & mav(:,2) == 1)) nanmean(avmav(mav(:,1) == 3 & mav(:,2) == 2))];
Cd_tag8_vid = [nanmean(avmav(mav(:,1) == 5 & mav(:,2) == 1)) nanmean(avmav(mav(:,1) == 5 & mav(:,2) == 2))];

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

% by Jones
perc_tag_vid = (((Cd_tag_vid.*SAt)./SA)./Cd_animal_vid)*100
perc_tag4_vid = (((Cd_tag4_vid.*SAt4)./SA)./Cd_animal_vid)*100
perc_tag8_vid = (((Cd_tag8_vid.*SAt8)./SA)./Cd_animal_vid)*100

perc_tag_CFD = (((Cd_tag_CFD.*SAt)./SA)./Cd_animal_CFD)*100
perc_tag4_CFD = (((Cd_tag4_CFD.*SAt4)./SA)./Cd_animal_CFD)*100

% not by Jones:
perc_tag_vid_2 = ((Cd_tag_vid - Cd_animal_vid)./Cd_animal_vid)*100
perc_tag4_vid_2 = ((Cd_tag4_vid - Cd_animal_vid)./Cd_animal_vid)*100
perc_tag8_vid_2 = ((Cd_tag8_vid - Cd_animal_vid)./Cd_animal_vid)*100

perc_tag_CFD_2 = ((Cd_tag_CFD- Cd_animal_CFD)./Cd_animal_CFD)*100
perc_tag4_CFD_2 = ((Cd_tag4_CFD - Cd_animal_CFD)./Cd_animal_CFD)*100