my_path = "pic.png";
A = double(rgb2gray(imread(my_path)));

m = -1;
c = 255;

B = m*A + c;

figure();
imshow(uint8(B));