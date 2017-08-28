load NainoaA_Results
load NainoaA4_Results

load LonoA_Results
load LonoA4_Results
%% Normalization factor For Work
    l_N = 2.48; %m
    m_N = 179; %kg
    g = 9.8; %m/s^2
    Norm_N = m_N*g*l_N;
    
    l_L = 2.74; %m
    m_L = 247; %kg
    g = 9.8; %m/s^2
    Norm_L = m_L*g*l_L;
    
    Norm_ave = (Norm_N+Norm_L)/2;
    
 %% Normalizing factor for Power
 
%  Mg^1.5 L^0.5 (10.6 kW) for power. 
NormP_N = m_N*(g^1.5)*(l_N^0.5);
NormP_L = m_L*(g^1.5)*(l_L^0.5);

NormP_ave = (NormP_N+NormP_L)/2;

m_ave = (m_N+m_L)/2;

Ticks = ([-.4 -.2 0 .2 .4 .6]*NormP_ave)/m_ave;
%% Normalize  Nainoa's Power
    NA_P_T = NainoaA_Power.Power.power_thrust./NormP_N;
    NA_P_D = NainoaA_Power.Power.power_drag./NormP_N;
    
    NA4_P_T = NainoaA4_Power.Power.power_thrust./NormP_N;
    NA4_P_D = NainoaA4_Power.Power.power_drag./NormP_N;

%% Normalize Nainoa's Work Data
    NA_W_I_T = NainoaA_Power.Work.Inert_net_pos./Norm_N;
    NA_W_I_D = NainoaA_Power.Work.Inert_net_neg./Norm_N;
    
    NA4_W_I_T = NainoaA4_Power.Work.Inert_net_pos./Norm_N;
    NA4_W_I_D = NainoaA4_Power.Work.Inert_net_neg./Norm_N;
        
    NA_W_T = NainoaA_Power.Work.Thrust_net_pos./Norm_N;
    NA_W_D = (NainoaA_Power.Work.Thrust_net_neg+NainoaA_Power.Work.Drag_net_neg)./Norm_N;

    NA4_W_T = NainoaA4_Power.Work.Thrust_net_pos./Norm_N;
    NA4_W_D = (NainoaA4_Power.Work.Thrust_net_neg+NainoaA4_Power.Work.Drag_net_neg)./Norm_N;

 %% Normalize Lono's Power
 
    LA_P_T = LonoA_Power.Power.power_thrust./NormP_L;
    LA_P_D = LonoA_Power.Power.power_drag./NormP_L;
    
    LA4_P_T = LonoA4_Power.Power.power_thrust./NormP_L;
    LA4_P_D = LonoA4_Power.Power.power_drag./NormP_L;

    %% Normalize Lono's Work Data
 
    LA_W_I_T = LonoA_Power.Work.Inert_net_pos./Norm_L;
    LA_W_I_D = LonoA_Power.Work.Inert_net_neg./Norm_L;
    
    LA4_W_I_T = LonoA4_Power.Work.Inert_net_pos./Norm_L;
    LA4_W_I_D = LonoA4_Power.Work.Inert_net_neg./Norm_L;
        
    LA_W_T = LonoA_Power.Work.Thrust_net_pos./Norm_L;
    LA_W_D = (LonoA_Power.Work.Thrust_net_neg+LonoA_Power.Work.Drag_net_neg)./Norm_L;

    LA4_W_T = LonoA4_Power.Work.Thrust_net_pos./Norm_L;
    LA4_W_D = (LonoA4_Power.Work.Thrust_net_neg+LonoA4_Power.Work.Drag_net_neg)./Norm_L;
    
    
    %% Combine the Velocity Data
    
    A_Vel_all = [NainoaA_Vfave'; LonoA_Vfave'];  
    A4_Vel_all = [NainoaA4_Vfave'; LonoA4_Vfave']; 
    
  %% Normalize the Velocity Data
    
    A_Vel_norm = [NainoaA_Vfave'./l_N; LonoA_Vfave'./l_L];  
    A4_Vel_norm = [NainoaA4_Vfave'./l_N; LonoA4_Vfave'./l_L]; 
    
  %% Combine the Power Data
  A_Thrust_Power = [NA_P_T LA_P_T];
  A_Drag_Power = [NA_P_D LA_P_D];
  
  A4_Thrust_Power = [NA4_P_T LA4_P_T];
  A4_Drag_Power = [NA4_P_D LA4_P_D];
    
