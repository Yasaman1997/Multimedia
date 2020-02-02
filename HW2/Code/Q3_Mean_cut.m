% Uses blockproc() to get mean color of image blocks with a variety of input and output sizes.
% Demo code to divide the image up into N pixel by N pixel blocks
% and replace each pixel in the block by the mean RGB value
% of all the pixels in the block.
%
clc;
clearvars;
close all;
workspace;
fontSize = 12;

% Read in a standard MATLAB color demo image.
folder = fileparts(which('photo.jpg'));
if ~exist(folder, 'dir')
	folder = [];
end
baseFileName = 'photo.jpg';
fullFileName = fullfile(folder, baseFileName);
rgbImage = imread(fullFileName);
% Get the dimensions of the image.  numberOfColorBands should be = 1.
[rows, columns, numberOfColorBands] = size(rgbImage)
% Display the original gray scale image.
subplot(2, 3, 1);
imshow(rgbImage, []);
axis('on', 'image');
caption = sprintf('Original RGB Color Image\n%d rows by %d columns', rows, columns);
title(caption, 'FontSize', fontSize);

% Enlarge figure to full screen.
set(gcf, 'Position', get(0,'Screensize'));
set(gcf,'name','Image Analysis Demo','numbertitle','off')
drawnow;

% Extract the individual red, green, and blue color channels.
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);

blockSize = [64 64]; % 64 pixel by 64 pixel window that jumps along in steps of 64.
% Block process the image to replace every pixel in the
% 64 pixel by 64 pixel block by the mean of the pixels in the block.
% The image is 512 pixels across which will give 512/84 = 8 blocks.
% Note that the size of the output block (2 by 2 because we used ones(2,2...))
% does not need to be the size of the input block!
% Image will be the 16 x 16 (instead of 8 x 8) since we are using ones(2, 2)
% and so for each of the 8 blocks across
% there will be a block of 2 by 2 output pixels, giving an output size of 64*2 = 128.
% We will still have 64 blocks across but each block will only be 2 output pixels across,
% even though we moved in steps of 4 pixels across the input image.
outputMagnificationRatio1 = 1;
meanFilterFunction1 = @(theBlockStructure) mean2(theBlockStructure.data(:)) * ones(outputMagnificationRatio1, outputMagnificationRatio1, class(theBlockStructure.data));
outputMagnificationRatio2 = 4;
meanFilterFunction2 = @(theBlockStructure) mean2(theBlockStructure.data(:)) * ones(outputMagnificationRatio2, outputMagnificationRatio2, class(theBlockStructure.data));
outputMagnificationRatio3 = 64; % To make the same size as the original image.
meanFilterFunction3 = @(theBlockStructure) mean2(theBlockStructure.data(:)) * ones(outputMagnificationRatio3, outputMagnificationRatio3, class(theBlockStructure.data));

%------------------------------------------------------------------------------------------------------------
% First process the image and each 64x64 block is one output pixel.
% Now,here we actually to the actual filtering.
blockyImageR = blockproc(redChannel, blockSize, meanFilterFunction1);
blockyImageG = blockproc(greenChannel, blockSize, meanFilterFunction1);
blockyImageB = blockproc(blueChannel, blockSize, meanFilterFunction1);
[blockRows, blockColumns] = size(blockyImageR)

% Recombine separate color channels into a single, true color RGB image.
rgbImage2 = cat(3, blockyImageR, blockyImageG, blockyImageB);

% Display the block mean image.
subplot(2, 3, 2);
imshow(rgbImage2, []);
axis('on', 'image');
caption = sprintf('Block mean image with 8 blocks across.\nInput block size = %d, output block size = %d\nOutput image size = %d rows by %d columns', ...
	blockSize(1), outputMagnificationRatio1, blockRows, blockColumns);
title(caption, 'FontSize', fontSize);

%------------------------------------------------------------------------------------------------------------
% Next process the image and each 64x64 block is an array of 4 x 4 pixels.
% Now,here we actually to the actual filtering.
blockyImageR = blockproc(redChannel, blockSize, meanFilterFunction2);
blockyImageG = blockproc(greenChannel, blockSize, meanFilterFunction2);
blockyImageB = blockproc(blueChannel, blockSize, meanFilterFunction2);
[blockRows, blockColumns] = size(blockyImageR)

