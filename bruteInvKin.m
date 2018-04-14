% Angles in Degrees
function theta = bruteInvKin(x, y)
    l1 = 10;
    l2 = 10;
    f_min = 100;
    for i = 0:0.1:90
        for j = -90:0.1:90
            f = abs(x - (l1*cosd(i)+l2*cosd(i+j))) + ...
                abs(y - (l1*sind(i)+l2*sind(i+j)));
            if f < f_min
                f_min = f;
                theta = [i, j];
            end
        end
    end
end
