% Glide Cd Method Figure
warning off

% load glide data
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/Glides
load('GlideStructure')

% plot Cd vs. Re from Video Only glide data
figure(1); clf; hold on
set(gcf,'position',[1417 276 933 384])
subplot('position',[0.1 0.1 0.38 0.8]);
for file = 1:45
    h1 = loglog(glide(file).Re,mean(glide(file).Cd_mn),'o'); hold on
    if glide(file).condition == 0
        set(h1,'MarkerEdgeColor','k','MarkerFaceColor','k')
    else if glide(file).condition == 1
            set(h1,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255])
        else if glide(file).condition == 3
                set(h1,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerFaceColor',[77/255 175/255 74/255])
            else set(h1,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerFaceColor',[228/255 26/255 28/255])
            end
        end
    end
    %     if mav(i,2) == 2
    %         set(h1,'MarkerFaceColor','none')
    %     end
end

%%
for file = 1:45
    h2 = plot(glide(file).Re,mean(glide(file).Cd_mn),'o');
    if glide(file).condition == 0
        set(h2,'MarkerEdgeColor','k')
    else if glide(file).condition == 1
            set(h2,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255])
        else if glide(file).condition == 3
                set(h2,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255])
            else set(h2,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255])
            end
        end
    end
end

xlabel('Reynolds Number, \it{Re}'); ylabel('Drag Coefficient, \it{C_d}')
xlim([8E5 5E6]); ylim([5E-3 1E1])
text(8.4E5,0.75,'A','FontSize',18,'FontWeight','bold')

% %% summary statistics tag glide data
% nanmean(nanmean([Cdtag1(mav(:,1) == 3) Cdtag2(mav(:,1) == 3)]));
% nanmean(nanstd([Cdtag1(mav(:,1) == 3) Cdtag2(mav(:,1) == 3)]));
% nanmean(nanmean([Cdtag1(mav(:,1) == 5) Cdtag2(mav(:,1) == 5)]));
% nanmean(nanstd([Cdtag1(mav(:,1) == 5) Cdtag2(mav(:,1) == 5)]));

%% DATA FROM FISH (TEST)
load('Data_Readmatv6')
figure(3); clf
loglog(Fish(:,1),Fish(:,2),'.-','color',[214/255 2/255 101/255],'markersize',15); hold on
loglog(Fish(:,3),Fish(:,4),'.-','color',[214/255 2/255 101/255],'markersize',15)
loglog(Fish(:,5),Fish(:,6),'.','color',[214/255 2/255 101/255],'markersize',15)
loglog(Fish(:,9),Fish(:,10),'.','color',[35/255 235/255 205/255],'markersize',15)
loglog(Fish(:,7),Fish(:,8),'.-','color',[255/255 227/255 71/255],'markersize',15)
loglog(Fish(:,11),Fish(:,12),'.-','color',[251/255 139/255 36/255],'markersize',15)
loglog(Fish(:,13),Fish(:,14),'.-','color',[251/255 139/255 36/255],'markersize',15)
loglog(Fish(:,15),Fish(:,16),'.-','color',[251/255 139/255 36/255],'markersize',15)
loglog(Fish(:,17),Fish(:,18),'.-','color',[251/255 139/255 36/255],'markersize',15)
loglog(Fish(:,19),Fish(:,20),'.','color',[251/255 139/255 36/255],'markersize',15)
% Lang Daybell Drag Collar work
% colours are increasing drag
loglog(repmat(LangDaybell(1,2),3,1),LangDaybell(1,3:5),'.','markersize',15,'color',[120/255 205/255 69/255])
loglog(repmat(LangDaybell(2,2),3,1),LangDaybell(2,3:5),'.','markersize',15,'color',[43/255 168/255 73/255])
loglog(repmat(LangDaybell(3,2),3,1),LangDaybell(3,3:5),'.','markersize',15,'color',[36/255 130/255 50/255])
loglog(repmat(LangDaybell(4,2),3,1),LangDaybell(4,3:5),'.','markersize',15,'color',[0/255 88/255 29/255])
% Noren Pregnancy 2011
loglog(Noren2011(1,1),Noren2011(1,2),'.','color',[0/255 48/255 73/255],'markersize',15) % 18 months post parturition
loglog(Noren2011(2:3,1),[Noren2011(1,2) Noren2011(1,2)],'color',[0/255 48/255 73/255])
loglog([Noren2011(1,1) Noren2011(1,1)],Noren2011(2:3,2),'color',[0/255 48/255 73/255])
loglog(Noren2011(1,3),Noren2011(1,4),'.','color',[39/255 152/255 183/255],'markersize',15) % pregnant
loglog(Noren2011(2:3,3),[Noren2011(1,4) Noren2011(1,4)],'color',[39/255 152/255 183/255])
loglog([Noren2011(1,3) Noren2011(1,3)],Noren2011(2:3,4),'color',[39/255 152/255 183/255])
% Hanson 2001 Porpoise Tags
loglog(Hanson(:,1),Hanson(:,2),'.-','markersize',15,'color',[151/255 132/255 216/255]) % porpoise model
loglog(Hanson(:,1),Hanson(:,3),'.-','markersize',15,'color',[83/255 53/255 113/255]) % tags
loglog(Hanson(:,1),Hanson(:,4),'.-','markersize',15,'color',[83/255 53/255 113/255])
loglog(Hanson(:,1),Hanson(:,5),'.-','markersize',15,'color',[83/255 53/255 113/255])
loglog(Hanson(:,1),Hanson(:,6),'.-','markersize',15,'color',[83/255 53/255 113/255])
loglog(Hanson(:,1),Hanson(:,7),'.-','markersize',15,'color',[83/255 53/255 113/255])
loglog(Hanson(:,1),Hanson(:,8),'.-','markersize',15,'color',[83/255 53/255 113/255])

