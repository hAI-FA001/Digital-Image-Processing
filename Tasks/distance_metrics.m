
A = zeros(500, 700);
[R, C] = size(A);
B = zeros(R, C);

cx = 250;
cy = 350;
myRad = 100;

for i = 1:1:R
    for j = 1:1:C
        dist_e = sqrt((cx-i)^2 + (cy-j)^2);
        dist_4 = abs(cx - i) + abs(cy - j);
        dist_8 = max(abs(cx - i), abs(cy - j));

        if(dist_8 < myRad)
            B(i, j) = 255;
        end

        if(dist_e < myRad)
            B(i, j) = 128;
        end
    end
end

figure();
imshow(B, []);

