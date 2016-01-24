function file = vidPad(file);
% find gaps
file_shift = file(2:end,1);
ii = find(file(1:end-1,1)-file_shift < -0.3); %>1 time step? 3 time steps? 3

mat2 = [NaN NaN NaN];
% insert row
for i = 1:length(ii)
    file_pad = insertrows(file,mat2,ii(i));
    file = file_pad;
    ii = ii+1; % update ii 
end

