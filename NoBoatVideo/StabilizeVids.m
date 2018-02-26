% StabilizeVids

% Stabilize videos that were taken with camera and have waypoints in them
% but need to be corrected for any movement

% this is an attempt

clear all

% load data
load('Nainoa_268_C')
% round all data
lap1_d = round(lap1_d,5);
lap2_d = round(lap2_d,5);

%% time align all data
% find first and last dolphin entry
t1 = lap1_d(1,1);
tend = lap1_d(end,1);
% make trainer entries same index of
tindex = t1:0.4171:tend;
tindex = round(tindex,5);

%% map dolphin and trainer data onto time index
lap1_d_ind = timeAlign(lap1_d,tindex);
lap1_t1_ind = timeAlign(lap1_t1,tindex);
lap1_t2_ind = timeAlign(lap1_t2,tindex);
lap1_t3_ind = timeAlign(lap1_t3,tindex);
lap1_t4_ind = timeAlign(lap1_t4,tindex);

% times for lap 2
t1 = lap2_d(1,1);
tend = lap2_d(end,1);
% make trainer entries same index
tindex2 = t1:0.4171:tend;
tindex2 = round(tindex2,5);

lap2_d_ind = timeAlign(lap2_d,tindex2);
lap2_t1_ind = timeAlign(lap2_t1,tindex2);
lap2_t2_ind = timeAlign(lap2_t2,tindex2);
lap2_t3_ind = timeAlign(lap2_t3,tindex2);
lap2_t4_ind = timeAlign(lap2_t4,tindex2);

% visual test 1D plot
figure(1); clf; hold on
plot(lap1_d_ind(:,1),lap1_d_ind(:,2))
plot(lap1_t1_ind(:,1),lap1_t1_ind(:,2))
plot(lap1_t2_ind(:,1),lap1_t2_ind(:,2))
plot(lap1_t3_ind(:,1),lap1_t3_ind(:,2))
plot(lap1_t4_ind(:,1),lap1_t4_ind(:,2))

plot(lap2_d_ind(:,1),lap2_d_ind(:,2))
plot(lap2_t1_ind(:,1),lap2_t1_ind(:,2))
plot(lap2_t2_ind(:,1),lap2_t2_ind(:,2))
plot(lap2_t3_ind(:,1),lap2_t3_ind(:,2))
plot(lap2_t4_ind(:,1),lap2_t4_ind(:,2))
%% plot in 2D
figure(2); clf; hold on
for i = 1:length(tindex)
    plot(lap1_d_ind(i,2),lap1_d_ind(i,3),'o')
    plot(lap1_t1_ind(i,2),lap1_t1_ind(i,3),'*')
    plot(lap1_t2_ind(i,2),lap1_t2_ind(i,3),'*')
    plot(lap1_t3_ind(i,2),lap1_t3_ind(i,3),'*')
    plot(lap1_t4_ind(i,2),lap1_t4_ind(i,3),'*')
    % pause
end
for i = 1:length(tindex2)
    plot(lap2_d_ind(i,2),lap2_d_ind(i,3),'o')
    plot(lap2_t1_ind(i,2),lap2_t1_ind(i,3),'*')
    plot(lap2_t2_ind(i,2),lap2_t2_ind(i,3),'*')
    plot(lap2_t3_ind(i,2),lap2_t3_ind(i,3),'*')
    plot(lap2_t4_ind(i,2),lap2_t4_ind(i,3),'*')
    % pause
end

%% align trainers
    figure(2); clf; hold on
    
for i = 1:length(lap1_d_ind)-1;
    plot(lap1_d_ind(i,2),lap1_d_ind(i,3),'ko')
    plot(lap1_t1_ind(i,2),lap1_t1_ind(i,3),'k*')
    plot(lap1_t2_ind(i,2),lap1_t2_ind(i,3),'k*')
    plot(lap1_t3_ind(i,2),lap1_t3_ind(i,3),'k*')
    plot(lap1_t4_ind(i,2),lap1_t4_ind(i,3),'k*')
    
    plot(lap1_d_ind(i+1,2),lap1_d_ind(i+1,3),'mo')
    plot(lap1_t1_ind(i+1,2),lap1_t1_ind(i+1,3),'m*')
    plot(lap1_t2_ind(i+1,2),lap1_t2_ind(i+1,3),'m*')
    plot(lap1_t3_ind(i+1,2),lap1_t3_ind(i+1,3),'m*')
    plot(lap1_t4_ind(i+1,2),lap1_t4_ind(i+1,3),'m*')
    
    % calculate difference in x and y between three trainers
    shft1 = lap1_t1_ind(i,2:3)-lap1_t1_ind(i+1,2:3);
    shft2 = lap1_t2_ind(i,2:3)-lap1_t2_ind(i+1,2:3);
    shft3 = lap1_t3_ind(i,2:3)-lap1_t3_ind(i+1,2:3);
    shft4 = lap1_t4_ind(i,2:3)-lap1_t4_ind(i+1,2:3);
    mn_shft = nanmean([shft1 shft2 shft3 shft4]);
    
    % move trainers and dolphins accordingly
    lap1_t1_new(i+1,2:3) = lap1_t1_ind(i+1,2:3)+shft1;
    lap1_t2_new(i+1,2:3) = lap1_t2_ind(i+1,2:3)+shft2;
    lap1_t3_new(i+1,2:3) = lap1_t3_ind(i+1,2:3)+shft3;
    lap1_t4_new(i+1,2:3) = lap1_t4_ind(i+1,2:3)+shft4;
    lap1_d_new(i+1,2:3) = lap1_d_ind(i+1,2:3)+mn_shft;
    
    % visual check
    plot(lap1_t1_new(i+1,2),lap1_t1_new(i+1,3),'c*')
    plot(lap1_t2_new(i+1,2),lap1_t2_new(i+1,3),'c*')
    plot(lap1_t3_new(i+1,2),lap1_t3_new(i+1,3),'c*')
    plot(lap1_t4_new(i+1,2),lap1_t4_new(i+1,3),'c*')
    plot(lap1_d_new(i+1,2),lap1_d_new(i+1,3),'co')
    
    % move to next step
    % pause
end
