function [ c ] = myMultiply(a, b)
%myMultiply - multiplies the absolute values of a and b
%
%      usage: [ c ] = myMultiply( a, b )
%         by: lpzds1
%       date: Apr 22, 2014
%        $Id$
%     inputs: a, b
%    outputs: c
%
%    purpose: c = abs(a) .* abs(b)
%
%        e.g: myMultiply(-2, 2)
%             a = [1, -1, 2]; b = [1, 10, -0.2];
%             myMultiply(a, b); % should work
%
%   see also: abs

% error checking on sizes

% in words:
%   if any of the following is the case:
%      elements of a vector describing size of a
%      NOT EQUAL elements of a vector describing size of b

if any(size(a) ~= size(b) )
    error('size of input arguments mismatch')
end

% the .* respects vectors, matrices as well as numbers,
c = abs(a) .* abs(b);

end