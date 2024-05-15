img = double(rgb2gray(imread("../pic.png")));
[R, C] = size(img);

m_G = mean2(uint8(img));
s_G = std2(uint8(img));

k0 = 1;
k1 = 1 - 1/2;
k2 = 1 + 1/2;

box_size = round(R / 4);
gap = floor(box_size / 2);
updated = img;
for i=1+gap:R-gap
    % print i to check speed
    i
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);

        m_S_XY = mean2(uint8(area));
        s_S_XY = std2(uint8(area));

        if m_S_XY < k0 * m_G && s_G * k1 < s_S_XY && s_S_XY < k2 * s_G
            equalized = histeq(uint8(area));
            updated(i-gap:i+gap, j-gap:j+gap) = equalized;
        end
    end
end

figure;
imshow(uint8(img));

figure;
imshow(uint8(updated));