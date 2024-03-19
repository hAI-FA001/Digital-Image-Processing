img = double(rgb2gray(imread('../../../pic.png')));
[R, C] = size(img);

num_imgs = 3;

for n=1:num_imgs
    k = n;
    f = ones(k, k);

    out = imfilter(double(img), f);
    out = uint8(out);
    
    name = sprintf('k_%03.2f.png', k);
    imwrite(out, name);
end