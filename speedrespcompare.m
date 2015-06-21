close all; clear all; clc

% load data
[AllTrials,txt] = xlsread('DQ13_MetabSwimSpeeds');
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/
load('VO2_table')
headers = {'Filename';'Condition';'Rest all';'Rest last 2 min';...
    'Recov all';'Recov min 1';'Recov 0-2 min';'Recov min 2';...
    'Recov 5 min';'Recov 3-5 min'};


% make text vector of filenames
for i = 1:length(txt)
 text{i} = txt{1,i};
end

% find filename in VO2 table and match index for speed
for n = 1:length(AllTrials)
    filename = regexprep(text{n},'13','');
    filename = regexprep(filename,'+','');
    
    for i = 1:size(VO2_table,1)
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
xlabel('Mean lap Duration (s)'); ylabel('PAR')

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print -dtiff PARvsMeanLapSpeed

%% plot VO2 L/kg/min vs. Lapspeed
figure(90); hold on
for i = 1:length(speed)
    if strfind(VO2_table{i,2},'A4') == 1
        plot(speed(i),VO2_table{i,7}(1),'rs')
    else if strfind(VO2_table{i,2},'C')
            plot(speed(i),VO2_table{i,7}(1),'ko')
        else
            plot(speed(i),VO2_table{i,7}(1),'b^')
        end
    end
end
xlabel('Mean lap Duration (s)'); ylabel('VO_2 (L/Kg/min)')


%%  Calculate PAR
for i = 1:length(VO2_table)
    PAR(i) = VO2_table{i,6}(1)/VO2_table{i,4}(1);
end

%%
figure(12); 
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,1},'Lono')
        subplot(221); title('Lono'); hold on; xlim([-0.5 2.5])
        ylabel('PAR')
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot(222); title('Kolohe'); hold on; xlim([-0.5 2.5])
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot(223); title('Liko'); hold on; xlim([-0.5 2.5])
        xlabel('Condition'); ylabel('PAR')
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot(224); title('Nainoa'); hold on; xlim([-0.5 2.5])
        xlabel('Condition')
    end
    if strfind(VO2_table{i,2},'C')
        h = plot(0,PAR(i),'o');
    else if strfind(VO2_table{i,2},'A4')
            h = plot(2,PAR(i),'s');
        else
            h = plot(1,PAR(i),'^');
        end
    end
    set(h,'color','k')
    set(gca,'xtick',[0 1 2])
end



for i = 1:length(speed)
    if strfind(VO2_table{i,1},'Lono')
        subplot(221); title('Lono'); hold on; xlim([-0.5 2.5])
        ylabel({'PAR';'Mean Lap Duration (sec)'})
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot(222); title('Kolohe'); hold on; xlim([-0.5 2.5])
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot(223); title('Liko'); hold on; xlim([-0.5 2.5])
        xlabel('Condition'); ylabel({'PAR';'Mean Lap Duration (sec)'})
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot(224); title('Nainoa'); hold on; xlim([-0.5 2.5])
        xlabel('Condition')
    end
    if strfind(VO2_table{i,2},'C')
        h = plot(0,speed(i),'o');
    else if strfind(VO2_table{i,2},'A4')
            h = plot(2,speed(i),'s');
        else
            h = plot(1,speed(i),'^');
        end
    end
    set(h,'color','b')
    set(gca,'xtick',[0 1 2])
end

print -dtiff PARlapspeed