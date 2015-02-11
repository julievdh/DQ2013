% Load in video data, determine distance between boat and dolphin
close all

% load data
C = load('Lono_288_C_Track');
A = load('Lono_285_A_Track');
A2 = load('Lono_287_A2_Track');

filenames = {'Lono_288_C_Track'; 'Lono_285_A_Track'; 'Lono_287_A2_Track'};
for j = 1:3
load(filenames{j})

% plot
figure(1); hold on
plot(boat(:,2),boat(:,3),'.','MarkerSize',10)
plot(dolphin(:,2),dolphin(:,3),'.','MarkerSize',10)
xlabel('Video X'); ylabel('Video Y')

clear dist
%% calculate distance between matched up times
for i = 1:length(boat)
    ii = find(dolphin(:,1) == boat(i,1));
    if isempty(ii) < 1
        dist(i,1) = boat(i,1);
        dist(i,2) = boat(i,2) - dolphin(ii,2);
        dist(i,3) = boat(i,3) - dolphin(ii,3);
    end
end

for i = 1:length(dolphin)
    ii = find(boat(:,1) == dolphin(i,1));
    if isempty(ii) < 1
        dist2(i,1) = dolphin(i,1);
        dist2(i,2) = boat(ii,2)- dolphin(i,2);
        dist2(i,3) = boat(ii,3) - dolphin(i,3);
    end
end

% replace zeros with NaN
dist(dist==0)=NaN;
dist2(dist2==0)=NaN;

% sort rows
[Y,I] = sort(dist(:,1));
dist = dist(I,:); 
[Y,I] = sort(dist2(:,1));
dist2 = dist2(I,:); 

% plot distances
figure(2); hold on
plot(dist(:,1),sqrt(dist(:,2).^2+dist(:,3).^2),'.')
% plot(dist2(:,1),sqrt(dist2(:,2).^2+dist2(:,3).^2),'.')
xlabel('Frame in video'); ylabel('Relative Distance')

if j == 1
    C.dist = dist;
    C.totaldist = sqrt(dist(:,2).^2+dist(:,3).^2);
end
if j == 2
    A.dist = dist;
    A.totaldist = sqrt(dist(:,2).^2+dist(:,3).^2);
end
if j == 3
    A2.dist = dist;
    A2.totaldist = sqrt(dist(:,2).^2+dist(:,3).^2);
end

end

figure(1);
adjustfigurefont
legend('C Boat','C Dolphin','A Boat','A Dolphin','A2 Boat','A2 Dolphin')

figure(2);
adjustfigurefont
legend('C','A','A2')

%%

figure(3); clf; hold on
plot(C.dist(:,1),C.totaldist,'.','MarkerSize',10)
% plot(A.dist(:,1),A.totaldist,'.')
% plot(A2.dist(:,1),A2.totaldist,'.')

% Align distances
shift_A.dist = A.dist(:,1)-abs(63.13-89.39);
plot(shift_A.dist,A.totaldist,'.','MarkerSize',10)
shift_A2.dist = A2.dist(:,1)-abs(63.13-76.26);
plot(shift_A2.dist,A2.totaldist,'.','MarkerSize',10)

set(gca,'xtick',[0 1*60 2*60 3*60 4*60 5*60 6*60])
set(gca,'xticklabels',{'0','1','2','3','4','5','6'})
ylabel('Arbitrary Distance Units')
xlabel('Time (minutes)')
adjustfigurefont; box on
legend('C','A','A2','Location','NW')

%% plot x and y directions separately 
figure(4); clf; set(gcf,'position',[147 290 1220 380])
subplot(211); hold on
plot(C.dolphin(:,1),C.dolphin(:,2),'.','MarkerSize',10)
plot(A.dolphin(:,1)-abs(60.74-28.99),A.dolphin(:,2),'.','MarkerSize',10)
plot(A2.dolphin(:,1)-abs(72.17-28.99),A2.dolphin(:,2),'.','MarkerSize',10)

subplot(212); hold on
plot(C.dolphin(:,1),C.dolphin(:,3),'.','MarkerSize',10)
plot(A.dolphin(:,1)-abs(102.65-78.09),A.dolphin(:,3),'.','MarkerSize',10)
plot(A2.dolphin(:,1)-abs(120.42-78.09),A2.dolphin(:,3),'.','MarkerSize',10)

