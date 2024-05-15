img = double(rgb2gray(imread("../pic.png")));
[R, C] = size(img);

m_G = mean2(img);
k = 1;

box_size = round(R / 4);
gap = floor(box_size / 2);
updated = zeros(R, C);
for i=1+gap:R-gap
    % print i to check speed
    i
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        
        m_S_XY = mean2(area);
        s_S_XY = std2(area);

        A_S_XY = k * m_G / s_S_XY;

        updated(i, j) = (A_S_XY * (img(i, j) - m_S_XY)) + m_S_XY;
    end
end

figure;
imshow(uint8(img));

figure;
imshow(uint8(updated));