function plotThingsMyWay(X1, Y1)
%CREATEFIGURE2(X1, Y1)
%  X1:  vector of x data
%  Y1:  vector of y data

%  Auto-generated by MATLAB on 30-Apr-2019 14:22:47

% Create figure
figure1 = figure('Color',...
    [0.941176474094391 0.941176474094391 0.941176474094391]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(X1,Y1,'ZDataSource','','MarkerFaceColor',[1 1 1],'MarkerSize',15,...
    'Marker','o',...
    'LineWidth',2);

% Create ylabel
ylabel('Some signal');

% Create xlabel
xlabel('Time (au)');

box(axes1,'on');