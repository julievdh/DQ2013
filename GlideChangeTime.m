% Compare time 1 and time 2 of glides to see if learn within an animal or
% trial.

% example
figure(1); hold on
plot(glide(1).Cd_mn(1),glide(2).Cd_mn(1),'o')
plot(glide(2).Cd_mn(1),glide(3).Cd_mn(1),'o')
plot(glide(3).Cd_mn(1),glide(4).Cd_mn(1),'o')
plot(glide(4).Cd_mn(1),glide(5).Cd_mn(1),'o')
plot(glide(5).Cd_mn(1),glide(6).Cd_mn(1),'o')

plot(glide(7).Cd_mn(1),glide(8).Cd_mn(1),'o')
plot(glide(8).Cd_mn(1),glide(9).Cd_mn(1),'o')
plot(glide(9).Cd_mn(1),glide(10).Cd_mn(1),'o')
plot(glide(10).Cd_mn(1),glide(11).Cd_mn(1),'o')

plot(glide(12).Cd_mn(1),glide(13).Cd_mn(1),'o')
plot(glide(13).Cd_mn(1),glide(14).Cd_mn(1),'o')
plot(glide(14).Cd_mn(1),glide(15).Cd_mn(1),'o')
plot(glide(15).Cd_mn(1),glide(16).Cd_mn(1),'o')
plot(glide(16).Cd_mn(1),glide(17).Cd_mn(1),'o')
plot(glide(17).Cd_mn(1),glide(18).Cd_mn(1),'o')
plot(glide(18).Cd_mn(1),glide(19).Cd_mn(1),'o')

% follow that model

plot([0 .1],[0 .1],'k')

%% or: through time
for i = 1:45
    Cd_mn(i) = nanmean(glide(i).Cd_mn);
    CDAS(i) = glide(i).CDAS;
end

figure(2); clf; hold on
plot(Cd_mn(1:6),'^-','color','b') % hoku tag
plot(Cd_mn(7:11),'o-','color','k') % hoku no tag
plot(Cd_mn(12:22),'d-','color','g') % hoku tag+4
plot(Cd_mn(23:24),'o-','color','k') % hoku no tag

plot(Cd_mn(25:26),'s--','color','r') % liho tag +4
plot(Cd_mn(27:31),'^--','color','b') % liho tag
plot(Cd_mn(32:37),'s--','color','r') % liho tag +4
plot(Cd_mn(38:41),'d--','color','g') % liho tag +2
plot(Cd_mn(42:45),'o--','color','k') % liho control
figure(3); clf; hold on
plot(CDAS(1:6),'^-','color','b') % hoku tag
plot(CDAS(7:11),'o-','color','k') % hoku no tag
plot(CDAS(12:22),'d-','color','g') % hoku tag+4
plot(CDAS(23:24),'o-','color','k') % hoku no tag

plot(CDAS(25:26),'s--','color','r') % liho tag +4
plot(CDAS(27:31),'^--','color','b') % liho tag
plot(CDAS(32:37),'s--','color','r') % liho tag +4
plot(CDAS(38:41),'d--','color','g') % liho tag +2
plot(CDAS(42:45),'o--','color','k') % liho no tag