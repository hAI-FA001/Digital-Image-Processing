img = double(rgb2gray(imread('../../pic.png')));
[R, C] = size(img);

R_mid = ceil(R / 2);
C_mid = ceil(C / 2);

%upper_k = min(R_mid, C_mid);
%upper_k = 15;

num_imgs = 10;

for n=1:num_imgs
    k = 2^(n-1) * 3;
    k = min(k, min(R_mid, C_mid));
    k_center = ceil(k / 2);

    % make laplacian mask
    f = ones(k, k) * -1;
    f(k_center, k_center) = (k^2) - 1;

    out = imfilter(double(img), f);
    out = uint8(out);

    name = sprintf('edges_k_%03d.png', k);
    imwrite(out, name);

    out = img + double(out);
    out = uint8(out);
    
    name = sprintf('sharpened_k_%03d.png', k);
    imwrite(out, name);
end
