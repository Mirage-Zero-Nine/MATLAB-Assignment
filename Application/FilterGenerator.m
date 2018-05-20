function h = FilterGenerator(N,r,type)

h = zeros(N);
for m = 1:N
    if(m > N / 2)
        m1 = m - 1 - N;
    else
        m1 = m - 1;
    end
    for n = 1:N
        if(n > N / 2)
            n1 = n - 1 - N;
        else
            n1 = n - 1;
        end

        switch type
        case 1
            dist = sqrt(m1^2 + n1^2);
        case 2
            dist = abs(m1) + abs(n1);
        case 3
            dist = max(abs(m1), abs(n1));
        end

        if (dist < r)
            h(m,n)=255;
        end
    end
end