% instantaneous recovery rates
% fit exponential to recovery curve -- are they different

clear all; close all

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/Boat
filenames = {'Lono_288_C';'Lono_285_A';'Lono_287_A2';'Nainoa_285_C';...
    'Nainoa_284_A';'Nainoa_287_A2'};
for i = 1:size(filenames,1)
    load(filenames{i});
    
%     figure(3); hold on
%     % plot recovery end-tidal CO2
%     if isempty(strfind(filenames{i},'Lono')) == 0
%         subplot(211); hold on; title('Lono')
%     else if isempty(strfind(filenames{i},'Nainoa')) == 0
%             subplot(212); hold on; title('Nainoa')
%         end
%     end
%     if isempty(strfind(filenames{i},'C')) == 0
%         plot(post(:,12)/12000,post(:,5),'ko-')
%         % xlim([0 7]); ylim([0.65 1.1])
%         % text(0.2,1.05,'Lono','FontSize',14); box on
%     else
%         if isempty(strfind(filenames{i},'A2')) == 0
%             plot(post(:,12)/12000,post(:,5),'d-','color',[26/255 150/255 65/255])
%             % xlim([0 7]); ylim([0.65 1.1])
%         else
%             plot(post(:,12)/12000,post(:,5),'^-','color',[5/255 113/255 222/255])
%         end
%     end
%     
%     figure(4); hold on
%     if isempty(strfind(filenames{i},'Lono')) == 0
%         subplot(211); hold on; title('Lono')
%     else if isempty(strfind(filenames{i},'Nainoa')) == 0
%             subplot(212); hold on; title('Nainoa')
%         end
%     end
%     
%     h1 = plot(pre(:,12)/12000,pre(:,11)./pre(:,10),'b--');
%     h2 = plot(post(:,12)/12000,post(:,11)./post(:,10),'^-','color',[5/255 113/255 222/255]);
%     xlim([0 7]); ylim([0.65 1.1])
%     
%     if isempty(strfind(filenames{i},'C')) == 0
%         set(h1,'color','k'); set(h2,'color','k')
%     else
%         if isempty(strfind(filenames{i},'A2')) == 0
%             set(h1,'color','r'); set(h2,'color','r')
%         end
%     end
%     
    figure(5); hold on
    % plot recovery end-tidal CO2
    if isempty(strfind(filenames{i},'Lono')) == 0
        subplot(211); hold on; title('Lono')
    else if isempty(strfind(filenames{i},'Nainoa')) == 0
            subplot(212); hold on; title('Nainoa')
        end
    end
    if isempty(strfind(filenames{i},'C')) == 0
        plot(post(:,12)/12000,post(:,6),'ko-')
        % xlim([0 7]); ylim([0.65 1.1])
        % text(0.2,1.05,'Lono','FontSize',14); box on
    else
        if isempty(strfind(filenames{i},'A2')) == 0
            plot(post(:,12)/12000,post(:,6),'d-','color',[26/255 150/255 65/255])
            % xlim([0 7]); ylim([0.65 1.1])
        else
            plot(post(:,12)/12000,post(:,6),'^-','color',[5/255 113/255 222/255])
        end
    end
