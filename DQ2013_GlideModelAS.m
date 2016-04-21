% Glide Model after Alex Shorter's recommendation
% 12 April 2016 Julie van der Hoop

%% load some glides and process into structure
% n = 31; % which entry of glide are you working on?
cd /Users/julievanderhoop/Documents/NOPPTagDrag/DolphinQuest2013/Glides/CUT
% glide(n).filename = 'UWC_Liho_289_3e_cut.csv';
% A = importdata(glide(n).filename,',',2);
% glide(n).condition = 0;
% if ~isempty(strfind(glide(n).filename,'Hoku'))
%     glide(n).animal = 1;
% else
%     glide(n).animal = 2;
% end
% glide(n).ZO1 = A.data(:,1:5);
% glide(n).ZO2 = A.data(:,6:10);
% glide(n).ZO1 = glide(n).ZO1(~isnan(glide(n).ZO1(:,4)),:); % replace NaNs
% glide(n).ZO2 = glide(n).ZO2(~isnan(glide(n).ZO2(:,4)),:);
%
% save('GlideStructure','glide')
clear all; load('GlideStructure')
warning off
close all

%% plot all velocity vs time for these files
for i = 1:length(glide)
    % plot data on specific figure
    figure(glide(i).condition+1); hold on
    
    % make all speeds start at zero
    firstZO1 = glide(i).ZO1(1,1);
    glide(i).ZO1(:,1) = glide(i).ZO1(:,1)-firstZO1;
    glide(i).ZO2(:,1) = glide(i).ZO2(:,1)-firstZO1;
    % plot(vertcat(glide(i).ZO1(:,1),glide(i).ZO2(:,1)),vertcat(glide(i).ZO1(:,4),glide(i).ZO2(:,4)),'.')
    
    
    % fit model parameters
    xdata = vertcat(glide(i).ZO1(:,1),glide(i).ZO2(:,1));
    [xdata,I] = sort(xdata); % sort these data to see if it fixes problem?
    ydata = vertcat(glide(i).ZO1(:,4),glide(i).ZO2(:,4));
    ydata = ydata(I);
    fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
    x0 = [5,-1];
    [x(i,:),resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);
    
    % plot data
    times = linspace(xdata(1),xdata(end));
    h1 = plot(xdata,ydata,'o');
    if glide(i).animal == 1
        set(h1,'markerstyle','s')
    end
    plot(times,fun(x(i,:),times),'k-')
    
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
% get indices for conditions
c0 = find([glide.condition] == 0);
c1 = find([glide.condition] == 1);
c3 = find([glide.condition] == 3);
c5 = find([glide.condition] == 5);

%% plot labels
figure(1);
xlabel('Time (sec)'); ylabel('Velocity (m/s)');
adjustfigurefont
title('Control; No Tag')
text(2.5,1.5,['n =' num2str(size(c0,2))])
text(2.0,1.4,['meanSD = ' num2str(mean(Cd(c0))) '+/-' num2str(std(Cd(c0)))])

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Cd0_notag_separate','-dpng','-r300')

figure(2); 
xlabel('Time (sec)'); ylabel('Velocity (m/s)');
adjustfigurefont
title('Tag')
text(2,1.15,['n =' num2str(size(c1,2))])
text(2,1.10,['meanSD = ' num2str(mean(Cd(c1))) '+/-' num2str(std(Cd(c1)))])

print('Cd1_tag_separate','-dpng','-r300')

figure(4); 
xlabel('Time (sec)'); ylabel('Velocity (m/s)');
adjustfigurefont
title('Tag + 4')
text(1.5,1.6,['n =' num2str(size(c3,2))])
text(1.5,1.5,['meanSD = ' num2str(mean(Cd(c3))) '+/-' num2str(std(Cd(c3)))])

print('Cd3_tag+4_separate','-dpng','-r300')

