function[cluster] = AssignToClusters(image,k_means)
% AssignToClusters assigns every pixel (point in an image) to a cluster
% based on its proximity to a mean (assigned to whichever mean it is
% closest to).
%
% INPUTS: image   = [m*n*3] 3D array which contains an RGB image
%         k_means = [k*1*3] 3D array containing colour information for
%                   each of the k means. There are a k number of means.
%
% OUTPUT: cluster = [m*n] 2D array which has the cluster allocation for
%                   each pixel (point) in the image provided. The
%                   allocation is based on which k mean the pixel is
%                   closest to.
% Author: Tushar Thakur

% Finding the number of rows in the 3D image array, and finding the number
% of k means in the input k_means.
[rows_of_image,cols_of_image,~] = size(image);
k_rows = size(k_means,1);

% Preallocating the total size of the cluster output for efficiency.
cluster = zeros(rows_of_image,cols_of_image);


% If there is only 1 k-mean, all points will automatically be closest to it
% because they don't have any other points to compare with.
if k_rows == 1
    cluster = ones(rows_of_image,cols_of_image);
    
    % Otherwise (ie if k_rows (number of k_means) does not equal one
else
    
    % Repeat this for each row of the 3D image array
    for i = 1:rows_of_image
        
        % The ~ is the value, and k_mean_row_number is the row number of
        % the point from the k means which is closest to the point in the
        % image. This step is done row by row and all columns are done
        % together. This equation is the same as the equation for
        % SquaredDistance function, however, the function is not called for
        % increased speed (efficiency).
        [~,k_mean_row_number] = min(abs((image(i,:,1) - ...
            k_means(:,:,1)).^2) + (image(i,:,2) - k_means(:,:,2)).^2  + ...
            (image(i,:,3) - k_means(:,:,3)).^2);
        
        % Store the data in the output, cluster, and in the right order.
        cluster(i,:) = k_mean_row_number;
    end
end
end
