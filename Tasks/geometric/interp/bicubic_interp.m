img = double(rgb2gray(imread('../pic.png')));
[R, C] = size(img);
output_img = zeros(R, C);

deg = deg2rad(-45);
a0 = cos(deg); a1 = sin(deg); a2 = 0;
b0 = -sin(deg); b1 = cos(deg); b2 = 0;
T = [a0 a1 a2; b0 b1 b2; 0 0 1];
inv_T = inv(T);

for i=1:R
    for j=1:C
        corresp_loc = inv_T * [i; j; 1];
        corresp_x = corresp_loc(1);
        corresp_y = corresp_loc(2);

        if corresp_x < 1 || corresp_y < 1 || corresp_x > R || corresp_y > C
            continue
        end

        row_above = floor(corresp_x);
        row_below = row_above + 1;
        row_above_above = row_above - 1;
        row_below_below = row_below + 1;

        col_left = floor(corresp_y);
        col_right= col_left + 1;
        col_left_left = col_left - 1;
        col_right_right = col_right + 1;

        does_above_above_exist = row_above_above > 0;
        does_above_exist = row_above > 0;
        does_below_exist = row_below < R;
        does_below_below_exist = row_below_below < R;

        does_left_left_exist = col_left_left > 0;
        does_left_exist = col_left > 0;
        does_right_exist = col_right < C;
        does_right_right_exist = col_right_right < C;
        
        if does_above_above_exist && does_left_left_exist
            above_above_left_left = img(row_above_above, col_left_left);
        else
            above_above_left_left = 0;
        end
        if does_above_above_exist && does_left_exist
            above_above_left = img(row_above_above, col_left);
        else
            above_above_left = 0;
        end
        if does_above_above_exist && does_right_right_exist
            above_above_right_right = img(row_above_above, col_right_right);
        else
            above_above_right_right = 0;
        end
        if does_above_above_exist && does_right_exist
            above_above_right = img(row_above_above, col_right);
        else
            above_above_right = 0;
        end
        if does_above_exist && does_left_left_exist
            above_left_left = img(row_above, col_left_left);
        else
            above_left_left = 0;
        end
        if does_above_exist && does_left_exist
            above_left = img(row_above, col_left);
        else
            above_left = 0;
        end
        if does_above_exist && does_right_right_exist
            above_right_right = img(row_above, col_right_right);
        else
            above_right_right = 0;
        end
        if does_above_exist && does_right_exist
            above_right = img(row_above, col_right);
        else
            above_right = 0;
        end
        if does_below_exist && does_left_left_exist
            below_left_left = img(row_below, col_left_left);
        else
            below_left_left = 0;
        end
        if does_below_exist && does_left_exist
            below_left = img(row_below, col_left);
        else
            below_left = 0;
        end
        if does_below_exist && does_right_right_exist
            below_right_right = img(row_below, col_right_right);
        else
            below_right_right = 0;
        end
        if does_below_exist && does_right_exist
            below_right = img(row_below, col_right);
        else
            below_right = 0;
        end
        if does_below_below_exist && does_left_left_exist
            below_below_left_left = img(row_below_below, col_left_left);
        else
            below_below_left_left = 0;
        end
        if does_below_below_exist && does_left_exist
            below_below_left = img(row_below_below, col_left);
        else
            below_below_left = 0;
        end
        if does_below_below_exist && does_right_right_exist
            below_below_right_right = img(row_below_below, col_right_right);
        else
            below_below_right_right = 0;
        end
        if does_below_below_exist && does_right_exist
            below_below_right = img(row_below_below, col_right);
        else
            below_below_right = 0;
        end
        
        row_max = row_below_below;
        row_min = row_above_above;
        row_interval = row_max - row_min;

        col_max = col_right_right;
        col_min = col_left_left;
        col_interval = col_max - col_min;

        normalized_row_above = (row_above - row_min) / (row_max - row_min);
        normalized_row_below = (row_below - row_min) / (row_max - row_min);
        normalized_row_above_above = (row_above_above - row_min) / (row_max - row_min);
        normalized_row_below_below = (row_below_below - row_min) / (row_max - row_min);

        normalized_col_left = (col_left - col_min) / (col_max - col_min);
        normalized_col_right= (col_right - col_min) / (col_max - col_min);
        normalized_col_left_left = (col_left_left - col_min) / (col_max - col_min);
        normalized_col_right_right = (col_right_right - col_min) / (col_max - col_min);
        
        normalized_y = (corresp_y - col_min) / (col_max - col_min);
        normalized_x = (corresp_x - row_min) / (row_max - row_min);

        dist_left_left = normalized_y - normalized_col_left_left;
        dist_left = normalized_y - normalized_col_left;
        dist_right = normalized_col_right - normalized_y;
        dist_right_right = normalized_col_right_right - normalized_y;
        
        dist_left_left = 1 - dist_left_left;
        dist_left = 1 - dist_left;
        dist_right = 1 - dist_right;
        dist_right_right = 1 - dist_right_right;

        dist_y_sum = dist_left_left + dist_left + dist_right + dist_right;

        dist_left_left = dist_left_left / dist_y_sum;
        dist_left = dist_left / dist_y_sum;
        dist_right = dist_right / dist_y_sum;
        dist_right_right = dist_right_right / dist_y_sum;

        y_interp_above_above = dist_left_left * above_above_left_left + dist_left * above_above_left + dist_right * above_above_right + dist_right_right * above_above_right_right;
        y_interp_above = dist_left_left * above_left_left + dist_left * above_left + dist_right * above_right + dist_right_right * above_right_right;
        y_interp_below = dist_left_left * below_left_left + dist_left * below_left + dist_right * below_right + dist_right_right * below_right_right;
        y_interp_below_below = dist_left_left * below_below_left_left + dist_left * below_below_left + dist_right * below_below_right + dist_right_right * below_below_right_right;

        dist_above_above = normalized_x - normalized_row_above_above;
        dist_above = normalized_x - normalized_row_above;
        dist_below = normalized_row_below - normalized_x;
        dist_below_below = normalized_row_below_below - normalized_x;
        
        dist_above_above = 1 - dist_above_above;
        dist_above = 1 - dist_above;
        dist_below = 1 - dist_below;
        dist_below_below = 1 - dist_below_below;

        dist_x_sum = dist_above_above + dist_above + dist_below + dist_below_below;

        dist_above_above = dist_above_above / dist_x_sum;
        dist_above = dist_above / dist_x_sum;
        dist_below = dist_below / dist_x_sum;
        dist_below_below = dist_below_below / dist_x_sum;

        final_interp = dist_above_above * y_interp_above_above + dist_above * y_interp_above + dist_below * y_interp_below + dist_below_below * y_interp_below_below;

        output_img(i, j) = final_interp;
    end
end

figure;
imshow(uint8(img));

f = figure;
imshow(uint8(output_img));
impixelinfo(f);

imwrite(uint8(output_img), 'bicubic.png');