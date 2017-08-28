% Calculate an estimated force on the animal

% - Lono : DOB- 1.1.85/ 544 lbs/ 108 in
% - Hoku: DOB- 3.30.91/ 402 lbs/ 99.5 in
% - Liho: DOB- 1.22.95/ 341 lbs/ 94.75 in
% - Kolohe: DOB- 7.12.94/ 434 lbs/ 101.25
% - Nainoa: DOB- 10.31.97/ 395 lbs/ 97.5
% - Liko: DOB- 9.7.00/ 377 lbs/ 102.5 in

%% Load the data
load Nainoa_A4

%% Nainoa Assume 70 F temp for the warer
    l = 2.48; %m
    m = 179; %kg
    density = 1030; % density of Sea water kg/m^2

    Cd = 0.01274129*0.8; %From CFD
    Ca = .4; % Added mass coeffiecent

    Vol = 0.216792; % Estimate of Lono's volume from the CAD model m^3
    Kin_Visosity = 1.044*10^-6; %m2 s?1
    Vave = 3; %m/s
    Re = (l*Vave)/Kin_Visosity;
    SA = 0.08*m^0.65; % Surface area (m^2)
%     SA = ; %From CFD
    AM = Ca*density*Vol; % Added mass of the water
    mBar = m + AM;

    Params = struct('l',l,'m',m,'density',density,'Cd',Cd,'Ca',Ca,'Vol',Vol,'Kin_Visosity',Kin_Visosity,'Vave',Vave,...
                    'Re',Re,'SA',SA,'AM',AM,'mBar',mBar) 

%% Calculate the forces acting on the animal
    [m n] = size(strokes.A_frwd)

    for i = 1:n
        F_Drag_frwd(:,i)   = (0.5*Cd*density*SA).*(strokes.V_frwd(:,i).^2);
        F_Inert_frwd(:,i)  = mBar.*strokes.A_frwd(:,i);
        F_Thrust_frwd(:,i) = F_Inert_frwd(:,i)+F_Drag_frwd(:,i);

        F_Drag_ltrl(:,i)   = (0.5*Cd*density*SA).*(strokes.V_ltrl(:,i).^2);
        F_Inert_ltrl(:,i)  = mBar.*strokes.A_ltrl(:,i);
        F_Thrust_ltrl(:,i) = F_Inert_ltrl(:,i)+F_Drag_ltrl(:,i);
    end

