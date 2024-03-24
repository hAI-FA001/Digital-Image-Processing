img = double(rgb2gray(imread('pic.png')));

[R, C] = size(img);

f_5_at_centre = [0 -1 0; -1 5 -1; 0 -1 0;];
f_9_at_centre = [-1 -1 -1; -1 9 -1; -1 -1 -1];



% inverted filter (-ve at center) should be subtracted from original filter
% here it is being added so resulting image should be blurry

% for inverted, centre should have -3 for 1st filter, not -5
% because non-composite has -4 at centre, add 1 from identity => composite has -3
inverted_f_5_at_centre = -1 * f_5_at_centre + [0 0 0; 0 2 0; 0 0 0];
inverted_f_9_at_centre = -1 * f_9_at_centre + [0 0 0; 0 2 0; 0 0 0];

img_5 = imfilter(double(img), f_5_at_centre);
img_9 = imfilter(double(img), f_9_at_centre);

inverted_img_5 = imfilter(double(img), inverted_f_5_at_centre);
inverted_img_9 = imfilter(double(img), inverted_f_9_at_centre);

imwrite(uint8(img_5), './5 vs 9/5.png');
imwrite(uint8(img_9), './5 vs 9/9.png');

imwrite(uint8(inverted_img_5), './5 vs 9/5_inverted.png');
imwrite(uint8(inverted_img_9), './5 vs 9/9_inverted.png');
