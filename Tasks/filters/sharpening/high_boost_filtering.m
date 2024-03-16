img = double(rgb2gray(imread("pic.png"))) / 10;
[R, C] = size(img);

blurred = zeros(R, C);
const = 10;

kernel_size = 9;
filter = 1/(kernel_size^2) * ones(kernel_size, kernel_size);
gap = floor(kernel_size/2);

for i=1+gap:R-gap
    for j=1+gap:C-gap
        blurred(i, j) = sum(sum(img(i-gap:i+gap, j-gap:j+gap).*filter));
    end
end

final = const*img - blurred;
added = img + final;

figure();
imshow(uint8(final));

figure();
imshow(uint8(added));