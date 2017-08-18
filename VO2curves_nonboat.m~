% instantaneous recovery rates
% fit exponential to recovery curve -- are they different

clear all; close all

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData
filenames = {'Liko_266_C';'Kolohe_266_C';'Nainoa_267_A4';...
    'Lono_267_C';'Kolohe_268_A4';'Liko_268_A';'Nainoa_268_C';...
    'Lono_269_A';'Kolohe_269_C';'Kolohe_271_A';'Kolohe_272_A4';...
    'Lono_273_A4';'Nainoa_273_A';'Liko_273_C';'Lono_275_C';...
    'Lono_276_A4';'Kolohe_276_A';'Nainoa_276_C';'Lono_278_A';...
    'Kolohe_278_C';'Liko_279_A';'Lono_280_C';'Lono_281_A4';...
    'Kolohe_282_A';'Lono_283_A';'Kolohe_288_A4'};
% get ind and cond
for i = 1:length(filenames)
    if strfind(filenames{i},'Lono')
        Ind(i) = 1;
    end
    if strfind(filenames{i},'Kolohe')
        Ind(i) = 2;
    end
    if strfind(filenames{i},'Liko')
        Ind(i) = 3;
    end
    if strfind(filenames{i},'Nainoa')
        Ind(i) = 4;
    end
    if strfind(filenames{i},'C')
        Cond(i) = 0;
    else if strfind(filenames{i},'A4')
            Cond(i) = 5;
        else
            Cond(i) = 1;
        end
    end
end
for i = 1:size(filenames,1)
    load(filenames{i});
    
    
    %     figure(3); hold on
    %     DQsubplot
    %
    %     % plot recovery end-tidal O2
    %     if isempty(strfind(filenames{i},'C')) == 0
    %         plot(pre(:,12)/12000,pre(:,5),'ko-')
    %         % xlim([0 7]); ylim([0.65 1.1])
    %         % text(0.2,1.05,'Lono','FontSize',14); box on
    %     else
    %         if isempty(strfind(filenames{i},'A4')) == 0
    %             plot(pre(:,12)/12000,pre(:,5),'ro-')
    %             % xlim([0 7]); ylim([0.65 1.1])
    %         else
    %             plot(pre(:,12)/12000,pre(:,5),'bo-')
    %         end
    %     end
    %
    %     figure(4); hold on
    %     DQsubplot
    %     if isempty(strfind(filenames{i},'C')) == 0
    %         plot(post(:,12)/12000,post(:,11)./post(:,10),'ko-')
    %         % xlim([0 7]); ylim([0.65 1.1])
    %         % text(0.2,1.05,'Lono','FontSize',14); box on
    %     else
    %         if isempty(strfind(filenames{i},'A4')) == 0
    %             plot(post(:,12)/12000,post(:,11)./post(:,10),'ro-')
    %             % xlim([0 7]); ylim([0.65 1.1])
    %         else
    %             plot(post(:,12)/12000,post(:,11)./post(:,10),'bo-')
    %         end
    %     end
    %
    %     figure(5); hold on
    %     DQsubplot
    %     % plot recovery end-tidal CO2
    %     if isempty(strfind(filenames{i},'C')) == 0
    %         plot(pre(:,12)/12000,pre(:,6),'ko-')
    %         % xlim([0 7]); ylim([0.65 1.1])
    %         % text(0.2,1.05,'Lono','FontSize',14); box on
    %     else
    %         if isempty(strfind(filenames{i},'A4')) == 0
    %             plot(pre(:,12)/12000,pre(:,6),'ro-')
    %             % xlim([0 7]); ylim([0.65 1.1])
    %         else
    %             plot(pre(:,12)/12000,pre(:,6),'bo-')
    %         end
    %     end
    %
    %     figure(6); hold on
    %     DQsubplot
    %     % plot recovery tidal volume
    %     if isempty(strfind(filenames{i},'C')) == 0
    %         plot(pre(:,12)/12000,pre(:,9),'ko-')
    %         % xlim([0 7]); ylim([0.65 1.1])
    %         % text(0.2,1.05,'Lono','FontSize',14); box on
    %     else
    %         if isempty(strfind(filenames{i},'A4')) == 0
    %             plot(pre(:,12)/12000,pre(:,9),'ro-')
    %             % xlim([0 7]); ylim([0.65 1.1])
    %         else
    %             plot(pre(:,12)/12000,pre(:,9),'bo-')
    %         end
    %     end
    %
    %     figure(7); hold on
    %     DQsubplot
    %     % plot recovery cumulative O2
    %     if isempty(strfind(filenames{i},'C')) == 0
    %         plot(pre(:,12)/12000,pre(:,10).*pre(:,34),'ko-')
    %         % xlim([0 7]); ylim([0.65 1.1])
    %         % text(0.2,1.05,'Lono','FontSize',14); box on
    %     else
    %         if isempty(strfind(filenames{i},'A4')) == 0
    %             plot(pre(:,12)/12000,pre(:,10).*pre(:,34),'ro-')
    %             % xlim([0 7]); ylim([0.65 1.1])
    %         else
    %             plot(pre(:,12)/12000,pre(:,10).*pre(:,34),'bo-')
    %         end
    %     end
    %
    %     figure(8); hold on
    %     DQsubplot
    %     % plot recovery cumulative CO2
    %     if isempty(strfind(filenames{i},'C')) == 0
    %         plot(pre(:,12)/12000,pre(:,11).*pre(:,34),'ko-')
    %         % xlim([0 7]); ylim([0.65 1.1])
    %         % text(0.2,1.05,'Lono','FontSize',14); box on
    %     else
    %         if isempty(strfind(filenames{i},'A4')) == 0
    %             plot(pre(:,12)/12000,pre(:,11).*pre(:,34),'ro-')
    %             % xlim([0 7]); ylim([0.65 1.1])
    %         else
    %             plot(pre(:,12)/12000,pre(:,11).*pre(:,34),'bo-')
    %         end
    %     end
    
    % plot instantaneous O2
    figure(19), hold on
    if isempty(strfind(filenames{i},'C')) == 0
        plot(pre(2:end,12)/12000,pre(2:end,20).*pre(2:end,34),'o:','color',[0.35 0.35 0.35])
        plot((post(2:end,12)/12000)+15,post(2:end,20).*post(2:end,34),'o:','color',[0.35 0.35 0.35])
        % xlim([0 7]); ylim([0.65 1.1])
        % text(0.2,1.05,'Lono','FontSize',14); box on
    else
        if isempty(strfind(filenames{i},'A4')) == 0
            plot(pre(2:end,12)/12000,pre(2:end,20).*pre(2:end,34),'s:','color',[1 0.5 0.5])
            plot((post(2:end,12)/12000)+15,post(2:end,20).*post(2:end,34),'s:','color',[1 0.5 0.5])
            
            % xlim([0 7]); ylim([0.65 1.1])
        else
            plot(pre(2:end,12)/12000,pre(2:end,20).*pre(2:end,34),'^:','color',[0.5 0.5 1])
            plot((post(2:end,12)/12000)+15,post(2:end,20).*post(2:end,34),'^:','color',[0.5 0.5 1])
            
        end
    end
    
