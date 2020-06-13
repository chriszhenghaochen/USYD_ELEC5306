%read image
img = imread('lena.bmp');
% Add random noise randn
% It returns a random scalar drawn from the standard normal distribution
noise = randn(size(img, 1), size(img, 2));
img = double(img);
noise_level = 5;
img1 = img + noise * noise_level;

%show image
figure(1)
imshow(uint8(img));
figure(2)
imshow(uint8(img1));

% calculate PSNR in formula
SSE = sum(sum((img - img1).^2));
MSE = SSE/(size(img, 1)*size(img, 2));
image_psnr = 10*log10(255.^2 ./MSE);
disp(image_psnr);
% fprintf('Noise level: %.1f, MSE: %.1f PSNR: %.3f\n', noise_level, MSE, image_psnr);

% or calculate PSNR through MATLAB function
image_psnr = psnr(img, img1);

% calculate SSIM
image_ssim = ssim(img, img1);
disp(image_ssim);

