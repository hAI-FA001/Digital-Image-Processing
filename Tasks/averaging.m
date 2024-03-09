A = double(rgb2gray(imread("pic.png")));
[R, C] = size(A);
B = zeros(R, C);

K = 9;
gap = floor(K / 2);

for i=gap+1:1:R-gap
    for j=gap+1:1:C-gap
        area = A(i-gap:i+gap, j-gap:j+gap);
        area = reshape(area, 1, []);

        sum = 0;
        for k=1:1:K^2
            sum = sum + area(k)/(K^2);
        end

        B(i, j) = sum;
    end
end

figure();
imshow(A, []);
figure();
imshow(B, []);