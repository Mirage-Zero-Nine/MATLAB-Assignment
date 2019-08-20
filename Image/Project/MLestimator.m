% Create Date: 2018-04-21
% Name: Yueyang Zhou

function Eta = MLestimator(N,AY)
    eta = zeros(1,N); Eta = zeros(1,N); Ni = 1:N;
    for i=1:N
        for m=1:N
            for n=1:N
                distance=round(hypot(m,n)); % EucLedian norm 
                if (distance>(i-1))&&(distance<=i)
                    eta(i)=eta(i)+(abs(AY(m,n)))^2;
                end
            end
        end
        Eta(i)=eta(i)/Ni(i);
    end

    