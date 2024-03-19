img = double(rgb2gray(imread('pic.png')));
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


inverted_img_df_x = imfilter(double(img), inverted_df_x);
inverted_img_df_y = imfilter(double(img), inverted_df_y);

inverted_img_d2f_x = imfilter(double(img), inverted_d2f_x);
inverted_img_d2f_y = imfilter(double(img), inverted_d2f_y);

inverted_img_d2f_xy = imfilter(double(img), inverted_d2f_xy);
inverted_img_d2f_xy_diag = imfilter(double(img), inverted_d2f_xy_diag);

inverted_img_laplacian = imfilter(double(img), inverted_laplacian);

figure();
imshow(uint8(inverted_img_df_x));
figure();
imshow(uint8(inverted_img_df_y));

figure();
imshow(uint8(inverted_img_d2f_x));
figure();
imshow(uint8(inverted_img_d2f_y));

figure();
imshow(uint8(inverted_img_d2f_xy));
figure();
imshow(uint8(inverted_img_d2f_xy_diag));

figure();
imshow(uint8(inverted_img_laplacian));

