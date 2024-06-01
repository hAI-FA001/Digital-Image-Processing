img_size = 600;

hsi_img = zeros(img_size/2, img_size/2, 3);

hsi_img(1:img_size/2, 1:img_size/2, 1) = 0;
hsi_img(1:img_size/2, 1:img_size/2, 2) = 1;
hsi_img(1:img_size/2, 1:img_size/2, 3) = 0.5;

hsi_img(1:img_size/2, img_size/2+1:img_size, 1) = 120/360;
hsi_img(1:img_size/2, img_size/2+1:img_size, 2) = 1;
hsi_img(1:img_size/2, img_size/2+1:img_size, 3) = 0.5;

hsi_img(img_size/2+1:img_size, img_size/2+1:img_size, 1) = 240/360;
hsi_img(img_size/2+1:img_size, img_size/2+1:img_size, 2) = 1;
hsi_img(img_size/2+1:img_size, img_size/2+1:img_size, 3) = 0.5;

hsi_img(img_size/2+1:img_size, 1:img_size/2, 1) = 0;
hsi_img(img_size/2+1:img_size, 1:img_size/2, 2) = 0;
hsi_img(img_size/2+1:img_size, 1:img_size/2, 3) = 0.5;

f = figure;
imshow(hsv2rgb(hsi_img));
impixelinfo(f);