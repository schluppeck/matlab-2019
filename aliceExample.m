%% alice example
%
% loading in many files and processing data
%
% ds 2019-05-01, matlab course

%% loop over files and load data in

% option 1: make filenames:
nSubjects = 20;

for iSubject = 1:nSubjects
    % make a piece of text that looks like
    % Alice_p1.mat, Alice_p2.mat ...
    %iSubject
    
    %NB! numbers and text are not the same...
    % need to convert the number 1 to '1'.
    
    filename = [ 'Alice_p', num2str(iSubject) , '.mat' ];
    
end
% actually, we'll proabbly go with option #2, which grabs filenames that
% actually exist.

%% option # 2
% get listing of files that match certain criteria
% loop over all those files and load in data..
allFilenames = dir('Alice_*.mat');

% -> REGULAR EXPRESSIONS...

nSubjects = numel(allFilenames);
% loop over all these (and use the "name" field as the filename to load)

allData = [];
% thought: keep error rates as reality check??

% also make space for RT data
allRTs = [];

for iSubject = 1:nSubjects
   
    filename = allFilenames( iSubject ).name;
    
    load(filename) % this loads (and overwrites) "d" every time through the loop
    % allData = [allData, d]
    
    % for this subject, how big is the errorRate??
    e = calculateErrorRate(d);
    
    % calculate reaction times for each trialType...
    rt1 = calculateReactionTimes(d,1);
    rt2 = calculateReactionTimes(d,2);
    rt3 = calculateReactionTimes(d,3);
    allRTs = [allRTs; 
              rt1, rt2, rt3];
    
    % if the errorRate for this subject is <= 0.1
    % the world is a beautful place!
    % otherwise... we have to throw data away and our 
    % supervisor will make us collect more data
    
    if e <= 0.1
        allData = cat(3, allData, d);
    % else... skip the adding step.
    end
end





%% how to store data? check!

%% how to calculate error rate ! done...
% decided to censor the data right at loading / storing stage...

%% how to caluclate reaction time (for each cond)
% function that takes the whole table... and which condition

%% visualise, report? plot.