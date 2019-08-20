function h = filter_gen(Num,R,type)
% Apply the following linear geometric transform to textures you synthesized in Assignment 3 and 4
% For different values of elongation (2, 4, and 8) and orientation (0, 45, 90 degrees).
h = zeros(Num);

for m = 1:Num
    if (m > Num / 2)
        m1 = m - 1;
    else
        m1 = m - Num -1;
    end
    for n = 1:Num
        if (n > Num / 2)
            n1 = n - 1;
        else
            n1 = n - Num -1;
        end
        % calculate distance
        switch type
            % eucledian
            case 1
                dist = sqrt(m1^1 + n1^2);
            % city block
            case 2
                dist = abs(n1) + abs(m1);
            % checker board
            case 3
                dist = max(abs(n1), abs(m1));
        end
        % create a disk and color it white
        if (dist <R)
        h(m, n) = 1; 
        end
    end
end