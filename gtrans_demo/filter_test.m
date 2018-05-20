function h = filter_test(N,r,type)

h = zeros(N);
for n=1:N,
   for m=1:N,
      if (n>N/2) n1 = n-1-N;
      else n1 = n-1;
      end;
         
      if (m>N/2) m1 = m-1-N;
      else m1 = m-1;
      end;
      
      switch type
      case 1,
         if (sqrt(n1^2+m1^2)<r) h(n,m) = 255;
         end;
      case 2,
         if (abs(n1)+abs(m1)<r) h(n,m) = 255;
         end;
      case 3,
         if (max(abs(n1),abs(m1))<r) h(n,m) = 255;
         end;
      end;
   end;
end;
imagesc(h);
colormap(gray);
         