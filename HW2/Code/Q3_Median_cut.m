img=imread('photo.jpg');
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
medfilimg(:,:,1) = medfilt2(R);
medfilimg(:,:,2) = medfilt2(G);
medfilimg(:,:,3) = medfilt2(B);

figure
subplot(1,2,1);
imshow(img);
title('Original Image');

subplot(1,2,2);
imshow(medfilimg);
title('median filtered  Image')