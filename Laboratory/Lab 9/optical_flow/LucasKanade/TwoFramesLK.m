function [] = TwoFramesLK(pathframe1, pathframe2, windowSize)

At = imread(pathframe1);
At1 = imread(pathframe2);

[rows, cols, dep]=size(At);
if (dep==3)
    At = rgb2gray(At);
    At1 = rgb2gray(At1);
end

[U,V] = LucasKanade(At, At1, windowSize);

figure(1)
subplot(1,2,1)
imshow(At)
subplot(1,2,2)
imshow(At+1)
figure(2)
% SEE help quiver for more information
%quiver(Uf(1:10:size(Uf,1), 1:10:size(Uf,2)), Vf(1:10:size(Vf,1), 1:10:size(Vf,2)))


%Uso quiver(u, -v, 0) per visualizzare il campo vettoriale (u,v)
%
quiver(Reduce((Reduce(medfilt2(flipud(U),[5 5])))), -Reduce((Reduce(medfilt2(flipud(V),[5 5])))), 0), axis equal
