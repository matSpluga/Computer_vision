function RedCarNCC (G, Template)

for k = 1:6
    I = G{k};

    % Score map (NCC)
    C = normxcorr2(Template, I);
    figure,imagesc(C),colormap gray
    title(sprintf('Red: NCC for image %d', k)); 

    % Maximum score in the score map
    [ypeak, xpeak] = find(C == max(C(:)));

    % Offset in the original image
    yoff = ypeak - size(Template,1);
    xoff = xpeak - size(Template,2);

    % I show the original image with the rectangle and the position of the maximum score
    figure;
    imshow(I); hold on;
    % Creating a rectangle with the same dimensions of the template
    rectangle('Position', [xoff+1, yoff+1, size(Template,2), size(Template,1)], ...
              'EdgeColor','r', 'LineWidth',2);
    % Maximum score positions put at the centre of the rectangle
    plot(xoff+1 + size(Template,2)/2, yoff+1 + size(Template,1)/2, ...
         'r+', 'MarkerSize',10, 'LineWidth',2);

    title(sprintf('Red Car: Image %d - NCC max & box', k));

    hold off;
end