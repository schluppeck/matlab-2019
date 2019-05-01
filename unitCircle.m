function [ xy ] = unitCircle(theta)
%unitCircle - return x- and y-projections of point on unit circle
%
%      usage: [ x, y ] = unitCircle( theta )
%         by: lpzds1
%       date: Apr 12, 2014
%        $Id$
%     inputs: theta
%    outputs: x, y
%
%    purpose: Given an angle theta, return x = cos(theta) and y = sin(theta)
%
%        e.g: 

if ~isnumeric(theta)
    error('(unitCircle) you need to provide a numeric input')
end

% the projections are:
x = cos(theta);
y = sin(theta);

% return as a pair
xy = [x(:), y(:)];
end