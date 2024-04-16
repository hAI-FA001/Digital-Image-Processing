img = double(rgb2gray(imread("../pic.png")));

out_img = 255 - img;

figure;
imshow(uint8(img));

figure;
imshow(uint8(out_img));