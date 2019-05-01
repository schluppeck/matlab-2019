function [ out ] = percentChange(data)
%percentChange - converts rows of data to percent change
%
%      usage: [ Takes one or many rows of data and subtracts the mean and then divides by it. This converts the input to percent signal change. This function here as some additional checks to see if any of the means over the rows are close to zero. This is to avoid some numerical problems we might encounter when dividing by very small nnumbers ] = percentChange( data )
%         by: lpzds1
%       date: Apr 17, 2015
%        $Id$
%     inputs: data
%    outputs: out
%    purpose: Takes one or many rows of data and subtracts the mean and then divides by it. This converts the input to percent signal change. This function here as some additional checks to see if any of the means over the rows are close to zero. This is to avoid some numerical problems we might encounter when dividing by very small nnumbers
%
%
%        e.g: 
%             x = randn(1,100) + randi(10,1,1); % gaussian noise around some mean
%             p = percentChange(x);

m = mean(data,2); % the mean across the columns. this will be a column vec

if any(m < 10e-10)
    warning('(uhoh) dividing by a very small number - this might be trouble')
end

% need to replicate that column as many times as we have "time points"
% and then subtract
% make use of the fact that (d - d_m) / d_m = (d / d_m) - 1
% this is a bit more compact to write.
out = 100 .* (data ./ repmat(m, 1, size(data,2)) - 1); 

end