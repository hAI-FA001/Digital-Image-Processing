img = double(rgb2gray(imread("../pic.png")));
[R, C] = size(img);

contrast_stretched_img = ((img - min(min(img))) / (max(max(img)) - min(min(img)))) * (256 - 1);

% which gray level mapped to what value after stretching
mapping = zeros(1, 256);
for i=1:R
    for j=1:C
        old_px = img(i, j);
        idx = old_px + 1;
        if mapping(idx) == 0
            mapping(idx) = contrast_stretched_img(i, j);
        end
    end
end

figure;
imshow(uint8(img));

figure;
imshow(uint8(contrast_stretched_img));

figure;
plot(mapping);
ylim([0, 255]);
xlim([0, 255]);
