function [  ] = plotFixations(x, y, trialNum, linespec)
%plotFixations - plot eye fixation data
%
%      usage: [  ] = plotFixations( x, y, trialNum )
%         by: ds1
%       date: Apr 14, 2014
%        $Id$
%     inputs: x, y, 
%             trialNum - defaults to 1, if none provided
%    outputs: 
%
%    purpose: Plots eye position as a function of time during trials. The
%    input arguments x and y can be column vectors (for only one trial) or
%    matrices (for 2 or more trials).  
%
%        e.g: 
%               load exFixation % provides |datax| and |datay|
%               plotFixations(datax, datay, 3) % plot data from trial #3

% error checking and setting defaults
if nargin < 4
    linespec = {'color',[1 .2 .2], 'linewidth', 1};
end

% make it a cell array if it isn't already... this will allow it to be
% expanded below
if ~iscell(linespec), linespec = {linespec}; end

if nargin < 3
    disp('(plotFixations) using trial #1 as default')
    trialNum = 1;
end

% if data were provided correctly, then size(x,1) and size(y,1) are the
% same
% also - the first dimension corresponds to time

if ~all(size(x) == size(y))
    error('(plotFixations) data dimensions mismatch: x,y!')
end

% time points: dimension 1
% trials: dimenaion 2
t = 1:size(x,1);

if trialNum > size(x,2)
    error('(plotFixations) trialNum is too large')
end

% could also check for integer value, etc.

% do not make a new figure window
% but make several subplots:

figure

subplot(4,1,1)
% plot x data as a function of time, for the trial num!
plot(t, x(:,trialNum), linespec{:} )
ylabel('X-position')

subplot(4,1,2)
% plot y data as a function of time, for the trial num!
plot(t, y(:,trialNum), linespec{:} )
xlabel('Time (samples)')
ylabel('y-position')

subplot(4,1, [3 4]  )
% plot y data as a function of time, for the trial num!
plot(x(:,trialNum), y(:,trialNum), linespec{:} )
axis([0 200 0 400])
axis image
xlabel('x-position')
ylabel('y-position')


end