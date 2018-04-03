% Create Date: 2018-02-20
% Name: Yueyang Zhou
% All varibles are in camelCase style.
% All images will be automatically save to current folder, without any pause.

function FFT

% 1. Generate 2-D complex white Gaussian image object

% Varible init
N = 256;

% Complex Gaussian field
complexGaussian = randn(N) + 1i * randn(N);

% Display real part
realPart = real(complexGaussian);
colormap(gray(256));
imagesc(realPart);
pause;

% Apply FFT on complex Gaussian field and display
realPartFFT = fft(complexGaussian);
colormap(gray(256));
imagesc(real(realPartFFT));
pause;
