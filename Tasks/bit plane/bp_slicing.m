img = double(rgb2gray(imread("../pic.png")));
[R, C] = size(img);

%img = img / 5;
%img = double(uint8(img * 2));

bp = zeros(8, R, C);
for bit=1:8
    bp(bit, :, :) = get_ith_bit_img(img, bit);
end

bp = logical(bp);

imwrite(uint8(img), "./bitplanes/orig_img.png");
for bit=1:8
    cur_bp = bp(bit, :, :);
    cur_bp = reshape(cur_bp, R, C);
    figure;
    imshow(cur_bp);
    saveas(gcf, "./bitplanes/orig_bp_"+ bit +".png");
end


function [bit_img] = get_ith_bit_img(img, ith)
    %
    bit_num = 8;
    bit_img = 0;
    while bit_num > ith-1
        corresp_power = 2^(bit_num-1);
        diff_img = img - corresp_power;
        bit_img = diff_img >= 0;
        img(bit_img) = img(bit_img) - corresp_power;
        bit_num = bit_num - 1;
    end
end