end     

%
% figure(4); title('Recovery RER')
% xlabel('Time (min)')
% ylabel('VCO_2/VO_2');
% adjustfigurefont
% cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
% print('NoBoat_RER','-dpng','-r100')
%
% figure(3); title('Recovery End-Tidal O_2')
% xlabel('Time (min)'); ylabel('End-Tidal O_2 (%)')
% print('NoBoat_ETO2','-dpng','-r100')
%
% figure(5); title('Recovery End-Tidal CO_2')
% xlabel('Time (min)'); ylabel('End-Tidal CO_2 (%)')
% print('NoBoat_ETCO2','-dpng','-r100')
%
% figure(6); title('Recovery Tidal Volume')
% xlabel('Time (min)'); ylabel('Tidal Volume (L)')
% print('NoBoat_ETV','-dpng','-r100')
%
% figure(7); title('Recovery Cumulative O_2')
% xlabel('Time (min)'); ylabel('Cumulative O_2 (L)')
% print('NoBoat_cumO2','-dpng','-r100')
%
% figure(8); title('Recovery Cumulative CO_2')
% xlabel('Time (min)'); ylabel('Cumulative CO_2 (L)')
% print('NoBoat_cumCO2','-dpng','-r100')

% subplot(221); title('Lono'); ylim([0.6 1.1])
% subplot(222); title('Nainoa'); ylim([0.6 1.1])
% subplot(223); title('Kolohe'); ylim([0.6 1.1])
% subplot(224); title('Liko'); ylim([0.6 1.1])

% cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
% print -dpng -r300 RERcurve_NoBoat

for i = 1:size(filenames,1)
    load(filenames{i});
