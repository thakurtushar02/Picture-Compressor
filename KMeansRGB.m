function[cl_value,mean_colour] = KMeansRGB(image,k_means,max_iter)
% KMeansRGB divides all the points in an image in k number of clusters
% (determined by k_means). Then, the function cycles between
% updating the means and assigning the cluster to the new means, until the
% mean is not changing anymore.
%
% INPUTS:  image       = [m*n*3] 3D array which contains an RGB image
%          k_means     = [k*1*3] 3D array which contains the initial mean
%                        value for each cluster.
%          max_iter    = The maximum number of iterations allowed to
%                        perform.
%
% OUTPUTS: cl_value    = [m*n] 2D array which shows which cluster each
%                        pixel in the image is allocated to.
%          mean_colour = [k*1*3] 3D array where each row has the mean
%                        colour values for the cluster with the same row
%                        number.
% Author: Tushar Thakur

% Finding number of k_means in total
k_rows = size(k_means,1);

% k_means_1 and k_means_2 are the two means which are constantly compared
% to see if they are equal one another. Here, both have their sizes
% preallocated for efficiency.
k_means_1 = zeros(k_rows,1,3);
k_means_2 = k_means;

% Set number of iterations to 0 at start of function.
iterations = 0;

% Continue until old mean = new mean. ie. k_means_1 == k_means2. The while
% loop has two iterations inside it (instead of one) to easily compare the
% new mean to the mean JUST before that mean (one before).
while isequal(k_means_1,k_means_2) == false
    
    % Assign all points to new clusters based on their proximity to the
    % mean value of that cluster.
    [cl_value] = AssignToClusters(image,k_means_2);
    
    % Update the mean values of the cluster now that each cluster has new
    % points assigned to it. The means are the average of all points
    % assigned to that cluster. Store as k_means_1 to compare with
    % k_means_2.
    k_means_1 = UpdateMeans(image,k_rows,cl_value);
    
    % Increase iterations count.
    iterations = iterations + 1;
    
    % If max iterations (max_iter) is reached, return the latest mean
    % colour values.
    if iterations == max_iter
        
        mean_colour = k_means_2;
        
        % Warn the user that maximum iterations have been reached without
        % convergence of the mean.
        warning(['Maximum number of iterations reached before '...
            'convergence was achieved.'])
        
        % Return the function as maximum iterations have been reached.
        return
    end
    
    % If after the above iteration, the means are now equal, return the
    % latest mean colour values.
    if isequal(k_means_1,k_means_2) == true
        
        mean_colour = k_means_1;
        
        % Return the function as convergence has been reached.
        return
    end
    
    % Assign all points to new clusters based on their proximity to the
    % mean value of that cluster.
    [cl_value] = AssignToClusters(image,k_means_1);
    
    % Update the mean values of the cluster now that each cluster has new
    % points assigned to it. The means are the average of all points
    % assigned to that cluster. Store as k_means_2 to compare with
    % k_means_1.
    k_means_2 = UpdateMeans(image,k_rows,cl_value);
    
    % Increase iterations count.
    iterations = iterations + 1;
    
    % If max iterations (max_iter) is reached, return the latest mean
    % colour values.
    if iterations == max_iter
        
        mean_colour = k_means_2;
        
        % Warn the user that maximum iterations have been reached without
        % convergence of the mean.
        warning(['Maximum number of iterations reached before '...
            'convergence was achieved.'])
        
        % Return the function as maximum iterations have been reached.
        return
    end
    
end

% Return the mean colour values as convergence has been reached.
mean_colour = k_means_1;

end