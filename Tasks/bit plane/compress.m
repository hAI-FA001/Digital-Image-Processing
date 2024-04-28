img = double(rgb2gray(imread("../pic.png")));
[R, C] = size(img);

output = zeros(R, C/2);

for i=1:R
    for j=1:2:C
        this_px = img(i, j);
        next_px = img(i, j+1);

        this_compressed = get_ith_bit(this_px, 8) * 2^7 + get_ith_bit(this_px, 7) * 2^6 + get_ith_bit(this_px, 6) * 2^5 + get_ith_bit(this_px, 5) * 2^4;
        next_compressed = get_ith_bit(next_px, 8) * 2^7 + get_ith_bit(next_px, 7) * 2^6 + get_ith_bit(next_px, 6) * 2^5 + get_ith_bit(next_px, 5) * 2^4;
        
        next_compressed = next_compressed / 2^4;  % shift left 4 times

        final_px = this_compressed + next_compressed;
        
        output(i, (j+1)/2) = final_px;
    end
end

imwrite(uint8(img), "original.png");

output = uint8(output);
imwrite(output, "compressed.png");