%% compute averages per 30 s
ct = 0; % initial
tvec = [0 1]; % initial
clear mn 
for k = 1:ceil(max(pre(:,12)/12000))*2
    ii = iswithin(pre(:,12)/12000,tvec);
    mn(:,k) = mean(pre(find(ii),20).*pre(find(ii),34));
    tvec = tvec+1;
end

figure(19), hold on
% plot(pre(2:end,12)/12000,pre(2:end,20).*pre(2:end,34),'o-','color',[0.5 0.5 0.5])
h1 = plot(0.5:1:min(tvec),mn,'k^-','markerfacecolor','b');

%%
ct = 0; % initial
tvec = [0 1]; % initial
clear mnpost 
for k = 1:ceil(max(post(:,12)/12000))*2
    ii = iswithin(post(:,12)/12000,tvec);
    mnpost(:,k) = mean(post(find(ii),20).*post(find(ii),34));
    tvec = tvec+1;
end

% figure(20), hold on
% plot(post(2:end,12)/12000+10,post(2:end,20).*post(2:end,34),'o-','color',[0.5 0.5 0.5])
h2 = plot([0.5:1:min(tvec)]+15,mnpost,'k^-','markerfacecolor','b'); % make this the actual tag blue
 if isempty(strfind(filenames{i},'C')) == 0
     set(h1,'color','k','marker','o','markerfacecolor','k')
     set(h2,'color','k','marker','o','markerfacecolor','k')
      else
        if isempty(strfind(filenames{i},'A4')) == 0
            set(h1,'color','k','marker','s','markerfacecolor','r')
            set(h2,'color','k','marker','s','markerfacecolor','r') % but make this the actual red
        end
 end
 
 
 %% fit decay curve?
xdata = (post(2:end,12)/12000);
ydata = post(2:end,20).*post(2:end,34);

fun =  @(x,xdata)x(1)*exp(x(2)*xdata);
x0 = [10,-1];
[x,resnorm,residual,exitflag,output,lambda,jacobian] = lsqcurvefit(fun,x0,xdata,ydata);

% plot data
times = linspace(xdata(1),xdata(end));
figure(11), hold on
h1 = plot(xdata,ydata,'ko');
h2 = plot(times,fun(x,times),'k-','Linewidth',2);
if Cond(i) == 1
    set(h1,'color','b','marker','^')
    set(h2,'color','b')
else if Cond(i) == 5
        set(h1,'color','r','marker','s')
        set(h2,'color','r')
    end
end



%% t1/2 
fitted = fun(x,times); % fitted values
half = find(fitted < max(ydata)/2,1); % find first below half of max recovery VO2
if isempty(half) == 1
    thalf(i) = NaN;
else
thalf(i) = times(half);
end
end

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
xlabel('Time in Recovery (min)'), ylabel('Instantaneous VO2 (L/min)')
print -dpng InstVO2RecoveryFit_nonboat -r300


figure(19)
set(gcf,'Position',[87   289   852   384],'paperpositionmode','auto')
xlabel('Time (min)')
ylabel('Instantaneous VO2 (L/min)') 
text(0.7,7.25,'Pre-Exercise','FontSize',16)
text(9.5,7.25,'Swim','FontSize',16)
text(17,7.25,'Post-Exercise','FontSize',16)
xlim([0 23])
adjustfigurefont

print -dpng InstVO2_nonboat -r300


%% assess halftimes for condition and individual with ANOVA
% [p,t,stats] = anovan(thalf,{Ind,Cond},'varnames',{'Individual','Condition'});
% [nanmean(thalf) nanstd(thalf)]

% plot just one trial
figure(3), clf, hold on
plot(pre(2:end,12)/12000,pre(2:end,20).*pre(2:end,34),'s:','color',[1 0.5 0.5])
plot(post(2:end,12)/12000+15,post(2:end,20).*post(2:end,34),'s:','color',[1 0.5 0.5])
plot(0.5:1:10,mn,'rs-')
plot(times+15,fun(x,times),'r-','Linewidth',2);

set(gcf,'Position',[87   289   852   384],'paperpositionmode','auto')
xlabel('Time (min)')
ylabel('Instantaneous VO2 (L/min)') 
text(0.7,4.25,'Pre-Exercise','FontSize',16)
text(9.5,4.25,'Swim','FontSize',16)
text(17,4.25,'Post-Exercise','FontSize',16)
xlim([0 23]); ylim([0 5])
adjustfigurefont

print -dpng InstVO2_nonboat_Lono_276_A4 -r300 