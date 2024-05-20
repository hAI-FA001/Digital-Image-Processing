img = double(rgb2gray(imread("../pic.png")));
[R, C] = size(img);

filter_size = 3;
gap = floor(filter_size / 2);

output_min = img;
output_max = img;
output_mid = img;
output_med = img;
output_modif_med = img;

for i=1+gap:R-gap
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        mid_idx = ceil((filter_size^2)/2);

        min_val = min(min(area));
        max_val = max(max(area));
        mid_val = (min_val + max_val) / 2;
        med_val = sort(reshape(area, 1, []));
        modif_med_val = unique(med_val, "sorted");
        med_val = med_val(mid_idx);
        
        modif_mid_idx = ceil(size(modif_med_val, 2) / 2);
        modif_med_val = modif_med_val(modif_mid_idx);

        output_min(i, j) = min_val;
        output_max(i, j) = max_val;
        output_mid(i, j) = mid_val;
        output_med(i, j) = med_val;
        output_modif_med(i, j) = modif_med_val;
    end
end

figure;
imshow(uint8(img));

figure;
imshow(uint8(output_min));

figure;
imshow(uint8(output_max));

figure;
imshow(uint8(output_mid));

figure;
imshow(uint8(output_med));

figure;
imshow(uint8(output_modif_med));