%     
%     figure(6); hold on
%     if isempty(strfind(filenames{i},'Lono')) == 0
%         subplot(211); hold on; title('Lono')
%     else if isempty(strfind(filenames{i},'Nainoa')) == 0
%             subplot(212); hold on; title('Nainoa')
%         end
%     end
%     % plot recovery tidal volume
%     if isempty(strfind(filenames{i},'C')) == 0
%         plot(post(:,12)/12000,post(:,9),'ko-')
%         % xlim([0 7]); ylim([0.65 1.1])
%         % text(0.2,1.05,'Lono','FontSize',14); box on
%     else
%         if isempty(strfind(filenames{i},'A2')) == 0
%             plot(post(:,12)/12000,post(:,9),'d-','color',[26/255 150/255 65/255])
%             % xlim([0 7]); ylim([0.65 1.1])
%         else
%             plot(post(:,12)/12000,post(:,9),'^-','color',[5/255 113/255 222/255])
%         end
%     end
%     
%     figure(7); hold on
%     if isempty(strfind(filenames{i},'Lono')) == 0
%         subplot(211); hold on; title('Lono')
%     else if isempty(strfind(filenames{i},'Nainoa')) == 0
%             subplot(212); hold on; title('Nainoa')
%         end
%     end
%     % plot recovery cumulative O2
%     if isempty(strfind(filenames{i},'C')) == 0
%         plot(post(:,12)/12000,post(:,10).*post(:,34),'ko-')
%         % xlim([0 7]); ylim([0.65 1.1])
%         % text(0.2,1.05,'Lono','FontSize',14); box on
%     else
%         if isempty(strfind(filenames{i},'A2')) == 0
%             plot(post(:,12)/12000,post(:,10).*post(:,34),'d-','color',[26/255 150/255 65/255])
%             % xlim([0 7]); ylim([0.65 1.1])
%         else
%             plot(post(:,12)/12000,post(:,10).*post(:,34),'^-','color',[5/255 113/255 222/255])
%         end
%     end
%     
%     figure(8); hold on
%     if isempty(strfind(filenames{i},'Lono')) == 0
%         subplot(211); hold on; title('Lono')
%     else if isempty(strfind(filenames{i},'Nainoa')) == 0
%             subplot(212); hold on; title('Nainoa')
%         end
%     end
%     % plot recovery cumulative CO2
%     if isempty(strfind(filenames{i},'C')) == 0
%         plot(post(:,12)/12000,post(:,11).*post(:,34),'ko-')
%         % xlim([0 7]); ylim([0.65 1.1])
%         % text(0.2,1.05,'Lono','FontSize',14); box on
%     else
%         if isempty(strfind(filenames{i},'A2')) == 0
%             plot(post(:,12)/12000,post(:,11).*post(:,34),'d-','color',[26/255 150/255 65/255])
%             % xlim([0 7]); ylim([0.65 1.1])
%         else
%             plot(post(:,12)/12000,post(:,11).*post(:,34),'^-','color',[5/255 113/255 222/255])
%         end
%     end
%     
%     figure(9); hold on
%     if isempty(strfind(filenames{i},'Lono')) == 0
%         subplot(211); hold on; title('Lono')
%     else if isempty(strfind(filenames{i},'Nainoa')) == 0
%             subplot(212); hold on; title('Nainoa')
%         end
%     end
%     % plot recovery instantaneous O2
%     if isempty(strfind(filenames{i},'C')) == 0
%         plot(post(:,12)/12000,post(:,20).*post(:,34),'ko-')
%         % xlim([0 7]); ylim([0.65 1.1])
%         % text(0.2,1.05,'Lono','FontSize',14); box on
%     else
%         if isempty(strfind(filenames{i},'A2')) == 0
%             plot(post(:,12)/12000,post(:,20).*post(:,34),'d-','color',[26/255 150/255 65/255])
%             % xlim([0 7]); ylim([0.65 1.1])
%         else
%             plot(post(:,12)/12000,post(:,20).*post(:,34),'^-','color',[5/255 113/255 222/255])
%         end
%     end
%     
%     figure(10); hold on
%     if isempty(strfind(filenames{i},'Lono')) == 0
%         subplot(211); hold on; title('Lono')
%     else if isempty(strfind(filenames{i},'Nainoa')) == 0
%             subplot(212); hold on; title('Nainoa')
%         end
%     end
%     % plot recovery instantaneous CO2
%     if isempty(strfind(filenames{i},'C')) == 0
%         plot(post(:,12)/12000,post(:,21).*post(:,34),'ko-')
%         % xlim([0 7]); ylim([0.65 1.1])
%         % text(0.2,1.05,'Lono','FontSize',14); box on
%     else
%         if isempty(strfind(filenames{i},'A2')) == 0
%             plot(post(:,12)/12000,post(:,21).*post(:,34),'d-','color',[26/255 150/255 65/255])
%             % xlim([0 7]); ylim([0.65 1.1])
%         else
%             plot(post(:,12)/12000,post(:,21).*post(:,34),'^-','color',[5/255 113/255 222/255])
%         end
%     end
end
% 
% 
% % figure(2)
% % xlabel('Time (min)')
% % suplabel('Corrected Rate of O_2 Consumption (L/min)','y');
% % adjustfigurefont
% % legend('C','A','A2')
% 
% 
% % figure(3)
% % xlabel('Time (min)')
% % suplabel('Corrected Cumulative O_2 Consumption (L/min)','y');
% % adjustfigurefont
% % legend('C','A','A2')
% 
% figure(3); title('Recovery End-Tidal O_2')
% xlabel('Time (min)'); ylabel('End-Tidal O_2 (%)')
% print('Boat_ETO2','-dpng','-r100')
% 
% figure(4)
% xlabel('Time (min)')
% suplabel('VCO_2/VO_2','y');
% adjustfigurefont
% cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
% print('Boat_RER','-dpng','-r100')
% 
figure(5); title('Recovery End-Tidal CO_2')
xlabel('Time (min)'); ylabel('End-Tidal CO_2 (%)')
print('Boat_ETCO2','-dpng','-r100')
% 
% figure(6); title('Recovery Tidal Volume')
% xlabel('Time (min)'); ylabel('Tidal Volume (L)')
% print('Boat_TV','-dpng','-r100')
% 
% figure(7); title('Recovery Cumulative O_2')
% xlabel('Time (min)'); ylabel('Cumulative O_2 (L)')
% print('Boat_cumO2','-dpng','-r100')
% 
% figure(8); title('Recovery Cumulative CO_2')
% xlabel('Time (min)'); ylabel('Cumulative CO_2 (L)')
% print('Boat_cumCO2','-dpng','-r100')
% 
% figure(9); title('Recovery Instantaneous O_2')
% xlabel('Time (min)'); ylabel('O_2 (L)')
% print('Boat_IO2','-dpng','-r100')
% 
% figure(10); title('Recovery Instantaneous CO_2')
% xlabel('Time (min)'); ylabel('CO_2 (L)')
% print('Boat_ICO2','-dpng','-r100')
% 
% % subplot(211); title('Lono')
% % subplot(212); title('Nainoa')
% 
% % cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
% % print -dpng -r300 RERcurve_Boat
% 

