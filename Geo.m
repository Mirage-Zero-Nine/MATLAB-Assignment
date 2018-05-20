function y = Geo

% forward geo trans with respect to origin
%  (0,0) under periodic symmetry assumption (torus)
% for demostration of holes
% y = fgtans(x, alpha, theta)

% Create output image with same size.
N = length(x(1,:));
y = zeros(size(x));

for m= 1:N
    if m > N / 2
        m1 = m - 1 - N;
    else
        m1 = n - 1;
    end
    for n = 1:N
        if n > N / 2
            n1 = n - 1 - N;
        else
            n1 = n - 1;
        end
        r = round(alpha * cos(theta) * m1 - sin(theta) * n1);
        s = round(alpha * sin(theta) * m1 + cos(theta) * n1);
        if s >= 0
            s = s + 1;
        else
            s = N + s + 1;
        end
        if r >= 0
            r = r + 1;
        else
            r = N + r + 1;
        end
        if ((r > 0) && (s > 0) && (r <= N) && (s <= N))
            y(r, s) = x(m, n);
        end
    end
end