% ANOVA on Swim Speeds

% Import, sort and run
DQ13_SwimSpeed
legend off

%% sort animals
for i = 1:size(txt,2)
if strfind(txt{1,i},'Kolohe')
    animal(i) = 1;
end
if strfind(txt{1,i},'Liko')
    animal(i) = 2;
end
if strfind(txt{1,i},'Lono')
    animal(i) = 3;
end
if strfind(txt{1,i},'Nainoa')
    animal(i) = 4;
end
end

condition(C) = 0;
condition(A) = 1;
condition(A4) = 5;
condition(C_BOAT) = 10;
condition(A_BOAT) = 11;
condition(A2_BOAT) = 13;

% Two-Way ANOVA
[p,table,stats] = anovan(nanmean(AllTrials),{animal condition});
figure
[c,m,h,nms] = multcompare(stats,'dim',2);

%% DID IN R INSTEAD -- see SwimSpeed.R
