% Create Date: 2018-03-06
% Name: Yueyang Zhou
% All varibles are in camelCase style.
% All images generated will be saved automatically to current folder when function is executed.
% No pause during fucntion running.

function homework3

% 1. Generate a 256x256 2-D (real) white Gaussian random field.

N = 256;
field = GaussianRandomFieldReal(N);

% 2. Apply FFT to the white Gaussian random field.
fieldFFT = fft2(field);

% 3. Apply FFT to filters in Assignment 1
% Multiply it with the FFT of white Gaussian random filed you obtained in Part 2.
% 4. Apply inverse-FFT to image obtained in Part 3.
% 5. Repeat Part 4 for different filter sizes.
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

% 6. (Extra Credit) 
% Modify filters, and synthesize textures with soft-edges similar to Figure 5 in van Wijk's Spot Noise paper.



% 7. (Extra Credit) 
% Modify filters, and synthesize elongated textures similar to Figure 6 in van Wijk's Spot Noise paper.