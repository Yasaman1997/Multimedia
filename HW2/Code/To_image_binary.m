I = imread('photo.jpg');
BW = imbinarize(image);
figure
imshowpair(I,BW,'montage')
returnedImage=BW;


