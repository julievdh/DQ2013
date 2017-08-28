% Author: Lauro Ojeda, 2014-2015
function plt_time(strokes, PERIOD)
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
	MEAN_WIDTH = 4;
	PLOT_DETAILS = 0;
	LABEL_NAMES_SIZE = 12;

	time = strokes.samples * PERIOD;

	mean_time= mean(time');
	std_time= std(time');
	disp('Time (s)');
	disp([mean_time, std_time]);
	disp('Frequency (Hz)');
	disp([1/mean_time, 1/std_time]);
	figure;
	plot(time, 'Color', SIGNAL_COLOR);
	ylabel('Time (s)', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	xlabel('Strokes', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	hold on;
	plot(mean_time * ones(1, length(time)), 'k', 'LineWidth', MEAN_WIDTH);
	plot(mean_time * ones(1, length(time))  + std_time, '--k', 'LineWidth', MEAN_WIDTH/2);
	plot(mean_time * ones(1, length(time)) - std_time, '--k', 'LineWidth', MEAN_WIDTH/2);
	hold off;
	xlim([1 length(time)]);

