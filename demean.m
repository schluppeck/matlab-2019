function [ out ] = demean(data)
%demean - subtract the mean (for each row) of input
%
%      usage: [ out ] = demean( data )
%         by: lpzds1
%       date: Apr 17, 2015
%        $Id$
%     inputs: data
%    outputs: out
%
%    purpose: this function takes as input a vector or array (many rows) of
%    data and returns an array of the same size as the input with the
%    row-wise mean removed.  
%
%        e.g: 
%            x = randn(2,100); % 2 timeseries, each 100 timepoints long
%            d = demean(x); % each row of d has mean 0
%            mean(d,2) % should be all zeros

m = mean(data,2); % the mean across the columns. this will be a column vec

% need to replicate that column as many times as we have "time points"
% and then subtract
out = data - repmat(m, 1, size(data,2)); 

end