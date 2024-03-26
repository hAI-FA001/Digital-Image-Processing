img = rgb2gray(imread('../../pic.png'));
[R, C] = size(img);

output_coords = zeros(R, C, 2);

theta = pi/180 * -50;

a0 = cos(theta);
a1 = sin(theta);
a2 = 0;

b0 = -sin(theta);
b1 = cos(theta);
b2 = 0;

for i=1:1:R
    for j=1:1:C
        new_x = a0 * i + a1 * j + a2;
        new_y = b0 * i + b1 * j + b2;
        
        new_x = int32(new_x);
        new_y = int32(new_y);

        output_coords(i, j, :) = [new_x new_y];
    end
end

all_new_x = output_coords(:, :, 1);
all_new_y = output_coords(:, :, 2);

min_x = min(all_new_x, [], 'all');
max_x = max(all_new_x, [], 'all');
min_y = min(all_new_y, [], 'all');
max_y = max(all_new_y, [], 'all');

out_R = max_x - min_x + 1;
out_C = max_y - min_y + 1;
output_img = zeros(out_R, out_C);

if min_x < 1
    output_coords(:, :, 1) = output_coords(:, :, 1) - min_x + 1;
end
if min_y < 1
    output_coords(:, :, 2) = output_coords(:, :, 2) - min_y + 1;
end

for i=1:1:R
    for j=1:1:C
        new_x = output_coords(i, j, 1);
        new_y = output_coords(i, j, 2);

        output_img(new_x, new_y) = img(i, j);
    end
end

%figure;
%imshow(img);

f=figure;
imshow(uint8(output_img));
impixelinfo(f);