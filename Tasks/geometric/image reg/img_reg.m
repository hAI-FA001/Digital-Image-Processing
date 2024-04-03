ref_img = double(rgb2gray(imread('../pic.png')));
deg = deg2rad(-45);
transf = maketform('affine', [cos(deg), sin(deg), 0; -sin(deg), cos(deg), 0; 0, 0, 1;]);
distort_img = imtransform(ref_img, transf);


[cp_moving_points, cp_fixed_points] = cpselect(uint8(distort_img), uint8(ref_img), 'Wait', true);
cp_cor = cpcorr(cp_moving_points, cp_fixed_points, uint8(distort_img), uint8(ref_img));
cp_tform = cp2tform(cp_moving_points, cp_fixed_points, 'affine');
cp_cor_tform = cp2tform(cp_cor, cp_fixed_points, 'affine');

img_registered = imtransform(distort_img, cp_tform);
img_registered_cor = imtransform(distort_img, cp_cor_tform);

figure;
imshow(uint8(ref_img));

figure;
imshow(uint8(distort_img));

figure;
imshow(uint8(img_registered));

figure;
imshow(uint8(img_registered_cor));
