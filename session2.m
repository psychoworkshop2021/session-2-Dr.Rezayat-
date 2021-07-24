%% In His Exalted Name
% Psychophysic Workshope 2021  (Held in: Psychology & education school
% University of Tehran)
%
%
%written by : Fatemeh Fallah
%
%
%fh.fallah90@gmail.com
%
%last edition : 2021/7/20

close all;
clear all;
clc;
% path_code = 'D:/Workshop-psycho/session2/supplementary/';
path_code = cd;%'D:/Workshop-psycho/session2/supplementary/';

addpath(genpath(path_code));
%% Finding values within a Matrix

x = rand(1,10);

indicesWhereBig = find(x>.5);
valuesWhereBig1 = x(indicesWhereBig);

valuesWhereBig2 = x(find(x>.5));
% the equivalent of two above lines

%% Logical indexing

% example 1
logicalIndices = x>.5;
whos logicalIndices

logicalValues = x(logicalIndices);
x(x>.5); 
% equivalent to x(find(x>.5))


% example 2   
newvec = [1 0 0 0 0 1 1 0 1 0];
whos newvec

x(newvec); 
%Error 

newvec = logical(newvec);
x(newvec);

% example 3
Matrix1 = [1:100];
Matrix1(Matrix1<=23);


Matrix2 = [1:10];
Matrix2(Matrix2<5) = 0;
%% Getting the truth
1 == 2;
1 < 2;
1 = 2;  
% Error: The expression to the left of the equals sign is not a valid target for an assignment.
x = 5;
x < 100;
%% Testing the truth

% example 1
x = 5; y = 1;

x>4 && y>4;
%ans=0 False

(x>4) && (y>4);
%ans=0 False

(x>4) || (y>4);
%ans=1 True

(y>4);
%ans=0 False

~(y>4);
%ans=1 True


% example 2
x = 'hello';
y = 'goodbye';
x == y;  
%Error using  ==  Matrix dimensions must agree.
 
%help strcmp
 
TF1 = strcmp(x,y);
%TF1=0 False

y   = 'Hello';
TF2 = strcmp(x,y);
%TF2=0 False

TF3 = strcmpi(x,y);
%TF3=1 true
%% Conditionals-Function

isItBigger(x,y);

isItNine(x);

pickAFruit(color,fruitsize);
 
doLoop1_for();

doLoop2_for();
%% Matlab’s Anti-loop bias

%Loop version:
x        = .01;
for k    = 1:1001
    y(k) = log10(x);
    x    = x + .01;
end
%% Matlab’s Anti-loop bias

% Vector version:
x = .01:.01:10;
y = log10(x);
%% While loops-Function

doLoop3_while();

doLoop4_while();

doesNothing(score,subjectName);

debugDemo(subjectCode);
%% Saving variables

age            =30;
employee       ='chef';
mycell         ={'hello',2};
patient(2).name='Jone Doe';
patient(2).test=[79,72];
score          =100;

who;
whos;

save('matlabclass1');
clear;
who;

load('matlabclass1');
who;

save('onevar','patient');
clear;
who;
load('onevar');
who;
%% Working with files
load ch08filename.mat
datafile     = load ('ch08filename.mat');
%the ch08filename.mat contains three variables: frex, timevec,and tf_data.

data         = cell(5,1);
for fi       = 1:5
    data{fi} = load(['data_rat' num2str(fi) '.mat']);
end


files1       = dir('D:/Workshop-psycho/code/supplementary/*rat*.mat');

filedir      = 'D:/Workshop-psycho/code/supplementary/'; 
files        = dir([ filedir '*rat*.mat' ]);
data         = cell(size(files));
for fi       = 1:length(files)
    data{fi} = load([ filedir files(fi).name ]); 
end

%% Writing to files
%example 1
myFileID = fopen('testfile.txt','w');
xf       = 100;
fprintf(myFileID,'X is equal to %d\n',xf);
outPut1  = fclose(myFileID);

outPut2  = fopen('/usr/bin/test.txt','w');
%% Writing to files
%example 2
x               = [1:10];
y               = x .^3;
myExponentsFile = fopen('e.txt','w');
fprintf(myExponentsFile,'%d %d\n',[x;y]);
fclose(myExponentsFile);
%% Writing to files
%example 3
x = rand(5);
csvwrite('randomvalues.csv',x);
clear all
x = csvread('randomvalues.csv');

%% Writing to files
%example 4
logFID = fopen('log.txt');
data   = textscan(logFID,'%s %f %f %f %f %f %f');
data 
subjectcodes = data{1};
subjectcodes
fclose(logFID);
%% Plot lines
%example 1
x = 1:2:20;
y = x.^2;
plot(x,y)
%% Plot lines
%example 2
plot(1:10);
%% Plot lines
%example 3
cla
plot(x,y/50,'r');
hold on;
plot(x,log(y),'k'); % log is the natural log
plot(x,y.^(1/3),'m');

