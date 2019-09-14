function[distance_squared] = SquaredDistance(point_1,point_2)
% SquaredDistance calculates the distance between two points  in 3D space,
% and then squares the result. This distance is mathematically equivalent
% to D = (P1 - Q1)^2 + (P2 - Q2)^2 + (P3 - Q3)^2.
%
% INPUTS: point_1          = An array with 3 elements representing the
%                            first point in 3D space.
%         point_2          = An array with 3 elements representing the
%                            second point in 3D space.
%
% OUTPUT: distance_squared = the square of the distance between the two
%                            inputs, point_1 and point_2 in 3D space.
%
% Author: Tushar Thakur

% P1, P2, and P3 = point_1(1), point_1(2), and point_1(3) respectively.
% Q1, Q2, and Q3 = point_2(1), point_2(2), and point_2(3) respectively.
% D = distance_squared.
% equation D = (P1 - Q1)^2 + (P2 - Q2)^2 + (P3 - Q3)^2.
distance_squared = (point_1(1) - point_2(1))^2 + ...
    (point_1(2)-point_2(2))^2 + (point_1(3) - point_2(3))^2;

end

