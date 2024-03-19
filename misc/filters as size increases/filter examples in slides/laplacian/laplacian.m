img = double(rgb2gray(imread('../../../pic.png')));
[R, C] = size(img);

num_imgs = 8;

for n=1:num_imgs
    k = 2^(n-1) * 3;
    k_center = ceil(k / 2);
    
    f = ones(k);
    f(k_center, k_center) = -1 * ((k^2) - 1);

    out = imfilter(double(img), f);
    out = uint8(out);
    
    name = sprintf('k_%03d.png', k);
    imwrite(out, name);

    f = -1 * f;

    out = imfilter(double(img), f);
    out = uint8(out);
    
    name = sprintf('inverted_k_%03d.png', k);
    imwrite(out, name);
end