%% Find the average Drag and Thrust Data
    F_Drag_frwd_mean = mean(F_Drag_frwd')';
    F_Drag_frwd_std = std(F_Drag_frwd')';

    F_Thrust_frwd_mean = mean(F_Thrust_frwd')';
    F_Thrust_frwd_std = std(F_Thrust_frwd')';

    % Peak and Average of the average
    I = find(F_Thrust_frwd_mean>0);
    
    F_Drag_ave = mean(F_Drag_frwd_mean(I)) 
    F_Drag_max = max(F_Drag_frwd_mean(I))
    V_frwd_55 = strokes.V_frwd(55,:)';
    F_Thrust_frwd_55 = F_Thrust_frwd(55,:)';
    F_Thrust_ave = mean(F_Thrust_frwd_mean(I))
    F_Thrust_max = max(F_Thrust_frwd_mean(I))


    Force = struct('F_Inert_frwd',F_Inert_frwd,'F_Drag_frwd',F_Drag_frwd,'F_Thrust_frwd',F_Thrust_frwd,...
                   'F_Inert_ltrl',F_Inert_ltrl,'F_Drag_ltrl',F_Drag_ltrl,'F_Thrust_ltrl',F_Thrust_ltrl);
    Force_ave = struct('F_Thrust_ave',F_Thrust_ave,'F_Thrust_max',F_Thrust_max,...
                       'F_Drag_ave',F_Drag_ave,'F_Drag_max',F_Drag_max);
               
%% Plot the forward Thrust and Drag Data               

    figure
    subplot(211)
    hold on
    plot(F_Thrust_frwd,'k')
    plot(F_Thrust_frwd_mean,'b', 'linewidth',3)
    plot(F_Thrust_frwd_mean+F_Thrust_frwd_std,'--r', 'linewidth',1)
    plot(F_Thrust_frwd_mean-F_Thrust_frwd_std,'--r', 'linewidth',1)
    plot(I,F_Thrust_frwd_mean(I),'r', 'linewidth',3)
    plot(55,F_Thrust_frwd_55,'.r')
    xlabel('%Stroke')
    ylabel('Frwd Force (N)')
    title('Thrust')

    subplot(212)
    hold on
    plot(F_Drag_frwd,'k')
    plot(F_Drag_frwd_mean,'b', 'linewidth',3)
    plot(F_Drag_frwd_mean+F_Drag_frwd_std,'--r', 'linewidth',1)
    plot(F_Drag_frwd_mean-F_Drag_frwd_std,'--r', 'linewidth',1)
    plot(I,F_Drag_frwd_mean(I),'r', 'linewidth',3)
    plot(I(end),F_Drag_frwd(I(end),:),'.r')
    xlabel('%Stroke')
    ylabel('Frwd Force (N)')
    title('Drag')


%% Rename the velocity and acceleration data

   	acc_frwd = strokes.A_frwd;
	acc_frwd_mean = mean(strokes.A_frwd');
	acc_frwd_std = std(strokes.A_frwd');
    
    acc_ltrl = strokes.A_ltrl;
	acc_ltrl_mean = mean(strokes.A_ltrl');
	acc_ltrl_std = std(strokes.A_ltrl');
    
    vel_frwd = (strokes.V_frwd);
	vel_frwd_mean = mean(strokes.V_frwd');
	vel_frwd_std = std(strokes.V_frwd');
    
    vel_ltrl = (strokes.V_ltrl);
	vel_ltrl_mean = mean(strokes.V_ltrl');
	vel_ltrl_std = std(strokes.V_ltrl');
    
 %% Plot the Acceleration and Velocity Data
    figure
    subplot(211)
    hold on
    plot(vel_frwd,'k')
    plot(vel_frwd_mean,'r', 'linewidth',3)
    plot(vel_frwd_mean+vel_frwd_std,'--r', 'linewidth',1)
    plot(vel_frwd_mean-vel_frwd_std,'--r', 'linewidth',1)
    xlabel('%Stroke')
    ylabel('Frwd Velocity (m/s)')

    subplot(212)
    hold on
    plot(acc_frwd,'k')
    plot(acc_frwd_mean,'r', 'linewidth',3)
    plot(acc_frwd_mean+acc_frwd_std,'--r', 'linewidth',1)
    plot(acc_frwd_mean-acc_frwd_std,'--r', 'linewidth',1)
    xlabel('%Stroke')
    ylabel('Frwd Accemeration (m/s^2)')
    
%% Calculate the inertial power

    I_forward = F_Inert_frwd;
	I_lateral = F_Inert_ltrl;
	
	I_power_frwd = I_forward.*vel_frwd;
    I_power_ltrl = I_lateral.*vel_ltrl;
    
	mean_power_ltrl = mean(I_power_ltrl');
	std_power_ltrl = std(I_power_ltrl');

	I_power = I_power_frwd + I_power_ltrl;
	mean_I_power = mean(I_power');
	std_I_power = std(I_power');
    
    [Inert_net_pos, Inert_net_neg] = plt_work_details(strokes, I_power', PERIOD);  
    

    figure
    hold on
    plot(I_power/1000,'b')
    plot(I_power_ltrl/1000,'r')
    plot(I_power_frwd/1000,'k')
    xlabel('% Cycle')
    ylabel('Inertial Power (kW)')

  %% Plot thrust Power
    T_forward = F_Thrust_frwd;
    T_lateral = F_Thrust_ltrl;
    
    T_power_frwd = T_forward.*vel_frwd;
    T_power_ltrl = T_lateral.*vel_ltrl;

	T_power = T_power_frwd + T_power_ltrl;
	mean_T_power = mean(T_power');
	std_T_power = std(T_power');
   
    [Thrust_net_pos, Thrust_net_neg] = plt_work_details(strokes, T_power', PERIOD);
    
    figure
    hold on
    plot(T_power/1000,'b')
    plot(T_power_ltrl/1000,'r')
    plot(T_power_frwd/1000,'k')
    xlabel('% Cycle')
    ylabel('Thrust Power (kW)')
      
  %% Plot Drag Power
    D_forward = -F_Drag_frwd;
    D_lateral = -F_Drag_ltrl;
    
    D_power_frwd = D_forward.*vel_frwd;
    D_power_ltrl = D_lateral.*vel_ltrl;

	D_power = D_power_frwd + D_power_ltrl;
	mean_D_power = mean(D_power');
	std_D_power = std(D_power');
  
    [Drag_net_pos, Drag_net_neg] = plt_work_details(strokes, D_power', PERIOD);
        
    figure
    hold on
    plot(D_power/1000,'b')
    plot(D_power_ltrl/1000,'r')
    plot(D_power_frwd/1000,'k')
    xlabel('% Cycle')
    ylabel('Drag Power (kW)')
%%
    Power = struct('power_drag',D_power,'mean_power_drag',mean_D_power,'std_power_drag',std_D_power,...
                   'power_thrust',T_power,'mean_power_thrust',mean_T_power,'std_power_thrust',std_T_power,...
                   'power_inert',I_power,'mean_power_inert',mean_I_power,'std_power_inert',std_I_power);
    
    Work = struct('Drag_net_neg',Drag_net_neg,'Thrust_net_pos',Thrust_net_pos,'Thrust_net_neg',Thrust_net_neg,...
                  'Inert_net_pos',Inert_net_pos, 'Inert_net_neg',Inert_net_neg);
    
%% Plot the Powers

    % Plot the Inertial stuff----------------------------------------------
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
	barweb([mean(Inert_net_pos)/1000,mean(Inert_net_neg)/1000],[std(Inert_net_pos)/1000, std(Inert_net_neg)/1000], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (kJ)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
    axis([.5 1.5 -80 80])
	legend('Pos Work', 'Neg Work');
    
    % Plot the Thrust stuff------------------------------------------------
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
	barweb([mean(Thrust_net_pos)/1000,mean(Thrust_net_neg)/1000],[std(Thrust_net_pos)/1000, std(Thrust_net_neg)/1000], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (kJ)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	axis([.5 1.5 -80 80])
    % Plot the Drag stuff------------------------------------------------
    
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
	barweb([.1,mean(Drag_net_neg)/1000],[.1, std(Drag_net_neg)/1000], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (kJ)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	axis([.5 1.5 -80 80])
    
        
    %% Plot work
    
    Drag_pos_ave = 0;
    Drag_pos_std = 0;
    
    Thrust_pos_ave = mean(Thrust_net_pos);
    Thrust_pos_std = std(Thrust_net_pos);
    
    Inert_pos_ave = mean(Inert_net_pos);
    Inert_pos_std = std(Inert_net_pos);
    
    Drag_neg_ave = mean(Drag_net_neg);
    Drag_neg_std = std(Drag_net_neg);
    
    Thrust_neg_ave = mean(Thrust_net_neg);
    Thrust_neg_std = std(Thrust_net_neg);
    
    Inert_neg_ave = mean(Inert_net_neg);
    Inert_neg_std = std(Inert_net_neg);
    
    Pos_mean = [Inert_pos_ave Thrust_pos_ave Drag_pos_ave];
    Pos_std = [Inert_pos_std Thrust_pos_std Drag_pos_std];
    
    Neg_mean = [Inert_neg_ave Thrust_neg_ave Drag_neg_ave];
    Neg_std = [Inert_neg_std Thrust_neg_std Drag_neg_std];
   
    
    PLOT_DETAILS = 0;
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];


	figure;
	barweb([Pos_mean/1000,Neg_mean/1000],[Pos_std/1000,Neg_std/1000], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (kJ)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-120000/1000 120000/1000]);
	legend('Inertial', 'Thrust', 'Drag');

    %% Creat a Structure afor the Average work
     
    Work_ave = struct('Pos_mean',Pos_mean,'Pos_std',Pos_std,'Neg_mean',Neg_mean,'Neg_std',Neg_std);
                        
    %% Save the Data
    
    Nainoa_A4_Power = struct('Power',Power,'Work',Work,'Work_ave',Work_ave,'Force', Force, 'Force_ave',Force_ave,'Params', Params)
    
    save Nainoa_A4_Power Nainoa_A4_Power
   