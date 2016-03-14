% Glide Cd Method Figure
% load glide data
load('Data_Readmatv6')

% plot Cd vs. Re from Video Only glide data
figure(1); clf; hold on
set(gcf,'position',[1417 276 933 384])
subplot('position',[0.1 0.1 0.4 0.8]); 
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

xlabel('Reynolds Number, Re'); ylabel('Drag Coefficient, C_d')

%% plot agreement between glide vs. tag method
subplot('position',[0.55 0.1 0.4 0.8]); hold on
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
cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/AnalysisFigs
print('VideoOnly_Cd','-dpng','-r300')

%% summary statistics tag glide data
nanmean(nanmean([Cdtag1(mav(:,1) == 3) Cdtag2(mav(:,1) == 3)]));
nanmean(nanstd([Cdtag1(mav(:,1) == 3) Cdtag2(mav(:,1) == 3)]));
nanmean(nanmean([Cdtag1(mav(:,1) == 5) Cdtag2(mav(:,1) == 5)]));
nanmean(nanstd([Cdtag1(mav(:,1) == 5) Cdtag2(mav(:,1) == 5)]));


%% DATA FROM FISH (TEST)
figure(3); clf
loglog(Fish(:,1),Fish(:,2),'o-','color','r'); hold on
loglog(Fish(:,3),Fish(:,4),'o-','color','r')
loglog(Fish(:,5),Fish(:,6),'o','color','r')
loglog(Fish(:,7),Fish(:,8),'o-','color','g')
loglog(Fish(:,9),Fish(:,10),'o','color','k')
loglog(Fish(:,11),Fish(:,12),'o-','color','b')
loglog(Fish(:,13),Fish(:,14),'o-','color','b')
loglog(Fish(:,15),Fish(:,16),'o-','color','b')
loglog(Fish(:,17),Fish(:,18),'o-','color','b')
loglog(Fish(:,19),Fish(:,20),'o','color','b')
% Lang Daybell Drag Collar work
loglog(LangDaybell(:,2),LangDaybell(:,3),'s')
loglog(LangDaybell(:,2),LangDaybell(:,4),'s')
loglog(LangDaybell(:,2),LangDaybell(:,5),'s')
% Noren Pregnancy 2011
loglog(Noren2011(1,1),Noren2011(1,2),'o') % 18 months post parturition
loglog(Noren2011(2:3,1),[Noren2011(1,2) Noren2011(1,2)])
loglog([Noren2011(1,1) Noren2011(1,1)],Noren2011(2:3,2))
loglog(Noren2011(1,3),Noren2011(1,4),'o') % pregnant
loglog(Noren2011(2:3,3),[Noren2011(1,4) Noren2011(1,4)])
loglog([Noren2011(1,3) Noren2011(1,3)],Noren2011(2:3,4))

% add our data
loglog(Re,mav(:,5),'*');
loglog(Re,nanmean([Cdtag1 Cdtag2]'),'*');

xlabel('Reynolds Number (Re)'); ylabel('Drag Coefficient (Cd)')
adjustfigurefont