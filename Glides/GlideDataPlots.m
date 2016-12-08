% Glide Cd Method Figure
warning off; close all; clear all

% load glide data
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/Glides
load('GlideStructure')
load('Glide_NewData')

% % plot Cd vs. Re from Video Only glide data
% figure(1); clf; hold on
% set(gcf,'position',[1417 276 933 384])
% subplot('position',[0.1 0.1 0.38 0.8]);
% for file = 1:45
%     h1 = loglog(glide(file).Re,mean(glide(file).Cd_mn),'o'); hold on
%     if glide(file).condition == 0
%         set(h1,'MarkerEdgeColor','k','MarkerFaceColor','k')
%     else if glide(file).condition == 1
%             set(h1,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255])
%         else if glide(file).condition == 3
%                 set(h1,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerFaceColor',[77/255 175/255 74/255])
%             else set(h1,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerFaceColor',[228/255 26/255 28/255])
%             end
%         end
%     end
%     %     if mav(i,2) == 2
%     %         set(h1,'MarkerFaceColor','none')
%     %     end
% end
%
% %%
% for file = 1:45
%     h2 = plot(glide(file).Re,glide(file).CDAS,'o');
%     if glide(file).condition == 0
%         set(h2,'MarkerEdgeColor','k')
%     else if glide(file).condition == 1
%             set(h2,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255])
%         else if glide(file).condition == 3
%                 set(h2,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255])
%             else set(h2,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255])
%             end
%         end
%     end
% end
%
% xlabel('Reynolds Number, \it{Re}'); ylabel('Drag Coefficient, \it{C_d}')
% xlim([8E5 5E6]); ylim([3E-3 1E0])
% text(8.4E5,0.75,'A','FontSize',18,'FontWeight','bold')
% set(gca,'fontsize',14)
%
% %% plot panel B
% figure; hold on
% %subplot('position',[0.55 0.1 0.38 0.8]); hold on
% c = linspace(1,10,length(glide));
% for file = 1:45
%     % velocity threshold?
%     h = scatter(mean(glide(file).Cd_mn),glide(file).CDAS,60,glide(file).sspeed,'filled');
%     if glide(file).condition == 1
%         set(h,'marker','^')
%     else if glide(file).condition == 3
%             set(h,'marker','d')
%         else if glide(file).condition == 5
%                 set(h,'marker','s')
%             end
%         end
%     end
% end
% plot([0 0.32],[0 0.32],'k')
% xlabel('Time-Varying Method'); ylabel('Velocity Fit Method');
% hcb = colorbar; title(hcb,'Glide Start Speed (m/s)')
% box on
% xlim([0 0.32]); ylim([0 0.32])
% % text(0.01,0.3,'B','FontSize',18,'FontWeight','bold')
% adjustfigurefont
%
% set(gcf,'paperpositionmode','auto')
% print('GlideMethodComparison','-dsvg','-r300')
%
% %% least squares fit?
% for i = 1:45
% CDAS(i) = glide(i).CDAS;
% Cd_mn(i) = nanmean(glide(i).Cd_mn);
% end
%
% % b1 = Cd_mn/CDAS; % get slope
% % yCalc1 = b1*Cd_mn; % get Ydata fit
% % plot(Cd_mn,yCalc1,'k--')
% %
% % X = [ones(length(Cd_mn),1) Cd_mn'];
% % b = X\CDAS'; % fit with intercept
% % yCalc2 = X*b;
% % plot(Cd_mn,yCalc2,'k:')
% %
% % % GOF
% % Rsq1 = 1 - sum((CDAS - yCalc1).^2)/sum((CDAS - mean(CDAS)).^2); % fit with just slope
% % Rsq2 = 1 - sum((CDAS' - yCalc2).^2)/sum((CDAS - mean(CDAS)).^2) % fit with slope and intercept
% Rsq3 = 1 - sum((CDAS - Cd_mn).^2)/sum((CDAS - mean(CDAS)).^2) % fit 1:1 line
%
%
% %% DATA FROM FISH (TEST)
% load('Data_Readmatv6')
% figure(3); clf
% set(gcf,'position',[432   289   933   384])
% subplot('position',[0.1 0.1 0.38 0.8]);
% loglog(Fish(:,1),Fish(:,2),'.-','color',[214/255 2/255 101/255],'markersize',15); hold on
% loglog(Fish(:,3),Fish(:,4),'.-','color',[214/255 2/255 101/255],'markersize',15)
% loglog(Fish(:,5),Fish(:,6),'.','color',[214/255 2/255 101/255],'markersize',15)
% loglog(Fish(:,9),Fish(:,10),'.','color',[35/255 235/255 205/255],'markersize',15)
% loglog(Fish(:,7),Fish(:,8),'.-','color',[255/255 227/255 71/255],'markersize',15)
% loglog(Fish(:,11),Fish(:,12),'.-','color',[251/255 139/255 36/255],'markersize',15)
% loglog(Fish(:,13),Fish(:,14),'.-','color',[251/255 139/255 36/255],'markersize',15)
% loglog(Fish(:,15),Fish(:,16),'.-','color',[251/255 139/255 36/255],'markersize',15)
% loglog(Fish(:,17),Fish(:,18),'.-','color',[251/255 139/255 36/255],'markersize',15)
% loglog(Fish(:,19),Fish(:,20),'.','color',[251/255 139/255 36/255],'markersize',15)
% % Lang Daybell Drag Collar work
% % colours are increasing drag
% loglog(repmat(LangDaybell(1,2),3,1),LangDaybell(1,3:5),'.','markersize',15,'color',[120/255 205/255 69/255])
% loglog(repmat(LangDaybell(2,2),3,1),LangDaybell(2,3:5),'.','markersize',15,'color',[43/255 168/255 73/255])
% loglog(repmat(LangDaybell(3,2),3,1),LangDaybell(3,3:5),'.','markersize',15,'color',[36/255 130/255 50/255])
% loglog(repmat(LangDaybell(4,2),3,1),LangDaybell(4,3:5),'.','markersize',15,'color',[0/255 88/255 29/255])
% % Noren Pregnancy 2011
% loglog(Noren2011(1,1),Noren2011(1,2),'.','color',[0/255 48/255 73/255],'markersize',15) % 18 months post parturition
% loglog(Noren2011(2:3,1),[Noren2011(1,2) Noren2011(1,2)],'color',[0/255 48/255 73/255])
% loglog([Noren2011(1,1) Noren2011(1,1)],Noren2011(2:3,2),'color',[0/255 48/255 73/255])
% loglog(Noren2011(1,3),Noren2011(1,4),'.','color',[39/255 152/255 183/255],'markersize',15) % pregnant
% loglog(Noren2011(2:3,3),[Noren2011(1,4) Noren2011(1,4)],'color',[39/255 152/255 183/255])
% loglog([Noren2011(1,3) Noren2011(1,3)],Noren2011(2:3,4),'color',[39/255 152/255 183/255])
% % Hanson 2001 Porpoise Tags
% loglog(Hanson(:,1),Hanson(:,2),'.-','markersize',15,'color',[151/255 132/255 216/255]) % porpoise model
% loglog(Hanson(:,1),Hanson(:,3),'.-','markersize',15,'color',[83/255 53/255 113/255]) % tags
% loglog(Hanson(:,1),Hanson(:,4),'.-','markersize',15,'color',[83/255 53/255 113/255])
% loglog(Hanson(:,1),Hanson(:,5),'.-','markersize',15,'color',[83/255 53/255 113/255])
% loglog(Hanson(:,1),Hanson(:,6),'.-','markersize',15,'color',[83/255 53/255 113/255])
% loglog(Hanson(:,1),Hanson(:,7),'.-','markersize',15,'color',[83/255 53/255 113/255])
% loglog(Hanson(:,1),Hanson(:,8),'.-','markersize',15,'color',[83/255 53/255 113/255])
% % Add Theoretical Flat Plates
% Re = 1E5:100:1E8;
% CdL = 1.33*Re.^(-0.5);
% CdT = 0.072*Re.^(-0.2);
% plot(Re,CdL,'k--',Re,CdT,'k')
% text(3.8E5,0.9,'A','FontSize',20,'FontWeight','Bold')
%
% ylim([1E-3 1.5])
% xlim([3E5 5E7])
% xlabel('Reynolds Number, Re'); ylabel('Drag Coefficient, C_d')
% set(gca,'fontsize',14)
% %% add our data
% % video only data
% subplot('position',[0.55 0.1 0.38 0.8])
% for file = 1:45
%     h1 = loglog(glide(file).Re,mean(glide(file).Cd_mn),'o'); hold on
%     h2 = loglog(glide(file).Re,glide(file).CDAS,'o');
%     if glide(file).condition == 0
%         set(h1,'MarkerEdgeColor','k','MarkerFaceColor','k')
%         set(h2,'MarkerEdgeColor','k')
%     else if glide(file).condition == 1
%             set(h1,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255])
%             set(h2,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255])
%         else if glide(file).condition == 3
%                 set(h1,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerFaceColor',[77/255 175/255 74/255])
%                 set(h2,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255])
%             else set(h1,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerFaceColor',[228/255 26/255 28/255])
%                 set(h2,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255])
%             end
%         end
%     end
% end
%
% xlabel('Reynolds Number, Re');
% adjustfigurefont
% ylim([1E-3 1.5])
% plot(Re,CdL,'k--',Re,CdT,'k')
%
%% add CFD data
CFD = load('DolphinTagSims_24Feb16');

% calculate Re
L = 2.6; % length ASSUMTION - NEED DATA FROM SHORTER
v = 1.05E-6; % kinematic viscosity
CFD_Re = (L*CFD.vel)./v;

% calculate Cd of dolphin only
rho = 1021; % seawater density
A = 2.3; % area
CFD_Cd_notag = (2*CFD.notag')./(rho*A.*CFD.vel.^2);
CFD_Cd_tag = (2*sum(CFD.tag'))./(rho*(A+0.024).*CFD.vel.^2);
CFD_Cd_tag2 = (2*sum(CFD.tag2'))./(rho*(A+0.045).*CFD.vel.^2);
CFD_Cd_tag4 = (2*sum(CFD.tag4'))./(rho*(A+0.066).*CFD.vel.^2);
%
% loglog(CFD_Re,CFD_Cd_notag,'color','k') % make these colours the same as the tag conditions
% loglog(CFD_Re,CFD_Cd_tag,'color',[55/255 126/255 184/255])
% loglog(CFD_Re,CFD_Cd_tag4,'color',[77/255 175/255 74/255])
% text(3.8E5,0.9,'B','FontSize',20,'FontWeight','Bold')
% set(gcf,'paperpositionmode','auto')
% xlim([3E5 5E7])
% set(gca,'fontsize',14)
% print('AllCdData','-dpng','-r300')
%
% %% plot velocities and durations of glides
% figure(4); clf; hold on
% for file = 1:45
%     h1 = plot([0 glide(file).dur],[glide(file).sspeed glide(file).espeed],'o-');
%     if glide(file).condition == 0
%         set(h1,'MarkerEdgeColor','k','MarkerFaceColor','k','color','k')
%     else if glide(file).condition == 1
%             set(h1,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255],'color',[55/255 126/255 184/255])
%         else if glide(file).condition == 3
%                 set(h1,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerFaceColor',[77/255 175/255 74/255],'Color',[77/255 175/255 74/255])
%             else set(h1,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerFaceColor',[228/255 26/255 28/255],'Color',[228/255 26/255 28/255])
%             end
%         end
%     end
% end
%
% xlabel('Glide Duration (sec)'); ylabel('Velocity (m/s)')
% adjustfigurefont
%
% %% try with all other data greyed out
% figure(32); clf
% loglog(Fish(:,1),Fish(:,2),'.-','color',[0.75 0.75 0.75],'markersize',15); hold on
% loglog(Fish(:,3),Fish(:,4),'.-','color',[0.75 0.75 0.75],'markersize',15)
% loglog(Fish(:,5),Fish(:,6),'.','color',[0.75 0.75 0.75],'markersize',15)
% loglog(Fish(:,9),Fish(:,10),'.','color',[0.75 0.75 0.75],'markersize',15)
% loglog(Fish(:,7),Fish(:,8),'.-','color',[0.75 0.75 0.75],'markersize',15)
% loglog(Fish(:,11),Fish(:,12),'.-','color',[0.75 0.75 0.75],'markersize',15)
% loglog(Fish(:,13),Fish(:,14),'.-','color',[0.75 0.75 0.75],'markersize',15)
% loglog(Fish(:,15),Fish(:,16),'.-','color',[0.75 0.75 0.75],'markersize',15)
% loglog(Fish(:,17),Fish(:,18),'.-','color',[0.75 0.75 0.75],'markersize',15)
% loglog(Fish(:,19),Fish(:,20),'.','color',[0.75 0.75 0.75],'markersize',15)
% % Lang Daybell Drag Collar work
% % colours are increasing drag
% loglog(repmat(LangDaybell(1,2),3,1),LangDaybell(1,3:5),'.','markersize',15,'color',[0.75 0.75 0.75])
% loglog(repmat(LangDaybell(2,2),3,1),LangDaybell(2,3:5),'.','markersize',15,'color',[0.75 0.75 0.75])
% loglog(repmat(LangDaybell(3,2),3,1),LangDaybell(3,3:5),'.','markersize',15,'color',[0.75 0.75 0.75])
% loglog(repmat(LangDaybell(4,2),3,1),LangDaybell(4,3:5),'.','markersize',15,'color',[0.75 0.75 0.75])
% % Noren Pregnancy 2011
% loglog(Noren2011(1,1),Noren2011(1,2),'.','color',[0.75 0.75 0.75],'markersize',15) % 18 months post parturition
% loglog(Noren2011(2:3,1),[Noren2011(1,2) Noren2011(1,2)],'color',[0.75 0.75 0.75])
% loglog([Noren2011(1,1) Noren2011(1,1)],Noren2011(2:3,2),'color',[0.75 0.75 0.75])
% loglog(Noren2011(1,3),Noren2011(1,4),'.','color',[0.75 0.75 0.75],'markersize',15) % pregnant
% loglog(Noren2011(2:3,3),[Noren2011(1,4) Noren2011(1,4)],'color',[0.75 0.75 0.75])
% loglog([Noren2011(1,3) Noren2011(1,3)],Noren2011(2:3,4),'color',[0.75 0.75 0.75])
% % Hanson 2001 Porpoise Tags
% loglog(Hanson(:,1),Hanson(:,2),'.-','markersize',15,'color',[0.75 0.75 0.75]) % porpoise model
% loglog(Hanson(:,1),Hanson(:,3),'.-','markersize',15,'color',[0.75 0.75 0.75]) % tags
% loglog(Hanson(:,1),Hanson(:,4),'.-','markersize',15,'color',[0.75 0.75 0.75])
% loglog(Hanson(:,1),Hanson(:,5),'.-','markersize',15,'color',[0.75 0.75 0.75])
% loglog(Hanson(:,1),Hanson(:,6),'.-','markersize',15,'color',[0.75 0.75 0.75])
% loglog(Hanson(:,1),Hanson(:,7),'.-','markersize',15,'color',[0.75 0.75 0.75])
% loglog(Hanson(:,1),Hanson(:,8),'.-','markersize',15,'color',[0.75 0.75 0.75])
% % Add Theoretical Flat Plates
% plot(Re,CdL,'--','color',[0.75 0.75 0.75])
% plot(Re,CdT,'color',[0.75 0.75 0.75])
% %% add our data
% % video only data
% for file = 1:45
%     h1 = loglog(glide(file).Re,mean(glide(file).Cd_mn),'o'); hold on
%     h2 = loglog(glide(file).Re,glide(file).CDAS,'o');
%     if glide(file).condition == 0
%         set(h1,'MarkerEdgeColor','k','MarkerFaceColor','k')
%         set(h2,'MarkerEdgeColor','k')
%     else if glide(file).condition == 1
%             set(h1,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255])
%             set(h2,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255])
%         else if glide(file).condition == 3
%                 set(h1,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerFaceColor',[77/255 175/255 74/255])
%                 set(h2,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255])
%             else set(h1,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerFaceColor',[228/255 26/255 28/255])
%                 set(h2,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255])
%             end
%         end
%     end
% end
%
% xlabel('Reynolds Number, Re'); ylabel('Drag Coefficient, C_d')
% adjustfigurefont
% ylim([1E-3 1.5])
%
% % add CFD data
% loglog(CFD_Re,CFD_Cd_notag,'color','k') % make these colours the same as the tag conditions
% loglog(CFD_Re,CFD_Cd_tag,'color',[55/255 126/255 184/255])
% loglog(CFD_Re,CFD_Cd_tag4,'color',[77/255 175/255 74/255])
%
% xlim([3E5 5E7])
% print('AllCdData_2','-dpng','-r300')
%
% %% plot velocities and durations of glides
% figure(4); clf; hold on
% for file = 1:45
%     h1 = plot([0 glide(file).dur],[glide(file).sspeed glide(file).espeed],'o-');
%     if glide(file).condition == 0
%         set(h1,'MarkerEdgeColor','k','MarkerFaceColor','k','color','k')
%     else if glide(file).condition == 1
%             set(h1,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255],'color',[55/255 126/255 184/255])
%         else if glide(file).condition == 3
%                 set(h1,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerFaceColor',[77/255 175/255 74/255],'Color',[77/255 175/255 74/255])
%             else set(h1,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerFaceColor',[228/255 26/255 28/255],'Color',[228/255 26/255 28/255])
%             end
%         end
%     end
% end
%
% xlabel('Glide Duration (sec)'); ylabel('Velocity (m/s)')
% adjustfigurefont
%
%
% %%
% figure(5); clf; hold on
% for file = 1:45
%     if glide(file).condition == 0
%         scatter([0 glide(file).dur],[glide(file).sspeed glide(file).espeed], 100,[mean(glide(file).Cd_mn) mean(glide(file).Cd_mn)],'filled')
%         plot([0 glide(file).dur],[glide(file).sspeed glide(file).espeed],'k-');
%     else if glide(file).condition == 1
%             scatter([0 glide(file).dur],[glide(file).sspeed glide(file).espeed], 100,[mean(glide(file).Cd_mn) mean(glide(file).Cd_mn)],'filled','Marker','^')
%             plot([0 glide(file).dur],[glide(file).sspeed glide(file).espeed],'color',[55/255 126/255 184/255]);
%         else if glide(file).condition == 3
%                 scatter([0 glide(file).dur],[glide(file).sspeed glide(file).espeed], 100,[mean(glide(file).Cd_mn) mean(glide(file).Cd_mn)],'filled','Marker','d')
%                 plot([0 glide(file).dur],[glide(file).sspeed glide(file).espeed],'color',[77/255 175/255 74/255]);
%             else scatter([0 glide(file).dur],[glide(file).sspeed glide(file).espeed], 100,[mean(glide(file).Cd_mn) mean(glide(file).Cd_mn)],'filled','Marker','s')
%                 plot([0 glide(file).dur],[glide(file).sspeed glide(file).espeed],'color',[228/255 26/255 28/255]);
%             end
%         end
%     end
% end
%
% set(gca,'CLim',[0 0.3]);
% colormap jet

%% notboxplot
% calculate means
for i = 1:45;
    glide(i).mnCd = nanmean(glide(i).Cd_mn);
end

% reorder data: each column of y is one variable/group
avmav_mtrx = nan(11,8);
% dur_mtrx = nan(11,8);
% AS_mtrx = nan(11,8);
Hoku0 = find(tag == 0 & ind == 1);
Hoku1 = find(tag == 1 & ind == 1);
Hoku3 = find(tag == 3 & ind == 1);
Liho0 = find(tag == 0 & ind == 2);
Liho1 = find(tag == 1 & ind == 2);
Liho3 = find(tag == 3 & ind == 2);
Liho5 = find(tag == 5 & ind == 2);

% mean drag coefficients (A), drag coefficients (B) and durations (C)
for i = 1:length(Hoku0)
    avmav_mtrx(i,1) = cdcorr(Hoku0(i));
end
for i = 1:length(Hoku1)
    avmav_mtrx(i,3) = cdcorr(Hoku1(i));
%     dur_mtrx(i,3) = glide(Hoku1(i)).dur;
%     AS_mtrx(i,3) = glide(Hoku1(i)).CDAS;
end
for i = 1:length(Hoku3)
    avmav_mtrx(i,5) = cdcorr(Hoku3(i));
%     dur_mtrx(i,5) = glide(Hoku3(i)).dur;
%     AS_mtrx(i,5) = glide(Hoku3(i)).CDAS;
end
for i = 1:length(Liho0)
    avmav_mtrx(i,2) = cdcorr(Liho0(i));
%     dur_mtrx(i,2) = glide(Liho0(i)).dur;
%     AS_mtrx(i,2) = glide(Liho0(i)).CDAS;
end
for i = 1:length(Liho1)
    avmav_mtrx(i,4) = cdcorr(Liho1(i));
%     dur_mtrx(i,4) = glide(Liho1(i)).dur;
%     AS_mtrx(i,4) = glide(Liho1(i)).CDAS;
end
for i = 1:length(Liho3)
    avmav_mtrx(i,6) = cdcorr(Liho3(i));
%     dur_mtrx(i,6) = glide(Liho3(i)).dur;
%     AS_mtrx(i,6) = glide(Liho3(i)).CDAS;
end
for i = 1:length(Liho5)
    avmav_mtrx(i,8) = cdcorr(Liho5(i));
%     dur_mtrx(i,8) = glide(Liho5(i)).dur;
%     AS_mtrx(i,8) = glide(Liho5(i)).CDAS;
end

% %% for paper:
% [nanmean(nanmean(avmav_mtrx(:,1:2))) nanmean(nanstd(avmav_mtrx(:,1:2)))]
% [nanmean(nanmean(avmav_mtrx(:,3:4))) nanmean(nanstd(avmav_mtrx(:,3:4)))]
% [nanmean(nanmean(avmav_mtrx(:,5:6))) nanmean(nanstd(avmav_mtrx(:,5:6)))]
% [nanmean(nanmean(avmav_mtrx(:,8))) nanmean(nanstd(avmav_mtrx(:,8)))]
%
%
% [nanmean(nanmean(AS_mtrx(:,1:2))) nanmean(nanstd(AS_mtrx(:,1:2)))]
% [nanmean(nanmean(AS_mtrx(:,3:4))) nanmean(nanstd(AS_mtrx(:,3:4)))]
% [nanmean(nanmean(AS_mtrx(:,5:6))) nanmean(nanstd(AS_mtrx(:,5:6)))]
% [nanmean(nanmean(AS_mtrx(:,8))) nanmean(nanstd(AS_mtrx(:,8)))]
%% plot
figure(6); clf;
set(gcf,'position',[427 108 500 565],'paperpositionmode','auto')
subplot('position',[0.13 0.55 0.7750 0.4]); hold on
x = [0.3 0.7 1.3 1.7 2.3 2.7 3.3 3.7]; % x axis locations for boxes
h = notBoxPlot(avmav_mtrx,x);
d = [h.data];
% set marker differences
set(d, 'markersize',6);
set(d(1:2), 'markerfacecolor','k', 'color','k');
set(d(3:4), 'markerfacecolor',[55/255 126/255 184/255],'color','k','marker','^');
set(d(5:6), 'markerfacecolor',[77/255 175/255 74/255],'color','k','marker','d');
set(d(7), 'markerfacecolor',[228/255 26/255 28/255],'color','k','marker','s');

% set patch colors
for i = 1:8
    set(h(i).sdPtch,'facecolor',[1 1 1],'edgecolor','k')
    set(h(i).semPtch,'facecolor',[0.75 0.75 0.75],'edgecolor','k')
end
% set mean colors
l = [h.mu];
set(l(1:2),'color','k')
set(l(3:4),'color',[55/255 126/255 184/255])
set(l(5:6),'color',[77/255 175/255 74/255])
set(l(8),'color',[228/255 26/255 28/255])

set(gca,'xtick',[])
ylim([-0.01 0.06]); xlim([0 4])
ylabel('Drag Coefficient, C_d')
text(0.1,0.35,'A','FontSize',18,'FontWeight','Bold'); box on

% ADD CFD
% plot no tag, tag, tag+4
hold on
for i = 1:6
    plot([x(1)-0.25 x(2)+0.25],[CFD_Cd_notag(i) CFD_Cd_notag(i)],'--','color',[253/255 174/255 97/255])
    plot([x(3)-0.25 x(4)+0.25],[CFD_Cd_tag(i) CFD_Cd_tag(i)],'--','color',[253/255 174/255 97/255])
    plot([x(5)-0.25 x(6)+0.25],[CFD_Cd_tag4(i) CFD_Cd_tag4(i)],'--','color',[253/255 174/255 97/255])
end

% add labels for Control/No Tag, Tag, Tag+4, Tag+8 condition
text(0.25,0.05,'Control','FontSize',14)
text(0.26,0.045,'No Tag','FontSize',14)
text(1.35,0.05,'Tag','FontSize',14)
text(2.25,0.05,'Tag+4','FontSize',14)
text(3.3,0.05,'Tag+8','FontSize',14)

%% do for Duration
subplot('position',[0.13 0.25 0.7750 0.2157])
h = notBoxPlot(dur_mtrx,x);
d = [h.data];
% set marker differences
set(d, 'markersize',6);
set(d(1:2), 'markerfacecolor','k', 'color','k');
set(d(3:4), 'markerfacecolor',[55/255 126/255 184/255],'color','k','marker','^');
set(d(5:6), 'markerfacecolor',[77/255 175/255 74/255],'color','k','marker','d');
set(d(7), 'markerfacecolor',[228/255 26/255 28/255],'color','k','marker','s');

% set patch colors
for i = 1:8
    set(h(i).sdPtch,'facecolor',[1 1 1],'edgecolor','k')
    set(h(i).semPtch,'facecolor',[0.75 0.75 0.75],'edgecolor','k')
end
% set mean colors
l = [h.mu];
set(l(1:2),'color','k')
set(l(3:4),'color',[55/255 126/255 184/255])
set(l(5:6),'color',[77/255 175/255 74/255])
set(l(8),'color',[228/255 26/255 28/255])

xlim([0 4]); ylim([0.75 4.1])
%xticklabel_rotate(x,90,{'63H4 C        ','01L5 C        ','63H4 T        ',...
%    '01L5 T        ','63H4 T+4        ','01L5 T+4        ','63H4 T+8        ',...
%    '01L5 T+8        '},'Fontsize',12)
set(gca,'xticklabels',{'63H4','01L5','63H4','01L5','63H4','01L5','63H4','01L5',})
set(gca,'ytick',1:4);
xlabel('Condition');
ylabel({'Glide Duration (sec)',''})
adjustfigurefont
set(gca,'position',[0.13 0.25 0.7750 0.2157])
text(0.1,3.6,'C','FontSize',18,'FontWeight','Bold'); box on

print('Glide_Boxplots','-dsvg','-r300')

return

%% Percent Change in Drag - following Jones et al. 2013
PercDragDiffTag
