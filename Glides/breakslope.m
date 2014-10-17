function [s,i,STAT,fit1,fit2,brk] = breakslope(point);

% Calculate breakpoint and find slopes before and after
% Input: POINT is the 5-column digitized body point (t, x, y, v, frame)
% Outputs: 
%   s = slope information (value, SE, lv, uv) for first and second lines
%   i = intercept information (value, SE, lv, uv) for first and second
%   lines
%   STAT = fit statistics for first and second lines
%   fit 1, fit 2 = model fits
%   brk = breakpoint index


% eliminate NaNs from point
ii = ~isnan(point(:,4));
point = point(ii,:);

% calculate breakpoints in broken stick regression
AB = BrokenStickRegression(point(:,1),point(:,4),2);

% plot data and breakpoints and lines
figure(20); hold on
plot(point(:,1), point(:,4), 'b.', AB(:, 1), AB(:, 2), 'r-o')

% find index of breakpoint
ii = find(point(:,1) < AB(2,1));
brk = ii(end);

% fit slopes in different sub portions
[s(1), i(1), STAT(1)] = myregr(point(1:brk,1), point(1:brk,4),0);
[s(2), i(2), STAT(2)] = myregr(point(brk+1:end,1), point(brk+1:end,4),0);

fit1 = s(1).value*point(1:brk,1) + i(1).value;
fit2 = s(2).value*point(brk+1:end,1) + i(2).value;

% plot
figure(20); hold on
plot(point(1:brk,1),fit1,'k')
plot(point(brk+1:end,1),fit2,'k')
xlabel('Time (s)')
ylabel('Speed (m/s)')

end
