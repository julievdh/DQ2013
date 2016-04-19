% Glide Model after Alex Shorter's recommendation 
% 12 April 2016 Julie van der Hoop

%% load a glide 
cd /Users/julievanderhoop/Documents/NOPPTagDrag/DolphinQuest2013/Glides/CUT
A = importdata('UWC_Liho_288_2c.csv',',',2);
ZO1 = A.data(:,1:5);
ZO2 = A.data(:,6:10);
ZO1 = ZO1(~isnan(ZO1(:,4)),:); % replace NaNs
ZO2 = ZO2(~isnan(ZO2(:,4)),:);

Cond = 1; % tag condition. 0 = Control, 1 = Tag, 3 = Tag + 4; 5 = tag + 8

% Add condition-specific tag weights and surface areas
if Cond == 1
    Mt = 0.250; % tag weighs 250 g (weighed on necropsy scale 17 Mar 2016)
    SAt = 0.024; % tag surface area from CFD sims
else if Cond == 3
        Mt = 0.250+(0.135)*2; % 2x elements are 135 g
        SAt = 0.024+(0.0105)*4; % tag and element surface area from CFD sims
    else if Cond == 5
            Mt = 0.250+(0.135)*4;
            SAt = 0.024+(0.0105)*8;
        else Mt = 0; SAt = 0;
        end
    end
end
% M = Mb body mass (kg) + Mt tag mass (kg) + Ma entrained water mass (kg) = (Mb+Mt)x1.06
% Liho = 339.7 lbs = 154 kg
% Hoku = 388 lbs = 176 kg
Mb = 154;
M = (Mb+Mt)*1.06;
% SAw = reference area (m^2) % estimated wetted surface area from Fish 1993
% Add SAt = surface area of tag from CFD
SAw = (0.08*Mb.^0.65)+SAt;
% rho = water density (kg m^3) - for 24C water, salinity 31 from Oct 16, 17
% as measured at DQO (see water quality for glide.jrl.o13014.xlsx)
rho = 1021;

%% plot velocities with time 
figure(1); clf; hold on
plot(ZO1(:,1),ZO1(:,4),ZO2(:,1),ZO2(:,4))
xlabel('Time (s)'); ylabel('Velocity (m/s)');

% polyfit velocity vs. time 
[P,S] = polyfit(ZO1(:,1),ZO1(:,4),2);
t1 = linspace(min(ZO1(:,1)),max(ZO1(:,1)));
v1 = polyval(P,t1);
[P,S] = polyfit(ZO2(:,1),ZO2(:,4),2);
t2 = linspace(min(ZO2(:,1)),max(ZO2(:,1)));
v2 = polyval(P,t2);
plot(t1,v1,'o-',t2,v2,'o-')

%%
xdata = vertcat(ZO1(:,1),ZO2(:,1));
ydata = vertcat(ZO1(:,4),ZO2(:,4));
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

% plot 
times = linspace(xdata(1),xdata(end));
figure(5); clf
plot(xdata,ydata,'ko',times,fun(x,times),'b-')
legend('Data','Fitted exponential')
title('Data and Fitted Curve')

Cd = (x(2)*4*M)/(rho*SAw);

% calculate standard error on fitted values
J = jacobian;
r = residual;
[Q,R] = qr(J,0);
mse = sum(abs(r).^2)/(size(J,1)-size(J,2));
Rinv = inv(R);
Sigma = Rinv*Rinv'*mse;
se = sqrt(diag(Sigma));
se = full(se); % convert from sparse to full matrix

% calculate error on Cd estimate
Cd_se = (se(2)*4*M)/(rho*SAw);
