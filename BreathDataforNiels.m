% breath data for Niels
clear
R = loadaudit('tt13_266a');
%%
breath = findbreathcues(R);
ibi = diff(breath(:,1)); ibi = ibi(ibi>0.5);
dur = (max(breath(:,1))-min(breath(:,1)))/60;

tbl = [dur min(ibi) max(ibi) median(ibi) mean(ibi) std(ibi)];
