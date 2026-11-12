
IN = imread('i235.png');
if size(IN,3)==3, IN = rgb2gray(IN); end

%matrix filter settings
%grating
w=3;
[X1,Y1]=meshgrid(1:w); %pixel
X=X1-(w+1)/2; Y=Y1-(w+1)/2;

%impulse filter
w = 3; 
Z1 = zeros(w);
Z1(round(w/2), round(w/2)) = 1;
FZ1 = fftshift(fft2(Z1));
figure, imagesc(abs(FZ1)), colormap gray, xlabel('wx'), ylabel('wy');

%impulse filter (shifted right)
w = 3; 
Z2 = zeros(w);
Z2(round(w/2), round(w/2) + 1) = 1;
FZ2 = fftshift(fft2(Z2));
figure, imagesc(abs(FZ2)), colormap gray, xlabel('wx'), ylabel('wy');

%box filter
Z3= ones(3) / 9;
vi=-5:5;
FZ3=fftshift(fft2(Z3));
figure,imagesc(abs(FZ3)),colormap gray,xlabel('wx'),ylabel('wy')

%sharpening filter
w = 3; 
Z4 = zeros(w);
Z4(round(w/2), round(w/2)) = 2;
Z5=Z4-Z3;
FZ5=fftshift(fft2(Z5));
figure,imagesc(abs(FZ5)),colormap gray,xlabel('wx'),ylabel('wy')

%% Gaussian noise filtering 

% --- Gaussian Noise ---
outG = double(IN) + 20*randn(size(IN));
outG = uint8(min(max(outG,0),255));


out11 = imfilter(outG, Z1, 'replicate');
figure; imshow(out11,[]); title('Impulse filtering for Gaussian noise'); colormap gray;
out12 = imfilter(outG, Z2, 'replicate');
figure; imshow(out12,[]); title('Shifted impulse filtering for Gaussian noise'); colormap gray;
out13 = imfilter(outG, Z3, 'replicate');
figure; imshow(out13,[]); title('Box filtering for Gaussian noise'); colormap gray;
out14 = imfilter(outG, Z5, 'replicate');
figure; imshow(out14,[]); title('Sharpening filtering for Gaussian noise'); colormap gray;



%% Salt & pepper noise filtering 
% --- Salt & Pepper ---
outSP = imnoise(IN,'salt & pepper',0.2); 

out21 = imfilter(outSP, Z1, 'replicate');
figure; imshow(out21,[]); title('Impulse filtering for S&P noise'); colormap gray;
out22 = imfilter(outSP, Z2, 'replicate');
figure; imshow(out22,[]); title('Shifted impulse filtering for S&P noise'); colormap gray;
out23 = imfilter(outSP, Z3, 'replicate');
figure; imshow(out23,[]); title('Box filtering for S&P noise'); colormap gray;
out24 = imfilter(outSP, Z5, 'replicate');
figure; imshow(out24,[]); title('Sharpening filtering for S&P noise'); colormap gray;



