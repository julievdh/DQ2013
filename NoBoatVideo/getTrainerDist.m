function [dists,coords] = getTrainerDist(file,structure)

% EXAMPLE
figure(1); clf; hold on
plot(file.trainers(:,2),file.trainers(:,3),'k^','MarkerFaceColor','k')
plot(file.lap1(:,2),file.lap1(:,3),'.','MarkerFaceColor','k')
plot(file.lap2(:,2),file.lap2(:,3),'.','MarkerFaceColor','k')
plot(file.lap3(:,2),file.lap3(:,3),'.','MarkerFaceColor','k')
legend('Trainers','Lap 1','Lap 2','Lap 3')

% select the three points (one per lap)
coords = ginput(3);

% compute distance between trainer and three points
dists = sqrt((coords(:,1)-file.trainers(2,2)).^2 + (coords(:,2)-file.trainers(2,3)).^2);

end
