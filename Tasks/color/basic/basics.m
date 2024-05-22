img = imread("../../pic.png");


figure;

subplot(2, 2, 1);
imshow(img);

subplot(2, 2, 2);
imshow(img(:, :, 1));

subplot(2, 2, 3);
imshow(img(:, :, 2));

subplot(2, 2, 4);
imshow(img(:, :, 3));


changed = img;
changed(:, :, 1) = 255;
changed(:, :, 3) = 255;

figure;
imshow(changed);
