nn = double(imread('nearest_neighbor.png'));
bl = double(imread('bilinear.png'));
bc = double(imread('bicubic.png'));

cmp_bl_nn = bl - nn;
cmp_bc_nn = bc - nn;
cmp_bc_bl = bc - bl;

figure;
imshow(cmp_bl_nn, []);

figure;
imshow(cmp_bc_nn, []);

figure;
imshow(cmp_bc_bl, []);