% Recombine separate color channels into a single, true color RGB image.
rgbImage2 = cat(3, blockyImageR, blockyImageG, blockyImageB);

% Display the block mean image.
subplot(2, 3, 3);
imshow(rgbImage2, []);
axis('on', 'image');
caption = sprintf('Block mean image with 8 blocks across.\nInput block size = %d, output block size = %d\nOutput image size = %d rows by %d columns', ...
	blockSize(1), outputMagnificationRatio2, blockRows, blockColumns);
title(caption, 'FontSize', fontSize);

%------------------------------------------------------------------------------------------------------------
% Next process the image and each 64x64 block is an array of 64 x 64 pixels.
% So it will be the same size as the original image.
% Now,here we actually to the actual filtering.
blockyImageR = blockproc(redChannel, blockSize, meanFilterFunction3);
blockyImageG = blockproc(greenChannel, blockSize, meanFilterFunction3);
blockyImageB = blockproc(blueChannel, blockSize, meanFilterFunction3);
[blockRows, blockColumns] = size(blockyImageR)

% Recombine separate color channels into a single, true color RGB image.
rgbImage2 = cat(3, blockyImageR, blockyImageG, blockyImageB);

% Display the block mean image.
subplot(2, 3, 4);
imshow(rgbImage2, []);
axis('on', 'image');
caption = sprintf('Block mean image with 8 blocks across.\nInput block size = %d, output block size = %d\nOutput image size = %d rows by %d columns', ...
	blockSize(1), outputMagnificationRatio3, blockRows, blockColumns);
title(caption, 'FontSize', fontSize);


%------------------------------------------------------------------------------------------------------------
% Next process the image and each 64x64 block is an array of 128 x 128 pixels.
% So it will be the same size as the original image.
outputMagnificationRatio4 = 128; % To make double the size as the original image.
meanFilterFunction4 = @(theBlockStructure) mean2(theBlockStructure.data(:)) * ones(outputMagnificationRatio4, outputMagnificationRatio4, class(theBlockStructure.data));
% Now,here we actually to the actual filtering.
blockyImageR = blockproc(redChannel, blockSize, meanFilterFunction4);
blockyImageG = blockproc(greenChannel, blockSize, meanFilterFunction4);
blockyImageB = blockproc(blueChannel, blockSize, meanFilterFunction4);
[blockRows, blockColumns] = size(blockyImageR);

% Recombine separate color channels into a single, true color RGB image.
rgbImage2 = cat(3, blockyImageR, blockyImageG, blockyImageB);

% Display the block mean image.
subplot(2, 3, 5);
imshow(rgbImage2, []);
axis('on', 'image');
caption = sprintf('Block mean image with 8 blocks across.\nInput block size = %d, output block size = %d\nOutput image size = %d rows by %d columns', ...
	blockSize(1), outputMagnificationRatio4, blockRows, blockColumns);
title(caption, 'FontSize', fontSize);


%------------------------------------------------------------------------------------------------------------
% Next process the image and each 8x8 block is a pixel.
blockSize = [16, 16]; % 16 pixel by 16 pixel window that jumps along in steps of 16.
outputMagnificationRatio5 = 1;
meanFilterFunction5 = @(theBlockStructure) mean2(theBlockStructure.data(:)) * ones(outputMagnificationRatio5, outputMagnificationRatio5, class(theBlockStructure.data));
% Now,here we actually to the actual filtering.
blockyImageR = blockproc(redChannel, blockSize, meanFilterFunction5);
blockyImageG = blockproc(greenChannel, blockSize, meanFilterFunction5);
blockyImageB = blockproc(blueChannel, blockSize, meanFilterFunction5);
[blockRows, blockColumns] = size(blockyImageR);

% Recombine separate color channels into a single, true color RGB image.
rgbImage2 = cat(3, blockyImageR, blockyImageG, blockyImageB);

% Display the block mean image.
subplot(2, 3, 6);
imshow(rgbImage2, []);
axis('on', 'image');
caption = sprintf('Block mean image with 8 blocks across.\nInput block size = %d, output block size = %d\nOutput image size = %d rows by %d columns', ...
blockSize(1), outputMagnificationRatio3, blockRows, blockColumns);
title(caption, 'FontSize', fontSize);
