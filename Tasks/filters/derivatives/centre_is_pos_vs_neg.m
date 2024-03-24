img = double(rgb2gray(imread('pic.png')));

[R, C] = size(img);

d2f_xy = [0 1 0; 1 -4 1; 0 1 0];
d2f_xy_diag = [1 0 1; 0 -4 0; 1 0 1];

lap_sz = 3;
laplacian = ones(lap_sz, lap_sz);
lap_mid = ceil(lap_sz/2);
laplacian(lap_mid, lap_mid) = -1 * (lap_sz^2 - 1);

inverted_d2f_xy = -1 * d2f_xy;
inverted_d2f_xy_diag = -1 * d2f_xy_diag;
inverted_laplacian = -1 * laplacian;


img_d2f_xy = imfilter(double(img), d2f_xy);
img_d2f_xy_diag = imfilter(double(img), d2f_xy_diag);
img_laplacian = imfilter(double(img), laplacian);

inverted_img_d2f_xy = imfilter(double(img), inverted_d2f_xy);
inverted_img_d2f_xy_diag = imfilter(double(img), inverted_d2f_xy_diag);
inverted_img_laplacian = imfilter(double(img), inverted_laplacian);


imwrite(uint8(img_d2f_xy), './pos vs neg/d2f_xy.png');
imwrite(uint8(img_d2f_xy_diag), './pos vs neg/d2f_xy_diag.png');
imwrite(uint8(img_laplacian), './pos vs neg/laplacian.png');

imwrite(uint8(inverted_img_d2f_xy), './pos vs neg/d2f_xy_inverted.png');
imwrite(uint8(inverted_img_d2f_xy_diag), './pos vs neg/d2f_xy_diag_inverted.png');
imwrite(uint8(inverted_img_laplacian), './pos vs neg/laplacian_inverted.png');



imwrite(uint8(img + img_d2f_xy), './pos vs neg/after adding to img/d2f_xy_add.png');
imwrite(uint8(img + img_d2f_xy_diag), './pos vs neg/after adding to img/d2f_xy_diag_add.png');
imwrite(uint8(img + img_laplacian), './pos vs neg/after adding to img/laplacian_add.png');

imwrite(uint8(img + inverted_img_d2f_xy), './pos vs neg/after adding to img/d2f_xy_inverted_add.png');
imwrite(uint8(img + inverted_img_d2f_xy_diag), './pos vs neg/after adding to img/d2f_xy_diag_inverted_add.png');
imwrite(uint8(img + inverted_img_laplacian), './pos vs neg/after adding to img/laplacian_inverted_add.png');

imwrite(uint8(img - img_d2f_xy), './pos vs neg/after adding to img/d2f_xy_sub.png');
imwrite(uint8(img - img_d2f_xy_diag), './pos vs neg/after adding to img/d2f_xy_diag_sub.png');
imwrite(uint8(img - img_laplacian), './pos vs neg/after adding to img/laplacian_sub.png');

imwrite(uint8(img - inverted_img_d2f_xy), './pos vs neg/after adding to img/d2f_xy_inverted_sub.png');
imwrite(uint8(img - inverted_img_d2f_xy_diag), './pos vs neg/after adding to img/d2f_xy_diag_inverted_sub.png');
imwrite(uint8(img - inverted_img_laplacian), './pos vs neg/after adding to img/laplacian_inverted_sub.png');

