% Create Date: 2018-02-20
% Name: Yueyang Zhou
% All varibles are in camelCase style.
% All images will be automatically save to current folder, without any pause.

function homework2

% 1. Generate 2-D complex white Gaussian image object

% Number of rows and columns
N = 256;

% Generate Image
imageObject = randn(N) + 1i * randn(N);

% Real part
% colormap(gray(256));
% imagesc(real(imageObject));
GaussianReal = real(imageObject);
imwrite(GaussianReal, 'GaussianReal.jpg');
% pause;
% Image Part
% colormap(gray(256));
% imagesc(imag(imageObject));
GaussianImage = imag(imageObject);
imwrite(GaussianImage, 'GaussianImage.jpg');
% pause;
% Raleigh Distribution
% colormap(gray(256));
% imagesc(abs(imageObject));
GaussianRaleigh = abs(imageObject);
imwrite(GaussianRaleigh, 'GaussianRaleigh.jpg');
% pause;
% Uniform Distribution
% colormap(gray(256));
% imagesc(angle(imageObject));
GaussianUniform = angle(imageObject);
imwrite(GaussianUniform, 'GaussianUniform.jpg');
% pause;

% 2. Apply 2-D FFT to complex Gaussian random field

% 2-D FFT: fft2
imageObjectFFTComplex = fft2(imag(imageObject));

% Real part
% colormap(gray(256));
% imagesc(real(imageObject));
FFTComplexReal = real(imageObjectFFTComplex);
imwrite(FFTComplexReal, 'FFTComplexReal.jpg');
% pause;
% Image Part
% colormap(gray(256));
% imagesc(imag(imageObject));
FFTComplexImage = imag(imageObjectFFTComplex);
imwrite(FFTComplexImage, 'FFTComplexImage.jpg');
% pause;
% Raleigh Distribution
% colormap(gray(256));
% imagesc(abs(imageObject));
FFTComplexRaleigh = abs(imageObjectFFTComplex);
imwrite(FFTComplexRaleigh, 'FFTComplexRaleigh.jpg');
% pause;
% Uniform Distribution
% colormap(gray(256));
% imagesc(angle(imageObject));
FFTUniform = angle(imageObjectFFTComplex);
imwrite(FFTUniform, 'FFTComplexUniform.jpg');

% 3. Apply 2-D FFT to real Gaussian random field

% 2-D FFT: fft2
imageObjectFFTReal = fft2(real(imageObject));

% Real part
% colormap(gray(256));
% imagesc(real(imageObject));
FFTRealReal = real(imageObjectFFTReal);
imwrite(FFTRealReal, 'FFTRealReal.jpg');
% pause;
% Image Part
% colormap(gray(256));
% imagesc(imag(imageObject));
FFTRealImage = imag(imageObjectFFTReal);
imwrite(FFTRealImage, 'FFTRealImage.jpg');
% pause;
% Raleigh Distribution
% colormap(gray(256));
% imagesc(abs(imageObject));
FFTRealRaleigh = abs(imageObjectFFTReal);
imwrite(FFTRealRaleigh, 'FFTRealRaleigh.jpg');
% pause;
% Uniform Distribution
% colormap(gray(256));
% imagesc(angle(imageObject));
FFTRealUniform = angle(imageObjectFFTReal);
imwrite(FFTRealUniform, 'FFTRealUniform.jpg');

% 4. Apply the FFT of the images in Assignment 1

ApplyFFT;
imageLena = imread('lena.bmp');
imwrite(fft(imageLena), 'FFTLena.jpg');

% Generate image
function GenerateImage(totalNumber, type, radius)

imageMartix = zeros(totalNumber);       % Total number of the matrix's row and column

centralRow = totalNumber / 2;
centralColumn = totalNumber / 2;

for matrixRow = 1:totalNumber
    if (matrixRow > centralRow)
        imageRow = matrixRow - 1 - totalNumber;     % Transfer coordinate
    else
        imageRow = matrixRow - 1;                   % Transfer coordinate
    end

    for matrixColumn = 1:totalNumber
        if (matrixColumn > centralColumn)
            imageColumn = matrixColumn - 1 - totalNumber;       % Transfer coordinate
        else
            imageColumn = matrixColumn - 1;                     % Transfer coordinate
        end
        switch type
            case 1
            % Case 1: Eucledian
                distance = sqrt(imageRow^2 + imageColumn^2);
            case 2
            % Case 2: City Block
                distance = abs(imageRow)+abs(imageColumn);
            case 3
            % Case 3: Checker-board
                distance = max(abs(imageRow), abs(imageColumn));
        end
        
        % Set color
        if (distance < radius)
            imageMartix(matrixRow, matrixColumn) = 255;
        end
    end
end

% Apply FFT and save image
imageObjectApplyFFT = fft(imageMartix);
% colormap(gray(256));
% imagesc(imageObjectApplyFFT);
saveImage = imageObjectApplyFFT;
if type == 1
    saveType = 'Eucledian';
elseif type == 2
    saveType = 'City-Block';
elseif type == 3
    saveType = 'Checker-board';
end
saveName = ['FFTApply',saveType,int2str(radius),'.jpg'];
imwrite(saveImage, saveName);

function ApplyFFT
for radius = 10:20:100      % Test different radius.
    for type = 1:3          % Test different type
        number = 256;
        GenerateImage(number, type, radius);
        % pause;              % Press enter to continue
    end
end

