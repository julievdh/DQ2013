close all; clear all; clc

% Import glide structure
load('GlideStructure.mat')
%%
for file = 1:45
    Cond = glide(file).condition;
    ZO1 = glide(file).ZO1;
    ZO2 = glide(file).ZO2;
    
    ZO1 = ZO1(~isnan(ZO1(:,1)),:);
    ZO2 = ZO2(~isnan(ZO2(:,1)),:);
    
    %% Calculate vx, vy, v
    % vx = (x(i+1) - x(i))/dt; vy = (y(i+1) - y(i))/dt;
    Vx1 = (ZO1(2:end,2) - ZO1(1:end-1,2))/(ZO1(2,1)-ZO1(1,1));
    Vx2 = (ZO2(2:end,2) - ZO2(1:end-1,2))/(ZO2(2,1)-ZO2(1,1));
    Vy1 = (ZO1(2:end,3) - ZO1(1:end-1,3))/(ZO1(2,1)-ZO1(1,1));
    Vy2 = (ZO2(2:end,3) - ZO2(1:end-1,3))/(ZO2(2,1)-ZO2(1,1));
    % v = sqrt(vx^2 + vy^2)
    V1 = sqrt(Vx1.^2 + Vy1.^2);
    V2 = sqrt(Vx2.^2 + Vy2.^2);
    
    glide(file).V1(:,1) = V1; % glide(file).V1 = glide(file).V1';
    glide(file).V2(:,1) = V2; % glide(file).V2 = glide(file).V2';
    
    %%
    % plot velocity from different body points
    figure(1); clf;
    set(gcf,'Position',[290 120 1000 520])
    subplot(311); hold on
    % plot velocity from tracker
    % plot(ZO1(:,1),ZO1(:,4),'o','color',[247/255 23/255 53/255]);
    % plot(ZO2(:,1),ZO2(:,4),'o','color',[194/255 9/255 90/255]);
    % plot velocity calculated
    plot(ZO1(2:end,1),V1,'o','color',[0/255 31/255 84/255]);
    plot(ZO2(2:end,1),V2,'o','color',[3/255 64/255 120/255]);
    xlim([min(ZO1(:,1)),max(ZO2(:,1))])
    
    ylabel('Velocity (m/s)'); box on
    
    % legend('Zinc Oxide 1','Zinc Oxide 2','Location','SW')
    % legend boxoff
    
    %% SET RULES
    ZO1dur = abs(ZO1(end,1) - ZO1(1,1));
    ZO2dur = abs(ZO2(end,1) - ZO2(1,1));
    if ZO1dur < 1
        error('ZO1 NOT LONG ENOUGH')
    end
    if ZO2dur < 1
        error('ZO2 NOT LONG ENOUGH')
    end
    
    %% SET PARAMETERS
    
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
    % Mb = body mass (kg)
    if glide(file).animal == 1
        % Liho = 339.7 lbs = 154 kg
        % Hoku = 388 lbs = 176 kg
        % Ma = entrained water mass (kg) = 1.06
        Mb = (176+Mt)*1.06;
    else Mb = (154+Mt)*1.06;
    end
    
    % SAw = reference area (m^2) % estimated wetted surface area from Fish 1993
    % Add SAt = surface area of tag from CFD
    SAw = (0.08*Mb.^0.65)+SAt;
    % rho = water density (kg m^3) - for 24C water, salinity 31 from Oct 16, 17
    % as measured at DQO (see water quality for glide.jrl.o13014.xlsx)
    rho = 1021;
    
    %% NOREN METHOD
    % Cd = (2*D)/(rho*Saw*V^2)
    % D = Mb*acceleration
    
    % filter ZO1 and ZO2 data
    windowSize = 30; % 30 frames = 1s
    % ZO1_filt = filter(ones(1,windowSize)/windowSize,1,ZO1);
    % ZO2_filt = filter(ones(1,windowSize)/windowSize,1,ZO2);
    % plot(ZO1_filt(:,1),ZO1_filt(:,4),'color',[247/255 23/255 53/255],'LineWidth',2); % plot filtered velocity
    % plot(ZO2_filt(:,1),ZO2_filt(:,4),'color',[247/255 23/255 53/255],'LineWidth',2);
    % calcluate for calculated velocity (not tracker velocity)
    V1_filt = filter(ones(1,windowSize)/windowSize,1,[ZO1(2:end,1) V1]);
    V2_filt = filter(ones(1,windowSize)/windowSize,1,[ZO2(2:end,1) V2]);
    V1_filt(1:29,:) = NaN; V2_filt(1:29,:) = NaN;
    h1 = plot(V1_filt(:,1),V1_filt(:,2),V2_filt(:,1),V2_filt(:,2));
    set(h1,'color',[0/255 31/255 84/255],'LineWidth',2);
    
    subplot(312); hold on
    % compute acceleration from smoothed velocity
    % ZO1_filt_ax = (ZO1_filt(2:end,4) - ZO1_filt(1:end-1,4))/(1/29.97); % on tracker data
    % ZO2_filt_ax = (ZO2_filt(2:end,4) - ZO2_filt(1:end-1,4))/(1/29.97);
    A1_filt = diff(V1_filt(:,2))./diff(V1_filt(:,1)); % on calculated data
    A2_filt = diff(V2_filt(:,2))./diff(V2_filt(:,1));
    % plot mean A and tracker A and calculated A
    plot([min(ZO1(:,1)),max(ZO2(:,1))],[nanmean([A1_filt; A2_filt]) nanmean([A1_filt; A2_filt])],'color',[0.75 0.75 0.75],'LineWidth',2)
    % plot(ZO1_filt(2:end,1),ZO1_filt_ax,'color',[247/255 23/255 53/255],'LineWidth',2);
    % plot(ZO2_filt(2:end,1),ZO2_filt_ax,'colorx',[194/255 9/255 90/255],'LineWidth',2)
    plot(V1_filt(2:end,1),A1_filt,'color',[0/255 31/255 84/255],'LineWidth',2)
    plot(V2_filt(2:end,1),A2_filt,'color',[3/255 64/255 120/255],'LineWidth',2)
    ylabel('Acceleration (m/s^2)');
    adjustfigurefont; box on
    xlim([min(ZO1(:,1)),max(ZO2(:,1))])
    
    subplot(313); hold on
    % Calculate Cd from drag (D = Mb*accel)
    Cd_ZO1 = (2*abs(Mb.*A1_filt))./(rho*SAw*V1_filt(2:end,2).^2);
    Cd_ZO1_abar = (2*abs(Mb.*nanmean(A1_filt)))./(rho*SAw*V1_filt(2:end,2).^2);
    Cd_ZO1_mn = nanmean(Cd_ZO1);
    Cd_ZO2 = (2*abs(Mb.*A2_filt))./(rho*SAw*V2_filt(2:end,2).^2);
    Cd_ZO2_abar = (2*abs(Mb.*nanmean(A2_filt)))./(rho*SAw*V2_filt(2:end,2).^2);
    Cd_ZO2_mn = nanmean(Cd_ZO2);
    % plot mean Cd and calcualted Cd
    h = plot([min(ZO1(:,1)),max(ZO2(:,1))],[mean([Cd_ZO1_mn,Cd_ZO2_mn]) mean([Cd_ZO1_mn,Cd_ZO2_mn])],'color',[0.75 0.75 0.75],'LineWidth',2);
    plot(V1_filt(2:end,1),Cd_ZO1,'color',[0/255 31/255 84/255],'LineWidth',2)
    plot(V2_filt(2:end,1),Cd_ZO2,'color',[3/255 64/255 120/255],'LineWidth',2)
    % plot(V1_filt(2:end,1),Cd_ZO1_abar,'k')
    % plot(V2_filt(2:end,1),Cd_ZO2_abar,'k')
    % plot(ZO1_filt(2:end,1),Cd_ZO1_old,'color',[247/255 23/255 53/255],'LineWidth',2)
    % plot(ZO2_filt(2:end,1),Cd_ZO2_old,'color',[194/255 9/255 90/255],'LineWidth',2)
    
    xlabel('Time (s)'); ylabel('Drag Coefficient, C_d');
    adjustfigurefont; box on
    xlim([min(ZO1(:,1)),max(ZO2(:,1))])
    
    % to export: CD from ZO1, from ZO2, duration of glide
    glide(file).Cd_mn = abs([Cd_ZO1_mn Cd_ZO2_mn]); % Cd estimate
    glide(file).dur = mean([ZO1dur ZO2dur]); % glide duration
    glide(file).sspeed = mean([ZO1(2,4) ZO2(2,4)]); % glide start speed
    glide(file).espeed = mean([ZO1(end,4) ZO2(end,4)]); % glide end speed
    
    if glide(file).animal == 1
        l = 2.52; % Hoku = 2.52 m (found error 27 June 2016)
    else l = 2.37; % Liho = 2.37 m
    end
    glide(file).Re = (l*glide(file).sspeed)/0.00000105;
    glide(file).Cd_abar = nanmean([nanmean(Cd_ZO1_abar),nanmean(Cd_ZO2_abar)]);
end


% save glide structure
save('GlideStructure','glide')
