%% make a simple mgl script
% explore stimulus display / following short talk on OpengGL drawing model
%
% 2019-05-02, schluppeck for matlab course

mglOpen(0)

mglClearScreen(0.5);

mglScreenCoordinates();

mglQuad([100; 600; 600; 100], ...
        [100; 200; 600; 100], ...
        [1; 0; 0], ...
        1);

%% flip screen
mglFlush()

%% wait for a bit (otherwise it's instantaneously removed)
mglWaitSecs(2.0);

%% clean up
mglClose()

%% use psychtoolbox to do something similar
%
% please look at psychtoolboxExampleScript
