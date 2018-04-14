% Angles in Degrees
function [f] = planarInvKin(theta)
    l1 = 10;
    l2 = 10;
    x = 10;
    y = 10;
    f = abs(x - (l1*cosd(theta(1))+l2*cosd(theta(1)+theta(2)))) + ...
        abs(y - (l1*sind(theta(1))+l2*sind(theta(1)+theta(2))));
end