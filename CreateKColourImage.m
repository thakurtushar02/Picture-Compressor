function [image] = CreateKColourImage(cl_value,mean_colour)
% CreateKColourImage creates an image with k number of colours from an
% image which has had its pixels divided into k clusters. Each pixel in the
% original image is recoloured into the colour of the cluster within
% which it resides.
%
% INPUTS: cl_value    = [m*n] 2D array which shows the cluster number each
%                       pixel belongs to.
%         mean_colour = [k*1*3] 3D array where each row has the mean
%                       colour values for the cluster with the same row
%                       number.
%
% OUTPUT: image       = [m*n*3] 3D array unsigned 8 bit integer which
%                       contains an RGB image which has k number of colours
%                       on it. The pixel colour is determined by the colour
%                       associated by thecluster in which the pixel is
%                       grouped in.
% Author: Tushar Thakur

% Rounding the values inside the array.
mean_colour = round(mean_colour);

% Finding out the number of means/clusters (number of rows), and also
% finding out the size of the 2D array 'cluster'.
% cl_rows is number of rows, and cl_cols is number of columns in the array.
mean_rows = size(mean_colour,1);
[cl_rows,cl_cols] = size(cl_value);

% Preallocating single_image_layer and the output 'image' for efficiency.
single_img_layer = zeros(cl_rows,cl_cols);
image = zeros(cl_rows,cl_cols,3);

% output 'image' is made layer by layer, going from 1 to 3 using the output
% single_img_layer. It finalises the layer and puts it into image 3 times
% to get the final [m*n*3] matrix. single_img_layer is a 2D array.

% Cycle through the 3 layers (Red, Green, Blue) one by one.
for j = 1:3
    % Cycle through the number of mean colour values one by one.
    for i = 1:mean_rows
        
        % Creates a logical array which finds all values which are equal
        % to i (1 to however many clusters in total there are), and stores
        % their locations in 'cluster' array.
        cluster = cl_value == i;
        
        % search for all 1's or TRUE's in cluster logical array and replace
        % those values with the corresponding mean_colour (for every i)
        single_img_layer(cluster) = mean_colour(i,1,j);
    end
    
    % Stores all the information into final output for that single layer.
    image(:,:,j) = single_img_layer;
    
end

% Changes the output 3D array into an unsigned 8 bit integer
image = uint8(image);
end