% Create Date: 2018-03-27
% Name: Yueyang Zhou
% All varibles are in camelCase style.

% Circular shift
function g = CircularShift(inputImage, rowShift, circularShift)

rowLength = length(inputImage(:,1));

for m = 1:rowLength
    if (m <= rowShift)
        m1 = m - rowShift + rowLength;
    else
        m1 = m - rowShift;
    end
    for n = 1:rowLength
        if (n <= circularShift)
            n1 = n - circularShift + rowLength;
        else
            n1 = n - circularShift;
        end
        g(m, n) = inputImage(m1, n1);
    end
end


