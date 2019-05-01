function [ h_ ] = visualizeTimeseriesData(t, data)
%visualizeTimeseriesData - function that plots timeseries data
%
%      usage: [ h_ ] = visualizeTimeseriesData(t, data )
%         by: lpzds1
%       date: Apr 16, 2015
%        $Id$
%     inputs: [t], data
%    outputs: h_
%
%    purpose: A function that takes as input some data. Each row contains
%       the time series form a voxel, or electrode, or sensor. Each column a
%       measurement at a time point. This function displays the median across
%       rows as a line plot and a shaded error region indicating the 10/90 
%       and then 25/75 centiles (interquartile range) in two different shades 
%       of grey    
%
%        e.g:  nTimePoints = 48;
%              t = 0:(nTimePoints-1);
%              data = randn(100, nTimePoints); % 100 voxels, 48 timepoints
%              visualizeTimeseriesData(t, data)
%

if numel(t) ~= size(data,1) && numel(t) ~= size(data,2)
    disp('(visualizeTimeseriesData) t and data sizes mismatch!')
    return
end

if size(data, 1) == 1
    disp('(visualizeTimeseriesData) this function only works for arrays not vectors')
    return
end


m = median(data, 1); % actually the 50th centile
eInterdecile = prctile(data, [10 90], 1);
eInterquartile = prctile(data, [25 75], 1);

errorSurface(t, m, eInterdecile, [1 1 1]*0.9);
hold on
errorSurface(t, m, eInterquartile, [1 1 1]*0.8);
plot(t, m, 'r-', 'linewidth',3);



end