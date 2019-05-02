function getUserInput(name, someOtherInfo)
%getUserInput - create errors on purpose
%
% a function that checks if the input is a string
% and throws an error if not!
%
% also illustrates how to check |nargin| to see how many
% input arguments the user has supplied
%
% 2019-05-02 schluppeck, for matlab course

if not( ischar(name) ) % name is NOT a character array: problem!
    error('kindly, please enter a string!')
end % otherwise it's fine and we can do stuff

if nargin < 2
    % user didn't give enough info to be able to use
    % "someOtherInfo"
    someOtherInfo = 'some default';
end

disp('thank you for complying...')
disp(['your string was: ', name] )
disp(' ')
disp(someOtherInfo)



end

