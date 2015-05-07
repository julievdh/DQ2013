% load data
[AllTrials,txt] = xlsread('DQ13_MetabSwimSpeeds');

% make text vector of filenames
for i = 1:length(txt)
 text{i} = txt{1,i};
end

% find filename in VO2 table and match index for speed
for n = 1:length(AllTrials)
    filename = regexprep(text{n},'13','');
    filename = regexprep(filename,'+','');
    
    for i = 1:length(VO2_table)
        if strfind(VO2_table{i,1},filename) == 1
            speed(i) = nanmean(AllTrials(:,i));
        end
    end
end

% plot
figure(10); hold on
for i = 1:length(speed)
    if strfind(VO2_table{i,2},'A4') == 1
        plot(speed(i),VO2_table{i,6}(1)/VO2_table{i,4}(1),'rs')
    else if strfind(VO2_table{i,2},'C')
            plot(speed(i),VO2_table{i,6}(1)/VO2_table{i,4}(1),'ko')
        else
            plot(speed(i),VO2_table{i,6}(1)/VO2_table{i,4}(1),'b^')
        end
    end
end

figure(11); clf; hold on
for i = 1:length(speed)
    if strfind(VO2_table{i,2},'A4') == 1
        plot(speed(i),VO2_table{i,6}(1),'rs')
    else if strfind(VO2_table{i,2},'C')
            plot(speed(i),VO2_table{i,6}(1),'ko')
        else
            plot(speed(i),VO2_table{i,6}(1),'b^')
        end
    end
end