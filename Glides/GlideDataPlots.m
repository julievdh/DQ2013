% Glide Cd Method Figure
% load glide data
load('Data_Readmatv6')

% plot Cd vs. Re from Video Only glide data
figure(1); clf; hold on
set(gcf,'position',[1417 276 933 384])
subplot('position',[0.1 0.1 0.38 0.8]); 
for i = 1:length(mav)
    h1 = loglog(Re(i),mav(i,5),'o'); hold on
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
xlim([8E5 4E6]); ylim([7E-3 1E0])
text(8.4E5,0.75,'A','FontSize',18,'FontWeight','bold')
%% plot agreement between glide vs. tag method
subplot('position',[0.6 0.1 0.38 0.8]); hold on
for i = 1:length(mav)
    h3 = scatter(nanmean([Cdtag1(i) Cdtag2(i)]),mav(i,5),'o');
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
plot([0 0.12],[0 0.12],'k')
xlabel('Tag-derived Drag Coefficient'); ylabel('Video Only-derived Drag Coefficient')
adjustfigurefont
box on
text(0.0141,0.1135,'B','FontSize',18,'FontWeight','bold')
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
loglog(repmat(LangDaybell(1,2),3,1),LangDaybell(1,3:5),'.','markersize',15,'color',[152/255 145/255 214/255])
loglog(repmat(LangDaybell(2,2),3,1),LangDaybell(2,3:5),'.','markersize',15,'color',[100/255 60/255 142/255])
loglog(repmat(LangDaybell(3,2),3,1),LangDaybell(3,3:5),'.','markersize',15,'color',[66/255 22/255 124/255])
loglog(repmat(LangDaybell(4,2),3,1),LangDaybell(4,3:5),'.','markersize',15,'color',[51/255 30/255 75/255])
% Noren Pregnancy 2011
loglog(Noren2011(1,1),Noren2011(1,2),'.','color',[0/255 48/255 73/255],'markersize',15) % 18 months post parturition
loglog(Noren2011(2:3,1),[Noren2011(1,2) Noren2011(1,2)],'color',[0/255 48/255 73/255])
loglog([Noren2011(1,1) Noren2011(1,1)],Noren2011(2:3,2),'color',[0/255 48/255 73/255])
loglog(Noren2011(1,3),Noren2011(1,4),'.','color',[39/255 152/255 183/255],'markersize',15) % pregnant
loglog(Noren2011(2:3,3),[Noren2011(1,4) Noren2011(1,4)],'color',[39/255 152/255 183/255])
loglog([Noren2011(1,3) Noren2011(1,3)],Noren2011(2:3,4),'color',[39/255 152/255 183/255])

% add our data
% video only data
for i = 1:length(mav)
    h1 = loglog(Re(i),mav(i,5),'o'); hold on
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
print('AllCdData','-dpng','-r300')