img = double(rgb2gray(imread('../../../pic.png')));
[R, C] = size(img);

% does 1st give thicker lines
f_d1_x = [-1; 1];
f_d1_y = [-1 1];
f_d2_x = [1; -2; 1];
f_d2_y = [1 -2 1];

all_filters = {f_d1_x f_d1_y f_d2_x f_d2_y};
name_filter = {'x1'; 'y1'; 'x2'; 'y2'};

for i=1:size(all_filters, 2)
    cur_filter = all_filters(i);
    cur_filter =  cell2mat(cur_filter);
    result = imfilter(double(img), cur_filter);
    
    file_name = sprintf('./type of line/%s.png', cell2mat(name_filter(i)));
    imwrite(uint8(result), file_name);
end

imwrite(uint8(img), './type of line/normal.png');