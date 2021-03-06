% Plot Summary Data from Alex and Ding
close all, clear all
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/TagDatafromAlex
load('ASB_Data_Summary')
load('all_vel_vec.mat') % load speed data from Annika used in paper
Condition = [1 5 1 5 1 5 1 5];
Ind = [1 1 2 2 3 3 4 4]; 

figure(1), clf
subplot(231), hold on
for i = 1:length(Summary)
    h = plot(i,Summary(i).numberOfFluke,'^');
    if Condition(i) == 5
        set(h,'marker','s')
    end
end
ylabel('Number of Fluke Strokes')

subplot(232), hold on
for i = 1:length(Summary)
    h = errorbar(i,Summary(i).flukePitchFreqMean,Summary(i).flukePitchFreqStd,'^');
    if Condition(i) == 5
        set(h,'marker','s')
    end
end
ylabel('Fluke Stroke Frequency (Hz)')


subplot(233), hold on
for i = 1:length(Summary)
    h = errorbar(i,Summary(i).flukePitchAmpMean,Summary(i).flukePitchAmpStd,'^');
    if Condition(i) == 5
        set(h,'marker','s')
    end
end
ylabel('Fluke Stroke Amplitude (radians)')

subplot(234), hold on
for i = 1:length(Summary)
    h = errorbar(i,Summary(i).flukeSurgeAmpMean,Summary(i).flukeSurgeAmpStd,'^');
    if Condition(i) == 5
        set(h,'marker','s')
    end
end
ylabel('Fluke Stroke Amplitude')

subplot(235), hold on
for i = 1:length(Summary)
    h = errorbar(i,Summary(i).flukeSwayAmpMean,Summary(i).flukeSwayAmpStd,'^');
    if Condition(i) == 5
        set(h,'marker','s')
    end
end
ylabel('Fluke Stroke Amplitude')

subplot(236), hold on
for i = 1:length(Summary)
    h = errorbar(Summary(i).flukePitchFreqMean,Summary(i).flukePitchAmpMean,Summary(i).flukePitchAmpStd,'^');
    if Condition(i) == 5
        set(h,'marker','s')
    end
end
ylabel('Fluke Stroke Amplitude'), xlabel('Fluke Stroke Frequency (Hz)')

% ANOVA on fluke stroke amplitude
[p,t,stats] = anovan([Summary.flukePitchAmpMean],{Ind',Condition'},'varnames',{'Ind','Cond'});
% [mean([Summary(Condition == 1).flukePitchAmpMean]) mean([Summary(Condition == 5).flukePitchAmpMean])]
% [std([Summary(Condition == 1).flukePitchAmpMean]) std([Summary(Condition == 5).flukePitchAmpMean])]

% ANOVA on fluke stroke frequency
[p,t,stats] = anovan([Summary.flukePitchFreqMean],{Ind',Condition'},'varnames',{'Ind','Cond'});
% [mean([Summary(Condition == 1).flukePitchFreqMean]) mean([Summary(Condition == 5).flukePitchFreqMean])]
% [std([Summary(Condition == 1).flukePitchFreqMean]) std([Summary(Condition == 5).flukePitchFreqMean])]

%% plot Strouhal - RELATIVE STROUHAL -- NOT CORRECTED FOR AMPLITUDE 
% St(=fA/U)

% for each entry in Summary
for i = 1:length(Summary)
    Summary(i).St = (Summary(i).flukePitchFreqMean*Summary(i).flukePitchAmpMean)/nanmean(eval(Summary(i).name));
end

% plot
figure(5), hold on
for i = 1:length(Summary)
    h = plot(i,Summary(i).St,'^');
    if Condition(i) == 5
        set(h,'marker','s')
    end
end

%% plot Load/Unload data
clear all
load('LoadUnload_Data_Summary')
ind = [1 2 3 4 5; 6 7 8 9 10; 1 2 3 4 5; 6 7 8 9 10];
%%
% speed vs fluke stroke frequency
figure(11), clf, set(gcf,'paperpositionmode','auto')
subplot('position',[0.1 0.58 0.35 0.4]), hold on
for i = 1:4
    for j = 1:5
        h = errorbar(Summary(i,j).averageSpeed,Summary(i,j).flukePitchFreqMean,Summary(i,j).flukePitchFreqStd,'ko');
         if Summary(i,j).cond == 1
            set(h,'markerfaceColor',[55/255 126/255 184/255],'marker','^')  % blue triangle
        else if Summary(i,j).cond == 2
                set(h,'markerfaceColor',[255/255 127/255 0/255],'marker','v')
            else if Summary(i,j).cond == 4
                    set(h,'markerfaceColor',[77/255 175/255 74/255],'marker','d')  % green diamond
                else if Summary(i,j).cond == 6
                        set(h,'markerfaceColor',[152/255 78/255 163/255],'marker','h')  % hexagram
                    else if Summary(i,j).cond == 8
                            set(h,'markerfaceColor',[228/255 26/255 28/255],'marker','s')  % red square
                        end
                    end
                end 
            end 
        end
    end
