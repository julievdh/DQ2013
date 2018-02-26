% BreathFlowDur

% For boat trials, calculate the duration of inhale and exhale, and the
% flow rates for all breaths before and after, so we know how metabolic
% measurements might be affected by non-linear calibration of the
% pneumotachometer at high flow rates or for short breaths. 


clear all; close all

cd /Users/julievanderhoop/Documents/MATLAB/DQ/DQ2013/RespData/Boat
filenames = {'Lono_288_C';'Lono_285_A';'Lono_287_A2';'Nainoa_285_C';...
    'Nainoa_284_A';'Nainoa_287_A2'};
for i = 1:size(filenames,1)
        load(filenames{i});
        
        if i == 1;
            allpre = pre;
            allpost = post;
        else 
            allpre = vertcat(allpre,pre);
            allpost = vertcat(allpost,post);
        end
        
        
        % pre
        meanflow_ex_pre(i) = mean(pre(:,8)); % mean flow rate exhale
        maxflow_ex_pre(i) = min(pre(:,8)); % max flow rate exhale (min because -ve)
        meanflow_in_pre(i) = mean(pre(:,7)); % mean flow rate inhale
        maxflow_in_pre(i) = max(pre(:,7)); % max flow rate inhale
        
        meandur_ex_pre(i) = mean(pre(:,18)); % mean duration exhale
        maxdur_ex_pre(i) = max(pre(:,18));% max duration exhale
        meandur_in_pre(i) = mean(pre(:,17));% mean duration inhale
        maxdur_in_pre(i) = max(pre(:,17));% max duration inhale
        
        % post
        meanflow_ex_post(i) = mean(post(:,8)); % mean flow rate exhale
        maxflow_ex_post(i) = min(post(:,8)); % max flow rate exhale (min because -ve)
        meanflow_in_post(i) = mean(post(:,7)); % mean flow rate inhale
        maxflow_in_post(i) = max(post(:,7)); % max flow rate inhale
        
        meandur_ex_post(i) = mean(post(:,18)); % mean duration exhale
        maxdur_ex_post(i) = max(post(:,18));% max duration exhale
        meandur_in_post(i) = mean(post(:,17));% mean duration inhale
        maxdur_in_post(i) = max(post(:,17));% max duration inhale        
end

%% overall values
