% Create Date: 2018-03-27
% Name: Yueyang Zhou
% All varibles are in camelCase style.
% All images generated will be saved automatically to current folder when function is executed.

function homework4
% 1. Apply circular-shift by (10,10) on the FFT of the filter, then apply inverse-FFT.

for radius = 10:20:50
    for type = 1:3
    filter = FilterGenerator(256, radius, type);
    filterFFT = fft2(filter);
    for shift = 10:20:50
        filterCS = CircularShift(filterFFT, shift, shift);
        imagesc(real(filterCS));
        colormap(gray(256));
        pause;
    end
    end
end