function errorRate = calculateErrorRate( data )
% calculateErrorRate - calculate error rate for Alice data
%
%    given data like trialNum, RT, error?
% .  calculate the error rate as the mean of the third column
%
%  e.g.: % this is how to use it
%        load Alice_p1.mat
%        calculateErrorRate(d)
%
% ds 2019-05-01, matlab course

errorRate = mean( data(:,3) );

end