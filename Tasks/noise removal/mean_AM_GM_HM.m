img = double(rgb2gray(imread("../pic.png")));
[R, C] = size(img);

output_AM = img;
output_GM = img;
output_HM = img;

filter_size = 3;
gap = floor(filter_size / 2);

for i=1+gap:R-gap
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        mn = filter_size^2;

        AM = sum(sum(area)) / mn;
        GM = prod(prod(area))^(1/mn);
        HM = mn / sum(sum(1./area));

        output_AM(i, j) = AM;
        output_GM(i, j) = GM;
        output_HM(i, j) = HM;
    end
end

figure;
imshow(uint8(img));

figure;
imshow(uint8(output_AM));

figure;
imshow(uint8(output_GM));

figure;
imshow(uint8(output_HM));
