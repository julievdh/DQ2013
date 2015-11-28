% plot lap speeds in different ways
% 19 Nov 2015

% load data
[AllTrials,txt] = xlsread('DQ13_MetabSwimSpeeds');

% find all Control
C = strcmp('C',txt(2,:)); C = find(C == 1);
% find all A
A = strcmp('A',txt(2,:)); A = find(A == 1);
% find all A+4
A8 = strcmp('A+4',txt(2,:)); A8 = find(A8 == 1);
% find all of each individual
KO = strncmp('Kolohe',txt(1,:),6); KO = find(KO == 1);
NA = strncmp('Nainoa',txt(1,:),6); NA = find(NA == 1);
LI = strncmp('Liko',txt(1,:),4); LI = find(LI == 1);
LO = strncmp('Lono',txt(1,:),4); LO = find(LO == 1);

%% plot like targetdist and lapsize
% get times of second, middle, second last laps
for i = 1:length(AllTrials)
    times(i,:) = getTimes(AllTrials(:,i));
end
% set condition
condition(C,2) = 0;
condition(A,2) = 1;
condition(A8,2) = 2;
condition(:,1) = condition(:,2)-0.1; % laps within conditions
condition(:,3) = condition(:,1)+0.2;

an(KO) = 1; an(LI) = 2; an(LO) = 3; an(NA) = 4;
%% plot conditions and laps
figure(3); clf; hold on
for i = 1:length(times)
    h = plot(condition(i,:),times(i,:),'^-');
    if condition(i,2) == 0
        set(h,'Marker','o')
    else if condition(i,2) == 2
            set(h,'Marker','s')
        end
    end
    set(h,'color',col(an(i),:))
end
xlabel('Condition'); ylabel('Distance from Target')
set(gca,'xtick',[0 1 2],'xticklabel',{'C','Tag','Tag+8'})
adjustfigurefont

%% plot all combinations of two vectors
figure(1); clf; hold on
animal = {'KO','LI','LO','NA'};
col = [27 158 119; 217 95 2; 117 112 179; 231 41 138]/255;
for i = 1:4
    allCA = combvec(intersect(C,eval(animal{i})),intersect(A,eval(animal{i}))); % all possible combinations of control and tag
    h = plot(AllTrials(:,allCA(1,:)),AllTrials(:,allCA(2,:)),'o'); set(h,'color',col(i,:))
    allCA8 = combvec(intersect(C,eval(animal{i})),intersect(A8,eval(animal{i}))); % all possible combinations of control and tag + 8
    h = plot(AllTrials(:,allCA8(1,:)),AllTrials(:,allCA8(2,:)),'s');
    set(h,'color',col(i,:),'MarkerFacecolor',col(i,:))
end

plot([15 60],[15 60],'k')
xlabel('Control lap duration (s)'); ylabel('Tag lap duration (s)')
adjustfigurefont
%% plot just specific laps (second, middle, second last)

figure(2); clf; hold on
for i = 1:4
    allCA = combvec(intersect(C,eval(animal{i})),intersect(A,eval(animal{i}))); % all possible combinations of control and tag
    h = plot(times(allCA(1,:),:)',times(allCA(2,:),:)','o-');
    set(h,'color',col(i,:))
    allCA8 = combvec(intersect(C,eval(animal{i})),intersect(A8,eval(animal{i}))); % all possible combinations of control and tag + 8
    h = plot(times(allCA8(1,:),:)',times(allCA8(2,:),:)','s-');
    set(h,'color',col(i,:),'markerfacecolor',col(i,:))
end

plot([15 60],[15 60],'k')
xlabel('Control lap duration (s)'); ylabel('Tag lap duration (s)')
adjustfigurefont
