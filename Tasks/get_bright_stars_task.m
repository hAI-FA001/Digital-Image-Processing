img = double(rgb2gray(imread('stars.jpg')));
[R, C] = size(img);

figure();
imshow(img, []);


mask = zeros(R, C);

kernel_size = 9;
filter = 1/(kernel_size^2) * ones(kernel_size, kernel_size);
gap = floor(kernel_size/2);

for i=1 + gap: R - gap
    for j=1 + gap: C - gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        out = area * filter;
        out = sum(sum(out));

        mask(i, j) = out;
    end
end
%figure();
%imshow(mask, []);

largest = max(mask, [], 'all');
smallest = min(mask, [], 'all');

mask = 255 * ((mask - smallest) / (largest - smallest));

%f = figure();
%imshow(mask, []);
%impixelinfo(f);


threshold = 150;
mask = mask > threshold;
figure();
imshow(mask, []);

output = img.* mask;
figure();
imshow(output, []);


