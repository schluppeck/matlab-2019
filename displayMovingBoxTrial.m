function displayMovingBoxTrial(theColor, xCenter, yCenter, baseRect, window, vbl, screenXpixels )
%displayMovingBoxTrial - display a moving box "trial" with a particular theColor
%
% this was broken out of the psychtoolboxexample script
% purpose: display a moving box (with a particular color)
%
% Note: this kind of works, but passing all the arguments in as individual
%       arguments could be handled better (we did this as version 1.0 to get it
%       to work... to REFACTOR this [make it better], I would consider passing in
%       info that belongs together e.g. |xCenter, yCenter, ...| as a |struct|, so
%       it is only ONE variable: in SCRIPT "package up" info thus...:
%
%            geom.xCenter = xCenter;
%            geom.yCenter = yCenter;
%            geom.baseRect = baseRect;
%            geom.screenXpixels = screenXpixels;
%            etc...
%
%      this would mean only passing 1 variable in (which you can easily change around
%      and pass back out of the function....)
%
% ds 2019-05-02

% this code from PETER SCARFE's demo, documentation!

% Our square will oscilate with a sine wave function to the left and right
% of the screen. These are the parameters for the sine wave
% See: http://en.wikipedia.org/wiki/Sine_wave
amplitude = screenXpixels * 0.25;
frequency = 0.2;
angFreq = 2 * pi * frequency;
startPhase = 0;

waitframes = 1;

% Query the frame duration
ifi = Screen('GetFlipInterval', window);

% things that need to come into the function:

% need to figure this out [[ see note in help! ]]
% theColor -- this is fed into the function as the first argument
% xCenter -2nd
% baseRect -3rd
% window 4th
% vbl
% screenXpixels

% reset time to 0
time = 0;

% Loop the animation until a key is pressed
while ~KbCheck

    % Position of the square on this frame
    xpos = amplitude * sin(angFreq * time + startPhase);

    % Add this position to the screen center coordinate. This is the point
    % we want our square to oscillate around
    squareXpos = xCenter + xpos;

    % Center the rectangle on the centre of the screen
    centeredRect = CenterRectOnPointd(baseRect, squareXpos, yCenter);

    % Draw the rect to the screen
    Screen('FillRect', window, theColor, centeredRect);

    % Flip to the screen
    vbl  = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);

    % Increment the time
    time = time + ifi;

end

% make sure to wait for s short amount because key presses by humans last too long
% (and matlab is too fast... so we'll skip through other loop in script too quickly!)
WaitSecs(0.5);