end
xlabel('Speed (m s^{-1})'), ylabel({'Fluke Stroke','Frequency (Hz)'})
xlim([2.7 5.2])
text(2.75,2.3,'A','FontSize',18,'FontWeight','Bold')

% condition vs frequency
subplot('position',[0.1 0.31 0.8 0.2]), hold on
for i = 1:4
    for j = 1:5
        fHz(i,j) = Summary(i,j).flukePitchFreqMean;
        h = errorbar(ind(i,j),Summary(i,j).flukePitchFreqMean,Summary(i,j).flukePitchFreqStd,'ko');
         if Summary(i,j).cond == 1
            set(h,'markerfaceColor',[55/255 126/255 184/255],'marker','^')  % blue triangle
        else if Summary(i,j).cond == 2
                set(h,'markerfaceColor',[255/255 127/255 0/255],'marker','v')
            else if Summary(i,j).cond == 4
                    set(h,'markerfaceColor',[77/255 175/255 74/255],'marker','d')  % green diamond
                else if Summary(i,j).cond == 6
                        set(h,'markerfaceColor',[152/255 78/255 163/255],'marker','h')  % hexagram
                    else if Summary(i,j).cond == 8
                            set(h,'markerfaceColor',[228/255 26/255 28/255],'marker','s')  % red square
                        end
                    end
                end 
            end 
        end
    end
end
plot(ind(1,1:5),fHz(1,1:5),'k:'),plot(ind(2,1:5),fHz(2,1:5),'k:') % Lono
plot(ind(3,1:5),fHz(3,1:5),'k--'),plot(ind(4,1:5),fHz(4,1:5),'k--') % Kolohe

% xlabel('Drag Condition'), 
ylabel({'Fluke Stroke','Frequency (Hz)'})
xlim([0 11])
set(gca,'xtick',1:10, 'xticklabels',{''})
text(0.2,2.3,'C','FontSize',18,'FontWeight','Bold')


%%
% speed vs amplitude 
subplot('position',[0.55 0.58 0.35 0.4]), hold on
for i = 1:4
    for j = 1:5
        h = errorbar(Summary(i,j).averageSpeed,Summary(i,j).flukePitchAmpMean,Summary(i,j).flukePitchAmpStd/2,'ko');
         if Summary(i,j).cond == 1
            set(h,'markerfaceColor',[55/255 126/255 184/255],'marker','^')  % blue triangle
        else if Summary(i,j).cond == 2
                set(h,'markerfaceColor',[255/255 127/255 0/255],'marker','v')
            else if Summary(i,j).cond == 4
                    set(h,'markerfaceColor',[77/255 175/255 74/255],'marker','d')  % green diamond
                else if Summary(i,j).cond == 6
                        set(h,'markerfaceColor',[152/255 78/255 163/255],'marker','h')  % hexagram
                    else if Summary(i,j).cond == 8
                            set(h,'markerfaceColor',[228/255 26/255 28/255],'marker','s')  % red square
                        end
                    end
                end 
            end 
        end
    end
end
xlabel('Speed (m s^{-1})'), ylabel('Pitch Amplitude (radians)')
xlim([2.7 5.2]), ylim([0.16 0.36])
text(2.75,0.339,'B','FontSize',18,'FontWeight','Bold')

%% condition vs amplitude
subplot('position',[0.1 0.08 0.8 0.2]), hold on
for i = 1:4
    for j = 1:5
        h = errorbar(ind(i,j),Summary(i,j).flukePitchAmpMean,Summary(i,j).flukePitchAmpStd/2,'ko');
         if Summary(i,j).cond == 1
            set(h,'markerfaceColor',[55/255 126/255 184/255],'marker','^')  % blue triangle
        else if Summary(i,j).cond == 2
                set(h,'markerfaceColor',[255/255 127/255 0/255],'marker','v')
            else if Summary(i,j).cond == 4
                    set(h,'markerfaceColor',[77/255 175/255 74/255],'marker','d')  % green diamond
                else if Summary(i,j).cond == 6
                        set(h,'markerfaceColor',[152/255 78/255 163/255],'marker','h')  % hexagram
                    else if Summary(i,j).cond == 8
                            set(h,'markerfaceColor',[228/255 26/255 28/255],'marker','s')  % red square
                        end
                    end
                end 
            end 
        end
    end
