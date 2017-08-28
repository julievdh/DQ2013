% Author: Lauro Ojeda, 2014-2015
function [power] = plt_power_details(strokes)
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];

	acc_frwd = strokes.A_frwd';
	mean_acc_frwd = mean(strokes.A_frwd');
	std_acc_frwd = std(strokes.A_frwd');
	vel_frwd = strokes.V_frwd';
	mean_vel_frwd = mean(strokes.V_frwd');
	std_vel_frwd = std(strokes.V_frwd');
	power_frwd = acc_frwd.*vel_frwd;
	mean_power_frwd = mean(power_frwd);
	std_power_frwd = std(power_frwd);

	acc_ltrl = (strokes.A_ltrl');
	mean_acc_ltrl = mean(strokes.A_ltrl');
	std_acc_ltrl = std(strokes.A_ltrl');
	vel_ltrl = (strokes.V_ltrl');
	mean_vel_ltrl = mean(strokes.V_ltrl');
	std_vel_ltrl = std(strokes.V_ltrl');
	power_ltrl = acc_ltrl.*vel_ltrl;
	mean_power_ltrl = mean(power_ltrl);
	std_power_ltrl = std(power_ltrl);

	power = power_frwd + power_ltrl;
	mean_power = mean(power);
	std_power = std(power);

	figure,
	plot(power', 'Color',SIGNAL_COLOR);
	hold on;
	plot(mean_power, 'k', 'LineWidth', MEAN_WIDTH);
	plot(mean_power + std_power, '--k', 'LineWidth', MEAN_WIDTH/2);
	plot(mean_power - std_power, '--k', 'LineWidth', MEAN_WIDTH/2);
	ylabel('Power (W/Kg)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	xlabel('% Cycle', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);

