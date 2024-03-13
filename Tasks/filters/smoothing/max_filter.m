img = double(rgb2gray(imread('pic.png')));
[R, C] = size(img);
B = zeros(R, C);

kernel_size = 3;
gap = floor(kernel_size / 2);

for i=1 + gap:R - gap
    for j=1 + gap:C - gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        area = reshape(area, [], 1);
        output_value = max(area);
        B(i, j) = output_value;
    end
end

figure();
imshow(img, []);

figure();
imshow(B, []);