speed = (linspace(1,7,100))'; 
pFit = 1;
a = 2;
b = 7;

load Kolohe_Loading_A

IA = (find(a < Vfave & Vfave < b))';

KA_Vfave = Vfave(IA)';
KA_Thrust = net_thrust(IA);
KA_Drag = net_drag(IA);
KA_amp = stroke_amp(IA);
KA_freq = stroke_freq(IA);
KA_period = stroke_period(IA);

PA_Thrust = polyfit(KA_Vfave,KA_Thrust,pFit);
PA_Drag = polyfit(KA_Vfave,KA_Drag,pFit);

KA_ThrustFit = POLYVAL(PA_Thrust,speed);
KA_DragFit = POLYVAL(PA_Drag,speed);


load Kolohe_Loading_A2

IA2 = (find(a < Vfave & Vfave < b))';

KA2_Vfave = Vfave(IA2)';
KA2_Thrust = net_thrust(IA2);
KA2_Drag = net_drag(IA2);
KA2_amp = stroke_amp(IA2);
KA2_freq = stroke_freq(IA2);
KA2_period = stroke_period(IA2);

PA_Thrust = polyfit(KA2_Vfave,KA2_Thrust,pFit);
PA_Drag = polyfit(KA2_Vfave,KA2_Drag,pFit);

KA2_ThrustFit = POLYVAL(PA_Thrust,speed);
KA2_DragFit = POLYVAL(PA_Drag,speed);


load Kolohe_Loading_A3

IA3 = (find(a < Vfave & Vfave < b))';

KA3_Vfave = Vfave(IA3)';
KA3_Thrust = net_thrust(IA3);
KA3_Drag = net_drag(IA3);
KA3_amp = stroke_amp(IA3);
KA3_freq = stroke_freq(IA3);
KA3_period = stroke_period(IA3);

PA_Thrust = polyfit(KA3_Vfave,KA3_Thrust,pFit);
PA_Drag = polyfit(KA3_Vfave,KA3_Drag,pFit);

KA3_ThrustFit = POLYVAL(PA_Thrust,speed);
KA3_DragFit = POLYVAL(PA_Drag,speed);


load Kolohe_Loading_A4

IA4 = (find(a < Vfave & Vfave < b))';

KA4_Vfave = Vfave(IA4)';
KA4_Thrust = net_thrust(IA4);
KA4_Drag = net_drag(IA4);
KA4_amp = stroke_amp(IA4);
KA4_freq = stroke_freq(IA4);
KA4_period = stroke_period(IA4);

PA_Thrust = polyfit(KA4_Vfave,KA4_Thrust,pFit);
PA_Drag = polyfit(KA4_Vfave,KA4_Drag,pFit);

KA4_ThrustFit = POLYVAL(PA_Thrust,speed);
KA4_DragFit = POLYVAL(PA_Drag,speed);


% Create the net thrust and drag

	mean_net_trust_L = [mean(KA_Thrust) mean(KA2_Thrust) mean(KA3_Thrust) mean(KA4_Thrust)];
	std_net_trust_L = [std(KA_Thrust) std(KA2_Thrust) std(KA3_Thrust) std(KA4_Thrust)];
	mean_net_drag_L = [mean(KA_Drag) mean(KA2_Drag) mean(KA3_Drag) mean(KA4_Drag)];
	std_net_drag_L = [std(KA_Drag) std(KA2_Drag) std(KA3_Drag) std(KA4_Drag)];



%%


figure('Color',[1 1 1],'Position', [296   185   447   847]);

subplot(211)

plot(KA_Vfave,KA_Thrust,'.k','MarkerFaceColor',[0.960784316062927 0.921568632125854 0.921568632125854],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0.960784316062927 0.921568632125854 0.921568632125854]);
hold on

plot(KA2_Vfave,KA2_Thrust,'.k','MarkerFaceColor',[0.87058824300766 0.921568632125854 0.980392158031464],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0.87058824300766 0.921568632125854 0.980392158031464]);

plot(KA3_Vfave,KA3_Thrust,'.k','MarkerFaceColor',[0.862745106220245 0.862745106220245 0.862745106220245],...
    'Marker','d',...
    'LineStyle','none',...
    'Color',[0.862745106220245 0.862745106220245 0.862745106220245]);

plot(KA4_Vfave,KA4_Thrust,'.k','MarkerFaceColor',[0.756862759590149 0.866666674613953 0.776470601558685],...
    'Marker','^',...
    'LineStyle','none',...
    'Color',[0.756862759590149 0.866666674613953 0.776470601558685]);

% plot the fits for the data
plot(speed,KA_ThrustFit,'Color',[0.960784316062927 0.921568632125854 0.921568632125854],'linewidth',3)
plot(speed,KA2_ThrustFit,'Color',[0.87058824300766 0.921568632125854 0.980392158031464],'linewidth',3)
plot(speed,KA3_ThrustFit,'Color',[0.862745106220245 0.862745106220245 0.862745106220245],'linewidth',3)
plot(speed,KA4_ThrustFit,'Color',[0.756862759590149 0.866666674613953 0.776470601558685],'linewidth',3)

