% Author: Lauro Ojeda, 2014-2015
function plt_pitch(strokes)
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
	MEAN_WIDTH = 4;
	PLOT_DETAILS = 0;
	LABEL_NAMES_SIZE = 12;

	pitch = (strokes.fluking_angle_norm * 180 / pi);
	mean_pitch = mean(pitch');
	std_pitch = std(pitch');
	if(PLOT_DETAILS)
		figure;
		plot(pitch);
		grid on;ylabel('Pitch (deg)');xlabel('Samples #');
	end;
	figure;
	plot(pitch, 'Color',SIGNAL_COLOR);
	ylabel('Fluking variation (deg)', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	xlabel('% Cycle', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	hold on;
	plot(mean_pitch , 'k', 'LineWidth', MEAN_WIDTH);
	plot(mean_pitch  + std_pitch, '--k', 'LineWidth', MEAN_WIDTH/2);
	plot(mean_pitch  - std_pitch, '--k', 'LineWidth', MEAN_WIDTH/2);
	hold off;

