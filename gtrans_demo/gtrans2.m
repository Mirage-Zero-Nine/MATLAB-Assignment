% geometric transform with respect to center of image (0,0)
function y = gtrans2(x,alpha,theta,dir)
%dir = 1 for forward transform, -1 for backward transform

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
      if (dir<0)
        r = round(1/alpha*cos(theta)*(m1)+1/alpha*sin(theta)*(n1));
        s = round(-sin(theta)*(m1)+cos(theta)*(n1));
      else
        r = round(alpha*cos(theta)*(m1)-sin(theta)*(n1));
        s = round(alpha*sin(theta)*(m1)+cos(theta)*(n1)); 
      end;
      if (s>=0) s=s+1;
      else s = N+s+1;
      end;
      if (r>=0) r=r+1;
      else r = r+1+N;
      end;
      if ((r>0) && (s>0) && (r<=N) && (s<=N))
         if (dir<0) y(m,n) = x(r,s); 
         else y(r,s) = x(m,n);  % forward transform
         end;
      end;   
   end;
end;
