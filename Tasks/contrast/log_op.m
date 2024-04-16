img = double(rgb2gray(imread("../pic.png")));

c = 255 / 5;
out_img = c * log(1 + img);

figure;
imshow(uint8(img));

figure;
imshow(uint8(out_img));


X = linspace(1, 255, 255);
figure;
plot(X, c * log(1 + X));