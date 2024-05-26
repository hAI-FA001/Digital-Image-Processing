img = zeros(500, 500, 3);

img(:, :, 1) = 0.5;

for i=1:500
    img(:, i, 2) = double(double(i / 500) * 1);
end

for i=1:500
    img(i, :, 3) = double(double((500 - i) / 500) * 1);
end

figure;
imshow(img);
figure;
imshow(img(:, :, 1));
figure;
imshow(img(:, :, 2));
figure;
imshow(img(:, :, 3));
