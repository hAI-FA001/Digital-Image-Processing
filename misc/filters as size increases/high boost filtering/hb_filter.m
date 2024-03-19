img = double(rgb2gray(imread('../../pic.png')));
[R, C] = size(img);

R_mid = ceil(R / 2);
C_mid = ceil(C / 2);

%upper_k = min(R_mid, C_mid);
%upper_k = 15;

num_imgs = 7;

for n=1:num_imgs
    for scale=1:3
        k = 2^(n-1) * 3;
        k = min(k, min(R_mid, C_mid));

        s = scale;

        f = ones(k, k) / (k^2);

        out = imfilter(double(img), f);
        out = img - out;
        out = (s*img) + out;
        out = uint8(out);
    
        name = sprintf('k_%03d_s_%03d.png', k, s);
        imwrite(out, name);
    end
end
