% BoatTrackShift
close all

% Take boat track from video and shift it slightly to align all three
% videos
C = load('Nainoa_285_C_Track');
A = load('Nainoa_284_A_Track');
A2 = load('Nainoa_287_A2_Track');

figure(1); clf; hold on
plot(C.boat(:,2),C.boat(:,3),'.','MarkerSize',10)
plot(C.dolphin(:,2),C.dolphin(:,3),'.','MarkerSize',10)
plot(A.boat(:,2),A.boat(:,3),'.','MarkerSize',10)
plot(A.dolphin(:,2),A.dolphin(:,3),'.','MarkerSize',10)
plot(A2.boat(:,2),A2.boat(:,3),'.','MarkerSize',10)
plot(A2.dolphin(:,2),A2.dolphin(:,3),'.','MarkerSize',10)


% what is the maximum y of each?
Cmax = max(C.boat(:,3));
Amax = max(A.boat(:,3));
A2max = max(A2.boat(:,3));

% shift and check
shift_A.boat(:,3) = A.boat(:,3) + abs(Cmax - Amax);
shift_A.dolphin(:,3) = A.dolphin(:,3) + abs(Cmax - Amax);
plot(A.boat(:,2), shift_A.boat(:,3),'ro')

shift_A2.boat(:,3) = A2.boat(:,3) + abs(A2max - Cmax);
shift_A2.dolphin(:,3) = A2.dolphin(:,3) + abs(A2max - Cmax);
plot(A2.boat(:,2), shift_A2.boat(:,3),'bo')

figure(2); hold on
plot(C.boat(:,2), C.boat(:,3),'.','MarkerSize',10)
plot(A.boat(:,2), shift_A.boat(:,3),'.','MarkerSize',10)
plot(A2.boat(:,2), shift_A2.boat(:,3),'.','MarkerSize',10)
legend('C boat','A boat','A2 boat')

figure(3); hold on
plot(C.dolphin(:,2), C.dolphin(:,3),'.','MarkerSize',10)
plot(A.dolphin(:,2), shift_A.dolphin(:,3),'.','MarkerSize',10)
plot(A2.dolphin(:,2), shift_A2.dolphin(:,3),'.','MarkerSize',10)
legend('C dolphin','A dolphin','A2 dolphin')

% Plot all together again
figure(4); clf; hold on
plot(C.boat(:,2), C.boat(:,3),'.','MarkerSize',10)
plot(C.dolphin(:,2), C.dolphin(:,3),'.','MarkerSize',10)
plot(A.boat(:,2), shift_A.boat(:,3),'.','MarkerSize',10)
plot(A.dolphin(:,2), shift_A.dolphin(:,3),'.','MarkerSize',10)
plot(A2.boat(:,2), shift_A2.boat(:,3),'.','MarkerSize',10)
plot(A2.dolphin(:,2), shift_A2.dolphin(:,3),'.','MarkerSize',10)
legend('C boat','C dolphin','A boat','A dolphin','A2 boat','A2 dolphin')

%%
figure(5); clf; set(gcf,'position',[147 290 1220 380])
subplot(211); hold on
plot(C.dolphin(:,1),C.dolphin(:,2),'.','MarkerSize',10)
plot(A.dolphin(:,1)-abs(25.18-70.9),A.dolphin(:,2),'.','MarkerSize',10)
plot(A2.dolphin(:,1)+abs(11.64-25.18),A2.dolphin(:,2),'.','MarkerSize',10)

subplot(212); hold on
plot(C.dolphin(:,1),shift_C.dolphin(:,3),'.','MarkerSize',10)
plot(A.dolphin(:,1)-abs(65.4-20.53),A.dolphin(:,3),'.','MarkerSize',10)
plot(A2.dolphin(:,1)+abs(20.53-8.25),shift_A2.dolphin(:,3),'.','MarkerSize',10)

