function [ result ] = ismonth(textIn)
%ismonth - function that checks whether string is a month
%
%      usage: [ result ] = ismonth( textIn )
%         by: lpzds1
%       date: Apr 12, 2014
%        $Id$
%     inputs: textIn
%    outputs: result
%
%    purpose: A little helper function (like many other is* functions in
%             Matlab) that helps you check whether a string input is
%             consistent with the name of a month.
%
%             Returns true (1) for "January", "February", etc.
%
%             Returns false (0) for inputs that
%                   - are not strings
%                   - don't have right case: e.g. "jANuary"
%
%        e.g:
%                  ismonth('January')
%                  ismonth('FRebuary')

% check if there is one input that is a string
% -- (later: return a vector / array [0 1 0 1 1]... corresponding to entries in a cell array)

if nargin < 1 || ~isstr(textIn)
    error('(ismonth) incorrect input argument. ')
end

% these are the strings that are allowed.
allowedNames = {'January', 'February', 'March', 'April', 'May', 'June', ...
    'July', 'August', 'September', 'October', 'November', 'December'};

% this line "string compares" the text in |textIn| to all the entries in
% the cell array. the result of this is a vector of 0 and 1 indicating whether the
% |textIn| matched one of the entries. If ANY of them are true, then it was
% a month!

result = any( strcmp(textIn, allowedNames) );

% if false, help people out
if result == false()
    disp(['(ismonth) you passed in ' textIn ' . Only the following are allowed:'] )
    disp(allowedNames)
    
    % a bit of a NINJA skill: using cellfun to apply a function to each
    % element:
    % cellfun(@disp, allowedNames)
    
end

end