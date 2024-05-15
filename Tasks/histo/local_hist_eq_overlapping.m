img = double(rgb2gray(imread("../pic.png")));
[R, C] = size(img);

box_size = round(R / 4);
gap = floor(box_size / 2);
updated = img;
for i=1+gap:R-gap
    % print i to check speed
    i
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        equalized = histeq(uint8(area));
        updated(i-gap:i+gap, j-gap:j+gap) = equalized;
    end
end

figure;
imshow(uint8(img));

figure;
imshow(uint8(updated));