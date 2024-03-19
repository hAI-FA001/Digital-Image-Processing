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

    f = zeros(k, k);
    % use city block distance to make guassian
    for i=1:k
        for j=1:k
            f(i, j) = abs(i - k_center) + abs(j - k_center);
        end
    end
    % invert so center has max value
    f = max(f, [], 'all') - f;
    % scale to increase difference as move outward from center
    f = f * max(f, [], 'all');
    f = f / (sum(sum(f)));
    
    out = imfilter(double(img), f);
    out = uint8(out);
    
    name = sprintf('k_%03d.png', k);
    imwrite(out, name);
end
