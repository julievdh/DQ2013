% for a file
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData
load('VO2_table')
for n = 1:length(VO2_table)
    filenames{n} = VO2_table{n,1};
end

for n = 1:length(filenames)
    filename = filenames{n};
    load(filename);
    
    % extract parameters from VO2 table
    if strfind(VO2_table{n,1},filename) == 1
        VO2_pre = VO2_table{n,3};
        VO2_2min_pre = VO2_table{n,4};
        VO2_post = VO2_table{n,5};
        VO2_1min_post = VO2_table{n,6};
        VO2_2min_post = VO2_table{n,7};
        VO2_min2_post = VO2_table{n,8};
        VO2_5min_post = VO2_table{n,9};
        VO2_min35_post = VO2_table{n,10};
    end
    
    % plot pre and post together, and last 2 min average resting VO2
    figure(1); clf; hold on; ylim([0 4])
    plot(pre(:,12)/12000,pre(:,20),'.-')
    plot(post(:,12)/12000,post(:,20),'.-')
    plot([0 5],[VO2_2min_pre(1) VO2_2min_pre(1)])
    xlabel('Time (min)'); ylabel('Corrected VO_2 (L/min)')
    
    % calculate PAR, plus lower and upper bounds with error
    PAR = post(:,20)/VO2_2min_pre(1);
    PAR(:,2) = post(:,20)/(VO2_2min_pre(1)-VO2_2min_pre(2));
    PAR(:,3) = post(:,20)/(VO2_2min_pre(1)+VO2_2min_pre(2));
    
    % plot PAR with error
    figure(2); clf; hold on; ylim([0 40])
    plot(post(:,12)/12000,PAR,'-')
    xlabel('Time (min)'); ylabel('PAR')
    
    % calculate recovery time
    thresh = 3; % times above resting threshold
    plot([0 5],[thresh thresh])
    rtime = [];
    rtime = find(PAR(:,1) < thresh);
    if isempty(rtime) == 0
        rtime = rtime(rtime > 1); 
        rtime = post(rtime(1),12)/12000;
        plot([rtime rtime],[0.5 5])
    end
    
    % calculate minPAR
    [minpar(:,n), ind(:,n)] = min(PAR);
    indtime(:,n) = post(ind(:,n),12)/12000;
    
    % save PAR and rtime in VO2 table
    
    if strfind(VO2_table{n,1},filename) == 1
        VO2_table{n,11} = PAR;
        VO2_table{n,12} = rtime;
    end
    
    
    pause
    
end

return
%%
figure(3); hold on
for i = 1:length(VO2_table)
    if isempty(VO2_table{i,12}) == 0
        if strfind(VO2_table{i,2},'C')
            plot(0,VO2_table{i,12},'ko');
        else if strfind(VO2_table{i,2},'A4')
                plot(4,VO2_table{i,12},'ro');
            else
                plot(1,VO2_table{i,12},'bo');
            end
        end
    end
end
xlabel('Condition'); ylabel('time to within 2x resting')

figure(4); clf; hold on
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,2},'C')
        plot(0,minpar(1,i),'o')
    else if strfind(VO2_table{i,2},'A4')
            plot(4,minpar(1,i),'o')
        else
            plot(1,minpar(1,i),'o')
        end
    end
end
xlabel('Condition'); ylabel('min PAR')

figure(5); clf; hold on
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,2},'C')
        plot(0,indtime(1,i),'o')
    else if strfind(VO2_table{i,2},'A4')
            plot(4,indtime(1,i),'o')
        else
            plot(1,indtime(1,i),'o')
        end
    end
end
xlabel('Condition'); ylabel('Time to min PAR (min)')

%%

save('VO2_table_boat','VO2_table')