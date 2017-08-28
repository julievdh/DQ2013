% Author: Lauro Ojeda, 2014-2015
function plt_vel(strokes, DIRECTION)
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
	MEAN_WIDTH = 4;
	PLOT_DETAILS = 0;
	LABEL_NAMES_SIZE = 12;

	switch(DIRECTION)
	case 'FRWD'
		vel = strokes.V_frwd;
		label = 'Forward Velocity (m/s)';
	case 'LTRL'
		vel = strokes.V_ltrl;
		label = 'Lateral Velocity (m/s)';
	end;

	mean_vel= mean(vel');
	std_vel= std(vel');

	figure;
	plot(vel, 'Color',SIGNAL_COLOR);
	ylabel(label, 'FontName' ,'Helvetica','FontSize', LABEL_NAMES_SIZE);
	xlabel('% Cycle', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	hold on;
	plot(mean_vel, 'k', 'LineWidth', MEAN_WIDTH);
	plot(mean_vel  + std_vel, '--k', 'LineWidth', MEAN_WIDTH/2);
	plot(mean_vel  - std_vel, '--k', 'LineWidth', MEAN_WIDTH/2);
	hold off;

