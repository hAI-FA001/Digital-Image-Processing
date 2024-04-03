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

        corresp_x = round(corresp_x);
        corresp_y = round(corresp_y);
        if corresp_x < 1 || corresp_y < 1 || corresp_x > R || corresp_y > C
            continue
        end
        output_img(i, j) = img(corresp_x, corresp_y);
    end
end

figure;
imshow(uint8(img));

f = figure;
imshow(uint8(output_img));
impixelinfo(f);

imwrite(uint8(output_img), 'nearest_neighbor.png');
