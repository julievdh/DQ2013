% Author: Lauro Ojeda, 2014-2015
function plt_roll(strides)
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
	MEAN_WIDTH = 4;
	PLOT_DETAILS = 0;
	mean_roll = mean(strides.roll_norm') *180 / pi;
	std_roll = std(strides.roll_norm') * 180 / pi;
	if(PLOT_DETAILS)
		figure;
		plot(strides.roll * 180 / pi);
		grid on;ylabel('Roll (deg)');xlabel('Samples #');
	end;
	figure;
	plot(strides.roll_norm * 180 / pi, 'Color',SIGNAL_COLOR);
	grid on;ylabel('Roll (deg)');xlabel('Percentage %');
	hold on;
	plot(mean_roll , 'k', 'LineWidth', MEAN_WIDTH);
	plot(mean_roll  + std_roll, '--k', 'LineWidth', MEAN_WIDTH/2);
	plot(mean_roll  - std_roll, '--k', 'LineWidth', MEAN_WIDTH/2);
	hold off;

