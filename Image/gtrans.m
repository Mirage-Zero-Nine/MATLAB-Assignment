function y = gtrans(x,alpha, theta)

y = zeros(size(x));
vectorLength = length(x(1,:));
for m = 1:vectorLength
    if(m > vectorLength / 2)
        m1 = m - 1 - vectorLength;
    else
        m1 = m - 1;
    end
    for n = 1:vectorLength
        if(n > vectorLength / 2)
            n1 = n - 1 - vectorLength;
        else
            n1 = n - 1;
        end
        % matrix muplity
        r = round(alpha * cos(theta) * m1 - alpha * sin(theta) * n1);
        s = round(alpha * sin(theta) * m1 + alpha * cos(theta) * n1);

        % Reverse operation
        if(s >= 0)
            s = s + 1;
        else
            s = s + 1 + vectorLength;
        end
        if (r >= 0)
            r = r + 1;
        else
            r = vectorLength + r + 1;
        end
        if ((r > 0) && (s > 0) && (r <= vectorLength) && (s <= vectorLength))
            y(r, s) = x(m, n);
        end

    end
end
