img = rgb2gray(imread("../pic.png"));

slide_amount = 128;

updated = uint8(imadd(img, slide_amount));

figure;
imhist(img, 255);

figure
imhist(updated, 255);

figure;
imshow(img);

figure;
imshow(updated);