function sz = trackSize(file)
% calculate size of swimming track
sz(1) = max(file.lap1(:,2))-min(file.lap1(:,2));
sz(2) = max(file.lap2(:,2))-min(file.lap2(:,2));
sz(3) = max(file.lap3(:,2))-min(file.lap3(:,2));
end
