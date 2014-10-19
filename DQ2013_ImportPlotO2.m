% Import, plot resp data
% set directory
cd('/Volumes/moorelab/NOPP_CUP_STUDY/DQ2013/Fahlman Analyses/DQ-Sept-2013/Analyzed data/results/Corrected raw data')
clear all;

filename = 'Kolohe13_268_A+4-post-RAW_DATA.txt';

% import data
import_CORRECTEDRAW(filename)


% create column headers from string
str = textdata{2,1};
delim = regexp(str,', ','split');
titlesplit = regexp(filename,'-','split');
titlesplit(1) = regexprep(titlesplit(1),'_','-');
% 
% % plot O2 %, cumulative O2 (L) with time
% figure(1); set(gca,'FontSize',14)
% plot(data(:,1),data(:,8),'r')
% hold on
% plot(data(:,1),data(:,6))
% xlabel('Time (s)','FontSize',14)
% ylabel('O_2 % (blue); Cumulative L O_2 (red)','FontSize',14)
% title(titlesplit(1),'FontSize',14)
% ylim([0 22]); xlim([data(1,1) data(end,1)])


VO2 = (data(end,8) - data(1,8))/((data(end,1) - data(1,1))*(1/60)); % L/min

% % plot vertical lines at minute intervals (in seconds)
% line([data(1,1) data(1,1)],[0 22],'color','k','linewidth',2)
% line([data(1,1)+60 data(1,1)+60],[0 22],'color','k','linewidth',2)
% line([data(1,1)+120 data(1,1)+120],[0 22],'color','k','linewidth',2)
% line([data(1,1)+180 data(1,1)+180],[0 22],'color','k','linewidth',2)
% line([data(1,1)+240 data(1,1)+240],[0 22],'color','k','linewidth',2)
% line([data(1,1)+300 data(1,1)+300],[0 22],'color','k','linewidth',2)
% 

% plot 5-minute recovery cumulative O2 curve
figure(2)
set(gca,'Fontsize',14)
plot(data(1:60000,8),'r','linewidth',2); hold on
xlabel('Sample number','Fontsize',14); ylabel('Cumulative L O_2','Fontsize',14)

