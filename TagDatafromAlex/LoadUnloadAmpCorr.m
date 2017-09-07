% Amplitude Correction DQ Loading/Unloading
L = [2.73 2.73 2.61 2.61];
for i = [1,3]
    ampexp = 0.2*L(i);
    
    corctn = ampexp/Summary(i,5).flukePitchAmpMean; % correct for Tag is last
    
    % correct all amplitudes
    for j = 1:5
        Summary(i,j).ampcorctn = corctn.*Summary(i,j).flukePitchAmpMean;
    end
    
end

for i = [2,4]
    ampexp = 0.2*L(i);
    
    corctn = ampexp/Summary(i,1).flukePitchAmpMean; % Tag is first 
    
    % correct all amplitudes
    for j = 1:5
        Summary(i,j).ampcorctn = corctn.*Summary(i,j).flukePitchAmpMean;
    end
    
end