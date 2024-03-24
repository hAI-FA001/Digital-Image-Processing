img = double(rgb2gray(imread('../../../pic.png')));
[R, C] = size(img);

pepper_noise = imnoise(img, 'salt & pepper', 0.3);
salt_noise = 255*(1-imnoise(img, 'salt & pepper', 0.1));

pepper_img = img.* pepper_noise;
salt_img = img + salt_noise;
salt_and_pepper_img = double(imnoise(uint8(img), 'salt & pepper', 0.1));

% does 2nd derivative increase noise
f_d1_x = [-1; 1];
f_d1_y = [-1 1];
f_d2_x = [1; -2; 1];
f_d2_y = [1 -2 1];

all_imgs = {img pepper_img, salt_img, salt_and_pepper_img};
all_filters = {f_d1_x f_d1_y f_d2_x f_d2_y};
name_img = {'normal'; 'pepper'; 'salt'; 'salt and pepper'};
name_filter = {'x1'; 'y1'; 'x2'; 'y2'};
for i=1:size(all_imgs, 2)
    cur_img = all_imgs(i);
    cur_img = cell2mat(cur_img);

    for j=1:size(all_filters, 2)
        cur_filter = all_filters(j);
        cur_filter =  cell2mat(cur_filter);
        result = imfilter(double(cur_img), cur_filter);
        
        %figure;
        %imshow(uint8(result));
        
        file_name = sprintf('./noise/%s_%s.png', cell2mat(name_filter(j)), cell2mat(name_img(i)));
        imwrite(uint8(result), file_name);
    end
end


%figure;
%imshow(uint8(img));

%figure;
%imshow(uint8(salt_img));

%figure;
%imshow(uint8(pepper_img));

%figure;
%imshow(uint8(salt_and_pepper_img));
