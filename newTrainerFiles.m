function [varname] = newTrainerFiles(filename)
% load new data from Joaquin, but do it in a function to keep things clean 

for i = 1:length(filename)
load(filename)
varname = speed; 
end
