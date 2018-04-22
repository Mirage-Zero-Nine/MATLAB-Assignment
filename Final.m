% Create Date: 2018-04-21
% Name: Yueyang Zhou

function Final

num = 128;

% 2-D Gaussian
gaussian = randn(num);
% Gaussian = fft2(gaussian);
% Display image

% Read image
[f, map] = imread('D68.hips.gif');
[M,N] = size(f);

%  New 1-d vector
[N, ~] = size(y);

% for m=1:M
%     for n=1:N
%         image(m,n) = map(f(m,n)+1,1);
%     end
% end

% Display image
colormap(gray(256));
imagesc(image);
pause;

% Filter and circular shift
% filter = filter_test(num, 10, 3);
% CS = CircularShift(filter, 3, 3);

% % Display image
% colormap(gray(256));
% imagesc(CS);
% pause;

% Geo trans
alpha = 1;
theta = 0; %pi/4;
GeoT = gtrans2(image,alpha,theta,1);
imagesc(GeoT);
pause;

% imageFFT = fft2(image);
GeoTFFT2 = fft2(GeoT);
% up = GeoT*imageFFT;
Up = GeoTFFT2;
Down = fft2(gaussian);

M = Up.*Down;
% M1 = imageFFT.*Down;
y = ifft2(M);
% y1 = ifft2(M1);
% Display image
colormap(gray(256));
%colormap(map);
imagesc(real(y));
pause;
