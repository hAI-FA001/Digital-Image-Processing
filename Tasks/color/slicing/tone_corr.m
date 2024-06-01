img = double(imread("../../pic.png"));
[R, C, Ch] = size(img);

red_func = @(x) x.^1.2;
green_func = @(x) x.^0.95;
blue_func = @(x) x.^1.5;

out = img;
out(:, :, 1) = red_func(out(:, :, 1));
out(:, :, 2) = green_func(out(:, :, 2));
out(:, :, 3) = blue_func(out(:, :, 3));


figure;
imshow(uint8(img));

figure;
imshow(uint8(out));