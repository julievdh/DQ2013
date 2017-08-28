%%
clear
close all
%%
load Lono_A_Power
load Lono_A

LonoA_Power = Lono_A_Power;
LonoA_inertial_results = inertial_results;
LonoA_strokes = strokes;
LonoA_stroke_amp = stroke_amp;
LonoA_stroke_freq = stroke_freq;
LonoA_Vfave = Vfave;

save LonoA_Results LonoA_Power LonoA_inertial_results LonoA_strokes LonoA_stroke_amp LonoA_stroke_freq LonoA_Vfave;

%%
clear 
close all
%%

load Lono_A4_Power
load Lono_A4
LonoA4_Power = Lono_A4_Power;
LonoA4_inertial_results = inertial_results;
LonoA4_strokes = strokes;
LonoA4_stroke_amp = stroke_amp;
LonoA4_stroke_freq = stroke_freq;
LonoA4_Vfave = Vfave;

save LonoA4_Results LonoA4_Power LonoA4_inertial_results LonoA4_strokes LonoA4_stroke_amp LonoA4_stroke_freq LonoA4_Vfave;
%%
clear 
close all

%%
load LonoA_Results
load LonoA4_Results

%% Plot Average Velocity vs Average Drag
% control = black circle, 
% tag = blue triangle (RGB 5 113 222) 
% tag + 4 = green diamond (26 150 65) = A2 
% tag + 8 = red square (202 0 32) = A4

ForceNorm = LonoA_Power.Params.m*9.8; %Normalize by mg

LonoA_Drag = LonoA_Power.Force.F_Drag_frwd;
LonoA_MeanDrag = mean(LonoA_Drag);

LonoA4_Drag = LonoA4_Power.Force.F_Drag_frwd;
LonoA4_MeanDrag = mean(LonoA4_Drag);

