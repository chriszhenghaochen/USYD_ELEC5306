%% read an image
img = imread('wanli_ouyang.jpeg');
figure(1), imshow(img), title('original image');

%% resize the image
img_x4 = imresize(I, 4, 'bilinear');
% img_x4 = imresize(I, 4, 'nearest');
% img_x4 = imresize(I, 4, 'nearest');
figure(2), imshow(img_x4), title('image_x4');

%% separate each channel
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
figure(3)
subplot(1, 3, 1), imshow(R), title('R');
subplot(1, 3, 2), imshow(G), title('G');
subplot(1, 3, 3), imshow(B), title('B');

%% transform the image from the space RGB to YUV
% yuv = rgb2yuv(img);
yuv = rgb2ycbcr(img);
figure(4), imshow(yuv), title('YUV');

%% transform back
% RGB = yuv2rgb(yuv);
RGB = ycbcr2rgb(yuv);
figure(5), imshow(RGB), title ('RGB');

%% modifying image
yuv(:, :, 1) = yuv(:, :, 1) + 50;
figure(6), imshow(yuv), title('new YUV');
new_rgb = ycbcr2rgb(yuv);
figure(7), imshow(new_rgb), title('new RGB');

%% compress the image
imwrite(new_rgb, 'new_rgb_100.jpg', 'Quality', 100);
imwrite(new_rgb, 'new_rgb_20.jpg', 'Quality', 20);
