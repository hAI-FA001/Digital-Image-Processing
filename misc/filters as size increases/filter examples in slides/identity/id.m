img = double(rgb2gray(imread('../../../pic.png')));
[R, C] = size(img);

num_imgs = 5;

for n=1:num_imgs
    k = 3^n;
    k_center = ceil(k / 2);
    f = zeros(k, k);
    f(k_center, k_center) = 1;

    out = imfilter(double(img), f);
    out = uint8(out);
    
    name = sprintf('k_%03d.png', k);
    imwrite(out, name);
end