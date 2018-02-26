%% DATA FROM FISH (TEST)
load('Data_Readmatv6')
figure(3); clf
set(gcf,'position',[432   289   933   384])
subplot('position',[0.1 0.1 0.38 0.8]);
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
% Add Theoretical Flat Plates
Re = 1E5:100:1E8;
CdL = 1.33*Re.^(-0.5);
CdT = 0.072*Re.^(-0.2);
plot(Re,CdL,'k--',Re,CdT,'k')
text(3.8E5,0.9,'A','FontSize',20,'FontWeight','Bold')

ylim([1E-3 1.5])
xlim([3E5 5E7])
xlabel('Reynolds Number, Re'); ylabel('Drag Coefficient, C_d')
set(gca,'fontsize',14)
%% add our data -- adjust this based on new data from Ding with undistorted values, etc
% video only data
subplot('position',[0.55 0.1 0.38 0.8])
for file = 1:45
    h1 = loglog(glide(file).Re,mean(glide(file).Cd_mn),'o'); hold on
    h2 = loglog(glide(file).Re,glide(file).CDAS,'o');
    if glide(file).condition == 0
        set(h1,'MarkerEdgeColor','k','MarkerFaceColor','k')
        set(h2,'MarkerEdgeColor','k')
    else if glide(file).condition == 1
            set(h1,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255],'MarkerFaceColor',[55/255 126/255 184/255])
            set(h2,'Marker','^','MarkerEdgeColor',[55/255 126/255 184/255])
        else if glide(file).condition == 3
                set(h1,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255],'MarkerFaceColor',[77/255 175/255 74/255])
                set(h2,'Marker','d','MarkerEdgeColor',[77/255 175/255 74/255])
            else set(h1,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255],'MarkerFaceColor',[228/255 26/255 28/255])
                set(h2,'Marker','s','MarkerEdgeColor',[228/255 26/255 28/255])
            end
        end
    end
end

xlabel('Reynolds Number, Re');
adjustfigurefont
ylim([1E-3 1.5])
plot(Re,CdL,'k--',Re,CdT,'k')

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

loglog(CFD_Re,CFD_Cd_notag,'color','k') % make these colours the same as the tag conditions
loglog(CFD_Re,CFD_Cd_tag,'color',[55/255 126/255 184/255])
loglog(CFD_Re,CFD_Cd_tag4,'color',[77/255 175/255 74/255])
text(3.8E5,0.9,'B','FontSize',20,'FontWeight','Bold')
set(gcf,'paperpositionmode','auto')
xlim([3E5 5E7])
set(gca,'fontsize',14)
print('AllCdData','-dpng','-r300')