%% Combine the Work Data
       
    A_Pos_Work = [NA_W_T; LA_W_T];
    A_Neg_Work = [NA_W_D; LA_W_D];
    
    A_I_Pos_Work = [NA_W_I_T; LA_W_I_T];
    A_I_Neg_Work = [NA_W_I_D; LA_W_I_D];
    
    A4_Pos_Work = [NA4_W_T; LA4_W_T];
    A4_Neg_Work = [NA4_W_D; LA4_W_D];
    
    A4_I_Pos_Work = [NA4_W_I_T; LA4_W_I_T];
    A4_I_Neg_Work = [NA4_W_I_D; LA4_W_I_D];
    
    
  %% Plot the power data
  A_Thrust_Power_mean = mean(A_Thrust_Power')';
  A_Thrust_Power_std = std(A_Thrust_Power')';
  
  A_Drag_Power_mean = mean(A_Drag_Power')';
  A_Drag_Power_std = std(A_Drag_Power')';
  
  A4_Thrust_Power_mean = mean(A4_Thrust_Power')';
  A4_Thrust_Power_std = std(A4_Thrust_Power')';
  
  A4_Drag_Power_mean = mean(A4_Drag_Power')';
  A4_Drag_Power_std = std(A4_Drag_Power')';
  
  figure
  plot(A_Thrust_Power_mean,'r','linewidth',3)
  hold on,
  plot(A_Thrust_Power_mean+A_Thrust_Power_std,'k')
  plot(A_Thrust_Power_mean-A_Thrust_Power_std,'k')
  
  plot(A_Drag_Power_mean,'b','linewidth',3)
  hold on,
  plot(A_Drag_Power_mean+A_Drag_Power_std,'k')
  plot(A_Drag_Power_mean-A_Drag_Power_std,'k')
  axis([0 100 -0.4 .6])
  
  xlabel('% Cycle')
  ylabel('Power (Dless)')
  title('Tag (A)')

 
  figure
  plot(A4_Thrust_Power_mean,'r','linewidth',3)
  hold on,
  plot(A4_Thrust_Power_mean+A4_Thrust_Power_std,'k')
  plot(A4_Thrust_Power_mean-A4_Thrust_Power_std,'k')
  
  plot(A4_Drag_Power_mean,'b','linewidth',3)
  hold on,
  plot(A4_Drag_Power_mean+A4_Drag_Power_std,'k')
  plot(A4_Drag_Power_mean-A4_Drag_Power_std,'k')
  
  axis([0 100 -0.4 .6])
  xlabel('% Cycle')
  ylabel('Power (Dless)')
  title('Tag and Drag Elements (A4)')
    
    %% Plot Work Data
 
 
x = linspace(1,5.5)';

for i = 1:100;
A_Pos_fit(i,1) = -0.1067*x(i,1)^3+1.671.*x(i,1)^2-4.244.*x(i,1)+6.373; %R^2 = 0.25
A_Neg_fit(i,1) = 0.06122.*x(i,1)^3-1.605.*x(i,1)^2+4.255.*x(i,1)-6.276; %R^2 = 0.62

A4_Pos_fit(i,1) = -0.04655.*x(i,1)^3+1.301.*x(i,1)^2-1.801.*x(i,1)+2.496; %R^2 = 0.4
A4_Neg_fit(i,1) = 0.0263.*x(i,1)^3-1.832.*x(i,1)^2+4.094.*x(i,1)-6.284; %R^2 = 0.78
end

  
figure
plot(A_Vel_all,A_Pos_Work,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
hold on
plot(A4_Vel_all,A4_Pos_Work,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
plot(A_Vel_all,A_Neg_Work,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
plot(A4_Vel_all,A4_Neg_Work,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)

plot(x,A_Pos_fit,'b','linewidth',3)
plot(x,A4_Pos_fit,'g','linewidth',3)

plot(x,A_Neg_fit,'b','linewidth',3)
plot(x,A4_Neg_fit,'g','linewidth',3)

axis([1 5.5 -40 40])
xlabel('Velocity (m/s)')
ylabel('Work (Dless)')



%% Plot with normalized swim speed

 
x = linspace(.4,2)';

for i = 1:100;
A_Pos_fit(i,1) = 2.4.*x(i,1)^3-2.295.*x(i,1)^2+2.345.*x(i,1)+2.41; %R^2 = 0.25
A_Neg_fit(i,1) = -5.94.*x(i,1)^3+11.65.*x(i,1)^2+-11.14.*x(i,1)+0.164; %R^2 = 0.6

A4_Pos_fit(i,1) = 1.972.*x(i,1)^3-0.4948.*x(i,1)^2+4.514.*x(i,1)+0.04101; %R^2 = 0.4
A4_Neg_fit(i,1) = -2.077.*x(i,1)^3-4.84.*x(i,1)^2+3.687.*x(i,1)-4.289; %R^2 = 0.8
end

  
figure
plot(A_Vel_norm,A_Pos_Work,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
hold on
plot(A4_Vel_norm,A4_Pos_Work,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
plot(A_Vel_norm,A_Neg_Work,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
plot(A4_Vel_norm,A4_Neg_Work,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)

plot(x,A_Pos_fit,'b','linewidth',3)
plot(x,A4_Pos_fit,'g','linewidth',3)
% 
plot(x,A_Neg_fit,'b','linewidth',3)
plot(x,A4_Neg_fit,'g','linewidth',3)

axis([.4 2 -40 40])
xlabel('Norm Swim Speed (U/l)')
ylabel('Work (Dless)')

 
%% Plot the bar plots

    Inert_PosWork_Mean = [mean(A_I_Pos_Work) mean(A4_I_Pos_Work)];
    Inert_NegWork_Mean = [mean(A_I_Neg_Work) mean(A4_I_Neg_Work)];
    
    Inert_PosWork_std = [std(A_I_Pos_Work) std(A4_I_Pos_Work)];
    Inert_NegWork_std = [std(A_I_Neg_Work) std(A4_I_Neg_Work)];
    
    extra = nan(70,1);
    
    [H_I,P_I] = ttest2(A_I_Pos_Work,[A4_I_Pos_Work; extra])
    [H_I,P_I] = ttest2(A_I_Pos_Work(1:700,1),A4_I_Pos_Work(1:700,1))

    
    PLOT_DETAILS = 0;
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
    
	figure;
	barweb([Inert_PosWork_Mean,Inert_NegWork_Mean],[Inert_NegWork_std,Inert_NegWork_std], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (Dless)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-15 15]);
	legend('A', 'A4');
    title('COM Work')
%% Plot the Average work
    PosWork_Mean = [mean(A_Pos_Work) mean(A4_Pos_Work)];
    NegWork_Mean = [mean(A_Neg_Work) mean(A4_Neg_Work)];
    
    PosWork_std = [std(A_Pos_Work) std(A4_Pos_Work)];
    NegWork_std = [std(A_Neg_Work) std(A4_Neg_Work)];
    
    
    extra = nan(70,1);
    
    [H,P] = ttest2(A_Pos_Work,[A4_Pos_Work; extra])
    [H,P] = ttest2(A_Pos_Work(1:700,1),A4_Pos_Work(1:700,1))
    
       
    PLOT_DETAILS = 0;
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
    
	figure;
	barweb([PosWork_Mean,NegWork_Mean],[NegWork_std,NegWork_std], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (Dless)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-20 20]);
	legend('A', 'A4');
    title('Modle Work')

%% Plot the frequency Data
    A_Stroke_Amp_All = [NainoaA_stroke_amp'; LonoA_stroke_amp'];
    A4_Stroke_Amp_All = [NainoaA4_stroke_amp'; LonoA4_stroke_amp'];
    A_Stroke_Freq_All = [NainoaA_stroke_freq'; LonoA_stroke_freq'];
    A4_Stroke_Freq_All = [NainoaA4_stroke_freq'; LonoA4_stroke_freq'];
    
    A_Vel_all = [NainoaA_Vfave'; LonoA_Vfave'];  
    A4_Vel_all = [NainoaA4_Vfave'; LonoA4_Vfave']; 

  figure
  plot(A_Stroke_Amp_All,A_Stroke_Freq_All,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
  hold on
  plot(A4_Stroke_Amp_All,A4_Stroke_Freq_All,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
  plot(mean(A_Stroke_Amp_All),mean(A_Stroke_Freq_All),'k^','MarkerFaceColor',[1 0 0],'MarkerSize',12)
  plot(mean(A4_Stroke_Amp_All),mean(A4_Stroke_Freq_All),'kd','MarkerFaceColor',[1 0 0],'MarkerSize',12)
  xlabel('amplitude') 
  ylabel('frequency')
   
    
  
  
  figure
  plot(A_Stroke_Freq_All,A_Stroke_Amp_All,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
  hold on
  plot(A4_Stroke_Freq_All,A4_Stroke_Amp_All,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
  plot(mean(A_Stroke_Freq_All),mean(A_Stroke_Amp_All),'k^','MarkerFaceColor',[1 0 0],'MarkerSize',12)
  plot(mean(A4_Stroke_Freq_All),mean(A4_Stroke_Amp_All),'kd','MarkerFaceColor',[1 0 0],'MarkerSize',12)
 
  xlabel('frequency')
  ylabel('amplitude')
  
  figure
  plot(A_Vel_all,A_Stroke_Freq_All,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
  hold on
  plot(A4_Vel_all,A4_Stroke_Freq_All,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
  plot(mean(A_Vel_all),mean(A_Stroke_Freq_All),'k^','MarkerFaceColor',[1 0 0],'MarkerSize',12)
  plot(mean(A4_Vel_all),mean(A4_Stroke_Freq_All),'kd','MarkerFaceColor',[1 0 0],'MarkerSize',12)
  
  xlabel('Velocity (m/s)')
  ylabel('Freq (Hz)')
    
  figure
  plot(A_Vel_all,A_Stroke_Amp_All,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
  hold on
  plot(A4_Vel_all,A4_Stroke_Amp_All,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
  plot(mean(A_Vel_all),mean(A_Stroke_Amp_All),'k^','MarkerFaceColor',[1 0 0],'MarkerSize',12)
  plot(mean(A4_Vel_all),mean(A4_Stroke_Amp_All),'kd','MarkerFaceColor',[1 0 0],'MarkerSize',12)
  
  xlabel('Velocity (m/s)')
  ylabel('Amp')
  
  
  
  
  figure
  plot(A_Vel_all,A_Stroke_Amp_All,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
  hold on
  plot(A4_Vel_all,A4_Stroke_Amp_All,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
  plot(mean(A_Vel_all),mean(A_Stroke_Amp_All),'k^','MarkerFaceColor',[1 0 0],'MarkerSize',12)
  plot(mean(A4_Vel_all),mean(A4_Stroke_Amp_All),'kd','MarkerFaceColor',[1 0 0],'MarkerSize',12)
  
  xlabel('Velocity (m/s)')
  ylabel('Amp')
  
  
  %% Normalize data
    l_N = 2.48; %m

    l_L = 2.74; %m
  
  
    A_Stroke_Amp_norm = [NainoaA_stroke_amp'./l_N; LonoA_stroke_amp'./l_L];
    A4_Stroke_Amp_norm = [NainoaA4_stroke_amp'./l_N; LonoA4_stroke_amp'./l_L];
    A_Stroke_Freq_norm = [NainoaA_stroke_freq'./l_N; LonoA_stroke_freq'./l_L];
    A4_Stroke_Freq_norm = [NainoaA4_stroke_freq'./l_N; LonoA4_stroke_freq'./l_L];
    
    A_Vel_norm = [NainoaA_Vfave'./l_N; LonoA_Vfave'./l_L];  
    A4_Vel_norm = [NainoaA4_Vfave'./l_N; LonoA4_Vfave'./l_L]; 
    
    
      figure
  plot(A_Vel_norm,A_Stroke_Amp_norm,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
  hold on
  plot(A4_Vel_norm,A4_Stroke_Amp_norm,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
  plot(mean(A_Vel_norm),mean(A_Stroke_Amp_norm),'k^','MarkerFaceColor',[1 0 0],'MarkerSize',12)
  plot(mean(A4_Vel_norm),mean(A4_Stroke_Amp_norm),'kd','MarkerFaceColor',[1 0 0],'MarkerSize',12)
  
  xlabel('Length Specific Swim Speed (U/l)')
  ylabel('Amp/l')
  
  %% Bar plots of the Freq and Amp
  
    Freq_Mean = [mean(A_Stroke_Freq_All) mean(A4_Stroke_Freq_All)];
     Amp_Mean = [mean(A_Stroke_Amp_All) mean(A4_Stroke_Amp_All)];
     Vel_Mean = [mean(A_Vel_all) mean(A4_Vel_all)]
     
    Freq_std = [std(A_Stroke_Freq_All) std(A4_Stroke_Freq_All)];
     Amp_std = [std(A_Stroke_Amp_All) std(A4_Stroke_Amp_All)];
     Vel_std = [std(A_Vel_all) std(A4_Vel_all)]
    
    
    extra = nan(70,1);
    
    [H_f,P_f] = ttest2(A_Stroke_Freq_All,[A4_Stroke_Freq_All; extra])
    [H_a,P_a] = ttest2(A_Stroke_Amp_All,[A4_Stroke_Amp_All; extra])
    [H_v,P_v] = ttest2(A_Vel_all,[A4_Vel_all; extra])

    
       
    PLOT_DETAILS = 0;
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];
    
	figure;
    subplot(311)
	barweb([Freq_Mean],[Freq_std], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Freq (Hz)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-1 2]);
	legend('A', 'A4');
    title('Modle Work')
    
    subplot(312)
	barweb([Amp_Mean],[Amp_std], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Amp', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-1 15]);
	legend('A', 'A4');
    title('Modle Work')
    
    subplot(313)
	barweb([Vel_Mean],[Vel_std], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Vel (m/s))', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-1 5]);
	legend('A', 'A4');
    title('Modle Work')
%%
%     mean(NA_W_T)
%     mean(NA_W_D)
%     
%     mean(NA4_W_T)
%     mean(NA4_W_D)
% 
%     
%     T_PosWork_Mean = [NainoaA_Power.Work_ave.Pos_mean(1,2) NainoaA4_Power.Work_ave.Pos_mean(1,2)]
%     T_PosWork_std = [NainoaA_Power.Work_ave.Pos_std(1,2) NainoaA4_Power.Work_ave.Pos_std(1,2)]
% 
%     T_NegWork_Mean = [NainoaA_Power.Work_ave.Neg_mean(1,2) NainoaA4_Power.Work_ave.Neg_mean(1,2)]
%     T_NegWork_std = [NainoaA_Power.Work_ave.Neg_std(1,2) NainoaA4_Power.Work_ave.Neg_std(1,2)]
%     
%     D_PosWork_Mean = [.1 .1]
%     D_PosWork_std = [.1 .1]
% 
%     D_NegWork_Mean = [NainoaA_Power.Work_ave.Neg_mean(1,3) NainoaA4_Power.Work_ave.Neg_mean(1,3)]
%     D_NegWork_std = [NainoaA_Power.Work_ave.Neg_std(1,3) NainoaA4_Power.Work_ave.Neg_std(1,3)]
% 
%     
%     
%     
%     
%        NA_W_I_P_mean = mean(NainoaA_Work_Inert_Pos)
%     NA_W_I_N_mean = mean(NainoaA_Work_Inert_Neg)
