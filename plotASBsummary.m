% Plot Summary Data from Alex and Ding

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/TagDatafromAlex
load('ASB_Data_Summary')
Condition = [1 5 1 5 1 5 1 5];


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
ylabel('Fluke Stroke Amplitude')

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

% paired T on fluke stroke amplitude
[h,p,ci,stats] = ttest([Summary(Condition == 1).flukePitchAmpMean],[Summary(Condition == 5).flukePitchAmpMean], 0.05)

% paired T on fluke stroke frequency
[h,p,ci,stats] = ttest([Summary(Condition == 1).flukePitchFreqMean],[Summary(Condition == 5).flukePitchFreqMean], 0.05)

