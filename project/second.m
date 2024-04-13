% Load the image of the ₦200 currency note
img_200 = imread('200.jpg');

% Convert the image to grayscale
gray_img_200 = rgb2gray(img_200);

% Define HOG parameters
cellSize = [8 8]; % Size of each cell in pixels
numBins = 9; % Number of orientation bins
blockSize = [2 2]; % Size of each block in cells

% Extract HOG features
hog_features_200 = extractHOGFeatures(gray_img_200, 'CellSize', cellSize, 'BlockSize', blockSize, 'NumBins', numBins);

% Display the HOG features
figure;
subplot(1,2,1);
imshow(gray_img_200);
title('Original Image (₦200)');
subplot(1,2,2);
plot(hog_features_200);
title('HOG Features (₦200)');


save('hog_features_200.mat', 'hog_features_200');
