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
for i = 1:size(filenames,1)
    load(filenames{i});
    
    
    figure(3); hold on
    DQsubplot
    
    % plot recovery end-tidal O2
    if isempty(strfind(filenames{i},'C')) == 0
        plot(pre(:,12)/12000,pre(:,5),'ko-')
        % xlim([0 7]); ylim([0.65 1.1])
        % text(0.2,1.05,'Lono','FontSize',14); box on
    else
        if isempty(strfind(filenames{i},'A4')) == 0
            plot(pre(:,12)/12000,pre(:,5),'ro-')
            % xlim([0 7]); ylim([0.65 1.1])
        else
            plot(pre(:,12)/12000,pre(:,5),'bo-')
        end
    end
    
    figure(4); hold on
    DQsubplot
    if isempty(strfind(filenames{i},'C')) == 0
        plot(post(:,12)/12000,post(:,11)./post(:,10),'ko-')
        % xlim([0 7]); ylim([0.65 1.1])
        % text(0.2,1.05,'Lono','FontSize',14); box on
    else
        if isempty(strfind(filenames{i},'A4')) == 0
            plot(post(:,12)/12000,post(:,11)./post(:,10),'ro-')
            % xlim([0 7]); ylim([0.65 1.1])
        else
            plot(post(:,12)/12000,post(:,11)./post(:,10),'bo-')
        end
    end
    
    figure(5); hold on
    DQsubplot
    % plot recovery end-tidal CO2
    if isempty(strfind(filenames{i},'C')) == 0
        plot(pre(:,12)/12000,pre(:,6),'ko-')
        % xlim([0 7]); ylim([0.65 1.1])
        % text(0.2,1.05,'Lono','FontSize',14); box on
    else
        if isempty(strfind(filenames{i},'A4')) == 0
            plot(pre(:,12)/12000,pre(:,6),'ro-')
            % xlim([0 7]); ylim([0.65 1.1])
        else
            plot(pre(:,12)/12000,pre(:,6),'bo-')
        end
    end
    
    figure(6); hold on
    DQsubplot
    % plot recovery tidal volume
    if isempty(strfind(filenames{i},'C')) == 0
        plot(pre(:,12)/12000,pre(:,9),'ko-')
        % xlim([0 7]); ylim([0.65 1.1])
        % text(0.2,1.05,'Lono','FontSize',14); box on
    else
        if isempty(strfind(filenames{i},'A4')) == 0
            plot(pre(:,12)/12000,pre(:,9),'ro-')
            % xlim([0 7]); ylim([0.65 1.1])
        else
            plot(pre(:,12)/12000,pre(:,9),'bo-')
        end
    end
    
    figure(7); hold on
    DQsubplot
    % plot recovery cumulative O2
    if isempty(strfind(filenames{i},'C')) == 0
        plot(pre(:,12)/12000,pre(:,10).*pre(:,34),'ko-')
        % xlim([0 7]); ylim([0.65 1.1])
        % text(0.2,1.05,'Lono','FontSize',14); box on
    else
        if isempty(strfind(filenames{i},'A4')) == 0
            plot(pre(:,12)/12000,pre(:,10).*pre(:,34),'ro-')
            % xlim([0 7]); ylim([0.65 1.1])
        else
            plot(pre(:,12)/12000,pre(:,10).*pre(:,34),'bo-')
        end
    end
    
    figure(8); hold on
    DQsubplot
    % plot recovery cumulative CO2
    if isempty(strfind(filenames{i},'C')) == 0
        plot(pre(:,12)/12000,pre(:,11).*pre(:,34),'ko-')
        % xlim([0 7]); ylim([0.65 1.1])
        % text(0.2,1.05,'Lono','FontSize',14); box on
    else
        if isempty(strfind(filenames{i},'A4')) == 0
            plot(pre(:,12)/12000,pre(:,11).*pre(:,34),'ro-')
            % xlim([0 7]); ylim([0.65 1.1])
        else
            plot(pre(:,12)/12000,pre(:,11).*pre(:,34),'bo-')
        end
    end
    
end

figure(4); title('Recovery RER')
xlabel('Time (min)')
ylabel('VCO_2/VO_2');
adjustfigurefont
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('NoBoat_RER','-dpng','-r100')

figure(3); title('Recovery End-Tidal O_2')
xlabel('Time (min)'); ylabel('End-Tidal O_2 (%)')
print('NoBoat_ETO2','-dpng','-r100')

figure(5); title('Recovery End-Tidal CO_2')
xlabel('Time (min)'); ylabel('End-Tidal CO_2 (%)')
print('NoBoat_ETCO2','-dpng','-r100')

figure(6); title('Recovery Tidal Volume')
xlabel('Time (min)'); ylabel('Tidal Volume (L)')
print('NoBoat_ETV','-dpng','-r100')

figure(7); title('Recovery Cumulative O_2')
xlabel('Time (min)'); ylabel('Cumulative O_2 (L)')
print('NoBoat_cumO2','-dpng','-r100')

figure(8); title('Recovery Cumulative CO_2')
xlabel('Time (min)'); ylabel('Cumulative CO_2 (L)')
print('NoBoat_cumCO2','-dpng','-r100')

% subplot(221); title('Lono'); ylim([0.6 1.1])
% subplot(222); title('Nainoa'); ylim([0.6 1.1])
% subplot(223); title('Kolohe'); ylim([0.6 1.1])
% subplot(224); title('Liko'); ylim([0.6 1.1])

% cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
% print -dpng -r300 RERcurve_NoBoat
