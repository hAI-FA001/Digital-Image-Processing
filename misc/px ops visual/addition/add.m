img = double(rgb2gray(imread('../../pic.png')));
[R, C] = size(img);

for a=1:25:255
    img = uint8(a + img);
    name = sprintf('a_%02.2f.png', a);
    imwrite(img, name);
end