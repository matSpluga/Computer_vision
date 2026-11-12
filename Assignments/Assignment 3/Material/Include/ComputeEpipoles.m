function [e_left, e_right]= ComputeEpipoles(F)

[U, W, V] = svd(F);
e_right = V(:, end); %right epipole (last column of V)
e_left = U(:, end); %left epipole (last column of U)

% normalization in homogeneous coordinates
e_left  = e_left  / e_left(3);
e_right = e_right / e_right(3);

