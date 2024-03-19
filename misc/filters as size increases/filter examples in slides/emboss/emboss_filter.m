img = double(rgb2gray(imread('../../../pic.png')));
[R, C] = size(img);

num_imgs = 6;

for n=1:num_imgs
    k = 2^(n-1) * 3;
    k_center = ceil(k / 2);
    
    f = eye(k) - 1;
    
    for i=1:k
        f(i, 1:i-1) = 1;
    end

    out = imfilter(double(img), f);
    added = img + out;
    added = uint8(added);
    out = uint8(out);
    
    name = sprintf('k_%03d.png', k);
    imwrite(out, name);

    name = sprintf('added_k_%03d.png', k);
    imwrite(added, name);

    f = fliplr(f);

    out = imfilter(double(img), f);
    added = img + out;
    added = uint8(added);
    out = uint8(out);
    
    name = sprintf('flipped_k_%03d.png', k);
    imwrite(out, name);

    name = sprintf('added_flipped_k_%03d.png', k);
    imwrite(added, name);
end