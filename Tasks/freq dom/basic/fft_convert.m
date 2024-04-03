img = double(rgb2gray(imread('../pic.png')));

fft_img = fft2(double(img));
fft_shift = fftshift(fft_img);
fft_log_img = log(1 + abs(fft_img));
fft_log_shift_img = fftshift(fft_log_img);

imwrite(uint8(img), 'img.png');
imwrite(uint8(fft_img), 'fft.png');
imwrite(uint8(fft_shift), 'fft_shift.png');
imwrite(mat2gray(fft_log_img), 'fft_log.png');
imwrite(mat2gray(fft_log_shift_img), 'fft_log_shift_img.png');