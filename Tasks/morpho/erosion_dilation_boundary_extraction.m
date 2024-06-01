img = rgb2gray(imread("../pic.png"));
[R, C] = size(img);

% binarize it/simplify it
img(img < 128) = 0;
img(img >= 128) = 1;
img = logical(img);

diamond = strel("diamond", 3);
square = strel("square", 7);
disk = strel("disk", 5);
horiz_rect = strel("rectangle", [1, 7]);
vert_rect = strel("rectangle", [7, 1]);

diamond_arr = diamond.Neighborhood;
square_arr = square.Neighborhood;
disk_arr = disk.Neighborhood;
horiz_rect_arr = horiz_rect.Neighborhood;
vert_rect_arr = vert_rect.Neighborhood;

se_to_use = diamond_arr;
one_row_se = reshape(se_to_use, 1, [])';
gap_x = floor(size(se_to_use, 1) / 2);
gap_y = floor(size(se_to_use, 2) / 2);

out_erode = zeros(R, C);
out_dilate = zeros(R, C);
for i=1+gap_y:R-gap_y
    for j=1+gap_x:C-gap_x
        area = img(i-gap_y:i+gap_y, j-gap_x:j+gap_x);

        intersection = se_to_use & area;
        intersection = reshape(intersection, 1, []);

        if any(intersection)
            out_dilate(i, j) = 1;
        end

        relevant = [];
        for k=1:size(one_row_se, 1)
            if one_row_se(k)
                relevant(end+1) = intersection(k);
            end
        end
        if all(relevant)
            out_erode(i, j) = 1;
        end
    end
end

figure;
imshow(img);

figure;
imshow(out_dilate);

figure;
imshow(out_erode);

figure;
imshow(img - out_erode);  % internal boundary extraction
