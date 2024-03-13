img = double(rgb2gray(imread('pic.png')));
[R, C] = size(img);

blurred_img = zeros(R, C);

kernel_size = 15;
blur_filter = 1/kernel_size^2 * ones(kernel_size, kernel_size);
gap = floor(kernel_size / 2);

for i=1+gap:R-gap
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        blurred_img(i, j) = sum(sum(area.* blur_filter));
    end
end
subtracted_img = img - blurred_img;
output = img + subtracted_img;


figure();
imshow(uint8(img));

figure();
imshow(uint8(blurred_img));

figure();
imshow(uint8(subtracted_img));


figure();
imshow(uint8(output));