IN = imread('i235.png');
if size(IN,3)==3, IN = rgb2gray(IN); end

%Gaussian low-pass filter settings 3x3
%grating
w=3;
[X1,Y1]=meshgrid(1:w); %pixel
X = X1 - (w+1)/2;
Y = Y1 - (w+1)/2;

Z1=exp((-X.^2 -Y.^2)/(2*(w/6)^2));%standard deviation: 5 pixels
Z1 = Z1 / sum(Z1(:));     
figure, mesh(Z1), title('Gaussian 3x3');
figure, imagesc(Z1), colormap gray, axis image, title('3x3 kernel');


%Gaussian low-pass filter settings 7x7
%grating
w=7;
[X1,Y1]=meshgrid(1:w); %pixel
X = X1 - (w+1)/2;
Y = Y1 - (w+1)/2;

Z2=exp((-X.^2 -Y.^2)/(2*(w/6)^2));%standard deviation: 5 pixels
Z2 = Z2 / sum(Z2(:));     
figure, mesh(Z2), title('Gaussian 7x7');
figure, imagesc(Z2), colormap gray, axis image, title('7x7 kernel');

%% Gaussian noise application and filtering

% --- Gaussian Noise ---
outG = double(IN) + 20*randn(size(IN)); 
outG = uint8(min(max(outG,0),255));

%applying Gaussian low-pass filter 7x7
out11 = imfilter(outG, Z2, 'replicate');
figure; imshow(out11,[]); title('Gaussian noise Low-pass Gaussian filtering 7x7'); colormap gray;
showHist(out11, 'Histogram Gaussian filtered 7x7'); 
%applying Gaussian low-pass filter 3x3
out12 = imfilter(outG, Z1, 'replicate');
figure; imshow(out12,[]); title('Gaussian noise Low-pass Gaussian filtering 3x3'); colormap gray;
showHist(out12, 'Histogram Gaussian filtered 3x3'); 

%% Salt & pepper noise application and filtering

% --- Salt & Pepper ---
outSP = imnoise(IN,'salt & pepper',0.2); 

%applying Gaussian low-pass filter 7x7
out21 = imfilter(outSP, Z2, 'replicate');
figure; imshow(out21,[]); title('S&P Low-pass Gaussian filtering 7x7'); colormap gray;
showHist(out21, 'Histogram S&P filtered 7x7'); 
%applying Gaussian low-pass filter 3x3
out22 = imfilter(outSP, Z1, 'replicate');
figure; imshow(out22,[]); title('S&P Low-pass Gaussian filtering 3x3'); colormap gray;
showHist(out22, 'Histogram S&P filtered 3x3'); 




%function described to fix a histogram graphics related issue that kept
%showing. I used a "showHist" function call instead of "imhist" function
%(that kept showing the histogram graphic bug).

function showHist(I, ttl)
    % I   = image (uint8 or double)
    % ttl = title
    if ~isa(I,'uint8'), I = uint8(I); end
    [c,b] = imhist(I,256);
    figure; 
    bar(b, c, 'EdgeColor','none');  %net color and not linked with colormap
    xlim([0 255]); title(ttl); 
    set(gcf,'Color','w'); set(gca,'Box','on');
    
end