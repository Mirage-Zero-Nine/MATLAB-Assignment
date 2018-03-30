

% Create Date: 2018-03-06
% Name: Yueyang Zhou
% All varibles are in camelCase style.
% All images generated will be saved automatically to current folder when function is executed.
% No pause during fucntion running.

function homework3

% 1. Generate a 256x256 2-D (real) white Gaussian random field.

N = 256;
imageObject = randn(N);
imwrite(imageObject, '1 - Gaussian.jpg');

% 2. Apply FFT to the white Gaussian random field.

imageObjectFFT = fft2(imageObject);
realImage = real(imageObjectFFT);
% Display image
image(realImage);     % Display this image with specified colormap.
colormap(gray(256));
pause;
complexImage = imag(imageObjectFFT);
% Display image
image(complexImage);     % Display this image with specified colormap.
colormap(gray(256));
pause;
magnitudeImage = abs(imageObjectFFT);
% Display image
image(magnitudeImage);     % Display this image with specified colormap.
colormap(gray(256));
pause;
phaseImage = angle(imageObjectFFT);
% Display image
image(phaseImage);     % Display this image with specified colormap.
colormap(gray(256));
pause;

imwrite(realImage, '2 - GaussianRandomFFTReal.jpg');
imwrite(complexImage, '2 - GaussianRandomFFTComplex.jpg');
imwrite(magnitudeImage, '2 - GaussianRandomFFTMagnitude.jpg');
imwrite(phaseImage, '2 - GaussianRandomFFTPhase.jpg');

% 3. Apply FFT to each of the filters in Assignment 1
% Multiply it with the FFT of white Gaussian random filed in Part 2.
% 4. Apply inverse-FFT to each of the image in Part 3.
% 5. Repeat the experiment in Part 4 for different filter sizes.

for radius3 = 50:20:100
    for type = 1:3
        % Change r and type
        % Dump code here
        h = filter_gen(radius3,type);
        % Which one is fliter???
        H = fft(h);
        saveName = ['FFTApply',type,int2str(radius3),'.jpg'];

        image(real(H));     % Display this image with specified colormap.
        colormap(gray(256));
        pause;
        imwrite(real(H), saveName);

        % Fliter in frequency domain, output image Y
        FliterFrequence = imageObjectFFT.*H;
        image(real(FliterFrequence));     % Display this image with specified colormap.
        colormap(gray(256));
        pause;

        saveName = ['FliterFrequence',type,int2str(radius3),'.jpg'];
        imwrite(real(FliterFrequence), saveName);
        
        % Apply inverse FFT
        IFFT2FliterFrequence = ifft2(FliterFrequence);
        image(real(IFFT2FliterFrequence));     % Display this image with specified colormap.
        colormap(gray(256));
        pause;

        saveName = ['IFFT2FliterFrequence',type,int2str(radius3),'.jpg'];
        imwrite(real(IFFT2FliterFrequence), saveName);
    end
end

% 6. (Extra Credit) 
% Modify filters, and synthesize textures with soft-edges similar to Figure 5 in van Wijk???s Spot Noise paper.



% 7. (Extra Credit) 
% Modify filters, and synthesize elongated textures similar to Figure 6 in van Wijk???s Spot Noise paper.


% Fliter function
% r: radius
% type: 1 - cycle
%       2 - square
%       3 - diamond
function h = filter_gen(radius,type)
N = 256;

h = zeros(N);

centralRow = N / 2;
centralColumn = N / 2;

for matrixRow = 1:N
    if (matrixRow > centralRow)
        imageRow = matrixRow - 1 - N;     % Transfer coordinate
    else
        imageRow = matrixRow - 1;                   % Transfer coordinate
    end

    for matrixColumn = 1:N
        if (matrixColumn > centralColumn)
            imageColumn = matrixColumn - 1 - N;       % Transfer coordinate
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
            h(matrixRow, matrixColumn) = 255;
        end
    end
end