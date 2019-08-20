function ElongationAndRotation
    
% Apply the following linear geometric transform to textures
% Apply different values of elongation (2, 4, and 8) and orientation (0, 45, 90 degrees).
N = 256;

whiteGaussian = fft2(randn(N));

% r = 50;
% type = 1;
row = 10;
column = 10;
% alpha: elongation
alpha = 8; % alpha = 2, alpha = 4, alpha = 8
% theta: rotation
theta = pi/2; % theta = 0, theta = pi/4, theta = pi/2

for type = 1:3
    for r = 30:20:50
        fft2Filter = fft2(filter_test(N,r,type));
        CSFilter = CircularShift(fft2Filter,row,column);

        filterGeoTrans = gtrans(fft2Filter, alpha, theta);
        CSFilterGeoTrans = gtrans(CSFilter, alpha, theta);

        Y = whiteGaussian.*filterGeoTrans;
        Y1 = whiteGaussian.*CSFilterGeoTrans;
        y = ifft2(Y);
        y1 = ifft2(Y1);
        colormap(gray(256));
        imagesc(real(y));
        pause;
        colormap(gray(256));
        imagesc(real(y1));
        pause;
    end
end



