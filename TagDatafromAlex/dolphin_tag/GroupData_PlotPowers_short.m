speed = (linspace(1,6,100))'; 
pFit = 1;
a = 1;
b = 5.5;


% 
% LA_Vfave_short = LA_Vfave(IA);
% LA_Thrust_short = LA_Thrust(IA);
% LA_Drag_short = LA_Drag(IA);
% 
% LA2_Vfave_short = LA2_Vfave(IA2);
% LA2_Thrust_short = LA2_Thrust(IA2);
% LA2_Drag_short = LA2_Drag(IA2);
% 


load Lono_A

IA = (find(a < Vfave & Vfave < b))';

LA_Vfave = Vfave(IA)';
LA_Thrust = net_trust(IA);
LA_Drag = net_drag(IA);
LA_amp = stroke_amp(IA);
LA_freq = stroke_freq(IA);
LA_period = stroke_period(IA);

PA_Thrust = polyfit(LA_Vfave,LA_Thrust,pFit);
PA_Drag = polyfit(LA_Vfave,LA_Drag,pFit);

LA_ThrustFit = POLYVAL(PA_Thrust,speed);
LA_DragFit = POLYVAL(PA_Drag,speed);

load Lono_A2


IA2 = (find(a < Vfave & Vfave < b))';

LA2_Thrust = net_trust(IA2);
LA2_Drag = net_drag(IA2);
LA2_Vfave = Vfave(IA2)';
LA2_amp = stroke_amp(IA2);
LA2_freq = stroke_freq(IA2);
LA2_period = stroke_period(IA2);

PA2_Thrust = polyfit(LA2_Vfave,LA2_Thrust,pFit);
PA2_Drag = polyfit(LA2_Vfave,LA2_Drag,pFit);

LA2_ThrustFit = POLYVAL(PA2_Thrust,speed);
LA2_DragFit = POLYVAL(PA2_Drag,speed);

% Create the net thrust and drag

	mean_net_trust_L = [mean(LA_Thrust) mean(LA2_Thrust)];
	std_net_trust_L = [std(LA_Thrust) std(LA2_Thrust)];
	mean_net_drag_L = [mean(LA_Drag) mean(LA2_Drag)];
	std_net_drag_L = [std(LA_Drag) std(LA2_Drag)];

% figure
% plot(LA_Vfave,LA_Thrust,'.k')
% plot(LA2_Vfave,LA2_Thrust,'.r')
% hold on 
% plot(speed,LA_ThrustFit,'k')
% plot(speed,LA2_ThrustFit,'r')
% axis([1.5 5 -400 400])



%%


figure('Color',[1 1 1],'Position', [296   185   447   847]);

subplot(211)

plot(LA_Vfave,LA_Thrust,'.k','MarkerFaceColor',[0.960784316062927 0.921568632125854 0.921568632125854],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0.960784316062927 0.921568632125854 0.921568632125854]);
hold on
plot(LA_Vfave,LA_Drag,'.k','MarkerFaceColor',[0.960784316062927 0.921568632125854 0.921568632125854],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0.960784316062927 0.921568632125854 0.921568632125854]);

plot(LA2_Vfave,LA2_Thrust,'.k','MarkerFaceColor',[0.87058824300766 0.921568632125854 0.980392158031464],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0.87058824300766 0.921568632125854 0.980392158031464]);

plot(LA2_Vfave,LA2_Drag,'.k','MarkerFaceColor',[0.87058824300766 0.921568632125854 0.980392158031464],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0.87058824300766 0.921568632125854 0.980392158031464]);


% plot the fits for the data
plot(speed,LA_ThrustFit,'Color',[0.847058832645416 0.160784319043159 0],'linewidth',3)
plot(speed,LA_DragFit,'Color',[0.847058832645416 0.160784319043159 0],'linewidth',3)

plot(speed,LA2_ThrustFit,'Color',[0.313725501298904 0.313725501298904 0.313725501298904],'linewidth',3)
plot(speed,LA2_DragFit,'Color',[0.313725501298904 0.313725501298904 0.313725501298904],'linewidth',3)

% plot the average data
plot(mean(LA_Vfave),mean(LA_Thrust),'.k','MarkerFaceColor',[0 0 0],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0 0 0]);

plot(mean(LA_Vfave),mean(LA_Drag),'.k','MarkerFaceColor',[0 0 0],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0 0 0]);

plot(mean(LA2_Vfave),mean(LA2_Thrust),'.k','MarkerFaceColor',[0 0 0],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0 0 0]);

plot(mean(LA2_Vfave),mean(LA2_Drag),'.k','MarkerFaceColor',[0 0 0],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0 0 0]);


xlabel('Speed (m/s)')
ylabel('Thrust (J/kg)')
title('Lono')
axis([1.5 5 -400 400])
%%
load Nainoa_A
IA = (find(a < Vfave & Vfave < b))';

NA_Thrust = net_trust(IA);
NA_Drag = net_drag(IA);
NA_Vfave = Vfave(IA)';
NA_amp = stroke_amp(IA);
NA_freq = stroke_freq(IA);
NA_period = stroke_period(IA);

PA_Thrust = polyfit(NA_Vfave,NA_Thrust,pFit);
PA_Drag = polyfit(NA_Vfave,NA_Drag,pFit);

NA_ThrustFit = POLYVAL(PA_Thrust,speed);
NA_DragFit = POLYVAL(PA_Drag,speed);

load Nainoa_A2

IA2 = (find(a < Vfave & Vfave < b))';

NA2_Thrust = net_trust(IA2);
NA2_Drag = net_drag(IA2);
NA2_Vfave = Vfave(IA2)';
NA2_amp = stroke_amp(IA2);
NA2_freq = stroke_freq(IA2);
NA2_period = stroke_period(IA2);

