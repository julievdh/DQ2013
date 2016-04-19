% Glide Model after Alex Shorter's recommendation
% 12 April 2016 Julie van der Hoop

%% load some glides and process into structure
n = 26; % which entry of glide are you working on?
cd /Users/julievanderhoop/Documents/NOPPTagDrag/DolphinQuest2013/Glides/CUT
glide(n).filename = 'UWC_Liho_289_6a.csv';
A = importdata(glide(n).filename,',',2);
glide(n).condition = 3;
if ~isempty(strfind(glide(n).filename,'Hoku'))
    glide(n).animal = 1;
else
    glide(n).animal = 2;
end
glide(n).ZO1 = A.data(:,1:5);
glide(n).ZO2 = A.data(:,6:10);
glide(n).ZO1 = glide(n).ZO1(~isnan(glide(n).ZO1(:,4)),:); % replace NaNs
glide(n).ZO2 = glide(n).ZO2(~isnan(glide(n).ZO2(:,4)),:);
%
save('GlideStructure','glide')
% clear all; load('GlideStructure')
warning off


%% plot all velocity vs time for these five files
figure(1); hold on
for i = find([glide.condition] == 1)
    plot(vertcat(glide(i).ZO1(:,1),glide(i).ZO2(:,1)),vertcat(glide(i).ZO1(:,4),glide(i).ZO2(:,4)),'.')
    
    % fit model parameters
    xdata = vertcat(glide(i).ZO1(:,1),glide(i).ZO2(:,1));
    ydata = vertcat(glide(i).ZO1(:,4),glide(i).ZO2(:,4));
    fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
    x0 = [1,-1];
    [x(i,:),resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);
    
    % plot data
    times = linspace(xdata(1),xdata(end));
    plot(xdata,ydata,'ko',times,fun(x(i,:),times),'b-')
    legend('Data','Fitted exponential')
    title('Data and Fitted Curve')
    
    %% calculate Cd from parameter estimate
    % Add condition-specific tag weights and surface areas
    if glide(i).condition == 1
        Mt = 0.250; % tag weighs 250 g (weighed on necropsy scale 17 Mar 2016)
        SAt = 0.024; % tag surface area from CFD sims
    else if glide(i).condition == 3
            Mt = 0.250+(0.135)*2; % 2x elements are 135 g
            SAt = 0.024+(0.0105)*4; % tag and element surface area from CFD sims
        else if glide(i).condition == 5
                Mt = 0.250+(0.135)*4;
                SAt = 0.024+(0.0105)*8;
            else Mt = 0; SAt = 0;
            end
        end
    end
    % M = Mb body mass (kg) + Mt tag mass (kg) + Ma entrained water mass (kg) = (Mb+Mt)x1.06
    % Liho = 339.7 lbs = 154 kg
    % Hoku = 388 lbs = 176 kg
    if glide(i).animal == 1
        Mb = 176;
    else if glide(i).animal == 2;
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
    
    Cd(i) = (x(i,2)*4*M)/(rho*SAw);
    
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
    Cd_se(i) = (se(2)*4*M)/(rho*SAw);
end

%% what about fitting to all group data
allpoints = vertcat(vertcat(glide.ZO1),vertcat(glide.ZO2));
xdata = allpoints(:,1);
ydata = allpoints(:,4);
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'ko',times,fun(x,times),'b-')
legend('Data','Fitted exponential')
title('Data and Fitted Curve')

% calculate Cd for all
Cd_all = (x(2)*4*M)/(rho*SAw);
