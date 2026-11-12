%I1 = imread('../stereo_pairs/Dino_L.png');
%I2 = imread('../stereo_pairs/Dino_R.png');
%d=[-32 32];

%I1=imread('../stereo_pairs/rds_L.jpg'); 
%I2=imread('../stereo_pairs/rds_R.jpg'); 
%d=[-32 32];

%I1=imread('../stereo_pairs/parkmeter.l.jpg'); 
%I2=imread('../stereo_pairs/parkmeter.r.jpg'); 
%d=[-32 32];

I1=imread('../stereo_pairs/corridor_l_original.jpg'); 
I2=imread('../stereo_pairs/corridor_r_original.jpg'); 
d=[-32 32];


if (size(I1,3)==3)
  I1=rgb2gray(I1);
  I2=rgb2gray(I2);
end

% Display the images after rectification.
figure(1); imshowpair(I1,I2,'ColorChannels','red-cyan');
title('Images');

disparityMap = disparitySGM(I1,I2,'DisparityRange',d);
 
% Show the disparity map. Brighter pixels indicate objects which are
% closer to the camera.
figure(2); imshow(mat2gray(disparityMap), 'InitialMagnification', 200);
colormap jet; colorbar;




