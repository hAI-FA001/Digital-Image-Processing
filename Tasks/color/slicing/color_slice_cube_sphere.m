img = imread("../../pic.png");
[R, C, Ch] = size(img);

center = reshape(double([0 255 255]), 1, []);
radius = 100;
width = 100;

out_sp = zeros(R, C, 3);
out_cu = zeros(R, C, 3);
for i=1:R
    for j=1:C
        cur_rgb = img(i, j, :);
        cur_rgb = double(reshape(cur_rgb, 1, []));

        dist_sphere = sqrt(sum((cur_rgb - center).^2));  % De -> sphere
        dist_cube = abs(cur_rgb - center);  % D4 -> cube
        
        if dist_sphere <= radius
            out_sp(i, j, :) = uint8(cur_rgb);
        end
        if all(dist_cube <= width/2)
            out_cu(i, j, :) = uint8(cur_rgb);
        end
    end
end

figure;
imshow(img);

figure;
imshow(uint8(out_sp));

figure;
imshow(uint8(out_cu));