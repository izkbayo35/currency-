% Load the image of the ₦500 currency note
img_500 = imread('500.jpg');

% Convert the image to grayscale
gray_img_500 = rgb2gray(img_500);

% Define HOG parameters
cellSize = [8 8]; % Size of each cell in pixels
numBins = 9; % Number of orientation bins
blockSize = [2 2]; % Size of each block in cells

% Extract HOG features
hog_features_500 = extractHOGFeatures(gray_img_500, 'CellSize', cellSize, 'BlockSize', blockSize, 'NumBins', numBins);

% Display the HOG features
figure;
subplot(1,2,1);
imshow(gray_img_500);
title('Original Image (₦500)');
subplot(1,2,2);
plot(hog_features_500);
title('HOG Features (₦500)');


save('hog_features_500.mat', 'hog_features_500');
