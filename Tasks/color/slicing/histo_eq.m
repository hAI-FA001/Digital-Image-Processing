img = uint8(imread("../../pic.png"));

% make washed out img
%hsi_img = rgb2hsv(img);
%hsi_img(:,:,2) = hsi_img(:,:,2) / 4;
%img = hsv2rgb(hsi_img);
%img(img < 0.3) = 1;

out = histeq(img);

img_red_histo_eq = img;
red_only = histeq(img(:, :, 1));
img_red_histo_eq(:, :, 1) = red_only;

img_green_histo_eq = img;
green_only = histeq(img(:, :, 2));
img_green_histo_eq(:, :, 2) = green_only;

img_blue_histo_eq = img;
blue_only = histeq(img(:, :, 3));
img_blue_histo_eq(:, :, 3) = blue_only;


hsi_img = rgb2hsv(img);
hsi_histo_eq = histeq(hsi_img);

img_hue_histo_eq = hsi_img;
hue_only = histeq(hsi_img(:, :, 1));
img_hue_histo_eq(:, :, 1) = hue_only;

img_sat_histo_eq = hsi_img;
sat_only = histeq(hsi_img(:, :, 2));
img_sat_histo_eq(:, :, 2) = sat_only;

img_int_histo_eq = hsi_img;
int_only = histeq(hsi_img(:, :, 3));
img_int_histo_eq(:, :, 3) = int_only;


figure;
subplot(3, 2, 1);
imshow(img);
subplot(3, 2, 2);
imshow(out);
subplot(3, 2, 4);
imshow(img_red_histo_eq)
subplot(3, 2, 5);
imshow(img_green_histo_eq)
subplot(3, 2, 6);
imshow(img_blue_histo_eq)

figure;
subplot(3, 2, 1);
imshow(hsv2rgb(hsi_img));
subplot(3, 2, 2);
imshow(hsv2rgb(hsi_histo_eq));
subplot(3, 2, 4);
imshow(hsv2rgb(img_hue_histo_eq));
subplot(3, 2, 5);
imshow(hsv2rgb(img_sat_histo_eq));
subplot(3, 2, 6);
imshow(hsv2rgb(img_int_histo_eq));
