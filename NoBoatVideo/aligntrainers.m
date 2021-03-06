function [file1,file2] = aligntrainers(file1,file2)
%% align trainers
% allows for video tracks to be aligned based on trainer positions
% inputs: structures for two individual files (with .trainer and .lap
% positions)
%   file1 = file that will change
%   file2 = file that is the standard to be corrected to
% outputs feed back into inputted structures


% plot the two files
% separate colours illustrate trainer number in case they are in a
% different order
figure(2); hold on
for i = 1:length(file1.trainers) % if file has only 3 trainers visible, will stop there
    plot(file1.trainers(i,2),file1.trainers(i,3),'o')
    plot(file2.trainers(i,2),file2.trainers(i,3),'^')
end
legend('1','1','2','2','3','3','4','4')

% make sure trainers are in same order
% use sort command if needed?
% if only three trainers are visible
if length(file1.trainers) < 4
    % calculate shifts based on first 3 trainers in file 2
    xshift = file2.trainers(1:3,2) - file1.trainers(:,2);
    % check to see if they were the right ones
    if max(abs(xshift)) > 2 % if xshift is really big then you're off
        [mx,i] = max(abs(xshift)); % find which one is wrong
        xshift = file2.trainers([1:i-1,i+1:end],2) - file1.trainers(:,2); % do with new indices
        xshift = mean(xshift);
        yshift = mean(file2.trainers([1:i-1,i+1:end],3) - file1.trainers(:,3)); % do for y as well
    end
else
    % adjust vertical (take average offset for all four points)
    % workaround will have to be made for when only 3 trainers were seen in
    % frame (if/then statement?)
    yshift = mean(file2.trainers(:,3) - file1.trainers(:,3));
    xshift = mean(file2.trainers(:,2) - file1.trainers(:,2));
end

% add new data to structure
file1.trainers_new(:,2:3) = [file1.trainers(:,2)+xshift file1.trainers(:,3)+yshift];
file1.lap1_new(:,2:3) = [file1.lap1(:,2)+xshift file1.lap1(:,3)+yshift];
file1.lap2_new(:,2:3) = [file1.lap2(:,2)+xshift file1.lap2(:,3)+yshift];
file1.lap3_new(:,2:3) = [file1.lap3(:,2)+xshift file1.lap3(:,3)+yshift];

% plot new data
plot(file1.trainers_new(:,2),file1.trainers_new(:,3),'ko')
plot(file1.lap1_new(:,2),file1.lap1_new(:,3),'.','MarkerSize',10)
plot(file1.lap2_new(:,2),file1.lap2_new(:,3),'.','MarkerSize',10)
plot(file1.lap3_new(:,2),file1.lap3_new(:,3),'.','MarkerSize',10)



