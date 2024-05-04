eq_num = 7;

%img = double(rgb2gray(imread("../pic.png")));
img = double(imread("./imgs/hist_eq_"+ (eq_num - 1) +".png"));

[R, C] = size(img);

myHist = zeros(1, 256);
for i=1:R
    for j=1:C
        myHist(img(i, j) + 1) = myHist(img(i, j) + 1) + 1;
    end
end

figure;
plot(myHist);
xlim([0, 255]);

myNormalizedHist = myHist / (R * C);
cdf = zeros(1, 256);
for i=1:256
    cdf(i) = sum(myNormalizedHist(1:i));
end

myLUT = cdf .* linspace(0, 255, 256);

hist_eq_img = img;
for i=1:R
    for j=1:C
        px = img(i, j);
        idx = px + 1;
        hist_eq_img(i, j) = myLUT(idx);
    end
end
hist_eq_img = uint8(hist_eq_img);

figure;
imshow(uint8(img));

figure;
imshow(uint8(hist_eq_img));


myNewHist = zeros(1, 256);
for i=1:R
    for j=1:C
        px = hist_eq_img(i, j);
        idx = px + 1;
        myNewHist(idx) = myNewHist(idx) + 1;
    end
end

figure;
plot(myNewHist);
xlim([0, 255]);
saveas(gcf, "./imgs/hist_"+ eq_num +".png");

myNewNormalizedHist = myNewHist / (R * C);
figure;
plot(myNewNormalizedHist);  % normalized histo
xlim([0, 255]);
ylim([0, 1]);
saveas(gcf, "./imgs/norm_hist_"+ eq_num +".png");

newCdf = zeros(1, 256);
for i=1:256
    newCdf(i) = sum(myNewNormalizedHist(1:i));
end
figure;
plot(newCdf);  % normalized histo
xlim([0, 255]);
ylim([0, 1]);
saveas(gcf, "./imgs/cdf_"+ eq_num +".png");

imwrite(hist_eq_img, "./imgs/hist_eq_"+ eq_num +".png");
