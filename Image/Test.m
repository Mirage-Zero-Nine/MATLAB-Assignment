function Test

clear
close all

% NxN matrix
num = 256;
Circle = zeros(num);
Radius = 10;

field = randn(num);
fieldfft = fft2(field);

% Convert coord
central = 256 / 2;

% Circle
for i = 1:num
    coordI =  i - central -1;
    for j = 1:num
        coordJ = j - central - 1;
        % matrix (i,j) 
        distance = sqrt(coordI^2 + coordJ^2);
        if distance < Radius
            Circle(i,j) = 255;
        else
            Circle(i,j) = 0;
        end
    end
end

imagesc(Circle);
colormap(gray(256));
pause;

CircleFFT = fft2(Circle);
multipy = CircleFFT .* fieldfft;
multipyIFFT = ifft2(multipy);

for i = 1:num
    for j = 1:num
        real(multipyIFFT(i,j));
    end
end

imagesc(real(multipyIFFT));
colormap(gray(256));
pause;

