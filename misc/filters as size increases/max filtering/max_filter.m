img = double(rgb2gray(imread('../../pic.png')));
noise = imnoise(double(img), 'salt & pepper', 0.4);
img = img.*noise;
[R, C] = size(img);

R_mid = ceil(R / 2);
C_mid = ceil(C / 2);

num_imgs = 10;

imwrite(uint8(img), 'noisy_img.png');
for n=1:num_imgs
    k = 2^(n-1) * 3;
    k = min(k, min(R_mid, C_mid));
    k_center = ceil(k / 2);
    
    out = zeros(R, C);
    for i=1+k_center:R-k_center
        for j=1+k_center:C-k_center
            out(i, j) = max(max(img(i-k_center:i+k_center, j-k_center:j+k_center)));
        end
    end
    
    out = uint8(out);

    name = sprintf('k_%03d.png', k);
    imwrite(out, name);
end