%% plot VO2 vs VCO2


for i = 1:size(filenames,1)
    load(filenames{i});
    
    VO2 = post(:,20).*post(:,34);
    VCO2 = post(:,21).*post(:,34);
    % calculate minute volume - tidal volume * respiratory rate
    minvol = -post(:,9).*(1./diff([0 ;post(:,12)/12000]));
    
    
    figure(20);
    % plot VO2 vs VCO2
    if isempty(strfind(filenames{i},'Lono')) == 0
        subplot(211); hold on; title('Lono')
        plot([0 4],[0 4],'k:')
    else if isempty(strfind(filenames{i},'Nainoa')) == 0
            subplot(212); hold on; title('Nainoa')
            plot([0 4],[0 4],'k:')
        end
    end
    if isempty(strfind(filenames{i},'C')) == 0
        plot(VO2,VCO2,'ko')
        % xlim([0 7]); ylim([0.65 1.1])
        % text(0.2,1.05,'Lono','FontSize',14); box on
    else
        if isempty(strfind(filenames{i},'A2')) == 0
            plot(VO2,VCO2,'d','color',[26/255 150/255 65/255])
            % xlim([0 7]); ylim([0.65 1.1])
        else
            plot(VO2,VCO2,'^','color',[5/255 113/255 222/255])
        end
    end
    
    figure(21); 
    % plot VCO2 vs minvol
    if isempty(strfind(filenames{i},'Lono')) == 0
        subplot(211); hold on; title('Lono')
    else if isempty(strfind(filenames{i},'Nainoa')) == 0
            subplot(212); hold on; title('Nainoa')
        end
    end
    if isempty(strfind(filenames{i},'C')) == 0
        plot(VO2,minvol,'ko')
        % xlim([0 7]); ylim([0.65 1.1])
        % text(0.2,1.05,'Lono','FontSize',14); box on
    else
        if isempty(strfind(filenames{i},'A2')) == 0
            plot(VO2,minvol,'d','color',[26/255 150/255 65/255])
            % xlim([0 7]); ylim([0.65 1.1])
        else
            plot(VO2,minvol,'^','color',[5/255 113/255 222/255])
        end
    end
    
end
figure(20); xlabel('VO2'); ylabel('VCO2')
figure(21); xlabel('VCO2'); ylabel('VE')