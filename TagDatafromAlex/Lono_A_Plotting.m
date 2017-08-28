%% Plot the forward Thrust and Drag  ForcesData               

    F_Thrust_frwd = work_power_res.Force.F_Thrust_frwd;
    F_Drag_frwd = -work_power_res.Force.F_Drag_frwd;
    
    F_Thrust_ltrl = work_power_res.Force.F_Thrust_frwd;
    F_Drag_ltrl = -work_power_res.Force.F_Drag_frwd;
    

    figure
    subplot(211)
    hold on
    plot(F_Thrust_frwd,'k')
    plot(F_Thrust_frwd_mean,'r', 'linewidth',3)
    plot(F_Thrust_frwd_mean+F_Thrust_frwd_std,'--r', 'linewidth',1)
    plot(F_Thrust_frwd_mean-F_Thrust_frwd_std,'--r', 'linewidth',1)
    xlabel('%Stroke')
    ylabel('Frwd Force (N)')
    title('Thrust')

    subplot(212)
    hold on
    plot(F_Drag_frwd,'k')
    plot(F_Drag_frwd_mean,'b', 'linewidth',3)
    plot(F_Drag_frwd_mean+F_Drag_frwd_std,'--b', 'linewidth',1)
    plot(F_Drag_frwd_mean-F_Drag_frwd_std,'--b', 'linewidth',1)

    xlabel('%Stroke')
    ylabel('Frwd Force (N)')
    title('Drag')
    
       %% Plot inertial Power

	I_power = work_power_res.Power.power_inert;
	mean_I_power = mean(I_power');
	std_I_power = std(I_power');
   
%     [Thrust_net_pos, Thrust_net_neg] = plt_work_details(strokes, T_power', PERIOD);
    
    figure
    hold on
    plot(I_power/1000,'b')
    xlabel('% Cycle')
    ylabel('Thrust Power (kW)')
    
 
    
    %% Plot thrust Power

	T_power = work_power_res.Power.power_thrust;
	mean_T_power = mean(T_power');
	std_T_power = std(T_power');
   
%     [Thrust_net_pos, Thrust_net_neg] = plt_work_details(strokes, T_power', PERIOD);
    
    figure
    hold on
    plot(T_power/1000,'b')
    xlabel('% Cycle')
    ylabel('Thrust Power (kW)')
      
  %% Plot Drag Power

	D_power = work_power_res.Power.power_drag;
	mean_D_power = mean(D_power');
	std_D_power = std(D_power');
  
%     [Drag_net_pos, Drag_net_neg] = plt_work_details(strokes, D_power', PERIOD);
        
    figure
    hold on
    plot(D_power/1000,'b')
    xlabel('% Cycle')
    ylabel('Drag Power (kW)')

%% Plot the Inertial stuff----------------------------------------------
    figure
    MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];

	figure,
    subplot(321)
	plot(I_power/1000, 'Color',SIGNAL_COLOR);
	hold on;
	plot(mean_I_power/1000, 'r', 'LineWidth', MEAN_WIDTH);
	plot(mean_I_power/1000 + std_I_power/1000, '--k', 'LineWidth', MEAN_WIDTH/2);
	plot(mean_I_power/1000 - std_I_power/1000, '--k', 'LineWidth', MEAN_WIDTH/2);
	ylabel('Inertial Power (kW)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	xlabel('% Cycle', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
    axis([0 100 -13 13])
        
    subplot(322)
	barweb([mean(work_power_res.Work.Inert_net_pos)/1000,mean(work_power_res.Work.Inert_net_neg)/1000],[std(work_power_res.Work.Inert_net_pos)/1000, std(work_power_res.Work.Inert_net_neg)/1000], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (kJ)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
    axis([.5 1.5 -125 125])
	legend('Pos Work', 'Neg Work');
    
    %% Plot the thrust details
  

    MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
    
	subplot(323)
	plot(T_power/1000, 'Color',SIGNAL_COLOR);
	hold on;
	plot(mean_T_power/1000, 'r', 'LineWidth', MEAN_WIDTH);
	plot(mean_T_power/1000 + std_T_power/1000, '--k', 'LineWidth', MEAN_WIDTH/2);
	plot(mean_T_power/1000 - std_T_power/1000, '--k', 'LineWidth', MEAN_WIDTH/2);
	ylabel('Thrust Power (kW)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	xlabel('% Cycle', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
    axis([0 100 -13 13])
   
    subplot(324)
	barweb([mean(work_power_res.Work.Thrust_net_pos)/1000,mean(work_power_res.Work.Thrust_net_neg)/1000],[std(work_power_res.Work.Thrust_net_pos)/1000, std(work_power_res.Work.Thrust_net_neg)/1000], [], [], [], [], [], bone, [], [], [], []);
    ylabel('Work (kJ)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	axis([.5 1.5 -125 125])

    %% Plot the Drag stuff------------------------------------------------
    
    MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
    
	subplot(325)
	plot(D_power/1000, 'Color',SIGNAL_COLOR);
	hold on;
	plot(mean_D_power/1000, 'r', 'LineWidth', MEAN_WIDTH);
	plot(mean_D_power/1000 + std_D_power/1000, '--k', 'LineWidth', MEAN_WIDTH/2);
	plot(mean_D_power/1000 - std_D_power/1000, '--k', 'LineWidth', MEAN_WIDTH/2);
	ylabel('Drag Power (W)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	xlabel('% Cycle', 'FontName' , 'Helvetica','FontSize', LABEL_NAMES_SIZE);
    axis([0 100 -3 1])
    
    subplot(326)
	barweb([.1,mean(work_power_res.Work.Drag_net_neg)/1000],[.1, std(work_power_res.Work.Drag_net_neg)/1000], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (kJ)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	axis([.5 1.5 -150 150])
    