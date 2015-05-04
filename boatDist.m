function d = boatDist(dolphin, boat)

%% plot together and calculate distance between troughs/peaks

% plot
figure(20); clf; hold on
plot(dolphin(:,1),dolphin(:,2))
hold on; plot(boat(:,1),boat(:,2))

% find troughs of boat and dolphin
[max_b, min_b] = peakdet(boat(:,2),10);
plot(boat(min_b(:,1)),min_b(:,2),'*')
[max_d, min_d] = peakdet(dolphin(:,2),10);
plot(dolphin(min_d(:,1)),min_d(:,2),'*')

% calculate difference between troughs
d = min_d(:,2) - min_b(:,2);
