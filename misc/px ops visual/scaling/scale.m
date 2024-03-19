img = double(rgb2gray(imread('../../pic.png')));
[R, C] = size(img);

for s=1:0.25:4
    img = uint8(s * img);
    name = sprintf('s_%02.2f.png', s);
    imwrite(img, name);
end