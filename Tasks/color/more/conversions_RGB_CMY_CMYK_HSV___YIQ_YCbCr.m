% from other task
img = zeros(500, 500, 3);
img(:, :, 1) = 0.5;
for i=1:500
    img(:, i, 2) = double(double(i / 500) * 1);
end
for i=1:500
    img(i, :, 3) = double(double((500 - i) / 500) * 1);
end

figure;
imshow(img);

img_cmy = 1 - img;
figure;
imshow(img_cmy);

k = min(img, [], 3);
k_is_1 = k == 1;
img_cmyk = (img_cmy - k) ./ (1 - k);
img_cmyk(k_is_1, :) = 0;
figure;
imshow(img_cmyk);

figure;
imshow(rgb2ntsc(img));
figure;
imshow(rgb2ycbcr(img));

I = 1/3 * (sum(img, 3));
S = 1 - (3 ./ (sum(img, 3)) .* min(img, [], 3));
R = img(:, :, 1);
G = img(:, :, 2);
B = img(:, :, 3);
numer = 1/2 .* ((R - G) + (R - B));
denom = sqrt((R - G)^2 + (R - B) .* (G - B));
theta = acos(numer ./ denom);
b_le_g = B <= G;
H = 360 - theta;
H(b_le_g) = theta(b_le_g);

figure;
imshow(I);
figure;
imshow(S);
figure;
imshow(H);
