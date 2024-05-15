img = double(rgb2gray(imread("../pic.png")));

s_min = 64;
s_max = 192;

r_min = min(min(img));
r_max = max(max(img));

updated = ((img - r_min) / (r_max - r_min)) * (s_max - s_min) + s_min;

figure;
imshow(uint8(img));

figure;
imshow(uint8(updated));

updated_builtin = imadjust(im2double(uint8(img)), [0, 1], [s_min / 255, s_max / 255]);
updated_builtin = updated_builtin .* 255;
figure;
imshow(uint8(updated_builtin));
