% plot three laps for non-boat trials

% load data
% e.g., Kolohe
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/NoBoatVideo
load('KoloheNoBoatVid')

figure(1); clf; hold on
plot(Kolohe.A.d271.trainers(:,2),Kolohe.A.d271.trainers(:,3),'k^','MarkerFaceColor','k')
plot(Kolohe.A.d271.lap1(:,2),Kolohe.A.d271.lap1(:,3),'.','MarkerSize',10)
plot(Kolohe.A.d271.lap2(:,2),Kolohe.A.d271.lap2(:,3),'.','MarkerSize',10)
plot(Kolohe.A.d271.lap3(:,2),Kolohe.A.d271.lap3(:,3),'.','MarkerSize',10)

% plot(Kolohe.A.d276.trainers(:,2),Kolohe.A.d276.trainers(:,3),'k^','MarkerFaceColor','k')
% plot(Kolohe.A.d276.lap1(:,2),Kolohe.A.d276.lap1(:,3),'.','MarkerSize',10)
% plot(Kolohe.A.d276.lap2(:,2),Kolohe.A.d276.lap2(:,3),'.','MarkerSize',10)
% plot(Kolohe.A.d276.lap3(:,2),Kolohe.A.d276.lap3(:,3),'.','MarkerSize',10)
%
% plot(Kolohe.A.d282.trainers(:,2),Kolohe.A.d282.trainers(:,3),'k^','MarkerFaceColor','k')
% plot(Kolohe.A.d282.lap1(:,2),Kolohe.A.d282.lap1(:,3),'.','MarkerSize',10)
% plot(Kolohe.A.d282.lap2(:,2),Kolohe.A.d282.lap2(:,3),'.','MarkerSize',10)
% plot(Kolohe.A.d282.lap3(:,2),Kolohe.A.d282.lap3(:,3),'.','MarkerSize',10)

plot(Kolohe.C.d278.trainers(:,2),Kolohe.C.d278.trainers(:,3),'k^','MarkerFaceColor','k')
plot(Kolohe.C.d278.lap1(:,2),Kolohe.C.d278.lap1(:,3),'.','MarkerSize',10)
plot(Kolohe.C.d278.lap2(:,2),Kolohe.C.d278.lap2(:,3),'.','MarkerSize',10)
plot(Kolohe.C.d278.lap3(:,2),Kolohe.C.d278.lap3(:,3),'.','MarkerSize',10)

plot(Kolohe.A4.d272.trainers(:,2),Kolohe.A4.d272.trainers(:,3),'k^','MarkerFaceColor','k')
plot(Kolohe.A4.d272.lap1(:,2),Kolohe.A4.d272.lap1(:,3),'.','MarkerSize',10)
plot(Kolohe.A4.d272.lap2(:,2),Kolohe.A4.d272.lap2(:,3),'.','MarkerSize',10)
plot(Kolohe.A4.d272.lap3(:,2),Kolohe.A4.d272.lap3(:,3),'.','MarkerSize',10)

