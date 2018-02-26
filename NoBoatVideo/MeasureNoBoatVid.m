% for a file, plot track and trainers and calculate distance between
% trainer 2 and left-most point of dolphin

% load data
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/NoBoatVideo
load('KoloheNoBoatVid'); load('LonoNoBoatVid');
load('NainoaNoBoatVid'); load('LikoNoBoatVid')
load('TrackDistCoords')

% these are all of the files in the structure
files = {'Kolohe.C.d278','Kolohe.C.d269',...
    'Kolohe.A.d271','Kolohe.A.d276','Kolohe.A.d282',...
    'Kolohe.A4.d272','Kolohe.A4.d288',...
    'Lono.C.d275','Lono.C.d280',...
    'Lono.A.d269','Lono.A.d278','Lono.A.d283',...
    'Lono.A4.d273','Lono.A4.d276','Lono.A4.d281',...
    'Liko.C.d273',...
    'Liko.A.d279',...
    'Nainoa.C.d276',...
    'Nainoa.A.d273'};

% if length(coords) < length(files)
% 
% for i = length(coords)+1:length(files)
%     [dist,coord] = getTrainerDist(eval(files{i}),Kolohe);
%     % rows correspond to files, columns correspond to laps
%     coords(i,:) = coord(:,1)';
%     dists(i,:) = dist';
% end
% 
% end
% 
% save('TrackDistCoords','dists','coords')

dists = abs(dists); % absolute value to show increasing distance

% set up conditions
condition(:,2) = [0 0 1 1 1 2 2 0 0 1 1 1 2 2 2 0 1 0 1]';
condition(:,1) = condition(:,2)-0.1; % laps within conditions
condition(:,3) = condition(:,1)+0.2;

%% plot conditions and laps
figure(6); clf; hold on
for i = 1:length(dists)
    h = plot(condition(i,:),dists(i,:),'b^-');
    if condition(i,2) == 0
        set(h,'color','k','Marker','o')
    else if condition(i,2) == 2
            set(h,'color','r','Marker','s')
        end
    end
end
xlabel('Condition'); ylabel('Distance from Target')
set(gca,'xtick',[0 1 2],'xticklabel',{'C','Tag','Tag+8'})
adjustfigurefont

print('TargetDist.eps','-depsc','-r300')

%% calculate size of circle (in x dimension)
for i = 1:length(files)
    sz(i,:) = trackSize(eval(files{i}));
end
    figure(5); clf; hold on
for i = 1:length(sz)
    h = plot(condition(i,:),sz(i,:),'b^-');
    if condition(i,2) == 0
        set(h,'color','k','Marker','o')
    else if condition(i,2) == 2
            set(h,'color','r','Marker','s')
        end
    end
end
xlabel('Condition'); ylabel('Size of Track')
set(gca,'xtick',[0 1 2],'xticklabel',{'C','Tag','Tag+8'})
adjustfigurefont

print('LapSize.eps','-depsc','-r300')

return

%% two way anova (CAUSE YOU JUST LOVE THEM)
allsz = vertcat(sz(:,1),sz(:,2),sz(:,3));
allcond = repmat(condition(:,2),3,1);
alllap = vertcat(ones(19,1),ones(19,1)+1,ones(19,1)+2);

[p,t,stats] = anovan(allsz,{allcond,alllap});
