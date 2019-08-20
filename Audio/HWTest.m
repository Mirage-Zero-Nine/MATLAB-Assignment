function HWTest

N=1024;
p=20;
w=randn(N,1);

for n=1:N
    x(n)=cos(0.1*pi*n)+0.2*sin(0.2*pi*n)+0.2*w(n);
end
plot(x);
[a,g]=ardirect(x,p);
b=roots(a)
s=compute_spectrum(b,g);
plot(s);