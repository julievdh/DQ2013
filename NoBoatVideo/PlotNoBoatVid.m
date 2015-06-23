% plot three laps for non-boat trials

% first process the data
ProcessNoBoatVid


% A.d271 is base file to which all are corrected to

% correct all Kolohe files
[Kolohe.A4.d288,Kolohe.A.d271] = aligntrainers(Kolohe.A4.d288,Kolohe.A.d271);
[Kolohe.A4.d272,Kolohe.A.d271] = aligntrainers(Kolohe.A4.d272,Kolohe.A.d271);
[Kolohe.A.d276,Kolohe.A.d271] = aligntrainers(Kolohe.A.d276,Kolohe.A.d271);
[Kolohe.A.d282,Kolohe.A.d271] = aligntrainers(Kolohe.A.d282,Kolohe.A.d271);
[Kolohe.C.d278,Kolohe.A.d271] = aligntrainers(Kolohe.C.d278,Kolohe.A.d271);

% save Kolohe structure
keep Kolohe; save('Kolohe



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

