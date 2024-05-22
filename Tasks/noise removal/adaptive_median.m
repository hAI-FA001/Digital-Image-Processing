img = double(rgb2gray(imread("../pic.png")));
img = double(imnoise(uint8(img), "salt & pepper", 0.1));
[R, C] = size(img);

filter_size = 3;
max_filter_size = 9;
gap = floor(filter_size / 2);

output_img = img;
for i=1+gap:R-gap
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        area = reshape(area, 1, []);
        area = sort(area);

        mid_idx = ceil(size(area, 2) / 2);
        Z_med = area(mid_idx);
        Z_xy = img(i, j);
        Z_min = min(area);
        Z_max = max(area);

        A1 = Z_med - Z_min;
        A2 = Z_max - Z_med;
        is_med_bad = A1 == 0 || A2 == 0;

        inc_filter_size = filter_size + 2;
        while(is_med_bad && inc_filter_size <= max_filter_size)
            inc_gap = floor(inc_filter_size / 2);

            area = img(max(1, i-inc_gap):min(R, i+inc_gap), max(1, j-inc_gap):min(C, j+inc_gap));
            area = reshape(area, 1, []);
            area = sort(area);
    
            mid_idx = ceil(size(area, 2) / 2);
            Z_med = area(mid_idx);
            Z_min = min(area);
            Z_max = max(area);

            A1 = Z_med - Z_min;
            A2 = Z_max - Z_med;
            is_med_bad = A1 == 0 || A2 == 0;

            inc_filter_size = inc_filter_size + 2;
        end
        
        if(is_med_bad)
            area = unique(area, "sorted");
            mid_idx = ceil(size(area, 2) / 2);
            Z_med = area(mid_idx);
        end

        B1 = Z_xy - Z_min;
        B2 = Z_max - Z_xy;
        is_xy_bad = B1 == 0 || B2 == 0;

        if(is_xy_bad)
            output_img(i, j) = Z_med;
        end
    end
end

figure;
imshow(uint8(img));

figure;
imshow(uint8(output_img));
