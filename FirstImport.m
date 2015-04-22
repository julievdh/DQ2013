
% find all first breaths of a file
firstbreath = find(AllResp(:,4) == 1);

% plot cumulative O2
figure(1); clf; hold on
for i = 1:length(firstbreath)-1
    h = plot(AllResp(firstbreath(i):firstbreath(i+1)-1,10),'-');
    % different pre and post line styles
    if strfind(Info{firstbreath(i),5},'POST') == 1
        set(h,'LineStyle','--')
    end
    if strfind(Info{firstbreath(i),4},'KOLOHE') == 1
        set(h,'color','b')
    else if strfind(Info{firstbreath(i),4},'LIKO') == 1
            set(h,'color','r')
        else if strfind(Info{firstbreath(i),4},'LONO') == 1
                set(h,'color','k')
            else if strfind(Info{firstbreath(i),4},'NAINOA') == 1
                    set(h,'color','g')
                end
            end
        end
    end
end
i = length(firstbreath);
plot(AllResp(firstbreath(i):firstbreath(end),10))
xlabel('Breath Number'); ylabel('Cumulative O2')

% plot cumulative CO2
figure(2); clf; hold on
for i = 1:length(firstbreath)-1
    h = plot(AllResp(firstbreath(i):firstbreath(i+1)-1,11),'-');
    % different pre and post line styles
    if strfind(Info{firstbreath(i),5},'POST') == 1
        set(h,'LineStyle','--')
    end
    if strfind(Info{firstbreath(i),4},'KOLOHE') == 1
        set(h,'color','b')
    else if strfind(Info{firstbreath(i),4},'LIKO') == 1
            set(h,'color','r')
        else if strfind(Info{firstbreath(i),4},'LONO') == 1
                set(h,'color','k')
            else if strfind(Info{firstbreath(i),4},'NAINOA') == 1
                    set(h,'color','g')
                end
            end
        end
    end
end
i = length(firstbreath);
plot(AllResp(firstbreath(i):firstbreath(end),11))
xlabel('Breath Number'); ylabel('Cumulative CO2')

% plot RQ (VO2/VCO2)
figure(3); clf; hold on
for i = 1:length(firstbreath)-1
    h = plot(AllResp(firstbreath(i):firstbreath(i+1)-1,10)./AllResp(firstbreath(i):firstbreath(i+1)-1,11),'-');
    % different pre and post line styles
    if strfind(Info{firstbreath(i),5},'POST') == 1
        set(h,'LineStyle','--')
    end
    if strfind(Info{firstbreath(i),4},'KOLOHE') == 1
        set(h,'color','b')
    else if strfind(Info{firstbreath(i),4},'LIKO') == 1
            set(h,'color','r')
        else if strfind(Info{firstbreath(i),4},'LONO') == 1
                set(h,'color','k')
            else if strfind(Info{firstbreath(i),4},'NAINOA') == 1
                    set(h,'color','g')
                end
            end
        end
    end
end
i = length(firstbreath);
plot(AllResp(firstbreath(i):firstbreath(end),10)./AllResp(firstbreath(i):firstbreath(end),11))

xlabel('Breath Number'); ylabel('RQ (cumulative O2/cumulative CO2)')

% plot MR 
% plot cumulative O2
figure(1); clf; hold on
for i = 1:length(firstbreath)-1
    h = plot(AllResp(firstbreath(i):firstbreath(i+1)-1,20),'-');
    % different pre and post line styles
    if strfind(Info{firstbreath(i),5},'POST') == 1
        set(h,'LineStyle','--')
    end
    if strfind(Info{firstbreath(i),4},'KOLOHE') == 1
        set(h,'color','b')
    else if strfind(Info{firstbreath(i),4},'LIKO') == 1
            set(h,'color','r')
        else if strfind(Info{firstbreath(i),4},'LONO') == 1
                set(h,'color','k')
            else if strfind(Info{firstbreath(i),4},'NAINOA') == 1
                    set(h,'color','g')
                end
            end
        end
    end
end
i = length(firstbreath);
plot(AllResp(firstbreath(i):firstbreath(end),10))
xlabel('Breath Number'); ylabel('Corrected O2 Consumption Rate')



%%

% Find all Lono, e.g.
[r,c] = find(ismember(Info, 'LONO'));
figure(2); clf; hold on
r = r-1; % because header takes up one row
clear firstbreath
firstbreath = find(AllResp(r,4) == 1);

for i = 1:length(firstbreath)-1
    % find all breaths in that same file
    ii = find(diff(AllResp(firstbreath(i):firstbreath(i+1)-1,10)) < 0);
    if isempty(ii) == 1
        h = plot(AllResp(firstbreath(i):firstbreath(i+1)-1,10),'-');
    else
    h = plot(AllResp(firstbreath(i):firstbreath(i)+ii-1,10),'-');
    end
    pause
%     % different pre and post line styles
%     if strfind(Info{firstbreath(i),5},'POST') == 1
%         set(h,'LineStyle','--')
%     end
%     if strfind(Info{firstbreath(i),4},'KOLOHE') == 1
%         set(h,'color','b')
%     else if strfind(Info{firstbreath(i),4},'LIKO') == 1
%             set(h,'color','r')
%         else if strfind(Info{firstbreath(i),4},'LONO') == 1
%                 set(h,'color','k')
%             else if strfind(Info{firstbreath(i),4},'NAINOA') == 1
%                     set(h,'color','g')
%                 end
%             end
%         end
%     end
end
i = length(firstbreath);
plot(AllResp(firstbreath(i):firstbreath(end),10))