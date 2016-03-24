% Glide Cd Method Figure
% load glide data
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/Glides
load('Data_Readmatv6')

% calculate average from two points
avmav = mean(mav(:,3:4)')';

% plot Cd vs. Re from Video Only glide data
figure(1); clf; hold on
set(gcf,'position',[1417 276 933 384])
subplot('position',[0.1 0.1 0.38 0.8]);
for i = 1:length(mav)
    h1 = loglog(Re(i),avmav(i),'o'); hold on
    if mav(i,1) == 0
        set(h1,'MarkerEdgeColor','k','MarkerFaceColor','k')
    else if mav(i,1) == 1
            set(h1,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255])
        else if mav(i,1) == 3
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
for i = 1:length(mav)
    h2 = plot(Re(i),nanmean([Cdtag1(i) Cdtag2(i)]),'o');
    if mav(i,1) == 0
        set(h2,'MarkerEdgeColor','k')
    else if mav(i,1) == 1
            set(h2,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255])
        else if mav(i,1) == 3
                set(h2,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255])
            else set(h2,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255])
            end
        end
    end
end

xlabel('Reynolds Number, \it{Re}'); ylabel('Drag Coefficient, \it{C_d}')
xlim([8E5 5E6]); ylim([5E-3 1E0])
text(8.4E5,0.75,'A','FontSize',18,'FontWeight','bold')
%% plot agreement between glide vs. tag method
subplot('position',[0.6 0.1 0.38 0.8]); hold on
for i = 1:length(mav)
    h3 = scatter(nanmean([Cdtag1(i) Cdtag2(i)]),avmav(i),'o');
    if mav(i,1) == 0
        set(h3,'MarkerEdgeColor','k')
    else if mav(i,1) == 1
            set(h3,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255])
        else if mav(i,1) == 3
                set(h3,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255])
            else set(h3,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255])
            end
        end
    end
end
plot([0 0.5],[0 0.5],'k')
xlabel('Tag-derived Drag Coefficient'); ylabel('Video Only-derived Drag Coefficient')
adjustfigurefont
box on
text(0.0141,0.47,'B','FontSize',18,'FontWeight','bold')
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('VideoTag_Cd','-dpng','-r300')

%% summary statistics tag glide data
nanmean(nanmean([Cdtag1(mav(:,1) == 3) Cdtag2(mav(:,1) == 3)]));
nanmean(nanstd([Cdtag1(mav(:,1) == 3) Cdtag2(mav(:,1) == 3)]));
nanmean(nanmean([Cdtag1(mav(:,1) == 5) Cdtag2(mav(:,1) == 5)]));
nanmean(nanstd([Cdtag1(mav(:,1) == 5) Cdtag2(mav(:,1) == 5)]));


%% DATA FROM FISH (TEST)
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

% add our data
% video only data
for i = 1:length(mav)
    h1 = loglog(Re(i),avmav(i),'o'); hold on
    if mav(i,1) == 0
        set(h1,'MarkerEdgeColor','k','MarkerFaceColor','k')
    else if mav(i,1) == 1
            set(h1,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255])
        else if mav(i,1) == 3
                set(h1,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerFaceColor',[77/255 175/255 74/255])
            else set(h1,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerFaceColor',[228/255 26/255 28/255])
            end
        end
    end
end
% tag data
for i = 1:length(mav)
    h2 = plot(Re(i),nanmean([Cdtag1(i) Cdtag2(i)]),'o');
    if mav(i,1) == 0
        set(h2,'MarkerEdgeColor','k')
    else if mav(i,1) == 1
            set(h2,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255])
        else if mav(i,1) == 3
                set(h2,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255])
            else set(h2,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255])
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
CFD_Cd_tag = (2*sum(tag'))./(rho*A.*vel.^2);
CFD_Cd_tag4 = (2*sum(tag4'))./(rho*A.*vel.^2);

loglog(CFD_Re,CFD_Cd_notag,'color',[0.75 0.75 0.75])
loglog(CFD_Re,CFD_Cd_tag,'color',[0.75 0.75 0.75])
loglog(CFD_Re,CFD_Cd_tag4,'color',[0.75 0.75 0.75])

print('AllCdData','-dpng','-r300')

%% plot velocities and durations of glides
figure(4); clf; hold on
for i = 1:length(mav)
    h1 = plot([0 mav(i,5)],mav(i,6:7),'o-');
    if mav(i,1) == 0
        set(h1,'MarkerEdgeColor','k','MarkerFaceColor','k','color','k')
    else if mav(i,1) == 1
            set(h1,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255],'color',[55/255 126/255 184/255])
        else if mav(i,1) == 3
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
for i = 1:length(mav)
    if mav(i,1) == 0
        scatter([0 mav(i,5)],mav(i,6:7), 100,[avmav(i) avmav(i)],'filled')
        plot([0 mav(i,5)],mav(i,6:7),'k-');
    else if mav(i,1) == 1
            scatter([0 mav(i,5)],mav(i,6:7), 100,[avmav(i) avmav(i)],'filled','Marker','^')
            plot([0 mav(i,5)],mav(i,6:7),'color',[55/255 126/255 184/255]);
        else if mav(i,1) == 3
                scatter([0 mav(i,5)],mav(i,6:7), 100,[avmav(i) avmav(i)],'filled','Marker','d')
                plot([0 mav(i,5)],mav(i,6:7),'color',[77/255 175/255 74/255]);
            else scatter([0 mav(i,5)],mav(i,6:7), 100,[avmav(i) avmav(i)],'filled','Marker','s')
                plot([0 mav(i,5)],mav(i,6:7),'color',[228/255 26/255 28/255]);
            end
        end
    end
end

set(gca,'CLim',[0 0.3]);
colormap jet

%% notboxplot
% reorder data: each column of y is one variable/group
avmav_mtrx = nan(11,8);
avmav_mtrx(1:7,1) = avmav(mav(:,1) == 0 & mav(:,2) == 1); % Hoku 0
avmav_mtrx(1:4,2) = avmav(mav(:,1) == 0 & mav(:,2) == 2); % Liho 0
avmav_mtrx(1:6,3) = avmav(mav(:,1) == 1 & mav(:,2) == 1); % Hoku 1
avmav_mtrx(1:5,4) = avmav(mav(:,1) == 1 & mav(:,2) == 2); % Liho 1
avmav_mtrx(1:11,5) = avmav(mav(:,1) == 3 & mav(:,2) == 1); % Hoku 3
avmav_mtrx(1:4,6) = avmav(mav(:,1) == 3 & mav(:,2) == 2); % Liho 3
% avmav_mtrx(:,7) = avmav(mav(:,1) == 5 & mav(:,2) == 1); % Hoku 5
avmav_mtrx(1:8,8) = avmav(mav(:,1) == 5 & mav(:,2) == 2); % Liho 5

%% plot
figure(6); clf; hold on
x = [0.3 0.7 1.3 1.7 2.3 2.7 3.3 3.7]; % x axis locations for boxes
h = notBoxPlot(avmav_mtrx,x);
d = [h.data];
% set marker differences
set(d(1:2:end), 'markerfacecolor', [0.4,1,0.4], 'color', [0,0.4,0]); 
set(d, 'markersize', 5);
% set patch colors
set(h(8).sdPtch,'facecolor',[1 1 1]) 
set(gca,'xtick',[0.5 1.5 2.5 3.5])
xlabel('Condition')
ylabel('Drag Coefficient, Cd')
adjustfigurefont