figure
plot(LonoA_Vfave,LonoA_MeanDrag,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',8)
hold on
plot(LonoA4_Vfave,LonoA4_MeanDrag,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',8)

xlabel('Average Velocity (m/s)')
ylabel('Average Drag (N)')
title('Average Velocity vs Average Drag')



%% Plot Peak Velocity vs Peak Drag
% control = black circle, 
% tag = blue triangle (RGB 5 113 222) 
% tag + 4 = green diamond (26 150 65) = A2 
% tag + 8 = red square (202 0 32) = A4

ForceNorm = LonoA_Power.Params.m*9.8; %Normalize by mg
LonoA_Vfpeak = max(LonoA_strokes.V_frwd);
LonoA4_Vfpeak = max(LonoA4_strokes.V_frwd);

LonoA_PeakDrag = max(LonoA_Drag);
LonoA4_PeakDrag = max(LonoA4_Drag);

figure
plot(LonoA_Vfpeak,LonoA_PeakDrag,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',8)
hold on
plot(LonoA4_Vfpeak,LonoA4_PeakDrag,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',8)

xlabel('Peak Velocity (m/s)')
ylabel('Peak Drag (N)')
title('Peak Vel vs Peak Drag')

%% Plot Min Velocity vs Min Drag
% control = black circle, 
% tag = blue triangle (RGB 5 113 222) 
% tag + 4 = green diamond (26 150 65) = A2 
% tag + 8 = red square (202 0 32) = A4

ForceNorm = LonoA_Power.Params.m*9.8; %Normalize by mg
LonoA_Vfmin = min(LonoA_strokes.V_frwd);
LonoA4_Vfmin = min(LonoA4_strokes.V_frwd);

LonoA_MinDrag = min(LonoA_Drag);
LonoA4_MinDrag = min(LonoA4_Drag);

figure
plot(LonoA_Vfmin,LonoA_MinDrag,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',8)
hold on
plot(LonoA4_Vfmin,LonoA4_MinDrag,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',8)

xlabel('Min Velocity (m/s)')
ylabel('Min Drag (N)')
title('Min Vel vs Min Drag')

%% Plot the CFD Data for Lono
Vel = [1 2 3 4 5 6 ]';
CFDdrag_A = [15.61 52.61 108.95 188.57 290.21 412.48]; % Just Tag
CFDdrag_A2 = [19.05 68.83 141.70 246.78 382.17 545.29];
CFDdrag_A4 = [22.463 81.591 175.831 308.575 475.247 686.058]; % Tag with 4 drag elements


x = linspace(0.5,6)';

for i = 1:100;
CFDdrag_A_fit(i,1) = 10.85.*x(i,1)^2+3.393*x(i,1)+1.653; %R^2 = 1
CFDdrag_A2_fit(i,1) = 14.59.*x(i,1)^2+2.94*x(i,1)+2.47; %R^2 = 1
CFDdrag_A4_fit(i,1) = 18.75*x(i,1)^2+1.1316*x(i,1)+3.149; %R^2 = 1
end

figure
plot(x,CFDdrag_A_fit,'b','linewidth',3)
hold on
plot(x,CFDdrag_A2_fit,'r','linewidth',3)
plot(x,CFDdrag_A4_fit,'g','linewidth',3)

xlabel('Velocity (m/s)')
ylabel('Drag')
title('CFD Fits')


figure
plot(x,CFDdrag_A_fit,'b','linewidth',3)
hold on
plot(x,CFDdrag_A4_fit,'g','linewidth',3)
plot(LonoA_Vfave,LonoA_MeanDrag,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',8)
plot(LonoA4_Vfave,LonoA4_MeanDrag,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',8)

xlabel('Average Velocity (m/s)')
ylabel('Average Drag')
title('CFD Fits')





%% Plot the Thrust data
LonoA_Thrust = LonoA_Power.Force.F_Thrust_frwd;
LonoA4_Thrust = LonoA4_Power.Force.F_Thrust_frwd;

figure
subplot(211)
plot(LonoA_Thrust,'k')
hold on
plot(mean(LonoA_Thrust')','r','linewidth', 3)
ylabel('Unfiltered Thrust (N)')
xlabel('% Cycle')
axis([0 100 -4000 5000])
title('A')

% Plot the A4 thrust data

subplot(212)
plot(LonoA4_Thrust,'k')
hold on
plot(mean(LonoA4_Thrust')','b','linewidth', 3)
ylabel('Unfiltered Thrust (N)')
xlabel('% Cycle')
axis([0 100 -4000 5000])
title('A4')




 %% Plot the peak velocity data
l = 2.74; %m
m = 247; %kg
g = 9.8; %m/s
 
% Pnorm = m*g^1.5*l^0.5;%Mg^1.5 L^0.5 (2076 W) 
Pnorm = m;%Mg^1.5 L^0.5 (2076 W) 
 
 
LonoA_Work_Pos = LonoA_Power.Work.Thrust_net_pos;
LonoA_Work_Neg = LonoA_Power.Work.Thrust_net_neg+LonoA_Power.Work.Drag_net_neg;

LonoA_Work_All = [LonoA_Work_Pos; -LonoA_Work_Neg];
LonoA_Vfave_All = [LonoA_Vfave'; LonoA_Vfave'];



LonoA4_Work_Pos = LonoA4_Power.Work.Thrust_net_pos;
LonoA4_Work_Neg = LonoA4_Power.Work.Thrust_net_neg+LonoA4_Power.Work.Drag_net_neg;

LonoA4_Work_All = [LonoA4_Work_Pos; -LonoA4_Work_Neg];
LonoA4_Vfave_All = [LonoA4_Vfave'; LonoA4_Vfave'];

x = linspace(1,6)';

for i = 1:100;
Lono_A_Pos_fit(i,1) = 470.3.*x(i,1)^3+374.3.*x(i,1)^2+976.7.*x(i,1)+2.154e+004; %R^2 = 0.25
Lono_A_Neg_fit(i,1) = -7.676.*x(i,1)^3-5801.*x(i,1)^2+1.225e+004.*x(i,1)-2.644e+004; %R^2 = 0.64

Lono_A4_Pos_fit(i,1) = -945.6.*x(i,1)^3+1.47e+004.*x(i,1)^2-2.634e+004.*x(i,1)+2.546e+004; %R^2 = 0.4
Lono_A4_Neg_fit(i,1) = -111.7.*x(i,1)^3-1.134e+004.*x(i,1)^2+3.138e+004.*x(i,1)-4.613e+004; %R^2 = 0.864
end

figure
plot(LonoA4_Vfave,LonoA4_Work_Pos/1000,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
hold on
plot(LonoA_Vfave,LonoA_Work_Pos/1000,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
plot(x,Lono_A_Pos_fit/1000,'b','linewidth',3)
plot(x,Lono_A4_Pos_fit/1000,'g','linewidth',3)
plot(LonoA_Vfave,LonoA_Work_Neg/1000,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
plot(LonoA4_Vfave,LonoA4_Work_Neg/1000,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
plot(x,Lono_A_Neg_fit/1000,'b','linewidth',3)
plot(x,Lono_A4_Neg_fit/1000,'g','linewidth',3)

axis([1 6 -400000/1000 400000/1000])
xlabel('Velocity (m/s)')
ylabel('Work (kJ)')

figure
plot(LonoA4_Vfave,LonoA4_Work_Pos./Pnorm,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
hold on
plot(LonoA_Vfave,LonoA_Work_Pos./Pnorm,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
plot(x,Lono_A_Pos_fit./Pnorm,'b','linewidth',3)
plot(x,Lono_A4_Pos_fit./Pnorm,'g','linewidth',3)
plot(LonoA_Vfave,LonoA_Work_Neg./Pnorm,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
plot(LonoA4_Vfave,LonoA4_Work_Neg./Pnorm,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
plot(x,Lono_A_Neg_fit./Pnorm,'b','linewidth',3)
plot(x,Lono_A4_Neg_fit./Pnorm,'g','linewidth',3)

axis([1 6 -400000/Pnorm 400000/Pnorm])
xlabel('Velocity (m/s)')
ylabel('Work (J/kg)')

%% INERTIAL then THRUST Then DRAG


    Inert_PosWork_Mean = [LonoA_Power.Work_ave.Pos_mean(1,1) LonoA4_Power.Work_ave.Pos_mean(1,1)]
    Inert_PosWork_std = [LonoA_Power.Work_ave.Pos_std(1,1) LonoA4_Power.Work_ave.Pos_std(1,1)]

    Inert_NegWork_Mean = [LonoA_Power.Work_ave.Neg_mean(1,1) LonoA4_Power.Work_ave.Neg_mean(1,1)]
    Inert_NegWork_std = [LonoA_Power.Work_ave.Neg_std(1,1) LonoA4_Power.Work_ave.Neg_std(1,1)]
    
    
    T_PosWork_Mean = [LonoA_Power.Work_ave.Pos_mean(1,2) LonoA4_Power.Work_ave.Pos_mean(1,2)]
    T_PosWork_std = [LonoA_Power.Work_ave.Pos_std(1,2) LonoA4_Power.Work_ave.Pos_std(1,2)]

    T_NegWork_Mean = [LonoA_Power.Work_ave.Neg_mean(1,2) LonoA4_Power.Work_ave.Neg_mean(1,2)]
    T_NegWork_std = [LonoA_Power.Work_ave.Neg_std(1,2) LonoA4_Power.Work_ave.Neg_std(1,2)]
    
    D_PosWork_Mean = [.1 .1]
    D_PosWork_std = [.1 .1]

    D_NegWork_Mean = [LonoA_Power.Work_ave.Neg_mean(1,3) LonoA4_Power.Work_ave.Neg_mean(1,3)]
    D_NegWork_std = [LonoA_Power.Work_ave.Neg_std(1,3) LonoA4_Power.Work_ave.Neg_std(1,3)]

    PLOT_DETAILS = 0;
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];

	figure;
    subplot(131)
	barweb([Inert_PosWork_Mean/1000,Inert_NegWork_Mean/1000],[Inert_NegWork_std/1000,Inert_NegWork_std/1000], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (kJ)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-120000/1000 120000/1000]);
	legend('Inertial', 'Thrust', 'Drag');
    title('COM Work')
    
    subplot(132)
	barweb([T_PosWork_Mean/1000,T_NegWork_Mean/1000],[T_NegWork_std/1000,T_NegWork_std/1000], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (kJ)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-120000/1000 120000/1000]);
    title('Thrust Work')
    
    subplot(133)
	barweb([D_PosWork_Mean,D_NegWork_Mean/1000],[D_PosWork_std,D_NegWork_std/1000], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (kJ)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
    ylim([-120000/1000 120000/1000]);
    title('Drag Work')
	

%%
% %% Filter the drag data
% [B,A] = BUTTER(4,.1);
% 
% [m,n] = size(LonoA_Drag);
% [m4,n4] = size(LonoA4_Drag);
% 
% for i = 1:n;
% LonoA_Drag_filt(:,i) = FILTFILT(B, A, LonoA_Drag(:,i));
% end
% 
% for i = 1:n4;
% LonoA4_Drag_filt(:,i) = FILTFILT(B, A, LonoA4_Drag(:,i));
% end
% 
% figure
% subplot(211)
% plot(LonoA_Drag,'k')
% hold on
% plot(mean(LonoA_Drag')','r','linewidth', 3)
% ylabel('Unfiltered Drag (N)')
% xlabel('% Cycle')
% title('A')
% 
% subplot(212)
% plot(LonoA_Drag_filt,'k')
% hold on
% plot(mean(LonoA_Drag_filt')','r','linewidth', 3)
% ylabel('Filtered Drag (N)')
% xlabel('% Cycle')
% title('A')
% 
% figure
% plot(mean(LonoA_Drag')','k','linewidth', 3)
% hold on
% plot(mean(LonoA_Drag_filt')','r','linewidth', 3)
% ylabel('Average Drag (N)')
% xlabel('% Cycle')
% title('A')
% 
% % Plot the A4 drag
% figure
% subplot(211)
% plot(LonoA4_Drag,'k')
% hold on
% plot(mean(LonoA4_Drag')','r','linewidth', 3)
% ylabel('Unfiltered Drag (N)')
% xlabel('% Cycle')
% title('A4')
% 
% subplot(212)
% plot(LonoA4_Drag_filt,'k')
% hold on
% plot(mean(LonoA4_Drag_filt')','r','linewidth', 3)
% ylabel('Filtered Drag (N)')
% xlabel('% Cycle')
% title('A4')
% 
% figure
% plot(mean(LonoA4_Drag')','k','linewidth', 3)
% hold on
% plot(mean(LonoA4_Drag_filt')','r','linewidth', 3)
% ylabel('Average Drag (N)')
% xlabel('% Cycle')
% title('A4')