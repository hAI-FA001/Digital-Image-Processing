img = double(rgb2gray(imread("../pic.png")));
img = double(imnoise(uint8(img), "gaussian", 0, 0.0125));
[R, C] = size(img);

s_N = 0.0125 * 255;

filter_size = 101;
gap = floor(filter_size / 2);

output_img = img;
for i=1+gap:R-gap
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        area = reshape(area, 1, []);
        
        s_L = std(area);
        m_L = mean(area);

        s_ratio = s_N / (s_L + 0.00001);

        output_img(i, j) = img(i, j) - (s_ratio * (img(i, j) - m_L));
    end
end

figure;
imshow(uint8(img));

figure;
imshow(uint8(output_img));