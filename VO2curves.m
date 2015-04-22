% instantaneous recovery rates
% fit exponential to recovery curve -- are they different

clear all; close all

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/Boat
filenames = {'Lono_288_C';'Lono_285_A';'Lono_287_A2';'Nainoa_285_C';...
    'Nainoa_284_A';'Nainoa_287_A2'};
for i = 1:6
    load(filenames{i});
    
    % fit exponential to MR decline
    figure(2); hold on;
    f = fit(post(:,12)/12000,post(:,20),'poly2');
    if i <=3
        subplot(211); hold on; 
        % plot(f,post(:,12)/12000,post(:,20))
        plot(post(:,12)/12000,post(:,20))
        xlim([0 7])
        text(0.36,13.3,'Lono','FontSize',14); box on
    else
        subplot(212); hold on; 
        % plot(f,post(:,12)/12000,post(:,20))
        plot(post(:,12)/12000,post(:,20))
        text(0.36,3.5,'Nainoa','FontSize',14); box on
    end
    
    vals(i,:) = coeffvalues(f);
    
    % calculate correction factor
    corrfact = post(1,20)./post(1,19);
    
    % fit curve to Cumulative O2 consumption
    f2 = fit(post(:,12)/12000,post(:,10)*corrfact,'poly2');
    figure(3); hold on
    if i <= 3
        subplot(211); hold on
        % plot(f2,post(:,12)/12000,post(:,10)*corrfact)
        plot(post(:,12)/12000,post(:,10)*corrfact,'.-')
        xlim([0 7])
        text(0.2,7,'Lono','FontSize',14); box on
    else
        subplot(212); hold on
        % plot(f2,post(:,12)/12000,post(:,10)*corrfact)
        plot(post(:,12)/12000,post(:,10)*corrfact,'.-')
        text(0.2,5.5,'Nainoa','FontSize',14); box on
    end
    
    vals2(i,:) = coeffvalues(f2);
    
    figure(4); hold on
    if i <= 3
        subplot(211); hold on
       
        plot(post(:,12)/12000,post(:,11)./post(:,10),'.-')
        xlim([0 7]); ylim([0.65 1.1])
        text(0.2,1.05,'Lono','FontSize',14); box on
    else
        subplot(212); hold on

        plot(post(:,12)/12000,post(:,11)./post(:,10),'.-')
        xlim([0 7]); ylim([0.65 1.1])
        text(0.2,1.05,'Nainoa','FontSize',14); box on
    end
    
end

figure(2)
xlabel('Time (min)')
suplabel('Corrected Rate of O_2 Consumption (L/min)','y');
adjustfigurefont
legend('C','A','A2')



figure(3)
xlabel('Time (min)')
suplabel('Corrected Cumulative O_2 Consumption (L/min)','y');
adjustfigurefont
legend('C','A','A2')


figure(4)
xlabel('Time (min)')
suplabel('VCO_2/VO_2','y');
adjustfigurefont
legend('C','A','A2')