figure(6); 
xlabel('Time (sec)'); ylabel('Velocity (m/s)');
adjustfigurefont
title('Tag + 8')
text(1.5,1.05,['n =' num2str(size(c5,2))])
text(1.25,1.0,['meanSD = ' num2str(mean(Cd(c5))) '+/-' num2str(std(Cd(c5)))])

print('Cd5_tag+8_separate','-dpng','-r300')

%% what about fitting to all group data
% separate plots and fits for conditions

figure(8); clf; hold on
% c0 - control, no tag
allpoints = vertcat(vertcat(glide(c0).ZO1),vertcat(glide(c0).ZO2));
xdata = allpoints(:,1);
ydata = allpoints(:,4);
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'o',times,fun(x,times),'b-')

% calculate Cd for C0
Mt = 0; SAt = 0;
Mb = 165; % using average mass of both animals
M = (Mb+Mt)*1.06;
SAw = (0.08*Mb.^0.65)+SAt;
Cd0_all = (x(2)*4*M)/(rho*SAw);

% c1 - tag
allpoints = vertcat(vertcat(glide(c1).ZO1),vertcat(glide(c1).ZO2));
xdata = allpoints(:,1);
ydata = allpoints(:,4);
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'o',times,fun(x,times),'k-')

% calculate Cd for C1
Mt = 0.250; % tag weighs 250 g (weighed on necropsy scale 17 Mar 2016)
SAt = 0.024; % tag surface area from CFD sims
Mb = 165; % using average mass of both animals
M = (Mb+Mt)*1.06;
SAw = (0.08*Mb.^0.65)+SAt;
Cd1_all = (x(2)*4*M)/(rho*SAw);

% c3 - tag+4
allpoints = vertcat(vertcat(glide(c3).ZO1),vertcat(glide(c3).ZO2));
xdata = allpoints(:,1);
ydata = allpoints(:,4);
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'o',times,fun(x,times),'k-')

% calculate Cd for C3
Mt = 0.250+(0.135)*2; % 2x elements are 135 g
SAt = 0.024+(0.0105)*4; % tag and element surface area from CFD simsMb = 165; % using average mass of both animals
M = (Mb+Mt)*1.06;
SAw = (0.08*Mb.^0.65)+SAt;
Cd3_all = (x(2)*4*M)/(rho*SAw);

% c5 - tag+8
allpoints = vertcat(vertcat(glide(c5).ZO1),vertcat(glide(c5).ZO2));
xdata = allpoints(:,1);
ydata = allpoints(:,4);
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'o',times,fun(x,times),'k-')

% calculate Cd for C5
Mt = 0.250+(0.135)*4; % 2x elements are 135 g
SAt = 0.024+(0.0105)*8; % tag and element surface area from CFD simsMb = 165; % using average mass of both animals
M = (154+Mt)*1.06; % Liho only 
SAw = (0.08*Mb.^0.65)+SAt;
Cd5_all = (x(2)*4*M)/(rho*SAw);

% plot labels
xlabel('Time (sec)'); ylabel('Velocity (m/s)');
adjustfigurefont

print('Cd_fitall','-dpng','-r300')

%% compare both methods:
figure(10); clf; hold on
subplot(411); ylim([0 8]); hold on
histogram(Cd(c0),[0:0.05:1]);  plot([Cd0_all Cd0_all],[0 8],'b')
subplot(412); ylim([0 8]); hold on
histogram(Cd(c1),[0:0.05:1]);  plot([Cd1_all Cd1_all],[0 8],'b')
subplot(413); ylim([0 8]); hold on
histogram(Cd(c3),[0:0.05:1]);  plot([Cd3_all Cd3_all],[0 8],'b')
subplot(414); hold on; ylim([0 8])
histogram(Cd(c5),[0:0.05:1]); plot([Cd5_all Cd5_all],[0 8],'b')
xlabel('Drag Coefficient');
adjustfigurefont

print('Cd_fitcomparison','-dpng','-r300')
