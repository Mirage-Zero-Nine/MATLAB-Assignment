function EllipsesFilter

% NxN matrix
ellipses = zeros(256);
a = 6;
b = 45;

num = 256;
field = randn(num);
fieldfft = fft2(field);

% Convert coord
central = 256 / 2;

% Ellipse
for i = 1:num
    coordI =  i - central -1;
    for j = 1:num
        coordJ = j - central - 1;
        % matrix (i,j) 
        distance = coordI^2/(a^2) + coordJ^2/(b^2);
        if distance < 1
            ellipses(i,j) = 255;
        else
            ellipses(i,j) = 0;
        end
    end
end
imagesc(ellipses);
colormap(gray(256));
pause;

ellipsesFFT = fft2(ellipses);
spotNoise = ellipsesFFT.*fieldfft;
spotNoiseIFFT = ifft2(spotNoise);
imagesc(real(spotNoiseIFFT));
colormap(gray(256));
pause;