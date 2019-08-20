function FFTApplication

% Generate 2-D complex white Gaussian image object
N = 256;
complexGaussian = randn(N) + 1i * randn(N);
realPart = real(complexGaussian);
complexPart = imag(complexGaussian);
raleighPart = abs(complexGaussian);
uniformPart = angle(complexGaussian);

imagesc(realPart);
colormap(gray(256));
pause;
imagesc(complexPart);
colormap(gray(256));
pause;
imagesc(raleighPart);
colormap(gray(256));
pause;
imagesc(uniformPart);
colormap(gray(256));
pause;

% Apply 2-D FFT to the complex Gaussian random field
realPartFFT = fft(complexGaussian);
imagesc(real(realPartFFT));
colormap(gray(256));
pause;

realPartFFTFFT = fft(realPartFFT);
imagesc(real(realPartFFTFFT));
colormap(gray(256));
pause;

% Apply the FFT of the images
for radius = 10:20:50
    Eucledian = EucledianFilter(256, radius);
    EucledianFFT = fft2(Eucledian);
    imagesc(real(EucledianFFT));
    colormap(gray(256));
    pause;

    CityBlock = CityBlockFilter(256, radius);
    CityBlockFFT = fft2(CityBlock);
    imagesc(real(CityBlockFFT));
    colormap(gray(256));
    pause;

    CheckerBoard = CheckerBoardFilter(256, radius);
    CheckerBoardFFT = fft2(CheckerBoard);
    imagesc(real(CheckerBoardFFT));
    colormap(gray(256));
    pause;
end

