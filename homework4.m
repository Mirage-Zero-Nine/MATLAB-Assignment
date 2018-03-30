% Create Date: 2018-03-27
% Name: Yueyang Zhou
% All varibles are in camelCase style.
% All images generated will be saved automatically to current folder when function is executed.

function homework4
% 1. Apply circular-shift by (10,10) on the FFT of the filter, then apply inverse-FFT.

N = 256;
radius = 50;
type =1;

circularShift = 10;
rowShift = 10;

whiteGaussian = randn(N);
linerFilter = FilterGenerator(N, radius, type );

% Apply fft
whiteGaussianFFT = fft2(whiteGaussian);
filterFFT = fft2(linerFilter);

% Circular shift
CS = CircularShift(filterFFT, rowShift, circularShift);

% Spot Noise Synthesis (Frequency Domain), Multiply element-wise and apply ifft
multiplyW = whiteGaussianFFT.*filterFFT;
multiplyCS = whiteGaussianFFT.*CS;
filterIFFT = ifft2(multiplyW);
CSIFFT = ifft2(multiplyCS);

% Display image
filterIFFTImage = real(filterIFFT);
imagesc(filterIFFTImage);
colormap(gray(256));
imwrite(filterIFFTImage, 'FilterIFFT.jpg');
pause;

CSIFFT = real(CSIFFT);
imagesc(CSIFFT);
colormap(gray(256));
imwrite(CSIFFT, 'multiplyCS1010.jpg');
pause;

% for i = 1:10:50
%     for j = 1:10:50
%         CS = CircularShift(whiteGaussianFFT, i, j);
%         multiplyCS = whiteGaussianFFT.*CS;
%         CSIFFT = ifft2(multiplyCS);
        
%         imagesc(real(CSIFFT));
%         colormap(gray(256));
%         pause;

%     end    
% end