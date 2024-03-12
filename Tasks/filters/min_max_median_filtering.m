img = rgb2gray(imread('pic.png'));

salt_pepper_img = double(imnoise(img, 'salt & pepper', 0.10));

img = double(img);
noise_mask = imnoise(img, 'salt & pepper', 0.10);
inverted_noise_mask = max(noise_mask, [], 'all') - noise_mask;

pepper_img = img.* noise_mask;
salt_img = img + (inverted_noise_mask*255);
pepper_img = uint8(pepper_img);
salt_img = uint8(salt_img);


img = salt_pepper_img;


[R, C] = size(img);

min_B = zeros(R, C);
max_B = zeros(R, C);
med_B = zeros(R, C);

kernel_size = 3;
gap = floor(kernel_size / 2);
middle_val = ceil((kernel_size^2)/2);

for i=1+gap:R-gap
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        one_dim_area = reshape(area, 1, []);

        min_val = min(one_dim_area);
        max_val = max(one_dim_area);
        sorted_area = sort(one_dim_area);
        med_val = sorted_area(middle_val);
        %if i % 400 == 0 && j == 500 && med_val ~= 0
        %    sorted_area
        %    med_val
        %    middle_val
        %end

        min_B(i, j) = min_val;
        max_B(i, j) = max_val;
        med_B(i, j) = med_val;
    end
end

figure();
imshow(img, []);
title('Original');

figure();
imshow(min_B, []);
title('Min Filter');

figure();
imshow(max_B, []);
title('Max Filter');

figure();
imshow(med_B, []);
title('Med Filter');
