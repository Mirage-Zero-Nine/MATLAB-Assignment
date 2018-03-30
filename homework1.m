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
diskTest;

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

image(imageMartix);     % Display this image with specified colormap.
colormap(gray(256));

% Unit test
function diskTest
for radius = 10:20:100      % Test different radius.
    for type = 1:3          % Test different type
        number = 256;
        GenerateImage(number, type, radius);
        pause;              % Press enter to continue
    end
end

