Vfave = (mean(strokes.V_frwd));

figure
plot(Vfave,net_trust,'.k')

figure
plot(Vfave,net_drag,'.r')

mean(strokes.V_frwd(:,50))