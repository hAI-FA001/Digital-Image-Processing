img = double(rgb2gray(imread('pic.png')));

[R, C] = size(img);

f_2d_x_1 = [1 1 1; -2 -2 -2; 1 1 1];
f_2d_x_2 = [1 0 1; -2 0 -2; 1 0 1];
f_2d_y_1 = [1 -2 1; 1 -2 1; 1 -2 1];
f_2d_y_2 = [1 -2 1; 0 0 0; 1 -2 1];

sobel_x = [-1 -2 -1; 0 0 0; 1 2 1];
sobel_y = [-1 0 1; -2 0 2; -1 0 1];

img_x_1 = imfilter(double(img), f_2d_x_1);
img_x_2 = imfilter(double(img), f_2d_x_2);
img_y_1 = imfilter(double(img), f_2d_y_1);
img_y_2 = imfilter(double(img), f_2d_y_2);

img_sobel_x = imfilter(double(img), sobel_x);
img_sobel_y = imfilter(double(img), sobel_y);

imwrite(uint8(img_x_1), './deriv 2d/x_1.png');
imwrite(uint8(img_x_2), './deriv 2d/x_2.png');
imwrite(uint8(img_y_1), './deriv 2d/y_1.png');
imwrite(uint8(img_y_2), './deriv 2d/y_2.png');

imwrite(uint8(img_sobel_x), './deriv 2d/x_sobel.png');
imwrite(uint8(img_sobel_y), './deriv 2d/y_sobel.png');