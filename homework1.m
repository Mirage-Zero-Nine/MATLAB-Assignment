% Create Date: 2018-01-30
% Name: Yueyang Zhou
% All varibles are in camelCase style.

function homework1

% 1. Download Lena.bmp from Blackboard
% 2. Write a Matlab program that reads, displays and write image, and test it with Lena image.
% Read image
imageObject = imread('lena.bmp');

% Display image
image(imageObject);     % Display this image with specified colormap.
colormap(gray(256));
pause;

% Normalize and display image.
imagesc(imageObject);
pause;

% Write image.
imwrite(imageObject, 'lena.jpg')
pause;

% 3. Generate a 256x256 image with intensity (gray) pattern:
for radius = 10:20:100
    Eucledian = EucledianFilter(256, radius);
    imagesc(Eucledian);
    colormap(gray(256));
    pause;

    CityBlock = CityBlockFilter(256, radius);
    imagesc(CityBlock);
    colormap(gray(256));
    pause;

    CheckerBoard = CheckerBoardFilter(256, radius);
    imagesc(CheckerBoard);
    colormap(gray(256));
    pause;
end

