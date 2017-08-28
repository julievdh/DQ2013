% Author: Lauro Ojeda, 2014-2015
function plt_accel(strokes, DIRECTION)
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
	MEAN_WIDTH = 4;
	PLOT_DETAILS = 0;
	LABEL_NAMES_SIZE = 12;

	switch(DIRECTION)
	case 'FRWD'
		accel = strokes.A_frwd;
		label = 'Forward Accel (m/s^2)';
	case 'LTRL'
		accel = strokes.A_ltrl;
		label = 'Lateral Accel (m/s^2)';
	end;

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

