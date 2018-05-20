% geometric transform with respect to origin (0,0) under periodicity
% assumption
function y = gtrans(x,alpha,theta)

y = zeros(size(x));
N = length(x(1,:));
for m=1:N,
   for n=1:N,
      if (n>N/2) n1 = n-1-N;
      else n1 = n-1;
      end;
         
      if (m>N/2) m1 = m-1-N;
      else m1 = m-1;
      end;
      r = round(1/alpha*cos(theta)*(m1)-1/alpha*sin(theta)*(n1));
      s = round(sin(theta)*(m1)+cos(theta)*(n1));
      if (s<0) s=N+s;
      end;
      if (r<0) r=N+r;
      end;
      if ((r>=0) & (s>=0) & (r<N) & (s<N))
         y(m,n) = x(r+1,s+1);
      end;   
   end;
end;
