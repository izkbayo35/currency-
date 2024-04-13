function [portrait_block, lettering_block, d_number_block] = ExtractBlocksWithVisualization(rgb_image)
    % Convert the input image to grayscale
    gray_image = rgb2gray(rgb_image);

    % Perform edge detection
    edges_image = edge(gray_image, 'Canny');

    % Use morphological operations to enhance edges
    se = strel('disk', 3);
    edges_image = imclose(edges_image, se);

    % Perform connected component analysis to identify regions
    cc = bwconncomp(edges_image);
    stats = regionprops(cc, 'Area', 'BoundingBox');

    % Sort regions by area to find the largest regions
    [sorted_areas, idx] = sort([stats.Area], 'descend');

    % Extract regions corresponding to Portrait, Lettering, and D number blocks
    portrait_block = false(size(edges_image));
    lettering_block = false(size(edges_image));
    d_number_block = false(size(edges_image));

    % Identify regions based on bounding box dimensions and aspect ratio
    for i = 1:min(3, cc.NumObjects) % Consider top 3 largest regions
        bb = stats(idx(i)).BoundingBox;
        aspect_ratio = bb(3) / bb(4);

        if aspect_ratio > 0.8 && aspect_ratio < 1.2 % Assume Portrait block
            portrait_block(cc.PixelIdxList{idx(i)}) = true;
        elseif aspect_ratio > 5 % Assume D number block
            d_number_block(cc.PixelIdxList{idx(i)}) = true;
        else % Assume Lettering block
            lettering_block(cc.PixelIdxList{idx(i)}) = true;
        end
    end

    % Refine the blocks using morphological operations
    se = strel('disk', 10);
    portrait_block = imopen(portrait_block, se);
    lettering_block = imopen(lettering_block, se);
    d_number_block = imopen(d_number_block, se);

    % Fill holes in the blocks
    portrait_block = imfill(portrait_block, 'holes');
    lettering_block = imfill(lettering_block, 'holes');
    d_number_block = imfill(d_number_block, 'holes');
    
    % Overlay blocks on the original image for visualization
    overlay_image = rgb_image;
    overlay_image(portrait_block) = 255; % Set pixels of Portrait block to white
    overlay_image(lettering_block) = 255; % Set pixels of Lettering block to white
    overlay_image(d_number_block) = 255; % Set pixels of D number block to white
    
    % Display the original image with overlaid blocks
    figure;
    imshow(overlay_image);
    title('Image with Overlayed Blocks');
end

% Example usage:
image = imread('1000.jpg');
ExtractBlocksWithVisualization(image);
