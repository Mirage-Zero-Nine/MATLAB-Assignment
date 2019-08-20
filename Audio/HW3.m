function HW3

% Compute Autocorrelation
fname='LDC93S1.wav';
x=audioread(fname);
L=[51,101,201,401];
for k=1:4
    w=double(hamming(L(k)));
    h=w.^2;         %hamming window squared
    x2=x.^2;        %separate input
    y=conv(h,x2);       %convolution
    N=length(y);        %length of y
    M=floor(N/4);       %length of subsample
    for m=1:M
        energy(m)=y((m-1)*4+1);
    end
end

for k=1:4
    w=double(hamming(L(k)));
    N=length(x)-640;
    % iterate for different lags
    M=floor(M/320);
    corr=zeros(M,250);
    for i=1:320:N
        for k=0:249
            x1=x(i:i+320);
            y1=conv(x1,w);
            x2=x(i+k:i+k+320);
            y2=conv(x2,w);
            rk(k+1)=y1'*y2;
        end
        corr((i-1)/320+1,:)=rk;
    end
    imagesc(corr');
    colormap(gray);
    pause;
end