xlabel('Velocity (m/s)')
ylabel('Thrust Work (J/kg)')
title('Kolohe - Loading')
axis([2 7 -100 700])

subplot(212)
plot(KA_Vfave,KA_Drag,'.k','MarkerFaceColor',[0.960784316062927 0.921568632125854 0.921568632125854],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0.960784316062927 0.921568632125854 0.921568632125854]);
hold on

plot(KA2_Vfave,KA2_Drag,'.k','MarkerFaceColor',[0.87058824300766 0.921568632125854 0.980392158031464],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0.87058824300766 0.921568632125854 0.980392158031464]);

plot(KA3_Vfave,KA3_Drag,'.k','MarkerFaceColor',[0.862745106220245 0.862745106220245 0.862745106220245],...
    'Marker','d',...
    'LineStyle','none',...
    'Color',[0.862745106220245 0.862745106220245 0.862745106220245]);

plot(KA4_Vfave,KA4_Drag,'.k','MarkerFaceColor',[0.756862759590149 0.866666674613953 0.776470601558685],...
    'Marker','^',...
    'LineStyle','none',...
    'Color',[0.756862759590149 0.866666674613953 0.776470601558685]);

% plot the fits for the data
plot(speed,KA_DragFit,'Color',[0.960784316062927 0.921568632125854 0.921568632125854],'linewidth',3)
plot(speed,KA2_DragFit,'Color',[0.87058824300766 0.921568632125854 0.980392158031464],'linewidth',3)
plot(speed,KA3_DragFit,'Color',[0.862745106220245 0.862745106220245 0.862745106220245],'linewidth',3)
plot(speed,KA4_DragFit,'Color',[0.756862759590149 0.866666674613953 0.776470601558685],'linewidth',3)

xlabel('Velocity (m/s)')
ylabel('Drag Work (J/kg)')
axis([2 7 -700 100])


%%
figure('Color',[1 1 1],'Position', [296   185   630  500]);


plot(KA_period,KA_amp,'.k','MarkerFaceColor',[0.960784316062927 0.921568632125854 0.921568632125854],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0.960784316062927 0.921568632125854 0.921568632125854]);
hold on

plot(KA2_period,KA2_amp,'.k','MarkerFaceColor',[0.87058824300766 0.921568632125854 0.980392158031464],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0.87058824300766 0.921568632125854 0.980392158031464]);

plot(KA3_period,KA3_amp,'.k','MarkerFaceColor',[0.862745106220245 0.862745106220245 0.862745106220245],...
    'Marker','d',...
    'LineStyle','none',...
    'Color',[0.862745106220245 0.862745106220245 0.862745106220245]);

plot(KA4_period,KA4_amp,'.k','MarkerFaceColor',[0.756862759590149 0.866666674613953 0.776470601558685],...
    'Marker','^',...
    'LineStyle','none',...
    'Color',[0.756862759590149 0.866666674613953 0.776470601558685]);

% Plot the Average Data
plot(mean(KA_period),mean(KA_amp),'.k','MarkerFaceColor','k',...
    'Marker','o',...
    'LineStyle','none',...
    'Color','k');

plot(mean(KA2_period),mean(KA2_amp),'.k','MarkerFaceColor','k',...
    'Marker','square',...
    'LineStyle','none',...
    'Color','k');

plot(mean(KA3_period),mean(KA3_amp),'.k','MarkerFaceColor','k',...
    'Marker','d',...
    'LineStyle','none',...
    'Color','k');

plot(mean(KA4_period),mean(KA4_amp),'.k','MarkerFaceColor','k',...
    'Marker','^',...
    'LineStyle','none',...
    'Color','k');

axis([0 1 0 18])
xlabel('Period (s)')
ylabel('Amplitude (deg)')
title('Kolohe Drag Loading')

%%

	PLOT_DETAILS = 0;
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];



