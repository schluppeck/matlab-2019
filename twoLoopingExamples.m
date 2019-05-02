%% an example of how to use looping
%
% ds 2019-05-02, matlab course

%% load in some fMRI data (stored in a MAT file)

load('manyTimecourses.mat');

% data is organised as follows"
% - each row contains a timecourse from a voxel
% - each column the value of the fMRI response at t=1, t=2, ..

%% find out how many rows of data there are

% length() %! careful not always safe, because it gives LONGEST dim
sz = size(data);
sz(1) % how many rows
sz(2) % how many columns

nRows = size(data, 1);
nColumns = size(data, 2);

%% loop over rows and calculate something
% figure

% make some space for the results of a calculation
allMeans = nan(nRows,1); % pre-filled with N/A

tic
for iRow  = 1:nRows
    % iRow will go from 1... how ever many rows we have

    % select row iRow from the array DATA?
    currentTimecourse = data(iRow, :);
    meanOfTimecourse = mean(currentTimecourse);

    % keep hold of meanOfTimecourse... so we don't loose it.
    allMeans(iRow) = meanOfTimecourse;

    %plot(currentTimecourse);
    %hold('on')

end
toc
figure
histogram(allMeans)


%% using a loop to show what curves with a particular equation look like
%
% y = a * x ^2 ..  x^3

% plot of y = x^N ... n=1, n=2, n3 ...

% make x values so I can calculate and plot my y's

% -5, +5
x = -5.0:0.2:+5.0;  % in steps of 0.2

% -5, +5, need to have exactly 100 points
x = linspace(-1, +1, 101);

% for one choice of this parameters... 1 ..**2**..3..4
y = x.^3;

% for many values of a:
allParams = [1, 2, 3, 4, 5, 6 ];
nParams = numel(allParams);

figure

for iParam = 1:nParams
    % pick off the i'th element of the list of params
    currentParam = allParams(iParam);

    % calculate the new Y
    y = x.^currentParam;
    % plot
    plot(x,y)
    hold('on')
end


%% show progress bar

h = waitbar(0,'Please wait...');
for i=1:1000
   % computation here %

   % the following line updates the wait bar i increments
   % i grows... from 1 to 1000, so i/1000 grows from 0...1
   waitbar(i/1000,h)
end
close(h)

%% related to waitbar
