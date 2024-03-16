img = double(rgb2gray(imread('pic.png')));
[R, C] = size(img);

f1 = ones(3, 3);
f1_img = imfilter(double(img), f1);



f2 = zeros(3, 3);
[f2_r, f2_c] = size(f2);
f2_mid = floor(f2_r/2);
f2(f2_mid, f2_mid) = 1;
f2_img = imfilter(double(img), f2);



f3 = 1/13 * [0 0 1 0 0;
             0 1 1 1 0;
             1 1 1 1 1;
             0 1 1 1 0;
             0 0 1 0 0;];
f3_img = imfilter(double(img), f3);



f4 = 1/15 * eye(15);
%f4 = fliplr(f4);
f4_img = imfilter(double(img), f4);



f5 = zeros(5, 5);
[f5_r, f5_c] = size(f5);
f5_mid = floor(f5_r / 2);
f5(1:f5_mid, f5_mid+1) = -1;
f5(f5_mid+1, f5_mid+1) = f5_mid;
f5_img = imfilter(double(img), f5);



f6 = zeros(5, 5);
[f6_r, f6_c] = size(f6);
f6_mid = ceil(f6_r/2);
f6(1:f6_mid-1, f6_mid) = -1;
f6(f6_mid+1:f6_r, f6_mid) = -1;
f6(f6_mid, f6_mid) = f6_r-1;
f6_img = imfilter(double(img), f6);



%f7 = [-1 -1 -1;
%      -1  8 -1;
%      -1 -1 -1];
f7 = ones(3, 3) * -1;
[f7_r, f7_c] = size(f7);
f7_mid = ceil(f7_r/2);
f7(f7_mid, f7_mid) = (f7_r^2) - 1;
f7_img = imfilter(double(img), f7);



%f8 = [-1 -1 -1;
%      -1  9 -1;
%      -1 -1 -1];
f8 = ones(3, 3) * -1;
[f8_r, f8_c] = size(f8);
f8_mid = ceil(f8_r/2);
f8(f8_mid, f8_mid) = f8_r^2;
f8_img = imfilter(double(img), f8);



%f9 = [-1 -1 0;
%      -1  0 1;
%       0  1 1];
f9 = eye(3, 3) - 1;
[f9_r, f9_c] = size(f9);

for i=1:f9_r
    f9(i, 1:i-1) = 1;
end

f9 = fliplr(f9);
f9_img = imfilter(double(img), f9);


f_img = f9_img;

figure();
imshow(uint8(img));

figure();
imshow(uint8(f_img));
figure();
imshow(uint8(f_img + img));