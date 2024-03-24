img = double(rgb2gray(imread('../../../pic.png')));
[R, C] = size(img);

% 1st and 2nd derivative (1D)
f_1d_d1_x = [-1; 1];
f_1d_d1_y = [-1 1];
f_1d_d2_x = [1; -2; 1];
f_1d_d2_y = [1 -2 1];

% 1st and 2nd derivative (2D), AKA gradient operators
f_2d_d1_x = [-1 -1 -1; 0 0 0; 1 1 1];
f_2d_d1_y = [-1 0 1; -1 0 1; -1 0 1];
f_2d_d2_x = [1 0 1; -2 0 -2; 1 0 1];
f_2d_d2_y = [1 -2 1; 0 0 0; 1 -2 1];

% 2d by adding 1st and 2nd derivative
f_2d_d2_xy = [0 -1 0; -1 4 -1; 0 -1 0];
% rotate above to detect diagonal edges
f_2d_d2_xy_diag = [-1 0 -1; 0 4 0; -1 0 -1];

% add above to get laplacian
f_2d_d2_lap = f_2d_d2_xy + f_2d_d2_xy_diag;

% sobel operators
f_2d_d2_sobel_x = [-1 -2 -1; 0 0 0; 1 2 1]; %[-1 0 1; -2 0 2; -1 0 1];
f_2d_d2_sobel_y = [-1 0 1; -2 0 2; -1 0 1]; %[-1 -2 -1; 0 0 0; 1 2 1];
f_2d_d2_sobel_xy = f_2d_d2_sobel_x + f_2d_d2_sobel_y;


all_filters = {
f_1d_d1_x;
f_1d_d1_y;
f_1d_d2_x;
f_1d_d2_y;
f_2d_d1_x;
f_2d_d1_y;
f_2d_d2_x;
f_2d_d2_y;
f_2d_d2_xy;
f_2d_d2_xy_diag;
f_2d_d2_lap;
f_2d_d2_sobel_x;
f_2d_d2_sobel_y;
f_2d_d2_sobel_xy;
};

name_filter = {
'xf_1d_d1_x';
'yf_1d_d1_y';
'xf_1d_d2_x';
'yf_1d_d2_y';
'xf_2d_d1_x';
'yf_2d_d1_y';
'xf_2d_d2_x';
'yf_2d_d2_y';
'zf_2d_d2_xy';
'zf_2d_d2_xy_diag';
'zf_2d_d2_lap';
'xf_2d_d2_sobel_x';
'yf_2d_d2_sobel_y';
'zf_2d_d2_sobel_xy';};

for i=1:size(all_filters, 1)
    cur_filter = all_filters(i);
    cur_filter =  cell2mat(cur_filter);
    result = imfilter(double(img), cur_filter);
    
    file_name = sprintf('./edge detectors/%s.png', cell2mat(name_filter(i)));
    imwrite(uint8(result), file_name);
end