%% add our data
% video only data
for file = 1:45
    h1 = loglog(glide(file).Re,mean(glide(file).Cd_mn),'o'); hold on
    if glide(file).condition == 0
        set(h1,'MarkerEdgeColor','k','MarkerFaceColor','k')
    else if glide(file).condition == 1
            set(h1,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255])
        else if glide(file).condition == 3
                set(h1,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerFaceColor',[77/255 175/255 74/255])
            else set(h1,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerFaceColor',[228/255 26/255 28/255])
            end
        end
    end
end

xlabel('Reynolds Number, \it{Re}'); ylabel('Drag Coefficient, \it{C_d}')
adjustfigurefont
ylim([1E-3 1.5])

% add CFD data
load('DolphinTagSims_24Feb16')

% calculate Re
L = 2.6; % length ASSUMTION - NEED DATA FROM SHORTER
v = 1.05E-6; % kinematic viscosity
CFD_Re = (L*vel)./v;

% calculate Cd of dolphin only
rho = 1021; % seawater density
A = 2.3; % area
CFD_Cd_notag = (2*notag')./(rho*A.*vel.^2);
CFD_Cd_tag = (2*sum(tag'))./(rho*(A+0.024).*vel.^2);
CFD_Cd_tag4 = (2*sum(tag4'))./(rho*(A+0.066).*vel.^2);

loglog(CFD_Re,CFD_Cd_notag,'color',[0.75 0.75 0.75])
loglog(CFD_Re,CFD_Cd_tag,'color',[0.75 0.75 0.75])
loglog(CFD_Re,CFD_Cd_tag4,'color',[0.75 0.75 0.75])

print('AllCdData','-dpng','-r300')

%% plot velocities and durations of glides
figure(4); clf; hold on
for file = 1:45
    h1 = plot([0 glide(file).dur],[glide(file).sspeed glide(file).espeed],'o-');
    if glide(file).condition == 0
        set(h1,'MarkerEdgeColor','k','MarkerFaceColor','k','color','k')
    else if glide(file).condition == 1
            set(h1,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255],'color',[55/255 126/255 184/255])
        else if glide(file).condition == 3
                set(h1,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerFaceColor',[77/255 175/255 74/255],'Color',[77/255 175/255 74/255])
            else set(h1,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerFaceColor',[228/255 26/255 28/255],'Color',[228/255 26/255 28/255])
            end
        end
    end
end

xlabel('Glide Duration (sec)'); ylabel('Velocity (m/s)')
adjustfigurefont
%%
figure(5); clf; hold on
for file = 1:45
    if glide(file).condition == 0
        scatter([0 glide(file).dur],[glide(file).sspeed glide(file).espeed], 100,[mean(glide(file).Cd_mn) mean(glide(file).Cd_mn)],'filled')
        plot([0 glide(file).dur],[glide(file).sspeed glide(file).espeed],'k-');
    else if glide(file).condition == 1
            scatter([0 glide(file).dur],[glide(file).sspeed glide(file).espeed], 100,[mean(glide(file).Cd_mn) mean(glide(file).Cd_mn)],'filled','Marker','^')
            plot([0 glide(file).dur],[glide(file).sspeed glide(file).espeed],'color',[55/255 126/255 184/255]);
        else if glide(file).condition == 3
                scatter([0 glide(file).dur],[glide(file).sspeed glide(file).espeed], 100,[mean(glide(file).Cd_mn) mean(glide(file).Cd_mn)],'filled','Marker','d')
                plot([0 glide(file).dur],[glide(file).sspeed glide(file).espeed],'color',[77/255 175/255 74/255]);
            else scatter([0 glide(file).dur],[glide(file).sspeed glide(file).espeed], 100,[mean(glide(file).Cd_mn) mean(glide(file).Cd_mn)],'filled','Marker','s')
                plot([0 glide(file).dur],[glide(file).sspeed glide(file).espeed],'color',[228/255 26/255 28/255]);
            end
        end
    end
end

set(gca,'CLim',[0 0.3]);
colormap jet
return
%% notboxplot
% calculate means 
for i = 1:45;
    glide(i).mnCd = mean(glide(i).Cd_mn); 
end

% reorder data: each column of y is one variable/group
avmav_mtrx = nan(11,8);
dur_mtrx = nan(11,8);
Hoku0 = find([glide.condition] == 0 & [glide.animal] == 1);
Hoku1 = find([glide.condition] == 1 & [glide.animal] == 1);
Hoku3 = find([glide.condition] == 3 & [glide.animal] == 1);
Liho0 = find([glide.condition] == 0 & [glide.animal] == 2); 
Liho1 = find([glide.condition] == 1 & [glide.animal] == 2); 
Liho3 = find([glide.condition] == 3 & [glide.animal] == 2); 
Liho5 = find([glide.condition] == 5 & [glide.animal] == 2); 

% mean drag coefficients (A) and durations (C)
for i = 1:length(Hoku0)
avmav_mtrx(i,1) = glide(Hoku0(i)).mnCd;
dur_mtrx(i,1) = glide(Hoku0(i)).dur;
end
for i = 1:length(Hoku1)
avmav_mtrx(i,3) = glide(Hoku1(i)).mnCd;
dur_mtrx(i,3) = glide(Hoku1(i)).dur;
end
for i = 1:length(Hoku3)
avmav_mtrx(i,5) = glide(Hoku3(i)).mnCd;
dur_mtrx(i,5) = glide(Hoku3(i)).dur;
end
for i = 1:length(Liho0)
avmav_mtrx(i,2) = glide(Liho0(i)).mnCd;
dur_mtrx(i,2) = glide(Liho0(i)).dur;
end
for i = 1:length(Liho1)
avmav_mtrx(i,4) = glide(Liho1(i)).mnCd;
dur_mtrx(i,4) = glide(Liho1(i)).dur;
end
for i = 1:length(Liho3)
avmav_mtrx(i,6) = glide(Liho3(i)).mnCd;
dur_mtrx(i,6) = glide(Liho3(i)).dur;
end
for i = 1:length(Liho5)
avmav_mtrx(i,8) = glide(Liho5(i)).mnCd;
dur_mtrx(i,8) = glide(Liho5(i)).dur;
end

%% plot
figure(6); clf;
set(gcf,'position',[427 108 500 565],'paperpositionmode','auto')
subplot('position',[0.13 0.75 0.7750 0.2157]); hold on
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
ylim([-0.05 0.4]); xlim([0 4])
ylabel('Drag Coefficient, C_d')
text(0.1,0.35,'A','FontSize',18,'FontWeight','Bold'); box on

% ADD CFD
% plot no tag, tag, tag+4
hold on
for i = 1:6
plot([x(1)-0.25 x(2)+0.25],[CFD_Cd_notag(i) CFD_Cd_notag(i)],'--','color',[0.75 0.75 0.75])
plot([x(3)-0.25 x(4)+0.25],[CFD_Cd_tag(i) CFD_Cd_tag(i)],'--','color',[0.75 0.75 0.75])
plot([x(5)-0.25 x(6)+0.25],[CFD_Cd_tag4(i) CFD_Cd_tag4(i)],'--','color',[0.75 0.75 0.75])
end


%%
%% do for METHOD 2
% meantag = nanmean([Cdtag1 Cdtag2]')';
% 
% tag_mtrx = nan(11,8);
% tag_mtrx(1:7,1) = meantag(mav(:,1) == 0 & mav(:,2) == 1); % Hoku 0
% tag_mtrx(1:4,2) = meantag(mav(:,1) == 0 & mav(:,2) == 2); % Liho 0
% tag_mtrx(1:6,3) = meantag(mav(:,1) == 1 & mav(:,2) == 1); % Hoku 1
% tag_mtrx(1:5,4) = meantag(mav(:,1) == 1 & mav(:,2) == 2); % Liho 1
% tag_mtrx(1:11,5) = meantag(mav(:,1) == 3 & mav(:,2) == 1); % Hoku 3
% tag_mtrx(1:4,6) = meantag(mav(:,1) == 3 & mav(:,2) == 2); % Liho 3
% % tag_mtrx(:,7) = meantag(mav(:,1) == 5 & mav(:,2) == 1); % Hoku 5
% tag_mtrx(1:8,8) = meantag(mav(:,1) == 5 & mav(:,2) == 2); % Liho 5

subplot('position',[0.13 0.5 0.7750 0.2157])
% h = notBoxPlot(tag_mtrx,x);
% d = [h.data];
% % set marker differences
% set(d, 'markersize',6);
% set(d(1), 'markerfacecolor',[55/255 126/255 184/255],'color','k','marker','^'); 
% set(d(2:3), 'markerfacecolor',[77/255 175/255 74/255],'color','k','marker','d'); 
% set(d(4), 'markerfacecolor',[228/255 26/255 28/255],'color','k','marker','s'); 
% 
% % set patch colors
% for i = 1:8
% set(h(i).sdPtch,'facecolor',[1 1 1],'edgecolor','k')
% set(h(i).semPtch,'facecolor',[0.75 0.75 0.75],'edgecolor','k')
% end
% % set mean colors
% l = [h.mu];
% set(l(3:4),'color',[55/255 126/255 184/255])
% set(l(5:6),'color',[77/255 175/255 74/255])
% set(l(7:8),'color',[228/255 26/255 28/255])

set(gca,'xtick',[])
ylim([-0.05 0.4]); xlim([0 4])
ylabel('Drag Coefficient, C_d')
text(-0.6,0.35,'B','FontSize',18,'FontWeight','Bold'); box on
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

xlim([0 4])
xticklabel_rotate(x,90,{'Hoku C        ','Liho C        ','Hoku T        ',...
    'Liho T        ','Hoku T+4        ','Liho T+4        ','Hoku T+8        ',...
    'Liho T+8        '},'Fontsize',12)
xlabel('Condition');
ylabel({'Glide Duration (sec)',''})
adjustfigurefont
set(gca,'position',[0.13 0.25 0.7750 0.2157])
text(0.1,3.2,'C','FontSize',18,'FontWeight','Bold'); box on

print('Glide_Boxplots','-dpng','-r300')

%% Percent Change in Drag - following Jones et al. 2013
PercDragDiffTag