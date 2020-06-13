img=imread('./couple.bmp');
img = img(:,:,1);
imshow(uint8(img));
hist(double(img(:)), 100);

img=imread('./couple.bmp');
img = double(img);
E = zeros(size(img));
for i=1:size(img, 1)
    for j=1:size(img, 2)
        if j==1 
            x_prime = img(i, 1);
            E(i,j) = x_prime;
        end
        if j>1 
            E(i,j) = img(i,j) - x_prime';
            x_prime = img(i,j);
        end
    end
end
imshow(uint8(abs(E)));
hist(E(:), 100);
img2 = zeros(size(img));
for i=1:size(img, 1)
    for j=1:size(img, 2)
        if j==1 
            x_prime = E(i, 1);
            img2(i, 1) = E(i, 1);
        end
        if j>1 
            img2(i,j) = E(i,j) + x_prime';
            x_prime = img2(i,j);
        end
    end
end
imshow(uint8(img2));
diff = sum(sum(abs(img2-img)));


