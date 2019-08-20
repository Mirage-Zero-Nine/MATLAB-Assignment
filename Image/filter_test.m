function h = filter_test
% Apply the following linear geometric transform to textures you synthesized in Assignment 3 and 4
% For different values of elongation (2, 4, and 8) and orientation (0, 45, 90 degrees).


for type = 1:3
    h = FilterGenerator(256, 50, type);
    % y = gtrans(h,1,0);
    y = Geo;
    colormap(gray(256));
    imagesc(y);
    pause;
end
