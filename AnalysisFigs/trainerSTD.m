% how much variance is there in trainer positions from different files?

% load data
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/NoBoatVideo
load('KoloheNoBoatVid'); load('LonoNoBoatVid'); 
load('NainoaNoBoatVid'); load('LikoNoBoatVid')

% plot all trainer_new locations
figure(10); clf; hold on
plot(Kolohe.C.d278.trainers_new(:,2),Kolohe.C.d278.trainers_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A.d271.trainers(:,2),Kolohe.A.d271.trainers(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d272.trainers_new(:,2),Kolohe.A4.d272.trainers_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A.d276.trainers_new(:,2),Kolohe.A.d276.trainers_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A.d282.trainers_new(:,2),Kolohe.A.d282.trainers_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.A4.d288.trainers_new(:,2),Kolohe.A4.d288.trainers_new(:,3),'b.','MarkerSize',10)
plot(Kolohe.C.d269.trainers_new(:,2),Kolohe.C.d269.trainers_new(:,3),'b.','MarkerSize',10)
plot(Lono.C.d280.trainers_new(:,2),Lono.C.d280.trainers_new(:,3),'k.','MarkerSize',10)
plot(Lono.C.d275.trainers_new(:,2),Lono.C.d275.trainers_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d269.trainers_new(:,2),Lono.A.d269.trainers_new(:,3),'k.','MarkerSize',10)
plot(Lono.A4.d273.trainers_new(:,2),Lono.A4.d273.trainers_new(:,3),'k.','MarkerSize',10)
plot(Lono.C.d275.trainers_new(:,2),Lono.C.d275.trainers_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d278.trainers_new(:,2),Lono.A.d278.trainers_new(:,3),'k.','MarkerSize',10)
plot(Lono.A.d283.trainers_new(:,2),Lono.A.d283.trainers_new(:,3),'k.','MarkerSize',10)
plot(Lono.A4.d276.trainers_new(:,2),Lono.A4.d276.trainers_new(:,3),'k.','MarkerSize',10)
plot(Lono.A4.d281.trainers_new(:,2),Lono.A4.d281.trainers_new(:,3),'k.','MarkerSize',10)
plot(Liko.C.d273.trainers_new(:,2),Liko.C.d273.trainers_new(:,3),'r.','MarkerSize',10)
plot(Liko.A.d279.trainers_new(:,2),Liko.A.d279.trainers_new(:,3),'r.','MarkerSize',10)
plot(Nainoa.C.d276.trainers_new(:,2),Nainoa.C.d276.trainers_new(:,3),'g.','MarkerSize',10)
plot(Nainoa.A.d273.trainers_new(:,2),Nainoa.A.d273.trainers_new(:,3),'g.','MarkerSize',10)


%% calculate STD between trainer locations
% extract data
alltrainers = [Kolohe.C.d278.trainers_new;
    Kolohe.A.d271.trainers;
    Kolohe.A4.d272.trainers_new;
Kolohe.A.d276.trainers_new;
Kolohe.A.d282.trainers_new;
Kolohe.A4.d288.trainers_new;
Kolohe.C.d269.trainers_new;
Lono.C.d280.trainers_new;
Lono.C.d275.trainers_new;
Lono.A.d269.trainers_new;
Lono.A4.d273.trainers_new;
Lono.C.d275.trainers_new;
Lono.A.d278.trainers_new;
Lono.A.d283.trainers_new;
Lono.A4.d276.trainers_new
Lono.A4.d281.trainers_new; 
Liko.C.d273.trainers_new;
Liko.A.d279.trainers_new;
Nainoa.C.d276.trainers_new;
Nainoa.A.d273.trainers_new];

%% find all in four locations
alltrainer1 = alltrainers(alltrainers(:,2) > 13,:);
alltrainer2 = alltrainers(alltrainers(:,2) < -13,:);
alltrainer3 = alltrainers(alltrainers(:,2) < 13 & alltrainers(:,2) > 10,:);
alltrainer4 = alltrainers(alltrainers(:,2) < 2 & alltrainers(:,2) > 0,:);

% plot
plot(alltrainer1(:,2),alltrainer1(:,3),'ro')
plot(alltrainer2(:,2),alltrainer2(:,3),'ko')
plot(alltrainer3(:,2),alltrainer3(:,3),'go')
plot(alltrainer4(:,2),alltrainer4(:,3),'bo')

% calculate CV of each
t1 = [std(alltrainer1(:,2))/mean(alltrainer1(:,2)) std(alltrainer1(:,3))/mean(alltrainer1(:,3))];
t2 = [std(alltrainer2(:,2))/mean(alltrainer2(:,2)) std(alltrainer2(:,3))/mean(alltrainer2(:,3))];
t3 = [std(alltrainer3(:,2))/mean(alltrainer3(:,2)) std(alltrainer3(:,3))/mean(alltrainer3(:,3))];
t4 = [std(alltrainer4(:,2))/mean(alltrainer4(:,2)) std(alltrainer4(:,3))/mean(alltrainer4(:,3))];

mean(mean(vertcat(t1, t2, t3, t4)))

%% dare we plot all paths and all trainers?
figure(11); clf; hold on
plot(Kolohe.C.d278.trainers_new(:,2),Kolohe.C.d278.trainers_new(:,3),'k*','MarkerSize',10)
plot(Kolohe.A.d271.trainers(:,2),Kolohe.A.d271.trainers(:,3),'b*','MarkerSize',10)
plot(Kolohe.A4.d272.trainers_new(:,2),Kolohe.A4.d272.trainers_new(:,3),'r*','MarkerSize',10)
plot(Kolohe.A.d276.trainers_new(:,2),Kolohe.A.d276.trainers_new(:,3),'b*','MarkerSize',10)
plot(Kolohe.A.d282.trainers_new(:,2),Kolohe.A.d282.trainers_new(:,3),'b*','MarkerSize',10)
plot(Kolohe.A4.d288.trainers_new(:,2),Kolohe.A4.d288.trainers_new(:,3),'r*','MarkerSize',10)
plot(Kolohe.C.d269.trainers_new(:,2),Kolohe.C.d269.trainers_new(:,3),'k*','MarkerSize',10)
plot(Lono.C.d280.trainers_new(:,2),Lono.C.d280.trainers_new(:,3),'k*','MarkerSize',10)
plot(Lono.C.d275.trainers_new(:,2),Lono.C.d275.trainers_new(:,3),'k*','MarkerSize',10)
plot(Lono.A.d269.trainers_new(:,2),Lono.A.d269.trainers_new(:,3),'b*','MarkerSize',10)
plot(Lono.A4.d273.trainers_new(:,2),Lono.A4.d273.trainers_new(:,3),'r*','MarkerSize',10)
plot(Lono.C.d275.trainers_new(:,2),Lono.C.d275.trainers_new(:,3),'k*','MarkerSize',10)
plot(Lono.A.d278.trainers_new(:,2),Lono.A.d278.trainers_new(:,3),'b*','MarkerSize',10)
plot(Lono.A.d283.trainers_new(:,2),Lono.A.d283.trainers_new(:,3),'b*','MarkerSize',10)
plot(Lono.A4.d276.trainers_new(:,2),Lono.A4.d276.trainers_new(:,3),'r*','MarkerSize',10)
plot(Lono.A4.d281.trainers_new(:,2),Lono.A4.d281.trainers_new(:,3),'r*','MarkerSize',10)
plot(Liko.C.d273.trainers_new(:,2),Liko.C.d273.trainers_new(:,3),'k*','MarkerSize',10)
plot(Liko.A.d279.trainers_new(:,2),Liko.A.d279.trainers_new(:,3),'b*','MarkerSize',10)
plot(Nainoa.C.d276.trainers_new(:,2),Nainoa.C.d276.trainers_new(:,3),'k*','MarkerSize',10)
plot(Nainoa.A.d273.trainers_new(:,2),Nainoa.A.d273.trainers_new(:,3),'b*','MarkerSize',10)

% all second last lap
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
plot(Nainoa.C.d276.trainers_new(:,2),Nainoa.C.d276.trainers_new(:,3),'k*','MarkerFaceColor','k')
plot(Nainoa.C.d276.lap3_new(:,2),Nainoa.C.d276.lap3_new(:,3),'k.','MarkerSize',10)
plot(Nainoa.A.d273.lap3_new(:,2),Nainoa.A.d273.lap3_new(:,3),'b.','MarkerSize',10)