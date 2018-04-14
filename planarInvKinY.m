function [f] = planarInvKinY(y)
    l1 = 10;
    l2 = 10;
    f = y - (l1*sin(theta1)+l2*sin(theta1+theta2));
end