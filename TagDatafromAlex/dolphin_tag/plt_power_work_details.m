% Author: Lauro Ojeda, 2014-2015
function [mean_power, net_trust, net_drag] = plt_power_work(strokes, PERIOD)
	PLOT_DETAILS = 0;
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

	N = size(power,1);
	net_trust = zeros(N,1);
	net_drag = zeros(N,1);
	for(ii = 1: N)
		neg_work = find(power(ii, :)<0);
		pos_work = find(power(ii, :)>=0);
		net_trust(ii) = sum(power(ii, pos_work)) * strokes.samples(ii) * PERIOD * length(pos_work) / 100;
		net_drag(ii) = sum(power(ii, neg_work))* strokes.samples(ii) * PERIOD * length(neg_work) / 100;
	end;

	mean_net_trust = mean(net_trust);
	std_net_trust = std(net_trust);
	mean_net_drag = mean(net_drag);
	std_net_drag = std(net_drag);
	figure;
	barweb([mean_net_trust,mean_net_drag],[std_net_trust, std_net_drag], [], [], [], [], [], [], [], [], [], []);
	ylabel('Work (J/Kg)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
	ylim([-yaxis(2) yaxis(2)]);

