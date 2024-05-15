img = double(rgb2gray(imread("../pic.png")));
[R, C] = size(img);

box_size = round(R / 4);
gap = floor(box_size / 2);
updated = zeros(R, C);
for i=1+gap:R-gap
    % print i to check speed
    i
    for j=1+gap:C-gap
        area = img(i-gap:i+gap, j-gap:j+gap);
        
        m_S_XY = mean2(area);

        updated(i, j) = 1/(((m_S_XY / 255) * 2) + 0.000001) * img(i, j);
    end
end

figure;
imshow(uint8(img));

figure;
imshow(uint8(updated));