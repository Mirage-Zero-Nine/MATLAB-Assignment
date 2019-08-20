% Read texture image and convert to gray(256) colormap image
function ReadImage

[f, map] = imread('D04.hips.gif');

[M,N] = size(f);
g = zeros(size(f));

for m=1:M,
    for n=1:N,
        g(m,n) = map(f(m,n)+1,1);
    end;
end;
       
colormap(gray(256));
%colormap(map);
imagesc(g);

map
