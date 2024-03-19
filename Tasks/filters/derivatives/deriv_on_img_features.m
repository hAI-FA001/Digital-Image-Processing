my_img = double(zeros(1024, 1024));
[R, C] = size(my_img);

R_mid = ceil(R / 1.5);
C_mid = ceil(C / 1.5);

R_mid_mid = ceil(R_mid / 2);
C_mid_mid = ceil(C_mid / 2);

R_mid_mid_mid = ceil(R_mid_mid / 2);
C_mid_mid_mid = ceil(C_mid_mid / 2);

% sudden change AKA step
my_img(R_mid_mid_mid:R_mid_mid, C_mid_mid_mid:C_mid_mid) = 255;

% gradual change AKA ramp
for i=1:255
    my_img(R_mid_mid_mid+R_mid_mid:R_mid, C_mid_mid_mid+i:C_mid_mid_mid+256) = i;
end

% a line of isolated points
for i=R_mid_mid_mid:R_mid
    if rem(i, 10) == 0
        my_img(i, C_mid+C_mid_mid_mid) = 255;
    end
end

% thin line
starting_value = 1;
line_width = 5;
line_mid = floor(line_width / 2)+1;
factor = 3;

values = zeros(1, line_width);
for i=1:line_mid
    values(1, i) = factor * (i-1) + starting_value;
end
values(1, line_mid:line_width) = values(1, line_mid:-1:1);

for i=R_mid_mid_mid:R_mid
    my_img(i, C_mid:C_mid+line_width-1) = values;
end


f = figure;
imshow(uint8(my_img));
impixelinfo(f);

imwrite(my_img, 'test_img.png');