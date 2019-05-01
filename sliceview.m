function [ h ] = sliceview( fignum )
%sliceview - simple slice viewer for 3d data
%
%      usage: [ h ] = sliceview( fignum )
%         by: ds1
%       date: Sep 09, 2013
%     inputs: fignum - optional
%    outputs: h - handle to figure
%
%    purpose: a simple window/function that loads in a 3d data set and
%    allows you to flip through slices (+ orientations) 
%
%        e.g: sliceview()
%             sliceview(3)

% print some information on the command line
% that helps the user

disp('==============================================')
fprintf('\tPress the following buttons to:\n')
fprintf('up/down\tchange slice\n')
fprintf('o/O\t\tchange orientation\n')
fprintf('c/C\t\tchange cursor\n')
fprintf('q/Esc\t\tquit\n')
disp('==============================================')

% load a data file
try
    load('anatomy.mat') % which provides 'array' and 'hdr' variables
catch
    
    [filename, pathname] = uigetfile('*.mat', 'Pick an anatomy.mat file');
    if isequal(filename,0) || isequal(pathname,0)
       disp('User pressed cancel')
       return % leave the program
    else
       load( fullfile(pathname, filename) )
       disp(['User selected ', fullfile(pathname, filename)])
    end
    
    % or you can throw an error like this:
    % error('Cannot find file anatomy.mat - please make sure it is present in current folder')
    
end

% hdr contains information, the HEADER
% array contains the actual image data to be passed to the Figure / owner.

% how to extend this + do this properly:
% - NINJA skill: reading in NIFTI files (actual neuroimaging data format)
% - check that the file/path exists, return gracefully if not
% - check the dimensions of the image in hdr and array

% check input arguments, make a figure and keep the "handle"
if nargin < 1
    h = figure(); % call figure like this, then matlab makes a new window
else
    h = figure(fignum); % provide a number
    % clear what's currently in window
    clf
end


% change the name of the figure to reflect the image we are looking at
set(h,'Name', hdr.img_name);

% the following hooks up several other functions that get triggered/executed
% when different events happen: e.g. a keypress, mouse click, scroll, etc

set(h,'KeyPressFcn',@keypress);
set(h,'toolbar','none');

% have a function that returns a slice in a particular orientation?
% start with "it would be really great to have a function that does X"
% and then just do/implement it

% decide which dimension we want to keep fixed. we'll call this the
% "orientation" of the image.
orientation = 1; % could be 1, 2, or 3
sliceNum = round(size(array, orientation)./2); % half way through the stack in particular orientation
s = returnSlice(array, sliceNum, orientation); % now grab a slice

% keep everything that we want to pass round neatly wrapped up in a
% STRUCTURE called "data"

data = struct('array', array, 'hdr', hdr, 'currentSliceNum', sliceNum, ...
    'currentOrientation', orientation, 'currentSlice', s);

% fix the colormap and the range of values
data.cmap = gray(256);
data.dataLimits = prctile(array(:),[5 95]);

% attach the wrapped up "data" to the window (handle)
set(h,'UserData',data);

% now for the first time, draw the slice now:
drawSlice(h);

end


function s = returnSlice(array, sliceNum, orientation)
% returnSlice - return a single slice from a 3d image

% check inputs
% - make sure that array is well formed

% if orientation is not given, take the last (3rd?) index fixed
if nargin < 3
    % then orientation wasn't set
    orientation = 3;
end

% select a 2d slice in the correct orientation at a particular sliceNum
switch orientation
    case 1
        s = array(sliceNum,:,:);
    case 2
        s = array(:,sliceNum,:);
    case 3
        s = array(:,:,sliceNum);
end

% now also make sure that s doesn't have some weird extraneous dimensions
% GOTCHA

s = squeeze(s);

end


function keypress(h,evnt)
% keypress - gets called every time a key is pressed

% get hold of the data for use in this function...
data=get(h,'UserData');

% disp('Pressed a key')
switch evnt.Key
    case 'uparrow'
        data.currentSliceNum = data.currentSliceNum + 1;
    case 'downarrow'
        data.currentSliceNum = data.currentSliceNum - 1;
    case {'c','C'}
        % NINJA skill
        % toggle between crosshair / arrow (if it's not already in that
        % state
        if verLessThan('matlab','8.4')
            % before R2014b, fullcrosshair is available, without warning
            pointerType = 'fullcrosshair'; 
        else
            % with R2014b, using fullcrosshair causes a warning or error
            pointerType = 'crosshair'; 
        end
        
        if ~strcmp(get(h,'Pointer'),pointerType)
            set(h,'Pointer',pointerType);
        else
            set(h,'Pointer','arrow');
        end
    case {'o','O'}  
        % NINJA skill
        % change orientation... 
        % mod(currentOrientation,3) is the remainder after division with 3,
        % so this means that we never get bigger than 3. One thing to keep
        % in mind here is that mod(x,3) returns 0, 1, 2, 0, 1, 2... so we
        % need to add 1 to make is consistent with our way of counting
        % orientation.
        %
        % help mod     
        data.currentOrientation = mod(data.currentOrientation + 1,3) + 1;
    case {'Q','q','escape'}
        disp('Byebye!')
        close(h); 
        return;
end

% check that we don't go under 0 or over the max
if data.currentSliceNum < 1
    % warn the user
    disp('(keypress) UHOH! trying to go below 0!')
    data.currentSliceNum = 1;
end
% also need to check about the max values don't go over the maximum extent
% in that orientation. my solution: set it to the max (and stop going
% higher)

if data.currentSliceNum > size(data.array, data.currentOrientation)
    data.currentSliceNum = size(data.array, data.currentOrientation);
    disp('(uhoh) had to reset slicenumber when switching orientation')
end

% now also need to put the new slice image into its place
data.currentSlice = returnSlice(data.array, ...
    data.currentSliceNum, ...
    data.currentOrientation);

% pack it up for return by the function
set(h,'UserData',data);

% and draw the new slice
drawSlice(h);

end


function drawSlice(h)
% drawSlice - draws the current slice in the window

figure(h)
% get a local copy of the data 
data = get(h,'UserData');
img = data.currentSlice;

% display (with a particular range, to make sure the colors don't "jump"
% around
imagesc(img, data.dataLimits);
colormap(data.cmap)
colorbar
axis image
axis ij

% add a text label:
t_ = text(0,0,['Slice: ' num2str(data.currentSliceNum, '%d') ] );
set(t_, 'color','w','fontsize',14, 'verticalalignment','top');

end