end
plot(ind(1,1:5),[Summary(1,1:5).flukePitchAmpMean],'k:'),plot(ind(2,1:5),[Summary(2,1:5).flukePitchAmpMean],'k:')
plot(ind(3,1:5),[Summary(3,1:5).flukePitchAmpMean],'k--'),plot(ind(4,1:5),[Summary(4,1:5).flukePitchAmpMean],'k--')

xlabel('Condition'), ylabel({'Pitch Amplitude','(radians)'})
xlim([0 11]), ylim([0.16 0.36])
set(gca,'xtick',1:10,'xticklabels',{'T+8','T+6','T+4','T+2','T',...
        'T','T+2','T+4','T+6','T+8'})
text(0.2,0.325,'D','FontSize',18,'FontWeight','Bold')
    
print('LoadUnloadKinematics','-dsvg')

return 

%% correct amplitude based on Tag condition
% LoadUnloadAmpCorr

% speed vs strouhal
% subplot('position',[0.55 0.58 0.35 0.4]), hold on
for i = 1:4
    for j = 1:5
        St(i,j) = (Summary(i,j).flukePitchFreqMean * Summary(i,j).ampcorctn)./Summary(i,j).averageSpeed;
        h = plot(Summary(i,j).averageSpeed,St(i,j),'ko');
         if Summary(i,j).cond == 1
            set(h,'markerfaceColor',[55/255 126/255 184/255],'marker','^')  % blue triangle
        else if Summary(i,j).cond == 2
                set(h,'markerfaceColor',[255/255 127/255 0/255],'marker','v')
            else if Summary(i,j).cond == 4
                    set(h,'markerfaceColor',[77/255 175/255 74/255],'marker','d')  % green diamond
                else if Summary(i,j).cond == 6
                        set(h,'markerfaceColor',[152/255 78/255 163/255],'marker','h')  % hexagram
                    else if Summary(i,j).cond == 8
                            set(h,'markerfaceColor',[228/255 26/255 28/255],'marker','s')  % red square
                        end
                    end
                end 
            end 
        end
    end
end
xlabel('Speed (m s^{-1})'), ylabel('Strouhal Number')
xlim([2.7 5.2]), ylim([0.2 0.4])
text(2.75,0.38,'B','FontSize',18,'FontWeight','Bold')

% %% condition vs strouhal
% subplot('position',[0.1 0.08 0.8 0.2]), hold on
% for i = 1:4
%     for j = 1:5
%         h = plot(ind(i,j),St(i,j),'ko');
%          if Summary(i,j).cond == 1
%             set(h,'markerfaceColor',[55/255 126/255 184/255],'marker','^')  % blue triangle
%         else if Summary(i,j).cond == 2
%                 set(h,'markerfaceColor',[255/255 127/255 0/255],'marker','v')
%             else if Summary(i,j).cond == 4
%                     set(h,'markerfaceColor',[77/255 175/255 74/255],'marker','d')  % green diamond
%                 else if Summary(i,j).cond == 6
%                         set(h,'markerfaceColor',[152/255 78/255 163/255],'marker','h')  % hexagram
%                     else if Summary(i,j).cond == 8
%                             set(h,'markerfaceColor',[228/255 26/255 28/255],'marker','s')  % red square
%                         end
%                     end
%                 end 
%             end 
%         end
%     end
% end
% plot(ind(1,1:5),St(1,1:5),'k:'),plot(ind(2,1:5),St(2,1:5),'k:')
% plot(ind(3,1:5),St(3,1:5),'k--'),plot(ind(4,1:5),St(4,1:5),'k--')
% 
% xlabel('Condition'), ylabel({'Strouhal','Number'})
% xlim([0 11])
% set(gca,'xtick',1:10,'xticklabels',{'T+8','T+6','T+4','T+2','T',...
%         'T','T+2','T+4','T+6','T+8'})
% text(0.2,0.38,'D','FontSize',18,'FontWeight','Bold')
%     
% print('LoadUnloadKinematics','-dsvg')
%% 
figure(12), hold on
for i = 1:4
    for j = 1:j
        h = errorbar(Summary(i,j).averageSpeed,Summary(i,j).flukePitchAmpMean,Summary(i,j).flukePitchAmpStd,'ko');
         if Summary(i,j).cond == 1
            set(h,'markerfaceColor',[55/255 126/255 184/255],'marker','^')  % blue triangle
        else if Summary(i,j).cond == 2
                set(h,'markerfaceColor',[255/255 127/255 0/255],'marker','v')
            else if Summary(i,j).cond == 4
                    set(h,'markerfaceColor',[77/255 175/255 74/255],'marker','d')  % green diamond
                else if Summary(i,j).cond == 6
                        set(h,'markerfaceColor',[152/255 78/255 163/255],'marker','h')  % hexagram
                    else if Summary(i,j).cond == 8
                            set(h,'markerfaceColor',[228/255 26/255 28/255],'marker','s')  % red square
                        end
                    end
                end 
            end 
        end
    end
