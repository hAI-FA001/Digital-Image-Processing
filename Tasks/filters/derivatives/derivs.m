%img = double(rgb2gray(imread('test_img.jpg')));
img = double(imread('test_img.png'));
[R, C] = size(img);

output = zeros(R, C);

df_x = [-1; 1];
df_y = [-1 1];

d2f_x = [1; -2; 1];
d2f_y = [1 -2 1];

d2f_xy = [0 1 0; 1 -4 1; 0 1 0];
d2f_xy_diag = [1 0 1; 0 -4 0; 1 0 1];

lap_sz = 3;
laplacian = ones(lap_sz, lap_sz);
lap_mid = ceil(lap_sz/2);
laplacian(lap_mid, lap_mid) = -1 * (lap_sz^2 - 1);

inverted_df_x = -1 * df_x;
inverted_df_y = -1 * df_y;

inverted_d2f_x = -1 * d2f_x;
inverted_d2f_y = -1 * d2f_y;

inverted_d2f_xy = -1 * d2f_xy;
inverted_d2f_xy_diag = -1 * d2f_xy_diag;

inverted_laplacian = -1 * laplacian;


img_df_x = imfilter(double(img), df_x);
img_df_y = imfilter(double(img), df_y);

img_d2f_x = imfilter(double(img), d2f_x);
img_d2f_y = imfilter(double(img), d2f_y);

img_d2f_xy = imfilter(double(img), d2f_xy);
img_d2f_xy_diag = imfilter(double(img), d2f_xy_diag);

img_laplacian = imfilter(double(img), laplacian);

figure();
imshow(uint8(img));

figure();
imshow(uint8(img_df_x));
figure();
imshow(uint8(img_df_y));

figure();
imshow(uint8(img_d2f_x));
figure();
imshow(uint8(img_d2f_y));

figure();
imshow(uint8(img_d2f_xy));
figure();
imshow(uint8(img_d2f_xy_diag));

figure();
imshow(uint8(img_laplacian));