PA2_Thrust = polyfit(NA2_Vfave,NA2_Thrust,pFit);
PA2_Drag = polyfit(NA2_Vfave,NA2_Drag,pFit);

NA2_ThrustFit = POLYVAL(PA2_Thrust,speed);
NA2_DragFit = POLYVAL(PA2_Drag,speed);


% Create the net thrust and drag

	mean_net_trust_N = [mean(NA_Thrust) mean(NA2_Thrust)];
	std_net_trust_N = [std(NA_Thrust) std(NA2_Thrust)];
	mean_net_drag_N = [mean(NA_Drag) mean(NA2_Drag)];
	std_net_drag_N = [std(NA_Drag) std(NA2_Drag)];

%%
subplot(212)

plot(NA_Vfave,NA_Thrust,'.k','MarkerFaceColor',[0.960784316062927 0.921568632125854 0.921568632125854],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0.960784316062927 0.921568632125854 0.921568632125854]);
hold on
plot(NA_Vfave,NA_Drag,'.k','MarkerFaceColor',[0.960784316062927 0.921568632125854 0.921568632125854],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0.960784316062927 0.921568632125854 0.921568632125854]);

plot(NA2_Vfave,NA2_Thrust,'.k','MarkerFaceColor',[0.87058824300766 0.921568632125854 0.980392158031464],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0.87058824300766 0.921568632125854 0.980392158031464]);
hold on
plot(NA2_Vfave,NA2_Drag,'.k','MarkerFaceColor',[0.87058824300766 0.921568632125854 0.980392158031464],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0.87058824300766 0.921568632125854 0.980392158031464]);

% Plot the data fits

plot(speed,NA_ThrustFit,'Color',[0.847058832645416 0.160784319043159 0],'linewidth',3)
plot(speed,NA_DragFit,'Color',[0.847058832645416 0.160784319043159 0],'linewidth',3)

plot(speed,NA2_ThrustFit,'Color',[0.313725501298904 0.313725501298904 0.313725501298904],'linewidth',3)
plot(speed,NA2_DragFit,'Color',[0.313725501298904 0.313725501298904 0.313725501298904],'linewidth',3)

% plot the average data
plot(mean(NA_Vfave),mean(NA_Thrust),'.k','MarkerFaceColor',[0 0 0],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0 0 0]);

plot(mean(NA_Vfave),mean(NA_Drag),'.k','MarkerFaceColor',[0 0 0],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0 0 0]);

plot(mean(NA2_Vfave),mean(NA2_Thrust),'.k','MarkerFaceColor',[0 0 0],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0 0 0]);

plot(mean(NA2_Vfave),mean(NA2_Drag),'.k','MarkerFaceColor',[0 0 0],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0 0 0]);

xlabel('Speed (m/s)')
ylabel('Thrust (J/kg)')
title('Nianoa')
axis([1.5 5 -400 400])
%%

figure('Color',[1 1 1],'Position', [296   185   447   847]);

subplot(211)

plot(LA_period,LA_amp,'.k','MarkerFaceColor',[0.960784316062927 0.921568632125854 0.921568632125854],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0.960784316062927 0.921568632125854 0.921568632125854]);
hold on
plot(LA2_period,LA2_amp,'.k','MarkerFaceColor',[0.87058824300766 0.921568632125854 0.980392158031464],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0.87058824300766 0.921568632125854 0.980392158031464]);

plot(mean(LA_period),mean(LA_amp),'.k','MarkerFaceColor',[0 0 0],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0 0 0]);

plot(mean(LA2_period),mean(LA2_amp),'.k','MarkerFaceColor',[0 0 0],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0 0 0]);

axis([0 1 0 14])
xlabel('Period (s)')
ylabel('Amplitude (deg)')
title('Lono')


subplot(212)

plot(NA_period,NA_amp,'.k','MarkerFaceColor',[0.960784316062927 0.921568632125854 0.921568632125854],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0.960784316062927 0.921568632125854 0.921568632125854]);
hold on
plot(NA2_period,NA2_amp,'.k','MarkerFaceColor',[0.87058824300766 0.921568632125854 0.980392158031464],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0.87058824300766 0.921568632125854 0.980392158031464]);


plot(mean(NA_period),mean(NA_amp),'.k','MarkerFaceColor',[0 0 0],...
    'Marker','o',...
    'LineStyle','none',...
    'Color',[0 0 0]);

plot(mean(NA2_period),mean(NA2_amp),'.k','MarkerFaceColor',[0 0 0],...
    'Marker','square',...
    'LineStyle','none',...
    'Color',[0 0 0]);



xlabel('Period (s)')
ylabel('Amplitude (deg)')
title('Nainoa')

axis([0 1 0 14])

%%

	PLOT_DETAILS = 0;
	MEAN_WIDTH = 4;
	LABEL_NAMES_SIZE = 12;
	GRAY_COL = .7;
	SIGNAL_COLOR = [GRAY_COL, GRAY_COL, GRAY_COL];



figure('Color',[1 1 1],'Position', [296   185   447   847]);

subplot(211)   
	barweb([mean_net_trust_L,mean_net_drag_L],[std_net_trust_L, std_net_drag_L], [], [], [], [], [], bone, [], [], [], []);
	ylabel('Work (J/Kg)', 'FontName', 'Helvetica','FontSize', LABEL_NAMES_SIZE);
	yaxis = ylim();
	ylim([-yaxis(2) yaxis(2)]);
% 	legend('Net thrust', 'Net drag');


subplot(212)   
	barweb([mean_net_trust_N,mean_net_drag_N],[std_net_trust_N, std_net_drag_N], [], [], [], [], [], bone, [], [], [], []);
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
