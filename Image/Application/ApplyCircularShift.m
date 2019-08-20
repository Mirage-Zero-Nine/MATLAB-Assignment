function ApplyCircularShift
% Apply circular-shift by (10,10) on the FFT of the filter, then apply inverse-FFT.

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