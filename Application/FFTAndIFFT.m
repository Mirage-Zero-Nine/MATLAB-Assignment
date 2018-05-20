function FFTAndIFFT

% Generate a 256x256 2-D (real) white Gaussian random field.

N = 256;
field = GaussianRandomFieldReal(N);

% Apply FFT to the white Gaussian random field.
fieldFFT = fft2(field);

% Apply FFT to filters
% Multiply it with the FFT of white Gaussian random filed
% Apply inverse-FFT to images
for radius = 10:20:50
    % Eucledian = EucledianFilter(256, radius);
    EucledianFFT = fft2(EucledianFilter(256, radius));
    multiplyEucledianFFT = EucledianFFT .* fieldFFT;
    imagesc(real(multiplyEucledianFFT));
    colormap(gray(256));
    pause;

    EucledianIFFT = ifft2(multiplyEucledianFFT);
    imagesc(real(EucledianIFFT));
    colormap(gray(256));
    pause;

    % CityBlock = CityBlockFilter(256, radius);
    CityBlockFFT = fft2(CityBlockFilter(256, radius));
    multiplyCityBlockFFT = CityBlockFFT .* fieldFFT;
    imagesc(real(multiplyCityBlockFFT));
    colormap(gray(256));
    pause;

    CityBlockIFFT = ifft2(multiplyCityBlockFFT);
    imagesc(real(CityBlockIFFT));
    colormap(gray(256));
    pause;

    % CheckerBoard = CheckerBoardFilter(256, radius);
    CheckerBoardFFT = fft2(CheckerBoardFilter(256, radius));
    multiplyCheckerBoardFFT = CheckerBoardFFT .* fieldFFT;
    imagesc(real(multiplyCheckerBoardFFT));
    colormap(gray(256));
    pause;

    CheckerBoardIFFT = ifft2(multiplyCheckerBoardFFT);
    imagesc(real(CheckerBoardIFFT));
    colormap(gray(256));
    pause;
end