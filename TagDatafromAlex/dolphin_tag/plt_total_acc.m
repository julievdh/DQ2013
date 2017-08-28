% Author: Lauro Ojeda, 2014-2015
function plt_total_accel(strokes)
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
	MEAN_WIDTH = 4;
	PLOT_DETAILS = 0;
	LABEL_NAMES_SIZE = 12;

	accel = (strokes.A_frwd.^2 + strokes.A_ltrl.^2).^.5;
	label = 'Total Accel (m/s^2)';

	mean_accel= mean(accel');
	std_accel= std(accel');

	figure;
	plot(accel, 'Color',SIGNAL_COLOR);
	ylabel(label, 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	xlabel('% Cycle', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	hold on;
	plot(mean_accel, 'k', 'LineWidth', MEAN_WIDTH);
	plot(mean_accel  + std_accel, '--k', 'LineWidth', MEAN_WIDTH/2);
	plot(mean_accel  - std_accel, '--k', 'LineWidth', MEAN_WIDTH/2);
	hold off;

