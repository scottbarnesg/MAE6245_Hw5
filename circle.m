function [x, y] = circle(center, radius, points)
    x = [];
    y = [];
    dDeg = 360/points;
    for i = 0:dDeg:360
        x = [x, center(1) + radius*cosd(i)];
        y = [y, center(2) + radius*sind(i)]; 
    end
end