
IN = imread('tree.png');
if size(IN,3)==3, IN = rgb2gray(IN); end

% --- Original ---
figure; imshow(IN,[]); title('Original'); colormap gray;
showHist(IN, 'Histogram original'); 

%% Gaussian noise application 

% --- Gaussian Noise ---
outG = double(IN) + 20*randn(size(IN));
outG = uint8(min(max(outG,0),255));
figure; imshow(outG,[]); title('Gaussian \sigma=20'); colormap gray;
showHist(outG, 'Histogram (Gaussian)'); 


%% Salt & pepper noise application and filtering

% --- Salt & Pepper ---
outSP = imnoise(IN,'salt & pepper',0.2);
figure; imshow(outSP,[]); title('Salt & Pepper 20%'); colormap gray;
showHist(outSP, 'Histogram (Salt & Pepper)'); 


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

























