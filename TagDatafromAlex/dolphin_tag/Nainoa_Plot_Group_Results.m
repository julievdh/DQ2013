%%
clear
close all
%%
load Nainoa_A_Power
load Nainoa_A

NainoaA_Power = Nainoa_A_Power;
NainoaA_inertial_results = inertial_results;
NainoaA_strokes = strokes;
NainoaA_stroke_amp = stroke_amp;
NainoaA_stroke_freq = stroke_freq;
NainoaA_Vfave = Vfave;

save NainoaA_Results NainoaA_Power NainoaA_inertial_results NainoaA_strokes NainoaA_stroke_amp NainoaA_stroke_freq NainoaA_Vfave;

%%
clear 
close all
%%

load Nainoa_A4_Power
load Nainoa_A4
NainoaA4_Power = Nainoa_A4_Power;
NainoaA4_inertial_results = inertial_results;
NainoaA4_strokes = strokes;
NainoaA4_stroke_amp = stroke_amp;
NainoaA4_stroke_freq = stroke_freq;
NainoaA4_Vfave = Vfave;

save NainoaA4_Results NainoaA4_Power NainoaA4_inertial_results NainoaA4_strokes NainoaA4_stroke_amp NainoaA4_stroke_freq NainoaA4_Vfave;
%%
clear 
close all

%%
load NainoaA_Results
load NainoaA4_Results

%% Plot Average Velocity vs Average Drag
% control = black circle, 
% tag = blue triangle (RGB 5 113 222) 
% tag + 4 = green diamond (26 150 65) = A2 
% tag + 8 = red square (202 0 32) = A4

ForceNorm = NainoaA_Power.Params.m*9.8; %Normalize by mg

NainoaA_Drag = NainoaA_Power.Force.F_Drag_frwd;
NainoaA_MeanDrag = mean(NainoaA_Drag);

NainoaA4_Drag = NainoaA4_Power.Force.F_Drag_frwd;
NainoaA4_MeanDrag = mean(NainoaA4_Drag);

