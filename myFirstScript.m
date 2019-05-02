%% An example of a line plot
% Denis Schluppeck
%
% 2019-04-30, for the matlab course
%
% A first script that shows everyone 
% how to find out information about 
% graphics properties and how to change them
%
% see also: plot, plotThingsMyWay

%% Specify some variables
n = 20;
t = 1:n;

% signal is going to be some curve

sig = 0.3 .* (t.^2);

%% Create the plots

figure();
plot(t,sig) 

xlabel('Time (au)')  % " are not cool
ylabel('Some signal')

%% Some examples of how to turn m-code into documents
%
%
% 
% * list item 1
% * something else to remember
% 
%
% $$e^{\pi i} + 1 = 0$$
% 
% |MONOSPACED TEXT|