%% Plot lines:linewidth
%example 4
plot(x,y,'ro-','linewidth',3)
hold on
plot(x,2*y,'r*--','linewidth',1) % default with is 1
%% Plot lines:legend
%example 5
plot(x,y,'y-',x,y,'go');
hold on
plot(x,2*y,'bp');
hold on
plot(x,log(y),'c+:'); 
legend({'y=x^2';'y=2(x^2)' ;'y=log(x^2)'});
%% Plot lines:hold on-hold off
%example 6
plot(x,y);
hold on;
plot(x,log(y));
hold off;
plot(x,y.^(1/3));
%% Plot lines:hold on-hold off
%example 7
x  = linspace(0,pi);
y1 = cos(x);
plot(x,y1);
hold on
y2 = cos(2*x);
plot(x,y2);
hold on;
y3 = cos(3*x);
plot(x,y3);
legend('cos(x)','cos(2x)','cos(3x)');

%% Plot lines:title
%example 8
plot((1:10).^2)
title('My Title');

%% Plot lines: xlabel-ylabel
%example 9
plot((1:10).^2)
xlabel('Population');
ylabel({2010;'Population';'in Years'});
%% Plot lines: xlabel-ylabel
%example 10
% Create data and 2-by-1 tiled chart layout
x              = linspace(-2*pi,2*pi);
y1             = sin(x);
y2             = cos(x);
p              = plot(x,y1,x,y2);
p(1).LineWidth = 2;
p(2).Marker    = '*';
title('Plot')
xlabel('(X)','FontSize',12,...
       'FontWeight','bold','Color','r');

ylabel('(Y)','FontSize',12,...
       'FontWeight','bold','Color','r');

%% Plot lines: axis
x = linspace(0,2*pi);
y = sin(x);
plot(x,y,'-o');

axis([0 2*pi -1.5 1.5]);
%% Bar plot
%example 1
bar(x,y,.2);
%% Bar plot
%example 2
y = [75 91 105 123.5 131 150 179 203 226 249 281.5];
bar(y);
%% Bar plot
%example 3
y = [2 2 3; 2 5 6; 2 8 9; 2 11 12];
bar(y);
%% Bar plot
%example 4
y = [2 2 3; 2 5 6; 2 8 9; 2 11 12];
bar(y,'stacked');
%% Bar plot
%example 5
y = [75 91 105 123.5 131 150 179 203 226 249 281.5];
bar(y,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5);

%% errorbar
%example 1
x   = 1:10:100;
y   = [20 30 45 40 60 65 80 75 95 90];
err = 8*ones(size(y));
errorbar(x,y,err);
%% errorbar
%example 2
x   = linspace(0,10,15);
y   = sin(x/2);
err = 0.3*ones(size(y));
errorbar(x,y,err,'-s','MarkerSize',10,...
    'MarkerEdgeColor','red','MarkerFaceColor','red');
%% errorbar
%example 3
x = 1:2:20;
y = x.^2;
bar(x,y);
hold on
e = 100*rand(size(x));
errorbar(x,y,e) % symmetric
% errorbar(x,y,e/2,e/8) % asymmetric
% errorbar(x,y,e,'.');
%% Scatter
%example 1
scatter(x,y,'o');
%% Scatter
%example 2
x  = linspace(0,3*pi,200);
y  = cos(x) + rand(1,200);
sz = linspace(1,100,200);
scatter(x,y,sz);
%% Scatter
%example 3
n      = 100;
frate  = linspace(10,40,n) + 10*rand(1,n);
fvar   = frate + 5*randn(1,n);
ndepth = linspace(100,1000,n);
scatter(frate,fvar,100,ndepth,'filled');
%% Scatter
%example 4
theta = linspace(0,2*pi,150);
x     = sin(theta) + 0.75*rand(1,150);
y     = cos(theta) + 0.75*rand(1,150);  
sz    = 140;
scatter(x,y,sz,'d');
%% Scatter
%example 5
theta = linspace(0,2*pi,300);
x     = sin(theta) + 0.75*rand(1,300);
y     = cos(theta) + 0.75*rand(1,300);  
sz    = 40;
scatter(x,y,sz,'MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5);

%% subplot
%example 1
subplot(2,1,1);
x  = linspace(0,10);
y1 = sin(x);
plot(x,y1);
subplot(2,1,2); 
y2 = sin(5*x);
plot(x,y2);
%% subplot
%example 2
subplot(2,2,1)
x  = linspace(0,10);
y1 = sin(x);
plot(x,y1);
title('Subplot 1: sin(x)');

subplot(2,2,2)
y2 = sin(2*x);
plot(x,y2);
title('Subplot 2: sin(2x)');

subplot(2,2,3)
y3 = sin(4*x);
plot(x,y3);
title('Subplot 3: sin(4x)');

subplot(2,2,4)
y4 = sin(8*x);
plot(x,y4);
title('Subplot 4: sin(8x)');

%% subplot
%example 3
subplot(2,2,1);
x     = linspace(-3.8,3.8);
y_cos = cos(x);
plot(x,y_cos);
title('Subplot 1: Cosine')

subplot(2,2,2);
y_poly = 1 - x.^2./2 + x.^4./24;
plot(x,y_poly,'g');
title('Subplot 2: Polynomial');

subplot(2,2,[3,4]);
plot(x,y_cos,'b',x,y_poly,'g');
title('Subplot 3 and 4: Both');

%% subplot
%example 4
for k = 1:4
    ax(k) = subplot(2,2,k);
end

subplot(ax(2))
x = linspace(1,50);
y = sin(x);
plot(x,y,'Color',[0.1, 0.5, 0.1]);
title('Second Subplot');
axis([0 50 -1 1]);























