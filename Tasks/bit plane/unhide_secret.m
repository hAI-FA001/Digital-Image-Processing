hidden_img = double(imread("./hidden.png"));

[R, C] = size(hidden_img);

secret_img = zeros(R, C);

for i=1:R
    for j=1:C
        hidden_px = hidden_img(i, j);

        secret_px = get_ith_bit(hidden_px, 4) * 2^3 + get_ith_bit(hidden_px, 3) * 2^2 + get_ith_bit(hidden_px, 2) * 2^1 + get_ith_bit(hidden_px, 1) * 2^0;
        
        secret_px = secret_px * 2^4;  % shift right 4 times

        secret_img(i, j) = secret_px;
    end
end

secret_img = uint8(secret_img);
imwrite(secret_img, "revealed.png");
