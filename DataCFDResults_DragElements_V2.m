%% Plotting the CFD Drag for the tag+dolphin simulations
   % Drag (N)   Lift (N)
   
% Tag
V_A = [1 2 3 4]';   
Fd_A = [0.2607	1.1352	2.4824	3.9631];
Fl_A = [0.8609	3.6080	8.1823	14.5072];

A = [Fd_A' Fl_A'];

A_drag = A(:,1);
Ap1 = 0.1516;
Ap2 = 0.4877;
Ap3 = -0.3955;

Aa = 0.3385;
Ab = 1.781;

% Tag+2

V_A2 = [1 2 3 4]';
Fd_A2 = [1.5850	6.8705	15.3051	26.8854];
Fl_A2 = [1.8624	7.7839	17.5710	31.0295];

A2 = [Fd_A2' Fl_A2'];
  
A2_drag = A2(:,1);

A2p1 = 1.574;
A2p2 = 0.5651;
A2p3 = -0.5539;

A2a = 1.741;
A2b = 1.975;

% Tag+4

V_A4 = [1 2 3 4]';
Fd_A4 = [2.5344	10.5983	23.2664	42.8182];
Fl_A4 = [2.7638	11.3160	25.1999	46.1034];

A4 = [Fd_A4' Fl_A4'];

A4_drag = A4(:,1);

A4p1 = 2.872;
A4p2 = -1.008;
A4p3 = 0.7843;

A4a = 2.472;
A4b = 2.055;

% Tag+6

V_A6 = [1 2 3 4]';
Fd_A6 = [3.6251	15.2058	33.5500	61.6785];
Fl_A6 = [3.6127	14.7721	32.9871	60.3100];

A6 = [Fd_A6' Fl_A6'];
    
A6_drag = A6(:,1);

A6p1 = 4.137;
A6p2 = -1.434;
A6p3 = 1.074;

A6a = 3.55;
A6b = 2.058;

% Tag+8

V_A8 = [1 2 3 4]';
Fd_A8 = [4.5651	19.3259	42.6353	78.4284];
Fl_A8 = [4.1790	17.1944	38.4081	70.1414];

A8 = [Fd_A8' Fl_A8'];

A8_drag = A8(:,1);

A8p1 = 5.258;
A8p2 = -1.8;
A8p3 = 1.304;

A8a = 4.501;
A8b = 2.06;


  
%% Create the polynomial fits
  
  v_fit = linspace(0,10,200)';
  A_drag_fit = Ap1*v_fit.^2+Ap2*v_fit+Ap3; %R^2 = 0.99
  A2_drag_fit = A2p1*v_fit.^2+A2p2*v_fit+A2p3; %R^2 = 1.0
  A4_drag_fit = A4p1*v_fit.^2+A4p2*v_fit+A4p3; %R^2 = 0.99
  A6_drag_fit = A6p1*v_fit.^2+A6p2*v_fit+A6p3; %R^2 = 0.99
  A8_drag_fit = A8p1*v_fit.^2+A8p2*v_fit+A8p3; %R^2 = 0.99

 %% Create the polynomial fits
  
  v_fit = linspace(0,10,200)';
  A_drag_fit_2 = Aa*v_fit.^Ab; %R^2 = 0.99
  A2_drag_fit_2 = A2a*v_fit.^A2b;; %R^2 = 0.99
  A4_drag_fit_2 = A4a*v_fit.^A4b;; %R^2 = 0.99
  A6_drag_fit_2 = A6a*v_fit.^A6b;; %R^2 = 0.99
  A8_drag_fit_2 = A8a*v_fit.^A8b;; %R^2 = 0.99 
  
%% Create the model data
SA = 2.3; % (m^2)
cd = 0.01; % from CFD simulations 
rho = 1029;  % (kg/m^3)
fd = 0.5*rho*(v_fit.^2)*SA*cd;

fd_sim = 0.5*rho*(V_A.^2)*SA*cd;
%% Polynomial Plots
    figure
     
    plot(v_fit,fd,'y')
    hold on
     
    plot(v_fit,fd+A_drag_fit,'k')
    plot(V_A,fd_sim+A_drag,'.k')
    
    plot(v_fit,fd+A2_drag_fit,'b')
    plot(V_A2,fd_sim+A2_drag,'.b')
    
    plot(v_fit,fd+A4_drag_fit,'g')
    plot(V_A4,fd_sim+A4_drag,'.g')
    
    plot(v_fit,fd+A6_drag_fit,'m')
    plot(V_A6,fd_sim+A6_drag,'.m')
   
    plot(v_fit,fd+A8_drag_fit,'r')
    plot(V_A8,fd_sim+A8_drag,'.r')
    
    xlabel('Velocity (m/s)')
    ylabel('Drag Force (N)')
    
    title('CFD Simulation Results - Drag (Poly)')

   %% Power Plots Figure 6
    figure
    
    plot(v_fit,fd,'k')
    hold on
     
    plot(v_fit,fd+A_drag_fit_2,'b')
    plot(V_A,fd_sim+A_drag,'.b')
    
    plot(v_fit,fd+A2_drag_fit_2,'y')
    plot(V_A2,fd_sim+A2_drag,'.y')
    
    plot(v_fit,fd+A4_drag_fit_2,'g')
    plot(V_A4,fd_sim+A4_drag,'.g')
    
    plot(v_fit,fd+A6_drag_fit_2,'m')
    plot(V_A6,fd_sim+A6_drag,'.m')
   
    plot(v_fit,fd+A8_drag_fit_2,'r')
    plot(V_A8,fd_sim+A8_drag,'.r')
    
    xlabel('Velocity (m/s)')
    ylabel('Drag Force (N)')
    axis([0 6 0 800])
    
    title('CFD Simulation Results - Drag (Power)')

   %% Figure 4
    figure
    
    plot(v_fit,fd,'k')
    hold on
     
    plot(v_fit,fd+A_drag_fit_2,'b')
    plot(V_A,fd_sim+A_drag,'.b')
      
    plot(v_fit,fd+A8_drag_fit_2,'r')
    plot(V_A8,fd_sim+A8_drag,'.r')
    
    xlabel('Velocity (m/s)')
    ylabel('Drag Force (N)')
    
    axis([0 6 0 1000])
    title('CFD Simulation Results - Drag (Power)')

%% 