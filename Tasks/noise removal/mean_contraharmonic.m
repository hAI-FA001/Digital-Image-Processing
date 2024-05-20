img = double(rgb2gray(imread("../pic.png")));
[R, C] = size(img);

Q = -100;
output_CHM = img;

filter_size = 3;
gap = floor(filter_size / 2);

for i=1+gap:R-gap
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        sum_Q_plus_1 = sum(sum(area .^ (Q+1)));
        sum_Q = sum(sum(area .^ (Q)));
        CHM = sum_Q_plus_1 / sum_Q;
        
        output_CHM(i, j) = CHM;
    end
end

figure;
imshow(uint8(img));

figure;
imshow(uint8(output_CHM));
