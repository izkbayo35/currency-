% Load the currency note images
img_200 = imread('200.jpg');
img_500 = imread('500.jpg');
img_1000 = imread('1000.jpg');

% Apply Weiner filter to each image
%filtered_img_200 = wiener2(img_200);
%filtered_img_500 = wiener2(img_500);
%filtered_img_1000 = wiener2(img_1000);

% Convert the image to grayscale
gray_img_200 = rgb2gray(img_200);
gray_img_500 = rgb2gray(img_500);
gray_img_1000 = rgb2gray(img_1000);

% Apply Weiner filter to each image
filtered_img_200 = wiener2(gray_img_200);
filtered_img_500 = wiener2(gray_img_500);
filtered_img_1000 = wiener2(gray_img_1000);


% Display the original and filtered images
figure;
subplot(3, 2, 1);
imshow(img_200);
title('Original ₦200');
subplot(3, 2, 2);
imshow(filtered_img_200);
title('Filtered ₦200');

subplot(3, 2, 3);
imshow(img_500);
title('Original ₦500');
subplot(3, 2, 4);
imshow(filtered_img_500);
title('Filtered ₦500');

subplot(3, 2, 5);
imshow(img_1000);
title('Original ₦1000');
subplot(3, 2, 6);
imshow(filtered_img_1000);
title('Filtered ₦1000');
