function meanRT = calculateReactionTimes( data, trialType )
% calculateReactionTimes - calculate RTs for Alice data
%
%    given data like trialNum, RT, error?
% .  calculate the mean reaaction time for a particular trial type
%
%  e.g.: % this is how to use it
%        load Alice_p1.mat
%        calculateReactionTimes(d, 2)
%
% ds 2019-05-01, matlab course

% errorRate = mean( data(:,3) );

% which trials: i need to go to column 1
idx = data(: , 1) == trialType;

meanRT = mean( data(idx , 2)); % RTs are in column 2

end