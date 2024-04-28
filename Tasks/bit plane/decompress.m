img = double(imread("./compressed.png"));
[R, C] = size(img);

output = zeros(R, 2*C);

for i=1:R
    for j=1:C
        px = img(i, j);
        
        this_compressed = get_ith_bit(px, 8) * 2^7 + get_ith_bit(px, 7) * 2^6 + get_ith_bit(px, 6) * 2^5 + get_ith_bit(px, 5) * 2^4;
        next_compressed = get_ith_bit(px, 4) * 2^3 + get_ith_bit(px, 3) * 2^2 + get_ith_bit(px, 2) * 2^1 + get_ith_bit(px, 1) * 2^0;

        next_compressed = next_compressed * 2^4;  % shift right 4 times
        
        output(i, 2*j - 1) = this_compressed;
        output(i, 2*j) = next_compressed;
    end
end

output = uint8(output);
imwrite(output, "decompressed.png");
