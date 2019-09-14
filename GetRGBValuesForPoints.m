function [RGB_value] = GetRGBValuesForPoints(image,points)
% GetRGBValuesForPoints finds the RGB (Red, Green, Blue) colour values
% for specified points from a chosen image and returns it as a 3D array.
%
% INPUTS: image     = a 3D image array from which to fetch RGB values from.
%         points    = [k*2] 2D array which identifies which points
%                     (rows/columns in the picture; pixels) to extract
%                     the colour values (ie the RGB values) for.
%
% OUTPUT: RGB_value = [k*1*3] 3D array. It has 3 layers, one for each
%                     colour Red Green Blue, representing a list of k
%                     points from the image and their colour values
%                     based on the layers.
% Author: Tushar Thakur

% Find the total number of rows for the input variable points
rows = size(points,1);

% Preallocating [rows*1*3] matrix  for efficiency. These zeros will be
% filled in later on in the function so they will not remain unchanged.
RGB_value = zeros(rows,1,3);

% The for loop ensures that the number of rows in colour_array (output) is
% the same as the number of rows in points (input) and that they are in
% the same order.
for i = 1:rows
    
    % Only selects the row and column based on the value in 'points'
    % input (using the variable 'i' below) and stores them in the correctly
    % allocated row in 'colour_array'.
    % j= 1:3 because 3 colours Red(1) Green(2) Blue(3)
    for j = 1:3
        
        % Fills in the RGB 3D array with colour values from points
        RGB_value(i,1,j) = image(points(i,1),points(i,2),j);
    end
end

end

