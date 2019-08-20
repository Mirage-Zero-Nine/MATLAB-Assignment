% Generate 1024-point white Gaussian random noise w 
% with zero mean and unit variance

whiteGaussian = randn(1, 2014);
% cos(0.1pn) + 0.2 sin(0.2pn) + 0.2 * w(n)
xn1 = zeros(1, 1024);
xn2 = zeros(1, 1024);
xn3 = zeros(1, 1024);
xn4 = zeros(1, 1024);

for x=1:1024
    xn1(x)=cos(0.1*pi*x)+0.2*sin(0.2*pi*x)+0.2*whiteGaussian(x);
    xn2(x)=cos(0.1*pi*x)+0.2*sin(0.12*pi*x)+0.2*whiteGaussian(x);
    xn3(x)=cos(0.1*pi*x)+0.2*sin(0.5*pi*x)+0.2*whiteGaussian(x);
    xn4(x)=cos(0.3*pi*x)+0.2*sin(0.2*pi*x)+0.2*whiteGaussian(x);
end

% plot x(n)
plot(xn1(1:end));
pause;

fftX1 = fft(xn1);
fftX2 = fft(xn2);
fftX3 = fft(xn3);
fftX4 = fft(xn4);

% Plot the periodogram, 
% |X(k)|^2 for k=1,..,512. 
% How many peaks can you observe? What are the locations of the peaks?

Xn1 = zeros(1, 512);
 Xn2 = zeros(1, 512);
 Xn3 = zeros(1, 512);
 Xn4 = zeros(1, 512);
 
for X=1:512
     Xn1(X)= abs(fftX1(X));
     Xn2(X)= abs(fftX2(X));
     Xn3(X)= abs(fftX3(X));
     Xn4(X)= abs(fftX4(X));
 
 end
px = abs(fftX1).^2/1024;
plot(Xn1(1:end))

 pause;
 plot(Xn2(1:end))
 pause;
 plot(Xn3(1:end))
 pause;
 plot(Xn4(1:end))
 pause;
