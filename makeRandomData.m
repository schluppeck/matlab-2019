% code that produced the randomData.mat dataset for the Matlab course
%
% ds 20140420

% reset random seed
rng('default');

% sample1
n1 = 860;
mu1 = 1.2;
sigma1  = 2.3;

r1 = sigma1*randn(n1, 1) + mu1;

% and sample2
n2 = 920;
mu2 = 4.65;
sigma2  = 1.2;

r2 = sigma2*randn(n2, 1) + mu2;

save('randomData', 'r1', 'r2');
