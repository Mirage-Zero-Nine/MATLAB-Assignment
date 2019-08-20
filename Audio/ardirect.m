%Estimation of AR parameters by direct inversion
function [a,G]=ardirect(x,p)
N=length(x);
z=zeros(p,1);
zz=zeros(p);
zy=zeros(p,1);
G=0;
for n=p+1:N
    for k=1:p
        z(k)=x(n-k);
    end
    zz=zz+z*z';
    zy=zy+z*x(n);
end
a=inv(zz)*zy;
% a=[1;-a]';

%Estimation of gain
for n=p+1:N
        for k=1:p
        z(k)=x(n-k);
    end
    e2=(x(n)-a'*z)^2;
    G=G+e2;
end
G=sqrt(G/(N-p));
a=[1;-a]';
%Estimation of gain
function G=estim_gain(x,a)
z=zeros(p,1);
p=length(z);