% Angles in degrees
function [x, y] = plotConfig(theta)
    l1 = 10;
    l2 = 10;
    x = [0, l1*cosd(theta(1)), l1*cosd(theta(1))+l2*cosd(theta(1)+theta(2))];
    y = [0, l1*sind(theta(1)), l1*sind(theta(1))+l2*sind(theta(1)+theta(2))];
    plot(x, y, '-o');
    axis([0, 20, 0, 20]);
    drawnow;
end