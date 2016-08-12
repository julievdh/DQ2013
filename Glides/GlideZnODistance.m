% What is distance between ZO2 points? Is it consistent?
% close all; clear all

% Import glide structure
% load('GlideStructure.mat')
    
% what is first ZO2?
for file = 1:length(glide);
first = glide(file).ZO2(1);
% remove all ZO1 before first ZO2
glide(file).ZO1 = glide(file).ZO1(glide(file).ZO1(:,1) > first,:);

% also will have to remove all points after
if length(glide(file).ZO2)-length(glide(file).ZO1) > 0
    glide(file).ZO2 = glide(file).ZO2(1:length(glide(file).ZO1),:);
else if length(glide(file).ZO2)-length(glide(file).ZO1) < 0
        glide(file).ZO1 = glide(file).ZO1(1:length(glide(file).ZO2),:);
end
end

% calculate distance between ZO1 and ZO2 points
% from first shared to last shared points
figure (1); clf; hold on
    plot(glide(file).ZO1(:,2),glide(file).ZO1(:,3))
    plot(glide(file).ZO2(:,2),glide(file).ZO2(:,3))
    % calculate distance
    for i = 1:length(glide(file).ZO1)
        d(i,file) = pdist([glide(file).ZO1(i,2:3);glide(file).ZO2(i,2:3)],'euclidean');
    end
    % replace NaNs
     d(d == 0) = NaN;
% plot distance
figure(2); clf; hold on
    plot(d)
    xlabel('Sample Number'); ylabel('Distance between points')
 %   pause
    
end

% variation in distance between the points:
nanstd(d)