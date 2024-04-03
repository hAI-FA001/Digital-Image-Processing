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
        col_left = floor(corresp_y);
        col_right= col_left + 1;
        
        x_imaginary_row = corresp_x - floor(corresp_x);
        y_imaginary_col = corresp_y - floor(corresp_y);

        top_left = img(row_above, col_left);
        top_right = img(row_above, col_right);
        bottom_left = img(row_below, col_left);
        bottom_right= img(row_below, col_right);

        x_interp_top = (1-y_imaginary_col) * top_left + (y_imaginary_col) * top_right;
        x_interp_bottom = (1-y_imaginary_col) * bottom_left + (y_imaginary_col) * bottom_right;
        final_interp = (1-x_imaginary_row) * x_interp_top + (x_imaginary_row) * x_interp_bottom;

        output_img(i, j) = final_interp;
    end
end

figure;
imshow(uint8(img));

f = figure;
imshow(uint8(output_img));
impixelinfo(f);

imwrite(uint8(output_img), 'bilinear.png');