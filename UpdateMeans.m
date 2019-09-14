function[cl_means] = UpdateMeans(image,k_value,cluster)
% UpdateMeans finds the mean_values of each cluster based on the points in
% that cluster.
%
% INPUTS: image    = [m*n*3] 3D array which contains an RGB image
%         k_value  = A single value signifying how many clusters there are.
%         cluster  = [m*n] 2D array which has the cluster allocation for
%                    each pixel (point).
%
% OUTPUT: cl_means = [k*1*3] 3D array which contains the mean value for
%                    each cluster.
% Author: Tushar Thakur

% Preallocating cl_means for speed.
cl_means = zeros(k_value,1,3);

% Repeat for 1 to the number of clusters there are in total.
for i = 1:k_value
    
    % Finds in the cluster array, the cluster allocations = i.
    index = cluster == i;
    
    % A for loop here increases time (this way is better for efficiency).
    % Making the 2D logical array 'index' into a 3 different logical arrays
    % (one for each colour).
    index_red(:,:,1) = index;
    index_green(:,:,2) = index;
    index_blue(:,:,3) = index;
    
    % A for loop here increases time (this way is better for efficiency).
    % Finding the mean of the red/green/blue value and storing it in their
    % respective layers for the output.
    cl_means(i,1,1) = mean(image(index_red));
    cl_means(i,1,2) = mean(image(index_green));
    cl_means(i,1,3) = mean(image(index_blue));
    
end

end