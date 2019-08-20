function ReadAndWriteImage

% Read Image
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

% Generate a 256x256 image with intensity (gray) pattern:
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

