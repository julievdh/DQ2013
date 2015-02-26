% for a file
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/Boat
load('VO2_table_boat')
filenames = {'Lono_285_A';'Lono_287_A2';'Lono_288_C';'Nainoa_284_A';'Nainoa_285_C';'Nainoa_287_A2'};

for n = 1:length(filenames)
    filename = filenames{n};
    load(filename);
    
    figure(1); clf; hold on; ylim([0 4])
    plot(pre(:,12)/12000,pre(:,20),'.-')
    xlabel('Time (min)'); ylabel('Corrected VO_2 (L/min)')
    
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
    
    plot(post(:,12)/12000,post(:,20),'.-')
    xlabel('Time (min)'); ylabel('Corrected VO_2 (L/min)')
    
    plot([0 5],[VO2_2min_pre(1) VO2_2min_pre(1)])
    
    % calculate PAR
    PAR = post(:,20)/VO2_2min_pre(1);
    PAR(:,2) = post(:,20)/(VO2_2min_pre(1)-VO2_2min_pre(2));
    PAR(:,3) = post(:,20)/(VO2_2min_pre(1)+VO2_2min_pre(2));
    
    if strfind(VO2_table{n,2},'C')
        c = [0 0 0];
    else if strfind(VO2_table{n,2},'A2')
            c = [1 0 0];
        else
            c = [0 0 1];
        end
    end
    
    figure(2); hold on
    plot(post(:,12)/12000,PAR(:,1),'-','color',c);
    xlabel('Time (min)'); ylabel('PAR')
    
    % calculate recovery time
    rtimeind = find(PAR(:,1) < 2);
    if isempty(rtime) == 0
        rtime = post(rtimeind,12)/12000;
        for i = 1:length(rtime)-1
        if diff(rtimeind(i:i+1)) == 1
            plot(rtime(i:i+1),PAR(rtimeind(i:i+1),1),'color',c,'LineWidth',2)
        end
        end
    end
    
    % calculate minPAR
    [minpar(:,n), ind(:,n)] = min(PAR);
    indtime(:,n) = post(ind(:,n),12)/12000;
    
    % save PAR and rtime in VO2 table
    if strfind(VO2_table{n,1},filename) == 1
        VO2_table{n,11} = PAR;
        VO2_table{n,12} = rtime;
    end
    
    
end

return

%%

figure(3); clf; hold on
for i = 1:6
    if strfind(VO2_table{i,2},'C')
        plot(0,VO2_table{i,12}(1),'ko');
    else if strfind(VO2_table{i,2},'A2')
            plot(4,VO2_table{i,12}(1),'ro');
        else
            plot(1,VO2_table{i,12}(1),'bo');
        end
    end
end
xlabel('Condition'); ylabel('time to within 2x resting')

figure(4); clf; hold on
cond = [1 4 0 1 0 4];
plot(cond,minpar(1,:),'o')
xlabel('Condition'); ylabel('min PAR')

figure(5); clf; hold on
plot(cond,indtime(1,:),'o')
xlabel('Condition'); ylabel('Time to min PAR (min)')

save('VO2_table_boat','VO2_table')