base_img = double(rgb2gray(imread("../pic.png")));
secret_img = double(rgb2gray(imread("./secret.png")));

[R, C] = size(base_img);

output = zeros(R, C);

for i=1:R
    for j=1:C
        base_px = base_img(i, j);
        secret_px = secret_img(i, j);

        base_compressed = get_ith_bit(base_px, 8) * 2^7 + get_ith_bit(base_px, 7) * 2^6 + get_ith_bit(base_px, 6) * 2^5 + get_ith_bit(base_px, 5) * 2^4;
        secret_compressed = get_ith_bit(secret_px, 8) * 2^7 + get_ith_bit(secret_px, 7) * 2^6 + get_ith_bit(secret_px, 6) * 2^5 + get_ith_bit(secret_px, 5) * 2^4;
        
        secret_compressed = secret_compressed / 2^4;  % shift left 4 times

        final_px = base_compressed + secret_compressed;
        
        output(i, j) = final_px;
    end
end

output = uint8(output);
imwrite(output, "hidden.png");
