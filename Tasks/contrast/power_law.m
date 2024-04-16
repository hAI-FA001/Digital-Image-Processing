img = double(rgb2gray(imread("../pic.png")));

c = 1;
gamma = 1.1;
formula = @(px)c * (px.^(1/gamma));

out_img = formula(img);

figure;
imshow(uint8(img));

figure;
imshow(uint8(out_img));


X = linspace(1, 255, 255);
figure;
plot(X, formula(X));