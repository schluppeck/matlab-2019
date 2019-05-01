function [  ] = plotFixationsInWindow(x, y, trialNum, fixationWindow)
%plotFixationsInWindow - plot fixation data in particular window
%
%      usage: [  ] = plotFixationsInWindow( x, y, trialNum, fixationWindow )
%         by: lpzds1
%       date: Apr 14, 2014
%        $Id$
%     inputs: x, y, trialNum, 
%             fixationWindow [x0 y0 x1 y1] -- lower left to upper right.
%    outputs: 
%
%    purpose: similar to plotFixations - but here, you can specify a window
%             of interest. The function will highlight fixations in that window 
%             and estimate the proportion of time spent there.
%
%       e.g: 
%            load exFixation % provides |datax| and |datay|
%            plotFixationsInWindow(datax, datay, 3, [70 200 130 230]) 
%
%
%   see also: plotFixations
        

% error checking and setting defaults
if nargin < 4
    fixationWindow = []; % make it empty - that's easy to test for
end

if nargin < 3
    disp('(plotFixationsInWindow) using trial #1 as default')
    trialNum = 1;
end

% if data were provided correctly, then size(x,1) and size(y,1) are the
% same
% also - the first dimension corresponds to time

if ~all(size(x) == size(y))
    error('(plotFixationsInWindow) data dimensions mismatch: x,y!')
end

% time points: dimension 1
% trials: dimenaion 2
t = 1:size(x,1);

if trialNum > size(x,2)
    error('(plotFixationsInWindow) trialNum is too large')
end

% could also check for integer value, etc.

% here is the LOGIC part of the function that checks which data points are
% within the xy limits provided by fixationWindow

inWindowX = ( x(:,trialNum) > fixationWindow(1) ) & ... % left
            ( x(:,trialNum) < fixationWindow(3) );

inWindowY = ( y(:,trialNum) > fixationWindow(2) ) & ... % bottom
            ( y(:,trialNum) < fixationWindow(4) );

inBothWindows = inWindowX & inWindowY;

% do not make a new figure window
% but make several subplots:

figure

subplot(4,1,1)
% plot x data as a function of time, for the trial num!
plot(t, x(:,trialNum), 'b-' , 'linewidth', 1 )
hold on
% and now "overplot" the points within the fixation window in RED
plot(t(inBothWindows), x(inBothWindows,trialNum), 'r.' )
ylabel('X-position')

subplot(4,1,2)
% plot y data as a function of time, for the trial num!
plot(t, y(:,trialNum), 'g-', 'linewidth', 1  )
hold on
% and now "overplot" the points within the fixation window in RED
plot(t(inBothWindows), y(inBothWindows,trialNum), 'r.' )
xlabel('Time (samples)')
ylabel('y-position')

subplot(4,1, [3 4]  )
% plot y data as a function of time, for the trial num!
plot(x(:,trialNum), y(:,trialNum), 'k-', 'linewidth', 1 )
hold on
% and now "overplot" the points within the fixation window in RED
plot(x(inBothWindows,trialNum), y(inBothWindows,trialNum), 'r.' )

% and now add a box with the window, too!
f = fixationWindow;
l_ = line( fixationWindow([1 3; 3 3; 3 1; 1 1]), ...
            fixationWindow([2 2; 2 4; 4 4; 4 2]) );
set(l_, 'linewidth', 2, 'color', [1 1 1]*0.5);

axis([0 200 0 400])
axis image
xlabel('x-position')
ylabel('y-position')




end