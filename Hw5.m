% Scott Barnes
% MAE 6245: Robotic Systems
% Assignment 5
clc; clear; close all;

%%  Problem 1
% Note: All functions were validated on [x, y] = [10, 10]
% with known analytical solution theta = [0, 90]

%%  Part A: Analytical Solution
x = 10;
y = 10;
theta = analyticInvKin(x, y)
%% Part B: Optimization
funB = @optiInvKin;
theta_init = [30, 30]; % Angles in Degrees
theta = fminsearch(funB, theta_init)

%% Part C
x = 10;
y = 10;
theta = bruteInvKin(x, y)

%% Part D
center = [12, 12]
radius = 2;
points = 30;
[circle_x, circle_y] = circle(center, radius, points);

%% Part E
figure;
plotConfig(theta);

%% Part F
tic;
f = figure;
for i = 1:length(circle_x)
    theta = analyticInvKin(circle_x(i), circle_y(i));
    plotConfig(theta);
    hold on;
    plot(circle_x, circle_y, '.');
    hold off;
    sim2gif(f, i, 'analyticalCircle.gif');
    pause(0.01);
end
disp('Analytical Solution:');
toc

%% Part G
l1 = 10;
l2 = 10;
tic;
figure;
for i = 1:length(circle_x)
    x = circle_x(i);
    y = circle_y(i);
    funG = @(theta)abs(x - (l1*cosd(theta(1))+l2*cosd(theta(1)+theta(2)))) + ...
        abs(y - (l1*sind(theta(1))+l2*sind(theta(1)+theta(2))));
    theta_init = [45, 45]; % Angles in Degrees
    theta = fminsearch(funG, theta_init);
    plotConfig(theta);
    hold on;
    plot(circle_x, circle_y, '.');
    hold off;
    pause(0.01);
end
disp('Optimization');
toc

tic;
f = figure;
for i = 1:length(circle_x)
    theta = bruteInvKin(circle_x(i), circle_y(i));
    plotConfig(theta);
    hold on;
    plot(circle_x, circle_y, '.');
    hold off;
    sim2gif(f, i, 'bruteCircle.gif');
    pause(0.01);
end
disp('Brute Force');
toc
pause(1);
close all;
disp('The brute force solver is insufficient for real-time solutions');
disp('However, both the analytical and optimization solutions are adequate');

%%  Problem 2
theta1_init = 0.4; 
x = 20/sqrt(2);
y = 20/sqrt(2);
a1 = 10;
a2 = 10;
fun2 = @(theta1)(a1*sin(theta1)+a2*sin(acos((x-a1*cos(theta1))/a2))- y);
% Use fmincon
A = 1;
b = 1;
z_con = fmincon(fun2, theta1_init, A, b)
% Compare to fminunc
z_unc = fminunc(fun2,theta1_init)
disp('The results of fmincon and fminunc are the same for A=b');
disp('However, this varies if A and b are different');
