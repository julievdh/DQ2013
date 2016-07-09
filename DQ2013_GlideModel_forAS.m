% Glide Model after Alex Shorter's recommendation
% 12 April 2016 Julie van der Hoop

%% load some glides and process into structure
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/Glides
% n = 17; % which entry of glide are you working on?
% glide(n).filename = 'UWC_Hoku_289_2extra2_cut.csv';
% A = importdata(glide(n).filename,',',2);
% glide(n).condition = 3;
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
%% clear all; 
load('GlideStructure')
warning off
close all

%% plot all velocity vs time for these files
for i = 1:45
    % plot data on specific figure
    figure(glide(i).condition+1); hold on
    
    % make all speeds start at zero
    firstZO1 = min(glide(i).ZO1(1,1), glide(i).ZO2(1,1));
    glide(i).ZO1(:,1) = glide(i).ZO1(:,1)-firstZO1;
    glide(i).ZO2(:,1) = glide(i).ZO2(:,1)-firstZO1;
    % plot(vertcat(glide(i).ZO1(:,1),glide(i).ZO2(:,1)),vertcat(glide(i).ZO1(:,4),glide(i).ZO2(:,4)),'.')
    
    
    % fit model parameters
    xdata = vertcat(glide(i).ZO1(2:end,1),glide(i).ZO2(2:end,1)); % time
    [xdata,I] = sort(xdata); % sort these data to see if it fixes problem?
    ydata = vertcat(1./glide(i).V1, 1./glide(i).V2);
    ydata = ydata(I); % sorted as in xdata
    % fun = @(x,xdata)(x(1)+(x(2)*xdata)).^(-1/3);
    fun = @(x,xdata)(x(1)+(x(2)*xdata));
    x0 = [5,0];
    [x(i,:),resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);
    
    % plot data
    times = linspace(xdata(1),xdata(end));
    h1 = plot(xdata,ydata,'o');
    if glide(i).animal == 1
        set(h1,'marker','s')
    end
    plot(times,fun(x(i,:),times),'k-')
    % text(xdata(end)+0.1,ydata(end),num2str(i))
    
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
    
    Cd(i) = x(i,2)*2*M/(rho*SAw);
    
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
    Cd_se(i) = (se(2)*2*M)/(rho*SAw);
glide(i).CDAS = Cd(i);
end

%% get indices for conditions
c0 = find([glide.condition] == 0);
c1 = find([glide.condition] == 1);
c3 = find([glide.condition] == 3);
c5 = find([glide.condition] == 5);

%% plot labels
figure(1);
xlabel('Time (sec)'); ylabel('1/Velocity (s/m)');
adjustfigurefont
title('Control; No Tag')
text(2.5,0.55,['n =' num2str(size(c5,2))])
text(2.25,0.3,['meanSD = ' num2str(round(mean(Cd(c0)),2)) '+/-' num2str(round(std(Cd(c0)),2))])
ylim([0 7]); xlim([0 3.5])

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('Cd0_notag_separate','-dpng','-r300')

figure(2);
xlabel('Time (sec)'); ylabel('1/Velocity (s/m)');
adjustfigurefont
title('Tag')
text(2.5,0.55,['n =' num2str(size(c5,2))])
text(2.25,0.3,['meanSD = ' num2str(round(mean(Cd(c1)),2)) '+/-' num2str(round(std(Cd(c1)),2))])
ylim([0 7]); xlim([0 3.5])

print('Cd1_tag_separate','-dpng','-r300')

figure(4);
xlabel('Time (sec)'); ylabel('1/Velocity (s/m)');
adjustfigurefont
title('Tag + 4'); ylim([0 2])
text(2.5,0.55,['n =' num2str(size(c5,2))])
text(2.25,0.3,['meanSD = ' num2str(round(mean(Cd(c3)),2)) '+/-' num2str(round(std(Cd(c3)),2))])
ylim([0 7]); xlim([0 3.5])

print('Cd3_tag+4_separate','-dpng','-r300')

figure(6);
xlabel('Time (sec)'); ylabel('1/Velocity (s/m)');
adjustfigurefont
title('Tag + 8')
text(2.5,0.55,['n =' num2str(size(c5,2))])
text(2.25,0.3,['meanSD = ' num2str(round(mean(Cd(c5)),2)) '+/-' num2str(round(std(Cd(c5)),2))])
ylim([0 7]); xlim([0 3.5])

