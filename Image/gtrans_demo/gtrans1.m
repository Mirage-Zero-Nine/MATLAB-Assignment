% geometric transform with respect to center of image (N/2,N/2)
function y = gtrans1(x,alpha,theta,dir)
%dir = 1 for forward transform, -1 for backward transform
y = zeros(size(x));
N = length(x(1,:));
for m=1:N,
   for n=1:N,
        if (dir<0)
            r = round(1/alpha*cos(theta)*(m-N/2)+1/alpha*sin(theta)*(n-N/2));
            s = round(-sin(theta)*(m-N/2)+cos(theta)*(n-N/2)); 
        else
            r = round(alpha*cos(theta)*(m-N/2)-sin(theta)*(n-N/2));
            s = round(alpha*sin(theta)*(m-N/2)+cos(theta)*(n-N/2)); 
        end;
        s = s+N/2;
        r = r+N/2;
      if ((r>0) && (s>0) && (r<=N) && (s<=N))
         if (dir<0) y(m,n) = x(r,s); 
         else y(r,s) = x(m,n);  % forward transform
         end;
      end;   
   end;
end;