figure('Color',[1 1 1],'Position', [296   185   630  500]);


	barweb([mean_net_trust_L,mean_net_drag_L],[std_net_trust_L, std_net_drag_L], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (J/Kg)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
	ylim([-yaxis(2) yaxis(2)]);
% 	legend('Net thrust', 'Net drag');





%%
% load Lono_A
% LA_Thrust = net_trust;
% LA_Drag = net_drag;
% LA_ThrustFit = ThrustFit;
% LA_DragFit = DragFit;
% LA_Vfave = Vfave;
% 
% load Lono_A2
% LA2_Thrust = net_trust;
% LA2_Drag = net_drag;
% LA2_ThrustFit = ThrustFit;
% LA2_DragFit = DragFit;
% LA2_Vfave = Vfave;
% 
% 
% IA = (find(2.5 < LA_Vfave & LA_Vfave < 4.5))';
% IA2 = (find(2.5 < LA2_Vfave & LA2_Vfave < 4.5))';
% 
% LA_Vfave_short = LA_Vfave(IA);
% LA_Thrust_short = LA_Thrust(IA);
% LA_Drag_short = LA_Drag(IA);
% 
% LA2_Vfave_short = LA2_Vfave(IA2);
% LA2_Thrust_short = LA2_Thrust(IA2);
% LA2_Drag_short = LA2_Drag(IA2);
% 
% 
% mean(LA2_Thrust_short)
% mean(LA_Thrust_short)
% 
% mean(LA2_Thrust)
% mean(LA_Thrust)
% 
% mean(LA2_Drag_short)
% mean(LA_Drag_short)
% 
% mean(LA2_Drag)
% mean(LA_Drag)
% 
% 
% std(LA2_Thrust_short)
% std(LA_Thrust_short)
% 
% std(LA2_Thrust)
% std(LA_Thrust)
% 
% 
% 
% mean(LA2_Drag_short)
% mean(LA_Drag_short)
% 
% mean(LA2_Drag)
% mean(LA_Drag)
% 
% 
% figure
% plot(LA_Vfave,LA_Thrust,'.k')
% hold on
% plot(LA_Vfave_short,LA_Thrust_short,'.r')
% 
% 
% figure
% plot(LA2_Vfave,LA2_Thrust,'.k')
% hold on
% plot(LA2_Vfave_short,LA2_Thrust_short,'.r')
% 
% %%
% hold on
% 
% 
% plot(Vfave,net_drag,'.k','MarkerFaceColor',[0.831372559070587 0.815686285495758 0.7843137383461],...
%     'Marker','square');
% plot(speed,DragFit,'r','linewidth',3)
% 
% 
% 
% clear
% load Lono_A2
% LonoA2_AllW = [net_trust; -net_drag];
% LonoA2_AllV = [Vfave'; Vfave'];
% 
% plot(Vfave,net_trust,'.k','MarkerFaceColor',[0 0 0],...
%     'Marker','o');
% plot(speed,ThrustFit,'k','linewidth',3)
% plot(Vfave,net_drag,'.k','MarkerFaceColor',[0 0 0],'LineStyle','none',...
%     'Color',[0.831372559070587 0.815686285495758 0.7843137383461,'Marker','o');
% plot(speed,DragFit,'k','linewidth',3)
% 
% 
% 
% 
% subplot(212)
% 
% load Nainoa_A
% NainoaA_AllW = [net_trust; -net_drag];
% NainoaA_AllV = [Vfave'; Vfave'];
% 
% plot(Vfave,net_trust,'.b','MarkerFaceColor',[0 0 0],...
%     'Marker','o')
% hold on
% plot(speed,ThrustFit,'k','linewidth',3)
% 
% plot(Vfave,net_drag,'.r','MarkerFaceColor',[0.831372559070587 0.815686285495758 0.7843137383461],...
%     'Marker','square')
% plot(speed,DragFit,'k','linewidth',3)
% 
% 
% clear
% load Nainoa_A2
% NainoaA2_AllW = [net_trust; -net_drag];
% NainoaA2_AllV = [Vfave'; Vfave'];
% 
% plot(Vfave,net_trust,'.b')
% plot(speed,ThrustFit,'k','linewidth',3)
% plot(Vfave,net_drag,'.r')
% plot(speed,DragFit,'k','linewidth',3)
% 
% 
% %%
% Work_All = [net_trust; -net_drag];
% Vel_All = [Vfave'; Vfave'];
% 
% plot(Vel_All,Work_All,'.b');
% figure
% subplot(211)
% 
% load Lono_A
% 
% plot(Vfave,net_trust,'.b','MarkerFaceColor',[0.800000011920929 0.800000011920929 0.800000011920929],...
%     'Marker','o')
% hold on
% % plot(speed,ThrustFit,'k','linewidth',3)
% plot(Vfave,-net_drag,'.r','MarkerFaceColor',[0.831372559070587 0.815686285495758 0.7843137383461],...
%     'Marker','square')
% plot(speed,DragFit,'k','linewidth',3)
% 
% 
% clear
% load Lono_A2
% 
% plot(Vfave,net_trust,'.b')
% plot(speed,ThrustFit,'k','linewidth',3)
% plot(Vfave,net_drag,'.r')
% plot(speed,DragFit,'k','linewidth',3)
% 
% 
% 
% 
% subplot(212)
% 
% load Nainoa_A
% 
% plot(Vfave,net_trust,'.b','MarkerFaceColor',[0.800000011920929 0.800000011920929 0.800000011920929],...
%     'Marker','o')
% hold on
% plot(speed,ThrustFit,'k','linewidth',3)
% 
% plot(Vfave,net_drag,'.r','MarkerFaceColor',[0.831372559070587 0.815686285495758 0.7843137383461],...
%     'Marker','square')
% plot(speed,DragFit,'k','linewidth',3)
% 
% 
% clear
% load Nainoa_A2
% 
% plot(Vfave,net_trust,'.b')
% plot(speed,ThrustFit,'k','linewidth',3)
% plot(Vfave,net_drag,'.r')
% plot(speed,DragFit,'k','linewidth',3)