print('Cd5_tag+8_separate','-dpng','-r300')

return

%% what about fitting to all group data
% separate plots and fits for conditions
% get indices for conditions
Hc0 = find([glide.condition] == 0 & [glide.animal] == 1);
Lc0 = find([glide.condition] == 0 & [glide.animal] == 2);
Hc1 = find([glide.condition] == 1 & [glide.animal] == 1);
Lc1 = find([glide.condition] == 1 & [glide.animal] == 2);
Hc3 = find([glide.condition] == 3 & [glide.animal] == 1);
Lc3 = find([glide.condition] == 3 & [glide.animal] == 2);
Hc5 = find([glide.condition] == 5 & [glide.animal] == 1);
Lc5 = find([glide.condition] == 5 & [glide.animal] == 2);

figure(8); clf; hold on
% c0 - control, no tag Hoku
allpoints = vertcat(vertcat(glide(Hc0).ZO1),vertcat(glide(Hc0).ZO2));
xdata = allpoints(:,1);
ydata = 1./allpoints(:,4); % goal would be to make this = V1 and V2 instead
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'ks')
plot(times,fun(x,times),'k-','Linewidth',2)

% calculate Cd for C0
Mt = 0; SAt = 0;
Mb = 176; % using average mass of both animals
M = (Mb+Mt)*1.06;
SAw = (0.08*Mb.^0.65)+SAt;
CdH0_all = (x(2)*4*M)/(rho*SAw);
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
Cd_seH0 = (se(2)*4*M)/(rho*SAw);

figure(9); clf; hold on
% c0 - control, no tag Liho
allpoints = vertcat(vertcat(glide(Lc0).ZO1),vertcat(glide(Lc0).ZO2));
xdata = allpoints(:,1);
ydata = allpoints(:,4); % goal would be to make this = V1 and V2 instead
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'ko')
plot(times,fun(x,times),'k-','Linewidth',2)

% calculate Cd for C0
Mt = 0; SAt = 0;
Mb = 154; % using average mass of both animals
M = (Mb+Mt)*1.06;
SAw = (0.08*Mb.^0.65)+SAt;
CdL0_all = (x(2)*4*M)/(rho*SAw);
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
Cd_seL0 = (se(2)*4*M)/(rho*SAw);

%% c1 - tag, Hoku
allpoints = vertcat(vertcat(glide(Hc1).ZO1),vertcat(glide(Hc1).ZO2));
xdata = allpoints(:,1);
ydata = allpoints(:,4);
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

figure(8); 
% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'s','Color',[55/255 126/255 184/255])
plot(times,fun(x,times),'k-','Linewidth',2)

% calculate Cd for C1
Mt = 0.250; % tag weighs 250 g (weighed on necropsy scale 17 Mar 2016)
SAt = 0.024; % tag surface area from CFD sims
Mb = 176; % using average mass of both animals
M = (Mb+Mt)*1.06;
SAw = (0.08*Mb.^0.65)+SAt;
CdH1_all = (x(2)*4*M)/(rho*SAw);

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
Cd_seH1 = (se(2)*4*M)/(rho*SAw);

% c1 - tag, Liho
allpoints = vertcat(vertcat(glide(Lc1).ZO1),vertcat(glide(Lc1).ZO2));
xdata = allpoints(:,1);
ydata = allpoints(:,4);
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

figure(9);
% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'o','Color',[55/255 126/255 184/255])
plot(times,fun(x,times),'k-','Linewidth',2)

% calculate Cd for C1
Mt = 0.250; % tag weighs 250 g (weighed on necropsy scale 17 Mar 2016)
SAt = 0.024; % tag surface area from CFD sims
Mb = 154; % using average mass of both animals
M = (Mb+Mt)*1.06;
SAw = (0.08*Mb.^0.65)+SAt;
CdL1_all = (x(2)*4*M)/(rho*SAw);

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
Cd_seL1 = (se(2)*4*M)/(rho*SAw);


%% c3 - tag+4 Hoku
allpoints = vertcat(vertcat(glide(c3).ZO1),vertcat(glide(c3).ZO2));
xdata = allpoints(:,1);
ydata = allpoints(:,4);
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

figure(8);
% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'s','Color',[77/255 175/255 74/255])
plot(times,fun(x,times),'k-','Linewidth',2)

