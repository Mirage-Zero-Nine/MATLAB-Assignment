function gtrans_demo

alpha = 3;
theta = 3*pi/4; %pi/4;
N = 256;

A = filter_test(N,N/8,1);
imagesc(A);
colormap(gray);
pause;

% forward geometric tranformation with respect to origin (0,0)
B = gtrans2(A,alpha,theta,1);
imagesc(B);
pause;

% forward geometric tranformation with respect to center (N/2,N/2)
B = gtrans1(A,alpha,theta,1);
imagesc(B);
pause;


% reverse geometric tranformation with respect to origin (0,0)
B = gtrans2(A,alpha,theta,-1);
imagesc(B);
pause;

% reverse geometric tranformation with respect to center (N/2,N/2)
B = gtrans1(A,alpha,theta,-1);
imagesc(B);
pause;

% reverse geometric tranformation with respect to origin (0,0) with
% periodicity assumption
B = gtrans(A,alpha,theta);
imagesc(B);
pause;

r = 30;
type = 1;
w = fft2(randn(N));
h = fft2(filter_test(N,r,type));
%h1 = cir_shift(h,N/2,N/2);

colormap(gray);

h1 = gtrans(h,alpha,theta);
Y = w.*h1;
y = ifft2(Y);
%y = gtrans1(y1,alpha,theta);
imagesc(real(y));
pause;
