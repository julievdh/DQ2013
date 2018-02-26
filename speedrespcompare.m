% Compare lap speed and VO2, PAR 

close all; clear all; clc
warning off % cause xticklabels is a bitch

% load data
[AllTrials,txt] = xlsread('DQ13_MetabSwimSpeeds');
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/
load('VO2_table')
headers = {'Filename';'Condition';'Rest all';'Rest last 2 min';...
    'Recov all';'Recov min 1';'Recov 0-2 min';'Recov min 2';...
    'Recov 5 min';'Recov 3-5 min'};


% make text vector of filenames
for i = 1:length(txt)
 txt2{i} = txt{1,i};
end

% find filename in VO2 table and match index for speed
for n = 1:length(AllTrials)
    filename = regexprep(txt2{n},'13','');
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
figure(12); clf
for i = 1:length(VO2_table)
    if strfind(VO2_table{i,1},'Lono')
        subplot('position',[0.07 0.55 0.38 0.2]); hold on; xlim([-0.5 2.5]); 
        ylabel('PAR'); box on; ylim([0 16])
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'})
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot('position',[0.53 0.55 0.38 0.2]); title('Kolohe'); hold on; 
        xlim([-0.5 2.5]); ylim([0 16]); box on
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'})
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot('position',[0.07 0.1 0.38 0.2]); title('Liko'); hold on; xlim([-0.5 2.5])
        xlabel('Condition'); ylabel('PAR'); box on; ylim([0 16])
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'})
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot('position',[0.53 0.1 0.38 0.2]); title('Nai Noa'); hold on; xlim([-0.5 2.5])
        xlabel('Condition'); ylim([0 2.5]); box on; ylim([0 16])
        set(gca,'xtick',[0 1 2],'xticklabels',{'C','T','T+8'})
    end
    if strfind(VO2_table{i,2},'C')
        h = plot(0,PAR(i),'ko','markerfacecolor','k','markersize',8);
    else if strfind(VO2_table{i,2},'A4')
            h = plot(2,PAR(i),'ks','markerfacecolor',[202/255 0 32/255],'Markersize',8);
        else
            h = plot(1,PAR(i),'k^','markerfacecolor',[5/255 113/255 222/255],'markersize',8);
        end
    end
    % set(h,'color','k') % can keep this if want to keep PAR = black and
    % speed a different colour.
    set(gca,'xtick',[0 1 2])
end

for i = 1:length(speed)
    if strfind(VO2_table{i,1},'Lono')
        subplot('position',[0.07 0.75 0.38 0.2]); hold on; xlim([-0.5 2.5])
        ax = gca; ax.YAxisLocation = 'right';set(gca','xticklabels',{'','',''})
        text(-0.34,46.3,'A: Lono','FontSize',12,'FontWeight','Bold'); box on
    end
    if strfind(VO2_table{i,1},'Kolohe')
        subplot('position',[0.53 0.75 0.38 0.2]); hold on; xlim([-0.5 2.5]); 
        ylim([20 50]); box on
        ax = gca; ax.YAxisLocation = 'right'; ylabel({'Mean Lap'; 'Duration (sec)'}); 
        set(gca','xticklabels',{'','',''}); 
        text(-0.34,46.3,'B: Kolohe','FontSize',12,'FontWeight','Bold'); 
    end
    if strfind(VO2_table{i,1},'Liko')
        subplot('position',[0.07 0.3 0.38 0.2]); hold on; xlim([-0.5 2.5]); ylim([20 50])
        ax = gca; ax.YAxisLocation = 'right'; set(gca','xticklabels',{'','',''})
        text(-0.34,46.3,'C: Liko','FontSize',12,'FontWeight','Bold'); box on
    end
    if strfind(VO2_table{i,1},'Nainoa')
        subplot('position',[0.53 0.3 0.38 0.2]); hold on; xlim([-0.5 2.5]); ylim([20 50])
        ax = gca; ax.YAxisLocation = 'right'; set(gca','xticklabels',{'','',''}); box on
        ylabel({'Mean Lap'; 'Duration (sec)'}); 
        text(-0.34,46.3,'D: Nai Noa','FontSize',12,'FontWeight','Bold'); 
    end
    if strfind(VO2_table{i,2},'C')
        h = plot(0,speed(i),'ko','markerfacecolor','k','markersize',8);
    else if strfind(VO2_table{i,2},'A4')
            h = plot(2,speed(i),'ks','markerfacecolor',[202/255 0 32/255],'markersize',8);
        else
            h = plot(1,speed(i),'k^','markerfacecolor',[5/255 113/255 222/255],'markersize',8);
        end
    end
    %set(h,'color','b')
    set(gca,'xtick',[0 1 2],'xticklabels',{'','',''})
end

adjustfigurefont

print -dtiff PARlapspeed

%%
% load data
[AllTrials,txt] = xlsread('DQ13_MetabSwimSpeeds');

% make text vector of filenames
for i = 1:length(txt)
 txt2{i} = txt{1,i};
end

% find filename in VO2 table and match index for speed
for n = 1:length(AllTrials)
    filename = regexprep(txt2{n},'13','');
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
