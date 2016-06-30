function [Cd,Cd_se] = glidefitAS(xdata1,xdata2,ydata1,ydata2,animal,condition)

% fit
%     xdata = vertcat(glide(i).ZO1(2:end,1),glide(i).ZO2(2:end,1)); % time
%     [xdata,I] = sort(xdata); % sort these data to see if it fixes problem?
%     ydata = vertcat(glide(i).V1,glide(i).V2);


allpoints = vertcat(xdata1,xdata2);
xdata = allpoints(:,1);
ydata = vertcat(ydata1,ydata2);
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'ko')
plot(times,fun(x,times),'k-','Linewidth',2)

%% calculate Cd from parameter estimate
% Add condition-specific tag weights and surface areas
if condition == 1
    Mt = 0.250; % tag weighs 250 g (weighed on necropsy scale 17 Mar 2016)
    SAt = 0.024; % tag surface area from CFD sims
else if condition == 3
        Mt = 0.250+(0.135)*2; % 2x elements are 135 g
        SAt = 0.024+(0.0105)*4; % tag and element surface area from CFD sims
    else if condition == 5
            Mt = 0.250+(0.135)*4;
            SAt = 0.024+(0.0105)*8;
        else Mt = 0; SAt = 0;
        end
    end
end
% M = Mb body mass (kg) + Mt tag mass (kg) + Ma entrained water mass (kg) = (Mb+Mt)x1.06
% Liho = 339.7 lbs = 154 kg
% Hoku = 388 lbs = 176 kg
if animal == 1
    Mb = 176;
else if animal == 2;
        Mb = 154;
    end
end

M = (Mb+Mt)*1.06;
% SAw = reference area (m^2) % estimated wetted surface area from Fish 1993
% Add SAt = surface area of tag from CFD
SAw = (0.08*Mb.^0.65)+SAt;
% rho = water density (kg m^3) - for 24C water, salinity 31 from Oct 16, 17
% as measured at DQO (see water quality for glide.jrl.o13014.xlsx)
rho = 1021;

Cd = (x(2)*4*M)/(rho*SAw);

% calculate standard error on parameter estimates
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

