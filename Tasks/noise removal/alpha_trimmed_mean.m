img = double(rgb2gray(imread("../pic.png")));
img = uint8(imnoise(uint8(img), "gaussian", 0.5, 0.2));
img = uint8(imnoise(uint8(img), "salt & pepper", 0.6));

[R, C] = size(img);

alpha = round((11^2) / 2 - 1);
filter_size = 11;
gap = floor(filter_size / 2);

output_img = img;
for i=1+gap:R-gap
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        area = reshape(area, 1, []);
        area = sort(area);
        num_remove_from_each_side = alpha / 2;
        
        trimmed_area = area(1 + num_remove_from_each_side:(filter_size^2) - num_remove_from_each_side);
        trimmed_mean = sum(trimmed_area) / ((filter_size^2) - alpha);

        output_img(i, j) = trimmed_mean;
    end
end

figure;
imshow(uint8(img));

figure;
imshow(uint8(output_img));