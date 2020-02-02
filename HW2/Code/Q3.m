image=imread('photo.jpg');

%imshow(image);
[row, col, c] = size(image);
str = strcat('Original Image of Size = [',num2str(size(image)),']');
title(str);

Blank = zeros(row,col);
PlotRow = 3;
PlotCol = 2;
%R
R = image(:, :, 1);
R_Comp_Image = cat(3,R,Blank,Blank);
subplot(PlotRow,PlotCol,2); 

imshow(R_Comp_Image);
title('R-Component Image');

%G
G = image(:, :, 2);
G_Comp_Image = cat(3,Blank,G,Blank);
subplot(PlotRow,PlotCol,3); 
imshow(G_Comp_Image);
title('G-Component Image');

%B
B = image(:, :, 3);
B_Comp_Image = cat(3,Blank,Blank,B);
subplot(PlotRow,PlotCol,4); 
imshow(B_Comp_Image);
title('B-Component Image');

PlotRow = 3;
PlotCol = 2;
figure

subplot(PlotRow,PlotCol,1); 
imshow(R_Comp_Image);
title('R-Component Image');
subplot(PlotRow,PlotCol,2);
[P,X] = imhist(R); plot(X,P,'r');
title('R-Component Image Histogram');
xlabel('— Pixel Intensity (0 – 255) —>');
ylabel('No. of Pixels —>');

subplot(PlotRow,PlotCol,3); 
imshow(G_Comp_Image);
title('G-Component Image');
subplot(PlotRow,PlotCol,4);
[P,X] = imhist(G); plot(X,P,'g');
title('G-Component Image Histogram');
xlabel('— Pixel Intensity (0 – 255) —>');
ylabel('No. of Pixels —>');

subplot(PlotRow,PlotCol,5); 
imshow(B_Comp_Image);
title('B-Component Image');

subplot(PlotRow,PlotCol,6);
[P,X] = imhist(B); 
plot(X,P,'b');
title('B-Component Image Histogram');
xlabel('— Pixel Intensity (0 – 255) —>');
ylabel('No. of Pixels —>');







