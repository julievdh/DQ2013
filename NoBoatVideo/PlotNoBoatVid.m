% plot three laps for non-boat trials

% first process the data
ProcessNoBoatVid

%% plot first, second, third lap for each condition
figure(1); clf; set(gcf,'position',[1 241 1015 385])
subplot('position',[0.04 0.1 0.3 0.8]); hold on; title('Kolohe: Second Lap')
plot(Kolohe.A.d271.trainers(:,2),Kolohe.A.d271.trainers(:,3),'k^','MarkerFaceColor','k')
plot(Kolohe.C.d278.lap1_new(:,2),Kolohe.C.d278.lap1_new(:,3),'k.','MarkerSize',10)
plot(Kolohe.A.d271.lap1(:,2),Kolohe.A.d271.lap1(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d272.lap1_new(:,2),Kolohe.A4.d272.lap1_new(:,3),'r.','MarkerSize',10)
plot(Kolohe.A.d276.lap1_new(:,2),Kolohe.A.d276.lap1_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A.d282.lap1_new(:,2),Kolohe.A.d282.lap1_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d288.lap1_new(:,2),Kolohe.A4.d288.lap1_new(:,3),'r.','MarkerSize',10)
plot(Kolohe.C.d269.lap1_new(:,2),Kolohe.C.d269.lap1_new(:,3),'k.','MarkerSize',10)


legend('Trainers','C','A','A+8','Location','NW')


subplot('position',[0.36 0.1 0.3 0.8]); hold on; title('Middle Lap')
plot(Kolohe.A.d271.trainers(:,2),Kolohe.A.d271.trainers(:,3),'k^','MarkerFaceColor','k')
plot(Kolohe.C.d278.lap2_new(:,2),Kolohe.C.d278.lap2_new(:,3),'k.','MarkerSize',10)
plot(Kolohe.A.d271.lap2(:,2),Kolohe.A.d271.lap2(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d272.lap2_new(:,2),Kolohe.A4.d272.lap2_new(:,3),'r.','MarkerSize',10)
plot(Kolohe.A.d276.lap2_new(:,2),Kolohe.A.d276.lap2_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A.d282.lap2_new(:,2),Kolohe.A.d282.lap2_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d288.lap2_new(:,2),Kolohe.A4.d288.lap2_new(:,3),'r.','MarkerSize',10)
plot(Kolohe.C.d269.lap2_new(:,2),Kolohe.C.d269.lap2_new(:,3),'k.','MarkerSize',10)


subplot('position',[0.68 0.1 0.3 0.8]); hold on; title('Second Last Lap')
plot(Kolohe.A.d271.trainers(:,2),Kolohe.A.d271.trainers(:,3),'k^','MarkerFaceColor','k')
plot(Kolohe.C.d278.lap3_new(:,2),Kolohe.C.d278.lap3_new(:,3),'k.','MarkerSize',10)
plot(Kolohe.A.d271.lap3(:,2),Kolohe.A.d271.lap3(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d272.lap3_new(:,2),Kolohe.A4.d272.lap3_new(:,3),'r.','MarkerSize',10)
plot(Kolohe.A.d276.lap3_new(:,2),Kolohe.A.d276.lap3_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A.d282.lap3_new(:,2),Kolohe.A.d282.lap3_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d288.lap3_new(:,2),Kolohe.A4.d288.lap3_new(:,3),'r.','MarkerSize',10)
plot(Kolohe.C.d269.lap3_new(:,2),Kolohe.C.d269.lap3_new(:,3),'k.','MarkerSize',10)

adjustfigurefont
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Kolohe_NoBoatLaps_byC','-depsc','-r300')

%% Lono
figure(2); clf; set(gcf,'position',[1 241 1015 385])
subplot('position',[0.04 0.1 0.3 0.8]); hold on; title('Lono: Second Lap')
plot(Lono.C.d280.trainers_new(:,2),Lono.C.d280.trainers_new(:,3),'k^','MarkerFaceColor','k')
plot(Lono.C.d280.lap1_new(:,2),Lono.C.d280.lap1_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d269.lap1_new(:,2),Lono.A.d269.lap1_new(:,3),'b.','MarkerSize',10)
plot(Lono.A4.d273.lap1_new(:,2),Lono.A4.d273.lap1_new(:,3),'r.','MarkerSize',10)
plot(Lono.C.d275.lap1_new(:,2),Lono.C.d275.lap1_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d278.lap1_new(:,2),Lono.A.d278.lap1_new(:,3),'b.','MarkerSize',10)
plot(Lono.A.d283.lap1_new(:,2),Lono.A.d283.lap1_new(:,3),'b.','MarkerSize',10)
plot(Lono.A4.d276.lap1_new(:,2),Lono.A4.d276.lap1_new(:,3),'r.','MarkerSize',10)
plot(Lono.A4.d281.lap1_new(:,2),Lono.A4.d281.lap1_new(:,3),'r.','MarkerSize',10)

legend('Trainers','C','A','A+8','Location','NW')

subplot('position',[0.36 0.1 0.3 0.8]); hold on; title('Middle Lap')
plot(Lono.C.d280.trainers_new(:,2),Lono.C.d280.trainers_new(:,3),'k^','MarkerFaceColor','k')
plot(Lono.C.d280.lap2_new(:,2),Lono.C.d280.lap2_new(:,3),'k.','MarkerSize',10)
plot(Lono.C.d275.lap2_new(:,2),Lono.C.d275.lap2_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d269.lap2_new(:,2),Lono.A.d269.lap2_new(:,3),'b.','MarkerSize',10)
plot(Lono.A4.d273.lap2_new(:,2),Lono.A4.d273.lap2_new(:,3),'r.','MarkerSize',10)
plot(Lono.C.d275.lap2_new(:,2),Lono.C.d275.lap2_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d278.lap2_new(:,2),Lono.A.d278.lap2_new(:,3),'b.','MarkerSize',10)
plot(Lono.A.d283.lap2_new(:,2),Lono.A.d283.lap2_new(:,3),'b.','MarkerSize',10)
plot(Lono.A4.d276.lap2_new(:,2),Lono.A4.d276.lap2_new(:,3),'r.','MarkerSize',10)
plot(Lono.A4.d281.lap2_new(:,2),Lono.A4.d281.lap2_new(:,3),'r.','MarkerSize',10)

subplot('position',[0.68 0.1 0.3 0.8]); hold on; title('Second Last Lap')
plot(Lono.C.d280.trainers_new(:,2),Lono.C.d280.trainers_new(:,3),'k^','MarkerFaceColor','k')
plot(Lono.C.d280.lap3_new(:,2),Lono.C.d280.lap3_new(:,3),'k.','MarkerSize',10)
plot(Lono.C.d275.lap3_new(:,2),Lono.C.d275.lap3_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d269.lap3_new(:,2),Lono.A.d269.lap3_new(:,3),'b.','MarkerSize',10)
plot(Lono.A4.d273.lap3_new(:,2),Lono.A4.d273.lap3_new(:,3),'r.','MarkerSize',10)
plot(Lono.C.d275.lap3_new(:,2),Lono.C.d275.lap3_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d278.lap3_new(:,2),Lono.A.d278.lap3_new(:,3),'b.','MarkerSize',10)
plot(Lono.A.d283.lap3_new(:,2),Lono.A.d283.lap3_new(:,3),'b.','MarkerSize',10)
plot(Lono.A4.d276.lap3_new(:,2),Lono.A4.d276.lap3_new(:,3),'r.','MarkerSize',10)
plot(Lono.A4.d281.lap3_new(:,2),Lono.A4.d281.lap3_new(:,3),'r.','MarkerSize',10)


adjustfigurefont
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Lono_NoBoatLaps_byC','-depsc','-r300')

%% Liko
figure(3); clf; set(gcf,'position',[1 241 1015 385])
subplot('position',[0.04 0.1 0.3 0.8]); hold on; title('Liko: Second Lap')
plot(Liko.C.d273.trainers_new(:,2),Liko.C.d273.trainers_new(:,3),'k^','MarkerFaceColor','k')
plot(Liko.C.d273.lap1_new(:,2),Liko.C.d273.lap1_new(:,3),'k.','MarkerSize',10)
plot(Liko.A.d279.lap1_new(:,2),Liko.A.d279.lap1_new(:,3),'b.','MarkerSize',10)

legend('Trainers','C','A','Location','NW')

subplot('position',[0.36 0.1 0.3 0.8]); hold on; title('Middle Lap')
plot(Liko.C.d273.trainers_new(:,2),Liko.C.d273.trainers_new(:,3),'k^','MarkerFaceColor','k')
plot(Liko.C.d273.lap2_new(:,2),Liko.C.d273.lap2_new(:,3),'k.','MarkerSize',10)
plot(Liko.A.d279.lap2_new(:,2),Liko.A.d279.lap2_new(:,3),'b.','MarkerSize',10)

subplot('position',[0.68 0.1 0.3 0.8]); hold on; title('Second Last Lap')
plot(Liko.C.d273.trainers_new(:,2),Liko.C.d273.trainers_new(:,3),'k^','MarkerFaceColor','k')
plot(Liko.C.d273.lap3_new(:,2),Liko.C.d273.lap3_new(:,3),'k.','MarkerSize',10)
plot(Liko.A.d279.lap3_new(:,2),Liko.A.d279.lap3_new(:,3),'b.','MarkerSize',10)

adjustfigurefont
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Liko_NoBoatLaps_byC','-depsc','-r300')

%% Nainoa
figure(4); clf; set(gcf,'position',[1 241 1015 385])
subplot('position',[0.04 0.1 0.3 0.8]); hold on; title('Nainoa: Second Lap')
plot(Nainoa.C.d276.trainers_new(:,2),Nainoa.C.d276.trainers_new(:,3),'k^','MarkerFaceColor','k')
plot(Nainoa.C.d276.lap1_new(:,2),Nainoa.C.d276.lap1_new(:,3),'k.','MarkerSize',10)
plot(Nainoa.A.d273.lap1_new(:,2),Nainoa.A.d273.lap1_new(:,3),'b.','MarkerSize',10)

legend('Trainers','C','A','Location','NW')

subplot('position',[0.36 0.1 0.3 0.8]); hold on; title('Middle Lap')
plot(Nainoa.C.d276.trainers_new(:,2),Nainoa.C.d276.trainers_new(:,3),'k^','MarkerFaceColor','k')
plot(Nainoa.C.d276.lap2_new(:,2),Nainoa.C.d276.lap2_new(:,3),'k.','MarkerSize',10)
plot(Nainoa.A.d273.lap2_new(:,2),Nainoa.A.d273.lap2_new(:,3),'b.','MarkerSize',10)

subplot('position',[0.68 0.1 0.3 0.8]); hold on; title('Second Last Lap')
plot(Nainoa.C.d276.trainers_new(:,2),Nainoa.C.d276.trainers_new(:,3),'k^','MarkerFaceColor','k')
plot(Nainoa.C.d276.lap3_new(:,2),Nainoa.C.d276.lap3_new(:,3),'k.','MarkerSize',10)
plot(Nainoa.A.d273.lap3_new(:,2),Nainoa.A.d273.lap3_new(:,3),'b.','MarkerSize',10)

adjustfigurefont
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Nainoa_NoBoatLaps_byC','-depsc','-r300')

%% plot all together
% plot first, second, third lap for each condition
figure(5); clf; set(gcf,'position',[1 241 1015 385])
subplot('position',[0.04 0.1 0.3 0.8]); hold on; title('All: Second Lap')
plot(Kolohe.A.d271.trainers(:,2),Kolohe.A.d271.trainers(:,3),'k^','MarkerFaceColor','k')
plot(Kolohe.C.d278.lap1_new(:,2),Kolohe.C.d278.lap1_new(:,3),'k.','MarkerSize',10)
plot(Kolohe.A.d271.lap1(:,2),Kolohe.A.d271.lap1(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d272.lap1_new(:,2),Kolohe.A4.d272.lap1_new(:,3),'r.','MarkerSize',10)
plot(Kolohe.A.d276.lap1_new(:,2),Kolohe.A.d276.lap1_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A.d282.lap1_new(:,2),Kolohe.A.d282.lap1_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d288.lap1_new(:,2),Kolohe.A4.d288.lap1_new(:,3),'r.','MarkerSize',10)
plot(Kolohe.C.d269.lap1_new(:,2),Kolohe.C.d269.lap1_new(:,3),'k.','MarkerSize',10)
plot(Lono.C.d280.lap1_new(:,2),Lono.C.d280.lap1_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d269.lap1_new(:,2),Lono.A.d269.lap1_new(:,3),'b.','MarkerSize',10)
plot(Lono.A4.d273.lap1_new(:,2),Lono.A4.d273.lap1_new(:,3),'r.','MarkerSize',10)
plot(Lono.C.d275.lap1_new(:,2),Lono.C.d275.lap1_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d278.lap1_new(:,2),Lono.A.d278.lap1_new(:,3),'b.','MarkerSize',10)
plot(Lono.A.d283.lap1_new(:,2),Lono.A.d283.lap1_new(:,3),'b.','MarkerSize',10)
plot(Lono.A4.d276.lap1_new(:,2),Lono.A4.d276.lap1_new(:,3),'r.','MarkerSize',10)
plot(Lono.A4.d281.lap1_new(:,2),Lono.A4.d281.lap1_new(:,3),'r.','MarkerSize',10)
plot(Liko.C.d273.lap1_new(:,2),Liko.C.d273.lap1_new(:,3),'k.','MarkerSize',10)
plot(Liko.A.d279.lap1_new(:,2),Liko.A.d279.lap1_new(:,3),'b.','MarkerSize',10)
plot(Nainoa.C.d276.lap1_new(:,2),Nainoa.C.d276.lap1_new(:,3),'k.','MarkerSize',10)
plot(Nainoa.A.d273.lap1_new(:,2),Nainoa.A.d273.lap1_new(:,3),'b.','MarkerSize',10)


legend('Trainers','C','A','A+8','Location','NW')


subplot('position',[0.36 0.1 0.3 0.8]); hold on; title('Middle Lap')
plot(Kolohe.A.d271.trainers(:,2),Kolohe.A.d271.trainers(:,3),'k^','MarkerFaceColor','k')
plot(Kolohe.C.d278.lap2_new(:,2),Kolohe.C.d278.lap2_new(:,3),'k.','MarkerSize',10)
plot(Kolohe.A.d271.lap2(:,2),Kolohe.A.d271.lap2(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d272.lap2_new(:,2),Kolohe.A4.d272.lap2_new(:,3),'r.','MarkerSize',10)
plot(Kolohe.A.d276.lap2_new(:,2),Kolohe.A.d276.lap2_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A.d282.lap2_new(:,2),Kolohe.A.d282.lap2_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d288.lap2_new(:,2),Kolohe.A4.d288.lap2_new(:,3),'r.','MarkerSize',10)
plot(Kolohe.C.d269.lap2_new(:,2),Kolohe.C.d269.lap2_new(:,3),'k.','MarkerSize',10)
plot(Lono.C.d280.lap2_new(:,2),Lono.C.d280.lap2_new(:,3),'k.','MarkerSize',10)
plot(Lono.C.d275.lap2_new(:,2),Lono.C.d275.lap2_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d269.lap2_new(:,2),Lono.A.d269.lap2_new(:,3),'b.','MarkerSize',10)
plot(Lono.A4.d273.lap2_new(:,2),Lono.A4.d273.lap2_new(:,3),'r.','MarkerSize',10)
plot(Lono.C.d275.lap2_new(:,2),Lono.C.d275.lap2_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d278.lap2_new(:,2),Lono.A.d278.lap2_new(:,3),'b.','MarkerSize',10)
plot(Lono.A.d283.lap2_new(:,2),Lono.A.d283.lap2_new(:,3),'b.','MarkerSize',10)
plot(Lono.A4.d276.lap2_new(:,2),Lono.A4.d276.lap2_new(:,3),'r.','MarkerSize',10)
plot(Lono.A4.d281.lap2_new(:,2),Lono.A4.d281.lap2_new(:,3),'r.','MarkerSize',10)
plot(Liko.C.d273.lap2_new(:,2),Liko.C.d273.lap2_new(:,3),'k.','MarkerSize',10)
plot(Liko.A.d279.lap2_new(:,2),Liko.A.d279.lap2_new(:,3),'b.','MarkerSize',10)
plot(Nainoa.C.d276.lap2_new(:,2),Nainoa.C.d276.lap2_new(:,3),'k.','MarkerSize',10)
plot(Nainoa.A.d273.lap2_new(:,2),Nainoa.A.d273.lap2_new(:,3),'b.','MarkerSize',10)


subplot('position',[0.68 0.1 0.3 0.8]); hold on; title('Second Last Lap')
plot(Kolohe.A.d271.trainers(:,2),Kolohe.A.d271.trainers(:,3),'k^','MarkerFaceColor','k')
plot(Kolohe.C.d278.lap3_new(:,2),Kolohe.C.d278.lap3_new(:,3),'k.','MarkerSize',10)
plot(Kolohe.A.d271.lap3(:,2),Kolohe.A.d271.lap3(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d272.lap3_new(:,2),Kolohe.A4.d272.lap3_new(:,3),'r.','MarkerSize',10)
plot(Kolohe.A.d276.lap3_new(:,2),Kolohe.A.d276.lap3_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A.d282.lap3_new(:,2),Kolohe.A.d282.lap3_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d288.lap3_new(:,2),Kolohe.A4.d288.lap3_new(:,3),'r.','MarkerSize',10)
plot(Kolohe.C.d269.lap3_new(:,2),Kolohe.C.d269.lap3_new(:,3),'k.','MarkerSize',10)
plot(Lono.C.d280.lap3_new(:,2),Lono.C.d280.lap3_new(:,3),'k.','MarkerSize',10)
plot(Lono.C.d275.lap3_new(:,2),Lono.C.d275.lap3_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d269.lap3_new(:,2),Lono.A.d269.lap3_new(:,3),'b.','MarkerSize',10)
plot(Lono.A4.d273.lap3_new(:,2),Lono.A4.d273.lap3_new(:,3),'r.','MarkerSize',10)
plot(Lono.C.d275.lap3_new(:,2),Lono.C.d275.lap3_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d278.lap3_new(:,2),Lono.A.d278.lap3_new(:,3),'b.','MarkerSize',10)
plot(Lono.A.d283.lap3_new(:,2),Lono.A.d283.lap3_new(:,3),'b.','MarkerSize',10)
plot(Lono.A4.d276.lap3_new(:,2),Lono.A4.d276.lap3_new(:,3),'r.','MarkerSize',10)
plot(Lono.A4.d281.lap3_new(:,2),Lono.A4.d281.lap3_new(:,3),'r.','MarkerSize',10)
plot(Liko.C.d273.lap3_new(:,2),Liko.C.d273.lap3_new(:,3),'k.','MarkerSize',10)
plot(Liko.A.d279.lap3_new(:,2),Liko.A.d279.lap3_new(:,3),'b.','MarkerSize',10)
plot(Nainoa.C.d276.trainers_new(:,2),Nainoa.C.d276.trainers_new(:,3),'k^','MarkerFaceColor','k')
plot(Nainoa.C.d276.lap3_new(:,2),Nainoa.C.d276.lap3_new(:,3),'k.','MarkerSize',10)
plot(Nainoa.A.d273.lap3_new(:,2),Nainoa.A.d273.lap3_new(:,3),'b.','MarkerSize',10)


adjustfigurefont
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('All_NoBoatLaps_byC','-depsc','-r300')