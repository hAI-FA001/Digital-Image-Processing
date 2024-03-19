img = double(rgb2gray(imread('../pic.png')));
[R, C] = size(img);

R_center = ceil(R / 2);
C_center = ceil(C / 2);
radius = 5;

for i=1:R
    for j=1:C
        dist = sqrt((R_center - i)^2 + (C_center - j) ^2);
        img(i, j) = dist;
    end
end

img = max(img, [], 'all') - img;
img = (img - min(img, [], 'all')) / (max(img, [], 'all') - min(img, [], 'all'));

figure;
imshow(img);

imwrite(im2uint8(img), 'euclidean.png');