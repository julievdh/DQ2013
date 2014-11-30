% load glide data
load('GlideData_Redo.mat')

% Moving average boxplots
% Figure 1: boxplot of drag coefficients by condition
% Moving average
figure(1)
subplot(131)
boxplot(mav(:,3),[mav(:,2) mav(:,1)])
text(1,0,num2str(sum(~isnan(mav(mav(:,2) == 1 & mav(:,1) == 0,1))))) 
text(2,0,num2str(sum(~isnan(mav(mav(:,2) == 1 & mav(:,1) == 1,1)))))
text(3,0,num2str(sum(~isnan(mav(mav(:,2) == 1 & mav(:,1) == 3,1)))))
text(4,0,num2str(sum(~isnan(mav(mav(:,2) == 2 & mav(:,1) == 0,1))))) 
text(5,0,num2str(sum(~isnan(mav(mav(:,2) == 2 & mav(:,1) == 1,1)))))
text(6,0,num2str(sum(~isnan(mav(mav(:,2) == 2 & mav(:,1) == 3,1)))))
text(7,0,num2str(sum(~isnan(mav(mav(:,2) == 2 & mav(:,1) == 5,1)))))
ylabel('C_d'); title('Point 1')
set(gca,'Ylim',[-0.0065 0.2944])

subplot(132)
boxplot(mav(:,4),[mav(:,2) mav(:,1)])
text(1,0,num2str(sum(~isnan(mav(mav(:,2) == 1 & mav(:,1) == 0,1))))) 
text(2,0,num2str(sum(~isnan(mav(mav(:,2) == 1 & mav(:,1) == 1,1)))))
text(3,0,num2str(sum(~isnan(mav(mav(:,2) == 1 & mav(:,1) == 3,1)))))
text(4,0,num2str(sum(~isnan(mav(mav(:,2) == 2 & mav(:,1) == 0,1))))) 
text(5,0,num2str(sum(~isnan(mav(mav(:,2) == 2 & mav(:,1) == 1,1)))))
text(6,0,num2str(sum(~isnan(mav(mav(:,2) == 2 & mav(:,1) == 3,1)))))
text(7,0,num2str(sum(~isnan(mav(mav(:,2) == 2 & mav(:,1) == 5,1)))))
title('Point 2')
set(gca,'Ylim',[-0.0065 0.2944])

% average
subplot(133)
mav(:,5) = mean([mav(:,3) mav(:,4)]');
boxplot(mav(:,5),[mav(:,2) mav(:,1)])
text(1,0,num2str(sum(~isnan(mav(mav(:,2) == 1 & mav(:,1) == 0,1))))) 
text(2,0,num2str(sum(~isnan(mav(mav(:,2) == 1 & mav(:,1) == 1,1)))))
text(3,0,num2str(sum(~isnan(mav(mav(:,2) == 1 & mav(:,1) == 3,1)))))
text(4,0,num2str(sum(~isnan(mav(mav(:,2) == 2 & mav(:,1) == 0,1))))) 
text(5,0,num2str(sum(~isnan(mav(mav(:,2) == 2 & mav(:,1) == 1,1)))))
text(6,0,num2str(sum(~isnan(mav(mav(:,2) == 2 & mav(:,1) == 3,1)))))
text(7,0,num2str(sum(~isnan(mav(mav(:,2) == 2 & mav(:,1) == 5,1)))))
title('Average of 2 Points')
set(gca,'Ylim',[-0.0065 0.2944])


% pool individuals
figure(2)
boxplot(mav(:,5),mav(:,1))
text(1,0,num2str(sum(mav(:,1) == 0))) 
text(2,0,num2str(sum(mav(:,1) == 1)))
text(3,0,num2str(sum(mav(:,1) == 3)))
text(4,0,num2str(sum(mav(:,1) == 5)))
ylabel('Drag Coefficient')
set(gca,'Xticklabel',{'No Tag','Tag','Tag + 2','Tag + 4'})
adjustfigurefont


