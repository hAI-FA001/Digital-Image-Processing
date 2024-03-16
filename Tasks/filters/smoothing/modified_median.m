img = rgb2gray(imread('pic.png'));
noisy_img = double(imnoise(img, 'salt & pepper', 0.6));

[R, C] = size(img);
modified_median_img = zeros(R, C);
normal_median_img = zeros(R, C);
double_median_img = zeros(R, C);
suggested_sol_img = zeros(R, C);

kernel_size = 9;
gap = floor(kernel_size/2);

for i=1 + gap:R - gap
    for j=1 + gap: C - gap
        area = noisy_img(i-gap:i+gap, j-gap:j+gap);
        one_dim_area = reshape(area, 1, []);
        sorted_area = sort(one_dim_area);
        
        unique_values = unique(one_dim_area, 'sorted');
        num_unique = size(unique_values);
        num_unique = num_unique(1, 2);
        middle = floor(num_unique / 2);
        if num_unique == 1
            middle = 1;
        end
        if rem(num_unique, 2) == 0
            modified_median_value = (unique_values(middle) + unique_values(middle+1))/2;
        else
            modified_median_value = unique_values(middle);
        end

        middle = floor((kernel_size^2)/2);
        median_value = sorted_area(middle);
        avg_of_left_and_right = (sorted_area(middle-1) + sorted_area(middle+1))/2;


        modified_median_img(i, j) = modified_median_value;
        normal_median_img(i, j) = median_value;
        suggested_sol_img(i, j) = avg_of_left_and_right;
    end
end

for i=1 + gap:R - gap
    for j=1 + gap: C - gap
        area = normal_median_img(i-gap:i+gap, j-gap:j+gap);
        one_dim_area = reshape(area, 1, []);
        sorted_area = sort(one_dim_area);

        middle = floor((kernel_size^2)/2);
        median_value = sorted_area(middle);

        double_median_img(i, j) = median_value;
    end
end


figure();
imshow(uint8(noisy_img));

figure();
imshow(uint8(normal_median_img));

figure();
imshow(uint8(double_median_img));

figure();
imshow(uint8(modified_median_img));

figure();
imshow(uint8(suggested_sol_img));