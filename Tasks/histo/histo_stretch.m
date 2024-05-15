img = double(rgb2gray(imread("../pic.png")));

r_min = min(min(img));
r_max = max(max(img));

updated = ((img - r_min) / (r_max - r_min)) * (255);

figure;
imshow(uint8(img));

figure;
imshow(uint8(updated));