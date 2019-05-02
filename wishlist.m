%% 2019 Wishlist
%
% Some things people would really like to be
% able to do (quickly, repeatedly, ...)
%
%
% ds 2019-04-30

%% Sorting trial types
%
% - sorting trial types, congruent / incongruent, error rates, 
% - from raw data -> plots (publication quality)
%
% Consider how you'd organised your data and how you can step through you
% analysis step-by-step
% Consider writing a function that has the following kind of signature

% for sorting, e.g.
load('Alice_p12.mat', 'd');
data = d;

% return sortedData as a cell array of trial types and info?
% sortedData = splitDataByTrials( data )

%% look at 
calculateErrorRate(data)
calculateReactionTimes(data, 2)

%% outliers, summary stats
% - outlier detection, summary stats, mean, std, other measure error

% check out the help for stats toolbox
% out
isoutlier(d)


%% text data, e-mails, etc.
% - name, age e-mail address, ... text data, ...

% look at **table** s in matlab. a new(er) way to deal with data with
% mixed types (text, numbers, dates, etc)

%% multivariate stats
% - multivariate stats, looking at plots of more than 1 variable (stats)


% - visual progress report, ... imageviewer, ...
%     
% - timestamps, on-offsets, video frames, ...
% - microscropy images, montage(), ...
% 
% - EMG, filtering, resampling, interpolation, ..
% - EEG, thresholds (EEGlab), scripting parameters chhoices
% 


%% psychtoolbox demo
% - visual stimuli... openGL model, make stimuli...
 
    


