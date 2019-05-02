%% the log of pretty much all the stuff I typed at the command prompt
%
% everything else ended up being written inside a script of function.
%
% 2019-05-02, schluppeck

%-- 30/04/2019, 10:10 --%
plot(s1psy.VarName1)
plot(s1psy.VarName2)
plot(s1psy.VarName4)
home
clc
3/2
?
pi
help pi
home
2 .* pi
2 ^ 8
2 .^ 8
4^3
home
64 ^ 1/3
64 ^     (1/3)
64 .^     (1./3)
home
2^-1
2.^(-1)
a = [3, pi, 10, 1; 2 7 4 1]
a
a(:,2)
a(1,4)
home
a(1)
a
a(3)
a(4)
home
a(9)
a(4,4)
a(4,4) = 2
mean(a)
mean(a,1)
mean(a,2)
home
f = 1:100
reshape(f, [10 10])
home
x = rand(10,1)
x > 0.7
rand(10,1) > 0.7
clear all
clc
load('timecourse.mat')
plot(timecourse)
periodogram(timecourse);figure(gcf)
comet(timecourse)
ccc
fmriExample = timecourse(9:end)
theT = timeVector(9:end)
theT
clear all
close all
figure, plot(x,y)
close all
clear all
home
myFirstScript
c = 1:100;
d = rand(100,1);
plotThingsMyWay(c,d)
help myFirstScript
home
convertInchesToMM
convertInchesToMM(10)
convertInchesToMM(0)
convertInchesToMM(42)
convertInchesToMM(5)
convertInchesToMM(2.5)
clc
L = [0, 10, 23, 4, 5]
convertInchesToMM(L)
L = randi(100, 10, 25)
convertInchesToMM(L)
%-- 01/05/2019, 09:15 --%
cd /Volumes/MATLAB2019/code/
clc
load('Alice_p1.mat')
which table
which myTable
which row
home
d
home
returnRow( d, 5)
home
returnRow( d, [1,3,5])
addpath(genpath('/Volumes/practicals/ds1/mgl/'))
mglTestDots(0)
mglClose
rehash path
mglClose
mglOpen
%-- 01/05/2019, 11:22 --%
ori
p
cd ~/
aFirstScript
edit startup
help sound
%-- 01/05/2019, 14:17 --%
help sound
help membrane
figure, membrane()
axis('vis3d'), axis off
print(gcf, 'membrane.png','-dpng', '-r300')
myaa
print(gcf, 'membrane-aa.png','-dpng', '-r300')
close all
clear all
clc
aliceExample
char(56)
char(98)
aliceExample
allFilenames(1)
name
allFilenames.name
numel(allFilenames)
allFilenames(1)
allFilenames(3)
allFilenames(4)
allFilenames(4).name
clc
allData(:, :, 10)
allData(:, :, 6)
calculateErrorRate(d)
help calculateErrorRate
load Alice_p1.mat
calculateErrorRate(d)
help calculateErrorRate
clc
help calculateReactionTimes
% this is how to use it
load Alice_p1.mat
calculateReactionTimes(d, 2)
calculateReactionTimes(d, 1)
calculateReactionTimes(d, 3)
close all
clear all
allRTs
mean(allRTs)
std(allRTs)./sqrt( size(allRTs,1) )
M = mean(allRTs)
bar(M)
S = std(allRTs)
hold on
errorbar(M, S)
close all
clear all
cd ~/Desktop/
DownloadPsychtoolbox
yes
addpath(genpath('/Users/Shared/Psychtoolbox'))
which Screen
! open /Users/Shared/Psychtoolbox
edit BasicSoundOutputDemo.m
BasicSoundOutputDemo
SimpleDots
addpath(genpath('/Volumes/practicals/ds1/mgl'))
which mglOpen
mglTestDots(0)
visualChangeColours
visualMinimalMove
%-- 02/05/2019, 09:26 --%
edit startup
cd ~/Desktop
DownloadPsychtoolbox
yes
clc
DownloadPsychtoolbox
yes
no
clc
clear all
cd /Volumes/MATLAB2019/code/
plot(data,'DisplayName','data')
plot(data'  ,'DisplayName','data')
t
clc
length(data)
a = ones(5, 48);
lengtha(a)
length(a)
clc
size(a)
size(data)
allMeans
clc
demoPlotFamilyOfCurves
close all
clc
clear all
close all
help save
clc
save('allPsychophysicsData.mat')
clear all
load('allPsychophysicsData.mat')
save('somePsychophysicsData.mat', 'ori', 'p4' )
clc
plot(p4)
plot(p4, 'o-')
clc
help createPsychophysicsFit
createPsychophysicsFit(ori, p3)
createPsychophysicsFit(ori, p2)
normcdf( 9, 0.6751,11.35)
normcdf( 0, 0.6751,11.35)
y = normcdf( -20:0.5:20, 0.6751,11.35)
figure, plot(y)
help norminv
norminv( 0.5, 0.6751,11.35)
f = createPsychophysicsFit(ori, p3)
f
coeffnames(f)
coeffvalues(f)
ci = predint(f, -20:0.5:20)
hold on
plot(ci)
figure, plot(y), hold on, plot(ci, 'r')
f = createPsychophysicsFit(ori, p3)