figure
plot(NainoaA_Vfave,NainoaA_MeanDrag,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',8)
hold on
plot(NainoaA4_Vfave,NainoaA4_MeanDrag,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',8)

xlabel('Average Velocity (m/s)')
ylabel('Average Drag (N)')
title('Average Velocity vs Average Drag')

%% Plot Peak Velocity vs Peak Drag
% control = black circle, 
% tag = blue triangle (RGB 5 113 222) 
% tag + 4 = green diamond (26 150 65) = A2 
% tag + 8 = red square (202 0 32) = A4

ForceNorm = NainoaA_Power.Params.m*9.8; %Normalize by mg
NainoaA_Vfpeak = max(NainoaA_strokes.V_frwd);
NainoaA4_Vfpeak = max(NainoaA4_strokes.V_frwd);

NainoaA_PeakDrag = max(NainoaA_Drag);
NainoaA4_PeakDrag = max(NainoaA4_Drag);

figure
plot(NainoaA_Vfpeak,NainoaA_PeakDrag,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',8)
hold on
plot(NainoaA4_Vfpeak,NainoaA4_PeakDrag,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',8)

xlabel('Peak Velocity (m/s)')
ylabel('Peak Drag (N)')
title('Peak Vel vs Peak Drag')

%% Plot Min Velocity vs Min Drag
% control = black circle, 
% tag = blue triangle (RGB 5 113 222) 
% tag + 4 = green diamond (26 150 65) = A2 
% tag + 8 = red square (202 0 32) = A4

ForceNorm = NainoaA_Power.Params.m*9.8; %Normalize by mg
NainoaA_Vfmin = min(NainoaA_strokes.V_frwd);
NainoaA4_Vfmin = min(NainoaA4_strokes.V_frwd);

NainoaA_MinDrag = min(NainoaA_Drag);
NainoaA4_MinDrag = min(NainoaA4_Drag);

figure
plot(NainoaA_Vfmin,NainoaA_MinDrag,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',8)
hold on
plot(NainoaA4_Vfmin,NainoaA4_MinDrag,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',8)

xlabel('Min Velocity (m/s)')
ylabel('Min Drag (N)')
title('Min Vel vs Min Drag')

%% Plot the CFD Data for Nainoa
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
plot(NainoaA_Vfave,NainoaA_MeanDrag,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',8)
plot(NainoaA4_Vfave,NainoaA4_MeanDrag,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',8)

xlabel('Average Velocity (m/s)')
ylabel('Average Drag')
title('CFD Fits')

%% Plot the Thrust data
NainoaA_Thrust = NainoaA_Power.Force.F_Thrust_frwd;
NainoaA4_Thrust = NainoaA4_Power.Force.F_Thrust_frwd;

figure
subplot(211)
plot(NainoaA_Thrust,'k')
hold on
plot(mean(NainoaA_Thrust')','r','linewidth', 3)
ylabel('Unfiltered Thrust (N)')
xlabel('% Cycle')
axis([0 100 -4000 5000])
title('A')

% Plot the A4 thrust data

subplot(212)
plot(NainoaA4_Thrust,'k')
hold on
plot(mean(NainoaA4_Thrust')','b','linewidth', 3)
ylabel('Unfiltered Thrust (N)')
xlabel('% Cycle')
axis([0 100 -4000 5000])
title('A4')




 %% Plot the peak velocity data
l = 2.48; %m
m = 179; %kg
g = 9.8; %m/s
 
% Pnorm = m*g^1.5*l^0.5;%Mg^1.5 L^0.5 (2076 W) 
Pnorm = m;%Mg^1.5 L^0.5 (2076 W) 
 
 
NainoaA_Work_Pos = NainoaA_Power.Work.Thrust_net_pos;
NainoaA_Work_Neg = NainoaA_Power.Work.Thrust_net_neg+NainoaA_Power.Work.Drag_net_neg;

NainoaA_Work_All = [NainoaA_Work_Pos; -NainoaA_Work_Neg];
NainoaA_Vfave_All = [NainoaA_Vfave'; NainoaA_Vfave'];



NainoaA4_Work_Pos = NainoaA4_Power.Work.Thrust_net_pos;
NainoaA4_Work_Neg = NainoaA4_Power.Work.Thrust_net_neg+NainoaA4_Power.Work.Drag_net_neg;

NainoaA4_Work_All = [NainoaA4_Work_Pos; -NainoaA4_Work_Neg];
NainoaA4_Vfave_All = [NainoaA4_Vfave'; NainoaA4_Vfave'];

x = linspace(1,5)';

for i = 1:100;
Nainoa_A_Pos_fit(i,1) = 1862.*x(i,1)^3-1.628e+004.*x(i,1)^2+6.169e+004.*x(i,1)-6.418e+004; %R^2 = 0.41
Nainoa_A_Neg_fit(i,1) = -2928.*x(i,1)^3+1.871e+004.*x(i,1)^2-4.851e+004.*x(i,1)+2.924e+004; %R^2 = 0.57

Nainoa_A4_Pos_fit(i,1) = -1473.*x(i,1)^3+1.662e+004.*x(i,1)^2-3.984e+004.*x(i,1)+4.086e+004; %R^2 = 0.48
Nainoa_A4_Neg_fit(i,1) = -160.6.*x(i,1)^3-5422.*x(i,1)^2+1.017e+004.*x(i,1)-2.417e+004; %R^2 = 0.7756
end

figure
plot(NainoaA4_Vfave,NainoaA4_Work_Pos/1000,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
hold on
plot(NainoaA_Vfave,NainoaA_Work_Pos/1000,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
plot(x,Nainoa_A_Pos_fit/1000,'b','linewidth',3)
plot(x,Nainoa_A4_Pos_fit/1000,'g','linewidth',3)
plot(NainoaA_Vfave,NainoaA_Work_Neg/1000,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
plot(NainoaA4_Vfave,NainoaA4_Work_Neg/1000,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
plot(x,Nainoa_A_Neg_fit/1000,'b','linewidth',3)
plot(x,Nainoa_A4_Neg_fit/1000,'g','linewidth',3)

axis([1 6 -400000/1000 400000/1000])
xlabel('Velocity (m/s)')
ylabel('Work (kJ)')

figure
plot(NainoaA4_Vfave,NainoaA4_Work_Pos./Pnorm,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
hold on
plot(NainoaA_Vfave,NainoaA_Work_Pos./Pnorm,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
plot(x,Nainoa_A_Pos_fit./Pnorm,'b','linewidth',3)
plot(x,Nainoa_A4_Pos_fit./Pnorm,'g','linewidth',3)
plot(NainoaA_Vfave,NainoaA_Work_Neg./Pnorm,'k^','MarkerFaceColor',[0.0196078438311815 0.443137258291245 0.87058824300766],'MarkerSize',5)
plot(NainoaA4_Vfave,NainoaA4_Work_Neg./Pnorm,'kd','MarkerFaceColor',[0.10196078568697 0.588235318660736 0.254901975393295],'MarkerSize',5)
plot(x,Nainoa_A_Neg_fit./Pnorm,'b','linewidth',3)
plot(x,Nainoa_A4_Neg_fit./Pnorm,'g','linewidth',3)

axis([1 6 -400000/Pnorm 400000/Pnorm])
xlabel('Velocity (m/s)')
ylabel('Work (J/kg)')

%% INERTIAL then THRUST Then DRAG


    Inert_PosWork_Mean = [NainoaA_Power.Work_ave.Pos_mean(1,1) NainoaA4_Power.Work_ave.Pos_mean(1,1)]
    Inert_PosWork_std = [NainoaA_Power.Work_ave.Pos_std(1,1) NainoaA4_Power.Work_ave.Pos_std(1,1)]

    Inert_NegWork_Mean = [NainoaA_Power.Work_ave.Neg_mean(1,1) NainoaA4_Power.Work_ave.Neg_mean(1,1)]
    Inert_NegWork_std = [NainoaA_Power.Work_ave.Neg_std(1,1) NainoaA4_Power.Work_ave.Neg_std(1,1)]
    
    
    T_PosWork_Mean = [NainoaA_Power.Work_ave.Pos_mean(1,2) NainoaA4_Power.Work_ave.Pos_mean(1,2)]
    T_PosWork_std = [NainoaA_Power.Work_ave.Pos_std(1,2) NainoaA4_Power.Work_ave.Pos_std(1,2)]

    T_NegWork_Mean = [NainoaA_Power.Work_ave.Neg_mean(1,2) NainoaA4_Power.Work_ave.Neg_mean(1,2)]
    T_NegWork_std = [NainoaA_Power.Work_ave.Neg_std(1,2) NainoaA4_Power.Work_ave.Neg_std(1,2)]
    
    D_PosWork_Mean = [.1 .1]
    D_PosWork_std = [.1 .1]

    D_NegWork_Mean = [NainoaA_Power.Work_ave.Neg_mean(1,3) NainoaA4_Power.Work_ave.Neg_mean(1,3)]
    D_NegWork_std = [NainoaA_Power.Work_ave.Neg_std(1,3) NainoaA4_Power.Work_ave.Neg_std(1,3)]

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
% [m,n] = size(NainoaA_Drag);
% [m4,n4] = size(NainoaA4_Drag);
% 
% for i = 1:n;
% NainoaA_Drag_filt(:,i) = FILTFILT(B, A, NainoaA_Drag(:,i));
% end
% 
% for i = 1:n4;
% NainoaA4_Drag_filt(:,i) = FILTFILT(B, A, NainoaA4_Drag(:,i));
% end
% 
% figure
% subplot(211)
% plot(NainoaA_Drag,'k')
% hold on
% plot(mean(NainoaA_Drag')','r','linewidth', 3)
% ylabel('Unfiltered Drag (N)')
% xlabel('% Cycle')
% title('A')
% 
% subplot(212)
% plot(NainoaA_Drag_filt,'k')
% hold on
% plot(mean(NainoaA_Drag_filt')','r','linewidth', 3)
% ylabel('Filtered Drag (N)')
% xlabel('% Cycle')
% title('A')
% 
% figure
% plot(mean(NainoaA_Drag')','k','linewidth', 3)
% hold on
% plot(mean(NainoaA_Drag_filt')','r','linewidth', 3)
% ylabel('Average Drag (N)')
% xlabel('% Cycle')
% title('A')
% 
% % Plot the A4 drag
% figure
% subplot(211)
% plot(NainoaA4_Drag,'k')
% hold on
% plot(mean(NainoaA4_Drag')','r','linewidth', 3)
% ylabel('Unfiltered Drag (N)')
% xlabel('% Cycle')
% title('A4')
% 
% subplot(212)
% plot(NainoaA4_Drag_filt,'k')
% hold on
% plot(mean(NainoaA4_Drag_filt')','r','linewidth', 3)
% ylabel('Filtered Drag (N)')
% xlabel('% Cycle')
% title('A4')
% 
% figure
% plot(mean(NainoaA4_Drag')','k','linewidth', 3)
% hold on
% plot(mean(NainoaA4_Drag_filt')','r','linewidth', 3)
% ylabel('Average Drag (N)')
% xlabel('% Cycle')
% title('A4')