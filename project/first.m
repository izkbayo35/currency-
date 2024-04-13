% Load the image of the ₦1000 currency note
img_1000 = imread('1000.jpg');

% Convert the image to grayscale
gray_img_1000 = rgb2gray(img_1000);

% Define HOG parameters
cellSize = [8 8]; % Size of each cell in pixels
numBins = 9; % Number of orientation bins
blockSize = [2 2]; % Size of each block in cells

% Extract HOG features
hog_features_1000 = extractHOGFeatures(gray_img_1000, 'CellSize', cellSize, 'BlockSize', blockSize, 'NumBins', numBins);

% Display the HOG features
figure;
subplot(1,2,1);
imshow(gray_img_1000);
title('Original Image (₦1000)');
subplot(1,2,2);
plot(hog_features_1000);
title('HOG Features (₦1000)');

% Save the HOG features 
save('hog_features_1000.mat', 'hog_features_1000');
