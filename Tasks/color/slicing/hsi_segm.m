img = imread("../../pic.png");
[R, C, Ch] = size(img);

noisy = imnoise(double(rgb2gray(img)), "salt & pepper", 0.2);
mask = logical(noisy);
%img(mask) = 255;

hsi_img = rgb2hsv(img);

color_to_extract = abs(hsi_img(:,:,1) - (180/360)) <= 0.1;
color_to_extract = color_to_extract & (abs(hsi_img(:,:,2) - 0.8) <= 0.1);


figure;
subplot(2,2,1);
imshow(img);
subplot(2,2,2);
imshow(hsi_img(:,:,1));
subplot(2,2,3);
imshow(hsi_img(:,:,2));
subplot(2,2,4);
imshow(hsi_img(:,:,3));

figure;
subplot(1,2,1);
imshow(color_to_extract);
subplot(1,2,2);
masked_img = zeros(R, C, 3);
for i=1:R
    for j=1:C
        if color_to_extract(i, j)
            masked_img(i, j, :) = img(i, j, :);
        end
    end
end
imshow(uint8(masked_img));

return
% to check hue values for colors
my_colored_img = zeros(100, 200, 3);
for i=1:100
    my_colored_img(i, 1:100, 1) = linspace(0, 1, 100);
    my_colored_img(i, 101:200, 1) = linspace(1, 0, 100);
end
for i=1:100
    my_colored_img(i, 1:100, 3) = linspace(1, 0, 100);
    my_colored_img(i, 101:200, 3) = linspace(0, 1, 100);
end
my_hsi = rgb2hsv(my_colored_img);
figure;
subplot(1,2,1)
imshow(my_hsi(:,:,1));
subplot(1,2,2);
imshow(my_colored_img);