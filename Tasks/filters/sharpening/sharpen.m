img = double(rgb2gray(imread('pic.png')));
[R, C] = size(img);

edge_img = zeros(R, C);
output = zeros(R, C);

edge_filter = [-1 -1 -1; -1 8 -1; -1 -1 -1];
gap = floor(size(edge_filter, 1) / 2);

for i=1+gap:R-gap
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        edge_img(i, j) = sum(sum(area.* edge_filter));
        output(i, j) = img(i, j) + edge_img(i, j);
    end
end

figure();
imshow(img, []);

figure();
imshow(uint8(edge_img), []);

figure();
imshow(uint8(output), []);