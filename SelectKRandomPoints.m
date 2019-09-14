function [k_points] = SelectKRandomPoints(image,points)
% SelectKRandomPoints, from a chosen image, generates the row and column
% values of randomly selected pixels. The number of pixels (points) chosen
% depends on the input 'points'. 
%
% INPUTS: image    = [m*n*3] 3D image array from which the function selects
%                    points.
%         points   = total number of points to be randomly selected from
%                    the image
%
% OUTPUT: k_points = [points*2] 2D array, representing the k randomly
%                    selected k randomly selected points. Column 1 has the
%                    row values of the points, while column 2 contains the
%                    column values of the points (from the 3D image array.)
% Author: Tushar Thakur

% Preallocate the size of k_points, which is the output.
k_points = zeros(points,2);

% Finding the number of rows in the 3D array 'image'.
[rows_of_image] = size(image,1);

% Finding unique numbers between 1 and rows*columns of image. These are the
% positions of the points in the image array. The positions are then
% transposed to match the layout of the output of this function.
positions = randperm(rows_of_image*size(image,2),points);
positions = positions';

% Mathematical code which finds the row and column values of each value
% in positions.

% Rem(X) is used to find the remainder of positions-1 divided by
% rows_of_image. 1 is added to answer because arrays start at 1. The output
% is in the first column of k_points because that is where row values are
% stored.
k_points(:,1) = 1 + rem(positions - 1, rows_of_image);

% Difference between the rem value and the position itself, divided by the
% number of rows in the image, equals column value - 1. Therefore, 1 is
% added to show true column value. The output is in the second column of
% k_points because that is where column values are stored.
k_points(:,2) = 1 + (positions - k_points(:,1))/rows_of_image;

end