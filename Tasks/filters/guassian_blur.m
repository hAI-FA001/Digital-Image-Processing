img = double(rgb2gray(imread('pic.png')));
[R, C] = size(img);
output = zeros(R, C);

%filter = 1/20 * [2 2 2; 2 4 2; 2 2 2;];
filter = 1/36 * [1 1 1 1 1; 2 2 2 2 2; 2 2 4 2 2; 2 2 2 2 2; 1 1 1 1 1;];
kernel_size = size(filter);
kernel_size = kernel_size(1);
gap = floor(kernel_size/2);

for i=1+gap:R-gap
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        out = area * filter;
        out = sum(sum(out));
        output(i, j) = out;
    end
end

figure();
imshow(output, []);