%Q1

%a
myImage = imread('photo.jpg');

figure
subplot(1,2,1);
imshow(myImage);
title('Original Image');

subplot(1,2,2);
grayScaleImage = To_gray_image_8(myImage);
imshow(grayScaleImage);
title('Grayscale Image')