end

xlabel('Speed (m s^{-1})'), ylabel('Fluke Stroke Amplitude (radians)')
%%
figure(13), clf, hold on
for i = 1:4
    for j = 1:5
        h = plot(Summary(i,j).averageSpeed,St(i,j),'ko');
        if Summary(i,j).cond == 1
            set(h,'markerfaceColor',[55/255 126/255 184/255],'marker','^')  % blue triangle
        else if Summary(i,j).cond == 2
                set(h,'markerfaceColor',[255/255 127/255 0/255],'marker','v')
            else if Summary(i,j).cond == 4
                    set(h,'markerfaceColor',[77/255 175/255 74/255],'marker','d')  % green diamond
                else if Summary(i,j).cond == 6
                        set(h,'markerfaceColor',[152/255 78/255 163/255],'marker','h')  % hexagram
                    else if Summary(i,j).cond == 8
                            set(h,'markerfaceColor',[228/255 26/255 28/255],'marker','s')  % red square
                        end
                    end
                end 
            end 
        end
    end
end
xlabel('Speed (m s^{-1})'), ylabel('Strouhal Number')
adjustfigurefont
xlim([2.5 5.5])
%%
figure(14), hold on
for i = 1:4
    for j = 1:5
        h = plot(ind(i,j),St(i,j),'ko');
        if Summary(i,j).cond == 1
            set(h,'markerfaceColor',[55/255 126/255 184/255],'marker','^')  % blue triangle
        else if Summary(i,j).cond == 2
                set(h,'markerfaceColor',[255/255 127/255 0/255],'marker','v')
            else if Summary(i,j).cond == 4
                    set(h,'markerfaceColor',[77/255 175/255 74/255],'marker','d')  % green diamond
                else if Summary(i,j).cond == 6
                        set(h,'markerfaceColor',[152/255 78/255 163/255],'marker','h')  % hexagram
                    else if Summary(i,j).cond == 8
                            set(h,'markerfaceColor',[228/255 26/255 28/255],'marker','s')  % red square
                        end
                    end
                end 
            end 
        end
    end
end
xlabel('Condition'), ylabel('Strouhal Number')
xlim([0 9])

%% for abstract
% other stats are in SlowDown_dolphins2013.m 
% (nanmean(C.Uspeed)-nanmean(T8.Uspeed))/nanmean(T8.Uspeed)
% when drag was removed, dolphins sped up:

perc = mean([(Summary(1,5).averageSpeed-Summary(1,1).averageSpeed)/Summary(1,1).averageSpeed;
    (Summary(3,5).averageSpeed-Summary(3,1).averageSpeed)/Summary(3,1).averageSpeed]);
absol = mean([(Summary(1,5).averageSpeed-Summary(1,1).averageSpeed);
    (Summary(3,5).averageSpeed-Summary(3,1).averageSpeed)]);

% fluke stroke frequency increased:
perc = mean([(Summary(1,5).flukePitchFreqMean-Summary(1,1).flukePitchFreqMean)/Summary(1,1).flukePitchFreqMean;
    (Summary(3,5).flukePitchFreqMean-Summary(3,1).flukePitchFreqMean)/Summary(3,1).flukePitchFreqMean]);
absol = mean([(Summary(1,5).flukePitchFreqMean-Summary(1,1).flukePitchFreqMean);
    (Summary(3,5).flukePitchFreqMean-Summary(3,1).flukePitchFreqMean)]);


% when drag was added, dolphins slowed down:
perc = mean([(Summary(2,5).averageSpeed-Summary(2,1).averageSpeed)/Summary(2,1).averageSpeed;
    (Summary(4,5).averageSpeed-Summary(4,1).averageSpeed)/Summary(4,1).averageSpeed]);
absol = mean([(Summary(2,5).averageSpeed-Summary(2,1).averageSpeed);
    (Summary(4,5).averageSpeed-Summary(4,1).averageSpeed)]);

% fluke stroke frequency decreased:
perc = mean([(Summary(2,5).flukePitchFreqMean-Summary(2,1).flukePitchFreqMean)/Summary(2,1).flukePitchFreqMean;
    (Summary(4,5).flukePitchFreqMean-Summary(4,1).flukePitchFreqMean)/Summary(4,1).flukePitchFreqMean]);
absol = mean([(Summary(2,5).flukePitchFreqMean-Summary(2,1).flukePitchFreqMean);
    (Summary(4,5).flukePitchFreqMean-Summary(4,1).flukePitchFreqMean)]);

