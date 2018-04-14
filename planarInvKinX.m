function [f] = planarInvKinX(theta1 , theta2)
    l1 = 10;
    l2 = 10;
    x = 15;
    y = 15;
    f = x - (l1*cos(theta1)+l2*cos(theta1+theta2));
end