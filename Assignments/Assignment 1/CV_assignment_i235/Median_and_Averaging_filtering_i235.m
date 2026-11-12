
IN = imread('i235.png');
if size(IN,3)==3, IN = rgb2gray(IN); end

%% Gaussian noise filtering

% --- Gaussian Noise ---
outG = double(IN) + 20*randn(size(IN));
outG = uint8(min(max(outG,0),255)); 

%smoothing by averaging 3x3
K1=ones(3)/9;
outc11=conv2(outG,K1,'same');
figure,imagesc(outc11),colormap gray,title('Gaussian smoothing by averaging 3x3');
showHist(outc11, 'Gaussian Histogram (3x3 moving average filter)');
%
%non-linear median filter 3x3
outm11=medfilt2(outG,[3,3]);
figure,imagesc(outm11),colormap gray,title('Gaussian non-linear filter 3x3');
showHist(outm11, 'Gaussian Histogram (3x3 non-linear filter)');

%smoothing by averaging 7x7
K2=ones(7)/9;
outc12=conv2(outG,K2,'same');
figure,imagesc(outc12),colormap gray,title('Gaussian smoothing by averaging 7x7')
showHist(outc12, 'Gaussian Histogram (7x7 moving average filter)');
%
%non-linear median filter 7x7
outm12=medfilt2(outG,[7,7]);
figure,imagesc(outm12),colormap gray,title('Gaussian non-linear filter 7x7')
showHist(outm12, 'Gaussian Histogram (7x7 non-linear filter)');

%% Salt & pepper noise filtering

% --- Salt & Pepper ---
outSP = imnoise(IN,'salt & pepper',0.2);

%smoothing by averaging 3x3
K1=ones(3)/9;
outc21=conv2(outSP,K1,'same');
figure,imagesc(outc21),colormap gray,title('S&P smoothing by averaging 3x3')
showHist(outc21, 'S&P Histogram (3x3 moving average filter)');
%
%non-linear median filter 3x3
outm21=medfilt2(outSP,[3,3]);
figure,imagesc(outm21),colormap gray,title('S&P non-linear filter 3x3')
showHist(outm21, 'S&P Histogram (3x3 non-linear filter)');

%smoothing by averaging 7x7
K2=ones(7)/9;
outc22=conv2(outSP,K2,'same');
figure,imagesc(outc22),colormap gray,title('S&P smoothing by averaging 7x7')
showHist(outc22, 'S&P Histogram (7x7 moving average filter)');
%
%non-linear median filter 7x7
outm22=medfilt2(outSP,[7,7]);
figure,imagesc(outm22),colormap gray,title('S&P non-linear filter 7x7')
showHist(outm22, 'S&P Histogram (7x7 non-linear filter)');

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


