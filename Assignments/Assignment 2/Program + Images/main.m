addpath('Include');

img1=imread('ur_c_s_03a_01_L_0376.png');
img2=imread('ur_c_s_03a_01_L_0377.png');
img3=imread('ur_c_s_03a_01_L_0378.png');
img4=imread('ur_c_s_03a_01_L_0379.png');
img5=imread('ur_c_s_03a_01_L_0380.png');
img6=imread('ur_c_s_03a_01_L_0381.png');

%I convert the coloured images in their grey-scale version:
g1 = rgb2gray(img1);
g2 = rgb2gray(img2);
g3 = rgb2gray(img3);
g4 = rgb2gray(img4);
g5 = rgb2gray(img5);
g6 = rgb2gray(img6);


img7=imread('i235.png');

%I convert the coloured image in its grey-scale version:
g7 = im2gray(img7);
I7 = im2double(g7);

%% red car

%I create a patch (template) of the red car out of the first image ur_c_s_03a_01_L_0376.png:
T1=img1(330:460, 680:780);%red car
figure,imagesc(T1),colormap gray
title('Template (red car)'); 

%Normalized 2-D cross-correlation for the 6 images

G = {g1, g2, g3, g4, g5, g6};

RedCarNCC(G, T1);

%% Dark car

%I create a patch (template) of the dark car out of the first image ur_c_s_03a_01_L_0376.png:
T2=img1(350:450, 550:650);% dark car
figure,imagesc(T2),colormap gray
title('Template (dark car)'); 

%Normalized 2-D cross-correlation for the 6 images

G = {g1, g2, g3, g4, g5, g6};

DarkCarNCC(G, T2);

%smaller dimensions compared to the previous window
T21=img1(370:430, 570:630);%dark car
figure,imagesc(T21),colormap gray
title('Template (small dark car window)');

DarkCarSmall(T21, g1);

%bigger dimensions compared to the previous window
T22=img1(330:470, 530:670);%dark car
figure,imagesc(T22),colormap gray
title('Template (big dark car window)'); 

DarkCarBig(T22, g1);

%% Harris corner detection application: preparing the derivatives, gradients, Gaussian filter

%Computing x and y derivatives of the image with Sobel masks (to estimate partial derivatives):
dx=[1 0 -1; 2 0 -2; 1 0 -1]; %to check variations along x axis (vertical edge)
dy=[1 2 1; 0  0  0; -1 -2 -1]; %to check variations along y axis (horizontal edge)
%Derivative estimates:
Ix=conv2(I7,dx,'same');
Iy=conv2(I7,dy,'same');
figure,imagesc(Ix),colormap gray,title('Ix')
figure,imagesc(Iy),colormap gray,title('Iy')

%Computing the products of derivatives at each pixel (gradients):
Ix2=Ix.*Ix; Iy2=Iy.*Iy; Ixy=Ix.*Iy;

%Computing the sum of products of derivatives at each pixel by applying a Gaussian smoothing, which will be useful to avoid unstable responses in the gradients. 
g = fspecial('gaussian', 9, 1.2);
figure,imagesc(g),colormap gray,title('Gaussian')
%Application of the filter on the Harris detector gradients (noise reduction and stabilization of the M matrix)
Sx2=conv2(Ix2,g,'same'); Sy2=conv2(Iy2,g,'same'); Sxy=conv2(Ixy,g,'same');


%% Computation of the M matrix, R response and the corner regions

HarrisCornerDetector (I7, Sx2, Sxy, Sy2);




