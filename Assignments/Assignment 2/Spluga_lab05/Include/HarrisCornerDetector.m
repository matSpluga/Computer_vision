function HarrisCornerDetector(I, Sx2, Sxy, Sy2)

%Features detection:
[rr,cc]=size(Sx2);
R_map=zeros(rr,cc);
k=0.05;

for ii=1:rr % rows
    for jj=1:cc % columns
        %define at each pixel x,y the matrix
        M=[Sx2(ii,jj),Sxy(ii,jj);Sxy(ii,jj),Sy2(ii,jj)]; 
        %compute the response of the detector at each pixel
        R=det(M) - k*(trace(M).^2);
        R_map(ii,jj)=R; % R map update
        
    end
end

%Threshod for the corner regions
Mmax = max(R_map(:));
thr  = 0.3 * Mmax;
corner_map = R_map>thr;

%Showing R map and the corner regions
figure; imagesc(corner_map); colormap gray; axis image;
title('corner regions');
figure,imagesc(R_map),colormap jet,title('R map')

%Using the regionprops function in order to get the centroids of the blobs from the corner regions map
props = regionprops(corner_map, 'Centroid');

% Extracting the centroids in an Nx2 matrix:
centroids = cat(1, props.Centroid);

% Visualizing the centroids overlapped on the original image
figure; imshow(I); hold on;
plot(centroids(:,1), centroids(:,2), 'r+', 'MarkerSize', 10, 'LineWidth', 1.5);
title('Detected Harris Corners');
