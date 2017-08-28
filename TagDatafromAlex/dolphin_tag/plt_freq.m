% Author: Lauro Ojeda, 2014-2015
function plt_freq(strokes, PERIOD)
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
	MEAN_WIDTH = 4;
	PLOT_DETAILS = 0;
	LABEL_NAMES_SIZE = 12;

	time = strokes.samples * PERIOD;
	freq = 1./time;
	mean_freq= mean(freq');
	std_freq= std(freq');
	disp('Time (s)');
	disp([mean_freq, std_freq]);
	disp('Freq (Hz)');
	disp([1/mean_freq, 1/std_freq]);
	figure;
	plot(freq, 'Color',SIGNAL_COLOR);
	ylabel('Freq (Hz)', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	xlabel('Strokes', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	hold on;
	plot(mean_freq * ones(1, length(freq)), 'k', 'LineWidth', MEAN_WIDTH);
	plot(mean_freq * ones(1, length(freq))  + std_freq, '--k', 'LineWidth', MEAN_WIDTH/2);
	plot(mean_freq * ones(1, length(freq)) - std_freq, '--k', 'LineWidth', MEAN_WIDTH/2);
	hold off;
	xlim([1 length(freq)]);

