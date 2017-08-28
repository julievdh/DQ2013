load Lono_A_Power
load Lono_A2_Power

%%
    Pos_mean = [mean(Lono_A_Power.Work.Thrust_net_pos) mean(Lono_A2_Power.Work.Thrust_net_pos)];
    Pos_std = [std(Lono_A_Power.Work.Thrust_net_pos) std(Lono_A2_Power.Work.Thrust_net_pos)];
    
    Neg_mean = [mean(Lono_A_Power.Work.Thrust_net_neg) mean(Lono_A_Power.Work.Drag_net_neg) mean(Lono_A2_Power.Work.Thrust_net_neg) mean(Lono_A2_Power.Work.Drag_net_neg)];
    Neg_std = [std(Lono_A_Power.Work.Thrust_net_neg) std(Lono_A_Power.Work.Drag_net_neg) std(Lono_A2_Power.Work.Thrust_net_neg) std(Lono_A2_Power.Work.Drag_net_neg)];
    
    
    Pos_drag_mean = [5 5];
    Pos_drag_std = [5 5];
    
    Neg_drag_mean = [mean(Lono_A_Power.Work.Drag_net_neg) mean(Lono_A2_Power.Work.Drag_net_neg)];
    Neg_drag_std = [std(Lono_A_Power.Work.Drag_net_neg) std(Lono_A2_Power.Work.Drag_net_neg)];
    
%% Plot the Thrust and Drag Powers
    PLOT_DETAILS = 0;
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];



figure

subplot(311)

    
	plot(Lono_A_Power.Power.mean_power_thrust, 'r', 'LineWidth', MEAN_WIDTH);
    hold on
      
	plot(Lono_A2_Power.Power.mean_power_thrust, 'k', 'LineWidth', MEAN_WIDTH);

	ylabel('Thrust Power (W)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	xlabel('% Cycle', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
    

subplot(312)
    
	plot(Lono_A_Power.Power.mean_power_drag, 'r', 'LineWidth', MEAN_WIDTH);
    hold on
    plot(Lono_A2_Power.Power.mean_power_drag, 'k', 'LineWidth', MEAN_WIDTH);

	ylabel('Drag Power (W)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	xlabel('% Cycle', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);

    subplot(313)

	barweb([Pos_mean,Neg_mean],[Pos_std,Neg_std], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (J)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-140000 140000]);
	legend('Inert Pos', 'Inert Neg');

        
    %% Inertial
    
    Pos_inert_mean = [mean(Lono_A_Power.Work.Inert_net_pos) mean(Lono_A2_Power.Work.Inert_net_pos)];
    Pos_inert_std = [std(Lono_A_Power.Work.Inert_net_pos) std(Lono_A2_Power.Work.Inert_net_pos)];
    
    Neg_inert_mean = [mean(Lono_A_Power.Work.Inert_net_neg) mean(Lono_A2_Power.Work.Inert_net_neg)];
    Neg_inert_std = [std(Lono_A_Power.Work.Inert_net_neg) std(Lono_A2_Power.Work.Inert_net_neg)];
    
     
    
    PLOT_DETAILS = 0;
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];


	figure;
	barweb([Pos_inert_mean,Neg_inert_mean],[Pos_inert_std,Neg_inert_std], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (J)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-140000 140000]);
	legend('Inert Pos', 'Inert Neg');

    %% Thrust
    
    Pos_thrust_mean = [mean(Lono_A_Power.Work.Thrust_net_pos) mean(Lono_A2_Power.Work.Thrust_net_pos)];
    Pos_thrust_std = [std(Lono_A_Power.Work.Thrust_net_pos) std(Lono_A2_Power.Work.Thrust_net_pos)];
    
    Neg_thrust_mean = [mean(Lono_A_Power.Work.Thrust_net_neg) mean(Lono_A2_Power.Work.Thrust_net_neg)];
    Neg_thrust_std = [std(Lono_A_Power.Work.Thrust_net_neg) std(Lono_A2_Power.Work.Thrust_net_neg)];
    
     
    
    PLOT_DETAILS = 0;
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];


	figure;
	barweb([Pos_thrust_mean,Neg_thrust_mean],[Pos_thrust_std,Neg_thrust_std], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (J)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-140000 140000]);
	legend('Thrust Pos', 'Thrust Neg');
    
        %% Drag
    
    Pos_drag_mean = [5 5];
    Pos_drag_std = [5 5];
    
    Neg_drag_mean = [mean(Lono_A_Power.Work.Drag_net_neg) mean(Lono_A2_Power.Work.Drag_net_neg)];
    Neg_drag_std = [std(Lono_A_Power.Work.Drag_net_neg) std(Lono_A2_Power.Work.Drag_net_neg)];
    
     
    
    PLOT_DETAILS = 0;
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];


	figure;
	barweb([Pos_drag_mean,Neg_drag_mean],[Pos_drag_std,Neg_drag_std], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (J)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-140000 140000]);
	legend('Drag Pos', 'Drag Neg');