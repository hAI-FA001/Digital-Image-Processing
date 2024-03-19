img = double(rgb2gray(imread('../../../pic.png')));
[R, C] = size(img);

num_imgs = 10;

for n=1:num_imgs
    k = 2^(n-1) * 3;
    k_center = ceil(k / 2);
    
    f = zeros(k, k);
    % use city block distance idea to create diamond filter
    for i=1:k
        for j=1:k
            f(i, j) = abs(i - k_center) + abs(j - k_center) < k_center;
        end
    end
    f = double(f);
    f = f / (sum(sum(f)));

    out = imfilter(double(img), f);
    out = uint8(out);
    
    name = sprintf('k_%03d.png', k);
    imwrite(out, name);
end