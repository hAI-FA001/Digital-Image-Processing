img = double(rgb2gray(imread("../pic.png")));
[R, C] = size(img);

myHist = zeros(1, 256);

for i=1:R
    for j=1:C
        myHist(img(i, j) + 1) = myHist(img(i, j) + 1) + 1;
    end
end
myNormalizedHist = myHist / (R * C);

figure;
plot(myHist);
xlim([0, 255]);

figure;
plot(myNormalizedHist);
ylim([0, 1]);
xlim([0, 255]);
