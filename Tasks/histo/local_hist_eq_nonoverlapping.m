img = double(rgb2gray(imread("../pic.png")));
[R, C] = size(img);

box_size = round(R / 4);
updated = zeros(R, C);
for i=1:box_size:R
    for j=1:box_size:C
        end_i = min(i+box_size-1, R);
        end_j = min(j+box_size-1, C);

        area = img(i:end_i, j:end_j);
        equalized = histeq(uint8(area));
        updated(i:end_i, j:end_j) = equalized;
    end
end

figure;
imshow(uint8(img));

figure;
imshow(uint8(updated));