% Clear the workspace and the screen
%
% the (original) code is taken from:
% http://peterscarfe.com/movingsquaredemocode.html
%
%  we add some modifications: displaying a trial becomes a function
%  ... this allows us to present the stimuli for a few different conditions (colours)!
%
% with some extra comment and small modifications
% ds 2019-05-02

%%
sca;
close all;
clearvars;

% try/catch to avoid PTB hogging screen in black!
try

    Screen('Preference', 'SkipSyncTests',1);

    % Here we call some default settings for setting up Psychtoolbox
    PsychDefaultSetup(2);

    % Get the screen numbers (maybe there is more than 1 screen!)
    screens = Screen('Screens');

    % Draw to the external screen if avaliable
    screenNumber = max(screens);

    % Define black and white
    white = WhiteIndex(screenNumber);
    black = BlackIndex(screenNumber);

    % Open an on screen window
    [window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

    % Get the size of the on screen window
    [screenXpixels, screenYpixels] = Screen('WindowSize', window);



    % Get the centre coordinate of the window
    [xCenter, yCenter] = RectCenter(windowRect);

    % Make a base Rect of 200 by 200 pixels
    baseRect = [0 0 200 200];

    % Set the color of the rect to red
    rectColor = [1 0 0];



    % Sync us and get a time stamp
    vbl = Screen('Flip', window);


    % Maximum priority level
    topPriorityLevel = MaxPriority(window);
    Priority(topPriorityLevel);

    % creative wishful thnking: I WISH there was a function that displayed
    % one trial
    % (theColor, xCenter, baseRect, window, vbl, screenXpixels  )
    allColors = jet(3); % make 3 colors from jet colormap
    for iTrial = 1:3
        displayMovingBoxTrial(allColors(iTrial,:), xCenter, yCenter, baseRect, window, vbl, screenXpixels )
    end

catch
     sca;
     disp('we were in the CATCH part of the try/catch')
end

% Clear the screen
sca;
