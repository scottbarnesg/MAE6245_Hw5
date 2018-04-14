% Angles in degrees
function theta = analyticInvKin(x, y)
    l1 = 10;
    l2 = 10;
    theta2 = 2*atan2d(sqrt((l1+l2)^2-x^2-y^2), sqrt(x^2+y^2-(l1-l2)^2));
    theta1 = atan2d(y, x) - atan2d(l2*sind(theta2), l1+l2*cosd(theta2));
    theta = [theta1, theta2];
end