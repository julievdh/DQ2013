% DQsubplot
% 18 Aug 2016

% make a figure with four subplots for different animals

    if isempty(strfind(filenames{i},'Lono')) == 0
        subplot(221); hold on
    else if isempty(strfind(filenames{i},'Nainoa')) == 0
            subplot(222); hold on
        else if isempty(strfind(filenames{i},'Kolohe')) == 0
                subplot(223); hold on
            else 
                subplot(224); hold on
            end
        end
    end