% calculate Cd for C3
Mt = 0.250+(0.135)*2; % 2x elements are 135 g
SAt = 0.024+(0.0105)*4; % tag and element surface area from CFD simsMb = 165; % using average mass of both animals
Mb = 176;
M = (Mb+Mt)*1.06;
SAw = (0.08*Mb.^0.65)+SAt;
CdH3_all = (x(2)*4*M)/(rho*SAw);

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
Cd_seH3 = (se(2)*4*M)/(rho*SAw);

%% c3 - tag+4 Liho
allpoints = vertcat(vertcat(glide(Lc3).ZO1),vertcat(glide(Lc3).ZO2));
xdata = allpoints(:,1);
ydata = allpoints(:,4);
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

figure(9);
% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'o','Color',[77/255 175/255 74/255])
plot(times,fun(x,times),'k-','Linewidth',2)

% calculate Cd for C3
Mt = 0.250+(0.135)*2; % 2x elements are 135 g
SAt = 0.024+(0.0105)*4; % tag and element surface area from CFD simsMb = 165; % using average mass of both animals
Mb = 154;
M = (Mb+Mt)*1.06;
SAw = (0.08*Mb.^0.65)+SAt;
CdL3_all = (x(2)*4*M)/(rho*SAw);

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
Cd_seL3 = (se(2)*4*M)/(rho*SAw);

%% c5 - tag+8
allpoints = vertcat(vertcat(glide(c5).ZO1),vertcat(glide(c5).ZO2));
xdata = allpoints(:,1);
ydata = allpoints(:,4);
fun = @(x,xdata)(x(1)+x(2)*xdata).^(-1/3);
x0 = [1,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

% plot data
times = linspace(xdata(1),xdata(end));
plot(xdata,ydata,'o','Color',[228/255 26/255 28/255])
plot(times,fun(x,times),'k-','Linewidth',2)

% calculate Cd for C5
Mt = 0.250+(0.135)*4; % 2x elements are 135 g
SAt = 0.024+(0.0105)*8; % tag and element surface area from CFD simsMb = 165; % using average mass of both animals
M = (154+Mt)*1.06; % Liho only
SAw = (0.08*Mb.^0.65)+SAt;
Cd5_all = (x(2)*4*M)/(rho*SAw);

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
Cd_se5 = (se(2)*4*M)/(rho*SAw);

% plot labels
xlabel('Time (sec)'); ylabel('Velocity (m/s)');
adjustfigurefont
ylim([0 1.8])
% print('Cd_fitall','-dpng','-r300')

%% compare both methods:
figure(10); clf; hold on
subplot(411); ylim([0 8]); hold on
histogram(Cd(c0),'FaceColor','k');  
plot([CdH0_all CdH0_all],[0 8],'k'); plot([CdL0_all CdL0_all],[0 8],'k')
text(0.25,6,'Control, No Tag','FontSize',14)
subplot(412); ylim([0 8]); hold on
histogram(Cd(c1),'FaceColor',[55/255 126/255 184/255]); 
plot([CdH1_all CdH1_all],[0 8],'k'); plot([CdL1_all CdL1_all],[0 8],'k')
text(2,6,'Tag','FontSize',14)
subplot(413); ylim([0 8]); hold on
histogram(Cd(c3),'FaceColor',[77/255 175/255 74/255]); 
plot([CdH3_all CdH3_all],[0 8],'k'); plot([CdL3_all CdL3_all],[0 8],'k')
text(1.05,6,'Tag+4','FontSize',14)
subplot(414); hold on; ylim([0 8])
histogram(Cd(c5),'FaceColor',[228/255 26/255 28/255]); plot([Cd5_all Cd5_all],[0 8],'k')
text(7,6,'Tag+8','FontSize',14)
xlabel('Drag Coefficient');
adjustfigurefont

print('Cd_fitcomparison','-dpng','-r300')

return
%% percent increases
pinc1 = [((mean(Cd(c1))-mean(Cd(c0)))./mean(Cd(c0)))*100 ((Cd1_all - Cd0_all)/Cd0_all)*100];
pinc3 = [((mean(Cd(c3))-mean(Cd(c0)))./mean(Cd(c0)))*100 ((Cd3_all - Cd0_all)/Cd0_all)*100];
pinc5 = [((mean(Cd(c5))-mean(Cd(c0)))./mean(Cd(c0)))*100 ((Cd5_all - Cd0_all)/Cd0_all)*100];

