% Author: Lauro Ojeda, 2014-2015
function [net_trust, net_drag] = plt_work_details(strokes, power, PERIOD)
	PLOT_DETAILS = 0;
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];

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
    
% 	figure;
% 	barweb([mean_net_trust,mean_net_drag],[std_net_trust, std_net_drag], [], [], [], [], [], bone, [], [], [], []);
% 	ylabel('Work (J/Kg)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
% 	yaxis = ylim();
% 	ylim([-yaxis(2) yaxis(2)]);
% 	legend('Net thrust', 'Net drag');

